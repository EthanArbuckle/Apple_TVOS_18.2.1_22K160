@interface SFAnalyticsActivityTracker
- (NSNumber)measurement;
- (SFAnalyticsActivityTracker)initWithName:(id)a3 clientClass:(Class)a4;
- (void)cancel;
- (void)dealloc;
- (void)performAction:(id)a3;
- (void)setMeasurement:(id)a3;
- (void)start;
- (void)stop;
- (void)stopWithEvent:(id)a3 result:(id)a4;
@end

@implementation SFAnalyticsActivityTracker

- (SFAnalyticsActivityTracker)initWithName:(id)a3 clientClass:(Class)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___SFAnalyticsActivityTracker;
    v8 = -[SFAnalyticsActivityTracker init](&v16, sel_init);
    if (v8)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v10 = dispatch_queue_create("SFAnalyticsActivityTracker queue", v9);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;

      objc_storeStrong((id *)&v8->_name, a3);
      v8->_clientClass = a4;
      measurement = v8->_measurement;
      v8->_measurement = 0LL;

      v8->_canceled = 0;
      v8->_start = 0LL;
    }

    self = v8;
    v13 = self;
  }

  else
  {
    secLogObjForScope("SecError");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot instantiate SFActivityTracker without name and client class",  buf,  2u);
    }

    v13 = 0LL;
  }

  return v13;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  -[SFAnalyticsActivityTracker start](self, "start");
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__SFAnalyticsActivityTracker_performAction___block_invoke;
  block[3] = &unk_1896650C0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  -[SFAnalyticsActivityTracker stop](self, "stop");
}

- (void)start
{
  if (!self->_canceled)
  {
    if (self->_start)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 handleFailureInMethod:a2 object:self file:@"SFAnalyticsActivityTracker.m" lineNumber:77 description:@"SFAnalyticsActivityTracker user called start twice"];
    }

    self->_start = mach_absolute_time();
  }

- (void)stop
{
  uint64_t v4 = mach_absolute_time();
  if (!self->_canceled)
  {
    uint64_t v5 = v4;
    if (!self->_start)
    {
      [MEMORY[0x1896077D8] currentHandler];
      dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInMethod:a2 object:self file:@"SFAnalyticsActivityTracker.m" lineNumber:89 description:@"SFAnalyticsActivityTracker user called stop w/o calling start"];
    }

    if (!dword_18C53341C) {
      mach_timebase_info((mach_timebase_info_t)&stop_sTimebaseInfo);
    }
    id v6 = (void *)MEMORY[0x189607968];
    -[NSNumber doubleValue](self->_measurement, "doubleValue");
    objc_msgSend( v6,  "numberWithDouble:",  v7 + (float)((float)((float)stop_sTimebaseInfo / (float)dword_18C53341C)
            * (float)(v5 - self->_start)));
    id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    measurement = self->_measurement;
    self->_measurement = v8;
  }

  self->_start = 0LL;
}

- (void)stopWithEvent:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SFAnalyticsActivityTracker stop](self, "stop");
  -[objc_class logger](self->_clientClass, "logger");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 logResultForEvent:v7 hardFailure:0 result:v6];
}

- (void)cancel
{
  self->_canceled = 1;
}

- (void)dealloc
{
  if (self->_start) {
    -[SFAnalyticsActivityTracker stop](self, "stop");
  }
  if (!self->_canceled && self->_measurement)
  {
    v3 = -[objc_class logger](self->_clientClass, "logger");
    [v3 logMetric:self->_measurement withName:self->_name];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFAnalyticsActivityTracker;
  -[SFAnalyticsActivityTracker dealloc](&v4, sel_dealloc);
}

- (NSNumber)measurement
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMeasurement:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __44__SFAnalyticsActivityTracker_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end