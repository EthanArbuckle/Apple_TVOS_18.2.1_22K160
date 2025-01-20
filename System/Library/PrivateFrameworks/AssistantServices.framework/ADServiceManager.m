@interface ADServiceManager
+ (BOOL)isReloadServiceNotification:(id)a3;
+ (id)_serviceBundleIDFromServiceReloadNotification:(id)a3;
- (ADServiceManager)init;
- (ADServiceManager)initWithInstanceContext:(id)a3;
- (id)_buildFliteredInfoDictionaryFromBundleURL:(id)a3;
- (id)_bundleServicesCache;
- (id)_bundleServicesCache:(BOOL *)a3;
- (id)_commandMap;
- (id)_generatedBundleServicesCache;
- (id)_pendingServiceReloadNotifications;
- (id)_serviceMap;
- (id)_syncKeyMap;
- (id)allServices;
- (id)allSyncAnchorKeys;
- (id)allVocabSyncInfo;
- (id)controlCenterLockRestrictedCommands;
- (id)firstUnlockRestrictedCommands;
- (id)lockRestrictedCommands;
- (id)serviceForDomain:(id)a3 command:(id)a4;
- (id)serviceForIdentifier:(id)a3;
- (id)serviceForSyncAnchorKey:(id)a3;
- (id)servicesThatRequireBootMaintenance;
- (void)_addService:(id)a3 precedence:(int64_t)a4;
- (void)_addServiceWithRecord:(id)a3;
- (void)_loadServiceFromBundlePath:(id)a3 infoDictionary:(id)a4;
- (void)_loadServicesIfNeeded;
- (void)_reloadServices:(id)a3;
- (void)_removeService:(id)a3;
- (void)_reprioritizeService:(id)a3;
- (void)_writeBundleServicesCache:(id)a3 toPath:(id)a4;
- (void)addService:(id)a3;
- (void)addServiceWithLowPrecedence:(id)a3;
- (void)cancelOperationsForRequest:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)pendServiceReloadNotification:(id)a3;
- (void)preheatBundleServices;
- (void)preheatServicesForDomain:(id)a3;
- (void)reloadServiceForNotification:(id)a3;
- (void)reloadServicesForAllPendingServiceNotifications;
- (void)removeService:(id)a3;
- (void)reprioritizeService:(id)a3;
- (void)setCommandCenterClient:(id)a3;
@end

@implementation ADServiceManager

- (ADServiceManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADServiceManager;
  v5 = -[ADServiceManager init](&v15, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceMap = v5->_serviceMap;
    v5->_serviceMap = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    commandMap = v5->_commandMap;
    v5->_commandMap = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    syncKeyMap = v5->_syncKeyMap;
    v5->_syncKeyMap = v10;

    if (v4) {
      v12 = (AFInstanceContext *)v4;
    }
    else {
      v12 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v12;
  }

  return v5;
}

- (ADServiceManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
  id v4 = -[ADServiceManager initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (void)_addServiceWithRecord:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_serviceMap, "objectForKey:", v7));

    if (v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v32 handleFailureInMethod:a2, self, @"ADServiceManager.m", 93, @"Shouldn't already have a service with identifier %@", v7 object file lineNumber description];
    }

    v33 = v7;
    -[NSMutableDictionary setObject:forKey:](self->_serviceMap, "setObject:forKey:", v6, v7);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v6 domains]);
    id v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v38)
    {
      uint64_t v35 = *(void *)v52;
      v36 = self;
      v37 = v6;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v9;
          uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v6 commandsForDomain:v10]);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_commandMap, "objectForKey:", v10));
          v13 = (NSMutableDictionary *)[v12 mutableCopy];

          if (!v13)
          {
            v13 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v11 count]);
            -[NSMutableDictionary setObject:forKey:](self->_commandMap, "setObject:forKey:", v13, v10);
          }

          uint64_t v39 = v10;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id v41 = v11;
          id v14 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v42 = *(void *)v48;
            do
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v48 != v42) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
                v18 = -[AFLinkedListItem initWithObject:]( objc_alloc(&OBJC_CLASS___AFLinkedListItem),  "initWithObject:",  v5);
                v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v17));
                v20 = (void *)objc_claimAutoreleasedReturnValue([v19 object]);
                unsigned __int8 v21 = [v5 hasEqualOrHigherPrecedenceThanServiceRecord:v20];

                if ((v21 & 1) != 0)
                {
                  id v22 = 0LL;
                }

                else
                {
                  v23 = 0LL;
                  do
                  {
                    id v22 = v19;

                    v19 = (void *)objc_claimAutoreleasedReturnValue([v22 nextItem]);
                    v24 = (void *)objc_claimAutoreleasedReturnValue([v19 object]);
                    unsigned __int8 v25 = [v5 hasEqualOrHigherPrecedenceThanServiceRecord:v24];

                    v23 = v22;
                  }

                  while ((v25 & 1) == 0);
                }

                if (v19) {
                  -[AFLinkedListItem insertBeforeItem:](v18, "insertBeforeItem:", v19);
                }
                else {
                  -[AFLinkedListItem insertAfterItem:](v18, "insertAfterItem:", v22);
                }
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem previousItem](v18, "previousItem"));

                if (!v26) {
                  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v18, v17);
                }
              }

              id v15 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }

            while (v15);
          }

          self = v36;
          -[NSMutableDictionary setObject:forKey:](v36->_commandMap, "setObject:forKey:", v13, v39);

          uint64_t v9 = v40 + 1;
          v6 = v37;
        }

        while ((id)(v40 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }

      while (v38);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 syncKeys]);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
    v7 = v33;
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v44;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v27);
          }
          -[NSMutableDictionary setObject:forKey:]( self->_syncKeyMap,  "setObject:forKey:",  v6,  *(void *)(*((void *)&v43 + 1) + 8LL * (void)j));
        }

        id v29 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }

      while (v29);
    }
  }
}

