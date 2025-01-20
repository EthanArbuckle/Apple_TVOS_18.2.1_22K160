@interface NIServerFindingService
- (BOOL)_isAnyClientRunning;
- (BOOL)_sessionConfiguredToRange;
- (NIServerFindingService)initWithLabel:(id)a3;
- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr;
- (id).cxx_construct;
- (id)_getCommonConfiguration;
- (id)_startService;
- (id)addClient:(id)a3 identifier:(id)a4 configuration:(id)a5;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)objectFromIdentifier:(unint64_t)a3;
- (int)_useCase;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (void)DataCallback:(id)a3;
- (void)_addAlgorithmOutputFlagsToPeerTrackingState:(unsigned __int8)a3;
- (void)_handleRangingTerminatedCallbackForPeer:(id)a3;
- (void)_logSessionSummary;
- (void)_logSuccessfulRange:(double)a3;
- (void)_logUnsuccessfulRange;
- (void)_pauseServiceDueToClientTimeout:(BOOL)a3;
- (void)_processUpdatedCommonConfigurationIfNecessary;
- (void)_removeAlgorithmOutputFlagsFromPeerTrackingState:(unsigned __int8)a3;
- (void)_resetServiceStateForOperation:(int)a3;
- (void)_resetUpdatesEngine;
- (void)_startOrUpdateAdvertising;
- (void)_tryToStartRangingWithPeerAdvertisement:(id)a3;
- (void)_updatePeerTrackingAdvertisingState:(int)a3;
- (void)_updatePeerTrackingClientWantsUpdates:(BOOL)a3;
- (void)_updatePeerTrackingDiscoveryState:(int)a3;
- (void)_updatePeerTrackingOverallState:(id)a3;
- (void)_updatePeerTrackingRangingState:(int)a3;
- (void)bluetoothDiscoveryBecameAvailable;
- (void)bluetoothDiscoveryBecameUnavailable;
- (void)bluetoothDiscoveryFinishedActivating;
- (void)clientWithIdentifier:(id)a3 updatedStateToRunning:(BOOL)a4 dueToTimeout:(BOOL)a5;
- (void)dealloc;
- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4;
- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5;
- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4;
- (void)didLosePeer:(id)a3;
- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4;
- (void)didRangingAuthorizationFailForPeer:(id)a3;
- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5;
- (void)didStopAdvertisingToPeer:(id)a3;
- (void)didStopRangingWithPeer:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)processClientDiscoveryEventWithSharedConfigurationData:(id)a3;
- (void)processClientRemovePeerEvent;
- (void)processPeerLocation:(id)a3 forPeer:(id)a4;
- (void)processSelfHeading:(id)a3;
- (void)processSelfLocation:(id)a3;
- (void)processUpdatedConfiguration:(id)a3 forClientIdentifier:(id)a4;
- (void)processVisionInput:(id)a3;
- (void)relayInfoToNewObserver:(id)a3;
- (void)removeClientWithIdentifier:(id)a3 dueToTimeout:(BOOL)a4;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerFindingService

- (NIServerFindingService)initWithLabel:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NIServerFindingService;
  v5 = -[NIServerFindingService init](&v30, "init");
  if (v5)
  {
    v6 = (const char *)[v4 cStringUsingEncoding:4];
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, -2);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create(v6, v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSUUID);
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSUUID);
    algorithmsIdentifier = v5->_algorithmsIdentifier;
    v5->_algorithmsIdentifier = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    findingClients = v5->_findingClients;
    v5->_findingClients = (NSMapTable *)v15;

    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    findingConfigurations = v5->_findingConfigurations;
    v5->_findingConfigurations = v17;

    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    clientRunStates = v5->_clientRunStates;
    v5->_clientRunStates = v19;

    v5->_serviceState = 0;
    v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    sessionSummary = v5->_sessionSummary;
    v5->_sessionSummary = v21;

    findingToken = v5->_findingToken;
    v5->_findingToken = 0LL;

    configuration = v5->_configuration;
    v5->_configuration = 0LL;

    v25 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v5->_serviceIdentifier;
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Service initialized (%{public}@)",  buf,  0xCu);
    }

    v27 = -[DetailsViewAnalytics initWithCurrentTime:]( objc_alloc(&OBJC_CLASS___DetailsViewAnalytics),  "initWithCurrentTime:",  sub_100023CC4());
    detailsViewAnalytics = v5->_detailsViewAnalytics;
    v5->_detailsViewAnalytics = v27;
  }

  return v5;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    *(_DWORD *)buf = 138543362;
    dispatch_queue_attr_t v7 = serviceIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Service deallocated (%{public}@)",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerFindingService;
  -[NIServerFindingService dealloc](&v5, "dealloc");
}

- (id)addClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_1001BDF60;
    v24 = sub_1001BDF70;
    id v25 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001BDF78;
    v15[3] = &unk_1007B51C0;
    v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v18 = v10;
    v19 = &v20;
    dispatch_sync(queue, v15);
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
    v27 = @"Finding Service Client can't be nil";
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v13));
  }

  return v12;
}

- (void)clientWithIdentifier:(id)a3 updatedStateToRunning:(BOOL)a4 dueToTimeout:(BOOL)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BE318;
  block[3] = &unk_1007B51E8;
  id v12 = v8;
  v13 = self;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_sync(queue, block);
}

- (void)removeClientWithIdentifier:(id)a3 dueToTimeout:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BE5E4;
  block[3] = &unk_1007B1690;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)relayInfoToNewObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BE8E0;
  block[3] = &unk_1007A2248;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)processUpdatedConfiguration:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BEA70;
  block[3] = &unk_1007B14B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BEB1C;
  block[3] = &unk_1007A2248;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)processClientDiscoveryEventWithSharedConfigurationData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingAdvertisement advertisementFromByteRepresentation:]( &OBJC_CLASS___NIServerFindingAdvertisement,  "advertisementFromByteRepresentation:",  v4));
  id v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138478083;
    id v12 = v7;
    __int16 v13 = 2113;
    BOOL v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Service processClientDiscoveryEvent [%{private}@]. Adv: %{private}@",  buf,  0x16u);
  }

  if (v5)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001BED08;
    v9[3] = &unk_1007A2248;
    v9[4] = self;
    id v10 = v5;
    dispatch_sync(queue, v9);
  }
}

