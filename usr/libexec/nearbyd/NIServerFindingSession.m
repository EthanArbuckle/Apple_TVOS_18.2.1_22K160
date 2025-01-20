@interface NIServerFindingSession
+ (id)sharedServicePrintableState;
- (BOOL)_doesClientWantFinderObserverSession;
- (BOOL)supportsCameraAssistance;
- (BOOL)updateConfiguration:(id)a3;
- (NIFindingConfiguration)configuration;
- (NIServerFindingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id)_processFindingEvent:(id)a3;
- (id)configure;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (unint64_t)requiresNarrowbandToRun;
- (unint64_t)requiresUWBToRun;
- (void)_resetSessionStateForOperation:(int)a3;
- (void)_startRunawayFindingBackstopTimer;
- (void)dealloc;
- (void)didGenerateShareableConfigurationData:(id)a3 forToken:(id)a4;
- (void)invalidate;
- (void)processVisionInput:(id)a3;
- (void)serviceDidDiscoverNearbyObject:(id)a3;
- (void)serviceDidGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)serviceDidRemoveNearbyObject:(id)a3;
- (void)serviceDidUpdateAlgorithmConvergenceState:(id)a3 forObject:(id)a4;
- (void)serviceDidUpdateNearbyObjects:(id)a3;
@end

@implementation NIServerFindingSession

- (NIServerFindingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NIFindingConfiguration, v13))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v31 handleFailureInMethod:a2 object:self file:@"NIServerFindingSession.mm" lineNumber:2397 description:@"Invalid configuration type."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v32 handleFailureInMethod:a2, self, @"NIServerFindingSession.mm", 2398, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v34,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (v15)
  {
    v16 = (NIFindingConfiguration *)[v10 copy];
    configuration = v15->_configuration;
    v15->_configuration = v16;

    v15->_isRunning = 0;
    v15->_shouldDeliverUpdates = 0;
    v15->_deliveredFirstUpdate = 0;
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    sessionIdentifier = v15->_sessionIdentifier;
    v15->_sessionIdentifier = (NSString *)v21;

    findingToken = v15->_findingToken;
    v15->_findingToken = 0LL;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v25 = [v24 BOOLForKey:@"FindingPublishSystemStatus"];

    v26 = (os_log_s *)qword_1008000A0;
    BOOL v27 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#find-ses,System status publishing enabled",  buf,  2u);
      }

      v28 = -[NIServerSystemStatusPublisher initWithSystemStatus:]( objc_alloc(&OBJC_CLASS___NIServerSystemStatusPublisher),  "initWithSystemStatus:",  2LL);
      systemStatusPublisher = v15->_systemStatusPublisher;
      v15->_systemStatusPublisher = v28;
    }

    else if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#find-ses,System status publishing disabled",  buf,  2u);
    }
  }

  return v15;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100LL;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  configuration = self->_configuration;
  if (!configuration) {
    return 2LL;
  }
  if (!-[NIFindingConfiguration isFinder](configuration, "isFinder")) {
    return 0LL;
  }
  if (-[NIServerFindingSession _doesClientWantFinderObserverSession](self, "_doesClientWantFinderObserverSession")) {
    return 0LL;
  }
  return 2LL;
}

- (unint64_t)requiresNarrowbandToRun
{
  v3 = sub_100005150();
  else {
    return 0LL;
  }
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_100399104();
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    configuration = self->_configuration;
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = sessionIdentifier;
    __int16 v19 = 2114;
    v20 = configuration;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Configure [%{public}@]: %{public}@",  buf,  0x16u);
  }

  if ((id)-[NIFindingConfiguration configType](self->_configuration, "configType") == (id)1)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration specifiedToken](self->_configuration, "specifiedToken"));
    p_findingToken = &self->_findingToken;
    v8 = *p_findingToken;
    *p_findingToken = (NIDiscoveryToken *)v6;

    if (*p_findingToken) {
      return 0LL;
    }
    NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
    v14 = @"No discovery token for this configuration type";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v10));
  }

  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    v16 = @"Configuration type not supported";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v10));
  }

  uint64_t v12 = (void *)v11;

  return v12;
}

