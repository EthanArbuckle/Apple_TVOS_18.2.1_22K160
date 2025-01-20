@interface MCMContainerClassIterator
- (MCMContainerClassIterator)initWithStaticConfig:(id)a3;
- (MCMContainerClassIterator)initWithStaticConfig:(id)a3 userIdentityCache:(id)a4;
- (MCMStaticConfiguration)staticConfig;
- (MCMUserIdentityCache)userIdentityCache;
- (void)_selectWithFlags:(unint64_t)a3 includeUserIdentities:(BOOL)a4 iterator:(id)a5;
- (void)selectAutorollingWithIterator:(id)a3;
- (void)selectAutorollingWithUserIdentityIterator:(id)a3;
- (void)selectBundleWithIterator:(id)a3;
- (void)selectBundleWithUserIdentityIterator:(id)a3;
- (void)selectDataProtectedWithIterator:(id)a3;
- (void)selectDataProtectedWithUserIdentityIterator:(id)a3;
- (void)selectGlobalWithIterator:(id)a3;
- (void)selectGlobalWithUserIdentityIterator:(id)a3;
- (void)selectRemoteWithIterator:(id)a3;
- (void)selectRemoteWithUserIdentityIterator:(id)a3;
- (void)selectSystemWithIterator:(id)a3;
- (void)selectSystemWithUserIdentityIterator:(id)a3;
- (void)selectUserDataWithIterator:(id)a3;
- (void)selectUserDataWithUserIdentityIterator:(id)a3;
- (void)selectUserWithIterator:(id)a3;
- (void)selectUserWithUserIdentityIterator:(id)a3;
- (void)selectWithFlags:(unint64_t)a3 iterator:(id)a4;
- (void)selectWithFlags:(unint64_t)a3 userIdentityIterator:(id)a4;
- (void)selectWithIterator:(id)a3;
@end

@implementation MCMContainerClassIterator

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3
{
  return -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:]( self,  "initWithStaticConfig:userIdentityCache:",  a3,  0LL);
}

- (void)selectWithFlags:(unint64_t)a3 iterator:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke;
  v8[3] = &unk_18A29D9E0;
  id v9 = v6;
  id v7 = v6;
  -[MCMContainerClassIterator _selectWithFlags:includeUserIdentities:iterator:]( self,  "_selectWithFlags:includeUserIdentities:iterator:",  a3,  0LL,  v8);
}

- (void)selectWithIterator:(id)a3
{
}

- (void)selectUserDataWithIterator:(id)a3
{
}

- (void)selectRemoteWithIterator:(id)a3
{
}

- (void)selectUserWithIterator:(id)a3
{
}

- (void)selectSystemWithIterator:(id)a3
{
}

- (void)selectBundleWithIterator:(id)a3
{
}

- (void)selectGlobalWithIterator:(id)a3
{
}

- (void)selectDataProtectedWithIterator:(id)a3
{
}

- (void)selectAutorollingWithIterator:(id)a3
{
}

