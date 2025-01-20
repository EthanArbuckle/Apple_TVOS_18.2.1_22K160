@interface ADArbitrationFeedbackManager
+ (id)sharedManager;
- (ADDeviceCircleManager)deviceCircleManager;
- (BOOL)_localDeviceIsSameAsLocationSharingDevice:(id)a3;
- (NSDictionary)executionContexts;
- (NSOperationQueue)operationQueue;
- (NSUUID)completedTurnId;
- (OS_dispatch_queue)queue;
- (SCDAFFeedbackService)feedbackService;
- (SCDAFParticipation)participation;
- (id)_createDeviceContextUpdateOperationForParticipation:(id)a3;
- (id)_createDeviceInfoOperationForParticipation:(id)a3;
- (id)_createPeerInfoUpdateOperationForParticipation:(id)a3;
- (id)_createPublishOperationForParticipation:(id)a3;
- (id)_createRequestInfoUpdateOperationForParticipation:(id)a3 forTurnId:(id)a4;
- (id)_findContextCollectorIn:(id)a3 withIDSIdentifier:(id)a4;
- (id)_findPairedPhoneIn:(id)a3;
- (id)_init;
- (id)_initForTesting;
- (id)_mediaStateFrom:(int64_t)a3;
- (id)_nearByDevicesFrom:(id)a3;
- (void)_findTargetDeviceInDeviceCircleLocalPeer:(id)a3 remotePeers:(id)a4 completion:(id)a5;
- (void)_forwardToContextCollectorMessage:(id)a3 From:(id)a4 completion:(id)a5;
- (void)_forwardToDevice:(id)a3 message:(id)a4 From:(id)a5 completion:(id)a6;
- (void)_handleArbitrationParticipationPush:(id)a3 from:(id)a4 completion:(id)a5;
- (void)_processAndSendUserFeedback;
- (void)assistantDismissed;
- (void)handle:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)handleUserFeedbackAction:(int64_t)a3;
- (void)publishParticipation:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)setCompletedTurnId:(id)a3;
- (void)setDeviceCircleManager:(id)a3;
- (void)setExecutionContexts:(id)a3;
- (void)setFeedbackService:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setParticipation:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ADArbitrationFeedbackManager

- (id)_initForTesting
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADArbitrationFeedbackManager;
  v2 = -[ADArbitrationFeedbackManager init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ArbitrationFeedbackQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setUnderlyingQueue:](v2->_operationQueue, "setUnderlyingQueue:", v2->_queue);
  }

  v12.receiver = v2;
  v12.super_class = (Class)&OBJC_CLASS___ADArbitrationFeedbackManager;
  return -[ADArbitrationFeedbackManager init](&v12, "init");
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADArbitrationFeedbackManager;
  v2 = -[ADArbitrationFeedbackManager init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ArbitrationFeedbackQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    deviceCircleManager = v2->_deviceCircleManager;
    v2->_deviceCircleManager = (ADDeviceCircleManager *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[SCDAFFeedbackService sharedService](&OBJC_CLASS___SCDAFFeedbackService, "sharedService"));
    feedbackService = v2->_feedbackService;
    v2->_feedbackService = (SCDAFFeedbackService *)v11;

    -[SCDAFFeedbackService setDelegate:](v2->_feedbackService, "setDelegate:", v2);
    -[ADArbitrationFeedbackManager setCompletedTurnId:](v2, "setCompletedTurnId:", 0LL);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v13 addListener:v2];

    v14 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v14;
  }

  return v2;
}

- (void)handleUserFeedbackAction:(int64_t)a3
{
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    int v9 = 136315394;
    v10 = "-[ADArbitrationFeedbackManager handleUserFeedbackAction:]";
    __int16 v11 = 2112;
    objc_super v12 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback handleUserFeedbackAction: %@",  (uint8_t *)&v9,  0x16u);
  }

  if (a3 != 2)
  {
    dispatch_queue_attr_t v5 = objc_alloc_init(&OBJC_CLASS___SAAppsLaunchApp);
    -[SAAppsLaunchApp setLaunchId:](v5, "setLaunchId:", SCDAFFeedbackAppBundleId);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v6 handleCommand:v5 completion:&stru_1004F3FB8];
  }

