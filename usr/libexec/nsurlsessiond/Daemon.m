@interface Daemon
+ (id)sharedDaemon;
- (BOOL)applicationIsInstalled:(id)a3;
- (BOOL)isInSyncBubble;
- (BOOL)isPrivileged;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Daemon)init;
- (OS_dispatch_queue)queue;
- (id)archivePath;
- (id)bundleIDsForAppProxies:(id)a3;
- (id)getSessionWithIdentifier:(id)a3 forBundleID:(id)a4;
- (void)addTransaction;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)archiveState;
- (void)createDaemonDirectory;
- (void)managerBecameEmpty:(id)a3 bundleID:(id)a4 withCompletionHandler:(id)a5;
- (void)releaseTransaction;
- (void)restoreState;
- (void)setInSyncBubble:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setupArchiveTimer;
- (void)setupNewClassMappingsForUnarchiver;
- (void)start;
- (void)waitUntilDeviceIsUnlocked;
@end

@implementation Daemon

- (void)createDaemonDirectory
{
  NSFileAttributeKey v29 = NSFileProtectionKey;
  NSFileProtectionType v30 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  unsigned int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v22];

  if (v6)
  {
    if (v22)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
      id v21 = 0LL;
      unsigned __int8 v8 = [v4 setAttributes:v3 ofItemAtPath:v7 error:&v21];
      id v9 = v21;

      if ((v8 & 1) == 0)
      {
        v10 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
          id v20 = [v9 code];
          *(_DWORD *)buf = 138412802;
          v24 = v19;
          __int16 v25 = 2112;
          id v26 = v9;
          __int16 v27 = 2048;
          id v28 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not set attributes of directory at %@, error: %@ [%ld]",  buf,  0x20u);
        }
      }
    }

    else
    {
      v11 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Non-directory file exists at: %@. Removing it.",  buf,  0xCu);
      }

      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
      +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v9);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  self->_createdDataVault = +[NDFileUtilities createDataVaultDirectoryAtPath:]( &OBJC_CLASS___NDFileUtilities,  "createDataVaultDirectoryAtPath:",  v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondLaunchdPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondLaunchdPath"));
  +[NDFileUtilities createDirectoryAtPath:](&OBJC_CLASS___NDFileUtilities, "createDirectoryAtPath:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14));

  v16 = -[NDTaskStorageDB _initDB:](objc_alloc(&OBJC_CLASS___NDTaskStorageDB), "_initDB:", v15);
  sessionTasksDB = self->_sessionTasksDB;
  self->_sessionTasksDB = v16;
}

- (Daemon)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___Daemon;
  v2 = -[Daemon init](&v20, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    unsigned __int8 v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nsurlsessiond.daemon-queue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.nsurlsessiond-xpc-transaction-queue", v14);
    transactionQueue = v2->_transactionQueue;
    v2->_transactionQueue = (OS_dispatch_queue *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v17 addObserver:v2];

    archiveTimer = v2->_archiveTimer;
    v2->_archiveTimer = 0LL;
  }

  return v2;
}

- (id)archivePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"bundles.plist"]);

  return v3;
}

- (BOOL)applicationIsInstalled:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  a3,  0LL,  0LL));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)setupNewClassMappingsForUnarchiver
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
  +[NSKeyedUnarchiver setClass:forClassName:]( &OBJC_CLASS___NSKeyedUnarchiver,  "setClass:forClassName:",  v2,  @"NDTaskInfo");
}

