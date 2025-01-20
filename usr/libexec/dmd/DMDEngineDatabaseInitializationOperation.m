@interface DMDEngineDatabaseInitializationOperation
- (BOOL)destroyPersistentStoresWithError:(id *)a3;
- (BOOL)isReady;
- (BOOL)updateMetadataForManagedObjectContext:(id)a3 error:(id *)a4;
- (DMDDeviceStateProvider)deviceStateProvider;
- (void)dealloc;
- (void)destroyLegacyDatabaseIfNeeded;
- (void)fixupDatabaseWithCompletionHandler:(id)a3;
- (void)loadPersistentStoresWithCompletionHandler:(id)a3;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationWillStart;
- (void)setDeviceStateProvider:(id)a3;
@end

@implementation DMDEngineDatabaseInitializationOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseInitializationOperation;
  -[DMDEngineDatabaseOperation dealloc](&v3, "dealloc");
}

- (BOOL)isReady
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseInitializationOperation deviceStateProvider](self, "deviceStateProvider"));
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseInitializationOperation;
  if (-[DMDEngineDatabaseInitializationOperation isReady](&v7, "isReady")) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = [v3 hasKeychainUnlockedSinceBoot];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "DMDEngineDatabaseInitializationOperationContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"hasKeychainUnlockedSinceBoot", a4, a5))
    {
      -[DMDEngineDatabaseInitializationOperation willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"isReady");
      -[DMDEngineDatabaseInitializationOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isReady");
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseInitializationOperation;
    -[DMDEngineDatabaseInitializationOperation observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setDeviceStateProvider:(id)a3
{
  BOOL v4 = (DMDDeviceStateProvider *)a3;
  -[DMDDeviceStateProvider removeObserver:forKeyPath:context:]( self->_deviceStateProvider,  "removeObserver:forKeyPath:context:",  self,  @"hasKeychainUnlockedSinceBoot",  "DMDEngineDatabaseInitializationOperationContext");
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  v6 = v4;

  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:]( self->_deviceStateProvider,  "addObserver:forKeyPath:options:context:",  self,  @"hasKeychainUnlockedSinceBoot",  4LL,  "DMDEngineDatabaseInitializationOperationContext");
}

- (void)operationWillStart
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseInitializationOperation;
  -[DMDEngineDatabaseInitializationOperation operationWillStart](&v3, "operationWillStart");
}

- (void)main
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100030210;
  v3[3] = &unk_10009E850;
  v3[4] = self;
  -[DMDEngineDatabaseInitializationOperation loadPersistentStoresWithCompletionHandler:]( self,  "loadPersistentStoresWithCompletionHandler:",  v3);
}

- (void)destroyLegacyDatabaseIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager dmd_legacyUserConfigurationEngineDatabaseURL]( &OBJC_CLASS___NSFileManager,  "dmd_legacyUserConfigurationEngineDatabaseURL"));
  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"-wal"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 0LL));

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"-shm"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v8, 0LL));

    v41[0] = v3;
    v41[1] = v9;
    v41[2] = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
    uint64_t v11 = DMFConfigurationEngineLog(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "removing legacy database...", buf, 2u);
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      v29 = v9;
      v30 = v6;
      v31 = v3;
      id v16 = 0LL;
      uint64_t v17 = *(void *)v35;
      char v18 = 1;
      do
      {
        v19 = 0LL;
        v20 = v16;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v19);
          id v33 = v20;
          unsigned __int8 v22 = [v2 removeItemAtURL:v21 error:&v33];
          id v16 = v33;

          if ((v22 & 1) == 0)
          {
            uint64_t v24 = DMFConfigurationEngineLog(v23);
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_100063C00(buf, v16, &v39, v25);
            }

            char v18 = 0;
          }

          v19 = (char *)v19 + 1;
          v20 = v16;
        }

        while (v15 != v19);
        id v15 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }

      while (v15);

      v6 = v30;
      objc_super v3 = v31;
      v9 = v29;
      if ((v18 & 1) == 0) {
        goto LABEL_21;
      }
    }

    else
    {

      id v16 = 0LL;
    }

    uint64_t v27 = DMFConfigurationEngineLog(v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "deleted legacy database", v32, 2u);
    }

LABEL_21:
  }
}

- (void)loadPersistentStoresWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStoreDescriptions]);
  id v8 = [v7 mutableCopy];

  if (![v8 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:self file:@"DMDEngineDatabaseInitializationOperation.m" lineNumber:112 description:@"Configuration database does not have registered persistent stores"];
  }

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000307D8;
  v15[3] = &unk_10009E8C0;
  id v16 = v9;
  id v17 = v8;
  id v18 = v5;
  id v11 = v5;
  id v12 = v8;
  id v13 = v9;
  [v10 loadPersistentStoresWithCompletionHandler:v15];
}

- (void)fixupDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030AE0;
  v7[3] = &unk_10009E910;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBackgroundTask:v7];
}

- (BOOL)updateMetadataForManagedObjectContext:(id)a3 error:(id *)a4
{
  id v17 = a4;
  id v18 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentStoreCoordinator]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStores]);
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadataForPersistentStore:", v12, v17));
        id v14 = [v13 mutableCopy];

        [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey"];
        [v6 setMetadata:v14 forPersistentStore:v12];
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  unsigned __int8 v15 = [v18 save:v17];
  return v15;
}

- (BOOL)destroyPersistentStoresWithError:(id *)a3
{
  v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v32 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentStoreDescriptions]);

  id obj = v5;
  id v33 = [v5 countByEnumeratingWithState:&v35 objects:v45 count:16];
  id v6 = 0LL;
  if (v33)
  {
    uint64_t v31 = *(void *)v36;
    do
    {
      objc_super v7 = 0LL;
      id v8 = v6;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v7);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](v32, "database"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentStoreCoordinator]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 type]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 options]);
        id v34 = v8;
        unsigned __int8 v15 = [v11 destroyPersistentStoreAtURL:v12 withType:v13 options:v14 error:&v34];
        id v6 = v34;

        if ((v15 & 1) == 0)
        {
          uint64_t v17 = DMFConfigurationEngineLog(v16);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 verboseDescription]);
            *(_DWORD *)buf = 138543618;
            v42 = v20;
            __int16 v43 = 2114;
            v44 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "unable to remove persistent store %{public}@: %{public}@",  buf,  0x16u);
          }

          -[NSMutableArray addObject:](v29, "addObject:", v6);
        }

        objc_super v7 = (char *)v7 + 1;
        id v8 = v6;
      }

      while (v33 != v7);
      id v33 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }

    while (v33);
  }

  id v22 = -[NSMutableArray count](v29, "count");
  id v23 = v22;
  if (a3 && v22)
  {
    uint64_t v39 = DMFErrorFailedConfigurationDatabaseStoreKey;
    id v24 = -[NSMutableArray copy](v29, "copy");
    id v40 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    uint64_t v26 = DMFErrorWithCodeAndUserInfo(4007LL, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v26);
  }

  return v23 == 0LL;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void).cxx_destruct
{
}

@end