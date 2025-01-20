@interface ADAnnounceDeviceSelector
+ (id)_requestToExecuteCommand:(id)a3 onRemoteWithAssistantId:(id)a4;
+ (id)sharedDeviceSelector;
- (ADExternalNotificationRequestHandler)externalNotificationRequestHandler;
- (ADSiriHeadphonesMonitor)headphonesManager;
- (BOOL)_shouldHandleAnnouncementLocallyForRoute:(id)a3 notificationRequest:(id)a4;
- (NSMutableDictionary)announceIdToRemoteAssistantIdMap;
- (NSMutableDictionary)predictionIdToAnnounceIdMap;
- (id)_announcementRequestFromRemoteAnnouncementRequest:(id)a3 withCompletion:(id)a4;
- (id)_createPerformRemoteAnnoucementRequestFromNotificationRequest:(id)a3;
- (id)_init;
- (id)pairedPhone;
- (void)_populateCachesForRequest:(id)a3 toRemoteAssistantId:(id)a4;
- (void)deactivateWorkoutReminderAnnouncementWithPredictionId:(id)a3 completion:(id)a4;
- (void)handleAnnouncementRequest:(id)a3;
- (void)handleRemoteAnnounceRequest:(id)a3 completion:(id)a4;
- (void)handleRemoteDismissRequest:(id)a3 completion:(id)a4;
- (void)sendRemoteAnnouncementRequest:(id)a3 toAssistantId:(id)a4 withCompletion:(id)a5;
- (void)setAnnounceIdToRemoteAssistantIdMap:(id)a3;
- (void)setPredictionIdToAnnounceIdMap:(id)a3;
@end

@implementation ADAnnounceDeviceSelector

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADAnnounceDeviceSelector;
  v2 = -[ADAnnounceDeviceSelector init](&v20, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AFSiriHeadphonesMonitor sharedMonitor](&OBJC_CLASS___ADSiriHeadphonesMonitor, "sharedMonitor"));
    headphonesManager = v2->_headphonesManager;
    v2->_headphonesManager = (ADSiriHeadphonesMonitor *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    deviceCircleManager = v2->_deviceCircleManager;
    v2->_deviceCircleManager = (ADDeviceCircleManager *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
    externalNotificationRequestHandler = v2->_externalNotificationRequestHandler;
    v2->_externalNotificationRequestHandler = (ADExternalNotificationRequestHandler *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistantd.remote_announce_notification_cache", v12);
    cachePurgeQueue = v2->_cachePurgeQueue;
    v2->_cachePurgeQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    predictionIdToAnnounceIdMap = v2->_predictionIdToAnnounceIdMap;
    v2->_predictionIdToAnnounceIdMap = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    announceIdToRemoteAssistantIdMap = v2->_announceIdToRemoteAssistantIdMap;
    v2->_announceIdToRemoteAssistantIdMap = v17;
  }

  return v2;
}

- (id)pairedPhone
{
  if ((AFIsNano(self) & 1) != 0)
  {
    deviceCircleManager = self->_deviceCircleManager;
    id v4 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", &stru_1004F17C0);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager managedPeerInfoMatchingPeerInfo:]( deviceCircleManager,  "managedPeerInfoMatchingPeerInfo:",  v4));
  }

  else
  {
    v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      dispatch_queue_attr_t v9 = "-[ADAnnounceDeviceSelector pairedPhone]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s pairedPhone called on an unexpected (non-watch) platform",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)_shouldHandleAnnouncementLocallyForRoute:(id)a3 notificationRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    v14 = "-[ADAnnounceDeviceSelector _shouldHandleAnnouncementLocallyForRoute:notificationRequest:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s currentRoute: %@",  (uint8_t *)&v13,  0x16u);
  }

  id v8 = [v5 isRouteCurrentlyPicked];
  if ((_DWORD)v8)
  {
    id v8 = [v5 availableAnnouncementRequestTypes];
    BOOL v9 = v8 & 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  if (AFIsNano(v8))
  {
    unsigned __int8 v10 = [v5 isThirdPartyBluetoothHeadset];
    if ([v6 announcementType] == (id)9) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = 0;
    }
    if (v9) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v11;
    }
  }

  return v9;
}

