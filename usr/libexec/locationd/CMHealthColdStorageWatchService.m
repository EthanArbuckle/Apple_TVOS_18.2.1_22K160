@interface CMHealthColdStorageWatchService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CMHealthColdStorageWatchService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)continueSync:(id)a3;
- (void)endService;
- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)resetAnalytics;
- (void)saveCurrentSyncProgress;
- (void)sendAnalytics;
- (void)sendCompanionData:(id)a3 activity:(id)a4;
- (void)setActivityAsDone:(id)a3;
- (void)setUpAggregationOnTimer;
- (void)setupSyncActivity;
@end

@implementation CMHealthColdStorageWatchService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995548 != -1) {
    dispatch_once(&qword_101995548, &stru_101834D78);
  }
  return (id)qword_101995540;
}

- (CMHealthColdStorageWatchService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMHealthColdStorageWatchService;
  return -[CMHealthColdStorageWatchService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CMHealthColdStorageWatchServiceProtocol,  &OBJC_PROTOCOL___CMHealthColdStorageWatchServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_101995558 != -1) {
    dispatch_once(&qword_101995558, &stru_101834D98);
  }
  return byte_101995550;
}

- (void)beginService
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101834E58);
  }
  objc_super v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting up CMHealthColdStorageWatchService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    v46[0] = 0;
    LODWORD(v45) = 2;
    v44 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Starting up CMHealthColdStorageWatchService",  v46,  v45);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService beginService]", "%s\n", v44);
  }

  self->fCurrentTableIndex = 0;
  self->fIterationCount = 0;
  -[CMHealthColdStorageWatchService setupSyncActivity](self, "setupSyncActivity");
  self->fCompanionConnected = 0;
  sub_1003A09BC((uint64_t)sub_1003917BC, (uint64_t)self, self, buf);
  v4 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    uint64_t v6 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
  HIBYTE(v45) = 0;
  sub_1002777C8((unsigned __int8 *)&v45 + 7, buf);
  sub_10005F550((uint64_t)&self->fInputHRDb, (__int128 *)buf);
  v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  HIBYTE(v45) = 0;
  sub_1002778B8((unsigned __int8 *)&v45 + 7, buf);
  sub_10005F550((uint64_t)&self->fInputWRDb, (__int128 *)buf);
  v10 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v11 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  HIBYTE(v45) = 0;
  sub_1002779A8((unsigned __int8 *)&v45 + 7, buf);
  sub_10005F550((uint64_t)&self->fSessionDb, (__int128 *)buf);
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v14 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  sub_1003917CC(&self->fInputHRDb.__ptr_, &self->fInputWRDb.__ptr_, &self->fSessionDb.__ptr_, buf);
  v16 = *(CLHRRecoveryCompanionSyncManager **)buf;
  *(void *)buf = 0LL;
  v17 = self->fHRRSyncManager.__ptr_.__value_;
  self->fHRRSyncManager.__ptr_.__value_ = v16;
  if (v17)
  {
    sub_10039497C((uint64_t)&self->fHRRSyncManager, (uint64_t)v17);
    uint64_t v18 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v18) {
      sub_10039497C((uint64_t)buf, v18);
    }
  }

  HIBYTE(v45) = 0;
  sub_1001B4CA0((unsigned __int8 *)&v45 + 7, buf);
  p_fBoutRecorderDb = &self->fBoutRecorderDb;
  sub_10005F550((uint64_t)&self->fBoutRecorderDb, (__int128 *)buf);
  v20 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v21 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  v23 = operator new(0x18uLL);
  uint64_t v24 = (uint64_t)v23;
  cntrl = self->fBoutRecorderDb.__cntrl_;
  if (p_fBoutRecorderDb->__ptr_) {
    uint64_t v26 = (uint64_t)p_fBoutRecorderDb->__ptr_ + 424;
  }
  else {
    uint64_t v26 = 0LL;
  }
  *(void *)buf = v26;
  *(void *)&buf[8] = cntrl;
  if (cntrl)
  {
    v27 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }

  sub_1007FAF70(v23, buf);
  v29 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v30 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  sub_1003949B8((uint64_t *)&self->fPredWalkDistanceSyncManager, v24);
  v32 = operator new(0x170uLL);
  v32[21] = 0u;
  v32[22] = 0u;
  v32[19] = 0u;
  v32[20] = 0u;
  v32[17] = 0u;
  v32[18] = 0u;
  v32[15] = 0u;
  v32[16] = 0u;
  v32[13] = 0u;
  v32[14] = 0u;
  v32[11] = 0u;
  v32[12] = 0u;
  v32[9] = 0u;
  v32[10] = 0u;
  v32[7] = 0u;
  v32[8] = 0u;
  v32[5] = 0u;
  v32[6] = 0u;
  v32[3] = 0u;
  v32[4] = 0u;
  v32[1] = 0u;
  v32[2] = 0u;
  _OWORD *v32 = 0u;
  sub_100AFE484(v32, 0LL);
  sub_1003949E4((uint64_t *)&self->fElevationGradeSyncManager, (uint64_t)v32);
  HIBYTE(v45) = 0;
  sub_100394A10((unsigned __int8 *)&v45 + 7, buf);
  sub_10005F550((uint64_t)&self->fElevationGradeRecorderDb, (__int128 *)buf);
  v33 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v34 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  v36 = operator new(0x30uLL);
  uint64_t v37 = (uint64_t)v36;
  v38 = self->fElevationGradeRecorderDb.__cntrl_;
  *(void *)buf = self->fElevationGradeRecorderDb.__ptr_;
  *(void *)&buf[8] = v38;
  if (v38)
  {
    v39 = (unint64_t *)((char *)v38 + 8);
    do
      unint64_t v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }

  sub_1001B4E14((uint64_t)v36, (uint64_t *)buf);
  v41 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v42 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fElevationGradeAggregator, v37);
  -[CMHealthColdStorageWatchService setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
}

