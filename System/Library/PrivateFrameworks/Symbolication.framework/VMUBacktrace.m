@interface VMUBacktrace
+ (BOOL)supportsSecureCoding;
- (VMUBacktrace)initWithCoder:(id)a3;
- (VMUBacktrace)initWithSamplingContext:(sampling_context_t *)a3 thread:(unsigned int)a4 recordFramePointers:(BOOL)a5;
- (_CSTypeRef)_symbolicator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)threadState;
- (unint64_t)asyncBacktrace;
- (unint64_t)backtrace;
- (unint64_t)dispatchQueueSerialNumber;
- (unint64_t)stackFramePointers;
- (unint64_t)timestamp;
- (unsigned)asyncBacktraceLength;
- (unsigned)backtraceLength;
- (unsigned)thread;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fixupStackWithSamplingContext:(sampling_context_t *)a3 symbolicator:(_CSTypeRef)a4;
- (void)setThreadState:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation VMUBacktrace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUBacktrace)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___VMUBacktrace;
  v5 = -[VMUBacktrace init](&v60, sel_init);
  if (!v5) {
    goto LABEL_15;
  }
  v5->_callstack.context.pid = [v4 decodeInt32ForKey:@"pid"];
  v5->_callstack.context.run_state = [v4 decodeIntForKey:@"run_state"];
  v5->_callstack.context.dispatch_queue_serial_num = [v4 decodeInt64ForKey:@"dispatch_queue_serial_num"];
  v5->_callstack.context.thread = [v4 decodeIntForKey:@"thread"];
  v5->_callstack.uint64_t length = [v4 decodeInt32ForKey:@"length"];
  v5->_asyncCallstack.uint64_t length = [v4 decodeInt32ForKey:@"asyncLength"];
  size_t __size = 0LL;
  id v6 = v4;
  uint64_t v7 = [v6 decodeBytesForKey:@"frames" returnedLength:&__size];
  uint64_t length = v5->_callstack.length;
  if (__size != 8 * length)
  {
    BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v23) {
      -[VMUBacktrace initWithCoder:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_9;
  }

  v9 = (const void *)v7;
  size_t v10 = 8 * length;
  v11 = (unint64_t *)malloc(8 * length);
  v5->_callstack.frames = v11;
  memcpy(v11, v9, v10);
  size_t __size = 0LL;
  id v12 = v6;
  v13 = (const void *)[v12 decodeBytesForKey:@"framePtrs" returnedLength:&__size];
  size_t v14 = __size;
  if (__size == v10 || !__size)
  {
    if (__size)
    {
      v32 = (unint64_t *)malloc(__size);
      v5->_callstack.framePtrs = v32;
      memcpy(v32, v13, v14);
    }

    else
    {
      uint64_t v39 = [v12 decodeBytesForKey:@"framePtr" returnedLength:&__size];
      if ((__size & 0xFFFFFFFFFFFFFFF7LL) != 0)
      {
        BOOL v40 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v40) {
          -[VMUBacktrace initWithCoder:].cold.3(v40, v41, v42, v43, v44, v45, v46, v47);
        }
        goto LABEL_9;
      }

      if (__size)
      {
        v56 = (unint64_t *)v39;
        v57 = (unint64_t *)calloc(v5->_callstack.length, 8uLL);
        v5->_callstack.framePtrs = v57;
        unint64_t *v57 = *v56;
      }
    }

    if (v5->_asyncCallstack.length)
    {
      uint64_t v58 = 0LL;
      uint64_t v33 = [v12 decodeBytesForKey:@"asyncFrames" returnedLength:&v58];
      uint64_t v34 = v5->_asyncCallstack.length;
      if (v58 != 8 * v34)
      {
        BOOL v48 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v48) {
          -[VMUBacktrace initWithCoder:].cold.2(v48, v49, v50, v51, v52, v53, v54, v55);
        }
        goto LABEL_9;
      }

      v35 = (const void *)v33;
      size_t v36 = 8 * v34;
      v37 = (unint64_t *)malloc(8 * v34);
      v5->_asyncCallstack.frames = v37;
      memcpy(v37, v35, v36);
    }

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInt32:self->_callstack.context.pid forKey:@"pid"];
  [v7 encodeInt:self->_callstack.context.run_state forKey:@"run_state"];
  [v7 encodeInt64:self->_callstack.context.dispatch_queue_serial_num forKey:@"dispatch_queue_serial_num"];
  [v7 encodeInt:self->_callstack.context.thread forKey:@"thread"];
  [v7 encodeInt32:self->_callstack.length forKey:@"length"];
  [v7 encodeInt32:self->_asyncCallstack.length forKey:@"asyncLength"];
  uint64_t v4 = 8LL * self->_callstack.length;
  [v7 encodeBytes:self->_callstack.frames length:v4 forKey:@"frames"];
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs)
  {
    [v7 encodeBytes:framePtrs length:v4 forKey:@"framePtrs"];
    [v7 encodeBytes:self->_callstack.framePtrs length:8 forKey:@"framePtr"];
  }

  uint64_t length = self->_asyncCallstack.length;
  if ((_DWORD)length) {
    [v7 encodeBytes:self->_asyncCallstack.frames length:8 * length forKey:@"asyncFrames"];
  }
}

