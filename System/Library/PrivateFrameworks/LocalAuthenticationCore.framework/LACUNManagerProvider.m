@interface LACUNManagerProvider
+ (id)sharedInstance;
- (LACUNManagerProvider)init;
- (NSMutableDictionary)sharedInstances;
- (id)sharedInstanceWithBundleIdentifier:(id)a3 categories:(id)a4 replyQueue:(id)a5;
- (id)sharedInstanceWithBundleIdentifier:(id)a3 replyQueue:(id)a4;
- (void)setSharedInstances:(id)a3;
@end

@implementation LACUNManagerProvider

- (LACUNManagerProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACUNManagerProvider;
  v2 = -[LACUNManagerProvider init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[LACUNManagerProvider setSharedInstances:](v2, "setSharedInstances:", v3);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_16);
  }
  return (id)sharedInstance_sharedInstance_8;
}

void __38__LACUNManagerProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACUNManagerProvider);
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = (uint64_t)v0;
}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 replyQueue:(id)a4
{
  return -[LACUNManagerProvider sharedInstanceWithBundleIdentifier:categories:replyQueue:]( self,  "sharedInstanceWithBundleIdentifier:categories:replyQueue:",  a3,  MEMORY[0x189604A58],  a4);
}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 categories:(id)a4 replyQueue:(id)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v26 = a3;
  id v7 = a4;
  id v25 = a5;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  [v7 sortedArrayUsingSelector:sel_identifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    v12 = &stru_18A36E1E8;
    do
    {
      uint64_t v13 = 0LL;
      v14 = v12;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = (void *)NSString;
        [*(id *)(*((void *)&v30 + 1) + 8 * v13) identifier];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 stringWithFormat:@"%@-%@", v14, v16];
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }

      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v10);
  }

  else
  {
    v12 = &stru_18A36E1E8;
  }

  [NSString stringWithFormat:@"%@-%@", v26, v12];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[LACUNManagerProvider sharedInstances](self, "sharedInstances");
  [v18 objectForKeyedSubscript:v17];
  v19 = (LACUNManagerQueueDecorator *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = objc_alloc(&OBJC_CLASS___LACUNManagerQueueDecorator);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke;
    v27[3] = &unk_18A36A6A8;
    id v28 = v26;
    id v29 = v7;
    __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke((uint64_t)v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[LACUNManagerQueueDecorator initWithManager:replyQueue:](v20, "initWithManager:replyQueue:", v21, v25);
    v22 = -[LACUNManagerProvider sharedInstances](self, "sharedInstances");
    [v22 setObject:v19 forKeyedSubscript:v17];
  }

  return v19;
}

LACUNManagerSetUpDecorator *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke( uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___LACUNManagerSetUpDecorator);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2;
  v5[3] = &unk_18A36A680;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v3 = -[LACUNManagerSetUpDecorator initWithManagerBuilder:](v2, "initWithManagerBuilder:", v5);

  return v3;
}

LACUNManager *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2( uint64_t a1)
{
  return  -[LACUNManager initWithBundleIdentifier:categories:]( objc_alloc(&OBJC_CLASS___LACUNManager),  "initWithBundleIdentifier:categories:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

- (NSMutableDictionary)sharedInstances
{
  return self->_sharedInstances;
}

- (void)setSharedInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end