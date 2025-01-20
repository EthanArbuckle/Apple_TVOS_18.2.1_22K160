@interface ADExternalNotificationRequestHandler
+ (id)sharedNotificationRequestHandler;
- (BOOL)_accessibleAnnounceIsEnabled;
- (BOOL)_announceOnDeviceSpeakerAllowedForRequest:(id)a3;
- (BOOL)_canAnnounceInCarPlay;
- (BOOL)_deactivateWorkoutReminderAnnouncementWithId:(id)a3;
- (BOOL)_isDeviceSilent;
- (BOOL)speechManager:(id)a3 detectedSpeechForListeningType:(int64_t)a4 atHostTime:(float)a5 shouldHandleActivation:(BOOL)a6;
- (id)_currentRequest;
- (id)_init;
- (id)_queue;
- (id)_requestQueue;
- (id)_sharedCommandCenter;
- (int64_t)_currentState;
- (int64_t)_getAnnouncementRequestFailureReasonFromError:(id)a3;
- (int64_t)announcePlatformForCurrentRequest;
- (void)_adCallStateChangedCallIncoming:(BOOL)a3;
- (void)_changeCurrentStateToState:(int64_t)a3;
- (void)_clearCurrentNotificationTimer;
- (void)_clearRequestState;
- (void)_clearTriggerlessUserReplyTimer;
- (void)_completeNotificationsWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5;
- (void)_deactivateCarPlayNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 completion:(id)a6;
- (void)_deactivateCurrentAnnouncementRequestForReason:(int64_t)a3;
- (void)_deactivateForReason:(int64_t)a3 source:(int64_t)a4 event:(int64_t)a5 completion:(id)a6;
- (void)_deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7;
- (void)_deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5;
- (void)_emitInstrumentationEventsForRequest:(id)a3 currentlyPlayingMediaType:(id)a4;
- (void)_handleAnnounceIncomingCallRequest:(id)a3;
- (void)_handleAnnounceNotificationRequest:(id)a3;
- (void)_handleAnnouncementRequest:(id)a3;
- (void)_handleNotificationWithRequiresOpportuneTime:(BOOL)a3 completion:(id)a4;
- (void)_markThreadCancellationForCurrentRequest:(id)a3;
- (void)_processAnyQueuedAnnouncementsAfterUserSpeech;
- (void)_setCurrentRequest:(id)a3;
- (void)_shouldAnnounceGivenCurrentClientConditionsForRequest:(id)a3 completion:(id)a4;
- (void)_startAnnouncementRequest:(id)a3;
- (void)_startAnnouncementRequestIfOpportune:(id)a3;
- (void)_startAnnouncementRequestWithRequestInfo:(id)a3;
- (void)_startAttendingForSpeechIfNeededForRequest:(id)a3 completion:(id)a4;
- (void)_startObservingRouteChanges;
- (void)_startTimerToResetStateFrom:(int64_t)a3;
- (void)_startTriggerlessFollowupRequestForSpeechObservingType:(int64_t)a3 hostTime:(float)a4;
- (void)_stopCurrentRequestWithReason:(int64_t)a3 shouldCancelRequest:(BOOL)a4;
- (void)_stopObservingRouteChanges;
- (void)_triggerlessListeningTimerEnded;
- (void)_voicePromptStyleDidChange:(id)a3;
- (void)_withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4;
- (void)adCallStateChangedCallIncoming:(BOOL)a3;
- (void)announcementRequestReadyToBeAnnounced:(id)a3;
- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4;
- (void)audioSessionDidEnd;
- (void)currentAudioRouteDidChange:(id)a3;
- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3;
- (void)deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7;
- (void)deactivateWorkoutReminderAnnouncementWithId:(id)a3 completion:(id)a4;
- (void)deferAudioSessionDeactivationForAnnouncementRequest;
- (void)deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5;
- (void)emitInstrumentationEventsForRequest:(id)a3;
- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4;
- (void)handleAnnouncementRequest:(id)a3;
- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)markNotificationAsReadWithIdentifer:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifySpeechDetectedIsUndirected;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)speechManager:(id)a3 didStopUnexpectlyWithError:(id)a4;
- (void)voicePromptStyleDidChange:(id)a3;
- (void)withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4;
@end

@implementation ADExternalNotificationRequestHandler

- (id)_init
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___ADExternalNotificationRequestHandler;
  id v2 = -[ADExternalNotificationRequestHandler init](&v37, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADExternalRequestDelayedActionHandler", v4);

    v6 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("ADExternalNotificationRequestHandler Instrumentation Queue", v8);

    v10 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v9;

    *((void *)v2 + 5) = 1LL;
    v11 = objc_alloc_init(&OBJC_CLASS___ADExternalNotificationRequestQueue);
    v12 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v11;

    [*((id *)v2 + 16) setDelgate:v2];
    *((void *)v2 + 15) = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v13 addListener:v2];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 audioPlaybackService]);
    [v15 addListener:v2];

    v16 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    v17 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    v18 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v16,  "initWithName:options:queue:delegate:",  v17,  1LL,  *((void *)v2 + 10),  v2);
    v19 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___ADAnnounceSpeechManager);
    v21 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v20;

    [*((id *)v2 + 9) setDelegate:v2];
    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);

    dispatch_queue_t v26 = dispatch_queue_create("com.apple.siri.systemstateaccess", v25);
    v27 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v26;

    v28 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"com.apple.springboard.ringerstate",  1LL,  *((void *)v2 + 12),  0LL);
    v29 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    uint64_t v42 = AVSystemController_VoicePromptStyleDidChangeNotification;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    id v36 = 0LL;
    [v30 setAttribute:v31 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v36];
    id v32 = v36;

    if (v32)
    {
      v33 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[ADExternalNotificationRequestHandler _init]";
        __int16 v40 = 2114;
        id v41 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s Unable to register for VoicePromptStyleDidChange Notification on AVSystemController: %{public}@",  buf,  0x16u);
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v34 addObserver:v2 selector:"voicePromptStyleDidChange:" name:AVSystemController_VoicePromptStyleDidChangeNotification object:0];

    dispatch_async(*((dispatch_queue_t *)v2 + 10), &stru_1004FC138);
  }

  return v2;
}

