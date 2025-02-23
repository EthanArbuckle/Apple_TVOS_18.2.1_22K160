@interface SDResourceManager
+ (id)sharedResourceManager;
- (BOOL)areDiagnosticsInFlight;
- (BOOL)cancelAll:(id)a3;
- (BOOL)checkAndIncreaseDiagnosticCountForDiagnosticID:(id)a3 collectingLocalLogs:(BOOL)a4;
- (BOOL)decreaseDiagnosticCount;
- (BOOL)decreaseDiagnosticCountForDiagnosticID:(id)a3;
- (BOOL)diagnosticIDExists:(id)a3;
- (BOOL)finishedItemForPhaseAndUpdatePeer:(int)a3;
- (BOOL)initConnectionWithPeer:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)initProgressTrackerWithConnection:(id)a3;
- (BOOL)isDaemon;
- (BOOL)registerActivityWithID:(id)a3;
- (BOOL)registerDiagnosticObject:(id)a3;
- (BOOL)setUpCLI:(id)a3 stdoutfd:(int)a4 stderrfd:(int)a5;
- (BOOL)setUpDiagnosticID:(id)a3;
- (BOOL)setUpLibClient:(id)a3 clientPid:(id)a4;
- (BOOL)setUpSysdiagnoseLog:(id)a3 withID:(id)a4;
- (BOOL)setUpSysdiagnoseSession:(id)a3 clientPid:(id)a4;
- (BOOL)setupProgressTotal:(unint64_t)a3 forPhase:(int)a4;
- (NSMutableDictionary)cliManager;
- (NSMutableDictionary)diagnosticManager;
- (NSMutableDictionary)fdManager;
- (NSMutableDictionary)idManager;
- (NSMutableDictionary)peerManager;
- (NSMutableDictionary)pidManager;
- (NSMutableDictionary)progressManager;
- (NSString)currentClient;
- (NSString)localLogCollectionDiagnosticID;
- (NSString)possibleClient;
- (SDResourceManager)init;
- (double)getMinimumTimeBeforeTimeoutsForPhaseID:(int)a3;
- (id)diagnosticObjectForDiagnosticID:(id)a3;
- (id)elapsedMetricForPhaseID:(int)a3;
- (id)getActivityID;
- (id)getContainersMetricForPhaseId:(int)a3;
- (id)getCurrentInflightLocalDiagnostic;
- (id)getDiagnosticID;
- (id)getDiagnosticIDForPid:(id)a3;
- (id)getDiagnosticIDSimple;
- (id)registerActivity;
- (id)setUpFH:(int)a3;
- (id)stringForPhaseID:(int)a3;
- (int64_t)count;
- (int64_t)numberDiagnosticsInflight;
- (void)_closeSysdiagnoseSessionHelper:(id)a3;
- (void)_log:(id)a3;
- (void)clearAllResources;
- (void)cliWrite:(int)a3 logStr:(id)a4 withParameters:(char *)a5;
- (void)closeCLI;
- (void)closeSysdiagnoseLog;
- (void)closeSysdiagnoseSession;
- (void)initPeerProgressHandler;
- (void)log:(id)a3;
- (void)logWithSubsystem:(const char *)a3 category:(const char *)a4 msg:(id)a5;
- (void)removeActivityIDs:(id)a3;
- (void)removeCLI:(id)a3;
- (void)removeDiagnosticObject:(id)a3;
- (void)removeFds:(id)a3;
- (void)removeLibClient:(id)a3;
- (void)removeProgressTracking:(id)a3;
- (void)sendProgress:(double)a3 phase:(unint64_t)a4 toPeers:(id)a5;
- (void)setCliManager:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setCurrentClient:(id)a3;
- (void)setDiagnosticManager:(id)a3;
- (void)setFdManager:(id)a3;
- (void)setIdManager:(id)a3;
- (void)setIsDaemon:(BOOL)a3;
- (void)setLocalLogCollectionDiagnosticID:(id)a3;
- (void)setPeerManager:(id)a3;
- (void)setPidManager:(id)a3;
- (void)setPossibleClient:(id)a3;
- (void)setProgressManager:(id)a3;
- (void)stderrWrite:(id)a3;
- (void)stdoutWrite:(id)a3;
@end

