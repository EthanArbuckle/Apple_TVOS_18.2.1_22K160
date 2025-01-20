@interface ADClientConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)adClientConnectionAuditToken;
- (ADClientConnection)initWithXPCConnection:(id)a3;
- (BOOL)_shouldSpeak;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adTextToSpeechIsMuted;
- (BOOL)adWaitingForAudioFile;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_serviceDelegate;
- (id)_serviceDelegateWithErrorHandler:(id)a3;
- (id)currentBluetoothDevice;
- (void)_addAudioSessionAssertion:(id)a3;
- (void)_addSpeechCapturingContext:(id)a3;
- (void)_barrierWithReply:(id)a3;
- (void)_broadcastCommandDictionary:(id)a3;
- (void)_clearAssistantInfoForAccountIdentifier:(id)a3;
- (void)_computeShouldSpeak;
- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)_fetchAppContextForApplicationInfo:(id)a3 reply:(id)a4;
- (void)_handleRequestCompletedWithUUID:(id)a3 error:(id)a4;
- (void)_listInstalledServicesWithReply:(id)a3;
- (void)_logShouldSpeakState:(BOOL)a3;
- (void)_performCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)_performTaskCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)_pingServiceForIdentifier:(id)a3 reply:(id)a4;
- (void)_refreshAssistantValidation;
- (void)_registerForRingerStateNotification;
- (void)_removeAllAudioSessionAssertionsForReason:(id)a3;
- (void)_removeAllSpeechCapturingContextsForReason:(id)a3;
- (void)_requestBarrierIfNecessaryWithReply:(id)a3;
- (void)_requestBarrierWithReply:(id)a3;
- (void)_sendLargeData:(id)a3 reply:(id)a4;
- (void)_setADShouldSpeak:(BOOL)a3;
- (void)_setBluetoothDevice:(id)a3;
- (void)_setRequestCompletion:(id)a3;
- (void)_setRequestOptionsRequireTTS:(BOOL)a3;
- (void)_setServerForcedTTS:(BOOL)a3;
- (void)_speechRecordingDidFinish;
- (void)_startSpeechWithURL:(id)a3 isNarrowBand:(BOOL)a4;
- (void)_unregisterForRingerStateNotification;
- (void)_updateShouldSpeak;
- (void)_updateSpeechRequestOptions:(id)a3;
- (void)adAceConnectionWillRetryOnError:(id)a3;
- (void)adAcousticIDRequestDidFinishSuccessfully:(BOOL)a3;
- (void)adAcousticIDRequestWillStart;
- (void)adAudioSessionDidBecomeActive:(BOOL)a3;
- (void)adAudioSessionWillBecomeActive:(BOOL)a3;
- (void)adExtensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)adExtensionRequestWillStartForApplication:(id)a3;
- (void)adFailedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)adGetBulletinContext:(id)a3;
- (void)adInvalidateCurrentUserActivity;
- (void)adMusicWasDetected;
- (void)adNetworkDidBecomeActive;
- (void)adQuickStopWasHandledWithActions:(unint64_t)a3;
- (void)adRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)adRequestDidHandleFailedStartPlayback:(int64_t)a3;
- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)adRequestDidReceiveTimeoutExtensionRequestWithDuration:(double)a3;
- (void)adRequestDidUpdateResponseMode:(id)a3;
- (void)adRequestEncounteredIntermediateError:(id)a3;
- (void)adRequestRequestedDismissAssistant;
- (void)adRequestRequestedDismissAssistantWithReason:(int64_t)a3;
- (void)adRequestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)adRequestRequestedOpenURL:(id)a3 completion:(id)a4;
- (void)adRequestWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)adRequestWillReceiveCommand:(id)a3;
- (void)adServerRequestsTTSStateUnmuted:(BOOL)a3;
- (void)adSetUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)adShouldSpeakStateDidChange:(BOOL)a3;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognitionWillBeginRecognitionUpdateForTask:(id)a3;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecognizedPartialResult:(id)a3;
- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8;
- (void)adSpeechRecordingDidCancelWithContext:(id)a3;
- (void)adSpeechRecordingDidChangeAVRecordRoute:(id)a3 bluetoothDevice:(id)a4 isDucking:(BOOL)a5 isTwoShot:(BOOL)a6 speechEndHostTime:(unint64_t)a7 context:(id)a8;
- (void)adSpeechRecordingDidDetectStartPointWithContext:(id)a3;
- (void)adSpeechRecordingDidEndWithContext:(id)a3;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)adSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 context:(id)a4 completion:(id)a5;
- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4;
- (void)adSpeechRecordingWillStopWithSignpostID:(unint64_t)a3;
- (void)adStartUIRequestWithText:(id)a3 completion:(id)a4;
- (void)adWantsToCacheImage:(id)a3;
- (void)adWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4;
- (void)audioPlaybackService:(id)a3 didStopRequest:(id)a4 error:(id)a5;
- (void)audioPlaybackService:(id)a3 willStartRequest:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)bluetoothDevice:(id)a3 deviceInfoDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
- (void)bluetoothDevice:(id)a3 headphoneListeningModeDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)bluetoothDeviceDidInvalidate:(id)a3;
- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4;
- (void)cancelRequestForReason:(int64_t)a3 withError:(id)a4;
- (void)cancelSpeech;
- (void)clearContext;
- (void)connectionDisconnected;
- (void)continuePendingSpeechRequestWithId:(unint64_t)a3 fromTimestamp:(double)a4;
- (void)dealloc;
- (void)didDismissUI;
- (void)emitHomeMetricInvocationEvent;
- (void)endSession;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3;
- (void)getSerializedCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)performGenericAceCommand:(id)a3 interruptOutstandingRequest:(BOOL)a4 reply:(id)a5;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4;
- (void)prepareForPhoneCall;
- (void)recordAWDSuccessMetrics;
- (void)recordCancellationMetrics;
- (void)recordFailureMetricsForError:(id)a3;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)requestShouldSpeakStateWithReply:(id)a3;
- (void)requestStateUpdateWithReply:(id)a3;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)rollbackClearContext;
- (void)rollbackRequest;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)setAlertContextDirty;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)startAcousticIDRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 requestId:(unint64_t)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)startRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startSpeechPronunciationRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopSpeechWithOptions:(id)a3;
- (void)telephonyRequestCompleted;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)willPresentUIWithReply:(id)a3;
- (void)willSetApplicationContextWithRefId:(id)a3;
@end

