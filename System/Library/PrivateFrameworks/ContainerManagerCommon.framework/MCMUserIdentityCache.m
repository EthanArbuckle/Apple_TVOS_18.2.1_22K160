@interface MCMUserIdentityCache
+ (BOOL)personasAreSupported;
+ (id)defaultUserIdentity;
+ (id)globalBundleUserIdentity;
+ (id)globalSystemUserIdentity;
+ (id)userIdentityWithPersonaAttributes:(id)a3;
+ (id)userIdentityWithPersonaAttributes:(id)a3 POSIXUser:(id)a4 forceUnspecific:(BOOL)a5;
+ (id)userIdentityWithPersonaAttributes:(id)a3 forceUnspecific:(BOOL)a4;
- (BOOL)_lock_resync_fromUserPersonaAttributes:(id)a3;
- (BOOL)cacheInvalid;
- (MCMContainerClassIterator)classIterator;
- (MCMUserIdentity)defaultUserIdentity;
- (MCMUserIdentity)lock_userIdentityForPersonalPersona;
- (MCMUserIdentity)lock_userIdentityForUnspecificPersona;
- (MCMUserIdentityCache)init;
- (NSDictionary)lock_bundleToDataSeparatedIdentitiesMap;
- (NSDictionary)lock_personaIDToUserIdentityMap;
- (NSDictionary)lock_personaUniqueStringToUserIdentityMap;
- (NSHashTable)observers;
- (NSMutableDictionary)lock_libraryRepairForUserIdentity;
- (NSMutableDictionary)lock_managedPathRegistryForUserIdentity;
- (NSSet)previousUserIdentities;
- (id)_lock_userIdentitiesForBundleIdentifier:(id)a3;
- (id)_lock_userIdentityForCurrentUserWithPersonaUniqueString:(id)a3;
- (id)allAccessibleUserIdentities;
- (id)globalBundleUserIdentity;
- (id)globalSystemUserIdentity;
- (id)libraryRepairForUserIdentity:(id)a3;
- (id)managedUserPathRegistryForUserIdentity:(id)a3;
- (id)personaUniqueStringForCurrentContext;
- (id)unspecificUserIdentity;
- (id)userIdentitiesForBundleIdentifier:(id)a3;
- (id)userIdentitiesForContainerConfig:(id)a3 originatorUserIdentities:(id)a4;
- (id)userIdentityForClient:(container_client *)a3 error:(id *)a4;
- (id)userIdentityForContainerConfig:(id)a3 originatorUserIdentity:(id)a4;
- (id)userIdentityForCurrentContext;
- (id)userIdentityForCurrentUserWithPersonaUniqueString:(id)a3;
- (id)userIdentityForLegacyMobileUser;
- (id)userIdentityForPersonaUniqueString:(id)a3 POSIXUser:(id)a4;
- (id)userIdentityForPersonalPersona;
- (id)userIdentityForPersonalPersonaWithPOSIXUser:(id)a3;
- (id)userIdentityWithPersonaID:(unsigned int)a3;
- (unint64_t)savedGeneration;
- (void)_lock_flush;
- (void)_lock_flushAndRepopulateWithUserIdentities:(id)a3;
- (void)_lock_resync;
- (void)_notifyObserversOfChangesWithUserIdentities:(id)a3 firstFetch:(BOOL)a4;
- (void)_refreshFromUserManagementIfNecessary;
- (void)addObserver:(id)a3;
- (void)flush;
- (void)flushAndRepopulateWithUserIdentities:(id)a3;
- (void)forEachAccessibleUserIdentitySynchronouslyExecuteBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCacheInvalid:(BOOL)a3;
- (void)setPreviousUserIdentities:(id)a3;
- (void)setSavedGeneration:(unint64_t)a3;
@end

@implementation MCMUserIdentityCache

- (MCMUserIdentityCache)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMUserIdentityCache;
  v2 = -[MCMUserIdentityCache init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    listener = v3->_listener;
    v3->_listener = 0LL;

    uint64_t v7 = [MEMORY[0x189604010] set];
    previousUserIdentities = v3->_previousUserIdentities;
    v3->_previousUserIdentities = (NSSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.containermanagerd.MCMUserIdentityCache.flushQueue", 0LL);
    flushQueue = v3->_flushQueue;
    v3->_flushQueue = (OS_dispatch_queue *)v9;

    id v11 = containermanager_copy_global_configuration();
    uint64_t v12 = [v11 classIterator];
    classIterator = v3->_classIterator;
    v3->_classIterator = (MCMContainerClassIterator *)v12;

    *(_WORD *)&v3->_fetchedFromUM = 256;
    uint64_t v14 = objc_opt_new();
    defaultUserIdentity = v3->_defaultUserIdentity;
    v3->_defaultUserIdentity = (MCMUserIdentity *)v14;

    os_unfair_lock_lock(&v3->_lock);
    -[MCMUserIdentityCache _lock_flush](v3, "_lock_flush");
    os_unfair_lock_unlock(&v3->_lock);
  }

  return v3;
}

- (void)_refreshFromUserManagementIfNecessary
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if ([(id)objc_opt_class() personasAreSupported])
  {
    [MEMORY[0x189612BC0] sharedManager];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = 0LL;
    unint64_t v4 = [v3 personaGenerationIdentifierWithError:&v9];

    if (v4 && v4 != self->_savedGeneration)
    {
      self->_savedGeneration = v4;
      container_log_handle_for_category();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        -[MCMUserIdentityCache flush](self, "flush");
        return;
      }

      *(_DWORD *)buf = 134217984;
      unint64_t v11 = v4;
      v6 = "Flushing cache because UM persona list has updated. (generation %llu)";
      uint64_t v7 = (os_log_s *)v5;
      uint32_t v8 = 12;
    }

    else
    {
      if (self->_fetchedFromUM) {
        return;
      }
      container_log_handle_for_category();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v6 = "Resync cache because UM persona list has not yet been fetched successfully.";
      uint64_t v7 = (os_log_s *)v5;
      uint32_t v8 = 2;
    }

    _os_log_impl(&dword_188846000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    goto LABEL_10;
  }

