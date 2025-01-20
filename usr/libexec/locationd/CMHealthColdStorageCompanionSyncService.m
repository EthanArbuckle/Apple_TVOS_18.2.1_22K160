@interface CMHealthColdStorageCompanionSyncService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CMHealthColdStorageCompanionSyncService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)receiveColdStorageDataUpdate:(id)a3;
- (void)resetAnalytics;
- (void)resetCoreAnalyticsTimer;
- (void)sendAnalytics;
- (void)setUpAggregationOnTimer;
@end

@implementation CMHealthColdStorageCompanionSyncService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DDE8 != -1) {
    dispatch_once(&qword_10199DDE8, &stru_101880818);
  }
  return (id)qword_10199DDE0;
}

- (CMHealthColdStorageCompanionSyncService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMHealthColdStorageCompanionSyncService;
  return -[CMHealthColdStorageCompanionSyncService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceProtocol,  &OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10199DDF8 != -1) {
    dispatch_once(&qword_10199DDF8, &stru_101880838);
  }
  return byte_10199DDF0;
}

- (void)beginService
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101880858);
  }
  objc_super v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting up CMHealthColdStorageCompanionSyncService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    LOWORD(v88) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Starting up CMHealthColdStorageCompanionSyncService",  &v88,  2);
    v85 = (uint8_t *)v84;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCompanionSyncService beginService]", "%s\n", v84);
    if (v85 != buf) {
      free(v85);
    }
  }

  LOBYTE(v91) = 0;
  sub_1002777C8((unsigned __int8 *)&v91, buf);
  p_fInputHRDb = &self->fInputHRDb;
  sub_10005F550((uint64_t)&self->fInputHRDb, (__int128 *)buf);
  unint64_t v5 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v6 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  v8 = operator new(0x30uLL);
  uint64_t v9 = (uint64_t)v8;
  cntrl = self->fInputHRDb.__cntrl_;
  *(void *)buf = p_fInputHRDb->__ptr_;
  *(void *)&buf[8] = cntrl;
  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  sub_1001B4E14((uint64_t)v8, (uint64_t *)buf);
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

  sub_1001B4F90((uint64_t *)&self->fInputHRAggregator, v9);
  LOBYTE(v91) = 0;
  sub_1002778B8((unsigned __int8 *)&v91, buf);
  p_fInputWRDb = &self->fInputWRDb;
  sub_10005F550((uint64_t)&self->fInputWRDb, (__int128 *)buf);
  v17 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v18 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  v20 = operator new(0x30uLL);
  uint64_t v21 = (uint64_t)v20;
  v22 = self->fInputWRDb.__cntrl_;
  *(void *)buf = p_fInputWRDb->__ptr_;
  *(void *)&buf[8] = v22;
  if (v22)
  {
    v23 = (unint64_t *)((char *)v22 + 8);
    do
      unint64_t v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }

  sub_1001B4E14((uint64_t)v20, (uint64_t *)buf);
  v25 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v26 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fInputWRAggregator, v21);
  LOBYTE(v91) = 0;
  sub_1002779A8((unsigned __int8 *)&v91, buf);
  p_fSessionDb = &self->fSessionDb;
  sub_10005F550((uint64_t)&self->fSessionDb, (__int128 *)buf);
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

  v32 = operator new(0x30uLL);
  uint64_t v33 = (uint64_t)v32;
  v34 = self->fSessionDb.__cntrl_;
  *(void *)buf = p_fSessionDb->__ptr_;
  *(void *)&buf[8] = v34;
  if (v34)
  {
    v35 = (unint64_t *)((char *)v34 + 8);
    do
      unint64_t v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
  }

  sub_1001B4E14((uint64_t)v32, (uint64_t *)buf);
  v37 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v38 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fSessionAggregator, v33);
  LOBYTE(v91) = 0;
  sub_1001B4CA0((unsigned __int8 *)&v91, buf);
  sub_10005F550((uint64_t)&self->fPredWalkDistanceBoutDb, (__int128 *)buf);
  v40 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v41 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }

  LOBYTE(v91) = 0;
  sub_100394A10((unsigned __int8 *)&v91, buf);
  p_fElevationGradeRecorderDb = &self->fElevationGradeRecorderDb;
  sub_10005F550((uint64_t)&self->fElevationGradeRecorderDb, (__int128 *)buf);
  v44 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v45 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }

  v47 = operator new(0x30uLL);
  uint64_t v48 = (uint64_t)v47;
  v49 = self->fElevationGradeRecorderDb.__cntrl_;
  *(void *)buf = p_fElevationGradeRecorderDb->__ptr_;
  *(void *)&buf[8] = v49;
  if (v49)
  {
    v50 = (unint64_t *)((char *)v49 + 8);
    do
      unint64_t v51 = __ldxr(v50);
    while (__stxr(v51 + 1, v50));
  }

  sub_1001B4E14((uint64_t)v47, (uint64_t *)buf);
  v52 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v53 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }

  sub_1001B4F90((uint64_t *)&self->fElevationGradeAggregator, v48);
  -[CMHealthColdStorageCompanionSyncService setUpAggregationOnTimer](self, "setUpAggregationOnTimer");
  id v55 = objc_msgSend( objc_msgSend(-[CMHealthColdStorageCompanionSyncService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
  if (v55)
  {
    v56 = self->fInputHRDb.__cntrl_;
    if (p_fInputHRDb->__ptr_) {
      uint64_t v57 = (uint64_t)p_fInputHRDb->__ptr_ + 72;
    }
    else {
      uint64_t v57 = 0LL;
    }
    *(void *)buf = v57;
    *(void *)&buf[8] = v56;
    if (v56)
    {
      v58 = (unint64_t *)((char *)v56 + 8);
      do
        unint64_t v59 = __ldxr(v58);
      while (__stxr(v59 + 1, v58));
    }

    v60 = self->fInputWRDb.__cntrl_;
    if (p_fInputWRDb->__ptr_) {
      uint64_t v61 = (uint64_t)p_fInputWRDb->__ptr_ + 72;
    }
    else {
      uint64_t v61 = 0LL;
    }
    uint64_t v94 = v61;
    v95 = v60;
    if (v60)
    {
      v62 = (unint64_t *)((char *)v60 + 8);
      do
        unint64_t v63 = __ldxr(v62);
      while (__stxr(v63 + 1, v62));
    }

    v64 = self->fSessionDb.__cntrl_;
    if (p_fSessionDb->__ptr_) {
      uint64_t v65 = (uint64_t)p_fSessionDb->__ptr_ + 72;
    }
    else {
      uint64_t v65 = 0LL;
    }
    uint64_t v96 = v65;
    v97 = v64;
    if (v64)
    {
      v66 = (unint64_t *)((char *)v64 + 8);
      do
        unint64_t v67 = __ldxr(v66);
      while (__stxr(v67 + 1, v66));
    }

    v68 = self->fElevationGradeRecorderDb.__cntrl_;
    if (p_fElevationGradeRecorderDb->__ptr_) {
      uint64_t v69 = (uint64_t)p_fElevationGradeRecorderDb->__ptr_ + 72;
    }
    else {
      uint64_t v69 = 0LL;
    }
    uint64_t v98 = v69;
    v99 = v68;
    if (v68)
    {
      v70 = (unint64_t *)((char *)v68 + 8);
      do
        unint64_t v71 = __ldxr(v70);
      while (__stxr(v71 + 1, v70));
    }

    v88 = 0LL;
    v89 = 0LL;
    v90 = 0LL;
    v91 = &v88;
    char v92 = 0;
    v72 = operator new(0x40uLL);
    uint64_t v73 = 0LL;
    v88 = v72;
    v89 = v72;
    v90 = v72 + 4;
    do
    {
      __int128 v74 = *(_OWORD *)&buf[16 * v73];
      _OWORD *v72 = v74;
      if (*((void *)&v74 + 1))
      {
        v75 = (unint64_t *)(*((void *)&v74 + 1) + 8LL);
        do
          unint64_t v76 = __ldxr(v75);
        while (__stxr(v76 + 1, v75));
      }

      ++v73;
      ++v72;
    }

    while (v73 != 4);
    v89 = v72;
    for (uint64_t i = 48LL; i != -16; i -= 16LL)
      sub_10000AE14((uint64_t)&buf[i]);
    v78 = v88;
    v79 = v89;
    if (v88 != (void *)v89)
    {
      do
      {
        id v80 = +[CLActivityRecorderUtils getDbDetails:](&OBJC_CLASS___CLActivityRecorderUtils, "getDbDetails:", *v78);
        objc_msgSend( v55,  "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:",  objc_msgSend(v80, "objectForKeyedSubscript:", @"url"),  objc_msgSend(v80, "objectForKeyedSubscript:", @"name"),  1,  0,  0);
        v78 += 2;
      }

      while (v78 != v79);
    }

    *(void *)buf = &v88;
    sub_10004CC28((void ***)buf);
  }

  v81 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CMHealthColdStorageCompanionSyncService universe]( self,  "universe"),  "silo"),  "queue"));
  p_fCoreAnalyticsTimer = &self->fCoreAnalyticsTimer;
  self->fCoreAnalyticsTimer = v81;
  dispatch_source_set_timer((dispatch_source_t)v81, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak((id *)buf, self);
  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100D39050;
  handler[3] = &unk_10182B328;
  objc_copyWeak(&v87, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)fCoreAnalyticsTimer, handler);
  dispatch_resume((dispatch_object_t)*p_fCoreAnalyticsTimer);
  objc_destroyWeak(&v87);
  objc_destroyWeak((id *)buf);
}

