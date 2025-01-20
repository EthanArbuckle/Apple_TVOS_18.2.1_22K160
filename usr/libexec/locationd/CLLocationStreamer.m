@interface CLLocationStreamer
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)emergencyEnablementAssertionActive;
- (BOOL)isClientActivityTypeAirborneActive;
- (BOOL)isClientActivityTypeFitnessActive;
- (BOOL)isClientMapMatchingActive;
- (BOOL)isSubscribedForMotion;
- (BOOL)locationUpdatesIncludeMotionState;
- (BOOL)motionAlarmActive;
- (CLLocationStreamer)init;
- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection;
- (CLTimer)aliveAgainThrottleTimer;
- (CLTimer)resendMotionStateTimer;
- (id).cxx_construct;
- (int)currentGranularity;
- (void)beginService;
- (void)endService;
- (void)failedToSendMessage:(id)a3 withError:(id)a4 isFatal:(BOOL)a5;
- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4;
- (void)onMotionStateNotification:(const int *)a3 withData:(const NotificationData *)a4;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)reevaluateMotionSubscription;
- (void)sendAliveAgainMessage;
- (void)sendMotionState;
- (void)setAliveAgainThrottleTimer:(id)a3;
- (void)setClientActivityTypeAirborneActive:(BOOL)a3;
- (void)setClientActivityTypeFitnessActive:(BOOL)a3;
- (void)setClientMapMatchingActive:(BOOL)a3;
- (void)setCurrentGranularity:(int)a3;
- (void)setEmergencyEnablementAssertionActive:(BOOL)a3;
- (void)setIsSubscribedForMotion:(BOOL)a3;
- (void)setLocationUpdatesIncludeMotionState:(BOOL)a3;
- (void)setMotionAlarmActive:(BOOL)a3;
- (void)setResendMotionStateTimer:(id)a3;
- (void)setStreamingConnection:(id)a3;
- (void)startMotionAlarm;
- (void)startUpdatingLocationWithGranularity:(int)a3 includeMotion:(BOOL)a4 inFitnessSession:(BOOL)a5 inAirborneSession:(BOOL)a6 emergencyEnablementAssertionActive:(BOOL)a7 hasMapMatching:(BOOL)a8;
- (void)stopLocation;
- (void)stopMotionAlarm;
- (void)successfullySentMessage:(id)a3;
- (void)unregisterAllLocationNotifications;
@end

@implementation CLLocationStreamer

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019972F0 != -1) {
    dispatch_once(&qword_1019972F0, &stru_101842A88);
  }
  return (id)qword_1019972E8;
}

+ (BOOL)isSupported
{
  if (qword_101997300 != -1) {
    dispatch_once(&qword_101997300, &stru_101842AA8);
  }
  return byte_1019972F8;
}

- (CLLocationStreamer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationStreamer;
  return -[CLLocationStreamer initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationStreamerServiceProtocol,  &OBJC_PROTOCOL___CLLocationStreamerClientProtocol);
}