- (id)userIdentitiesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[MCMUserIdentityCache _lock_userIdentitiesForBundleIdentifier:](self, "_lock_userIdentitiesForBundleIdentifier:", v4);
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id v7 = v6;
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint32_t v8 = v7;

  return v8;
}

- (id)userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if (![(id)objc_opt_class() personasAreSupported])
  {
    uint64_t v9 = -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
LABEL_9:
    id v7 = (void *)v9;
    goto LABEL_10;
  }

  if (!v4)
  {
    uint64_t v9 = -[MCMUserIdentityCache unspecificUserIdentity](self, "unspecificUserIdentity");
    goto LABEL_9;
  }

  [NSString stringWithUTF8String:*MEMORY[0x1895F8380]];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    uint32_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [v7 debugDescription];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_debug_impl(&dword_188846000, v8, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache _lock_userIdentityForCurrentUserWithPersonaUniqueString:]( self,  "_lock_userIdentityForCurrentUserWithPersonaUniqueString:",  v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }

- (id)userIdentityForPersonaUniqueString:(id)a3 POSIXUser:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if ([v7 isRoleUser])
  {
    id v8 = containermanager_copy_global_configuration();
    uint64_t v9 = [v8 defaultUser];

    id v7 = (id)v9;
  }

  if (![(id)objc_opt_class() personasAreSupported])
  {
    -[MCMUserIdentityCache userIdentityForPersonalPersonaWithPOSIXUser:]( self,  "userIdentityForPersonalPersonaWithPOSIXUser:",  v7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  if (!v6)
  {
    -[MCMUserIdentityCache unspecificUserIdentity](self, "unspecificUserIdentity");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  [NSString stringWithUTF8String:*MEMORY[0x1895F8380]];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v6 isEqualToString:v10];

  if (!v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache _lock_userIdentityForCurrentUserWithPersonaUniqueString:]( self,  "_lock_userIdentityForCurrentUserWithPersonaUniqueString:",  v6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    [v12 debugDescription];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = 138412290;
    v21 = v19;
    _os_log_debug_impl(&dword_188846000, v13, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v20, 0xCu);
  }

  if (v12)
  {
LABEL_14:
    [v12 posixUser];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = [v15 isEqual:v7];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [v12 userIdentityWithPOSIXUser:v7];

      uint64_t v12 = (void *)v17;
    }
  }

- (id)userIdentityForClient:(container_client *)a3 error:(id *)a4
{
  persona_unique_string = (void *)container_client_get_persona_unique_string();
  uint64_t euid = container_client_get_euid();
  id v8 = containermanager_copy_global_configuration();
  [v8 defaultUser];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 userContainerMode];

  if (v11 == 2)
  {
    uint64_t v12 = +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", euid);

    uint64_t v9 = (void *)v12;
  }

  if (persona_unique_string)
  {
    [NSString stringWithUTF8String:persona_unique_string];
    persona_unique_string = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v13 = -[MCMUserIdentityCache userIdentityForPersonaUniqueString:POSIXUser:]( self,  "userIdentityForPersonaUniqueString:POSIXUser:",  persona_unique_string,  v9);
  uint64_t v14 = (void *)v13;
  if (a4 && !v13) {
    *a4 = 0LL;
  }

  return v14;
}

- (id)userIdentityForPersonalPersona
{
  id v3 = containermanager_copy_global_configuration();
  [v3 defaultUser];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMUserIdentityCache userIdentityForPersonalPersonaWithPOSIXUser:]( self,  "userIdentityForPersonalPersonaWithPOSIXUser:",  v4);
  return v5;
}

- (id)unspecificUserIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_userIdentityForUnspecificPersona](self, "lock_userIdentityForUnspecificPersona");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)userIdentityForPersonalPersonaWithPOSIXUser:(id)a3
{
  id v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if ([v4 isRoleUser])
  {
    id v5 = containermanager_copy_global_configuration();
    uint64_t v6 = [v5 defaultUser];

    id v4 = (id)v6;
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  [v8 posixUser];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = [v9 isEqual:v4];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [v8 userIdentityWithPOSIXUser:v4];

    id v8 = (void *)v11;
  }

  return v8;
}

- (id)userIdentityWithPersonaID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_personaIDToUserIdentityMap](self, "lock_personaIDToUserIdentityMap");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedInt:v3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [v8 shortDescription];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 1024;
    int v19 = v3;
    _os_log_debug_impl(&dword_188846000, v9, OS_LOG_TYPE_DEBUG, "Found %@ for ID: %d", (uint8_t *)&v16, 0x12u);
  }

  if (!v8)
  {
    -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
    -[MCMUserIdentityCache lock_personaIDToUserIdentityMap](self, "lock_personaIDToUserIdentityMap");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:v11];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      [v8 shortDescription];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_debug_impl( &dword_188846000,  v12,  OS_LOG_TYPE_DEBUG,  "After refresh, found %@ for ID: %d",  (uint8_t *)&v16,  0x12u);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)flush
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
  -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  os_unfair_lock_unlock(p_lock);
}

- (id)allAccessibleUserIdentities
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  [MEMORY[0x189603FE0] set];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([(id)objc_opt_class() personasAreSupported])
  {
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap](self, "lock_personaUniqueStringToUserIdentityMap");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 allValues];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v11 isNoSpecificPersona] & 1) == 0) {
            [v3 addObject:v11];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }

      while (v8);
    }

    if (![v3 count])
    {
      container_log_handle_for_category();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412546;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        int v19 = v3;
        _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Expected to find at least one persona; self = %@, personaAttributeList = %@",
          (uint8_t *)&v16,
          0x16u);
      }

      -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 addObject:v13];
    }
  }

  else
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v14];
  }

  return v3;
}

- (void)forEachAccessibleUserIdentitySynchronouslyExecuteBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  -[MCMUserIdentityCache allAccessibleUserIdentities](self, "allAccessibleUserIdentities");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v7);
  }
}

