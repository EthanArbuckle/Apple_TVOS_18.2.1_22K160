@interface CDKnowledgeDaemon
+ (id)defaultDaemon;
+ (id)defaultUserDaemon;
- (BOOL)isClassCLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDKnowledgeDaemon)init;
- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3;
- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3 storePath:(id)a4;
- (_DKKnowledgeStorage)storage;
- (_DKSyncCoordinator)syncCoordinator;
- (id)classCError;
- (id)confirmDatabaseConnectionError;
- (void)confirmDatabaseConnectionWithReply:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4;
- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4;
- (void)deleteObjects:(id)a3 reply:(id)a4;
- (void)deleteRemoteState:(id)a3;
- (void)deviceUUIDWithReply:(id)a3;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)executeQuery:(id)a3 reply:(id)a4;
- (void)handleError:(id)a3;
- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)logSizeOfStorage:(id)a3;
- (void)maintainPrivacyWithActivity:(id)a3;
- (void)registerDataCollectionTasks;
- (void)reportEventStatistics;
- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4;
- (void)saveObjects:(id)a3 reply:(id)a4;
- (void)setSyncCoordinator:(id)a3;
- (void)sourceDeviceIdentityWithReply:(id)a3;
- (void)synchronizeWithReply:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5;
@end

@implementation CDKnowledgeDaemon

+ (id)defaultDaemon
{
  if (qword_100022680 != -1) {
    dispatch_once(&qword_100022680, &stru_10001C7A0);
  }
  return (id)qword_100022678;
}

+ (id)defaultUserDaemon
{
  if (qword_100022698 != -1) {
    dispatch_once(&qword_100022698, &stru_10001C7C0);
  }
  return (id)qword_100022690;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _DKDaemonInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setExportedInterface:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.coreduetd.allow"]);
  v9 = v8;
  if (v8 && [v8 BOOLValue])
  {
    v10 = objc_alloc_init(&OBJC_CLASS___CDKnowledgeDaemonConnection);
    -[CDKnowledgeDaemonConnection setDaemon:](v10, "setDaemon:", self);
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&audittoken, 0, sizeof(audittoken));
    }
    if (proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) < 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
      if (!v14)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.application-identifier"]);
        -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v20);

        goto LABEL_16;
      }
    }

    else
    {
      v12 = strrchr(buffer, 47);
      if (v12) {
        v13 = v12 + 1;
      }
      else {
        v13 = buffer;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    }

    -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v14);
LABEL_16:

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection processName](v10, "processName"));
    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"pid:%d",  [v5 processIdentifier]));
      -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v16);
    }

    -[CDKnowledgeDaemonConnection setAuthorizedEventStreamsToRead:](v10, "setAuthorizedEventStreamsToRead:", 0LL);
    [v5 setExportedObject:v10];
    [v5 setDelegate:self];
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unsigned int v18 = [v5 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Connection from PID %d accepted", buf, 8u);
    }

    [v5 resume];
    BOOL v11 = 1;
    goto LABEL_21;
  }

  v10 = (CDKnowledgeDaemonConnection *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_100011658(v5, (os_log_s *)v10);
  }
  BOOL v11 = 0;
LABEL_21:

  return v11;
}