- (void)processClientRemovePeerEvent
{
  v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138477827;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Service processClientRemovePeerEvent [%{private}@]",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BEE54;
  block[3] = &unk_1007A3000;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)processSelfLocation:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    sub_100398A18(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001BEF94;
    v8[3] = &unk_1007A2248;
    id v9 = v4;
    id v10 = self;
    dispatch_sync(queue, v8);
  }
}

- (void)processSelfHeading:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    sub_100398A5C(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001BF1F4;
    v8[3] = &unk_1007A2248;
    id v9 = v4;
    id v10 = self;
    dispatch_sync(queue, v8);
  }
}

- (void)processPeerLocation:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    *(_DWORD *)buf = 138478339;
    id v18 = v12;
    __int16 v19 = 2113;
    id v20 = v7;
    __int16 v21 = 2113;
    id v22 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#find-ses,Service processPeerLocationForPeer [%{private}@]: %{private}@. Location: %{private}@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001BF418;
  block[3] = &unk_1007B14B8;
  id v14 = v6;
  BOOL v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

- (id)_startService
{
  if (self->_pauseDelayTimer)
  {
    v3 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Service [%{public}@] canceled pending pause",  buf,  0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_pauseDelayTimer);
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0LL;
  }

  if (self->_serviceState)
  {
    id v6 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = sub_100277A70((uint64_t)"SessionResumed", 1, self->_findingToken, 0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionResumed",  v10));
    [v9 logSessionEvent:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v12,  @"[A2|SES] Resum");
  }

  else
  {
    __int16 v13 = (NIFindingConfiguration *)objc_claimAutoreleasedReturnValue(-[NIServerFindingService _getCommonConfiguration](self, "_getCommonConfiguration"));
    configuration = self->_configuration;
    self->_configuration = v13;

    BOOL v15 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cfg: %@",  self->_configuration));
      id v18 = sub_100277A70((uint64_t)"SessionStarted", 1, findingToken, v17);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionStarted",  v21));
    [v20 logSessionEvent:v22];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v12,  @"[A1|SES] Start");
  }

  -[DetailsViewAnalytics setEnteredFromActiveFindingUI:]( self->_detailsViewAnalytics,  "setEnteredFromActiveFindingUI:",  (id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") == (id)2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration debugParameters](self->_configuration, "debugParameters"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"DisableBTDiscovery"]);
  unsigned int v25 = [v24 BOOLValue];

  if (v25)
  {
    NSErrorUserInfoKey v26 = (os_log_s *)qword_1008000A0;
    uint64_t v27 = 0LL;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v28 = "#find-ses,Debug configuration enabled to disable BT discovery";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    uint64_t v27 = 0LL;
    goto LABEL_20;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v30 = [v29 BOOLForKey:@"FindingSessionDisableBTDiscovery"];

  if (v30)
  {
    NSErrorUserInfoKey v26 = (os_log_s *)qword_1008000A0;
    uint64_t v27 = 0LL;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v28 = "#find-ses,Defaults write to disable BT discovery";
    goto LABEL_18;
  }

  uint64_t v27 = 1LL;
LABEL_20:
  double v31 = sub_1002777EC(@"FindingBTDiscoveryTimeoutSecondsOverride", 120.0);
  v32 = objc_alloc(&OBJC_CLASS___NIServerFindingDiscoveryProvider);
  id v33 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_serviceIdentifier, "UUIDString"));
  sub_1000065CC(buf, (char *)[v33 UTF8String]);
  v34 = -[NIServerFindingDiscoveryProvider initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:]( v32,  "initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:",  buf,  1LL,  v27,  0LL,  50LL,  self,  v31,  sub_1002777B4(-[NIServerFindingService _useCase](self, "_useCase")),  self->_queue);
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = v34;

  v36 = objc_alloc(&OBJC_CLASS___NIServerFindingRangingProvider);
  id v37 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_serviceIdentifier, "UUIDString"));
  sub_1000065CC(buf, (char *)[v37 UTF8String]);
  queue = self->_queue;
  uint64_t v93 = 0LL;
  v94 = 0LL;
  v39 = -[NIServerFindingRangingProvider initWithIdentifier:isFinder:consumer:queue:pbLogger:]( v36,  "initWithIdentifier:isFinder:consumer:queue:pbLogger:",  buf,  1LL,  self,  queue,  &v93);
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = v39;

  v41 = v94;
  if (v94)
  {
    p_shared_owners = (unint64_t *)&v94->__shared_owners_;
    do
      unint64_t v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  v44 = self->_discoveryProvider;
  if (v44 && self->_rangingProvider)
  {
    -[NIServerFindingDiscoveryProvider activate](v44, "activate");
    -[NIServerFindingRangingProvider activate](self->_rangingProvider, "activate");
    v45 = self->_rangingProvider;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration debugParameters](self->_configuration, "debugParameters"));
    -[NIServerFindingRangingProvider setDebugParameters:](v45, "setDebugParameters:", v46);

    v47 = (NIServerFindingPeerTracking *)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
    peerTracking = self->_peerTracking;
    self->_peerTracking = v47;

    -[NIServerFindingService _updatePeerTrackingClientWantsUpdates:]( self,  "_updatePeerTrackingClientWantsUpdates:",  (id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") != (id)3);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    self->_BOOL enableDeviceFinding = [v49 BOOLForKey:@"EnableDeviceFindingOnPhone"];

    v50 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enableDeviceFinding = self->_enableDeviceFinding;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = enableDeviceFinding;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "#find-ses,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone, %d",  buf,  8u);
    }

    -[NIServerFindingService _resetUpdatesEngine](self, "_resetUpdatesEngine");
    self->_cachedSolutionMacAddr = 0LL;
    self->_lastLogMachContTime = 0.0;
    v52 = self->_discoveryProvider;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", self->_findingToken));
    id v54 =  -[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:]( v52,  "setPeersEligibleForDiscovery:requestScan:",  v53,  1LL);

    unsigned int v55 = -[NIServerFindingRangingProvider rangingTriggerType](self->_rangingProvider, "rangingTriggerType");
    v56 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v55 ? "TriggerRequired" : "NoTriggerRequired";
      sub_1000065CC(buf, v57);
      v58 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v95 = 136315138;
      v96 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#find-ses,ranging trigger type = %s",  v95,  0xCu);
    }

    if (!v55)
    {
      v59 = objc_alloc(&OBJC_CLASS___NIServerFindingAdvertisement);
      *(_WORD *)&uint8_t buf[4] = 0;
      *(_DWORD *)buf = 0;
      id v60 = -[NIServerFindingAdvertisement initForFinder:address:](v59, "initForFinder:address:", 0LL, buf);
      [v60 setCanRange:1];
      v61 = self->_rangingProvider;
      if (v61) {
        -[NIServerFindingRangingProvider supportedTechnologies](v61, "supportedTechnologies");
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      BOOL v65 = sub_100278484(buf, 1);
      __p = 0LL;
      v91 = 0LL;
      v92 = 0LL;
      v66 = operator new(4uLL);
      if (v65) {
        int v67 = 1;
      }
      else {
        int v67 = 2;
      }
      __p = v66;
      _DWORD *v66 = v67;
      v91 = v66 + 1;
      v92 = v66 + 1;
      [v60 setSupportedTechnologies:&__p];
      if (__p)
      {
        v91 = __p;
        operator delete(__p);
      }

      if (*(void *)buf)
      {
        *(void *)&buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }

      [v60 setProtocolVersion:1];
      v68 = sub_100288340();
      uint64_t v69 = *((void *)v68 + 406);
      v70 = (std::__shared_weak_count *)*((void *)v68 + 407);
      *(void *)buf = v69;
      *(void *)&buf[8] = v70;
      if (v70)
      {
        v71 = (unint64_t *)&v70->__shared_owners_;
        do
          unint64_t v72 = __ldxr(v71);
        while (__stxr(v72 + 1, v71));
      }

      sub_100267408(v69);
      [v60 setNarrowBandMask:sub_10032B934((unsigned __int8 **)v89)];
      if (v89[0])
      {
        v89[1] = v89[0];
        operator delete(v89[0]);
      }

      if (v70)
      {
        v73 = (unint64_t *)&v70->__shared_owners_;
        do
          unint64_t v74 = __ldaxr(v73);
        while (__stlxr(v74 - 1, v73));
        if (!v74)
        {
          ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
          std::__shared_weak_count::__release_weak(v70);
        }
      }

      -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 2LL);
      -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:]( self,  "_tryToStartRangingWithPeerAdvertisement:",  v60);
    }

    -[NIServerFindingService _startOrUpdateAdvertising](self, "_startOrUpdateAdvertising");
    id v88 = 0LL;
    unsigned int v75 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:]( &OBJC_CLASS___CLLocationManager,  "_checkAndExerciseAuthorizationForBundleID:error:",  @"com.apple.findmy",  &v88);
    id v63 = v88;
    if (v63)
    {
      v76 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = @"com.apple.findmy";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Authorization error for %{public}@,error,%{public}@",  buf,  0x16u);
      }
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v78 = [v77 BOOLForKey:@"FindingSessionDisableLocationManagerWorkaround_r108262579"];

    self->_BOOL enableLocalLocationManager = v75 & (v78 ^ 1);
    v79 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enableLocalLocationManager = self->_enableLocalLocationManager;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v75;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v78;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = enableLocalLocationManager;
      _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "#find-ses,findMyAppIsAuthorizedForLocations,%d,FindingSessionDisableLocationManagerWorkaround_r108262579,%d,enab leLocalLocationManager,%d",  buf,  0x14u);
    }

    if (self->_enableLocalLocationManager)
    {
      v81 = sub_100005150();
      if (sub_100320824(v81[144]))
      {
        v82 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Using a temporary location manager until rdar://107853227 lands",  buf,  2u);
        }

        v83 = -[CLLocationManager initWithEffectiveBundleIdentifier:delegate:onQueue:]( objc_alloc(&OBJC_CLASS___CLLocationManager),  "initWithEffectiveBundleIdentifier:delegate:onQueue:",  @"com.apple.findmy",  self,  self->_queue);
        locationManager = self->_locationManager;
        self->_locationManager = v83;

        -[CLLocationManager setActivityType:](self->_locationManager, "setActivityType:", 3LL);
        -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", kCLDistanceFilterNone);
        -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
        -[CLLocationManager setHeadingFilter:](self->_locationManager, "setHeadingFilter:", kCLHeadingFilterNone);
        -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
        -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
        -[CLLocationManager startUpdatingHeading](self->_locationManager, "startUpdatingHeading");
      }
    }

    if (!self->_gnssExtensionsManager)
    {
      v85 = -[NIGnssExtensionsManager initWithQueue:bundleId:reason:]( objc_alloc(&OBJC_CLASS___NIGnssExtensionsManager),  "initWithQueue:bundleId:reason:",  self->_queue,  @"com.apple.findmy",  @"NIServerFindingService");
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v85;

      -[NIGnssExtensionsManager setDelegate:](self->_gnssExtensionsManager, "setDelegate:", self);
    }

    -[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:]( self->_analyticsManager,  "sessionSuccessfullyRanWithConfig:withTimestamp:",  self->_configuration,  sub_100023CC4());
    self->_serviceState = 1;
    v64 = 0LL;
    self->_serviceStartTimeSeconds = sub_100023CC4();
  }

  else
  {
    v62 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100398AA0((uint64_t)self, (uint64_t *)&self->_configuration, v62);
    }
    NSErrorUserInfoKey v97 = NSLocalizedFailureReasonErrorKey;
    v98 = @"Providers could not be initialized ";
    id v63 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v63));
  }

  return v64;
}

