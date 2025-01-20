@interface CLPedestrianFenceService
+ (BOOL)isAvailable;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPedestrianFenceAnalyticsManager)analyticsManager;
- (CLPedestrianFenceService)init;
- (CLTimer)intervalTimer;
- (NSMutableSet)clientsInSession;
- (id).cxx_construct;
- (id)sessionForClient:(id)a3;
- (id)sessionForFence:(id)a3;
- (int)insertFence:(id)a3 inSession:(id)a4;
- (void)beginService;
- (void)clearFence:(id)a3 forClient:(id)a4;
- (void)clearFence:(id)a3 inSession:(id)a4;
- (void)dealloc;
- (void)endService;
- (void)endSessionForClient:(id)a3;
- (void)forceClearAllFences;
- (void)forceClearFence:(id)a3;
- (void)getSupportedFenceTypesWithReply:(id)a3;
- (void)odometryClient:(id)a3 requestInterval:(id)a4;
- (void)onInertialOdometryAnalyticsData:(const InertialOdometryAnalytics *)a3;
- (void)onIntervalTimerCreateEventAndIncrementPacket:(BOOL)a3;
- (void)onPedestrianFenceExitData:(const PedestrianFenceExit *)a3;
- (void)sendStatusForFences:(id)a3 setBefore:(double)a4;
- (void)sessionEndPowerLog:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setClientsInSession:(id)a3;
- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5;
- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5 wake:(BOOL)a6;
- (void)setIntervalTimer:(id)a3;
- (void)simulateFence:(id)a3 forClient:(id)a4 withExitAfterDelay:(double)a5 wake:(BOOL)a6;
- (void)startSessionForClient:(id)a3;
- (void)startSessionForClient:(id)a3 withIdentifier:(id)a4;
- (void)teardownClient:(id)a3;
- (void)toggleIntervalTimer;
- (void)toggleSession;
- (void)toggleSession:(BOOL)a3;
@end

@implementation CLPedestrianFenceService

+ (BOOL)isAvailable
{
  if ((_os_feature_enabled_impl("CoreLocation", "PedestrianFence") & 1) != 0)
  {
    sub_1004F2598();
    if ((sub_1004F96C4() & 1) != 0) {
      return 1;
    }
    sub_1004F2598();
    if ((sub_1004F9774() & 1) != 0) {
      return 1;
    }
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v5 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }

    BOOL v6 = sub_1002921D0(115, 0);
    BOOL result = 0;
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      LOWORD(v9[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Pedestrian fence not supported",  v9,  2,  v9[0]);
LABEL_22:
      v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLPedestrianFenceService isAvailable]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
      return 0;
    }
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v3 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Pedestrian fence not enabled", buf, 2u);
    }

    BOOL v4 = sub_1002921D0(115, 0);
    BOOL result = 0;
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      LOWORD(v9[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Pedestrian fence not enabled",  v9,  2,  v9[0]);
      goto LABEL_22;
    }
  }

  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F4F8 != -1) {
    dispatch_once(&qword_10199F4F8, &stru_10188C7F0);
  }
  return (id)qword_10199F4F0;
}

- (CLPedestrianFenceService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceService;
  return -[CLPedestrianFenceService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPedestrianFenceServiceProtocol,  &OBJC_PROTOCOL___CLPedestrianFenceServiceClientProtocol);
}