@implementation SDResourceManager

+ (id)sharedResourceManager
{
  if (qword_1000A5190 != -1) {
    dispatch_once(&qword_1000A5190, &stru_100089000);
  }
  return (id)qword_1000A5188;
}

- (SDResourceManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SDResourceManager;
  v2 = -[SDResourceManager init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    v2->_count = 0LL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    idManager = v3->_idManager;
    v3->_idManager = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    fdManager = v3->_fdManager;
    v3->_fdManager = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cliManager = v3->_cliManager;
    v3->_cliManager = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    diagnosticManager = v3->_diagnosticManager;
    v3->_diagnosticManager = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pidManager = v3->_pidManager;
    v3->_pidManager = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    progressManager = v3->_progressManager;
    v3->_progressManager = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    peerManager = v3->_peerManager;
    v3->_peerManager = (NSMutableDictionary *)v16;

    possibleClient = v3->_possibleClient;
    v3->_possibleClient = (NSString *)@"(NONE)";

    currentClient = v3->_currentClient;
    v3->_currentClient = (NSString *)@"(NONE)";

    v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v20;

    -[NSDateFormatter setDateFormat:](v3->_dateFormatter, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss");
  }

  return v3;
}

- (BOOL)registerDiagnosticObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diagnosticID]);
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    -[NSMutableDictionary setObject:forKey:](v6->_diagnosticManager, "setObject:forKey:", v4, v5);
    objc_sync_exit(v6);
  }

  return v5 != 0LL;
}

- (id)diagnosticObjectForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_diagnosticManager, "objectForKey:", v4));
    objc_sync_exit(v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)checkAndIncreaseDiagnosticCountForDiagnosticID:(id)a3 collectingLocalLogs:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v4)
  {
LABEL_12:
    -[SDResourceManager setCount:](v7, "setCount:", (char *)-[SDResourceManager count](v7, "count") + 1);
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = -[SDResourceManager count](v7, "count");
      int v15 = 134217984;
      int64_t v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Increased diagnostic atomic count to %ld.",  (uint8_t *)&v15,  0xCu);
    }

    BOOL v11 = 1;
    goto LABEL_15;
  }

  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v7, "localLogCollectionDiagnosticID"));

    if (v8)
    {
      id v9 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v7, "localLogCollectionDiagnosticID"));
        int v15 = 138412290;
        int64_t v16 = (int64_t)v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Rejected request for new diagnostic with local logs. Already collecting local logs for %@",  (uint8_t *)&v15,  0xCu);
      }

      goto LABEL_9;
    }

    -[SDResourceManager setLocalLogCollectionDiagnosticID:](v7, "setLocalLogCollectionDiagnosticID:", v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      int64_t v16 = (int64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Increasing diagnostic count for local log collection for diagnosticID: %@",  (uint8_t *)&v15,  0xCu);
    }

    goto LABEL_12;
  }

  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Rejected request for new diagnostic with local logs - given nil diagnosticID!",  (uint8_t *)&v15,  2u);
LABEL_9:
    BOOL v11 = 0;
  }

- (BOOL)decreaseDiagnosticCountForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SDResourceManager setCount:](v5, "setCount:", (char *)-[SDResourceManager count](v5, "count") - 1);
  id v6 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    int64_t v23 = -[SDResourceManager count](v5, "count");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Decreased diagnostic atomic count to %ld.",  (uint8_t *)&v22,  0xCu);
  }

  id v7 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager currentClient](v5, "currentClient"));
    int v22 = 138412290;
    int64_t v23 = (int64_t)v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Current client %@",  (uint8_t *)&v22,  0xCu);
  }

  id v9 = -[SDResourceManager count](v5, "count");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
  LOBYTE(v9) = v9 == [v10 count];

  if ((v9 & 1) == 0)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
    -[SDResourceManager setCount:](v5, "setCount:", [v11 count]);

    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053D10(buf, -[SDResourceManager count](v5, "count"));
    }

    id v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
      int v22 = 138412290;
      int64_t v23 = (int64_t)v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Current fds: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
  BOOL v16 = v15 == v4;

  if (v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      int64_t v23 = (int64_t)v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resetting local log collection ID for caller: %@",  (uint8_t *)&v22,  0xCu);
    }

    -[SDResourceManager setLocalLogCollectionDiagnosticID:](v5, "setLocalLogCollectionDiagnosticID:", 0LL);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
  if (v17)
  {
    BOOL v18 = -[SDResourceManager count](v5, "count") == 0;

    if (v18)
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
        sub_100053CAC(v20, (uint64_t)v4, (uint8_t *)&v22);
      }

      -[SDResourceManager setLocalLogCollectionDiagnosticID:](v5, "setLocalLogCollectionDiagnosticID:", 0LL);
    }
  }

  objc_sync_exit(v5);

  return 1;
}

