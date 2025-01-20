@interface PBSystemServiceConnection
+ (id)_activeConnectionsByProcessIdentifier;
+ (id)systemServiceConnectionForProcessIdentifier:(int)a3;
+ (void)_registerConnection:(id)a3;
- (BOOL)hiliteModeActive;
- (BOOL)sendMessagePresentNowPlayingUI;
- (NSString)clientBundleIdentifier;
- (NSXPCConnection)remoteConnection;
- (PBSystemServiceConnection)init;
- (PBSystemServiceConnection)initWithConnection:(id)a3;
- (PBSystemServiceNowPlayingDelegate)nowPlayingPresentationDelegate;
- (id)_clientBundleIdentifierFromConnection;
- (id)osUpdateService;
- (void)activateScreenSaver;
- (void)activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 reply:(id)a5;
- (void)activateScreenSaverWalkThrough;
- (void)activateScreenSaverWithPosterBundleID:(id)a3;
- (void)activateScreenSaverWithReply:(id)a3;
- (void)activateSiri;
- (void)deactivateApplication;
- (void)deactivateScreenSaver;
- (void)dealloc;
- (void)defaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3;
- (void)dismissEventMaskingWindowWithCompletion:(id)a3;
- (void)dismissSoftwareUpdateWindowWithCompletion:(id)a3;
- (void)dismissThermalAlertWithCompletion:(id)a3;
- (void)endpointForProviderType:(id)a3 withIdentifier:(id)a4 responseBlock:(id)a5;
- (void)fetchApplicationIdentifiersByBundleIdentifierMappingWithReply:(id)a3;
- (void)fetchDeviceIsAsleepWithResult:(id)a3;
- (void)fetchDisabledAdamIDsWithReply:(id)a3;
- (void)fetchEnforceProvisioningOnSystemAppsEnabledWithReply:(id)a3;
- (void)fetchHintStatusWithCompletion:(id)a3;
- (void)fetchPairedAppleRemoteStateWithReply:(id)a3;
- (void)fetchProvisionAppIdentifiersWithReply:(id)a3;
- (void)fetchSceneContainsSearchViewStatusWithCompletion:(id)a3;
- (void)fetchSceneSystemInputActiveStatusWithCompletion:(id)a3;
- (void)getAppInfoServiceProxyWithReply:(id)a3;
- (void)getBulletinServiceProxyWithReply:(id)a3;
- (void)getDisplayManagerServiceProxyWithReply:(id)a3;
- (void)getMediaRemoteServiceProxyWithReply:(id)a3;
- (void)getOSUpdateServiceProxyWithReply:(id)a3;
- (void)getStoreFrontCountryCodeWithReply:(id)a3;
- (void)getUserPresentationServiceProxyWithReply:(id)a3;
- (void)handleShowHomeIntentWithFilters:(id)a3 time:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)kioskAppBundleIdentifierWithReply:(id)a3;
- (void)launchCRDApp;
- (void)launchKioskApp;
- (void)noteHintShown:(unint64_t)a3;
- (void)pairAppleRemote:(BOOL)a3 withReply:(id)a4;
- (void)performScreenActionWithName:(id)a3 forItemIdentifier:(id)a4 parameters:(id)a5 reply:(id)a6;
- (void)presentAirDropPromptForDiagnosticFileWithOptions:(id)a3;
- (void)presentControlCenterAVEffectsWithCompletion:(id)a3;
- (void)presentControlCenterFaceTimePanelWithCompletion:(id)a3;
- (void)presentControlCenterRoutePickerWithCompletion:(id)a3;
- (void)presentControlCenterSleepTimerPanelWithCompletion:(id)a3;
- (void)presentControlCenterUserPickerWithCompletion:(id)a3;
- (void)presentEventMaskingWindowWithCompletion:(id)a3;
- (void)presentNowPlayingWithOptions:(id)a3 completion:(id)a4;
- (void)presentSoftwareUpdateWithOptions:(id)a3 completion:(id)a4;
- (void)presentSystemRoutingUIWithOptions:(id)a3 completion:(id)a4;
- (void)presentThermalAlertWithCompletion:(id)a3;
- (void)purgeTopShelfContentForApplicationIdentifiers:(id)a3;
- (void)reboot;
- (void)recentApplicationBundleIdentifiersWithReply:(id)a3;
- (void)registerNowPlayingDelegate:(id)a3;
- (void)registerServiceProviderEndpoint:(id)a3 forProviderType:(id)a4;
- (void)relaunch;
- (void)resume;
- (void)sendMenuButtonEvent;
- (void)setAirPlayActive:(BOOL)a3;
- (void)setHiliteModeActive:(BOOL)a3;
- (void)setKioskAppBundleIdentifier:(id)a3;
- (void)setNextAssistantRecognitionStrings:(id)a3;
- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3;
- (void)setNowPlayingPresentationDelegate:(id)a3;
- (void)setSleepTimeout:(double)a3;
- (void)setSystemAppearance:(int64_t)a3;
- (void)setWantsPlayPauseButtonEvents:(BOOL)a3;
- (void)setWantsVolumeButtonEvents:(BOOL)a3;
- (void)showVolumeHUDForRouteType:(int64_t)a3 withLevel:(id)a4;
- (void)showVolumeHUDWithImageName:(id)a3 level:(id)a4;
- (void)sleepSystemForReason:(id)a3;
- (void)sleepTimeoutWithReply:(id)a3;
- (void)startSiriListening;
- (void)stopSiriListening;
- (void)systemAppearanceWithReply:(id)a3;
- (void)takeScreenshotWithReply:(id)a3;
- (void)topActiveOrActivatingApplicationIdentifierWithReply:(id)a3;
- (void)wakeSystemForReason:(id)a3;
- (void)wakeSystemForReason:(id)a3 reply:(id)a4;
@end