- (void)_pauseServiceDueToClientTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    objc_super v5 = self;
    uint64_t v6 = 1LL;
LABEL_5:
    -[NIServerFindingService _resetServiceStateForOperation:](v5, "_resetServiceStateForOperation:", v6);
    return;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableServicePauseDelay"];

  if (v8)
  {
    objc_super v5 = self;
    uint64_t v6 = 0LL;
    goto LABEL_5;
  }

  if (!self->_pauseDelayTimer)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"FindingServicePauseDelayOverrideSeconds"]);
    int64_t v11 = 1000000000LL;

    if (v10)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
      if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
      {
        [v10 doubleValue];
        double v15 = v14;
        id v16 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v26 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Pause delay override: %0.1f s",  buf,  0xCu);
        }

        int64_t v11 = (unint64_t)(v15 * 1000000000.0);
      }
    }

    id v17 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    p_pauseDelayTimer = &self->_pauseDelayTimer;
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = v17;

    id v20 = self->_pauseDelayTimer;
    dispatch_time_t v21 = dispatch_time(0LL, v11);
    dispatch_source_set_timer((dispatch_source_t)v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    id v22 = self->_pauseDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001C05D0;
    handler[3] = &unk_1007A1CA0;
    objc_copyWeak(&v24, (id *)buf);
    dispatch_source_set_event_handler((dispatch_source_t)v22, handler);
    dispatch_resume((dispatch_object_t)*p_pauseDelayTimer);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

- (void)_processUpdatedCommonConfigurationIfNecessary
{
  if (self->_serviceState == 1)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingService _getCommonConfiguration](self, "_getCommonConfiguration"));
    p_configuration = &self->_configuration;
    if (!-[NIFindingConfiguration isEqual:](self->_configuration, "isEqual:", v3))
    {
      objc_super v5 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        findingToken = self->_findingToken;
        id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Old: %@. New: %@",  self->_configuration,  v3));
        id v8 = sub_100277A70((uint64_t)"UpdateConfig", 1, findingToken, v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_configuration, v3);
      -[NIServerFindingService _updatePeerTrackingClientWantsUpdates:]( self,  "_updatePeerTrackingClientWantsUpdates:",  (id)-[NIFindingConfiguration preferredUpdateRate](*p_configuration, "preferredUpdateRate") != (id)3);
      if ((id)-[NIFindingConfiguration preferredUpdateRate](*p_configuration, "preferredUpdateRate") == (id)3) {
        -[NIServerFindingService _resetUpdatesEngine](self, "_resetUpdatesEngine");
      }
      -[NIServerFindingService _startOrUpdateAdvertising](self, "_startOrUpdateAdvertising");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider discoveredPeers](self->_discoveryProvider, "discoveredPeers"));
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:self->_findingToken]);

      if (v11) {
        -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:]( self,  "_tryToStartRangingWithPeerAdvertisement:",  v11);
      }
    }
  }

