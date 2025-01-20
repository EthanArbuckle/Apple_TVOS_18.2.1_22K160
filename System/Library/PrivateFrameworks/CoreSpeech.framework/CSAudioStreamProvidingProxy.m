@interface CSAudioStreamProvidingProxy
- (BOOL)_isHubRequest;
- (BOOL)clientRequestedSkipMonitorUpdate;
- (CSAudioRecordContext)recordContext;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioStreamProviding;
- (CSAudioStreamProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (CSTriggerInfoProviding)triggerInfoProviding;
- (NSString)accessoryId;
- (NSString)recordEventUUID;
- (unint64_t)streamClientType;
- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5;
- (void)_handleAudioDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioStreamPrepareMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioStreamRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleIsNarrowband:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleIsRecordingMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handlePlaybackRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordSettings:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSetCurrentConextMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleStartAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleStopAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSupportsDuckingWithStreamHandleID:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleVoiceTriggerInfoMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)_setAllowMixableAudioWhileRecordingIfNeeded:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAccessoryId:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvidingForProxy:(id)a3;
- (void)setClientRequestedSkipMonitorUpdate:(BOOL)a3;
- (void)setInitialContext:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordEventUUID:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setTriggerInfoProviding:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioStreamProvidingProxy

- (CSAudioStreamProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAudioStreamProvidingProxy;
  v5 = -[CSAudioStreamProvidingProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[CSAudioStreamProvidingProxy setXpcConnection:](v5, "setXpcConnection:", v4);
  }

  return v6;
}

- (void)setAudioStreamProvidingForProxy:(id)a3
{
  p_audioStreamProviding = &self->_audioStreamProviding;
  id v5 = a3;
  objc_storeWeak((id *)p_audioStreamProviding, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 streamProvider]);

  if (v7 != v5)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
    unsigned int v9 = [v8 isStreaming];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v10 submitAudioIssueReport:kCSDiagnosticReporterAudioStreamDeallocDuringStreaming];

      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
        int v15 = 136315394;
        v16 = "-[CSAudioStreamProvidingProxy setAudioStreamProvidingForProxy:]";
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s Audio steam %{public}@ is still streaming when we get new streamProvider",  (uint8_t *)&v15,  0x16u);
      }
    }

    -[CSAudioStreamProvidingProxy setAudioStream:](self, "setAudioStream:", 0LL);
  }

- (void)setInitialContext:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    -[CSAudioStreamProvidingProxy setRecordContext:](self, "setRecordContext:", v6);
    if ([v6 type] == (id)17 || objc_msgSend(v6, "type") == (id)18)
    {
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
      accessoryId = self->_accessoryId;
      self->_accessoryId = v4;
    }
  }
}

- (BOOL)_isHubRequest
{
  return self->_accessoryId == 0LL;
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  connection = (_xpc_connection_s *)a4;
  id v9 = a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(reply, "result", a5);
  if (v9)
  {
    id v11 = objc_claimAutoreleasedReturnValue([v9 domain]);
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v9 code]);
  }

  xpc_connection_send_message(connection, reply);
}

- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s CSAudioStreamProvidingProxy has received xpc disconnection",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));

  if (v12)
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Trying to stop audio stream on CSAudioStreamProvidingProxy",  buf,  0xCu);
    }

    BOOL clientRequestedSkipMonitorUpdate = self->_clientRequestedSkipMonitorUpdate;
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
    unsigned __int8 v16 = [v15 isStreaming];

    BOOL v17 = clientRequestedSkipMonitorUpdate;
    if ((v16 & 1) == 0)
    {
      v18 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
        __int16 v32 = 2114;
        v33 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s audioStream %{public}@ already stopped streaming, we will skip monitor notification in this case",  buf,  0x16u);
      }

      BOOL v17 = 1;
    }

    id v22 = [[CSAudioStopStreamOption alloc] initWithStopRecordingReason:5 expectedStopHostTime:0 trailingSilenceDurationAtEndpoint:0 holdRequest:0 supportsMagus:0.0];
    -[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]( self,  "_setAllowMixableAudioWhileRecordingIfNeeded:",  1LL);
    if (!v17)
    {
      switch(self->_streamClientType)
      {
        case 1uLL:
          if (-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
            [v23 notifyWillStopStream:0 reason:1 withEventUUID:self->_recordEventUUID];
          }

          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
            [v23 notifyWillStopStream:0 reason:1 forAccessory:self->_accessoryId];
          }

          goto LABEL_19;
        case 2uLL:
          v24 = &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor;
          goto LABEL_16;
        case 3uLL:
          v24 = &OBJC_CLASS___CSCommandControlBehaviorMonitor;
LABEL_16:
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v24, "sharedInstance"));
          [v23 notifyWillStopStream:0];
          goto LABEL_19;
        case 4uLL:
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
          [v23 notifyWillStopAudioCaptureWithReason:1];
