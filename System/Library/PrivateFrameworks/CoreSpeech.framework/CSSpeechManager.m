@interface CSSpeechManager
+ (id)sharedManager;
+ (id)sharedManagerForCoreSpeechDaemon;
- (BOOL)_isAVVCRefChannelAvailable;
- (BOOL)_prepareForBluetoothDeviceWithDeviceType:(unint64_t)a3;
- (BOOL)_shouldSetupSelfTrigger;
- (BOOL)isExclaveHardware;
- (CSAdBlockerProviding)adBlocker;
- (CSAdBlockerStoreManager)adBlockerStoreManager;
- (CSAudioRecorder)audioRecorder;
- (CSAudioTapProvider)audioTapProvider;
- (CSBuiltInVoiceTrigger)voiceTrigger;
- (CSContinuousAudioFingerprintProvider)fingerprintProvider;
- (CSFallbackAudioSessionReleaseProvider)fallbackAudioSessionReleaseProvider;
- (CSKeywordDetector)keywordDetector;
- (CSMyriadPHash)myriad;
- (CSMyriadSelfTriggerCoordinator)myriadSelfTriggerCoordinator;
- (CSOpportuneSpeakListnerTestService)opportuneSpeakListnerTestService;
- (CSPostBuildInstallService)postBuildInstallService;
- (CSPreMyriadCoordinator)preMyriadCoordinator;
- (CSRemoraAdBlocker)remoraAdBlocker;
- (CSSelfTriggerController)selfTriggerController;
- (CSSmartSiriVolumeManager)ssvManager;
- (CSSpeechManager)init;
- (CSSpeechManager)initWithExclaveHardware:(BOOL)a3 assetHandler:(id)a4;
- (CSVoiceProfileRetrainManager)voiceTriggerRetrainer;
- (CSVoiceTriggerAssetHandler)assetHandler;
- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator;
- (CSVoiceTriggerFileLogger)voiceTriggerFileLogger;
- (CSVoiceTriggerFirstPassHearst)voiceTriggerFirstPassHearst;
- (CSVoiceTriggerFirstPassHearstAP)voiceTriggerFirstPassHearstAP;
- (CSVoiceTriggerFirstPassJarvis)voiceTriggerFirstPassJarvis;
- (CSVoiceTriggerFirstPassJarvisAP)voiceTriggerFirstPassJarvisAP;
- (CSVoiceTriggerFirstPassRemora)voiceTriggerFirstPassRemora;
- (NSMutableDictionary)audioProviders;
- (OS_dispatch_queue)assetQueryQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)voiceTriggerQueue;
- (OS_dispatch_source)clearLoggingFileTimer;
- (id)_getAudioRecorderWithError:(id *)a3;
- (id)_myriadSelfTriggerCoordinatorIfNeeded:(BOOL)a3;
- (id)_preMyriadCoordinatorCreateIfNeeded:(BOOL)a3;
- (id)_voiceTriggerEventNotifierCreateIfNeeded:(BOOL)a3;
- (id)_voiceTriggerFileLoggerCreateIfNeeded:(BOOL)a3;
- (id)audioFingerprintProvider;
- (id)audioProviderWithContext:(id)a3 error:(id *)a4;
- (id)audioProviderWithStreamID:(unint64_t)a3;
- (id)audioProviderWithUUID:(id)a3;
- (id)clientController;
- (id)fetchFallbackAudioSessionReleaseProvider;
- (int64_t)clearLoggingFileTimerCount;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_createClearLoggingFileTimer;
- (void)_getVoiceTriggerAssetIfNeeded:(id)a3;
- (void)_handleClearLoggingFileTimer;
- (void)_prepareRemoraDeviceWithConnectedDeviceIds:(id)a3;
- (void)_reinitializeSmartSiriVolumeWithAsset:(id)a3;
- (void)_reinitializeVoiceTriggerIfNeeded;
- (void)_reinitializeVoiceTriggerWithAsset:(id)a3;
- (void)_setAssetForBuiltInVoiceTrigger:(id)a3 completion:(id)a4;
- (void)_setupForBluetoothDeviceIfNeededWithDeviceType:(unint64_t)a3 prepareCompletion:(id)a4 completion:(id)a5;
- (void)_setupForHearstIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4;
- (void)_setupForJarvisIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4;
- (void)_setupForRemoraIfNeededWithCompletion:(id)a3;
- (void)_setupSpeakerRecognitionWithVTAsset:(id)a3;
- (void)_setupVoiceTriggerWithCompletion:(id)a3;
- (void)_startAllClients;
- (void)_startClearLoggingFilesTimer;
- (void)_startForBluetoothDeviceWithDeviceType:(unint64_t)a3 asset:(id)a4;
- (void)_startVoiceTrigger;
- (void)_teardownForBluetoothDevice;
- (void)_updateBuiltInTriggerForPreMyriadIfNeeded:(id)a3;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)audioProviderInvalidated:(id)a3 streamHandleId:(unint64_t)a4;
- (void)audioRecorderWillBeDestroyed:(id)a3;
- (void)dealloc;
- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4;
- (void)registerSiriClientProxy:(id)a3;
- (void)registerSpeechController:(id)a3;
- (void)setAdBlocker:(id)a3;
- (void)setAdBlockerStoreManager:(id)a3;
- (void)setAssetHandler:(id)a3;
- (void)setAssetQueryQueue:(id)a3;
- (void)setAudioProviders:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioTapProvider:(id)a3;
- (void)setClearLoggingFileTimer:(id)a3;
- (void)setClearLoggingFileTimerCount:(int64_t)a3;
- (void)setClientController:(id)a3;
- (void)setFallbackAudioSessionReleaseProvider:(id)a3;
- (void)setFingerprintProvider:(id)a3;
- (void)setIsExclaveHardware:(BOOL)a3;
- (void)setKeywordDetector:(id)a3;
- (void)setMyriad:(id)a3;
- (void)setMyriadSelfTriggerCoordinator:(id)a3;
- (void)setOpportuneSpeakListnerTestService:(id)a3;
- (void)setPostBuildInstallService:(id)a3;
- (void)setPreMyriadCoordinator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoraAdBlocker:(id)a3;
- (void)setSelfTriggerController:(id)a3;
- (void)setSsvManager:(id)a3;
- (void)setVoiceTrigger:(id)a3;
- (void)setVoiceTriggerEventsCoordinator:(id)a3;
- (void)setVoiceTriggerFileLogger:(id)a3;
- (void)setVoiceTriggerFirstPassHearst:(id)a3;
- (void)setVoiceTriggerFirstPassHearstAP:(id)a3;
- (void)setVoiceTriggerFirstPassJarvis:(id)a3;
- (void)setVoiceTriggerFirstPassJarvisAP:(id)a3;
- (void)setVoiceTriggerFirstPassRemora:(id)a3;
- (void)setVoiceTriggerQueue:(id)a3;
- (void)setVoiceTriggerRetrainer:(id)a3;
- (void)startManager;
- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
@end

