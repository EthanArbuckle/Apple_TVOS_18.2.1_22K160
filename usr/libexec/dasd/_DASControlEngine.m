@interface _DASControlEngine
- (BOOL)dutyCyclingInitiated;
- (BOOL)encounteredTLC;
- (BOOL)initialMitigationInitiated;
- (BOOL)trialInitialActionAlways;
- (BOOL)trialdisableSFI;
- (NSDate)currentDutyCycleStartTime;
- (NSDate)encounteredTLCDate;
- (NSMutableDictionary)actionToAnalyzers;
- (NSMutableDictionary)actionToTimers;
- (NSMutableDictionary)controlEffortHistory;
- (NSString)trialExperimentID;
- (NSString)trialTreatmentID;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)analyzerTimer;
- (OS_os_log)log;
- (TRITrackingId)trialTrackingID;
- (_CDContext)context;
- (_DASControlEngine)init;
- (_DASTrialManager)trialManager;
- (_DKKnowledgeSaving)store;
- (double)dutyCycleDuration;
- (double)trialSFIIdleWindowParameter;
- (id)currentStatus;
- (id)intializeAnalyzerTimerWithCadence:(double)a3 forAction:(id)a4;
- (id)startBatteryTemperatureLoop;
- (id)startChargeRateLoop;
- (id)status;
- (int)startToken;
- (int)timeToken;
- (int64_t)lastSavedEffort;
- (int64_t)lastSavedTLC;
- (int64_t)trialInitialAction;
- (int64_t)trialSFIWindow;
- (os_unfair_lock_s)lock;
- (unint64_t)SFITimeFromEffort:(unint64_t)a3;
- (unint64_t)dutyCycleTimeFromEffort:(unint64_t)a3;
- (unint64_t)dutyCyclingMethod;
- (void)checkControlAction:(id)a3;
- (void)executeDutyCyclingWithEffort:(unint64_t)a3;
- (void)executeSFIWithEffort:(unint64_t)a3;
- (void)intializeAnalyzers;
- (void)invokeInitialActionWithValue:(int64_t)a3;
- (void)loadTrialParameters;
- (void)loadTrialTreatmentAndExperimentIdentifiers;
- (void)recordSessionAnalytics;
- (void)registerTriggers;
- (void)resetAnalyticsState;
- (void)resetDutyCyclingEffort;
- (void)resetInitialAction;
- (void)resetSFIEffort;
- (void)resetState;
- (void)saveControlEffort:(int64_t)a3;
- (void)saveTLCState:(BOOL)a3;
- (void)setActionToAnalyzers:(id)a3;
- (void)setActionToTimers:(id)a3;
- (void)setAnalyzerTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setControlEffortHistory:(id)a3;
- (void)setCurrentDutyCycleStartTime:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDutyCycleDuration:(double)a3;
- (void)setDutyCyclingInitiated:(BOOL)a3;
- (void)setDutyCyclingMethod:(unint64_t)a3;
- (void)setEncounteredTLC:(BOOL)a3;
- (void)setEncounteredTLCDate:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setInitialMitigationInitiated:(BOOL)a3;
- (void)setLastSavedEffort:(int64_t)a3;
- (void)setLastSavedTLC:(int64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setStartToken:(int)a3;
- (void)setStore:(id)a3;
- (void)setTimeToken:(int)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialInitialAction:(int64_t)a3;
- (void)setTrialInitialActionAlways:(BOOL)a3;
- (void)setTrialManager:(id)a3;
- (void)setTrialSFIIdleWindowParameter:(double)a3;
- (void)setTrialSFIWindow:(int64_t)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
- (void)setTrialdisableSFI:(BOOL)a3;
- (void)updateControlAction:(id)a3 withEffort:(int64_t)a4;
@end

@implementation _DASControlEngine

- (_DASControlEngine)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____DASControlEngine;
  v2 = -[_DASControlEngine init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dasd.clas.controlEngineQueue", v4);
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    os_log_t v9 = os_log_create("com.apple.clas", "control");
    v10 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    v12 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
    v14 = (void *)*((void *)v2 + 25);
    *((void *)v2 + 25) = v13;

    [*((id *)v2 + 25) addDelegate:v2];
    [v2 loadTrialTreatmentAndExperimentIdentifiers];
    *((void *)v2 + 20) = 50000LL;
    *((void *)v2 + 21) = 0x3FD3333333333333LL;
    *(_WORD *)(v2 + 11) = 256;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess]( &OBJC_CLASS____DKKnowledgeStore,  "knowledgeStoreWithDirectReadWriteAccess"));
    v16 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v15;

    *((void *)v2 + 19) = -1LL;
    *(int64x2_t *)(v2 + 72) = vdupq_n_s64(0x7FFFFFFFuLL);
    [v2 loadTrialParameters];
    [v2 intializeAnalyzers];
    [v2 registerTriggers];
    if (v2[11]) {
      [v2 invokeInitialActionWithValue:1];
    }
    if ((*((void *)v2 + 19) & 0x8000000000000000LL) == 0) {
      objc_msgSend(v2, "invokeInitialActionWithValue:");
    }
  }

  return (_DASControlEngine *)v2;
}

