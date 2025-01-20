@interface CSXPCClient
+ (id)createAudioStreamMessageWithRequest:(id)a3;
+ (id)createPrepareAudioStreamMessageWithRequest:(id)a3;
+ (id)createStartAudioStreamMessageWithOption:(id)a3;
+ (id)createStopAudioStreamMessageWithOption:(id)a3;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)isConnected;
- (BOOL)isNarrowBand;
- (BOOL)isRecording;
- (BOOL)playAlertSoundForType:(int64_t)a3;
- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3;
- (BOOL)prepareAudioProviderWithContext:(id)a3 clientType:(unint64_t)a4 error:(id *)a5;
- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithError:(id *)a3;
- (BOOL)sendMessageAndReplySync:(id)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 error:(id *)a4;
- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3;
- (CSAudioAlertProvidingDelegate)audioAlertProvidingDelegate;
- (CSAudioSessionProvidingDelegate)audioSessionProvidingDelegate;
- (CSAudioStream)audioStream;
- (CSAudioStreamProvidingDelegate)audioStreamProvidingDelegate;
- (CSXPCClient)initWithType:(unint64_t)a3;
- (CSXPCClientDelegate)delegate;
- (NSHashTable)audioSessionInfoObservers;
- (NSMutableSet)activationAssertions;
- (NSString)UUID;
- (OS_dispatch_queue)xpcClientQueue;
- (OS_dispatch_queue)xpcReplyQueue;
- (OS_xpc_object)xpcConnection;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)peakPowerForChannel:(unint64_t)a3;
- (id)_decodeError:(id)a3;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)audioChunkToEndFrom:(unint64_t)a3;
- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4;
- (id)audioDeviceInfo;
- (id)audioMetric;
- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (unint64_t)alertStartTime;
- (unint64_t)audioStreamId;
- (unint64_t)hostTimeFromSampleCount:(unint64_t)uint64;
- (unint64_t)sampleCountFromHostTime:(unint64_t)uint64;
- (unint64_t)xpcClientType;
- (unsigned)audioSessionIdForDeviceId:(id)a3;
- (void)_disconnect;
- (void)_handleAlertProvidingDelegateDidFinishAlertPlayback:(id)a3;
- (void)_handleAlertProvidingDelegateMessageBody:(id)a3;
- (void)_handleListenerDisconnectedError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_handleListenerMessage:(id)a3;
- (void)_handleSessionInfoProvidingDelegateInterruptionNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMessageBody:(id)a3;
- (void)_handleSessionInfoProvidingDelegateRouteChangeNotification:(id)a3;
- (void)_handleSessionProvidingDelegateBeginInterruption:(id)a3;
- (void)_handleSessionProvidingDelegateBeginInterruptionWithContext:(id)a3;
- (void)_handleSessionProvidingDelegateDidChangeContext:(id)a3;
- (void)_handleSessionProvidingDelegateDidSetAudioSession:(id)a3;
- (void)_handleSessionProvidingDelegateEndInterruption:(id)a3;
- (void)_handleSessionProvidingDelegateMessageBody:(id)a3;
- (void)_handleSessionProvidingDelegateStreamHandleIdInvalidation:(id)a3;
- (void)_handleSessionProvidingDelegateWillSetAudioSession:(id)a3;
- (void)_handleStreamProvidingDelegateChunkAvailable:(id)a3;
- (void)_handleStreamProvidingDelegateChunkForTVAvailable:(id)a3;
- (void)_handleStreamProvidingDelegateDidStopUnexpectedly:(id)a3;
- (void)_handleStreamProvidingDelegateHardwareConfigChange:(id)a3;
- (void)_handleStreamProvidingDelegateMessageBody:(id)a3;
- (void)_sendMessageAsync:(id)a3 completion:(id)a4;
- (void)_sendXPCClientType;
- (void)acousticSLResultForContext:(id)a3 completion:(id)a4;
- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5;
- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5;
- (void)cancelAudioStreamHold:(id)a3;
- (void)configureAlertBehavior:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)enableMiniDucking:(BOOL)a3;
- (void)enableSmartRoutingConsideration:(BOOL)a3;
- (void)pingpong:(id)a3;
- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)registerObserver:(id)a3;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
- (void)setActivationAssertions:(id)a3;
- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4;
- (void)setAudioAlertDelegate:(id)a3;
- (void)setAudioAlertProvidingDelegate:(id)a3;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setAudioSessionInfoObservers:(id)a3;
- (void)setAudioSessionProvidingDelegate:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvidingDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuckOthersOption:(BOOL)a3;
- (void)setMeteringEnabled:(BOOL)a3;
- (void)setXpcClientQueue:(id)a3;
- (void)setXpcClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcReplyQueue:(id)a3;
- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)triggerInfoForContext:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateMeters;
@end

@implementation CSXPCClient

- (CSXPCClient)initWithType:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSXPCClient;
  v4 = -[CSXPCClient init](&v19, "init");
  v5 = v4;
  if (v4)
  {
    CSLogInitIfNeeded(v4);
    else {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSerialQueueFixedPriority));
    }
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[CSXPCClient _getSerialQueueWithName:targetQueue:]( v5,  "_getSerialQueueWithName:targetQueue:",  @"CSXPCClient Reply Queue",  v6));
    xpcReplyQueue = v5->_xpcReplyQueue;
    v5->_xpcReplyQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CSXPCClient _getSerialQueueWithName:targetQueue:]( v5,  "_getSerialQueueWithName:targetQueue:",  @"CSXPCClient connection Queue",  v6));
    xpcClientQueue = v5->_xpcClientQueue;
    v5->_xpcClientQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activationAssertions = v5->_activationAssertions;
    v5->_activationAssertions = (NSMutableSet *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    audioSessionInfoObservers = v5->_audioSessionInfoObservers;
    v5->_audioSessionInfoObservers = (NSHashTable *)v13;

    v5->_xpcClientType = a3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 UUIDString]);
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v16;
  }

  return v5;
}

- (BOOL)isConnected
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003D93C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(xpcClientQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)connect
{
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D764;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (void)disconnect
{
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D75C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (void)_disconnect
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_set_event_handler(xpcConnection, &stru_10022AC80);
    xpc_connection_cancel(self->_xpcConnection);
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSXPCClient;
  -[CSXPCClient dealloc](&v3, "dealloc");
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  v5 = (dispatch_queue_s *)a4;
  if (v5) {
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2( (const char *)[a3 UTF8String], 0, v5);
  }
  else {
    dispatch_queue_t v6 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  a3,  kCSDefaultSerialQueueFixedPriority));
  }
  dispatch_queue_t v7 = v6;

  return v7;
}