- (void)dealloc
{
  self->_clientsInSession = 0LL;
  self->_analyticsManager = 0LL;
  -[CLTimer invalidate](self->_intervalTimer, "invalidate");

  self->_intervalTimer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceService;
  -[CLPedestrianFenceService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  if (!self->_fenceExitDispatcher.__ptr_.__value_)
  {
    id v3 = objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
    BOOL v4 = (Dispatcher *)operator new(0x38uLL);
    sub_1003DE40C(v4, v3, (uint64_t)sub_100F1730C, (uint64_t)self, 0LL);
    value = self->_fenceExitDispatcher.__ptr_.__value_;
    self->_fenceExitDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v6 = sub_100358938(0);
    sub_1006DCB40(v6, 46, (uint64_t)self->_fenceExitDispatcher.__ptr_.__value_, -1.0);
  }

  if (!self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    id v7 = objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
    v8 = (Dispatcher *)operator new(0x38uLL);
    sub_1003DE40C(v8, v7, (uint64_t)sub_100F17318, (uint64_t)self, 0LL);
    v9 = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
    self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = v8;
    if (v9) {
      (*(void (**)(Dispatcher *))(*(void *)v9 + 8LL))(v9);
    }
    uint64_t v10 = sub_100358938(0);
    sub_1006DCB40(v10, 49, (uint64_t)self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_, -1.0);
  }

  self->_sequenceNumber = 1LL;
  -[CLPedestrianFenceService setIntervalTimer:]( self,  "setIntervalTimer:",  objc_msgSend(objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo"), "newTimer"));
  -[CLPedestrianFenceService setClientsInSession:]( self,  "setClientsInSession:",  objc_alloc_init(&OBJC_CLASS___NSMutableSet));
  -[CLPedestrianFenceService setAnalyticsManager:]( self,  "setAnalyticsManager:",  objc_alloc_init(&OBJC_CLASS___CLPedestrianFenceAnalyticsManager));
  -[CLPedestrianFenceService toggleSession:](self, "toggleSession:", 0LL);
}

- (void)endService
{
  if (self->_fenceExitDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100358938(0);
    sub_1006DD2A0(v3, 46, (uint64_t)self->_fenceExitDispatcher.__ptr_.__value_);
    value = self->_fenceExitDispatcher.__ptr_.__value_;
    self->_fenceExitDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
  }

  if (self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_100358938(0);
    sub_1006DD2A0(v5, 49, (uint64_t)self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_);
    uint64_t v6 = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
    self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8LL))(v6);
    }
  }

  -[CLPedestrianFenceService toggleSession:](self, "toggleSession:", 0LL);
}

- (void)getSupportedFenceTypesWithReply:(id)a3
{
  else {
    uint64_t v4 = 0LL;
  }
  sub_1004F2598();
  uint64_t v5 = v4 | sub_1004F9774();
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (void)startSessionForClient:(id)a3
{
}

- (void)startSessionForClient:(id)a3 withIdentifier:(id)a4
{
  if (!+[CLPedestrianFenceService isAvailable](&OBJC_CLASS___CLPedestrianFenceService, "isAvailable"))
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v11 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    LOWORD(v16) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Pedestrian fence not supported",  &v16,  2);
    uint64_t v10 = (uint8_t *)v15;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]",  "%s\n",  v15);
    if (v10 == buf) {
      return;
    }
LABEL_22:
    free(v10);
    return;
  }

  if (!-[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a3))
  {
    v12 = objc_alloc(&OBJC_CLASS___CLPedestrianFenceSession);
    -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
    v14 = -[CLPedestrianFenceSession initWithClient:identifier:atTime:atMonotonicTime:]( v12,  "initWithClient:identifier:atTime:atMonotonicTime:",  a3,  a4,  v13,  sub_101171D4C());
    -[NSMutableSet addObject:]( -[CLPedestrianFenceService clientsInSession](self, "clientsInSession"),  "addObject:",  v14);

    -[CLPedestrianFenceAnalyticsManager startSessionForClient:sequenceNumber:]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "startSessionForClient:sequenceNumber:",  a4,  self->_sequenceNumber);
    -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
    return;
  }

  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  id v7 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = [a3 description];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Session already started for client %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v8 = qword_101934788;
    int v16 = 138477827;
    id v17 = [a3 description];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  16LL,  "Session already started for client %{private}@",  &v16,  12);
    uint64_t v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]",  "%s\n",  v9);
    if (v10 != buf) {
      goto LABEL_22;
    }
  }

