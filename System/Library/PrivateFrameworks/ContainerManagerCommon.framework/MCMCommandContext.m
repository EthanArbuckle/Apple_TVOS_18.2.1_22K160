@interface MCMCommandContext
+ (id)privileged;
+ (id)privilegedWithUserIdentity:(id)a3 userIdentityCache:(id)a4;
- (MCMClientIdentity)clientIdentity;
- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8;
- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8 classIterator:(id)a9;
- (MCMContainerCache)containerCache;
- (MCMContainerClassUserIdentityIterator)classIterator;
- (MCMContainerFactory)containerFactory;
- (MCMGlobalConfiguration)globalConfiguration;
- (MCMUserIdentityCache)userIdentityCache;
- (unsigned)kernelPersonaID;
@end

@implementation MCMCommandContext

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_alloc(&OBJC_CLASS___MCMContainerClassIterator);
  [v14 staticConfig];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:]( v19,  "initWithStaticConfig:userIdentityCache:",  v20,  v15);

  v22 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:]( self,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:",  v18,  v17,  v16,  v15,  v8,  v14,  v21);
  return v22;
}

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8 classIterator:(id)a9
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MCMCommandContext;
  id v18 = -[MCMCommandContext init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientIdentity, a3);
    objc_storeStrong((id *)&v19->_containerCache, a4);
    objc_storeStrong((id *)&v19->_containerFactory, a5);
    objc_storeStrong((id *)&v19->_userIdentityCache, a6);
    v19->_kernelPersonaID = a7;
    objc_storeStrong((id *)&v19->_globalConfiguration, a8);
    objc_storeStrong((id *)&v19->_classIterator, a9);
  }

  return v19;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (MCMContainerCache)containerCache
{
  return self->_containerCache;
}

- (MCMContainerFactory)containerFactory
{
  return self->_containerFactory;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (MCMGlobalConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (MCMContainerClassUserIdentityIterator)classIterator
{
  return self->_classIterator;
}

- (void).cxx_destruct
{
}

+ (id)privileged
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__MCMCommandContext_privileged__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (privileged_token != -1) {
    dispatch_once(&privileged_token, v3);
  }
  return (id)privileged_privilegedContext;
}

+ (id)privilegedWithUserIdentity:(id)a3 userIdentityCache:(id)a4
{
  id v5 = a4;
  v6 = +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:]( &OBJC_CLASS___MCMClientIdentity,  "anonymousPrivilegedClientIdentityWithUserIdentity:",  a3);
  v7 = objc_alloc(&OBJC_CLASS___MCMContainerFactory);
  uint64_t v8 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:]( v7,  "initWithContainerCache:clientIdentity:userIdentityCache:",  gContainerCache,  v6,  v5);
  v9 = objc_alloc(&OBJC_CLASS___MCMContainerClassIterator);
  id v10 = containermanager_copy_global_configuration();
  [v10 staticConfig];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:]( v9,  "initWithStaticConfig:userIdentityCache:",  v11,  v5);

  v13 = objc_alloc(&OBJC_CLASS___MCMCommandContext);
  uint64_t v14 = gContainerCache;
  id v15 = containermanager_copy_global_configuration();
  id v16 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:]( v13,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:",  v6,  v14,  v8,  v5,  0LL,  v15,  v12);

  return v16;
}

void __31__MCMCommandContext_privileged__block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  [v6 defaultUserIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 privilegedWithUserIdentity:v3 userIdentityCache:v6];
  id v5 = (void *)privileged_privilegedContext;
  privileged_privilegedContext = v4;
}

@end