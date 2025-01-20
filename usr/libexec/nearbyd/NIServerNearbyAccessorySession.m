@interface NIServerNearbyAccessorySession
- (BOOL)supportsBackgroundedClients;
- (BOOL)supportsCameraAssistance;
- (NINearbyAccessoryConfiguration)configuration;
- (NIServerNearbyAccessorySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_finalizeRunning;
- (id)configure;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)printableState;
- (id)run;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)requiresUWBToRun;
- (void)dealloc;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)serviceDidGenerateShareableConfigurationData:(id)a3;
- (void)serviceDidInvalidateWithReason:(int)a3;
- (void)serviceDidReceiveNewSolution:(const void *)a3;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerNearbyAccessorySession

- (NIServerNearbyAccessorySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v53 = a3;
  id v52 = a4;
  uint64_t v9 = objc_opt_class(v52, v8);
  if (v9 != objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v10))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v49 handleFailureInMethod:a2 object:self file:@"NIServerNearbyAccessorySession.mm" lineNumber:134 description:@"NINearbyAccessoryConfiguration given invalid configuration."];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v53 serverSessionIdentifier]);

  if (!v11)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v50 handleFailureInMethod:a2, self, @"NIServerNearbyAccessorySession.mm", 135, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  v12 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v57,  "initWithResourcesManager:configuration:error:",  v53,  v52,  a5);
  v13 = v12;
  if (v12)
  {
    if (v53) {
      [v53 protobufLogger];
    }
    else {
      __int128 v56 = 0uLL;
    }
    p_pbLogger = &v12->_pbLogger;
    sub_10000EE54((uint64_t)p_pbLogger, &v56);
    v15 = (std::__shared_weak_count *)*((void *)&v56 + 1);
    if (*((void *)&v56 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v56 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v53 clientConnectionQueue]);
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v18;

    v20 = (NINearbyAccessoryConfiguration *)[v52 copy];
    configuration = v13->_configuration;
    v13->_configuration = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue([v53 serverSessionIdentifier]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@---%@", v23, v25));
    sessionUniqueIdentifier = v13->_sessionUniqueIdentifier;
    v13->_sessionUniqueIdentifier = (NSString *)v26;

    -[NIConfiguration setSupportsCameraAssistance:]( v13->_configuration,  "setSupportsCameraAssistance:",  +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture"));
    v28 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
    v29 = v13->_configuration;
    v30 = v13->_clientQueue;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v53 analytics]);
    ptr = p_pbLogger->__ptr_;
    cntrl = p_pbLogger->__cntrl_;
    v55 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v33 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }

    v35 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v28,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v29,  v30,  v13,  v13,  v31,  &ptr,  a5);
    updatesEngine = v13->_updatesEngine;
    v13->_updatesEngine = v35;

    v37 = v55;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        unint64_t v39 = __ldaxr(p_shared_owners);
      while (__stlxr(v39 - 1, p_shared_owners));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }

    if (v13->_updatesEngine)
    {
      v13->_sessionState = 0;
      v13->_backgroundAuthorization = 0;
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
      v41 = v13->_sessionUniqueIdentifier;
      v42 = v53;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v53 clientProcessSigningIdentity]);
      v44 = (void *)objc_claimAutoreleasedReturnValue( [v40 addServiceClient:v13 identifier:v41 processName:v43 configuration:v13->_configuration]);

      if (!v44)
      {
        v47 = v13;
        goto LABEL_31;
      }

      v45 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        sub_1003917F0((uint64_t)v44, v45, v46);
        if (a5) {
          goto LABEL_26;
        }
      }

      else if (a5)
      {
LABEL_26:
        v47 = 0LL;
        *a5 = v44;
LABEL_31:

        goto LABEL_32;
      }

      v47 = 0LL;
      goto LABEL_31;
    }
  }

  v47 = 0LL;
  v42 = v53;
LABEL_32:

  return v47;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundAuthorization != 2;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture");
}

- (unint64_t)requiresUWBToRun
{
  return 2LL;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  configuration = self->_configuration;
  if (!configuration) {
    sub_10039185C();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryDiscoveryToken](configuration, "accessoryDiscoveryToken"));

  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100391884();
    }
    goto LABEL_8;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier]( self->_configuration,  "bluetoothDeviceIdentifier"));

  v6 = (os_log_s *)qword_1008000A0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003918B0();
    }
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    return v7;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-ecosystem,Configuration does not specify a BLE peripheral",  v9,  2u);
  }

  v7 = 0LL;
  return v7;
}