LABEL_19:

          break;
        default:
          break;
      }
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000155F0;
    v27[3] = &unk_10022A210;
    BOOL v29 = v17;
    v27[4] = self;
    id v28 = v22;
    id v26 = v22;
    [v25 stopAudioStreamWithOption:0 completion:v27];
  }
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  switch(int64)
  {
    case 1LL:
      -[CSAudioStreamProvidingProxy _handleSetCurrentConextMessage:messageBody:client:]( self,  "_handleSetCurrentConextMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 2LL:
      -[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]( self,  "_handleAudioStreamRequestMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 3LL:
      -[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]( self,  "_handleAudioStreamPrepareMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 4LL:
      -[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]( self,  "_handleStartAudioStreamMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 5LL:
      -[CSAudioStreamProvidingProxy _handleStopAudioStreamMessage:messageBody:client:]( self,  "_handleStopAudioStreamMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 6LL:
      -[CSAudioStreamProvidingProxy _handleIsRecordingMessage:messageBody:client:]( self,  "_handleIsRecordingMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 7LL:
      -[CSAudioStreamProvidingProxy _handleRecordRouteMessage:messageBody:client:]( self,  "_handleRecordRouteMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 8LL:
      -[CSAudioStreamProvidingProxy _handleRecordDeviceInfo:messageBody:client:]( self,  "_handleRecordDeviceInfo:messageBody:client:",  v8,  v9,  v10);
      break;
    case 9LL:
      -[CSAudioStreamProvidingProxy _handleRecordSettings:messageBody:client:]( self,  "_handleRecordSettings:messageBody:client:",  v8,  v9,  v10);
      break;
    case 10LL:
      -[CSAudioStreamProvidingProxy _handleIsNarrowband:messageBody:client:]( self,  "_handleIsNarrowband:messageBody:client:",  v8,  v9,  v10);
      break;
    case 11LL:
      -[CSAudioStreamProvidingProxy _handlePlaybackRouteMessage:messageBody:client:]( self,  "_handlePlaybackRouteMessage:messageBody:client:",  v8,  v9,  v10);
      break;
    case 12LL:
      -[CSAudioStreamProvidingProxy _handleAudioDeviceInfo:messageBody:client:]( self,  "_handleAudioDeviceInfo:messageBody:client:",  v8,  v9,  v10);
      break;
    default:
      int64_t v12 = int64;
      if (int64 == 100)
      {
        -[CSAudioStreamProvidingProxy _handleVoiceTriggerInfoMessage:messageBody:client:]( self,  "_handleVoiceTriggerInfoMessage:messageBody:client:",  v8,  v9,  v10);
      }

      else if (int64 == 102)
      {
        -[CSAudioStreamProvidingProxy _handleSupportsDuckingWithStreamHandleID:messageBody:client:]( self,  "_handleSupportsDuckingWithStreamHandleID:messageBody:client:",  v8,  v9,  v10);
      }

      else
      {
        v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315394;
          int v15 = "-[CSAudioStreamProvidingProxy handleXPCMessage:messageBody:client:]";
          __int16 v16 = 2050;
          int64_t v17 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Unknown body type : %{public}lld",  (uint8_t *)&v14,  0x16u);
        }
      }

      break;
  }
}

- (void)_handleSupportsDuckingWithStreamHandleID:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    id v15 = 0LL;
    id v11 = [WeakRetained supportsDuckingOnCurrentRouteWithError:&v15];
    id v12 = v15;

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  v11,  v12);
  }

  else
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v17 = "-[CSAudioStreamProvidingProxy _handleSupportsDuckingWithStreamHandleID:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Cannot handle setCurrentContext throught XPC : audioStreamProviding is nil",  buf,  0xCu);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1401LL,  0LL));
    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  v14);
    id v12 = v7;
    id v7 = v8;
    id v8 = (id)v14;
  }
}