- (id)_sharedCommandCenter
{
  return +[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter");
}

- (id)_requestQueue
{
  return self->_requestQueue;
}

- (int64_t)_currentState
{
  return self->_currentState;
}

- (id)_currentRequest
{
  return self->_currentRequest;
}

- (void)_setCurrentRequest:(id)a3
{
}

- (id)_queue
{
  return self->_queue;
}

- (BOOL)_isDeviceSilent
{
  dispatch_queue_attr_t v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    ringerStateObserver = self->_ringerStateObserver;
    dispatch_queue_t v5 = v3;
    int v7 = 136315394;
    v8 = "-[ADExternalNotificationRequestHandler _isDeviceSilent]";
    __int16 v9 = 2048;
    id v10 = -[AFNotifyObserver state](ringerStateObserver, "state");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Device RingerSwitchState : %ld",  (uint8_t *)&v7,  0x16u);
  }

  return -[AFNotifyObserver state](self->_ringerStateObserver, "state") == 0LL;
}

- (void)_completeNotificationsWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  __int16 v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = v9;
    else {
      v12 = *(&off_1004F3B50 + a4);
    }
    v13 = v12;
    int v14 = 136315650;
    v15 = "-[ADExternalNotificationRequestHandler _completeNotificationsWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
    __int16 v16 = 1024;
    BOOL v17 = v7;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s success: %d, reason: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _requestQueue](self, "_requestQueue"));
  [v10 completeCurrentRequestWithSuccess:v7 forReason:a4 shouldEmitInstrumentationEvent:v5];
}

- (void)_clearRequestState
{
  currentRequestDelayManager = self->_currentRequestDelayManager;
  if (currentRequestDelayManager)
  {
    -[ADRequestDelayManager stopDelayingAndSendCommands:completion:]( currentRequestDelayManager,  "stopDelayingAndSendCommands:completion:",  0LL,  0LL);
    -[ADRequestDelayManager beginTimerForContextCommands]( self->_currentRequestDelayManager,  "beginTimerForContextCommands");
    v4 = self->_currentRequestDelayManager;
    self->_currentRequestDelayManager = 0LL;
  }

  callObserver = self->_callObserver;
  if (callObserver)
  {
    self->_callObserver = 0LL;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFSiriClientStateManager sharedManager](&OBJC_CLASS___AFSiriClientStateManager, "sharedManager"));
  [v6 endSessionForClient:self];

  -[ADAnnounceSpeechManager stopAttending](self->_announceSpeechManager, "stopAttending");
  -[ADExternalNotificationRequestHandler _clearTriggerlessUserReplyTimer](self, "_clearTriggerlessUserReplyTimer");
  -[ADExternalNotificationRequestHandler _clearCurrentNotificationTimer](self, "_clearCurrentNotificationTimer");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _requestQueue](self, "_requestQueue"));
  [v7 clearRequestQueue];

  -[ADExternalNotificationRequestHandler _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  self->_synchronousBurstIndex = 0LL;
  self->_waitForUserInputAfterReading = 0;
  instrumentationQueue = (dispatch_queue_s *)self->_instrumentationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10032A7E4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(instrumentationQueue, block);
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10032A7F4;
  v10[3] = &unk_1004FD940;
  v10[4] = self;
  dispatch_async(queue, v10);
}

- (void)_clearTriggerlessUserReplyTimer
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADExternalNotificationRequestHandler _clearTriggerlessUserReplyTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[AFWatchdogTimer cancel](self->_triggerlessUserReplyTimer, "cancel");
  triggerlessUserReplyTimer = self->_triggerlessUserReplyTimer;
  self->_triggerlessUserReplyTimer = 0LL;

  self->_triggerlessUserReplyTimerTimedOut = 0;
}

- (void)_changeCurrentStateToState:(int64_t)a3
{
  stateTimer = self->_stateTimer;
  self->_stateTimer = 0LL;

  v6 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t currentState = self->_currentState;
    v8 = v6;
    uint64_t Name = AFExternalNotificationRequestHandlerStateGetName(currentState);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    uint64_t v11 = AFExternalNotificationRequestHandlerStateGetName(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v17 = 136315650;
    __int16 v18 = "-[ADExternalNotificationRequestHandler _changeCurrentStateToState:]";
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    dispatch_queue_attr_t v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Changing state from %@ to %@",  (uint8_t *)&v17,  0x20u);
  }

  self->_int64_t currentState = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
  [v13 announceNotificationHandlingStateUpdatedToState:a3];
  switch(a3)
  {
    case 1LL:
      -[ADExternalNotificationRequestHandler _clearRequestState](self, "_clearRequestState");
      break;
    case 2LL:
      self->_waitForUserInputAfterReading = 0;
      break;
    case 5LL:
      if (self->_waitForUserInputAfterReading)
      {
        int v14 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315138;
          __int16 v18 = "-[ADExternalNotificationRequestHandler _changeCurrentStateToState:]";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Deferring Audio session deactivation since we are waiting for user input",  (uint8_t *)&v17,  0xCu);
        }
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
        id v16 = [v15 requestType];

        if (v16 != (id)2) {
          [v13 forceAudioSessionInactiveWithOptions:0 completion:0];
        }
      }

      break;
    case 6LL:
      self->_synchronousBurstIndex = 0LL;
      break;
    default:
      break;
  }
}