- (id)run
{
  self->_sessionState = 1;
  unsigned int v3 = -[NINearbyAccessoryConfiguration dataExchangeDisabledAndUsingParameterOverrides]( self->_configuration,  "dataExchangeDisabledAndUsingParameterOverrides");
  v4 = (os_log_s *)qword_1008000A0;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-ecosystem,Configuration disables data exchange and is using parameter overrides",  buf,  2u);
    }

    self->_backgroundAuthorization = 2;
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
    id v5 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v14, "backgroundSupportUpdateHandler");
    v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v5);
    ((void (**)(void, BOOL))v6)[2]( v6,  -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
    return v7;
  }

  uint64_t v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[NIInternalUtils NISessionBackgroundModeToString:]( &OBJC_CLASS___NIInternalUtils,  "NISessionBackgroundModeToString:",  -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode"));
    *(_DWORD *)buf = 136315138;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-ecosystem,Configuration background mode: %s",  buf,  0xCu);
  }

  v7 = -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode");
  if (v7 == (void *)2)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003918DC();
    }
    goto LABEL_16;
  }

  if (v7 == (void *)1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100391908();
    }
LABEL_16:
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    return v7;
  }

  if (!v7)
  {
    self->_backgroundAuthorization = 2;
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
    id v10 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v13, "backgroundSupportUpdateHandler");
    v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v10);
    ((void (**)(void, BOOL))v11)[2]( v11,  -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
  }

  return v7;
}

- (id)_finalizeRunning
{
  self->_sessionState = 2;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
  [v3 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:1];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  v4 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lifecycleSupervisor]);
  int64_t v7 = -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode");
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (!v7)
    {
      [v6 setTimeoutOnPeerInactivity:1];
      [v6 setMaxInactivityBeforeTrackingBeganSeconds:10.0];
      [v6 setMaxInactivityAfterTrackingBeganSeconds:30.0];
    }
  }

  else
  {
    [v6 setTimeoutOnPeerInactivity:0];
  }

  if (-[NINearbyAccessoryConfiguration dataExchangeDisabledAndUsingParameterOverrides]( self->_configuration,  "dataExchangeDisabledAndUsingParameterOverrides"))
  {
    [v6 setTimeoutOnPeerInactivity:0];
  }

  if ([v6 timeoutOnPeerInactivity])
  {
    [v6 runWithConfigurationCalled];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyAccessoryConfiguration accessoryDiscoveryToken]( self->_configuration,  "accessoryDiscoveryToken"));
    v12 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v6 startedDiscoveringPeersWithTokens:v9];
  }

  return 0LL;
}

- (id)pauseWithSource:(int64_t)a3
{
  if (a3 == 2) {
    unsigned __int8 v5 = 4;
  }
  else {
    unsigned __int8 v5 = 3;
  }
  self->_sessionState = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
  [v6 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:0];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  int64_t v7 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lifecycleSupervisor]);

  return 0LL;
}