- (void)_handleSetCurrentConextMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v11)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (v13)
    {
      uint64_t v14 = -[CSAudioRecordContext initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioRecordContext),  "initWithXPCObject:",  v13);
      -[CSAudioStreamProvidingProxy setRecordContext:](self, "setRecordContext:", v14);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      id v20 = 0LL;
      id v16 = [WeakRetained setCurrentContext:v14 error:&v20];
      id v17 = v20;

      -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v10,  v16,  v17);
    }

    else
    {
      v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[CSAudioStreamProvidingProxy _handleSetCurrentConextMessage:messageBody:client:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Cannot handle setCurrentContext throught XPC : given context is nil",  buf,  0xCu);
      }

      uint64_t v14 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
      -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v10,  0LL,  v14);
    }
  }

  else
  {
    v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CSAudioStreamProvidingProxy _handleSetCurrentConextMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Cannot handle setCurrentContext throught XPC : audioStreamProviding is nil",  buf,  0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1401LL,  0LL));
    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v10,  0LL,  v13);
  }
}

- (void)_handleAudioStreamRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a4, "audioStreamRequest");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

    if (v12)
    {
      v13 = -[CSAudioStreamRequest initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioStreamRequest),  "initWithXPCObject:",  v11);
      self->_BOOL clientRequestedSkipMonitorUpdate = -[CSAudioStreamRequest requestSkipClientMonitorUpdate]( v13,  "requestSkipClientMonitorUpdate");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      id v16 = (objc_class *)objc_opt_class(self, v15);
      id v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v30 = 0LL;
      v19 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained audioStreamWithRequest:v13 streamName:v18 error:&v30]);
      id v20 = v30;

      if (v19)
      {
        [v19 setDelegate:self];
        -[CSAudioStreamProvidingProxy setAudioStream:](self, "setAudioStream:", v19);
      }

      else
      {
        v25 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          id v28 = v25;
          BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
          *(_DWORD *)buf = 136315394;
          __int16 v32 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
          __int16 v33 = 2114;
          v34 = v29;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Getting audio stream has failed : %{public}@",  buf,  0x16u);
        }
      }

      -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v9,  v19 != 0LL,  v20);
      unint64_t streamClientType = self->_streamClientType;
      if (streamClientType == 4)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
        [v27 notifyFetchedAudioStream:v19 successfully:v19 != 0];
      }

      else
      {
        if (streamClientType != 1 || !-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest")) {
          goto LABEL_20;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
        [v27 notifyFetchedSiriClientAudioStream:v19 successfully:v19 != 0];
      }

LABEL_20:
      goto LABEL_21;
    }

    v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v32 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Cannot handle AudioStreamRequest throught XPC : audioStreamProviding is nil",  buf,  0xCu);
    }

    uint64_t v22 = CSErrorDomain;
    uint64_t v23 = 1401LL;
  }

  else
  {
    v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v32 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Cannot handle AudioStreamRequest throught XPC : given audioStreamRequest is nil",  buf,  0xCu);
    }

    uint64_t v22 = CSErrorDomain;
    uint64_t v23 = 114LL;
  }

  v13 = (CSAudioStreamRequest *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  0LL));
  -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v9,  0LL,  v13);
LABEL_21:
}

- (void)_handleAudioStreamPrepareMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a4, "audioStreamRequest");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v12)
  {
    if (v11)
    {
      v13 = -[CSAudioStreamRequest initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioStreamRequest),  "initWithXPCObject:",  v11);
    }

    else
    {
      uint64_t v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Given audioStreamRequest is nil, use default audioStreamRequest",  buf,  0xCu);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
      v13 = (CSAudioStreamRequest *)objc_claimAutoreleasedReturnValue([v16 streamRequest]);
    }

    self->_BOOL clientRequestedSkipMonitorUpdate = -[CSAudioStreamRequest requestSkipClientMonitorUpdate]( v13,  "requestSkipClientMonitorUpdate");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
      id v32 = 0LL;
      unint64_t v19 = (unint64_t)[v18 prepareAudioStreamSyncWithRequest:v13 error:&v32];
      id v20 = v32;

      if (self->_streamClientType != 1 || !-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest")) {
        goto LABEL_23;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
      [v21 notifyPreparedSiriClientAudioStream:v22 successfully:v19];
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      v25 = (objc_class *)objc_opt_class(self, v24);
      id v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      id v31 = 0LL;
      v21 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained audioStreamWithRequest:v13 streamName:v27 error:&v31]);
      id v20 = v31;

      unint64_t v19 = v21 != 0LL;
      if (v21)
      {
        [v21 setDelegate:self];
        -[CSAudioStreamProvidingProxy setAudioStream:](self, "setAudioStream:", v21);
      }

      else
      {
        id v28 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          BOOL v29 = v28;
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
          *(_DWORD *)buf = 136315394;
          v34 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
          __int16 v35 = 2114;
          v36 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Getting audio stream has failed : %{public}@",  buf,  0x16u);
        }
      }

      if (self->_streamClientType != 1 || !-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest")) {
        goto LABEL_22;
      }
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      [v22 notifyFetchedSiriClientAudioStream:v21 successfully:v21 != 0];
    }

LABEL_22:
LABEL_23:
    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v9,  v19,  v20);

    goto LABEL_24;
  }

  uint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Cannot handle PrepareRequest throught XPC : audioStreamProviding is nil",  buf,  0xCu);
  }

  v13 = (CSAudioStreamRequest *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1401LL,  0LL));
  -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v9,  0LL,  v13);
LABEL_24:
}

- (void)_handleStartAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a4, "startAudioStreamOption");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (!v11)
  {
    unint64_t v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Cannot handle startAudioStream : given audio stream option is nil",  buf,  0xCu);
    }

    uint64_t v20 = CSErrorDomain;
    uint64_t v21 = 114LL;
    goto LABEL_17;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));

  if (!v12)
  {
    uint64_t v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Cannot handle startAudioStream : audioStream is nil",  buf,  0xCu);
    }

    uint64_t v20 = CSErrorDomain;
    uint64_t v21 = 1402LL;
    goto LABEL_17;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (!v13)
  {
    uint64_t v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Cannot handle startAudioStream : audioStreamProviding is nil",  buf,  0xCu);
    }

    uint64_t v20 = CSErrorDomain;
    uint64_t v21 = 1401LL;
LABEL_17:
    uint64_t v24 = (CSAudioStartStreamOption *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  v21,  0LL));
    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v9,  0LL,  v24);
    goto LABEL_24;
  }

  uint64_t v14 = -[CSAudioStartStreamOption initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioStartStreamOption),  "initWithXPCObject:",  v11);
  -[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]( self,  "_setAllowMixableAudioWhileRecordingIfNeeded:",  1LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v16 = (NSString *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
  recordEventUUID = self->_recordEventUUID;
  self->_recordEventUUID = v16;

  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if (-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
          [v18 notifyWillStartStreamWithContext:self->_recordContext option:v14 withEventUUID:self->_recordEventUUID];
        }

        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
          [v18 notifyWillStartStreamWithContext:self->_recordContext option:v14 forAccessory:self->_accessoryId];
        }

        goto LABEL_22;
      case 2uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor,  "sharedInstance"));
        recordContext = self->_recordContext;
        id v26 = (id)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUID]);
        id v28 = -[CSAudioStartStreamOption copy](v14, "copy");
        [v18 notifyWillStartStreamWithContext:recordContext audioProviderUUID:v27 option:v28];

        goto LABEL_21;
      case 3uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSCommandControlBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSCommandControlBehaviorMonitor,  "sharedInstance"));
        BOOL v29 = self->_recordContext;
        id v26 = -[CSAudioStartStreamOption copy](v14, "copy");
        [v18 notifyWillStartStreamWithContext:v29 option:v26];
        goto LABEL_21;
      case 4uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
        id v30 = self->_recordContext;
        id v26 = -[CSAudioStartStreamOption copy](v14, "copy");
        [v18 notifyWillStartAudioCaptureWithContext:v30 option:v26];