- (BOOL)decreaseDiagnosticCount
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  LOBYTE(v2) = -[SDResourceManager decreaseDiagnosticCountForDiagnosticID:]( v2,  "decreaseDiagnosticCountForDiagnosticID:",  v3);

  return (char)v2;
}

- (BOOL)areDiagnosticsInFlight
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[SDResourceManager count](v2, "count") > 0;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)numberDiagnosticsInflight
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableDictionary count](v2->_fdManager, "count");
  objc_sync_exit(v2);

  return (int64_t)v3;
}

- (id)getCurrentInflightLocalDiagnostic
{
  v2 = self;
  objc_sync_enter(v2);
  if ((id)-[SDResourceManager numberDiagnosticsInflight](v2, "numberDiagnosticsInflight") == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_idManager, "allValues"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);

    objc_sync_exit(v2);
    return v4;
  }

  else
  {
    id v6 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = -[SDResourceManager numberDiagnosticsInflight](v2, "numberDiagnosticsInflight");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Number of sysdiagnoses in flight are %ld when should be 1 -- ABORT",  (uint8_t *)&v7,  0xCu);
    }

    objc_sync_exit(v2);
    return 0LL;
  }

- (id)getActivityID
{
  return +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  os_activity_get_identifier((os_activity_t)&_os_activity_current, 0LL));
}

- (id)getDiagnosticIDSimple
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_idManager, "objectForKey:", v3));
  objc_sync_exit(v4);

  return v5;
}

- (id)getDiagnosticID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager registerActivity](self, "registerActivity"));
  }
  return v3;
}

- (BOOL)diagnosticIDExists:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)setUpLibClient:(id)a3 clientPid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary setObject:forKey:](v8->_pidManager, "setObject:forKey:", v6, v7);
  objc_sync_exit(v8);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = [v7 intValue];
    __int16 v11 = 2080;
    id v12 = [v6 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Set up pid %d with diagnosticID %s",  (uint8_t *)v10,  0x12u);
  }

  return 1;
}

- (BOOL)setUpDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
  id v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary setObject:forKey:](v6->_idManager, "setObject:forKey:", v4, v5);
  objc_sync_exit(v6);

  return 1;
}

- (BOOL)setUpSysdiagnoseSession:(id)a3 clientPid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](self, "fdManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  if (!v9) {
    -[SDResourceManager setUpDiagnosticID:](self, "setUpDiagnosticID:", v6);
  }
  -[SDResourceManager setUpLibClient:clientPid:](self, "setUpLibClient:clientPid:", v6, v7);

  return 1;
}

