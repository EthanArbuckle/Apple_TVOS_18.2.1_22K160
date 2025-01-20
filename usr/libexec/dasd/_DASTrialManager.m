@interface _DASTrialManager
+ (_DASTrialManager)sharedInstance;
+ (id)sharedInstanceForNamespace:(id)a3;
+ (void)initialize;
- (BOOL)handleTrialContinuation:(id)a3;
- (BOOL)handleTrialEnd:(id)a3;
- (BOOL)handleTrialStart:(id)a3;
- (BOOL)handleTrialUpdate:(id)a3;
- (BOOL)matches:(id)a3 withCache:(id)a4;
- (NSMutableArray)delegates;
- (NSString)experimentID;
- (NSString)namespace;
- (NSString)treatmentID;
- (NSUserDefaults)defaults;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_DASTrialManager)initWithNamespaceName:(id)a3;
- (id)factorWithName:(id)a3;
- (id)readFromDefaults;
- (int)deploymentID;
- (int)token;
- (os_unfair_lock_s)lock;
- (void)addDelegate:(id)a3;
- (void)clear;
- (void)saveToDefaults:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDeploymentID:(int)a3;
- (void)setExperimentID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setTimer:(id)a3;
- (void)setToken:(int)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)startTimer;
- (void)updateFactors;
@end

@implementation _DASTrialManager

+ (void)initialize
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)qword_100157570;
  qword_100157570 = v2;

  dword_100157578 = 0;
}

+ (_DASTrialManager)sharedInstance
{
  if (qword_100157580 != -1) {
    dispatch_once(&qword_100157580, &stru_100115338);
  }
  return (_DASTrialManager *)(id)qword_100157588;
}

+ (id)sharedInstanceForNamespace:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100157578);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_100157570;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "namespace", (void)v14));
      unsigned __int8 v11 = [v10 isEqual:v3];

      if ((v11 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v12 = v9;

    if (v12) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  v12 = -[_DASTrialManager initWithNamespaceName:]( objc_alloc(&OBJC_CLASS____DASTrialManager),  "initWithNamespaceName:",  v3);
  [(id)qword_100157570 addObject:v12];
LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100157578);

  return v12;
}

- (_DASTrialManager)initWithNamespaceName:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS____DASTrialManager;
  id v6 = -[_DASTrialManager init](&v27, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_namespace, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"TrialManager"));
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 222LL));
    trialClient = v7->_trialClient;
    v7->_trialClient = (TRIClient *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_trialClient;
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableArray *)v14;

    __int128 v16 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler.trial");
    defaults = v7->_defaults;
    v7->_defaults = v16;

    objc_initWeak((id *)buf, v7);
    v18 = v7->_trialClient;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100017988;
    v25[3] = &unk_100115360;
    objc_copyWeak(&v26, (id *)buf);
    id v19 =  -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:]( v18,  "addUpdateHandlerForNamespaceName:usingBlock:",  v5,  v25);
    -[_DASTrialManager updateFactors](v7, "updateFactors");
    -[_DASTrialManager updateKernelWithDASIdentifiers](v7, "updateKernelWithDASIdentifiers");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100017A1C;
    v23[3] = &unk_100115388;
    v24 = v7;
    notify_register_dispatch("com.apple.dasd.trial", &v7->_token, v21, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  return v7;
}

- (void)updateFactors
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[TRIClient experimentIdentifiersWithNamespaceName:]( self->_trialClient,  "experimentIdentifiersWithNamespaceName:",  self->_namespace));
  id v4 = self->_experimentID;
  id v5 = self->_treatmentID;
  int deploymentID = self->_deploymentID;
  v32 = (void *)v3;
  if (-[_DASTrialManager handleTrialStart:](self, "handleTrialStart:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    treatmentID = self->_treatmentID;
    experimentID = self->_experimentID;
    int v10 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = experimentID;
    __int16 v41 = 2112;
    v42 = treatmentID;
    __int16 v43 = 1024;
    int v44 = v10;
    unsigned __int8 v11 = "Trial Experiment Started, experiment: %@, treatment: %@, deployment: %d";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, v11, buf, 0x1Cu);
    goto LABEL_14;
  }

  if (-[_DASTrialManager handleTrialUpdate:](self, "handleTrialUpdate:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    v13 = self->_treatmentID;
    v12 = self->_experimentID;
    int v14 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = v12;
    __int16 v41 = 2112;
    v42 = v13;
    __int16 v43 = 1024;
    int v44 = v14;
    unsigned __int8 v11 = "Trial Experiment Updated, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }

  if (-[_DASTrialManager handleTrialEnd:](self, "handleTrialEnd:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138412802;
    v40 = v4;
    __int16 v41 = 2112;
    v42 = v5;
    __int16 v43 = 1024;
    int v44 = deploymentID;
    unsigned __int8 v11 = "Trial Experiment Ended, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }

  unsigned int v15 = -[_DASTrialManager handleTrialContinuation:](self, "handleTrialContinuation:", v3);
  log = self->_log;
  BOOL v16 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (!v16) {
      goto LABEL_14;
    }
    v18 = self->_treatmentID;
    __int128 v17 = self->_experimentID;
    int v19 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = v17;
    __int16 v41 = 2112;
    v42 = v18;
    __int16 v43 = 1024;
    int v44 = v19;
    unsigned __int8 v11 = "Trial Experiment Found, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }

  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "No Trial Experiments Found", buf, 2u);
  }

  -[_DASTrialManager clear](self, "clear");
LABEL_14:
  v30 = v5;
  v31 = v4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v20 = self->_delegates;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Calling out Trial handler blocks",  buf,  2u);
        }

        dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
        v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100017E24;
        block[3] = &unk_100115148;
        block[4] = v25;
        block[5] = self;
        dispatch_async(v28, block);
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL,  lock,  v30,  v31,  v32);
    }

    while (v22);
  }

  os_unfair_lock_unlock(lock);
}