LABEL_21:

LABEL_22:
        break;
      default:
        break;
    }
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100015424;
  v32[3] = &unk_10022A238;
  v32[4] = self;
  __int16 v33 = v14;
  id v34 = v8;
  id v35 = v9;
  uint64_t v24 = v14;
  [v31 startAudioStreamWithOption:v24 completion:v32];

LABEL_24:
}

- (void)_handleStopAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (!v11)
  {
    id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v29 = "-[CSAudioStreamProvidingProxy _handleStopAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Cannot handle stopAudioStream : audioStreamProviding is nil",  buf,  0xCu);
    }

    uint64_t v17 = CSErrorDomain;
    uint64_t v18 = 1401LL;
    goto LABEL_11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));

  if (!v12)
  {
    unint64_t v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v29 = "-[CSAudioStreamProvidingProxy _handleStopAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Cannot handle stopAudioStream : audioStream is nil",  buf,  0xCu);
    }

    uint64_t v17 = CSErrorDomain;
    uint64_t v18 = 1402LL;
LABEL_11:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  v18,  0LL));
    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v10,  0LL,  v14);
    goto LABEL_24;
  }

  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v9, "stopAudioStreamOption");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v14) {
    id v15 = [[CSAudioStopStreamOption alloc] initWithXPCObject:v14];
  }
  else {
    id v15 = 0LL;
  }
  -[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]( self,  "_setAllowMixableAudioWhileRecordingIfNeeded:",  1LL);
  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if (-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
          [v20 notifyWillStopStream:v15 reason:0 withEventUUID:self->_recordEventUUID];
        }

        else
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
          [v20 notifyWillStopStream:0 reason:0 forAccessory:self->_accessoryId];
        }

        goto LABEL_22;
      case 2uLL:
        uint64_t v21 = &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor;
        goto LABEL_19;
      case 3uLL:
        uint64_t v21 = &OBJC_CLASS___CSCommandControlBehaviorMonitor;
LABEL_19:
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v21, "sharedInstance"));
        [v20 notifyWillStopStream:0];
        goto LABEL_22;
      case 4uLL:
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
        [v20 notifyWillStopAudioCaptureWithReason:0];
LABEL_22:

        break;
      default:
        break;
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStream](self, "audioStream"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000152EC;
  v24[3] = &unk_10022A238;
  v24[4] = self;
  id v25 = v15;
  id v26 = v8;
  id v27 = v10;
  id v23 = v15;
  [v22 stopAudioStreamWithOption:v23 completion:v24];

LABEL_24:
}

- (void)_handleVoiceTriggerInfoMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = (_xpc_connection_s *)a5;
  id v9 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v9, "context");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

  if (!v12)
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[CSAudioStreamProvidingProxy _handleVoiceTriggerInfoMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Fail to parse recordContext",  buf,  0xCu);
    }
  }

  uint64_t v14 = -[CSAudioRecordContext initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioRecordContext),  "initWithXPCObject:",  v12);
  -[CSAudioStreamProvidingProxy setRecordContext:](self, "setRecordContext:", v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEventInfoProvider sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEventInfoProvider,  "sharedInstance"));
  id v20 = 0LL;
  id v21 = 0LL;
  [v15 fetchVoiceTriggerInfoWithAudioContext:v14 resultVoiceTriggerInfo:&v21 resultRTSTriggerInfo:&v20];
  id v16 = v21;
  id v17 = v20;

  xpc_dictionary_set_BOOL(reply, "result", 1);
  if (v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_cs_xpcObject"));
    xpc_dictionary_set_value(reply, "voiceTriggerInfo", v18);
  }

  if (v17)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_cs_xpcObject"));
    xpc_dictionary_set_value(reply, "rtsTriggerInfo", v19);
  }

  xpc_connection_send_message(v8, reply);
}