- (id)getDiagnosticIDForPid:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_pidManager, "objectForKey:", v4));
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)registerActivityWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
    if ([v5 isEqual:&off_10009A3A8])
    {
      BOOL v6 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        id v13 = [v5 longLongValue];
        __int16 v14 = 2080;
        id v15 = [v4 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Activity %016llX requested to register with diagnostic ID %s -- ABORT",  (uint8_t *)&v12,  0x16u);
        BOOL v6 = 0;
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));

      if (v7)
      {
        BOOL v6 = 1;
      }

      else
      {
        int64_t v8 = self;
        objc_sync_enter(v8);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_fdManager, "objectForKey:", v4));
        objc_sync_exit(v8);

        BOOL v6 = v9 != 0LL;
        if (v9)
        {
          uint64_t v10 = v8;
          objc_sync_enter(v10);
          [v10[6] setObject:v4 forKey:v5];
          objc_sync_exit(v10);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134218242;
          id v13 = [v5 longLongValue];
          __int16 v14 = 2080;
          id v15 = [v4 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Did not find CLI file descriptors -- Activity %016llX not registered with diagnostic ID %s",  (uint8_t *)&v12,  0x16u);
        }
      }
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)registerActivity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  if (v3)
  {
    id v4 = v3;
  }

  else
  {
    os_activity_id_t identifier = os_activity_get_identifier((os_activity_t)&_os_activity_current, &parent_id);
    BOOL v6 = self;
    objc_sync_enter(v6);
    idManager = v6->_idManager;
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  parent_id));
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](idManager, "objectForKey:", v8));

    objc_sync_exit(v6);
    if (v4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  identifier));
      uint64_t v10 = v6;
      objc_sync_enter(v10);
      -[NSMutableDictionary setObject:forKey:](v6->_idManager, "setObject:forKey:", v4, v9);
      objc_sync_exit(v10);

      id v11 = v4;
    }

    else if (identifier {
           && -[SDResourceManager numberDiagnosticsInflight](v6, "numberDiagnosticsInflight")
    }
           && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      os_activity_id_t v15 = identifier;
      __int16 v16 = 2048;
      os_activity_id_t v17 = parent_id;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDResourceManager failed to register activity %016llX due to missing parent %016llX.",  buf,  0x16u);
    }
  }

  return v4;
}

- (BOOL)setUpCLI:(id)a3 stdoutfd:(int)a4 stderrfd:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (v8)
  {
    if (!-[SDResourceManager diagnosticIDExists:](self, "diagnosticIDExists:", v8)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = [v8 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ERROR: Trying to set up CLI streaming for a non-existent :D diagnosticID %s",  buf,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](self, "setUpFH:", v6));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](self, "setUpFH:", v5));
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  v10,  v11,  0LL));
    id v13 = self;
    objc_sync_enter(v13);
    -[NSMutableDictionary setObject:forKey:](v13->_cliManager, "setObject:forKey:", v12, v8);
    objc_sync_exit(v13);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 longLongValue];
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2048;
      id v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Set up CLI with diagnostic: %@, activity %016llX",  buf,  0x16u);
    }
  }

  return v8 != 0LL;
}

- (void)cliWrite:(int)a3 logStr:(id)a4 withParameters:(char *)a5
{
  id v23 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v8 || !-[SDResourceManager isDaemon](self, "isDaemon"))
  {
    id v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v23, a5);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v9, "stringByAppendingString:", @"\n"));

    if (-[SDResourceManager isDaemon](self, "isDaemon"))
    {
      id v11 = self;
      objc_sync_enter(v11);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11->_cliManager, "objectForKey:", v8));
      id v13 = v12;
      if (v12)
      {
        uint64_t v14 = a3;
        os_activity_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:a3]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11->_fdManager, "objectForKey:", v8));
        id v17 = "STDERR";
        if (!a3) {
          id v17 = "STDOUT";
        }
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"writing to %s. Resetting file descriptor to /dev/null.",  v17));
        if ((sub_100023CA4(v15, v16, v10, v18) & 1) == 0)
        {
          [v15 closeFile];
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](v11, "setUpFH:", 0xFFFFFFFFLL));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v14));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v19));
          [v13 replaceObjectsAtIndexes:v20 withObjects:v21];
        }
      }

      objc_sync_exit(v11);
    }

    else
    {
      int v22 = &__stdoutp;
      if (a3) {
        int v22 = &__stderrp;
      }
      fputs((const char *)[v10 UTF8String], *v22);
    }
  }
}

- (void)stdoutWrite:(id)a3
{
}

- (void)stderrWrite:(id)a3
{
}

- (void)_log:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_fdManager, "objectForKey:", v4));
    sub_100023CA4(v6, 0LL, v7, 0LL);

    objc_sync_exit(v5);
  }
}

- (id)setUpFH:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == -1)
  {
    uint64_t v3 = open("/dev/null", 1);
    if ((_DWORD)v3 == -1) {
      sub_100053D58();
    }
  }

  id v4 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v3,  1LL);
  if (!v4) {
    sub_100053D80();
  }
  return v4;
}