- (id)_getCommonConfiguration
{
  BOOL v3 = -[NIFindingConfiguration initWithRole:discoveryToken:preferredUpdateRate:]( objc_alloc(&OBJC_CLASS___NIFindingConfiguration),  "initWithRole:discoveryToken:preferredUpdateRate:",  0LL,  self->_findingToken,  3LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_findingConfigurations, "objectEnumerator"));
  objc_super v5 = 0LL;
  while (1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nextObject]);

    if (!v6) {
      break;
    }
    if ([v6 preferredUpdateRate] != (id)3) {
      -[NIFindingConfiguration setPreferredUpdateRate:](v3, "setPreferredUpdateRate:", 2LL);
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 debugParameters]);

    objc_super v5 = v6;
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 debugParameters]);
      -[NIFindingConfiguration setDebugParameters:](v3, "setDebugParameters:", v8);

      objc_super v5 = v6;
    }
  }

  -[NIFindingConfiguration setCameraAssistanceEnabled:]( v3,  "setCameraAssistanceEnabled:",  +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture"));

  return v3;
}

- (int)_useCase
{
  v2 = sub_100005150();
  return !sub_100320824(v2[144]);
}

- (BOOL)_isAnyClientRunning
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  clientRunStates = self->_clientRunStates;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001C0A54;
  v5[3] = &unk_1007B5210;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientRunStates, "enumerateKeysAndObjectsUsingBlock:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_resetServiceStateForOperation:(int)a3
{
  pauseDelayTimer = self->_pauseDelayTimer;
  if (pauseDelayTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pauseDelayTimer);
    uint64_t v6 = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0LL;
  }

  if ((a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:]( self,  "_removeAlgorithmOutputFlagsFromPeerTrackingState:",  255LL);
      id v20 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = sub_100277A70((uint64_t)"SessionTimeout", 1, self->_findingToken, 0LL);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543362;
        v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionTimeout",  v24));
      [v23 logSessionEvent:v25];

      double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v26,  @"[A4|SES] T/out");
    }

    else
    {
      -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:]( self,  "_removeAlgorithmOutputFlagsFromPeerTrackingState:",  255LL);
      uint64_t v27 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = sub_100277A70((uint64_t)"SessionPaused", 1, self->_findingToken, 0LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138543362;
        v48 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }

      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionPaused",  v31));
      [v30 logSessionEvent:v32];

      double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v26,  @"[A3|SES] Pause");
    }

    -[NIServerFindingService _logSessionSummary](self, "_logSessionSummary");
    -[DetailsViewAnalytics submitAnalytics](self->_detailsViewAnalytics, "submitAnalytics");
    self->_serviceState = 2;
  }

  else
  {
    -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:]( self,  "_removeAlgorithmOutputFlagsFromPeerTrackingState:",  255LL);
    if (self->_findingToken)
    {
      id v7 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = sub_100277A70((uint64_t)"SessionStopped", 1, self->_findingToken, 0LL);
        char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        *(_DWORD *)buf = 138543362;
        v48 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionStopped",  v11));
      [v10 logSessionEvent:v12];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v13,  @"[A5|SES] Stop ");

      double v14 = -[NINearbyObject initWithToken:]( objc_alloc(&OBJC_CLASS___NINearbyObject),  "initWithToken:",  self->_findingToken);
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServiceObserverRelay sharedInstance]( &OBJC_CLASS___NIServerFindingServiceObserverRelay,  "sharedInstance"));
      findingToken = self->_findingToken;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1001C10DC;
      v45[3] = &unk_1007B5238;
      id v17 = v14;
      v46 = v17;
      [v15 relayToObserversForToken:findingToken blockToRelay:v45];
    }

    -[NIServerFindingService _logSessionSummary](self, "_logSessionSummary");
    -[DetailsViewAnalytics submitAnalytics](self->_detailsViewAnalytics, "submitAnalytics");
    configuration = self->_configuration;
    self->_configuration = 0LL;

    __int16 v19 = self->_findingToken;
    self->_findingToken = 0LL;

    self->_serviceState = 0;
    -[NSMapTable removeAllObjects](self->_findingClients, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_findingConfigurations, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_clientRunStates, "removeAllObjects");
  }

  id v33 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  sessionSummary = self->_sessionSummary;
  self->_sessionSummary = v33;

  -[NIServerFindingDiscoveryProvider invalidate](self->_discoveryProvider, "invalidate");
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = 0LL;

  -[NIServerFindingRangingProvider invalidate](self->_rangingProvider, "invalidate");
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = 0LL;

  -[NINearbyUpdatesEngine invalidate](self->_updatesEngine, "invalidate");
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0LL;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0LL;

  peerTracking = self->_peerTracking;
  self->_peerTracking = 0LL;

  self->_cachedSolutionMacAddr = 0LL;
  self->_lastLogMachContTime = 0.0;
  cachedVisionInput = self->_cachedVisionInput;
  self->_cachedVisionInput = 0LL;

  locationManager = self->_locationManager;
  if (locationManager)
  {
    -[CLLocationManager stopUpdatingLocation](locationManager, "stopUpdatingLocation");
    -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
    v42 = self->_locationManager;
    self->_locationManager = 0LL;
  }

  gnssExtensionsManager = self->_gnssExtensionsManager;
  if (gnssExtensionsManager)
  {
    -[NIGnssExtensionsManager invalidate](gnssExtensionsManager, "invalidate");
    v44 = self->_gnssExtensionsManager;
    self->_gnssExtensionsManager = 0LL;
  }