- (void)_handleIsRecordingMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained isRecording];

    xpc_object_t xdict = xpc_dictionary_create_reply(v8);
    xpc_dictionary_set_BOOL(xdict, "result", v11);
    xpc_connection_send_message(v7, xdict);
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSAudioStreamProvidingProxy _handleIsRecordingMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Cannot handle IsRecording : audioStreamProviding is nil",  buf,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }

- (void)_handleRecordRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained recordRoute]);

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11) {
      xpc_dictionary_set_string( reply, "recordRoute", (const char *)[v11 UTF8String]);
    }
    xpc_connection_send_message(v7, reply);
  }

  else
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      id v15 = "-[CSAudioStreamProvidingProxy _handleRecordRouteMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Cannot handle RecordRoute : audioStreamProviding is nil",  (uint8_t *)&v14,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }
}

- (void)_handleRecordDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained recordDeviceInfo]);

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 xpcObject]);
      xpc_dictionary_set_value(reply, "recordDeviceInfo", v13);
    }

    xpc_connection_send_message(v7, reply);
  }

  else
  {
    int v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[CSAudioStreamProvidingProxy _handleRecordDeviceInfo:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Cannot handle RecordDeviceInfo : audioStreamProviding is nil",  (uint8_t *)&v15,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }
}

- (void)_handleAudioDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained audioDeviceInfo]);

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 xpcObject]);
      xpc_dictionary_set_value(reply, "audioDeviceInfo", v13);
    }

    if (self->_streamClientType == 1 && -[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
      id v15 = [v11 copy];
      [v14 notifyAudioDeviceInfoUpdated:v15];
    }

    xpc_connection_send_message(v7, reply);
  }

  else
  {
    id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[CSAudioStreamProvidingProxy _handleAudioDeviceInfo:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Cannot handle AudioDeviceInfo : audioStreamProviding is nil",  (uint8_t *)&v17,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }
}

- (void)_handleRecordSettings:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained recordSettings]);

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_cs_xpcObject"));
      xpc_dictionary_set_value(reply, "recordSettings", v13);
    }

    xpc_connection_send_message(v7, reply);
  }

  else
  {
    int v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[CSAudioStreamProvidingProxy _handleRecordSettings:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Cannot handle RecordSettings : audioStreamProviding is nil",  (uint8_t *)&v15,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }
}

- (void)_handleIsNarrowband:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained isNarrowBand];

    xpc_object_t xdict = xpc_dictionary_create_reply(v8);
    xpc_dictionary_set_BOOL(xdict, "result", v11);
    xpc_connection_send_message(v7, xdict);
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[CSAudioStreamProvidingProxy _handleIsNarrowband:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Cannot handle IsNarrowband : audioStreamProviding is nil",  buf,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }

- (void)_handlePlaybackRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioStreamProvidingProxy audioStreamProviding](self, "audioStreamProviding"));

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained playbackRoute]);

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11) {
      xpc_dictionary_set_string( reply, "playbackRoute", (const char *)[v11 UTF8String]);
    }
    xpc_connection_send_message(v7, reply);
  }

  else
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      int v15 = "-[CSAudioStreamProvidingProxy _handlePlaybackRouteMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Cannot handle PlaybackRoute : audioStreamProviding is nil",  (uint8_t *)&v14,  0xCu);
    }

    -[CSAudioStreamProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v8,  v7,  0LL,  0LL);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioStreamProvidingProxy audioStreamProvider:didStopStreamUnexpectedly:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v8 = [[CSAudioStopStreamOption alloc] initWithStopRecordingReason:6 expectedStopHostTime:0 trailingSilenceDurationAtEndpoint:0 holdRequest:0 supportsMagus:0.0];
  -[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]( self,  "_setAllowMixableAudioWhileRecordingIfNeeded:",  1LL);
  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if (-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
          [v9 notifyDidStopStream:v8 withEventUUID:self->_recordEventUUID];
        }

        else
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
          [v9 notifyDidStopStream:0 reason:0 withEventUUID:self->_recordEventUUID forAccessory:self->_accessoryId];
        }

        goto LABEL_12;
      case 2uLL:
        id v10 = &OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor;
        goto LABEL_9;
      case 3uLL:
        id v10 = &OBJC_CLASS___CSCommandControlBehaviorMonitor;