- (void)_sendXPCClientType
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t xpcClientType = self->_xpcClientType;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CSXPCClient _sendXPCClientType]";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = xpcClientType;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Sending XPCClientType : %{public}d",  buf,  0x12u);
  }

  keys = "xpcClientType";
  xpc_object_t values = xpc_int64_create(self->_xpcClientType);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)buf = *(_OWORD *)off_10022E270;
  v9[0] = xpc_int64_create(15LL);
  id v6 = v5;
  v9[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, v9, 2uLL);
  -[CSXPCClient _sendMessageAsync:completion:](self, "_sendMessageAsync:completion:", v7, 0LL, v9[0]);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (BOOL)prepareAudioProviderWithContext:(id)a3 clientType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  char v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CSXPCClient prepareAudioProviderWithContext:clientType:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Prepare Audio Provider with Context : %{public}@",  buf,  0x16u);
  }

  *(_OWORD *)buf = *(_OWORD *)off_10022ACA0;
  *(void *)&buf[16] = "clientType";
  values[0] = xpc_int64_create(1LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v8 xpcObject]);
  values[2] = xpc_uint64_create(a4);
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)buf, values, 3uLL);
  *(_OWORD *)keys = *(_OWORD *)off_10022E270;
  v17[0] = xpc_int64_create(13LL);
  id v11 = v10;
  v17[1] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, v17, 2uLL);
  BOOL v13 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v12, a5, v17[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 2LL; j != -1; --j)

  return v13;
}

- (void)pingpong:(id)a3
{
  xpc_object_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  char v9 = sub_10003D744;
  xpc_object_t v10 = &unk_10022E650;
  id v11 = a3;
  id v4 = v11;
  xpc_object_t v5 = objc_retainBlock(&v7);
  keys = "type";
  xpc_object_t values = xpc_int64_create(1LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v6, v5, v7, v8, v9, v10);
}

- (BOOL)prewarmAudioSessionWithError:(id *)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(1LL);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)xpc_object_t v12 = *(_OWORD *)off_10022E270;
  v11[0] = xpc_int64_create(2LL);
  id v6 = v5;
  v11[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  return v8;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6
{
  *(_OWORD *)keys = *(_OWORD *)off_10022ACB8;
  __int128 v23 = *(_OWORD *)off_10022ACC8;
  if (a5) {
    xpc_object_t v10 = xpc_string_create((const char *)[a5 UTF8String]);
  }
  else {
    xpc_object_t v10 = 0LL;
  }
  values[0] = xpc_int64_create(2LL);
  values[1] = xpc_int64_create(a3);
  values[2] = xpc_int64_create(a4);
  id v11 = v10;
  xpc_object_t values[3] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  *(_OWORD *)v20 = *(_OWORD *)off_10022E270;
  v19[0] = xpc_int64_create(2LL);
  id v13 = v12;
  v19[1] = v13;
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  BOOL v15 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v14, a6, v19[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 3LL; j != -1; --j)

  return v15;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  *(_OWORD *)keys = *(_OWORD *)off_10022ACD8;
  values[0] = xpc_int64_create(3LL);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)BOOL v15 = *(_OWORD *)off_10022E270;
  v14[0] = xpc_int64_create(2LL);
  id v8 = v7;
  v14[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  BOOL v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return v10;
}

- (void)setDuckOthersOption:(BOOL)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022ACE8;
  values[0] = xpc_int64_create(5LL);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(2LL);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0LL, v10[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)
}

- (void)enableSmartRoutingConsideration:(BOOL)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022ACF8;
  values[0] = xpc_int64_create(9LL);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(2LL);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0LL, v10[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)
}

- (void)enableMiniDucking:(BOOL)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD08;
  values[0] = xpc_int64_create(6LL);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(2LL);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0LL, v10[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)
}

- (void)setAudioSessionDelegate:(id)a3
{
}

- (void)setAudioAlertDelegate:(id)a3
{
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  id v8 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_10022AD18;
  v22 = "forceSetAlert";
  values[0] = xpc_int64_create(1LL);
  values[1] = xpc_int64_create(a4);
  xpc_object_t values[2] = xpc_BOOL_create(a5);
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

    if (v10)
    {
      id v11 = objc_claimAutoreleasedReturnValue([v8 path]);
      xpc_dictionary_set_string(v9, "soundPath", (const char *)[v11 UTF8String]);
    }
  }

  *(_OWORD *)objc_super v19 = *(_OWORD *)off_10022E270;
  v18[0] = xpc_int64_create(6LL);
  id v12 = v9;
  v18[1] = v12;
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
  BOOL v14 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v13, 0LL, v18[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 2LL; j != -1; --j)

  return v14;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD30;
  values[0] = xpc_int64_create(2LL);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)xpc_object_t v13 = *(_OWORD *)off_10022E270;
  v12[0] = xpc_int64_create(6LL);
  id v6 = v5;
  v12[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0LL, v12[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return v8;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD40;
  values[0] = xpc_int64_create(3LL);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)xpc_object_t v13 = *(_OWORD *)off_10022E270;
  v12[0] = xpc_int64_create(6LL);
  id v6 = v5;
  v12[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0LL, v12[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return v8;
}

- (unint64_t)alertStartTime
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(4LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v20 = *(_OWORD *)off_10022E270;
  v19[0] = xpc_int64_create(6LL);
  id v4 = v3;
  v19[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D5D0;
  block[3] = &unk_10022D958;
  id v12 = v5;
  xpc_object_t v13 = self;
  BOOL v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  unint64_t v8 = v16[3];

  uint64_t v9 = 1LL;
  _Block_object_dispose(&v15, 8);
  do

  while (v9 != -1);
  return v8;
}

- (void)configureAlertBehavior:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_10022AD50;
  values[0] = xpc_int64_create(5LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_cs_xpcObject"));
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(6LL);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0LL, v10[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)
}

- (void)setMeteringEnabled:(BOOL)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD60;
  values[0] = xpc_int64_create(1LL);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_10022E270;
  uint64_t v6 = 1LL;
  v10[0] = xpc_int64_create(8LL);
  id v7 = v5;
  v10[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v8, 0LL, v10[0]);

  do
  while (v6 != -1);

  for (uint64_t i = 1LL; i != -1; --i)
}

- (void)updateMeters
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(2LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)xpc_object_t v8 = *(_OWORD *)off_10022E270;
  uint64_t v4 = 1LL;
  v7[0] = xpc_int64_create(8LL);
  id v5 = v3;
  v7[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v6, 0LL, v7[0]);

  do
  while (v4 != -1);
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD70;
  values[0] = xpc_int64_create(3LL);
  values[1] = xpc_uint64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)__int128 v23 = *(_OWORD *)off_10022E270;
  uint64_t v6 = 1LL;
  v22[0] = xpc_int64_create(8LL);
  id v7 = v5;
  v22[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v18 = 0LL;
  objc_super v19 = (float *)&v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D454;
  block[3] = &unk_10022D958;
  id v15 = v8;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  id v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  float v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (uint64_t i = 1LL; i != -1; --i)

  return v11;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10022AD70;
  values[0] = xpc_int64_create(4LL);
  values[1] = xpc_uint64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)__int128 v23 = *(_OWORD *)off_10022E270;
  uint64_t v6 = 1LL;
  v22[0] = xpc_int64_create(8LL);
  id v7 = v5;
  v22[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v18 = 0LL;
  objc_super v19 = (float *)&v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D2D8;
  block[3] = &unk_10022D958;
  id v15 = v8;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  id v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  float v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (uint64_t i = 1LL; i != -1; --i)

  return v11;
}

- (id)audioMetric
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(1LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v22 = *(_OWORD *)off_10022E270;
  v21[0] = xpc_int64_create(9LL);
  id v4 = v3;
  v21[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10003C030;
  objc_super v19 = sub_10003C040;
  id v20 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003CFE4;
  block[3] = &unk_10022D958;
  id v12 = v5;
  xpc_object_t v13 = self;
  BOOL v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (id)v16[5];

  uint64_t v9 = 1LL;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(_OWORD *)keys = *(_OWORD *)off_10022AE50;
    values[0] = xpc_int64_create(1LL);
    values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 xpcObject]);
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v40 = *(_OWORD *)off_10022E270;
    v39[0] = xpc_int64_create(4LL);
    id v8 = v7;
    v39[1] = v8;
    xpc_object_t v9 = xpc_dictionary_create((const char *const *)v40, v39, 2uLL);
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    v36 = sub_10003C030;
    v37 = sub_10003C040;
    id v38 = 0LL;
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_10003C030;
    v31 = sub_10003C040;
    id v32 = 0LL;
    xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
    objc_super v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    int v21 = sub_10003CF30;
    v22 = &unk_10022D9A8;
    id v11 = v9;
    id v23 = v11;
    v24 = self;
    v25 = &v33;
    v26 = &v27;
    dispatch_async_and_wait(xpcClientQueue, &v19);
    id v12 = (void *)v34[5];
    if (v12)
    {
      BOOL v13 = xpc_dictionary_get_BOOL(v12, "result");
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CSXPCClient _decodeError:](self, "_decodeError:", v34[5], v19, v20, v21, v22));
      uint64_t v15 = (void *)v28[5];
      v28[5] = v14;

      if (!a4)
      {
LABEL_9:

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v33, 8);

        for (uint64_t i = 1LL; i != -1; --i)
        for (uint64_t j = 1LL; j != -1; --j)

        goto LABEL_13;
      }
    }

    else
    {
      BOOL v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }

    *a4 = (id) v28[5];
    goto LABEL_9;
  }

  BOOL v13 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
  }