- (void)_markThreadCancellationForCurrentRequest:(id)a3
{
  id v3 = a3;
  if ([v3 requestType] == (id)1)
  {
    id v4 = v3;
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appID]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 request]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 content]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 threadIdentifier]);

    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315650;
      v13 = "-[ADExternalNotificationRequestHandler _markThreadCancellationForCurrentRequest:]";
      __int16 v14 = 2112;
      v15 = v5;
      __int16 v16 = 2112;
      int v17 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Marking thread cancellation for app: %@ threadID: %@",  (uint8_t *)&v12,  0x20u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v11 markLastAnnouncementInThreadAsCancelledForApp:v5 threadID:v9];
  }
}

- (void)handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10032A7D8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5)
  {
    if (v5 == (id)2)
    {
      -[ADExternalNotificationRequestHandler _handleAnnounceIncomingCallRequest:]( self,  "_handleAnnounceIncomingCallRequest:",  v4);
    }

    else if (v5 == (id)1)
    {
      -[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]( self,  "_handleAnnounceNotificationRequest:",  v4);
    }
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[ADExternalNotificationRequestHandler _handleAnnouncementRequest:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Unknown announcement request type for request : %@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

- (void)announcementRequestReadyToBeAnnounced:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10032A638;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032A628;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_deliverSummary:(id)a3 forNotification:(id)a4 completion:(id)a5
{
  requestQueue = self->_requestQueue;
  id v8 = a5;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([a4 request]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  -[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]( requestQueue,  "deliverSummary:forNotificationWithIdentifier:completion:",  v9,  v10,  v8);
}

- (BOOL)_announceOnDeviceSpeakerAllowedForRequest:(id)a3
{
  id v3 = a3;
  char v5 = _AFPreferencesAnnounceNotificationsOnBuiltInSpeakerEnabled(v3, v4);
  id v6 = [v3 announcementType];

  if (v6 == (id)9) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)_handleAnnounceNotificationRequest:(id)a3
{
  id v4 = a3;
  char v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
    uint64_t Name = AFSiriUserNotificationAnnouncementTypeGetName([v4 announcementType]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(Name);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 appID]);
    uint64_t v11 = AFSiriAnnouncementPlatformGetName([v4 platform]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AFExternalNotificationRequestHandlerStateGetName(self->_currentState);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 136316418;
    v70 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
    __int16 v71 = 2112;
    id v72 = v7;
    __int16 v73 = 2112;
    v74 = v9;
    __int16 v75 = 2112;
    v76 = v10;
    __int16 v77 = 2112;
    v78 = v12;
    __int16 v79 = 2112;
    v80 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ announcementType: %@, from app: %@, on platform:, %@, Current state: %@",  buf,  0x3Eu);
  }

  if (![v4 announcementType])
  {
    id v18 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 appID]);
      uint64_t v21 = AFSiriAnnouncementPlatformGetName([v4 platform]);
      dispatch_queue_attr_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 136315650;
      v70 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
      __int16 v71 = 2112;
      id v72 = v20;
      __int16 v73 = 2112;
      v74 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Notification is not announceable by app: %@ on platform: %@",  buf,  0x20u);
    }

    id v16 = v4;
    uint64_t v17 = 7LL;
    goto LABEL_18;
  }

  if ([v4 announcementType] == (id)6
    && (+[AFFeatureFlags isAnnounceGroupFaceTimeInviteEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isAnnounceGroupFaceTimeInviteEnabled") & 1) == 0)
  {
    id v16 = v4;
    uint64_t v17 = 0LL;
LABEL_40:
    uint64_t v23 = 0LL;
    goto LABEL_41;
  }

  if ([v4 platform] == (id)3 && (_AFPreferencesAnnounceNotificationsOnHearingAidsEnabled() & 1) == 0)
  {
    v48 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v70 = "-[ADExternalNotificationRequestHandler _handleAnnounceNotificationRequest:]";
      v49 = "%s Not announcing on hearing aids, since the setting is disabled";
      v50 = v48;
      uint32_t v51 = 12;
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, v49, buf, v51);
    }

- (BOOL)_canAnnounceInCarPlay
{
  unint64_t v2 = _AFPreferencesAnnounceNotificationsInCarPlayType(self, a2);
  if (v2 - 2 >= 3)
  {
    if (v2 > 1)
    {
LABEL_9:
      LOBYTE(v4) = 0;
      return v4;
    }

    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      int v7 = "-[ADExternalNotificationRequestHandler _canAnnounceInCarPlay]";
      goto LABEL_8;
    }
  }

  else
  {
    if (!_AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled())
    {
      LOBYTE(v4) = 1;
      return v4;
    }

    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      int v7 = "-[ADExternalNotificationRequestHandler _canAnnounceInCarPlay]";
LABEL_8:
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Announce in CarPlay is disabled.",  (uint8_t *)&v6,  0xCu);
      goto LABEL_9;
    }
  }

  return v4;
}

- (BOOL)_accessibleAnnounceIsEnabled
{
  if ((_AFPreferencesAnnounceNotificationsOnBuiltInSpeakerEnabled(self, a2) & 1) != 0)
  {
    LOBYTE(v2) = 1;
  }

  else
  {
    int v2 = _AFPreferencesAnnounceNotificationsOnHearingAidsEnabled();
    if (v2) {
      LOBYTE(v2) = _AFPreferencesAnnounceNotificationsOnHearingAidsSupported();
    }
  }

  return v2;
}