- (void)publishParticipation:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    int v9 = "-[ADArbitrationFeedbackManager publishParticipation:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", (uint8_t *)&v8, 0xCu);
  }

  if ((+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceArbitrationFeedbackEnabled") & 1) != 0)
  {
    objc_storeStrong((id *)&self->_participation, a3);
    -[ADArbitrationFeedbackManager _processAndSendUserFeedback](self, "_processAndSendUserFeedback");
  }

  else
  {
    dispatch_queue_t v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      int v9 = "-[ADArbitrationFeedbackManager publishParticipation:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Feature Disabled. Returning.",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (id)_createRequestInfoUpdateOperationForParticipation:(id)a3 forTurnId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018AE58;
  v12[3] = &unk_1004F9AA8;
  objc_copyWeak(&v15, &location);
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v12));

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (id)_createDeviceContextUpdateOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018A718;
  v6[3] = &unk_1004FD968;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v6));

  return v4;
}

- (id)_createPeerInfoUpdateOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018A2E4;
  v6[3] = &unk_1004FD968;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v6));

  return v4;
}

- (id)_createPublishOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100189C44;
  v6[3] = &unk_1004FD968;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v6));

  return v4;
}

- (id)_createDeviceInfoOperationForParticipation:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100189794;
  v7[3] = &unk_1004FD968;
  id v8 = a3;
  id v9 = self;
  id v4 = v8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v7));

  return v5;
}

- (void)assistantDismissed
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[ADArbitrationFeedbackManager assistantDismissed]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback assistantDismissed",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager feedbackService](self, "feedbackService"));
  [v4 handleAssistantDismissed];
}

- (id)_mediaStateFrom:(int64_t)a3
{
  else {
    return off_1004F4198[a3 - 1];
  }
}

- (void)handle:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    v16 = "-[ADArbitrationFeedbackManager handle:fromPeer:completion:]";
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Received arbitration push message: %@",  (uint8_t *)&v15,  0x16u);
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager deviceCircleManager](self, "deviceCircleManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 locationSharingDevice]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assistantIdentifier]);

  if (v14)
  {
    if (-[ADArbitrationFeedbackManager _localDeviceIsSameAsLocationSharingDevice:]( self,  "_localDeviceIsSameAsLocationSharingDevice:",  v14))
    {
      -[ADArbitrationFeedbackManager _handleArbitrationParticipationPush:from:completion:]( self,  "_handleArbitrationParticipationPush:from:completion:",  v8,  v9,  v10);
    }

    else
    {
      -[ADArbitrationFeedbackManager _forwardToDevice:message:From:completion:]( self,  "_forwardToDevice:message:From:completion:",  v14,  v8,  v9,  v10);
    }
  }

  else
  {
    -[ADArbitrationFeedbackManager _forwardToContextCollectorMessage:From:completion:]( self,  "_forwardToContextCollectorMessage:From:completion:",  v8,  v9,  v10);
  }
}

- (BOOL)_localDeviceIsSameAsLocationSharingDevice:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager deviceCircleManager](self, "deviceCircleManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localPeerInfo]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantIdentifier]);
  unsigned __int8 v8 = [v4 isEqualToString:v7];

  return v8;
}

- (id)_nearByDevicesFrom:(id)a3
{
  return objc_msgSend(a3, "af_lenientMappedArray:", &stru_1004F40C0);
}

- (void)_findTargetDeviceInDeviceCircleLocalPeer:(id)a3 remotePeers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  if (v10)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager locationSharingDevice](self->_deviceCircleManager, "locationSharingDevice"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assistantIdentifier]);

    if ([v12 length])
    {
      id v13 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[ADArbitrationFeedbackManager _findTargetDeviceInDeviceCircleLocalPeer:remotePeers:completion:]";
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Target device is location sharing device: %@",  buf,  0x16u);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 assistantIdentifier]);
      v10[2](v10, v12, [v14 isEqualToString:v12]);
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager deviceCircleManager](self, "deviceCircleManager"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1001890F8;
      v17[3] = &unk_1004F4268;
      v17[4] = self;
      v19 = v10;
      id v18 = v9;
      [v16 getContextCollectorDeviceIdentifiersWithCompletion:v17];
    }
  }

  else
  {
    int v15 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ADArbitrationFeedbackManager _findTargetDeviceInDeviceCircleLocalPeer:remotePeers:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback completion is nil. Returning.",  buf,  0xCu);
    }
  }
}

- (id)_findPairedPhoneIn:(id)a3
{
  return objc_msgSend(a3, "af_firstObjectPassingTest:", &stru_1004F4100);
}

- (id)_findContextCollectorIn:(id)a3 withIDSIdentifier:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100189078;
  v8[3] = &unk_1004F4128;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "af_firstObjectPassingTest:", v8));

  return v6;
}