- (void)loadTrialTreatmentAndExperimentIdentifiers
{
  dispatch_queue_attr_t v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager treatmentID](self->_trialManager, "treatmentID"));
  trialTreatmentID = self->_trialTreatmentID;
  self->_trialTreatmentID = v3;

  dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager experimentID](self->_trialManager, "experimentID"));
  trialExperimentID = self->_trialExperimentID;
  self->_trialExperimentID = v5;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_trialTreatmentID;
    os_log_t v9 = self->_trialExperimentID;
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Trial: Treatment ID set to: %@, Experiment ID set to: %@",  (uint8_t *)&v10,  0x16u);
  }

- (void)loadTrialParameters
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_DASControlEngine loadTrialTreatmentAndExperimentIdentifiers](self, "loadTrialTreatmentAndExperimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"CLAS_InitialActionAlwaysEnabled"));
  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = log;
      int v30 = 134217984;
      unint64_t v31 = [v4 BOOLeanValue];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Trial: initialActionAlwaysEnabled action set to %ld",  (uint8_t *)&v30,  0xCu);
    }

    self->_trialInitialActionAlways = [v4 BOOLeanValue];
  }

  else if (v6)
  {
    LOWORD(v30) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load initialActionAlwaysEnabled",  (uint8_t *)&v30,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", @"CLAS_DisableSFI"));
  os_log_t v9 = self->_log;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      unsigned int v12 = [v8 BOOLeanValue];
      int v30 = 67109120;
      LODWORD(v31) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Trial: disableSFI set to %d",  (uint8_t *)&v30,  8u);
    }

    self->_trialdisableSFI = [v8 BOOLeanValue];
  }

  else if (v10)
  {
    LOWORD(v30) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load disableSFI",  (uint8_t *)&v30,  2u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", @"CLAS_WindowSFI"));
  v14 = self->_log;
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      id v17 = [v13 longValue];
      int v30 = 134217984;
      unint64_t v31 = (unint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Trial: windowSFI set to %ld",  (uint8_t *)&v30,  0xCu);
    }

    self->_trialSFIWindow = (int64_t)[v13 longValue];
  }

  else if (v15)
  {
    LOWORD(v30) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load windowSFI",  (uint8_t *)&v30,  2u);
  }

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"CLAS_IdleWindowParameterSFI"));
  double trialSFIIdleWindowParameter = self->_trialSFIIdleWindowParameter;
  v20 = self->_log;
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (trialSFIIdleWindowParameter == 0.0)
  {
    if (v21)
    {
      LOWORD(v30) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load idleWindowParameterSFI",  (uint8_t *)&v30,  2u);
    }
  }

  else
  {
    if (v21)
    {
      v22 = v20;
      [v18 doubleValue];
      int v30 = 134217984;
      unint64_t v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Trial: idleWindowParameterSFI set to %lf",  (uint8_t *)&v30,  0xCu);
    }

    [v18 doubleValue];
    self->_double trialSFIIdleWindowParameter = v24;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"CLAS_InitialAction"));
  v26 = self->_log;
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v28 = v26;
      id v29 = [v25 longValue];
      int v30 = 134217984;
      unint64_t v31 = (unint64_t)v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Trial: initialAction set to %ld",  (uint8_t *)&v30,  0xCu);
    }

    self->_trialInitialAction = (int64_t)[v25 longValue];
  }

  else if (v27)
  {
    LOWORD(v30) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load initialAction",  (uint8_t *)&v30,  2u);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)intializeAnalyzers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019254;
  block[3] = &unk_1001150D0;
  block[4] = self;
  if (qword_100157590 != -1) {
    dispatch_once(&qword_100157590, block);
  }
  dispatch_queue_attr_t v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  defaults = self->_defaults;
  self->_defaults = v3;

  self->_unint64_t dutyCyclingMethod = 1LL;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"dutyCycling"));

  if (v5)
  {
    unint64_t dutyCyclingMethod = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", @"dutyCycling");
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = dutyCyclingMethod;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DutyCycling method is %ld", buf, 0xCu);
    }

    self->_unint64_t dutyCyclingMethod = dutyCyclingMethod;
  }

  else
  {
    unint64_t dutyCyclingMethod = self->_dutyCyclingMethod;
  }

  if (dutyCyclingMethod >= 3) {
    self->_unint64_t dutyCyclingMethod = 1LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"initialActionInitiated"));
  self->_BOOL initialMitigationInitiated = [v8 BOOLValue];

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"dutyCycleInitiated"));
  self->_BOOL dutyCyclingInitiated = [v9 BOOLValue];

  BOOL v10 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_defaults,  "objectForKey:",  @"currentDutyCycleStartTime"));
  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = v10;

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"dutyCycleDuration"));
  [v12 doubleValue];
  self->_double dutyCycleDuration = v13;

  v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_defaults,  "objectForKey:",  @"controlEffortHistory"));
  controlEffortHistory = self->_controlEffortHistory;
  self->_controlEffortHistory = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"encounteredTLC"));
  self->_BOOL encounteredTLC = [v16 BOOLValue];

  id v17 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"encounteredTLCDate"));
  encounteredTLCDate = self->_encounteredTLCDate;
  self->_encounteredTLCDate = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL dutyCyclingInitiated = self->_dutyCyclingInitiated;
    BOOL initialMitigationInitiated = self->_initialMitigationInitiated;
    double dutyCycleDuration = self->_dutyCycleDuration;
    BOOL encounteredTLC = self->_encounteredTLC;
    v25 = self->_encounteredTLCDate;
    *(_DWORD *)buf = 134219010;
    unint64_t v32 = dutyCyclingInitiated;
    __int16 v33 = 2048;
    BOOL v34 = initialMitigationInitiated;
    __int16 v35 = 2048;
    double v36 = dutyCycleDuration;
    __int16 v37 = 1024;
    BOOL v38 = encounteredTLC;
    __int16 v39 = 2112;
    v40 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Defaults: DutyCyclingInitiated:%ld, InitialMitigationInitiated:%ld, DutyCycleDuration:%lf, Encountered TLC:%d, Enc ountered TLC Date:%@",  buf,  0x30u);
  }

  v26 = self->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Initializing Analyzers", buf, 2u);
  }

  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine startBatteryTemperatureLoop](self, "startBatteryTemperatureLoop"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine startChargeRateLoop](self, "startChargeRateLoop"));
  [v19 addObject:v27];
  [v19 addObject:v28];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_actionToAnalyzers,  "setObject:forKeyedSubscript:",  v19,  @"kCLASActionSFI");
  id v29 = (void *)objc_claimAutoreleasedReturnValue( -[_DASControlEngine intializeAnalyzerTimerWithCadence:forAction:]( self,  "intializeAnalyzerTimerWithCadence:forAction:",  @"kCLASActionSFI",  15.0));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_actionToTimers,  "setObject:forKeyedSubscript:",  v29,  @"kCLASActionSFI");
}