LABEL_13:

  return v13;
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    *(_OWORD *)keys = *(_OWORD *)off_10022ADD0;
    values[0] = xpc_int64_create(2LL);
    values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v8 xpcObject]);
    xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v48 = *(_OWORD *)off_10022E270;
    v47[0] = xpc_int64_create(4LL);
    id v11 = v10;
    v47[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)v48, v47, 2uLL);
    uint64_t v37 = 0LL;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = sub_10003C030;
    v41 = sub_10003C040;
    id v42 = 0LL;
    if (v12)
    {
      BOOL v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[CSXPCClient audioStreamWithRequest:streamName:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s audioStreamWithRequest for stream %{public}@",  buf,  0x16u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v44 = sub_10003C030;
      v45 = sub_10003C040;
      id v46 = 0LL;
      xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
      uint64_t v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472LL;
      v31 = sub_10003CE80;
      id v32 = &unk_10022D9A8;
      uint64_t v33 = self;
      uint64_t v35 = buf;
      id v34 = v12;
      v36 = &v37;
      dispatch_async_and_wait(xpcClientQueue, &v29);
      uint64_t v15 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v15
        && (BOOL v16 = xpc_dictionary_get_BOOL(v15, "result"),
            uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CSXPCClient _decodeError:]( self,  "_decodeError:",  *(void *)(*(void *)&buf[8] + 40LL),  v29,  v30,  v31,  v32,  v33)),  v18 = (void *)v38[5],  v38[5] = v17,  v18,  v16))
      {
        objc_super v19 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]( objc_alloc(&OBJC_CLASS___CSAudioStream),  "initWithAudioStreamProvider:streamName:streamRequest:",  self,  v9,  v8);
        audioStream = self->_audioStream;
        p_audioStream = (id *)&self->_audioStream;
        id *p_audioStream = v19;

        id v22 = *p_audioStream;
      }

      else
      {
        id v22 = 0LL;
      }

      _Block_object_dispose(buf, 8);
      if (!a5) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1253LL,  0LL));
      v25 = (void *)v38[5];
      v38[5] = v24;

      id v22 = 0LL;
      if (!a5) {
        goto LABEL_15;
      }
    }

    *a5 = (id) v38[5];
LABEL_15:
    id v23 = v22;
    _Block_object_dispose(&v37, 8);

    for (uint64_t i = 1LL; i != -1; --i)
    for (uint64_t j = 1LL; j != -1; --j)

    goto LABEL_19;
  }

  id v23 = 0LL;
  if (*a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
  }
