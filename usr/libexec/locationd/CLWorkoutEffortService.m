@interface CLWorkoutEffortService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4;
- (CLWorkoutEffortManagerCallbackAdapter)callbackAdapter;
- (CLWorkoutEffortService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)manager;
- (void)notifyClients:(const Result *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onWorkoutEffortScoreUpdate:(const Result *)a3;
- (void)registerForAlgorithmSources;
- (void)registerForUpdates:(id)a3;
- (void)setCallbackAdapter:(CLWorkoutEffortManagerCallbackAdapter *)a3;
- (void)setClients:(id)a3;
- (void)setManager:(void *)a3;
- (void)setupManager;
- (void)teardownManager;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForUpdates:(id)a3;
@end

@implementation CLWorkoutEffortService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F380 != -1) {
    dispatch_once(&qword_10199F380, &stru_10188AE10);
  }
  return (id)qword_10199F378;
}

- (CLWorkoutEffortService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLWorkoutEffortService;
  v2 = -[CLWorkoutEffortService initWithInboundProtocol:outboundProtocol:]( &v5,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWorkoutEffortServiceProtocol,  &OBJC_PROTOCOL___CLWorkoutEffortServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    -[CLWorkoutEffortService setClients:](v2, "setClients:", 0LL);
    -[CLWorkoutEffortService setCallbackAdapter:](v3, "setCallbackAdapter:", 0LL);
  }

  return v3;
}

+ (BOOL)isSupported
{
  if (qword_10199F390 != -1) {
    dispatch_once(&qword_10199F390, &stru_10188AE30);
  }
  return byte_10199F388;
}

- (void)beginService
{
  v3 = operator new(0x18uLL);
  void *v3 = &off_10188AE60;
  v3[1] = self;
  v3[2] = sub_100ED9168;
  -[CLWorkoutEffortService setCallbackAdapter:](self, "setCallbackAdapter:", v3);
  -[CLWorkoutEffortService setupManager](self, "setupManager");
}

- (void)setupManager
{
  if (!-[CLWorkoutEffortService manager](self, "manager"))
  {
    v3 = operator new(0x918uLL);
    sub_101060FF0( v3,  -[CLWorkoutEffortService silo](self, "silo"),  -[CLWorkoutEffortService callbackAdapter](self, "callbackAdapter"));
    -[CLWorkoutEffortService setManager:](self, "setManager:", v3);
  }

  if (qword_1019347E0 != -1) {
    dispatch_once(&qword_1019347E0, &stru_10188AEA0);
  }
  v4 = (os_log_s *)qword_1019347E8;
  if (os_log_type_enabled((os_log_t)qword_1019347E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up up manager", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347E0 != -1) {
      dispatch_once(&qword_1019347E0, &stru_10188AEA0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347E8,  0LL,  "Setting up up manager",  v7,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutEffortService setupManager]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  -[CLWorkoutEffortService registerForAlgorithmSources](self, "registerForAlgorithmSources");
}

- (void)teardownManager
{
  if (-[CLWorkoutEffortService manager](self, "manager"))
  {
    if (qword_1019347E0 != -1) {
      dispatch_once(&qword_1019347E0, &stru_10188AEA0);
    }
    v3 = (os_log_s *)qword_1019347E8;
    if (os_log_type_enabled((os_log_t)qword_1019347E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347E0 != -1) {
        dispatch_once(&qword_1019347E0, &stru_10188AEA0);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347E8,  0LL,  "Tearing down manager",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutEffortService teardownManager]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    -[CLWorkoutEffortService unregisterForAlgorithmSources](self, "unregisterForAlgorithmSources");
    v4 = -[CLWorkoutEffortService manager](self, "manager");
    if (v4)
    {
      objc_super v5 = (void *)sub_100EDA194((uint64_t)v4);
      operator delete(v5);
    }

    -[CLWorkoutEffortService setManager:](self, "setManager:", 0LL);
  }

- (void)endService
{
  v3 = -[CLWorkoutEffortService callbackAdapter](self, "callbackAdapter");
  if (v3) {
    (*((void (**)(CLWorkoutEffortManagerCallbackAdapter *))v3->var0 + 1))(v3);
  }
  -[CLWorkoutEffortService setCallbackAdapter:](self, "setCallbackAdapter:", 0LL);
}

- (void)registerForAlgorithmSources
{
  v3 = v10;
  v10 = 0LL;
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    objc_super v5 = v10;
    v10 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  v6 = (CLMotionStateMediatorProtocol *) objc_msgSend( objc_msgSend(-[CLWorkoutEffortService universe](self, "universe"), "vendor"),  "proxyForService:forClient:",  @"CLMotionStateMediator",  @"CLWorkoutEffortService");
  self->fMotionStateMediatorProxy = v6;
  -[CLMotionStateMediatorProtocol addClient:prepareSessionEndForSessionType:]( v6,  "addClient:prepareSessionEndForSessionType:",  CLISP_ME_TOKEN,  66LL);
  sub_100E18F18((uint64_t)sub_100ED9884, (uint64_t)self, self, &v10);
  v7 = v10;
  v10 = 0LL;
  v8 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = v7;
  if (v8)
  {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    v9 = v10;
    v10 = 0LL;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
    }
  }

  [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) register:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) register:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:11 registrationInfo:0];
  [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) register:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:10 registrationInfo:0];
}