- (CDKnowledgeDaemon)init
{
  return -[CDKnowledgeDaemon initWithMachServiceName:](self, "initWithMachServiceName:", _DKMachServiceName);
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths knowledgeDatabaseDirectory](&OBJC_CLASS___CDDPaths, "knowledgeDatabaseDirectory"));
  uint64_t v6 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](self, "initWithMachServiceName:storePath:", v4, v5);

  return v6;
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3 storePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___CDKnowledgeDaemon;
  v8 = -[CDKnowledgeDaemon initWithMachServiceName:](&v38, "initWithMachServiceName:", v6);
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_DKKnowledgeStorage storageWithDirectory:readOnly:]( &OBJC_CLASS____DKKnowledgeStorage,  "storageWithDirectory:readOnly:",  v7,  0LL));
    id delegate = v8->super._delegate;
    v8->super._id delegate = (id)v9;

    BOOL v11 = objc_alloc_init(&OBJC_CLASS____DKDataProtectionStateMonitor);
    xconnection = v8->super._xconnection;
    v8->super._xconnection = v11;

    -[CDKnowledgeDaemon setDelegate:](v8, "setDelegate:", v8);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer]( &OBJC_CLASS____DKRateLimitPolicyEnforcer,  "rateLimitPolicyEnforcer"));
    dispatch_queue_t userQueue = v8->super._userQueue;
    v8->super._dispatch_queue_t userQueue = (dispatch_queue_t)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer]( &OBJC_CLASS____DKPrivacyPolicyEnforcer,  "privacyPolicyEnforcer"));
    reserved0 = v8->super.reserved0;
    v8->super.reserved0 = (void *)v15;

    objc_initWeak(&location, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_1_DAY));
    [v17 doubleValue];
    double v19 = v18;
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_10000E1CC;
    v34 = &unk_10001C7E8;
    id v35 = 0LL;
    objc_copyWeak(&v36, &location);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:handler:]( &OBJC_CLASS____CDPeriodicSchedulerJob,  "jobWithInterval:schedulerJobName:handler:",  v6,  &v31,  v19));

    keys[0] = (char *)XPC_ACTIVITY_INTERVAL;
    keys[1] = (char *)XPC_ACTIVITY_REPEATING;
    keys[2] = (char *)XPC_ACTIVITY_PRIORITY;
    keys[3] = (char *)XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    keys[4] = (char *)XPC_ACTIVITY_POWER_NAP;
    keys[5] = (char *)XPC_ACTIVITY_ALLOW_BATTERY;
    keys[6] = (char *)XPC_ACTIVITY_MEMORY_INTENSIVE;
    keys[7] = (char *)XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v21 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v22 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v23 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v24 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v25 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    id v26 = &_xpc_BOOL_true;
    values[7] = &_xpc_BOOL_true;
    xpc_object_t v27 = xpc_dictionary_create((const char *const *)keys, values, 8uLL);
    objc_msgSend(v20, "setExecutionCriteria:", v27, v31, v32, v33, v34);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](&OBJC_CLASS____CDPeriodicScheduler, "sharedInstance"));
    [v28 registerJob:v20];

    -[CDKnowledgeDaemon resume](v8, "resume");
    for (uint64_t i = 7LL; i != -1; --i)

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (BOOL)isClassCLocked
{
  return [self->super._xconnection isDataAvailableFor:NSFileProtectionCompleteUntilFirstUserAuthentication] ^ 1;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:]( &OBJC_CLASS____CDErrorUtilities,  "isCoreDataFatalError:",  v4))
  {
    +[_CDDiagnosticDataReporter addValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "addValue:forScalarKey:",  1LL,  @"com.apple.coreduet.deletedDB.knowledgebase.corrupted");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100011C28();
    }

    [self->super._delegate deleteStorage];
  }
}