- (void)_addService:(id)a3 precedence:(int64_t)a4
{
  id v6 = a3;
  v7 = -[ADServiceRecord initWithService:precedence:]( objc_alloc(&OBJC_CLASS___ADServiceRecord),  "initWithService:precedence:",  v6,  a4);

  -[ADServiceManager _addServiceWithRecord:](self, "_addServiceWithRecord:", v7);
}

- (void)_removeService:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v53 = "-[ADServiceManager _removeService:]";
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  serviceMap = self->_serviceMap;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[NSMutableDictionary removeObjectForKey:](serviceMap, "removeObjectForKey:", v7);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 domains]);
  id v34 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v46;
    v33 = self;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v8;
        uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 commandsForDomain:v9]);
        uint64_t v35 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_commandMap, "objectForKey:", v9));
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v42;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v17]);
              while (1)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([v18 object]);
                id v20 = (id)objc_claimAutoreleasedReturnValue([v19 service]);

                if (v20 == v4) {
                  break;
                }
                uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 nextItem]);

                v18 = (void *)v21;
                if (!v21) {
                  goto LABEL_22;
                }
              }

              id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 previousItem]);
              v23 = (void *)objc_claimAutoreleasedReturnValue([v18 nextItem]);
              [v18 removeFromList];
              if (!v22)
              {
                if (v23) {
                  [v11 setObject:v23 forKey:v17];
                }
                else {
                  [v11 removeObjectForKey:v17];
                }
              }

LABEL_22:
              ;
            }

            id v14 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }

          while (v14);
        }

        self = v33;
        if (![v11 count]) {
          -[NSMutableDictionary removeObjectForKey:](v33->_commandMap, "removeObjectForKey:", v35);
        }

        uint64_t v8 = v36 + 1;
      }

      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }

    while (v34);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 syncKeys]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
        id v30 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_syncKeyMap, "objectForKey:", v29));

        if (v30 == v4) {
          -[NSMutableDictionary removeObjectForKey:](self->_syncKeyMap, "removeObjectForKey:", v29);
        }
      }

      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }

    while (v26);
  }
}

