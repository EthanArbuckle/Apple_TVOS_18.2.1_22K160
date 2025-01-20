@interface NDSessionManager
+ (id)restoreOptionsFromArchivePath:(id)a3;
- (BOOL)connection:(id)a3 canUseSharedContainerIdentifier:(id)a4;
- (BOOL)isSpringBoardApp;
- (NDSessionManager)initWithDelegate:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 forPersona:(id)a6 dataSeparatedPath:(id)a7 db:(id)a8;
- (NDSessionManagerDelegate)delegate;
- (NSString)containerPath;
- (NSString)persona;
- (NSXPCConnection)xpcConn;
- (OS_dispatch_queue)queue;
- (id)copyAndSanitizeClientConfiguration:(id)a3;
- (id)downloadDirectoryDataPath;
- (id)getSessionWithIdentifier:(id)a3;
- (id)obliterationCompletion;
- (id)restoreState:(BOOL *)a3;
- (void)archiveTimerFired;
- (void)boost;
- (void)cleanupWithCompletionHandler:(id)a3;
- (void)clientApplicationWasReinstalled;
- (void)createSessionWithConfiguration:(id)a3 clientProxy:(id)a4 cachesDirectory:(id)a5 options:(id)a6 reply:(id)a7;
- (void)dealloc;
- (void)dropBoost;
- (void)getActiveSessionIdentifiersWithReply:(id)a3;
- (void)obliterate;
- (void)obliterateAllSessionsWithReply:(id)a3;
- (void)okayToSendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4;
- (void)releaseAssertionForSession:(id)a3 reply:(id)a4;
- (void)sendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4;
- (void)sessionCompleted:(id)a3 withCompletionHandler:(id)a4;
- (void)setContainerPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setObliterationCompletion:(id)a3;
- (void)setPersona:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWorkState;
- (void)setXpcConn:(id)a3;
@end

@implementation NDSessionManager

- (NDSessionManager)initWithDelegate:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 forPersona:(id)a6 dataSeparatedPath:(id)a7 db:(id)a8
{
  id v14 = a3;
  id v38 = a4;
  id v37 = a6;
  id v15 = a7;
  id v16 = a8;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NDSessionManager;
  v17 = -[NDSessionManager init](&v41, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_storeStrong((id *)&v18->_clientBundleID, a4);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sessions = v18->_sessions;
    v18->_sessions = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    reconnectingProxies = v18->_reconnectingProxies;
    v18->_reconnectingProxies = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v18->_persona, a6);
    objc_storeStrong((id *)&v18->_containerPath, a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities bundleManagerPath:]( &OBJC_CLASS___NDFileUtilities,  "bundleManagerPath:",  v18->_clientBundleID));
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v23));
    bundleDirectory = v18->_bundleDirectory;
    v18->_bundleDirectory = (NSURL *)v24;

    dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.nsurlsessiond.session-manager", v27);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v18->_sessionTasksDB, a8);
    id boost = v18->_boost;
    v18->_id boost = 0LL;

    v18->_isSpringBoardApp = a5;
    +[NDFileUtilities createDirectoryAtURL:]( &OBJC_CLASS___NDFileUtilities,  "createDirectoryAtURL:",  v18->_bundleDirectory);
    dispatch_source_t v31 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v18->_queue);
    powerlogPeriodicUpdateTimer = v18->_powerlogPeriodicUpdateTimer;
    v18->_powerlogPeriodicUpdateTimer = (OS_dispatch_source *)v31;

    v33 = (dispatch_source_s *)v18->_powerlogPeriodicUpdateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100015748;
    handler[3] = &unk_100079BE0;
    v40 = v18;
    dispatch_source_set_event_handler(v33, handler);
    v34 = (dispatch_source_s *)v18->_powerlogPeriodicUpdateTimer;
    dispatch_time_t v35 = dispatch_time(0LL, 7200000000000LL);
    dispatch_source_set_timer(v34, v35, 0x68C61714000uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)v18->_powerlogPeriodicUpdateTimer);
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSessionManager;
  -[NDSessionManager dealloc](&v3, "dealloc");
}

