@interface DMMigrationState
+ (BOOL)_bootCountBeyondThreshold;
+ (BOOL)_shouldSuppressMigrationFailureAlert;
+ (id)sharedInstance;
- (BOOL)_showIgnoreTapToRadarAlertOption;
- (BOOL)isMigrationNeededWithBuildVersion:(id)a3 lastBuildVersion:(id)a4 clientPID:(int)a5;
- (BOOL)needsPreBoard;
- (BOOL)startMigrationAndOrBlockIfNecessaryWithClientInvocation:(id)a3 buildVersion:(id)a4 migrationStarterBlock:(id)a5;
- (DMMigrationSentinelManager)migrationSentinelManager;
- (DMMigrationState)initWithMigrationSentinelManager:(id)a3;
- (NSDictionary)pluginResults;
- (NSString)migrationPhaseDescription;
- (id)_telemetryDictionaryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 previousBuildVersion:(id)a7 userDataDisposition:(unsigned int)a8 userCategory:(unsigned int)a9;
- (id)_telemetryDictionaryMigrationDidCompleteWithDuration:(double)a3 fastPluginDuration:(double)a4 pluginCrashCount:(unsigned int)a5 pluginWatchdogCount:(unsigned int)a6 pluginReturnedFalseCount:(unsigned int)a7 previousBuildVersion:(id)a8 userDataDisposition:(unsigned int)a9 pluginCategories:(unsigned int)a10 userCategory:(unsigned int)a11 inAppleStore:(BOOL)a12 isFromFactory:(BOOL)a13;
- (void)_clearPluginResults;
- (void)_createRecursiveMutex;
- (void)_releaseMigrationFailureNotification;
- (void)_reportMigrationFailureIfApplicable;
- (void)_userDidRespondToMigrationFailureNotificationToFileRadar:(BOOL)a3;
- (void)blockUntilProgressHostIsReadyWithTimeoutTimeInterval:(double)a3;
- (void)dealloc;
- (void)persistIfNecessary;
- (void)pluginDidFinish:(id)a3 withSuccess:(BOOL)a4 duration:(double)a5 incident:(id)a6 migrationPhaseDescription:(id)a7;
- (void)pluginWillRun:(id)a3 migrationPhaseDescription:(id)a4;
- (void)progressHostIsReady;
- (void)progressWindowHadIncident:(id)a3;
- (void)reportTelemetryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 userDataDisposition:(id)a7 userCategory:(unsigned int)a8;
- (void)reportTelemetryWithMigrationDuration:(double)a3 userDataDisposition:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 inAppleStore:(BOOL)a7 isFromFactory:(BOOL)a8 startInterval:(double)a9 firstPluginStartInterval:(double)a10 endInterval:(double)a11;
- (void)sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:(id)a3;
- (void)sendMigrationResultsToClientInvocationsWithSuccess:(BOOL)a3 buildVersion:(id)a4;
- (void)setMigrationPhaseDescription:(id)a3;
- (void)setMigrationSentinelManager:(id)a3;
- (void)setNeedsMigrationFailureReport;
- (void)willRunPlugins:(id)a3;
- (void)willStartMigration;
@end

@implementation DMMigrationState

+ (id)sharedInstance
{
  if (qword_10002CB90 != -1) {
    dispatch_once(&qword_10002CB90, &stru_1000207C8);
  }
  return (id)qword_10002CB88;
}

- (DMMigrationState)initWithMigrationSentinelManager:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DMMigrationState;
  v6 = -[DMMigrationState init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_migrationSentinelManager, a3);
    -[DMMigrationState _createRecursiveMutex](v7, "_createRecursiveMutex");
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = v7->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    v7->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    waitingClientInvocations = v7->_waitingClientInvocations;
    v7->_waitingClientInvocations = (NSMutableArray *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completedPluginIdentifiers = v7->_completedPluginIdentifiers;
    v7->_completedPluginIdentifiers = v12;

    pluginResults = v7->_pluginResults;
    v7->_pluginResults = 0LL;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    incidents = v7->_incidents;
    v7->_incidents = v15;

    v7->_needsMigrationFailureReport = 0;
    migrationFailureNotificationTransaction = v7->_migrationFailureNotificationTransaction;
    v7->_migrationFailureNotification = 0LL;
    v7->_migrationFailureNotificationTransaction = 0LL;

    v7->_fastPluginMigrationDuration = 0.0;
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.datamigrator.migration", v19);
    migrationSerialQueue = v7->_migrationSerialQueue;
    v7->_migrationSerialQueue = (OS_dispatch_queue *)v20;
  }

  return v7;
}