- (id)run
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  v3 = -[NIServerBaseSession resourcesManager](&v24, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcessNameBestGuess]);
    *(_DWORD *)buf = 138543619;
    v26 = sessionIdentifier;
    __int16 v27 = 2113;
    v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Run [%{public}@]. Process: %{private}@",  buf,  0x16u);
  }

  BOOL isRunning = self->_isRunning;
  self->_BOOL isRunning = 1;
  self->_shouldDeliverUpdates = 1;
  self->_deliveredFirstUpdate = 0;
  if (-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"))
  {
    if (-[NIServerFindingSession _doesClientWantFinderObserverSession](self, "_doesClientWantFinderObserverSession"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServiceObserverRelay sharedInstance]( &OBJC_CLASS___NIServerFindingServiceObserverRelay,  "sharedInstance"));
      [v9 addObserver:self identifier:self->_sessionIdentifier token:self->_findingToken];
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v13 = [v12 BOOLForKey:@"FindingDisableService"];

      if (v13)
      {
        v14 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Finding session requested, but disabled via defaults write",  buf,  2u);
        }
      }

      else
      {
        findingService = self->_findingService;
        if (findingService)
        {
          if (!isRunning)
          {
            -[NIServerFindingService clientWithIdentifier:updatedStateToRunning:dueToTimeout:]( findingService,  "clientWithIdentifier:updatedStateToRunning:dueToTimeout:",  self->_sessionIdentifier,  1LL,  0LL);
            findingService = self->_findingService;
          }

          -[NIServerFindingService processUpdatedConfiguration:forClientIdentifier:]( findingService,  "processUpdatedConfiguration:forClientIdentifier:",  self->_configuration,  self->_sessionIdentifier);
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
          v17 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue( [v16 serviceForToken:self->_findingToken createIfNotExists:1]);
          uint64_t v18 = self->_findingService;
          self->_findingService = v17;

          id v19 =  -[NIServerFindingService addClient:identifier:configuration:]( self->_findingService,  "addClient:identifier:configuration:",  self,  self->_sessionIdentifier,  self->_configuration);
        }

        -[NIServerFindingSession _startRunawayFindingBackstopTimer](self, "_startRunawayFindingBackstopTimer");
        if (v4)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v4 appStateMonitor]);
          unsigned int v21 = [v20 isRunningBoardApp];

          if (v21)
          {
            systemStatusPublisher = self->_systemStatusPublisher;
            [v4 clientAuditToken];
            -[NIServerSystemStatusPublisher publishWithAuditToken:]( systemStatusPublisher,  "publishWithAuditToken:",  &v23);
          }
        }
      }
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
    [v10 addObserver:self];
  }

  return 0LL;
}

- (id)pauseWithSource:(int64_t)a3
{
  v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    int v7 = 138543362;
    v8 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Pause [%{public}@]",  (uint8_t *)&v7,  0xCu);
  }

  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 0LL);
  return 0LL;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  p_configuration = &self->_configuration;
  if (v4
    && *p_configuration
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NIFindingConfiguration, v5), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    id v8 = [v4 copy];
    unsigned __int8 v9 = -[NIFindingConfiguration canUpdateToConfiguration:](*p_configuration, "canUpdateToConfiguration:", v8);
    id v10 = (os_log_s *)qword_1008000A0;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        sessionIdentifier = self->_sessionIdentifier;
        unsigned int v13 = *p_configuration;
        int v20 = 138543874;
        unsigned int v21 = sessionIdentifier;
        __int16 v22 = 2114;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Update configuration [%{public}@]\nOld: %{public}@\nNew: %{public}@",  (uint8_t *)&v20,  0x20u);
      }

      objc_storeStrong((id *)&self->_configuration, v8);
    }

    else if (v11)
    {
      v17 = self->_sessionIdentifier;
      uint64_t v18 = *p_configuration;
      int v20 = 138412802;
      unsigned int v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Can't update configuration, parameters are too different [%@]\nOld: %@\nNew: %@",  (uint8_t *)&v20,  0x20u);
    }
  }

  else
  {
    v14 = (os_log_s *)qword_1008000A0;
    unsigned __int8 v9 = 0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v15 = self->_sessionIdentifier;
      v16 = *p_configuration;
      int v20 = 138412802;
      unsigned int v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Can't update configuration, one is nil or wrong type [%@]\nOld: %@\nNew: %@",  (uint8_t *)&v20,  0x20u);
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Dealloc [%{public}@]", buf, 0xCu);
  }

  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 3LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  -[NIServerFindingSession dealloc](&v5, "dealloc");
}