- (void)_reprioritizeService:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v42 = "-[ADServiceManager _reprioritizeService:]";
    __int16 v43 = 2112;
    id v44 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 domains]);
  id v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        uint64_t v6 = *(void *)(*((void *)&v35 + 1) + 8 * v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue([v3 commandsForDomain:v6]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_commandMap, "objectForKey:", v6));
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v28 = v7;
        id v8 = [v28 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v29 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v32 != v29) {
                objc_enumerationMutation(v28);
              }
              uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
              id v12 = (id)objc_claimAutoreleasedReturnValue([v30 objectForKey:v11]);
              id v13 = v12;
              while (1)
              {
                id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 object]);
                id v15 = [v14 precedence];
                v16 = (void *)objc_claimAutoreleasedReturnValue([v12 object]);
                id v17 = [v16 precedence];

                if (v15 != v17)
                {
                  id v18 = v12;

                  id v13 = v18;
                }

                v19 = (void *)objc_claimAutoreleasedReturnValue([v12 object]);
                id v20 = (id)objc_claimAutoreleasedReturnValue([v19 service]);

                if (v20 == v3) {
                  break;
                }
                uint64_t v21 = objc_claimAutoreleasedReturnValue([v12 nextItem]);

                id v12 = (id)v21;
                if (!v21) {
                  goto LABEL_23;
                }
              }

              if (v12 == v13)
              {
                id v13 = v12;
              }

              else
              {
                [v12 removeFromList];
                [v12 insertBeforeItem:v13];
                id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 previousItem]);

                if (!v22) {
                  [v30 setObject:v12 forKey:v11];
                }
              }

- (id)_buildFliteredInfoDictionaryFromBundleURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADBundleService requiredInfoDictionaryKeys]( &OBJC_CLASS___ADBundleService,  "requiredInfoDictionaryKeys"));
  id v5 = [v4 count];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  unsigned int v7 = [v6 isEqualToString:@"assistantBundle"];

  if (v7)
  {
    id v8 = -[NSBundle initWithURL:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithURL:", v3);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSBundle bundlePath](v8, "bundlePath"));
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      id v22 = (void *)v9;
      v23 = v8;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle infoDictionary](v8, "infoDictionary"));
      id v12 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v5);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v13 = v4;
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v18]);
            -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v19, v18);
          }

          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v15);
      }

      uint64_t v10 = v22;
      id v8 = v23;
    }

    else
    {
      id v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v30 = "-[ADServiceManager _buildFliteredInfoDictionaryFromBundleURL:]";
        __int16 v31 = 2114;
        id v32 = v3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Couldn't create bundle at URL %{public}@",  buf,  0x16u);
      }

      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)_generatedBundleServicesCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = AFServicePluginsURL();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v25 = 0LL;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:&v25]);
  id v20 = v25;

  id v8 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  (char *)[v7 count] + 1);
  uint64_t v9 = AFBuildVersion();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"Build");
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager _buildFliteredInfoDictionaryFromBundleURL:]( self,  "_buildFliteredInfoDictionaryFromBundleURL:",  v16));
        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, v18);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v13);
  }

  return v8;
}

- (void)_writeBundleServicesCache:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v15 = 0LL;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v15));
  id v8 = v15;
  uint64_t v9 = v8;
  if (v7)
  {
    id v14 = v8;
    unsigned __int8 v10 = [v7 writeToFile:v6 options:1 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v17 = "-[ADServiceManager _writeBundleServicesCache:toPath:]";
        __int16 v18 = 2114;
        id v19 = v6;
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Can't write to %{public}@: %{public}@",  buf,  0x20u);
      }
    }

    uint64_t v9 = v11;
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = "-[ADServiceManager _writeBundleServicesCache:toPath:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Can't serialize %@: %{public}@",  buf,  0x20u);
    }
  }
}

- (id)_bundleServicesCache:(BOOL *)a3
{
  uint64_t v5 = AFBundleServicesCachePath(self, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v6);
  uint64_t v8 = AFBuildVersion();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"Build"));
  if (([v9 isEqualToString:v10] & 1) == 0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      id v14 = "-[ADServiceManager _bundleServicesCache:]";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s regenerating bundle service cache due to version mismatch %@ %@",  (uint8_t *)&v13,  0x20u);
    }

    goto LABEL_7;
  }

  if (!v7)
  {
LABEL_7:
    unsigned int v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[ADServiceManager _generatedBundleServicesCache]( self,  "_generatedBundleServicesCache"));
    -[ADServiceManager _writeBundleServicesCache:toPath:](self, "_writeBundleServicesCache:toPath:", v7, v6);
    *a3 = 1;
  }

  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", @"Build");

  return v7;
}

