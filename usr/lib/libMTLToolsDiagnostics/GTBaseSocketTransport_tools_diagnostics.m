@interface GTBaseSocketTransport_tools_diagnostics
- (BOOL)connected;
- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4;
- (GTBaseSocketTransport_tools_diagnostics)init;
- (GTSharedMemoryTransport_tools_diagnostics)smTransport;
- (id)createNewSharedMemoryTransport;
- (id)createNewSharedMemoryTransportWithURL:(id)a3;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (unsigned)_nextMessageSerial;
- (void)_destroySharedMemoryTransport;
- (void)_invalidate;
- (void)_readAndAccumulateLoop;
- (void)_waitEAGAIN;
- (void)closeSocketDescriptor;
- (void)destroySharedMemoryTransport;
- (void)runWithSocket:(int)a3;
- (void)scheduleReadOnWritableSocket;
- (void)setPrioritizeOutgoingMessages:(BOOL)a3;
@end

@implementation GTBaseSocketTransport_tools_diagnostics

- (GTBaseSocketTransport_tools_diagnostics)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTBaseSocketTransport_tools_diagnostics;
  return -[GTBaseStreamTransport_tools_diagnostics init](&v3, "init");
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  return recv(handle, a3, a4, 0);
}

- (void)_waitEAGAIN
{
  v2.fd = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  *(_DWORD *)&v2.events = 4;
  poll(&v2, 1u, 1);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  return send(handle, a3, a4, 0);
}

- (void)closeSocketDescriptor
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  close(handle);
}

- (void)_readAndAccumulateLoop
{
  self->_scheduledReadOnWritableSocket = 0;
  objc_super v3 = objc_autoreleasePoolPush();
  while (-[GTBaseStreamTransport_tools_diagnostics _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
  objc_autoreleasePoolPop(v3);
}

- (void)runWithSocket:(int)a3
{
  if (self->_readSource)
  {
    v13 = "_readSource == nullptr";
    goto LABEL_15;
  }

  if (self->_writeSource)
  {
    v13 = "_writeSource == nullptr";
    goto LABEL_15;
  }

  if (LOBYTE(self->super.super._interposerVersion))
  {
    v13 = "_invalid == NO";
    goto LABEL_15;
  }

  int v5 = fcntl(a3, 3);
  fcntl(a3, 4, v5 | 4u);
  self->_readSource = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  a3,  0LL,  (dispatch_queue_t)self->super.super._queue);
  v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_write,  a3,  0LL,  (dispatch_queue_t)self->super.super._queue);
  self->_writeSource = v6;
  readSource = self->_readSource;
  if (!readSource)
  {
    v13 = "_readSource";
    goto LABEL_15;
  }

  if (!v6)
  {
    v13 = "_writeSource";
LABEL_15:
    __assert_rtn("-[GTBaseSocketTransport runWithSocket:]", "", 0, v13);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke;
  handler[3] = &unk_20988;
  handler[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)readSource, handler);
  writeSource = self->_writeSource;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_2;
  v16[3] = &unk_20988;
  v16[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)writeSource, v16);
  v9 = self->_readSource;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_3;
  v15[3] = &unk_20988;
  v15[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, v15);
  v10 = self->_writeSource;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_4;
  v14[3] = &unk_20988;
  v14[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v10, v14);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_scheduledReadOnWritableSocket = 0;
  self->_writeSourceIsSuspended = 1;
  smTransport = self->_smTransport;
  if (smTransport)
  {
    id v12 = -[GTSharedMemoryTransport_tools_diagnostics connect](smTransport, "connect");
    if (([v12 BOOLResult] & 1) == 0) {
      -[GTBaseStreamTransport_tools_diagnostics _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  [v12 error]);
    }
  }

- (void)scheduleReadOnWritableSocket
{
  if (!LOBYTE(self->super.super._interposerVersion) && !self->_scheduledReadOnWritableSocket)
  {
    self->_scheduledReadOnWritableSocket = 1;
    if (self->_writeSourceIsSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSourceIsSuspended = 0;
    }
  }

- (BOOL)connected
{
  readSource = self->_readSource;
  if (readSource) {
    LOBYTE(readSource) = dispatch_source_testcancel((dispatch_source_t)readSource) == 0;
  }
  return (char)readSource;
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke;
  block[3] = &unk_20AA0;
  block[4] = self;
  BOOL v8 = a3;
  dispatch_sync((dispatch_queue_t)queue, block);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTBaseSocketTransport_tools_diagnostics;
  -[GTTransport_tools_diagnostics setPrioritizeOutgoingMessages:](&v6, "setPrioritizeOutgoingMessages:", v3);
}

- (void)_invalidate
{
  writeSource = self->_writeSource;
  if (writeSource)
  {
    if (!self->_readSource) {
      __assert_rtn("-[GTBaseSocketTransport _invalidate]", ", 0, "_readSource"");
    }
    dispatch_source_cancel((dispatch_source_t)writeSource);
    if (self->_writeSourceIsSuspended) {
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }

  -[GTBaseSocketTransport_tools_diagnostics _destroySharedMemoryTransport](self, "_destroySharedMemoryTransport");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTBaseSocketTransport_tools_diagnostics;
  -[GTBaseStreamTransport_tools_diagnostics _invalidate](&v4, "_invalidate");
}

- (id)createNewSharedMemoryTransport
{
  return -[GTBaseSocketTransport_tools_diagnostics createNewSharedMemoryTransportWithURL:]( self,  "createNewSharedMemoryTransportWithURL:",  0LL);
}

- (id)createNewSharedMemoryTransportWithURL:(id)a3
{
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = __Block_byref_object_copy__76;
  v11 = __Block_byref_object_dispose__77;
  uint64_t v12 = 0LL;
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke;
  block[3] = &unk_20A00;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_destroySharedMemoryTransport
{
  self->_smTransport = 0LL;
}

- (void)destroySharedMemoryTransport
{
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke;
  block[3] = &unk_20988;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4
{
  return -[GTTransport_tools_diagnostics relayMessage:error:](self->_smTransport, "relayMessage:error:", a3, a4);
}

- (unsigned)_nextMessageSerial
{
  smTransport = self->_smTransport;
  if (smTransport)
  {
    unsigned int result = -[GTSharedMemoryTransport_tools_diagnostics _nextMessageSerial](smTransport, "_nextMessageSerial");
    p_messageCounter = &self->super.super._messageCounter;
    do
      unsigned int v6 = __ldaxr(&p_messageCounter->__a_.__a_value);
    while (__stlxr(result, &p_messageCounter->__a_.__a_value));
    if (v6 > result)
    {
      do
      {
        do
          unsigned int v7 = __ldaxr(&p_messageCounter->__a_.__a_value);
        while (__stlxr(v6, &p_messageCounter->__a_.__a_value));
        BOOL v8 = v7 > v6;
        unsigned int v6 = v7;
      }

      while (v8);
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GTBaseSocketTransport_tools_diagnostics;
    return -[GTTransport_tools_diagnostics _nextMessageSerial](&v9, "_nextMessageSerial");
  }

  return result;
}

- (GTSharedMemoryTransport_tools_diagnostics)smTransport
{
  return self->_smTransport;
}

@end