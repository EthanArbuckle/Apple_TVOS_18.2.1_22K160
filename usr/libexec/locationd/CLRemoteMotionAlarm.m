@interface CLRemoteMotionAlarm
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection;
- (CLRemoteMotionAlarm)init;
- (CLTimer)resendTimer;
- (CLTimer)revertToUnknownTimer;
- (NSMutableSet)motionAlarmClients;
- (int)lastKnownMotionState;
- (void)beginService;
- (void)delayRevertToUnknownTimer;
- (void)endService;
- (void)evaluateMotionAlarmState;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)registerClientForRemoteMotionAlarm:(id)a3;
- (void)sendMotionAlarmRequest;
- (void)setLastKnownMotionState:(int)a3;
- (void)setMotionAlarmClients:(id)a3;
- (void)setResendTimer:(id)a3;
- (void)setRevertToUnknownTimer:(id)a3;
- (void)setStreamingConnection:(id)a3;
- (void)unregisterClientForRemoteMotionAlarm:(id)a3;
@end

@implementation CLRemoteMotionAlarm

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999FB8 != -1) {
    dispatch_once(&qword_101999FB8, &stru_101867EF8);
  }
  return (id)qword_101999FB0;
}

+ (BOOL)isSupported
{
  if (qword_101999FC8 != -1) {
    dispatch_once(&qword_101999FC8, &stru_101867F18);
  }
  return byte_101999FC0;
}

- (CLRemoteMotionAlarm)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRemoteMotionAlarm;
  return -[CLRemoteMotionAlarm initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLRemoteMotionAlarmServiceProtocol,  &OBJC_PROTOCOL___CLRemoteMotionAlarmClientProtocol);
}

- (void)beginService
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100A28084;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  -[CLTimer setHandler:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setHandler:", v4);
  -[CLRemoteMotionAlarm setRevertToUnknownTimer:]( self,  "setRevertToUnknownTimer:",  objc_msgSend(objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo"), "newTimer"));
  -[CLTimer setHandler:]( -[CLRemoteMotionAlarm revertToUnknownTimer]( self,  "revertToUnknownTimer",  _NSConcreteStackBlock,  3221225472LL,  sub_100A28164,  &unk_10181A288,  self),  "setHandler:",  &v3);
}

- (void)endService
{
}

- (void)setLastKnownMotionState:(int)a3
{
  if (self->_lastKnownMotionState != a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_lastKnownMotionState = a3;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101867F38);
    }
    unint64_t v5 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289282LL;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Notifying motion alarm, state:%{public, location:CLLocationProvider_Type::MotionDetected}lld}",  (uint8_t *)&buf,  0x1Cu);
    }

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v6 = -[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients", 0LL);
    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)i) remoteDeviceMotionUpdate:v3 atTime:CFAbsoluteTimeGetCurrent()];
        }

        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v8);
    }
  }

- (void)evaluateMotionAlarmState
{
  if (-[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count"))
  {
    -[CLTimer nextFireDelay](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "nextFireDelay");
    if (v3 == 1.79769313e308)
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101867F38);
      }
      v4 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:enabling motion alarm}",  (uint8_t *)&v7,  0x12u);
      }

      -[CLTimer setFireInterval:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setFireInterval:", 30.0);
      -[CLTimer setNextFireDelay:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setNextFireDelay:", 30.0);
LABEL_15:
      -[CLRemoteMotionAlarm sendMotionAlarmRequest](self, "sendMotionAlarmRequest");
      return;
    }
  }

  if (!-[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count"))
  {
    -[CLTimer nextFireDelay](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "nextFireDelay");
    if (v5 != 1.79769313e308)
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101867F38);
      }
      v6 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:disabling motion alarm}",  (uint8_t *)&v7,  0x12u);
      }

      -[CLTimer setNextFireDelay:]( -[CLRemoteMotionAlarm resendTimer](self, "resendTimer"),  "setNextFireDelay:",  1.79769313e308);
      -[CLTimer setFireInterval:]( -[CLRemoteMotionAlarm resendTimer](self, "resendTimer"),  "setFireInterval:",  1.79769313e308);
      -[CLTimer setNextFireDelay:]( -[CLRemoteMotionAlarm revertToUnknownTimer](self, "revertToUnknownTimer"),  "setNextFireDelay:",  1.79769313e308);
      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0LL);
      goto LABEL_15;
    }
  }

