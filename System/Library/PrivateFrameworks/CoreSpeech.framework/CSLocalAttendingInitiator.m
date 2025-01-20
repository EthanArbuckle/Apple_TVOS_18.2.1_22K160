@interface CSLocalAttendingInitiator
- (BOOL)fetchIsAttending;
- (BOOL)isAttending;
- (BOOL)isStoppingForSiriUIDismissal;
- (CSAttendingService)usecaseController;
- (CSLocalAttendingInitiator)initWithAttendingUsecase:(id)a3;
- (LBAttendingStatesServiceDelegate)delegate;
- (NSString)lastLoggedMhUUID;
- (NSString)mhUUID;
- (NSString)rootRequestId;
- (NSString)rootRequestIdForLogging;
- (NSString)rootRequestIdForWillAttendSignal;
- (NSString)rootRequestIdWithMagusDisabled;
- (OS_dispatch_group)attendingStartTransitionGroup;
- (OS_dispatch_queue)queue;
- (int64_t)_stopReasonFromHint:(unint64_t)a3;
- (unint64_t)startAttendingHostTime;
- (void)_emitSpeechStartDetectedEventWithAttendingTriggerInfo:(id)a3;
- (void)_handleClientAudioDidStartMessage;
- (void)_handleSpeechStartDetectedWithEventInfo:(id)a3;
- (void)_reset;
- (void)_resetIsStoppingForSiriUIDismissal;
- (void)_startAttendingForJarvisAnnounceMessageWithInfo:(id)a3;
- (void)_startAttendingWithInfo:(id)a3;
- (void)_startAttendingWithOptions:(id)a3;
- (void)_stopAttendingWithReason:(unint64_t)a3;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)receivedAttendingJarvisHintWithInfo:(id)a3;
- (void)receivedAttendingMagusNotSupportedHintWithInfo:(id)a3;
- (void)receivedAttendingStartHintWithInfo:(id)a3;
- (void)receivedAttendingStopHintWithInfo:(id)a3;
- (void)receivedAttendingTriggerForSiriPromptHintWithInfo:(id)a3;
- (void)receivedAttendingWillStartHintWithInfo:(id)a3;
- (void)setAttendingStartTransitionGroup:(id)a3;
- (void)setAttendingState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAttending:(BOOL)a3;
- (void)setIsStoppingForSiriUIDismissal:(BOOL)a3;
- (void)setLastLoggedMhUUID:(id)a3;
- (void)setMhUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRootRequestId:(id)a3;
- (void)setRootRequestIdForLogging:(id)a3;
- (void)setRootRequestIdForWillAttendSignal:(id)a3;
- (void)setRootRequestIdWithMagusDisabled:(id)a3;
- (void)setStartAttendingHostTime:(unint64_t)a3;
- (void)setUsecaseController:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)speechStartDetectedWithEventInfo:(id)a3;
@end

@implementation CSLocalAttendingInitiator

- (CSLocalAttendingInitiator)initWithAttendingUsecase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSLocalAttendingInitiator;
  v6 = -[CSLocalAttendingInitiator init](&v13, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingMagusLauncher Queue",  33LL));
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_usecaseController, a3);
    -[CSAttendingService setDelegate:](v6->_usecaseController, "setDelegate:", v6);
    v6->_isAttending = 0;
    -[CSLocalAttendingInitiator _resetIsStoppingForSiriUIDismissal](v6, "_resetIsStoppingForSiriUIDismissal");
    dispatch_group_t v9 = dispatch_group_create();
    attendingStartTransitionGroup = v6->_attendingStartTransitionGroup;
    v6->_attendingStartTransitionGroup = (OS_dispatch_group *)v9;

    lastLoggedMhUUID = v6->_lastLoggedMhUUID;
    v6->_lastLoggedMhUUID = 0LL;
  }

  return v6;
}

- (BOOL)fetchIsAttending
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100152AAC;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAttendingState:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001529E8;
  v4[3] = &unk_10022EFA8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_startAttendingWithOptions:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSLocalAttendingInitiator _startAttendingWithOptions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s dispatch group enter attendingStartTransitionGroup",  buf,  0xCu);
  }

  dispatch_group_enter((dispatch_group_t)self->_attendingStartTransitionGroup);
  -[CSLocalAttendingInitiator _resetIsStoppingForSiriUIDismissal](self, "_resetIsStoppingForSiriUIDismissal");
  if (self->_rootRequestId)
  {
    if (!-[NSString isEqualToString:](self->_rootRequestIdForWillAttendSignal, "isEqualToString:"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector(WeakRetained, "localAttendingWillStartWithRootRequestId:");

      if ((v7 & 1) != 0)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 localAttendingWillStartWithRootRequestId:self->_rootRequestIdForWillAttendSignal];
      }
    }
  }

  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector(v9, "localAttendingStartedWithRootRequestId:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localAttendingStartedWithRootRequestId:self->_rootRequestId];
  }

  usecaseController = self->_usecaseController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10015258C;
  v14[3] = &unk_10022EFF8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  -[CSAttendingService startAttendingWithOptions:completion:]( usecaseController,  "startAttendingWithOptions:completion:",  v13,  v14);
}