- (id)userIdentityForContainerConfig:(id)a3 originatorUserIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (([v6 personaAndUserSpecific] & 1) == 0)
  {
    if ([v6 usesGlobalBundleUserIdentity])
    {
      uint64_t v9 = -[MCMUserIdentityCache globalBundleUserIdentity](self, "globalBundleUserIdentity");
    }

    else
    {
      else {
      uint64_t v9 = -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      }
    }

    uint64_t v8 = (void *)v9;
  }

  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  __int128 v11 = v10;

  return v11;
}

- (id)userIdentitiesForContainerConfig:(id)a3 originatorUserIdentities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (([v6 personaAndUserSpecific] & 1) == 0)
  {
    -[MCMUserIdentityCache userIdentityForContainerConfig:originatorUserIdentity:]( self,  "userIdentityForContainerConfig:originatorUserIdentity:",  v6,  0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithObject:v9];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    __int128 v11 = (void *)MEMORY[0x189604010];
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setWithObject:v12];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)globalBundleUserIdentity
{
  return (id)[(id)objc_opt_class() globalBundleUserIdentity];
}

- (id)globalSystemUserIdentity
{
  return (id)[(id)objc_opt_class() globalSystemUserIdentity];
}

- (id)personaUniqueStringForCurrentContext
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if ([(id)objc_opt_class() personasAreSupported] && objc_opt_class())
  {
    [MEMORY[0x189612BC0] sharedManager];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 currentPersona];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 userPersonaUniqueString];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      container_log_handle_for_category();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Could not fetch persona unique string", v8, 2u);
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  if (personaUniqueStringForCurrentContext_onceToken != -1)
  {
    dispatch_once(&personaUniqueStringForCurrentContext_onceToken, &__block_literal_global_11);
    if (v4) {
      goto LABEL_11;
    }
LABEL_15:
    id v6 = 0LL;
    return v6;
  }

  if (!v4) {
    goto LABEL_15;
  }
LABEL_11:
  [(id)personaUniqueStringForCurrentContext_dedupCache objectForKey:v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    [(id)personaUniqueStringForCurrentContext_dedupCache setObject:v4 forKey:v4];
    id v6 = v4;
  }

  return v6;
}

- (id)userIdentityForCurrentContext
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = containermanager_copy_global_configuration();
  [v4 defaultUser];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentityCache userIdentityForPersonaUniqueString:POSIXUser:]( self,  "userIdentityForPersonaUniqueString:POSIXUser:",  v3,  v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userIdentityForLegacyMobileUser
{
  return -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
}

- (void)flushAndRepopulateWithUserIdentities:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MCMUserIdentityCache _lock_flushAndRepopulateWithUserIdentities:]( self,  "_lock_flushAndRepopulateWithUserIdentities:",  v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  -[MCMUserIdentityCache observers](self, "observers");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMUserIdentityCache observers](self, "observers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  -[MCMUserIdentityCache observers](self, "observers");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMUserIdentityCache observers](self, "observers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (id)managedUserPathRegistryForUserIdentity:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:]( self->_lock_managedPathRegistryForUserIdentity,  "objectForKeyedSubscript:",  v4);
  id v5 = (MCMManagedUserPathRegistry *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___MCMManagedUserPathRegistry);
    id v7 = containermanager_copy_global_configuration();
    [v7 currentUser];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = -[MCMManagedUserPathRegistry initWithUserIdentity:daemonUser:](v6, "initWithUserIdentity:daemonUser:", v4, v8);

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lock_managedPathRegistryForUserIdentity,  "setObject:forKeyedSubscript:",  v5,  v4);
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (id)libraryRepairForUserIdentity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:]( self->_lock_libraryRepairForUserIdentity,  "objectForKeyedSubscript:",  v4);
  id v5 = (MCMLibraryRepairForUser *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    -[MCMUserIdentityCache managedUserPathRegistryForUserIdentity:](self, "managedUserPathRegistryForUserIdentity:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc(&OBJC_CLASS___MCMLibraryRepairForUser);
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMUserIdentityCache classIterator](self, "classIterator");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = -[MCMLibraryRepairForUser initWithManagedUserPathRegistry:fileManager:classIterator:]( v7,  "initWithManagedUserPathRegistry:fileManager:classIterator:",  v6,  v8,  v9);

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lock_libraryRepairForUserIdentity,  "setObject:forKeyedSubscript:",  v5,  v4);
    os_unfair_lock_unlock(&self->_lock);
    if ([v4 personaType] != 3)
    {
      id v14 = 0LL;
      BOOL v10 = -[MCMLibraryRepair createPathsIfNecessaryWithError:](v5, "createPathsIfNecessaryWithError:", &v14);
      id v11 = v14;
      if (!v10)
      {
        container_log_handle_for_category();
        __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = v4;
          __int16 v17 = 2114;
          id v18 = v11;
          _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Failed creating working directories for %@: %{public}@",  buf,  0x16u);
        }
      }
    }
  }

  return v5;
}