- (void)_handleAnnounceIncomingCallRequest:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
  id v6 = [v5 requestType];

  if (v6 == (id)2)
  {
    int v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      __int16 v19 = "-[ADExternalNotificationRequestHandler _handleAnnounceIncomingCallRequest:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Currently announcing a call, ignoring overlapping announce call activation",  (uint8_t *)&v18,  0xCu);
    }

    [v4 completeRequestWithSuccess:0 forReason:5 shouldEmitInstrumentationEvent:1];
  }

  else
  {
    [v4 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 call]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callProviderBundleID]);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 call]);
      id v11 = (id)objc_claimAutoreleasedReturnValue([v12 callProviderIdentifier]);
    }

    uint64_t v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      __int16 v19 = "-[ADExternalNotificationRequestHandler _handleAnnounceIncomingCallRequest:]";
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Announce incoming call request received from: %@",  (uint8_t *)&v18,  0x16u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
    [v14 startObservingCallState];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _currentClient]);

    if (v15) {
      -[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]( self,  "_stopCurrentRequestWithReason:shouldCancelRequest:",  14LL,  1LL);
    }
    -[ADExternalNotificationRequestHandler _clearRequestState](self, "_clearRequestState");
    -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 2LL);
    -[ADExternalNotificationRequestHandler _startTimerToResetStateFrom:](self, "_startTimerToResetStateFrom:", 2LL);
    id v16 = objc_alloc_init(&OBJC_CLASS___ADCallObserver);
    callObserver = self->_callObserver;
    self->_callObserver = v16;

    -[ADCallObserver startObservingCallStateWithDelegate:]( self->_callObserver,  "startObservingCallStateWithDelegate:",  self);
    -[ADExternalNotificationRequestHandler _startAnnouncementRequest:](self, "_startAnnouncementRequest:", v4);
  }
}

- (void)_startAnnouncementRequestIfOpportune:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10032A19C;
  v4[3] = &unk_1004FC160;
  char v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ADExternalNotificationRequestHandler _shouldAnnounceGivenCurrentClientConditionsForRequest:completion:]( v5,  "_shouldAnnounceGivenCurrentClientConditionsForRequest:completion:",  v3,  v4);
}

- (void)_shouldAnnounceGivenCurrentClientConditionsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 _currentClient]);
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 requestInfo]);

      if (!v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10032A190;
        v13[3] = &unk_1004FDA58;
        id v14 = v7;
        [v12 areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:v13];

        goto LABEL_7;
      }
    }

    else
    {
    }

    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
  }

- (void)_handleNotificationWithRequiresOpportuneTime:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 2LL);
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x2020000000LL;
    char v34 = 0;
    id v7 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100329E8C;
    v30[3] = &unk_1004FC1B0;
    id v32 = v33;
    v30[4] = self;
    id v31 = v6;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100329EC0;
    v28[3] = &unk_1004FD940;
    id v8 = -[AFSafetyBlock initWithBlock:](v7, "initWithBlock:", v30);
    unsigned int v29 = v8;
    uint64_t v9 = objc_retainBlock(v28);
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (a3)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[ADExternalNotificationRequestHandler _handleNotificationWithRequiresOpportuneTime:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Going to check if there is an opportunity to announce",  buf,  0xCu);
      }

      id v12 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      queue = self->_queue;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100329EE4;
      v24[3] = &unk_1004FC838;
      id v14 = v9;
      uint64_t v25 = v14;
      v15 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v12,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v24,  10.0);
      currentNotificationTimer = self->_currentNotificationTimer;
      self->_currentNotificationTimer = v15;

      -[AFWatchdogTimer start](self->_currentNotificationTimer, "start");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFSiriClientStateManager sharedManager](&OBJC_CLASS___AFSiriClientStateManager, "sharedManager"));
      [v17 beginSessionForClient:self];

      announceSpeechManager = self->_announceSpeechManager;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100329F9C;
      v21[3] = &unk_1004FC228;
      v21[4] = self;
      uint64_t v23 = v33;
      dispatch_queue_attr_t v22 = v14;
      -[ADAnnounceSpeechManager startAttendingForPauseInSpeechWithType:completion:]( announceSpeechManager,  "startAttendingForPauseInSpeechWithType:completion:",  1LL,  v21);

      __int16 v19 = (id *)&v25;
    }

    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[ADExternalNotificationRequestHandler _handleNotificationWithRequiresOpportuneTime:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Ignoring using Opportune Speaking Module since the request doesn't require it",  buf,  0xCu);
      }

      __int16 v20 = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100329EC8;
      block[3] = &unk_1004FC1D8;
      v27[1] = v33;
      __int16 v19 = (id *)v27;
      v27[0] = v9;
      dispatch_async(v20, block);
    }

    _Block_object_dispose(v33, 8);
  }
}

- (void)_startAnnouncementRequestWithRequestInfo:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100329B30;
  v7[3] = &unk_1004FC278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 handleExternalActivationRequest:v6 completion:v7];
}

- (void)emitInstrumentationEventsForRequest:(id)a3
{
  id v4 = a3;
  instrumentationQueue = (dispatch_queue_s *)self->_instrumentationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100329980;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(instrumentationQueue, v7);
}

