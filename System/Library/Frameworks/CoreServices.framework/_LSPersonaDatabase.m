@interface _LSPersonaDatabase
+ (id)sharedInstance;
- (id)_getPersonaAttributesRetryingIfNecessary;
- (id)getBundleIDToPersonasWithAttributesMap;
- (id)getPersonalPersonaUniqueString;
- (id)initPrivately;
- (id)personasWithAttributesForBundleIdentifier:(void *)a1;
- (id)personasWithAttributesForPersonaUniqueStrings:(void *)a3 error:;
- (id)personasWithType:(uint64_t)a1;
- (void)_getPersonaAttributesRetryingIfNecessary;
- (void)currentGeneration;
- (void)generationIsCurrent:(void *)result;
- (void)getCachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5;
- (void)getUncachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5;
- (void)initPrivately;
- (void)refreshFromUserManagementIfNecessary;
- (void)updatePersonasInDatabase;
@end

@implementation _LSPersonaDatabase

- (id)initPrivately
{
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    _LSDefaultLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[_LSPersonaDatabase initPrivately].cold.1(v3);
    }

    return 0LL;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS____LSPersonaDatabase;
    v5 = -[_LSPersonaDatabase init](&v10, sel_init);
    v4 = v5;
    if (v5)
    {
      cachedBundleIDToPersonasMap = v5->_cachedBundleIDToPersonasMap;
      *(void *)&v5->_ivarLock._os_unfair_lock_opaque = 0LL;
      v5->_cachedBundleIDToPersonasMap = 0LL;

      cachedSystemPersonaUniqueString = v4->_cachedSystemPersonaUniqueString;
      v4->_cachedSystemPersonaUniqueString = 0LL;

      v4->_userManagementGenerationNumber = 0LL;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v4,  (CFNotificationCallback)personaGenerationChangedCallback,  @"com.apple.mobile.usermanagerd.personageneration_changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

  return v4;
}

+ (id)sharedInstance
{
  if (+[_LSPersonaDatabase sharedInstance]::onceToken != -1) {
    dispatch_once(&+[_LSPersonaDatabase sharedInstance]::onceToken, &__block_literal_global_76);
  }
  return (id)+[_LSPersonaDatabase sharedInstance]::sharedInstance;
}

- (void)updatePersonasInDatabase
{
  v3 = (void *)os_transaction_create();
  v4 = (dispatch_queue_s *)_LSGetPersonaUpdateQueue(void)::queue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke;
  v6[3] = &unk_189D74BF8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (id)_getPersonaAttributesRetryingIfNecessary
{
  v2 = 0LL;
  id v3 = 0LL;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v4 = (void *)*MEMORY[0x189607688];
  uint64_t v5 = *MEMORY[0x189607490];
  int v6 = 10;
  do
  {

    [(id)getUMUserManagerClass() sharedManager];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = 0LL;
    [v7 listAllPersonaAttributesWithError:&v25];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v25;

    if ([v8 count]) {
      break;
    }
    if (v3)
    {
      _LSDefaultLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v3;
        _os_log_error_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_ERROR,  "error getting persona attributes list: %@",  buf,  0xCu);
      }
    }

    else
    {
      _LSDefaultLog();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        _os_log_error_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_ERROR,  "UM returned empty array or nil (%@) but not an error!?",  buf,  0xCu);
      }

      uint64_t v26 = v5;
      v27 = @"placeholder for missing error; file a bug";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(v4, 5LL, (uint64_t)"-[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary]", 273LL, v9);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    usleep(0x186A0u);
    v2 = v8;
    --v6;
  }

  while (v6);
  if (!v8)
  {
    _LSDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary].cold.1( (uint64_t)v3,  v11,  v18,  v19,  v20,  v21,  v22,  v23);
    }
    goto LABEL_16;
  }

  if (![v8 count])
  {
    _LSDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary].cold.2( (uint64_t)v3,  v11,  v12,  v13,  v14,  v15,  v16,  v17);
    }
LABEL_16:
  }

  return v8;
}