- (id)disableAllServices
{
  self->_sessionState = 6;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  id v3 = -[NIServerBaseSession disableAllServices](&v8, "disableAllServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  configuration = self->_configuration;
  self->_configuration = 0LL;

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
  [v6 removeServiceClientWithIdentifier:self->_sessionUniqueIdentifier];

  return v4;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  -[NIServerBaseSession invalidate](&v4, "invalidate");
  id v3 = -[NIServerNearbyAccessorySession disableAllServices](self, "disableAllServices");
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
  [v3 removeServiceClientWithIdentifier:self->_sessionUniqueIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  -[NIServerNearbyAccessorySession dealloc](&v4, "dealloc");
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150LL;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001656CC;
  v7[3] = &unk_1007B1C20;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)serviceDidReceiveNewSolution:(const void *)a3
{
  __int128 v5 = *((_OWORD *)a3 + 1);
  __int128 v22 = *(_OWORD *)a3;
  __int128 v23 = v5;
  __int128 v24 = *((_OWORD *)a3 + 2);
  sub_1001376C0(v25, (uint64_t)a3 + 48);
  sub_1001317DC(v26, (uint64_t)a3 + 608);
  sub_100137714(v29, (__n128 *)((char *)a3 + 760));
  memcpy(v33, (char *)a3 + 880, sizeof(v33));
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768LL;
  block[2] = sub_100165AA0;
  block[3] = &unk_1007B1C48;
  objc_copyWeak(&v9, &location);
  __int128 v10 = v22;
  __int128 v11 = v23;
  __int128 v12 = v24;
  sub_1001376C0(v13, (uint64_t)v25);
  sub_1001317DC(v14, (uint64_t)v26);
  sub_100137714(v17, v29);
  memcpy(v21, v33, sizeof(v21));
  block[4] = self;
  dispatch_async(clientQueue, block);
  if (v20 && __p)
  {
    v19 = __p;
    operator delete(__p);
  }

  if (v16) {
    sub_100034A98((uint64_t)v15, v15[1]);
  }
  sub_100124BFC((uint64_t)v13);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  if (v32 && v30)
  {
    v31 = v30;
    operator delete(v30);
  }

  if (v28) {
    sub_100034A98((uint64_t)v27, v27[1]);
  }
  sub_100124BFC((uint64_t)v25);
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2 = a3.var2;
  id v4 = *(void **)&a3.var0;
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100165E60;
  block[3] = &unk_1007B1C80;
  objc_copyWeak(v8, &location);
  int v9 = var2;
  v8[1] = v4;
  block[4] = self;
  dispatch_async(clientQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)serviceDidInvalidateWithReason:(int)a3
{
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100166194;
  v6[3] = &unk_1007A2648;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  v6[4] = self;
  dispatch_async(clientQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine acceptVisionInput:](self->_updatesEngine, "acceptVisionInput:", v4);
}

- (id)printableState
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_autoreleasePoolPush();
  unint64_t sessionState = (char)self->_sessionState;
  if (sessionState > 6) {
    id v6 = "Unknown";
  }
  else {
    id v6 = off_1007B1DA8[sessionState];
  }
  unint64_t backgroundAuthorization = (char)self->_backgroundAuthorization;
  if (backgroundAuthorization > 2) {
    int v8 = "Unknown";
  }
  else {
    int v8 = off_1007B1DE0[backgroundAuthorization];
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"State: %s. BG auth: %s",  v6,  v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryConfigData](self->_configuration, "accessoryConfigData"));
  id v11 = sub_100023D80(v10, 0);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Blob: %@", v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return  -[NIDiscoveryToken initWithDeviceAddress:]( objc_alloc(&OBJC_CLASS___NIDiscoveryToken),  "initWithDeviceAddress:",  (unsigned __int16)a3);
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 shortDeviceAddress]);
  id v4 = [v3 unsignedLongLongValue];

  v5.__val_ = (unint64_t)v4;
  BOOL v6 = 1LL;
  result.__engaged_ = v6;
  result.var0 = v5;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unsigned __int16 v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NINearbyObject);
  $BEC950A715106DE229A2E4BA1089E24D v5 = -[NIDiscoveryToken initWithDeviceAddress:]( objc_alloc(&OBJC_CLASS___NIDiscoveryToken),  "initWithDeviceAddress:",  v3);
  BOOL v6 = -[NINearbyObject initWithToken:](v4, "initWithToken:", v5);

  return v6;
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  BOOL v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn( "-[NIServerNearbyAccessorySession updatesEngine:didUpdateNearbyObjects:]",  "NIServerNearbyAccessorySession.mm",  694,  "engine == _updatesEngine");
  }
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100166734;
  v10[3] = &unk_1007B1C20;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(clientQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  int v8 = (NINearbyUpdatesEngine *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_updatesEngine != v8) {
    __assert_rtn( "-[NIServerNearbyAccessorySession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]",  "NIServerNearbyAccessorySession.mm",  763,  "engine == _updatesEngine");
  }
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100166A30;
  block[3] = &unk_1007B1CA8;
  objc_copyWeak(&v17, &location);
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(clientQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v4);
  self->_unint64_t sessionState = 5;
  $BEC950A715106DE229A2E4BA1089E24D v5 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v4);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessorySession;
  BOOL v6 = -[NIServerBaseSession resourcesManager](&v13, "resourcesManager");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remote]);
  uint64_t v18 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v8 didRemoveNearbyObjects:v9 withReason:0];

  id v10 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    sessionUniqueIdentifier = self->_sessionUniqueIdentifier;
    *(_DWORD *)buf = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = sessionUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-ecosystem,peerInactivityPeriodExceeded: %@ with reason: Timeout, for session identifier: %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerNearbyAccessoryRangingService sharedInstance]( &OBJC_CLASS___NIServerNearbyAccessoryRangingService,  "sharedInstance"));
  [v12 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:0];
}

- (NINearbyAccessoryConfiguration)configuration
{
  return (NINearbyAccessoryConfiguration *)objc_getProperty(self, a2, 96LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end