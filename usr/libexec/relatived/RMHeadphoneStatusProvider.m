@interface RMHeadphoneStatusProvider
- (BOOL)activitySupported;
- (BOOL)requireActivity;
- (NSString)activeAudioRouteDeviceID;
- (OS_dispatch_queue)receiverQueue;
- (RMAudioAccessoryManager)audioAccessoryManager;
- (RMHeadphoneStatusProvider)initWithReceiverQueue:(id)a3 requireActivitySupport:(BOOL)a4;
- (id)callbackBlock;
- (id)startProducingDataWithCallback:(id)a3;
- (int64_t)lastDeviceStatus;
- (void)notifyClientWithStatusConnected:(BOOL)a3;
- (void)notifyConnectedToClient;
- (void)notifyDisconnectedToClient;
- (void)onActiveAudioRouteChanged:(id)a3;
- (void)setActiveAudioRouteDeviceID:(id)a3;
- (void)setActivitySupported:(BOOL)a3;
- (void)setAudioAccessoryManager:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setLastDeviceStatus:(int64_t)a3;
- (void)setReceiverQueue:(id)a3;
- (void)setRequireActivity:(BOOL)a3;
- (void)startMonitoringActiveAudioRoute;
- (void)stopMonitoringActiveAudioRoute;
- (void)stopProducingData;
- (void)updateActivityForCurrentRoute;
@end

@implementation RMHeadphoneStatusProvider

- (RMHeadphoneStatusProvider)initWithReceiverQueue:(id)a3 requireActivitySupport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RMHeadphoneStatusProvider;
  v7 = -[RMHeadphoneStatusProvider init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[RMHeadphoneStatusProvider setReceiverQueue:](v7, "setReceiverQueue:", v6);
    -[RMHeadphoneStatusProvider setRequireActivity:](v8, "setRequireActivity:", v4);
  }

  return v8;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___RMAudioAccessoryManager);
  -[RMHeadphoneStatusProvider setAudioAccessoryManager:](self, "setAudioAccessoryManager:", v5);

  +[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable");
  -[RMHeadphoneStatusProvider setCallbackBlock:](self, "setCallbackBlock:", v4);

  if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity"))
  {
    -[RMHeadphoneStatusProvider startMonitoringActiveAudioRoute](self, "startMonitoringActiveAudioRoute");
    -[RMHeadphoneStatusProvider updateActivityForCurrentRoute](self, "updateActivityForCurrentRoute");
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100008190;
  v9[3] = &unk_10001C9B8;
  v9[4] = self;
  id v6 = objc_retainBlock(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  [v7 startStatusUpdatesWithHandler:v6];

  return 0LL;
}

- (void)stopProducingData
{
  if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity")) {
    -[RMHeadphoneStatusProvider stopMonitoringActiveAudioRoute](self, "stopMonitoringActiveAudioRoute");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  [v3 stopStatusUpdates];

  -[RMHeadphoneStatusProvider setAudioAccessoryManager:](self, "setAudioAccessoryManager:", 0LL);
}

- (void)notifyDisconnectedToClient
{
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CA00);
  }
  v3 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[RMHeadphoneStatusProvider] About to notify disconnected to client.",  v4,  2u);
  }

  -[RMHeadphoneStatusProvider notifyClientWithStatusConnected:](self, "notifyClientWithStatusConnected:", 0LL);
}

- (void)notifyConnectedToClient
{
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CA00);
  }
  v3 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[RMHeadphoneStatusProvider] About to notify connected to client.",  v4,  2u);
  }

  -[RMHeadphoneStatusProvider notifyClientWithStatusConnected:](self, "notifyClientWithStatusConnected:", 1LL);
}

- (void)notifyClientWithStatusConnected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = kCMHeadphoneMotionManagerEventTypeKey;
  v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeConnect;
  if (!a3) {
    v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeDisconnect;
  }
  uint64_t v20 = *v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  0LL,  0LL));
  if (v7)
  {
    if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity")
      && !-[RMHeadphoneStatusProvider activitySupported](self, "activitySupported")
      && v3)
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CA00);
      }
      uint64_t v8 = qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "[RMHeadphoneStatusProvider] Dropping connect event due to no activity support.";
        objc_super v10 = (os_log_s *)v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 2;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }

    else
    {
      v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider receiverQueue](self, "receiverQueue"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100008588;
      v15[3] = &unk_10001C700;
      v15[4] = self;
      id v16 = v7;
      dispatch_async(v13, v15);
    }
  }

  else
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CA00);
    }
    uint64_t v14 = qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      v9 = "[RMHeadphoneStatusProvider] Failed to serialize event NSDictionary object: %{public}@";
      objc_super v10 = (os_log_s *)v14;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_16;
    }
  }
}

- (void)startMonitoringActiveAudioRoute
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"onActiveAudioRouteChanged:" name:@"RMAudioDeviceChangeCompletedNotification" object:0];
}

- (void)stopMonitoringActiveAudioRoute
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"RMAudioDeviceChangeCompletedNotification" object:0];
}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RMAudioDeviceChangeCompletedRouteIDKey"]);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider activeAudioRouteDeviceID](v5, "activeAudioRouteDeviceID"));
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CA00);
      }
      objc_super v10 = (os_log_s *)(id)qword_100023978;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider activeAudioRouteDeviceID](v5, "activeAudioRouteDeviceID"));
        int v13 = 138478083;
        uint64_t v14 = v7;
        __int16 v15 = 2113;
        id v16 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[RMHeadphoneStatusProvider] New audio route: %{private}@ (old route: %{private}@). Starting activity check.",  (uint8_t *)&v13,  0x16u);
      }

      -[RMHeadphoneStatusProvider setActiveAudioRouteDeviceID:](v5, "setActiveAudioRouteDeviceID:", v7);
      -[RMHeadphoneStatusProvider updateActivityForCurrentRoute](v5, "updateActivityForCurrentRoute");
    }
  }

  else
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CA00);
    }
    uint32_t v12 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[RMHeadphoneStatusProvider] Speaker route. Resetting activity support.",  (uint8_t *)&v13,  2u);
    }

    -[RMHeadphoneStatusProvider setActivitySupported:](v5, "setActivitySupported:", 0LL);
    -[RMHeadphoneStatusProvider setActiveAudioRouteDeviceID:](v5, "setActiveAudioRouteDeviceID:", 0LL);
  }

  objc_sync_exit(v5);
}

- (void)updateActivityForCurrentRoute
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008918;
  v4[3] = &unk_10001C9E0;
  v4[4] = self;
  [v3 startActivityUpdatesWithHandler:v4];
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
}

- (BOOL)activitySupported
{
  return self->_activitySupported;
}

- (void)setActivitySupported:(BOOL)a3
{
  self->_activitySupported = a3;
}

- (BOOL)requireActivity
{
  return self->_requireActivity;
}

- (void)setRequireActivity:(BOOL)a3
{
  self->_requireActivity = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallbackBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end