- (NSDictionary)lock_bundleToDataSeparatedIdentitiesMap
{
  if (self->_cacheInvalid) {
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_bundleToDataSeparatedIdentitiesMap;
}

- (NSDictionary)lock_personaUniqueStringToUserIdentityMap
{
  if (self->_cacheInvalid) {
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_personaUniqueStringToUserIdentityMap;
}

- (NSDictionary)lock_personaIDToUserIdentityMap
{
  if (self->_cacheInvalid) {
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_personaIDToUserIdentityMap;
}

- (MCMUserIdentity)lock_userIdentityForPersonalPersona
{
  if (self->_cacheInvalid) {
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_userIdentityForPersonalPersona;
}

- (MCMUserIdentity)lock_userIdentityForUnspecificPersona
{
  if (self->_cacheInvalid) {
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_userIdentityForUnspecificPersona;
}

- (id)_lock_userIdentitiesForBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[MCMUserIdentityCache lock_bundleToDataSeparatedIdentitiesMap](self, "lock_bundleToDataSeparatedIdentitiesMap");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)MEMORY[0x189604010];
    if (v8)
    {
      -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setWithObject:v10];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189604010] set];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_lock_userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap](self, "lock_personaUniqueStringToUserIdentityMap");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [v6 shortDescription];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_debug_impl(&dword_188846000, v7, OS_LOG_TYPE_DEBUG, "Found %@ for %@", (uint8_t *)&v13, 0x16u);
    }

    if (!v6)
    {
      -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
      -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap]( self,  "lock_personaUniqueStringToUserIdentityMap");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:v4];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        [v6 shortDescription];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = 138412546;
        id v14 = v12;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_debug_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEBUG,  "After refresh, found %@ for %@",  (uint8_t *)&v13,  0x16u);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_lock_resync
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = (void *)MEMORY[0x1895CE3A8]();
  if ([(id)objc_opt_class() personasAreSupported] && objc_opt_class())
  {
    double Current = CFAbsoluteTimeGetCurrent();
    +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 countOfLock:13] < 1)
    {
      [MEMORY[0x189612BC0] sharedManager];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = 0LL;
      [v8 listAllPersonaAttributesWithError:&v21];
      id v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      id v6 = v21;
    }

    else
    {
      [v5 releaseLock:13];
      id v6 = 0LL;
      id v7 = 0LL;
    }

    double v9 = CFAbsoluteTimeGetCurrent();
    container_log_handle_for_category();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(double *)&uint8_t buf[4] = v9 - Current;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      __int128 v23 = v7;
      _os_log_impl( &dword_188846000,  v10,  OS_LOG_TYPE_DEFAULT,  "listAllPersonaAttributes (%f s): error = %{public}@, attributes = %{public}@",  buf,  0x20u);
    }

    if (v7 && [v7 count])
    {
      self->_fetchedFromUM = -[MCMUserIdentityCache _lock_resync_fromUserPersonaAttributes:]( self,  "_lock_resync_fromUserPersonaAttributes:",  v7);
      id v11 = (void *)MEMORY[0x189604010];
      -[NSDictionary allValues](self->_lock_personaUniqueStringToUserIdentityMap, "allValues");
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setWithArray:v12];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      __int128 v23 = __Block_byref_object_copy__10299;
      __int128 v24 = __Block_byref_object_dispose__10300;
      id v25 = (id)os_transaction_create();
      BOOL firstFetch = self->_firstFetch;
      flushQueue = (dispatch_queue_s *)self->_flushQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __36__MCMUserIdentityCache__lock_resync__block_invoke;
      block[3] = &unk_18A29DED0;
      id v18 = v13;
      uint64_t v19 = buf;
      block[4] = self;
      BOOL v20 = firstFetch;
      id v16 = v13;
      dispatch_async(flushQueue, block);

      _Block_object_dispose(buf, 8);
    }

    self->_BOOL firstFetch = 0;
  }

  objc_autoreleasePoolPop(v3);
  self->_cacheInvalid = 0;
}

- (void)_lock_flush
{
  self->_cacheInvalid = 1;
  [MEMORY[0x189603F68] dictionary];
  uint64_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_bundleToDataSeparatedIdentitiesMap = self->_lock_bundleToDataSeparatedIdentitiesMap;
  self->_lock_bundleToDataSeparatedIdentitiesMap = v3;

  [MEMORY[0x189603F68] dictionary];
  id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_personaUniqueStringToUserIdentityMap = self->_lock_personaUniqueStringToUserIdentityMap;
  self->_lock_personaUniqueStringToUserIdentityMap = v5;

  [MEMORY[0x189603F68] dictionary];
  id v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_personaIDToUserIdentityMap = self->_lock_personaIDToUserIdentityMap;
  self->_lock_personaIDToUserIdentityMap = v7;

  -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
  double v9 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  lock_userIdentityForPersonalPersona = self->_lock_userIdentityForPersonalPersona;
  self->_lock_userIdentityForPersonalPersona = v9;

  -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
  id v11 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  lock_userIdentityForUnspecificPersona = self->_lock_userIdentityForUnspecificPersona;
  self->_lock_userIdentityForUnspecificPersona = v11;

  [MEMORY[0x189603FC8] dictionary];
  int v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lock_managedPathRegistryForUserIdentity = self->_lock_managedPathRegistryForUserIdentity;
  self->_lock_managedPathRegistryForUserIdentity = v13;

  [MEMORY[0x189603FC8] dictionary];
  __int16 v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lock_libraryRepairForUserIdentity = self->_lock_libraryRepairForUserIdentity;
  self->_lock_libraryRepairForUserIdentity = v15;
}

- (void)_lock_flushAndRepopulateWithUserIdentities:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  [MEMORY[0x189603FC8] dictionary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = 0LL;
    BOOL v10 = 0LL;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDataSeparated", v34) & 1) == 0 && (objc_msgSend(v13, "isNoSpecificPersona") & 1) == 0)
        {
          id v14 = v13;

          BOOL v10 = v14;
        }

        if ([v13 isNoSpecificPersona])
        {
          __int16 v15 = v13;

          double v9 = v15;
        }

        [v13 personaUniqueString];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          [v13 personaUniqueString];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v13 forKeyedSubscript:v17];
        }

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v13, "kernelPersonaID"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v13 forKeyedSubscript:v18];
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v36 count:16];
    }

    while (v8);
  }

  else
  {
    double v9 = 0LL;
    BOOL v10 = 0LL;
  }

  uint64_t v19 = v34;
  [(id)objc_opt_class() personasAreSupported];
  if (v10)
  {
    if (!v9) {
      goto LABEL_22;
    }
  }

  else
  {
    BOOL v10 = v9;
    double v9 = v10;
    if (!v10)
    {
      -[MCMUserIdentityCache defaultUserIdentity](v34, "defaultUserIdentity");
      BOOL v10 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v20 = objc_alloc(&OBJC_CLASS___MCMUserIdentity);
      -[MCMUserIdentity posixUser](v10, "posixUser");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMUserIdentity homeDirectoryURL](v10, "homeDirectoryURL");
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMUserIdentity personaUniqueString](v10, "personaUniqueString");
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
      double v9 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( v20,  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v21,  v22,  v23,  2LL,  -[MCMUserIdentity kernelPersonaID](v10, "kernelPersonaID"));
    }
  }

  uint64_t v24 = objc_msgSend(MEMORY[0x189603F68], "dictionary", v34);
  lock_bundleToDataSeparatedIdentitiesMap = v19->_lock_bundleToDataSeparatedIdentitiesMap;
  v19->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v24;

  uint64_t v26 = [v5 copy];
  lock_personaUniqueStringToUserIdentityMap = v19->_lock_personaUniqueStringToUserIdentityMap;
  v19->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v26;

  uint64_t v28 = [v6 copy];
  lock_personaIDToUserIdentityMap = v19->_lock_personaIDToUserIdentityMap;
  v19->_lock_personaIDToUserIdentityMap = (NSDictionary *)v28;

  lock_userIdentityForPersonalPersona = v19->_lock_userIdentityForPersonalPersona;
  v19->_lock_userIdentityForPersonalPersona = v10;
  v31 = v10;

  lock_userIdentityForUnspecificPersona = v19->_lock_userIdentityForUnspecificPersona;
  v19->_lock_userIdentityForUnspecificPersona = v9;
  v33 = v9;

  v19->_cacheInvalid = 0;
}

