@interface LSPersonaDatabase
@end

@implementation LSPersonaDatabase

void __36___LSPersonaDatabase_sharedInstance__block_invoke()
{
  id v0 = -[_LSPersonaDatabase initPrivately](objc_alloc(&OBJC_CLASS____LSPersonaDatabase), "initPrivately");
  v1 = (void *)+[_LSPersonaDatabase sharedInstance]::sharedInstance;
  +[_LSPersonaDatabase sharedInstance]::sharedInstance = (uint64_t)v0;
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke(uint64_t a1)
{
  id v16 = 0LL;
  id v17 = 0LL;
  id v15 = 0LL;
  [*(id *)(a1 + 32) getCachedBundleIDToPersonasWithAttributesMap:&v17 systemPersonaUniqueString:&v16 personalPersonaUniqueString:&v15];
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  +[LSDBExecutionContext sharedServerInstance]();
  v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_2;
  v11[3] = &unk_189D7A1B8;
  id v12 = v17;
  id v13 = v15;
  id v5 = v2;
  id v14 = v5;
  -[LSDBExecutionContext syncRead:](v3, v11);
  v6 = +[LSDBExecutionContext sharedServerInstance]();
  v8[0] = v4;
  v8[1] = 3221225472LL;
  v8[2] = __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_55;
  v8[3] = &unk_189D7A1E0;
  id v7 = v5;
  id v9 = v7;
  id v10 = *(id *)(a1 + 40);
  -[LSDBExecutionContext syncWrite:]((uint64_t)v6, v8);
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v53 = a2;
  id v54 = a3;
  _LSDatabaseSentinelIncrement();
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  +[LSApplicationRecord enumeratorWithOptions:](&OBJC_CLASS___LSApplicationRecord, "enumeratorWithOptions:", 0LL);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v4)
  {
    uint64_t v57 = *(void *)v84;
    do
    {
      uint64_t v5 = 0LL;
      uint64_t v58 = v4;
      do
      {
        if (*(void *)v84 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v5;
        v6 = *(void **)(*((void *)&v83 + 1) + 8 * v5);
        context = (void *)MEMORY[0x186E2A59C]();
        [v6 bundleIdentifier];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        id v7 = objc_alloc(MEMORY[0x189604010]);
        [v6 associatedPersonas];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)[v7 initWithArray:v8];

        id v9 = objc_alloc(MEMORY[0x189604010]);
        uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v63];
        v11 = (void *)v10;
        if (v10) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = MEMORY[0x189604A58];
        }
        id v13 = (void *)[v9 initWithArray:v12];

        if (![v13 count])
        {
          id v14 = (void *)MEMORY[0x189604010];
          id v15 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  1LL,  *(void **)(a1 + 40));
          uint64_t v16 = [v14 setWithObject:v15];

          id v13 = (void *)v16;
        }

        id v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v13, "count"));
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id v18 = v13;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v80;
          do
          {
            for (uint64_t i = 0LL; i != v19; ++i)
            {
              if (*(void *)v80 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              if (v22) {
                v22 = (void *)v22[1];
              }
              v23 = v22;
              [v17 addObject:v23];
            }

            uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v88 count:16];
          }

          while (v19);
        }

        if (([v62 isEqual:v17] & 1) == 0)
        {
          [v6 applicationExtensionRecords];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 allObjects];
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          __p = 0LL;
          v77 = 0LL;
          v78 = 0LL;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          id v26 = v25;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v87 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v73;
            do
            {
              for (uint64_t j = 0LL; j != v27; ++j)
              {
                if (*(void *)v73 != v28) {
                  objc_enumerationMutation(v26);
                }
                int v30 = [*(id *)(*((void *)&v72 + 1) + 8 * j) unitID];
                int v31 = v30;
                v32 = v77;
                if (v77 >= v78)
                {
                  v34 = (char *)__p;
                  uint64_t v35 = (v77 - (_BYTE *)__p) >> 2;
                  unint64_t v36 = v35 + 1;
                  uint64_t v37 = v78 - (_BYTE *)__p;
                  if ((v78 - (_BYTE *)__p) >> 1 > v36) {
                    unint64_t v36 = v37 >> 1;
                  }
                  else {
                    unint64_t v38 = v36;
                  }
                  if (v38)
                  {
                    v39 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>( (uint64_t)&v78,  v38);
                    v34 = (char *)__p;
                    v32 = v77;
                  }

                  else
                  {
                    v39 = 0LL;
                  }

                  v40 = &v39[4 * v35];
                  *(_DWORD *)v40 = v31;
                  v33 = v40 + 4;
                  while (v32 != v34)
                  {
                    int v41 = *((_DWORD *)v32 - 1);
                    v32 -= 4;
                    *((_DWORD *)v40 - 1) = v41;
                    v40 -= 4;
                  }

                  __p = v40;
                  v77 = v33;
                  v78 = &v39[4 * v38];
                  if (v34) {
                    operator delete(v34);
                  }
                }

                else
                {
                  *(_DWORD *)v77 = v30;
                  v33 = v32 + 4;
                }

                v77 = v33;
              }

              uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v87 count:16];
            }

            while (v27);
          }
          v42 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
          [v42 detachAndSendNotification:@"com.apple.LaunchServices.pluginswillberemoved" forApplicationExtensionRecords:v26];

          v43 = *(void **)(a1 + 48);
          v64[0] = MEMORY[0x1895F87A8];
          v64[1] = 3321888768LL;
          v64[2] = __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3;
          v64[3] = &unk_189D7A180;
          id v65 = v63;
          id v66 = v18;
          id v67 = v17;
          id v44 = v26;
          v45 = v44;
          id v68 = v44;
          __dst = 0LL;
          uint64_t v71 = 0LL;
          v69 = 0LL;
          v46 = __p;
          uint64_t v47 = v77 - (_BYTE *)__p;
          if (v77 != __p)
          {
            id v56 = v44;
            v48 = v43;
            size_t v49 = v77 - (_BYTE *)__p;
            uint64_t v50 = v47 >> 2;
            std::vector<unsigned int>::__vallocate[abi:nn180100](&v69, v47 >> 2);
            v51 = (char *)__dst;
            memmove(__dst, v46, v49);
            __dst = &v51[4 * v50];
            v43 = v48;
            v45 = v56;
          }

          v52 = (void *)MEMORY[0x186E2A7B8](v64);
          [v43 addObject:v52];

          if (v69)
          {
            __dst = v69;
            operator delete(v69);
          }

          if (__p)
          {
            v77 = (char *)__p;
            operator delete(__p);
          }
        }

        objc_autoreleasePoolPop(context);
        uint64_t v5 = v61 + 1;
      }

      while (v61 + 1 != v58);
      uint64_t v4 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
    }

    while (v4);
  }
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3(uint64_t *a1)
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v2 = a1 + 4;
  v3 = -[LSBundleRecordUpdater initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___LSBundleRecordUpdater),  "initWithBundleIdentifier:",  a1[4]);
  uint64_t v4 = a1[5];
  id v27 = 0LL;
  BOOL v5 = -[LSBundleRecordUpdater parsePersonas:error:](v3, "parsePersonas:error:", v4, &v27);
  id v6 = v27;
  id v7 = v6;
  if (v5)
  {
    id v26 = v6;
    BOOL v8 = -[LSBundleRecordUpdater updateBundleRecord:](v3, "updateBundleRecord:", &v26);
    id v9 = v26;

    if (v8)
    {
      _LSInstallLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[4];
        uint64_t v12 = a1[6];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_DEFAULT,  "Successfully updated personas for %@ to %@, sending notification",  buf,  0x16u);
      }

      +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:a1[7]];

      +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  *v2);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 detach];
      +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v14;
      [MEMORY[0x189603F18] arrayWithObjects:v32 count:1];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 sendNotification:7 forAppProxies:v16 Plugins:1 completion:0];

      +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = v14;
      [MEMORY[0x189603F18] arrayWithObjects:&v31 count:1];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 sendNotification:14 forAppProxies:v18 Plugins:1 completion:0];

      id v30 = 0LL;
      memset(buf, 0, 17);
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)buf, v19, 0LL);

      if (v20)
      {
        +[LSApplicationExtensionRecord appexRecordsForUnitIDsWithContext:unitIDs:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "appexRecordsForUnitIDsWithContext:unitIDs:",  v20,  a1 + 8);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v22 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
        [v22 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v21];
      }

      else
      {
        _LSInstallLog();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LaunchServices::Database::Context::error((id *)buf);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3_cold_1(v23, v28, v21);
        }
      }

      if (*(void *)buf && buf[16]) {
        _LSContextDestroy(*(void ***)buf);
      }
      v24 = *(void **)&buf[8];
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;

      buf[16] = 0;
      id v25 = v30;
      id v30 = 0LL;

      goto LABEL_16;
    }
  }

  else
  {
    id v9 = v6;
  }

  _LSInstallLog();
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
    __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3_cold_2(a1 + 4, (uint64_t)v9, (os_log_t)v14);
  }
LABEL_16:
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_55(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  _LSDatabaseSentinelDecrement();
  if ([*(id *)(a1 + 32) count])
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16LL))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
          ++v5;
        }

        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }

      while (v3);
    }

    _LSArmSaveTimer(1);
  }

  else
  {
    _LSDatabaseSentinelFlush();
  }

void __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke_cold_1(v0);
  }
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3_cold_1( void *a1,  uint8_t *buf,  os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Can't send did-install notifications for plugins! %@",  buf,  0xCu);
}

void __46___LSPersonaDatabase_updatePersonasInDatabase__block_invoke_3_cold_2( uint64_t *a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Could not update personas for %@: %@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1();
}

void __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "Could not get personal persona unique string! This will result in bogus persona assocations! Please file a radar aga inst CoreServices. This will only fault once per lifetime of this process.",  v1,  2u);
}

@end