- (void)_logSessionSummary
{
  p_sessionSummary = &self->_sessionSummary;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[A1|SES] Start"));

  if (v4) {
    objc_super v5 = @"[A1|SES] Start";
  }
  else {
    objc_super v5 = @"[A2|SES] Resum";
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_sessionSummary, "objectForKeyedSubscript:", v5));
  id v7 = v6;
  if (v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001C13F0;
    v19[3] = &unk_1007B5260;
    v19[4] = self;
    id v20 = v6;
    [&off_1007D27F0 enumerateKeysAndObjectsUsingBlock:v19];
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001C14DC;
  v18[3] = &unk_1007B2298;
  v18[4] = self;
  [&off_1007D21D8 enumerateObjectsUsingBlock:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001C15A0;
  v17[3] = &unk_1007B2298;
  v17[4] = self;
  [&off_1007D21F0 enumerateObjectsUsingBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001C1680;
  v16[3] = &unk_1007B2298;
  v16[4] = self;
  [&off_1007D2208 enumerateObjectsUsingBlock:v16];
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    findingToken = self->_findingToken;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Summary: %@",  self->_sessionSummary));
    id v11 = sub_100277A70((uint64_t)"SessionSummary", 1, findingToken, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543362;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_findingToken, "descriptionInternal"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v14,  self->_sessionSummary));
  [v13 logSessionSummary:v15];
}

- (void)_resetUpdatesEngine
{
  updatesEngine = self->_updatesEngine;
  if (updatesEngine)
  {
    -[NINearbyUpdatesEngine invalidate](updatesEngine, "invalidate");
    id v4 = self->_updatesEngine;
  }

  else
  {
    id v4 = 0LL;
  }

  self->_updatesEngine = 0LL;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0LL;

  -[NIServerFindingService _removeAlgorithmOutputFlagsFromPeerTrackingState:]( self,  "_removeAlgorithmOutputFlagsFromPeerTrackingState:",  255LL);
  uint64_t v6 = sub_100005150();
  BOOL v7 = sub_100320824(v6[144]);
  id v8 = objc_alloc(&OBJC_CLASS___NIServerAnalyticsManager);
  if (v7) {
    char v9 = @"com.apple.findmy";
  }
  else {
    char v9 = @"com.apple.NanoSettingsViewService";
  }
  id v10 = -[NIServerAnalyticsManager initWithBundleIdentifier:](v8, "initWithBundleIdentifier:", v9);
  id v11 = self->_analyticsManager;
  self->_analyticsManager = v10;

  uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSUUID);
  algorithmsIdentifier = self->_algorithmsIdentifier;
  self->_algorithmsIdentifier = v12;

  double v14 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
  configuration = self->_configuration;
  queue = self->_queue;
  id v17 = self->_analyticsManager;
  id v18 = sub_100288340();
  __int16 v19 = (std::__shared_weak_count *)v18[21];
  uint64_t v29 = v18[20];
  unsigned int v30 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
  }

  id v28 = 0LL;
  id v22 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v14,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  configuration,  queue,  self,  self,  v17,  &v29,  &v28);
  id v23 = v28;
  id v24 = self->_updatesEngine;
  self->_updatesEngine = v22;

  unsigned int v25 = v30;
  if (v30)
  {
    double v26 = (unint64_t *)&v30->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  if (v23 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_100398B28();
  }
}

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v8))
  {
    id v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BT: %d. PeerAdv: %@",  v5,  v9));
      id v13 = sub_100277A70((uint64_t)"DiscoveredPeer", 1, findingToken, v12);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }

    if (v5) {
      uint64_t v15 = 2LL;
    }
    else {
      uint64_t v15 = 1LL;
    }
    -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", v15);
    -[NIServerFindingService _tryToStartRangingWithPeerAdvertisement:]( self,  "_tryToStartRangingWithPeerAdvertisement:",  v9);
  }
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    BOOL v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100277A70((uint64_t)"LostPeer", 1, self->_findingToken, 0LL);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 4LL);
  }
}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    BOOL v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100277A70((uint64_t)"NotifyStopAdv", 1, v4, 0LL);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 2LL);
  }
}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v7))
  {
    int v8 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SelfAdv: %@",  v6));
      id v11 = sub_100277A70((uint64_t)"GeneratedAdv", 1, findingToken, v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543362;
      double v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 byteRepresentation]);
    double v14 = -[NINearbyObject initWithToken:]( objc_alloc(&OBJC_CLASS___NINearbyObject),  "initWithToken:",  self->_findingToken);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
    id v16 = 0LL;
    while (1)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 nextObject]);

      if (!v17) {
        break;
      }
      id v16 = v17;
      [v17 serviceDidGenerateShareableConfigurationData:v13 forObject:v14];
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServiceObserverRelay sharedInstance]( &OBJC_CLASS___NIServerFindingServiceObserverRelay,  "sharedInstance"));
    __int16 v19 = self->_findingToken;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001C1FEC;
    v22[3] = &unk_1007B5288;
    id v20 = v13;
    id v23 = v20;
    unint64_t v21 = v14;
    id v24 = v21;
    [v18 relayToObserversForToken:v19 blockToRelay:v22];
  }
}