- (id)_bundleServicesCache
{
  return (id)objc_claimAutoreleasedReturnValue(-[ADServiceManager _bundleServicesCache:](self, "_bundleServicesCache:", &v3));
}

- (void)_loadServiceFromBundlePath:(id)a3 infoDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___ADBundleService);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCFBundleIdentifierKey]);
  id v10 = [[v8 alloc] initWithBundlePath:v7 infoDictionary:v6 instanceContext:self->_instanceContext];

  -[ADServiceManager _addService:precedence:](self, "_addService:precedence:", v10, 1LL);
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    int v13 = "-[ADServiceManager _loadServiceFromBundlePath:infoDictionary:]";
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Service loaded: %{public}@",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)_loadServicesIfNeeded
{
  if (!self->_bundleServicesLoaded)
  {
    char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _bundleServicesCache](self, "_bundleServicesCache"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000B0A50;
    v4[3] = &unk_1004F43F0;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];

    self->_bundleServicesLoaded = 1;
  }

- (id)_serviceMap
{
  return self->_serviceMap;
}

- (id)_commandMap
{
  return self->_commandMap;
}

- (id)_syncKeyMap
{
  return self->_syncKeyMap;
}

- (id)_pendingServiceReloadNotifications
{
  pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
  if (!pendingServiceReloadNotifications)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v5 = self->_pendingServiceReloadNotifications;
    self->_pendingServiceReloadNotifications = v4;

    pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
  }

  return pendingServiceReloadNotifications;
}

- (id)allServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _serviceMap](self, "_serviceMap"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return v3;
}

- (id)servicesThatRequireBootMaintenance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _serviceMap](self, "_serviceMap"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexesOfObjectsPassingTest:&stru_1004EFF30]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsAtIndexes:v4]);

  return v5;
}

- (id)serviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _serviceMap](self, "_serviceMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
}

- (id)serviceForDomain:(id)a3 command:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _commandMap](self, "_commandMap"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);
  }
  int v12 = v11;

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 object]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);

  return v14;
}

- (id)serviceForSyncAnchorKey:(id)a3
{
  id v4 = a3;
  if (!v4
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _syncKeyMap](self, "_syncKeyMap")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]),
        v5,
        !v6)
    && (![v4 isEqualToString:@"com.apple.siri.vocabularyupdates"]
     || (id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager serviceForIdentifier:]( self,  "serviceForIdentifier:",  @"com.apple.siri.SynapseSyncPlugin"))) == 0LL))
  {
    uint64_t v9 = 0LL;
    goto LABEL_24;
  }

  id v7 = v4;
  if (qword_100578450 != -1) {
    dispatch_once(&qword_100578450, &stru_1004FA990);
  }
  unsigned int v8 = [(id)qword_100578448 containsObject:v7];

  if (!v8)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    id v13 = [v12 assistantIsEnabled];
    if ((v13 & 1) != 0)
    {
    }

    else
    {
      if ((AFSupportsRemoraHost(v13, v14) & 1) != 0)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
        unsigned __int8 v16 = [v15 remoraHostEnabled];

        if ((v16 & 1) != 0) {
          goto LABEL_23;
        }
      }

      else
      {
      }

      id v17 = v7;
      if (qword_100578460 != -1) {
        dispatch_once(&qword_100578460, &stru_1004FA9B0);
      }
      unsigned int v18 = [(id)qword_100578458 containsObject:v17];

      if (v18)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager serviceForIdentifier:]( self,  "serviceForIdentifier:",  @"com.apple.siri.sync.DisabledSyncDataToBeDeleted"));

        id v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        int v20 = 136315650;
        id v21 = "-[ADServiceManager serviceForSyncAnchorKey:]";
        __int16 v22 = 2112;
        __int128 v23 = v9;
        __int16 v24 = 2112;
        id v25 = v17;
        id v11 = "%s Substituting %@ service for %@";
        goto LABEL_8;
      }
    }

- (void)addService:(id)a3
{
}

- (void)addServiceWithLowPrecedence:(id)a3
{
}

- (void)removeService:(id)a3
{
}

- (void)reprioritizeService:(id)a3
{
}

