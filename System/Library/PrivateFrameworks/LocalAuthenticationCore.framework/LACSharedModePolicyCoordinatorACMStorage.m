@interface LACSharedModePolicyCoordinatorACMStorage
- (LACSharedModePolicyCoordinatorACMStorage)init;
- (void)performRequest:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModePolicyCoordinatorACMStorage

- (LACSharedModePolicyCoordinatorACMStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACSharedModePolicyCoordinatorACMStorage;
  v2 = -[LACSharedModePolicyCoordinatorACMStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___LACSecureStorage);
    v4 = -[LACSecureStorageConfiguration initWithBypassEntitlementChecks:]( objc_alloc(&OBJC_CLASS___LACSecureStorageConfiguration),  "initWithBypassEntitlementChecks:",  1LL);
    uint64_t v5 = -[LACSecureStorage initWithConfig:](v3, "initWithConfig:", v4);
    storage = v2->_storage;
    v2->_storage = (LACSecureStorage *)v5;
  }

  return v2;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  storage = self->_storage;
  id v8 = a3;
  [v8 value];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke;
  v11[3] = &unk_18A369FB0;
  id v12 = v6;
  id v10 = v6;
  -[LACSecureStorage setObject:forRequest:connection:completionHandler:]( storage,  "setObject:forRequest:connection:completionHandler:",  v9,  v8,  0LL,  v11);
}

uint64_t __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
}

@end