- (void)bluetoothDiscoveryFinishedActivating
{
  char v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_100277A70((uint64_t)"DiscActivated", 1, 0LL, 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  char v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_100277A70((uint64_t)"DiscUnavailable", 1, 0LL, 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameAvailable
{
  char v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_100277A70((uint64_t)"DiscAvailable", 1, 0LL, 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v6))
  {
    int v8 = (int *)((char *)a4 + 32);
    int v7 = *((_DWORD *)a4 + 8);
    if ((v7 - 2) < 4 || v7 == 0)
    {
      id v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100398BF0(v8, (uint64_t)v6, v10);
      }
    }

    else
    {
      double v11 = 0.0;
      if (v7 == 1)
      {
        if (!*((_BYTE *)a4 + 600)) {
          __assert_rtn( "-[NIServerFindingService didRangeWithPeer:newSolution:]",  "NIServerFindingSession.mm",  1623,  "solution.raw_rose_measurement.has_value()");
        }
        double v11 = *((double *)a4 + 44);
      }

      if (*((_BYTE *)a4 + 24))
      {
        -[DetailsViewAnalytics updateWithMostRecentRawDistance:]( self->_detailsViewAnalytics,  "updateWithMostRecentRawDistance:",  v11);
        -[NIServerFindingService _logSuccessfulRange:](self, "_logSuccessfulRange:", v11);
        -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 3LL);
        self->_cachedSolutionMacAddr = *((void *)a4 + 5);
        sub_1001A3CF0(0x2B73040Cu, 0, 0LL, 0LL, 0LL, 0LL);
        -[NINearbyUpdatesEngine acceptRoseSolution:](self->_updatesEngine, "acceptRoseSolution:", a4);
      }

      else
      {
        sub_1001A3CF0(0x2B730410u, 0, 0LL, 0LL, 0LL, 0LL);
        uint64_t v12 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100398B88(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100398C74();
  }
}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v6))
  {
    if (!*((_BYTE *)a4 + 600)) {
      __assert_rtn( "-[NIServerFindingService didAttemptRangingWithPeer:unsuccessfulSolution:]",  "NIServerFindingSession.mm",  1661,  "solution.raw_rose_measurement.has_value()");
    }
    -[NIServerFindingService _logUnsuccessfulRange](self, "_logUnsuccessfulRange");
    if (*((_BYTE *)a4 + 600) && *((_WORD *)a4 + 72) == 96) {
      -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 2LL);
    }
    sub_1001A3CF0(0x2B730414u, 0, 0LL, 0LL, 0LL, 0LL);
    -[NINearbyUpdatesEngine acceptUnsuccessfulRoseSolution:]( self->_updatesEngine,  "acceptUnsuccessfulRoseSolution:",  a4);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100398CA0();
  }
}

- (void)_logSuccessfulRange:(double)a3
{
  double v5 = sub_100023CC4();
  findingToken = self->_findingToken;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Range: %0.2f m",  *(void *)&a3));
  id v8 = sub_100277A70((uint64_t)"RangeSuccess", 1, findingToken, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (os_log_s *)qword_1008000A0;
  if (v5 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_100398CCC();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }

    self->_lastLogMachContTime = v5;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[E1|RNG] Good "));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v11 unsignedIntegerValue] + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v12,  @"[E1|RNG] Good ");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[E3|RNG] First"));
  LODWORD(v11) = v13 == 0LL;

  if ((_DWORD)v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v14,  @"[E3|RNG] First");

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v15,  @"[E5|RNG] Max  ");

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v16,  @"[E6|RNG] Min  ");
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v17,  @"[E4|RNG] Last ");

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[E5|RNG] Max  "));
  [v18 doubleValue];
  BOOL v20 = v19 < a3;

  if (v20)
  {
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v21,  @"[E5|RNG] Max  ");
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[E6|RNG] Min  "));
  [v22 doubleValue];
  BOOL v24 = v23 > a3;

  if (v24)
  {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v25,  @"[E6|RNG] Min  ");
  }
}

- (void)_logUnsuccessfulRange
{
  char v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = sub_100277A70((uint64_t)"RangeFailure", 1, self->_findingToken, 0LL);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    sub_100398D2C(v5, v8, v3);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionSummary,  "objectForKeyedSubscript:",  @"[E2|RNG] Miss "));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v6 unsignedIntegerValue] + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionSummary,  "setObject:forKeyedSubscript:",  v7,  @"[E2|RNG] Miss ");
}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"NotifyStopRange", 1, v4, 0LL);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindingService _handleRangingTerminatedCallbackForPeer:]( self,  "_handleRangingTerminatedCallbackForPeer:",  v4);
}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"NotifyAuthFail", 1, v4, 0LL);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindingService _handleRangingTerminatedCallbackForPeer:]( self,  "_handleRangingTerminatedCallbackForPeer:",  v4);
}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v4))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 doubleForKey:@"FindingServiceRangingTriggerTimeLimitOverrideSeconds"];
    double v7 = v6;

    if (v7 <= 0.0) {
      double v7 = 1200.0;
    }
    double v8 = sub_100023CC4() - self->_serviceStartTimeSeconds;
    if (v8 > v7)
    {
      id v9 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218240;
        double v14 = v8;
        __int16 v15 = 2048;
        double v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Ranging terminated and too much time elapsed (%0.1f s > %0.1f s), stop ranging triggers",  (uint8_t *)&v13,  0x16u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:]( self->_discoveryProvider,  "setPeersEligibleForDiscovery:requestScan:",  0LL,  0LL));
      if (v10 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100398E3C();
      }
      -[NIServerFindingService _updatePeerTrackingDiscoveryState:](self, "_updatePeerTrackingDiscoveryState:", 4LL);
      double v11 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]( self->_discoveryProvider,  "stopAdvertisingToPeer:",  v4));
      if (v11 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100398DDC();
      }
      -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 2LL);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider stopRangingWithPeer:]( self->_rangingProvider,  "stopRangingWithPeer:",  v4));
    if (v12 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100398D7C();
    }
    -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 4LL);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100398E9C();
  }
}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  updatesEngine = self->_updatesEngine;
  if (updatesEngine) {
    -[NINearbyUpdatesEngine acceptPeerDeviceType:](updatesEngine, "acceptPeerDeviceType:", *((unsigned __int8 *)a5 + 8));
  }
}