@implementation PBSystemServiceConnection

- (PBSystemServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___PBSystemServiceConnection;
  v6 = -[PBSystemServiceConnection init](&v58, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteConnection, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSSystemServiceInterface_Internal));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___INHomeFilter);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v10,  objc_opt_class(&OBJC_CLASS___INDateComponentsRange),  0LL);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v55 = v8;
    [v8 setClasses:v53 forSelector:"handleShowHomeIntentWithFilters:time:completion:" argumentIndex:0 ofReply:0];
    [v8 setClasses:v53 forSelector:"handleShowHomeIntentWithFilters:time:completion:" argumentIndex:1 ofReply:0];
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSAppInfoServiceInterface));
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___PBSAppInfo);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___PBSAppInfoControllerUpdate);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___PBSAppInfoConfiguration);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSSet);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSMapTable);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v54 = v5;
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSURL);
    v57 = v7;
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSAppInfoDelegateServiceInterface));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSAppInfoServiceInterface));
    [v51 setInterface:v52 forSelector:"appInfoServiceDidUpdateAppInfo:" argumentIndex:0 ofReply:0];
    [v56 setInterface:v51 forSelector:"setServiceDelegate:" argumentIndex:0 ofReply:0];
    [v56 setClasses:v50 forSelector:"appInfoUpdatesWithReply:" argumentIndex:0 ofReply:1];
    uint64_t v22 = PBSBulletinServiceXPCInterface( [v55 setInterface:v56 forSelector:"getAppInfoServiceProxyWithReply:" argumentIndex:0 ofReply:1]);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v55 setInterface:v49 forSelector:"getBulletinServiceProxyWithReply:" argumentIndex:0 ofReply:1];
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSOSUpdateServiceInterface));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSOSUpdateServiceDelegate));
    [v47 setInterface:v48 forSelector:"setDelegate:" argumentIndex:0 ofReply:0];
    [v47 setInterface:v48 forSelector:"setManagerClientDelegate:" argumentIndex:0 ofReply:0];
    [v55 setInterface:v47 forSelector:"getOSUpdateServiceProxyWithReply:" argumentIndex:0 ofReply:1];
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____PBSMediaRemoteServiceInternalInterface));
    [v55 setInterface:v46 forSelector:"getMediaRemoteServiceProxyWithReply:" argumentIndex:0 ofReply:1];
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSystemServiceNowPlayingDelegate));
    [v55 setInterface:v45 forSelector:"registerNowPlayingDelegate:" argumentIndex:0 ofReply:0];
    v59[0] = objc_opt_class(&OBJC_CLASS___PBSUserPresentationRequest);
    v59[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v59[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    v59[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v59[4] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v59[5] = objc_opt_class(&OBJC_CLASS___NSError);
    v59[6] = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 7LL));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSUserPresentationServiceInterface));
    [v43 setClasses:v44 forSelector:"presentUIWithRequest:completion:" argumentIndex:0 ofReply:0];
    [v43 setClasses:v44 forSelector:"messageUIWithRequest:message:reply:" argumentIndex:0 ofReply:0];
    [v43 setClasses:v44 forSelector:"messageUIWithRequest:message:reply:" argumentIndex:1 ofReply:0];
    [v43 setClasses:v44 forSelector:"dismissUIWithRequest:" argumentIndex:0 ofReply:0];
    [v55 setInterface:v43 forSelector:"getUserPresentationServiceProxyWithReply:" argumentIndex:0 ofReply:1];
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___PBSDisplayManagerUpdateRequest);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___PBSDisplayAssistantPresentationRequest);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___PBSDisplayMode);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSError);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSSet);
    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNull);
    uint64_t v42 = v28;
    id v5 = v54;
    v34 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v24,  v25,  v26,  v27,  v42,  v29,  v30,  v31,  v32,  v33,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSDisplayManagerServiceInterface));
    [v36 setClasses:v35 forSelector:"updateDisplayManagerWithRequest:reply:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"updateDisplayManagerWithRequest:reply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"updateDisplayManagerWithRequest:reply:" argumentIndex:1 ofReply:1];
    [v36 setClasses:v35 forSelector:"sleepDisplayWithReply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"sleepDisplayWithReply:" argumentIndex:1 ofReply:1];
    [v36 setClasses:v35 forSelector:"wakeDisplayWithReply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"wakeDisplayWithReply:" argumentIndex:1 ofReply:1];
    [v36 setClasses:v35 forSelector:"handleRegionChangeWithNewCountryCode:reply:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"handleRegionChangeWithNewCountryCode:reply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"handleRegionChangeWithNewCountryCode:reply:" argumentIndex:1 ofReply:1];
    [v36 setClasses:v35 forSelector:"presentDisplayAssistantWithRequest:reply:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"presentDisplayAssistantWithRequest:reply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"presentDisplayAssistantWithRequest:reply:" argumentIndex:1 ofReply:1];
    [v36 setClasses:v35 forSelector:"displayAssistantDidStartForKind:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"displayAssistantDidCompleteForKind:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"setAudioLatency:forKey:" argumentIndex:0 ofReply:0];
    [v36 setClasses:v35 forSelector:"setAudioLatency:forKey:" argumentIndex:1 ofReply:0];
    [v36 setClasses:v35 forSelector:"fetchCurrentDisplayStateWithReply:" argumentIndex:0 ofReply:1];
    [v36 setClasses:v35 forSelector:"fetchCurrentDisplayStateWithReply:" argumentIndex:1 ofReply:1];
    [v55 setInterface:v36 forSelector:"getDisplayManagerServiceProxyWithReply:" argumentIndex:0 ofReply:1];
    -[NSXPCConnection setExportedInterface:](v57->_remoteConnection, "setExportedInterface:", v55);
    -[NSXPCConnection setExportedObject:](v57->_remoteConnection, "setExportedObject:", v57);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSystemServiceClientInterface));
    -[NSXPCConnection setRemoteObjectInterface:](v57->_remoteConnection, "setRemoteObjectInterface:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemServiceConnection _clientBundleIdentifierFromConnection]( v57,  "_clientBundleIdentifierFromConnection"));
    v39 = (NSString *)[v38 copy];
    clientBundleIdentifier = v57->_clientBundleIdentifier;
    v57->_clientBundleIdentifier = v39;

    v7 = v57;
    +[PBSystemServiceConnection _registerConnection:]( &OBJC_CLASS___PBSystemServiceConnection,  "_registerConnection:",  v57);
  }

  return v7;
}