- (void)beginService
{
  id v3 = objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1005D5868;
  v21[3] = &unk_10181A288;
  v21[4] = self;
  v4 = (uint64_t *)operator new(0x30uLL);
  sub_1010DDBC0(buf, "Active location client on remote device");
  sub_1005D7F38((uint64_t)v4, (__int128 *)buf, v3, (uint64_t)v21, 30.0);
  if (SBYTE3(v26) < 0) {
    operator delete(*(void **)buf);
  }
  sub_1005D5C2C((uint64_t **)&self->_locationAssertion, v4);
  id v5 = objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1005D5948;
  v20[3] = &unk_10181A288;
  v20[4] = self;
  v6 = (uint64_t *)operator new(0x30uLL);
  sub_1010DDBC0(buf, "Remote device is considering this device as a location source");
  sub_1005D7F38((uint64_t)v6, (__int128 *)buf, v5, (uint64_t)v20, 30.0);
  if (SBYTE3(v26) < 0) {
    operator delete(*(void **)buf);
  }
  sub_1005D5C2C((uint64_t **)&self->_motionAlarmAssertion, v6);
  sub_10043AC3C((uint64_t)sub_1005D5A28, (uint64_t)self, -[CLLocationStreamer universe](self, "universe"), buf);
  v7 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = v7;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v9 = *(void **)buf;
    *(void *)buf = 0LL;
    if (v9) {
      (*(void (**)(void *))(*(void *)v9 + 8LL))(v9);
    }
  }

  sub_10036B3B4((uint64_t)sub_1005D5A38, (uint64_t)self, -[CLLocationStreamer universe](self, "universe"), buf);
  v10 = *(Client **)buf;
  *(void *)buf = 0LL;
  v11 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = v10;
  if (v11)
  {
    (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    v12 = *(void **)buf;
    *(void *)buf = 0LL;
    if (v12) {
      (*(void (**)(void *))(*(void *)v12 + 8LL))(v12);
    }
  }

  v13 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo"), "newTimer");
  self->_resendMotionStateTimer = v13;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1005D5A48;
  v19[3] = &unk_10181A288;
  v19[4] = self;
  -[CLTimer setHandler:](v13, "setHandler:", v19);
  -[CLLocationStreamer setStreamingConnection:]( self,  "setStreamingConnection:",  objc_msgSend( objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "vendor"),  "proxyForService:forClient:",  @"CLLocationStreamingConnectionManager",  @"CLLocationStreamer"));
  -[CLLocationStreamingConnectionManagerServiceProtocol addClient:]( -[CLLocationStreamer streamingConnection](self, "streamingConnection"),  "addClient:",  self);
  double v18 = 0.0;
  uint64_t v14 = sub_1002F8DDC();
  sub_1002A82BC(v14, "kCLLocationStreamerLastAliveAgainMessageTimestamp", &v18);
  if (CFAbsoluteTimeGetCurrent() - v18 <= 15.0)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    v16 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289282LL;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2050;
      double v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Sending alive again after a delay, last timestamp:%{public}f}",  buf,  0x1Cu);
    }

    -[CLLocationStreamer setAliveAgainThrottleTimer:]( self,  "setAliveAgainThrottleTimer:",  objc_msgSend(objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo"), "newTimer"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1005D5B28;
    v17[3] = &unk_10181A288;
    v17[4] = self;
    -[CLTimer setHandler:]( -[CLLocationStreamer aliveAgainThrottleTimer](self, "aliveAgainThrottleTimer"),  "setHandler:",  v17);
    -[CLTimer setNextFireDelay:]( -[CLLocationStreamer aliveAgainThrottleTimer](self, "aliveAgainThrottleTimer"),  "setNextFireDelay:",  15.0);
  }

  else
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    v15 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289026LL;
      __int16 v23 = 2082;
      v24 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Sending alive again}",  buf,  0x12u);
    }

    -[CLLocationStreamer sendAliveAgainMessage](self, "sendAliveAgainMessage");
  }

- (void)endService
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  sub_1005D5C2C((uint64_t **)&self->_locationAssertion, 0LL);
  sub_1005D5C2C((uint64_t **)&self->_motionAlarmAssertion, 0LL);
  v4 = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0LL;
  if (v4) {
    operator delete(v4);
  }
  -[CLTimer invalidate](-[CLLocationStreamer resendMotionStateTimer](self, "resendMotionStateTimer"), "invalidate");
  -[CLLocationStreamer setResendMotionStateTimer:](self, "setResendMotionStateTimer:", 0LL);
  -[CLLocationStreamingConnectionManagerServiceProtocol retireClient:]( -[CLLocationStreamer streamingConnection](self, "streamingConnection"),  "retireClient:",  self);
  -[CLLocationStreamer setStreamingConnection:](self, "setStreamingConnection:", 0LL);
  -[CLTimer invalidate](-[CLLocationStreamer aliveAgainThrottleTimer](self, "aliveAgainThrottleTimer"), "invalidate");
  -[CLLocationStreamer setAliveAgainThrottleTimer:](self, "setAliveAgainThrottleTimer:", 0LL);
}