- (id)allSyncAnchorKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _syncKeyMap](self, "_syncKeyMap"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return v3;
}

- (id)allVocabSyncInfo
{
  char v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager serviceForIdentifier:]( self,  "serviceForIdentifier:",  @"com.apple.siri.SynapseSyncPlugin"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 customVocabSyncInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncSnapshot sharedInstance](&OBJC_CLASS___ADSyncSnapshot, "sharedInstance"));
  [v6 pruneCacheWithCurrentSynapseInfo:v5];

  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);
  return v3;
}

- (id)firstUnlockRestrictedCommands
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager allServices](self, "allServices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) firstUnlockRestrictedCommands]);
        [v3 addObjectsFromArray:v9];

        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)lockRestrictedCommands
{
  char v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager allServices](self, "allServices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) lockRestrictedCommands]);
        if (v9) {
          -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);
        }

        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)setCommandCenterClient:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[ADServiceManager serviceForIdentifier:]( self,  "serviceForIdentifier:",  @"ADExtensionServiceIdentifier"));
  [v5 setCommandCenterClient:v4];
}

- (void)preheatServicesForDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _commandMap](self, "_commandMap"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
    unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "object", (void)v16));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);

          if ((-[NSMutableSet containsObject:](v8, "containsObject:", v15) & 1) == 0)
          {
            [v15 preheatDomain:v4];
            -[NSMutableSet addObject:](v8, "addObject:", v15);
          }

          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v11);
    }
  }
}

- (void)preheatBundleServices
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_serviceMap, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)v6);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___ADBundleService);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
          [v7 preheatDomain:0];
        }
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

- (id)controlCenterLockRestrictedCommands
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager allServices](self, "allServices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) controlCenterLockRestrictedCommands]);
        [v3 addObjectsFromArray:v9];

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)cancelOperationsForRequest:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_serviceMap, "allValues", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) cancelOperationsForRequestID:v10 forAssistantID:v11 fromRemote:v7 reason:a6];
        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

- (void)pendServiceReloadNotification:(id)a3
{
  id v4 = a3;
  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[ADServiceManager pendServiceReloadNotification:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Ignore service reload notification (%@) for endpoints",  (uint8_t *)&v12,  0x16u);
    }
  }

  else if (v4 {
         && +[ADServiceManager isReloadServiceNotification:]( &OBJC_CLASS___ADServiceManager,  "isReloadServiceNotification:",  v4))
  }
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADServiceManager _serviceBundleIDFromServiceReloadNotification:]( &OBJC_CLASS___ADServiceManager,  "_serviceBundleIDFromServiceReloadNotification:",  v4));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _pendingServiceReloadNotifications](self, "_pendingServiceReloadNotifications"));
    unsigned int v8 = [v7 containsObject:v6];

    if (v8)
    {
      __int128 v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315650;
        id v13 = "-[ADServiceManager pendServiceReloadNotification:]";
        __int16 v14 = 2114;
        id v15 = v4;
        __int16 v16 = 2114;
        id v17 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Service reload notification %{public}@ is already pending for %{public}@, so this one will be ignored",  (uint8_t *)&v12,  0x20u);
      }
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _pendingServiceReloadNotifications](self, "_pendingServiceReloadNotifications"));
      [v11 addObject:v4];
    }
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      id v13 = "-[ADServiceManager pendServiceReloadNotification:]";
      __int16 v14 = 2114;
      id v15 = (id)kAFAssistantBundleReloadServiceNotificationSuffix;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Bad notification name for reload service. Expecting format to look like \"<serviceBundleID>%{public}@\". Inst ead, received \"%{public}@\"",  (uint8_t *)&v12,  0x20u);
    }
  }
}

- (void)reloadServiceForNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
    {
      id v5 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = "-[ADServiceManager reloadServiceForNotification:]";
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Ignore service reload notification (%@) for endpoints",  buf,  0x16u);
      }
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADServiceManager _serviceBundleIDFromServiceReloadNotification:]( &OBJC_CLASS___ADServiceManager,  "_serviceBundleIDFromServiceReloadNotification:",  v4));
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_serviceMap, "objectForKey:", v6));
      unsigned int v8 = (void *)v7;
      if (v7)
      {
        uint64_t v11 = v7;
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
        -[ADServiceManager _reloadServices:](self, "_reloadServices:", v9);
      }

      else
      {
        id v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v13 = "-[ADServiceManager reloadServiceForNotification:]";
          __int16 v14 = 2114;
          id v15 = v4;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Unable to find the service to reload for notification %{public}@",  buf,  0x16u);
        }
      }
    }
  }
}