- (id)classCError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  id v6 = @"device is not class C unlocked";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.coreduet",  0LL,  v2));

  return v3;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0LL, v8);
  }

  else
  {
    uint64_t v9 = objc_autoreleasePoolPush();
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[dispatch_queue_s filterObjectsByEnforcingRateLimit:]( self->super._userQueue,  "filterObjectsByEnforcingRateLimit:",  v6));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([self->super.reserved0 enforcePrivacy:v10]);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100011C94(v11);
    }

    +[_CDDiagnosticDataReporter addValue:forScalarKey:]( _CDDiagnosticDataReporter,  "addValue:forScalarKey:",  [v11 count],  @"com.apple.coreduet.knowledgeStore.saveObjectsCount");
    id delegate = self->super._delegate;
    id v17 = 0LL;
    id v14 = [delegate saveObjects:v11 error:&v17];
    id v15 = v17;
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v15));
      ((void (**)(id, id, void *))v7)[2](v7, v14, v16);
    }

    -[CDKnowledgeDaemon handleError:](self, "handleError:", v15);

    objc_autoreleasePoolPop(v9);
  }
}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0LL, v8);
  }

  else
  {
    -[dispatch_queue_s creditForDeletion:](self->super._userQueue, "creditForDeletion:", v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100011D00(v6);
    }

    +[_CDDiagnosticDataReporter addValue:forScalarKey:]( _CDDiagnosticDataReporter,  "addValue:forScalarKey:",  [v6 count],  @"com.apple.coreduet.knowledgeStore.deleteObjectsCount");
    v10 = objc_autoreleasePoolPush();
    id delegate = self->super._delegate;
    id v15 = 0LL;
    id v12 = [delegate deleteObjects:v6 error:&v15];
    id v13 = v15;
    if (v7)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v13));
      ((void (**)(id, id, void *))v7)[2](v7, v12, v14);
    }

    -[CDKnowledgeDaemon handleError:](self, "handleError:", v13);

    objc_autoreleasePoolPop(v10);
  }
}

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStreamName:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStreamName:",  a3));
  -[CDKnowledgeDaemon deleteAllEventsMatchingPredicate:reply:](self, "deleteAllEventsMatchingPredicate:reply:", v7, v6);
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (!-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    if (v6)
    {
      id v15 = 0LL;
      unsigned int v9 = +[_DKPredicateValidator validatePredicate:allowedKeys:error:]( &OBJC_CLASS____DKPredicateValidator,  "validatePredicate:allowedKeys:error:",  v6,  0LL,  &v15);
      id v10 = v15;
      if (!v9)
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100011D6C();
        }

        v7[2](v7, 0LL, v10);
        goto LABEL_10;
      }

      [v6 allowEvaluation];
    }

    id delegate = self->super._delegate;
    id v14 = 0LL;
    id v12 = [delegate deleteAllEventsMatchingPredicate:v6 error:&v14];
    id v10 = v14;
    ((void (**)(id, id, id))v7)[2](v7, v12, v10);
LABEL_10:

    goto LABEL_11;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
  v7[2](v7, 0LL, v8);

LABEL_11:
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0LL, v8);
  }

  else
  {
    +[_CDDiagnosticDataReporter addValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "addValue:forScalarKey:",  1LL,  @"com.apple.coreduet.knowledgeStore.executeQueryCount");
    id delegate = self->super._delegate;
    id v13 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([delegate executeQuery:v6 error:&v13]);
    id v11 = v13;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v11));
    ((void (**)(id, void *, void *))v7)[2](v7, v10, v12);

    -[CDKnowledgeDaemon handleError:](self, "handleError:", v11);
  }
}

- (void)maintainPrivacyWithActivity:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  NSErrorUserInfoKey v5 = (void *)os_transaction_create("CDKnowledgeDaemon.m:613");
  id v6 = objc_autoreleasePoolPush();
  +[_DKStandingQueryExecutor executeAllStandingQueriesWithStorage:activity:]( &OBJC_CLASS____DKStandingQueryExecutor,  "executeAllStandingQueriesWithStorage:activity:",  self->super._delegate,  v4);
  objc_autoreleasePoolPop(v6);
  if (!v4 || !xpc_activity_should_defer(v4))
  {
    uint64_t v27 = 4LL;
    v28 = self;
    v29 = v5;
    activity = v4;
    uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
    id v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          id v13 = objc_autoreleasePoolPush();
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
          if (v14) {
            -[NSMutableArray addObject:](v32, "addObject:", v14);
          }
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationExtensionRecords", v27 * 8));
          id v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v36;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) effectiveBundleIdentifier]);
                if (v20) {
                  -[NSMutableArray addObject:](v8, "addObject:", v20);
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }

            while (v17);
          }

          objc_autoreleasePoolPop(v13);
        }

        id v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }

      while (v10);
    }

    id v7 = v32;
    id v21 = v8;
    id v4 = activity;
    if (activity)
    {
      id v22 = v28;
      if (xpc_activity_should_defer(activity))
      {
        id v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
        NSErrorUserInfoKey v5 = v29;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Privacy maintenance deferred after installedApps query.";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          goto LABEL_33;
        }

        goto LABEL_33;
      }

      id v26 = objc_autoreleasePoolPush();
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]( &OBJC_CLASS____DKPrivacyMaintainer,  "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMax Lifespan:activity:",  (&v28->super.super.isa)[v27],  v7,  v21,  4000LL,  100000LL,  activity,  2419200.0);
      objc_autoreleasePoolPop(v26);
      NSErrorUserInfoKey v5 = v29;
      if (xpc_activity_should_defer(activity))
      {
        id v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Privacy maintenance deferred after maintain privacy.";
          goto LABEL_31;
        }