- (void)endSessionForClient:(id)a3
{
  if (-[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:"))
  {
    -[CLPedestrianFenceService teardownClient:](self, "teardownClient:", a3);
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v5 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v12 = [a3 description];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No session for client %{private}@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      uint64_t v6 = qword_101934788;
      int v9 = 138477827;
      id v10 = [a3 description];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  16LL,  "No session for client %{private}@",  &v9,  12);
      uint64_t v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService endSessionForClient:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5
{
}

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5 wake:(BOOL)a6
{
  BOOL v6 = a6;
  if (!+[CLPedestrianFenceService isAvailable](&OBJC_CLASS___CLPedestrianFenceService, "isAvailable"))
  {
    [a4 didFailWithError:0];
    return;
  }

  v11 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
  if (!v11)
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    id v19 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      LOWORD(v29) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Must be in session to set a fence",  &v29,  2);
      v24 = (uint8_t *)v23;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    id v20 = a4;
    uint64_t v21 = 4LL;
    goto LABEL_25;
  }

  if (a5 <= 0.0 || a5 > 1000.0)
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v22 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      double v38 = a5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid fence radius: %{public}f", buf, 0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v29 = 134349056;
      double v30 = a5;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Invalid fence radius: %{public}f",  &v29,  12);
      v26 = (uint8_t *)v25;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    id v20 = a4;
    uint64_t v21 = 1LL;
LABEL_25:
    [v20 didFailWithError:v21];
    return;
  }

  id v12 = v11;
  unsigned int v13 = -[CLPedestrianFenceService insertFence:inSession:](self, "insertFence:inSession:", a3, v11);
  if (v13 != -1)
  {
    unsigned int v14 = v13;
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v15 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      double v38 = *(double *)&a3;
      __int16 v39 = 1026;
      unsigned int v40 = v14;
      __int16 v41 = 2050;
      double v42 = a5;
      __int16 v43 = 1026;
      BOOL v44 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d,radius,%{public}f,shouldWake,%{public}d",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v29 = 138544130;
      double v30 = *(double *)&a3;
      __int16 v31 = 1026;
      unsigned int v32 = v14;
      __int16 v33 = 2050;
      double v34 = a5;
      __int16 v35 = 1026;
      BOOL v36 = v6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Setting pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d,radius,%{public}f,shouldWake,%{public}d",  &v29,  34);
      v28 = (uint8_t *)v27;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]",  "%s\n",  v27);
      if (v28 != buf) {
        free(v28);
      }
    }

    uint64_t v16 = sub_100358938(0);
    sub_10036013C(v16, v14, v6, a5);
    ++v12[6];
    id v17 = objc_alloc_init(&OBJC_CLASS___CLPedestrianFenceMetadata);
    -[CLPedestrianFenceMetadata setTimeFenceStart:](v17, "setTimeFenceStart:", sub_101171D4C());
    -[CLPedestrianFenceMetadata setFenceID:](v17, "setFenceID:", a3);
    -[CLPedestrianFenceMetadata setClientIdentifier:]( v17,  "setClientIdentifier:",  [v12 clientIdentifier]);
    *(float *)&double v18 = a5;
    -[CLPedestrianFenceMetadata setRadius:](v17, "setRadius:", v18);
    objc_msgSend(objc_msgSend(v12, "fenceMetadata"), "setObject:forKeyedSubscript:", v17, a3);
  }

- (void)simulateFence:(id)a3 forClient:(id)a4 withExitAfterDelay:(double)a5 wake:(BOOL)a6
{
  BOOL v6 = a6;
  if (+[CLPedestrianFenceService isAvailable](&OBJC_CLASS___CLPedestrianFenceService, "isAvailable"))
  {
    id v11 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
    if (v11)
    {
      if (a5 > 60.0 || a5 < 0.0)
      {
        if (qword_101934780 != -1) {
          dispatch_once(&qword_101934780, &stru_10188C838);
        }
        double v18 = (os_log_s *)qword_101934788;
        if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid delay set", buf, 2u);
        }

        if (sub_1002921D0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934780 != -1) {
            dispatch_once(&qword_101934780, &stru_10188C838);
          }
          LOWORD(v26) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Invalid delay set",  &v26,  2);
          v22 = (uint8_t *)v21;
          sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]",  "%s\n",  v21);
          if (v22 != buf) {
            free(v22);
          }
        }
      }

      else
      {
        unsigned int v12 = -[CLPedestrianFenceService insertFence:inSession:](self, "insertFence:inSession:", a3, v11);
        if (v12 != -1)
        {
          unsigned int v13 = v12;
          if (qword_101934780 != -1) {
            dispatch_once(&qword_101934780, &stru_10188C838);
          }
          unsigned int v14 = (os_log_s *)qword_101934788;
          if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
          {
            float v15 = a5;
            *(_DWORD *)buf = 138544130;
            id v35 = a3;
            __int16 v36 = 1026;
            unsigned int v37 = v13;
            __int16 v38 = 2050;
            double v39 = v15;
            __int16 v40 = 1026;
            BOOL v41 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Simulating fence exit: fenceID,%{public}@,fenceIndex,%{public}d,delay,%{public}f,shouldWake,%{public}d",  buf,  0x22u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934780 != -1) {
              dispatch_once(&qword_101934780, &stru_10188C838);
            }
            float v23 = a5;
            int v26 = 138544130;
            id v27 = a3;
            __int16 v28 = 1026;
            unsigned int v29 = v13;
            __int16 v30 = 2050;
            double v31 = v23;
            __int16 v32 = 1026;
            BOOL v33 = v6;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Simulating fence exit: fenceID,%{public}@,fenceIndex,%{public}d,delay,%{public}f,shouldWake,%{public}d",  &v26,  34);
            v25 = (uint8_t *)v24;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]",  "%s\n",  v24);
            if (v25 != buf) {
              free(v25);
            }
          }

          uint64_t v16 = sub_100358938(0);
          sub_1003601AC(v16, v13, v6, a5);
        }
      }
    }

    else
    {
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      id v17 = (os_log_s *)qword_101934788;
      if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934780 != -1) {
          dispatch_once(&qword_101934780, &stru_10188C838);
        }
        LOWORD(v26) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Must be in session to set a fence",  &v26,  2);
        id v20 = (uint8_t *)v19;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]",  "%s\n",  v19);
        if (v20 != buf) {
          free(v20);
        }
      }

      [a4 didFailWithError:4];
    }
  }

  else
  {
    [a4 didFailWithError:0];
  }