- (void)_createRecursiveMutex
{
  if (pthread_mutexattr_init(&v3)
    || pthread_mutexattr_settype(&v3, 2)
    || pthread_mutex_init(&self->_recursiveMutex, &v3))
  {
    abort();
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMMigrationState;
  -[DMMigrationState dealloc](&v3, "dealloc");
}

- (NSString)migrationPhaseDescription
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  v4 = (__CFString *)-[NSString copy](self->_migrationPhaseDescription, "copy");
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  if (-[NSMutableDictionary count](self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers, "count"))
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeys]( self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers,  "allKeys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);

    id obj = v7;
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v8)
    {
LABEL_19:

      goto LABEL_20;
    }

    id v9 = v8;
    v24 = p_recursiveMutex;
    uint64_t v10 = *(void *)v27;
    do
    {
      v11 = 0LL;
      v12 = v5;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v11)));
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Concurrent: %@)",  v13));
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v14));

        v11 = (char *)v11 + 1;
        v12 = v5;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v9);

    p_recursiveMutex = v24;
    if (!v5)
    {
LABEL_11:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 buildVersion]);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
      dispatch_queue_attr_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastMigrationResultsPref]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dmlmr_buildVersion"));
      id obj = (id)v16;
      if ((+[DMEnvironment isBuildVersion:equalToBuildVersion:]( &OBJC_CLASS___DMEnvironment,  "isBuildVersion:equalToBuildVersion:",  v16,  v19) & 1) != 0)
      {
        dispatch_queue_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dmlmr_success"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dmlmr_success"));
          unsigned int v22 = [v21 BOOLValue];

          if (v22) {
            id v5 = @"kDMMigrationPhaseDescriptionDidFinishWithSuccess";
          }
          else {
            id v5 = @"kDMMigrationPhaseDescriptionDidFinishWithFailure";
          }
          goto LABEL_18;
        }
      }

      else
      {
      }

      id v5 = 0LL;
LABEL_18:

      goto LABEL_19;
    }
  }

- (NSDictionary)pluginResults
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v4 = [v3 implementMigrationPluginResults];

  if (v4)
  {
    p_recursiveMutex = &self->_recursiveMutex;
    pthread_mutex_lock(&self->_recursiveMutex);
    id v6 = -[NSMutableDictionary copy](self->_pluginResults, "copy");
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
      id v6 = (id)objc_claimAutoreleasedReturnValue([v7 migrationPluginResultsPref]);
    }

    pthread_mutex_unlock(p_recursiveMutex);
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSDictionary *)v6;
}

- (void)setMigrationPhaseDescription:(id)a3
{
  p_recursiveMutex = &self->_recursiveMutex;
  id v5 = a3;
  pthread_mutex_lock(p_recursiveMutex);
  id v6 = (NSString *)[v5 copy];

  migrationPhaseDescription = self->_migrationPhaseDescription;
  self->_migrationPhaseDescription = v6;

  pthread_mutex_unlock(p_recursiveMutex);
}

- (BOOL)isMigrationNeededWithBuildVersion:(id)a3 lastBuildVersion:(id)a4 clientPID:(int)a5
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    if ((+[DMEnvironment isBuildVersion:equalToBuildVersion:]( &OBJC_CLASS___DMEnvironment,  "isBuildVersion:equalToBuildVersion:",  v9,  v10) & 1) == 0) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    _DMLogFunc(v5, 3LL);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationState migrationSentinelManager](self, "migrationSentinelManager", v16));
  unsigned int v12 = [v11 isSentinelPresent];

  if (!v12
    && !+[DMMigrationState _bootCountBeyondThreshold](&OBJC_CLASS___DMMigrationState, "_bootCountBeyondThreshold"))
  {
    BOOL v14 = 0;
    goto LABEL_8;
  }

- (BOOL)needsPreBoard
{
  return +[DMMigrationState _bootCountBeyondThreshold](&OBJC_CLASS___DMMigrationState, "_bootCountBeyondThreshold");
}

+ (BOOL)_bootCountBeyondThreshold
{
  objc_super v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:kDMBootCountFolderName]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:kDMBootCountFileName]);
  uint64_t v16 = v7;
  _DMLogFunc(v2, 6LL);
  int v17 = 0;
  id v8 = v7;
  id v9 = fopen((const char *)objc_msgSend(v8, "UTF8String", v16), "r");
  if (v9)
  {
    id v10 = v9;
    int v11 = fscanf(v9, "%d", &v17);
    if (fclose(v10))
    {
      __error();
      _DMLogFunc(v2, 3LL);
    }

    uint64_t v12 = v2;
    if (v11 == 1) {
      uint64_t v13 = 6LL;
    }
    else {
      uint64_t v13 = 3LL;
    }
  }

  else
  {
    __error();
    uint64_t v12 = v2;
    uint64_t v13 = 4LL;
  }

  _DMLogFunc(v12, v13);
  BOOL v14 = v17 > 4;

  return v14;
}