- (void)restoreState
{
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon archivePath](self, "archivePath"));
  id v4 = sub_100003BA0((uint64_t)&OBJC_CLASS___NSKeyedUnarchiver, v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v34, v5) & 1) != 0)
  {
    id v38 = v34;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v38 allKeys]);
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v34, v7) & 1) != 0)
    {
      id v6 = v34;
    }

    else
    {
      if (v34)
      {
        unsigned __int8 v8 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Bundle ID Archive %@ has unexpected format",  buf,  0xCu);
        }
      }

      id v6 = 0LL;
    }

    id v38 = 0LL;
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities bundleManagerPath:]( &OBJC_CLASS___NDFileUtilities,  "bundleManagerPath:",  v12,  v34));
        if (v38)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v12]);
          uint64_t v15 = (uint64_t)[v14 BOOLValue];
        }

        else
        {
          uint64_t v15 = 1LL;
        }

        char v44 = 0;
        unsigned int v16 = [v37 fileExistsAtPath:v13 isDirectory:&v44];
        if (v44) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = 0;
        }
        if (v17 == 1)
        {
          if ((_DWORD)v15 && !-[Daemon applicationIsInstalled:](self, "applicationIsInstalled:", v12))
          {
            char v22 = (os_log_s *)qword_100083990;
            if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Application %@ is not installed, removing directory",  buf,  0xCu);
            }

            +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v13);
          }

          else
          {
            v18 = -[NDSessionManager initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:]( objc_alloc(&OBJC_CLASS___NDSessionManager),  "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:",  self,  v12,  v15,  0LL,  0LL,  self->_sessionTasksDB);
            char v43 = 0;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDSessionManager restoreState:](v18, "restoreState:", &v43));
            if (v43)
            {
              objc_super v20 = (os_log_s *)qword_100083990;
              if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v52 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "NDSessionManager for client %@ was empty, not restoring",  buf,  0xCu);
              }
            }

            else
            {
              [v35 addObjectsFromArray:v19];
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_clients,  "setObject:forKeyedSubscript:",  v18,  v12);
            }
          }
        }

        else
        {
          id v21 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "No directory for bundleID: %@",  buf,  0xCu);
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }

    while (v9);
  }

  -[Daemon archiveState](self, "archiveState");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue([v35 sortedArrayUsingComparator:&stru_1000796B0]);
  id v24 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v40;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v23);
        }
        __int16 v27 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
        if (-[Daemon isInSyncBubble](self, "isInSyncBubble", v34))
        {
          if ([v27 taskKind] != (id)1) {
            continue;
          }
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 originalRequest]);
          [v28 _timeWindowDelay];
          BOOL v30 = v29 == 0.0;

          if (!v30) {
            continue;
          }
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue([v27 sessionID]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
        v33 = (void *)objc_claimAutoreleasedReturnValue( -[Daemon getSessionWithIdentifier:forBundleID:]( self,  "getSessionWithIdentifier:forBundleID:",  v31,  v32));

        objc_msgSend(v33, "requeueTask:", objc_msgSend(v27, "identifier"));
      }

      id v24 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }

    while (v24);
  }
}

- (void)archiveState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon archivePath](self, "archivePath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  clients = self->_clients;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000387F4;
  v10[3] = &unk_1000796D8;
  id v6 = v4;
  id v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clients, "enumerateKeysAndObjectsUsingBlock:", v10);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL));
  unsigned __int8 v8 = [v7 writeToFile:v3 atomically:1];

  if ((v8 & 1) == 0)
  {
    id v9 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_attr_t v13 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to write archive to path: %@",  buf,  0xCu);
    }
  }
}

- (void)setupArchiveTimer
{
  if (!self->_archiveTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    archiveTimer = self->_archiveTimer;
    self->_archiveTimer = v3;

    uint64_t v5 = self->_archiveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000387D8;
    handler[3] = &unk_100079BE0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    id v6 = self->_archiveTimer;
    dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x2540BE400uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_archiveTimer);
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  dispatch_time_t v7 = v6;
  if (v6)
  {
    [v6 auditToken];
  }

  else
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
  }

  v48[0] = v50;
  v48[1] = v51;
  BOOL v8 = CPCopyBundleIdentifierAndTeamFromAuditToken(v48, &v49, 0LL) != 0;
  int v9 = v8 && v49 != 0LL;
  if (v8 && v49 != 0LL) {
    uint64_t v10 = v49;
  }
  else {
    uint64_t v10 = 0LL;
  }
  id v11 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v53 = v7;
    __int16 v54 = 2112;
    id v55 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Evaluating new XPC connection %@ with client bundle identifier %@",  buf,  0x16u);
  }

  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v10,  0LL,  0LL));
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      char isKindOfClass = 1;
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v14);
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  unsigned int v15 = [v7 processIdentifier];
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 _xpcConnection]);
  if ((v9 & xpc_connection_is_extension()) == 1)
  {
    id v17 = v10;
    v18 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Client is a PlugIn with bundle identifier %@",  buf,  0xCu);
    }

    id v19 = [[LSApplicationExtensionRecord alloc] initWithBundleIdentifier:v17 error:0];
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containingBundleRecord]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);

    char v22 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Containing app for PlugIn is %@", buf, 0xCu);
    }

    id v23 = v21;

    id v24 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client is an extension", buf, 2u);
      id v24 = (os_log_s *)qword_100083990;
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v53 = v23;
      __int16 v54 = 2112;
      id v55 = v17;
      __int16 v56 = 2112;
      id v57 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Using identifier %@ for PlugIn %@ with containing app %@",  buf,  0x20u);
    }

    if (v23) {
      goto LABEL_25;
    }
  }

  else
  {
    id v23 = v10;
    if (v10)
    {
LABEL_25:
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](&OBJC_CLASS___NDFileUtilities, "bundleManagerPath:", v23));
      BOOL v26 = v25 != 0LL;
      if (v25)
      {
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", v23));
        BOOL v28 = v27 == 0LL;

        if (v28)
        {
          v32 = -[NDSessionManager initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:]( objc_alloc(&OBJC_CLASS___NDSessionManager),  "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:",  self,  v23,  isKindOfClass & 1,  0LL,  0LL,  self->_sessionTasksDB);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clients, "setObject:forKeyedSubscript:", v32, v23);
          double v29 = v32;
          -[Daemon archiveState](self, "archiveState");
        }

        else
        {
          double v29 = (NDSessionManager *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clients,  "objectForKeyedSubscript:",  v23));
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue( +[__NSCFURLSessionXPC bgSessionManagerInterface]( &OBJC_CLASS_____NSCFURLSessionXPC,  "bgSessionManagerInterface"));
        [v7 setExportedInterface:v33];

        [v7 setExportedObject:v29];
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDSessionManager queue](v29, "queue"));
        [v7 _setQueue:v34];

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_1000385E0;
        v45[3] = &unk_100079740;
        id v35 = v7;
        id v46 = v35;
        id v47 = v23;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_1000387B8;
        v43[3] = &unk_100079768;
        v36 = objc_retainBlock(v45);
        id v44 = v36;
        [v35 setInvalidationHandler:v43];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_1000387C8;
        v41[3] = &unk_100079768;
        v37 = v36;
        id v42 = v37;
        [v35 setInterruptionHandler:v41];
        [v35 resume];
      }

      else
      {
        v31 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v53 = v23;
          __int16 v54 = 1024;
          LODWORD(v55) = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Process with bundleID %@ [pid %d] does not have a bundle path, rejecting connection",  buf,  0x12u);
        }
      }

      goto LABEL_37;
    }
  }

  BOOL v30 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v53) = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Process with pid %d does not have a bundle ID, rejecting connection",  buf,  8u);
  }

  BOOL v26 = 0;