@implementation CSSpeechManager

- (CSSpeechManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CSSpeechManager;
  v3 = -[CSSpeechManager init](&v25, "init");
  v4 = v3;
  if (v3)
  {
    CSLogInitIfNeeded(v3);
    id v6 = objc_msgSend((id)objc_opt_class(v4, v5), "description");
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (const char *)[v7 UTF8String];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2(v8, 0LL, v10);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("CSSpeechManager Asset Query Queue", 0LL);
    assetQueryQueue = v4->_assetQueryQueue;
    v4->_assetQueryQueue = (OS_dispatch_queue *)v13;

    uint64_t v17 = CSIsHorseman(v15, v16);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    audioProviders = v4->_audioProviders;
    v4->_audioProviders = (NSMutableDictionary *)v19;

    audioTapProvider = v4->_audioTapProvider;
    v4->_audioTapProvider = 0LL;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[CSPostBuildInstallService sharedService](&OBJC_CLASS___CSPostBuildInstallService, "sharedService"));
    postBuildInstallService = v4->_postBuildInstallService;
    v4->_postBuildInstallService = (CSPostBuildInstallService *)v22;

    -[CSPostBuildInstallService registerPostBuildInstallService]( v4->_postBuildInstallService,  "registerPostBuildInstallService");
    v4->_isExclaveHardware = +[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware");
    v4->_assetHandler = (CSVoiceTriggerAssetHandler *) +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler");
  }

  kdebug_trace(722472196LL, 0LL, 0LL, 0LL, 0LL);
  return v4;
}

- (CSSpeechManager)initWithExclaveHardware:(BOOL)a3 assetHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = -[CSSpeechManager init](self, "init");
  -[CSSpeechManager setIsExclaveHardware:](v7, "setIsExclaveHardware:", v4);
  if (v6) {
    -[CSSpeechManager setAssetHandler:](v7, "setAssetHandler:", v6);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSSpeechManager;
  -[CSSpeechManager dealloc](&v4, "dealloc");
}

- (void)startManager
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v13 = "-[CSSpeechManager startManager]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001191F8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
  -[CSSpeechManager _startClearLoggingFilesTimer](self, "_startClearLoggingFilesTimer");
  if (+[CSUtils supportHearstVoiceTrigger](&OBJC_CLASS___CSUtils, "supportHearstVoiceTrigger"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSDeviceActivationEventNotificationHandler sharedInstance]( &OBJC_CLASS___CSDeviceActivationEventNotificationHandler,  "sharedInstance"));
    [v5 setDelegate:self forType:2];

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDeviceActivationEventNotificationHandler sharedInstance]( &OBJC_CLASS___CSDeviceActivationEventNotificationHandler,  "sharedInstance"));
    [v6 setDelegate:self forType:3];
  }

  if (+[CSUtils supportRemoraVoiceTrigger](&OBJC_CLASS___CSUtils, "supportRemoraVoiceTrigger"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDeviceActivationEventNotificationHandler sharedInstance]( &OBJC_CLASS___CSDeviceActivationEventNotificationHandler,  "sharedInstance"));
    [v7 setDelegate:self forType:8];
  }

  if (+[CSUtils supportJarvisVoiceTrigger](&OBJC_CLASS___CSUtils, "supportJarvisVoiceTrigger"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDeviceActivationEventNotificationHandler sharedInstance]( &OBJC_CLASS___CSDeviceActivationEventNotificationHandler,  "sharedInstance"));
    [v8 setDelegate:self forType:6];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakEventMonitor sharedInstance]( &OBJC_CLASS___CSOpportuneSpeakEventMonitor,  "sharedInstance"));
  [v9 addObserver:self];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v10 addObserver:self];

  +[CSAudioRecorder createSharedAudioSession](&OBJC_CLASS___CSAudioRecorder, "createSharedAudioSession");
}