- (void)delayRevertToUnknownTimer
{
}

- (void)sendMotionAlarmRequest
{
  double v3 = objc_alloc_init(&OBJC_CLASS___CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:]( v3,  "setMessageType:",  @"kCLLocationStreamingMessageTypeSetMotionAlarm");
  v6 = @"kCLLocationStreamingMessageMotionAlarmStateKey";
  int v7 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count") != 0LL);
  -[CLLocationStreamingMessage setPayload:]( v3,  "setPayload:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[CLLocationStreamingMessage setPriority:](v3, "setPriority:", 300LL);
  v4[0] = IDSSendMessageOptionTimeoutKey;
  v5[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 30.0);
  v5[1] = &__kCFBooleanTrue;
  v4[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v4[2] = IDSSendMessageOptionEncryptPayloadKey;
  v5[2] = &__kCFBooleanTrue;
  v5[3] = &__kCFBooleanTrue;
  v4[3] = IDSSendMessageOptionRequireBluetoothKey;
  v4[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v5[4] = @"kCLLocationStreamingMessageTypeSetMotionAlarm";
  -[CLLocationStreamingMessage setIdsOptions:]( v3,  "setIdsOptions:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  5LL));
  -[CLLocationStreamingMessage setProtocolVersion:](v3, "setProtocolVersion:", 0LL);
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:]( -[CLRemoteMotionAlarm streamingConnection](self, "streamingConnection"),  "sendMessage:",  v3);
}

- (void)registerClientForRemoteMotionAlarm:(id)a3
{
  if ((-[NSMutableSet containsObject:]( -[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"),  "containsObject:",  a3) & 1) == 0)
  {
    -[NSMutableSet addObject:](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "addObject:", a3);
    -[CLRemoteMotionAlarm evaluateMotionAlarmState](self, "evaluateMotionAlarmState");
    objc_msgSend( a3,  "remoteDeviceMotionUpdate:atTime:",  -[CLRemoteMotionAlarm lastKnownMotionState](self, "lastKnownMotionState"),  CFAbsoluteTimeGetCurrent());
  }

- (void)unregisterClientForRemoteMotionAlarm:(id)a3
{
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  if ([a3 isEqual:@"kCLLocationStreamingMessageTypeMotionAlarmUpdate"])
  {
    id v7 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageInMotionKey"];
    if (v7)
    {
      else {
        uint64_t v8 = 2LL;
      }
      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", v8);
      -[CLRemoteMotionAlarm delayRevertToUnknownTimer](self, "delayRevertToUnknownTimer");
    }

    else
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101867F38);
      }
      __int16 v9 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
      {
        int v11 = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        __int128 v14 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Motion alarm update without any state}",  (uint8_t *)&v11,  0x12u);
        if (qword_101934990 != -1) {
          dispatch_once(&qword_101934990, &stru_101867F38);
        }
      }

      v10 = (os_log_s *)qword_101934998;
      if (os_signpost_enabled((os_log_t)qword_101934998))
      {
        int v11 = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        __int128 v14 = "";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Motion alarm update without any state",  "{msg%{public}.0s:Motion alarm update without any state}",  (uint8_t *)&v11,  0x12u);
      }

      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0LL);
    }
  }

  else if ([a3 isEqual:@"kCLLocationStreamingMessageTypeAliveAgain"])
  {
    -[CLRemoteMotionAlarm sendMotionAlarmRequest](self, "sendMotionAlarmRequest");
  }

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  if (!a3) {
    -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0LL);
  }
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
}

- (NSMutableSet)motionAlarmClients
{
  return self->_motionAlarmClients;
}

- (void)setMotionAlarmClients:(id)a3
{
}

- (int)lastKnownMotionState
{
  return self->_lastKnownMotionState;
}

- (CLTimer)resendTimer
{
  return self->_resendTimer;
}

- (void)setResendTimer:(id)a3
{
}

- (CLTimer)revertToUnknownTimer
{
  return self->_revertToUnknownTimer;
}

- (void)setRevertToUnknownTimer:(id)a3
{
}

@end