@interface LSObserver
+ (void)initialize;
- (LSObserverDelegate)delegate;
- (NSOperationQueue)queue;
- (NSString)name;
- (id)debugDescription;
- (id)description;
- (void)_configureCallbacks;
- (void)_tearDownCallbacks;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation LSObserver

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.launchservices", "observer");
    v3 = (void *)_LSObserverLog;
    _LSObserverLog = (uint64_t)v2;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSObserver;
  -[LSObserver dealloc](&v3, sel_dealloc);
}

- (LSObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_recursive_lock_unlock();
  return (LSObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:68 description:@"Attempting to set an observer's delegate while it is already observing."];
  }

  objc_storeWeak((id *)&self->_delegate, obj);
  os_unfair_recursive_lock_unlock();
}

- (NSOperationQueue)queue
{
  objc_super v3 = self->_queue;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setQueue:(id)a3
{
  v5 = (NSOperationQueue *)a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:87 description:@"Attempting to set an observer's queue while it is already observing."];
  }

  queue = self->_queue;
  self->_queue = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)startObserving
{
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:95 description:@"Already invoked -startObserving on this observer."];
  }

  -[LSObserver _configureCallbacks](self, "_configureCallbacks");
  *((_BYTE *)self + 32) |= 1u;
  os_unfair_recursive_lock_unlock();
}

- (void)stopObserving
{
  if ((*((_BYTE *)self + 32) & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:106 description:@"Invoked -stopObserving on this observer without first invoking -startObserving."];
  }

  -[LSObserver _tearDownCallbacks](self, "_tearDownCallbacks");
  *((_BYTE *)self + 32) &= ~1u;
  os_unfair_recursive_lock_unlock();
}

- (void)_configureCallbacks
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Delegate %@ does not respond to -observerDidObserveDatabaseChange:, will not notify it of anything.",  (uint8_t *)&v2,  0xCu);
}

void __33__LSObserver__configureCallbacks__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v4 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __33__LSObserver__configureCallbacks__block_invoke_2;
  v13[3] = &unk_189D77790;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_copyWeak(&v15, (id *)(a1 + 48));
  uint64_t v5 = MEMORY[0x186E2A7B8](v13);
  v6 = (void *)v5;
  if (*(void *)(a1 + 32))
  {
    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x3812000000LL;
    v11[3] = __Block_byref_object_copy__27;
    v11[4] = __Block_byref_object_dispose__27;
    v11[5] = 256LL;
    id v12 = *a2;
    v7 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = 3221225472LL;
    v8[2] = __33__LSObserver__configureCallbacks__block_invoke_17;
    v8[3] = &unk_189D777B8;
    id v9 = v6;
    v10 = v11;
    [v7 addOperationWithBlock:v8];

    _Block_object_dispose(v11, 8);
  }

  else
  {
    (*(void (**)(uint64_t, id *))(v5 + 16))(v5, a2);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __33__LSObserver__configureCallbacks__block_invoke_2(uint64_t a1, LaunchServices::DatabaseContext *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __33__LSObserver__configureCallbacks__block_invoke_3;
    v6[3] = &unk_189D74BF8;
    id v7 = v4;
    id v8 = WeakRetained;
    _LSDatabaseContextAccessContextUsingBlock(a2, (uint64_t)v6);
  }
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidObserveDatabaseChange:*(void *)(a1 + 40)];
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8LL) + 48LL);
}

- (void)_tearDownCallbacks
{
  changeObserver = self->_changeObserver;
  if (changeObserver)
  {
    _LSContextRemoveChangeObserver(changeObserver);
    id v4 = self->_changeObserver;
    self->_changeObserver = 0LL;
  }

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (id)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = [objc_alloc(NSString) initWithFormat:@"<%@ %p> \"%@\"", objc_opt_class(), self, v3];
  }

  else
  {
    uint64_t v4 = -[LSObserver description](self, "description");
  }

  uint64_t v5 = (void *)v4;

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end