- (void)_emitInstrumentationEventsForRequest:(id)a3 currentlyPlayingMediaType:(id)a4
{
  id v5 = a3;
  +[ADExternalNotificationInstrumentationEmitter emitAnnouncementReceivedForAnnouncementRequest:nowPlayingMediaType:]( &OBJC_CLASS___ADExternalNotificationInstrumentationEmitter,  "emitAnnouncementReceivedForAnnouncementRequest:nowPlayingMediaType:",  v5,  a4);
  +[ADExternalNotificationInstrumentationEmitter emitRequestLinkForAnnouncementRequest:]( &OBJC_CLASS___ADExternalNotificationInstrumentationEmitter,  "emitRequestLinkForAnnouncementRequest:",  v5);
}

- (void)_startAnnouncementRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SOMediaNowPlayingObserver defaultObserver]( &OBJC_CLASS___SOMediaNowPlayingObserver,  "defaultObserver"));
  id v6 = [v5 playbackState];

  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    previousRequest = self->_previousRequest;
    unint64_t synchronousBurstIndex = self->_synchronousBurstIndex;
    *(_DWORD *)buf = 136316162;
    __int16 v20 = "-[ADExternalNotificationRequestHandler _startAnnouncementRequest:]";
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    dispatch_queue_attr_t v24 = previousRequest;
    __int16 v25 = 2048;
    unint64_t v26 = synchronousBurstIndex;
    __int16 v27 = 1024;
    BOOL v28 = v6 == (id)1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Starting announcement request: %@, previous request: %@, Sync Burst Index: %lu, isMediaPlaying: %d",  buf,  0x30u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AFRequestInfo requestInfoFromAnnouncementRequest:previousRequest:synchronousBurstIndex:isMediaPlaying:]( &OBJC_CLASS___AFRequestInfo,  "requestInfoFromAnnouncementRequest:previousRequest:synchronousBurstIndex:isMediaPlaying:",  v4,  self->_previousRequest,  self->_synchronousBurstIndex,  v6 == (id)1));
  -[ADExternalNotificationRequestHandler _setCurrentRequest:](self, "_setCurrentRequest:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
  [v9 setRequestInfo:v8];

  -[ADExternalNotificationRequestHandler emitInstrumentationEventsForRequest:]( self,  "emitInstrumentationEventsForRequest:",  v4);
  currentRequestDelayManager = self->_currentRequestDelayManager;
  if (!currentRequestDelayManager || !-[ADRequestDelayManager isDelaying](currentRequestDelayManager, "isDelaying"))
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
    id v12 = (ADRequestDelayManager *)objc_claimAutoreleasedReturnValue([v11 requestDelayManager]);
    uint64_t v13 = self->_currentRequestDelayManager;
    self->_currentRequestDelayManager = v12;

    -[ADRequestDelayManager startDelaying](self->_currentRequestDelayManager, "startDelaying");
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100329838;
  v17[3] = &unk_1004FC2C8;
  v17[4] = self;
  id v18 = v8;
  id v14 = v8;
  -[ADExternalNotificationRequestHandler _startAttendingForSpeechIfNeededForRequest:completion:]( self,  "_startAttendingForSpeechIfNeededForRequest:completion:",  v4,  v17);
}

- (int64_t)_getAnnouncementRequestFailureReasonFromError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 code] == (id)7200)
    {
      int64_t v5 = 14LL;
    }

    else if ([v4 code] == (id)7201)
    {
      int64_t v5 = 15LL;
    }

    else
    {
      int64_t v5 = 0LL;
    }
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (void)_startAttendingForSpeechIfNeededForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ADAnnounceSpeechManager isAttending](self->_announceSpeechManager, "isAttending")
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest")),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestInfo]),
        v9,
        v8,
        v9))
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v25 = "-[ADExternalNotificationRequestHandler _startAttendingForSpeechIfNeededForRequest:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Already attending, proceeding with reading message",  buf,  0xCu);
    }

    currentRequestDelayManager = self->_currentRequestDelayManager;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100329718;
    v22[3] = &unk_1004FD990;
    id v12 = &v23;
    v22[4] = self;
    id v23 = v7;
    id v13 = v7;
    -[ADRequestDelayManager dequeueDelayedCommandsAndSend:completion:]( currentRequestDelayManager,  "dequeueDelayedCommandsAndSend:completion:",  0LL,  v22);
  }

  else
  {
    id v14 = [v6 requestType];
    uint64_t v15 = 1LL;
    if (v14 == (id)2) {
      uint64_t v15 = 2LL;
    }
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0LL;
    }
    if ([v6 platform] != (id)1) {
      uint64_t v16 = 4LL;
    }
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[ADExternalNotificationRequestHandler _startAttendingForSpeechIfNeededForRequest:completion:]";
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Starting attending for speech with type: %lu",  buf,  0x16u);
    }

    announceSpeechManager = self->_announceSpeechManager;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100329788;
    v20[3] = &unk_1004FD6F0;
    id v12 = &v21;
    v20[4] = self;
    id v21 = v7;
    id v19 = v7;
    -[ADAnnounceSpeechManager startAttendingForSpeechWithType:completion:]( announceSpeechManager,  "startAttendingForSpeechWithType:completion:",  v16,  v20);
  }
}

- (void)_startTimerToResetStateFrom:(int64_t)a3
{
  int64_t v5 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100329618;
  v9[3] = &unk_1004FD0A0;
  v9[4] = self;
  v9[5] = a3;
  id v7 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v5,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v9,  120.0);
  stateTimer = self->_stateTimer;
  self->_stateTimer = v7;

  -[AFWatchdogTimer start](self->_stateTimer, "start");
}

- (void)_clearCurrentNotificationTimer
{
  currentNotificationTimer = self->_currentNotificationTimer;
  self->_currentNotificationTimer = 0LL;
}