LABEL_19:

  return v23;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10003CBF0;
  v23[3] = &unk_10022AD88;
  id v10 = a5;
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  if (v8)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[CSXPCClient createPrepareAudioStreamMessageWithRequest:]( &OBJC_CLASS___CSXPCClient,  "createPrepareAudioStreamMessageWithRequest:",  v8));
    if (v12)
    {
      BOOL v13 = (void *)v12;
      uint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSXPCClient audioStreamWithRequest:streamName:completion:]";
        __int16 v27 = 2114;
        id v28 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s audioStreamWithRequest for stream %{public}@",  buf,  0x16u);
      }

      xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      xpc_object_t v18[2] = sub_10003CC04;
      v18[3] = &unk_10022B7D0;
      v18[4] = self;
      id v16 = v13;
      id v19 = v16;
      id v20 = v9;
      id v21 = v8;
      id v22 = v11;
      dispatch_async(xpcClientQueue, v18);
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1253LL,  0LL));
      ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v17);

      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v16);
  }
}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (!v8 || !v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Invalid message: stream is nil or request is nil",  buf,  0xCu);
      if (a5) {
        goto LABEL_10;
      }
    }

    else if (a5)
    {
LABEL_10:
      BOOL v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
      goto LABEL_20;
    }

    BOOL v20 = 0;
    goto LABEL_20;
  }

  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s PrepareAudioStream %{public}@", buf, 0x16u);
  }

  *(_OWORD *)keys = *(_OWORD *)off_10022ADD0;
  values[0] = xpc_int64_create(3LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v10 xpcObject]);
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v45 = *(_OWORD *)off_10022E270;
  v44[0] = xpc_int64_create(4LL);
  id v15 = v14;
  v44[1] = v15;
  xpc_object_t v16 = xpc_dictionary_create((const char *const *)v45, v44, 2uLL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v41 = sub_10003C030;
  id v42 = sub_10003C040;
  id v43 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_10003C030;
  id v38 = sub_10003C040;
  id v39 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  id v28 = sub_10003CB3C;
  uint64_t v29 = &unk_10022D9A8;
  id v18 = v16;
  id v30 = v18;
  v31 = self;
  id v32 = buf;
  uint64_t v33 = &v34;
  dispatch_async_and_wait(xpcClientQueue, &v26);
  id v19 = *(void **)(*(void *)&buf[8] + 40LL);
  if (!v19)
  {
    BOOL v20 = 0;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  BOOL v20 = xpc_dictionary_get_BOOL(v19, "result");
  uint64_t v21 = objc_claimAutoreleasedReturnValue( -[CSXPCClient _decodeError:]( self,  "_decodeError:",  *(void *)(*(void *)&buf[8] + 40LL),  v26,  v27,  v28,  v29));
  id v22 = (void *)v35[5];
  v35[5] = v21;

  if (a5) {
LABEL_12:
  }
    *a5 = (id) v35[5];
LABEL_13:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

LABEL_20:
  return v20;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003CB28;
  v16[3] = &unk_10022E650;
  id v10 = a5;
  id v17 = v10;
  id v11 = objc_retainBlock(v16);
  uint64_t v12 = (void *)CSLogContextFacilityCoreSpeech;
  if (v8 && v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = v12;
      xpc_object_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      *(_DWORD *)buf = 136315394;
      id v19 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s PrepareAudioStream %{public}@",  buf,  0x16u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSXPCClient createPrepareAudioStreamMessageWithRequest:]( &OBJC_CLASS___CSXPCClient,  "createPrepareAudioStreamMessageWithRequest:",  v9));
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v15, v11);
  }

  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s Invalid message: stream is nil or request is nil",  buf,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v15);
  }
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(102LL);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)off_10022E270;
  v11[0] = xpc_int64_create(4LL);
  id v6 = v5;
  v11[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  return v8;
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  xpc_object_t v12[2] = sub_10003CB14;
  v12[3] = &unk_10022E650;
  id v9 = a5;
  id v13 = v9;
  id v10 = objc_retainBlock(v12);
  if (a3 && v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSXPCClient createStartAudioStreamMessageWithOption:]( &OBJC_CLASS___CSXPCClient,  "createStartAudioStreamMessageWithOption:",  v8));
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v11, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v11);
  }
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  xpc_object_t v12[2] = sub_10003CB00;
  v12[3] = &unk_10022E650;
  id v9 = a5;
  id v13 = v9;
  id v10 = objc_retainBlock(v12);
  if (a3)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSXPCClient createStopAudioStreamMessageWithOption:]( &OBJC_CLASS___CSXPCClient,  "createStopAudioStreamMessageWithOption:",  v8));
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v11, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v11);
  }
}

- (void)acousticSLResultForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003C78C;
  v20[3] = &unk_10022AE08;
  id v7 = a4;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  __int128 keys = *(_OWORD *)off_10022AE50;
  values[0] = xpc_int64_create(101LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 xpcObject]);
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)&keys, values, 2uLL);
  __int128 v25 = *(_OWORD *)off_10022E270;
  v24[0] = xpc_int64_create(4LL);
  id v10 = v9;
  v24[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)&v25, v24, 2uLL);
  uint64_t v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v11)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Sending AcousticSLResult request",  buf,  0xCu);
    }

    xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003C7A0;
    block[3] = &unk_10022E288;
    void block[4] = self;
    id v17 = v11;
    id v19 = v8;
    id v18 = v6;
    dispatch_async(xpcClientQueue, block);
  }

  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Message not valid", buf, 0xCu);
    }

    ((void (*)(void *, void))v8[2])(v8, 0LL);
  }

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)
}

- (void)triggerInfoForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10003C72C;
  v33[3] = &unk_10022AE30;
  id v7 = a4;
  id v34 = v7;
  id v8 = objc_retainBlock(v33);
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022AE50;
  values[0] = xpc_int64_create(100LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 xpcObject]);
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v45 = *(_OWORD *)off_10022E270;
  v44[0] = xpc_int64_create(4LL);
  id v10 = v9;
  v44[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)v45, v44, 2uLL);
  uint64_t v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v11)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSXPCClient triggerInfoForContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Sending VoiceTriggerInfo request",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000LL;
    v41 = sub_10003C030;
    id v42 = sub_10003C040;
    id v43 = 0LL;
    xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003C740;
    block[3] = &unk_10022D958;
    void block[4] = self;
    p___int128 buf = &buf;
    id v31 = v11;
    dispatch_async_and_wait(xpcClientQueue, block);
    xpc_object_t v14 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (!v14 || !xpc_dictionary_get_BOOL(v14, "result"))
    {
      id v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v35 = 136315138;
        uint64_t v36 = "-[CSXPCClient triggerInfoForContext:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Failed to get VoiceTriggerInfo request",  v35,  0xCu);
      }

      ((void (*)(void *, void, void))v8[2])(v8, 0LL, 0LL);
      goto LABEL_27;
    }

    xpc_object_t dictionary = xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((void *)&buf + 1) + 40LL), "voiceTriggerInfo");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    xpc_object_t v16 = xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((void *)&buf + 1) + 40LL), "rtsTriggerInfo");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v29)
    {
      id v18 = objc_alloc(&OBJC_CLASS___NSDictionary);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v18, "_cs_initWithXPCObject:", v29));

      __int16 v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v36 = "-[CSXPCClient triggerInfoForContext:completion:]";
        __int16 v37 = 2114;
        id v38 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Received VoiceTriggerInfo %{public}@",  v35,  0x16u);
      }

      if (v17)
      {
LABEL_10:
        id v21 = objc_alloc(&OBJC_CLASS___NSDictionary);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v21, "_cs_initWithXPCObject:", v17));

        id v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v35 = 136315394;
          uint64_t v36 = "-[CSXPCClient triggerInfoForContext:completion:]";
          __int16 v37 = 2114;
          id v38 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Received rtsTriggerInfo %{public}@",  v35,  0x16u);
        }