- (void)forceClearFence:(id)a3
{
  id v5 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (v5)
  {
    BOOL v6 = v5;
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    id v7 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Force clearing fence %{public}@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v13 = 138543362;
      id v14 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Force clearing fence %{public}@",  &v13,  12);
      id v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    objc_msgSend(objc_msgSend(v6, "client"), "didExitFence:", a3);
    -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", a3, v6);
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v8 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No fence %{public}@ to force clear", buf, 0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v13 = 138543362;
      id v14 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "No fence %{public}@ to force clear",  &v13,  12);
      unsigned int v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }
  }

- (void)forceClearAllFences
{
  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  uint64_t v3 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Force clearing all fences", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    v26[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Force clearing all fences",  v26,  2);
    id v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService forceClearAllFences]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  obj = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(objc_msgSend(v8, "fenceIDToIndex"), "allKeys");
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)j);
              objc_msgSend(objc_msgSend(v8, "client"), "didExitFence:", v14);
              -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", v14, v8);
            }

            id v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
          }

          while (v11);
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
    }

    while (v5);
  }

- (void)clearFence:(id)a3 forClient:(id)a4
{
  if (+[CLPedestrianFenceService isAvailable](&OBJC_CLASS___CLPedestrianFenceService, "isAvailable"))
  {
    id v7 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
    if (v7) {
      -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", a3, v7);
    }
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v8 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      v11[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Pedestrian fence not supported",  v11,  2);
      id v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService clearFence:forClient:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    [a4 didFailWithError:0];
  }

- (void)teardownClient:(id)a3
{
  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  id v5 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v24 = [a3 description];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down client %{private}@", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v13 = qword_101934788;
    int v21 = 138477827;
    id v22 = [a3 description];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  0LL,  "Tearing down client %{private}@",  &v21,  12);
    float v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService teardownClient:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  uint64_t v6 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a3);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(objc_msgSend(v6, "fenceIDToIndex"), "allKeys");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          -[CLPedestrianFenceService clearFence:inSession:]( self,  "clearFence:inSession:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  v7);
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    -[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:",  [v7 clientIdentifier],  self->_sequenceNumber,  v7[2],  sub_101171D4C());
    -[CLPedestrianFenceService sessionEndPowerLog:](self, "sessionEndPowerLog:", v7);
    -[NSMutableSet removeObject:]( -[CLPedestrianFenceService clientsInSession](self, "clientsInSession"),  "removeObject:",  v7);
    -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
  }

- (void)odometryClient:(id)a3 requestInterval:(id)a4
{
  id v7 = -[CLPedestrianFenceService analyticsManager](self, "analyticsManager");
  [a4 doubleValue];
  -[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:]( v7,  "odometryClient:requestInterval:sequenceNumber:",  a3,  self->_sequenceNumber);
  -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
  -[CLPedestrianFenceService toggleSession](self, "toggleSession");
}

- (int)insertFence:(id)a3 inSession:(id)a4
{
  id v7 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (!v7)
  {
    *(void *)&__int128 v26 = 0LL;
    *((void *)&v26 + 1) = &v26;
    uint64_t v27 = 0x3052000000LL;
    __int16 v28 = sub_100F19604;
    unsigned int v29 = sub_100F19614;
    id v30 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100F19620;
    v20[3] = &unk_10188C818;
    v20[4] = &v26;
    -[NSMutableSet enumerateObjectsUsingBlock:]( -[CLPedestrianFenceService clientsInSession](self, "clientsInSession"),  "enumerateObjectsUsingBlock:",  v20);
    uint64_t v12 = 0LL;
    do
    {
      if (!objc_msgSend( *(id *)(*((void *)&v26 + 1) + 40),  "member:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12)))
      {
        objc_msgSend( objc_msgSend(a4, "fenceIDToIndex"),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12),  a3);
        _Block_object_dispose(&v26, 8);
        return objc_msgSend( objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKeyedSubscript:", a3),  "intValue");
      }

      uint64_t v12 = (v12 + 1);
    }

    while ((_DWORD)v12 != 7);
    objc_msgSend(objc_msgSend(a4, "client"), "didFailWithError:", 2);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    uint64_t v13 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240450;
      LODWORD(v25[0]) = 7;
      WORD2(v25[0]) = 2114;
      *(void *)((char *)v25 + 6) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Too many pedestrian fence clients (max %{public}d), ignoring fence request %{public}@",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      v21[0] = 67240450;
      v21[1] = 7;
      __int16 v22 = 2114;
      id v23 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Too many pedestrian fence clients (max %{public}d), ignoring fence request %{public}@",  v21,  18);
      __int128 v19 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    _Block_object_dispose(&v26, 8);
    return -1;
  }

  id v8 = [v7 client];
  if (v8 != [a4 client])
  {
    objc_msgSend(objc_msgSend(a4, "client"), "didFailWithError:", 3);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    id v9 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25[0] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Another client has already set a fence with ID %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      LODWORD(v26) = 138543362;
      *(void *)((char *)&v26 + 4) = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "Another client has already set a fence with ID %{public}@",  &v26,  12);
      uint64_t v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    return -1;
  }

  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  float v15 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25[0] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Overwriting fence with ID %{public}@ for client",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    LODWORD(v26) = 138543362;
    *(void *)((char *)&v26 + 4) = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Overwriting fence with ID %{public}@ for client",  &v26,  12);
    __int128 v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

  return objc_msgSend( objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKeyedSubscript:", a3),  "intValue");
}

- (void)clearFence:(id)a3 inSession:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKey:", a3);
  if (v6)
  {
    unsigned int v7 = [v6 intValue];
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    id v8 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = a3;
      __int16 v21 = 1026;
      unsigned int v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Clearing pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v15 = 138543618;
      id v16 = a3;
      __int16 v17 = 1026;
      unsigned int v18 = v7;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Clearing pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d",  &v15,  18);
      uint64_t v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    uint64_t v9 = sub_100358938(0);
    sub_100360178(v9, v7);
    objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "removeObjectForKey:", a3);
    objc_msgSend(objc_msgSend(a4, "fenceMetadata"), "removeObjectForKey:", a3);
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    id v10 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "No fence with ID: %{public}@ to clear",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10188C838);
      }
      int v15 = 138543362;
      id v16 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "No fence with ID: %{public}@ to clear",  &v15,  12);
      uint64_t v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

- (void)onPedestrianFenceExitData:(const PedestrianFenceExit *)a3
{
  if (!a3->var2)
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    __int128 v19 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
    {
      _H0 = *(_WORD *)&a3[1].var2;
      __asm { FCVT            D0, H0 }

      int var1 = a3->var1;
      _H1 = *(_WORD *)&a3[1].var0;
      __asm { FCVT            D1, H1 }

      *(_DWORD *)buf = 134349568;
      v49 = _D0;
      __int16 v50 = 1026;
      *(_DWORD *)v51 = var1;
      *(_WORD *)&v51[4] = 2050;
      *(void *)&v51[6] = _D1;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[Status][AOP] Cleared fence: radius,%{public}f,fenceIndex,%{public}u,displacement,%{public}f",  buf,  0x1Cu);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    _H0 = *(_WORD *)&a3[1].var2;
    __asm { FCVT            D0, H0 }

    int v30 = a3->var1;
    _H1 = *(_WORD *)&a3[1].var0;
    __asm { FCVT            D1, H1 }

    int v44 = 134349568;
    v45 = _D0;
    __int16 v46 = 1026;
    *(_DWORD *)v47 = v30;
    *(_WORD *)&v47[4] = 2050;
    *(void *)&v47[6] = _D1;
    double v33 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "[Status][AOP] Cleared fence: radius,%{public}f,fenceIndex,%{public}u,displacement,%{public}f",  &v44,  28);
    unsigned int v18 = v34;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v33);
LABEL_32:
    if (v18 != buf) {
      free(v18);
    }
    return;
  }

  id v5 = +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a3->var1);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v39,  v43,  16LL);
  if (!v7)
  {
LABEL_16:
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    int v15 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "No client found for fence exit with fenceIndex %{public}@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    int v44 = 138543362;
    v45 = v5;
    double v16 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "No client found for fence exit with fenceIndex %{public}@",  &v44,  12);
    unsigned int v18 = v17;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v16);
    goto LABEL_32;
  }

  id v8 = v7;
  uint64_t v9 = *(void *)v40;
