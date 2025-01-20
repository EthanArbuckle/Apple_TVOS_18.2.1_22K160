@interface CSAttSiriManager
- (CSAttSiriConnectionManager)connectionManager;
- (CSAttSiriController)attSiriController;
- (CSAttSiriManager)init;
- (CSAttSiriManager)initWithAttSiriController:(id)a3 icRequestHandler:(id)a4 attendingUsecaseManager:(id)a5 attendingServiceListener:(id)a6 attendingStatesServiceListener:(id)a7 attendingConnectionManager:(id)a8 attendingStatesProvidingProxy:(id)a9;
- (CSAttendingServiceListener)attendingServiceListener;
- (CSAttendingStatesMessageHandler)attendingStatesMessageHandler;
- (CSAttendingStatesProvidingProxy)localAttendingStatesProvidingProxy;
- (CSAttendingStatesServiceListener)attendingStatesServiceListener;
- (CSAttendingUsecaseManager)attendingUsecaseManager;
- (CSIntuitiveConvRequestHandler)icRequestHandler;
- (CSLocalAttendingInitiator)localAttendingInitiator;
- (void)_setupAttendingServiceListener;
- (void)_setupAttendingStatesServiceListener;
- (void)setAttSiriController:(id)a3;
- (void)setAttendingServiceListener:(id)a3;
- (void)setAttendingStatesMessageHandler:(id)a3;
- (void)setAttendingStatesServiceListener:(id)a3;
- (void)setAttendingUsecaseManager:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setIcRequestHandler:(id)a3;
- (void)setLocalAttendingInitiator:(id)a3;
- (void)setLocalAttendingStatesProvidingProxy:(id)a3;
- (void)setup;
- (void)setupListeners;
- (void)start;
@end

@implementation CSAttSiriManager