- (id)recordRoute
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(7LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)__int128 v25 = *(_OWORD *)off_10022E270;
  v24[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v24[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v25, v24, 2uLL);
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10003C030;
  id v22 = sub_10003C040;
  id v23 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C6DC;
  block[3] = &unk_10022D958;
  id v7 = v5;
  id v15 = v7;
  xpc_object_t v16 = self;
  id v17 = &v18;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v19[5];
  if (v8)
  {
    xpc_object_t value = xpc_dictionary_get_value(v8, "recordRoute");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v10)
    {
      xpc_object_t v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string((xpc_object_t)v19[5], "recordRoute"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  _Block_object_dispose(&v18, 8);
  for (uint64_t i = 1LL; i != -1; --i)

  return v10;
}

- (id)recordDeviceInfo
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(8LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v26 = *(_OWORD *)off_10022E270;
  v25[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v25[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10003C030;
  id v23 = sub_10003C040;
  id v24 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C68C;
  block[3] = &unk_10022D958;
  id v7 = v5;
  id v16 = v7;
  id v17 = self;
  uint64_t v18 = &v19;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v20[5];
  if (!v8) {
    goto LABEL_5;
  }
  xpc_object_t value = xpc_dictionary_get_value(v8, "recordDeviceInfo");
  id v10 = (CSFAudioRecordDeviceInfo *)objc_claimAutoreleasedReturnValue(value);

  if (v10)
  {
    xpc_object_t v11 = xpc_dictionary_get_value((xpc_object_t)v20[5], "recordDeviceInfo");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      id v10 = -[CSFAudioRecordDeviceInfo initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSFAudioRecordDeviceInfo),  "initWithXPCObject:",  v12);

      goto LABEL_6;
    }

- (id)audioDeviceInfo
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(12LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v22 = *(_OWORD *)off_10022E270;
  v21[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v21[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10003C030;
  uint64_t v19 = sub_10003C040;
  id v20 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C5D0;
  block[3] = &unk_10022D958;
  id v12 = v5;
  id v13 = self;
  xpc_object_t v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (id)v16[5];

  uint64_t v9 = 1LL;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (id)recordSettings
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(9LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)off_10022E270;
  v26[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v26[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v27, v26, 2uLL);
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10003C030;
  id v24 = sub_10003C040;
  id v25 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C580;
  block[3] = &unk_10022D958;
  id v7 = v5;
  id v17 = v7;
  uint64_t v18 = self;
  uint64_t v19 = &v20;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v21[5];
  if (!v8) {
    goto LABEL_5;
  }
  xpc_object_t value = xpc_dictionary_get_value(v8, "recordSettings");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (v10)
  {
    xpc_object_t v11 = xpc_dictionary_get_value((xpc_object_t)v21[5], "recordSettings");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      id v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v13, "_cs_initWithXPCObject:", v12));

      goto LABEL_6;
    }

- (BOOL)isNarrowBand
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(10LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v23 = *(_OWORD *)off_10022E270;
  v22[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v22[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10003C030;
  uint64_t v20 = sub_10003C040;
  id v21 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C530;
  block[3] = &unk_10022D958;
  id v7 = v5;
  id v13 = v7;
  xpc_object_t v14 = self;
  uint64_t v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v17[5];
  if (v8) {
    BOOL v9 = xpc_dictionary_get_BOOL(v8, "result");
  }
  else {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (uint64_t i = 1LL; i != -1; --i)

  return v9;
}

- (id)playbackRoute
{
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(11LL);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v25 = *(_OWORD *)off_10022E270;
  v24[0] = xpc_int64_create(4LL);
  id v4 = v3;
  v24[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v25, v24, 2uLL);
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10003C030;
  uint64_t v22 = sub_10003C040;
  id v23 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C4E0;
  block[3] = &unk_10022D958;
  id v7 = v5;
  id v15 = v7;
  uint64_t v16 = self;
  id v17 = &v18;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v19[5];
  if (v8)
  {
    xpc_object_t value = xpc_dictionary_get_value(v8, "playbackRoute");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v10)
    {
      xpc_object_t v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string((xpc_object_t)v19[5], "playbackRoute"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  _Block_object_dispose(&v18, 8);
  for (uint64_t i = 1LL; i != -1; --i)

  return v10;
}

- (unint64_t)audioStreamId
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    xpc_object_t v5 = "-[CSXPCClient audioStreamId]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }

  return 0LL;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSXPCClient audioChunkFrom:to:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

  return 0LL;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  xpc_object_t v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSXPCClient audioChunkFrom:to:channelIdx:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v7, 0xCu);
  }

  return 0LL;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  xpc_object_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient audioChunkToEndFrom:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }

  return 0LL;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSXPCClient audioChunkToEndFrom:channelIdx:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

  return 0LL;
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSXPCClient saveRecordingBufferFrom:to:toURL:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient saveRecordingBufferToEndFrom:toURL:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSXPCClient holdAudioStreamWithDescription:option:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

  return 0LL;
}

- (void)cancelAudioStreamHold:(id)a3
{
  xpc_object_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSXPCClient cancelAudioStreamHold:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }

- (BOOL)isRecording
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSXPCClient isRecording]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient setAnnounceCallsEnabled:withStreamHandleID:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSXPCClient attachTandemStream:toPrimaryStream:completion:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

- (void)registerObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_audioSessionInfoObservers, "addObject:");
  }
}

- (void)unregisterObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_audioSessionInfoObservers, "removeObject:");
  }
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v4 = a3;
  __int128 keys = "type";
  xpc_object_t values = xpc_int64_create(1LL);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  if (v4) {
    xpc_dictionary_set_string(v5, "deviceID", (const char *)[v4 UTF8String]);
  }
  *(_OWORD *)v26 = *(_OWORD *)off_10022E270;
  v25[0] = xpc_int64_create(10LL);
  id v6 = v5;
  v25[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  id v8 = v7;
  if (!v7)
  {
    xpc_object_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No message!!", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_11;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_10003C030;
  id v23 = sub_10003C040;
  id v24 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C494;
  block[3] = &unk_10022D958;
  void block[4] = self;
  p___int128 buf = &buf;
  id v16 = v7;
  dispatch_async_and_wait(xpcClientQueue, block);
  uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40LL);
  if (v10)
  {
    LODWORD(self) = xpc_dictionary_get_uint64(*(xpc_object_t *)(*((void *)&buf + 1) + 40LL), "sessionID");
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s NO reply!!!", v18, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  if (!v10) {
LABEL_11:
  }
    LODWORD(self) = 0;

  for (uint64_t i = 1LL; i != -1; --i)
  return self;
}

- (unint64_t)hostTimeFromSampleCount:(unint64_t)uint64
{
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchCurrentDeviceId]);

  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022AE60;
  values[0] = xpc_int64_create(1LL);
  values[1] = xpc_uint64_create(uint64);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  if (v6) {
    xpc_dictionary_set_string(v7, "deviceId", (const char *)[v6 UTF8String]);
  }
  *(_OWORD *)v26 = *(_OWORD *)off_10022E270;
  v25[0] = xpc_int64_create(14LL);
  id v8 = v7;
  v25[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  uint64_t v10 = v9;
  if (!v9)
  {
    id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient hostTimeFromSampleCount:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = uint64;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s No message for hostTimeFromSampleCount request with sampleCount %{public}llu",  buf,  0x16u);
    }

    goto LABEL_9;
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v22 = sub_10003C030;
  id v23 = sub_10003C040;
  id v24 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  xpc_object_t v17[2] = sub_10003C348;
  v17[3] = &unk_10022D758;
  v17[4] = self;
  uint64_t v19 = buf;
  id v18 = v9;
  unint64_t v20 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v17);
  uint64_t v12 = *(void *)(*(void *)&buf[8] + 40LL);
  if (v12) {
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)&buf[8] + 40LL), "replyHostTime");
  }

  _Block_object_dispose(buf, 8);
  if (!v12) {
LABEL_9:
  }
    uint64 = 0LL;

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return uint64;
}