@implementation ADClientConnection

- (ADClientConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADClientConnection;
  v6 = -[ADClientConnection init](&v22, "init");
  if (v6)
  {
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ADClientConnection initWithXPCConnection:]";
      __int16 v25 = 2048;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v6->_isConnected = 1;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection _queue](v6->_xpcConnection, "_queue"));
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADTTSMutingObserver sharedInstance](&OBJC_CLASS___ADTTSMutingObserver, "sharedInstance"));
    [v11 addHandsFreeStateObserver:v10];

    v10->_ringerStateToken = -1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 audioSessionController]);
    [v13 registerObserver:v10];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 audioPlaybackService]);
    [v15 addListener:v10];

    if (AFIsInternalInstall( -[ADClientConnection _logShouldSpeakState:]( v10,  "_logShouldSpeakState:",  -[ADClientConnection _shouldSpeak](v10, "_shouldSpeak"))))
    {
      v16 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      v17 = v6->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10030C4C4;
      v21[3] = &unk_1004FCFF8;
      v21[4] = 0x4082C00000000000LL;
      v18 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v16,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v17,  v21,  600.0);
      longLivedConnectionABCTimer = v10->_longLivedConnectionABCTimer;
      v10->_longLivedConnectionABCTimer = v18;

      -[AFWatchdogTimer start](v10->_longLivedConnectionABCTimer, "start");
    }
  }

  return v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[ADClientConnection dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client Connection (pid = %d) Deallocated",  -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  -[ADClientConnection _unregisterForRingerStateNotification](self, "_unregisterForRingerStateNotification");
  -[ADClientConnection _removeAllSpeechCapturingContextsForReason:]( self,  "_removeAllSpeechCapturingContextsForReason:",  v4);
  -[ADClientConnection _removeAllAudioSessionAssertionsForReason:]( self,  "_removeAllAudioSessionAssertionsForReason:",  v4);
  -[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADClientConnection;
  -[ADClientConnection dealloc](&v5, "dealloc");
}

- (void)connectionDisconnected
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADClientConnection connectionDisconnected]";
    __int16 v18 = 2048;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client Connection (pid = %d) Disconnected",  -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030C3F4;
  block[3] = &unk_1004FD968;
  block[4] = self;
  v15 = v4;
  v6 = v4;
  dispatch_async(queue, block);
  v7 = self;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADTTSMutingObserver sharedInstance](&OBJC_CLASS___ADTTSMutingObserver, "sharedInstance"));
  [v8 removeHandsFreeStateObserver:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioSessionController]);
  [v10 unregisterObserver:v7];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioPlaybackService]);
  [v12 removeListener:v7];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v13 setConfiguration:0 forClient:v7];
}

- (id)_serviceDelegate
{
  return -[NSXPCConnection remoteObjectProxy](self->_xpcConnection, "remoteObjectProxy");
}

- (id)_serviceDelegateWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  xpcConnection = self->_xpcConnection;
  if (v4 && !xpcConnection)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 12LL));
    v4[2](v4, v6);

    xpcConnection = self->_xpcConnection;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcConnection,  "remoteObjectProxyWithErrorHandler:",  v4));

  return v7;
}

- (void)_updateSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = "-[ADClientConnection _updateSpeechRequestOptions:]";
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p options = %@", (uint8_t *)&v9, 0x20u);
  }

  v6 = (AFSpeechRequestOptions *)[v4 copy];
  requestOptions = self->_requestOptions;
  self->_requestOptions = v6;

  id v8 = [v4 activationEvent];
  if (v8 && v8 != (id)5) {
    -[ADClientConnection _setRequestOptionsRequireTTS:]( self,  "_setRequestOptionsRequireTTS:",  AFSpeechEventIsVoiceTrigger(v8));
  }
}

- (void)_speechRecordingDidFinish
{
  if (-[AFSpeechRequestOptions releaseAudioSessionOnRecordingCompletion]( self->_requestOptions,  "releaseAudioSessionOnRecordingCompletion"))
  {
    -[ADClientConnection _removeAllAudioSessionAssertionsForReason:]( self,  "_removeAllAudioSessionAssertionsForReason:",  @"Request Options Specified Release Audio Session On Recording Completion");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v3 forceAudioSessionInactiveWithOptions:1 completion:0];
  }

  requestOptions = self->_requestOptions;
  self->_requestOptions = 0LL;
}

- (void)_setBluetoothDevice:(id)a3
{
  objc_super v5 = (AFBluetoothDevice *)a3;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[ADClientConnection _setBluetoothDevice:]";
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@", (uint8_t *)&v8, 0x20u);
  }

  bluetoothDevice = self->_bluetoothDevice;
  if (bluetoothDevice != v5)
  {
    -[AFBluetoothDevice removeObserver:](bluetoothDevice, "removeObserver:", self);
    objc_storeStrong((id *)&self->_bluetoothDevice, a3);
    -[AFBluetoothDevice addObserver:](self->_bluetoothDevice, "addObserver:", self);
  }
}

- (void)_addSpeechCapturingContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "-[ADClientConnection _addSpeechCapturingContext:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s %p speechCapturingContext = %@",  (uint8_t *)&v9,  0x20u);
  }

  if (v4)
  {
    speechCapturingContexts = self->_speechCapturingContexts;
    if (!speechCapturingContexts)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      int v8 = self->_speechCapturingContexts;
      self->_speechCapturingContexts = v7;

      speechCapturingContexts = self->_speechCapturingContexts;
    }

    -[NSMutableOrderedSet addObject:](speechCapturingContexts, "addObject:", v4);
  }
}