- (void)_handleArbitrationParticipationPush:(id)a3 from:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    v19 = "-[ADArbitrationFeedbackManager _handleArbitrationParticipationPush:from:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Handle received arbitration request on this device.",  (uint8_t *)&v18,  0xCu);
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ADArbitrationParticipationMessage"]);
  id v13 = -[SCDAFParticipation initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___SCDAFParticipation),  "initWithDictionaryRepresentation:",  v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCDAFParticipation advertisement](v13, "advertisement"));

  if (v14)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager feedbackService](self, "feedbackService"));
    [v15 handleReceivedArbitrationParticipation:v13];

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }

  else
  {
    v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      v19 = "-[ADArbitrationFeedbackManager _handleArbitrationParticipationPush:from:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Unable to parse SCDAFParticipation from request. Returning error.",  (uint8_t *)&v18,  0xCu);
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  30LL,  @"Unable to parse SCDAFParticipation from request."));
    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v17);
    }
  }
}

- (void)_forwardToDevice:(id)a3 message:(id)a4 From:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_super v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADArbitrationFeedbackManager _forwardToDevice:message:From:completion:]";
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback Forward arbitration to device: %@",  buf,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager deviceCircleManager](self, "deviceCircleManager"));
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100188F74;
  v17[3] = &unk_1004F4150;
  id v18 = v9;
  id v19 = v11;
  id v15 = v11;
  id v16 = v9;
  [v13 sendRequestType:@"arbitration_info_push" data:v10 toDeviceWithAssistantIdentifier:v16 onQueue:queue completion:v17];
}

- (void)_forwardToContextCollectorMessage:(id)a3 From:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager deviceCircleManager](self, "deviceCircleManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100188DC0;
  v15[3] = &unk_1004F4178;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 getContextCollectorDeviceIdentifiersWithCompletion:v15];
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[ADCommandCenter sharedCommandCenter]( &OBJC_CLASS___ADCommandCenter,  "sharedCommandCenter",  a3,  a4,  a5,  a6,  a7,  a8));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 rootExecutionContexts]);
  -[ADArbitrationFeedbackManager setExecutionContexts:](self, "setExecutionContexts:", v9);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "turnIdentifier", a3));
  -[ADArbitrationFeedbackManager setCompletedTurnId:](self, "setCompletedTurnId:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootExecutionContexts]);
  -[ADArbitrationFeedbackManager setExecutionContexts:](self, "setExecutionContexts:", v9);

  -[ADArbitrationFeedbackManager _processAndSendUserFeedback](self, "_processAndSendUserFeedback");
}

- (void)_processAndSendUserFeedback
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager completedTurnId](self, "completedTurnId"));
  if (v3)
  {
    participation = self->_participation;

    if (participation)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADArbitrationFeedbackManager _createDeviceInfoOperationForParticipation:]( self,  "_createDeviceInfoOperationForParticipation:",  self->_participation));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADArbitrationFeedbackManager _createPeerInfoUpdateOperationForParticipation:]( self,  "_createPeerInfoUpdateOperationForParticipation:",  self->_participation));
      id v7 = self->_participation;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADArbitrationFeedbackManager completedTurnId](self, "completedTurnId"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADArbitrationFeedbackManager _createRequestInfoUpdateOperationForParticipation:forTurnId:]( self,  "_createRequestInfoUpdateOperationForParticipation:forTurnId:",  v7,  v8));

      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADArbitrationFeedbackManager _createDeviceContextUpdateOperationForParticipation:]( self,  "_createDeviceContextUpdateOperationForParticipation:",  self->_participation));
      [v6 addDependency:v5];
      [v9 addDependency:v6];
      [v10 addDependency:v9];
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADArbitrationFeedbackManager _createPublishOperationForParticipation:]( self,  "_createPublishOperationForParticipation:",  self->_participation));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100188D84;
      v12[3] = &unk_1004FD940;
      void v12[4] = self;
      [v11 setCompletionBlock:v12];
      [v11 addDependency:v5];
      [v11 addDependency:v6];
      [v11 addDependency:v9];
      [v11 addDependency:v10];
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);
    }
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (ADDeviceCircleManager)deviceCircleManager
{
  return self->_deviceCircleManager;
}

- (void)setDeviceCircleManager:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSDictionary)executionContexts
{
  return self->_executionContexts;
}

- (void)setExecutionContexts:(id)a3
{
}

- (SCDAFFeedbackService)feedbackService
{
  return self->_feedbackService;
}

- (void)setFeedbackService:(id)a3
{
}

- (SCDAFParticipation)participation
{
  return (SCDAFParticipation *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setParticipation:(id)a3
{
}

- (NSUUID)completedTurnId
{
  return (NSUUID *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCompletedTurnId:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018B3A0;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100577FF0 != -1) {
    dispatch_once(&qword_100577FF0, block);
  }
  return (id)qword_100577FE8;
}

@end