- (PBSystemServiceConnection)init
{
  return 0LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBServiceProviderRegistry sharedInstance](&OBJC_CLASS___PBServiceProviderRegistry, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
  [v3 clearEndpointsForIdentifier:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSystemServiceConnection;
  -[PBSystemServiceConnection dealloc](&v5, "dealloc");
}

+ (id)_activeConnectionsByProcessIdentifier
{
  if (qword_1004712D8 != -1) {
    dispatch_once(&qword_1004712D8, &stru_1003DB458);
  }
  return (id)qword_1004712D0;
}

+ (void)_registerConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBSystemServiceConnection);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_sync_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeConnectionsByProcessIdentifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteConnection]);
    id v9 = [v8 processIdentifier];

    if ((_DWORD)v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v10]);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
      [v7 setObject:v4 forKey:v12];
    }

    else
    {
      v11 = 0LL;
    }

    objc_sync_exit(v6);
    [v11 invalidate];
  }
}

+ (id)systemServiceConnectionForProcessIdentifier:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBSystemServiceConnection);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_sync_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeConnectionsByProcessIdentifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

    objc_sync_exit(v6);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)resume
{
}

- (void)invalidate
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___PBSystemServiceConnection);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemServiceConnection _activeConnectionsByProcessIdentifier]( &OBJC_CLASS___PBSystemServiceConnection,  "_activeConnectionsByProcessIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v7 = [v6 processIdentifier];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  id v9 = (PBSystemServiceConnection *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v8]);

  if (v9 == self)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    [v5 removeObjectForKey:v10];
  }

  objc_sync_exit(v4);
  -[PBBulletinService invalidate](self->_bulletinService, "invalidate");
  -[PBOSUpdateService invalidate](self->_osUpdateService, "invalidate");
  -[PBOverlayLayoutService invalidate](self->_overlayLayoutService, "invalidate");
}

- (id)osUpdateService
{
  return self->_osUpdateService;
}

- (void)registerNowPlayingDelegate:(id)a3
{
}

- (void)deactivateApplication
{
}

- (void)sleepSystemForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-sleep"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001AF3A0;
    v10[3] = &unk_1003CFEB8;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(&_dispatch_main_q, v10);
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028BC94(self);
    }
  }
}

- (void)wakeSystemForReason:(id)a3
{
}

- (void)wakeSystemForReason:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-wake"]);

  if (v9
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && [v9 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AF564;
    block[3] = &unk_1003D2F08;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v11 = sub_1000842C0();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10028BD0C(self);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)fetchDeviceIsAsleepWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AF68C;
    block[3] = &unk_1003D0110;
    id v9 = (os_log_s *)v4;
    dispatch_async(&_dispatch_main_q, block);
    id v6 = v9;
  }

  else
  {
    id v7 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10028BD84(self);
    }
  }
}

- (void)relaunch
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.appletv.pbs.allow-relaunch"]);

  if (v4
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    && [v4 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AF7D0;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v6 = sub_1000842C0();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10028BDFC(self);
    }
  }
}

- (void)reboot
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.appletv.pbs.allow-reboot"]);

  if (v4
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    && [v4 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AF914;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v6 = sub_1000842C0();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10028BE74(self);
    }
  }
}

- (void)setSleepTimeout:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-sleep-timeout"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001AFA68;
    v10[3] = &unk_1003D05A8;
    v10[4] = self;
    *(double *)&void v10[5] = a3;
    dispatch_async(&_dispatch_main_q, v10);
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028BEEC(self);
    }
  }
}

- (void)sleepTimeoutWithReply:(id)a3
{
  id v4 = (void (**)(void, double))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-sleep-timeout"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001AFBE8;
      block[3] = &unk_1003D0110;
      id v11 = v4;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028BF64(self);
    }

    v4[2](v4, 0.0);
  }
}

- (void)activateScreenSaver
{
}

- (void)activateScreenSaverWalkThrough
{
}

- (void)activateScreenSaverWithPosterBundleID:(id)a3
{
}

- (void)activateScreenSaverWithReply:(id)a3
{
}