- (void)_removeAllSpeechCapturingContextsForReason:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v22 = "-[ADClientConnection _removeAllSpeechCapturingContextsForReason:]";
    __int16 v23 = 2048;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10030C2D4;
  v17[3] = &unk_1004FBA88;
  id v6 = v4;
  id v18 = v6;
  v19 = self;
  id v7 = +[AFAssertionContext newWithBuilder:](&OBJC_CLASS___AFAssertionContext, "newWithBuilder:", v17);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  int v8 = self->_speechCapturingContexts;
  id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      __int16 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "relinquishAudioSessionAssertionsWithContext:",  v7,  (void)v13);
        __int16 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v20,  16LL);
    }

    while (v10);
  }

  -[NSMutableOrderedSet removeAllObjects](self->_speechCapturingContexts, "removeAllObjects");
}

- (void)_addAudioSessionAssertion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADClientConnection _addAudioSessionAssertion:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s %p audioSessionAssertion = %@",  (uint8_t *)&v9,  0x20u);
  }

  if (v4)
  {
    audioSessionAssertions = self->_audioSessionAssertions;
    if (!audioSessionAssertions)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      int v8 = self->_audioSessionAssertions;
      self->_audioSessionAssertions = v7;

      audioSessionAssertions = self->_audioSessionAssertions;
    }

    -[NSMutableOrderedSet addObject:](audioSessionAssertions, "addObject:", v4);
  }
}

- (void)_removeAllAudioSessionAssertionsForReason:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[ADClientConnection _removeAllAudioSessionAssertionsForReason:]";
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 2112;
    id v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10030C1B4;
  v29[3] = &unk_1004FBA88;
  id v20 = v4;
  id v30 = v20;
  v31 = self;
  id v6 = +[AFAssertionContext newWithBuilder:](&OBJC_CLASS___AFAssertionContext, "newWithBuilder:", v29);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = self->_speechCapturingContexts;
  id v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) relinquishAudioSessionAssertionsWithContext:v6];
      }

      id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
    }

    while (v9);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int16 v12 = self;
  __int16 v13 = self->_audioSessionAssertions;
  id v14 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v32,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)j);
        v19 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "-[ADClientConnection _removeAllAudioSessionAssertionsForReason:]";
          __int16 v36 = 2048;
          v37 = v12;
          __int16 v38 = 2112;
          id v39 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s %p audioSessionAssertion = %@",  buf,  0x20u);
        }

        [v18 relinquishWithContext:v6 options:0];
      }

      id v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v32,  16LL);
    }

    while (v15);
  }

  -[NSMutableOrderedSet removeAllObjects](v12->_audioSessionAssertions, "removeAllObjects");
}

- (void)adRequestWillReceiveCommand:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030C16C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adRequestDidUpdateResponseMode:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030C01C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10030BCA4;
  v19[3] = &unk_1004FB798;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  __int128 v21 = v8;
  id v22 = v7;
  id v10 = v7;
  __int16 v11 = v8;
  __int16 v12 = objc_retainBlock(v19);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030BDF8;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v17 = v9;
  id v18 = v12;
  id v14 = v12;
  id v15 = v9;
  dispatch_async(queue, block);
}

- (void)_handleRequestCompletedWithUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NSUUID isEqual:](self->_requestUUID, "isEqual:", v6))
  {
    requestCompletion = (void (**)(id, id))self->_requestCompletion;
    if (requestCompletion)
    {
      id v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        requestUUID = self->_requestUUID;
        int v18 = 136315650;
        v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
        __int16 v20 = 2048;
        __int128 v21 = self;
        __int16 v22 = 2112;
        __int128 v23 = requestUUID;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s %p Invoking request completion with UUID %@...",  (uint8_t *)&v18,  0x20u);
        requestCompletion = (void (**)(id, id))self->_requestCompletion;
      }

      requestCompletion[2](requestCompletion, v7);
      __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = self->_requestUUID;
        int v18 = 136315650;
        v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
        __int16 v20 = 2048;
        __int128 v21 = self;
        __int16 v22 = 2112;
        __int128 v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %p Invoked request completion with UUID %@.",  (uint8_t *)&v18,  0x20u);
      }

      id v13 = self->_requestCompletion;
      self->_requestCompletion = 0LL;
    }

    id v14 = self->_requestUUID;
    self->_requestUUID = 0LL;

    requestGroup = self->_requestGroup;
    self->_requestGroup = 0LL;
  }

  else
  {
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v17 = self->_requestUUID;
      int v18 = 136315906;
      v19 = "-[ADClientConnection _handleRequestCompletedWithUUID:error:]";
      __int16 v20 = 2048;
      __int128 v21 = self;
      __int16 v22 = 2112;
      __int128 v23 = v17;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s %p Ignored invoking request completion because UUID mismatched. (_requestUUID = %@, requestUUID = %@)",  (uint8_t *)&v18,  0x2Au);
    }
  }
}

- (void)adRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v13 = "-[ADClientConnection adRequestDidCompleteWithSuccess:error:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p success = %d, error = %@", buf, 0x26u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10030BA18;
  v10[3] = &unk_1004FD968;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, v10);
}

- (void)adRequestEncounteredIntermediateError:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADClientConnection adRequestEncounteredIntermediateError:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Sending intermediate error %{public}@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10030B9D8;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (id)currentBluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)adRequestDidReceiveTimeoutExtensionRequestWithDuration:(double)a3
{
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[ADClientConnection adRequestDidReceiveTimeoutExtensionRequestWithDuration:]";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s durationInSeconds: %f", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030B998;
  v7[3] = &unk_1004FD0A0;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)adStartUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B7D4;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)adRequestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10030B668;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)adRequestRequestedOpenURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B4EC;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)adGetBulletinContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030B388;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)adTextToSpeechIsMuted
{
  BOOL combinedShouldSpeakState = self->_combinedShouldSpeakState;
  v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", !combinedShouldSpeakState));
    int v7 = 136315394;
    id v8 = "-[ADClientConnection adTextToSpeechIsMuted]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  return !combinedShouldSpeakState;
}