- (void)_stopCurrentRequestWithReason:(int64_t)a3 shouldCancelRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v14 = v7;
    uint64_t Name = AFSiriDeactivationReasonGetName(a3);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v17 = 136315394;
    id v18 = "-[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]";
    __int16 v19 = 2112;
    int64_t v20 = (int64_t)v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Deactivating Siri with reason: %@",  (uint8_t *)&v17,  0x16u);
  }

  int v8 = 1;
  uint64_t v9 = 4LL;
  uint64_t v10 = 2LL;
  switch(a3)
  {
    case 2LL:
      uint64_t v9 = 4LL;
      uint64_t v10 = 11LL;
      goto LABEL_10;
    case 12LL:
      goto LABEL_10;
    case 13LL:
    case 14LL:
    case 18LL:
      int v8 = 0;
      uint64_t v10 = 0LL;
      uint64_t v9 = 4LL;
      goto LABEL_10;
    case 16LL:
    case 17LL:
      int v8 = 0;
      uint64_t v10 = 0LL;
      uint64_t v9 = 5LL;
      goto LABEL_10;
    case 20LL:
      uint64_t v9 = 4LL;
      uint64_t v10 = 22LL;
LABEL_10:
      -[ADExternalNotificationRequestHandler _deactivateForReason:source:event:completion:]( self,  "_deactivateForReason:source:event:completion:",  a3,  v9,  v10,  &stru_1004FC308);
      if (v4)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
        if (v8)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
          -[ADExternalNotificationRequestHandler _markThreadCancellationForCurrentRequest:]( self,  "_markThreadCancellationForCurrentRequest:",  v13);
        }

        [v12 cancelCurrentRequestForReason:11];
      }

      break;
    default:
      BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        id v18 = "-[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]";
        __int16 v19 = 2048;
        int64_t v20 = a3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unexpected announcement cancellation reason: %lu. Deactivation ignored.",  (uint8_t *)&v17,  0x16u);
      }

      break;
  }

- (void)deactivateWorkoutReminderAnnouncementWithId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100329420;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)_deactivateWorkoutReminderAnnouncementWithId:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
  if ([v5 requestType] != (id)1)
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315138;
      id v21 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Current announcement not a ADAnnouncementRequestTypeNotification - ignoring",  (uint8_t *)&v20,  0xCu);
    }

    goto LABEL_13;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ADAnnounceNotificationRequest);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[ADExternalNotificationRequestHandler _deactivateWorkoutReminderAnnouncementWithId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s requestType is ADAnnouncementRequestTypeNotification, but request is not ADAnnounceNotificationRequest",  (uint8_t *)&v20,  0xCu);
    }

- (void)deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10032940C;
  v19[3] = &unk_1004FC330;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (void)_deactivateNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 platform:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void))a7;
  switch(a6)
  {
    case 0LL:
    case 1LL:
    case 3LL:
      uint64_t v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315138;
        id v20 = "-[ADExternalNotificationRequestHandler _deactivateNotificationAnnouncementRequestForReason:notification:so"
              "urceAppId:platform:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Can only deactivate notification announcements in CarPlay.",  (uint8_t *)&v19,  0xCu);
      }

      v14[2](v14, 0LL);
      goto LABEL_6;
    case 2LL:
      -[ADExternalNotificationRequestHandler _deactivateCarPlayNotificationAnnouncementRequestForReason:notification:sourceAppId:completion:]( self,  "_deactivateCarPlayNotificationAnnouncementRequestForReason:notification:sourceAppId:completion:",  a3,  v12,  v13,  v14);
      goto LABEL_6;
    case 4LL:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
      id v18 = [v17 requestType];

      if (v18 == (id)1 && ([v16 announcementType] == (id)9 || objc_msgSend(v16, "platform") == (id)4)) {
        -[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]( self,  "_stopCurrentRequestWithReason:shouldCancelRequest:",  a3,  1LL);
      }
      goto LABEL_7;
    default:
LABEL_6:
      id v16 = 0LL;
LABEL_7:

      return;
  }

- (void)_deactivateCarPlayNotificationAnnouncementRequestForReason:(int64_t)a3 notification:(id)a4 sourceAppId:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100329154;
    v15[3] = &unk_1004FC380;
    id v16 = v11;
    id v17 = v10;
    id v18 = self;
    id v19 = v12;
    int64_t v20 = a3;
    [v13 areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:v15];
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[ADExternalNotificationRequestHandler _deactivateCarPlayNotificationAnnouncementRequestForReason:notificati"
            "on:sourceAppId:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Ignoring deactivation, nil completion",  buf,  0xCu);
    }
  }
}

- (void)_deactivateForReason:(int64_t)a3 source:(int64_t)a4 event:(int64_t)a5 completion:(id)a6
{
  id v9 = a6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100329100;
  v12[3] = &unk_1004FC3A0;
  v12[4] = mach_absolute_time();
  v12[5] = a4;
  v12[6] = a5;
  id v11 = +[AFSiriActivationContext newWithBuilder:](&OBJC_CLASS___AFSiriActivationContext, "newWithBuilder:", v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriActivationConnection sharedConnection]( &OBJC_CLASS___AFSiriActivationConnection,  "sharedConnection"));
  [v10 deactivateForReason:a3 options:0 context:v11 completion:v9];
}

- (void)withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003290F0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_withdrawalAnnouncementRequestForNotification:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _requestQueue](self, "_requestQueue"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 request]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationRequestForNotificationIdentifierInAnnouncementQueue:v10]);

  if (!v11)
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      id v22 = "-[ADExternalNotificationRequestHandler _withdrawalAnnouncementRequestForNotification:completion:]";
      id v17 = "%s Attempt to withdrawal request which is not in queue. Ignoring withdrawal.";
      goto LABEL_7;
    }