- (unint64_t)sampleCountFromHostTime:(unint64_t)uint64
{
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022AE70;
  values[0] = xpc_int64_create(2LL);
  values[1] = xpc_uint64_create(uint64);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchCurrentDeviceId]);

  if (v7) {
    xpc_dictionary_set_string(v5, "deviceId", (const char *)[v7 UTF8String]);
  }
  *(_OWORD *)v26 = *(_OWORD *)off_10022E270;
  v25[0] = xpc_int64_create(14LL);
  id v8 = v5;
  v25[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  uint64_t v10 = v9;
  if (!v9)
  {
    id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient sampleCountFromHostTime:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = uint64;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s No message for sampleCountFromHostTime request with hostTime %{public}llu",  buf,  0x16u);
    }

    goto LABEL_9;
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v22 = sub_10003C030;
  id v23 = sub_10003C040;
  id v24 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  xpc_object_t v17[2] = sub_10003C1FC;
  v17[3] = &unk_10022D758;
  v17[4] = self;
  uint64_t v19 = buf;
  id v18 = v9;
  unint64_t v20 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v17);
  uint64_t v12 = *(void *)(*(void *)&buf[8] + 40LL);
  if (v12) {
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)&buf[8] + 40LL), "replySampleCount");
  }

  _Block_object_dispose(buf, 8);
  if (!v12) {
LABEL_9:
  }
    uint64 = 0LL;

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return uint64;
}

- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022AE80;
  values[0] = xpc_int64_create(1LL);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v15 = *(_OWORD *)off_10022E270;
  v14[0] = xpc_int64_create(17LL);
  id v8 = v7;
  v14[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  BOOL v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (uint64_t i = 1LL; i != -1; --i)
  for (uint64_t j = 1LL; j != -1; --j)

  return v10;
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C1EC;
  block[3] = &unk_10022E7D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcClientQueue, block);
}

- (void)_sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcClientQueue);
  if (v6 && (xpcConnection = self->_xpcConnection) != 0LL)
  {
    xpcReplyQueue = (dispatch_queue_s *)self->_xpcReplyQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    xpc_object_t v11[2] = sub_10003C12C;
    v11[3] = &unk_10022AE98;
    v11[4] = self;
    id v12 = v7;
    xpc_connection_send_message_with_reply(xpcConnection, v6, xpcReplyQueue, v11);
  }

  else if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1252LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (id)_decodeError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    string = (char *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
      string = (char *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  int64,  0LL));
    }
  }

  else
  {
    string = 0LL;
  }

  return string;
}

- (BOOL)sendMessageAndReplySync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10003C030;
  unint64_t v20 = sub_10003C040;
  id v21 = 0LL;
  xpcClientQueue = (dispatch_queue_s *)self->_xpcClientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  xpc_object_t v11[2] = sub_10003C048;
  v11[3] = &unk_10022D9A8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  xpc_object_t v14 = &v22;
  id v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, v11);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (void)_handleListenerEvent:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      -[CSXPCClient _handleListenerMessage:](self, "_handleListenerMessage:", v5);
      goto LABEL_11;
    }

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      -[CSXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_11;
    }

    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[CSXPCClient _handleListenerEvent:]";
      id v8 = "%s ignore unknown types of message ";
      char v9 = v7;
      uint32_t v10 = 12;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    }
  }

  else
  {
    xpc_object_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[CSXPCClient _handleListenerEvent:]";
      __int16 v14 = 2050;
      uint64_t v15 = 0LL;
      id v8 = "%s cannot handle event : event = %{public}p";
      char v9 = v11;
      uint32_t v10 = 22;
      goto LABEL_8;
    }
  }

- (void)_handleListenerMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (v4)
  {
    int64_t int64 = xpc_dictionary_get_int64(v4, "type");
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "body");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    switch(int64)
    {
      case 3LL:
        -[CSXPCClient _handleSessionProvidingDelegateMessageBody:]( self,  "_handleSessionProvidingDelegateMessageBody:",  v8);
        break;
      case 5LL:
        -[CSXPCClient _handleStreamProvidingDelegateMessageBody:]( self,  "_handleStreamProvidingDelegateMessageBody:",  v8);
        break;
      case 7LL:
        -[CSXPCClient _handleAlertProvidingDelegateMessageBody:](self, "_handleAlertProvidingDelegateMessageBody:", v8);
        break;
      case 11LL:
        -[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]( self,  "_handleSessionInfoProvidingDelegateMessageBody:",  v8);
        break;
      default:
        uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315394;
          int v12 = "-[CSXPCClient _handleListenerMessage:]";
          __int16 v13 = 2050;
          int64_t v14 = int64;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Unexpected message type : %{public}lld",  (uint8_t *)&v11,  0x16u);
        }

        break;
    }
  }

  else
  {
    char v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[CSXPCClient _handleListenerMessage:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Cannot handle nil message",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_handleListenerError:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (!v4)
  {
    uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    __int16 v13 = "-[CSXPCClient _handleListenerError:]";
    __int16 v14 = 2050;
    uint64_t v15 = 0LL;
    id v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }

  if (v4 != &_xpc_error_connection_invalid && v4 != &_xpc_error_connection_interrupted)
  {
    string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
    uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    __int16 v13 = "-[CSXPCClient _handleListenerError:]";
    __int16 v14 = 2082;
    uint64_t v15 = string;
    id v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }

  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    __int16 v13 = "-[CSXPCClient _handleListenerError:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Listener connection disconnected",  (uint8_t *)&v12,  0xCu);
  }

  -[CSXPCClient _handleListenerDisconnectedError:](self, "_handleListenerDisconnectedError:", v5);
LABEL_13:
}

- (void)_handleListenerDisconnectedError:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream", a3));
  char v5 = objc_opt_respondsToSelector(v4, "audioStreamProvider:didStopStreamUnexpectedly:");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
    [v6 audioStreamProvider:self didStopStreamUnexpectedly:1];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "CSXPCClient:didDisconnect:");

  if ((v8 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained CSXPCClient:self didDisconnect:1];
  }