- (id)status
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine currentStatus](self, "currentStatus"));
  [v3 setObject:self->_controlEffortHistory forKeyedSubscript:@"ControlEffortHistory"];
  return v3;
}

- (void)registerTriggers
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000194A4;
  v10[3] = &unk_1001153B0;
  v10[4] = self;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.das.clas.deviceActivity",  v4,  v10));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100019514;
  v9[3] = &unk_1001153B0;
  v9[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.das.clas.pluggedIn",  v7,  v9));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v8);
}

- (id)intializeAnalyzerTimerWithCadence:(double)a3 forAction:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Activating timer for Action %@", buf, 0xCu);
  }

  v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_executionQueue);
  analyzerTimer = self->_analyzerTimer;
  self->_analyzerTimer = v8;

  dispatch_set_qos_class_fallback(self->_analyzerTimer, 17LL);
  dispatch_source_set_timer( (dispatch_source_t)self->_analyzerTimer,  0LL,  (unint64_t)(a3 * 1000000000.0),  0x3B9ACA00uLL);
  BOOL v10 = self->_analyzerTimer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100019764;
  v14[3] = &unk_100115148;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler((dispatch_source_t)v10, v14);
  dispatch_activate((dispatch_object_t)self->_analyzerTimer);
  unsigned int v12 = self->_analyzerTimer;

  return v12;
}

