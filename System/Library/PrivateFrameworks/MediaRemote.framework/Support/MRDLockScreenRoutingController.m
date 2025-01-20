@interface MRDLockScreenRoutingController
- (BOOL)hasTriggered;
- (BOOL)shouldRun;
- (HMHomeManager)homeManager;
- (MRAVEndpoint)ase;
- (MRDDisplayMonitor)displayMonitor;
- (MRDLockScreenRoutingController)init;
- (MRDLockScreenRoutingControllerDataSource)dataSource;
- (MRDLockScreenRoutingProvider)provider;
- (MRLockScreenUIControllable)uiController;
- (MRRateLimiter)debouncer;
- (NSSet)currentHomeUserIdentifiers;
- (OS_dispatch_queue)queue;
- (id)_createProvider;
- (id)_nowPlayingControllerConfigurationForUID:(id)a3 topologyIdentifier:(id)a4;
- (id)nearbyDevicesIdentifiers;
- (void)_externalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_onQueue_immediatelyReevaluateRemoteControlState;
- (void)_onQueue_reevaluateRemoteControlState;
- (void)_updateRecommendedEndpointWithOutputDeviceUID:(id)a3 reason:(id)a4;
- (void)devicesUpdated;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)routeRecommendationDismissed;
- (void)setAse:(id)a3;
- (void)setCurrentHomeUserIdentifiers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setHasTriggered:(BOOL)a3;
- (void)setHomeManager:(id)a3;
- (void)setProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setUiController:(id)a3;
- (void)startObservationIfNeeded;
@end

@implementation MRDLockScreenRoutingController

- (MRDLockScreenRoutingController)init
{
  return 0LL;
}

- (void)startObservationIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController provider](self, "provider"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController _createProvider](self, "_createProvider"));
    -[MRDLockScreenRoutingController setProvider:](self, "setProvider:", v4);
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController provider](self, "provider"));
  [v5 startObservationIfNeeded];
}

- (BOOL)shouldRun
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController displayMonitor](self, "displayMonitor"));
  if ([v3 lockScreenVisible])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController displayMonitor](self, "displayMonitor"));
    unsigned int v5 = [v4 controlCenterVisible] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)nearbyDevicesIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController provider](self, "provider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nearbyDeviceIdentifiers]);

  uint64_t v6 = _MRLogForCategory(7LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ProximityController] >>+ MRDLockScreenRoutingController.nearbyDevicesIdentifiers: %@",  buf,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v9 = [v8 supportManyRecommendationsPlatters];

  if (v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100040C3C;
    v17[3] = &unk_10039B1C0;
    v18 = @"LOCAL";
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", v17));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController ase](self, "ase"));
    if ([v11 isLocalEndpoint])
    {
      v12 = &__NSArray0__struct;
    }

    else
    {
      v19 = @"LOCAL";
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v10]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100040C5C;
    v16[3] = &unk_10039B1C0;
    v16[4] = self;
    id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_filter:", v16));
  }

  else
  {
    id v13 = v4;
  }

  return v13;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 homes]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_compactMap:", &stru_10039B200));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  obj = self;
  objc_sync_enter(obj);
  currentHomeUserIdentifiers = obj->_currentHomeUserIdentifiers;
  obj->_currentHomeUserIdentifiers = (NSSet *)v6;

  objc_sync_exit(obj);
}