LABEL_4:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v40 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
    id v12 = objc_msgSend(objc_msgSend(v11, "fenceIDToIndex"), "allKeysForObject:", v5);
    if ([v12 count]) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v39,  v43,  16LL);
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  uint64_t v13 = (NSNumber *)[v12 objectAtIndexedSubscript:0];
  if (v11) {
    _ZF = v13 == 0LL;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    goto LABEL_16;
  }
  id v35 = v13;
  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  __int16 v36 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v49 = v35;
    __int16 v50 = 2114;
    *(void *)v51 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Pedestrian fence exit notified: fenceID,%{public}@,fenceIndex,%{public}@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    int v44 = 138543618;
    v45 = v35;
    __int16 v46 = 2114;
    *(void *)v47 = v5;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Pedestrian fence exit notified: fenceID,%{public}@,fenceIndex,%{public}@",  &v44,  22);
    __int16 v38 = (uint8_t *)v37;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v37);
    if (v38 != buf) {
      free(v38);
    }
  }

  objc_msgSend(objc_msgSend(v11, "client"), "didExitFence:", v35);
  objc_msgSend(objc_msgSend(v11, "fenceIDToIndex"), "removeObjectForKey:", v35);
  objc_msgSend( objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "objectForKeyedSubscript:", v35),  "setTimeFenceExit:",  sub_101171D4C());
  -[CLPedestrianFenceAnalyticsManager processSingleFenceAnalyticsData:]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "processSingleFenceAnalyticsData:",  objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "objectForKeyedSubscript:", v35));
  objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "removeObjectForKey:", v35);
}

