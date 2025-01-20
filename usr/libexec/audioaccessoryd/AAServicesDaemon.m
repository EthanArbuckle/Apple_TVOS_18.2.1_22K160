@interface AAServicesDaemon
+ (id)sharedAAServicesDaemon;
- (AAServicesDaemon)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_activateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)_activateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)_avSystemControllerServerReset;
- (void)_createBannerSessionMuteActionForIOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_createBannerSessionMuteActionForMacOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_deregisterFromAVSystemControllerDeathNotifications;
- (void)_deregisterFromAVSystemControllerStateNotifications;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_handleCallIsActiveDidChangeNotification:(id)a3;
- (void)_handlePTTCallStatusChangedNotification:(id)a3;
- (void)_invalidateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)_invalidateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)_invalidateMuteBanner;
- (void)_muteStateChanged;
- (void)_playChime:(int)a3;
- (void)_processBannerRequestForMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)_processFirstPartyBannerRequestWithCompletion:(id)a3;
- (void)_registerForAVSystemControllerDeathNotifications;
- (void)_registerForAVSystemControllerStateNotifications;
- (void)_reportDeviceFound:(id)a3;
- (void)_reportDeviceLost:(id)a3;
- (void)_reverseMuteActionForToken:(id *)a3 shouldMute:(BOOL)a4;
- (void)_scheduleUpdate;
- (void)_submitMetricsForMuteAction:(int)a3 auditTokenBundleID:(id)a4 appName:(id)a5 appBundleID:(id)a6;
- (void)_toggleInputMuteState;
- (void)_update;
- (void)_updateAudioSessionControl:(id)a3;
- (void)_updateBannerChimeSuppressionState;
- (void)_updateMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)activateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)activateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)invalidateAudioRoutingControl:(id)a3 completion:(id)a4;
- (void)invalidateAudioSessionControl:(id)a3 completion:(id)a4;
- (void)reportDeviceFound:(id)a3;
- (void)reportDeviceLost:(id)a3;
- (void)updateAudioSessionControl:(id)a3;
@end

@implementation AAServicesDaemon

+ (id)sharedAAServicesDaemon
{
  if (qword_100237208 != -1) {
    dispatch_once(&qword_100237208, &stru_1002066D0);
  }
  return (id)qword_100237200;
}

- (AAServicesDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AAServicesDaemon;
  v2 = -[AAServicesDaemon init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectedHeadphones = v2->_connectedHeadphones;
    v2->_connectedHeadphones = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AAServicesDaemon", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    *(void *)&v2->_muteStateChangedToken = -1LL;
    tuSharedInst = v2->_tuSharedInst;
    v2->_tuSharedInst = 0LL;

    objc_storeStrong((id *)&qword_10023DCB0, v2);
    v10 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  id v95 = 0LL;
  NSAppendPrintF_safe(&v95, "-- AAServicesDaemon --\n");
  id v4 = v95;
  id v94 = v4;
  NSAppendPrintF( &v94,  "Active AudioSesionControl clients count: %d\n",  -[NSMutableSet count](self->_activatedAudioSessionControlSet, "count"));
  id v5 = v94;

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  v6 = self->_activatedAudioSessionControlSet;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v90,  v99,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v91;
    do
    {
      v10 = 0LL;
      v11 = v5;
      do
      {
        if (*(void *)v91 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v90 + 1) + 8LL * (void)v10);
        id v89 = v11;
        NSAppendPrintF(&v89, "    %@\n", v12);
        id v5 = v89;

        v10 = (char *)v10 + 1;
        v11 = v5;
      }

      while (v8 != v10);
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v90,  v99,  16LL);
    }

    while (v8);
  }

  id v88 = v5;
  NSAppendPrintF(&v88, "\n");
  id v13 = v88;

  currentAudioSessionControl = self->_currentAudioSessionControl;
  if (currentAudioSessionControl)
  {
    id v87 = v13;
    v15 = currentAudioSessionControl;
    NSAppendPrintF(&v87, "Current AudioSessionControl: %@\n", v15);
    id v16 = v87;

    id v13 = v16;
  }

  id v86 = v13;
  NSAppendPrintF( &v86,  "Active AADeviceManager clients count: %d\n",  -[NSMutableSet count](self->_activatedDeviceManagerSet, "count"));
  id v17 = v86;

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v18 = self->_activatedDeviceManagerSet;
  id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v82,  v98,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v83;
    do
    {
      v22 = 0LL;
      v23 = v17;
      do
      {
        if (*(void *)v83 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)v22);
        id v81 = v23;
        NSAppendPrintF(&v81, "    %@\n", v24);
        id v17 = v81;

        v22 = (char *)v22 + 1;
        v23 = v17;
      }

      while (v20 != v22);
      id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v82,  v98,  16LL);
    }

    while (v20);
  }

  id v80 = v17;
  NSAppendPrintF(&v80, "\n");
  id v25 = v80;

  uiNotificationSessionMuteControl = self->_uiNotificationSessionMuteControl;
  if (uiNotificationSessionMuteControl)
  {
    id v79 = v25;
    v27 = uiNotificationSessionMuteControl;
    NSAppendPrintF(&v79, "UINotification Mute Control: %@\n", v27);
    id v28 = v79;

    id v25 = v28;
  }

  id v78 = v25;
  if (self->_isCallActive) {
    v29 = "yes";
  }
  else {
    v29 = "no";
  }
  if (self->_isCallHighPriority) {
    v30 = "yes";
  }
  else {
    v30 = "no";
  }
  NSAppendPrintF_safe(&v78, "_isCallActive %s, _isCallHighPriority %s\n", v29, v30);
  id v31 = v78;

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  v32 = (void *)CFPrefs_CopyKeys(@"com.apple.AudioAccessory", 0LL);
  id v33 = [v32 countByEnumeratingWithState:&v74 objects:v97 count:16];
  if (!v33) {
    goto LABEL_36;
  }
  id v34 = v33;
  v61 = self;
  int v35 = 0;
  uint64_t v36 = *(void *)v75;
  do
  {
    for (i = 0LL; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v75 != v36) {
        objc_enumerationMutation(v32);
      }
      uint64_t v38 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)i);
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      {
        v40 = (void *)CFPrefs_CopyTypedValue(@"com.apple.AudioAccessory", v38, 0LL, 0LL);
        id v73 = v31;
        NSAppendPrintF(&v73, "Pref: '%@' = '%##@'\n", v38, v40);
        id v41 = v73;

        ++v35;
        id v31 = v41;
      }
    }

    id v34 = [v32 countByEnumeratingWithState:&v74 objects:v97 count:16];
  }

  while (v34);

  if (v35 >= 1)
  {
    id v72 = v31;
    NSAppendPrintF(&v72, "\n");
    v32 = v31;
    id v31 = v72;
    self = v61;
LABEL_36:

    goto LABEL_38;
  }

  self = v61;
