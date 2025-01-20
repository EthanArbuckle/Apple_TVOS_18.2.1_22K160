@interface CKDMain
+ (id)sharedMain;
- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3;
- (BOOL)systemAvailabilityChanged:(unint64_t)a3;
- (BOOL)upAndRunning;
- (CKDMain)init;
- (_TtC6cloudd13CKDMain_Swift)swiftMain;
- (void)_setupDistnotedEventHandler;
- (void)_setupNotifydEventHandler;
- (void)_setupTCCEventHandler;
- (void)setSwiftMain:(id)a3;
- (void)setUpAndRunning:(BOOL)a3;
- (void)uploadContent;
@end

@implementation CKDMain

+ (id)sharedMain
{
  if (qword_1000150B0 != -1) {
    dispatch_once(&qword_1000150B0, &stru_100010DC0);
  }
  return (id)qword_1000150A8;
}

- (CKDMain)init
{
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "Wed Dec 31 16:00:00 1969";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CloudKit daemon binary was built at %s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKDMain;
  v4 = -[CKDMain init](&v9, "init");
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS____TtC6cloudd13CKDMain_Swift);
    swiftMain = v4->_swiftMain;
    v4->_swiftMain = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CKDSystemAvailabilityMonitor sharedMonitor]( &OBJC_CLASS___CKDSystemAvailabilityMonitor,  "sharedMonitor"));
    [v7 registerWatcher:v4];

    +[CKDBackingAccount registerDeviceCountRefreshActivity]( &OBJC_CLASS___CKDBackingAccount,  "registerDeviceCountRefreshActivity");
  }

  return v4;
}

- (void)_setupNotifydEventHandler
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  if ([v4 isSystemInstalledBinary])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
    id v3 = [v2 processType];

    if (v3 != (id)2) {
      xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100010E00);
    }
  }

  else
  {
  }

- (void)_setupDistnotedEventHandler
{
}

- (void)_setupTCCEventHandler
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  id v3 = [v2 processType];

  if (v3 != (id)1)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[CKDAuthorizationObserver defaultObserver](&OBJC_CLASS___CKDAuthorizationObserver, "defaultObserver"));
    [v4 registerWithBlock:&stru_100010EA0];
  }

- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  v77 = _os_activity_create( (void *)&_mh_execute_header,  "systemAvailabilityChanged",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v77, &state);
  BOOL v5 = -[CKDMain canRunGivenAvailabilityState:](self, "canRunGivenAvailabilityState:", a3);
  unint64_t v78 = a3;
  v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = -[CKDMain upAndRunning](v6, "upAndRunning");
  -[CKDMain setUpAndRunning:](v6, "setUpAndRunning:", v5);
  objc_sync_exit(v6);
  v79 = v6;

  if (!(v5 & ~v7)) {
    goto LABEL_50;
  }
  if (v6)
  {
    v8 = objc_autoreleasePoolPush();
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v10 = (os_log_s *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v103 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Begin cleaning up background tasks",  v103,  2u);
    }

    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472LL;
    v104[2] = sub_10000A1E8;
    v104[3] = &unk_100010EF0;
    dispatch_semaphore_t v105 = v9;
    v11 = v9;
    +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:]( &OBJC_CLASS___NSURLSession,  "_getActiveSessionIdentifiersWithCompletionHandler:",  v104);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

    objc_autoreleasePoolPop(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
    if ([v12 isSystemInstalledBinary])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
      BOOL v14 = [v13 processType] == (id)2;

      if (!v14)
      {
        uint64_t v15 = CKGetCacheDir();
        v76 = (void *)objc_claimAutoreleasedReturnValue(v15);
        +[CKDPackageDirectoryPurger schedulePeriodicPurgesInDirectory:]( &OBJC_CLASS___CKDPackageDirectoryPurger,  "schedulePeriodicPurgesInDirectory:",  v76);
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKDLogicalDeviceContext defaultContext]( &OBJC_CLASS___CKDLogicalDeviceContext,  "defaultContext"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 metadataCache]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 knownContainerizedApplicationIDs]);

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        id obj = v18;
        id v20 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v95;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v95 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue( +[CKDLogicalDeviceContext defaultContext]( &OBJC_CLASS___CKDLogicalDeviceContext,  "defaultContext"));
              v25 = (void *)objc_claimAutoreleasedReturnValue([v24 metadataCache]);
              v26 = (void *)objc_claimAutoreleasedReturnValue([v25 applicationMetadataForApplicationID:v23]);

              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 applicationContainerPath]);
                v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:@"Library/Caches/CloudKit"]);
                [v19 addObject:v28];
              }
            }

            id v20 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
          }

          while (v20);
        }

        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        id v29 = v19;
        id v30 = [v29 countByEnumeratingWithState:&v90 objects:v103 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v91;
          do
          {
            for (j = 0LL; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v91 != v31) {
                objc_enumerationMutation(v29);
              }
              +[CKDPackageDirectoryPurger schedulePeriodicPurgesInDirectory:]( &OBJC_CLASS___CKDPackageDirectoryPurger,  "schedulePeriodicPurgesInDirectory:",  *(void *)(*((void *)&v90 + 1) + 8LL * (void)j));
            }

            id v30 = [v29 countByEnumeratingWithState:&v90 objects:v103 count:16];
          }

          while (v30);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v76));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:@"tmp"]);

        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lastPathComponent]);
          if (ck_log_initialization_predicate != -1LL) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v36 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v37 = v36;
            v38 = (void *)objc_claimAutoreleasedReturnValue([v34 CKSanitizedPath]);
            *(_DWORD *)buf = 138412546;
            v100 = v35;
            __int16 v101 = 2112;
            v102 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Purging %@ directory at %@", buf, 0x16u);
          }

          +[CKDirectoryPurger purgeDirectoryAtURL:](&OBJC_CLASS___CKDirectoryPurger, "purgeDirectoryAtURL:", v34);
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue( +[CKDLogicalDeviceContext defaultContext]( &OBJC_CLASS___CKDLogicalDeviceContext,  "defaultContext"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 metadataCache]);
        unsigned int v41 = [v40 hasMigrated];

        if (v76) {
          unsigned int v42 = v41;
        }
        else {
          unsigned int v42 = 0;
        }
        if (v42 == 1)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[CKDMetadataCache dbFileName](&OBJC_CLASS___CKDMetadataCache, "dbFileName"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[CKDOperationInfoCache dbFileName](&OBJC_CLASS___CKDOperationInfoCache, "dbFileName"));
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[CKDDirectoryContext daemonDatabaseDirectoryName]( &OBJC_CLASS___CKDDirectoryContext,  "daemonDatabaseDirectoryName"));
          if (ck_log_initialization_predicate != -1LL) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v46 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v47 = v46;
            v48 = (void *)objc_claimAutoreleasedReturnValue([v43 CKSanitizedPath]);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v76 CKSanitizedPath]);
            *(_DWORD *)buf = 138412546;
            v100 = v48;
            __int16 v101 = 2112;
            v102 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "Migrated %@ db, now purging the cache directory at %@",  buf,  0x16u);
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v76,  1LL));
          id v51 = objc_alloc(&OBJC_CLASS___CKDirectoryPurger);
          v98 = v50;
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v98,  1LL));
          id v53 = [v51 initWithDirectoryURLs:v52];

          v86[0] = _NSConcreteStackBlock;
          v86[1] = 3221225472LL;
          v86[2] = sub_10000A4EC;
          v86[3] = &unk_100010F18;
          id v87 = v43;
          id v88 = v44;
          id v89 = v45;
          id v54 = v45;
          id v55 = v44;
          id v56 = v43;
          [v53 setShouldSkipFileBlock:v86];
          [v53 setShouldRemoveFileBlock:&stru_100010F58];
          [v53 purge];
        }
      }
    }

    else
    {
    }
  }

  -[CKDMain _setupNotifydEventHandler](v79, "_setupNotifydEventHandler");
  -[CKDMain _setupDistnotedEventHandler](v79, "_setupDistnotedEventHandler");
  -[CKDMain _setupTCCEventHandler](v79, "_setupTCCEventHandler");
  id v57 = (id)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  BOOL v59 = [v58 processType] == (id)2;

  if (!v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[CKDLogicalDeviceContext defaultContext](&OBJC_CLASS___CKDLogicalDeviceContext, "defaultContext"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 tokenRegistrationScheduler]);
    [v61 registerTokenRefreshActivity];

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[CKDLogicalDeviceContext defaultContext](&OBJC_CLASS___CKDLogicalDeviceContext, "defaultContext"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 metadataCache]);

    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = sub_10000B048;
    v83[3] = &unk_100010F80;
    id v57 = v63;
    id v84 = v57;
    v64 = objc_retainBlock(v83);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[CKDAccountNotifier sharedNotifier](&OBJC_CLASS___CKDAccountNotifier, "sharedNotifier"));
    [v65 registerObserver:v57 forAccountChangeNotification:v64];

    ((void (*)(void *, void, void))v64[2])(v64, 0LL, 0LL);
    [v57 expungeStaleAccountIDs];
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[CKDLogicalDeviceContext defaultContext](&OBJC_CLASS___CKDLogicalDeviceContext, "defaultContext"));
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 operationInfoCache]);

    [v67 registerCacheEvictionActivity];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_10000B060;
    v81[3] = &unk_100010F80;
    id v68 = v67;
    id v82 = v68;
    v69 = objc_retainBlock(v81);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[CKDAccountNotifier sharedNotifier](&OBJC_CLASS___CKDAccountNotifier, "sharedNotifier"));
    [v70 registerObserver:v68 forAccountChangeNotification:v69];

    ((void (*)(void *, void, uint64_t))v69[2])(v69, 0LL, 1LL);
LABEL_45:
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  if ([v71 isSystemInstalledBinary])
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
    BOOL v73 = [v72 processType] == (id)2;

    if (v73) {
      goto LABEL_50;
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue( +[CKDProcessScopedStateManager sharedManager]( &OBJC_CLASS___CKDProcessScopedStateManager,  "sharedManager"));
    [v71 kickOffPendingLongLivedOperations];
  }

LABEL_50:
  if (v78 == 3)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CKDMain swiftMain](v79, "swiftMain"));
    [v74 markSystemAvailableForCacheDelete];
  }

  os_activity_scope_leave(&state);

  return 1;
}

- (void)uploadContent
{
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Requested to upload content. Kicking off unfinished long-lived operations",  v4,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CKDProcessScopedStateManager sharedManager]( &OBJC_CLASS___CKDProcessScopedStateManager,  "sharedManager"));
  [v3 kickOffPendingLongLivedOperations];
}

- (_TtC6cloudd13CKDMain_Swift)swiftMain
{
  return self->_swiftMain;
}

- (void)setSwiftMain:(id)a3
{
}

- (BOOL)upAndRunning
{
  return self->_upAndRunning;
}

- (void)setUpAndRunning:(BOOL)a3
{
  self->_upAndRunning = a3;
}

- (void).cxx_destruct
{
}

@end