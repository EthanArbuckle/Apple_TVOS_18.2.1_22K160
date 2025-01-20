@interface TKPowerMonitor
+ (id)defaultMonitor;
- (BOOL)awaken;
- (TKPowerMonitor)init;
- (unsigned)kernelPort;
- (void)init;
- (void)setAwaken:(BOOL)a3;
- (void)setKernelPort:(unsigned int)a3;
@end

@implementation TKPowerMonitor

- (TKPowerMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKPowerMonitor;
  v2 = -[TKPowerMonitor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_awaken = 1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ctk.pmon", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    TK_LOG_token_0();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKPowerMonitor init].cold.1();
    }
  }

  return v3;
}

+ (id)defaultMonitor
{
  if (defaultMonitor_onceToken != -1) {
    dispatch_once(&defaultMonitor_onceToken, &__block_literal_global_5);
  }
  return (id)defaultMonitor_monitor;
}

void __32__TKPowerMonitor_defaultMonitor__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___TKPowerMonitor);
  v1 = (void *)defaultMonitor_monitor;
  defaultMonitor_monitor = (uint64_t)v0;
}

- (unsigned)kernelPort
{
  return self->_kernelPort;
}

- (void)setKernelPort:(unsigned int)a3
{
  self->_kernelPort = a3;
}

- (BOOL)awaken
{
  return self->_awaken;
}

- (void)setAwaken:(BOOL)a3
{
  self->_awaken = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

@end