- (void)saveTLCState:(BOOL)a3
{
  int64_t v4 = a3;
  int64_t lastSavedTLC = self->_lastSavedTLC;
  if (lastSavedTLC == 0x7FFFFFFF)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"/system/TLC"));
    v26 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
    v25 = v8;
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  0LL,  v7,  0LL,  1LL,  v9));

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeSaving executeQuery:error:](self->_store, "executeQuery:error:", v10, 0LL));
    if ([v11 count])
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
    }

    int64_t lastSavedTLC = self->_lastSavedTLC;
  }

  if (lastSavedTLC != v4)
  {
    if (!self->_encounteredTLCDate)
    {
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      encounteredTLCDate = self->_encounteredTLCDate;
      self->_encounteredTLCDate = v14;
    }

    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    defaults = self->_defaults;
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_encounteredTLC));
    -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v18, @"encounteredTLC");

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v16, @"encounteredTLCDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"/system/TLC"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:",  v19,  self->_encounteredTLCDate,  v16,  v4,  0LL));

    if (v20)
    {
      store = self->_store;
      double v24 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      LODWORD(store) = -[_DKKnowledgeSaving saveObjects:error:](store, "saveObjects:error:", v22, 0LL);

      if ((_DWORD)store) {
        self->_int64_t lastSavedTLC = v4;
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B1808();
    }

    unint64_t v23 = self->_encounteredTLCDate;
    self->_encounteredTLCDate = v16;
  }

- (void)saveControlEffort:(int64_t)a3
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self->_trialInitialActionAlways) {
    a3 += 200LL;
  }
  int64_t lastSavedEffort = self->_lastSavedEffort;
  if (lastSavedEffort == 0x7FFFFFFF)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"/dasd/controlEffort"));
    BOOL v21 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
    v20 = v9;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  0LL,  v8,  0LL,  1LL,  v10));

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeSaving executeQuery:error:](self->_store, "executeQuery:error:", v11, 0LL));
    if ([v12 count])
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
    }

    int64_t lastSavedEffort = self->_lastSavedEffort;
  }

  if (lastSavedEffort != a3)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"/dasd/controlEffort"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:",  v15,  v5,  v5,  a3,  0LL));

    if (v16)
    {
      store = self->_store;
      v19 = v16;
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
      LODWORD(store) = -[_DKKnowledgeSaving saveObjects:error:](store, "saveObjects:error:", v18, 0LL);

      if ((_DWORD)store) {
        self->_int64_t lastSavedEffort = a3;
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B1808();
    }
  }
}