- (void)reloadServicesForAllPendingServiceNotifications
{
  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[ADServiceManager reloadServicesForAllPendingServiceNotifications]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Ignore service reload for endpoints",  buf,  0xCu);
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _pendingServiceReloadNotifications](self, "_pendingServiceReloadNotifications"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _pendingServiceReloadNotifications](self, "_pendingServiceReloadNotifications"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000B09E0;
    v9[3] = &unk_1004F9280;
    v9[4] = self;
    id v10 = v5;
    id v8 = v5;
    [v6 enumerateObjectsUsingBlock:v9];

    -[ADServiceManager _reloadServices:](self, "_reloadServices:", v8);
    pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
    self->_pendingServiceReloadNotifications = 0LL;
  }

- (void)_reloadServices:(id)a3
{
  id v4 = a3;
  uint64_t v6 = AFBundleServicesCachePath(v4, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  char v37 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager _bundleServicesCache:](self, "_bundleServicesCache:", &v37));
  id v28 = [v8 mutableCopy];

  if (!v37)
  {
    __int128 v26 = v7;
    id v27 = v4;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "handle", v26));
          if (v15)
          {
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
            id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager _buildFliteredInfoDictionaryFromBundleURL:]( self,  "_buildFliteredInfoDictionaryFromBundleURL:",  v16));
            if (v17)
            {
              [v28 setObject:v17 forKey:v15];
              -[ADServiceManager removeService:](self, "removeService:", v14);
              -[ADServiceManager _loadServiceFromBundlePath:infoDictionary:]( self,  "_loadServiceFromBundlePath:infoDictionary:",  v15,  v17);
              char v37 = 1;
            }

            else
            {
              __int128 v19 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                __int128 v39 = "-[ADServiceManager _reloadServices:]";
                __int16 v40 = 2114;
                id v41 = v15;
                _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Unable to create bundle dictionary at from bundle path %{public}@",  buf,  0x16u);
              }
            }
          }

          else
          {
            __int128 v18 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int128 v39 = "-[ADServiceManager _reloadServices:]";
              __int16 v40 = 2114;
              id v41 = v14;
              _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to reload service (%{public}@), because the service's bundle path wasn't found",  buf,  0x16u);
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }

      while (v11);
    }

    uint64_t v7 = v26;
    id v4 = v27;
    if (v37)
    {
      -[ADServiceManager _writeBundleServicesCache:toPath:](self, "_writeBundleServicesCache:toPath:", v28, v26);
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v20 = v9;
      id v21 = [v20 countByEnumeratingWithState:&v29 objects:v44 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v30;
        do
        {
          for (j = 0LL; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "reload", v26);
          }

          id v22 = [v20 countByEnumeratingWithState:&v29 objects:v44 count:16];
        }

        while (v22);
      }

      id v25 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v39 = "-[ADServiceManager _reloadServices:]";
        __int16 v40 = 2114;
        id v41 = v20;
        __int16 v42 = 2114;
        __int16 v43 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s Done reload the following services: %{public}@\nBundle services cache written to: %{public}@",  buf,  0x20u);
      }
    }
  }
}

- (void).cxx_destruct
{
}

+ (BOOL)isReloadServiceNotification:(id)a3
{
  return [a3 hasSuffix:kAFAssistantBundleReloadServiceNotificationSuffix];
}

+ (id)_serviceBundleIDFromServiceReloadNotification:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (+[ADServiceManager isReloadServiceNotification:]( &OBJC_CLASS___ADServiceManager,  "isReloadServiceNotification:",  v3))
  {
    uint64_t v5 = [v3 length];
    uint64_t v6 = v5 - (_BYTE *)[kAFAssistantBundleReloadServiceNotificationSuffix length];
    id v4 = v3;
    if (v6 >= 1)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:"));
    }
  }

  return v4;
}

@end