- (CSAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (id)audioFingerprintProvider
{
  return self->_fingerprintProvider;
}

- (void)_getVoiceTriggerAssetIfNeeded:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001191E4;
  v6[3] = &unk_10022E1A8;
  id v3 = a3;
  id v7 = v3;
  objc_super v4 = objc_retainBlock(v6);
  if ((+[CSUtils isLocalVoiceTriggerAvailable](&OBJC_CLASS___CSUtils, "isLocalVoiceTriggerAvailable") & 1) != 0
    || +[CSUtils supportBluetoothDeviceVoiceTrigger]( &OBJC_CLASS___CSUtils,  "supportBluetoothDeviceVoiceTrigger"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
    [v5 getVoiceTriggerAssetWithEndpointId:0 completion:v4];
  }

  else
  {
    ((void (*)(void *, void, void))v4[2])(v4, 0LL, 0LL);
  }
}

- (id)_voiceTriggerEventNotifierCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_voiceTriggerEventsCoordinator)
  {
    objc_super v4 = (CSVoiceTriggerEventsCoordinator *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEventsCoordinator sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEventsCoordinator,  "sharedInstance"));
    voiceTriggerEventsCoordinator = self->_voiceTriggerEventsCoordinator;
    self->_voiceTriggerEventsCoordinator = v4;

    -[CSVoiceTriggerEventsCoordinator start](self->_voiceTriggerEventsCoordinator, "start");
    id v6 = self->_voiceTriggerEventsCoordinator;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
    -[CSVoiceTriggerEventsCoordinator registerObserver:](v6, "registerObserver:", v7);

    id WeakRetained = objc_loadWeakRetained(&self->_clientController);
    if (WeakRetained)
    {
      v9 = self->_voiceTriggerEventsCoordinator;
      id v10 = objc_loadWeakRetained(&self->_clientController);
      -[CSVoiceTriggerEventsCoordinator registerObserver:](v9, "registerObserver:", v10);
    }
  }

  return self->_voiceTriggerEventsCoordinator;
}

- (id)_preMyriadCoordinatorCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_preMyriadCoordinator)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___CSPreMyriadCoordinator);
    preMyriadCoordinator = self->_preMyriadCoordinator;
    self->_preMyriadCoordinator = v4;

    id v6 = self->_preMyriadCoordinator;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
    -[CSPreMyriadCoordinator setDelegate:](v6, "setDelegate:", v7);
  }

  return self->_preMyriadCoordinator;
}

- (id)_voiceTriggerFileLoggerCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_voiceTriggerFileLogger)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFileLogger);
    voiceTriggerFileLogger = self->_voiceTriggerFileLogger;
    self->_voiceTriggerFileLogger = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
    [v6 registerObserver:self->_voiceTriggerFileLogger];
  }

  return self->_voiceTriggerFileLogger;
}

- (id)_myriadSelfTriggerCoordinatorIfNeeded:(BOOL)a3
{
  if (a3 && !self->_myriadSelfTriggerCoordinator)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___CSMyriadSelfTriggerCoordinator);
    myriadSelfTriggerCoordinator = self->_myriadSelfTriggerCoordinator;
    self->_myriadSelfTriggerCoordinator = v4;
  }

  return self->_myriadSelfTriggerCoordinator;
}

- (void)_setupSpeakerRecognitionWithVTAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v6 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[CSSpeechManager _setupSpeakerRecognitionWithVTAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  int v8 = CSIsIOS(v6, v7);
  if (v4 && v8)
  {
    -[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:]( self->_voiceTriggerRetrainer,  "triggerVoiceProfileRetrainingWithAsset:",  v4);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
    id v10 = (CSVoiceProfileRetrainManager *)objc_claimAutoreleasedReturnValue( +[CSVoiceProfileRetrainManager sharedInstance]( &OBJC_CLASS___CSVoiceProfileRetrainManager,  "sharedInstance"));
    voiceTriggerRetrainer = self->_voiceTriggerRetrainer;
    self->_voiceTriggerRetrainer = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001190F4;
    v13[3] = &unk_10022E340;
    v13[4] = self;
    [v12 getSpeakerRecognitionAssetWithLanguage:v9 completion:v13];
  }
}

- (void)_setupVoiceTriggerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v6 = +[CSUtils isLocalVoiceTriggerAvailable](&OBJC_CLASS___CSUtils, "isLocalVoiceTriggerAvailable");
  if ((_DWORD)v6)
  {
    if (CSIsWatch(v6, v7))
    {
      int v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSecondPassFixedPriorityWatch));
      voiceTriggerQueue = (dispatch_queue_s *)self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v8;
    }

    else
    {
      id v10 = (OS_dispatch_queue *)dispatch_queue_create("VoiceTrigger Queue", 0LL);
      dispatch_queue_t v11 = self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v10;

      v12 = (dispatch_object_s *)self->_voiceTriggerQueue;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
      voiceTriggerQueue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_set_target_queue(v12, voiceTriggerQueue);
    }

    v14 = -[CSBuiltInVoiceTrigger initWithTargetQueue:withSpeechManager:]( objc_alloc(&OBJC_CLASS___CSBuiltInVoiceTrigger),  "initWithTargetQueue:withSpeechManager:",  self->_voiceTriggerQueue,  self);
    voiceTrigger = self->_voiceTrigger;
    self->_voiceTrigger = v14;

    if (+[CSUtils supportHomeKitAccessory](&OBJC_CLASS___CSUtils, "supportHomeKitAccessory"))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _preMyriadCoordinatorCreateIfNeeded:]( self,  "_preMyriadCoordinatorCreateIfNeeded:",  1LL));
      -[CSBuiltInVoiceTrigger setDelegate:](self->_voiceTrigger, "setDelegate:", v16);
      [v16 setBuiltInSeconPassProgressProvider:self->_voiceTrigger];
    }

    else
    {
      uint64_t v17 = self->_voiceTrigger;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
      -[CSBuiltInVoiceTrigger setDelegate:](v17, "setDelegate:", v16);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerXPCServiceProxy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerXPCServiceProxy,  "sharedInstance"));
    [v18 registerObserver:self->_voiceTrigger];
  }

  -[CSBuiltInVoiceTrigger setAdBlocker:](self->_voiceTrigger, "setAdBlocker:", self->_adBlocker);
  -[CSSpeechManager _startVoiceTrigger](self, "_startVoiceTrigger");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001187FC;
  v20[3] = &unk_10022D908;
  v20[4] = self;
  id v21 = v4;
  id v19 = v4;
  -[CSSpeechManager _getVoiceTriggerAssetIfNeeded:](self, "_getVoiceTriggerAssetIfNeeded:", v20);
}