LABEL_38:
  id v42 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v42)
  {
    id v71 = v31;
    NSAppendPrintF(&v71, "XPC Cnx: %d\n", (_DWORD)v42);
    id v43 = v71;

    id v31 = v43;
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  v44 = self->_xpcConnections;
  id v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v67,  v96,  16LL);
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v68;
    do
    {
      for (j = 0LL; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v68 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)j);
        id v66 = v31;
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 xpcCnx]);
        id v51 = [v50 processIdentifier];
        unsigned int v52 = [v49 entitled];
        v53 = "yes";
        if (!v52) {
          v53 = "no";
        }
        NSAppendPrintF(&v66, "    %#{pid}, entitled %s", v51, v53);
        id v54 = v66;

        id v65 = v54;
        NSAppendPrintF(&v65, "\n");
        id v31 = v65;
      }

      id v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v67,  v96,  16LL);
    }

    while (v46);
  }

  id v64 = v31;
  NSAppendPrintF(&v64, "\n");
  id v55 = v64;

  id v63 = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
  uint64_t v57 = CUDescriptionWithLevel(v56, a3);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  NSAppendPrintF(&v63, "%@", v58);
  id v59 = v63;

  return v59;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001137C;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (_os_feature_enabled_impl("BluetoothFeatures", "ConversationDetect"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[AAConversationDetectSessionManager sharedCDSessionManager]( &OBJC_CLASS___AAConversationDetectSessionManager,  "sharedCDSessionManager"));
    [v3 activate];
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
  [v4 setDispatchQueue:self->_dispatchQueue];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
  [v5 activate];

  if (!self->_xpcListener)
  {
    v6 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.AudioAccessoryServices");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v6;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  if (self->_muteStateChangedToken == -1
    && _os_feature_enabled_impl("BluetoothFeatures", "CallManagementMuteControl"))
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _activate]",  30LL,  "Registering for Mute State Change Notifications");
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100011800;
    handler[3] = &unk_100206308;
    handler[4] = self;
    notify_register_dispatch( "com.apple.audioaccessoryd.MuteState",  &self->_muteStateChangedToken,  dispatchQueue,  handler);
  }

  -[AAServicesDaemon _registerForAVSystemControllerDeathNotifications]( self,  "_registerForAVSystemControllerDeathNotifications");
  -[AAServicesDaemon _registerForAVSystemControllerStateNotifications]( self,  "_registerForAVSystemControllerStateNotifications");
  -[AAServicesDaemon _updateBannerChimeSuppressionState](self, "_updateBannerChimeSuppressionState");
  uint64_t v9 = (TUCallCenter *)objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  self->_dispatchQueue));
  tuSharedInst = self->_tuSharedInst;
  self->_tuSharedInst = v9;

  if (self->_prefsChangedNotifyToken == -1)
  {
    v11 = (dispatch_queue_s *)self->_dispatchQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100011898;
    v34[3] = &unk_100206308;
    v34[4] = self;
    notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, v11, v34);
  }

  if (!self->_stateHandle)
  {
    uint64_t v12 = self->_dispatchQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100011908;
    v33[3] = &unk_1002066F8;
    v33[4] = self;
    self->_stateHandle = os_state_add_handler(v12, v33);
  }

  id v13 = self->_connectedDeviceDiscovery;
  if (!v13)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    -[CBDiscovery setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v14);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100011924;
    v30[3] = &unk_100206330;
    v15 = v14;
    id v31 = v15;
    v32 = self;
    -[CBDiscovery setDeviceFoundHandler:](v15, "setDeviceFoundHandler:", v30);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100011940;
    v27[3] = &unk_100206330;
    id v16 = v15;
    id v28 = v16;
    v29 = self;
    -[CBDiscovery setDeviceLostHandler:](v16, "setDeviceLostHandler:", v27);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001195C;
    v24[3] = &unk_100206358;
    id v17 = v16;
    id v25 = v17;
    v26 = self;
    -[CBDiscovery setInterruptionHandler:](v17, "setInterruptionHandler:", v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000119EC;
    v22[3] = &unk_100206058;
    v18 = v17;
    v23 = v18;
    -[CBDiscovery setInvalidationHandler:](v18, "setInvalidationHandler:", v22);
    -[CBDiscovery setDiscoveryFlags:]( v18,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](v18, "discoveryFlags") | 0x80000200000LL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100011A68;
    v19[3] = &unk_100206380;
    id v13 = v18;
    id v20 = v13;
    uint64_t v21 = self;
    -[CBDiscovery activateWithCompletion:](v13, "activateWithCompletion:", v19);
  }

  notify_post("com.apple.AudioAccessory.daemonStarted");
  -[AAServicesDaemon _prefsChanged](self, "_prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011BEC;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(&OBJC_CLASS___AAServicesXPCConnection);
  -[AAServicesXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[AAServicesXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[AAServicesXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AAServicesXPCClientInterface));
  [v5 _setQueue:self->_dispatchQueue];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AAServicesXPCDaemonInterface));
  [v5 setExportedInterface:v11];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100011EE0;
  v13[3] = &unk_100206358;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  [v5 setRemoteObjectInterface:v10];
  [v5 resume];
  if (dword_100234330 <= 20 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 20LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started: %#{pid}",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_scheduleUpdate
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011F58;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_update
{
  self->_updatePending = 0;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100234330 <= 20)
  {
    if (dword_100234330 != -1 || (v6 = _LogCategory_Initialize(&dword_100234330, 20LL), id v4 = v7, v6))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcCnx]);
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _xpcConnectionInvalidated:]",  20,  "XPC connection ended: %#{pid}",  [v5 processIdentifier]);

      id v4 = v7;
    }
  }

  [v4 xpcConnectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[AAServicesDaemon _update](self, "_update");
}

