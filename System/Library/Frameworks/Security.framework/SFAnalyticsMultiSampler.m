@interface SFAnalyticsMultiSampler
- (BOOL)oncePerReport;
- (NSString)name;
- (SFAnalyticsMultiSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6;
- (double)samplingInterval;
- (id)sampleNow;
- (void)dealloc;
- (void)newTimer;
- (void)pauseSampling;
- (void)setSamplingInterval:(double)a3;
- (void)setupOnceTimer;
- (void)setupPeriodicTimer;
@end

@implementation SFAnalyticsMultiSampler

- (SFAnalyticsMultiSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SFAnalyticsMultiSampler;
  v13 = -[SFAnalyticsMultiSampler init](&v20, sel_init);
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
      -[SFAnalyticsMultiSampler newTimer](v13, "newTimer");
LABEL_16:
      v16 = v13;
      goto LABEL_17;
    }
  }

- (void)newTimer
{
  if (self->_activeTimer) {
    -[SFAnalyticsMultiSampler pauseSampling](self, "pauseSampling");
  }
  double samplingInterval = self->_samplingInterval;
  self->_oncePerReport = samplingInterval == -1.0;
  if (samplingInterval == -1.0) {
    -[SFAnalyticsMultiSampler setupOnceTimer](self, "setupOnceTimer");
  }
  else {
    -[SFAnalyticsMultiSampler setupPeriodicTimer](self, "setupPeriodicTimer");
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
  v4[2] = __41__SFAnalyticsMultiSampler_setupOnceTimer__block_invoke;
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
  v9[2] = __45__SFAnalyticsMultiSampler_setupPeriodicTimer__block_invoke;
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
    -[SFAnalyticsMultiSampler newTimer](self, "newTimer");
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
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __36__SFAnalyticsMultiSampler_sampleNow__block_invoke;
  v5[3] = &unk_1896656B8;
  v5[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
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
  v3.super_class = (Class)&OBJC_CLASS___SFAnalyticsMultiSampler;
  -[SFAnalyticsMultiSampler dealloc](&v3, sel_dealloc);
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

void __36__SFAnalyticsMultiSampler_sampleNow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v6 = a3;
  id v7 = a2;
  [v5 logger];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 logMetric:v6 withName:v7 oncePerReport:*(unsigned __int8 *)(*(void *)(a1 + 32) + 56)];
}

void __45__SFAnalyticsMultiSampler_setupPeriodicTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    (*(void (**)(void))(*((void *)WeakRetained + 4) + 16LL))();
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __45__SFAnalyticsMultiSampler_setupPeriodicTimer__block_invoke_5;
    v4[3] = &unk_1896656B8;
    void v4[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }

  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1804F4000,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "sampler went away before we could run its once-per-report block",  buf,  2u);
    }
  }
}

void __45__SFAnalyticsMultiSampler_setupPeriodicTimer__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v6 = a3;
  id v7 = a2;
  [v5 logger];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 logMetric:v6 withName:v7 oncePerReport:*(unsigned __int8 *)(*(void *)(a1 + 32) + 56)];
}

void __41__SFAnalyticsMultiSampler_setupOnceTimer__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    (*(void (**)(void))(*((void *)WeakRetained + 4) + 16LL))();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __41__SFAnalyticsMultiSampler_setupOnceTimer__block_invoke_2;
    v7[3] = &unk_1896656B8;
    v7[4] = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }

  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "sampler went away before we could run its once-per-report block",  buf,  2u);
    }

    notify_cancel(a2);
  }
}

void __41__SFAnalyticsMultiSampler_setupOnceTimer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v6 = a3;
  id v7 = a2;
  [v5 logger];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 logMetric:v6 withName:v7 oncePerReport:*(unsigned __int8 *)(*(void *)(a1 + 32) + 56)];
}

@end