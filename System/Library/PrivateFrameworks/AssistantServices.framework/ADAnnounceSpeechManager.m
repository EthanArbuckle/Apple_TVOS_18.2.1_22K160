@interface ADAnnounceSpeechManager
+ (double)_bargeInTimeThresholdForType:(int64_t)a3;
+ (double)lookbackTimeForSpeechObservingType:(int64_t)a3;
- (ADAnnounceSpeechManager)init;
- (ADAnnounceSpeechManagerDelegate)delegate;
- (BOOL)isAttending;
- (id)_attendingServiceClient;
- (id)_osmedDetector;
- (void)_attendingStoppedWithReason:(int64_t)a3;
- (void)_resetDetector;
- (void)_startAttendingForSpeechPauseWithType:(int64_t)a3 completion:(id)a4;
- (void)_startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)didTransitionToTriggerlessListening;
- (void)setDelegate:(id)a3;
- (void)startAttendingForPauseInSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)stopAttending;
@end

@implementation ADAnnounceSpeechManager

- (ADAnnounceSpeechManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAnnounceSpeechManager;
  v2 = -[ADAnnounceSpeechManager init](&v11, "init");
  if (v2)
  {
    v3 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UNSPECIFIED, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);

    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("ADAnnounceSpeechManagerQueue", v7, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;
  }

  return v2;
}

- (void)startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if ((unint64_t)(a3 - 1) < 2)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000516A4;
    block[3] = &unk_1004FB930;
    block[4] = self;
    int64_t v12 = a3;
    id v11 = v6;
    dispatch_async(queue, block);
  }

  else if ((unint64_t)(a3 - 3) >= 2)
  {
    if (!a3 && v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  7200LL,  0LL,  0LL));
      ((void (**)(void, void *))v7)[2](v7, v9);
    }
  }

  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)startAttendingForPauseInSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void, void))v6;
  switch(a3)
  {
    case 0LL:
      if (v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 7200LL));
        ((void (**)(void, void, void *))v7)[2](v7, 0LL, v9);
      }

      break;
    case 1LL:
    case 2LL:
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005161C;
      block[3] = &unk_1004FB930;
      block[4] = self;
      int64_t v12 = a3;
      id v11 = v6;
      dispatch_async(queue, block);

      break;
    case 3LL:
    case 4LL:
      if (v6) {
        (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1LL, 0LL);
      }
      break;
    default:
      break;
  }
}

- (void)_startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  switch(a3)
  {
    case 0LL:
    case 3LL:
    case 4LL:
      v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s No triggerless listening for speech observing type",  buf,  0xCu);
      }

      dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  7200LL,  0LL));
      v6[2](v6, v8);
      goto LABEL_15;
    case 1LL:
      uint64_t v20 = 0LL;
      goto LABEL_14;
    case 2LL:
      unsigned int v9 = +[AFFeatureFlags isRingtoneOverA2DPEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isRingtoneOverA2DPEnabled");
      v10 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Ringtone over A2DP enabled, using DOAP for OPPSPK",  buf,  0xCu);
        }

        v18[3] = 0LL;
        int64_t v12 = 1LL;
      }

      else
      {
        if (v11)
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Ringtone over HFP enabled, using HFP for OPPSPK",  buf,  0xCu);
        }

        v18[3] = 1LL;
        int64_t v12 = 2LL;
      }

      self->_speechType = v12;
      goto LABEL_14;
    default:
LABEL_14:
      dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AFHeadphonesAnnouncementRequestCapabilityProvider provider]( &OBJC_CLASS___ADHeadphonesAnnouncementRequestCapabilityProvider,  "provider"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000510F4;
      v13[3] = &unk_1004EE6C0;
      v13[4] = self;
      v15 = &v17;
      v14 = v6;
      int64_t v16 = a3;
      [v8 fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:v13];

LABEL_15:
      _Block_object_dispose(&v17, 8);

      return;
  }

- (void)_startAttendingForSpeechPauseWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  [v7 opportuneSpeakingPauseInterval];
  v18[3] = v8;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  [v7 opportuneSpeakingTimeoutInterval];
  v17[3] = v9;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000509A4;
  block[3] = &unk_1004EE788;
  block[4] = self;
  id v13 = v6;
  v15 = v17;
  int64_t v16 = a3;
  v14 = v18;
  id v11 = v6;
  dispatch_async(queue, block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[ADAnnounceSpeechManager attendingStoppedWithReason:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s attendingStoppedWithReason: %lu", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100050998;
  v7[3] = &unk_1004FD0A0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)_attendingStoppedWithReason:(int64_t)a3
{
  if (a3 != 4)
  {
    p_delegate = &self->_delegate;
    if (a3 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      LODWORD(v6) = 0;
      [WeakRetained speechManager:self detectedSpeechForListeningType:1 atHostTime:0 shouldHandleActivation:v6];
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      [WeakRetained speechManager:self didStopUnexpectlyWithError:0];
    }
  }

  self->_isAttendingWithAttendingService = 0;
}

- (id)_attendingServiceClient
{
  attendingServiceClient = self->_attendingServiceClient;
  if (!attendingServiceClient)
  {
    dispatch_queue_attr_t v4 = objc_alloc_init(&OBJC_CLASS___CSAttendingServiceClient);
    v5 = self->_attendingServiceClient;
    self->_attendingServiceClient = v4;

    -[CSAttendingServiceClient setDelegate:](self->_attendingServiceClient, "setDelegate:", self);
    attendingServiceClient = self->_attendingServiceClient;
  }

  return attendingServiceClient;
}

- (id)_osmedDetector
{
  osmedDetector = self->_osmedDetector;
  if (!osmedDetector)
  {
    dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADOpportuneSpeakingModule sharedModule](&OBJC_CLASS___ADOpportuneSpeakingModule, "sharedModule"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stateManager]);

    double v6 = -[ADOpportuneSpeakingModuleEdgeDetector initWithQueue:stateManager:]( objc_alloc(&OBJC_CLASS___ADOpportuneSpeakingModuleEdgeDetector),  "initWithQueue:stateManager:",  self->_queue,  v5);
    v7 = self->_osmedDetector;
    self->_osmedDetector = v6;

    osmedDetector = self->_osmedDetector;
  }

  return osmedDetector;
}

- (void)didTransitionToTriggerlessListening
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADAnnounceSpeechManager didTransitionToTriggerlessListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005092C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAttending
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADAnnounceSpeechManager stopAttending]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050924;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isAttending
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000508F4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_resetDetector
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    int64_t v12 = "-[ADAnnounceSpeechManager _resetDetector]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }

  dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceSpeechManager _osmedDetector](self, "_osmedDetector"));
  unsigned int v5 = [v4 isListening];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceSpeechManager _osmedDetector](self, "_osmedDetector"));
    [v6 stopListening];
  }

  if (self->_isAttendingWithAttendingService)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceSpeechManager _attendingServiceClient](self, "_attendingServiceClient"));
    [v7 stopAttendingWithReason:4];
  }

  deviceID = self->_deviceID;
  self->_deviceID = 0LL;

  self->_speechType = 0LL;
  osmedDetector = self->_osmedDetector;
  self->_osmedDetector = 0LL;

  attendingServiceClient = self->_attendingServiceClient;
  self->_attendingServiceClient = 0LL;

  *(_WORD *)&self->_isAttendingWithCSOSL = 0;
}

- (ADAnnounceSpeechManagerDelegate)delegate
{
  return (ADAnnounceSpeechManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (double)_bargeInTimeThresholdForType:(int64_t)a3
{
  if (a3 == 2)
  {
    _AFPreferencesAnnounceCallsBargeInTime(a1, a2);
  }

  else if (a3 == 1)
  {
    _AFPreferencesSpokenNotificationQuickIgnoreTime(a1, a2);
  }

  else
  {
    dispatch_queue_attr_t v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "+[ADAnnounceSpeechManager _bargeInTimeThresholdForType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Invalid request delay type, unable to compute voice threshold",  (uint8_t *)&v5,  0xCu);
    }

    return 0.0;
  }

  return result;
}

+ (double)lookbackTimeForSpeechObservingType:(int64_t)a3
{
  return v3 + 0.2;
}

@end