- (CSAttSiriManager)initWithAttSiriController:(id)a3 icRequestHandler:(id)a4 attendingUsecaseManager:(id)a5 attendingServiceListener:(id)a6 attendingStatesServiceListener:(id)a7 attendingConnectionManager:(id)a8 attendingStatesProvidingProxy:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___CSAttSiriManager;
  v23 = -[CSAttSiriManager init](&v52, "init");
  v24 = v23;
  if (v23)
  {
    CSLogInitIfNeeded(v23);
    if (+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"))
    {
      v25 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceList"
              "ener:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Medoc feature flag is Enabled, swtich to new request handler",  buf,  0xCu);
      }

      if (v18) {
        v26 = (CSAttendingUsecaseManager *)v18;
      }
      else {
        v26 = objc_alloc_init(&OBJC_CLASS___CSAttendingUsecaseManager);
      }
      attendingUsecaseManager = v24->_attendingUsecaseManager;
      v24->_attendingUsecaseManager = v26;

      v28 = objc_alloc(&OBJC_CLASS___CSLocalAttendingInitiator);
      v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttendingUsecaseManager usecaseForType:]( v24->_attendingUsecaseManager,  "usecaseForType:",  0LL));
      v30 = -[CSLocalAttendingInitiator initWithAttendingUsecase:](v28, "initWithAttendingUsecase:", v29);
      localAttendingInitiator = v24->_localAttendingInitiator;
      v24->_localAttendingInitiator = v30;

      v32 = -[CSLocalAttendingHintProvider initWithAttendingIniting:]( objc_alloc(&OBJC_CLASS___CSLocalAttendingHintProvider),  "initWithAttendingIniting:",  v24->_localAttendingInitiator);
      v33 = objc_alloc_init(&OBJC_CLASS___CSAttendingStatesMessageHandler);
      attendingStatesMessageHandler = v24->_attendingStatesMessageHandler;
      v24->_attendingStatesMessageHandler = v33;

      if (v22) {
        v35 = (CSAttendingStatesProvidingProxy *)v22;
      }
      else {
        v35 = objc_alloc_init(&OBJC_CLASS___CSAttendingStatesProvidingProxy);
      }
      localAttendingStatesProvidingProxy = v24->_localAttendingStatesProvidingProxy;
      v24->_localAttendingStatesProvidingProxy = v35;

      -[CSAttendingStatesProvidingProxy registerAttendingHintProvider:]( v24->_localAttendingStatesProvidingProxy,  "registerAttendingHintProvider:",  v32);
      -[CSAttendingStatesMessageHandler setDelegate:]( v24->_attendingStatesMessageHandler,  "setDelegate:",  v24->_localAttendingStatesProvidingProxy);
      -[CSLocalAttendingInitiator setDelegate:]( v24->_localAttendingInitiator,  "setDelegate:",  v24->_attendingStatesMessageHandler);
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      [v40 registerObserver:v24->_localAttendingInitiator];

      v41 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
      [v41 registerObserver:v24->_localAttendingInitiator];

      if (v17) {
        v42 = (CSIntuitiveConvRequestHandler *)v17;
      }
      else {
        v42 = objc_alloc_init(&OBJC_CLASS___CSIntuitiveConvRequestHandler);
      }
      icRequestHandler = v24->_icRequestHandler;
      v24->_icRequestHandler = v42;

      -[CSIntuitiveConvRequestHandler setHintProvider:](v24->_icRequestHandler, "setHintProvider:", v32);
      -[CSIntuitiveConvRequestHandler setAttendingStatesMessageHandler:]( v24->_icRequestHandler,  "setAttendingStatesMessageHandler:",  v24->_attendingStatesMessageHandler);
      -[CSAttendingStatesProvidingProxy addDismissUpdateReceiver:]( v24->_localAttendingStatesProvidingProxy,  "addDismissUpdateReceiver:",  v24->_icRequestHandler);
      -[CSAttendingStatesProvidingProxy addSiriPromptUpdateReceiver:]( v24->_localAttendingStatesProvidingProxy,  "addSiriPromptUpdateReceiver:",  v24->_icRequestHandler);
      -[CSAttendingStatesProvidingProxy addDismissUpdateReceiver:]( v24->_localAttendingStatesProvidingProxy,  "addDismissUpdateReceiver:",  v24->_attendingStatesMessageHandler);
      if (v19) {
        v44 = (CSAttendingServiceListener *)v19;
      }
      else {
        v44 = objc_alloc_init(&OBJC_CLASS___CSAttendingServiceListener);
      }
      attendingServiceListener = v24->_attendingServiceListener;
      v24->_attendingServiceListener = v44;

      if (v20) {
        v46 = (CSAttendingStatesServiceListener *)v20;
      }
      else {
        v46 = objc_alloc_init(&OBJC_CLASS___CSAttendingStatesServiceListener);
      }
      attendingStatesServiceListener = v24->_attendingStatesServiceListener;
      v24->_attendingStatesServiceListener = v46;
    }

    else if (v16)
    {
      objc_storeStrong((id *)&v24->_attSiriController, a3);
    }

    else
    {
      v36 = objc_alloc_init(&OBJC_CLASS___CSAttSiriController);
      attSiriController = v24->_attSiriController;
      v24->_attSiriController = v36;

      v38 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceList"
              "ener:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s Intuitive Conversation Disabled, fallback to attsiri controller",  buf,  0xCu);
      }
    }

    if (v21) {
      v48 = (CSAttSiriConnectionManager *)v21;
    }
    else {
      v48 = objc_alloc_init(&OBJC_CLASS___CSAttSiriConnectionManager);
    }
    connectionManager = v24->_connectionManager;
    v24->_connectionManager = v48;

    v50 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceListen"
            "er:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v24;
}

- (CSAttSiriManager)init
{
  if ((+[CSUtils isAttentiveSiriEnabled](&OBJC_CLASS___CSUtils, "isAttentiveSiriEnabled") & 1) != 0)
  {
    self =  -[CSAttSiriManager initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceListener:attendingStatesServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:]( self,  "initWithAttSiriController:icRequestHandler:attendingUsecaseManager:attendingServiceListener:attendingStat esServiceListener:attendingConnectionManager:attendingStatesProvidingProxy:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    v3 = self;
  }

  else
  {
    v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSAttSiriManager init]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Attentive Siri not supported on device",  buf,  0xCu);
    }

    v3 = 0LL;
  }

  return v3;
}

