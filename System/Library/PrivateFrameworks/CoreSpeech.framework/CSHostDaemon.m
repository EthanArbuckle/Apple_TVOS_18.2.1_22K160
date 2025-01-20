@interface CSHostDaemon
+ (id)sharedDaemon;
- (CESRXPCActivity)cesrXPCActvity;
- (CSAttSiriManager)attSiriManager;
- (CSAudioInjectionXPCListener)audioInjectionXpcListener;
- (CSAudioPowerServiceListener)audioPowerServiceListener;
- (CSBenchmarkXPCListener)benchmarkXpcListener;
- (CSCoreSpeechServicesListener)corespeechServiceListener;
- (CSDarwinVoiceTriggerHandlerPool)darwinVoiceTriggerHandlerPool;
- (CSDeviceActivationXPCListener)activationXpcListener;
- (CSHostDaemon)init;
- (CSPDispatcher)cspDispatcher;
- (CSSpeechManager)speechManager;
- (CSSpeechModelTrainingXPCManager)speechModelTrainingXpcManager;
- (CSVoiceIdXPCListener)voiceIdXpcListener;
- (CSVoiceTriggerXPCListener)voiceTriggerXpcListener;
- (CSXPCActivity)csXPCActivity;
- (CSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)signalSource;
- (SSRRPISamplingXPCListener)samplingXPCLListener;
- (SSRSpeakerProfileEmbeddingServiceListener)speakerProfileEmbeddingServiceListener;
- (SSRVTUITrainingListener)vtuiTrainingListener;
- (SSRVTUITrainingMessageHandler)trainingMessageHandler;
- (void)_daemonDidLaunch;
- (void)_daemonWillShutdown;
- (void)_setupNotifyHandlers;
- (void)didLaunch;
- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3;
- (void)setActivationXpcListener:(id)a3;
- (void)setAttSiriManager:(id)a3;
- (void)setAudioInjectionXpcListener:(id)a3;
- (void)setAudioPowerServiceListener:(id)a3;
- (void)setBenchmarkXpcListener:(id)a3;
- (void)setCesrXPCActvity:(id)a3;
- (void)setCorespeechServiceListener:(id)a3;
- (void)setCsXPCActivity:(id)a3;
- (void)setCspDispatcher:(id)a3;
- (void)setDarwinVoiceTriggerHandlerPool:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingXPCLListener:(id)a3;
- (void)setSignalSource:(id)a3;
- (void)setSpeakerProfileEmbeddingServiceListener:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSpeechModelTrainingXpcManager:(id)a3;
- (void)setTrainingMessageHandler:(id)a3;
- (void)setVoiceIdXpcListener:(id)a3;
- (void)setVoiceTriggerXpcListener:(id)a3;
- (void)setVtuiTrainingListener:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)shutdown;
@end

@implementation CSHostDaemon

