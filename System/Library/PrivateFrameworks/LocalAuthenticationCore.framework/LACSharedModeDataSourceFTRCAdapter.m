@interface LACSharedModeDataSourceFTRCAdapter
+ (id)_workQueue;
- (LACSharedModeDataSourceFTRCAdapter)initWithReplyQueue:(id)a3;
- (void)dealloc;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceFTRCAdapter

- (LACSharedModeDataSourceFTRCAdapter)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACSharedModeDataSourceFTRCAdapter;
  v6 = -[LACSharedModeDataSourceFTRCAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_189219000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  v6 = +[LACSharedMode defaultSharedMode](&OBJC_CLASS___LACSharedMode, "defaultSharedMode");
  LACLogSharedMode();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[LACSharedModeDataSourceFTRCAdapter fetchSharedModeWithOptions:completion:].cold.1((uint64_t)self, (uint64_t)v6, v7);
  }

  v5[2](v5, v6);
}

+ (id)_workQueue
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_workQueue_onceToken != -1) {
    dispatch_once(&_workQueue_onceToken, block);
  }
  return (id)_workQueue__queue;
}

void __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createUserInitiatedSerialQueueWithIdentifier:",  v3);
  int v2 = (void *)_workQueue__queue;
  _workQueue__queue = v1;
}

- (void).cxx_destruct
{
}

- (void)fetchSharedModeWithOptions:(os_log_t)log completion:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ Unable to determine shared mode status due to missing dependencies %{public}@",  (uint8_t *)&v3,  0x16u);
}

@end