- (void)onInertialOdometryAnalyticsData:(const InertialOdometryAnalytics *)a3
{
  p_packetStartTimes = &self->_packetStartTimes;
  id v6 = (unint64_t *)(&a3->var4 + 1);
  left = self->_packetStartTimes.__tree_.__pair1_.__value_.__left_;
  double v8 = 0.0;
  double v9 = 0.0;
  if (left)
  {
    unint64_t v10 = *v6;
    while (1)
    {
      unint64_t v11 = left[4];
      if (v10 >= v11)
      {
        if (v11 >= v10)
        {
          *(void *)buf = &a3->var4 + 1;
          double v9 = *((double *)sub_100595AA4( (uint64_t **)&self->_packetStartTimes,  v6,  (uint64_t)&unk_1012CF090,  (uint64_t **)buf)
               + 5);
          sub_1004C40E4((uint64_t)p_packetStartTimes, v6);
          break;
        }

        ++left;
      }

      left = (void *)*left;
      if (!left)
      {
        double v9 = 0.0;
        break;
      }
    }
  }

  id v12 = self->_packetStopTriggerTimes.__tree_.__pair1_.__value_.__left_;
  if (!v12) {
    goto LABEL_17;
  }
  unint64_t v13 = *v6;
  while (1)
  {
    unint64_t v14 = v12[4];
    if (v13 >= v14) {
      break;
    }
LABEL_14:
    id v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_17;
    }
  }

  if (v14 < v13)
  {
    ++v12;
    goto LABEL_14;
  }

  *(void *)buf = v6;
  double v8 = *((double *)sub_100595AA4( (uint64_t **)&self->_packetStopTriggerTimes,  v6,  (uint64_t)&unk_1012CF090,  (uint64_t **)buf)
       + 5);
  sub_1004C40E4((uint64_t)&self->_packetStopTriggerTimes, v6);