- (void)activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForEntitlement:@"com.apple.appletv.pbs.allow-screen-saver"]);

    if (v14
      && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      && [v14 BOOLValue])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1001AFEC8;
      v18[3] = &unk_1003DB4A0;
      v18[4] = self;
      unint64_t v21 = a3;
      id v19 = v8;
      id v20 = v9;
      dispatch_async(&_dispatch_main_q, v18);
    }

    else
    {
      id v16 = sub_1000842C0();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10028BFDC(self);
      }

      if (v9) {
        (*((void (**)(id, void))v9 + 2))(v9, 0LL);
      }
    }
  }

  else
  {
    id v10 = sub_1000842C0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Screen saver activation by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)deactivateScreenSaver
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-screen-saver"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B00C8;
      block[3] = &unk_1003CFF08;
      void block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v8 = sub_1000842C0();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10028C054(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Screen saver deactivation by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)setAirPlayActive:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.airplay-service-access"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B0210;
    block[3] = &unk_1003D3530;
    BOOL v11 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028C0CC(self);
    }
  }
}

- (void)launchCRDApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.appletv.pbs.allow-conference-room-display"]);

  if (v4
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    && [v4 BOOLValue])
  {
    dispatch_async(&_dispatch_main_q, &stru_1003DB4C0);
  }

  else
  {
    id v6 = sub_1000842C0();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10028C144(self);
    }
  }
}

- (void)presentSystemRoutingUIWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B0484;
    block[3] = &unk_1003D0110;
    id v10 = v5;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v6 = sub_1000842C0();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Present system routing UI by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v5) {
      (*((void (**)(id, void))v5 + 2))(v5, 0LL);
    }
  }
}

- (void)presentNowPlayingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 valueForEntitlement:@"com.apple.appletv.pbs.allow-now-playing-presentation"]);

    if (v12
      && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      && [v12 BOOLValue])
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1001B06D8;
      v16[3] = &unk_1003D0070;
      uint64_t v17 = (os_log_s *)v6;
      id v18 = v7;
      dispatch_async(&_dispatch_main_q, v16);

      id v14 = v17;
    }

    else
    {
      if (v7) {
        (*((void (**)(id, void))v7 + 2))(v7, 0LL);
      }
      id v15 = sub_1000842C0();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10028C1BC(self);
      }
    }
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Present now playing by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)presentControlCenterUserPickerWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.cc-user-picker"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    dispatch_async(&_dispatch_main_q, &stru_1003DB4E0);
    if (v4)
    {
      uint64_t v8 = 1LL;
LABEL_10:
      v4[2](v4, v8);
    }
  }

  else
  {
    id v9 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028C234(self);
    }

    if (v4)
    {
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }
  }
}

- (void)presentControlCenterAVEffectsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.av-effects"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    dispatch_async(&_dispatch_main_q, &stru_1003DB500);
    if (v4)
    {
      uint64_t v8 = 1LL;
LABEL_10:
      v4[2](v4, v8);
    }
  }

  else
  {
    id v9 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028C2AC(self);
    }

    if (v4)
    {
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }
  }
}

- (void)presentControlCenterFaceTimePanelWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.cc-facetime-panel"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    dispatch_async(&_dispatch_main_q, &stru_1003DB520);
    if (v4)
    {
      uint64_t v8 = 1LL;
LABEL_10:
      v4[2](v4, v8);
    }
  }

  else
  {
    id v9 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028C324(self);
    }

    if (v4)
    {
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }
  }
}

- (void)presentControlCenterRoutePickerWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  dispatch_async(&_dispatch_main_q, &stru_1003DB540);
  if (v3) {
    v3[2](v3, 1LL);
  }
}

- (void)presentControlCenterSleepTimerPanelWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.cc-sleep-timer-panel"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    dispatch_async(&_dispatch_main_q, &stru_1003DB560);
    if (v4)
    {
      uint64_t v8 = 1LL;
LABEL_10:
      v4[2](v4, v8);
    }
  }

  else
  {
    id v9 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028C39C(self);
    }

    if (v4)
    {
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }
  }
}

- (void)noteHintShown:(unint64_t)a3
{
  id v5 = sub_1000842C0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028C414(self, a3, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBHintManager sharedInstance](&OBJC_CLASS___PBHintManager, "sharedInstance"));
  [v7 noteHintShown:a3];
}

- (void)fetchHintStatusWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = sub_1000842C0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028C4C0(self);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBHintManager sharedInstance](&OBJC_CLASS___PBHintManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hintStatus]);
  v4[2](v4, v8);
}