- (void)setupListeners
{
  attSiriController = self->_attSiriController;
  if (attSiriController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController getNodeOfType:](attSiriController, "getNodeOfType:", 1LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController getNodeOfType:](self->_attSiriController, "getNodeOfType:", 2LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController getNodeOfType:](self->_attSiriController, "getNodeOfType:", 10LL));
    connectionManager = self->_connectionManager;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriController rcHandler](self->_attSiriController, "rcHandler"));
    -[CSAttSiriConnectionManager setupListenersForEndpointerNode:asrNode:ssrNode:rcHandler:]( connectionManager,  "setupListenersForEndpointerNode:asrNode:ssrNode:rcHandler:",  v4,  v5,  v6,  v8);
  }

  icRequestHandler = self->_icRequestHandler;
  if (icRequestHandler)
  {
    v10 = self->_connectionManager;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSIntuitiveConvRequestHandler getEndpointerProxyObj](icRequestHandler, "getEndpointerProxyObj"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSIntuitiveConvRequestHandler getAsrProxyObj](self->_icRequestHandler, "getAsrProxyObj"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSIntuitiveConvRequestHandler getSsrProxyObj](self->_icRequestHandler, "getSsrProxyObj"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSIntuitiveConvRequestHandler getRcHandlerProxyObj]( self->_icRequestHandler,  "getRcHandlerProxyObj"));
    -[CSAttSiriConnectionManager setupListenersForEndpointerNode:asrNode:ssrNode:rcHandler:]( v10,  "setupListenersForEndpointerNode:asrNode:ssrNode:rcHandler:",  v11,  v12,  v13,  v14);

    if (+[CSUtils supportsAudioMessage](&OBJC_CLASS___CSUtils, "supportsAudioMessage"))
    {
      v15 = self->_connectionManager;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSIntuitiveConvRequestHandler getAudioMessageServiceProxyObj]( self->_icRequestHandler,  "getAudioMessageServiceProxyObj"));
      -[CSAttSiriConnectionManager setupAudioMessageServiceListnerWithProxy:]( v15,  "setupAudioMessageServiceListnerWithProxy:",  v16);
    }
  }

  if (+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"))
  {
    -[CSAttSiriManager _setupAttendingServiceListener](self, "_setupAttendingServiceListener");
    -[CSAttSiriManager _setupAttendingStatesServiceListener](self, "_setupAttendingStatesServiceListener");
  }

  else
  {
    -[CSAttSiriConnectionManager setupAttSiriServiceListenerWithAttSiriController:]( self->_connectionManager,  "setupAttSiriServiceListenerWithAttSiriController:");
  }

- (void)setup
{
}

- (void)start
{
}

- (void)_setupAttendingServiceListener
{
  if (self->_attendingUsecaseManager)
  {
    -[CSAttendingServiceListener registerAttendingUsecaseManager:]( self->_attendingServiceListener,  "registerAttendingUsecaseManager:");
    -[CSAttendingServiceListener registerAttendingStatesProvidingProxy:]( self->_attendingServiceListener,  "registerAttendingStatesProvidingProxy:",  self->_localAttendingStatesProvidingProxy);
    -[CSAttendingServiceListener resumeConnection](self->_attendingServiceListener, "resumeConnection");
    v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      attendingServiceListener = self->_attendingServiceListener;
      int v5 = 136315394;
      v6 = "-[CSAttSiriManager _setupAttendingServiceListener]";
      __int16 v7 = 2112;
      v8 = attendingServiceListener;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s AttendingServiceListener xpc connection started listening: _attendingServiceListener=%@",  (uint8_t *)&v5,  0x16u);
    }
  }

- (void)_setupAttendingStatesServiceListener
{
  if (self->_localAttendingStatesProvidingProxy)
  {
    -[CSAttendingStatesServiceListener registerAttendingStatesProvidingProxy:]( self->_attendingStatesServiceListener,  "registerAttendingStatesProvidingProxy:");
    -[CSAttendingStatesServiceListener listen](self->_attendingStatesServiceListener, "listen");
  }

- (CSAttSiriController)attSiriController
{
  return self->_attSiriController;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSIntuitiveConvRequestHandler)icRequestHandler
{
  return self->_icRequestHandler;
}

- (void)setIcRequestHandler:(id)a3
{
}

- (CSAttendingUsecaseManager)attendingUsecaseManager
{
  return self->_attendingUsecaseManager;
}

- (void)setAttendingUsecaseManager:(id)a3
{
}

- (CSAttendingServiceListener)attendingServiceListener
{
  return self->_attendingServiceListener;
}

- (void)setAttendingServiceListener:(id)a3
{
}

- (CSAttendingStatesServiceListener)attendingStatesServiceListener
{
  return self->_attendingStatesServiceListener;
}

- (void)setAttendingStatesServiceListener:(id)a3
{
}

- (CSAttSiriConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (CSLocalAttendingInitiator)localAttendingInitiator
{
  return self->_localAttendingInitiator;
}

- (void)setLocalAttendingInitiator:(id)a3
{
}

- (CSAttendingStatesProvidingProxy)localAttendingStatesProvidingProxy
{
  return self->_localAttendingStatesProvidingProxy;
}

- (void)setLocalAttendingStatesProvidingProxy:(id)a3
{
}

- (CSAttendingStatesMessageHandler)attendingStatesMessageHandler
{
  return self->_attendingStatesMessageHandler;
}

- (void)setAttendingStatesMessageHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end