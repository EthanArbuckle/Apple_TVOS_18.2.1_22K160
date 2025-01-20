@interface CSAudioSessionProvidingProxy
- (CSAudioSessionProviding)audioSessionProvider;
- (CSAudioSessionProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (CSManualDuckingHandler)manualDuckingHandler;
- (unint64_t)streamClientType;
- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeActivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDeactivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDuckAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeEnableMiniDucking:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypePrewarmMessage:(id)a3 client:(id)a4;
- (void)_handleSessionProvidingRequestTypeSetDuckOthersOption:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6;
- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProviderBeginInterruption:(id)a3;
- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4;
- (void)audioSessionProviderEndInterruption:(id)a3;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioSessionProvider:(id)a3;
- (void)setManualDuckingHandler:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioSessionProvidingProxy

- (CSAudioSessionProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAudioSessionProvidingProxy;
  v5 = -[CSAudioSessionProvidingProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[CSAudioSessionProvidingProxy setXpcConnection:](v5, "setXpcConnection:", v4);
  }

  return v6;
}

- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t streamClientType = self->_streamClientType;
    int v17 = 136315394;
    v18 = "-[CSAudioSessionProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
    __int16 v19 = 1026;
    int v20 = streamClientType;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s CSAudioSessionProvidingProxy has received xpc disconnection _streamClientType : %{public}d",  (uint8_t *)&v17,  0x12u);
  }

  if (self->_streamClientType == 1)
  {
    audioSessionProvider = self->_audioSessionProvider;
    if (audioSessionProvider)
    {
      v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[CSAudioSessionProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Trying to release audio stream on CSAudioSessionProvidingProxy",  (uint8_t *)&v17,  0xCu);
        audioSessionProvider = self->_audioSessionProvider;
      }

      -[CSAudioSessionProviding deactivateAudioSession:error:]( audioSessionProvider,  "deactivateAudioSession:error:",  1LL,  0LL);
    }

    manualDuckingHandler = self->_manualDuckingHandler;
    if (manualDuckingHandler) {
      -[CSManualDuckingHandler resetDucking](manualDuckingHandler, "resetDucking");
    }
  }

  v16 = self->_audioSessionProvider;
  self->_audioSessionProvider = 0LL;
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAudioSessionProvidingProxy dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAudioSessionProvidingProxy;
  -[CSAudioSessionProvidingProxy dealloc](&v4, "dealloc");
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[CSAudioSessionProvidingProxy handleXPCMessage:messageBody:client:]";
    __int16 v16 = 2050;
    int64_t v17 = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Session Providing Request Message has arrived : %{public}lld",  (uint8_t *)&v14,  0x16u);
  }

  switch(int64)
  {
    case 1LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypePrewarmMessage:client:]( self,  "_handleSessionProvidingRequestTypePrewarmMessage:client:",  v8,  v10);
      break;
    case 2LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeActivateMessage:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeActivateMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 3LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 5LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:",  v8,  v9,  v10);
      break;
    case 6LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:",  v8,  v9,  v10);
      break;
    case 7LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckAudioDevice:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeDuckAudioDevice:messageBody:client:",  v8,  v9,  v10);
      break;
    case 8LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:messageBody:client:",  v8,  v9,  v10);
      break;
    case 9LL:
      -[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:]( self,  "_handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:",  v8,  v9,  v10);
      break;
    default:
      v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        v15 = "-[CSAudioSessionProvidingProxy handleXPCMessage:messageBody:client:]";
        __int16 v16 = 2050;
        int64_t v17 = int64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Unexpected XPC session providing request : %{public}lld",  (uint8_t *)&v14,  0x16u);
      }

      break;
  }
}

- (void)_handleSessionProvidingRequestTypePrewarmMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v16 = 0LL;
    id v9 = -[CSAudioSessionProviding prewarmAudioSessionWithError:]( audioSessionProvider,  "prewarmAudioSessionWithError:",  &v16);
    id v10 = v16;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = v11;
        v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypePrewarmMessage:client:]";
        __int16 v19 = 2114;
        int v20 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to prewarm audio session, error : %{public}@",  buf,  0x16u);
      }
    }

    v12 = self;
    id v13 = v9;
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1351LL,  0LL));
    v12 = self;
    id v13 = 0LL;
  }

  -[CSAudioSessionProvidingProxy _sendReplyMessageWithResult:error:event:client:]( v12,  "_sendReplyMessageWithResult:error:event:client:",  v13,  v10,  v6,  v7);
}

- (void)_handleSessionProvidingRequestTypeActivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int64_t int64 = xpc_dictionary_get_int64(v10, "activateReason");
  int64_t v12 = xpc_dictionary_get_int64(v10, "dynamicAttribute");
  string = (char *)xpc_dictionary_get_string(v10, "dictationRequestBundleId");

  if (string) {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  int v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeActivateMessage:messageBody:client:]";
    __int16 v27 = 1026;
    *(_DWORD *)v28 = int64;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v12;
    __int16 v29 = 2114;
    v30 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Session activate reason : %{public}u, dynamicAttributeType : %{public}u, bundleId: %{public}@",  buf,  0x22u);
  }

  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v24 = 0LL;
    id v16 = -[CSAudioSessionProviding activateAudioSessionWithReason:dynamicAttribute:bundleID:error:]( audioSessionProvider,  "activateAudioSessionWithReason:dynamicAttribute:bundleID:error:",  int64,  v12,  string,  &v24);
    id v17 = v24;
    if ((v16 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      [v18 notifyActivateAudioSessionWithReason:int64];
    }

    else
    {
      v21 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeActivateMessage:messageBody:client:]";
        __int16 v27 = 2114;
        *(void *)v28 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Failed to activate audio session, error : %{public}@",  buf,  0x16u);
      }
    }

    __int16 v19 = self;
    id v20 = v16;
  }

  else
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1351LL,  0LL));
    __int16 v19 = self;
    id v20 = 0LL;
  }

  -[CSAudioSessionProvidingProxy _sendReplyMessageWithResult:error:event:client:]( v19,  "_sendReplyMessageWithResult:error:event:client:",  v20,  v17,  v8,  v9);
}

- (void)_handleSessionProvidingRequestTypeDeactivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t int64 = xpc_dictionary_get_int64(a4, "deactivateOption");
  v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:]";
    __int16 v22 = 1026;
    LODWORD(v23) = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Session activate reason : %{public}u",  buf,  0x12u);
  }

  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v19 = 0LL;
    id v13 = -[CSAudioSessionProviding deactivateAudioSession:error:]( audioSessionProvider,  "deactivateAudioSession:error:",  int64,  &v19);
    id v14 = v19;
    if ((v13 & 1) == 0)
    {
      v15 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v21 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:]";
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to deactivate audio session, error : %{public}@",  buf,  0x16u);
      }
    }

    -[CSAudioSessionProvidingProxy _sendReplyMessageWithResult:error:event:client:]( self,  "_sendReplyMessageWithResult:error:event:client:",  v13,  v14,  v8,  v9);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    [v16 notifyReleaseAudioSession];
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1351LL,  0LL));
    -[CSAudioSessionProvidingProxy _sendReplyMessageWithResult:error:event:client:]( self,  "_sendReplyMessageWithResult:error:event:client:",  0LL,  v14,  v8,  v9);
  }
}

- (void)_handleSessionProvidingRequestTypeSetDuckOthersOption:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "setDuckOthersOption");
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:]";
    __int16 v12 = 1026;
    BOOL v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Session set duck others option : %{public}d",  (uint8_t *)&v10,  0x12u);
  }

  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    -[CSAudioSessionProviding setDuckOthersOption:](audioSessionProvider, "setDuckOthersOption:", v6);
  }

  else
  {
    id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Trying to set duck others option when audioSessionProvider is nil",  (uint8_t *)&v10,  0xCu);
    }
  }