- (id)downloadDirectoryDataPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_bundleDirectory,  "URLByAppendingPathComponent:",  @"downloadDirectoryPath.plist"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return v3;
}

- (id)restoreState:(BOOL *)a3
{
  v4 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    double v76 = *(double *)&clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoreState: %@", buf, 0xCu);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id obj = (id)objc_claimAutoreleasedReturnValue( -[NDTaskStorageDB _getAllSessionIDsForBundle:]( self->_sessionTasksDB,  "_getAllSessionIDsForBundle:",  self->_clientBundleID));
  if ((unint64_t)[obj count] >= 0x401)
  {
    v6 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v55 = self->_clientBundleID;
      v56 = (NSString *)[obj count];
      *(_DWORD *)buf = 138543618;
      double v76 = *(double *)&v55;
      __int16 v77 = 2048;
      v78 = v56;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "Too many sessions for app <%{public}@> (%zu > 1024)",  buf,  0x16u);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "subarrayWithRange:", 0, 1024));
    id obj = (id)v7;
  }

  id v58 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obja = obj;
  id v8 = [obja countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v8)
  {
    uint64_t v66 = *(void *)v72;
    do
    {
      v9 = 0LL;
      id v68 = v8;
      do
      {
        if (*(void *)v72 != v66) {
          objc_enumerationMutation(obja);
        }
        v10 = *(NSString **)(*((void *)&v71 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities sessionPath:forBundleID:]( &OBJC_CLASS___NDFileUtilities,  "sessionPath:forBundleID:",  v10,  self->_clientBundleID));
        char v70 = 0;
        unsigned int v13 = [v67 fileExistsAtPath:v12 isDirectory:&v70];
        if (v70) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = 0;
        }
        if (v14 != 1)
        {
          dispatch_time_t v35 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
          {
            v36 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v76 = *(double *)&v36;
            __int16 v77 = 2112;
            v78 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "No directory for bundleID: %@, sessionID: %@",  buf,  0x16u);
          }

          goto LABEL_35;
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"configuration.plist"]);
        id v15 = sub_100003BA0((uint64_t)&OBJC_CLASS___NSKeyedUnarchiver, v65);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (!v16
          || (v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]),
              unsigned int v19 = [v18 isEqualToString:v10],
              v18,
              !v19))
        {
          id v37 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
          {
            v45 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v76 = *(double *)&v45;
            __int16 v77 = 2112;
            v78 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Missing or invalid configuration.plist for bundleID: %@, sessionID: %@. Removing session directory",  buf,  0x16u);
          }

          +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v12);

          goto LABEL_35;
        }

        unsigned int v20 = [v17 _supportsAVAssetDownloads];
        uint64_t v21 = off_100078238;
        if (!v20) {
          uint64_t v21 = &off_100078240;
        }
        v22 = (objc_class *)objc_opt_class(*v21);
        uint64_t v23 = objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"options.plist"]);
        v62 = (void *)objc_claimAutoreleasedReturnValue( +[NDSessionManager restoreOptionsFromArchivePath:]( &OBJC_CLASS___NDSessionManager,  "restoreOptionsFromArchivePath:",  v23));
        v60 = (void *)v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"]);
        if (!v24) {
          goto LABEL_23;
        }
        v61 = v24;
        [v24 timeIntervalSinceNow];
        if (v25 < -31536000.0)
        {

LABEL_23:
          v61 = 0LL;
          int v26 = 1;
          goto LABEL_24;
        }

        [v61 timeIntervalSinceNow];
        if (v41 <= -2592000.0)
        {
          v43 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            [v61 timeIntervalSinceNow];
            double v49 = v48;
            v50 = (NSString *)objc_claimAutoreleasedReturnValue([v17 identifier]);
            v51 = self->_clientBundleID;
            *(_DWORD *)buf = 134218498;
            double v76 = -v49;
            __int16 v77 = 2112;
            v78 = v50;
            __int16 v79 = 2112;
            v80 = v51;
            _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Ignoring stale session (inactive for %fs) with identifier: %@ for bundle id: %@",  buf,  0x20u);
          }