- (void)presentThermalAlertWithCompletion:(id)a3
{
  id v4 = a3;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-thermal-alert-presentation"]);

    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      && [v9 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B0F00;
      block[3] = &unk_1003D0110;
      id v14 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      BOOL v11 = v14;
    }

    else
    {
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      id v12 = sub_1000842C0();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028C538(self);
      }
    }
  }

  else
  {
    id v5 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Present thermal window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)dismissThermalAlertWithCompletion:(id)a3
{
  id v4 = a3;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-thermal-alert-presentation"]);

    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      && [v9 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B1150;
      block[3] = &unk_1003D0110;
      id v14 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      BOOL v11 = v14;
    }

    else
    {
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      id v12 = sub_1000842C0();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028C5B0(self);
      }
    }
  }

  else
  {
    id v5 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismiss thermal window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)presentEventMaskingWindowWithCompletion:(id)a3
{
  id v4 = a3;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-event-masking-window-presentation"]);

    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      && [v9 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B13A0;
      block[3] = &unk_1003D0110;
      id v14 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      BOOL v11 = v14;
    }

    else
    {
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      id v12 = sub_1000842C0();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028C628(self);
      }
    }
  }

  else
  {
    id v5 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Present event masking window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)dismissEventMaskingWindowWithCompletion:(id)a3
{
  id v4 = a3;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-event-masking-window-presentation"]);

    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      && [v9 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B15C8;
      block[3] = &unk_1003D0110;
      id v14 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      BOOL v11 = v14;
    }

    else
    {
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      id v12 = sub_1000842C0();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028C6A0(self);
      }
    }
  }

  else
  {
    id v5 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismiss event masking window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)presentSoftwareUpdateWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 valueForEntitlement:@"com.apple.appletv.pbs.allow-software-update-presentation"]);

    if (v10
      && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      && [v10 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B17F0;
      block[3] = &unk_1003D0110;
      id v15 = (os_log_s *)v5;
      dispatch_async(&_dispatch_main_q, block);
      id v12 = v15;
    }

    else
    {
      if (v5) {
        (*((void (**)(id, void))v5 + 2))(v5, 0LL);
      }
      id v13 = sub_1000842C0();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10028C718(self);
      }
    }
  }

  else
  {
    id v6 = sub_1000842C0();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Present software update window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v5) {
      (*((void (**)(id, void))v5 + 2))(v5, 0LL);
    }
  }
}

- (void)dismissSoftwareUpdateWindowWithCompletion:(id)a3
{
  id v4 = a3;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-software-update-presentation"]);

    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      && [v9 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B1AB8;
      block[3] = &unk_1003D0110;
      id v14 = (os_log_s *)v4;
      dispatch_async(&_dispatch_main_q, block);
      uint64_t v11 = v14;
    }

    else
    {
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
      id v12 = sub_1000842C0();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028C790(self);
      }
    }
  }

  else
  {
    id v5 = sub_1000842C0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismiss software update window by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)purgeTopShelfContentForApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-purge-topshelf"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    +[PBSystemService notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:]( &OBJC_CLASS___PBSystemService,  "notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:",  v4);
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028C808(self);
    }
  }
}

- (void)recentApplicationBundleIdentifiersWithReply:(id)a3
{
  id v4 = (void (**)(id, os_log_s *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-actions"]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.allow-recent-applications"]);

  if (!v6
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    || ([v6 BOOLValue] & 1) == 0)
  {
    if (!v8
      || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v10) & 1) == 0)
      || ![v8 BOOLValue])
    {
      id v13 = sub_1000842C0();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10028C880(self);
      }
      goto LABEL_11;
    }
  }

  if (v4)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 recentApplicationBundleIdentifiers]);

    v4[2](v4, v12);
LABEL_11:
  }
}

- (void)topActiveOrActivatingApplicationIdentifierWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-actions"]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.allow-active-application"]);

  if (!v6
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    || ([v6 BOOLValue] & 1) == 0)
  {
    if (!v8
      || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v10) & 1) == 0)
      || ![v8 BOOLValue])
    {
      id v17 = sub_1000842C0();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10028C8F8(self);
      }
      goto LABEL_11;
    }
  }

  if (v4)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 currentApplicationSceneHandle]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s clientProcessBundleIdentifier](v12, "clientProcessBundleIdentifier"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s scene](v12, "scene"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientProcess]);
    id v16 = [v15 pid];

    v4[2](v4, v13, v16);
LABEL_11:
  }
}

- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-actions"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B1FB8;
    block[3] = &unk_1003CFF08;
    uint64_t v11 = (os_log_s *)v4;
    dispatch_async(&_dispatch_main_q, block);
    id v8 = v11;
  }

  else
  {
    id v9 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028C970(self);
    }
  }
}

- (void)setNextAssistantRecognitionStrings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-actions"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B20FC;
    block[3] = &unk_1003CFF08;
    uint64_t v11 = (os_log_s *)v4;
    dispatch_async(&_dispatch_main_q, block);
    id v8 = v11;
  }

  else
  {
    id v9 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028C9E8(self);
    }
  }
}

- (void)performScreenActionWithName:(id)a3 forItemIdentifier:(id)a4 parameters:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-actions"]);

    if (v17
      && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v17, v19) & 1) != 0)
      && [v17 BOOLValue])
    {
      id v20 = sub_1000842C0();
      unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v31 = v10;
        __int16 v32 = 2114;
        id v33 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Trying to perform screen action %{public}@ on item: %{public}@",  buf,  0x16u);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001B243C;
      v25[3] = &unk_1003D32D8;
      id v26 = v11;
      id v27 = v10;
      id v28 = v12;
      id v29 = v13;
      dispatch_async(&_dispatch_main_q, v25);

      uint64_t v22 = v26;
    }

    else
    {
      id v23 = sub_1000842C0();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10028CA60(self);
      }

      if (!v13) {
        goto LABEL_17;
      }
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  101LL,  0LL));
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v22);
    }

LABEL_17:
    goto LABEL_18;
  }

  id v14 = sub_1000842C0();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    id v31 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Performing Siri action by %{public}@ ignored - system is asleep.",  buf,  0xCu);
  }

  if (v13)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  101LL,  0LL));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v17);
    goto LABEL_17;
  }