- (void)_handleAlertProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s AlertProvidingDelegate messageType : %{public}lld",  (uint8_t *)&v8,  0x16u);
  }

  if (int64 == 1)
  {
    -[CSXPCClient _handleAlertProvidingDelegateDidFinishAlertPlayback:]( self,  "_handleAlertProvidingDelegateDidFinishAlertPlayback:",  v4);
  }

  else
  {
    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      char v9 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
      __int16 v10 = 2050;
      int64_t v11 = int64;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Unexpected type : %{public}lld",  (uint8_t *)&v8,  0x16u);
    }
  }
}

- (void)_handleAlertProvidingDelegateDidFinishAlertPlayback:(id)a3
{
  xpc_object_t xdict = a3;
  int int64 = xpc_dictionary_get_int64(xdict, "didFinishAlertPlayback");
  if (xpc_dictionary_get_string(xdict, "errorDomain"))
  {
    string = xpc_dictionary_get_string(xdict, "errorDomain");
    int64_t v6 = xpc_dictionary_get_int64(xdict, "errorCode");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  v6,  0LL));
  }

  else
  {
    int v8 = 0LL;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioAlertProvidingDelegate](self, "audioAlertProvidingDelegate"));
  char v10 = objc_opt_respondsToSelector(v9, "audioAlertProvidingDidFinishAlertPlayback:ofType:error:");

  if ((v10 & 1) != 0)
  {
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioAlertProvidingDelegate](self, "audioAlertProvidingDelegate"));
    [v11 audioAlertProvidingDidFinishAlertPlayback:self ofType:int64 error:v8];
  }
}

- (void)_handleSessionProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  int64_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s SessionProvidingDelegate messageType : %{public}lld",  (uint8_t *)&v8,  0x16u);
  }

  switch(int64)
  {
    case 1LL:
      -[CSXPCClient _handleSessionProvidingDelegateWillSetAudioSession:]( self,  "_handleSessionProvidingDelegateWillSetAudioSession:",  v4);
      break;
    case 2LL:
      -[CSXPCClient _handleSessionProvidingDelegateBeginInterruption:]( self,  "_handleSessionProvidingDelegateBeginInterruption:",  v4);
      break;
    case 3LL:
      -[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]( self,  "_handleSessionProvidingDelegateBeginInterruptionWithContext:",  v4);
      break;
    case 4LL:
      -[CSXPCClient _handleSessionProvidingDelegateEndInterruption:]( self,  "_handleSessionProvidingDelegateEndInterruption:",  v4);
      break;
    case 5LL:
      -[CSXPCClient _handleSessionProvidingDelegateDidSetAudioSession:]( self,  "_handleSessionProvidingDelegateDidSetAudioSession:",  v4);
      break;
    case 10LL:
      -[CSXPCClient _handleSessionProvidingDelegateStreamHandleIdInvalidation:]( self,  "_handleSessionProvidingDelegateStreamHandleIdInvalidation:",  v4);
      break;
    case 11LL:
      -[CSXPCClient _handleSessionProvidingDelegateDidChangeContext:]( self,  "_handleSessionProvidingDelegateDidChangeContext:",  v4);
      break;
    default:
      id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        char v9 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = int64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Unexpected type : %{public}lld",  (uint8_t *)&v8,  0x16u);
      }

      break;
  }
}

- (void)_handleSessionProvidingDelegateBeginInterruption:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate", a3));
  char v5 = objc_opt_respondsToSelector(v4, "audioSessionProviderBeginInterruption:");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v6 audioSessionProviderBeginInterruption:self];
  }

- (void)_handleSessionProvidingDelegateBeginInterruptionWithContext:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "interruptionContext");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v6, "_cs_initWithXPCObject:", v5));

    int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      __int16 v14 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s context : %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    char v10 = objc_opt_respondsToSelector(v9, "audioSessionProviderBeginInterruption:withContext:");

    if ((v10 & 1) != 0)
    {
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
      [v11 audioSessionProviderBeginInterruption:self withContext:v7];
    }
  }

  else
  {
    int v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      __int16 v14 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s invalid context",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)_handleSessionProvidingDelegateEndInterruption:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate", a3));
  char v5 = objc_opt_respondsToSelector(v4, "audioSessionProviderEndInterruption:");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v6 audioSessionProviderEndInterruption:self];
  }

- (void)_handleSessionProvidingDelegateWillSetAudioSession:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "willSetAudioSessionActive");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "audioSessionProvider:willSetAudioSessionActive:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v7 audioSessionProvider:self willSetAudioSessionActive:v4];
  }

- (void)_handleSessionProvidingDelegateDidSetAudioSession:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "didSetAudioSessionActive");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "audioSessionProvider:didSetAudioSessionActive:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v7 audioSessionProvider:self didSetAudioSessionActive:v4];
  }

- (void)_handleSessionProvidingDelegateStreamHandleIdInvalidation:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "streamHandleIdInvalidationflag");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "audioSessionProvider:providerInvalidated:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v7 audioSessionProvider:self providerInvalidated:v4];
  }

- (void)_handleSessionProvidingDelegateDidChangeContext:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "didChangeContextFlag");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "audioSessionProvider:didChangeContext:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate"));
    [v7 audioSessionProvider:self didChangeContext:v4];
  }

- (void)_handleSessionInfoProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  char v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s SessionInfoProvidingDelegate messageType : %{public}lld",  (uint8_t *)&v8,  0x16u);
  }

  switch(int64)
  {
    case 1LL:
      -[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]( self,  "_handleSessionInfoProvidingDelegateInterruptionNotification:",  v4);
      break;
    case 2LL:
      -[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]( self,  "_handleSessionInfoProvidingDelegateRouteChangeNotification:",  v4);
      break;
    case 3LL:
      -[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:]( self,  "_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:",  v4);
      break;
    case 4LL:
      -[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:]( self,  "_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:",  v4);
      break;
    default:
      id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        char v9 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = int64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Unexpected type : %{public}lld",  (uint8_t *)&v8,  0x16u);
      }

      break;
  }
}

- (void)_handleSessionInfoProvidingDelegateInterruptionNotification:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "notificationInfo");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v5)
  {
    char v6 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v6, "_cs_initWithXPCObject:", v5));

    int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v22 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      __int16 v23 = 2114;
      uint64_t v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Received notificationInfo %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    char v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v22 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to parse notificationInfo from raw data",  buf,  0xCu);
    }

    id v7 = 0LL;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int16 v10 = self->_audioSessionInfoObservers;
  id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v15,  "audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:") & 1) != 0) {
          objc_msgSend( v15,  "audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:",  self,  v7,  (void)v16);
        }
      }

      id v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v12);
  }
}