- (void)sendAliveAgainMessage
{
  uint64_t v3 = sub_1002F8DDC();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  sub_1002AC7B8(v3, "kCLLocationStreamerLastAliveAgainMessageTimestamp", &Current);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  id v5 = objc_alloc_init(&OBJC_CLASS___CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:]( v5,  "setMessageType:",  @"kCLLocationStreamingMessageTypeAliveAgain");
  -[CLLocationStreamingMessage setPriority:](v5, "setPriority:", 300LL);
  v8[0] = IDSSendMessageOptionTimeoutKey;
  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 30.0);
  v8[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v8[2] = IDSSendMessageOptionEncryptPayloadKey;
  v9[0] = v6;
  v9[1] = &__kCFBooleanTrue;
  v9[2] = &__kCFBooleanTrue;
  v9[3] = &__kCFBooleanTrue;
  v8[3] = IDSSendMessageOptionRequireBluetoothKey;
  v8[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v9[4] = @"kCLLocationStreamingMessageTypeAliveAgain";
  -[CLLocationStreamingMessage setIdsOptions:]( v5,  "setIdsOptions:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  5LL));
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:]( -[CLLocationStreamer streamingConnection](self, "streamingConnection"),  "sendMessage:",  v5);
}

- (void)unregisterAllLocationNotifications
{
}

- (void)stopLocation
{
  value = self->_locationAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v4 = *(void *)value;
  *(void *)value = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  id v5 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Shut down location streaming}",  (uint8_t *)v6,  0x12u);
  }

- (void)setEmergencyEnablementAssertionActive:(BOOL)a3
{
  if (self->_emergencyEnablementAssertionActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    id v5 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 1026;
      BOOL v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLEEA change, needed:%{public}hhd}",  (uint8_t *)v6,  0x18u);
    }

    objc_msgSend( objc_msgSend( objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientManager"),  "markClientEmergencyEnablementTransition:",  v3);
    self->_emergencyEnablementAssertionActive = v3;
  }

- (void)setClientMapMatchingActive:(BOOL)a3
{
  if (self->_clientMapMatchingActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    id v5 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLMM Setting client map matching, state:%{public}hhd}",  (uint8_t *)v9,  0x18u);
    }

    self->_clientMapMatchingActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:17 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:17];
    }
  }

- (void)setClientActivityTypeFitnessActive:(BOOL)a3
{
  if (self->_clientActivityTypeFitnessActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    id v5 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Setting fitness activity type, state:%{public}hhd}",  (uint8_t *)v9,  0x18u);
    }

    self->_clientActivityTypeFitnessActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:28 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:28];
    }
  }

- (void)setClientActivityTypeAirborneActive:(BOOL)a3
{
  if (self->_clientActivityTypeAirborneActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    id v5 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Setting airborne activity type, state:%{public}hhd}",  (uint8_t *)v9,  0x18u);
    }

    self->_clientActivityTypeAirborneActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:29 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:29];
    }
  }

- (void)startUpdatingLocationWithGranularity:(int)a3 includeMotion:(BOOL)a4 inFitnessSession:(BOOL)a5 inAirborneSession:(BOOL)a6 emergencyEnablementAssertionActive:(BOOL)a7 hasMapMatching:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v13 = *(void *)&a3;
  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  v15 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    -[CLLocationStreamer currentGranularity](self, "currentGranularity");
    int v19 = 68289538;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 2050;
    uint64_t v24 = v13;
    __int16 v25 = 2050;
    uint64_t v26 = -[CLLocationStreamer currentGranularity](self, "currentGranularity");
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Starting, new granularity:%{public, location:CLLocationStreamingGranularity}lld, cu rrent granularity:%{public, location:CLLocationStreamingGranularity}lld}",  (uint8_t *)&v19,  0x26u);
  }

  if ((_DWORD)v13)
  {
    -[CLLocationStreamer setLocationUpdatesIncludeMotionState:](self, "setLocationUpdatesIncludeMotionState:", v12);
    -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
    -[CLLocationStreamer setClientActivityTypeFitnessActive:](self, "setClientActivityTypeFitnessActive:", v11);
    -[CLLocationStreamer setClientActivityTypeAirborneActive:](self, "setClientActivityTypeAirborneActive:", v10);
    -[CLLocationStreamer setEmergencyEnablementAssertionActive:](self, "setEmergencyEnablementAssertionActive:", v9);
    -[CLLocationStreamer setClientMapMatchingActive:](self, "setClientMapMatchingActive:", v8);
    if (-[CLLocationStreamer currentGranularity](self, "currentGranularity") == (_DWORD)v13)
    {
LABEL_9:
      sub_1005D6760((uint64_t)self->_locationAssertion.__ptr_.__value_);
      return;
    }

    -[CLLocationStreamer unregisterAllLocationNotifications](self, "unregisterAllLocationNotifications");
    if (v13 < 4)
    {
      [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:(3 - v13) registrationInfo:0];
      -[CLLocationStreamer setCurrentGranularity:](self, "setCurrentGranularity:", v13);
      goto LABEL_9;
    }

    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    v16 = (os_log_s *)qword_101934998;
    uint64_t v17 = v13;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      int v19 = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2050;
      uint64_t v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unexpected granularity, granularity:%{public, location:CLLocationStreamingGranularity}lld}",  (uint8_t *)&v19,  0x1Cu);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101842AC8);
      }
    }

    double v18 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      int v19 = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2050;
      uint64_t v24 = v17;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unexpected granularity",  "{msg%{public}.0s:Unexpected granularity, granularity:%{public, location:CLLocationStreamingGranularity}lld}",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    -[CLLocationStreamer stopLocation](self, "stopLocation");
  }

- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4
{
  if (*a3 > 2u)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    BOOL v10 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *a3;
      uint64_t buf = 68289282LL;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2050;
      uint64_t v34 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unexpected notification, notification:%{public, location:CLLocationProvider_Type::N otification}lld}",  (uint8_t *)&buf,  0x1Cu);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101842AC8);
      }
    }

    BOOL v12 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      uint64_t v13 = *a3;
      uint64_t buf = 68289282LL;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2050;
      uint64_t v34 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unexpected notification",  "{msg%{public}.0s:Unexpected notification, notification:%{public, location:CLLocationProvider_Type::N otification}lld}",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  else
  {
    double v7 = *((double *)a4 + 11);
    if (v7 <= 0.0)
    {
      double v9 = 15.0;
    }

    else
    {
      double v8 = v7 + *(double *)((char *)a4 + 76);
      double v9 = v8 - CFAbsoluteTimeGetCurrent();
    }

    if (v9 <= 0.0)
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101842AC8);
      }
      __int16 v23 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)((char *)a4 + 76);
        uint64_t v25 = *((void *)a4 + 11);
        uint64_t buf = 68289538LL;
        __int16 v31 = 2082;
        v32 = "";
        __int16 v33 = 2050;
        uint64_t v34 = v24;
        __int16 v35 = 2050;
        uint64_t v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Dropping location due to expiration, timestamp:%{public}f, lifespan:%{public}f}",  (uint8_t *)&buf,  0x26u);
      }
    }

    else
    {
      uint64_t v14 =  -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
      v15 = objc_alloc(&OBJC_CLASS___CLLocation);
      __int128 v16 = *((_OWORD *)a4 + 7);
      v26[6] = *((_OWORD *)a4 + 6);
      v26[7] = v16;
      v27[0] = *((_OWORD *)a4 + 8);
      *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)((char *)a4 + 140);
      __int128 v17 = *((_OWORD *)a4 + 3);
      v26[2] = *((_OWORD *)a4 + 2);
      v26[3] = v17;
      __int128 v18 = *((_OWORD *)a4 + 5);
      v26[4] = *((_OWORD *)a4 + 4);
      v26[5] = v18;
      __int128 v19 = *((_OWORD *)a4 + 1);
      v26[0] = *(_OWORD *)a4;
      v26[1] = v19;
      -[NSKeyedArchiver encodeObject:forKey:]( v14,  "encodeObject:forKey:",  -[CLLocation initWithClientLocation:](v15, "initWithClientLocation:", v26),  @"kCLLocationStreamingMessageLocationKey");
      int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[NSKeyedArchiver encodedData](v14, "encodedData"),  @"kCLLocationStreamingMessageLocationKey");
      if (-[CLLocationStreamer locationUpdatesIncludeMotionState](self, "locationUpdatesIncludeMotionState"))
      {
        value = self->_lastMotionActivity.__ptr_.__value_;
        if (value) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", CLMotionActivity::isMoving(value)),  @"kCLLocationStreamingMessageInMotionKey");
        }
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[CLStreamedLocationPrivate data](  -[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]( objc_alloc(&OBJC_CLASS___CLStreamedLocationPrivate),  "initWithDaemonLocationPrivate:",  (char *)a4 + 160),  "data"),  @"kCLLocationStreamingMessageLocationPrivateKey");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[CLStreamedLocationInternal data](  -[CLStreamedLocationInternal initWithDaemonLocation:]( objc_alloc(&OBJC_CLASS___CLStreamedLocationInternal),  "initWithDaemonLocation:",  a4),  "data"),  @"kCLLocationStreamingMessageLocationInternalKey");
      v22 = objc_alloc_init(&OBJC_CLASS___CLLocationStreamingMessage);
      -[CLLocationStreamingMessage setMessageType:]( v22,  "setMessageType:",  @"kCLLocationStreamingMessageTypeLocation");
      -[CLLocationStreamingMessage setPayload:](v22, "setPayload:", v20);
      -[CLLocationStreamingMessage setPriority:](v22, "setPriority:", 300LL);
      v28[0] = IDSSendMessageOptionTimeoutKey;
      v29[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9);
      v29[1] = &__kCFBooleanTrue;
      v28[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v28[2] = IDSSendMessageOptionEncryptPayloadKey;
      v28[3] = IDSSendMessageOptionRequireBluetoothKey;
      v29[2] = &__kCFBooleanTrue;
      v29[3] = &__kCFBooleanTrue;
      -[CLLocationStreamingMessage setIdsOptions:]( v22,  "setIdsOptions:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));
      -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:]( -[CLLocationStreamer streamingConnection](self, "streamingConnection"),  "sendMessage:",  v22);
    }
  }