- (void)checkControlAction:(id)a3
{
  id v4 = a3;
  context = self->_context;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    os_log_t v9 = self->_context;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryLevel"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    uint64_t v12 = (uint64_t)[v11 integerValue];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Checking control action", buf, 2u);
    }

    id v48 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_actionToAnalyzers,  "objectForKeyedSubscript:",  v4));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = v14;
    id v16 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v53;
      uint64_t v19 = -1LL;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(obj);
          }
          BOOL v21 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          if (v12 >= 96)
          {
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v52 + 1)
                                                                                     + 8LL * (void)i), "analyzerName"));
            unint64_t v23 = off_100156880;

            if (v22 == v23) {
              continue;
            }
          }

          double v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
            id v27 = [v21 controlEffortResult];
            *(_DWORD *)buf = 138412546;
            v57 = v26;
            __int16 v58 = 2048;
            id v59 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Analyzer %@, Control effort %lu",  buf,  0x16u);
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue([v21 analyticsStatus]);

          if (v28)
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v21 analyticsStatus]);
            id v30 = [v29 copy];
            [v15 addEntriesFromDictionary:v30];
          }

          id v31 = [v21 controlEffortResult];
          if ((uint64_t)v31 > v19)
          {
            uint64_t v32 = (uint64_t)v31;
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v31));
            [v15 setObject:v33 forKeyedSubscript:@"MaxControlEffort"];

            uint64_t v19 = v32;
          }

          BOOL v34 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 analyzerName]);
          __int16 v35 = off_100156880;

          if (v34 == v35)
          {
            int encounteredTLC = self->_encounteredTLC;
            unsigned int v37 = [v21 encounteredTLC];
            self->_int encounteredTLC = v37;
            if (encounteredTLC != v37) {
              -[_DASControlEngine saveTLCState:](self, "saveTLCState:", encounteredTLC != 0);
            }
          }
        }

        id v17 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v17);
    }

    else
    {
      uint64_t v19 = -1LL;
    }

    BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    [v15 setObject:v38 forKeyedSubscript:@"BatteryLevel"];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10001A168;
    v50[3] = &unk_1001153D8;
    id v39 = v15;
    id v51 = v39;
    AnalyticsSendEventLazy(@"com.apple.das.clas.controlEffort", v50);
    v40 = self->_log;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000B1834((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);
    }
    id v4 = v48;
    if (v19 >= 1)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_controlEffortHistory,  "setObject:forKeyedSubscript:",  v39,  v47);
      -[NSUserDefaults setObject:forKey:]( self->_defaults,  "setObject:forKey:",  self->_controlEffortHistory,  @"controlEffortHistory");
      -[_DASControlEngine saveControlEffort:](self, "saveControlEffort:", v19);
    }

    -[_DASControlEngine updateControlAction:withEffort:](self, "updateControlAction:withEffort:", v48, v19);
  }
}

- (void)updateControlAction:(id)a3 withEffort:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    int v16 = 134217984;
    int64_t v17 = a4;
    id v11 = "Effort less than 0 (%ld). Taking no action";
    uint64_t v12 = log;
    uint32_t v13 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    goto LABEL_33;
  }

  unint64_t dutyCyclingMethod = self->_dutyCyclingMethod;
  if (!dutyCyclingMethod)
  {
    v14 = self->_log;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    LOWORD(v16) = 0;
    id v11 = "Duty cycling method is disabled";
    uint64_t v12 = v14;
    uint32_t v13 = 2;
    goto LABEL_11;
  }

  if ((unint64_t)a4 >= 0x1F && !self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      unsigned int v8 = self;
      uint64_t v9 = 1LL;
LABEL_24:
      -[_DASControlEngine invokeInitialActionWithValue:](v8, "invokeInitialActionWithValue:", v9);
      goto LABEL_33;
    }

- (void)invokeInitialActionWithValue:(int64_t)a3
{
  self->_BOOL initialMitigationInitiated = a3 != 0;
  if (notify_set_state(self->_startToken, a3) && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000B1898();
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Posting notifications for initial mitigation with value %ld",  (uint8_t *)&v6,  0xCu);
  }

  notify_post((const char *)[@"com.apple.das.clas.startDutyCycling" UTF8String]);
}

- (void)resetInitialAction
{
  if (!self->_trialInitialActionAlways && self->_trialInitialAction < 0) {
    -[_DASControlEngine invokeInitialActionWithValue:](self, "invokeInitialActionWithValue:", 0LL);
  }
}

- (unint64_t)SFITimeFromEffort:(unint64_t)a3
{
  return (unint64_t)((double)a3 * 0.5 * self->_trialSFIIdleWindowParameter * 1000.0);
}