- (BOOL)setUpSysdiagnoseLog:(id)a3 withID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (-[SDResourceManager diagnosticIDExists:](self, "diagnosticIDExists:", v7))
    {
      id v9 = self;
      objc_sync_enter(v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9->_fdManager, "objectForKey:", v8));

      if (v10)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error: diagnosticID already set up by another process.",  (uint8_t *)&v23,  2u);
        }

        objc_sync_exit(v9);

        goto LABEL_13;
      }

      objc_sync_exit(v9);

      os_activity_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"sysdiagnose.log"]);
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      NSFileAttributeKey v27 = NSFilePosixPermissions;
      v28 = &off_10009A3C0;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      unsigned __int8 v18 = [v16 createFileAtPath:v15 contents:0 attributes:v17];

      if ((v18 & 1) == 0)
      {
        BOOL v11 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Bad sysdiagnosePath, unable to create sysdiagnose.log.",  (uint8_t *)&v23,  2u);
          BOOL v11 = 0;
        }

        goto LABEL_25;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v15));
      BOOL v11 = v19 != 0LL;
      if (v19)
      {
        v20 = v9;
        objc_sync_enter(v20);
        -[NSMutableDictionary setObject:forKey:](v9->_fdManager, "setObject:forKey:", v19, v8);
        objc_sync_exit(v20);

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412546;
          id v24 = v8;
          __int16 v25 = 2112;
          v26 = v19;
          v21 = "Set up sysdiagnose.log with diagnostic ID %@, filehandle: %@";
          uint32_t v22 = 22;
LABEL_23:
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v21,  (uint8_t *)&v23,  v22);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v21 = "Failed to create file handle for sysdiagnose.log";
        uint32_t v22 = 2;
        goto LABEL_23;
      }

LABEL_25:
      goto LABEL_14;
    }

    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315138;
      id v24 = [v8 UTF8String];
      int v12 = "ERROR: Trying to set up log for non-existent diagnosticID %s";
      uint32_t v13 = 12;
      goto LABEL_12;
    }
  }

  else
  {
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      int v12 = "sysdiagnose path or diagnosticID was null while trying to set up sysdiagnose.log.";
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v12,  (uint8_t *)&v23,  v13);
LABEL_13:
      BOOL v11 = 0;
    }
  }

- (void)closeSysdiagnoseLog
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    id v4 = v3;
    -[SDResourceManager removeFds:](self, "removeFds:", v3);
    uint64_t v3 = v4;
  }
}

- (void)log:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v6));
  id v8 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v5, &v10);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@\n", v7, v8));
  -[SDResourceManager _log:](self, "_log:", v9);
}

- (void)logWithSubsystem:(const char *)a3 category:(const char *)a4 msg:(id)a5
{
  dateFormatter = self->_dateFormatter;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v10));
  int v12 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &v14);

  uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [Subsystem %s, Category: %s] Log: %@\n",  v11,  a3,  a4,  v12));
  -[SDResourceManager _log:](self, "_log:", v13);
}

- (void)removeDiagnosticObject:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_diagnosticManager, "objectForKey:", v6));
  if (v5) {
    -[NSMutableDictionary removeObjectForKey:](v4->_diagnosticManager, "removeObjectForKey:", v6);
  }

  objc_sync_exit(v4);
}

- (void)removeActivityIDs:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_idManager, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_idManager, "objectForKey:", v10));
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12) {
          -[NSMutableDictionary removeObjectForKey:](v5->_idManager, "removeObjectForKey:", v10);
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeFds:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_fdManager, "objectForKey:", v4));
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Closing fd %@ for diagnosticid %@",  (uint8_t *)&v7,  0x16u);
    }

    -[NSMutableDictionary removeObjectForKey:](v5->_fdManager, "removeObjectForKey:", v4);
    [v6 closeFile];
  }

  objc_sync_exit(v5);
}

- (void)removeCLI:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_cliManager, "objectForKey:", v11));
  id v6 = v5;
  if (v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
      [v8 closeFile];
    }

    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
      [v10 closeFile];
    }

    -[NSMutableDictionary removeObjectForKey:](v4->_cliManager, "removeObjectForKey:", v11);
  }

  objc_sync_exit(v4);
}