- (void)getUncachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  v24 = a5;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  _LSDefaultLog();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "Fetching persona data from usermanager.", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary](self, "_getPersonaAttributesRetryingIfNecessary");
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    id v27 = 0LL;
    id v29 = 0LL;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v31 = v9;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v10;
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        objc_msgSend(v11, "userPersonaUniqueString", v24);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if ([v11 isSystemPersona])
          {
            id v13 = v12;

            uint64_t v33 = 3LL;
            id v29 = v13;
          }

          else
          {
            if ([v11 isPersonalPersona])
            {
              id v14 = v12;

              id v27 = v14;
              uint64_t v15 = 1LL;
            }

            else
            {
              int v16 = [v11 isEnterprisePersona];
              uint64_t v15 = 2LL;
              if (!v16) {
                uint64_t v15 = 0LL;
              }
            }

            uint64_t v33 = v15;
          }

          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          [v11 userPersonaBundleIDList];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v35;
            do
            {
              for (uint64_t i = 0LL; i != v18; ++i)
              {
                if (*(void *)v35 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                [v8 objectForKeyedSubscript:v21];
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v22)
                {
                  uint64_t v22 = (void *)objc_opt_new();
                  [v8 setObject:v22 forKeyedSubscript:v21];
                }

                [v7 objectForKey:v12];
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v23)
                {
                  uint64_t v23 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  v33,  v12);
                  [v7 setObject:v23 forKey:v12];
                }

                [v22 addObject:v23];
              }

              uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }

            while (v18);
          }
        }

        uint64_t v10 = v32 + 1;
      }

      while (v32 + 1 != v31);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v9);
  }

  else
  {
    id v27 = 0LL;
    id v29 = 0LL;
  }

  if (a3) {
    objc_storeStrong(a3, v8);
  }
  if (a4) {
    objc_storeStrong(a4, v29);
  }
  if (v24) {
    objc_storeStrong(v24, v27);
  }
}

- (void)refreshFromUserManagementIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = 0LL;
  unint64_t v4 = [v3 personaGenerationIdentifierWithError:&v10];
  id v5 = v10;

  if (self->_userManagementGenerationNumber != v4)
  {
    self->_userManagementGenerationNumber = v4;
    _LSDefaultLog();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "Persona list did update.", v9, 2u);
    }

    os_unfair_lock_lock(&self->_ivarLock);
    cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap;
    self->_cachedBundleIDToPersonasMap = 0LL;

    cachedSystemPersonaUniqueString = self->_cachedSystemPersonaUniqueString;
    self->_cachedSystemPersonaUniqueString = 0LL;

    os_unfair_lock_unlock(&self->_ivarLock);
    -[_LSPersonaDatabase updatePersonasInDatabase](self, "updatePersonasInDatabase");
  }
}

- (void)getCachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  id v13 = 0LL;
  id obj = 0LL;
  id v12 = 0LL;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_userManagementGenerationNumber
    && (cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap) != 0LL)
  {
    id obj = cachedBundleIDToPersonasMap;
    id v13 = self->_cachedSystemPersonaUniqueString;
    id v12 = self->_cachedPersonalPersonaUniqueString;
    p_ivarLock = &self->_ivarLock;
  }

  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
    os_unfair_lock_lock(&self->_uncachedCalloutLock);
    -[_LSPersonaDatabase getUncachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:]( self,  "getUncachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:",  &obj,  &v13,  &v12);
    os_unfair_lock_lock(&self->_ivarLock);
    if (self->_userManagementGenerationNumber)
    {
      objc_storeStrong((id *)&self->_cachedBundleIDToPersonasMap, obj);
      objc_storeStrong((id *)&self->_cachedSystemPersonaUniqueString, v13);
      objc_storeStrong((id *)&self->_cachedPersonalPersonaUniqueString, v12);
    }

    os_unfair_lock_unlock(&self->_ivarLock);
    p_ivarLock = &self->_uncachedCalloutLock;
  }

  os_unfair_lock_unlock(p_ivarLock);
  if (a3) {
    objc_storeStrong(a3, obj);
  }
  if (a4) {
    objc_storeStrong(a4, v13);
  }
  id v11 = v12;
  if (a5)
  {
    objc_storeStrong(a5, v12);
    id v11 = v12;
  }
}