- (void)adWantsToCacheImage:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030B280;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adExtensionRequestWillStartForApplication:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030B240;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B200;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)adRequestRequestedDismissAssistant
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B1D0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adRequestRequestedDismissAssistantWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030B190;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adQuickStopWasHandledWithActions:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030B150;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adAcousticIDRequestWillStart
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B120;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adMusicWasDetected
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B0F0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adAcousticIDRequestDidFinishSuccessfully:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030B0B0;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adSetUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B070;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)adInvalidateCurrentUserActivity
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030B040;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adAceConnectionWillRetryOnError:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030B000;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adServerRequestsTTSStateUnmuted:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030AFF0;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adRequestDidHandleFailedStartPlayback:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030AFB0;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adRequestWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10030AEA8;
  v13[3] = &unk_1004FBA38;
  id v15 = v9;
  int64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)adAudioSessionWillBecomeActive:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030AE68;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adAudioSessionDidBecomeActive:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10030AE28;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)adWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030ADE8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adFailedToLaunchAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030ADA8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adNetworkDidBecomeActive
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030AD78;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)adClientConnectionAuditToken
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
    xpcConnection = self->_xpcConnection;
  }

  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[NSXPCConnection processIdentifier](xpcConnection, "processIdentifier");
}

- (void)_setADShouldSpeak:(BOOL)a3
{
  self->_cachedADShouldSpeak = a3;
  self->_hasCachedADShouldSpeak = 1;
  -[ADClientConnection _updateShouldSpeak](self, "_updateShouldSpeak");
}

- (void)_setRequestOptionsRequireTTS:(BOOL)a3
{
  self->_requestOptionsRequireTTS = a3;
  -[ADClientConnection _updateShouldSpeak](self, "_updateShouldSpeak");
}

- (void)_setServerForcedTTS:(BOOL)a3
{
  self->_serverIsForcingTTS = a3;
  -[ADClientConnection _updateShouldSpeak](self, "_updateShouldSpeak");
  if (self->_serverIsForcingTTS) {
    -[ADClientConnection _registerForRingerStateNotification](self, "_registerForRingerStateNotification");
  }
  else {
    -[ADClientConnection _unregisterForRingerStateNotification](self, "_unregisterForRingerStateNotification");
  }
}

- (void)_registerForRingerStateNotification
{
  if (self->_ringerStateToken == -1)
  {
    int out_token = -1;
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10030AD6C;
    v7[3] = &unk_1004FB868;
    v7[4] = self;
    uint32_t v4 = notify_register_dispatch("com.apple.springboard.ringerstate", &out_token, queue, v7);
    if (v4)
    {
      uint32_t v5 = v4;
      id v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[ADClientConnection _registerForRingerStateNotification]";
        __int16 v11 = 1026;
        uint32_t v12 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s failed registering for ringer state token %{public}u",  buf,  0x12u);
      }
    }

    else
    {
      self->_ringerStateToken = out_token;
    }
  }