- (BOOL)_shouldSetupSelfTrigger
{
  if (-[CSSpeechManager _isAVVCRefChannelAvailable](self, "_isAVVCRefChannelAvailable")) {
    return 1;
  }
  else {
    return +[CSUtils supportAudioTappingSelfTrigger]( &OBJC_CLASS___CSUtils,  "supportAudioTappingSelfTrigger");
  }
}

- (BOOL)_isAVVCRefChannelAvailable
{
  else {
    return +[CSUtils supportSelfTriggerSuppression:refChannelIdx:]( &OBJC_CLASS___CSUtils,  "supportSelfTriggerSuppression:refChannelIdx:",  +[CSConfig inputRecordingNumberOfChannels]( &OBJC_CLASS___CSConfig,  "inputRecordingNumberOfChannels"),  +[CSConfig channelForOutputReference](&OBJC_CLASS___CSConfig, "channelForOutputReference"));
  }
}

- (void)_startVoiceTrigger
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSSpeechManager _startVoiceTrigger]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s VoiceTrigger will be started",  (uint8_t *)&v4,  0xCu);
  }

  -[CSVoiceTriggerAssetHandler registerObserver:](self->_assetHandler, "registerObserver:", self);
  -[CSBuiltInVoiceTrigger start](self->_voiceTrigger, "start");
}

- (void)_startAllClients
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSSpeechManager _startAllClients]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Starting all clients", (uint8_t *)&v5, 0xCu);
  }

  -[CSSelfTriggerController start](self->_selfTriggerController, "start");
  -[CSAdBlockerStoreManager start](self->_adBlockerStoreManager, "start");
  id v4 = +[CSVoiceTriggerRejectReporter sharedInstance](&OBJC_CLASS___CSVoiceTriggerRejectReporter, "sharedInstance");
}

- (void)registerSpeechController:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSSpeechManager registerSpeechController:]";
    __int16 v9 = 2050;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s speechController = %{public}p",  (uint8_t *)&v7,  0x16u);
  }

  -[CSVoiceTriggerEventsCoordinator registerObserver:](self->_voiceTriggerEventsCoordinator, "registerObserver:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _myriadSelfTriggerCoordinatorIfNeeded:]( self,  "_myriadSelfTriggerCoordinatorIfNeeded:",  -[CSSpeechManager _shouldSetupSelfTrigger](self, "_shouldSetupSelfTrigger")));
  [v6 setDelegate:v4];
  objc_storeWeak(&self->_clientController, v4);
}

- (void)registerSiriClientProxy:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSSpeechManager registerSiriClientProxy:]";
    __int16 v9 = 2050;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s xpcListener = %{public}p",  (uint8_t *)&v7,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
  [v6 registerObserver:v4];
}

- (id)audioProviderWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100117EB4;
  uint64_t v16 = sub_100117EC4;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100118704;
  block[3] = &unk_10022D958;
  block[4] = self;
  id v10 = v4;
  dispatch_queue_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)audioProviderWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSpeechManager audioProviderWithContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v23 = sub_100117EB4;
  v24 = sub_100117EC4;
  id v25 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100117EB4;
  v20 = sub_100117EC4;
  id v21 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001181D0;
  v12[3] = &unk_10022D9A8;
  v12[4] = self;
  uint64_t v14 = &v16;
  id v9 = v6;
  id v13 = v9;
  uint64_t v15 = buf;
  dispatch_sync(queue, v12);
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

- (id)audioProviderWithStreamID:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100117EB4;
  dispatch_queue_t v11 = sub_100117EC4;
  id v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100117F20;
  block[3] = &unk_10022D9D0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)fetchFallbackAudioSessionReleaseProvider
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100117EB4;
  id v10 = sub_100117EC4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100117ECC;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getAudioRecorderWithError:(id *)a3
{
  if (self->_audioRecorder)
  {
    id v5 = 0LL;
    if (a3) {
LABEL_3:
    }
      *a3 = v5;
  }

  else
  {
    id v26 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecorderFactory audioRecorderWithQueue:error:]( &OBJC_CLASS___CSAudioRecorderFactory,  "audioRecorderWithQueue:error:",  0LL,  &v26));
    id v5 = v26;
    if (!v8)
    {
      uint64_t v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v20 = v9;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSSpeechManager _getAudioRecorderWithError:]";
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Failed to create audio recorder : %{public}@",  buf,  0x16u);
      }
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviders](self, "audioProviders", 0LL));
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v14);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviders](self, "audioProviders"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          [v17 setAudioRecorder:v8];
          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v12);
    }

    -[CSFallbackAudioSessionReleaseProvider setAudioRecorder:]( self->_fallbackAudioSessionReleaseProvider,  "setAudioRecorder:",  v8);
    [v8 registerObserver:self];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioSessionMonitor sharedInstance](&OBJC_CLASS___CSAudioSessionMonitor, "sharedInstance"));
    [v8 setAudioSessionEventDelegate:v18];

    audioRecorder = self->_audioRecorder;
    self->_audioRecorder = (CSAudioRecorder *)v8;

    if (a3) {
      goto LABEL_3;
    }
  }

  uint64_t v6 = self->_audioRecorder;

  return v6;
}