- (void)sendMenuButtonEvent
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-send-menu"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B27A8;
      block[3] = &unk_1003CFF08;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      id v8 = (os_log_s *)v11;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v9 = sub_1000842C0();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10028CB48(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Send menu request by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)systemAppearanceWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-user-interface-style-change"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    if (v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));

      if (v8)
      {
        id v9 = sub_1000842C0();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
          *(_DWORD *)buf = 138543362;
          id v17 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "System appearance requested by %{public}@",  buf,  0xCu);
        }
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B2A28;
      block[3] = &unk_1003D0110;
      id v15 = v4;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  else
  {
    id v12 = sub_1000842C0();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10028CBC0(self);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, -1LL);
  }
}

- (void)setSystemAppearance:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-user-interface-style-change"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));

    if (v8)
    {
      id v9 = sub_1000842C0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
        *(_DWORD *)buf = 134218242;
        int64_t v16 = a3;
        __int16 v17 = 2114;
        id v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "System appearance changed to %ld by %{public}@",  buf,  0x16u);
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B2C24;
    block[3] = &unk_1003D0680;
    void block[4] = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v12 = sub_1000842C0();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10028CC38(self);
    }
  }
}

- (void)kioskAppBundleIdentifierWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-kiosk-app"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B2D80;
      block[3] = &unk_1003D0110;
      id v11 = v4;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028CCB0(self);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)setKioskAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-kiosk-app"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B2EE4;
    v10[3] = &unk_1003CFEB8;
    id v11 = (os_log_s *)v4;
    id v12 = self;
    dispatch_async(&_dispatch_main_q, v10);
    id v8 = v11;
  }

  else
  {
    id v9 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028CD28(self);
    }
  }
}

- (void)takeScreenshotWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-screen-shot"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B30EC;
    block[3] = &unk_1003D0110;
    id v11 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    id v8 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028CDA0(self);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)handleShowHomeIntentWithFilters:(id)a3 time:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForEntitlement:@"com.apple.appletv.pbs.intent-handling"]);

  if (v11
    && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && [v11 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B32A0;
    block[3] = &unk_1003D6090;
    id v17 = v8;
    SEL v19 = a2;
    id v18 = v9;
    dispatch_async(&_dispatch_main_q, block);

    id v13 = v17;
  }

  else
  {
    id v14 = sub_1000842C0();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10028CE18(self);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  303LL,  0LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v13);
  }
}

- (void)presentAirDropPromptForDiagnosticFileWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-airdrop-diagnostic"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:PBSSystemServiceDiagnosticFilePathKey]);
    if (v8)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___PBIssueDataReporter);
      -[PBIssueDataReporter reportIssueDataAtPath:](v9, "reportIssueDataAtPath:", v8);
    }
  }

  else
  {
    id v10 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028CEF8(self);
    }
  }
}

- (void)activateSiri
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-activation"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      id v9 = (void *)objc_opt_new(&OBJC_CLASS___PBSMediaRemoteSiriContext);
      [v9 _setRequestorBundleID:v8];
      [v9 setSourceName:PBSMediaRemoteSiriContextSourceNameSystemService];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B3E30;
      block[3] = &unk_1003CFF08;
      id v13 = v9;
      id v10 = v9;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v11 = sub_1000842C0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10028CF70(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Activate Siri listening request by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)startSiriListening
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-activation"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      id v9 = (void *)objc_opt_new(&OBJC_CLASS___PBSMediaRemoteSiriContext);
      [v9 _setRequestorBundleID:v8];
      [v9 setSourceName:PBSMediaRemoteSiriContextSourceNameSystemService];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B4058;
      block[3] = &unk_1003CFF08;
      id v13 = v9;
      id v10 = v9;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v11 = sub_1000842C0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10028CFE8(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Start Siri listening request by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)stopSiriListening
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-siri-activation"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      id v9 = (void *)objc_opt_new(&OBJC_CLASS___PBSMediaRemoteSiriContext);
      [v9 _setRequestorBundleID:v8];
      [v9 setSourceName:PBSMediaRemoteSiriContextSourceNameSystemService];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B4280;
      block[3] = &unk_1003CFF08;
      id v13 = v9;
      id v10 = v9;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v11 = sub_1000842C0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10028D060(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Stop Siri listening request by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)launchKioskApp
{
  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 > (char *)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.allow-launch-kiosk"]);

    if (v4
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      && [v4 BOOLValue])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B4474;
      block[3] = &unk_1003CFF08;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      id v8 = (os_log_s *)v11;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v9 = sub_1000842C0();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10028D0D8(self);
      }
    }
  }

  else
  {
    id v3 = sub_1000842C0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Launch kiosk request by %{public}@ ignored - system is asleep.",  buf,  0xCu);
    }
  }
}

- (void)fetchProvisionAppIdentifiersWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);

  if (!v6
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    || ![v6 BOOLValue])
  {
    id v12 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028D1C0(self);
    }
    goto LABEL_8;
  }

  if (v4)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s appInfoControllerWithEverything](v8, "appInfoControllerWithEverything"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 provisionedAppBundleIdentifiers]);
    v4[2](v4, v11);

LABEL_8:
  }
}

- (void)fetchDisabledAdamIDsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);

  if (!v6
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    || ![v6 BOOLValue])
  {
    id v12 = sub_1000842C0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028D238(self);
    }
    goto LABEL_8;
  }

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 disabledApplicationIdentifiers]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allObjects](v9, "allObjects"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingSelector:"compare:"]);

    v4[2](v4, v11);
LABEL_8:
  }
}