- (void)reevaluateMotionSubscription
{
  if (-[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive")
    || -[CLLocationStreamer locationUpdatesIncludeMotionState](self, "locationUpdatesIncludeMotionState"))
  {
    if (!-[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion"))
    {
      [*((id *)self->_motionStateClient.__ptr_.__value_ + 2) register:*((void *)self->_motionStateClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
      -[CLLocationStreamer setIsSubscribedForMotion:](self, "setIsSubscribedForMotion:", 1LL);
    }
  }

  else if (-[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion"))
  {
    [*((id *)self->_motionStateClient.__ptr_.__value_ + 2) unregister:*((void *)self->_motionStateClient.__ptr_.__value_ + 1) forNotification:0];
    value = self->_lastMotionActivity.__ptr_.__value_;
    self->_lastMotionActivity.__ptr_.__value_ = 0LL;
    if (value) {
      operator delete(value);
    }
    -[CLLocationStreamer setIsSubscribedForMotion:](self, "setIsSubscribedForMotion:", 0LL);
    -[CLTimer setNextFireDelay:]( -[CLLocationStreamer resendMotionStateTimer](self, "resendMotionStateTimer"),  "setNextFireDelay:",  1.79769313e308);
  }

  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  uint64_t v4 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    double v7 = "";
    __int16 v8 = 1026;
    unsigned int v9 = -[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Motion state subscription, is subscribed:%{public}d}",  (uint8_t *)v5,  0x18u);
  }

- (void)startMotionAlarm
{
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  BOOL v3 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    __int16 v7 = 1026;
    unsigned int v8 = -[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Start motion alarm, currently active:%{public}d}",  (uint8_t *)v4,  0x18u);
  }

  sub_1005D6760((uint64_t)self->_motionAlarmAssertion.__ptr_.__value_);
  -[CLLocationStreamer setMotionAlarmActive:](self, "setMotionAlarmActive:", 1LL);
  -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
}

- (void)stopMotionAlarm
{
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  BOOL v3 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    unsigned int v8 = "";
    __int16 v9 = 1026;
    unsigned int v10 = -[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Stop motion alarm, currently active:%{public}d}",  (uint8_t *)v6,  0x18u);
  }

  -[CLLocationStreamer setMotionAlarmActive:](self, "setMotionAlarmActive:", 0LL);
  -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
  value = self->_motionAlarmAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v5 = *(void *)value;
  *(void *)value = 0LL;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
  }
}

- (void)sendMotionState
{
  uint64_t isMoving = CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:]( v4,  "setMessageType:",  @"kCLLocationStreamingMessageTypeMotionAlarmUpdate");
  unsigned int v8 = @"kCLLocationStreamingMessageInMotionKey";
  __int16 v9 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", isMoving);
  -[CLLocationStreamingMessage setPayload:]( v4,  "setPayload:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  -[CLLocationStreamingMessage setPriority:](v4, "setPriority:", 300LL);
  v6[0] = IDSSendMessageOptionTimeoutKey;
  uint64_t v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&qword_101997308);
  v6[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  _DWORD v6[2] = IDSSendMessageOptionEncryptPayloadKey;
  v7[0] = v5;
  v7[1] = &__kCFBooleanTrue;
  v6[3] = IDSSendMessageOptionRequireBluetoothKey;
  v7[2] = &__kCFBooleanTrue;
  v7[3] = &__kCFBooleanTrue;
  -[CLLocationStreamingMessage setIdsOptions:]( v4,  "setIdsOptions:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:]( -[CLLocationStreamer streamingConnection](self, "streamingConnection"),  "sendMessage:",  v4);
}

- (void)onMotionStateNotification:(const int *)a3 withData:(const NotificationData *)a4
{
  if (*a3)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    unsigned int v8 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      int v9 = *a3;
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)__int16 v31 = 2082;
      *(void *)&v31[2] = "";
      __int16 v32 = 1026;
      int v33 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unexpected motion notification, notification:%{public}d}",  buf,  0x18u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101842AC8);
      }
    }

    unsigned int v10 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      int v11 = *a3;
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)__int16 v31 = 2082;
      *(void *)&v31[2] = "";
      __int16 v32 = 1026;
      int v33 = v11;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unexpected motion notification",  "{msg%{public}.0s:Unexpected motion notification, notification:%{public}d}",  buf,  0x18u);
    }
  }

  else
  {
    value = self->_lastMotionActivity.__ptr_.__value_;
    if (value) {
      int isMoving = CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
    }
    else {
      int isMoving = 0;
    }
    __int128 v16 = operator new(0x88uLL);
    __int128 v17 = *((_OWORD *)a4 + 7);
    v16[6] = *((_OWORD *)a4 + 6);
    v16[7] = v17;
    *((void *)v16 + 16) = *((void *)a4 + 16);
    __int128 v18 = *((_OWORD *)a4 + 3);
    v16[2] = *((_OWORD *)a4 + 2);
    v16[3] = v18;
    __int128 v19 = *((_OWORD *)a4 + 5);
    v16[4] = *((_OWORD *)a4 + 4);
    v16[5] = v19;
    __int128 v20 = *((_OWORD *)a4 + 1);
    _OWORD *v16 = *(_OWORD *)a4;
    v16[1] = v20;
    __int16 v21 = self->_lastMotionActivity.__ptr_.__value_;
    self->_lastMotionActivity.__ptr_.__value_ = (CLMotionActivity *)v16;
    if (v21) {
      operator delete(v21);
    }
    BOOL v29 = 0;
    sub_1002F0B04(buf);
    int v22 = sub_1002A6F64(*(uint64_t *)buf, "LocationStreamerMotionOverride", &v29);
    __int16 v23 = *(std::__shared_weak_count **)v31;
    if (*(void *)v31)
    {
      uint64_t v24 = (unint64_t *)(*(void *)v31 + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    uint64_t v26 = self->_lastMotionActivity.__ptr_.__value_;
    if (v22)
    {
      if (v29) {
        int v27 = 6;
      }
      else {
        int v27 = 2;
      }
      v26->type = v27;
    }

    int v28 = CLMotionActivity::isMoving(v26);
    if (-[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive") && (!value || isMoving != v28))
    {
      -[CLLocationStreamer sendMotionState](self, "sendMotionState");
      -[CLTimer setNextFireDelay:interval:]( -[CLLocationStreamer resendMotionStateTimer](self, "resendMotionStateTimer"),  "setNextFireDelay:interval:",  30.0,  30.0);
    }
  }

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  if ([a3 isEqual:@"kCLLocationStreamingMessageTypeRequestLocation"])
  {
    id v7 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageGranularityKey"];
    id v8 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageIncludeMotionKey"];
    id v9 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageInFitnessSessionKey"];
    id v10 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageActivityTypeAirborneKey"];
    id v11 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageEmergencyEnablementKey"];
    id v12 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageMapMatching"];
    if (v7)
    {
      uint64_t v13 = v12;
      [v7 intValue];
      [v8 BOOLValue];
      [v9 BOOLValue];
      [v10 BOOLValue];
      [v11 BOOLValue];
      [v13 BOOLValue];
      -[CLLocationStreamer startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAssertionActive:hasMapMatching:]( self,  "startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAsserti onActive:hasMapMatching:");
    }

    else
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101842AC8);
      }
      v15 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
      {
        int v18 = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        id v23 = [@"kCLLocationStreamingMessageGranularityKey" UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Missing data, key:%{public, location:escape_only}s}",  (uint8_t *)&v18,  0x1Cu);
        if (qword_101934990 != -1) {
          dispatch_once(&qword_101934990, &stru_101842AC8);
        }
      }

      __int128 v16 = (os_log_s *)qword_101934998;
      if (os_signpost_enabled((os_log_t)qword_101934998))
      {
        id v17 = [@"kCLLocationStreamingMessageGranularityKey" UTF8String];
        int v18 = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        id v23 = v17;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Missing data",  "{msg%{public}.0s:Missing data, key:%{public, location:escape_only}s}",  (uint8_t *)&v18,  0x1Cu);
      }
    }
  }

  else if ([a3 isEqual:@"kCLLocationStreamingMessageTypeSetMotionAlarm"])
  {
    if (objc_msgSend( objc_msgSend( a4,  "objectForKeyedSubscript:",  @"kCLLocationStreamingMessageMotionAlarmStateKey"),  "BOOLValue")) {
      -[CLLocationStreamer startMotionAlarm](self, "startMotionAlarm");
    }
    else {
      -[CLLocationStreamer stopMotionAlarm](self, "stopMotionAlarm");
    }
  }

  else
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    uint64_t v14 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      int v18 = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      id v23 = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Unrecognized message type, type:%{public, location:escape_only}s}",  (uint8_t *)&v18,  0x1Cu);
    }
  }