LABEL_49:
          v44 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            double v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v17 identifier]));
            v47 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v76 = v46;
            __int16 v77 = 2112;
            v78 = v47;
            _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Coudn't restore session with identifier: %@ for bundle id: %@",  buf,  0x16u);
          }

          +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v12);
LABEL_35:
          if (-[NSString isEqualToString:]( self->_clientBundleID,  "isEqualToString:",  @"com.apple.OTACrashCopier"))
          {
            id v38 = (os_log_s *)qword_100083990;
            if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
            {
              v39 = self->_clientBundleID;
              *(_DWORD *)buf = 138412546;
              double v76 = *(double *)&v39;
              __int16 v77 = 2112;
              v78 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Launching application %@ since we could not restore session %@",  buf,  0x16u);
            }

            v40 = (void *)objc_claimAutoreleasedReturnValue( +[NDApplication applicationWithIdentifier:]( &OBJC_CLASS___NDApplication,  "applicationWithIdentifier:",  self->_clientBundleID));
            [v40 wakeForSessionIdentifier:v10 withSessionUUID:0 wakeRequirement:2];
          }

          goto LABEL_39;
        }

        int v26 = 0;
LABEL_24:
        id v27 = [[v22 alloc] initWithConfiguration:v17 bundleID:self->_clientBundleID isSpringBoardApp:self->_isSpringBoardApp downloadDirectory:0 options:v62 clientProxy:0 delegate:self workQueue:self->_queue db:self->_sessionTasksDB];
        if (v26)
        {
          id v28 = [v62 mutableCopy];
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v28 setObject:v29 forKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"];

          v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v28,  1LL,  0LL));
          [v30 writeToFile:v60 atomically:1];
        }

        if (!v27) {
          goto LABEL_49;
        }
        unsigned __int8 v69 = 0;
        v59 = (void *)objc_claimAutoreleasedReturnValue([v27 restoreTasks:&v69]);
        int v31 = v69;
        if (v69)
        {
          v32 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            double v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v17 identifier]));
            v34 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v76 = v33;
            __int16 v77 = 2112;
            v78 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Not restoring session with identifier: %@ for bundleID: %@ since it does not have any tasks",  buf,  0x16u);
          }
        }

        else
        {
          [v58 addObjectsFromArray:v59];
          sessions = self->_sessions;
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v27, v32);
        }

        if (v31) {
          goto LABEL_35;
        }
LABEL_39:

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }

      while (v68 != v9);
      id v8 = [obja countByEnumeratingWithState:&v71 objects:v81 count:16];
    }

    while (v8);
  }

  id v52 = -[NSMutableDictionary count](self->_sessions, "count");
  BOOL v53 = v52 == 0LL;
  if (!v52) {
    +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", self->_bundleDirectory);
  }
  if (a3) {
    *a3 = v53;
  }
  -[NDSessionManager setWorkState](self, "setWorkState");

  return v58;
}

- (void)setWorkState
{
  +[NDFileUtilities setDaemonWorkState:]( &OBJC_CLASS___NDFileUtilities,  "setDaemonWorkState:",  -[NSMutableDictionary count](self->_sessions, "count") != 0LL);
}