- (void)invalidate
{
  if (self->_findingToken)
  {
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      sessionIdentifier = self->_sessionIdentifier;
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Invalidate [%{public}@]", buf, 0xCu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 2LL);
}

- (void)_resetSessionStateForOperation:(int)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v6 = [v5 BOOLForKey:@"FindingDisableClientPausingService"];

  if ((v6 & 1) != 0) {
    goto LABEL_4;
  }
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  uint64_t v7 = -[NIServerBaseSession resourcesManager](&v18, "resourcesManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProcessNameBestGuess]);
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.NanoSettingsViewService"];

  if ((v10 & 1) != 0)
  {
LABEL_4:
    -[NIServerFindingService removeClientWithIdentifier:dueToTimeout:]( self->_findingService,  "removeClientWithIdentifier:dueToTimeout:",  self->_sessionIdentifier,  a3 == 1);
    findingService = self->_findingService;
    self->_findingService = 0LL;

    findingToken = self->_findingToken;
    self->_findingToken = 0LL;

    configuration = self->_configuration;
    self->_configuration = 0LL;

    if (a3 == 3) {
      goto LABEL_8;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServiceObserverRelay sharedInstance]( &OBJC_CLASS___NIServerFindingServiceObserverRelay,  "sharedInstance"));
    [v14 removeObserverWithIdentifier:self->_sessionIdentifier];

    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
    [v15 removeObserver:self];
  }

  else
  {
    -[NIServerFindingService clientWithIdentifier:updatedStateToRunning:dueToTimeout:]( self->_findingService,  "clientWithIdentifier:updatedStateToRunning:dueToTimeout:",  self->_sessionIdentifier,  0LL,  a3 == 1);
  }

  -[NIServerSystemStatusPublisher unpublish](self->_systemStatusPublisher, "unpublish");
LABEL_8:
  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    v17 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0LL;
  }

  self->_BOOL isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_deliveredFirstUpdate = 0;
}

- (void)_startRunawayFindingBackstopTimer
{
  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    id v4 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0LL;
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"RunawayFindingBackstopTimeoutOverrideSeconds"]);
  int64_t v7 = 1200000000000LL;

  if (v6)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      [v6 doubleValue];
      double v11 = v10;
      uint64_t v12 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Runaway finding backstop timeout override: %0.1f s",  buf,  0xCu);
      }

      int64_t v7 = (unint64_t)(v11 * 1000000000.0);
    }
  }

  unsigned int v13 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_clientQueue);
  p_runawayFindingBackstopTimer = &self->_runawayFindingBackstopTimer;
  NSErrorUserInfoKey v15 = self->_runawayFindingBackstopTimer;
  self->_runawayFindingBackstopTimer = v13;

  v16 = self->_runawayFindingBackstopTimer;
  dispatch_time_t v17 = dispatch_time(0LL, v7);
  dispatch_source_set_timer((dispatch_source_t)v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak((id *)buf, self);
  objc_super v18 = self->_runawayFindingBackstopTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001C67E0;
  handler[3] = &unk_1007A1CA0;
  objc_copyWeak(&v20, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v18, handler);
  dispatch_resume((dispatch_object_t)*p_runawayFindingBackstopTimer);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_doesClientWantFinderObserverSession
{
  configuration = self->_configuration;
  if (!configuration || !-[NIFindingConfiguration isFinder](configuration, "isFinder")) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
  id v4 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIFindingConfiguration isObserver](self->_configuration, "isObserver"))
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcessNameBestGuess]);
    unsigned __int8 v6 = [v7 isEqualToString:@"com.apple.nanofindlocallyd"];
  }

  return v6;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture");
}