- (void)audioProviderInvalidated:(id)a3 streamHandleId:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100117CC8;
  block[3] = &unk_10022E7F8;
  id v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100117BF4;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSSpeechManager voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Received VoiceTrigger cached asset change notification, let's reinitialize VoiceTrigger",  (uint8_t *)&v7,  0xCu);
  }

  -[CSSpeechManager _reinitializeVoiceTriggerIfNeeded](self, "_reinitializeVoiceTriggerIfNeeded");
}

- (void)_reinitializeVoiceTriggerIfNeeded
{
  assetQueryQueue = (dispatch_queue_s *)self->_assetQueryQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100117A30;
  v4[3] = &unk_10022E920;
  objc_copyWeak(&v5, &location);
  dispatch_async(assetQueryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setAssetForBuiltInVoiceTrigger:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100117808;
  v25[3] = &unk_10022DA20;
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  id v9 = v7;
  id v27 = v9;
  id v10 = objc_retainBlock(v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10011785C;
  v22[3] = &unk_10022DA20;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  uint64_t v13 = objc_retainBlock(v22);
  uint64_t v14 = v13;
  if (self->_isExclaveHardware)
  {
    if ((objc_opt_respondsToSelector(self->_assetHandler, "mapAssetToExclaveKit:completion:") & 1) != 0)
    {
      assetHandler = self->_assetHandler;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1001178AC;
      v19[3] = &unk_10022DA70;
      v19[4] = self;
      v20 = v10;
      id v21 = v14;
      -[CSVoiceTriggerAssetHandler mapAssetToExclaveKit:completion:]( assetHandler,  "mapAssetToExclaveKit:completion:",  v11,  v19);
    }

    else
    {
      uint64_t v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = self->_assetHandler;
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:]";
        __int16 v30 = 2112;
        v31 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Asset handler %@ does not support mapping asset to EK. This is a critical error",  buf,  0x16u);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  118LL,  0LL));
      ((void (*)(void *, void *))v10[2])(v10, v17);
    }
  }

  else
  {
    ((void (*)(void *, void))v13[2])(v13, 0LL);
  }
}

- (void)_reinitializeVoiceTriggerWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[CSSpeechManager _reinitializeVoiceTriggerWithAsset:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s new asset available, change to new model",  buf,  0xCu);
  }

  if (v4)
  {
    -[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:]( self,  "_setAssetForBuiltInVoiceTrigger:completion:",  v4,  0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
    [v6 resetVTEstimationStatistics];

    if (+[CSUtils supportBluetoothDeviceVoiceTrigger]( &OBJC_CLASS___CSUtils,  "supportBluetoothDeviceVoiceTrigger"))
    {
      -[CSVoiceTriggerFirstPassHearstAP setAsset:](self->_voiceTriggerFirstPassHearstAP, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassHearst setAsset:](self->_voiceTriggerFirstPassHearst, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassJarvis setAsset:](self->_voiceTriggerFirstPassJarvis, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassJarvisAP setAsset:](self->_voiceTriggerFirstPassJarvisAP, "setAsset:", v4);
    }

    if (+[CSUtils supportRemoraVoiceTrigger](&OBJC_CLASS___CSUtils, "supportRemoraVoiceTrigger"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001177F8;
      v10[3] = &unk_10022DA98;
      v10[4] = self;
      [v7 getConnectedDeviceIds:v10];
    }

    -[CSSelfTriggerController setAsset:](self->_selfTriggerController, "setAsset:", v4);
    -[CSKeywordDetector setAsset:](self->_keywordDetector, "setAsset:", v4);
    id v8 = -[CSSpeechManager _reinitializeSmartSiriVolumeWithAsset:](self, "_reinitializeSmartSiriVolumeWithAsset:", v4);
    if ((CSIsCommunalDevice(v8, v9) & 1) == 0) {
      -[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:]( self->_voiceTriggerRetrainer,  "triggerVoiceProfileRetrainingWithAsset:",  v4);
    }
  }
}

- (void)_reinitializeSmartSiriVolumeWithAsset:(id)a3
{
  ssvManager = self->_ssvManager;
  if (ssvManager) {
    -[CSSmartSiriVolumeManager setAsset:](ssvManager, "setAsset:", a3);
  }
}

- (void)_handleClearLoggingFileTimer
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v3 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    int v7 = 136315138;
    id v8 = "-[CSSpeechManager _handleClearLoggingFileTimer]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Trying to start clear logging files",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = CSIsHorseman(v3, v4);
  if ((_DWORD)v5)
  {
    +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
    +[CSAudioFileManager removeLogFilesOlderThanNDays:]( &OBJC_CLASS___CSAudioFileManager,  "removeLogFilesOlderThanNDays:");
  }

  else if (CSIsIOS(v5, v6))
  {
    +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
    +[CSAudioFileManager removeOpportunisticAudioLoggingOlderThanNDays:]( &OBJC_CLASS___CSAudioFileManager,  "removeOpportunisticAudioLoggingOlderThanNDays:");
    +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
    +[CSAudioFileManager removeRemoteP2PLogFilesOlderThanNDays:]( &OBJC_CLASS___CSAudioFileManager,  "removeRemoteP2PLogFilesOlderThanNDays:");
  }

- (void)_createClearLoggingFileTimer
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[CSSpeechManager _createClearLoggingFileTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  self->_clearLoggingFileTimerCount = 0LL;
  uint64_t v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  clearLoggingFileTimer = self->_clearLoggingFileTimer;
  self->_clearLoggingFileTimer = v4;

  dispatch_time_t v6 = dispatch_time(0LL, 0LL);
  dispatch_source_set_timer((dispatch_source_t)self->_clearLoggingFileTimer, v6, 0x274A48C00000uLL, 0LL);
  int v7 = self->_clearLoggingFileTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001177F0;
  handler[3] = &unk_10022F100;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
}

- (void)_startClearLoggingFilesTimer
{
  if (self->_clearLoggingFileTimer)
  {
    BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_time_t v6 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }

    if (self->_clearLoggingFileTimerCount < 1)
    {
      dispatch_resume((dispatch_object_t)self->_clearLoggingFileTimer);
      ++self->_clearLoggingFileTimerCount;
    }

    else
    {
      uint64_t v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315138;
        dispatch_time_t v6 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Clear logging file timer is already started, ignore startClearLoggingFilesTimer request.",  (uint8_t *)&v5,  0xCu);
      }
    }
  }

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100117484;
  v15[3] = &unk_10022E288;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100117298;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_setupForHearstIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSSpeechManager _setupForHearstIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s setup VoiceTrigger due to Hearst connection",  (uint8_t *)&v9,  0xCu);
  }

  -[CSSpeechManager _setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:]( self,  "_setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:",  0LL,  v6,  v7);
}