- (void)boost
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Holding boost for %@",  self->_clientBundleID));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 beginActivityWithOptions:0x80000000000 reason:v4]);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000155A8;
  block[3] = &unk_100079C30;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)dropBoost
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000154A8;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)copyAndSanitizeClientConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v6 = [v4 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedContainerIdentifier]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedContainerIdentifier]);
    unsigned __int8 v9 = -[NDSessionManager connection:canUseSharedContainerIdentifier:]( self,  "connection:canUseSharedContainerIdentifier:",  v5,  v8);

    if ((v9 & 1) == 0)
    {
      [v6 setSharedContainerIdentifier:0];
      v10 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedContainerIdentifier]);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = clientBundleID;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client %@ tried to specify a shared container that it cannot access: %@",  buf,  0x16u);
      }
    }
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 _sourceApplicationBundleIdentifier]);
  if (v13)
  {
    unsigned __int8 v14 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", 0);
      id v15 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 _sourceApplicationSecondaryIdentifier]);
  if (v16)
  {
    unsigned __int8 v17 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationSecondaryIdentifier:", 0);
      v18 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 _sourceApplicationAuditTokenData]);
  if (v19)
  {
    unsigned __int8 v20 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationAuditTokenData:", 0);
      uint64_t v21 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  objc_msgSend(v6, "set_attributedBundleIdentifier:", 0);
  if ([v6 _respectsAllowsCellularAccessForDiscretionaryTasks])
  {
    if ((sub_100003B08(v5, @"com.apple.private.nsurlsession.allow-discretionary-cellular") & 1) == 0)
    {
      objc_msgSend(v6, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", 0);
      v22 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.allow-discretionary-cellular";
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  if ([v6 _allowsPowerNapScheduling])
  {
    if ((sub_100003B08(v5, @"com.apple.private.dark-wake-network-reachability") & 1) == 0)
    {
      objc_msgSend(v6, "set_allowsPowerNapScheduling:", 0);
      uint64_t v23 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.dark-wake-network-reachability";
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 _connectionPoolName]);
  if (v24)
  {
    unsigned __int8 v25 = sub_100003B08(v5, @"com.apple.private.nsurlsession-allow-override-connection-pool");

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v6, "set_connectionPoolName:", 0);
      int v26 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession-allow-override-connection-pool";
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Client tried to set _connectionPoolName but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 _directoryForDownloadedFiles]);
  if (v27)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    if ([v28 isPrivileged])
    {
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v6 _directoryForDownloadedFiles]);
      id v30 = [v5 processIdentifier];
      if (v5) {
        [v5 auditToken];
      }
      else {
        memset(v41, 0, sizeof(v41));
      }
      unsigned __int8 v31 = [v29 _isSafeDirectoryForDownloads:v30 withToken:v41];

      if ((v31 & 1) == 0)
      {
        v32 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v6 _directoryForDownloadedFiles]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v39;
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Client tried to set _directoryForDownloadedFiles but does not have access to directory %@",  buf,  0xCu);
        }

        objc_msgSend(v6, "set_directoryForDownloadedFiles:", 0);
      }
    }
  }

  if ([v6 _duetPreauthorized])
  {
    if ((sub_100003B08(v5, @"com.apple.private.nsurlsession.allow-duet-preauthorization") & 1) == 0)
    {
      objc_msgSend(v6, "set_duetPreauthorized:", 0);
      double v33 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.allow-duet-preauthorization";
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Client tried to set _duetPreauthorized but is missing the %@ entitlement",  buf,  0xCu);
      }
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v6 _maximumWatchCellularTransferSize]);
  if (v34)
  {
    unsigned __int8 v35 = sub_100003B08(v5, @"com.apple.private.nsurlsession.set-max-watch-cell-transfer-size");

    if ((v35 & 1) == 0)
    {
      objc_msgSend(v6, "set_maximumWatchCellularTransferSize:", 0);
      v36 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement",  buf,  2u);
      }
    }
  }

  if ((sub_100003B08(v5, @"get-task-allow") & 1) != 0
    || (sub_100003B08(v5, @"com.apple.security.get-task-allow") & 1) != 0
    || os_variant_allows_internal_security_policies("com.apple.CFNetwork"))
  {
    id v37 = [v5 processIdentifier];
  }

  else
  {
    id v37 = 0LL;
  }

  objc_msgSend(v6, "set_pidForHAR:", v37);
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v40, 0, sizeof(v40));
  }
  *(void *)buf = 0LL;
  *(_OWORD *)&buf[16] = 0u;
  uint64_t v43 = 0LL;
  *(void *)&buf[8] = v40;
  objc_msgSend(v6, "set_neTrackerTCCResult:", ne_tracker_check_tcc(buf));

  return v6;
}