- (void)_unregisterForRingerStateNotification
{
  int ringerStateToken = self->_ringerStateToken;
  if (ringerStateToken != -1)
  {
    notify_cancel(ringerStateToken);
    self->_int ringerStateToken = -1;
  }

- (void)_computeShouldSpeak
{
  if (self->_hasCachedADShouldSpeak)
  {
    if (!self->_cachedADShouldSpeak) {
      goto LABEL_5;
    }
LABEL_8:
    unsigned __int8 v4 = 1;
    goto LABEL_9;
  }

  self->_hasCachedADShouldSpeak = 1;
  int v3 = sub_1001EA01C();
  self->_BOOL cachedADShouldSpeak = v3;
  if (v3) {
    goto LABEL_8;
  }
LABEL_5:
  if (self->_requestOptionsRequireTTS
    || self->_serverIsForcingTTS
    || (-[AFClientConfiguration isDeviceInStarkMode](self->_clientConfiguration, "isDeviceInStarkMode") & 1) != 0)
  {
    goto LABEL_8;
  }

  unsigned __int8 v4 = -[AFClientConfiguration isDeviceInCarDNDMode]( self->_clientConfiguration,  "isDeviceInCarDNDMode");
LABEL_9:
  self->_BOOL combinedShouldSpeakState = v4;
  uint32_t v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL cachedADShouldSpeak = self->_cachedADShouldSpeak;
    BOOL requestOptionsRequireTTS = self->_requestOptionsRequireTTS;
    BOOL serverIsForcingTTS = self->_serverIsForcingTTS;
    clientConfiguration = self->_clientConfiguration;
    id v10 = v5;
    LODWORD(clientConfiguration) = -[AFClientConfiguration isDeviceInStarkMode]( clientConfiguration,  "isDeviceInStarkMode");
    unsigned int v11 = -[AFClientConfiguration isDeviceInCarDNDMode]( self->_clientConfiguration,  "isDeviceInCarDNDMode");
    id v12 = -[AFRequestInfo options](self->_requestInfo, "options");
    BOOL combinedShouldSpeakState = self->_combinedShouldSpeakState;
    int v14 = 136316930;
    id v15 = "-[ADClientConnection _computeShouldSpeak]";
    __int16 v16 = 1024;
    BOOL v17 = cachedADShouldSpeak;
    __int16 v18 = 1024;
    BOOL v19 = requestOptionsRequireTTS;
    __int16 v20 = 1024;
    BOOL v21 = serverIsForcingTTS;
    __int16 v22 = 1024;
    int v23 = (int)clientConfiguration;
    __int16 v24 = 1024;
    unsigned int v25 = v11;
    __int16 v26 = 2048;
    id v27 = v12;
    __int16 v28 = 1024;
    BOOL v29 = combinedShouldSpeakState;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s ADShouldSpeak: %d Request Wants TTS: %d Server Wants TTS: %d Stark Mode: %d Car DND: %d Request Info Options: %lu Combined: %d",  (uint8_t *)&v14,  0x3Au);
  }

- (BOOL)_shouldSpeak
{
  return self->_combinedShouldSpeakState;
}

- (void)_updateShouldSpeak
{
  int combinedShouldSpeakState = self->_combinedShouldSpeakState;
  -[ADClientConnection _computeShouldSpeak](self, "_computeShouldSpeak");
  int v4 = self->_combinedShouldSpeakState;
  if (v4 != combinedShouldSpeakState)
  {
    uint32_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"YES";
      *(_DWORD *)id v8 = 136315650;
      *(void *)&v8[4] = "-[ADClientConnection _updateShouldSpeak]";
      *(_WORD *)&v8[12] = 2112;
      if (!v4) {
        id v6 = @"NO";
      }
      *(void *)&v8[14] = v6;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Sending should speak update: %@ to current client %@",  v8,  0x20u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADClientConnection _serviceDelegate](self, "_serviceDelegate", *(_OWORD *)v8));
    [v7 shouldSpeakChanged:self->_combinedShouldSpeakState];
  }

- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030AA70;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a8;
  kdebug_trace(722470220LL, 0LL, 0LL, 0LL, 0LL);
  kdebug_trace(722470208LL, 0LL, 0LL, 0LL, 0LL);
  id v15 = @"Siri Event";
  __int16 v26 = @"Siri Event";
  id v27 = @"ClientConnection speechRecordingDidBegin";
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
  sub_1001EAE7C(v16);

  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10030A74C;
  v21[3] = &unk_1004FB8B8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  unsigned int v25 = a4;
  id v18 = v12;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(queue, v21);
}

- (void)adSpeechRecordingDidChangeAVRecordRoute:(id)a3 bluetoothDevice:(id)a4 isDucking:(BOOL)a5 isTwoShot:(BOOL)a6 speechEndHostTime:(unint64_t)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10030A42C;
  v21[3] = &unk_1004FB8E0;
  v21[4] = self;
  id v22 = v15;
  id v23 = v16;
  id v24 = v14;
  BOOL v26 = a5;
  BOOL v27 = a6;
  unint64_t v25 = a7;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (void)adSpeechRecordingDidEndWithContext:(id)a3
{
  int v4 = @"Siri Event";
  id v8 = @"Siri Event";
  id v9 = @"speechRecordingDidEnd";
  uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  sub_1001EAE7C(v5);

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030A144;
  v7[3] = &unk_1004FD940;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidCancelWithContext:(id)a3
{
  int v4 = @"Siri Event";
  id v8 = @"Siri Event";
  id v9 = @"ClientConnection speechRecordingDidCancel";
  uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  sub_1001EAE7C(v5);

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100309E5C;
  v7[3] = &unk_1004FD940;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = @"Siri Event";
  id v13 = @"Siri Event";
  id v14 = @"ClientConnection speechRecordingDidFail";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  sub_1001EAE7C(v7);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100309B04;
  block[3] = &unk_1004FD968;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingWillStopWithSignpostID:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100309864;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100309784;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)adSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003096A4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognitionWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100309664;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10030958C;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechRecordingDidDetectStartPointWithContext:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003092AC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308F4C;
  block[3] = &unk_1004FB930;
  void block[4] = self;
  id v11 = v7;
  int64_t v12 = a3;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (BOOL)adWaitingForAudioFile
{
  return 0;
}

- (void)_logShouldSpeakState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 1427LL;
  }
  else {
    uint64_t v5 = 1428LL;
  }
  [v4 logEventWithType:v5 context:0];
}

- (void)adShouldSpeakStateDidChange:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100308F1C;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:AVAudioSessionInterruptionTypeKey]);
  id v8 = [v7 unsignedIntegerValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:AVAudioSessionInterruptionOptionKey]);
  id v10 = [v9 unsignedIntegerValue];

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100308E94;
  v13[3] = &unk_1004FCB88;
  v13[4] = self;
  id v14 = v5;
  id v15 = v8;
  id v16 = v10;
  id v12 = v5;
  dispatch_async(queue, v13);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308E60;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308DE8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308DB4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADClientConnection audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308D3C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioPlaybackService:(id)a3 willStartRequest:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100308CFC;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100308CBC;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioPlaybackService:(id)a3 didStopRequest:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308C7C;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)bluetoothDevice:(id)a3 deviceInfoDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[ADClientConnection bluetoothDevice:deviceInfoDidChangeFrom:to:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %p bluetoothDevice = %@, from = %@, to = %@",  (uint8_t *)&v12,  0x34u);
  }
}

- (void)bluetoothDevice:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    id v24 = "-[ADClientConnection bluetoothDevice:headphoneInEarDetectionStateDidChangeFrom:to:]";
    __int16 v25 = 2048;
    BOOL v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %p bluetoothDevice = %@, from = %@, to = %@",  buf,  0x34u);
  }

  uint64_t v12 = mach_absolute_time();
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030859C;
  block[3] = &unk_1004FCF60;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  uint64_t v22 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

- (void)bluetoothDevice:(id)a3 headphoneListeningModeDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136316162;
    id v11 = "-[ADClientConnection bluetoothDevice:headphoneListeningModeDidChangeFrom:to:]";
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    __int16 v18 = 2048;
    int64_t v19 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s %p bluetoothDevice = %@, from = %ld, to = %ld",  (uint8_t *)&v10,  0x34u);
  }
}