- (void)executeSFIWithEffort:(unint64_t)a3
{
  unsigned int v5 = +[_DASDeviceActivityPolicy isDeviceInUse:]( &OBJC_CLASS____DASDeviceActivityPolicy,  "isDeviceInUse:",  self->_context);
  unsigned int v6 = v5;
  if (!a3 || v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"Effort is 0";
      if (v6) {
        uint64_t v9 = @"Device in use";
      }
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "No SFI action. (%@)", (uint8_t *)&v12, 0xCu);
    }

    -[_DASControlEngine resetSFIEffort](self, "resetSFIEffort");
  }

  else if (self->_trialdisableSFI)
  {
    int64_t v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SFI action disabled", (uint8_t *)&v12, 2u);
    }
  }

  else
  {
    unint64_t v10 = -[_DASControlEngine SFITimeFromEffort:](self, "SFITimeFromEffort:", a3);
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting SFI for %lu microseconds",  (uint8_t *)&v12,  0xCu);
    }

    if (system_set_sfi_window(self->_trialSFIWindow) == -1
      && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B196C();
    }
  }

- (void)resetSFIEffort
{
  if (system_set_sfi_window(0LL) == -1)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B1A44(log, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  if (sfi_set_class_offtime(1LL, 0LL) == -1)
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000B19D8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

- (unint64_t)dutyCycleTimeFromEffort:(unint64_t)a3
{
  return 2000 * a3;
}

- (void)executeDutyCyclingWithEffort:(unint64_t)a3
{
  uint64_t v4 = -[_DASControlEngine dutyCycleTimeFromEffort:](self, "dutyCycleTimeFromEffort:", a3);
  if (notify_set_state(self->_timeToken, v4) && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000B1AB0();
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Posting dutycycling notification for %lu microseconds",  (uint8_t *)&v6,  0xCu);
  }

  notify_post((const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String]);
}

- (void)resetDutyCyclingEffort
{
  if (notify_set_state(self->_timeToken, 0LL) && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000B1AB0();
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Posting dutycycling notification for 0 microseconds",  v4,  2u);
  }

  notify_post((const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String]);
}

- (id)startBatteryTemperatureLoop
{
  dispatch_queue_attr_t v3 = objc_opt_new(&OBJC_CLASS____DASBatteryTemperatureReader);
  uint64_t v4 = -[_DASBatteryTemperatureAnalyzer initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:]( objc_alloc(&OBJC_CLASS____DASBatteryTemperatureAnalyzer),  "initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:",  10LL,  v3,  30LL,  2LL);
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1B1C();
  }
  -[_DASBatteryTemperatureAnalyzer start](v4, "start");

  return v4;
}

- (void)resetState
{
  *(_WORD *)&self->_BOOL initialMitigationInitiated = 0;
}

- (void)resetAnalyticsState
{
  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = 0LL;

  self->_double dutyCycleDuration = 0.0;
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", @"dutyCycleDuration");
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", @"controlEffortHistory");
}

- (id)currentStatus
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_dutyCycleDuration));
  [v3 setObject:v4 forKeyedSubscript:@"DutyCycleDuration"];

  if (self->_dutyCycleDuration <= 0.0) {
    uint64_t v5 = &off_100121A38;
  }
  else {
    uint64_t v5 = &off_100121A20;
  }
  [v3 setObject:v5 forKeyedSubscript:@"EngagedDutyCycle"];
  [v3 setObject:self->_trialTreatmentID forKeyedSubscript:@"TreatmentID"];
  [v3 setObject:self->_trialExperimentID forKeyedSubscript:@"ExperimentID"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_encounteredTLC));
  [v3 setObject:v6 forKeyedSubscript:@"EncounteredTLC"];

  return v3;
}

- (void)recordSessionAnalytics
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001AB64;
  v11[3] = &unk_1001153D8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[_DASControlEngine currentStatus](self, "currentStatus"));
  id v12 = v3;
  AnalyticsSendEventLazy(@"com.apple.das.clas.pluginSession", v11);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1834((uint64_t)v3, log, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setDutyCyclingInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = v5;

    -[NSUserDefaults setObject:forKey:]( self->_defaults,  "setObject:forKey:",  self->_currentDutyCycleStartTime,  @"currentDutyCycleStartTime");
  }

  else
  {
    -[NSDate timeIntervalSinceNow](self->_currentDutyCycleStartTime, "timeIntervalSinceNow");
    self->_double dutyCycleDuration = self->_dutyCycleDuration - v7;
    -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"dutyCycleDuration");
    uint64_t v8 = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = 0LL;

    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", @"currentDutyCycleStartTime");
  }

  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, @"dutyCycleInitiated");
}