- (BOOL)startMigrationAndOrBlockIfNecessaryWithClientInvocation:(id)a3 buildVersion:(id)a4 migrationStarterBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  -[DMMigrationState _lastPointBeforeEnteringPotentialStartOfMigrationCriticalSection]( self,  "_lastPointBeforeEnteringPotentialStartOfMigrationCriticalSection");
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastBuildVersionPref]);

  if ([v9 checkNecessity]
    && !-[DMMigrationState isMigrationNeededWithBuildVersion:lastBuildVersion:clientPID:]( self,  "isMigrationNeededWithBuildVersion:lastBuildVersion:clientPID:",  v10,  v14,  [v9 pid]))
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000082A4;
    v39[3] = &unk_1000207F0;
    v21 = &v40;
    id v40 = v10;
    id v41 = v9;
    unsigned int v22 = objc_retainBlock(v39);
  }

  else
  {
    v32 = v14;
    id v15 = v10;
    uint64_t v16 = v11;
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 earlyResultsPluginIdentifier]);
    if (!v17
      || (dispatch_queue_attr_t v18 = (void *)v17,
          completedPluginIdentifiers = self->_completedPluginIdentifiers,
          dispatch_queue_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 earlyResultsPluginIdentifier]),
          LODWORD(completedPluginIdentifiers) = -[NSMutableSet containsObject:]( completedPluginIdentifiers,  "containsObject:",  v20),  v20,  v18,  !(_DWORD)completedPluginIdentifiers))
    {
      id v23 = -[NSMutableArray count](self->_waitingClientInvocations, "count");
      BOOL v24 = v23 == 0LL;
      -[NSMutableArray addObject:](self->_waitingClientInvocations, "addObject:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 pid]));
      _DMLogFunc(v5, 6LL);

      if (v23)
      {
        id v11 = v16;
      }

      else
      {
        migrationSerialQueue = (dispatch_queue_s *)self->_migrationSerialQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000083D8;
        block[3] = &unk_100020818;
        id v11 = v16;
        id v36 = v16;
        id v35 = v32;
        dispatch_async(migrationSerialQueue, block);
      }

      pthread_mutex_unlock(&self->_recursiveMutex);
      id v10 = v15;
      if (objc_msgSend(v9, "isProgressHost", v30))
      {
        dispatch_time_t v26 = dispatch_time(0LL, 1000000000LL);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
        __int128 v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100008430;
        v33[3] = &unk_100020720;
        v33[4] = self;
        dispatch_after(v26, v28, v33);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 pid]));
      _DMLogFunc(v5, 6LL);

      dispatch_sync((dispatch_queue_t)self->_migrationSerialQueue, &stru_100020838);
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v9, "pid", v31)));
      _DMLogFunc(v5, 6LL);
      BOOL v14 = v32;
      goto LABEL_15;
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100008334;
    v37[3] = &unk_100020720;
    v21 = &v38;
    id v38 = v9;
    unsigned int v22 = objc_retainBlock(v37);
    id v11 = v16;
    id v10 = v15;
    BOOL v14 = v32;
  }

  pthread_mutex_unlock(p_recursiveMutex);
  if (!v22)
  {
    BOOL v24 = 0;
    goto LABEL_16;
  }

  ((void (*)(void *))v22[2])(v22);
  BOOL v24 = 0;
LABEL_15:

LABEL_16:
  return v24;
}

- (void)willStartMigration
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  pluginResults = self->_pluginResults;
  self->_pluginResults = 0LL;

  -[NSMutableArray removeAllObjects](self->_incidents, "removeAllObjects");
  self->_fastPluginMigrationDuration = 0.0;
  id blockWaitingUntilProgressHostIsReady = self->_blockWaitingUntilProgressHostIsReady;
  self->_id blockWaitingUntilProgressHostIsReady = 0LL;

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)progressHostIsReady
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  _DMLogFunc(v2, 6LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  [v5 setProgressHostIsReady];

  id blockWaitingUntilProgressHostIsReady = (void (**)(void))self->_blockWaitingUntilProgressHostIsReady;
  if (blockWaitingUntilProgressHostIsReady)
  {
    blockWaitingUntilProgressHostIsReady[2]();
    id v7 = self->_blockWaitingUntilProgressHostIsReady;
    self->_id blockWaitingUntilProgressHostIsReady = 0LL;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)blockUntilProgressHostIsReadyWithTimeoutTimeInterval:(double)a3
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v8 = [v7 isProgressHostReady];

  if (v8)
  {
    _DMLogFunc(v3, 6LL);
    pthread_mutex_unlock(p_recursiveMutex);
  }

  else
  {
    _DMLogFunc(v3, 6LL);
    dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0LL, &stru_100020858);
    id blockWaitingUntilProgressHostIsReady = self->_blockWaitingUntilProgressHostIsReady;
    self->_id blockWaitingUntilProgressHostIsReady = v9;

    id block = objc_retainBlock(self->_blockWaitingUntilProgressHostIsReady);
    pthread_mutex_unlock(p_recursiveMutex);
    if (block)
    {
      dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
      uint64_t v12 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", dispatch_block_wait(block, v11) != 0);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      _DMLogFunc(v3, 7LL);
    }
  }