- (void)bluetoothDeviceDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ADClientConnection bluetoothDeviceDidInvalidate:]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p bluetoothDevice = %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 preheatWithStyle:a3 forOptions:v5 completion:0];
}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 preheatWithStyle:a3 forOptions:0 completion:v5];
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10030848C;
  v10[3] = &unk_1004FB9C0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 forceAudioSessionActiveWithContext:v7 completion:v10];
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client Connection (pid = %d) Requested Force Audio Session Inactive",  -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  -[ADClientConnection _removeAllAudioSessionAssertionsForReason:]( self,  "_removeAllAudioSessionAssertionsForReason:",  v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v8 forceAudioSessionInactiveWithOptions:a3 completion:v6];
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 resumeInterruptedAudioPlaybackIfNeeded];
}

- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 setLockState:v5 showingLockScreen:v4];
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 setCarDNDActive:v3];
}

- (void)setModesConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 setModesConfiguration:v3];
}

- (void)willPresentUIWithReply:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  if ((AFIsHorseman(v5) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    id v7 = NSStringFromSelector(a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 showingVisibleAssistantUIForReason:v8 completion:0];
  }

  int64_t numberOfPresentedUIs = self->_numberOfPresentedUIs;
  self->_int64_t numberOfPresentedUIs = numberOfPresentedUIs + 1;
  __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (numberOfPresentedUIs < 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v23 = "-[ADClientConnection willPresentUIWithReply:]";
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 2048;
      int64_t v27 = numberOfPresentedUIs;
      __int16 v28 = 2048;
      int64_t v29 = numberOfPresentedUIs + 1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %p numberOfPresentedUIs (%ld -> %ld)",  buf,  0x2Au);
    }

    v5[2](v5);
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      id v23 = "-[ADClientConnection willPresentUIWithReply:]";
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 2048;
      int64_t v27 = numberOfPresentedUIs;
      __int16 v28 = 2048;
      int64_t v29 = numberOfPresentedUIs + 1;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s %p numberOfPresentedUIs (%ld -> %ld)",  buf,  0x2Au);
    }

    if (!numberOfPresentedUIs)
    {
      __int16 v12 = (OS_os_transaction *)os_transaction_create("com.apple.assistant.client-connection.ui-presentation", v11);
      presentedUITransaction = self->_presentedUITransaction;
      self->_presentedUITransaction = v12;
    }

    id v14 = objc_retainBlock(self->_presentedUIReply);
    if (v14)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10030845C;
      v19[3] = &unk_1004FBFE8;
      id v20 = v5;
      id v21 = v14;
      id v15 = objc_retainBlock(v19);
      id presentedUIReply = self->_presentedUIReply;
      self->_id presentedUIReply = v15;

      id v17 = v20;
    }

    else
    {
      __int16 v18 = objc_retainBlock(v5);
      id v17 = self->_presentedUIReply;
      self->_id presentedUIReply = v18;
    }
  }
}

- (void)didDismissUI
{
  int64_t numberOfPresentedUIs = self->_numberOfPresentedUIs;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  self->_int64_t numberOfPresentedUIs = numberOfPresentedUIs - 1;
  if (numberOfPresentedUIs < 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      id v14 = "-[ADClientConnection didDismissUI]";
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2048;
      int64_t v18 = numberOfPresentedUIs;
      __int16 v19 = 2048;
      int64_t v20 = numberOfPresentedUIs - 1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s %p numberOfPresentedUIs (%ld -> %ld)",  (uint8_t *)&v13,  0x2Au);
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315906;
      id v14 = "-[ADClientConnection didDismissUI]";
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2048;
      int64_t v18 = numberOfPresentedUIs;
      __int16 v19 = 2048;
      int64_t v20 = numberOfPresentedUIs - 1;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s %p numberOfPresentedUIs (%ld -> %ld)",  (uint8_t *)&v13,  0x2Au);
    }

    if (numberOfPresentedUIs == 1)
    {
      id presentedUIReply = (void (**)(void))self->_presentedUIReply;
      if (presentedUIReply)
      {
        presentedUIReply[2]();
        id v7 = self->_presentedUIReply;
        self->_id presentedUIReply = 0LL;
      }

      presentedUITransaction = self->_presentedUITransaction;
      self->_presentedUITransaction = 0LL;

      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      __int16 v10 = NSStringFromSelector(a2);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v9 dismissedAllVisibleAssistantUIForReason:v11];

      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[ADArbitrationFeedbackManager sharedManager]( &OBJC_CLASS___ADArbitrationFeedbackManager,  "sharedManager"));
      [v12 assistantDismissed];
    }
  }

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "-[ADClientConnection setConfiguration:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p configuration = %@", (uint8_t *)&v9, 0x20u);
  }

  id v6 = (AFClientConfiguration *)[v4 copy];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v8 setConfiguration:v4 forClient:self];
}

- (void)endSession
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[ADClientConnection endSession]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  id v4 = @"Siri Event";
  id v8 = @"Siri Event";
  int v9 = @"ClientConnection endSession";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  sub_1001EAE7C(v5);

  id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client Connection (pid = %d) Requested End Session",  -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  -[ADClientConnection _removeAllSpeechCapturingContextsForReason:]( self,  "_removeAllSpeechCapturingContextsForReason:",  v6);
  -[ADClientConnection _removeAllAudioSessionAssertionsForReason:]( self,  "_removeAllAudioSessionAssertionsForReason:",  v6);
  -[ADClientConnection _setBluetoothDevice:](self, "_setBluetoothDevice:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 endSessionForDelegate:self];
}

- (void)_setRequestCompletion:(id)a3
{
  id v4 = a3;
  requestCompletion = (void (**)(id, void *))self->_requestCompletion;
  if (requestCompletion)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      requestUUID = self->_requestUUID;
      int v18 = 136315650;
      __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
      __int16 v20 = 2048;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = requestUUID;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s %p Invoking overlapping request completion with UUID %@...",  (uint8_t *)&v18,  0x20u);
      requestCompletion = (void (**)(id, void *))self->_requestCompletion;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 20LL));
    requestCompletion[2](requestCompletion, v7);

    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = self->_requestUUID;
      int v18 = 136315650;
      __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
      __int16 v20 = 2048;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %p Invoked overlapping request completion with UUID %@.",  (uint8_t *)&v18,  0x20u);
    }
  }

  id v9 = objc_retainBlock(v4);
  id v10 = self->_requestCompletion;
  self->_requestCompletion = v9;

  __int16 v11 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  __int16 v12 = self->_requestUUID;
  self->_requestUUID = v11;

  requestGroup = self->_requestGroup;
  self->_requestGroup = 0LL;

  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = self->_requestUUID;
    int v18 = 136315650;
    __int16 v19 = "-[ADClientConnection _setRequestCompletion:]";
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s %p Set new request UUID as %@.",  (uint8_t *)&v18,  0x20u);
  }
}