- (BOOL)connection:(id)a3 canUseSharedContainerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.security.application-groups"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if (objc_opt_isKindOfClass(v8, v9) & 1) != 0 && ([v8 containsObject:v7])
    {
      BOOL v10 = 1;
    }

    else
    {
      v11 = (os_log_s *)qword_100083990;
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        int v14 = 138412802;
        id v15 = v7;
        __int16 v16 = 2112;
        unsigned __int8 v17 = clientBundleID;
        __int16 v18 = 1024;
        int v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client specified shared container identifier %@. %@ can access: %d",  (uint8_t *)&v14,  0x1Cu);
        BOOL v10 = 0;
      }
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)createSessionWithConfiguration:(id)a3 clientProxy:(id)a4 cachesDirectory:(id)a5 options:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v74 = a4;
  id v75 = a6;
  id v76 = a7;
  id v12 = -[NDSessionManager copyAndSanitizeClientConfiguration:](self, "copyAndSanitizeClientConfiguration:", v11);
  if (![v11 _supportsAVAssetDownloads]
    || ([v12 _supportsAVAssetDownloads] & 1) != 0)
  {
    __int128 v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v73 _xpcConnection]);
    int is_extension = xpc_connection_is_extension();

    id v72 = [v75 mutableCopy];
    sessions = self->_sessions;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v16));
    unsigned int v18 = [v17 hasConnectedClient];

    if (v18)
    {
      int v19 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v20 = self->_sessions;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uuid]);
        clientBundleID = self->_clientBundleID;
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        *(_DWORD *)buf = 138543874;
        v86 = v23;
        __int16 v87 = 2112;
        v88 = clientBundleID;
        __int16 v89 = 2112;
        v90 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: already has a connected client, returning nil proxy object to client",  buf,  0x20u);
      }

      int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -996LL,  0LL));
      v83 = @"kNSURLSessionImmediateInvalidationErrorKey";
      v84 = v26;
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0LL, v27, 0LL);
LABEL_7:

      id v28 = 0LL;
      id v29 = 0LL;
      id v30 = 0LL;