- (void)progressWindowHadIncident:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (v4) {
    -[NSMutableArray addObject:](self->_incidents, "addObject:", v4);
  }
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (void)willRunPlugins:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v6 = [v5 implementMigrationPluginResults];

  if (v6)
  {
    p_recursiveMutex = &self->_recursiveMutex;
    pthread_mutex_lock(&self->_recursiveMutex);
    id v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
    pluginResults = self->_pluginResults;
    self->_pluginResults = v7;

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (objc_msgSend(v14, "existsAndShouldRun", p_recursiveMutex))
          {
            v25[0] = @"kDMMigrationPluginResultsBundlePathKey";
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rep]);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
            v25[1] = @"kDMMigrationPluginResultsPhaseDescription";
            v26[0] = v16;
            v26[1] = @"kDMMigrationPhaseDescriptionRunPending";
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));

            dispatch_queue_attr_t v18 = self->_pluginResults;
            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, v19);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v11);
    }

    pthread_mutex_unlock(p_recursiveMutex);
  }
}

- (void)sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:(id)a3
{
  id v4 = a3;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  -[NSMutableSet addObject:](self->_completedPluginIdentifiers, "addObject:", v4);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned int v6 = self->_waitingClientInvocations;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlyResultsPluginIdentifier", (void)v15));
        if ([v12 isEqualToString:v4])
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 resultsHandler]);

          if (v13)
          {
            BOOL v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v11 resultsHandler]);
            v14[2](v14, 3LL);

            [v11 setResultsHandler:0];
          }
        }

        else
        {
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v8);
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)sendMigrationResultsToClientInvocationsWithSuccess:(BOOL)a3 buildVersion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  pthread_mutex_lock(&self->_recursiveMutex);
  -[DMMigrationState _firstPointAfterEnteringEndOfMigrationCriticalSection]( self,  "_firstPointAfterEnteringEndOfMigrationCriticalSection");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationState migrationSentinelManager](self, "migrationSentinelManager"));
  [v7 removeSentinelIfPresent];

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v8 setLastBuildVersionPref:v6];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dmlmr_lastMigrationResultsWithSuccess:buildVersion:]( &OBJC_CLASS___NSDictionary,  "dmlmr_lastMigrationResultsWithSuccess:buildVersion:",  v4,  v6));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v10 setLastMigrationResultsPref:v9];
  }

  v25 = v6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v11 = self->_waitingClientInvocations;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 resultsHandler]);

        if (v17)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 earlyResultsPluginIdentifier]);
          if (v18)
          {
            v19 = (void *)v18;
            completedPluginIdentifiers = self->_completedPluginIdentifiers;
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 earlyResultsPluginIdentifier]);
            LOBYTE(completedPluginIdentifiers) = -[NSMutableSet containsObject:]( completedPluginIdentifiers,  "containsObject:",  v21);

            if ((completedPluginIdentifiers & 1) == 0)
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v16 pid]));
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v16 earlyResultsPluginIdentifier]);
              _DMLogFunc(v26, 6LL);
            }
          }

          __int128 v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resultsHandler", v23, v24));
          v22[2](v22, v4);
        }
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    }

    while (v13);
  }

  -[NSMutableArray removeAllObjects](self->_waitingClientInvocations, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_completedPluginIdentifiers, "removeAllObjects");
  -[DMMigrationState _reportMigrationFailureIfApplicable](self, "_reportMigrationFailureIfApplicable");
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (void)pluginWillRun:(id)a3 migrationPhaseDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v10 = [v9 implementMigrationPluginResults];

  if (v10)
  {
    v33[0] = @"kDMMigrationPluginResultsBundlePathKey";
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 rep]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    v34[0] = v12;
    v34[1] = &off_100023820;
    v33[1] = @"kDMMigrationPluginResultsDuration";
    v33[2] = @"kDMMigrationPluginResultsPhaseDescription";
    v34[2] = @"kDMMigrationPhaseDescriptionRunning";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));

    pluginResults = self->_pluginResults;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    -[NSMutableDictionary setObject:forKey:](pluginResults, "setObject:forKey:", v13, v15);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v18);

    dispatch_time_t v20 = dispatch_time(0LL, 1000000000LL);
    dispatch_source_set_timer(v19, v20, 0x3B9ACA00uLL, 0x1DCD6500uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100008FDC;
    handler[3] = &unk_100020880;
    handler[4] = self;
    id v30 = v6;
    id v31 = v16;
    v32 = v19;
    __int128 v21 = v19;
    id v22 = v16;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume(v21);
  }

  unsigned int v23 = [v6 isConcurrent];
  __int128 v24 = (NSString *)[v7 copy];
  v25 = v24;
  if (v23)
  {
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( migrationPhaseDescriptionsByConcurrentPluginIdentifiers,  "setObject:forKeyedSubscript:",  v25,  v27);
  }

  else
  {
    migrationPhaseDescription = self->_migrationPhaseDescription;
    self->_migrationPhaseDescription = v24;
    v25 = migrationPhaseDescription;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)pluginDidFinish:(id)a3 withSuccess:(BOOL)a4 duration:(double)a5 incident:(id)a6 migrationPhaseDescription:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  [v12 timeIntervalBeforeWatchdog];
  if (v16 > 0.0) {
    self->_fastPluginMigrationDuration = self->_fastPluginMigrationDuration + a5;
  }
  if (v13) {
    -[NSMutableArray addObject:](self->_incidents, "addObject:", v13);
  }
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v18 = [v17 implementMigrationPluginResults];

  if (v18)
  {
    v30[0] = @"kDMMigrationPluginResultsBundlePathKey";
    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 rep]);
    dispatch_time_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    v31[0] = v20;
    v30[1] = @"kDMMigrationPluginResultsDuration";
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    id v22 = (void *)v21;
    v30[2] = @"kDMMigrationPluginResultsPhaseDescription";
    unsigned int v23 = @"kDMMigrationPhaseDescriptionDidFinishWithFailure";
    if (v10) {
      unsigned int v23 = @"kDMMigrationPhaseDescriptionDidFinishWithSuccess";
    }
    v31[1] = v21;
    v31[2] = v23;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));

    pluginResults = self->_pluginResults;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    -[NSMutableDictionary setObject:forKey:](pluginResults, "setObject:forKey:", v24, v26);
  }

  if ([v12 isConcurrent])
  {
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    migrationPhaseDescription = (NSString *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    -[NSMutableDictionary removeObjectForKey:]( migrationPhaseDescriptionsByConcurrentPluginIdentifiers,  "removeObjectForKey:",  migrationPhaseDescription);
  }

  else
  {
    __int128 v29 = (NSString *)[v14 copy];
    migrationPhaseDescription = self->_migrationPhaseDescription;
    self->_migrationPhaseDescription = v29;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)persistIfNecessary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v4 = [v3 implementMigrationPluginResults];

  if (v4)
  {
    pthread_mutex_lock(&self->_recursiveMutex);
    if (self->_pluginResults)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
      [v5 setMigrationPluginResultsPref:self->_pluginResults];
    }

    pthread_mutex_unlock(&self->_recursiveMutex);
  }