- (void)setInitialMitigationInitiated:(BOOL)a3
{
}

- (id)startChargeRateLoop
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS____DASChargeRateReader);
  uint64_t v4 = -[_DASChargeRateAnalyzer initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:]( objc_alloc(&OBJC_CLASS____DASChargeRateAnalyzer),  "initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:",  10LL,  v3,  30LL,  2LL);
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1B48();
  }
  -[_DASChargeRateAnalyzer start](v4, "start");

  return v4;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)actionToAnalyzers
{
  return self->_actionToAnalyzers;
}

- (void)setActionToAnalyzers:(id)a3
{
}

- (NSMutableDictionary)actionToTimers
{
  return self->_actionToTimers;
}

- (void)setActionToTimers:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)startToken
{
  return self->_startToken;
}

- (void)setStartToken:(int)a3
{
  self->_startToken = a3;
}

- (int)timeToken
{
  return self->_timeToken;
}

- (void)setTimeToken:(int)a3
{
  self->_timeToken = a3;
}

- (BOOL)initialMitigationInitiated
{
  return self->_initialMitigationInitiated;
}

- (BOOL)dutyCyclingInitiated
{
  return self->_dutyCyclingInitiated;
}

- (BOOL)encounteredTLC
{
  return self->_encounteredTLC;
}

- (void)setEncounteredTLC:(BOOL)a3
{
  self->_int encounteredTLC = a3;
}

- (NSDate)encounteredTLCDate
{
  return self->_encounteredTLCDate;
}

- (void)setEncounteredTLCDate:(id)a3
{
}

- (int64_t)lastSavedTLC
{
  return self->_lastSavedTLC;
}

- (void)setLastSavedTLC:(int64_t)a3
{
  self->_int64_t lastSavedTLC = a3;
}

- (int64_t)lastSavedEffort
{
  return self->_lastSavedEffort;
}

- (void)setLastSavedEffort:(int64_t)a3
{
  self->_int64_t lastSavedEffort = a3;
}

- (OS_dispatch_source)analyzerTimer
{
  return self->_analyzerTimer;
}

- (void)setAnalyzerTimer:(id)a3
{
}

- (unint64_t)dutyCyclingMethod
{
  return self->_dutyCyclingMethod;
}

- (void)setDutyCyclingMethod:(unint64_t)a3
{
  self->_unint64_t dutyCyclingMethod = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDate)currentDutyCycleStartTime
{
  return self->_currentDutyCycleStartTime;
}

- (void)setCurrentDutyCycleStartTime:(id)a3
{
}

- (double)dutyCycleDuration
{
  return self->_dutyCycleDuration;
}

- (void)setDutyCycleDuration:(double)a3
{
  self->_double dutyCycleDuration = a3;
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (NSString)trialTreatmentID
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (NSString)trialExperimentID
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setTrialExperimentID:(id)a3
{
}

- (int64_t)trialInitialAction
{
  return self->_trialInitialAction;
}

- (void)setTrialInitialAction:(int64_t)a3
{
  self->_trialInitialAction = a3;
}

- (BOOL)trialInitialActionAlways
{
  return self->_trialInitialActionAlways;
}

- (void)setTrialInitialActionAlways:(BOOL)a3
{
  self->_trialInitialActionAlways = a3;
}

- (BOOL)trialdisableSFI
{
  return self->_trialdisableSFI;
}

- (void)setTrialdisableSFI:(BOOL)a3
{
  self->_trialdisableSFI = a3;
}

- (int64_t)trialSFIWindow
{
  return self->_trialSFIWindow;
}

- (void)setTrialSFIWindow:(int64_t)a3
{
  self->_trialSFIWindow = a3;
}

- (double)trialSFIIdleWindowParameter
{
  return self->_trialSFIIdleWindowParameter;
}

- (void)setTrialSFIIdleWindowParameter:(double)a3
{
  self->_double trialSFIIdleWindowParameter = a3;
}

- (_DKKnowledgeSaving)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)controlEffortHistory
{
  return self->_controlEffortHistory;
}

- (void)setControlEffortHistory:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end