- (void)deactivateWorkoutReminderAnnouncementWithPredictionId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (Block_layout *)a4;
  id v8 = [v6 length];
  if (!v8)
  {
    __int16 v15 = (os_log_s *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    id v16 = "%s predictionId must be a non-nil non-empty string";
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_20;
  }

  if ((AFIsNano(v8) & 1) == 0)
  {
    __int16 v15 = (os_log_s *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    id v16 = "%s Expected [ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:] to on"
          "ly ever be called from a Watch";
    goto LABEL_15;
  }

  if (!v7) {
    uint64_t v7 = &stru_1004F17E0;
  }
  BOOL v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Attempting to deactivate workout reminder announcement with prediction ID: %@",  buf,  0x16u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceDeviceSelector predictionIdToAnnounceIdMap](self, "predictionIdToAnnounceIdMap"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v6]);

  v12 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Prediction ID (%@) maps to announcement ID: %@",  buf,  0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector externalNotificationRequestHandler]( self,  "externalNotificationRequestHandler"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100100FD4;
    v17[3] = &unk_1004F86F8;
    objc_super v20 = v7;
    v17[4] = self;
    id v18 = v11;
    id v19 = v6;
    [v14 deactivateWorkoutReminderAnnouncementWithId:v18 completion:v17];
  }

  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[ADAnnounceDeviceSelector deactivateWorkoutReminderAnnouncementWithPredictionId:completion:]";
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s No announcement found for prediction ID: %@ - ignoring",  buf,  0x16u);
    }

    v7->invoke(v7, 0LL);
  }

LABEL_20:
}

- (void)handleAnnouncementRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADAnnounceNotificationRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceDeviceSelector headphonesManager](self, "headphonesManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioRoute]);

    unsigned __int8 v9 = [v8 isThirdPartyBluetoothHeadset];
    id v10 = [v6 announcementType];
    BOOL v11 = v10 == (id)9;
    if (v10 == (id)9 && (v9 & 1) == 0) {
      [v6 setPlatform:1];
    }
    unsigned int v12 = -[ADAnnounceDeviceSelector _shouldHandleAnnouncementLocallyForRoute:notificationRequest:]( self,  "_shouldHandleAnnouncementLocallyForRoute:notificationRequest:",  v8,  v6);
    BOOL v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 1024;
      unsigned int v36 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s request: %@, shouldHandleLocally: %d",  buf,  0x1Cu);
      if (v12) {
        goto LABEL_7;
      }
    }

    else if (v12)
    {
LABEL_7:
      -[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]( self,  "_populateCachesForRequest:toRemoteAssistantId:",  v6,  0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector externalNotificationRequestHandler]( self,  "externalNotificationRequestHandler"));
      [v14 handleAnnouncementRequest:v6];
LABEL_26:

      goto LABEL_27;
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100100BF8;
    v27[3] = &unk_1004F1808;
    BOOL v30 = v11;
    id v16 = v6;
    id v28 = v16;
    v29 = self;
    v17 = objc_retainBlock(v27);
    id v18 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Searching for paired phone",  buf,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceDeviceSelector pairedPhone](self, "pairedPhone"));
    objc_super v20 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v21 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
        __int16 v33 = 2112;
        id v34 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Paired phone found: %@", buf, 0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v19 assistantIdentifier]);
      if (v22)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100100CF8;
        v24[3] = &unk_1004F8D20;
        v26 = v17;
        id v25 = v16;
        -[ADAnnounceDeviceSelector sendRemoteAnnouncementRequest:toAssistantId:withCompletion:]( self,  "sendRemoteAnnouncementRequest:toAssistantId:withCompletion:",  v25,  v22,  v24);
      }

      else
      {
        __int16 v23 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Paired phone has nil assistant ID",  buf,  0xCu);
        }

        ((void (*)(void *, id))v17[2])(v17, v16);
      }
    }

    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Paired phone not reachable",  buf,  0xCu);
      }

      ((void (*)(void *, id))v17[2])(v17, v16);
    }

    v14 = v28;
    goto LABEL_26;
  }

  __int16 v15 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ADAnnounceDeviceSelector handleAnnouncementRequest:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Cannot announce request remotely since it is not an ADAnnounceNotificationRequest",  buf,  0xCu);
  }

