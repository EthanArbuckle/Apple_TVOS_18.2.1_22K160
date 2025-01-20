@interface SFAnalyticsSampler
- (BOOL)oncePerReport;
- (NSString)name;
- (SFAnalyticsSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6;
- (double)samplingInterval;
- (id)sampleNow;
- (void)dealloc;
- (void)newTimer;
- (void)pauseSampling;
- (void)setSamplingInterval:(double)a3;
- (void)setupOnceTimer;
- (void)setupPeriodicTimer;
@end

@implementation SFAnalyticsSampler

- (SFAnalyticsSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SFAnalyticsSampler;
  v13 = -[SFAnalyticsSampler init](&v20, sel_init);
  if (!v13) {
    goto LABEL_16;
  }
  if ((-[objc_class isSubclassOfClass:](a6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    secLogObjForScope("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      Class v22 = a6;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "SFAnalyticsSampler created without valid client class (%@)",  buf,  0xCu);
    }

    goto LABEL_13;
  }

  if (v11)
  {
    if (a4 < 1.0)
    {
      if (!v12 || a4 != -1.0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }

    if (v12)
    {
LABEL_15:
      v13->_clientClass = a6;
      v17 = _Block_copy(v12);
      id block = v13->_block;
      v13->_id block = v17;

      objc_storeStrong((id *)&v13->_name, a3);
      v13->_samplingInterval = a4;
      -[SFAnalyticsSampler newTimer](v13, "newTimer");
LABEL_16:
      v16 = v13;
      goto LABEL_17;
    }
  }

- (void)newTimer
{
  if (self->_activeTimer) {
    -[SFAnalyticsSampler pauseSampling](self, "pauseSampling");
  }
  double samplingInterval = self->_samplingInterval;
  self->_oncePerReport = samplingInterval == -1.0;
  if (samplingInterval == -1.0) {
    -[SFAnalyticsSampler setupOnceTimer](self, "setupOnceTimer");
  }
  else {
    -[SFAnalyticsSampler setupPeriodicTimer](self, "setupPeriodicTimer");
  }
}

- (void)setupOnceTimer
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __36__SFAnalyticsSampler_setupOnceTimer__block_invoke;
  v4[3] = &unk_189667648;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.security.sfanalytics.samplers", &self->_notificationToken, v3, v4);

  self->_activeTimer = 1;
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupPeriodicTimer
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v3);
  timer = self->_timer;
  self->_timer = v4;

  v6 = self->_timer;
  dispatch_time_t v7 = dispatch_walltime(0LL, (uint64_t)(self->_samplingInterval * 1000000000.0));
  dispatch_source_set_timer( (dispatch_source_t)v6,  v7,  (unint64_t)(self->_samplingInterval * 1000000000.0),  (unint64_t)(self->_samplingInterval * 1000000000.0 / 50.0));
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = self->_timer;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke;
  v9[3] = &unk_189672C00;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v8, v9);
  dispatch_resume((dispatch_object_t)self->_timer);
  self->_activeTimer = 1;
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setSamplingInterval:(double)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a3 >= 1.0 || a3 == -1.0)
  {
    self->_double samplingInterval = a3;
    -[SFAnalyticsSampler newTimer](self, "newTimer");
  }

  else
  {
    secLogObjForScope("SecError");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      double v8 = a3;
      _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "SFAnalyticsSampler: interval %f is not supported",  (uint8_t *)&v7,  0xCu);
    }
  }

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (id)sampleNow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[objc_class logger](self->_clientClass, "logger");
  [v4 logMetric:v3 withName:self->_name oncePerReport:self->_oncePerReport];

  return v3;
}

- (void)pauseSampling
{
  if (self->_activeTimer)
  {
    if (self->_oncePerReport)
    {
      notify_cancel(self->_notificationToken);
      self->_notificationToken = 0;
    }

    else
    {
      dispatch_source_cancel((dispatch_source_t)self->_timer);
    }

    self->_activeTimer = 0;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SFAnalyticsSampler;
  -[SFAnalyticsSampler dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)oncePerReport
{
  return self->_oncePerReport;
}

- (void).cxx_destruct
{
}

void __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] logger];
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v2[4] + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 logMetric:v4 withName:v2[3] oncePerReport:*((unsigned __int8 *)v2 + 56)];
  }

  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl( &dword_1804F4000,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "sampler went away before we could run its once-per-report block",  (uint8_t *)v5,  2u);
    }
  }
}

void __36__SFAnalyticsSampler_setupOnceTimer__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] logger];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v4[4] + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 logMetric:v6 withName:v4[3] oncePerReport:*((unsigned __int8 *)v4 + 56)];
  }

  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "sampler went away before we could run its once-per-report block",  (uint8_t *)v8,  2u);
    }

    notify_cancel(a2);
  }
}

@end