- (void)_clearPluginResults
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  pluginResults = self->_pluginResults;
  self->_pluginResults = 0LL;

  pthread_mutex_unlock(p_recursiveMutex);
}

+ (BOOL)_shouldSuppressMigrationFailureAlert
{
  if (qword_10002CBA0 != -1) {
    dispatch_once(&qword_10002CBA0, &stru_1000208A0);
  }
  return byte_10002CB98;
}

- (void)setNeedsMigrationFailureReport
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (+[DMMigrationState _shouldSuppressMigrationFailureAlert]( &OBJC_CLASS___DMMigrationState,  "_shouldSuppressMigrationFailureAlert"))
  {
    _DMLogFunc(v2, 5LL);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_needsMigrationFailureReport));
    _DMLogFunc(v2, 5LL);

    if (!self->_needsMigrationFailureReport)
    {
      self->_needsMigrationFailureReport = 1;
      -[DMMigrationState _reportMigrationFailureIfApplicable](self, "_reportMigrationFailureIfApplicable", v5);
    }
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)_reportMigrationFailureIfApplicable
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (self->_needsMigrationFailureReport
    && !self->_migrationFailureNotification
    && !-[NSMutableArray count](self->_waitingClientInvocations, "count"))
  {
    _DMLogFunc(v2, 5LL);
    v13[0] = kCFUserNotificationAlertHeaderKey;
    v13[1] = kCFUserNotificationAlertMessageKey;
    v14[0] = @"Data Migration Failed";
    v14[1] = @"Select Tap-to-Radar to start a new draft in Tap-to-Radar on a nearby iOS device.";
    v13[2] = kCFUserNotificationDefaultButtonTitleKey;
    v14[2] = @"Tap-to-Radar";
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
    if (-[DMMigrationState _showIgnoreTapToRadarAlertOption](self, "_showIgnoreTapToRadarAlertOption")) {
      [v6 setObject:@"Ignore" forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    }
    id v7 = (const __CFDictionary *)[v6 copy];
    self->_migrationFailureNotification = CFUserNotificationCreate(0LL, 0.0, 0LL, 0LL, v7);

    if (self->_migrationFailureNotification)
    {
      id v8 = (OS_os_transaction *)os_transaction_create("com.apple.datamigrator.migrationFailureNotification");
      migrationFailureNotificationTransaction = self->_migrationFailureNotificationTransaction;
      self->_migrationFailureNotificationTransaction = v8;

      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( 0LL,  self->_migrationFailureNotification,  (CFUserNotificationCallBack)sub_100009830,  0LL);
      if (RunLoopSource)
      {
        id v11 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v11, kCFRunLoopCommonModes);
        CFRelease(v11);
      }
    }
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)_userDidRespondToMigrationFailureNotificationToFileRadar:(BOOL)a3
{
  uint64_t v4 = v3;
  id v6 = self;
  -[DMMigrationState _releaseMigrationFailureNotification](self, "_releaseMigrationFailureNotification");
  if (a3)
  {
    p_recursiveMutex = &v6->_recursiveMutex;
    pthread_mutex_lock(&v6->_recursiveMutex);
    _DMLogFunc(v3, 5LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 buildVersion]);

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Data Migration failed on %@",  v9));
    if (-[NSMutableArray count](v6->_incidents, "count"))
    {
      v42 = v9;
      v43 = &v6->_recursiveMutex;
      id v41 = v10;
      if (-[NSMutableArray count](v6->_incidents, "count") == (id)1)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v6->_incidents, "firstObject"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 responsiblePluginRep]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

        if ([v13 length])
        {
          id v14 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (%@)",  v13));
        }

        else
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 details]);
          id v18 = [v17 length];

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v11 details]);
            id v14 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (%@)",  v19));
          }

          else
          {
            id v14 = @" (single reason)";
          }
        }

        id v40 = v14;
      }

      else
      {
        id v40 = @" (multiple reasons)";
      }

      dispatch_time_t v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateStyle:](v20, "setDateStyle:", 1LL);
      -[NSDateFormatter setDateFormat:](v20, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
      uint64_t v21 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](v6->_incidents, "count"));
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      v44 = v6;
      id obj = v6->_incidents;
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v51,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v48;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v48 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 details]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 date]);
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v20, "stringFromDate:", v28));
            id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v27,  v29));

            -[NSMutableArray addObject:](v21, "addObject:", v30);
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v51,  16LL);
        }

        while (v23);
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v21, "componentsJoinedByString:", @"\n"));
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\nReasons:\n%@",  v41,  v31));

      p_recursiveMutex = v43;
      id v6 = v44;
      uint64_t v4 = v3;
      uint64_t v9 = v42;
      double v16 = (__CFString *)v40;
    }

    else
    {
      double v16 = &stru_100021968;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n\nAdditional diagnostic info in stackshots with prefixes:\nstacks+com.apple.datamigrator\ncom.apple.migrationpluginwrapper (for plugin crashes, if any)",  v10));

    id v33 = objc_alloc_init(&OBJC_CLASS___RadarDraft);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Data Migration failed on %@%@",  v9,  v16));
    [v33 setTitle:v34];

    [v33 setProblemDescription:v32];
    [v33 setClassification:2];
    [v33 setReproducibility:5];
    id v35 = [[RadarComponent alloc] initWithName:@"Data Migrator" version:@"iOS" identifier:396123];
    [v33 setComponent:v35];

    [v33 setIsUserInitiated:1];
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
    id v46 = 0LL;
    [v36 createDraft:v33 forProcessNamed:@"Data Migrator" withDisplayReason:0 error:&v46];
    id v37 = v46;

    if (v37) {
      uint64_t v38 = 3LL;
    }
    else {
      uint64_t v38 = 5LL;
    }
    _DMLogFunc(v4, v38);
    migrationFailureNotificationTransaction = v6->_migrationFailureNotificationTransaction;
    v6->_migrationFailureNotificationTransaction = 0LL;

    pthread_mutex_unlock(p_recursiveMutex);
  }

  else
  {
    _DMLogFunc(v3, 5LL);
    __int128 v15 = v6->_migrationFailureNotificationTransaction;
    v6->_migrationFailureNotificationTransaction = 0LL;
  }

