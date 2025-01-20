@interface APUIRouteManager
+ (unint64_t)discoveryFeatures:(BOOL)a3;
- (APUIRouteManager)init;
- (void)_addOutputDeviceToSystemMusicContext:(id)a3 authString:(id)a4 completion:(id)a5;
- (void)_createSilentConnectionToDevice:(id)a3 authString:(id)a4 completion:(id)a5;
- (void)_pickRouteWithID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6;
- (void)invalidate;
- (void)pickRouteWithRouteID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6;
- (void)session:(id)a3 didSpotOnLocationComplete:(id)a4;
- (void)startIntelligentRoutingLocationSensing;
@end

@implementation APUIRouteManager

- (APUIRouteManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___APUIRouteManager;
  v2 = -[APUIRouteManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("APUIRouteManager.queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("APUIRouteManager.notification", 0LL);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    if (APSSettingsIsFeatureEnabled(@"BrokeredDiscoveryRouteSuggestionSupport"))
    {
      dispatch_queue_t v7 = dispatch_queue_create("APUIRouteManager.intelligentRouting", 0LL);
      irQueue = v2->_irQueue;
      v2->_irQueue = (OS_dispatch_queue *)v7;
    }
  }

  if (dword_100015DA0 <= 50
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
  {
    LogPrintF(&dword_100015DA0, "-[APUIRouteManager init]", 33554482LL, "APUIRouteManager [%{ptr}] created.", v2);
  }

  return v2;
}

- (void)invalidate
{
}

- (void)_pickRouteWithID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v25 = a4;
  id v11 = a6;
  id v12 = objc_msgSend( [AVOutputDeviceDiscoverySession alloc],  "initWithDeviceFeatures:",  objc_msgSend((id)objc_opt_class(self), "discoveryFeatures:", v7));
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100003F40;
  v37 = sub_100003F50;
  id v38 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v15 = AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100003F58;
  v28[3] = &unk_100010460;
  v28[4] = self;
  id v16 = v12;
  id v29 = v16;
  v17 = (__CFString *)v10;
  v30 = v17;
  v32 = &v33;
  v18 = v13;
  v31 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 addObserverForName:v15 object:v16 queue:0 usingBlock:v28]);

  [v16 setDiscoveryMode:2];
  dispatch_time_t v20 = dispatch_time(0LL, 3000000000LL);
  if (dispatch_semaphore_wait(v18, v20))
  {
    if (dword_100015DA0 <= 90
      && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554522LL)))
    {
      else {
        v21 = v17;
      }
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]",  33554522LL,  "[%{ptr}] Failed to discover device with deviceID=%@ in %d seconds",  self,  v21,  3LL);
    }

    if (v11)
    {
      notificationQueue = self->_notificationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004534;
      block[3] = &unk_100010488;
      id v27 = v11;
      dispatch_async((dispatch_queue_t)notificationQueue, block);
    }
  }

  else
  {
    uint64_t v22 = v34[5];
    if (v7) {
      -[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]( self,  "_createSilentConnectionToDevice:authString:completion:",  v22,  v25,  v11);
    }
    else {
      -[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]( self,  "_addOutputDeviceToSystemMusicContext:authString:completion:",  v22,  v25,  v11);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v24 removeObserver:v19];

  [v16 setDiscoveryMode:0];
  _Block_object_dispose(&v33, 8);
}

- (void)pickRouteWithRouteID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_100015DA0 <= 50
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
  {
    else {
      dispatch_semaphore_t v13 = v10;
    }
    v14 = "Audio/Video";
    if (v7) {
      v14 = "Remote Control";
    }
    LogPrintF( &dword_100015DA0,  "-[APUIRouteManager pickRouteWithRouteID:authString:useRemoteControl:completion:]",  33554482LL,  "[%{ptr}] Picking route with routeID=%@ with %s",  self,  v13,  v14);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004708;
  block[3] = &unk_1000104B0;
  void block[4] = self;
  dispatch_time_t v20 = v10;
  BOOL v23 = v7;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  v18 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_addOutputDeviceToSystemMusicContext:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:AVOutputContextAddOutputDeviceOptionCancelIfAuthRequired];
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:AVOutputContextAddOutputDeviceOptionAuthorizationToken];
  }
  if (dword_100015DA0 <= 50
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceID]);
    if (v12 && !IsAppleInternalBuild())
    {
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]",  33554482LL,  "[%{ptr}] Found device with deviceID=%@. Start adding device to output context.",  self,  @"#Redacted#");
    }

    else
    {
      dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceID]);
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]",  33554482LL,  "[%{ptr}] Found device with deviceID=%@. Start adding device to output context.",  self,  v13);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[AVOutputContext sharedAudioPresentationOutputContext]( &OBJC_CLASS___AVOutputContext,  "sharedAudioPresentationOutputContext"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100004914;
  v17[3] = &unk_100010500;
  v17[4] = self;
  id v18 = v8;
  id v19 = v10;
  id v15 = v10;
  id v16 = v8;
  [v14 addOutputDevice:v16 options:v11 completionHandler:v17];
}