- (void)_setupForJarvisIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSSpeechManager _setupForJarvisIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s setup VoiceTrigger due to Jarvis connection",  (uint8_t *)&v9,  0xCu);
  }

  -[CSSpeechManager _setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:]( self,  "_setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:",  1LL,  v6,  v7);
}

- (void)_setupForRemoraIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[CSSpeechManager _setupForRemoraIfNeededWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s setup VoiceTrigger due to remora connection",  buf,  0xCu);
  }

  -[CSVoiceTriggerFirstPassRemora setRemoraAdBlocker:]( self->_voiceTriggerFirstPassRemora,  "setRemoraAdBlocker:",  self->_remoraAdBlocker);
  -[CSVoiceTriggerFirstPassRemora setAdblocker:](self->_voiceTriggerFirstPassRemora, "setAdblocker:", self->_adBlocker);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011718C;
  v8[3] = &unk_10022DB00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getConnectedDeviceIds:v8];
}

- (void)_updateBuiltInTriggerForPreMyriadIfNeeded:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_voiceTrigger)
  {
    if ([v4 count]) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _preMyriadCoordinatorCreateIfNeeded:]( self,  "_preMyriadCoordinatorCreateIfNeeded:",  1LL));
    }
    else {
      id v6 = 0LL;
    }
    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      id v9 = "-[CSSpeechManager _updateBuiltInTriggerForPreMyriadIfNeeded:]";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Setting up builtin trigger second pass progress delegate to %@ (active devices %@)",  (uint8_t *)&v8,  0x20u);
    }

    -[CSBuiltInVoiceTrigger setSecondPassProgressDelegate:](self->_voiceTrigger, "setSecondPassProgressDelegate:", v6);
  }
}

- (void)_setupForBluetoothDeviceIfNeededWithDeviceType:(unint64_t)a3 prepareCompletion:(id)a4 completion:(id)a5
{
  int v8 = (void (**)(void))a4;
  id v9 = (void (**)(void))a5;
  unsigned int v10 = -[CSSpeechManager _prepareForBluetoothDeviceWithDeviceType:]( self,  "_prepareForBluetoothDeviceWithDeviceType:",  a3);
  if (v8) {
    v8[2](v8);
  }
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001170A4;
    v11[3] = &unk_10022DB50;
    v11[4] = self;
    unint64_t v13 = a3;
    __int16 v12 = v9;
    -[CSSpeechManager _getVoiceTriggerAssetIfNeeded:](self, "_getVoiceTriggerAssetIfNeeded:", v11);
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (BOOL)_prepareForBluetoothDeviceWithDeviceType:(unint64_t)a3
{
  id v5 = -[CSSpeechManager _voiceTriggerFileLoggerCreateIfNeeded:](self, "_voiceTriggerFileLoggerCreateIfNeeded:", 1LL);
  if (a3 == 1)
  {
    voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
    LOBYTE(v7) = voiceTriggerFirstPassJarvis == 0LL;
    if (!voiceTriggerFirstPassJarvis)
    {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFirstPassJarvis);
      id v16 = self->_voiceTriggerFirstPassJarvis;
      self->_voiceTriggerFirstPassJarvis = v15;

      -[CSVoiceTriggerFirstPassJarvis start](self->_voiceTriggerFirstPassJarvis, "start");
      id v17 = self->_voiceTriggerFirstPassJarvis;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
      -[CSVoiceTriggerFirstPassJarvis setDelegate:](v17, "setDelegate:", v18);
    }

    if (!self->_voiceTriggerFirstPassJarvisAP)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFirstPassJarvisAP);
      voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
      self->_voiceTriggerFirstPassJarvisAP = v19;

      -[CSVoiceTriggerFirstPassJarvisAP start](self->_voiceTriggerFirstPassJarvisAP, "start");
      unint64_t v7 = (unint64_t)self->_voiceTriggerFirstPassJarvisAP;
      goto LABEL_12;
    }
  }

  else
  {
    if (a3)
    {
      LOBYTE(v7) = 0;
      return v7;
    }

    voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
    unint64_t v7 = voiceTriggerFirstPassHearst == 0LL;
    if (!voiceTriggerFirstPassHearst)
    {
      int v8 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFirstPassHearst);
      id v9 = self->_voiceTriggerFirstPassHearst;
      self->_voiceTriggerFirstPassHearst = v8;

      -[CSVoiceTriggerFirstPassHearst start](self->_voiceTriggerFirstPassHearst, "start");
      unsigned int v10 = self->_voiceTriggerFirstPassHearst;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
      -[CSVoiceTriggerFirstPassHearst setDelegate:](v10, "setDelegate:", v11);
    }

    if (+[CSUtils supportOpportuneSpeakListener](&OBJC_CLASS___CSUtils, "supportOpportuneSpeakListener")
      && !self->_voiceTriggerFirstPassHearstAP)
    {
      __int16 v12 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFirstPassHearstAP);
      voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
      self->_voiceTriggerFirstPassHearstAP = v12;

      -[CSVoiceTriggerFirstPassHearstAP start](self->_voiceTriggerFirstPassHearstAP, "start");
      unint64_t v7 = (unint64_t)self->_voiceTriggerFirstPassHearstAP;