- (void)audioSessionDidEnd
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler audioSessionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003290E8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_processAnyQueuedAnnouncementsAfterUserSpeech
{
  id v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t currentState = self->_currentState;
    int64_t v5 = v3;
    uint64_t Name = AFExternalNotificationRequestHandlerStateGetName(currentState);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
    BOOL waitForUserInputAfterReading = self->_waitForUserInputAfterReading;
    int v15 = 136315650;
    id v16 = "-[ADExternalNotificationRequestHandler _processAnyQueuedAnnouncementsAfterUserSpeech]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = waitForUserInputAfterReading;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s current state: %@, waitingForUserInput: %d",  (uint8_t *)&v15,  0x1Cu);
  }

  if (self->_currentState == 6 || self->_waitForUserInputAfterReading)
  {
    self->_BOOL waitForUserInputAfterReading = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _requestQueue](self, "_requestQueue"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 completion]);
    if (v11)
    {
      if (v10)
      {
LABEL_7:
        id v12 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          id v16 = "-[ADExternalNotificationRequestHandler _processAnyQueuedAnnouncementsAfterUserSpeech]";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s New request in the queue after reply request, starting new request, and reset attending",  (uint8_t *)&v15,  0xCu);
        }

        ++self->_synchronousBurstIndex;
        -[ADAnnounceSpeechManager stopAttending](self->_announceSpeechManager, "stopAttending");
        -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 2LL);
        -[ADExternalNotificationRequestHandler _startAnnouncementRequest:](self, "_startAnnouncementRequest:", v10);
        goto LABEL_12;
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _requestQueue](self, "_requestQueue"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 nextAnnouncementRequest]);

      id v10 = (void *)v14;
      if (v14) {
        goto LABEL_7;
      }
    }

    -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 1LL);
LABEL_12:
  }

- (int64_t)announcePlatformForCurrentRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));

  if (v3) {
    id v3 = -[ADAnnouncementRequest platform](self->_currentRequest, "platform");
  }
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t v5 = v4;
    uint64_t Name = AFSiriAnnouncementPlatformGetName(v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
    int v10 = 136315650;
    id v11 = "-[ADExternalNotificationRequestHandler announcePlatformForCurrentRequest]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    int v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Platform: %@ for current request: %@",  (uint8_t *)&v10,  0x20u);
  }

  return (int64_t)v3;
}

- (void)notifySpeechDetectedIsUndirected
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler notifySpeechDetectedIsUndirected]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100328F8C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)deferAudioSessionDeactivationForAnnouncementRequest
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADExternalNotificationRequestHandler deferAudioSessionDeactivationForAnnouncementRequest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100328F54;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startTriggerlessFollowupRequestForSpeechObservingType:(int64_t)a3 hostTime:(float)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v8 = +[AFSetAudioSessionActiveContext newWithBuilder:]( &OBJC_CLASS___AFSetAudioSessionActiveContext,  "newWithBuilder:",  &stru_1004FC3E0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100328A98;
  v9[3] = &unk_1004FC430;
  v9[4] = self;
  v9[5] = a3;
  void v9[6] = (unint64_t)a4;
  [v7 forceAudioSessionActiveWithContext:v8 completion:v9];
}

- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100328938;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)markNotificationAsReadWithIdentifer:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003288D0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_deactivateCurrentAnnouncementRequestForReason:(int64_t)a3
{
  int64_t v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t Name = AFSiriDeactivationReasonGetName(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v9 = 136315394;
    id v10 = "-[ADExternalNotificationRequestHandler _deactivateCurrentAnnouncementRequestForReason:]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Deactivating current announcement request for reason: %@",  (uint8_t *)&v9,  0x16u);
  }

  -[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]( self,  "_stopCurrentRequestWithReason:shouldCancelRequest:",  a3,  1LL);
  -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 1LL);
}

- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003288C4;
  v4[3] = &unk_1004FD0A0;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_startObservingRouteChanges
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100328880;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopObservingRouteChanges
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10032883C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentAudioRouteDidChange:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003286D0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s 🎧 headphoneInEarDetectionStateDidChangeFrom from: %@ to: %@",  buf,  0x20u);
  }

  if ([v9 primaryInEarStatus] == (id)3 && objc_msgSend(v10, "primaryInEarStatus") != (id)3)
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    int v12 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s 🎧 [%@] primary bud went out of ear, shutting down the request",  buf,  0x16u);
    }
  }

  else
  {
    int v12 = 0;
  }

  if ([v9 secondaryInEarStatus] == (id)3 && objc_msgSend(v10, "secondaryInEarStatus") != (id)3)
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[ADExternalNotificationRequestHandler inEarDetectionStateDidChangeForBTAddress:fromState:toState:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s 🎧 [%@] secondary bud went out of ear, shutting down the request",  buf,  0x16u);
    }
  }

  else if (!v12)
  {
    goto LABEL_15;
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003285FC;
  v16[3] = &unk_1004FD968;
  v16[4] = self;
  id v17 = v8;
  dispatch_async(queue, v16);

LABEL_15:
}