- (void)_createSilentConnectionToDevice:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired];
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:AVOutputContextAddOutputDeviceOptionAuthorizationToken];
  }
  uint64_t v12 = AVOutputDeviceCommunicationChannelDataDestinationFitness;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004D58;
  v15[3] = &unk_100010528;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v13 = v10;
  id v14 = v8;
  [v14 openCommunicationChannelToDestination:v12 options:v11 completionHandler:v15];
}

- (void)session:(id)a3 didSpotOnLocationComplete:(id)a4
{
  id v12 = a3;
  v6 = (NSError *)a4;
  if (v6) {
    int v7 = 50;
  }
  else {
    int v7 = 90;
  }
  if (v7 >= dword_100015DA0)
  {
    uint64_t v8 = v7 | 0x2000000u;
    if (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, v7 | 0x2000000u)) {
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager session:didSpotOnLocationComplete:]",  v8,  "[%{ptr}] IRSession [%{ptr}] setSpotOnLocation completed with %{error}",  self,  self->_irSession,  v6,  v12);
    }
  }

  id v9 = self;
  objc_sync_enter(v9);
  spotOnLocationError = v9->_spotOnLocationError;
  v9->_spotOnLocationError = v6;
  id v11 = v6;

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_spotOnLocationSemaphore);
}

- (void)startIntelligentRoutingLocationSensing
{
  if (APSSettingsIsFeatureEnabled(@"BrokeredDiscoveryRouteSuggestionSupport"))
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[IRServiceToken serviceTokenForServiceIdentifier:]( &OBJC_CLASS___IRServiceToken,  "serviceTokenForServiceIdentifier:",  @"com.apple.mediaremoted"));
    if (v3)
    {
      v4 = (void *)v3;
      id v5 = [[IRConfiguration alloc] initWithServiceToken:v3];
      [v5 setMode:0];
      v6 = objc_alloc_init(&OBJC_CLASS___IRSession);
      irSession = self->_irSession;
      self->_irSession = v6;

      -[IRSession setDelegate:](self->_irSession, "setDelegate:", self);
      -[IRSession runWithConfiguration:](self->_irSession, "runWithConfiguration:", v5);
      uint64_t v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
      spotOnLocationSemaphore = self->_spotOnLocationSemaphore;
      self->_spotOnLocationSemaphore = v8;

      id v10 = objc_alloc_init(&OBJC_CLASS___IRSessionSpotOnLocationParameters);
      [v10 setResetAllBrokerDiscoveredCandidates:1];
      if (dword_100015DA0 <= 50
        && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
      {
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager startIntelligentRoutingLocationSensing]",  33554482LL,  "[%{ptr}] IRSession [%{ptr}] setting spotOnLocation",  self,  self->_irSession);
      }

      -[IRSession setSpotOnLocationWithParameters:](self->_irSession, "setSpotOnLocationWithParameters:", v10);
      irQueue = self->_irQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000053F8;
      block[3] = &unk_100010550;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)irQueue, block);

      goto LABEL_14;
    }

    APSLogErrorAt(0LL, "-[APUIRouteManager startIntelligentRoutingLocationSensing]", 286LL, 0LL);
    if (dword_100015DA0 > 90)
    {
      v4 = 0LL;
      id v5 = 0LL;
      goto LABEL_20;
    }

    if (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554522LL)) {
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager startIntelligentRoutingLocationSensing]",  33554522LL,  "APUIRouteManager [%{ptr}] failed to get IRServiceToken.",  self);
    }
  }

  id v5 = 0LL;
  v4 = 0LL;
LABEL_14:
  if (dword_100015DA0 <= 50
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
  {
    id v12 = "created";
    if (!self->_irSession) {
      id v12 = "failed to create";
    }
    LogPrintF( &dword_100015DA0,  "-[APUIRouteManager startIntelligentRoutingLocationSensing]",  33554482LL,  "[%{ptr}] %s IRSession [%{ptr}] with IRServiceToken [%{ptr}].",  self,  v12,  self->_irSession,  v4);
  }

+ (unint64_t)discoveryFeatures:(BOOL)a3
{
  if (a3) {
    return 8LL;
  }
  else {
    return 5LL;
  }
}

- (void).cxx_destruct
{
}

@end