LABEL_17:
  -[CLPedestrianFenceAnalyticsManager feedInertialOdometryPacket:atTime:]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "feedInertialOdometryPacket:atTime:",  a3,  v9);
  unint64_t v15 = *(void *)(&a3->var4 + 1);
  if (v15 > self->_sequenceNumber) {
    self->_sequenceNumber = v15;
  }
  double v16 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 7LL);
  for (uint64_t i = 0LL; i != 14; i += 2LL)
  {
    LOWORD(_D0) = *(unsigned __int16 *)((char *)&a3->var19 + i + 1);
    __asm { FCVT            S0, H0 }

    -[NSMutableArray addObject:]( v16,  "addObject:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", _D0));
  }

  -[CLPedestrianFenceService sendStatusForFences:setBefore:](self, "sendStatusForFences:setBefore:", v16, v8);
  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10188C838);
  }
  id v23 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
  {
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    int var4 = a3->var4;
    *(_DWORD *)buf = 67240960;
    *(_DWORD *)&uint8_t buf[4] = var1;
    __int16 v42 = 1026;
    int v43 = var2;
    __int16 v44 = 1026;
    int v45 = var3;
    __int16 v46 = 1026;
    int v47 = var4;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[Status][AOP] fencesMaskIsSet,%{public}u,fencesMaskWasSet,%{public}u,fencesMaskWasExited,%{public}u,fencesMaskWasC leared,%{public}u",  buf,  0x1Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10188C838);
    }
    int v28 = a3->var1;
    int v29 = a3->var2;
    int v30 = a3->var3;
    int v31 = a3->var4;
    v34[0] = 67240960;
    v34[1] = v28;
    __int16 v35 = 1026;
    int v36 = v29;
    __int16 v37 = 1026;
    int v38 = v30;
    __int16 v39 = 1026;
    int v40 = v31;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "[Status][AOP] fencesMaskIsSet,%{public}u,fencesMaskWasSet,%{public}u,fencesMaskWasExited,%{public}u,fencesMaskWasC leared,%{public}u",  v34,  26);
    double v33 = (uint8_t *)v32;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPedestrianFenceService onInertialOdometryAnalyticsData:]", "%s\n", v32);
    if (v33 != buf) {
      free(v33);
    }
  }

- (void)toggleSession
{
  -[CLPedestrianFenceService toggleSession:]( self,  "toggleSession:",  -[NSMutableSet count](-[CLPedestrianFenceService clientsInSession](self, "clientsInSession"), "count") != 0LL);
}

- (void)toggleSession:(BOOL)a3
{
  if (+[CLPedestrianFenceService isAvailable](&OBJC_CLASS___CLPedestrianFenceService, "isAvailable"))
  {
    uint64_t v5 = sub_100358938(0);
    sub_1003601EC(v5, a3, self->_sequenceNumber);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    p_sequenceNumber = &self->_sequenceNumber;
    *((CFAbsoluteTime *)sub_100595AA4( (uint64_t **)&self->_packetStartTimes,  &self->_sequenceNumber,  (uint64_t)&unk_1012CF090,  (uint64_t **)&p_sequenceNumber)
    + 5) = Current;
    double v7 = sub_101171D4C();
    unint64_t v8 = self->_sequenceNumber - 1;
    p_sequenceNumber = &v8;
    *((double *)sub_100595AA4( (uint64_t **)&self->_packetStopTriggerTimes,  &v8,  (uint64_t)&unk_1012CF090,  (uint64_t **)&p_sequenceNumber)
    + 5) = v7;
    ++self->_sequenceNumber;
  }

- (id)sessionForClient:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession", 0LL);
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 client] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)sessionForFence:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession", 0LL);
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "fenceIDToIndex"), "objectForKey:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)sessionEndPowerLog:(id)a3
{
  v4[0] = @"sessionStartTime";
  v5[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *((double *)a3 + 1));
  v4[1] = @"sessionEndTime";
  -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
  v5[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[2] = @"identifier";
  v5[2] = [a3 clientIdentifier];
  v4[3] = @"numFences";
  v5[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)a3 + 6));
  sub_100E575BC( (uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  4LL),  (uint64_t)"PedestrianFencePowerMetric");
}

- (void)toggleIntervalTimer
{
  unsigned __int8 v3 = -[CLPedestrianFenceAnalyticsManager isAnySessionActive]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "isAnySessionActive");
  id v4 = -[CLPedestrianFenceService intervalTimer](self, "intervalTimer");
  if ((v3 & 1) != 0)
  {
    -[CLTimer nextFireDelay](v4, "nextFireDelay");
    if (v5 == 1.79769313e308)
    {
      -[CLPedestrianFenceService onIntervalTimerCreateEventAndIncrementPacket:]( self,  "onIntervalTimerCreateEventAndIncrementPacket:",  0LL);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100F1A8E8;
      v6[3] = &unk_10181A288;
      v6[4] = self;
      -[CLTimer setHandler:](-[CLPedestrianFenceService intervalTimer](self, "intervalTimer"), "setHandler:", v6);
      -[CLTimer setNextFireDelay:interval:]( -[CLPedestrianFenceService intervalTimer](self, "intervalTimer"),  "setNextFireDelay:interval:",  120.0,  120.0);
    }
  }

  else
  {
    -[CLTimer invalidate](v4, "invalidate");
  }

- (void)onIntervalTimerCreateEventAndIncrementPacket:(BOOL)a3
{
  BOOL v3 = a3;
  -[CLPedestrianFenceAnalyticsManager createIntervalEventStartingAt:]( -[CLPedestrianFenceService analyticsManager](self, "analyticsManager"),  "createIntervalEventStartingAt:",  self->_sequenceNumber);
  if (v3) {
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
  }
}