- (id)getBundleIDToPersonasWithAttributesMap
{
  id v5 = 0LL;
  -[_LSPersonaDatabase getCachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:]( self,  "getCachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:",  &v5,  0LL,  0LL);
  id v3 = v5;

  return v3;
}

- (id)getPersonalPersonaUniqueString
{
  if (!a1) {
    return 0LL;
  }
  id v3 = 0LL;
  [a1 getCachedBundleIDToPersonasWithAttributesMap:0 systemPersonaUniqueString:0 personalPersonaUniqueString:&v3];
  id v1 = v3;

  return v1;
}

- (id)personasWithAttributesForBundleIdentifier:(void *)a1
{
  v9[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0
      || ([(id)__LSDefaultsGetSharedInstance() isUsingEphemeralStorage] & 1) != 0)
    {
      unint64_t v4 = (void *)MEMORY[0x189604A58];
    }

    else
    {
      [a1 getBundleIDToPersonasWithAttributesMap];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 objectForKeyedSubscript:v3];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[_LSPersonaDatabase getPersonalPersonaUniqueString](a1);
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          id v8 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  1LL,  v7);
          v9[0] = v8;
          [MEMORY[0x189603F18] arrayWithObjects:v9 count:1];
          unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          if (-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once != -1) {
            dispatch_once( &-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once,  &__block_literal_global_60);
          }
          unint64_t v4 = (void *)MEMORY[0x189604A58];
        }
      }
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (id)personasWithAttributesForPersonaUniqueStrings:(void *)a3 error:
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v31 = a2;
  if (a1)
  {
    [(id)getUMUserManagerClass() sharedManager];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 listAllPersonaWithAttributes];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v7 = v29;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v11 userPersonaType] != 4)
          {
            [v11 userPersonaUniqueString];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              [v11 userPersonaUniqueString];
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              id v14 = v13;
              if (!v13)
              {
                [MEMORY[0x189603FE8] null];
                id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                id v14 = v3;
              }

              [v6 setObject:v11 forKey:v14];
              if (!v13) {
            }
              }

            else
            {
              _LSDefaultLog();
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                int v15 = [v11 userPersonaType];
                *(_DWORD *)buf = 67109120;
                int v45 = v15;
                _os_log_error_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_ERROR,  "persona with type %d did not have a persona unique string, ignoring!",  buf,  8u);
              }
            }
          }
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }

      while (v8);
    }

    id v16 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v31;
    uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0LL; j != v17; ++j)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          [v6 objectForKey:v20];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = v21;
          if (!v21)
          {

            [NSString stringWithFormat:@"no known persona with unique string %@", v20];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v41 = *MEMORY[0x189607490];
            v42 = v26;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            id v27 = (void *)objc_claimAutoreleasedReturnValue();
            _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  2LL,  (uint64_t)"-[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]",  488LL,  v27);
            id v25 = (void *)objc_claimAutoreleasedReturnValue();

            id v16 = 0LL;
            goto LABEL_28;
          }

          uint64_t v23 = LSPersonaTypeForPersonaAttributes(v21);
          v24 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  v23,  v20);
          [v16 addObject:v24];
        }

        uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v25 = 0LL;
LABEL_28:

    if (a3 && !v16) {
      *a3 = v25;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (void)generationIsCurrent:(void *)result
{
  if (result)
  {
    id v3 = result;
    [result refreshFromUserManagementIfNecessary];
    if (a2) {
      return (void *)(v3[5] == a2);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)currentGeneration
{
  if (result)
  {
    id v1 = result;
    [result refreshFromUserManagementIfNecessary];
    return (void *)v1[5];
  }

  return result;
}

- (id)personasWithType:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
  [(id)getUMUserManagerClass() sharedManager];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 listAllPersonaWithAttributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (LSPersonaTypeForPersonaAttributes(v10) == a2)
        {
          id v11 = objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes);
          objc_msgSend(v10, "userPersonaUniqueString", (void)v15);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v11, a2, v12);
          [v3 addObject:v13];
        }
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)initPrivately
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "lightweight system server does not support keybagd; bailing",
    v1,
    2u);
}

- (void)_getPersonaAttributesRetryingIfNecessary
{
}

@end