- (void)activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000120D4;
  block[3] = &unk_100206220;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id obj = a3;
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = self->_activatedAudioRoutingControlSet;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v14 = v6;
        id v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_100234330 <= 30
            && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
          {
            LogPrintF( &dword_100234330,  "-[AAServicesDaemon _activateAudioRoutingControl:completion:]",  30LL,  "Direct update: %@",  v14,  obj,  (void)v22);
          }

          goto LABEL_26;
        }

        id v16 = v15;
        if ((v6 == 0LL) != (v15 != 0LL))
        {
          unsigned __int8 v17 = [v14 isEqual:v15];

          if ((v17 & 1) != 0) {
            goto LABEL_17;
          }
        }

        else
        {
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_100234330 < 31 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _activateAudioRoutingControl:completion:]",  30LL,  "Direct activate: %@",  v6,  obj,  (void)v22);
  }
  activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  if (!activatedAudioRoutingControlSet)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v20 = self->_activatedAudioRoutingControlSet;
    self->_activatedAudioRoutingControlSet = v19;

    activatedAudioRoutingControlSet = self->_activatedAudioRoutingControlSet;
  }

  -[NSMutableSet addObject:](activatedAudioRoutingControlSet, "addObject:", v6);
  objc_storeStrong((id *)&self->_currentAudioRoutingControl, obj);
LABEL_26:
  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0LL);
}

- (void)invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012404;
  block[3] = &unk_100206220;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateAudioRoutingControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = self->_activatedAudioRoutingControlSet;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
  while (2)
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      id v14 = v6;
      id v15 = v13;
      if (v15 == v14)
      {

        id v16 = v14;
LABEL_15:
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF( &dword_100234330,  "-[AAServicesDaemon _invalidateAudioRoutingControl:completion:]",  30LL,  "Direct invalidate: %@",  v14);
        }

        -[NSMutableSet removeObject:](self->_activatedAudioRoutingControlSet, "removeObject:", v14);
        currentAudioRoutingControl = self->_currentAudioRoutingControl;
        id v19 = v16;
        id v20 = currentAudioRoutingControl;
        if (v19 == v20)
        {
        }

        else
        {
          uint64_t v21 = v20;
          if ((v19 == 0LL) == (v20 != 0LL))
          {

            goto LABEL_26;
          }

          unsigned int v22 = -[AAAudioRoutingControl isEqual:](v19, "isEqual:", v20);

          if (!v22) {
            goto LABEL_27;
          }
        }

        id v19 = self->_currentAudioRoutingControl;
        self->_currentAudioRoutingControl = 0LL;
LABEL_26:

        goto LABEL_27;
      }

      id v16 = v15;
      if ((v6 == 0LL) != (v15 != 0LL))
      {
        unsigned int v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_15;
        }
      }

      else
      {
      }
    }

    id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v10) {
      continue;
    }
    break;
  }

- (void)activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012720;
  block[3] = &unk_100206220;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateAudioSessionControl:(id)a3 completion:(id)a4
{
  id obj = a3;
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = self->_activatedAudioSessionControlSet;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v14 = v6;
        id v15 = v13;
        if (v15 == v14)
        {

LABEL_17:
          if (dword_100234330 <= 30
            && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
          {
            LogPrintF( &dword_100234330,  "-[AAServicesDaemon _activateAudioSessionControl:completion:]",  30LL,  "Direct update: %@",  v14,  obj,  (void)v22);
          }

          goto LABEL_26;
        }

        id v16 = v15;
        if ((v6 == 0LL) != (v15 != 0LL))
        {
          unsigned __int8 v17 = [v14 isEqual:v15];

          if ((v17 & 1) != 0) {
            goto LABEL_17;
          }
        }

        else
        {
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_100234330 < 31 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _activateAudioSessionControl:completion:]",  30LL,  "Direct activate: %@",  v6,  obj,  (void)v22);
  }
  activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  if (!activatedAudioSessionControlSet)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v20 = self->_activatedAudioSessionControlSet;
    self->_activatedAudioSessionControlSet = v19;

    activatedAudioSessionControlSet = self->_activatedAudioSessionControlSet;
  }

  -[NSMutableSet addObject:](activatedAudioSessionControlSet, "addObject:", v6);
  objc_storeStrong((id *)&self->_currentAudioSessionControl, obj);
LABEL_26:
  -[AAServicesDaemon _update](self, "_update");
  v7[2](v7, 0LL);
}

- (void)updateAudioSessionControl:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100012A24;
  v7[3] = &unk_100206358;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_updateAudioSessionControl:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = self->_activatedAudioSessionControlSet;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_15:
          if (dword_100234330 <= 30
            && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
          {
            LogPrintF( &dword_100234330,  "-[AAServicesDaemon _updateAudioSessionControl:]",  30LL,  "Direct update: %@",  v11);
          }

          -[AAServicesDaemon _update](self, "_update");
          goto LABEL_20;
        }

        id v13 = v12;
        if ((v4 == 0LL) != (v12 != 0LL))
        {
          unsigned int v14 = [v11 isEqual:v12];

          if (v14) {
            goto LABEL_15;
          }
        }

        else
        {
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_20:
}