- (void)_updatePeerTrackingDiscoveryState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  [v5 setDiscoveryState:v3];
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_updatePeerTrackingAdvertisingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  [v5 setAdvertisingState:v3];
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_updatePeerTrackingRangingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  [v5 setRangingState:v3];
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_updatePeerTrackingClientWantsUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  [v5 setClientWantsUpdates:v3];
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_addAlgorithmOutputFlagsToPeerTrackingState:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setAlgorithmOutputFlags:", objc_msgSend(v5, "algorithmOutputFlags") | v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_removeAlgorithmOutputFlagsFromPeerTrackingState:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  objc_msgSend(v5, "setAlgorithmOutputFlags:", objc_msgSend(v5, "algorithmOutputFlags") & ~v3);
  -[NIServerFindingService _updatePeerTrackingOverallState:](self, "_updatePeerTrackingOverallState:", v5);
}

- (void)_updatePeerTrackingOverallState:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 copy];
  id v6 = -[NIServerFindingPeerTracking copy](self->_peerTracking, "copy");
  double v7 = v6;
  if (!v6 || !v5) {
    goto LABEL_89;
  }
  if ([v6 rangingState] == 3
    && ([v5 rangingState] == 1 || objc_msgSend(v5, "rangingState") == 2))
  {
    objc_msgSend(v5, "setRangingState:", objc_msgSend(v7, "rangingState"));
  }

  if (![v7 discoveryState] && objc_msgSend(v5, "discoveryState"))
  {
    if ([v5 discoveryState] == 2)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      uint64_t v8 = 3LL;
    }

    -[NIServerAnalyticsManager updateWithAcquisitionReason:]( self->_analyticsManager,  "updateWithAcquisitionReason:",  v8);
  }

- (BOOL)_sessionConfiguredToRange
{
  return 1;
}

- (void)_startOrUpdateAdvertising
{
  int v3 = objc_alloc(&OBJC_CLASS___NIServerFindingAdvertisement);
  uint64_t v4 = (uint64_t)-[NIServerFindingDiscoveryProvider advertisingAddress](self->_discoveryProvider, "advertisingAddress");
  LODWORD(v16) = v4;
  WORD2(v16) = WORD2(v4);
  id v5 = -[NIServerFindingAdvertisement initForFinder:address:](v3, "initForFinder:address:", 1LL, &v16);
  objc_msgSend( v5,  "setCanRange:",  -[NIServerFindingService _sessionConfiguredToRange](self, "_sessionConfiguredToRange"));
  objc_msgSend(v5, "setUseCase:", -[NIServerFindingService _useCase](self, "_useCase"));
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  }

  else
  {
    __p = 0LL;
    id v20 = 0LL;
    uint64_t v21 = 0LL;
  }

  [v5 setSupportedTechnologies:&__p];
  if (__p)
  {
    id v20 = __p;
    operator delete(__p);
  }

  [v5 setProtocolVersion:1];
  double v7 = sub_100288340();
  uint64_t v8 = *((void *)v7 + 406);
  BOOL v9 = (std::__shared_weak_count *)*((void *)v7 + 407);
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }

  sub_100267408(v8);
  uint64_t v12 = sub_10032B934((unsigned __int8 **)v18);
  objc_msgSend(v5, "setNarrowBandMask:", v12, v16, v17);
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  if (v9)
  {
    id v13 = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  -[NIServerFindingService _updatePeerTrackingAdvertisingState:](self, "_updatePeerTrackingAdvertisingState:", 1LL);
  id v15 =  -[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:]( self->_discoveryProvider,  "startAdvertisingToPeer:advertisement:timeout:",  self->_findingToken,  v5,  0.0);
}