- (void)removeLibClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_pidManager, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_pidManager, "objectForKey:", v10));
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12) {
          -[NSMutableDictionary removeObjectForKey:](v5->_pidManager, "removeObjectForKey:", v10);
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeProgressTracking:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager progressManager](v4, "progressManager"));
  [v5 removeObjectForKey:v7];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager peerManager](v4, "peerManager"));
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v4);
}

- (void)_closeSysdiagnoseSessionHelper:(id)a3
{
  id v5 = a3;
  -[SDResourceManager decreaseDiagnosticCountForDiagnosticID:](self, "decreaseDiagnosticCountForDiagnosticID:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v4)
  {
    -[SDResourceManager removeDiagnosticObject:](self, "removeDiagnosticObject:", v5);
    -[SDResourceManager removeActivityIDs:](self, "removeActivityIDs:", v4);
    -[SDResourceManager removeLibClient:](self, "removeLibClient:", v4);
    -[SDResourceManager removeProgressTracking:](self, "removeProgressTracking:", v4);
  }
}

- (void)closeSysdiagnoseSession
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  -[SDResourceManager _closeSysdiagnoseSessionHelper:](self, "_closeSysdiagnoseSessionHelper:", v3);
}

- (void)closeCLI
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    id v4 = v3;
    -[SDResourceManager removeCLI:](self, "removeCLI:", v3);
    id v3 = v4;
  }
}

- (void)clearAllResources
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_fdManager, "allKeys"));
  objc_sync_exit(v2);

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)i);
        -[SDResourceManager cancelAll:](v2, "cancelAll:", v8, (void)v9);
        -[SDResourceManager removeDiagnosticObject:](v2, "removeDiagnosticObject:", v8);
        -[SDResourceManager removeActivityIDs:](v2, "removeActivityIDs:", v8);
        -[SDResourceManager removeFds:](v2, "removeFds:", v8);
        -[SDResourceManager removeCLI:](v2, "removeCLI:", v8);
        -[SDResourceManager removeLibClient:](v2, "removeLibClient:", v8);
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (BOOL)initProgressTrackerWithConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  uint64_t v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    __int128 v9 = self;
    objc_sync_enter(v9);
    __int128 v10 = objc_alloc_init(&OBJC_CLASS___ProgressTracker);
    for (uint64_t i = 0LL; i != 64; i += 8LL)
      *(void *)((char *)-[ProgressTracker phaseTracker](v10, "phaseTracker") + i) = 0LL;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_progressManager, "setObject:forKeyedSubscript:", v10, v6);
    id v14 = v4;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_peerManager, "setObject:forKeyedSubscript:", v12, v6);

    objc_sync_exit(v9);
  }

  return v8;
}

- (BOOL)initConnectionWithPeer:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    __int128 v10 = self;
    objc_sync_enter(v10);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_peerManager, "objectForKeyedSubscript:", v8));

    BOOL v9 = v11 != 0LL;
    if (v11)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_peerManager, "objectForKeyedSubscript:", v8));
      id v13 = [v12 mutableCopy];

      [v13 addObject:v6];
      id v14 = [v13 copy];
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_peerManager, "setObject:forKeyedSubscript:", v14, v8);
    }

    objc_sync_exit(v10);
  }

  return v9;
}

- (BOOL)setupProgressTotal:(unint64_t)a3 forPhase:(int)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v7)
  {
    BOOL v8 = self;
    objc_sync_enter(v8);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_progressManager, "objectForKeyedSubscript:", v7));
    __int128 v10 = v9;
    BOOL v11 = v9 != 0LL;
    if (v9) {
      *((double *)[v9 phaseTracker] + a4) = (double)a3;
    }

    objc_sync_exit(v8);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)sendProgress:(double)a3 phase:(unint64_t)a4 toPeers:(id)a5
{
  id v8 = a5;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  id v10 = v8;
  BOOL v11 = v10;
  if (v10) {
    goto LABEL_2;
  }
  if (!v9) {
    goto LABEL_18;
  }
  id v13 = self;
  objc_sync_enter(v13);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13->_peerManager, "objectForKeyedSubscript:", v9));
  objc_sync_exit(v13);

  if (v11)
  {
LABEL_2:
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_double(v12, (const char *)[sdProgressPercent UTF8String], a3);
    xpc_dictionary_set_uint64(v12, (const char *)[sdProgressPhase UTF8String], a4);
    if (v9)
    {
      xpc_dictionary_set_string( v12, (const char *)[sdProgressDiagnosticId UTF8String], (const char *)objc_msgSend(v9, "UTF8String"));
    }

    else
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_100053DDC(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v30 = v11;
    id v31 = [v30 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v31; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(v30);
          }
          xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v34 + 1) + 8LL * (void)i), v12);
        }

        id v31 = [v30 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v31);
    }
  }

  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_100053DA8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

