@interface AnalyticsEventObserver
- (AnalyticsEventObserver)init;
- (AnalyticsEventObserverDelegate)delegate;
- (BOOL)startObservingEventList:(id)a3;
- (BOOL)startObservingEventList:(id)a3 withErrorHandler:(id)a4;
- (BOOL)stopObserving;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (uint64_t)startObservingEventList:withErrorHandler:;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setEventObserverDelegate:(id)a3 queue:(id)a4;
- (void)setQueue:(id)a3;
- (void)startObservingEventList:withErrorHandler:;
@end

@implementation AnalyticsEventObserver

- (AnalyticsEventObserver)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AnalyticsEventObserver;
  v2 = -[AnalyticsEventObserver init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreAnalytics.EventObserver", MEMORY[0x1895F8AF8]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[AnalyticsEventObserver setDelegate:](v2, "setDelegate:", 0LL);
    -[AnalyticsEventObserver setDelegateQueue:](v2, "setDelegateQueue:", 0LL);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AnalyticsEventObserver;
  -[AnalyticsEventObserver dealloc](&v3, sel_dealloc);
}

- (void)setEventObserverDelegate:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  -[AnalyticsEventObserver queue](self, "queue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke;
  v11[3] = &unk_189D39A48;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);
}

uint64_t __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegateQueue:*(void *)(a1 + 48)];
}

- (BOOL)startObservingEventList:(id)a3
{
  return -[AnalyticsEventObserver startObservingEventList:withErrorHandler:]( self,  "startObservingEventList:withErrorHandler:",  a3,  0LL);
}

- (BOOL)startObservingEventList:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  id v38 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v38);
  id v37 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::array::create(&v37);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v43 + 1) + 8 * i);
        applesauce::xpc::object::object((applesauce::xpc::object *)&v39, (const char *)[v12 UTF8String]);
        id v13 = v39;
        id v14 = v37;
        xpc_array_append_value(v14, v13);

        v15 = v39;
        v39 = 0LL;
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v42 count:16];
    }

    while (v9);
  }

  applesauce::xpc::object::object((applesauce::xpc::object *)&v35, &v37);
  v39 = &v38;
  v40 = "events";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v39, &v35, &v36);
  id v16 = v36;
  id v36 = 0LL;

  id v17 = v35;
  id v35 = 0LL;

  v19 = CoreAnalytics::Client::get(v18);
  if (v7)
  {
    v20 = (const char *)_Block_copy(v7);
    v39 = (id *)off_189D39AA0;
    v40 = v20;
    v41 = (id *)&v39;
    CoreAnalytics::Client::registerErrorHandler((dispatch_queue_s **)v19, (uint64_t)&v39);
    v21 = (id **)v41;
    if (v41 == (id *)&v39)
    {
      uint64_t v22 = 4LL;
      v21 = &v39;
    }

    else
    {
      if (!v41) {
        goto LABEL_14;
      }
      uint64_t v22 = 5LL;
    }

    ((void (*)(void))(*v21)[v22])();
  }

void __67__AnalyticsEventObserver_startObservingEventList_withErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) delegate];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*v2 delegateQueue];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)operator new(0x38uLL);
  *((void *)v5 + 1) = 0LL;
  *((void *)v5 + 2) = 0LL;
  *(void *)v5 = off_189D39B30;
  id v6 = *(void **)(a1 + 32);
  id v7 = v4;
  *((void *)v5 + 3) = off_189D39B80;
  id v8 = v3;
  objc_initWeak((id *)v5 + 4, v6);
  objc_initWeak((id *)v5 + 5, v8);

  *((void *)v5 + 6) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(std::__shared_weak_count **)(v9 + 16);
  *(void *)(v9 + 8) = v5 + 24;
  *(void *)(v9 + 16) = v5;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  id v14 = CoreAnalytics::Client::get(v13);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v15 + 8);
  id v16 = *(std::__shared_weak_count **)(v15 + 16);
  uint64_t v20 = v17;
  v21 = v16;
  if (v16)
  {
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      unint64_t v19 = __ldxr(p_shared_weak_owners);
    while (__stxr(v19 + 1, p_shared_weak_owners));
  }

  CoreAnalytics::Client::registerEventObserver((dispatch_queue_s **)v14, (uint64_t)&v20);
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
}

- (BOOL)stopObserving
{
  v5[5] = *MEMORY[0x1895F89C0];
  CASPIEnter();
  -[AnalyticsEventObserver queue](self, "queue");
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __39__AnalyticsEventObserver_stopObserving__block_invoke;
  v5[3] = &unk_189D39A70;
  v5[4] = self;
  dispatch_barrier_async(v3, v5);

  return 1;
}

void __39__AnalyticsEventObserver_stopObserving__block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AnalyticsEventObserverDelegate)delegate
{
  return (AnalyticsEventObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (uint64_t)startObservingEventList:withErrorHandler:
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

- (void)startObservingEventList:withErrorHandler:
{
}

@end