- (void)_tryToStartRangingWithPeerAdvertisement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedTechnology];
  unsigned int v6 = [v4 canRange];
  unsigned int v7 = -[NIServerFindingService _sessionConfiguredToRange](self, "_sessionConfiguredToRange");
  unsigned int v8 = -[NIServerFindingRangingProvider canRangeWithPeer:technology:]( self->_rangingProvider,  "canRangeWithPeer:technology:",  self->_findingToken,  v5);
  rangingProvider = self->_rangingProvider;
  if (rangingProvider) {
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  BOOL v10 = sub_100278484(__p, (int)v5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if ((v6 & v7 & v10 & v8 & 1) != 0)
  {
    -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 1LL);
    if ([v4 narrowBandMask])
    {
      unsigned int v11 = [v4 narrowBandMask];
    }

    else
    {
      unint64_t v14 = operator new(1uLL);
      double v23 = v14;
      *unint64_t v14 = 1;
      BOOL v24 = v14 + 1;
      unsigned int v25 = v14 + 1;
      unsigned int v11 = sub_10032B934((unsigned __int8 **)&v23);
      if (v23)
      {
        BOOL v24 = v23;
        operator delete(v23);
      }
    }

    id v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__p[0]) = 67109120;
      HIDWORD(__p[0]) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Negotiated nb_mask %hu",  (uint8_t *)__p,  8u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 nbUwbAcquisitionChannelIdx]);
    v22[0] = [v16 intValue];
    v22[1] = v11;

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:]( self->_rangingProvider,  "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:",  self->_findingToken,  v5,  v4,  v22));
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100398EC8();
      }
      -[NIServerFindingService _updatePeerTrackingRangingState:](self, "_updatePeerTrackingRangingState:", 4LL);
    }

    else
    {
      if ((id)-[NIFindingConfiguration preferredUpdateRate](self->_configuration, "preferredUpdateRate") == (id)3)
      {
        uint64_t v18 = sub_100005150();
        BOOL v19 = sub_100320824(v18[144]);
        id v20 = self->_rangingProvider;
        __p[0] = (void *)0x100000000000000LL;
      }

      else
      {
        uint64_t v21 = sub_100005150();
        BOOL v19 = sub_100320824(v21[144]);
        id v20 = self->_rangingProvider;
        __p[0] = (void *)0x101000000000000LL;
      }

      LOBYTE(__p[1]) = v19;
      -[NIServerFindingRangingProvider setSignallingData:forPeer:]( v20,  "setSignallingData:forPeer:",  __p,  self->_findingToken);
    }
  }

  else
  {
    uint64_t v12 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = sub_100278458((int)v5);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v13;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v6;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v7;
      __int16 v27 = 1024;
      unsigned int v28 = v8;
      __int16 v29 = 1024;
      BOOL v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Not attempting to range (selectedTech: %s). peerDeviceCanRange: %d. sessionConfiguredToRange: %d. loca lDeviceCanRange: %d. localDeviceSupportsTech: %d.",  (uint8_t *)__p,  0x24u);
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v12 = (NINearbyUpdatesEngine *)a3;
  id v6 = a4;
  if (self->_updatesEngine != v12) {
    __assert_rtn( "-[NIServerFindingService updatesEngine:didUpdateNearbyObjects:]",  "NIServerFindingSession.mm",  2085,  "engine == _updatesEngine");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001C4380;
  v13[3] = &unk_1007B52B0;
  v13[4] = self;
  [v6 enumerateObjectsUsingBlock:v13];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v8 = [v7 BOOLForKey:@"FindingGateObjectUpdatesOnDiscovery"];

  if (!v8
    || -[NIServerFindingPeerTracking discoveryState](self->_peerTracking, "discoveryState") == 2
    || -[NIServerFindingPeerTracking discoveryState](self->_peerTracking, "discoveryState") == 3)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
    BOOL v10 = 0LL;
    while (1)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 nextObject]);

      if (!v11) {
        break;
      }
      BOOL v10 = v11;
      [v11 serviceDidUpdateNearbyObjects:v6];
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  id v13 = (NINearbyUpdatesEngine *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_updatesEngine != v13) {
    __assert_rtn( "-[NIServerFindingService updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]",  "NIServerFindingSession.mm",  2116,  "engine == _updatesEngine");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_findingClients, "objectEnumerator"));
  unsigned int v11 = 0LL;
  while (1)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 nextObject]);

    if (!v12) {
      break;
    }
    unsigned int v11 = v12;
    [v12 serviceDidUpdateAlgorithmConvergenceState:v8 forObject:v9];
  }
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_findingToken;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t cachedSolutionMacAddr = self->_cachedSolutionMacAddr;
  BOOL v4 = 1LL;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)cachedSolutionMacAddr;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  if (self->_findingToken) {
    int v3 = -[NINearbyObject initWithToken:]( objc_alloc(&OBJC_CLASS___NINearbyObject),  "initWithToken:",  self->_findingToken);
  }
  else {
    int v3 = 0LL;
  }
  return v3;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v3 = v1;
  id v8 = v2;
  id v5 = *(void **)(v3 + 24);
  if (!v5) {
    __assert_rtn( "-[NIServerFindingService uniqueIdentifierForEngine:]",  "NIServerFindingSession.mm",  2145,  "_algorithmsIdentifier != nil");
  }
  id v6 = objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  sub_1000065CC(retstr, (char *)[v6 UTF8String]);

  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    unsigned int v7 = (os_log_s *)qword_1008000A0;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_100398F60();
      }
      [v6 coordinate];
      uint64_t v31 = v8;
      [v6 coordinate];
      uint64_t v30 = v9;
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
      [v10 timeIntervalSinceReferenceDate];
      uint64_t v29 = v11;
      [v6 course];
      uint64_t v13 = v12;
      [v6 courseAccuracy];
      uint64_t v15 = v14;
      [v6 speed];
      uint64_t v17 = v16;
      [v6 speedAccuracy];
      uint64_t v19 = v18;
      [v6 horizontalAccuracy];
      uint64_t v21 = v20;
      [v6 verticalAccuracy];
      uint64_t v23 = v22;
      [v6 altitude];
      uint64_t v25 = v24;
      [v6 ellipsoidalAltitude];
      uint64_t v27 = v26;
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v6 floor]);
      *(void *)buf = v31;
      uint64_t v33 = v30;
      uint64_t v34 = v29;
      uint64_t v35 = v13;
      uint64_t v36 = v15;
      uint64_t v37 = v17;
      uint64_t v38 = v19;
      uint64_t v39 = v21;
      uint64_t v40 = v23;
      uint64_t v41 = v25;
      uint64_t v42 = v27;
      unsigned int v43 = [v28 level];
      unsigned int v44 = [v6 type];
      unsigned int v45 = [v6 signalEnvironmentType];

      -[NINearbyUpdatesEngine acceptSelfLocationData:](self->_updatesEngine, "acceptSelfLocationData:", buf);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-ses,current location not updated",  buf,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
  {
    sub_100398F28();
  }
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
  {
    sub_100398FEC();
    if (v5) {
      goto LABEL_3;
    }
  }

  else if (v5)
  {
LABEL_3:
    [v5 magneticHeading];
    uint64_t v7 = v6;
    [v5 trueHeading];
    uint64_t v9 = v8;
    [v5 headingAccuracy];
    uint64_t v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
    [v12 timeIntervalSinceReferenceDate];
    v14[0] = v7;
    v14[1] = v9;
    v14[2] = v11;
    v14[3] = v13;

    -[NINearbyUpdatesEngine acceptHeadingData:](self->_updatesEngine, "acceptHeadingData:", v14);
    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100398FC0();
  }
LABEL_7:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [v5 code];
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_1003990D8();
      }
    }

    else if (v6 == (id)3)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003990AC();
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10039904C();
      }
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
      -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
      -[CLLocationManager startUpdatingHeading](self->_locationManager, "startUpdatingHeading");
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,location is unknown", v8, 2u);
    }
  }
}

- (void)DataCallback:(id)a3
{
  updatesEngine = self->_updatesEngine;
  +[NIGnssExtensionsManager getGnssSatelliteDataVecFromDict:]( &OBJC_CLASS___NIGnssExtensionsManager,  "getGnssSatelliteDataVecFromDict:",  a3);
  -[NINearbyUpdatesEngine acceptGnssSatelliteData:](updatesEngine, "acceptGnssSatelliteData:", __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end