- (void)fetchApplicationIdentifiersByBundleIdentifierMappingWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);

  if (!v6
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    || ![v6 BOOLValue])
  {
    id v10 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028D2B0(self);
    }
    goto LABEL_8;
  }

  if (v4)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s applicationIdentifiersByBundleIdentifierMapping]( v8,  "applicationIdentifiersByBundleIdentifierMapping"));
    v4[2](v4, v9);

LABEL_8:
  }
}

- (void)fetchEnforceProvisioningOnSystemAppsEnabledWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);

  if (!v6
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    || ![v6 BOOLValue])
  {
    id v9 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028D328(self);
    }
    goto LABEL_8;
  }

  if (v4)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v4[2](v4, -[os_log_s enforceProvisioningOnSystemAppsEnabled](v8, "enforceProvisioningOnSystemAppsEnabled"));
LABEL_8:
  }
}

- (void)fetchPairedAppleRemoteStateWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-remote-pairing"]);

  if (!v6
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    || ![v6 BOOLValue])
  {
    id v9 = sub_1000842C0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10028D3A0(self);
    }
    goto LABEL_8;
  }

  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B4A7C;
    block[3] = &unk_1003D0110;
    id v11 = (os_log_s *)v4;
    dispatch_async(&_dispatch_main_q, block);
    id v8 = v11;
LABEL_8:
  }
}

- (void)pairAppleRemote:(BOOL)a3 withReply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.allow-remote-pairing"]);

  if (v8
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && [v8 BOOLValue])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001B4BCC;
    v12[3] = &unk_1003D4980;
    BOOL v14 = a3;
    id v13 = (os_log_s *)v6;
    dispatch_async(&_dispatch_main_q, v12);
    id v10 = v13;
  }

  else
  {
    id v11 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028D418(self);
    }
  }
}

- (void)setWantsPlayPauseButtonEvents:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-custom-playpause"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B4D1C;
    v10[3] = &unk_1003D2008;
    BOOL v11 = a3;
    void v10[4] = self;
    dispatch_async(&_dispatch_main_q, v10);
  }

  else
  {
    id v8 = sub_1000842C0();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028D490(self);
    }
  }
}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.allow-custom-volume"]);

  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && [v6 BOOLValue])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B4E78;
    v10[3] = &unk_1003D2008;
    BOOL v11 = a3;
    void v10[4] = self;
    dispatch_async(&_dispatch_main_q, v10);
  }

  else
  {
    id v8 = sub_1000842C0();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028D508(self);
    }
  }
}

- (void)showVolumeHUDForRouteType:(int64_t)a3 withLevel:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.allow-volume-hud"]);

  if (v8
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && [v8 BOOLValue])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001B4FF4;
    v12[3] = &unk_1003D05A8;
    int64_t v14 = a3;
    id v13 = (os_log_s *)v6;
    dispatch_async(&_dispatch_main_q, v12);
    id v10 = v13;
  }

  else
  {
    id v11 = sub_1000842C0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10028D580(self);
    }
  }
}

- (void)showVolumeHUDWithImageName:(id)a3 level:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.appletv.pbs.allow-volume-hud"]);

  if (v9
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && [v9 BOOLValue])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001B5160;
    v13[3] = &unk_1003CFEB8;
    int64_t v14 = (os_log_s *)v6;
    id v15 = v7;
    dispatch_async(&_dispatch_main_q, v13);

    id v11 = v14;
  }

  else
  {
    id v12 = sub_1000842C0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10028D5F8(self);
    }
  }
}

- (void)getStoreFrontCountryCodeWithReply:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, void *))a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 locale]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCode]);

    v3[2](v3, v6);
  }

- (void)registerServiceProviderEndpoint:(id)a3 forProviderType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBServiceProviderRegistry sharedInstance](&OBJC_CLASS___PBServiceProviderRegistry, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
  [v8 registerEndpoint:v7 forIdentifier:v9 providerType:v6];
}

- (void)endpointForProviderType:(id)a3 withIdentifier:(id)a4 responseBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBServiceProviderRegistry sharedInstance](&OBJC_CLASS___PBServiceProviderRegistry, "sharedInstance"));
  [v10 endpointForIdentifier:v8 providerType:v9 responseBlock:v7];
}

- (void)getAppInfoServiceProxyWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.app-info-service-access"]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if (objc_opt_isKindOfClass(v6, v7) & 1) != 0 && ([v6 BOOLValue])
    {
      id v8 = v6;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);

      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0 || ([v8 BOOLValue] & 1) == 0)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
        unsigned int v12 = [v11 processIdentifier];
        pid_t v13 = getpid();

        if (v12 != v13)
        {
          id v21 = sub_1000842C0();
          int64_t v14 = (PBSystemServiceConnection *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
            sub_10028D670(self);
          }
          id v20 = 0LL;
          goto LABEL_14;
        }
      }
    }

    int64_t v14 = self;
    objc_sync_enter(v14);
    appInfoService = v14->_appInfoService;
    if (!appInfoService)
    {
      int64_t v16 = objc_alloc(&OBJC_CLASS___PBAppInfoService);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
      id v18 = -[PBAppInfoService initWithInfoStore:remoteConnection:]( v16,  "initWithInfoStore:remoteConnection:",  v17,  v14);
      SEL v19 = v14->_appInfoService;
      v14->_appInfoService = v18;

      appInfoService = v14->_appInfoService;
    }

    id v20 = appInfoService;
    objc_sync_exit(v14);