- (CSHostDaemon)init
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___CSHostDaemon;
  v2 = -[CSHostDaemon init](&v54, "init");
  v3 = v2;
  if (v2)
  {
    CSLogInitIfNeeded(v2);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v5);
    signalSource = v3->_signalSource;
    v3->_signalSource = (OS_dispatch_source *)v6;

    v8 = (dispatch_source_s *)v3->_signalSource;
    if (v8)
    {
      dispatch_source_set_event_handler(v8, &stru_10022DE28);
      dispatch_resume((dispatch_object_t)v3->_signalSource);
    }

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(v10);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);

    dispatch_queue_t v13 = dispatch_queue_create("CSHostDaemon", v12);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    speechManager = v3->_speechManager;
    v3->_speechManager = (CSSpeechManager *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___CSXPCListener);
    xpcListener = v3->_xpcListener;
    v3->_xpcListener = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___CSDeviceActivationXPCListener);
    activationXpcListener = v3->_activationXpcListener;
    v3->_activationXpcListener = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___CSVoiceIdXPCListener);
    voiceIdXpcListener = v3->_voiceIdXpcListener;
    v3->_voiceIdXpcListener = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerXPCListener);
    voiceTriggerXpcListener = v3->_voiceTriggerXpcListener;
    v3->_voiceTriggerXpcListener = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___CSAudioInjectionXPCListener);
    audioInjectionXpcListener = v3->_audioInjectionXpcListener;
    v3->_audioInjectionXpcListener = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___CSAttSiriManager);
    attSiriManager = v3->_attSiriManager;
    v3->_attSiriManager = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___CSCoreSpeechServicesListener);
    corespeechServiceListener = v3->_corespeechServiceListener;
    v3->_corespeechServiceListener = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___CSSpeechModelTrainingXPCManager);
    speechModelTrainingXpcManager = v3->_speechModelTrainingXpcManager;
    v3->_speechModelTrainingXpcManager = v31;

    v33 = objc_alloc_init(&OBJC_CLASS___CSBenchmarkXPCListener);
    benchmarkXpcListener = v3->_benchmarkXpcListener;
    v3->_benchmarkXpcListener = v33;

    if (CSIsIOS(v35, v36))
    {
      v37 = objc_alloc_init(&OBJC_CLASS___SSRRPISamplingXPCListener);
      samplingXPCLListener = v3->_samplingXPCLListener;
      v3->_samplingXPCLListener = v37;
    }

    v39 = objc_alloc_init(&OBJC_CLASS___CSAudioPowerServiceListener);
    audioPowerServiceListener = v3->_audioPowerServiceListener;
    v3->_audioPowerServiceListener = v39;

    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      v41 = objc_alloc_init(&OBJC_CLASS___SSRVTUITrainingMessageHandler);
      trainingMessageHandler = v3->_trainingMessageHandler;
      v3->_trainingMessageHandler = v41;

      v43 = -[SSRVTUITrainingListener initWithMessageHandler:]( objc_alloc(&OBJC_CLASS___SSRVTUITrainingListener),  "initWithMessageHandler:",  v3->_trainingMessageHandler);
      vtuiTrainingListener = v3->_vtuiTrainingListener;
      v3->_vtuiTrainingListener = v43;
    }

    v45 = objc_alloc_init(&OBJC_CLASS___CESRXPCActivity);
    cesrXPCActvity = v3->_cesrXPCActvity;
    v3->_cesrXPCActvity = v45;

    v47 = objc_alloc_init(&OBJC_CLASS___CSXPCActivity);
    csXPCActivity = v3->_csXPCActivity;
    v3->_csXPCActivity = v47;

    uint64_t v49 = objc_claimAutoreleasedReturnValue(+[CSPDispatcher sharedDispatcher](&OBJC_CLASS___CSPDispatcher, "sharedDispatcher"));
    cspDispatcher = v3->_cspDispatcher;
    v3->_cspDispatcher = (CSPDispatcher *)v49;

    v51 = objc_alloc_init(&OBJC_CLASS___CSAssetDownloadingOption);
    -[CSAssetDownloadingOption setAllowVoiceTriggerAssetDownloading:](v51, "setAllowVoiceTriggerAssetDownloading:", 1LL);
    -[CSAssetDownloadingOption setAllowVoiceTriggerAccessoryAssetDownloading:]( v51,  "setAllowVoiceTriggerAccessoryAssetDownloading:",  1LL);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    [v52 setAssetDownloadingOption:v51];
  }

  return v3;
}

- (void)didLaunch
{
}

- (void)shutdown
{
}