- (BOOL)_lock_resync_fromUserPersonaAttributes:(id)a3
{
  uint64_t v150 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v105 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v103 = MEMORY[0x1895CE3A8]();
  [MEMORY[0x189603FC8] dictionary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v146 objects:v145 count:16];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v147;
  v108 = v6;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v147 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v146 + 1) + 8 * i);
      container_log_handle_for_category();
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = [v11 isUniversalPersona];
        int v14 = [v11 isSystemPersona];
        int v15 = [v11 isPersonalPersona];
        int v16 = [v11 isDataSeparatedPersona];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v144 = v13;
        *(_WORD *)&v144[4] = 1024;
        *(_DWORD *)&v144[6] = v14;
        *(_WORD *)&v144[10] = 1024;
        *(_DWORD *)&v144[12] = v15;
        id v6 = v108;
        *(_WORD *)&v144[16] = 1024;
        *(_DWORD *)&v144[18] = v16;
        *(_WORD *)&v144[22] = 2112;
        *(void *)&v144[24] = v11;
        _os_log_debug_impl( &dword_188846000,  v12,  OS_LOG_TYPE_DEBUG,  "[Personal] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@",  buf,  0x24u);
      }

      if ([v11 isPersonalPersona])
      {
        uint64_t v21 = [v11 userPersonaUniqueString];
        if (v21)
        {
          __int128 v22 = (void *)v21;
          [(id)objc_opt_class() userIdentityWithPersonaAttributes:v11];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [(id)objc_opt_class() userIdentityWithPersonaAttributes:v11 forceUnspecific:1];
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          [v6 objectForKeyedSubscript:v22];
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            container_log_handle_for_category();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v144 = v22;
              *(_WORD *)&v144[8] = 2112;
              *(void *)&v144[10] = v11;
              _os_log_fault_impl( &dword_188846000,  v24,  OS_LOG_TYPE_FAULT,  "Persona with duplicate unique string [%@]: %@",  buf,  0x16u);
            }
          }

          [v6 setObject:v17 forKeyedSubscript:v22];
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v11, "userPersona_id"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v112 setObject:v17 forKeyedSubscript:v25];

          container_log_handle_for_category();
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v144 = v11;
            *(_WORD *)&v144[8] = 2112;
            *(void *)&v144[10] = v17;
            *(_WORD *)&v144[18] = 2112;
            *(void *)&v144[20] = log;
            _os_log_impl( &dword_188846000,  v26,  OS_LOG_TYPE_DEFAULT,  "Found personal persona %@: created personal %@, unspecific %@",  buf,  0x20u);
          }

          if (!v17 || !log) {
            goto LABEL_12;
          }
          __int128 v142 = 0u;
          __int128 v141 = 0u;
          __int128 v140 = 0u;
          __int128 v139 = 0u;
          id v116 = obj;
          uint64_t v27 = [v116 countByEnumeratingWithState:&v139 objects:v138 count:16];
          v113 = v17;
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v140;
            do
            {
              for (uint64_t j = 0LL; j != v28; ++j)
              {
                if (*(void *)v140 != v29) {
                  objc_enumerationMutation(v116);
                }
                v31 = *(void **)(*((void *)&v139 + 1) + 8 * j);
                container_log_handle_for_category();
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  int v41 = [v31 isUniversalPersona];
                  int v42 = [v31 isSystemPersona];
                  int v43 = [v31 isPersonalPersona];
                  int v44 = [v31 isDataSeparatedPersona];
                  *(_DWORD *)buf = 67110146;
                  *(_DWORD *)v144 = v41;
                  *(_WORD *)&v144[4] = 1024;
                  *(_DWORD *)&v144[6] = v42;
                  id v6 = v108;
                  *(_WORD *)&v144[10] = 1024;
                  *(_DWORD *)&v144[12] = v43;
                  uint64_t v17 = v113;
                  *(_WORD *)&v144[16] = 1024;
                  *(_DWORD *)&v144[18] = v44;
                  *(_WORD *)&v144[22] = 2112;
                  *(void *)&v144[24] = v31;
                  _os_log_debug_impl( &dword_188846000,  v32,  OS_LOG_TYPE_DEBUG,  "[Multi] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@",  buf,  0x24u);
                }

                if (([v31 isPersonalPersona] & 1) == 0
                  && ([v31 isDataSeparatedPersona] & 1) == 0)
                {
                  [v31 userPersonaBundleIDList];
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  container_log_handle_for_category();
                  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = objc_msgSend(v31, "userPersona_id");
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v144 = v35;
                    *(_WORD *)&v144[4] = 2112;
                    *(void *)&v144[6] = v31;
                    *(_WORD *)&v144[14] = 2112;
                    *(void *)&v144[16] = v33;
                    _os_log_impl( &dword_188846000,  v34,  OS_LOG_TYPE_DEFAULT,  "Fetched bundle ID list for (%d) %@: %@",  buf,  0x1Cu);
                  }

                  if (v33 && [v33 count])
                  {
                    [MEMORY[0x189604010] setWithArray:v33];
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    [v109 unionSet:v36];
                  }

                  [v31 userPersonaUniqueString];
                  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    [v6 objectForKeyedSubscript:v37];
                    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v38)
                    {
                      container_log_handle_for_category();
                      __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)v144 = v37;
                        *(_WORD *)&v144[8] = 2112;
                        *(void *)&v144[10] = v31;
                        _os_log_fault_impl( &dword_188846000,  v39,  OS_LOG_TYPE_FAULT,  "Persona with duplicate unique string [%@]: %@",  buf,  0x16u);
                      }
                    }

                    [v6 setObject:log forKeyedSubscript:v37];
                  }

                  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v31, "userPersona_id"));
                  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
                  [v112 setObject:log forKeyedSubscript:v40];

                  uint64_t v17 = v113;
                }
              }

              uint64_t v28 = [v116 countByEnumeratingWithState:&v139 objects:v138 count:16];
            }

            while (v28);
          }

          __int128 v136 = 0u;
          __int128 v137 = 0u;
          __int128 v134 = 0u;
          __int128 v135 = 0u;
          id v111 = v116;
          uint64_t v45 = [v111 countByEnumeratingWithState:&v134 objects:v133 count:16];
          if (v45)
          {
            uint64_t v47 = v45;
            uint64_t v48 = *(void *)v135;
            *(void *)&__int128 v46 = 138412290LL;
            __int128 v102 = v46;
            uint64_t v106 = *(void *)v135;
            do
            {
              uint64_t v49 = 0LL;
              uint64_t v107 = v47;
              do
              {
                if (*(void *)v135 != v48) {
                  objc_enumerationMutation(v111);
                }
                v50 = *(void **)(*((void *)&v134 + 1) + 8 * v49);
                if (objc_msgSend(v50, "isDataSeparatedPersona", v102))
                {
                  container_log_handle_for_category();
                  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    int v81 = [v50 isUniversalPersona];
                    int v82 = [v50 isSystemPersona];
                    int v83 = [v50 isPersonalPersona];
                    int v84 = [v50 isDataSeparatedPersona];
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v144 = v81;
                    *(_WORD *)&v144[4] = 1024;
                    *(_DWORD *)&v144[6] = v82;
                    uint64_t v48 = v106;
                    uint64_t v47 = v107;
                    *(_WORD *)&v144[10] = 1024;
                    *(_DWORD *)&v144[12] = v83;
                    *(_WORD *)&v144[16] = 1024;
                    *(_DWORD *)&v144[18] = v84;
                    *(_WORD *)&v144[22] = 2112;
                    *(void *)&v144[24] = v50;
                    _os_log_debug_impl( &dword_188846000,  v51,  OS_LOG_TYPE_DEBUG,  "[DS] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@",  buf,  0x24u);
                  }

                  [v50 userPersonaUniqueString];
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v52)
                  {
                    [(id)objc_opt_class() userIdentityWithPersonaAttributes:v50];
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    container_log_handle_for_category();
                    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v144 = v52;
                      *(_WORD *)&v144[8] = 2112;
                      *(void *)&v144[10] = v53;
                      _os_log_impl( &dword_188846000,  v54,  OS_LOG_TYPE_DEFAULT,  "Creating user identity for %@: %@",  buf,  0x16u);
                    }

                    [v6 objectForKeyedSubscript:v52];
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v55)
                    {
                      container_log_handle_for_category();
                      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)v144 = v52;
                        *(_WORD *)&v144[8] = 2112;
                        *(void *)&v144[10] = v50;
                        _os_log_fault_impl( &dword_188846000,  v56,  OS_LOG_TYPE_FAULT,  "Persona with duplicate unique string [%@]: %@",  buf,  0x16u);
                      }
                    }

                    [v6 setObject:v53 forKeyedSubscript:v52];
                    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v50, "userPersona_id"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    [v112 setObject:v53 forKeyedSubscript:v57];

                    [v50 sandboxExtensionForPersonaLayoutPath];
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    v115 = v58;
                    if (v58)
                    {
                      [v58 UTF8String];
                      uint64_t v59 = sandbox_extension_consume();
                      if (v59 < 0)
                      {
                        uint64_t v60 = *__error();
                        container_log_handle_for_category();
                        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                        {
                          int v62 = *__error();
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)v144 = v62;
                          _os_log_impl( &dword_188846000,  v61,  OS_LOG_TYPE_DEFAULT,  "Error %d consuming sandbox extension",  buf,  8u);
                        }

                        uint64_t v59 = -v60;
                      }

                      [v53 setExtensionHandle:v59];
                    }

                    else
                    {
                      container_log_handle_for_category();
                      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                      {
                        [v50 personaLayoutPathURL];
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        *(void *)v144 = v52;
                        *(_WORD *)&v144[8] = 2114;
                        *(void *)&v144[10] = v64;
                        _os_log_impl( &dword_188846000,  v63,  OS_LOG_TYPE_DEFAULT,  "Error fetching sandbox extension for persona %{public}@, path %{public}@",  buf,  0x16u);
                      }
                    }

                    id v117 = v52;
                    [v50 userPersonaBundleIDList];
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    container_log_handle_for_category();
                    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v144 = v50;
                      *(_WORD *)&v144[8] = 2112;
                      *(void *)&v144[10] = v65;
                      _os_log_impl( &dword_188846000,  v66,  OS_LOG_TYPE_DEFAULT,  "Fetched bundle ID list for data separated persona %@: %@",  buf,  0x16u);
                    }

                    v114 = v65;
                    if (v65 && [v65 count])
                    {
                      __int128 v131 = 0u;
                      __int128 v132 = 0u;
                      __int128 v129 = 0u;
                      __int128 v130 = 0u;
                      id v67 = v65;
                      uint64_t v68 = [v67 countByEnumeratingWithState:&v129 objects:v128 count:16];
                      if (v68)
                      {
                        uint64_t v69 = v68;
                        uint64_t v70 = *(void *)v130;
                        do
                        {
                          for (uint64_t k = 0LL; k != v69; ++k)
                          {
                            if (*(void *)v130 != v70) {
                              objc_enumerationMutation(v67);
                            }
                            uint64_t v72 = *(void *)(*((void *)&v129 + 1) + 8 * k);
                            [v5 objectForKeyedSubscript:v72];
                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v73)
                            {
                              [MEMORY[0x189603FE0] set];
                              v73 = (void *)objc_claimAutoreleasedReturnValue();
                              [v5 setObject:v73 forKeyedSubscript:v72];
                            }

                            [v73 addObject:v53];
                          }

                          uint64_t v69 = [v67 countByEnumeratingWithState:&v129 objects:v128 count:16];
                        }

                        while (v69);
                      }
                    }

                    __int128 v126 = 0u;
                    __int128 v127 = 0u;
                    __int128 v124 = 0u;
                    __int128 v125 = 0u;
                    id v74 = v109;
                    uint64_t v75 = [v74 countByEnumeratingWithState:&v124 objects:v123 count:16];
                    if (v75)
                    {
                      uint64_t v76 = v75;
                      uint64_t v77 = *(void *)v125;
                      do
                      {
                        for (uint64_t m = 0LL; m != v76; ++m)
                        {
                          if (*(void *)v125 != v77) {
                            objc_enumerationMutation(v74);
                          }
                          uint64_t v79 = *(void *)(*((void *)&v124 + 1) + 8 * m);
                          [v5 objectForKeyedSubscript:v79];
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v80)
                          {
                            [MEMORY[0x189603FE0] set];
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            [v5 setObject:v80 forKeyedSubscript:v79];
                          }

                          [v80 addObject:v53];
                        }

                        uint64_t v76 = [v74 countByEnumeratingWithState:&v124 objects:v123 count:16];
                      }

                      while (v76);
                    }

                    uint64_t v47 = v107;
                    id v6 = v108;
                    uint64_t v17 = v113;
                    uint64_t v48 = v106;
                    v52 = v117;
                  }

                  else
                  {
                    container_log_handle_for_category();
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = v102;
                      *(void *)v144 = v50;
                      _os_log_fault_impl( &dword_188846000,  (os_log_t)v53,  OS_LOG_TYPE_FAULT,  "Invalid persona unique string for %@",  buf,  0xCu);
                    }
                  }
                }

                ++v49;
              }

              while (v49 != v47);
              uint64_t v47 = [v111 countByEnumeratingWithState:&v134 objects:v133 count:16];
            }

            while (v47);
          }

          __int128 v121 = 0u;
          __int128 v122 = 0u;
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          id v85 = v109;
          uint64_t v86 = [v85 countByEnumeratingWithState:&v119 objects:v118 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v120;
            do
            {
              for (uint64_t n = 0LL; n != v87; ++n)
              {
                if (*(void *)v120 != v88) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v90 = *(void *)(*((void *)&v119 + 1) + 8 * n);
                [v5 objectForKeyedSubscript:v90];
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v91)
                {
                  [MEMORY[0x189603FE0] set];
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  [v5 setObject:v91 forKeyedSubscript:v90];
                }

                [v91 addObject:v17];
              }

              uint64_t v87 = [v85 countByEnumeratingWithState:&v119 objects:v118 count:16];
            }

            while (v87);
          }

          uint64_t v92 = [v5 copy];
          lock_bundleToDataSeparatedIdentitiesMap = v105->_lock_bundleToDataSeparatedIdentitiesMap;
          v105->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v92;

          uint64_t v94 = [v6 copy];
          lock_personaUniqueStringToUserIdentityMap = v105->_lock_personaUniqueStringToUserIdentityMap;
          v105->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v94;

          uint64_t v96 = [v112 copy];
          lock_personaIDToUserIdentityMap = v105->_lock_personaIDToUserIdentityMap;
          v105->_lock_personaIDToUserIdentityMap = (NSDictionary *)v96;

          objc_storeStrong((id *)&v105->_lock_userIdentityForPersonalPersona, v17);
          lock_userIdentityForUnspecificPersona = v105->_lock_userIdentityForUnspecificPersona;
          v105->_lock_userIdentityForUnspecificPersona = (MCMUserIdentity *)log;
          os_log_t log = log;

          container_log_handle_for_category();
          v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v101 = v105->_lock_personaUniqueStringToUserIdentityMap;
            *(_DWORD *)buf = 138412290;
            *(void *)v144 = v101;
            _os_log_debug_impl(&dword_188846000, v99, OS_LOG_TYPE_DEBUG, "User identities locked in: %@", buf, 0xCu);
          }

          BOOL v20 = 1;
        }

        else
        {
          container_log_handle_for_category();
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v144 = v11;
            _os_log_fault_impl( &dword_188846000,  log,  OS_LOG_TYPE_FAULT,  "Invalid persona unique string for personal %@",  buf,  0xCu);
          }

          BOOL v20 = 0;
          uint64_t v17 = obj;
        }

        uint64_t v19 = (void *)v103;
        goto LABEL_116;
      }
    }

    uint64_t v8 = [obj countByEnumeratingWithState:&v146 objects:v145 count:16];
    if (v8) {
      continue;
    }
    break;
  }