- (void)startRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v18 = "-[ADClientConnection startRequestWithInfo:completion:]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003083F8;
  v14[3] = &unk_1004FD740;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  -[ADClientConnection _setRequestCompletion:](self, "_setRequestCompletion:", v14);
  requestInfo = self->_requestInfo;
  self->_requestInfo = (AFRequestInfo *)v9;
  id v12 = v9;

  -[ADClientConnection _updateShouldSpeak](self, "_updateShouldSpeak");
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v13 startRequest:v12 withDelegate:self];
}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 requestId:(unint64_t)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v22 = "-[ADClientConnection startRecordingForPendingSpeechRequestWithOptions:requestId:sessionUUID:completion:]";
    __int16 v23 = 2048;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %p %@ %lu", buf, 0x2Au);
  }

  id v14 = @"Siri Event";
  __int16 v19 = @"Siri Event";
  __int16 v20 = @"ClientConnection startRecordingForPendingSpeechRequest";
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  sub_1001EAE7C(v15);

  +[AFDictationDiscoverabilitySignalsStreamManager sendSiriRequestStartedEventWithBundleIdentifier:context:userInfo:]( &OBJC_CLASS___AFDictationDiscoverabilitySignalsStreamManager,  "sendSiriRequestStartedEventWithBundleIdentifier:context:userInfo:",  @"com.apple.assistantd",  0LL,  0LL);
  -[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);
  self->_pendingRequestId = a4;
  self->_pendingRequestTimestamp = -1.0;
  -[ADClientConnection _setRequestCompletion:](self, "_setRequestCompletion:", v12);
  -[ADClientConnection _updateSpeechRequestOptions:](self, "_updateSpeechRequestOptions:", v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100308258;
  v18[3] = &unk_1004FB9E8;
  v18[4] = self;
  [v16 startRecordingForPendingSpeechRequestForDelegate:self withOptions:v10 sessionUUID:v17 completion:v18];
}

- (void)continuePendingSpeechRequestWithId:(unint64_t)a3 fromTimestamp:(double)a4
{
  unint64_t pendingRequestId = self->_pendingRequestId;
  if (pendingRequestId == a3)
  {
    -[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  a4);
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      id v8 = "-[ADClientConnection continuePendingSpeechRequestWithId:fromTimestamp:]";
      __int16 v9 = 2048;
      unint64_t v10 = pendingRequestId;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Ignoring due to id mismatch %lu != %lu",  (uint8_t *)&v7,  0x20u);
    }
  }

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  -[ADClientConnection _setRequestCompletion:](self, "_setRequestCompletion:", a5);
  -[ADClientConnection _updateSpeechRequestOptions:](self, "_updateSpeechRequestOptions:", v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 startSpeechPronunciationRequestWithDelegate:self withOptions:v9 pronunciationContext:v8];
}

- (void)startAcousticIDRequestWithOptions:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  -[ADClientConnection _setRequestCompletion:](self, "_setRequestCompletion:", a5);
  -[ADClientConnection _updateSpeechRequestOptions:](self, "_updateSpeechRequestOptions:", v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 startAcousticIDRequestWithDelegate:self withOptions:v9 context:v8];
}

- (void)updateSpeechOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "-[ADClientConnection updateSpeechOptions:]";
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }

  -[ADClientConnection _updateSpeechRequestOptions:](self, "_updateSpeechRequestOptions:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 updateSpeechOptions:v4 forDelegate:self];
}

- (void)cancelRequestForReason:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADClientConnection cancelRequestForReason:withError:]";
    __int16 v15 = 2048;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  id v8 = @"Siri Event";
  __int16 v11 = @"Siri Event";
  id v12 = @"ClientConnection cancelRequest";
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  sub_1001EAE7C(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 cancelRequestForDelegate:self reason:a3 error:v6];

  -[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);
}

- (void)rollbackRequest
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection rollbackRequest]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 rollbackRequestForDelegate:self];
}

- (void)cancelSpeech
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection cancelSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 cancelSpeechForDelegate:self];

  -[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4 = a3;
  kdebug_trace(722470204LL, 0LL, 0LL, 0LL, 0LL);
  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "-[ADClientConnection stopSpeechWithOptions:]";
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 stopSpeechWithOptions:v4 forDelegate:self];
}

- (void)requestShouldSpeakStateWithReply:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, BOOL))a3;
    v4[2](v4, -[ADClientConnection _shouldSpeak](self, "_shouldSpeak"));
  }

- (void)requestStateUpdateWithReply:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[ADClientConnection _shouldSpeak](self, "_shouldSpeak");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioSessionController]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100308240;
  v8[3] = &unk_1004FBA10;
  id v9 = v4;
  char v10 = (char)self;
  id v7 = v4;
  [v6 getAudioSessionIDWithCompletion:v8];
}

- (void)performGenericAceCommand:(id)a3 interruptOutstandingRequest:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 handleGenericAceCommand:v9 withDelegate:self interruptOutstandingRequest:v5 targetReplyQueue:self->_queue reply:v8];
}

- (void)clearContext
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection clearContext]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }

  -[ADClientConnection _setServerForcedTTS:](self, "_setServerForcedTTS:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 clearContext];
}

- (void)rollbackClearContext
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADClientConnection rollbackClearContext]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 rollbackClearContext];
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 willSetApplicationContextWithRefId:v3];
}