LABEL_12:
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:]( self,  "_voiceTriggerEventNotifierCreateIfNeeded:",  1LL));
      [(id)v7 setDelegate:v21];

      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (void)_startForBluetoothDeviceWithDeviceType:(unint64_t)a3 asset:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    uint64_t v7 = 21LL;
    uint64_t v8 = 20LL;
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    uint64_t v7 = 19LL;
    uint64_t v8 = 18LL;
LABEL_5:
    id v9 = v6;
    -[objc_class setAsset:]((&self->super.isa)[v8], "setAsset:", v6);
    -[objc_class setAsset:]((&self->super.isa)[v7], "setAsset:", v9);
    id v6 = v9;
  }
}

- (void)_prepareRemoraDeviceWithConnectedDeviceIds:(id)a3
{
  if (!self->_voiceTriggerFirstPassRemora)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerFirstPassRemora);
    voiceTriggerFirstPassRemora = self->_voiceTriggerFirstPassRemora;
    self->_voiceTriggerFirstPassRemora = v5;

    -[CSVoiceTriggerFirstPassRemora start](self->_voiceTriggerFirstPassRemora, "start");
    -[CSVoiceTriggerFirstPassRemora setConnectedDeviceIds:]( self->_voiceTriggerFirstPassRemora,  "setConnectedDeviceIds:",  v4);

    id v7 = (id)objc_claimAutoreleasedReturnValue( -[CSSpeechManager _preMyriadCoordinatorCreateIfNeeded:]( self,  "_preMyriadCoordinatorCreateIfNeeded:",  1LL));
    -[CSVoiceTriggerFirstPassRemora setDelegate:](self->_voiceTriggerFirstPassRemora, "setDelegate:", v7);
    -[CSVoiceTriggerFirstPassRemora setSecondPassProgressDelegate:]( self->_voiceTriggerFirstPassRemora,  "setSecondPassProgressDelegate:",  v7);
    [v7 setRemoraSecondPassProgressProvider:self->_voiceTriggerFirstPassRemora];
  }

- (void)_teardownForBluetoothDevice
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CSSpeechManager _teardownForBluetoothDevice]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Teardown VoiceTrigger due to bluetooth device disconnection",  (uint8_t *)&v8,  0xCu);
  }

  -[CSVoiceTriggerFirstPassHearst setDelegate:](self->_voiceTriggerFirstPassHearst, "setDelegate:", 0LL);
  voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
  self->_voiceTriggerFirstPassHearst = 0LL;

  -[CSVoiceTriggerFirstPassJarvis setDelegate:](self->_voiceTriggerFirstPassJarvis, "setDelegate:", 0LL);
  voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
  self->_voiceTriggerFirstPassJarvis = 0LL;

  -[CSVoiceTriggerFirstPassHearstAP setDelegate:](self->_voiceTriggerFirstPassHearstAP, "setDelegate:", 0LL);
  voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
  self->_voiceTriggerFirstPassHearstAP = 0LL;

  -[CSVoiceTriggerFirstPassJarvisAP setDelegate:](self->_voiceTriggerFirstPassJarvisAP, "setDelegate:", 0LL);
  voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
  self->_voiceTriggerFirstPassJarvisAP = 0LL;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100116EC8;
  block[3] = &unk_10022ECA8;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4
{
}

- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager", a3, a4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100116DD0;
  v6[3] = &unk_10022DA98;
  void v6[4] = self;
  [v5 getConnectedDeviceIds:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)assetQueryQueue
{
  return self->_assetQueryQueue;
}

- (void)setAssetQueryQueue:(id)a3
{
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
}

- (NSMutableDictionary)audioProviders
{
  return self->_audioProviders;
}

- (void)setAudioProviders:(id)a3
{
}

- (void)setAudioTapProvider:(id)a3
{
}

- (CSFallbackAudioSessionReleaseProvider)fallbackAudioSessionReleaseProvider
{
  return self->_fallbackAudioSessionReleaseProvider;
}