- (void)endService
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101834E58);
  }
  objc_super v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Shutting down CMHealthColdStorageWatchService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    v8[0] = 0;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Shutting down CMHealthColdStorageWatchService",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService endService]", "%s\n", v7);
  }

  value = self->fCompanionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    unint64_t v5 = self->fCompanionClient.__ptr_.__value_;
    self->fCompanionClient.__ptr_.__value_ = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0LL;
  }

- (void)setUpAggregationOnTimer
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CMHealthColdStorageWatchService universe](self, "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0LL, 0x4E94914F0000uLL, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100391EF0;
  handler[3] = &unk_10181A288;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, handler);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 5)
  {
    self->fCompanionConnected = *(_BYTE *)a4;
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      int v8 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[WatchService] Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      int v9 = *a3;
      v11[0] = 67109120;
      v11[1] = v9;
      v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[WatchService] Unhandled notification type, %d",  v11);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageWatchService onCompanionNotification:data:]",  "%s\n",  v10);
    }
  }

- (void)sendCompanionData:(id)a3 activity:(id)a4
{
  v7 = objc_autoreleasePoolPush();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003928C0;
  v8[3] = &unk_101834E10;
  v8[4] = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", a3),  1LL,  0LL);
  v8[5] = self;
  v8[6] = a4;
  objc_msgSend( objc_msgSend( objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLCompanionNotifier"),  "doAsync:",  v8);
  [a3 removeAllObjects];
  objc_autoreleasePoolPop(v7);
}

- (void)continueSync:(id)a3
{
  if (!-[CMHealthColdStorageWatchService checkDeferral:](self, "checkDeferral:"))
  {
    id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    self->fLastBatchSize = 0;
    uint64_t fCurrentTableIndex = self->fCurrentTableIndex;
    if (fCurrentTableIndex <= 4)
    {
      id v7 = v5;
      switch(dword_1012E7610[fCurrentTableIndex])
      {
        case 1:
          unint64_t v8 = sub_100C70C08((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 2:
          unint64_t v8 = sub_100C7078C((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 3:
          unint64_t v8 = sub_100C70344(self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 4:
          unint64_t v8 = sub_1007FAF94(self->fPredWalkDistanceSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 5:
          unint64_t v8 = sub_1006BB2B8((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_, v5, 0x30D40u);
LABEL_9:
          int v9 = v8;
          if (v8)
          {
            if (qword_1019347B0 != -1) {
              dispatch_once(&qword_1019347B0, &stru_101834E58);
            }
            v10 = (os_log_s *)qword_1019347B8;
            if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
            {
              int fIterationCount = self->fIterationCount;
              self->int fIterationCount = fIterationCount + 1;
              *(_DWORD *)buf = 67240192;
              int v25 = fIterationCount;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[WatchService] Sending companion data iteration:(%{public}d)",  buf,  8u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019347B0 != -1) {
                dispatch_once(&qword_1019347B0, &stru_101834E58);
              }
              uint64_t v16 = qword_1019347B8;
              int v17 = self->fIterationCount;
              self->int fIterationCount = v17 + 1;
              int v22 = 67240192;
              int v23 = v17;
              uint64_t v18 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v16,  1LL,  "[WatchService] Sending companion data iteration:(%{public}d)",  &v22,  8);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v18);
            }

            self->fLastBatchSize = v9;
            -[CMHealthColdStorageWatchService sendCompanionData:activity:](self, "sendCompanionData:activity:", v7, a3);
          }

          else
          {
            LODWORD(fCurrentTableIndex) = self->fCurrentTableIndex;
LABEL_17:
            self->uint64_t fCurrentTableIndex = fCurrentTableIndex + 1;
            if (qword_1019347B0 != -1) {
              dispatch_once(&qword_1019347B0, &stru_101834E58);
            }
            unint64_t v12 = (os_log_s *)qword_1019347B8;
            if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
            {
              int v13 = self->fCurrentTableIndex;
              *(_DWORD *)buf = 67109120;
              int v25 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[WatchService] Advancing to next table: %d",  buf,  8u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019347B0 != -1) {
                dispatch_once(&qword_1019347B0, &stru_101834E58);
              }
              int v19 = self->fCurrentTableIndex;
              int v22 = 67109120;
              int v23 = v19;
              v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[WatchService] Advancing to next table: %d",  &v22);
              sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v20);
            }

            if (self->fCurrentTableIndex > 4u)
            {
              if (qword_1019347B0 != -1) {
                dispatch_once(&qword_1019347B0, &stru_101834E58);
              }
              unint64_t v15 = (os_log_s *)qword_1019347B8;
              if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[WatchService] Data transfer completed",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019347B0 != -1) {
                  dispatch_once(&qword_1019347B0, &stru_101834E58);
                }
                LOWORD(v22) = 0;
                v21 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[WatchService] Data transfer completed",  &v22,  2);
                sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v21);
              }

              -[CMHealthColdStorageWatchService setActivityAsDone:](self, "setActivityAsDone:", a3);
            }

            else
            {
              v14 = objc_autoreleasePoolPush();
              -[CMHealthColdStorageWatchService continueSync:](self, "continueSync:", a3);
              objc_autoreleasePoolPop(v14);
            }
          }

          break;
        default:
          goto LABEL_17;
      }
    }
  }

- (void)saveCurrentSyncProgress
{
  uint64_t fCurrentTableIndex = self->fCurrentTableIndex;
  if (fCurrentTableIndex <= 4)
  {
    switch(dword_1012E7610[fCurrentTableIndex])
    {
      case 1:
        sub_100C71448((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRSH;
        goto LABEL_8;
      case 2:
        sub_100C71268((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIWH;
        goto LABEL_8;
      case 3:
        sub_100C71088((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIHH;
        goto LABEL_8;
      case 4:
        sub_1007FB41C((uint64_t)self->fPredWalkDistanceSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_PWDBH;
        goto LABEL_8;
      case 5:
        sub_1006BB6E4((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_EGH;
LABEL_8:
        *p_numRecordsSync_HRRSH += *p_fLastBatchSize;
        break;
      default:
        return;
    }
  }

- (void)setupSyncActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_10120AA44(v5, "CMHealthColdStorageCompanionSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_8_HOURS, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100393440;
  handler[3] = &unk_101834E38;
  handler[4] = self;
  void handler[5] = objc_msgSend( objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageWatchService");
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageWatchSync", v3, handler);
  xpc_release(v3);
}

- (void)onSyncActivity:(id)a3
{
  if (a3)
  {
    xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
    if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
    {
      if (self->fCompanionConnected)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100393C28;
        v13[3] = &unk_10181A328;
        v13[4] = self;
        v13[5] = a3;
        objc_msgSend(objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo"), "async:", v13);
      }

      else
      {
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101834E58);
        }
        v11 = (os_log_s *)qword_1019347B8;
        if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WatchService] Cannot send data, companion not nearby",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019347B0 != -1) {
            dispatch_once(&qword_1019347B0, &stru_101834E58);
          }
          LOWORD(v14) = 0;
          unint64_t v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[WatchService] Cannot send data, companion not nearby",  &v14,  2);
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v12);
        }

        -[CMHealthColdStorageWatchService setActivityAsDone:](self, "setActivityAsDone:", a3);
      }

      return;
    }

    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    int v9 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v20 = 2048;
      xpc_activity_state_t v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[WatchService] Unexpected activity (%s) state: %ld",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      int v14 = 136315394;
      unint64_t v15 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v16 = 2048;
      xpc_activity_state_t v17 = v6;
      unint64_t v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[WatchService] Unexpected activity (%s) state: %ld",  &v14,  22);
LABEL_22:
      v10 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v8);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    id v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[WatchService] Invalid xpc activity (%s).",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      int v14 = 136315138;
      unint64_t v15 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      unint64_t v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[WatchService] Invalid xpc activity (%s).",  &v14);
      goto LABEL_22;
    }
  }

- (BOOL)checkDeferral:(id)a3
{
  if (!a3)
  {
    LOBYTE(should_defer) = 0;
    return should_defer;
  }

  BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
  if (!should_defer) {
    return should_defer;
  }
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101834E58);
  }
  xpc_activity_state_t v6 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v20 = "com.apple.locationd.Motion.ColdStorageWatchSync";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[WatchService] Cancelling (%{public}s) early due to deferral.",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    int v17 = 136446210;
    uint64_t v18 = "com.apple.locationd.Motion.ColdStorageWatchSync";
    unint64_t v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[WatchService] Cancelling (%{public}s) early due to deferral.",  &v17,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v12);
  }

  if (xpc_activity_set_state((xpc_activity_t)a3, 3LL))
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    id v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[WatchService] Activity deferred", buf, 2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_24;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    LOWORD(v17) = 0;
    LODWORD(v16) = 2;
    unint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[WatchService] Activity deferred",  &v17,  v16);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v8);
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    int v9 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      __int16 v20 = (const char *)state;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "[WatchService] Failed to defer activity. Current state is %{public}ld",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_24;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    uint64_t v13 = qword_1019347B8;
    xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
    int v17 = 134349056;
    uint64_t v18 = (const char *)v14;
    LODWORD(v16) = 12;
    unint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  17LL,  "[WatchService] Failed to defer activity. Current state is %{public}ld",  &v17,  v16);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v8);
  }

  free(v8);
LABEL_24:
  -[CMHealthColdStorageWatchService sendAnalytics](self, "sendAnalytics");
  self->uint64_t fCurrentTableIndex = 0;
  self->int fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0LL;
  }

  LOBYTE(should_defer) = 1;
  return should_defer;
}