- (void)_daemonDidLaunch
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[CSHostDaemon _daemonDidLaunch]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSHostDaemon didLaunch",  (uint8_t *)&v13,  0xCu);
  }

  v4 = objc_alloc_init(&OBJC_CLASS___CSCoreSpeechDKeepAliveHandler);
  -[CSCoreSpeechDKeepAliveHandler start](v4, "start");
  -[CSSpeechManager startManager](self->_speechManager, "startManager");
  -[CSAttSiriManager setup](self->_attSiriManager, "setup");
  -[CSXPCListener listen](self->_xpcListener, "listen");
  -[CSDeviceActivationXPCListener listen](self->_activationXpcListener, "listen");
  -[CSVoiceIdXPCListener listen](self->_voiceIdXpcListener, "listen");
  -[CSVoiceTriggerXPCListener listen](self->_voiceTriggerXpcListener, "listen");
  -[CSAudioInjectionXPCListener listen](self->_audioInjectionXpcListener, "listen");
  -[CSAttSiriManager setupListeners](self->_attSiriManager, "setupListeners");
  -[CSCoreSpeechServicesListener listen](self->_corespeechServiceListener, "listen");
  -[CSBenchmarkXPCListener listen](self->_benchmarkXpcListener, "listen");
  -[SSRRPISamplingXPCListener listen](self->_samplingXPCLListener, "listen");
  -[CSAudioPowerServiceListener listen](self->_audioPowerServiceListener, "listen");
  -[SSRVTUITrainingListener listen](self->_vtuiTrainingListener, "listen");
  trainingMessageHandler = self->_trainingMessageHandler;
  if (trainingMessageHandler) {
    -[SSRVTUITrainingMessageHandler setAudioSessionDelegate:](trainingMessageHandler, "setAudioSessionDelegate:", self);
  }
  id v6 =  +[CSConnectionListener createSmartSiriVolumeListener]( &OBJC_CLASS___CSConnectionListener,  "createSmartSiriVolumeListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSCoreSpeechDaemonStateMonitor sharedInstance]( &OBJC_CLASS___CSCoreSpeechDaemonStateMonitor,  "sharedInstance"));
  [v7 notifyDaemonStateChanged:1];

  -[CSAttSiriManager start](self->_attSiriManager, "start");
  -[CSSpeechModelTrainingXPCManager registerXPCActivities]( self->_speechModelTrainingXpcManager,  "registerXPCActivities");
  -[CESRXPCActivity registerXPCActivities](self->_cesrXPCActvity, "registerXPCActivities");
  v8 = objc_alloc(&OBJC_CLASS___CSDarwinVoiceTriggerHandlerPool);
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEventsCoordinator sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEventsCoordinator,  "sharedInstance"));
  v10 = -[CSDarwinVoiceTriggerHandlerPool initWithVoiceTriggerEventsCoordinator:]( v8,  "initWithVoiceTriggerEventsCoordinator:",  v9);
  darwinVoiceTriggerHandlerPool = self->_darwinVoiceTriggerHandlerPool;
  self->_darwinVoiceTriggerHandlerPool = v10;

  -[CSDarwinVoiceTriggerHandlerPool start](self->_darwinVoiceTriggerHandlerPool, "start");
  id v12 = +[CSBluetoothManager sharedInstance](&OBJC_CLASS___CSBluetoothManager, "sharedInstance");
  -[CSXPCActivity registerXPCActivities](self->_csXPCActivity, "registerXPCActivities");
  -[CSPDispatcher registerXPCActivities](self->_cspDispatcher, "registerXPCActivities");
  -[CSPDispatcher setupXPCListeners](self->_cspDispatcher, "setupXPCListeners");
  -[SSRSpeakerProfileEmbeddingServiceListener resumeConnection]( self->_speakerProfileEmbeddingServiceListener,  "resumeConnection");
  dispatch_activate((dispatch_object_t)self->_queue);
}

- (void)_setupNotifyHandlers
{
  queue = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100121AD4;
  handler[3] = &unk_10022DE70;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);
}

- (void)_daemonWillShutdown
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSHostDaemon _daemonWillShutdown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Daemon WillShutdown", (uint8_t *)&v4, 0xCu);
  }

  -[CSDarwinVoiceTriggerHandlerPool stop](self->_darwinVoiceTriggerHandlerPool, "stop");
}

- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3
{
  if (a3)
  {
    v3 = (void (**)(id, id))a3;
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForVoiceTriggerTraining]( &OBJC_CLASS___CSAudioRecordContext,  "contextForVoiceTriggerTraining"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 audioProviderWithContext:v5 error:0]);

    v3[2](v3, v6);
  }

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (CSDeviceActivationXPCListener)activationXpcListener
{
  return self->_activationXpcListener;
}

- (void)setActivationXpcListener:(id)a3
{
}

- (CSVoiceIdXPCListener)voiceIdXpcListener
{
  return self->_voiceIdXpcListener;
}

- (void)setVoiceIdXpcListener:(id)a3
{
}

- (CSVoiceTriggerXPCListener)voiceTriggerXpcListener
{
  return self->_voiceTriggerXpcListener;
}

- (void)setVoiceTriggerXpcListener:(id)a3
{
}

- (CSAudioInjectionXPCListener)audioInjectionXpcListener
{
  return self->_audioInjectionXpcListener;
}

- (void)setAudioInjectionXpcListener:(id)a3
{
}

- (CSAttSiriManager)attSiriManager
{
  return self->_attSiriManager;
}

- (void)setAttSiriManager:(id)a3
{
}

- (CSCoreSpeechServicesListener)corespeechServiceListener
{
  return self->_corespeechServiceListener;
}

- (void)setCorespeechServiceListener:(id)a3
{
}

- (CSAudioPowerServiceListener)audioPowerServiceListener
{
  return self->_audioPowerServiceListener;
}

- (void)setAudioPowerServiceListener:(id)a3
{
}

- (CSSpeechModelTrainingXPCManager)speechModelTrainingXpcManager
{
  return self->_speechModelTrainingXpcManager;
}

- (void)setSpeechModelTrainingXpcManager:(id)a3
{
}

- (CSBenchmarkXPCListener)benchmarkXpcListener
{
  return self->_benchmarkXpcListener;
}

- (void)setBenchmarkXpcListener:(id)a3
{
}

- (SSRVTUITrainingListener)vtuiTrainingListener
{
  return self->_vtuiTrainingListener;
}

- (void)setVtuiTrainingListener:(id)a3
{
}

- (SSRSpeakerProfileEmbeddingServiceListener)speakerProfileEmbeddingServiceListener
{
  return self->_speakerProfileEmbeddingServiceListener;
}

- (void)setSpeakerProfileEmbeddingServiceListener:(id)a3
{
}

- (SSRRPISamplingXPCListener)samplingXPCLListener
{
  return self->_samplingXPCLListener;
}

- (void)setSamplingXPCLListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)signalSource
{
  return self->_signalSource;
}

- (void)setSignalSource:(id)a3
{
}

- (CSDarwinVoiceTriggerHandlerPool)darwinVoiceTriggerHandlerPool
{
  return self->_darwinVoiceTriggerHandlerPool;
}

- (void)setDarwinVoiceTriggerHandlerPool:(id)a3
{
}

- (CESRXPCActivity)cesrXPCActvity
{
  return self->_cesrXPCActvity;
}

- (void)setCesrXPCActvity:(id)a3
{
}

- (CSXPCActivity)csXPCActivity
{
  return self->_csXPCActivity;
}

- (void)setCsXPCActivity:(id)a3
{
}

- (CSPDispatcher)cspDispatcher
{
  return self->_cspDispatcher;
}

- (void)setCspDispatcher:(id)a3
{
}

- (SSRVTUITrainingMessageHandler)trainingMessageHandler
{
  return self->_trainingMessageHandler;
}

- (void)setTrainingMessageHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedDaemon
{
  if (qword_100280128 != -1) {
    dispatch_once(&qword_100280128, &stru_10022DE08);
  }
  return (id)qword_100280120;
}

@end