- (_CSTypeRef)_symbolicator
{
  if (_symbolicator_previousPid) {
    BOOL v2 = _symbolicator_previousPid == self->_callstack.context.pid;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    _symbolicator_previousPid = self->_callstack.context.pid;
    CSRelease();
    if (self->_callstack.context.pid)
    {
      _symbolicator_symbolicator_0 = CSSymbolicatorCreateWithPid();
      _symbolicator_symbolicator_1 = v4;
    }
  }

  unint64_t v5 = _symbolicator_symbolicator_0;
  unint64_t v6 = _symbolicator_symbolicator_1;
  result._opaque_2 = v6;
  result._opaque_1 = v5;
  return result;
}

- (VMUBacktrace)initWithSamplingContext:(sampling_context_t *)a3 thread:(unsigned int)a4 recordFramePointers:(BOOL)a5
{
  BOOL v5 = a5;
  v14[1536] = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VMUBacktrace;
  v8 = -[VMUBacktrace init](&v12, sel_init);
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (a3)
  {
    if (!sample_remote_thread_with_dispatch_queue_regular_and_swift_async())
    {
      copySamplingResultToCallstack(&v9->_callstack.context.pid, a4, v14, v13, 0, v5);
LABEL_7:
      v9 = v9;
      size_t v10 = v9;
      goto LABEL_8;
    }
  }

  else
  {

    v9 = 0LL;
  }

  size_t v10 = 0LL;
LABEL_8:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = -[VMUBacktrace init](+[VMUBacktrace allocWithZone:](&OBJC_CLASS___VMUBacktrace, "allocWithZone:", a3), "init");
  BOOL v5 = v4;
  if (v4)
  {
    v4->_flavor = self->_flavor;
    __int128 v6 = *(_OWORD *)&self->_callstack.context.pid;
    __int128 v7 = *(_OWORD *)&self->_callstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v4->_callstack.framePtrs = *(_OWORD *)&self->_callstack.framePtrs;
    *(_OWORD *)&v4->_callstack.context.dispatch_queue_serial_num = v7;
    *(_OWORD *)&v4->_callstack.context.pid = v6;
    size_t v8 = 8LL * self->_callstack.length;
    v9 = (unint64_t *)malloc(v8);
    v5->_callstack.frames = v9;
    frames = self->_callstack.frames;
    memcpy(v9, frames, v8);
    if (self->_callstack.framePtrs)
    {
      v5->_callstack.framePtrs = (unint64_t *)malloc(v8);
      memcpy(v9, frames, v8);
    }

    __int128 v11 = *(_OWORD *)&self->_asyncCallstack.context.pid;
    __int128 v12 = *(_OWORD *)&self->_asyncCallstack.context.dispatch_queue_serial_num;
    *(_OWORD *)&v5->_asyncCallstack.framePtrs = *(_OWORD *)&self->_asyncCallstack.framePtrs;
    *(_OWORD *)&v5->_asyncCallstack.context.dispatch_queue_serial_num = v12;
    *(_OWORD *)&v5->_asyncCallstack.context.pid = v11;
    uint64_t length = self->_asyncCallstack.length;
    if ((_DWORD)length)
    {
      size_t v14 = 8 * length;
      BOOL v15 = (unint64_t *)malloc(8 * length);
      v5->_asyncCallstack.frames = v15;
      memcpy(v15, self->_asyncCallstack.frames, v14);
    }
  }

  return v5;
}

- (void)dealloc
{
  frames = self->_callstack.frames;
  if (frames) {
    free(frames);
  }
  framePtrs = self->_callstack.framePtrs;
  if (framePtrs) {
    free(framePtrs);
  }
  BOOL v5 = self->_asyncCallstack.frames;
  if (v5) {
    free(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMUBacktrace;
  -[VMUBacktrace dealloc](&v6, sel_dealloc);
}

- (id)description
{
  int flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64)
    {
      if (flavor == 65)
      {
        uint64_t v4 = @"ARM LR";
        goto LABEL_11;
      }

      goto LABEL_8;
    }

    uint64_t v4 = @"ARM Simple";
  }

  else
  {
    if (flavor != 32)
    {
      if (flavor == 33)
      {
        uint64_t v4 = @"I386 ESP";
        goto LABEL_11;
      }

- (void)fixupStackWithSamplingContext:(sampling_context_t *)a3 symbolicator:(_CSTypeRef)a4
{
  int flavor = self->_flavor;
  if (flavor > 63)
  {
    if (flavor != 64 && flavor != 65) {
      goto LABEL_4;
    }
  }

  else if (flavor != 32 && flavor != 33)
  {
LABEL_4:
    NSLog( @"unsupported flavor %d, skipping fixup",  a2,  a3,  a4._opaque_1,  a4._opaque_2,  &self->_flavor,  self->_flavor);
    return;
  }

  CSSymbolicatorFixupFrames();
  if (self->_asyncCallstack.length) {
    CSSymbolicatorFixupFrames();
  }
}

- (unint64_t)backtrace
{
  return self->_callstack.frames;
}

- (unint64_t)stackFramePointers
{
  return self->_callstack.framePtrs;
}

- (unsigned)backtraceLength
{
  return self->_callstack.length;
}

- (unsigned)thread
{
  return self->_callstack.context.thread;
}

- (void)setThreadState:(int)a3
{
  self->_callstack.context.run_state = a3;
}

- (int)threadState
{
  return self->_callstack.context.run_state;
}

- (unint64_t)dispatchQueueSerialNumber
{
  return self->_callstack.context.dispatch_queue_serial_num;
}

- (unint64_t)asyncBacktrace
{
  return self->_asyncCallstack.frames;
}

- (unsigned)asyncBacktraceLength
{
  return self->_asyncCallstack.length;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end