- (void)setActivityAsDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    id v5 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      xpc_activity_state_t v14 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v15 = 2050;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "[WatchService] failed to mark %{public}s activity as Done. Current state is %{public}ld",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      uint64_t v7 = qword_1019347B8;
      int v9 = 136446466;
      v10 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v11 = 2050;
      xpc_activity_state_t v12 = xpc_activity_get_state((xpc_activity_t)a3);
      unint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  17LL,  "[WatchService] failed to mark %{public}s activity as Done. Current state is %{public}ld",  &v9,  22);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageWatchService setActivityAsDone:]", "%s\n", v8);
    }
  }

  self->uint64_t fCurrentTableIndex = 0;
  self->int fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0LL;
  }

- (void)sendAnalytics
{
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection)
    && (objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v11[0] = @"NumErrors";
    v12[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->fStats.numErrors);
    v11[1] = @"NumRecordsSync_EGH";
    v12[1] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_EGH);
    v11[2] = @"NumRecordsSync_HRRIHH";
    v12[2] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRIHH);
    v11[3] = @"NumRecordsSync_HRRIWH";
    v12[3] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRIWH);
    _DWORD v11[4] = @"NumRecordsSync_HRRSH";
    v12[4] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRSH);
    v11[5] = @"NumRecordsSync_PWDBH";
    v12[5] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_PWDBH);
    xpc_object_t v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  6LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100394748;
    v8[3] = &unk_101820740;
    v8[4] = v3;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.ColdStorageWatchSync", v8);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    v4 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      xpc_activity_state_t v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[WatchService] sent Core Analytics event: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      int v9 = 138412290;
      v10 = v3;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[WatchService] sent Core Analytics event: %@",  &v9,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v7);
    }

    -[CMHealthColdStorageWatchService resetAnalytics](self, "resetAnalytics");
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101834E58);
    }
    id v5 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[WatchService] not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101834E58);
      }
      LOWORD(v9) = 0;
      xpc_activity_state_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[WatchService] not sending analytics, no IHA permission",  &v9,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v6);
    }
  }

- (void)resetAnalytics
{
  *(void *)&self->fStats.numRecordsSync_HRRIHH = 0LL;
  *(void *)&self->fStats.numRecordsSync_HRRSH = 0LL;
  *(void *)&self->fStats.numErrors = 0LL;
}

- (void).cxx_destruct
{
  int64_t value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  sub_1003949E4((uint64_t *)&self->fElevationGradeSyncManager, 0LL);
  sub_1003949B8((uint64_t *)&self->fPredWalkDistanceSyncManager, 0LL);
  v4 = self->fHRRSyncManager.__ptr_.__value_;
  self->fHRRSyncManager.__ptr_.__value_ = 0LL;
  if (v4) {
    sub_10039497C((uint64_t)&self->fHRRSyncManager, (uint64_t)v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *((void *)self + 22) = 0LL;
  *((void *)self + 23) = 0LL;
  *((void *)self + 21) = 0LL;
  return self;
}

@end