- (void)endService
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101880858);
  }
  objc_super v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Shutting down CMHealthColdStorageCompanionSyncService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Shutting down CMHealthColdStorageCompanionSyncService",  v8,  2);
    unint64_t v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCompanionSyncService endService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0LL;
  }

  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  if (fCoreAnalyticsTimer)
  {
    dispatch_source_cancel((dispatch_source_t)fCoreAnalyticsTimer);
    dispatch_release((dispatch_object_t)self->fCoreAnalyticsTimer);
    self->fCoreAnalyticsTimer = 0LL;
  }

- (void)setUpAggregationOnTimer
{
  int v13 = 86400;
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, &v11);
  sub_1002A7CB0(v11, "HRRecoveryAggregationTimeInterval", &v13);
  v4 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  uint64_t v7 = 1000000000LL * v13;
  v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend( -[CMHealthColdStorageCompanionSyncService universe]( self,  "universe"),  "silo"),  "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0LL, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100D39408;
  v10[3] = &unk_10181A288;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)receiveColdStorageDataUpdate:(id)a3
{
  if (!a3)
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    unint64_t v15 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] received empty message from watch",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_102;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    LOWORD(v104) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] received empty message from watch",  &v104,  2);
    goto LABEL_136;
  }

  if ([a3 objectForKeyedSubscript:@"HRRecoveryInputHRKey"])
  {
    id v5 = [a3 objectForKeyedSubscript:@"HRRecoveryInputHRKey"];
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      memset(buf, 0, sizeof(buf));
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      id v7 = [v5 countByEnumeratingWithState:&v96 objects:v117 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v97;
        do
        {
          for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v97 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
            *(void *)buf = [v11 recordId];
            [v11 startTime];
            *(void *)&buf[8] = v12;
            [v11 hr];
            *(void *)&__int128 v119 = v13;
            [v11 hrConfidence];
            *((void *)&v119 + 1) = v14;
            sub_10024D4E8((uint64_t)self->fInputHRDb.__ptr_, (uint64_t)buf);
          }

          id v8 = [v5 countByEnumeratingWithState:&v96 objects:v117 count:16];
        }

        while (v8);
      }

      self->fStats.numRecordsSync_HRRIHH += [v5 count];
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      v17 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] Received malformed HRRecoveryInputHRKey %@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        LODWORD(v104) = 138412290;
        *(void *)((char *)&v104 + 4) = v5;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] Received malformed HRRecoveryInputHRKey %@",  &v104,  12);
        uint64_t v65 = (uint8_t *)v64;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v64);
        if (v65 != buf) {
          free(v65);
        }
      }

      ++self->fStats.numErrors;
    }
  }

  if ([a3 objectForKeyedSubscript:@"HRRecoveryInputWRKey"])
  {
    id v18 = [a3 objectForKeyedSubscript:@"HRRecoveryInputWRKey"];
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      memset(buf, 0, sizeof(buf));
      DWORD2(v119) = 0;
      *(void *)&__int128 v119 = 0LL;
      __int128 v120 = 0uLL;
      LODWORD(v121) = 3;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      id v20 = [v18 countByEnumeratingWithState:&v92 objects:v116 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v93;
        do
        {
          for (j = 0LL; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v93 != v22) {
              objc_enumerationMutation(v18);
            }
            unint64_t v24 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)j);
            *(void *)buf = [v24 recordId];
            [v24 startTime];
            *(void *)&buf[8] = v25;
            [v24 mets];
            *(void *)&__int128 v119 = v26;
            DWORD2(v119) = [v24 gradeType];
            [v24 grade];
            *(void *)&__int128 v120 = v27;
            [v24 userMets];
            *((void *)&v120 + 1) = v28;
            LODWORD(v121) = [v24 userMetsSource];
            sub_10024D4E8((uint64_t)self->fInputWRDb.__ptr_, (uint64_t)buf);
          }

          id v21 = [v18 countByEnumeratingWithState:&v92 objects:v116 count:16];
        }

        while (v21);
      }

      self->fStats.numRecordsSync_HRRIWH += [v18 count];
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      v29 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] Received malformed HRRecoveryInputWRKey %@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        LODWORD(v104) = 138412290;
        *(void *)((char *)&v104 + 4) = v18;
        LODWORD(v79) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] Received malformed HRRecoveryInputWRKey %@",  &v104,  v79);
        unint64_t v67 = (uint8_t *)v66;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v66);
        if (v67 != buf) {
          free(v67);
        }
      }

      ++self->fStats.numErrors;
    }
  }

  if ([a3 objectForKeyedSubscript:@"HRRecoverySessionKey"])
  {
    id v30 = [a3 objectForKeyedSubscript:@"HRRecoverySessionKey"];
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
    {
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      id v32 = [v30 countByEnumeratingWithState:&v88 objects:v115 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v89;
        do
        {
          for (k = 0LL; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v89 != v34) {
              objc_enumerationMutation(v30);
            }
            unint64_t v36 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)k);
            if (v36)
            {
              [v36 recoverySession];
            }

            else
            {
              __int128 v127 = 0u;
              __int128 v126 = 0u;
              __int128 v125 = 0u;
              __int128 v124 = 0u;
              __int128 v123 = 0u;
              __int128 v122 = 0u;
              __int128 v121 = 0u;
              __int128 v120 = 0u;
              __int128 v119 = 0u;
              *(_OWORD *)buf = 0u;
            }

            sub_10024D4E8((uint64_t)self->fSessionDb.__ptr_, (uint64_t)buf);
          }

          id v33 = [v30 countByEnumeratingWithState:&v88 objects:v115 count:16];
        }

        while (v33);
      }

      self->fStats.numRecordsSync_HRRSH += [v30 count];
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      v37 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] Received malformed HRRecoverySessionKey %@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        LODWORD(v104) = 138412290;
        *(void *)((char *)&v104 + 4) = v30;
        LODWORD(v79) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] Received malformed HRRecoverySessionKey %@",  &v104,  v79);
        uint64_t v69 = (uint8_t *)v68;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v68);
        if (v69 != buf) {
          free(v69);
        }
      }

      ++self->fStats.numErrors;
    }
  }

  if ([a3 objectForKeyedSubscript:@"PredictedWalkDistanceBoutKey"])
  {
    id v38 = [a3 objectForKeyedSubscript:@"PredictedWalkDistanceBoutKey"];
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
    {
      LODWORD(v104) = 0;
      double v105 = 0.0;
      *((void *)&v104 + 1) = 0LL;
      unsigned int v106 = 0;
      uint64_t v109 = 0LL;
      uint64_t v107 = 0LL;
      uint64_t v108 = 0LL;
      unsigned int v110 = 0;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      uint64_t v114 = 0LL;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      id v40 = [v38 countByEnumeratingWithState:&v84 objects:v103 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v85;
        do
        {
          for (m = 0LL; m != v41; m = (char *)m + 1)
          {
            if (*(void *)v85 != v42) {
              objc_enumerationMutation(v38);
            }
            v44 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)m);
            LODWORD(v104) = [v44 recordId];
            [v44 startTime];
            *((void *)&v104 + 1) = v45;
            [v44 endTime];
            double v105 = v46;
            unsigned int v106 = [v44 stepCount];
            [v44 distance];
            uint64_t v107 = v47;
            [v44 activeTime];
            uint64_t v108 = v48;
            LODWORD(v109) = [v44 elevationAscended];
            HIDWORD(v109) = [v44 elevationDescended];
            unsigned int v110 = [v44 stepCountGPS];
            [v44 distanceGPS];
            *(void *)&__int128 v111 = v49;
            DWORD2(v111) = [v44 boutType];
            (*(void (**)(CLPredictedWalkDistanceBoutRecorderDb *, __int128 *))(*(void *)self->fPredWalkDistanceBoutDb.__ptr_
                                                                                        + 160LL))( self->fPredWalkDistanceBoutDb.__ptr_,  &v104);
          }

          id v41 = [v38 countByEnumeratingWithState:&v84 objects:v103 count:16];
        }

        while (v41);
      }

      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      v50 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEBUG,  "[CompanionSyncService] Received cold storage data of type PredictedWalkDistanceBoutKey",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        LOWORD(v100) = 0;
        LODWORD(v79) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CompanionSyncService] Received cold storage data of type PredictedWalkDistanceBoutKey",  &v100,  v79);
        unint64_t v71 = (uint8_t *)v70;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v70);
        if (v71 != buf) {
          free(v71);
        }
      }

      self->fStats.numRecordsSync_PWDBH += [v38 count];
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      unint64_t v51 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] Received malformed PredictedWalkDistanceBoutKey %@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        LODWORD(v104) = 138412290;
        *(void *)((char *)&v104 + 4) = v38;
        LODWORD(v79) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] Received malformed PredictedWalkDistanceBoutKey %@",  &v104,  v79);
        uint64_t v73 = (uint8_t *)v72;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v72);
        if (v73 != buf) {
          free(v73);
        }
      }

      ++self->fStats.numErrors;
    }
  }

  if ([a3 objectForKeyedSubscript:@"ElevationGradeKey"])
  {
    id v52 = [a3 objectForKeyedSubscript:@"ElevationGradeKey"];
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
    {
      __int128 v104 = 0uLL;
      double v105 = 0.0;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      id v54 = [v52 countByEnumeratingWithState:&v80 objects:v102 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v81;
        do
        {
          for (n = 0LL; n != v55; n = (char *)n + 1)
          {
            if (*(void *)v81 != v56) {
              objc_enumerationMutation(v52);
            }
            v58 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)n);
            *(void *)&__int128 v104 = [v58 recordId];
            [v58 startTime];
            *((void *)&v104 + 1) = v59;
            [v58 fractionalGrade];
            double v105 = v60;
            sub_1001B3964(self->fElevationGradeRecorderDb.__ptr_, (uint64_t)&v104, 0LL);
          }

          id v55 = [v52 countByEnumeratingWithState:&v80 objects:v102 count:16];
        }

        while (v55);
      }

      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      uint64_t v61 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
      {
        id v62 = [v52 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEBUG,  "[CompanionSyncService] Received cold storage data of type ElevationGradeKey, count: %lu",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_101880858);
        }
        uint64_t v74 = qword_1019347B8;
        id v75 = [v52 count];
        int v100 = 134217984;
        id v101 = v75;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v74,  2LL,  "[CompanionSyncService] Received cold storage data of type ElevationGradeKey, count: %lu",  &v100);
        v77 = (uint8_t *)v76;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v76);
        if (v77 != buf) {
          free(v77);
        }
      }

      self->fStats.numRecordsSync_EGH += [v52 count];
      goto LABEL_103;
    }

    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    unint64_t v63 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "[CompanionSyncService] Received malformed ElevationGradeKey %@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0))
    {
LABEL_102:
      ++self->fStats.numErrors;
      goto LABEL_103;
    }

    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    LODWORD(v104) = 138412290;
    *(void *)((char *)&v104 + 4) = v52;
    LODWORD(v79) = 12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CompanionSyncService] Received malformed ElevationGradeKey %@",  &v104,  v79);