- (NSSet)currentHomeUserIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_homeManager)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

    uint64_t v6 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDLockScreenRoutingController.HMHomeManager",  v5);
    uint64_t v8 = _MRLogForCategory(10LL, v7);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = (const __CFString *)v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v10 = -[HMHomeManager initWithOptions:](objc_alloc(&OBJC_CLASS___HMHomeManager), "initWithOptions:", 1LL);
    homeManager = v2->_homeManager;
    v2->_homeManager = v10;

    -[HMHomeManager setDelegate:](v2->_homeManager, "setDelegate:", v2);
    uint64_t v13 = _MRLogForCategory(10LL, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v15 timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 138543874;
      v37 = @"MRDLockScreenRoutingController.HMHomeManager";
      __int16 v38 = 2114;
      v39 = v5;
      __int16 v40 = 2048;
      uint64_t v41 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    }
  }

  currentHomeUserIdentifiers = v2->_currentHomeUserIdentifiers;
  if (!currentHomeUserIdentifiers)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);

    v21 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDLockScreenRoutingController.HMHomeManager.currentHomeUserIdentifiers",  v20);
    uint64_t v23 = _MRLogForCategory(10LL, v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = (const __CFString *)v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](v2->_homeManager, "homes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "msv_compactMap:", &stru_10039B220));
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v26));
    v28 = v2->_currentHomeUserIdentifiers;
    v2->_currentHomeUserIdentifiers = (NSSet *)v27;

    uint64_t v30 = _MRLogForCategory(10LL, v29);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v32 timeIntervalSinceDate:v18];
      *(_DWORD *)buf = 138543874;
      v37 = @"MRDLockScreenRoutingController.HMHomeManager.currentHomeUserIdentifiers";
      __int16 v38 = 2114;
      v39 = v20;
      __int16 v40 = 2048;
      uint64_t v41 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    }

    currentHomeUserIdentifiers = v2->_currentHomeUserIdentifiers;
  }

  v34 = currentHomeUserIdentifiers;
  objc_sync_exit(v2);

  return v34;
}

- (id)_createProvider
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v4 = [v3 sourceRecommendationsPlattersFromIR];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 routingServer]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recommendationController]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recommender]);
    if (v8)
    {
      unsigned int v9 = objc_alloc(&OBJC_CLASS___MRDIntelligentRoutingLockScreenRoutingProvider);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
      v11 = -[MRDIntelligentRoutingLockScreenRoutingProvider initWithDelegate:queue:routeRecommender:routeRecommendationStore:]( v9,  "initWithDelegate:queue:routeRecommender:routeRecommendationStore:",  self,  v10,  v8,  v7);
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___MRDProximityLockScreenRoutingProvider);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
    v11 = -[MRDProximityLockScreenRoutingProvider initWithDispatchQueue:](v12, "initWithDispatchQueue:", v13);

    -[MRDIntelligentRoutingLockScreenRoutingProvider setDelegate:](v11, "setDelegate:", self);
  }

  return v11;
}

- (void)_onQueue_reevaluateRemoteControlState
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController debouncer](self, "debouncer"));
  [v2 update];
}

- (void)_onQueue_immediatelyReevaluateRemoteControlState
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController nearbyDevicesIdentifiers](self, "nearbyDevicesIdentifiers"));
  if (-[MRDLockScreenRoutingController shouldRun](self, "shouldRun")
    && !-[MRDLockScreenRoutingController hasTriggered](self, "hasTriggered")
    && [v4 count])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v6 = [v5 supportManyRecommendationsPlatters];

    if ((v6 & 1) != 0
      || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController dataSource](self, "dataSource")),
          unsigned int v8 = [v7 lockScreenPlatterActive],
          v7,
          !v8))
    {
      v11 = dispatch_group_create();
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      v25 = v4;
      id obj = v4;
      id v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v40;
        do
        {
          v15 = 0LL;
          do
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v15);
            dispatch_group_enter(v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsSeparatedByString:@"|"]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
            v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDLockScreenRoutingController _nowPlayingControllerConfigurationForUID:topologyIdentifier:]( self,  "_nowPlayingControllerConfigurationForUID:topologyIdentifier:",  v18,  v16));
            v20 = -[MRNowPlayingController initWithConfiguration:]( objc_alloc(&OBJC_CLASS___MRNowPlayingController),  "initWithConfiguration:",  v19);
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472LL;
            v32[2] = sub_1000416B4;
            v32[3] = &unk_10039B288;
            uint64_t v33 = v11;
            id v34 = v17;
            v35 = v16;
            v36 = v27;
            v37 = self;
            id v38 = v18;
            id v21 = v18;
            id v22 = v17;
            -[MRNowPlayingController performRequestWithCompletion:](v20, "performRequestWithCompletion:", v32);

            v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }

        while (v13);
      }

      uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100041970;
      block[3] = &unk_100398F40;
      id v29 = obj;
      uint64_t v30 = v27;
      v31 = self;
      v24 = v27;
      dispatch_group_notify(v11, v23, block);

      unsigned int v4 = v25;
    }

    else
    {
      uint64_t v10 = _MRLogForCategory(7LL, v9);
      v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "[ProximityController] Maintaining proactive device because lock screen platter is active.",  buf,  2u);
      }
    }
  }
}