- (void)_selectWithFlags:(unint64_t)a3 includeUserIdentities:(BOOL)a4 iterator:(id)a5
{
  BOOL v5 = a4;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (!v5
    || (-[MCMContainerClassIterator userIdentityCache](self, "userIdentityCache"),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    -[MCMContainerClassIterator staticConfig](self, "staticConfig");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 containerConfigMap];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obuint64_t j = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v50 count:16];
    if (!v12) {
      goto LABEL_63;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    BOOL v40 = v5;
    v38 = self;
    id v39 = v8;
    while (1)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v17 = -[MCMContainerClassIterator staticConfig](self, "staticConfig", v38, v39);
        [v17 containerConfigMap];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 objectForKeyedSubscript:v16];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((a3 & 0x10000) != 0 || [v19 supportedOnPlatform])
        {
          unint64_t v20 = [v19 containerClass];
          if ((a3 & 0x20000) != 0 || (uint64_t v21 = [v19 containerClass], v21 == container_class_normalized()))
          {
            if ((a3 & 0xB0000) != 0
              || ([v19 handledDirectly] & 1) != 0
              || [v19 handledByProxy])
            {
              if ((a3 & 0x200040000LL) != 0)
              {
              }

              else if ([v19 handledByProxy])
              {
                goto LABEL_61;
              }

              if (((a3 & 0x400000000LL) == 0 || v20 <= 0xB && ((1LL << v20) & 0xED4) != 0)
                && ((a3 & 0x800000000LL) == 0 || v20 <= 0xE && ((1LL << v20) & 0x4ED4) != 0))
              {
                unint64_t v22 = v20 & 0xFFFFFFFFFFFFFFFELL;
                if (((a3 & 0x1000000000LL) == 0 || v22 == 12)
                  && ((a3 & 0x2000000000LL) == 0 || v20 <= 0xE && ((1LL << v20) & 0x412A) != 0)
                  && ((a3 & 0x4000000000LL) == 0 || v20 == 4 || v20 == 2)
                  && ((a3 & 0x20000000000LL) == 0 || v22 == 12 || v20 <= 8 && ((1LL << v20) & 0x12A) != 0)
                  && ((a3 & 0x8000000000) == 0 || [v19 autoRollsPathOnBuildUpdate])
                  && ((a3 & 0x10000000000LL) == 0
                   || [v19 migrateCodeSignInfoFromMetadataToDB]))
                {
                  v42[0] = MEMORY[0x1895F87A8];
                  v42[1] = 3221225472LL;
                  v42[2] = __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke;
                  v42[3] = &unk_18A29DA08;
                  unint64_t v44 = a3;
                  id v43 = v8;
                  uint64_t v23 = MEMORY[0x1895CE54C](v42);
                  v24 = (void (**)(void, void, void))v23;
                  if (v5)
                  {
                    if ([v19 usesGlobalSystemUserIdentity])
                    {
                      v25 = self;
                      v26 = (void *)MEMORY[0x189604010];
                      v27 = -[MCMContainerClassIterator userIdentityCache](v25, "userIdentityCache");
                      uint64_t v28 = [v27 globalSystemUserIdentity];
                      goto LABEL_51;
                    }

                    if ([v19 usesGlobalBundleUserIdentity])
                    {
                      v29 = self;
                      v26 = (void *)MEMORY[0x189604010];
                      v27 = -[MCMContainerClassIterator userIdentityCache](v29, "userIdentityCache");
                      uint64_t v28 = [v27 globalBundleUserIdentity];
                      goto LABEL_51;
                    }

                    if ([v19 personaAndUserSpecific])
                    {
                      v27 = -[MCMContainerClassIterator userIdentityCache](self, "userIdentityCache");
                      [v27 allAccessibleUserIdentities];
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      v31 = self;
                      v26 = (void *)MEMORY[0x189604010];
                      v27 = -[MCMContainerClassIterator userIdentityCache](v31, "userIdentityCache");
                      uint64_t v28 = [v27 defaultUserIdentity];
LABEL_51:
                      v32 = (void *)v28;
                      [v26 setWithObject:v28];
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    __int128 v48 = 0u;
                    __int128 v49 = 0u;
                    __int128 v46 = 0u;
                    __int128 v47 = 0u;
                    id v33 = v30;
                    uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v45 count:16];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v47;
                      do
                      {
                        for (uint64_t j = 0LL; j != v35; ++j)
                        {
                          if (*(void *)v47 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          ((void (**)(void, void *, void))v24)[2]( v24,  v19,  *(void *)(*((void *)&v46 + 1) + 8 * j));
                        }

                        uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v45 count:16];
                      }

                      while (v35);
                    }

                    BOOL v5 = v40;
                    self = v38;
                    id v8 = v39;
                  }

                  else
                  {
                    (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v19, 0LL);
                  }
                }
              }
            }
          }
        }

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (void).cxx_destruct
{
}

void __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v6 = (void *)MEMORY[0x1895CE3A8]();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_autoreleasePoolPop(v6);
  }
}

uint64_t __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMContainerClassIterator;
  id v9 = -[MCMContainerClassIterator init](&v12, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticConfig, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
  }

  return v10;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)selectWithFlags:(unint64_t)a3 userIdentityIterator:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke;
  v8[3] = &unk_18A29D9E0;
  id v9 = v6;
  id v7 = v6;
  -[MCMContainerClassIterator _selectWithFlags:includeUserIdentities:iterator:]( self,  "_selectWithFlags:includeUserIdentities:iterator:",  a3,  1LL,  v8);
}

- (void)selectUserDataWithUserIdentityIterator:(id)a3
{
}

- (void)selectRemoteWithUserIdentityIterator:(id)a3
{
}

- (void)selectUserWithUserIdentityIterator:(id)a3
{
}

- (void)selectSystemWithUserIdentityIterator:(id)a3
{
}

- (void)selectBundleWithUserIdentityIterator:(id)a3
{
}

- (void)selectGlobalWithUserIdentityIterator:(id)a3
{
}

- (void)selectDataProtectedWithUserIdentityIterator:(id)a3
{
}

- (void)selectAutorollingWithUserIdentityIterator:(id)a3
{
}

uint64_t __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

@end