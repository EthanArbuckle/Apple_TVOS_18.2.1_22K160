@interface MRDMediaServerAVRoutingDataSource
- (BOOL)currentRouteSupportsVolumeControl;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDMediaServerAVRoutingDataSource)init;
- (id)_descriptionForDiscoveryMode:(unsigned int)a3;
- (id)_mediaServerController;
- (id)_oddsShimDataSource;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoute;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoutes;
- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)externalScreenType;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_externalScreenDidChangeNotification:(id)a3;
- (void)_notifyDelegateRoutesDidChange;
- (void)_portStatusDidChangeNotification:(id)a3;
- (void)_registerAVSystemControllerNotifications;
- (void)_unregisterAVSystemControllerNotifications;
- (void)dealloc;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)userCancelledPickingRoute:(id)a3;
@end

@implementation MRDMediaServerAVRoutingDataSource

- (MRDMediaServerAVRoutingDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRDMediaServerAVRoutingDataSource;
  v2 = -[MRDAVRoutingDataSource init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v4 = off_1003F6708();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 addObserver:v2 selector:"_avSessionMediaServicesResetNotification:" name:v5 object:0];

    -[MRDMediaServerAVRoutingDataSource _registerAVSystemControllerNotifications]( v2,  "_registerAVSystemControllerNotifications");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDMediaServerAVRoutingDataSource;
  -[MRDMediaServerAVRoutingDataSource dealloc](&v4, "dealloc");
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDMediaServerAVRoutingDataSource;
  -[MRDAVRoutingDataSource setDiscoveryMode:](&v6, "setDiscoveryMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _oddsShimDataSource](self, "_oddsShimDataSource"));
  [v5 setDiscoveryMode:v3];
}

- (unsigned)externalScreenType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_CurrentExternalScreenAttribute]);

  id v4 = v3;
  if ([v4 isEqualToString:AVSystemController_ExternalScreenType_AirPlay])
  {
    unsigned int v5 = 1;
  }

  else if ([v4 isEqualToString:AVSystemController_ExternalScreenType_TVOut])
  {
    unsigned int v5 = 2;
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (BOOL)currentRouteSupportsVolumeControl
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
  unsigned __int8 v3 = [v2 currentRouteHasVolumeControl];

  return v3;
}

- (id)pickedRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource pickedRoutes](self, "pickedRoutes"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

- (id)pickedRoutes
{
  return -[MRDMediaServerAVRoutingDataSource pickedRoutesForCategory:source:]( self,  "pickedRoutesForCategory:source:",  @"MRDAVRoutingCategoryMedia",  0LL);
}

- (id)pickedRouteForCategory:(id)a3
{
  return -[MRDMediaServerAVRoutingDataSource pickedRouteForCategory:source:]( self,  "pickedRouteForCategory:source:",  a3,  0LL);
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerAVRoutingDataSource pickedRoutesForCategory:source:]( self,  "pickedRoutesForCategory:source:",  a3,  *(void *)&a4));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v5;
}

- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_super v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerAVRoutingDataSource pickableRoutesForCategory:source:]( self,  "pickableRoutesForCategory:source:",  v6,  v4));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return -[MRDMediaServerAVRoutingDataSource pickableRoutesForCategory:source:]( self,  "pickableRoutesForCategory:source:",  a3,  0LL);
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  id v5 = a3;
  v23 = v5;
  if (v5)
  {
    id v6 = v5;
    if ([v5 isEqualToString:@"MRDAVRoutingCategoryMedia"])
    {
      objc_super v7 = @"Audio/Video";
    }

    else if ([v6 isEqualToString:@"MRDAVRoutingCategorySystem"])
    {
      objc_super v7 = @"Default";
    }

    else
    {
      objc_super v7 = v6;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 pickableRoutesForCategory:v7]);
  }

  else
  {
    objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString attributeForKey:](v7, "attributeForKey:", AVSystemController_PickableRoutesAttribute));
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = sub_10013D44C();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uppercaseString]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v8;
  id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    uint64_t v24 = kMRMediaRemoteRouteIsLocalDeviceRouteKey;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKeyPath:@"AirPlayPortExtendedInfo.deviceID"]);
        if ([v19 isEqualToString:v13])
        {
          id v20 = [v18 mutableCopy];
          [v20 setObject:&__kCFBooleanTrue forKey:v24];

          id v18 = v20;
        }

        v21 = -[MRDMediaServerAVRoute initWithDictionary:]( objc_alloc(&OBJC_CLASS___MRDMediaServerAVRoute),  "initWithDictionary:",  v18);
        -[NSMutableArray addObject:](v10, "addObject:", v21);
      }

      id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  return v10;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return -[MRDMediaServerAVRoutingDataSource setPickedRoute:withPassword:forSource:]( self,  "setPickedRoute:withPassword:forSource:",  a3,  a4,  0LL);
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _oddsShimDataSource](self, "_oddsShimDataSource"));
  unsigned int v11 = [v10 setPickedSystemRoute:v8 withPassword:v9 forSource:v5];

  uint64_t v13 = _MRLogForCategory(0LL, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      int v19 = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = 0LL;
      __int128 v17 = "Successfully picked route named %@. (error = %@)";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0x16u);
    }
  }

  else if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    int v19 = 138412546;
    id v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = 0LL;
    __int128 v17 = "Failed to pick route named %@. (error = %@)";
    goto LABEL_6;
  }

  return v11;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MRDMediaServerAVRoutingDataSource pickableRoutesForCategory:]( self,  "pickableRoutesForCategory:",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v16 = self;
    unsigned int v17 = a3;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type", v16));
        if ([v11 isEqualToString:@"AVAudioRoute_Speaker"])
        {

LABEL_13:
          unsigned __int8 v14 = -[MRDMediaServerAVRoutingDataSource setPickedRoute:withPassword:forSource:]( v16,  "setPickedRoute:withPassword:forSource:",  v10,  0LL,  v17);
          goto LABEL_14;
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
        unsigned int v13 = [v12 isEqualToString:@"AVAudioRoute_Headphone"];

        if (v13) {
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      unsigned __int8 v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return -[MRDMediaServerAVRoutingDataSource resetPickedRouteForSource:]( self,  "resetPickedRouteForSource:",  *(void *)&a3);
}

- (void)userCancelledPickingRoute:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
  if ((objc_opt_respondsToSelector(v4, "didCancelRoutePicking:") & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionary]);
    [v4 didCancelRoutePicking:v5];
  }
}

