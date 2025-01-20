@interface CLMiLoPedestrianFenceClient
- (BOOL)fenceActive;
- (BOOL)valid;
- (CLMiLoPedestrianFenceClient)init;
- (id)initInUniverse:(id)a3 andIdentifier:(id)a4 andRadiusInMeters:(float)a5 andCallback:(id)a6 andStatusCallback:(id)a7 andErrorCallback:(id)a8;
- (id)onMotionMeasurement;
- (void)clearFence;
- (void)dealloc;
- (void)didExitFence:(id)a3;
- (void)didFailWithError:(int64_t)a3;
- (void)endSession;
- (void)sessionStatusReport:(id)a3;
- (void)setFence;
- (void)setOnMotionMeasurement:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startSession;
@end

@implementation CLMiLoPedestrianFenceClient

- (CLMiLoPedestrianFenceClient)init
{
  return 0LL;
}

- (id)initInUniverse:(id)a3 andIdentifier:(id)a4 andRadiusInMeters:(float)a5 andCallback:(id)a6 andStatusCallback:(id)a7 andErrorCallback:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLMiLoPedestrianFenceClient;
  v14 = -[CLMiLoPedestrianFenceClient init](&v17, "init");
  if (v14)
  {
    v14->_universe = (CLIntersiloUniverse *)a3;
    v14->_delegateQueue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    v14->_onMotionMeasurements = [a6 copy];
    v14->_onStatusReport = [a7 copy];
    v14->_onErrorIndication = [a8 copy];
    v15 = (CLPedestrianFenceServiceProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](v14->_universe, "vendor"),  "proxyForService:",  @"CLPedestrianFenceService");
    v14->_pedestrianFenceManager = v15;
    -[CLPedestrianFenceServiceProtocol registerDelegate:inSilo:]( v15,  "registerDelegate:inSilo:",  v14,  -[CLIntersiloUniverse silo](v14->_universe, "silo"));
    -[CLPedestrianFenceServiceProtocol setDelegateEntityName:]( v14->_pedestrianFenceManager,  "setDelegateEntityName:",  "CLMiLoPedestrianFenceClient");
    v14->_sessionActive = 0;
    v14->_fenceActive = 0;
    v14->_fenceIdStr = (NSString *)a4;
    v14->_valid = 1;
    v14->_radius = a5;
  }

  return v14;
}

- (void)dealloc
{
  -[CLPedestrianFenceServiceProtocol endSessionForClient:](self->_pedestrianFenceManager, "endSessionForClient:", self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMiLoPedestrianFenceClient;
  -[CLMiLoPedestrianFenceClient dealloc](&v3, "dealloc");
}

- (void)setFence
{
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10011C534;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  dispatch_async(delegateQueue, v4);
  if (v6 < 0) {
    operator delete(__p);
  }
}

- (void)clearFence
{
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011C91C;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)startSession
{
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CC54;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)endSession
{
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CDAC;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)didExitFence:(id)a3
{
  if ([a3 isEqualToString:self->_fenceIdStr])
  {
    self->_fenceActive = 0;
    delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011D08C;
    block[3] = &unk_10181A288;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181FC58);
    }
    char v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      id v15 = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Got fence exit notification for an unknown fence, fenceId:%{private, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181FC58);
      }
    }

    v7 = (os_log_s *)qword_1019348D8;
    if (os_signpost_enabled((os_log_t)qword_1019348D8))
    {
      id v8 = [a3 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      id v15 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Got fence exit notification for an unknown fence",  "{msg%{public}.0s:Got fence exit notification for an unknown fence, fenceId:%{private, location:escape_only}s}",  buf,  0x1Cu);
    }
  }

- (void)didFailWithError:(int64_t)a3
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181FC58);
  }
  v5 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2049;
    int64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Got Failure notification from Pedestrian Fence Manager with, Error Code:%{private}ld}",  buf,  0x1Cu);
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181FC58);
    }
  }

  char v6 = (os_log_s *)qword_1019348D8;
  if (os_signpost_enabled((os_log_t)qword_1019348D8))
  {
    *(_DWORD *)buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2049;
    int64_t v14 = a3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Got Failure notification from Pedestrian Fence Manager with",  "{msg%{public}.0s:Got Failure notification from Pedestrian Fence Manager with, Error Code:%{private}ld}",  buf,  0x1Cu);
  }

  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011D3C0;
  v8[3] = &unk_10181FA90;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(delegateQueue, v8);
}

- (void)sessionStatusReport:(id)a3
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_10181FC58);
  }
  v5 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v12 = 0;
    __int16 v13 = 2082;
    int64_t v14 = "";
    __int16 v15 = 2113;
    id v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLMiLoPedestrianFenceClient: Received status report, Status Report:%{private, locatio n:escape_only}@}",  buf,  0x1Cu);
  }

  if (self->_fenceActive)
  {
    delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011D638;
    block[3] = &unk_10181A328;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_10181FC58);
    }
    v7 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Got status report when we didn't have an active fence -- ignoring notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_10181FC58);
      }
      v9[0] = 0;
      id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  16LL,  "Got status report when we didn't have an active fence -- ignoring notification",  v9,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMiLoPedestrianFenceClient sessionStatusReport:]", "%s\n", v8);
    }
  }

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)fenceActive
{
  return self->_fenceActive;
}

- (id)onMotionMeasurement
{
  return self->_onMotionMeasurement;
}

- (void)setOnMotionMeasurement:(id)a3
{
}

@end