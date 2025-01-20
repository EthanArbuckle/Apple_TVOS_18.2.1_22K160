@interface AnalyticsConfigurationObserver
- (AnalyticsConfigurationObserver)init;
- (AnalyticsConfigurationObserverDelegate)delegate;
- (BOOL)startObservingConfigurationType:(id)a3;
- (BOOL)stopObservingConfigurationType:(id)a3;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (void)dealloc;
- (void)setConfigurationObserverDelegate:(id)a3 queue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AnalyticsConfigurationObserver

- (AnalyticsConfigurationObserver)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AnalyticsConfigurationObserver;
  v2 = -[AnalyticsConfigurationObserver init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreAnalytics.ConfigurationObserver", MEMORY[0x1895F8AF8]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[AnalyticsConfigurationObserver setDelegate:](v2, "setDelegate:", 0LL);
    -[AnalyticsConfigurationObserver setDelegateQueue:](v2, "setDelegateQueue:", 0LL);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AnalyticsConfigurationObserver;
  -[AnalyticsConfigurationObserver dealloc](&v3, sel_dealloc);
}

- (void)setConfigurationObserverDelegate:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  -[AnalyticsConfigurationObserver queue](self, "queue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke;
  v11[3] = &unk_189D39A48;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);
}

uint64_t __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegateQueue:*(void *)(a1 + 48)];
}

- (BOOL)startObservingConfigurationType:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CASPIEnter();
  -[AnalyticsConfigurationObserver queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke;
  block[3] = &unk_189D39E18;
  block[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);

  return 1;
}

void __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v2 = (char *)[*(id *)(a1 + 40) UTF8String];
  [*(id *)(a1 + 32) delegate];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) delegateQueue];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)operator new(0x50uLL);
  *((void *)v5 + 1) = 0LL;
  *((void *)v5 + 2) = 0LL;
  *(void *)v5 = off_189D39E48;
  std::string::basic_string[abi:ne180100]<0>(__p, v2);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  *((void *)v5 + 3) = off_189D39E98;
  id v12 = (std::string *)(v5 + 32);
  if (SHIBYTE(v27) < 0)
  {
    std::string::__init_copy_ctor_external(v12, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }

  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void *)v5 + 6) = v27;
  }

  objc_initWeak((id *)v5 + 7, v9);
  objc_initWeak((id *)v5 + 8, v10);
  *((void *)v5 + 9) = v11;

  if (SHIBYTE(v27) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(std::__shared_weak_count **)(v13 + 16);
  *(void *)(v13 + 8) = v5 + 24;
  *(void *)(v13 + 16) = v5;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  v18 = CoreAnalytics::Client::get(v17);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(v19 + 8);
  v20 = *(std::__shared_weak_count **)(v19 + 16);
  uint64_t v24 = v21;
  v25 = v20;
  if (v20)
  {
    p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
    do
      unint64_t v23 = __ldxr(p_shared_weak_owners);
    while (__stxr(v23 + 1, p_shared_weak_owners));
  }

  CoreAnalytics::Client::registerConfigurationObserver((dispatch_queue_s **)v18, (uint64_t)&v24);
  if (v25) {
    std::__shared_weak_count::__release_weak(v25);
  }
}

- (BOOL)stopObservingConfigurationType:(id)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  CASPIEnter();
  -[AnalyticsConfigurationObserver queue](self, "queue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke;
  v6[3] = &unk_189D39A70;
  v6[4] = self;
  dispatch_barrier_async(v4, v6);

  return 1;
}

void __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AnalyticsConfigurationObserverDelegate)delegate
{
  return (AnalyticsConfigurationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end