LABEL_136:
    v78 = (uint8_t *)v16;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]",  "%s\n",  v16);
    if (v78 != buf) {
      free(v78);
    }
    goto LABEL_102;
  }

- (void)resetCoreAnalyticsTimer
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_101880858);
  }
  uint64_t v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v11 = 60000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Reset CoreAnalytics timer to fire in %{public}lld seconds",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    int v8 = 134349056;
    uint64_t v9 = 60000000000LL;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "Reset CoreAnalytics timer to fire in %{public}lld seconds",  &v8,  12);
    id v7 = (uint8_t *)v6;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCompanionSyncService resetCoreAnalyticsTimer]",  "%s\n",  v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  dispatch_time_t v5 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer((dispatch_source_t)fCoreAnalyticsTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)sendAnalytics
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v4
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v3),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v15[0] = @"NumErrors";
    v16[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->fStats.numErrors);
    v15[1] = @"NumRecordsSync_EGH";
    v16[1] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_EGH);
    v15[2] = @"NumRecordsSync_HRRIHH";
    v16[2] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRIHH);
    v15[3] = @"NumRecordsSync_HRRIWH";
    v16[3] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRIWH);
    v15[4] = @"NumRecordsSync_HRRSH";
    v16[4] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_HRRSH);
    v15[5] = @"NumRecordsSync_PWDBH";
    v16[5] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->fStats.numRecordsSync_PWDBH);
    dispatch_time_t v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  6LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100D3AEA8;
    v12[3] = &unk_101820740;
    v12[4] = v5;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.ColdStorageWatchSync", v12);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    uint64_t v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Sent Core Analytics event: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      int v13 = 138543362;
      uint64_t v14 = v5;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "Sent Core Analytics event: %{public}@",  &v13,  12);
      uint64_t v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CMHealthColdStorageCompanionSyncService resetAnalytics](self, "resetAnalytics");
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_101880858);
    }
    id v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_101880858);
      }
      LOWORD(v13) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "Not sending analytics, no IHA permission",  &v13,  2);
      uint64_t v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
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
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 17) = 0LL;
  return self;
}

@end