- (void)_updateRecommendedEndpointWithOutputDeviceUID:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(7LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[ProximityController] Updating recommended endpoint to device %@ because %@",  (uint8_t *)&v13,  0x16u);
  }

  -[MRDLockScreenRoutingController setHasTriggered:](self, "setHasTriggered:", 1LL);
  id v11 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v6 type:2 reason:v7];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
  [v11 perform:v12 completion:0];
}

- (id)_nowPlayingControllerConfigurationForUID:(id)a3 topologyIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MRDestination alloc] initWithOutputDeviceUID:v6];
  id v8 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v7];
  [v8 setRequestPlaybackState:1];
  [v8 setRequestPlaybackQueue:0];
  [v8 setRequestClientProperties:0];
  [v8 setRequestSupportedCommands:0];
  [v8 setRequestLastPlayingDate:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ProximityController(%@<%@>)",  v6,  v5));

  [v8 setLabel:v9];
  return v8;
}

- (void)devicesUpdated
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[MRDLockScreenRoutingController _onQueue_reevaluateRemoteControlState](self, "_onQueue_reevaluateRemoteControlState");
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100041D08;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_externalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 sourceRecommendationsPlattersFromIR];

  if (v7)
  {
    -[MRDLockScreenRoutingController startObservationIfNeeded](self, "startObservationIfNeeded");
  }

  else
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100041ED8;
    v9[3] = &unk_100398E60;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (MRLockScreenUIControllable)uiController
{
  uiController = self->_uiController;
  if (!uiController)
  {
    unsigned int v4 = (MRLockScreenUIControllable *)objc_claimAutoreleasedReturnValue( +[MRDUIControllerProvider lockScreenUIControllerWithDelegate:]( &OBJC_CLASS___MRDUIControllerProvider,  "lockScreenUIControllerWithDelegate:",  self));
    id v5 = self->_uiController;
    self->_uiController = v4;

    uiController = self->_uiController;
  }

  return uiController;
}

- (void)routeRecommendationDismissed
{
  uint64_t v2 = _MRLogForCategory(7LL, a2);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[ProximityController] routeRecommendationDismissed",  v4,  2u);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
  unsigned int v6 = [v5 intValue];

  if (!v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v8 = [v7 sourceRecommendationsPlattersFromIR];

    if (v8) {
      -[MRDLockScreenRoutingController startObservationIfNeeded](self, "startObservationIfNeeded");
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDLockScreenRoutingController queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100042088;
    v10[3] = &unk_10039B2B0;
    v10[4] = self;
    MRAVEndpointResolveActiveSystemEndpointWithType(0LL, v9, v10, 7.0);
  }

- (MRDLockScreenRoutingControllerDataSource)dataSource
{
  return (MRDLockScreenRoutingControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (MRDLockScreenRoutingProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasTriggered
{
  return self->_hasTriggered;
}

- (void)setHasTriggered:(BOOL)a3
{
  self->_hasTriggered = a3;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (void)setCurrentHomeUserIdentifiers:(id)a3
{
}

- (MRRateLimiter)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void)setUiController:(id)a3
{
}

- (MRAVEndpoint)ase
{
  return self->_ase;
}

- (void)setAse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end