- (void)logSizeOfStorage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 directory]);
  if (v4
    && (NSErrorUserInfoKey v5 = (void *)v4,
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseName]),
        v6,
        v5,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 directory]);
    v29[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseName]);
    v29[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v9));

    id v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db", v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 attributesOfItemAtPath:v11 error:0]);

    if (v13)
    {
      id v14 = (char *)[v13 fileSize];
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@C.db-wal",  v10));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 attributesOfItemAtPath:v15 error:0]);

      if (v17)
      {
        uint64_t v18 = &v14[(void)[v17 fileSize]];
        double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v11;
          __int16 v27 = 2048;
          v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
        }

        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseName]);
          unsigned int v21 = [v20 containsString:@"sync"];

          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
          BOOL v23 = os_signpost_enabled(v22);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              id v26 = v18;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "SyncDatabaseSize",  "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ",  buf,  0xCu);
            }

            id v24 = @"com.apple.coreduet.knowledgeStore.syncDatabaseSize";
          }

          else
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              id v26 = v18;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "DatabaseSize",  "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ",  buf,  0xCu);
            }

            id v24 = @"com.apple.coreduet.knowledgeStore.databaseSize";
          }

          +[_CDDiagnosticDataReporter setValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:",  v18,  v24);
        }
      }
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100011DCC();
    }
  }
}

- (void)reportEventStatistics
{
  id v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.reportEventStatistics",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  uint64_t v18 = self;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([self->super._delegate eventCountPerStreamName]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
        id v12 = [v11 unsignedIntegerValue];

        v7 += (uint64_t)v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByReplacingOccurrencesOfString:@"/" withString:@"_"]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.coreduet.knowledgeStore.eventCount",  v13));
        +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:limitingSigDigs:",  v12,  v14,  2LL);
        _cdknowledge_signpost_event_count(v12, v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.total",  @"com.apple.coreduet.knowledgeStore.eventCount"));
  +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:limitingSigDigs:",  v7,  v15,  2LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v18->super._delegate storage]);
  -[CDKnowledgeDaemon logSizeOfStorage:](v18, "logSizeOfStorage:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v18->super._delegate syncStorage]);
  -[CDKnowledgeDaemon logSizeOfStorage:](v18, "logSizeOfStorage:", v17);
}

- (id)confirmDatabaseConnectionError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  id v6 = @"unable to confirm underlying database connection.";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.coreduet",  0LL,  v2));

  return v3;
}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  id v9 = (void (**)(id, void, uint64_t))a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
LABEL_6:
    uint64_t v8 = (void *)v4;
    v9[2](v9, 0LL, v4);

    goto LABEL_7;
  }

  NSErrorUserInfoKey v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storage]);
  unsigned int v7 = [v6 confirmDatabaseConnectionFor:NSFileProtectionCompleteUntilFirstUserAuthentication];

  if (!v7)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon confirmDatabaseConnectionError](self, "confirmDatabaseConnectionError"));
    goto LABEL_6;
  }

  v9[2](v9, 1LL, 0LL);
LABEL_7:
}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  NSErrorUserInfoKey v5 = (void (**)(id, void *, id))a4;
  id v6 = objc_alloc(&OBJC_CLASS___BMAccessClient);
  id v7 = [v6 initWithUseCase:BMUseCaseConnectionProxy];
  id v10 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestEndpointForDomain:v4 error:&v10]);
  id v9 = v10;
  v5[2](v5, v8, v9);
}