- (void)_handleSessionInfoProvidingDelegateRouteChangeNotification:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "notificationInfo");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v5)
  {
    char v6 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v6, "_cs_initWithXPCObject:", v5));

    int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v22 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      __int16 v23 = 2114;
      uint64_t v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Received notificationInfo %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    char v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v22 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to parse notificationInfo from raw data",  buf,  0xCu);
    }

    id v7 = 0LL;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int16 v10 = self->_audioSessionInfoObservers;
  id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v15,  "audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:") & 1) != 0) {
          objc_msgSend( v15,  "audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:",  self,  v7,  (void)v16);
        }
      }

      id v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v12);
  }
}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:(id)a3
{
  id v4 = a3;
  char v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  char v6 = self->_audioSessionInfoObservers;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v11,  "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:") & 1) != 0) {
          objc_msgSend( v11,  "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:",  self,  0,  (void)v12);
        }
      }

      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }
}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  char v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  char v6 = self->_audioSessionInfoObservers;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v11,  "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:") & 1) != 0) {
          objc_msgSend( v11,  "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:",  self,  0,  (void)v12);
        }
      }

      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }
}

- (void)_handleStreamProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  switch(int64)
  {
    case 1LL:
      -[CSXPCClient _handleStreamProvidingDelegateDidStopUnexpectedly:]( self,  "_handleStreamProvidingDelegateDidStopUnexpectedly:",  v4);
      break;
    case 2LL:
      -[CSXPCClient _handleStreamProvidingDelegateChunkAvailable:]( self,  "_handleStreamProvidingDelegateChunkAvailable:",  v4);
      break;
    case 3LL:
      -[CSXPCClient _handleStreamProvidingDelegateChunkForTVAvailable:]( self,  "_handleStreamProvidingDelegateChunkForTVAvailable:",  v4);
      break;
    case 4LL:
      -[CSXPCClient _handleStreamProvidingDelegateHardwareConfigChange:]( self,  "_handleStreamProvidingDelegateHardwareConfigChange:",  v4);
      break;
    default:
      int64_t v6 = int64;
      id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        uint64_t v9 = "-[CSXPCClient _handleStreamProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Unexpected type : %{public}lld",  (uint8_t *)&v8,  0x16u);
      }

      break;
  }
}

- (void)_handleStreamProvidingDelegateDidStopUnexpectedly:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "stopReason");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
  char v6 = objc_opt_respondsToSelector(v5, "audioStreamProvider:didStopStreamUnexpectedly:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
    [v7 audioStreamProvider:self didStopStreamUnexpectedly:int64];
  }

- (void)_handleStreamProvidingDelegateChunkAvailable:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "chunk");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v5)
  {
    id v10 = v5;
    id v6 = [[CSAudioChunk alloc] initWithXPCObject:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
    char v8 = objc_opt_respondsToSelector(v7, "audioStreamProvider:audioBufferAvailable:");

    if ((v8 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
      [v9 audioStreamProvider:self audioBufferAvailable:v6];
    }

    char v5 = v10;
  }
}

- (void)_handleStreamProvidingDelegateChunkForTVAvailable:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "chunk");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (v5)
  {
    id v10 = v5;
    id v6 = [[CSAudioChunkForTV alloc] initWithXPCObject:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
    char v8 = objc_opt_respondsToSelector(v7, "audioStreamProvider:audioChunkForTVAvailable:");

    if ((v8 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
      [v9 audioStreamProvider:self audioChunkForTVAvailable:v6];
    }

    char v5 = v10;
  }
}

- (void)_handleStreamProvidingDelegateHardwareConfigChange:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "hardwareConfig");
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
  char v6 = objc_opt_respondsToSelector(v5, "audioStreamProvider:didHardwareConfigurationChange:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSXPCClient audioStream](self, "audioStream"));
    [v7 audioStreamProvider:self didHardwareConfigurationChange:int64];
  }

- (CSAudioSessionProvidingDelegate)audioSessionProvidingDelegate
{
  return (CSAudioSessionProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionProvidingDelegate);
}

- (void)setAudioSessionProvidingDelegate:(id)a3
{
}

- (CSAudioStreamProvidingDelegate)audioStreamProvidingDelegate
{
  return (CSAudioStreamProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioStreamProvidingDelegate);
}

- (void)setAudioStreamProvidingDelegate:(id)a3
{
}

- (CSAudioAlertProvidingDelegate)audioAlertProvidingDelegate
{
  return (CSAudioAlertProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioAlertProvidingDelegate);
}

- (void)setAudioAlertProvidingDelegate:(id)a3
{
}

- (CSXPCClientDelegate)delegate
{
  return (CSXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)xpcReplyQueue
{
  return self->_xpcReplyQueue;
}

- (void)setXpcReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcClientQueue
{
  return self->_xpcClientQueue;
}

- (void)setXpcClientQueue:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
}

- (NSHashTable)audioSessionInfoObservers
{
  return self->_audioSessionInfoObservers;
}

- (void)setAudioSessionInfoObservers:(id)a3
{
}

- (unint64_t)xpcClientType
{
  return self->_xpcClientType;
}

- (void)setXpcClientType:(unint64_t)a3
{
  self->_unint64_t xpcClientType = a3;
}

- (void).cxx_destruct
{
}

+ (id)createAudioStreamMessageWithRequest:(id)a3
{
  id v3 = a3;
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022ADD0;
  values[0] = xpc_int64_create(2LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v3 xpcObject]);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)int64_t v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(4LL);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1LL; i != -1; --i)

  for (uint64_t j = 1LL; j != -1; --j)
  return v6;
}

+ (id)createPrepareAudioStreamMessageWithRequest:(id)a3
{
  id v3 = a3;
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022ADD0;
  values[0] = xpc_int64_create(3LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v3 xpcObject]);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)int64_t v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(4LL);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1LL; i != -1; --i)

  for (uint64_t j = 1LL; j != -1; --j)
  return v6;
}

+ (id)createStartAudioStreamMessageWithOption:(id)a3
{
  id v3 = a3;
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022ADE0;
  values[0] = xpc_int64_create(4LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v3 xpcObject]);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)int64_t v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(4LL);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1LL; i != -1; --i)

  for (uint64_t j = 1LL; j != -1; --j)
  return v6;
}

+ (id)createStopAudioStreamMessageWithOption:(id)a3
{
  id v3 = a3;
  *(_OWORD *)__int128 keys = *(_OWORD *)off_10022ADF0;
  values[0] = xpc_int64_create(5LL);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue([v3 xpcObject]);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)int64_t v11 = *(_OWORD *)off_10022E270;
  v10[0] = xpc_int64_create(4LL);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1LL; i != -1; --i)

  for (uint64_t j = 1LL; j != -1; --j)
  return v6;
}

@end