- (id)_processFindingEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4) {
    __assert_rtn("-[NIServerFindingSession _processFindingEvent:]", "NIServerFindingSession.mm", 2718, "event");
  }
  if (self->_configuration)
  {
    objc_super v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      dispatch_time_t v17 = sub_100277A54(-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"));
      sessionIdentifier = self->_sessionIdentifier;
      int v19 = 136315651;
      id v20 = v17;
      __int16 v21 = 2112;
      double v22 = sessionIdentifier;
      __int16 v23 = 2113;
      id v24 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#find-ses,[%s] Process event [%@]: %{private}@",  (uint8_t *)&v19,  0x20u);
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FindingEventDictKey_EventType"]);
    id v7 = [v6 integerValue];

    else {
      id v8 = v7;
    }
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FindingEventDictKey_ObjectDiscoveryToken"]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FindingEventDictKey_SharedConfigurationData"]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FindingEventDictKey_Location"]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FindingEventDictKey_Heading"]);
    if (-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"))
    {
      findingService = self->_findingService;
      if (findingService)
      {
        v14 = findingService;
      }

      else
      {
        NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
        v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue( [v15 serviceForToken:self->_findingToken createIfNotExists:0]);
      }

      switch((unint64_t)v8)
      {
        case 2uLL:
          if (v11) {
            -[NIServerFindingService processSelfLocation:](v14, "processSelfLocation:", v11);
          }
          break;
        case 3uLL:
          if (v12) {
            -[NIServerFindingService processSelfHeading:](v14, "processSelfHeading:", v12);
          }
          break;
        case 4uLL:
          if (v11 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9)) {
            -[NIServerFindingService processPeerLocation:forPeer:](v14, "processPeerLocation:forPeer:", v11, v9);
          }
          break;
        case 5uLL:
          if (v9 && v10 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9)) {
            -[NIServerFindingService processClientDiscoveryEventWithSharedConfigurationData:]( v14,  "processClientDiscoveryEventWithSharedConfigurationData:",  v10);
          }
          break;
        case 6uLL:
          if (v9 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9)) {
            -[NIServerFindingService processClientRemovePeerEvent](v14, "processClientRemovePeerEvent");
          }
          break;
        default:
          break;
      }
    }

    else if (v8 == (id)6)
    {
      if (!v9 || !-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9)) {
        goto LABEL_39;
      }
      v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
      -[NIServerFindingService processClientRemovePeerEventForToken:]( v14,  "processClientRemovePeerEventForToken:",  self->_findingToken);
    }

    else
    {
      if (v8 != (id)5 || !v9 || !v10 || !-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9)) {
        goto LABEL_39;
      }
      v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
      -[NIServerFindingService processClientDiscoveryEventForToken:sharedConfigurationData:]( v14,  "processClientDiscoveryEventForToken:sharedConfigurationData:",  self->_findingToken,  v10);
    }

LABEL_39:
    goto LABEL_40;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10039912C();
  }
LABEL_40:

  return 0LL;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C6E50;
  block[3] = &unk_1007B14B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

- (void)serviceDidDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001C6F60;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

- (void)serviceDidRemoveNearbyObject:(id)a3
{
  id v4 = a3;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001C7070;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

- (void)serviceDidUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001C71F4;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

- (void)serviceDidUpdateAlgorithmConvergenceState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C7450;
  block[3] = &unk_1007B14B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v7))
  {
    id v8 = -[NINearbyObject initWithToken:]( objc_alloc(&OBJC_CLASS___NINearbyObject),  "initWithToken:",  self->_findingToken);
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NIServerFindingSession;
    id v9 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remote]);
    [v11 didGenerateShareableConfigurationData:v6 forObject:v8];
  }
}

- (void)processVisionInput:(id)a3
{
}

+ (id)sharedServicePrintableState
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#find-ses,sharedServicePrintableState", v6, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 printableState]);

  return v4;
}

- (NIFindingConfiguration)configuration
{
  return (NIFindingConfiguration *)objc_getProperty(self, a2, 104LL, 1);
}

- (void).cxx_destruct
{
}

@end