- (void)_triggerlessListeningTimerEnded
{
  self->_triggerlessUserReplyTimerTimedOut = 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
  +[ADExternalNotificationInstrumentationEmitter emitUserResponseSilenceForAnnouncementRequest:]( &OBJC_CLASS___ADExternalNotificationInstrumentationEmitter,  "emitUserResponseSilenceForAnnouncementRequest:",  v3);

  -[ADExternalNotificationRequestHandler _changeCurrentStateToState:](self, "_changeCurrentStateToState:", 1LL);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [v8 copy];
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100327ED4;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = v16;
  if (a5 == 7 && v16 && [v16 activationEvent] == (id)10)
  {
    id v18 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v23 = v18;
      int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      *(_DWORD *)buf = 136315394;
      id v31 = "-[ADExternalNotificationRequestHandler requestLifecycleObserver:requestWasCancelledWithInfo:forReason:origin"
            ":client:successorInfo:]";
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Request (UUID: %@) cancelled as a result of a gesture-based follow-up",  buf,  0x16u);
    }

    __int16 v19 = (NSUUID *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    gestureInterruptedRequestUUID = self->_gestureInterruptedRequestUUID;
    self->_gestureInterruptedRequestUUID = v19;
  }

  else
  {
    id v21 = [v14 copy];
    queue = (dispatch_queue_s *)self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100327BF8;
    v25[3] = &unk_1004FD510;
    id v26 = v21;
    uint64_t v27 = self;
    id v28 = v15;
    int64_t v29 = a5;
    gestureInterruptedRequestUUID = (NSUUID *)v21;
    dispatch_async(queue, v25);
  }
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  id v9 = [a4 copy];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003274BC;
  block[3] = &unk_1004FD4C0;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, block);
}

- (BOOL)speechManager:(id)a3 detectedSpeechForListeningType:(int64_t)a4 atHostTime:(float)a5 shouldHandleActivation:(BOOL)a6
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100327148;
  v9[3] = &unk_1004FC4A8;
  v9[5] = &v12;
  void v9[6] = a4;
  BOOL v11 = a6;
  float v10 = a5;
  v9[4] = self;
  dispatch_sync(queue, v9);
  char v7 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)speechManager:(id)a3 didStopUnexpectlyWithError:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10032702C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioPlaybackService:(id)a3 didStartRequest:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100326EB4;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  char v5 = a5;
  id v7 = (AFNotifyObserver *)a3;
  if (self->_clientStateObserver == v7 && self->_currentState == 6)
  {
    if ((v5 & 4) != 0)
    {
      self->_triggerlessRequestEnteredListeningState = 1;
    }

    else if (self->_triggerlessRequestEnteredListeningState)
    {
      self->_triggerlessRequestEnteredListeningState = 0;
      id v8 = v7;
      -[ADRequestDelayManager stopDelayingAndSendCommands:completion:]( self->_currentRequestDelayManager,  "stopDelayingAndSendCommands:completion:",  0LL,  0LL);
      id v7 = v8;
    }
  }
}

- (void)adCallStateChangedCallIncoming:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100326EA4;
  v4[3] = &unk_1004FC4D0;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_adCallStateChangedCallIncoming:(BOOL)a3
{
  if (!a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
    id v5 = [v4 requestType];

    if (v5 == (id)2)
    {
      id v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315394;
        __int16 v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
        __int16 v20 = 1024;
        int v21 = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Call incoming: %d",  (uint8_t *)&v18,  0x12u);
      }

      if (self->_currentState != 6)
      {
        id v7 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315394;
          __int16 v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
          __int16 v20 = 1024;
          int v21 = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Incoming call ended without user responding to announcement: %d",  (uint8_t *)&v18,  0x12u);
        }
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _sharedCommandCenter](self, "_sharedCommandCenter"));
      int64_t currentState = self->_currentState;
      switch(currentState)
      {
        case 2LL:
          char v15 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            __int16 v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Call ended while setting up announcement request",  (uint8_t *)&v18,  0xCu);
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
          [v16 setRequestWasInterrupted:1];

          break;
        case 3LL:
        case 4LL:
        case 6LL:
          float v10 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            __int16 v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Announcement request or reply ongoing shutting down request",  (uint8_t *)&v18,  0xCu);
            int64_t currentState = self->_currentState;
          }

          uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 _currentClient]);
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestInfo]);

            if (v14) {
              -[ADExternalNotificationRequestHandler _stopCurrentRequestWithReason:shouldCancelRequest:]( self,  "_stopCurrentRequestWithReason:shouldCancelRequest:",  13LL,  currentState == 3);
            }
          }

          goto LABEL_19;
        case 5LL:
          id v17 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315138;
            __int16 v19 = "-[ADExternalNotificationRequestHandler _adCallStateChangedCallIncoming:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Call ended during triggerless listening, transition back to Idle state",  (uint8_t *)&v18,  0xCu);
          }

- (void)voicePromptStyleDidChange:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100326E98;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_voicePromptStyleDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
    id v7 = [v6 platform];

    if (v7 == (id)2 && (id)-[ADExternalNotificationRequestHandler _currentState](self, "_currentState") == (id)2)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKey:AVSystemController_VoicePromptStyleDidChangeNotificationParameter]);

      if (v9
        && ([v9 isEqualToString:AVSystemController_VoicePromptStyle_Normal] & 1) == 0)
      {
        float v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315394;
          id v13 = "-[ADExternalNotificationRequestHandler _voicePromptStyleDidChange:]";
          __int16 v14 = 2112;
          char v15 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s CarPlay request in processing state encountered a %@ voice prompt style, marking request as interrupted.",  (uint8_t *)&v12,  0x16u);
        }

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestHandler _currentRequest](self, "_currentRequest"));
        [v11 setRequestWasInterrupted:1];
      }
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedNotificationRequestHandler
{
  if (qword_1005785F0 != -1) {
    dispatch_once(&qword_1005785F0, &stru_1004FC118);
  }
  return (id)qword_1005785F8;
}

@end