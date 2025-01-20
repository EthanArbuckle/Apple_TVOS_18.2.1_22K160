@interface CLNoMovementService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLNoMovementService)init;
- (NSMutableSet)clientRegistry;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onDeviceMotionData:(const Sample *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNoMovementControllerEnablement:(BOOL)a3;
- (void)onNoMovementControllerEpoch:(id)a3 epochValue:(int)a4;
- (void)onNoMovementControllerStateUpdate:(id)a3;
- (void)onWatchOrientationSettingsNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)registerForStateUpdates:(id)a3;
- (void)requestLatestStateUpdate:(id)a3;
- (void)serveClientsStateUpdate:(id)a3;
- (void)setClientRegistry:(id)a3;
- (void)toggleDeviceMotion:(BOOL)a3;
- (void)unregisterForStateUpdates:(id)a3;
@end

@implementation CLNoMovementService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A038 != -1) {
    dispatch_once(&qword_10199A038, &stru_101868388);
  }
  return (id)qword_10199A030;
}

- (CLNoMovementService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNoMovementService;
  return -[CLNoMovementService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLNoMovementServiceProtocol,  &OBJC_PROTOCOL___CLNoMovementServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10199A048 != -1) {
    dispatch_once(&qword_10199A048, &stru_1018683A8);
  }
  return byte_10199A040;
}

- (void)beginService
{
  objc_super v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    unint64_t v5 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  sub_1005C4E40((uint64_t)sub_100A32040, (uint64_t)self, self, buf);
  v6 = *(Client **)buf;
  *(void *)buf = 0LL;
  v7 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    v8 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  [*((id *)self->fWatchOrientationSettingsClient.__ptr_.__value_ + 2) register:*((void *)self->fWatchOrientationSettingsClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  v9 = -[CLDeviceMotionProperties initWithMode:]( objc_alloc(&OBJC_CLASS___CLDeviceMotionProperties),  "initWithMode:",  3LL);
  id v10 = objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  v11 = operator new(0x38uLL);
  sub_1011C06A0(v11, v10, (uint64_t)sub_100A32050, (uint64_t)self, v9);
  v12 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = v11;
  if (v12) {
    (*(void (**)(void *))(*(void *)v12 + 8LL))(v12);
  }

  v13 = (CLNoMovementController *)operator new(0x150uLL);
  sub_100B7BB30(v13, self);
  v14 = self->fController.__ptr_.__value_;
  self->fController.__ptr_.__value_ = v13;
  if (v14) {
    (*(void (**)(CLNoMovementController *))(*(void *)v14 + 24LL))(v14);
  }
  if (qword_1019347F0 != -1) {
    dispatch_once(&qword_1019347F0, &stru_1018683C8);
  }
  v15 = (os_log_s *)qword_1019347F8;
  if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[CLNoMovement] service: started service",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    v18[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  0LL,  "[CLNoMovement] service: started service",  v18,  2);
    v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService beginService]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

- (void)endService
{
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:2];
    v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
    }
  }

  unint64_t v5 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:0];
    v6 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
    self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  v7 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(void *))(*(void *)v7 + 8LL))(v7);
  }
  if (qword_1019347F0 != -1) {
    dispatch_once(&qword_1019347F0, &stru_1018683C8);
  }
  v8 = (os_log_s *)qword_1019347F8;
  if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: ended service", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    v11[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  0LL,  "[CLNoMovement] service: ended service",  v11,  2);
    id v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService endService]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

- (void)registerForStateUpdates:(id)a3
{
}

- (void)unregisterForStateUpdates:(id)a3
{
}

- (void)requestLatestStateUpdate:(id)a3
{
  if (self->fController.__ptr_.__value_)
  {
    notify_post("com.apple.locationd.nomovement.stateupdate");
    unint64_t v5 = (void *)sub_100B7BB34((uint64_t)self->fController.__ptr_.__value_);
    objc_msgSend(a3, "onStateUpdate:", objc_msgSend(v5, "copy"));
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    v6 = (os_log_s *)qword_1019347F8;
    if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_DEFAULT))
    {
      [v5 startTime];
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = v7;
      __int16 v18 = 1024;
      unsigned int v19 = [v5 state];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[CLNoMovement] service: served client request for latest state update,startTime,%f,state,%d",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347F0 != -1) {
        dispatch_once(&qword_1019347F0, &stru_1018683C8);
      }
      uint64_t v8 = qword_1019347F8;
      [v5 startTime];
      int v12 = 134218240;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      unsigned int v15 = [v5 state];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "[CLNoMovement] service: served client request for latest state update,startTime,%f,state,%d",  COERCE_DOUBLE(&v12),  18);
      v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService requestLatestStateUpdate:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

