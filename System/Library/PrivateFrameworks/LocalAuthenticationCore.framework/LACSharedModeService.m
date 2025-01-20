@interface LACSharedModeService
- (LACSharedModeService)initWithReplyQueue:(id)a3;
- (id)_dataSource;
- (id)_policyCoordinator;
- (id)_policyTraitsManager;
- (id)processor;
@end

@implementation LACSharedModeService

- (LACSharedModeService)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACSharedModeService;
  v6 = -[LACSharedModeService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___LACSharedModeDataSourceTaskDecoratorRuntime);
    runtime = v7->_runtime;
    v7->_runtime = v8;
  }

  return v7;
}

- (id)processor
{
  v3 = objc_alloc(&OBJC_CLASS___LACSharedModeProcessor);
  replyQueue = self->_replyQueue;
  -[LACSharedModeService _dataSource](self, "_dataSource");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACSharedModeService _policyTraitsManager](self, "_policyTraitsManager");
  v7 = -[LACSharedModeService _policyCoordinator](self, "_policyCoordinator");
  v8 = -[LACSharedModeProcessor initWithReplyQueue:dataSource:policyTraitsManager:policyCoordinator:]( v3,  "initWithReplyQueue:dataSource:policyTraitsManager:policyCoordinator:",  replyQueue,  v5,  v6,  v7);

  return v8;
}

- (id)_dataSource
{
  v3 = objc_alloc(&OBJC_CLASS___LACSharedModeDataSourceTaskDecorator);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__LACSharedModeService__dataSource__block_invoke;
  v7[3] = &unk_18A369470;
  v7[4] = self;
  __35__LACSharedModeService__dataSource__block_invoke((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[LACSharedModeDataSourceTaskDecorator initWithDataSource:runtime:replyQueue:]( v3,  "initWithDataSource:runtime:replyQueue:",  v4,  self->_runtime,  self->_replyQueue);

  return v5;
}

LACSharedModeDataSourceDefaultsDecorator *__35__LACSharedModeService__dataSource__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACSharedModeDataSourceNullAdapter);
  if (+[LACGlobalDomain osVariantAllowsDomainOverrides]( &OBJC_CLASS___LACGlobalDomain,  "osVariantAllowsDomainOverrides"))
  {
    v3 = -[LACSharedModeDataSourceDefaultsDecorator initWithDataSource:replyQueue:]( objc_alloc(&OBJC_CLASS___LACSharedModeDataSourceDefaultsDecorator),  "initWithDataSource:replyQueue:",  v2,  *(void *)(*(void *)(a1 + 32) + 8LL));
  }

  else
  {
    v3 = v2;
  }

  v4 = v3;

  return v4;
}

- (id)_policyTraitsManager
{
  return objc_alloc_init(&OBJC_CLASS___LACSharedModePolicyTraitsManager);
}

- (id)_policyCoordinator
{
  v3 = objc_alloc_init(&OBJC_CLASS___LACSharedModePolicyCoordinatorACMStorageRequestFactory);
  v4 = objc_alloc_init(&OBJC_CLASS___LACSharedModePolicyCoordinatorACMStorage);
  id v5 = -[LACSharedModePolicyCoordinatorACMAdapter initWithReplyQueue:storageRequestFactory:storage:]( objc_alloc(&OBJC_CLASS___LACSharedModePolicyCoordinatorACMAdapter),  "initWithReplyQueue:storageRequestFactory:storage:",  self->_replyQueue,  v3,  v4);

  return v5;
}

- (void).cxx_destruct
{
}

@end