@interface CSAttSiriConnectionManager
- (CSAttSiriConnectionManager)init;
- (CSConnectionListener)attSiriSvcListener;
- (CSConnectionListener)audioMessageServiceListener;
- (CSConnectionListener)endpointerListener;
- (CSConnectionListener)localSpeechRecognitionListener;
- (CSConnectionListener)rcProcessingListener;
- (CSConnectionListener)ssrListener;
- (void)_setupEndpointListenerWithEndpointerNode:(id)a3;
- (void)_setupRCProcessingListenerWithRCHandler:(id)a3;
- (void)_setupSSRListenerWithSSRNode:(id)a3;
- (void)setAttSiriSvcListener:(id)a3;
- (void)setAudioMessageServiceListener:(id)a3;
- (void)setEndpointerListener:(id)a3;
- (void)setLocalSpeechRecognitionListener:(id)a3;
- (void)setRcProcessingListener:(id)a3;
- (void)setSsrListener:(id)a3;
- (void)setupAttSiriServiceListenerWithAttSiriController:(id)a3;
- (void)setupAudioMessageServiceListnerWithProxy:(id)a3;
- (void)setupListenersForEndpointerNode:(id)a3 asrNode:(id)a4 ssrNode:(id)a5 rcHandler:(id)a6;
- (void)setupLocalSpeechRecognitionListenerWithXPCListener:(id)a3 machService:(id)a4 asrNode:(id)a5 ssrNode:(id)a6;
@end

@implementation CSAttSiriConnectionManager

- (CSAttSiriConnectionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAttSiriConnectionManager;
  return -[CSAttSiriConnectionManager init](&v3, "init");
}

- (void)setupListenersForEndpointerNode:(id)a3 asrNode:(id)a4 ssrNode:(id)a5 rcHandler:(id)a6
{
  id v12 = a6;
  id v10 = a5;
  id v11 = a4;
  -[CSAttSiriConnectionManager _setupEndpointListenerWithEndpointerNode:]( self,  "_setupEndpointListenerWithEndpointerNode:",  a3);
  -[CSAttSiriConnectionManager setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:]( self,  "setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:",  0LL,  LBLocalSpeechServiceName,  v11,  v10);

  -[CSAttSiriConnectionManager _setupSSRListenerWithSSRNode:](self, "_setupSSRListenerWithSSRNode:", v10);
  -[CSAttSiriConnectionManager _setupRCProcessingListenerWithRCHandler:]( self,  "_setupRCProcessingListenerWithRCHandler:",  v12);
}

- (void)setupAttSiriServiceListenerWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttSiriServiceProtocol));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSAttSiriServiceDelegate));
  v7 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:]( objc_alloc(&OBJC_CLASS___CSConnectionListener),  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:",  @"com.apple.corespeech.corespeechd.attsiri.service",  v5,  v4,  v6);
  attSiriSvcListener = self->_attSiriSvcListener;
  self->_attSiriSvcListener = v7;

  [v4 setAttSiriSvcListener:self->_attSiriSvcListener];
  -[CSConnectionListener resumeConnection](self->_attSiriSvcListener, "resumeConnection");
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_attSiriSvcListener;
    int v11 = 136315394;
    id v12 = "-[CSAttSiriConnectionManager setupAttSiriServiceListenerWithAttSiriController:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s AttSiriServiceListener xpc connection started listening: _attSiriSvcListener=%@",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)setupLocalSpeechRecognitionListenerWithXPCListener:(id)a3 machService:(id)a4 asrNode:(id)a5 ssrNode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((+[CSUtils supportsSpeechRecognitionOnDevice]( &OBJC_CLASS___CSUtils,  "supportsSpeechRecognitionOnDevice") & 1) != 0 || (+[CSUtils supportsHybridUnderstandingOnDevice]( &OBJC_CLASS___CSUtils,  "supportsHybridUnderstandingOnDevice") & 1) != 0 || (+[CSUtils supportVoiceID](&OBJC_CLASS___CSUtils, "supportVoiceID") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LBLocalSpeechService));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LBLocalSpeechServiceDelegate));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.CoreSpeech.Connection.Listener.asr",  33LL));
    v17 = objc_alloc(&OBJC_CLASS___CSConnectionListener);
    if (v10) {
      v18 = -[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( v17,  "initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  v10,  v11,  v14,  v12,  v15,  v16);
    }
    else {
      v18 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( v17,  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  v11,  v14,  v12,  v15,  v16);
    }
    localSpeechRecognitionListener = self->_localSpeechRecognitionListener;
    self->_localSpeechRecognitionListener = v18;

    [v12 setLocalSRBridgeListener:self->_localSpeechRecognitionListener];
    [v13 setLocalSRBridgeListener:self->_localSpeechRecognitionListener];
    -[CSConnectionListener resumeConnection](self->_localSpeechRecognitionListener, "resumeConnection");
    v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[CSAttSiriConnectionManager setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s LocalSpeechRecognition xpc connection started listening",  (uint8_t *)&v22,  0xCu);
    }
  }

  else
  {
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[CSAttSiriConnectionManager setupLocalSpeechRecognitionListenerWithXPCListener:machService:asrNode:ssrNode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Doesn't support ASR on Device",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)setupAudioMessageServiceListnerWithProxy:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSSiriAudioMessageRequestService));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"AudioMessageServiceListener",  33LL));
  v6 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( objc_alloc(&OBJC_CLASS___CSConnectionListener),  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  @"com.apple.siri.audio_message_service.xpc",  v8,  v4,  0LL,  v5);

  audioMessageServiceListener = self->_audioMessageServiceListener;
  self->_audioMessageServiceListener = v6;

  -[CSConnectionListener resumeConnection](self->_audioMessageServiceListener, "resumeConnection");
}

- (void)_setupEndpointListenerWithEndpointerNode:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSEndpointerXPCService));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSEndpointerXPCServiceDelegate));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.CoreSpeech.Connection.Listener.endpointer",  33LL));
  id v8 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( objc_alloc(&OBJC_CLASS___CSConnectionListener),  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  @"com.apple.corespeech.corespeechd.endpointer.service",  v5,  v4,  v6,  v7);
  endpointerListener = self->_endpointerListener;
  self->_endpointerListener = v8;

  [v4 setEndpointerListener:self->_endpointerListener];
  -[CSConnectionListener resumeConnection](self->_endpointerListener, "resumeConnection");
  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[CSAttSiriConnectionManager _setupEndpointListenerWithEndpointerNode:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Endpointer xpc connection started listening",  (uint8_t *)&v11,  0xCu);
  }
}

