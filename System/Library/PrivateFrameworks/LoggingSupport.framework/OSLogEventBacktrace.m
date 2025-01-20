@interface OSLogEventBacktrace
- (NSArray)frames;
- (OSLogEventBacktrace)initWithBacktrace:(os_log_backtrace_s *)a3;
- (OSLogEventBacktrace)initWithFrames:(id)a3;
- (OSLogEventBacktrace)initWithSingleFrame:(id)a3;
- (void)dealloc;
@end

@implementation OSLogEventBacktrace

- (OSLogEventBacktrace)initWithBacktrace:(os_log_backtrace_s *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSLogEventBacktrace;
  v3 = -[OSLogEventBacktrace init](&v8, sel_init);
  if (v3)
  {
    LODWORD(v4) = os_log_backtrace_get_length();
    uint64_t frames = os_log_backtrace_get_frames();
    v6 = (NSArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:(int)v4];
    if ((int)v4 >= 1)
    {
      uint64_t v4 = v4;
      do
      {
        -[NSArray addObject:]( v6,  "addObject:",   -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]( objc_alloc(&OBJC_CLASS___OSLogEventBacktraceFrame),  "initWithUUIDBytes:andOffset:",  frames,  *(unsigned int *)(frames + 16)));
        frames += 20LL;
        --v4;
      }

      while (v4);
    }

    v3->_uint64_t frames = v6;
  }

  return v3;
}

- (OSLogEventBacktrace)initWithSingleFrame:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSLogEventBacktrace;
  uint64_t v4 = -[OSLogEventBacktrace init](&v6, sel_init);
  if (v4) {
    v4->_uint64_t frames = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", a3, 0);
  }
  return v4;
}

- (OSLogEventBacktrace)initWithFrames:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSLogEventBacktrace;
  uint64_t v4 = -[OSLogEventBacktrace init](&v6, sel_init);
  if (v4) {
    v4->_uint64_t frames = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogEventBacktrace;
  -[OSLogEventBacktrace dealloc](&v3, sel_dealloc);
}

- (NSArray)frames
{
  return self->_frames;
}

@end