- (void)_releaseMigrationFailureNotification
{
  self->_migrationFailureNotification = 0LL;
  self->_needsMigrationFailureReport = 0;
}

- (BOOL)_showIgnoreTapToRadarAlertOption
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v2 = self->_incidents;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "kind", (void)v9) != 5)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)_telemetryDictionaryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 previousBuildVersion:(id)a7 userDataDisposition:(unsigned int)a8 userCategory:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  id v14 = a3;
  id v15 = a5;
  double v16 = (const __CFString *)a7;
  __int128 v17 = @"(null)";
  if (v16) {
    __int128 v17 = v16;
  }
  id v37 = (__CFString *)v17;
  id v18 = +[DMUserDataDispositionManager basicDispositionFlagsFromDispositionFlags:]( &OBJC_CLASS___DMUserDataDispositionManager,  "basicDispositionFlagsFromDispositionFlags:",  v9);
  id v19 = +[DMUserDataDispositionManager backupSourceDispositionFlagsFromDispositionFlags:]( &OBJC_CLASS___DMUserDataDispositionManager,  "backupSourceDispositionFlagsFromDispositionFlags:",  v9);
  id v36 = v14;
  v47[0] = v14;
  v38[0] = @"pluginIdentifier";
  v38[1] = @"durationInSeconds";
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
  v47[1] = v35;
  v38[2] = @"attempts";
  dispatch_time_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  v47[2] = v20;
  v38[3] = @"didSucceed";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15 == 0LL));
  v47[3] = v21;
  v38[4] = @"didReportFailure";
  if (v15)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v15 kind] == 1));
    __int128 v48 = v33;
    v39 = @"didHaveTooManyXPCFailures";
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v15 kind] == 2));
    __int128 v49 = v32;
    id v40 = @"didExceedAllowableTime";
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v15 kind] == 3));
  }

  else
  {
    id v22 = &__kCFBooleanFalse;
    __int128 v48 = &__kCFBooleanFalse;
    __int128 v49 = &__kCFBooleanFalse;
    v39 = @"didHaveTooManyXPCFailures";
    id v40 = @"didExceedAllowableTime";
  }

  uint64_t v23 = (v9 >> 7) & 1;
  uint64_t v24 = (v9 >> 3) & 1;
  __int128 v50 = v22;
  v51 = v37;
  id v41 = @"previousBuildVersion";
  v42 = @"userDataDispositionBasic";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v18));
  v52 = v25;
  v43 = @"userDataDispositionBackupSource";
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v19));
  v53 = v26;
  v44 = @"userDataDispositionBackupSourceWasDifferentDevice";
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v24));
  v54 = v27;
  v45 = @"userDataDispositionBackupSourceIsMegaBackup";
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v23));
  v55 = v28;
  id v46 = @"userCategory";
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a9));
  v56 = v29;
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v38,  13LL));

  if (v15)
  {
  }

  return v30;
}