- (BOOL)unpickAirPlayRoutes
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoutingDataSource _mediaServerController](self, "_mediaServerController"));
  id v10 = 0LL;
  unsigned __int8 v4 = [v3 setAttribute:&__kCFBooleanTrue forKey:AVSystemController_RouteAwayFromAirPlayAttribute error:&v10];
  id v5 = v10;

  if ((v4 & 1) != 0)
  {
    -[MRDMediaServerAVRoutingDataSource _notifyDelegateRoutesDidChange](self, "_notifyDelegateRoutesDidChange");
  }

  else
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002B7798((uint64_t)v5, v8);
    }
  }

  return v4;
}

- (void)_externalScreenDidChangeNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 postNotificationName:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self];
}

- (void)_portStatusDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AVSystemController_RouteDescriptionKey_PortStatusChangeReason]);
  int v6 = [v5 intValue];

  uint64_t v8 = 0LL;
  if (v6 <= 200469)
  {
    if (v6 <= 200400)
    {
      if (v6 == -71891)
      {
        uint64_t v8 = 4LL;
        goto LABEL_23;
      }

      if (!v6) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }

    if (v6 != 200401)
    {
      if (v6 == 200453) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  uint64_t v4 = _MRLogForCategory(0LL, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MediaServerAVRoutingDataSource] AVAudioSessionMediaServicesWereReset notification received -- re-registering noti fications and resetting cache",  v7,  2u);
  }

  -[MRDMediaServerAVRoutingDataSource _unregisterAVSystemControllerNotifications]( self,  "_unregisterAVSystemControllerNotifications");
  -[MRDMediaServerAVRoutingDataSource _registerAVSystemControllerNotifications]( self,  "_registerAVSystemControllerNotifications");
  -[MRDMediaServerAVRoutingDataSource setDiscoveryMode:]( self,  "setDiscoveryMode:",  -[MRDAVRoutingDataSource discoveryMode](self, "discoveryMode"));
  -[MRDMediaServerAVRoutingDataSource _notifyDelegateRoutesDidChange](self, "_notifyDelegateRoutesDidChange");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self];
}

- (id)_mediaServerController
{
  return +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
}

- (void)_registerAVSystemControllerNotifications
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  id v4 = off_1003F6708();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v16 = v5;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v3 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  if (AVSystemController_ExternalScreenDidChangeNotification)
  {
    uint64_t v15 = AVSystemController_ExternalScreenDidChangeNotification;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    [v3 setAttribute:v7 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:self selector:"_externalScreenDidChangeNotification:" name:AVSystemController_ExternalScreenDidChangeNotification object:v3];
  }

  if (AVSystemController_PickableRoutesDidChangeNotification)
  {
    uint64_t v14 = AVSystemController_PickableRoutesDidChangeNotification;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v3 setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"_pickableRoutesDidChangeNotification:" name:AVSystemController_PickableRoutesDidChangeNotification object:v3];
  }

  if (AVSystemController_PortStatusDidChangeNotification)
  {
    uint64_t v13 = AVSystemController_PortStatusDidChangeNotification;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v3 setAttribute:v11 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_portStatusDidChangeNotification:" name:AVSystemController_PortStatusDidChangeNotification object:v3];
  }
}

- (void)_unregisterAVSystemControllerNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_ExternalScreenDidChangeNotification object:0];
  [v3 removeObserver:self name:AVSystemController_PickableRoutesDidChangeNotification object:0];
  [v3 removeObserver:self name:AVSystemController_PortStatusDidChangeNotification object:0];
}

- (id)_descriptionForDiscoveryMode:(unsigned int)a3
{
  return (id)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(void *)&a3, a2);
}

- (void)_notifyDelegateRoutesDidChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:self];
}

- (id)_oddsShimDataSource
{
  oddsShimDataSource = self->_oddsShimDataSource;
  if (!oddsShimDataSource)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MRDOutputDeviceRoutingDataSource);
    id v5 = self->_oddsShimDataSource;
    self->_oddsShimDataSource = v4;

    oddsShimDataSource = self->_oddsShimDataSource;
  }

  return oddsShimDataSource;
}

- (void).cxx_destruct
{
}

@end