- (void)_startAttendingWithInfo:(id)a3
{
  id v4 = a3;
  if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordContext]);
    if (self->_isAttending)
    {
      uint64_t v6 = (os_log_s *)CSLogCategoryAttending;
      if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        v18 = "-[CSLocalAttendingInitiator _startAttendingWithInfo:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Already in attending state, ignore request",  (uint8_t *)&v17,  0xCu);
      }
    }

    else
    {
      id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v4 rootRequestId]);
      rootRequestId = self->_rootRequestId;
      self->_rootRequestId = v8;

      char v10 = (NSString *)objc_claimAutoreleasedReturnValue([v4 rootRequestId]);
      rootRequestIdForLogging = self->_rootRequestIdForLogging;
      self->_rootRequestIdForLogging = v10;

      v12 = (NSString *)objc_claimAutoreleasedReturnValue([v4 mhUUID]);
      mhUUID = self->_mhUUID;
      self->_mhUUID = v12;

      id v14 = [v5 type];
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceId]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttendingOptions optionForFlexibleFollowupWithAudioRecordType:deviceId:]( &OBJC_CLASS___CSAttendingOptions,  "optionForFlexibleFollowupWithAudioRecordType:deviceId:",  v14,  v15));

      -[CSLocalAttendingInitiator _startAttendingWithOptions:](self, "_startAttendingWithOptions:", v16);
    }
  }

  else
  {
    char v7 = (os_log_s *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[CSLocalAttendingInitiator _startAttendingWithInfo:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "%s Wrongly called the code path which is not supported!",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)_startAttendingForJarvisAnnounceMessageWithInfo:(id)a3
{
  id v4 = a3;
  if (+[CSUtils isContinuousConversationSupported]( &OBJC_CLASS___CSUtils,  "isContinuousConversationSupported"))
  {
    if (self->_isAttending)
    {
      BOOL v5 = (os_log_s *)CSLogCategoryAttending;
      if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        char v10 = "-[CSLocalAttendingInitiator _startAttendingForJarvisAnnounceMessageWithInfo:]";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Already in attending state, ignore request",  (uint8_t *)&v9,  0xCu);
      }
    }

    else
    {
      char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceId]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttendingOptions optionForJarvisAnnounceMessageWithDeviceId:]( &OBJC_CLASS___CSAttendingOptions,  "optionForJarvisAnnounceMessageWithDeviceId:",  v7));

      -[CSLocalAttendingInitiator _startAttendingWithOptions:](self, "_startAttendingWithOptions:", v8);
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      char v10 = "-[CSLocalAttendingInitiator _startAttendingForJarvisAnnounceMessageWithInfo:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "%s Wrongly called the code path which is not supported!",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)_stopAttendingWithReason:(unint64_t)a3
{
  BOOL v5 = (os_log_s *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAttending = self->_isAttending;
    int v8 = 136315650;
    int v9 = "-[CSLocalAttendingInitiator _stopAttendingWithReason:]";
    __int16 v10 = 1024;
    BOOL v11 = isAttending;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s isAttending:%u, reason:%lu",  (uint8_t *)&v8,  0x1Cu);
  }

  if (a3 == 5 || self->_isAttending)
  {
    if (a3 == 5) {
      self->_isStoppingForSiriUIDismissal = 1;
    }
    -[CSAttendingService stopAttendingWithReason:]( self->_usecaseController,  "stopAttendingWithReason:",  -[CSLocalAttendingInitiator _stopReasonFromHint:](self, "_stopReasonFromHint:", a3));
  }

  else
  {
    char v7 = (os_log_s *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[CSLocalAttendingInitiator _stopAttendingWithReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Already stopped attending, ignore request",  (uint8_t *)&v8,  0xCu);
    }
  }

- (int64_t)_stopReasonFromHint:(unint64_t)a3
{
  if (a3 - 4 > 2) {
    return 0LL;
  }
  else {
    return qword_10018B2D8[a3 - 4];
  }
}

- (void)_reset
{
  self->_BOOL isAttending = 0;
  rootRequestId = self->_rootRequestId;
  self->_rootRequestId = 0LL;
}

- (void)receivedAttendingWillStartHintWithInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100152468;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingStartHintWithInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001523A8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingStopHintWithInfo:(id)a3
{
  id v4 = a3;
  attendingStartTransitionGroup = self->_attendingStartTransitionGroup;
  dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_group_wait((dispatch_group_t)attendingStartTransitionGroup, v6))
  {
    char v7 = (os_log_s *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[CSLocalAttendingInitiator receivedAttendingStopHintWithInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s attendingStartTransitionGroup: Timed-out transition into AttendingState!",  buf,  0xCu);
    }
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001522DC;
  v10[3] = &unk_10022EFD0;
  id v11 = v4;
  __int16 v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)receivedAttendingTriggerForSiriPromptHintWithInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001520D0;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingMagusNotSupportedHintWithInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100151F98;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingJarvisHintWithInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSLocalAttendingInitiator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100151ED8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100151CD0;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100151BD8;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleSpeechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    int v15 = 136315394;
    v16 = "-[CSLocalAttendingInitiator _handleSpeechStartDetectedWithEventInfo:]";
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector( WeakRetained,  "speechStartDetectedWithHostTime:audioRecordType:audioRecordDeviceId:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    id v12 = [v4 triggerMachTime];
    id v13 = [v4 audioRecordType];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceId]);
    [v11 speechStartDetectedWithHostTime:v12 audioRecordType:v13 audioRecordDeviceId:v14];
  }
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151BD0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151BC8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleClientAudioDidStartMessage
{
}

- (void)_emitSpeechStartDetectedEventWithAttendingTriggerInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_mhUUID)
  {
    id v6 = (char *)[v4 triggerMachTime] - self->_startAttendingHostTime;
    char v7 = (void *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      [v5 amountOfSpeechDetectedInMs];
      double v10 = v9;
      [v5 triggerThresholdInMs];
      mhUUID = self->_mhUUID;
      rootRequestIdForLogging = self->_rootRequestIdForLogging;
      int v26 = 136316418;
      v27 = "-[CSLocalAttendingInitiator _emitSpeechStartDetectedEventWithAttendingTriggerInfo:]";
      __int16 v28 = 2048;
      double v29 = v10;
      __int16 v30 = 2048;
      double v31 = v13;
      __int16 v32 = 2048;
      v33 = v6;
      __int16 v34 = 2112;
      v35 = mhUUID;
      __int16 v36 = 2112;
      v37 = rootRequestIdForLogging;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Emit SpeechStartDetected amountOfSpeech: %f, threshold: %f, attendingDuration: %llu, mhUUID: %@, rootRequestIdForLogging: %@",  (uint8_t *)&v26,  0x3Eu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHSpeechDetectorContext);
    id v15 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHSpeechDetectorEnded);
    id v16 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    __int16 v17 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  self->_rootRequestIdForLogging);
    id v18 = [v16 initWithNSUUID:v17];
    [v15 setPreviousRequestId:v18];

    [v5 amountOfSpeechDetectedInMs];
    objc_msgSend(v15, "setAmountOfSpeechDetectedInMs:");
    [v5 triggerThresholdInMs];
    objc_msgSend(v15, "setStartSpeechDetectionThresholdInMs:");
    objc_msgSend( v15,  "setTimeSinceLastAcceptedRequestInNs:",  +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v6));
    [v14 setEnded:v15];
    id v19 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    id v21 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v22 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhUUID);
    id v23 = [v21 initWithNSUUID:v22];
    [v20 setMhId:v23];

    [v19 setEventMetadata:v20];
    [v19 setSpeechDetectorContext:v14];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v24 emitMessage:v19];
  }

  else
  {
    v25 = (os_log_s *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315138;
      v27 = "-[CSLocalAttendingInitiator _emitSpeechStartDetectedEventWithAttendingTriggerInfo:]";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Skip SELF logging since mhUUID is not set",  (uint8_t *)&v26,  0xCu);
    }
  }
}