- (void)setApplicationContext:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 setApplicationContext:v3];
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 fetchAppicationContextForApplicationInfo:v9 supplementalContext:v8 refID:v7];
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 setOverriddenApplicationContext:v6 withContext:v5];
}

- (void)setAlertContextDirty
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 setAlertContextDirty];
}

- (void)prepareForPhoneCall
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 prepareForPhoneCall];
}

- (void)telephonyRequestCompleted
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 telephonyRequestCompleted];
}

- (void)recordFailureMetricsForError:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  objc_msgSend(v4, "_metrics_recordFailureMetricsForError:", v3);
}

- (void)recordCancellationMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  objc_msgSend(v2, "_metrics_recordCancellationMetrics");
}

- (void)recordAWDSuccessMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  objc_msgSend(v2, "_metrics_awdRequestEnd");
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 getDeferredObjectsWithIdentifiers:v6 completion:v5];
}

- (void)getSerializedCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[INCache sharedCache](&OBJC_CLASS___INCache, "sharedCache"));
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cacheableObjectForIdentifier:v13]);

          if (v15) {
            -[NSMutableSet addObject:](v7, "addObject:", v15);
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1003080F8;
    v16[3] = &unk_1004FCA50;
    id v17 = v6;
    +[INSerializedCacheItem serializeCacheableObjects:completion:]( &OBJC_CLASS___INSerializedCacheItem,  "serializeCacheableObjects:completion:",  v7,  v16);
  }
}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteTimerManager]);

    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100307F44;
      v7[3] = &unk_1004FC7E8;
      id v8 = v3;
      [v5 getSnapshotsByDeviceIdentifierWithCompletion:v7];
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
      (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v6);
    }
  }
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 audioPlaybackService]);
  [v9 startRequest:v8 options:a4 completion:v7];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 audioPlaybackService]);
  [v6 stopRequest:v5 immediately:v4];
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 audioPlaybackService]);
  [v4 stopAllRequests:v3 completion:0];
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 updateSpeechSynthesisRecord:v3];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  uint64_t v10 = -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier");
  uint64_t v11 = byte_1005780A0;
  id v12 = sub_100071CA8(v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v14 reportIssueForError:v9 type:a4 context:v8 processIdentifier:v10 walkboutStatus:v11 triggerForIDSIdentifiers:v13];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  uint64_t v13 = -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier");
  uint64_t v14 = byte_1005780A0;
  id v15 = sub_100071CA8(v13);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v17 reportIssueForError:v12 type:a4 subtype:v11 context:v10 processIdentifier:v13 walkboutStatus:v14 triggerForIDSIdentifiers:v16];
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "-[ADClientConnection reportIssueForType:subtype:context:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Telling ABC about %@", (uint8_t *)&v14, 0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  uint64_t v13 = -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier");
  [v12 reportIssueForType:v8 subType:v9 context:v10 processIdentifier:v13 walkboutStatus:byte_1005780A0];
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)_listInstalledServicesWithReply:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 _listInstalledServicesWithCompletion:v3];
}

- (void)_pingServiceForIdentifier:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  id v8 = -[ADServiceManager initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADServiceManager),  "initWithInstanceContext:",  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceManager serviceForIdentifier:](v8, "serviceForIdentifier:", v6));

  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___SAPing);
    uint64_t v11 = SiriCoreUUIDStringCreate(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 setAceId:v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100307EFC;
    v14[3] = &unk_1004FC668;
    id v15 = v5;
    [v9 handleCommand:v10 forDomain:v13 executionContext:0 reply:v14];
  }

  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
  }
}

- (void)_sendLargeData:(id)a3 reply:(id)a4
{
}

- (void)_performCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100307BD8;
  v15[3] = &unk_1004FBA38;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_performTaskCommandDictionary:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003078E4;
  block[3] = &unk_1004FD9E0;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (void)_broadcastCommandDictionary:(id)a3
{
  id v6 = (SAUIAddViews *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", a3));
  if ((-[SAUIAddViews conformsToProtocol:]( v6,  "conformsToProtocol:",  &OBJC_PROTOCOL___SAClientBoundCommand) & 1) == 0)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6));
    -[SAUIAddViews setViews:](v3, "setViews:", v4);

    id v6 = v3;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 _broadcastCommand:v6];
}

- (void)_fetchAppContextForApplicationInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10030780C;
  v9[3] = &unk_1004FC5F0;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchContextForApplicationInfo:v6 completion:v9];
}

- (void)_clearAssistantInfoForAccountIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADAccount accountForIdentifier:](&OBJC_CLASS___ADAccount, "accountForIdentifier:", a3));
  [v3 clearAssistantData];
  [v3 setServerCertificateData:0];
  [v3 setValidationData:0];
  [v3 save];
}

- (void)_barrierWithReply:(id)a3
{
}

- (void)_requestBarrierWithReply:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 requestBarrier:v3];
}

- (void)_requestBarrierIfNecessaryWithReply:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 requestBarrierIfNecessary:v3];
}

- (void)_startSpeechWithURL:(id)a3 isNarrowBand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 startSpeechRequestWithURL:v6 isNarrowBand:v4 withDelegate:self];
}

- (void)_refreshAssistantValidation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 refreshAssistantValidation];
}

- (void)emitHomeMetricInvocationEvent
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v2 emitHomeMetricInvocationEvent];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADClientConnection listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = AFPendingSpeechRequestServiceInterface();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3
{
  self->_pendingRequestTimestamp = a3;
  pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
  if (pendingSpeechRequestContinue)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[ADClientConnection _continuePendingSpeechRequestFromTimestamp:]";
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s timestamp = %f", (uint8_t *)&v8, 0x16u);
      pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
    }

    pendingSpeechRequestContinue[2](pendingSpeechRequestContinue, a3);
    id v7 = self->_pendingSpeechRequestContinue;
    self->_pendingSpeechRequestContinue = 0LL;
  }

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (void).cxx_destruct
{
}

@end