- (void)invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012CA0;
  block[3] = &unk_100206220;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateAudioSessionControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v8 = self->_activatedAudioSessionControlSet;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
  while (2)
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      id v14 = v6;
      id v15 = v13;
      if (v15 == v14)
      {

        __int128 v16 = v14;
LABEL_15:
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF( &dword_100234330,  "-[AAServicesDaemon _invalidateAudioSessionControl:completion:]",  30LL,  "Direct invalidate: %@",  v14);
        }

        -[NSMutableSet removeObject:](self->_activatedAudioSessionControlSet, "removeObject:", v14);
        currentAudioSessionControl = self->_currentAudioSessionControl;
        id v19 = v16;
        id v20 = currentAudioSessionControl;
        if (v19 == v20)
        {
        }

        else
        {
          uint64_t v21 = v20;
          if ((v19 == 0LL) == (v20 != 0LL))
          {

            goto LABEL_26;
          }

          unsigned int v22 = -[AAAudioSessionControl isEqual:](v19, "isEqual:", v20);

          if (!v22) {
            goto LABEL_27;
          }
        }

        id v19 = self->_currentAudioSessionControl;
        self->_currentAudioSessionControl = 0LL;
LABEL_26:

        goto LABEL_27;
      }

      __int128 v16 = v15;
      if ((v6 == 0LL) != (v15 != 0LL))
      {
        unsigned int v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_15;
        }
      }

      else
      {
      }
    }

    id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v10) {
      continue;
    }
    break;
  }

- (void)_deviceFound:(id)a3
{
  id v19 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
  p_currentAudioOwnerDevice = &self->_currentAudioOwnerDevice;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_currentAudioOwnerDevice, "identifier"));
  id v8 = v5;
  id v9 = v7;
  if (v8 == v9)
  {

    id v12 = v19;
  }

  else
  {
    id v10 = v9;
    if ((v8 == 0LL) == (v9 != 0LL))
    {

      id v12 = v19;
      goto LABEL_13;
    }

    unsigned __int8 v11 = [v8 isEqual:v9];

    id v12 = v19;
    if ((v11 & 1) == 0)
    {
LABEL_13:
      if (([v12 deviceFlags] & 0x40) != 0
        && [v19 audioStreamState] == 3)
      {
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF(&dword_100234330, "-[AAServicesDaemon _deviceFound:]", 30LL, "Found AudioOwner device: %@", v19);
        }

        objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
      }

      unsigned int v14 = [v19 productID] - 8194;
      if (v14 <= 0x24 && ((1LL << v14) & 0x1C7BB7FF9BLL) != 0)
      {
        connectedHeadphones = self->_connectedHeadphones;
        if (!connectedHeadphones)
        {
          __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v17 = self->_connectedHeadphones;
          self->_connectedHeadphones = v16;

          connectedHeadphones = self->_connectedHeadphones;
        }

        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( connectedHeadphones,  "setObject:forKeyedSubscript:",  v19,  v18);
      }

      -[AAServicesDaemon _update](self, "_update");
      goto LABEL_28;
    }
  }

  if (([v12 deviceFlags] & 0x40) != 0
    && [v19 audioStreamState] == 3)
  {
    objc_storeStrong((id *)&self->_currentAudioOwnerDevice, a3);
  }

  else
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF(&dword_100234330, "-[AAServicesDaemon _deviceFound:]", 30LL, "Lost AudioOwner device: %@", v19);
    }

    id v13 = *p_currentAudioOwnerDevice;
    *p_currentAudioOwnerDevice = 0LL;
  }

- (void)_deviceLost:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_currentAudioOwnerDevice, "identifier"));
  currentAudioOwnerDevice = v4;
  id v7 = v5;
  if (currentAudioOwnerDevice == v7)
  {

    goto LABEL_6;
  }

  id v8 = v7;
  if ((currentAudioOwnerDevice == 0LL) == (v7 != 0LL))
  {

LABEL_12:
    goto LABEL_13;
  }

  unsigned __int8 v9 = -[CBDevice isEqual:](currentAudioOwnerDevice, "isEqual:", v7);

  if ((v9 & 1) != 0)
  {
LABEL_6:
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF(&dword_100234330, "-[AAServicesDaemon _deviceLost:]", 30LL, "Lost AudioOwner device: %@", v12);
    }

    currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
    self->_currentAudioOwnerDevice = 0LL;
    goto LABEL_12;
  }

- (void)reportDeviceFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013380;
  v7[3] = &unk_100206358;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportDeviceFound:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager", (void)v12));
        if (v11) {
          [v10 deviceManagerReportDeviceFound:v4];
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }
}

- (void)reportDeviceLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013528;
  v7[3] = &unk_100206358;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportDeviceLost:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "deviceManagerReportDeviceLost:",  v4,  (void)v10);
        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)_handleCallIsActiveDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000136AC;
  v7[3] = &unk_100206358;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_handlePTTCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013914;
  v7[3] = &unk_100206358;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_updateBannerChimeSuppressionState
{
  if (self->_isCallActive)
  {
    int isPTTCallActive = self->_isPTTCallActive;
    self->_shouldSuppressMuteBanner = isPTTCallActive;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    BOOL isCallHighPriority = self->_isCallHighPriority;
  }

  else
  {
    int isPTTCallActive = 1;
    self->_shouldSuppressMuteBanner = 1;
    p_shouldSuppressMuteBanner = &self->_shouldSuppressMuteBanner;
    BOOL isCallHighPriority = 1;
  }

  self->_shouldSuppressMuteChime = isCallHighPriority;
  if (dword_100234330 <= 30)
  {
    if (dword_100234330 == -1)
    {
      int v8 = _LogCategory_Initialize(&dword_100234330, 30LL);
      int isPTTCallActive = *p_shouldSuppressMuteBanner;
      if (!v8) {
        goto LABEL_14;
      }
      BOOL isCallHighPriority = self->_shouldSuppressMuteChime;
    }

    if (isPTTCallActive) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    if (isCallHighPriority) {
      id v7 = "yes";
    }
    else {
      id v7 = "no";
    }
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _updateBannerChimeSuppressionState]",  30LL,  "Mute Control: shouldSuppressBanner: %s, shouldSuppressChime: %s",  v6,  v7);
    int isPTTCallActive = *p_shouldSuppressMuteBanner;
  }

- (void)_createBannerSessionMuteActionForIOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->_muteBanner) {
    -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
  }
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  __int128 v25 = sub_100013E9C;
  __int128 v26 = sub_100013EAC;
  v27 = objc_alloc_init(&OBJC_CLASS___BTBannerUISession);
  objc_storeStrong((id *)&self->_muteBanner, (id)v23[5]);
  [(id)v23[5] setBannerAppID:v11];
  [(id)v23[5] setBannerType:2];
  [(id)v23[5] setCenterContentText:v10];
  if (a3 == 1)
  {
    __int128 v12 = @"mute";
    goto LABEL_12;
  }

  if (a3 == 2)
  {
    __int128 v12 = @"unmute";
LABEL_12:
    [(id)v23[5] setCenterContentItemsText:v12];
    [(id)v23[5] setDispatchQueue:self->_dispatchQueue];
    [(id)v23[5] setTimeoutSeconds:4.0];
    v17[1] = 3221225472LL;
    __int128 v16 = *(_OWORD *)&a4->var0[4];
    __int128 v19 = *(_OWORD *)a4->var0;
    v17[0] = _NSConcreteStackBlock;
    v17[2] = sub_100013EB4;
    v17[3] = &unk_100206720;
    v17[4] = self;
    v17[5] = &v22;
    int v18 = a3;
    __int128 v20 = v16;
    BOOL v21 = a3 == 2;
    [(id)v23[5] setActionHandler:v17];
    [(id)v23[5] activate];

    goto LABEL_19;
  }

  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  if (currentAudioOwnerDevice)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](currentAudioOwnerDevice, "productName"));
    if (v14)
    {
      unsigned int v15 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID") - 8194;
      if (v15 <= 0x24 && ((1LL << v15) & 0x1C7BB7FF9BLL) != 0)
      {

        __int128 v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self->_currentAudioOwnerDevice, "productName"));
        goto LABEL_12;
      }
    }
  }

  if (dword_100234330 <= 30 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:]",  30LL,  "Mute Control: Cannot show reject banner, invalid audio owner device: %@",  self->_currentAudioOwnerDevice);
  }
  -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
LABEL_19:
  _Block_object_dispose(&v22, 8);
}

- (void)_createBannerSessionMuteActionForMacOS:(int)a3 auditToken:(id *)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v9 = a6;
  if ((_os_feature_enabled_impl("BluetoothFeatures", "CallManagementMuteControlMac") & 1) != 0)
  {
    if (self->_uiNotificationSessionMuteControl) {
      -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/UserNotifications/Bundles/com.apple.MuteControlUserNotifications.bundle"));
    id v11 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
    objc_storeStrong((id *)&self->_uiNotificationSessionMuteControl, v11);
    -[CUUserNotificationSession setBundleID:](v11, "setBundleID:", @"com.apple.MuteControlUserNotifications");
    -[CUUserNotificationSession setCategoryID:](v11, "setCategoryID:", @"MuteControlUserNotifications");
    -[CUUserNotificationSession setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
    -[CUUserNotificationSession setFlags:](v11, "setFlags:", 81LL);
    -[CUUserNotificationSession setIconAppIdentifier:](v11, "setIconAppIdentifier:", v9);
    -[CUUserNotificationSession setLabel:](v11, "setLabel:", @"MuteControl");
    -[CUUserNotificationSession setSubtitleKey:](v11, "setSubtitleKey:", @"TITLE_FORMAT");
    -[CUUserNotificationSession setTimeoutSeconds:](v11, "setTimeoutSeconds:", 20.0);
    -[CUUserNotificationSession setTitleKey:](v11, "setTitleKey:", @"TITLE_FORMAT");
    uint64_t v12 = CULocalizedStringEx(v10, @"Localizable", @"MUTE_CONTROL_TITLE");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v42 = v13;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    -[CUUserNotificationSession setTitleArguments:](v11, "setTitleArguments:", v14);

    -[CUUserNotificationSession removeAllActions](v11, "removeAllActions");
    unsigned int v15 = &off_1001A5000;
    switch(a3)
    {
      case 3:
        currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
        if (currentAudioOwnerDevice)
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CBDevice productName](currentAudioOwnerDevice, "productName"));
          if (v22)
          {
            __int128 v23 = (void *)v22;
            unsigned int v24 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID") - 8194;
            if (v24 <= 0x24 && ((1LL << v24) & 0x1C7BB7FF9BLL) != 0)
            {

              uint64_t v25 = CULocalizedStringEx(v10, @"Localizable", @"REJECTED_WITH_DEVICE_FORMAT");
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self->_currentAudioOwnerDevice, "productName"));
                id v28 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v26,  v27));
              }

              else
              {
                id v28 = &stru_100212678;
              }

              uint64_t v39 = v28;
              id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v39,  1LL));
              -[CUUserNotificationSession setSubtitleArguments:](v11, "setSubtitleArguments:", v33);

              goto LABEL_23;
            }
          }
        }

        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF( &dword_100234330,  "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]",  30LL,  "Mute Control: Cannot show reject banner, invalid audio owner device: %@",  self->_currentAudioOwnerDevice);
        }

        break;
      case 2:
        if ((objc_opt_respondsToSelector(v11, "setUserInfo:") & 1) != 0) {
          -[CUUserNotificationSession setUserInfo:](v11, "setUserInfo:", &off_100218BE8);
        }
        uint64_t v29 = CULocalizedStringEx(v10, @"Localizable", @"UNMUTED");
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v40 = v17;
        char v18 = 1;
        __int128 v19 = @"MUTE_ACTION";
        __int128 v20 = &v40;
        goto LABEL_22;
      case 1:
        if ((objc_opt_respondsToSelector(v11, "setUserInfo:") & 1) != 0) {
          -[CUUserNotificationSession setUserInfo:](v11, "setUserInfo:", &off_100218BC0);
        }
        uint64_t v16 = CULocalizedStringEx(v10, @"Localizable", @"MUTED");
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        char v18 = 0;
        id v41 = v17;
        __int128 v19 = @"UNMUTE_ACTION";
        __int128 v20 = &v41;