- (id)factorWithName:(id)a3
{
  return -[TRIClient levelForFactor:withNamespaceName:]( self->_trialClient,  "levelForFactor:withNamespaceName:",  a3,  self->_namespace);
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableArray addObject:](self->_delegates, "addObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }

- (BOOL)handleTrialStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentId]), v6, v6)
    && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults")),
        v7,
        !v7))
  {
    int v10 = (NSString *)objc_claimAutoreleasedReturnValue([v5 treatmentId]);
    treatmentID = self->_treatmentID;
    self->_treatmentID = v10;

    v12 = (NSString *)objc_claimAutoreleasedReturnValue([v5 experimentId]);
    experimentID = self->_experimentID;
    self->_experimentID = v12;

    self->_int deploymentID = [v5 deploymentId];
    int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  self->_experimentID,  @"trialExperimentId");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  self->_treatmentID,  @"trialTreatmentId");
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_deploymentID));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  @"trialDeploymentId");

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v16,  @"trialStartDate");

    -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", v14);
    -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v14);
    -[_DASTrialManager startTimer](self, "startTimer");

    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)handleTrialUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentId]), v6, v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
    id v8 = [v7 mutableCopy];

    if (v8 && !-[_DASTrialManager matches:withCache:](self, "matches:withCache:", v5, v8))
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v8 setObject:v10 forKeyedSubscript:@"trialEndDate"];

      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v8);
      unsigned __int8 v11 = (NSString *)objc_claimAutoreleasedReturnValue([v5 treatmentId]);
      treatmentID = self->_treatmentID;
      self->_treatmentID = v11;

      v13 = (NSString *)objc_claimAutoreleasedReturnValue([v5 experimentId]);
      experimentID = self->_experimentID;
      self->_experimentID = v13;

      self->_int deploymentID = [v5 deploymentId];
      unsigned int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  self->_experimentID,  @"trialExperimentId");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  self->_treatmentID,  @"trialTreatmentId");
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_deploymentID));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v16,  @"trialDeploymentId");

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v17,  @"trialStartDate");

      -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", v15);
      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v15);

      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)handleTrialEnd:(id)a3
{
  if (a3) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
  id v6 = [v5 mutableCopy];

  BOOL v3 = v6 != 0LL;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 setObject:v7 forKeyedSubscript:@"trialEndDate"];

    -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v6);
    -[_DASTrialManager clear](self, "clear");
  }

  return v3;
}

- (BOOL)handleTrialContinuation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentId]), v6, v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
    id v8 = [v7 mutableCopy];

    if (v8 && -[_DASTrialManager matches:withCache:](self, "matches:withCache:", v5, v8))
    {
      BOOL v9 = (NSString *)objc_claimAutoreleasedReturnValue([v5 treatmentId]);
      treatmentID = self->_treatmentID;
      self->_treatmentID = v9;

      unsigned __int8 v11 = (NSString *)objc_claimAutoreleasedReturnValue([v5 experimentId]);
      experimentID = self->_experimentID;
      self->_experimentID = v11;

      self->_int deploymentID = [v5 deploymentId];
      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v8);
      -[_DASTrialManager startTimer](self, "startTimer");
      BOOL v13 = 1;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)readFromDefaults
{
  return -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"trialDictionary");
}

- (void)saveToDefaults:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count]) {
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, @"trialDictionary");
  }
  else {
    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", @"trialDictionary");
  }
  -[NSUserDefaults synchronize](self->_defaults, "synchronize");
}

- (BOOL)matches:(id)a3 withCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 experimentId]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trialExperimentId"]);
  if ([v7 isEqualToString:v8])
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 treatmentId]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trialTreatmentId"]);
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 deploymentId]));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trialDeploymentId"]);
      unsigned __int8 v13 = [v11 isEqualToNumber:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)startTimer
{
  if (!self->_timer)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v4);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0LL, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    uint64_t v7 = self->_timer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100018604;
    v8[3] = &unk_100114FB8;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)clear
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    id v4 = self->_timer;
    self->_timer = 0LL;
  }

  treatmentID = self->_treatmentID;
  self->_treatmentID = 0LL;

  experimentID = self->_experimentID;
  self->_experimentID = 0LL;

  self->_int deploymentID = 0;
  -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", 0LL);
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExperimentID:(id)a3
{
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_int deploymentID = a3;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_os_unfair_lock_t lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end