- (void)failedToSendMessage:(id)a3 withError:(id)a4 isFatal:(BOOL)a5
{
  BOOL v5 = a5;
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  id v8 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289794;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
    __int16 v14 = 2114;
    id v15 = a4;
    __int16 v16 = 1026;
    BOOL v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning Message failed to send, type:%{public, location:escape_only}s, error:%{p ublic, location:escape_only}@, fatal:%{public}d}",  (uint8_t *)v9,  0x2Cu);
  }

- (void)successfullySentMessage:(id)a3
{
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  uint64_t v4 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    __int16 v8 = 2082;
    id v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Message sent, type:%{public, location:escape_only}s}",  (uint8_t *)v5,  0x1Cu);
  }

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101842AC8);
  }
  BOOL v5 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Nearby status change, is nearby:%{public}d}",  (uint8_t *)&v7,  0x18u);
  }

  if (!v3)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101842AC8);
    }
    __int16 v6 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Paired device has left us, stopping location}",  (uint8_t *)&v7,  0x12u);
    }

    -[CLLocationStreamer stopLocation](self, "stopLocation");
  }

- (int)currentGranularity
{
  return self->_currentGranularity;
}

- (void)setCurrentGranularity:(int)a3
{
  self->_currentGranularity = a3;
}

- (BOOL)locationUpdatesIncludeMotionState
{
  return self->_locationUpdatesIncludeMotionState;
}

- (void)setLocationUpdatesIncludeMotionState:(BOOL)a3
{
  self->_locationUpdatesIncludeMotionState = a3;
}

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)motionAlarmActive
{
  return self->_motionAlarmActive;
}

- (void)setMotionAlarmActive:(BOOL)a3
{
  self->_motionAlarmActive = a3;
}

- (BOOL)isSubscribedForMotion
{
  return self->_isSubscribedForMotion;
}

- (void)setIsSubscribedForMotion:(BOOL)a3
{
  self->_isSubscribedForMotion = a3;
}

- (CLTimer)resendMotionStateTimer
{
  return self->_resendMotionStateTimer;
}

- (void)setResendMotionStateTimer:(id)a3
{
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (BOOL)isClientMapMatchingActive
{
  return self->_clientMapMatchingActive;
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
}

- (CLTimer)aliveAgainThrottleTimer
{
  return self->_aliveAgainThrottleTimer;
}

- (void)setAliveAgainThrottleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  sub_1005D5C2C((uint64_t **)&self->_motionAlarmAssertion, 0LL);
  uint64_t v4 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  sub_1005D5C2C((uint64_t **)&self->_locationAssertion, 0LL);
  BOOL v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  return self;
}

@end