LABEL_22:
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 1LL));
        -[CUUserNotificationSession setSubtitleArguments:](v11, "setSubtitleArguments:", v30);

        uint64_t v31 = CULocalizedStringEx(v10, @"Localizable", v19);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v35[0] = _NSConcreteStackBlock;
        unsigned int v15 = &off_1001A5000;
        v35[1] = 3221225472LL;
        v35[2] = sub_100014710;
        v35[3] = &unk_100206748;
        v35[4] = v11;
        v35[5] = self;
        __int128 v32 = *(_OWORD *)&a4->var0[4];
        __int128 v36 = *(_OWORD *)a4->var0;
        __int128 v37 = v32;
        char v38 = v18;
        -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]( v11,  "addActionWithIdentifier:title:flags:handler:",  @"ReverseMuteAction",  v26,  0LL,  v35);
LABEL_23:

        v34[0] = _NSConcreteStackBlock;
        v34[1] = *((void *)v15 + 366);
        v34[2] = sub_1000147C4;
        v34[3] = &unk_100206770;
        v34[4] = v11;
        void v34[5] = self;
        -[CUUserNotificationSession setActionHandler:](v11, "setActionHandler:", v34);
        -[CUUserNotificationSession activate](v11, "activate");
LABEL_38:

        goto LABEL_39;
      default:
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF( &dword_100234330,  "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]",  30LL,  "Mute Control: Invalid Mute Action %s, Don't show banner");
        }

        break;
    }

    -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
    goto LABEL_38;
  }

  if (dword_100234330 <= 90 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _createBannerSessionMuteActionForMacOS:auditToken:appName:appBundleID:]",  90LL,  "Mute Control: CallManagementMuteControlMac feature flag not enabled");
  }
LABEL_39:
}

- (void)_invalidateMuteBanner
{
  muteBanner = self->_muteBanner;
  if (muteBanner)
  {
    -[BTBannerUISession invalidate](muteBanner, "invalidate");
    id v4 = self->_muteBanner;
    self->_muteBanner = 0LL;
  }

- (void)_muteStateChanged
{
}

- (void)_toggleInputMuteState
{
  if (_os_feature_enabled_impl("MediaExperience", "SessionBasedMuting"))
  {
    id v5 = 0LL;
    +[AVAudioApplication toggleInputMute:](&OBJC_CLASS___AVAudioApplication, "toggleInputMute:", &v5);
    id v3 = v5;
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _toggleInputMuteState]",  30LL,  "Mute Control: toggleInputMute returned with error: %@",  v3);
    }
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    [v3 toggleInputMute];
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _toggleInputMuteState]",  30LL,  "Mute Control: toggleInputMute returned with %d");
    }
  }

  muteActionTrigger = self->_muteActionTrigger;
  self->_muteActionTrigger = (NSString *)@"stemClick";
}

- (void)_playChime:(int)a3
{
  if (((1 << a3) & 0x18) != 0)
  {
    uint64_t v6 = 1366LL;
    goto LABEL_22;
  }

  if (((1 << a3) & 0x22) == 0)
  {
    if (((1 << a3) & 0x44) != 0)
    {
      if (self->_shouldSuppressMuteChime)
      {
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          int v4 = a3 - 2;
          if ((a3 - 2) <= 4)
          {
            id v5 = &off_1002068C0;
LABEL_16:
            id v7 = v5[v4];
LABEL_32:
            LogPrintF(&dword_100234330, "-[AAServicesDaemon _playChime:]", 30LL, "Mute Control: suppressing %s", v7);
            return;
          }

          goto LABEL_31;
        }

        return;
      }

      uint64_t v6 = 1365LL;
LABEL_22:
      if (dword_100234330 <= 30
        && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
      {
        else {
          int v8 = (&off_1002068E8)[a3 - 1];
        }
        LogPrintF(&dword_100234330, "-[AAServicesDaemon _playChime:]", 30LL, "Mute Control: playing %s", v8);
      }

      AudioServicesPlaySystemSoundWithOptions(v6, 0LL, 0LL);
      return;
    }

- (void)_processFirstPartyBannerRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter uiDataSource](self->_tuSharedInst, "uiDataSource"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter uiDataSource](self->_tuSharedInst, "uiDataSource"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100014D3C;
    v12[3] = &unk_1002067C0;
    v12[4] = self;
    id v13 = v4;
    [v6 fetchInCallUIState:v12];
  }

  else
  {
    uint64_t currentMuteControlAction = self->_currentMuteControlAction;
    currentMuteControlAppName = self->_currentMuteControlAppName;
    currentMuteControlBundleIdentifier = self->_currentMuteControlBundleIdentifier;
    __int128 v10 = *(_OWORD *)&self->_currentMuteControlAuditToken.val[4];
    v11[0] = *(_OWORD *)self->_currentMuteControlAuditToken.val;
    v11[1] = v10;
    -[AAServicesDaemon _createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:]( self,  "_createBannerSessionMuteActionForIOS:auditToken:appName:appBundleID:",  currentMuteControlAction,  v11,  currentMuteControlAppName,  currentMuteControlBundleIdentifier);
    if (v4) {
      (*((void (**)(id, NSString *, NSString *, NSString *, void))v4 + 2))( v4,  self->_currentMuteControlAuditTokenBundleIdentifier,  self->_currentMuteControlAppName,  self->_currentMuteControlBundleIdentifier,  0LL);
    }
  }
}