LABEL_14:

    v4[2](v4, v20);
  }
}

- (void)getBulletinServiceProxyWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.bulletin-service-access"]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && [v6 BOOLValue])
    {
      id v8 = self;
      objc_sync_enter(v8);
      bulletinService = v8->_bulletinService;
      if (!bulletinService)
      {
        uint64_t v10 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  v8);
        id v11 = v8->_bulletinService;
        v8->_bulletinService = v10;

        bulletinService = v8->_bulletinService;
      }

      unsigned int v12 = bulletinService;
      objc_sync_exit(v8);
    }

    else
    {
      id v13 = sub_1000842C0();
      id v8 = (PBSystemServiceConnection *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_10028D6F8(self);
      }
      unsigned int v12 = 0LL;
    }

    v4[2](v4, v12);
  }
}

- (void)getOSUpdateServiceProxyWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.osupdate-service-access"]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && [v6 BOOLValue])
    {
      id v8 = self;
      objc_sync_enter(v8);
      osUpdateService = v8->_osUpdateService;
      if (!osUpdateService)
      {
        uint64_t v10 = -[PBOSUpdateService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBOSUpdateService),  "initWithRemoteConnection:",  v8);
        id v11 = v8->_osUpdateService;
        v8->_osUpdateService = v10;

        osUpdateService = v8->_osUpdateService;
      }

      unsigned int v12 = osUpdateService;
      objc_sync_exit(v8);
    }

    else
    {
      id v13 = sub_1000842C0();
      id v8 = (PBSystemServiceConnection *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_10028D780(self);
      }
      unsigned int v12 = 0LL;
    }

    v4[2](v4, v12);
  }
}

- (void)getMediaRemoteServiceProxyWithReply:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = -[PBMediaRemoteService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBMediaRemoteService),  "initWithRemoteConnection:",  self);
    (*((void (**)(id, PBMediaRemoteService *))a3 + 2))(v5, v6);
  }

- (void)getUserPresentationServiceProxyWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.appletv.pbs.user-presentation-service-access"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v8 = v6;
    id v9 = v8;
    if (v7)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0LL;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    id v11 = v10;

    unsigned int v12 = [v11 BOOLValue];
    if ((v12 & 1) != 0) {
      goto LABEL_14;
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForEntitlement:@"com.apple.private.applemediaservices"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v16 = v14;
    id v17 = v16;
    if (v15) {
      id v18 = (objc_opt_isKindOfClass(v16, v15) & 1) != 0 ? v17 : 0LL;
    }
    else {
      id v18 = 0LL;
    }
    id v19 = v18;

    unsigned int v20 = [v19 BOOLValue];
    if (v20)
    {
LABEL_14:
      id v21 = self;
      objc_sync_enter(v21);
      userPresentationService = v21->_userPresentationService;
      if (!userPresentationService)
      {
        id v23 = -[PBUserPresentationService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBUserPresentationService),  "initWithRemoteConnection:",  v21);
        uint64_t v24 = v21->_userPresentationService;
        v21->_userPresentationService = v23;

        -[PBUserPresentationService setIsPaymentSheetOnlyService:]( v21->_userPresentationService,  "setIsPaymentSheetOnlyService:",  v12 ^ 1);
        userPresentationService = v21->_userPresentationService;
      }

      uint64_t v25 = userPresentationService;
      objc_sync_exit(v21);
    }

    else
    {
      id v26 = sub_1000842C0();
      id v21 = (PBSystemServiceConnection *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_10028D808(self);
      }
      uint64_t v25 = 0LL;
    }

    v4[2](v4, v25);
  }
}

- (void)getDisplayManagerServiceProxyWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    displayManagerService = v5->_displayManagerService;
    if (!displayManagerService)
    {
      uint64_t v7 = -[PBDisplayManagerService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBDisplayManagerService),  "initWithRemoteConnection:",  v5);
      id v8 = v5->_displayManagerService;
      v5->_displayManagerService = v7;

      displayManagerService = v5->_displayManagerService;
    }

    id v9 = displayManagerService;
    objc_sync_exit(v5);

    v4[2](v4, v9);
  }
}

- (void)fetchSceneContainsSearchViewStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000842C0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028D890(self);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B5B00;
  block[3] = &unk_1003D0110;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)fetchSceneSystemInputActiveStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000842C0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028D908(self);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B5C24;
  block[3] = &unk_1003D0110;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)defaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxy]);

  [v6 defaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:v4];
}

- (BOOL)sendMessagePresentNowPlayingUI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection nowPlayingPresentationDelegate](self, "nowPlayingPresentationDelegate"));
  id v3 = v2;
  if (v2) {
    [v2 systemServicePresentNowPlayingUI];
  }

  return v3 != 0LL;
}

- (id)_clientBundleIdentifierFromConnection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemServiceConnection remoteConnection](self, "remoteConnection"));
  id v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }

  uint64_t v4 = BSBundleIDForAuditToken(v10);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  id v7 = @"expired app";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v8 = v7;

  return v8;
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (PBSystemServiceNowPlayingDelegate)nowPlayingPresentationDelegate
{
  return self->_nowPlayingPresentationDelegate;
}

- (void)setNowPlayingPresentationDelegate:(id)a3
{
}

- (BOOL)hiliteModeActive
{
  return self->_hiliteModeActive;
}

- (void)setHiliteModeActive:(BOOL)a3
{
  self->_hiliteModeActive = a3;
}

- (void).cxx_destruct
{
}

@end