@interface SUCoreRollback
+ (BOOL)supportsSecureCoding;
- (SUCoreRollback)init;
- (SUCoreRollback)initWithCoder:(id)a3;
- (SUCoreRollbackDescriptor)eligibleRollback;
- (SUCoreRollbackDescriptor)rollback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)previousRollback;
- (void)encodeWithCoder:(id)a3;
- (void)loadPersistedStateFile;
- (void)rollbackCompleted;
- (void)setRollback:(id)a3;
@end

@implementation SUCoreRollback

- (SUCoreRollback)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SUCoreRollback;
  v2 = -[SUCoreRollback init](&v10, sel_init);
  if (v2)
  {
    v3 = (const char *)[@"com.apple.su.core.rollback.statequeue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___SUCoreRollbackDescriptor);
    rollback = v2->_rollback;
    v2->_rollback = v7;

    -[SUCoreRollback loadPersistedStateFile](v2, "loadPersistedStateFile");
  }

  return v2;
}

- (SUCoreRollbackDescriptor)eligibleRollback
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  objc_super v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0LL;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__SUCoreRollback_eligibleRollback__block_invoke;
  v6[3] = &unk_18A0EF948;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCoreRollbackDescriptor *)v4;
}

void __34__SUCoreRollback_eligibleRollback__block_invoke(uint64_t a1)
{
}

- (void)loadPersistedStateFile
{
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) loadPersistedState] & 1) == 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 oslog];
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

- (id)previousRollback
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  objc_super v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0LL;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__SUCoreRollback_previousRollback__block_invoke;
  v6[3] = &unk_18A0EF998;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__SUCoreRollback_previousRollback__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)MEMORY[0x189604010];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v2 secureCodedObjectForKey:@"previousRollback" ofClass:v3 encodeClasses:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)rollbackCompleted
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SUCoreRollback_rollbackCompleted__block_invoke;
  block[3] = &unk_18A0EF970;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __35__SUCoreRollback_rollbackCompleted__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:@"previousRollback" shouldPersist:1];
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCoreRollback rollback](self, "rollback");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"rollback:%@", v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollback)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SUCoreRollback);

  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rollback"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollback setRollback:](v5, "setRollback:", v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreRollback rollback](self, "rollback");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"rollback"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[SUCoreRollback init]( +[SUCoreRollback allocWithZone:](&OBJC_CLASS___SUCoreRollback, "allocWithZone:", a3),  "init");
  -[SUCoreRollback rollback](self, "rollback");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollback setRollback:](v4, "setRollback:", v5);

  return v4;
}

- (SUCoreRollbackDescriptor)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (void).cxx_destruct
{
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end