- (void)reportTelemetryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 userDataDisposition:(id)a7 userCategory:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"previousBuildVersion"]);
  unsigned int v18 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:]( &OBJC_CLASS___DMUserDataDispositionManager,  "dispositionFlagsFromDispositionDict:",  v16);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMAnalytics sharedInstance](&OBJC_CLASS___DMAnalytics, "sharedInstance"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000A39C;
  v23[3] = &unk_1000208C8;
  v23[4] = self;
  id v24 = v14;
  double v27 = a4;
  unint64_t v28 = a6;
  id v25 = v15;
  id v26 = v17;
  unsigned int v29 = v18;
  unsigned int v30 = a8;
  id v20 = v17;
  id v21 = v15;
  id v22 = v14;
  [v19 sendLazyEventWithName:@"com.apple.migration.pluginDidComplete" payloadBuilder:v23];
}

- (id)_telemetryDictionaryMigrationDidCompleteWithDuration:(double)a3 fastPluginDuration:(double)a4 pluginCrashCount:(unsigned int)a5 pluginWatchdogCount:(unsigned int)a6 pluginReturnedFalseCount:(unsigned int)a7 previousBuildVersion:(id)a8 userDataDisposition:(unsigned int)a9 pluginCategories:(unsigned int)a10 userCategory:(unsigned int)a11 inAppleStore:(BOOL)a12 isFromFactory:(BOOL)a13
{
  uint64_t v13 = *(void *)&a9;
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  id v19 = (const __CFString *)a8;
  if (v19) {
    id v20 = v19;
  }
  else {
    id v20 = @"(null)";
  }
  id v36 = (__CFString *)v20;
  id v21 = +[DMUserDataDispositionManager basicDispositionFlagsFromDispositionFlags:]( &OBJC_CLASS___DMUserDataDispositionManager,  "basicDispositionFlagsFromDispositionFlags:",  v13);
  id v22 = +[DMUserDataDispositionManager backupSourceDispositionFlagsFromDispositionFlags:]( &OBJC_CLASS___DMUserDataDispositionManager,  "backupSourceDispositionFlagsFromDispositionFlags:",  v13);
  v40[0] = @"durationInSeconds";
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
  v41[0] = v39;
  v40[1] = @"fastPluginDurationInSeconds";
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
  v41[1] = v38;
  v40[2] = @"countOfPluginsCrashing";
  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v16));
  v41[2] = v37;
  v40[3] = @"countOfPluginsExceedingAllowableTime";
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v15));
  v41[3] = v35;
  v40[4] = @"countOfPluginsReportingFailure";
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
  v41[4] = v33;
  v41[5] = v20;
  v40[5] = @"previousBuildVersion";
  v40[6] = @"userDataDispositionBasic";
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v21));
  v41[6] = v23;
  v40[7] = @"userDataDispositionBackupSource";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v22));
  v41[7] = v24;
  v40[8] = @"userDataDispositionBackupSourceWasDifferentDevice";
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v13 >> 3) & 1));
  v41[8] = v25;
  v40[9] = @"userDataDispositionBackupSourceIsMegaBackup";
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v13 >> 7) & 1));
  v41[9] = v26;
  v40[10] = @"pluginCategories";
  double v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a10));
  v41[10] = v27;
  v40[11] = @"userCategory";
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a11));
  v41[11] = v28;
  v40[12] = @"inAppleStore";
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a12));
  v41[12] = v29;
  v40[13] = @"isFromFactory";
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a13));
  v41[13] = v30;
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  14LL));

  return v31;
}