LABEL_37:

  return v26;
}

- (id)getSessionWithIdentifier:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  objc_super v20 = sub_100038558;
  id v21 = sub_100038568;
  id v22 = 0LL;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100038570;
  v13[3] = &unk_100079790;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  unsigned int v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)managerBecameEmpty:(id)a3 bundleID:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000384B8;
  block[3] = &unk_1000797B8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)addTransaction
{
}

- (void)releaseTransaction
{
}

- (id)bundleIDsForAppProxies:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v3));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
        [v4 addObject:v9];
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 plugInKitPlugins]);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v19;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v11);
              }
              [v4 addObject:v15];
            }

            id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v12);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v5);
  }

  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000382C8;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000380F0;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)waitUntilDeviceIsUnlocked
{
  if (MKBDeviceFormattedForContentProtection(self, a2) && MKBDeviceUnlockedSinceBoot() != 1)
  {
    uint64_t v2 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", buf, 2u);
    }

    *(void *)buf = 0LL;
    __int128 v19 = buf;
    uint64_t v20 = 0x2020000000LL;
    int v21 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    id v4 = dispatch_queue_create("com.apple.nsurlsessiond.wait-unlock", 0LL);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100038010;
    v16[3] = &unk_100079BE0;
    id v5 = v3;
    uint64_t v17 = v5;
    id v6 = objc_retainBlock(v16);
    id v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    id v8 = (int *)(v19 + 24);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100038094;
    handler[3] = &unk_100079820;
    id v15 = buf;
    id v9 = v6;
    id v14 = v9;
    if (notify_register_dispatch(v7, v8, v4, handler))
    {
      id v10 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to regsiter for lock status notification! Calling abort()",  v12,  2u);
      }

      abort();
    }

    dispatch_async(v4, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000380B8;
    block[3] = &unk_100079848;
    block[4] = buf;
    dispatch_sync(v4, block);

    _Block_object_dispose(buf, 8);
  }

- (void)start
{
  if (!-[Daemon isInSyncBubble](self, "isInSyncBubble")) {
    -[Daemon waitUntilDeviceIsUnlocked](self, "waitUntilDeviceIsUnlocked");
  }
  dispatch_semaphore_t v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "nsurlsessiond started", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  [v4 start];

  -[Daemon createDaemonDirectory](self, "createDaemonDirectory");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](&OBJC_CLASS___NDStatusMonitor, "sharedMonitor"));
  [v5 start];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ConnectionPoolLimit", @"com.apple.nsurlsessiond", 0LL);
  if (AppIntegerValue) {
    uint64_t v8 = AppIntegerValue;
  }
  else {
    uint64_t v8 = 3LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  @"NSURLSessionBackgroundPoolName",  v8));
  [v6 createActivityGroup:v9];

  if (-[Daemon isInSyncBubble](self, "isInSyncBubble"))
  {
    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSURLSessionBackgroundPoolName-sync-%d",  geteuid());
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    CFIndex v12 = CFPreferencesGetAppIntegerValue(@"ConnectionPoolLimit", @"com.apple.nsurlsessiond", 0LL);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 3LL;
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  v11,  v13));
    [v6 createActivityGroup:v14];
  }

  notify_post("com.apple.nsurlsessiond.started");
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (BOOL)isPrivileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (void)setInSyncBubble:(BOOL)a3
{
  self->_inSyncBubble = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedDaemon
{
  if (qword_100083970 != -1) {
    dispatch_once(&qword_100083970, &stru_100079670);
  }
  return (id)qword_100083978;
}

@end