- (void)_notifyObserversOfChangesWithUserIdentities:(id)a3 firstFetch:(BOOL)a4
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v36 = a3;
  context = (void *)MEMORY[0x1895CE3A8]();
  -[MCMUserIdentityCache observers](self, "observers");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[MCMUserIdentityCache observers](self, "observers");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 allObjects];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  __int128 v40 = (void *)[v36 mutableCopy];
  -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 minusSet:v9];

  -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 mutableCopy];

  __int128 v39 = (void *)v11;
  __int128 v12 = (void *)v11;
  id v13 = v36;
  [v12 minusSet:v36];
  if (!a4)
  {
    -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v14 count])
    {
      id v13 = v36;
      uint64_t v15 = [v36 count];

      if (!v15) {
        goto LABEL_6;
      }
      -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 addObject:v14];
    }

    id v13 = v36;
  }

- (NSMutableDictionary)lock_managedPathRegistryForUserIdentity
{
  return self->_lock_managedPathRegistryForUserIdentity;
}

- (NSMutableDictionary)lock_libraryRepairForUserIdentity
{
  return self->_lock_libraryRepairForUserIdentity;
}

- (NSSet)previousUserIdentities
{
  return self->_previousUserIdentities;
}

- (void)setPreviousUserIdentities:(id)a3
{
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (MCMUserIdentity)defaultUserIdentity
{
  return self->_defaultUserIdentity;
}

- (BOOL)cacheInvalid
{
  return self->_cacheInvalid;
}

- (void)setCacheInvalid:(BOOL)a3
{
  self->_cacheInvalid = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (unint64_t)savedGeneration
{
  return self->_savedGeneration;
}

- (void)setSavedGeneration:(unint64_t)a3
{
  self->_savedGeneratiouint64_t n = a3;
}

- (void).cxx_destruct
{
}

void __36__MCMUserIdentityCache__lock_resync__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void __60__MCMUserIdentityCache_personaUniqueStringForCurrentContext__block_invoke()
{
  v0 = -[MCMLRUCache initWithName:maxCount:]( objc_alloc(&OBJC_CLASS___MCMLRUCache),  "initWithName:maxCount:",  @"personaUniqueStrings",  10LL);
  v1 = (void *)personaUniqueStringForCurrentContext_dedupCache;
  personaUniqueStringForCurrentContext_dedupCache = (uint64_t)v0;
}

+ (id)defaultUserIdentity
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 defaultUserIdentity];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)personasAreSupported
{
  if (MCMPersonasAreSupported_onceToken != -1) {
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8246);
  }
  if (!MCMPersonasAreSupported_staticPersonasSupported) {
    return 0;
  }
  id v2 = containermanager_copy_global_configuration();
  BOOL v3 = [v2 dispositionForContainerClass:2] == 1;

  return v3;
}