- (void)_processBannerRequestForMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (v9)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  30LL,  "Mute Control: app bundle identifier set for mute action: %@",  v9);
    }

    id v31 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v9,  0LL,  &v31));
    id v11 = v31;
    if (!v11)
    {
      id v13 = v9;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedName]);

      unsigned int v15 = 0LL;
      if (v14) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }

    if (dword_100234330 <= 90
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  90LL,  "Mute Control: Failed to get bundle record from bundleID %@ with error: %@",  v9,  v11);
    }
  }

  else
  {
    id v11 = 0LL;
  }

  id v13 = 0LL;
LABEL_16:
  id v30 = v11;
  __int128 v16 = *(_OWORD *)&a4->var0[4];
  v29[0] = *(_OWORD *)a4->var0;
  v29[1] = v16;
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v29,  &v30));
  id v18 = v30;

  if (v18)
  {
    if (dword_100234330 <= 90
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  90LL,  "Mute Control: Failed to get bundle record with error: %@",  v18);
    }

    if (v10) {
      (*((void (**)(id, void, void, id, id))v10 + 2))(v10, 0LL, 0LL, v13, v18);
    }

    unsigned int v15 = 0LL;
    __int128 v14 = 0LL;
    goto LABEL_65;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedName]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);

  id v13 = v19;
  unsigned int v15 = v13;
  if (!v14) {
    goto LABEL_27;
  }
LABEL_21:
  if (!v13)
  {
LABEL_27:
    if (dword_100234330 <= 90
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  90LL,  "Mute Control: Invalid data received from bundle record, app name: %@, appBundleID: %@",  v14,  v13);
    }

    NSErrorDomain v23 = NSOSStatusErrorDomain;
    unsigned int v24 = "invalid application parameters";
    goto LABEL_63;
  }

  unsigned int v20 = a3 - 4;
  if ((a3 - 4) > 2)
  {
    if (-[NSString isEqualToString:](self->_muteActionTrigger, "isEqualToString:", @"stemClick")
      || -[NSString isEqualToString:](self->_muteActionTrigger, "isEqualToString:", @"bannerAction"))
    {
      if (dword_100234330 <= 30
        && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
      {
        else {
          uint64_t v22 = (&off_100206930)[a3];
        }
        LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  30LL,  "Mute Control: Show Banner for app name: %@, appBundleID: %@, mute action: %s",  v14,  v13,  v22);
      }

      NSErrorDomain v23 = NSOSStatusErrorDomain;
      unsigned int v24 = "mute control banners are not supported on this platform";
    }

    else
    {
      if (dword_100234330 <= 90
        && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
      {
        else {
          uint64_t v25 = (&off_100206930)[a3];
        }
        muteActionTrigger = (const __CFString *)self->_muteActionTrigger;
        if (!muteActionTrigger) {
          muteActionTrigger = @"nil";
        }
        LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  90LL,  "Mute Control: Returning without showing banner for app name: %@, appBundleID: %@, mute action: %s, invalid mut e action trigger: %@",  v14,  v13,  v25,  muteActionTrigger);
      }

      -[AAServicesDaemon _invalidateMuteBanner](self, "_invalidateMuteBanner");
      NSErrorDomain v23 = NSOSStatusErrorDomain;
      unsigned int v24 = "invalid mute action trigger";
    }
  }

  else
  {
    if (dword_100234330 <= 90
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    {
      if (v20 > 2) {
        BOOL v21 = "?";
      }
      else {
        BOOL v21 = (&off_100206918)[v20];
      }
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]",  90LL,  "Mute Control: Invalid Mute Action %s, Don't show banner",  v21);
    }

    NSErrorDomain v23 = NSOSStatusErrorDomain;
    unsigned int v24 = "invalid mute action input";
  }

- (void)_reverseMuteActionForToken:(id *)a3 shouldMute:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___AVAudioApplication);
  __int128 v8 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v8;
  id v9 = -[AVAudioApplication initProxyForProcess:](v7, "initProxyForProcess:", v14);
  id v10 = v9;
  if (v9)
  {
    id v13 = 0LL;
    [v9 setInputMuted:v4 error:&v13];
    id v11 = v13;
    if (v11)
    {
      if (dword_100234330 <= 90
        && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
      {
        LogPrintF( &dword_100234330,  "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]",  90LL,  "Mute Control: failed to reverse mute action with error: %@",  v11);
      }
    }

    else if (dword_100234330 <= 30 {
           && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    }
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]",  30LL,  "Mute Control: setInputMuted: %s succeeded");
    }

    muteActionTrigger = self->_muteActionTrigger;
    self->_muteActionTrigger = (NSString *)@"bannerAction";
  }

  else if (dword_100234330 <= 90 {
         && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
  }
  {
    LogPrintF( &dword_100234330,  "-[AAServicesDaemon _reverseMuteActionForToken:shouldMute:]",  90LL,  "Mute Control: failed to find AVAudioApplication");
  }
}

