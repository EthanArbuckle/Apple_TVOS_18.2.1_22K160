@interface MRDOutputDeviceRoutingDataSource
- (BOOL)currentRouteSupportsVolumeControl;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDOutputDeviceRoutingDataSource)init;
- (id)_activeSystemContext;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoute;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)discoveryMode;
- (unsigned)externalScreenType;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDOutputDeviceRoutingDataSource

- (MRDOutputDeviceRoutingDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDOutputDeviceRoutingDataSource;
  v2 = -[MRDAVRoutingDataSource init](&v8, "init");
  if (v2)
  {
    v3 = (AVOutputDeviceDiscoverySession *)[objc_alloc(off_1003F5B90()) initWithDeviceFeatures:1];
    discoverySession = v2->_discoverySession;
    v2->_discoverySession = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    activeReconnaissanceSessions = v2->_activeReconnaissanceSessions;
    v2->_activeReconnaissanceSessions = v5;
  }

  return v2;
}

- (unsigned)discoveryMode
{
  v2 = (char *)-[AVOutputDeviceDiscoverySession discoveryMode](self->_discoverySession, "discoveryMode");
  else {
    return dword_10034B750[(void)(v2 - 1)];
  }
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 - 1 > 2) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = qword_10034B760[a3 - 1];
  }
  uint64_t v6 = _MRLogForCategory(0LL, a2);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v8);
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ODDSRouting] Setting system discovery mode to %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", v5);
}

- (unsigned)externalScreenType
{
  return 0;
}

- (BOOL)currentRouteSupportsVolumeControl
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoutingDataSource _activeSystemContext](self, "_activeSystemContext"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 outputDevice]);

  LOBYTE(v2) = [v3 canSetVolume];
  return (char)v2;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return -[MRDOutputDeviceRoutingDataSource pickableRoutesForCategory:source:]( self,  "pickableRoutesForCategory:source:",  a3,  0LL);
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[AVOutputDeviceDiscoverySession availableOutputDevices]( self->_discoverySession,  "availableOutputDevices"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      int v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[MRDAVOutputDeviceRoute initWithAVOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDAVOutputDeviceRoute),  "initWithAVOutputDevice:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10));
        if (v11) {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)pickedRoute
{
  return -[MRDOutputDeviceRoutingDataSource pickedRouteForCategory:source:]( self,  "pickedRouteForCategory:source:",  @"MediaPlayback",  0LL);
}

- (id)pickedRouteForCategory:(id)a3
{
  return -[MRDOutputDeviceRoutingDataSource pickedRouteForCategory:source:]( self,  "pickedRouteForCategory:source:",  a3,  0LL);
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MRDAVOutputDeviceRoute);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoutingDataSource _activeSystemContext](self, "_activeSystemContext"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDevice]);
  id v8 = -[MRDAVOutputDeviceRoute initWithAVOutputDevice:](v5, "initWithAVOutputDevice:", v7);

  return v8;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return -[MRDOutputDeviceRoutingDataSource setPickedRoute:withPassword:forSource:]( self,  "setPickedRoute:withPassword:forSource:",  a3,  a4,  0LL);
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  if (v8)
  {
    id v11 = off_1003F5B98();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      id v13 = off_1003F5B98();
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v59 = v14;
      id v60 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    }
  }

  else
  {
    v12 = 0LL;
  }

  uint64_t v15 = _MRLogForCategory(0LL, v9);
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[ODDSRouting] Setting picked system route to: %{public}@ with password \"%@\"",  buf,  0x16u);
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___MRDAVOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoutingDataSource _activeSystemContext](self, "_activeSystemContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 avOutputDevice]);
    uint64_t v21 = _MRLogForCategory(0LL, v20);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[ODDSRouting] Route is an output device-based route. Setting the following device on the output context: %{public}@",  buf,  0xCu);
    }

    [v18 setOutputDevice:v19 options:v12];
LABEL_23:
    BOOL v33 = 1;
    goto LABEL_24;
  }

  if (v10 && ([v7 isSpeakerRoute] & 1) == 0)
  {
    int v53 = 0;
    uint64_t v34 = MRComputeBaseRouteUID(v10, &v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    uint64_t v37 = _MRLogForCategory(0LL, v36);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[ODDSRouting] Route is not an output device-based route. Beginning search for device matching UID \"%{public}@\"",  buf,  0xCu);
    }

    id v39 = objc_alloc(&OBJC_CLASS___MRAVReconnaissanceSession);
    v58 = v35;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
    id v41 = [v39 initWithOutputDeviceUIDs:v40 outputDeviceGroupID:0 features:1];

    [v41 setUseWeakMatching:1];
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v55 = sub_10003E54C;
    v56 = sub_10003E55C;
    v42 = self;
    v57 = v42;
    v51[0] = 0LL;
    v51[1] = v51;
    v51[2] = 0x3032000000LL;
    v51[3] = sub_10003E54C;
    v51[4] = sub_10003E55C;
    id v43 = v41;
    id v52 = v43;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10003E564;
    v45[3] = &unk_10039AFF8;
    v48 = v51;
    int v50 = v53;
    id v46 = v12;
    id v47 = v7;
    v49 = buf;
    [v43 beginSearchWithTimeout:v45 completion:5.0];
    -[NSMutableArray addObject:](v42->_activeReconnaissanceSessions, "addObject:", v43);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_23;
  }

  if ([v7 isSpeakerRoute])
  {
    id v24 = -[objc_class sharedSystemScreenContext](off_1003F5BA0(), "sharedSystemScreenContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = -[objc_class sharedAudioPresentationOutputContext](off_1003F5BA0(), "sharedAudioPresentationOutputContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v29 = _MRLogForCategory(0LL, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[ODDSRouting] Requested to pick speaker route. Clearing output devices from system screen and system music conte xts: %{public}@ %{public}@",  buf,  0x16u);
    }

    [v25 setOutputDevice:0 options:0];
    [v27 setOutputDevices:&__NSArray0__struct];

    goto LABEL_23;
  }

  uint64_t v31 = _MRLogForCategory(0LL, v23);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_1002B554C(v32);
  }

  BOOL v33 = 0;
LABEL_24:

  return v33;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoutingDataSource _activeSystemContext](self, "_activeSystemContext", *(void *)&a3));
  [v3 setOutputDevice:0 options:0];

  return 1;
}

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return -[MRDOutputDeviceRoutingDataSource resetPickedRouteForSource:](self, "resetPickedRouteForSource:", 0LL);
}

- (BOOL)unpickAirPlayRoutes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoutingDataSource _activeSystemContext](self, "_activeSystemContext"));
  [v2 setOutputDevice:0 options:0];

  return 1;
}

- (id)_activeSystemContext
{
  return -[objc_class sharedSystemAudioContext](off_1003F5BA0(), "sharedSystemAudioContext");
}

- (void).cxx_destruct
{
}

@end