- (void)_handleSessionProvidingRequestTypeDuckAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manualDuckingHandler)
  {
    uint64_t int64 = xpc_dictionary_get_uint64(v9, "audioDeviceID");
    float v12 = xpc_dictionary_get_double(v9, "duckLevel");
    double v13 = xpc_dictionary_get_double(v9, "rampDuration");
    *(float *)&double v14 = v13;
    *(float *)&double v13 = v12;
    -[CSManualDuckingHandler duckAudioDeviceWithDeviceID:duckedLevel:rampDuration:]( self->_manualDuckingHandler,  "duckAudioDeviceWithDeviceID:duckedLevel:rampDuration:",  uint64,  v13,  v14);
  }

  else
  {
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      id v17 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckAudioDevice:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Manual ducking handler not supported!",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manualDuckingHandler)
  {
    float v11 = xpc_dictionary_get_double(v9, "duckLevel");
    double v12 = xpc_dictionary_get_double(v9, "rampDuration");
    *(float *)&double v13 = v12;
    *(float *)&double v12 = v11;
    -[CSManualDuckingHandler duckDefaultOutputAudioDeviceWithDuckedLevel:rampDuration:]( self->_manualDuckingHandler,  "duckDefaultOutputAudioDeviceWithDuckedLevel:rampDuration:",  v12,  v13);
  }

  else
  {
    double v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      int v16 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Manual ducking handler not supported!",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeEnableMiniDucking:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "enableMiniDucking");
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"DISABLE";
    if (v6) {
      id v8 = @"ENABLE";
    }
    int v11 = 136315394;
    double v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:]";
    __int16 v13 = 2114;
    double v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Session %{public}@ mini ducking",  (uint8_t *)&v11,  0x16u);
  }

  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    -[CSAudioSessionProviding enableMiniDucking:](audioSessionProvider, "enableMiniDucking:", v6);
  }

  else
  {
    id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      double v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Trying to enalbe mini ducking when audioSessionProvider is nil",  (uint8_t *)&v11,  0xCu);
    }
  }

- (void)_handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "enableSmartRoutingConsideration");
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"DISABLE";
    if (v6) {
      id v8 = @"ENABLE";
    }
    int v11 = 136315394;
    double v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:]";
    __int16 v13 = 2114;
    double v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Session %{public}@ smart routing consideration",  (uint8_t *)&v11,  0x16u);
  }

  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    -[CSAudioSessionProviding enableSmartRoutingConsideration:]( audioSessionProvider,  "enableSmartRoutingConsideration:",  v6);
  }

  else
  {
    id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      double v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Trying to enable smart routing consideration when audioSessionProvider is nil",  (uint8_t *)&v11,  0xCu);
    }
  }

- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6
{
  id v12 = a4;
  id v9 = (_xpc_connection_s *)a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a5);
  xpc_dictionary_set_BOOL(reply, "result", a3);
  if (v12)
  {
    id v11 = objc_claimAutoreleasedReturnValue([v12 domain]);
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v12 code]);
  }

  xpc_connection_send_message(v9, reply);
}

- (void)audioSessionProviderBeginInterruption:(id)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(2LL);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v4);
}

- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(3LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "interruptionContext", v7);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionProviderEndInterruption:(id)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(4LL);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v4);
}

- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  *(_OWORD *)keys = *(_OWORD *)&off_10022DFE0;
  v8[0] = xpc_int64_create(1LL);
  v8[1] = xpc_BOOL_create(a4);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6, v8[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  *(_OWORD *)keys = *(_OWORD *)&off_10022DFF0;
  v8[0] = xpc_int64_create(5LL);
  v8[1] = xpc_BOOL_create(a4);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6, v8[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(6LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(7LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(8LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(9LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4
{
  xpc_object_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioSessionProvidingProxy audioSessionProvider:providerInvalidated:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  *(void *)buf = "type";
  xpc_object_t values = xpc_int64_create(10LL);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, &values, 1uLL);
  xpc_dictionary_set_BOOL(v7, "streamHandleIdInvalidationflag", a4);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v7);
}

- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(11LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_dictionary_set_BOOL(v6, "didChangeContextFlag", a4);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_10022E270;
  v9[0] = xpc_int64_create(3LL);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioSessionProvidingProxy xpcConnection](self, "xpcConnection", v9[0]));
  [v7 sendMessageToClient:v6];

  for (uint64_t i = 1LL; i != -1; --i)
}

- (CSAudioSessionProviding)audioSessionProvider
{
  return self->_audioSessionProvider;
}

- (void)setAudioSessionProvider:(id)a3
{
}

- (CSClientXPCConnection)xpcConnection
{
  return (CSClientXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (unint64_t)streamClientType
{
  return self->_streamClientType;
}

- (void)setStreamClientType:(unint64_t)a3
{
  self->_unint64_t streamClientType = a3;
}

- (CSManualDuckingHandler)manualDuckingHandler
{
  return self->_manualDuckingHandler;
}

- (void)setManualDuckingHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end