- (void)_submitMetricsForMuteAction:(int)a3 auditTokenBundleID:(id)a4 appName:(id)a5 appBundleID:(id)a6
{
  id v10 = (__CFString *)a4;
  id v11 = (__CFString *)a5;
  uint64_t v12 = (__CFString *)a6;
  else {
    id v13 = (&off_1002069E8)[a3];
  }
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
  unsigned int v15 = (void *)v14;
  v27[0] = @"action";
  v27[1] = @"attributionAppName";
  __int128 v16 = @"unknown";
  if (v11) {
    unsigned int v17 = v11;
  }
  else {
    unsigned int v17 = @"unknown";
  }
  v28[0] = v14;
  v28[1] = v17;
  if (v12) {
    id v18 = v12;
  }
  else {
    id v18 = @"unknown";
  }
  v27[2] = @"attributionBundleID";
  v27[3] = @"bundleID";
  if (v10) {
    __int128 v19 = v10;
  }
  else {
    __int128 v19 = @"unknown";
  }
  v28[2] = v18;
  v28[3] = v19;
  muteActionTrigger = (const __CFString *)self->_muteActionTrigger;
  if (!muteActionTrigger) {
    muteActionTrigger = @"appUITapAction";
  }
  void v27[4] = @"trigger";
  v27[5] = @"isSupportedAccessoryRouted";
  currentAudioOwnerDevice = self->_currentAudioOwnerDevice;
  uint64_t v22 = &off_100219020;
  if (!currentAudioOwnerDevice) {
    uint64_t v22 = &off_100219038;
  }
  v28[4] = muteActionTrigger;
  v28[5] = v22;
  v27[6] = @"accessoryProductID";
  unsigned int v23 = -[CBDevice productID](currentAudioOwnerDevice, "productID");
  if (v23)
  {
    int v24 = -[CBDevice productID](self->_currentAudioOwnerDevice, "productID");
    if (v24 <= 21759)
    {
      if (v24 > 8193)
      {
        switch(v24)
        {
          case 8194:
            uint64_t v25 = "AirPods1,1";
            break;
          case 8195:
            uint64_t v25 = "PowerBeats3,1";
            break;
          case 8197:
            uint64_t v25 = "BeatsX1,1";
            break;
          case 8198:
            uint64_t v25 = "BeatsSolo3,1";
            break;
          case 8201:
            uint64_t v25 = "BeatsStudio3,2";
            break;
          case 8202:
            uint64_t v25 = "Device1,8202";
            break;
          case 8203:
            uint64_t v25 = "PowerbeatsPro1,1";
            break;
          case 8204:
            uint64_t v25 = "BeatsSoloPro1,1";
            break;
          case 8205:
            uint64_t v25 = "Powerbeats4,1";
            break;
          case 8206:
            uint64_t v25 = "AirPodsPro1,1";
            break;
          case 8207:
            uint64_t v25 = "AirPods1,3";
            break;
          case 8208:
            uint64_t v25 = "Device1,8208";
            break;
          case 8209:
            uint64_t v25 = "BeatsStudioBuds1,1";
            break;
          case 8210:
            uint64_t v25 = "Device1,8210";
            break;
          case 8211:
            uint64_t v25 = "Device1,8211";
            break;
          case 8212:
            uint64_t v25 = "Device1,8212";
            break;
          case 8213:
            uint64_t v25 = "Device1,8213";
            break;
          case 8214:
            uint64_t v25 = "BeatsStudioBuds1,2";
            break;
          case 8215:
            uint64_t v25 = "BeatsStudioPro1,1";
            break;
          case 8216:
            uint64_t v25 = "Device1,8216";
            break;
          case 8217:
            uint64_t v25 = "Device1,8217";
            break;
          case 8218:
            uint64_t v25 = "Device1,8218";
            break;
          case 8219:
            uint64_t v25 = "Device1,8219";
            break;
          case 8220:
            uint64_t v25 = "Device1,8220";
            break;
          case 8221:
            uint64_t v25 = "Device1,8221";
            break;
          case 8222:
            uint64_t v25 = "Device1,8222";
            break;
          case 8223:
            uint64_t v25 = "Device1,8223";
            break;
          case 8224:
            uint64_t v25 = "Device1,8224";
            break;
          case 8228:
            uint64_t v25 = "Device1,8228";
            break;
          case 8229:
            uint64_t v25 = "Device1,8229";
            break;
          case 8230:
            uint64_t v25 = "Device1,8230";
            break;
          default:
            goto LABEL_79;
        }

        goto LABEL_80;
      }

      switch(v24)
      {
        case 0:
          uint64_t v25 = "Invalid";
          goto LABEL_80;
        case 614:
          uint64_t v25 = "ATVRemote1,1";
          goto LABEL_80;
        case 621:
          uint64_t v25 = "ATVRemote1,2";
          goto LABEL_80;
      }

- (void)_updateMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  -[AAServicesDaemon _playChime:](self, "_playChime:", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _OWORD v11[2] = sub_100015BF8;
  v11[3] = &unk_1002067E8;
  v11[4] = self;
  int v12 = v6;
  __int128 v9 = *(_OWORD *)&a4->var0[4];
  v10[0] = *(_OWORD *)a4->var0;
  v10[1] = v9;
  -[AAServicesDaemon _processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:]( self,  "_processBannerRequestForMuteAction:auditToken:bundleIdentifier:completion:",  v6,  v10,  v8,  v11);
}

- (void)_avSystemControllerServerReset
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015DC4;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_deregisterFromAVSystemControllerDeathNotifications
{
  if (self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _deregisterFromAVSystemControllerDeathNotifications]",  30LL,  "Deregistering from AVSystemController_ServerConnectionDiedNotification");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

    self->_avSystemControllerServerDeathNotificationRegistered = 0;
  }

- (void)_deregisterFromAVSystemControllerStateNotifications
{
  if (self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _deregisterFromAVSystemControllerStateNotifications]",  30LL,  "Deregistering from AVSystemController_CallIsActiveDidChangeNotification");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = AVSystemController_CallIsActiveDidChangeNotification;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    [v3 removeObserver:self name:v4 object:v5];

    self->_avSystemControllerStateNotificationRegistered = 0;
  }

- (void)_registerForAVSystemControllerDeathNotifications
{
  if (!self->_avSystemControllerServerDeathNotificationRegistered)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _registerForAVSystemControllerDeathNotifications]",  30LL,  "Registering for AVSystemController_ServerConnectionDiedNotification");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_avSystemControllerServerReset" name:AVSystemController_ServerConnectionDiedNotification object:0];

    self->_avSystemControllerServerDeathNotificationRegistered = 1;
  }

- (void)_registerForAVSystemControllerStateNotifications
{
  if (!self->_avSystemControllerStateNotificationRegistered)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesDaemon _registerForAVSystemControllerStateNotifications]",  30LL,  "Registering for AVSystemController_CallIsActiveDidChangeNotification");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    uint64_t v8 = AVSystemController_CallIsActiveDidChangeNotification;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v6 = AVSystemController_CallIsActiveDidChangeNotification;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    [v5 addObserver:self selector:"_handleCallIsActiveDidChangeNotification:" name:v6 object:v7];

    self->_avSystemControllerStateNotificationRegistered = 1;
  }

- (void).cxx_destruct
{
}

@end