- (void)setFallbackAudioSessionReleaseProvider:(id)a3
{
}

- (id)clientController
{
  return objc_loadWeakRetained(&self->_clientController);
}

- (void)setClientController:(id)a3
{
}

- (OS_dispatch_queue)voiceTriggerQueue
{
  return self->_voiceTriggerQueue;
}

- (void)setVoiceTriggerQueue:(id)a3
{
}

- (CSBuiltInVoiceTrigger)voiceTrigger
{
  return self->_voiceTrigger;
}

- (void)setVoiceTrigger:(id)a3
{
}

- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator
{
  return self->_voiceTriggerEventsCoordinator;
}

- (void)setVoiceTriggerEventsCoordinator:(id)a3
{
}

- (CSPreMyriadCoordinator)preMyriadCoordinator
{
  return self->_preMyriadCoordinator;
}

- (void)setPreMyriadCoordinator:(id)a3
{
}

- (CSVoiceTriggerFileLogger)voiceTriggerFileLogger
{
  return self->_voiceTriggerFileLogger;
}

- (void)setVoiceTriggerFileLogger:(id)a3
{
}

- (CSSelfTriggerController)selfTriggerController
{
  return self->_selfTriggerController;
}

- (void)setSelfTriggerController:(id)a3
{
}

- (CSKeywordDetector)keywordDetector
{
  return self->_keywordDetector;
}

- (void)setKeywordDetector:(id)a3
{
}

- (CSMyriadPHash)myriad
{
  return self->_myriad;
}

- (void)setMyriad:(id)a3
{
}

- (CSMyriadSelfTriggerCoordinator)myriadSelfTriggerCoordinator
{
  return self->_myriadSelfTriggerCoordinator;
}

- (void)setMyriadSelfTriggerCoordinator:(id)a3
{
}

- (CSVoiceTriggerFirstPassJarvis)voiceTriggerFirstPassJarvis
{
  return self->_voiceTriggerFirstPassJarvis;
}

- (void)setVoiceTriggerFirstPassJarvis:(id)a3
{
}

- (CSVoiceTriggerFirstPassJarvisAP)voiceTriggerFirstPassJarvisAP
{
  return self->_voiceTriggerFirstPassJarvisAP;
}

- (void)setVoiceTriggerFirstPassJarvisAP:(id)a3
{
}

- (CSVoiceTriggerFirstPassHearst)voiceTriggerFirstPassHearst
{
  return self->_voiceTriggerFirstPassHearst;
}

- (void)setVoiceTriggerFirstPassHearst:(id)a3
{
}

- (CSVoiceTriggerFirstPassHearstAP)voiceTriggerFirstPassHearstAP
{
  return self->_voiceTriggerFirstPassHearstAP;
}

- (void)setVoiceTriggerFirstPassHearstAP:(id)a3
{
}

- (CSVoiceTriggerFirstPassRemora)voiceTriggerFirstPassRemora
{
  return self->_voiceTriggerFirstPassRemora;
}

- (void)setVoiceTriggerFirstPassRemora:(id)a3
{
}

- (CSVoiceProfileRetrainManager)voiceTriggerRetrainer
{
  return self->_voiceTriggerRetrainer;
}

- (void)setVoiceTriggerRetrainer:(id)a3
{
}

- (OS_dispatch_source)clearLoggingFileTimer
{
  return self->_clearLoggingFileTimer;
}

- (void)setClearLoggingFileTimer:(id)a3
{
}

- (int64_t)clearLoggingFileTimerCount
{
  return self->_clearLoggingFileTimerCount;
}

- (void)setClearLoggingFileTimerCount:(int64_t)a3
{
  self->_clearLoggingFileTimerCount = a3;
}

- (CSOpportuneSpeakListnerTestService)opportuneSpeakListnerTestService
{
  return self->_opportuneSpeakListnerTestService;
}

- (void)setOpportuneSpeakListnerTestService:(id)a3
{
}

- (CSAdBlockerProviding)adBlocker
{
  return self->_adBlocker;
}

- (void)setAdBlocker:(id)a3
{
}

- (CSRemoraAdBlocker)remoraAdBlocker
{
  return self->_remoraAdBlocker;
}

- (void)setRemoraAdBlocker:(id)a3
{
}

- (CSAdBlockerStoreManager)adBlockerStoreManager
{
  return self->_adBlockerStoreManager;
}

- (void)setAdBlockerStoreManager:(id)a3
{
}

- (CSContinuousAudioFingerprintProvider)fingerprintProvider
{
  return self->_fingerprintProvider;
}

- (void)setFingerprintProvider:(id)a3
{
}

- (CSPostBuildInstallService)postBuildInstallService
{
  return self->_postBuildInstallService;
}

- (void)setPostBuildInstallService:(id)a3
{
}

- (CSSmartSiriVolumeManager)ssvManager
{
  return self->_ssvManager;
}

- (void)setSsvManager:(id)a3
{
}

- (CSVoiceTriggerAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setAssetHandler:(id)a3
{
  self->_assetHandler = (CSVoiceTriggerAssetHandler *)a3;
}

- (BOOL)isExclaveHardware
{
  return self->_isExclaveHardware;
}

- (void)setIsExclaveHardware:(BOOL)a3
{
  self->_isExclaveHardware = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  return 0LL;
}

+ (id)sharedManagerForCoreSpeechDaemon
{
  if (qword_1002800F8 != -1) {
    dispatch_once(&qword_1002800F8, &stru_10022D8A0);
  }
  return (id)qword_1002800F0;
}

@end