- (void)serveClientsStateUpdate:(id)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  unint64_t v5 = -[CLNoMovementService clientRegistry](self, "clientRegistry");
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)i),  "onStateUpdate:",  objc_msgSend(a3, "copy"));
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
    }

    while (v7);
  }

  if (qword_1019347F0 != -1) {
    dispatch_once(&qword_1019347F0, &stru_1018683C8);
  }
  id v10 = (os_log_s *)qword_1019347F8;
  if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_DEFAULT))
  {
    [a3 startTime];
    uint64_t v12 = v11;
    unsigned int v13 = [a3 state];
    *(_DWORD *)buf = 134218240;
    uint64_t v29 = v12;
    __int16 v30 = 1024;
    unsigned int v31 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[CLNoMovement] service: served all clients state update,startTime,%f,state,%d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    uint64_t v14 = qword_1019347F8;
    [a3 startTime];
    uint64_t v16 = v15;
    unsigned int v17 = [a3 state];
    int v24 = 134218240;
    uint64_t v25 = v16;
    __int16 v26 = 1024;
    unsigned int v27 = v17;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  0LL,  "[CLNoMovement] service: served all clients state update,startTime,%f,state,%d",  COERCE_DOUBLE(&v24),  18);
    unsigned int v19 = (uint8_t *)v18;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService serveClientsStateUpdate:]", "%s\n", v18);
    if (v19 != buf) {
      free(v19);
    }
  }

- (void)toggleDeviceMotion:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  if (sub_100DDA4D4())
  {
    if (v3)
    {
      if (qword_1019347F0 != -1) {
        dispatch_once(&qword_1019347F0, &stru_1018683C8);
      }
      unint64_t v5 = (os_log_s *)qword_1019347F8;
      if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[CLNoMovement] service: attempt to enable device motion",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347F0 != -1) {
          dispatch_once(&qword_1019347F0, &stru_1018683C8);
        }
        v13[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  1LL,  "[CLNoMovement] service: attempt to enable device motion",  v13,  2);
        id v10 = (uint8_t *)v9;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v9);
        if (v10 != buf) {
          free(v10);
        }
      }

      uint64_t v6 = sub_100DDA4D4();
      sub_100DDAEA4(v6, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_, 0.01);
    }

    else
    {
      if (qword_1019347F0 != -1) {
        dispatch_once(&qword_1019347F0, &stru_1018683C8);
      }
      id v7 = (os_log_s *)qword_1019347F8;
      if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[CLNoMovement] service: attempt to disable device motion",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347F0 != -1) {
          dispatch_once(&qword_1019347F0, &stru_1018683C8);
        }
        v13[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  1LL,  "[CLNoMovement] service: attempt to disable device motion",  v13,  2);
        uint64_t v12 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      uint64_t v8 = sub_100DDA4D4();
      sub_100DDB140(v8, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_);
    }
  }

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    id v10 = (os_log_s *)qword_1019347F8;
    if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[CLNoMovement] service: received workout-event notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347F0 != -1) {
        dispatch_once(&qword_1019347F0, &stru_1018683C8);
      }
      v28[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  1LL,  "[CLNoMovement] service: received workout-event notification",  v28,  2);
      unsigned int v27 = (uint8_t *)v26;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLNoMovementService onMotionStateMediatorNotification:data:]",  "%s\n",  v26);
      if (v27 != buf) {
        free(v27);
      }
    }

    value = self->fController.__ptr_.__value_;
    if (value)
    {
      __int128 v12 = *((_OWORD *)a4 + 13);
      v31[12] = *((_OWORD *)a4 + 12);
      v31[13] = v12;
      uint64_t v32 = *((void *)a4 + 28);
      __int128 v13 = *((_OWORD *)a4 + 9);
      v31[8] = *((_OWORD *)a4 + 8);
      v31[9] = v13;
      __int128 v14 = *((_OWORD *)a4 + 11);
      v31[10] = *((_OWORD *)a4 + 10);
      v31[11] = v14;
      __int128 v15 = *((_OWORD *)a4 + 5);
      v31[4] = *((_OWORD *)a4 + 4);
      v31[5] = v15;
      __int128 v16 = *((_OWORD *)a4 + 7);
      v31[6] = *((_OWORD *)a4 + 6);
      v31[7] = v16;
      __int128 v17 = *((_OWORD *)a4 + 1);
      v31[0] = *(_OWORD *)a4;
      v31[1] = v17;
      __int128 v18 = *((_OWORD *)a4 + 3);
      v31[2] = *((_OWORD *)a4 + 2);
      v31[3] = v18;
      sub_100B7BB44((uint64_t)value, v31);
    }

    __int128 v19 = *((_OWORD *)a4 + 13);
    v29[12] = *((_OWORD *)a4 + 12);
    v29[13] = v19;
    uint64_t v30 = *((void *)a4 + 28);
    __int128 v20 = *((_OWORD *)a4 + 9);
    v29[8] = *((_OWORD *)a4 + 8);
    v29[9] = v20;
    __int128 v21 = *((_OWORD *)a4 + 11);
    v29[10] = *((_OWORD *)a4 + 10);
    v29[11] = v21;
    __int128 v22 = *((_OWORD *)a4 + 5);
    v29[4] = *((_OWORD *)a4 + 4);
    v29[5] = v22;
    __int128 v23 = *((_OWORD *)a4 + 7);
    v29[6] = *((_OWORD *)a4 + 6);
    v29[7] = v23;
    __int128 v24 = *((_OWORD *)a4 + 1);
    v29[0] = *(_OWORD *)a4;
    v29[1] = v24;
    __int128 v25 = *((_OWORD *)a4 + 3);
    v29[2] = *((_OWORD *)a4 + 2);
    v29[3] = v25;
    sub_10032C358((uint64_t)&self->fAnalytics, (uint64_t)v29);
  }

- (void)onWatchOrientationSettingsNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    if (qword_1019347F0 != -1) {
      dispatch_once(&qword_1019347F0, &stru_1018683C8);
    }
    id v7 = (os_log_s *)qword_1019347F8;
    if (os_log_type_enabled((os_log_t)qword_1019347F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[CLNoMovement] service: received wrist-status notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347F0 != -1) {
        dispatch_once(&qword_1019347F0, &stru_1018683C8);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347F8,  1LL,  "[CLNoMovement] service: received wrist-status notification",  v13,  2);
      uint64_t v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLNoMovementService onWatchOrientationSettingsNotification:data:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    value = self->fController.__ptr_.__value_;
    if (value)
    {
      __int128 v9 = *((_OWORD *)a4 + 1);
      v12[0] = *(_OWORD *)a4;
      v12[1] = v9;
      sub_100B7BE80((uint64_t)value, (int *)v12);
    }
  }

- (void)onDeviceMotionData:(const Sample *)a3
{
  if (self->fController.__ptr_.__value_)
  {
    __int128 v6 = *(_OWORD *)&a3[1].var1.var2;
    double var0 = a3->var0;
    uint64_t v7 = *(void *)&a3[2].var1.var0;
    double v8 = var0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    sub_100B7C084((uint64_t)self->fController.__ptr_.__value_, (uint64_t)&v6);
  }

- (void)onNoMovementControllerStateUpdate:(id)a3
{
}

- (void)onNoMovementControllerEnablement:(BOOL)a3
{
}

- (void)onNoMovementControllerEpoch:(id)a3 epochValue:(int)a4
{
}

- (NSMutableSet)clientRegistry
{
  return self->_clientRegistry;
}

- (void)setClientRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->fController.__ptr_.__value_;
  self->fController.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CLNoMovementController *, SEL))(*(void *)value + 24LL))(value, a2);
  }
  float v4 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(void *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  unint64_t v5 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  __int128 v6 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
  }
}

- (id).cxx_construct
{
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0LL;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  self->fController.__ptr_.__value_ = 0LL;
  sub_10032C334((uint64_t)&self->fAnalytics);
  return self;
}

@end