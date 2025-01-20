@interface LACSharedModeDataSourceDefaultsDecorator
- (BOOL)_shouldUseMockedResponse;
- (LACSharedModeDataSourceDefaultsDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceDefaultsDecorator

- (LACSharedModeDataSourceDefaultsDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACSharedModeDataSourceDefaultsDecorator;
  v9 = -[LACSharedModeDataSourceDefaultsDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (-[LACSharedModeDataSourceDefaultsDecorator _shouldUseMockedResponse](self, "_shouldUseMockedResponse"))
  {
    LACLogSharedMode();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
    }
    v9 = +[LACGlobalDomain isSharedModeActive](&OBJC_CLASS___LACGlobalDomain, "isSharedModeActive");
    uint64_t v10 = [v9 BOOLValue];

    v11 = -[LACSharedMode initWithActive:confirmed:]( objc_alloc(&OBJC_CLASS___LACSharedMode),  "initWithActive:confirmed:",  v10,  0LL);
    +[LACGlobalDomain sharedModeLatency](&OBJC_CLASS___LACGlobalDomain, "sharedModeLatency");
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 doubleValue];
    double v14 = v13;

    dispatch_time_t v15 = dispatch_time(0LL, (uint64_t)(v14 * 1000000000.0));
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke;
    block[3] = &unk_18A368628;
    block[4] = self;
    v19 = v11;
    id v20 = v7;
    v17 = v11;
    dispatch_after(v15, replyQueue, block);
  }

  else
  {
    -[LACSharedModeDataSource fetchSharedModeWithOptions:completion:]( self->_dataSource,  "fetchSharedModeWithOptions:completion:",  v6,  v7);
  }
}

uint64_t __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke( void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  LACLogSharedMode();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( &dword_189219000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ did finish query %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

- (BOOL)_shouldUseMockedResponse
{
  if (!+[LACGlobalDomain osVariantAllowsDomainOverrides]( &OBJC_CLASS___LACGlobalDomain,  "osVariantAllowsDomainOverrides")) {
    return 0;
  }
  v2 = +[LACGlobalDomain isSharedModeActive](&OBJC_CLASS___LACGlobalDomain, "isSharedModeActive");
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void).cxx_destruct
{
}

@end