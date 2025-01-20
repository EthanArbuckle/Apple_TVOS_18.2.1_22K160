@interface CSCoreSpeechServicesListener
- (BOOL)_servicesListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSCoreSpeechServicesListener)init;
- (CSGibraltarVoiceTriggerHandler)gibraltarVoiceTriggerHandler;
- (NSXPCListener)servicesListener;
- (OS_dispatch_queue)queue;
- (void)clearTriggerCount:(id)a3;
- (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4;
- (void)getFirstPassRunningMode:(id)a3;
- (void)getTestResponse:(id)a3;
- (void)getTriggerCount:(id)a3;
- (void)getVoiceTriggerRTModelRequestOptionsWithEndpointId:(id)a3 completion:(id)a4;
- (void)listen;
- (void)requestUpdatedSATAudio:(id)a3;
- (void)setDelayInterstitialSounds:(id)a3 level:(int64_t)a4 completion:(id)a5;
- (void)setGibraltarVoiceTriggerHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServicesListener:(id)a3;
@end

@implementation CSCoreSpeechServicesListener

- (CSCoreSpeechServicesListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSCoreSpeechServicesListener;
  v2 = -[CSCoreSpeechServicesListener init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSCoreSpeechServicesListener", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)listen
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSCoreSpeechServicesListener listen]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Register CoreSpeech Services",  (uint8_t *)&v6,  0xCu);
  }

  v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.corespeech.corespeechservices");
  servicesListener = self->_servicesListener;
  self->_servicesListener = v4;

  -[NSXPCListener setDelegate:](self->_servicesListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_servicesListener, "resume");
}

- (BOOL)_servicesListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[CSCoreSpeechServicesListener _servicesListenerShouldAcceptNewConnection:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Received accept request : %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id v6 = sub_1000D563C();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 setExportedInterface:v7];

  unsigned __int8 v8 = +[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v4,  @"corespeech.xpc");
  if ((v8 & 1) != 0)
  {
    [v4 setExportedObject:self];
    [v4 setInterruptionHandler:&stru_10022B200];
    [v4 setInvalidationHandler:&stru_10022B220];
    [v4 resume];
  }

  else
  {
    [v4 invalidate];
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[CSCoreSpeechServicesListener _servicesListenerShouldAcceptNewConnection:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Connectin request %{public}@ rejected due to missing entitlement",  (uint8_t *)&v11,  0x16u);
    }
  }

  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  unsigned __int8 v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    __int16 v13 = "-[CSCoreSpeechServicesListener listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }

  if (self->_servicesListener == v6)
  {
    BOOL v10 = -[CSCoreSpeechServicesListener _servicesListenerShouldAcceptNewConnection:]( self,  "_servicesListenerShouldAcceptNewConnection:",  v7);
  }

  else
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      __int16 v13 = "-[CSCoreSpeechServicesListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s we got unknown types of XPC connection request",  (uint8_t *)&v12,  0xCu);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (void)getTestResponse:(id)a3
{
  dispatch_queue_t v3 = (void (**)(id, const __CFString *))a3;
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSCoreSpeechServicesListener getTestResponse:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s get test response. return string Test",  (uint8_t *)&v5,  0xCu);
  }

  v3[2](v3, @"Test");
}

- (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100050428;
  v11[3] = &unk_10022EB58;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)getVoiceTriggerRTModelRequestOptionsWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100050170;
  v11[3] = &unk_10022EB58;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)setDelayInterstitialSounds:(id)a3 level:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[CSCoreSpeechServicesListener setDelayInterstitialSounds:level:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Setting Delay Interstitial Sound",  (uint8_t *)&v13,  0xCu);
  }

  gibraltarVoiceTriggerHandler = self->_gibraltarVoiceTriggerHandler;
  if (gibraltarVoiceTriggerHandler)
  {
    -[CSGibraltarVoiceTriggerHandler setDelayInterstitialSounds:level:completion:]( gibraltarVoiceTriggerHandler,  "setDelayInterstitialSounds:level:completion:",  v8,  a4,  v9);
  }

  else if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  305LL,  0LL));
    v9[2](v9, v12);
  }
}

- (void)getTriggerCount:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSCoreSpeechServicesListener getTriggerCount:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Get Trigger Count", (uint8_t *)&v7, 0xCu);
  }

  gibraltarVoiceTriggerHandler = self->_gibraltarVoiceTriggerHandler;
  if (gibraltarVoiceTriggerHandler)
  {
    -[CSGibraltarVoiceTriggerHandler getTriggerCount:](gibraltarVoiceTriggerHandler, "getTriggerCount:", v4);
  }

  else if (v4)
  {
    v4[2](v4, 0LL);
  }
}

- (void)clearTriggerCount:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSCoreSpeechServicesListener clearTriggerCount:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Clear Trigger Count", (uint8_t *)&v7, 0xCu);
  }

  gibraltarVoiceTriggerHandler = self->_gibraltarVoiceTriggerHandler;
  if (gibraltarVoiceTriggerHandler)
  {
    -[CSGibraltarVoiceTriggerHandler clearTriggerCount:](gibraltarVoiceTriggerHandler, "clearTriggerCount:", v4);
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)requestUpdatedSATAudio:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (void)getFirstPassRunningMode:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSCoreSpeechServicesListener getFirstPassRunningMode:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Get FirstPass running mode",  (uint8_t *)&v7,  0xCu);
  }

  gibraltarVoiceTriggerHandler = self->_gibraltarVoiceTriggerHandler;
  if (gibraltarVoiceTriggerHandler)
  {
    -[CSGibraltarVoiceTriggerHandler getFirstPassRunningMode:]( gibraltarVoiceTriggerHandler,  "getFirstPassRunningMode:",  v4);
  }

  else if (v4)
  {
    v4[2](v4, -1LL);
  }
}

- (CSGibraltarVoiceTriggerHandler)gibraltarVoiceTriggerHandler
{
  return self->_gibraltarVoiceTriggerHandler;
}

- (void)setGibraltarVoiceTriggerHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)servicesListener
{
  return self->_servicesListener;
}

- (void)setServicesListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end