+ (id)globalBundleUserIdentity
{
  if (globalBundleUserIdentity_onceToken != -1) {
    dispatch_once(&globalBundleUserIdentity_onceToken, &__block_literal_global_10333);
  }
  return (id)globalBundleUserIdentity_userIdentity;
}

+ (id)globalSystemUserIdentity
{
  if (globalSystemUserIdentity_onceToken != -1) {
    dispatch_once(&globalSystemUserIdentity_onceToken, &__block_literal_global_10);
  }
  return (id)globalSystemUserIdentity_userIdentity;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3
{
  return (id)[a1 userIdentityWithPersonaAttributes:a3 forceUnspecific:0];
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 forceUnspecific:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = containermanager_copy_global_configuration();
  [v7 defaultUser];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 userIdentityWithPersonaAttributes:v6 POSIXUser:v8 forceUnspecific:v4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 POSIXUser:(id)a4 forceUnspecific:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 UID];
  [v7 userPersonaUniqueString];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (uint64_t v9 = objc_msgSend(v7, "userPersona_id"), !objc_msgSend(v7, "isDataSeparatedPersona"))
    || ([v7 personaLayoutPathURL], (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    [v8 homeDirectoryURL];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (!MCMRequirePersona_result)
  {
    if (a5
      || ([v7 isPersonalPersona] & 1) == 0 && !objc_msgSend(v7, "isDataSeparatedPersona"))
    {
      goto LABEL_19;
    }

    if (([v7 isPersonalPersona] & 1) == 0)
    {
      uint64_t v12 = [v7 isDataSeparatedPersona];
      goto LABEL_20;
    }

    goto LABEL_16;
  }

  if (a5) {
    goto LABEL_19;
  }
  if ([v7 isPersonalPersona])
  {
LABEL_16:
    uint64_t v12 = 0LL;
    goto LABEL_20;
  }

  if ([v7 isDataSeparatedPersona])
  {
    uint64_t v12 = 1LL;
    goto LABEL_20;
  }

  if ([v7 isSystemPersona] & 1) != 0 || (objc_msgSend(v7, "isDefaultPersona"))
  {
LABEL_19:
    uint64_t v12 = 2LL;
    goto LABEL_20;
  }

  container_log_handle_for_category();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    uint64_t v17 = [v7 userPersonaType];
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl( &dword_188846000,  v15,  OS_LOG_TYPE_DEFAULT,  "Persona of unknown type %ld being treated as Unspecific: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v12 = 3LL;
LABEL_20:
  id v13 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( objc_alloc(&OBJC_CLASS___MCMUserIdentity),  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v8,  v11,  v10,  v12,  v9);

  return v13;
}

void __48__MCMUserIdentityCache_globalSystemUserIdentity__block_invoke()
{
  id v0 = containermanager_copy_global_configuration();
  [v0 systemContainerOwner];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_alloc(&OBJC_CLASS___MCMUserIdentity);
  [v5 homeDirectoryURL];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( v1,  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v5,  v2,  0,  3,  [v5 UID]);
  BOOL v4 = (void *)globalSystemUserIdentity_userIdentity;
  globalSystemUserIdentity_userIdentity = v3;
}

void __48__MCMUserIdentityCache_globalBundleUserIdentity__block_invoke()
{
  id v0 = containermanager_copy_global_configuration();
  [v0 bundleContainerOwner];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_alloc(&OBJC_CLASS___MCMUserIdentity);
  [v5 homeDirectoryURL];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( v1,  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v5,  v2,  0,  3,  [v5 UID]);
  BOOL v4 = (void *)globalBundleUserIdentity_userIdentity;
  globalBundleUserIdentity_userIdentity = v3;
}

@end