- (void)reportTelemetryWithMigrationDuration:(double)a3 userDataDisposition:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 inAppleStore:(BOOL)a7 isFromFactory:(BOOL)a8 startInterval:(double)a9 firstPluginStartInterval:(double)a10 endInterval:(double)a11
{
  uint64_t v34 = *(void *)&a5;
  uint64_t v35 = *(void *)&a6;
  id v17 = a4;
  pthread_mutex_lock(&self->_recursiveMutex);
  _DMLogFunc(v11, 5LL);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  unsigned int v18 = self->_incidents;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v18);
        }
        unsigned int v26 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)i) kind];
        switch(v26)
        {
          case 3u:
            uint64_t v22 = (v22 + 1);
            break;
          case 2u:
            uint64_t v23 = (v23 + 1);
            break;
          case 1u:
            uint64_t v21 = (v21 + 1);
            break;
        }
      }

      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v49,  v53,  16LL);
    }

    while (v20);
  }

  else
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
  }

  double v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"previousBuildVersion"]);
  unsigned int v28 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:]( &OBJC_CLASS___DMUserDataDispositionManager,  "dispositionFlagsFromDispositionDict:",  v17);
  double fastPluginMigrationDuration = self->_fastPluginMigrationDuration;
  if (v27) {
    unsigned int v30 = (const char *)[v27 UTF8String];
  }
  else {
    unsigned int v30 = "(null)";
  }
  id v33 = v30;
  _DMLogFunc(v11, 5LL);
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[DMAnalytics sharedInstance]( &OBJC_CLASS___DMAnalytics,  "sharedInstance",  a3,  fastPluginMigrationDuration,  v23,  v22,  v21,  v33,  (v28 >> 1) & 1,  (v28 >> 2) & 1,  (v28 >> 3) & 1,  (v28 >> 4) & 1,  (v28 >> 7) & 1,  v34,  v35,  *(void *)&a9,  *(void *)&a10,  *(void *)&a11));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10000AA00;
  v38[3] = &unk_1000208F0;
  double v40 = a3;
  int v41 = v23;
  int v42 = v22;
  v38[4] = self;
  id v39 = v27;
  int v43 = v21;
  unsigned int v44 = v28;
  int v45 = v34;
  int v46 = v35;
  BOOL v47 = a7;
  BOOL v48 = a8;
  id v32 = v27;
  [v31 sendLazyEventWithName:@"com.apple.migration.didComplete" payloadBuilder:v38];

  _DMLogFunc(v11, 5LL);
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (DMMigrationSentinelManager)migrationSentinelManager
{
  return self->_migrationSentinelManager;
}

- (void)setMigrationSentinelManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end