- (BOOL)finishedItemForPhaseAndUpdatePeer:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v5)
  {
    if ((int)v3 <= 3)
    {
      id v8 = self;
      objc_sync_enter(v8);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8->_progressManager,  "objectForKeyedSubscript:",  v5));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_peerManager, "objectForKeyedSubscript:", v5));
      if (v9)
      {
        [v9 increaseCountForPhase:v3];
        [v9 getProgress];
        double v11 = v10;
      }

      else
      {
        double v11 = 0.0;
      }

      objc_sync_exit(v8);
      if (!v9) {
        goto LABEL_11;
      }
      if (v6)
      {
        -[SDResourceManager sendProgress:phase:toPeers:](v8, "sendProgress:phase:toPeers:", 2LL, v6, v11);
        BOOL v7 = 1;
LABEL_12:

        goto LABEL_13;
      }

      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v13) {
        sub_100053E10(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    id v6 = 0LL;
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }

  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (void)initPeerProgressHandler
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_peerManager, "objectForKeyedSubscript:", v3));
    objc_sync_exit(v4);

    if (v5)
    {
      xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_double(v6, (const char *)[sdProgressPercent UTF8String], 0.0);
      xpc_dictionary_set_uint64(v6, (const char *)[sdProgressPhase UTF8String], 1uLL);
      xpc_dictionary_set_string( v6, (const char *)[sdProgressDiagnosticId UTF8String], (const char *)objc_msgSend(v3, "UTF8String"));
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v20;
        do
        {
          double v10 = 0LL;
          do
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v7);
            }
            xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v19 + 1) + 8LL * (void)v10), v6);
            double v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v8);
      }
    }

    else
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_100053E10(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (BOOL)cancelAll:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_cliManager, "objectForKey:", v4));
    objc_sync_exit(v5);

    BOOL v7 = v6 != 0LL;
    if (v6) {
      -[SDResourceManager removeCLI:](v5, "removeCLI:", v4);
    }
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)stringForPhaseID:(int)a3
{
  else {
    return off_100089020[a3];
  }
}

- (id)elapsedMetricForPhaseID:(int)a3
{
  else {
    return *(id *)*(&off_100089040 + a3);
  }
}

- (id)getContainersMetricForPhaseId:(int)a3
{
  else {
    return *(id *)*(&off_100089060 + a3);
  }
}

- (double)getMinimumTimeBeforeTimeoutsForPhaseID:(int)a3
{
  double result = 0.0;
  return result;
}

- (NSString)possibleClient
{
  return self->_possibleClient;
}

- (void)setPossibleClient:(id)a3
{
}

- (NSString)currentClient
{
  return self->_currentClient;
}

- (void)setCurrentClient:(id)a3
{
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSMutableDictionary)idManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdManager:(id)a3
{
}

- (NSMutableDictionary)fdManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setFdManager:(id)a3
{
}

- (NSMutableDictionary)cliManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCliManager:(id)a3
{
}

- (NSMutableDictionary)peerManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPeerManager:(id)a3
{
}

- (NSMutableDictionary)progressManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setProgressManager:(id)a3
{
}

- (NSMutableDictionary)diagnosticManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDiagnosticManager:(id)a3
{
}

- (NSMutableDictionary)pidManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setPidManager:(id)a3
{
}

- (NSString)localLogCollectionDiagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLocalLogCollectionDiagnosticID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end