- (void)sendRemoteAnnouncementRequest:(id)a3 toAssistantId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, SACommandFailed *, void))a5;
  BOOL v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    id v19 = "-[ADAnnounceDeviceSelector sendRemoteAnnouncementRequest:toAssistantId:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADAnnounceNotificationRequest);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    BOOL v13 = (SACommandFailed *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector _createPerformRemoteAnnoucementRequestFromNotificationRequest:]( self,  "_createPerformRemoteAnnoucementRequestFromNotificationRequest:",  v8));
    id v14 = [(id)objc_opt_class(self) _requestToExecuteCommand:v13 onRemoteWithAssistantId:v9];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      -[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]( self,  "_populateCachesForRequest:toRemoteAssistantId:",  v8,  v9);
      id v16 = (SACommandFailed *)objc_claimAutoreleasedReturnValue( +[ADCommandCenter sharedCommandCenter]( &OBJC_CLASS___ADCommandCenter,  "sharedCommandCenter"));
      -[SACommandFailed handleCommand:completion:](v16, "handleCommand:completion:", v15, v10);
    }

    else
    {
      id v16 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Failed to create SAExecuteOnRemoteRequest");
      v10[2](v10, v16, 0LL);
    }
  }

  else
  {
    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      id v19 = "-[ADAnnounceDeviceSelector sendRemoteAnnouncementRequest:toAssistantId:withCompletion:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unsupported request type for remote annoucement: %@",  (uint8_t *)&v18,  0x16u);
    }

    BOOL v13 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    -[SACommandFailed setReason:](v13, "setReason:", @"No Announcement Route");
    v10[2](v10, v13, 0LL);
  }
}

- (id)_createPerformRemoteAnnoucementRequestFromNotificationRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AFRequestInfo requestInfoFromAnnouncementRequest:previousRequest:synchronousBurstIndex:isMediaPlaying:]( &OBJC_CLASS___AFRequestInfo,  "requestInfoFromAnnouncementRequest:previousRequest:synchronousBurstIndex:isMediaPlaying:",  v3,  0LL,  0LL,  0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startLocalRequest]);

  id v6 = objc_alloc_init(&OBJC_CLASS___SAPerformRemoteAnnouncement);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 announcementIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  [v6 setAnnouncementIdentifier:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 requestType]));
  [v6 setAnnouncementType:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 announcementType]));
  [v6 setAnnouncementNotificationType:v10];

  id v11 = [v3 platform];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  [v6 setAnnouncementPlatform:v12];

  [v6 setStartLocalRequest:v5];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v6 setAnnouncementTimestamp:v13];

  return v6;
}

- (void)handleRemoteAnnounceRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (Block_layout *)a4;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[ADAnnounceDeviceSelector handleRemoteAnnounceRequest:completion:]";
    __int16 v29 = 2112;
    double v30 = *(double *)&v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  if (!v7) {
    uint64_t v7 = &stru_1004F1828;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceDeviceSelector headphonesManager](self, "headphonesManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAudioRoute]);
  unsigned __int8 v11 = -[ADAnnounceDeviceSelector _shouldHandleAnnouncementLocallyForRoute:notificationRequest:]( self,  "_shouldHandleAnnouncementLocallyForRoute:notificationRequest:",  v10,  0LL);

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 announcementTimestamp]);
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    if (v14 >= -10.0)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100100B40;
      v24[3] = &unk_1004FC010;
      id v25 = (SACommandFailed *)v6;
      v26 = v7;
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector _announcementRequestFromRemoteAnnouncementRequest:withCompletion:]( self,  "_announcementRequestFromRemoteAnnouncementRequest:withCompletion:",  v25,  v24));
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector externalNotificationRequestHandler]( self,  "externalNotificationRequestHandler"));
      [v23 handleAnnouncementRequest:v22];

      id v19 = v25;
      goto LABEL_13;
    }

    double v15 = -v14;
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v28 = "-[ADAnnounceDeviceSelector handleRemoteAnnounceRequest:completion:]";
      __int16 v29 = 2048;
      double v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = 0x4024000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s remote announcement request received after %.1f seconds, limit is %.1f",  buf,  0x20u);
    }

    v17 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"remote announcement request received after %.1f seconds, limit is %.1f",  *(void *)&v15,  0x4024000000000000LL));
    id v19 = -[SACommandFailed initWithReason:](v17, "initWithReason:", v18);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    -[SACommandFailed setRefId:](v19, "setRefId:", v20);
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    -[SACommandFailed setRefId:](v19, "setRefId:", v21);

    -[SACommandFailed setReason:](v19, "setReason:", @"No Announcement Route");
  }

  v7->invoke(v7, v19, 0LL);
LABEL_13:
}