- (void)sendStatusForFences:(id)a3 setBefore:(double)a4
{
  if ([a3 count] == (id)7)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    obj = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
    id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v64,  16LL);
    if (v43)
    {
      uint64_t v42 = *(void *)v52;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = v6;
          uint64_t v7 = *(void **)(*((void *)&v51 + 1) + 8 * v6);
          id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
          id v46 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v9 = [v7 fenceIDToIndex];
          id v10 = [v9 countByEnumeratingWithState:&v47 objects:v63 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v48;
            do
            {
              for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
                id v15 = objc_msgSend(objc_msgSend(v7, "fenceMetadata"), "objectForKeyedSubscript:", v14);
                unsigned int v16 = objc_msgSend( objc_msgSend(objc_msgSend(v7, "fenceIDToIndex"), "objectForKeyedSubscript:", v14),  "unsignedIntValue");
                if (v15) {
                  BOOL v17 = v16 > 6;
                }
                else {
                  BOOL v17 = 1;
                }
                if (!v17)
                {
                  unsigned int v18 = v16;
                  [v15 timeFenceStart];
                  float v19 = 0.0;
                  if (v20 < a4)
                  {
                    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v18), "floatValue");
                    float v19 = v21;
                  }

                  unsigned int v22 = objc_alloc(&OBJC_CLASS___CLPedestrianFenceStatus);
                  [v15 radius];
                  int v24 = v23;
                  double v25 = sub_101171D4C();
                  [v15 timeFenceStart];
                  double v27 = v25 - v26;
                  LODWORD(v26) = v24;
                  *(float *)&double v28 = v19;
                  int v29 = -[CLPedestrianFenceStatus initWithRadius:radialDisplacement:duration:]( v22,  "initWithRadius:radialDisplacement:duration:",  v26,  v28,  v27);
                  [v8 setObject:v29 forKeyedSubscript:v14];
                  [v15 radius];
                  double v31 = v30;
                  -[CLPedestrianFenceStatus duration](v29, "duration");
                  objc_msgSend( v46,  "appendString:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@,radius,%f,displacement,%f,duration,%f,index,%@; ",
                      v14,
                      *(void *)&v31,
                      v19,
                      v32,
                      objc_msgSend(objc_msgSend(v7, "fenceIDToIndex"), "objectForKeyedSubscript:", v14)));
                }
              }

              id v11 = [v9 countByEnumeratingWithState:&v47 objects:v63 count:16];
            }

            while (v11);
          }

          objc_msgSend(objc_msgSend(v7, "client"), "sessionStatusReport:", v8);
          if ([v46 length])
          {
            if (qword_101934780 != -1) {
              dispatch_once(&qword_101934780, &stru_10188C838);
            }
            double v33 = (os_log_s *)qword_101934788;
            if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = [v7 clientIdentifier];
              *(_DWORD *)buf = 138543618;
              id v60 = v34;
              __int16 v61 = 2114;
              id v62 = v46;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[Status] Session %{public}@: %{public}@",  buf,  0x16u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934780 != -1) {
                dispatch_once(&qword_101934780, &stru_10188C838);
              }
              uint64_t v35 = qword_101934788;
              id v36 = [v7 clientIdentifier];
              int v55 = 138543618;
              id v56 = v36;
              __int16 v57 = 2114;
              id v58 = v46;
              LODWORD(v40) = 22;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v35,  0LL,  "[Status] Session %{public}@: %{public}@",  &v55,  v40);
              int v38 = (uint8_t *)v37;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPedestrianFenceService sendStatusForFences:setBefore:]",  "%s\n",  v37);
              if (v38 != buf) {
                free(v38);
              }
            }
          }

          uint64_t v6 = v44 + 1;
        }

        while ((id)(v44 + 1) != v43);
        id v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v64,  16LL);
        id v43 = v39;
      }

      while (v39);
    }
  }

- (NSMutableSet)clientsInSession
{
  return self->_clientsInSession;
}

- (void)setClientsInSession:(id)a3
{
}

- (CLPedestrianFenceAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (CLTimer)intervalTimer
{
  return self->_intervalTimer;
}

- (void)setIntervalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
  self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
  }
  id v4 = self->_fenceExitDispatcher.__ptr_.__value_;
  self->_fenceExitDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Dispatcher *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 3) = (char *)self + 32;
  *((void *)self + 8) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 6) = (char *)self + 56;
  return self;
}

@end