LABEL_35:

      goto LABEL_36;
    }

    unsigned __int8 v31 = self->_sessions;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v32));

    if (v33)
    {
      if (is_extension)
      {
        v34 = self->_sessions;
        unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v35));
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sharedContainerIdentifier]);
        unsigned __int8 v38 = -[NDSessionManager connection:canUseSharedContainerIdentifier:]( self,  "connection:canUseSharedContainerIdentifier:",  v73,  v37);

        if ((v38 & 1) == 0)
        {
          v63 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Connected client is an extension is attempting to a connect to a session without a valid shared data container",  buf,  2u);
          }

          int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -995LL,  0LL));
          v81 = @"kNSURLSessionImmediateInvalidationErrorKey";
          v82 = v26;
          id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v82,  &v81,  1LL));
          (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0LL, v27, 0LL);
          goto LABEL_7;
        }
      }

      v39 = self->_sessions;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      id v29 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v40));

      double v41 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v29 uuid]);
        uint64_t v43 = self->_clientBundleID;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        *(_DWORD *)buf = 138543874;
        v86 = v42;
        __int16 v87 = 2112;
        v88 = v43;
        __int16 v89 = 2112;
        v90 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: reconnecting existing session",  buf,  0x20u);
      }

      [v29 updateOptions:v75];
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 getTasksForReconnection]);
      double v46 = (void *)objc_claimAutoreleasedReturnValue([v29 uuid]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v29 getTLSSessionCachePrefix]);
      v79[0] = @"NDBackgroundSessionManagerRestoredStateKeyTasks";
      v79[1] = @"NDBackgroundSessionManagerKeySessionUUID";
      v80[0] = v45;
      v80[1] = v46;
      v79[2] = @"NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix";
      v80[2] = v47;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  3LL));
      reconnectingProxies = self->_reconnectingProxies;
      double v49 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](reconnectingProxies, "setObject:forKeyedSubscript:", v74, v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities sessionPath:forBundleID:]( &OBJC_CLASS___NDFileUtilities,  "sessionPath:forBundleID:",  v50,  self->_clientBundleID));

      int v51 = 0;
    }

    else
    {
      if (is_extension)
      {
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedContainerIdentifier]);

        if (!v52)
        {
          unsigned __int8 v69 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Connected client is an extension and did not specify a valid shared container identifier",  buf,  2u);
          }

          int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -995LL,  0LL));
          __int16 v77 = @"kNSURLSessionImmediateInvalidationErrorKey";
          v78 = v26;
          id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
          (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0LL, v27, 0LL);
          goto LABEL_7;
        }
      }

      BOOL v53 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v55 = self->_clientBundleID;
        *(_DWORD *)buf = 138412546;
        v86 = v54;
        __int16 v87 = 2112;
        v88 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Creating session with identifier: %@ for bundle id: %@",  buf,  0x16u);
      }

      unsigned int v56 = [v12 _supportsAVAssetDownloads];
      v57 = off_100078238;
      if (!v56) {
        v57 = &off_100078240;
      }
      id v29 = [objc_alloc((Class)objc_opt_class(*v57)) initWithConfiguration:v12 bundleID:self->_clientBundleID isSpringBoardApp:self->_isSpringBoardApp downloadDirectory:0 options:v72 clientProxy:v74 delegate:self workQueue:self->_queue db:self->_sessionTasksDB];
      id v58 = (os_log_s *)(id)qword_100083990;
      v45 = v58;
      if (v29)
      {
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue([v29 uuid]);
          v60 = self->_clientBundleID;
          v61 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          *(_DWORD *)buf = 138543874;
          v86 = v59;
          __int16 v87 = 2112;
          v88 = v60;
          __int16 v89 = 2112;
          v90 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: created successfully",  buf,  0x20u);
        }

        v62 = self->_sessions;
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v29, v45);
        id v28 = 0LL;
        id v30 = 0LL;
        int v51 = 1;
      }

      else
      {
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          char v70 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          __int128 v71 = self->_clientBundleID;
          *(_DWORD *)buf = 138412546;
          v86 = v70;
          __int16 v87 = 2112;
          v88 = v71;
          _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Coudn't create session with identifier: %@ for bundle id: %@",  buf,  0x16u);
        }

        id v28 = 0LL;
        id v29 = 0LL;
        int v51 = 0;
        id v30 = 0LL;
      }
    }

    [v29 setXPCConnection:v73];
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    (*((void (**)(id, id, void *, id))v76 + 2))(v76, v29, v28, [v64 isPrivileged]);

    if (v30)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingPathComponent:@"configuration.plist"]);
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingPathComponent:@"options.plist"]);
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL));
      [v67 writeToFile:v65 atomically:1];

      id v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v72,  1LL,  0LL));
      [v68 writeToFile:v66 atomically:1];
    }

    if (v51) {
      -[NDSessionManager setWorkState](self, "setWorkState");
    }
    goto LABEL_35;
  }

  (*((void (**)(id, void, _UNKNOWN **, void))v76 + 2))(v76, 0LL, &off_10007B550, 0LL);
LABEL_36:
}