LABEL_9:
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v10, "sharedInstance"));
        [v9 notifyDidStopStream:0];
        goto LABEL_12;
      case 4uLL:
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSIntuitiveConvAudioCaptureMonitor sharedInstance]( &OBJC_CLASS___CSIntuitiveConvAudioCaptureMonitor,  "sharedInstance"));
        [v9 notifyDidStopAudioCaptureWithOption:v8 eventUUID:self->_recordEventUUID error:0];
LABEL_12:

        break;
      default:
        break;
    }
  }

  *(_OWORD *)buf = *(_OWORD *)&off_10022A258;
  v13[0] = xpc_int64_create(1LL);
  v13[1] = xpc_int64_create(a4);
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)buf, v13, 2uLL);
  -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v11, v13[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  if (self->_streamClientType != 4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_10022A268;
    id v6 = objc_msgSend(v5, "xpcObject", xpc_int64_create(2));
    v9[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue(v6);
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
    -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v7);

    for (uint64_t i = 1LL; i != -1; --i)
  }
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5 = a4;
  if (self->_streamClientType != 4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_10022A268;
    id v6 = objc_msgSend(v5, "xpcObject", xpc_int64_create(3));
    v9[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue(v6);
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
    -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v7);

    for (uint64_t i = 1LL; i != -1; --i)
  }
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioStreamProvidingProxy audioStreamProvider:didHardwareConfigurationChange:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s CSAudioStreamProvidingProxy", buf, 0xCu);
  }

  *(_OWORD *)buf = *(_OWORD *)&off_10022A278;
  v9[0] = xpc_int64_create(4LL);
  v9[1] = xpc_int64_create(a4);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, v9, 2uLL);
  -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v7, v9[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_10022E270;
  v9[0] = xpc_int64_create(5LL);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "sendMessageToClient:", v6, v9[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)_setAllowMixableAudioWhileRecordingIfNeeded:(BOOL)a3
{
  if (self->_streamClientType == 1)
  {
    BOOL v3 = a3;
    if (-[CSAudioStreamProvidingProxy _isHubRequest](self, "_isHubRequest"))
    {
      id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = @"NO";
        if (v3) {
          id v5 = @"YES";
        }
        *(_DWORD *)buf = 136315394;
        int v14 = "-[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]";
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s setting allow mixable audio while recording to %{public}@",  buf,  0x16u);
      }

      xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      id v12 = 0LL;
      unsigned __int8 v7 = [v6 setAllowMixableAudioWhileRecording:v3 error:&v12];
      id v8 = v12;

      if ((v7 & 1) == 0)
      {
        id v9 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          id v10 = v9;
          xpc_object_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
          *(_DWORD *)buf = 136315394;
          int v14 = "-[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]";
          __int16 v15 = 2114;
          id v16 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to setAllowMixableAudioWhileRecording : %{public}@",  buf,  0x16u);
        }
      }
    }
  }

- (CSAudioStreamProviding)audioStreamProviding
{
  return (CSAudioStreamProviding *)objc_loadWeakRetained((id *)&self->_audioStreamProviding);
}

- (CSTriggerInfoProviding)triggerInfoProviding
{
  return (CSTriggerInfoProviding *)objc_loadWeakRetained((id *)&self->_triggerInfoProviding);
}

- (void)setTriggerInfoProviding:(id)a3
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

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
}

- (NSString)recordEventUUID
{
  return self->_recordEventUUID;
}

- (void)setRecordEventUUID:(id)a3
{
}

- (NSString)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
}

- (BOOL)clientRequestedSkipMonitorUpdate
{
  return self->_clientRequestedSkipMonitorUpdate;
}

- (void)setClientRequestedSkipMonitorUpdate:(BOOL)a3
{
  self->_BOOL clientRequestedSkipMonitorUpdate = a3;
}

- (void).cxx_destruct
{
}

@end