- (void)registerDataCollectionTasks
{
  if (+[_CDDeviceInfo isRunningOnInternalBuild](&OBJC_CLASS____CDDeviceInfo, "isRunningOnInternalBuild"))
  {
    -[CDKnowledgeDaemon registerCDInteractionDataCollectionTask](self, "registerCDInteractionDataCollectionTask");
    -[CDKnowledgeDaemon registerCDFTCPInteractionDataCollectionTask]( self,  "registerCDFTCPInteractionDataCollectionTask");
    -[CDKnowledgeDaemon registerPersonLinkingDataCollectionTask](self, "registerPersonLinkingDataCollectionTask");
    -[CDKnowledgeDaemon registerVisionSignalGradingDataCollectionTask]( self,  "registerVisionSignalGradingDataCollectionTask");
  }

  -[CDKnowledgeDaemon registerAirPlayTasks](self, "registerAirPlayTasks");
  -[CDKnowledgeDaemon macSleepModelingDataCollectionTasks](self, "macSleepModelingDataCollectionTasks");
  -[CDKnowledgeDaemon registerMailIntelligencePETDataCollectionTask]( self,  "registerMailIntelligencePETDataCollectionTask");
}

- (void)synchronizeWithReply:(id)a3
{
  id v4 = a3;
  NSErrorUserInfoKey v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000F87C;
    v8[3] = &unk_10001C810;
    id v9 = v4;
    [v6 syncWithReply:v8];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](&OBJC_CLASS____DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000F9D0;
    v13[3] = &unk_10001C810;
    id v14 = v9;
    [v11 synchronizeWithUrgency:a3 client:v8 reply:v13];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](&OBJC_CLASS____DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v12);
  }
}

- (void)deleteRemoteState:(id)a3
{
  id v4 = a3;
  NSErrorUserInfoKey v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FB00;
    v8[3] = &unk_10001C810;
    id v9 = v4;
    [v6 deleteRemoteStateWithReply:v8];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](&OBJC_CLASS____DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
  }
}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  id v8 = a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    NSErrorUserInfoKey v5 = (void (*)(void))v8[2];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceDeviceIdentity]);

    if (!v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKSyncErrors unavailableForCurrentUser]( &OBJC_CLASS____DKSyncErrors,  "unavailableForCurrentUser"));
      ((void (*)(void *, void, void *))v8[2])(v8, 0LL, v7);

      goto LABEL_7;
    }

    NSErrorUserInfoKey v5 = (void (*)(void))v8[2];
  }

  v5();
LABEL_7:
}

- (void)deviceUUIDWithReply:(id)a3
{
  id v8 = a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    NSErrorUserInfoKey v5 = (void (*)(void))v8[2];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceUUID]);

    if (!v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKSyncErrors unavailableForCurrentUser]( &OBJC_CLASS____DKSyncErrors,  "unavailableForCurrentUser"));
      ((void (*)(void *, void, void *))v8[2])(v8, 0LL, v7);

      goto LABEL_7;
    }

    NSErrorUserInfoKey v5 = (void (*)(void))v8[2];
  }

  v5();
LABEL_7:
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  +[_DKSync2Policy disableSyncPolicyForFeature:transportType:disabled:]( &OBJC_CLASS____DKSync2Policy,  "disableSyncPolicyForFeature:transportType:disabled:",  a3,  a4,  1LL);
  v7[2](v7, 1LL, 0LL);
}

- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v7 = a5;
  (*((void (**)(id, void, void))v7 + 2))( v7,  +[_DKSync2Policy isSyncPolicyDisabledForFeature:transportType:]( &OBJC_CLASS____DKSync2Policy,  "isSyncPolicyDisabledForFeature:transportType:",  a3,  a4),  0LL);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v12 = v7;
  if (v5)
  {
    [v7 invoke];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 exportedObject]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 processName]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([&off_10001E130 objectForKeyedSubscript:v9]);
    unsigned int v11 = [v10 unsignedIntValue];

    if (v11 > 0x32) {
      [v12 invoke];
    }
    else {
      ((void (*)(id))*(&off_10001C830 + v11))(v12);
    }
  }
}

- (_DKKnowledgeStorage)storage
{
  return (_DKKnowledgeStorage *)self->super._delegate;
}

- (_DKSyncCoordinator)syncCoordinator
{
  return (_DKSyncCoordinator *)self->super._serviceName;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end