- (void)sendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v6));
  uint64_t v9 = (os_log_s *)qword_100083990;
  if (v8)
  {
    BOOL v10 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 clientBundleID]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543874;
      id v18 = v11;
      __int16 v19 = 2112;
      unsigned __int8 v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: instructed to send pending callbacks",  buf,  0x20u);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_reconnectingProxies,  "objectForKeyedSubscript:",  v6));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001549C;
    v15[3] = &unk_100079768;
    id v16 = v7;
    [v8 reconnectClient:v14 withCompletion:v15];

    -[NSMutableDictionary removeObjectForKey:](self->_reconnectingProxies, "removeObjectForKey:", v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Asked to send pending callbacks for session %@ that we have no record of. This shouldn't happen",  buf,  0xCu);
  }
}

- (void)releaseAssertionForSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "releaseAssertionForSession: %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  [v9 releaseAssertionForBundleID:self->_clientBundleID sessionID:v6];

  v7[2](v7);
}

- (void)okayToSendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v6));
  uint64_t v9 = (os_log_s *)qword_100083990;
  if (v8)
  {
    int v10 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 clientBundleID]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2112;
      unsigned __int8 v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: notified it is OK to send pending callbacks",  (uint8_t *)&v14,  0x20u);
    }

    [v8 allowReconnect];
  }

  else if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Signalled that it is okay to send pending callbacks for session %@ that we have no record of. This shouldn't happen",  (uint8_t *)&v14,  0xCu);
  }

  v7[2](v7);
}

- (void)getActiveSessionIdentifiersWithReply:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
  v5[2](v5, v4);

  if (!-[NSMutableDictionary count](self->_sessions, "count")) {
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", 0LL);
  }
}

- (void)obliterateAllSessionsWithReply:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    int v7 = 138412290;
    id v8 = clientBundleID;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "obliterateAllSessions for bundleID %@",  (uint8_t *)&v7,  0xCu);
  }

  if (-[NSMutableDictionary count](self->_sessions, "count"))
  {
    -[NDSessionManager setObliterationCompletion:](self, "setObliterationCompletion:", v4);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_sessions,  "enumerateKeysAndObjectsUsingBlock:",  &stru_100078EC8);
  }

  else
  {
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", v4);
  }
}

- (void)cleanupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", self->_bundleDirectory);
  -[NDSessionManager dropBoost](self, "dropBoost");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  clientBundleID = self->_clientBundleID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000153F8;
  v8[3] = &unk_100078EF0;
  id v7 = v4;
  v8[4] = self;
  id v9 = v7;
  [WeakRetained managerBecameEmpty:self bundleID:clientBundleID withCompletionHandler:v8];
}

- (void)sessionCompleted:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  sessions = self->_sessions;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v9));

  if (v10 != v6)
  {
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 clientBundleID]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    int v17 = 138543874;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    unsigned __int8 v20 = v13;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@>: removing session",  (uint8_t *)&v17,  0x20u);
  }

  id v15 = self->_sessions;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

  if (!-[NSMutableDictionary count](self->_sessions, "count"))
  {
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", v7);
    goto LABEL_11;
  }

  if (v7)
  {
    -[NDSessionManager setWorkState](self, "setWorkState");
LABEL_9:
    v7[2](v7);
  }

- (id)getSessionWithIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessions,  "objectForKeyedSubscript:",  a3));
}

- (void)clientApplicationWasReinstalled
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000153DC;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)obliterate
{
  objc_super v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    id v8 = clientBundleID;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Obliterating session manager for bundle ID: %@",  buf,  0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000153C0;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)archiveTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000153A4;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)xpcConn
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConn);
}

- (void)setXpcConn:(id)a3
{
}

- (NDSessionManagerDelegate)delegate
{
  return (NDSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (NSString)persona
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setPersona:(id)a3
{
}

- (NSString)containerPath
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setContainerPath:(id)a3
{
}

- (id)obliterationCompletion
{
  return objc_getProperty(self, a2, 112LL, 1);
}

- (void)setObliterationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)restoreOptionsFromArchivePath:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = sub_100003BA0((uint64_t)&OBJC_CLASS___NSKeyedUnarchiver, v3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {

LABEL_5:
      id v7 = 0LL;
    }
  }

  return v7;
}

@end