- (void)_setupSSRListenerWithSSRNode:(id)a3
{
  id v4 = a3;
  if ((CSIsCommunalDevice(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSSSRXPCService));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSSSRXPCServiceDelegate));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.CoreSpeech.Connection.Listener.ssr",  33LL));
    v9 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( objc_alloc(&OBJC_CLASS___CSConnectionListener),  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  @"com.apple.corespeech.corespeechd.ssr.service",  v6,  v4,  v7,  v8);
    ssrListener = self->_ssrListener;
    self->_ssrListener = v9;

    [v4 setSsrListener:self->_ssrListener];
    -[CSConnectionListener resumeConnection](self->_ssrListener, "resumeConnection");
    int v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[CSAttSiriConnectionManager _setupSSRListenerWithSSRNode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s SSR xpc connection started listening",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[CSAttSiriConnectionManager _setupSSRListenerWithSSRNode:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Not setting up SSR xpc listener since its not a communal device",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)_setupRCProcessingListenerWithRCHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CSRCHandlingXPCService));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.CoreSpeech.Connection.Listener.rchandling",  33LL));
  v7 = -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:]( objc_alloc(&OBJC_CLASS___CSConnectionListener),  "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:",  @"com.apple.corespeech.corespeechd.rchandling.service",  v5,  v4,  0LL,  v6);

  rcProcessingListener = self->_rcProcessingListener;
  self->_rcProcessingListener = v7;

  -[CSConnectionListener resumeConnection](self->_rcProcessingListener, "resumeConnection");
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[CSAttSiriConnectionManager _setupRCProcessingListenerWithRCHandler:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s RC Processing xpc connection started listening",  (uint8_t *)&v10,  0xCu);
  }
}

- (CSConnectionListener)endpointerListener
{
  return self->_endpointerListener;
}

- (void)setEndpointerListener:(id)a3
{
}

- (CSConnectionListener)localSpeechRecognitionListener
{
  return self->_localSpeechRecognitionListener;
}

- (void)setLocalSpeechRecognitionListener:(id)a3
{
}

- (CSConnectionListener)ssrListener
{
  return self->_ssrListener;
}

- (void)setSsrListener:(id)a3
{
}

- (CSConnectionListener)rcProcessingListener
{
  return self->_rcProcessingListener;
}

- (void)setRcProcessingListener:(id)a3
{
}

- (CSConnectionListener)attSiriSvcListener
{
  return self->_attSiriSvcListener;
}

- (void)setAttSiriSvcListener:(id)a3
{
}

- (CSConnectionListener)audioMessageServiceListener
{
  return self->_audioMessageServiceListener;
}

- (void)setAudioMessageServiceListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end