- (id)_announcementRequestFromRemoteAnnouncementRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 announcementType]);
  unsigned int v8 = [v7 unsignedIntValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 announcementNotificationType]);
  unsigned int v10 = [v9 unsignedIntValue];

  if (v8 == 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = -[ADAnnouncementRequest initWithRemoteAnnouncement:completion:]( objc_alloc(&OBJC_CLASS___ADAnnounceNotificationRequest),  "initWithRemoteAnnouncement:completion:",  v5,  v6);

    -[ADAnnounceNotificationRequest setAnnouncementType:](v12, "setAnnouncementType:", v11);
    -[ADAnnouncementRequest setRequiresOpportuneTime:]( v12,  "setRequiresOpportuneTime:",  (id)-[ADAnnouncementRequest platform](v12, "platform") == (id)1);
    -[ADAnnouncementRequest setRequiresOpportuneTime:](v12, "setRequiresOpportuneTime:", 0LL);
  }

  else
  {
    double v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[ADAnnounceDeviceSelector _announcementRequestFromRemoteAnnouncementRequest:withCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s failed to announce remote announcement",  (uint8_t *)&v15,  0xCu);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);

    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)handleRemoteDismissRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 announcementIdentifier]);

  unsigned int v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnnounceDeviceSelector externalNotificationRequestHandler]( self,  "externalNotificationRequestHandler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100100A3C;
  v13[3] = &unk_1004FDA58;
  id v14 = v6;
  id v12 = v6;
  [v11 deactivateWorkoutReminderAnnouncementWithId:v10 completion:v13];
}

- (void)_populateCachesForRequest:(id)a3 toRemoteAssistantId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 announcementIdentifier]);
  if (!v8)
  {
    id v16 = (os_log_s *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]";
    v17 = "%s cannot populate caches for nil announcement identifier";
    goto LABEL_12;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___ADAnnounceWorkoutReminderRequest);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 workoutReminder]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 predictionIdentifier]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceDeviceSelector predictionIdToAnnounceIdMap](self, "predictionIdToAnnounceIdMap"));
      [v12 setObject:v8 forKey:v11];

      goto LABEL_5;
    }

    id v16 = (os_log_s *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADAnnounceDeviceSelector _populateCachesForRequest:toRemoteAssistantId:]";
    v17 = "%s cannot populate cache for nil prediction identifier";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    goto LABEL_13;
  }

- (NSMutableDictionary)announceIdToRemoteAssistantIdMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAnnounceIdToRemoteAssistantIdMap:(id)a3
{
}

- (NSMutableDictionary)predictionIdToAnnounceIdMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPredictionIdToAnnounceIdMap:(id)a3
{
}

- (ADExternalNotificationRequestHandler)externalNotificationRequestHandler
{
  return self->_externalNotificationRequestHandler;
}

- (ADSiriHeadphonesMonitor)headphonesManager
{
  return self->_headphonesManager;
}

- (void).cxx_destruct
{
}

+ (id)sharedDeviceSelector
{
  if (qword_100577DA0 != -1) {
    dispatch_once(&qword_100577DA0, &stru_1004F1780);
  }
  return (id)qword_100577DA8;
}

+ (id)_requestToExecuteCommand:(id)a3 onRemoteWithAssistantId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _serializedData]);
  if (!v7)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    id v15 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  200LL,  0LL,  &v15));
    id v11 = v15;

    if (v11)
    {
      id v12 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "+[ADAnnounceDeviceSelector _requestToExecuteCommand:onRemoteWithAssistantId:]";
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Could not serialize the command: %@",  buf,  0x16u);
      }

LABEL_10:
      uint64_t v9 = 0LL;
      goto LABEL_11;
    }
  }

  if (![v6 length])
  {
    double v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[ADAnnounceDeviceSelector _requestToExecuteCommand:onRemoteWithAssistantId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s invalid assistantId - must be a non-zero length string",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___SARemoteDevice);
  [v8 setAssistantId:v6];
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAExecuteOnRemoteRequest);
  -[SAExecuteOnRemoteRequest setRemoteDevice:](v9, "setRemoteDevice:", v8);
  -[SAExecuteOnRemoteRequest setSerializedCommand:](v9, "setSerializedCommand:", v7);
  -[SAExecuteOnRemoteRequest setUseGuaranteedDelivery:](v9, "setUseGuaranteedDelivery:", 1LL);

LABEL_11:
  return v9;
}

@end