- (void)_resetIsStoppingForSiriUIDismissal
{
  self->_isStoppingForSiriUIDismissal = 0;
}

- (LBAttendingStatesServiceDelegate)delegate
{
  return (LBAttendingStatesServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAttendingService)usecaseController
{
  return self->_usecaseController;
}

- (void)setUsecaseController:(id)a3
{
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setIsAttending:(BOOL)a3
{
  self->_BOOL isAttending = a3;
}

- (BOOL)isStoppingForSiriUIDismissal
{
  return self->_isStoppingForSiriUIDismissal;
}

- (void)setIsStoppingForSiriUIDismissal:(BOOL)a3
{
  self->_isStoppingForSiriUIDismissal = a3;
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (void)setRootRequestId:(id)a3
{
}

- (NSString)rootRequestIdWithMagusDisabled
{
  return self->_rootRequestIdWithMagusDisabled;
}

- (void)setRootRequestIdWithMagusDisabled:(id)a3
{
}

- (NSString)rootRequestIdForLogging
{
  return self->_rootRequestIdForLogging;
}

- (void)setRootRequestIdForLogging:(id)a3
{
}

- (NSString)rootRequestIdForWillAttendSignal
{
  return self->_rootRequestIdForWillAttendSignal;
}

- (void)setRootRequestIdForWillAttendSignal:(id)a3
{
}

- (unint64_t)startAttendingHostTime
{
  return self->_startAttendingHostTime;
}

- (void)setStartAttendingHostTime:(unint64_t)a3
{
  self->_startAttendingHostTime = a3;
}

- (NSString)mhUUID
{
  return self->_mhUUID;
}

- (void)setMhUUID:(id)a3
{
}

- (OS_dispatch_group)attendingStartTransitionGroup
{
  return self->_attendingStartTransitionGroup;
}

- (void)setAttendingStartTransitionGroup:(id)a3
{
}

- (NSString)lastLoggedMhUUID
{
  return self->_lastLoggedMhUUID;
}

- (void)setLastLoggedMhUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end