- (void)unregisterForAlgorithmSources
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

  fMotionStateMediatorProxy = self->fMotionStateMediatorProxy;
  if (fMotionStateMediatorProxy)
  {
    -[CLMotionStateMediatorProtocol removeClient:prepareSessionEndForSessionType:]( fMotionStateMediatorProxy,  "removeClient:prepareSessionEndForSessionType:",  CLISP_ME_TOKEN,  66LL);

    self->fMotionStateMediatorProxy = 0LL;
  }

  v6 = self->fNatalimetryClient.__ptr_.__value_;
  if (v6)
  {
    [*((id *)v6 + 2) unregister:*((void *)v6 + 1) forNotification:2];
    [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) unregister:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:11];
    [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) unregister:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:10];
    v7 = self->fNatalimetryClient.__ptr_.__value_;
    self->fNatalimetryClient.__ptr_.__value_ = 0LL;
    if (v7) {
      (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    }
  }

- (void)registerForUpdates:(id)a3
{
}

- (void)unregisterForUpdates:(id)a3
{
}

- (void)notifyClients:(const Result *)a3
{
  __int128 v3 = *((_OWORD *)a3 + 1);
  __int128 v14 = *(_OWORD *)a3;
  __int128 v15 = v3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = -[CLWorkoutEffortService clients](self, "clients", 0LL);
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v19,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        __int128 v17 = v14;
        __int128 v18 = v15;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100EDA2D8;
        v16[3] = &unk_10188AEE0;
        objc_msgSend(v9, "onWorkoutEffortScoreUpdate:", objc_msgSend(v16, "copy"));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v19,  16LL);
    }

    while (v6);
  }

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  int v5 = a3;
  if (-[CLWorkoutEffortService manager](self, "manager")) {
    return sub_1010634BC((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), v5, a4);
  }
  else {
    return 1;
  }
}

- (void)onWorkoutEffortScoreUpdate:(const Result *)a3
{
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (-[CLWorkoutEffortService manager](self, "manager")) {
      sub_101062B24((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (__int128 *)a4);
    }
  }

  else
  {
    if (qword_101934770 != -1) {
      dispatch_once(&qword_101934770, &stru_10188AEC0);
    }
    __int128 v10 = (os_log_s *)qword_101934778;
    if (os_log_type_enabled((os_log_t)qword_101934778, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CLWorkoutEffortService, unhandled CLMotionStateMediator notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934770 != -1) {
        dispatch_once(&qword_101934770, &stru_10188AEC0);
      }
      int v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934778,  16LL,  "CLWorkoutEffortService, unhandled CLMotionStateMediator notification type, %d",  v15);
      __int128 v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWorkoutEffortService onMotionStateMediatorNotification:data:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v7 = *a3;
  if (*a3 == 11)
  {
    if (-[CLWorkoutEffortService manager](self, "manager")) {
      sub_101062954((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (double *)a4);
    }
  }

  else if (v7 == 10)
  {
    if (-[CLWorkoutEffortService manager](self, "manager"))
    {
      int v8 = *(_BYTE *)a4;
      v9 = -[CLWorkoutEffortService manager](self, "manager");
      if (v8) {
        sub_101060FF4((uint64_t)v9);
      }
      else {
        sub_101061000((uint64_t)v9);
      }
    }
  }

  else if (v7 == 2)
  {
    if (-[CLWorkoutEffortService manager](self, "manager")) {
      sub_101062984((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (uint64_t)a4);
    }
  }

  else
  {
    if (qword_1019347E0 != -1) {
      dispatch_once(&qword_1019347E0, &stru_10188AEA0);
    }
    __int128 v10 = (os_log_s *)qword_1019347E8;
    if (os_log_type_enabled((os_log_t)qword_1019347E8, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CLWorkoutEffortService, unhandled CLNatalimetryNotifier notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347E0 != -1) {
        dispatch_once(&qword_1019347E0, &stru_10188AEA0);
      }
      int v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347E8,  16LL,  "CLWorkoutEffortService, unhandled CLNatalimetryNotifier notification type, %d",  v15);
      __int128 v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutEffortService onNatalimetryNotification:data:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

- (CLWorkoutEffortManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLWorkoutEffortManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void).cxx_destruct
{
  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end