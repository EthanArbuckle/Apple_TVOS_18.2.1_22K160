@interface CLVO2MaxService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isEligibleForPreProcessing:(VO2MaxRetrocomputeHistory *)a3;
- (BOOL)updateRetrocomputeLastTimestampToHealthKit:(double)a3;
- (BOOL)validateBodyMetrics;
- (CLVO2MaxService)init;
- (NSMutableSet)retrocomputeStatusClients;
- (id).cxx_construct;
- (int)getIndexInHealthKitSamples:(const void *)a3 forSessionAttributes:(const VO2MaxSessionAttributes *)a4 withStartIndex:(int)a5;
- (unsigned)retrocomputeForSamples:(const void *)a3 withRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a4;
- (unsigned)retrocomputeSession:(const VO2MaxSessionAttributes *)a3 withHealthKitSample:(VO2MaxHealthKitSample *)a4 withRetrocomputeHistory:;
- (unsigned)updateRetrocomputeHistoryPostProcessing:(VO2MaxRetrocomputeHistory *)a3;
- (void)beginService;
- (void)deleteHealthKitSamples:(BOOL)a3;
- (void)endService;
- (void)forceClearHistoryDatabase;
- (void)handleRetryHealthKitDeleteSamples:(id)a3;
- (void)handleRetryTriggerRetrocompute:(id)a3;
- (void)markXpcActivityDone:(id)a3;
- (void)onRetrocomputeHealthKitSampleFailed:(id)a3;
- (void)onRetrocomputeHealthKitSampleSavedWithStartTime:(double)a3 activity:(id)a4;
- (void)onRetrocomputePreprocessingActivity:(id)a3;
- (void)onRetryHealthKitDeleteSamples:(id)a3;
- (void)onRetryTriggerRetrocompute:(id)a3;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)persistLostEstimateToStagingTables:(const void *)a3;
- (void)persistRetrocomputeResultsToStagingTables:(VO2MaxRetrocomputeSessionResult *)a3;
- (void)promoteStagingData:(id)a3;
- (void)queryVO2MaxRetrocomputeStatusWithReply:(id)a3;
- (void)registerForRetrocomputeStatusUpdates:(id)a3;
- (void)resetRetrocomputePreProcessingActivity:(id)a3 withDelay:(int64_t)a4;
- (void)retryHealthKitDeleteSamples;
- (void)retryTriggerRetrocompute;
- (void)runAggregationForStagingTables;
- (void)scheduleRetrocomputePreprocessing;
- (void)sendRetroComputeAnalytics;
- (void)setRetrocomputeStatusClients:(id)a3;
- (void)triggerRetrocomputeWithReply:(id)a3;
- (void)unregisterForRetrocomputeStatusUpdates:(id)a3;
- (void)updateBypassParameters;
- (void)updateRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a3 withResult:(VO2MaxRetrocomputeSessionResult *)a4;
- (void)updateRetrocomputeStatus:(int)a3 unavailableReasons:(unsigned int)a4;
@end

@implementation CLVO2MaxService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101994208 != -1) {
    dispatch_once(&qword_101994208, &stru_101831A88);
  }
  return (id)qword_101994200;
}

- (void)updateBypassParameters
{
  uint64_t v3 = sub_1006E27E8();
  sub_100413284(v3, buf);
  p_fShouldBypassMinDelta = &self->fShouldBypassMinDelta;
  sub_1002A6F64(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta_Bypass", &self->fShouldBypassMinDelta);
  unint64_t v5 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  v8 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = *p_fShouldBypassMinDelta;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Updated fShouldBypassMinDelta to %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    BOOL v24 = *p_fShouldBypassMinDelta;
    int v31 = 67240192;
    BOOL v32 = v24;
    v25 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Updated fShouldBypassMinDelta to %{public}d",  &v31,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v25);
  }

  uint64_t v10 = sub_1006E27E8();
  sub_100413284(v10, buf);
  p_fShouldBypassPreviousSampleInternal = &self->fShouldBypassPreviousSampleInternal;
  sub_1002A6F64( *(uint64_t *)buf,  "VO2MaxRetrocomputeMinPrevAlgSampleInterval_Bypass",  &self->fShouldBypassPreviousSampleInternal);
  v12 = v34;
  if (v34)
  {
    v13 = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  v15 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = *p_fShouldBypassPreviousSampleInternal;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Updated fShouldBypassPreviousSampleInternal to %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    BOOL v26 = *p_fShouldBypassPreviousSampleInternal;
    int v31 = 67240192;
    BOOL v32 = v26;
    LODWORD(v30) = 8;
    v27 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Updated fShouldBypassPreviousSampleInternal to %{public}d",  &v31,  v30);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v27);
  }

  uint64_t v17 = sub_1006E27E8();
  sub_100413284(v17, buf);
  p_fShouldBypassMinEstimatesUpdatedRatio = &self->fShouldBypassMinEstimatesUpdatedRatio;
  sub_1002A6F64( *(uint64_t *)buf,  "VO2MaxRetrocomputeMinEstimatesUpdatedRatio_Bypass",  p_fShouldBypassMinEstimatesUpdatedRatio);
  v19 = v34;
  if (v34)
  {
    v20 = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  v22 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    BOOL v23 = *p_fShouldBypassMinEstimatesUpdatedRatio;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Updated fShouldBypassMinEstimatesUpdatedRatio to %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    BOOL v28 = *p_fShouldBypassMinEstimatesUpdatedRatio;
    int v31 = 67240192;
    BOOL v32 = v28;
    LODWORD(v30) = 8;
    v29 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Updated fShouldBypassMinEstimatesUpdatedRatio to %{public}d",  &v31,  v30);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v29);
  }

- (void)forceClearHistoryDatabase
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  uint64_t v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Force clearing history database", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Force clearing history database",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService forceClearHistoryDatabase]", "%s\n", v4);
  }

  sub_100D8BAC8((void *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (CLVO2MaxService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLVO2MaxService;
  return -[CLVO2MaxService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLVO2MaxServiceProtocol,  &OBJC_PROTOCOL___CLVO2MaxServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_101994218 != -1) {
    dispatch_once(&qword_101994218, &stru_101831AA8);
  }
  return byte_101994210;
}

- (void)beginService
{
  if ((_os_feature_enabled_impl("CoreLocation", "VO2MaxRetrocompute") & 1) != 0)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    objc_super v3 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxService", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v59[0] = 0;
      LODWORD(v58) = 2;
      v56 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Starting up CLVO2MaxService",  v59,  v58);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService beginService]", "%s\n", v56);
    }

    HIBYTE(v58) = 0;
    sub_10028E878((unsigned __int8 *)&v58 + 7, buf);
    p_fInputCache = &self->fInputCache;
    sub_10005F550((uint64_t)&self->fInputCache, (__int128 *)buf);
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

    sub_10028E968((uint64_t *)&self->fInputCache, buf);
    sub_10005F550((uint64_t)&self->fInputStore, (__int128 *)buf);
    v8 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      BOOL v9 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    v11 = (CLVO2MaxStagingOutputStore *)operator new(0x6D0uLL);
    sub_100E3F200((uint64_t)v11, 0LL);
    *(void *)buf = 0LL;
    value = self->fStagingOutputStore.__ptr_.__value_;
    self->fStagingOutputStore.__ptr_.__value_ = v11;
    if (value)
    {
      sub_10028EBB0((uint64_t)&self->fStagingOutputStore, (uint64_t)value);
      uint64_t v13 = *(void *)buf;
      *(void *)buf = 0LL;
      if (v13) {
        sub_10028EBB0((uint64_t)buf, v13);
      }
    }

    unint64_t v14 = (CLVO2MaxRetrocomputeRecorderDb *)operator new(0x1F8uLL);
    sub_10058BF10(v14, 0LL);
    v15 = self->fRetrocomputeDb.__ptr_.__value_;
    self->fRetrocomputeDb.__ptr_.__value_ = v14;
    if (v15) {
      (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *))(*(void *)v15 + 24LL))(v15);
    }
    BOOL v16 = (CLVO2MaxRetrocomputeBodyMetricsDb *)operator new(0x158uLL);
    sub_1001B5E50(v16, 0);
    uint64_t v17 = self->fRetrocomputeBodyMetricsDb.__ptr_.__value_;
    self->fRetrocomputeBodyMetricsDb.__ptr_.__value_ = v16;
    if (v17) {
      (*(void (**)(CLVO2MaxRetrocomputeBodyMetricsDb *))(*(void *)v17 + 24LL))(v17);
    }
    HIBYTE(v58) = 0;
    sub_100305670((unsigned __int8 *)&v58 + 7, buf);
    p_fVO2MaxSessionAttributesDb = &self->fVO2MaxSessionAttributesDb;
    sub_10005F550((uint64_t)&self->fVO2MaxSessionAttributesDb, (__int128 *)buf);
    v19 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v20 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    HIBYTE(v58) = 0;
    sub_100305760((unsigned __int8 *)&v58 + 7, buf);
    p_fVO2MaxOutputRecorderDb = &self->fVO2MaxOutputRecorderDb;
    sub_10005F550((uint64_t)&self->fVO2MaxOutputRecorderDb, (__int128 *)buf);
    BOOL v23 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      BOOL v24 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    HIBYTE(v58) = 0;
    sub_100305850((unsigned __int8 *)&v58 + 7, buf);
    p_fVO2MaxSummaryRecorderDb = &self->fVO2MaxSummaryRecorderDb;
    sub_10005F550((uint64_t)&self->fVO2MaxSummaryRecorderDb, (__int128 *)buf);
    v27 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      BOOL v28 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }

    self->fDeleteHealthKitSamplesAttempts = 0;
    self->fDeleteHealthKitSamplesSuccess = 0;
    self->fUpdateRetrocomputedDataAttempts = 0;
    self->fUpdateRetrocomputedDataSuccess = 0;
    self->fTriggerRetrocomputeInProgress = 0;
    self->fShouldBypassMinDelta = 0;
    self->fShouldBypassPreviousSampleInternal = 0;
    self->fShouldBypassMinEstimatesUpdatedRatio = 0;
    *(_OWORD *)&self->fUserInfo.gender = xmmword_1012E5FD4;
    *(_OWORD *)&self->fUserInfo.vo2max = unk_1012E5FE4;
    *(_OWORD *)&self->fUserInfo.hronset = xmmword_1012E5FF4;
    *(_OWORD *)&self->fUserInfo.runVo2max = *(__int128 *)((char *)&xmmword_1012E5FF4 + 12);
    *(_OWORD *)&self->fOriginalBodyMetrics.gender = xmmword_1012E5FD4;
    *(_OWORD *)&self->fOriginalBodyMetrics.vo2max = unk_1012E5FE4;
    *(_OWORD *)&self->fOriginalBodyMetrics.hronset = xmmword_1012E5FF4;
    *(_OWORD *)&self->fOriginalBodyMetrics.runVo2max = *(__int128 *)((char *)&xmmword_1012E5FF4 + 12);
    sub_100E18F18((uint64_t)sub_1002FC568, (uint64_t)self, self, buf);
    uint64_t v30 = *(Client **)buf;
    *(void *)buf = 0LL;
    int v31 = self->fUserInfoClient.__ptr_.__value_;
    self->fUserInfoClient.__ptr_.__value_ = v30;
    if (v31)
    {
      (*(void (**)(Client *))(*(void *)v31 + 8LL))(v31);
      uint64_t v32 = *(void *)buf;
      *(void *)buf = 0LL;
      if (v32) {
        (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
      }
    }

    [*((id *)self->fUserInfoClient.__ptr_.__value_ + 2) register:*((void *)self->fUserInfoClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1002FC578,  @"com.apple.locationd.VO2Max.RetrocomputeClearHistoryDB",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v34 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v34,  self,  (CFNotificationCallback)sub_1002FC580,  @"com.apple.locationd.VO2Max.RetrocomputeBypassParametersChanged",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    -[CLVO2MaxService updateBypassParameters](self, "updateBypassParameters");
    -[CLVO2MaxService setRetrocomputeStatusClients:]( self,  "setRetrocomputeStatusClients:",  objc_opt_new(&OBJC_CLASS___NSMutableSet));
    id v35 = objc_msgSend( objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
    if (v35)
    {
      cntrl = p_fInputCache->__cntrl_;
      if (p_fInputCache->__ptr_) {
        uint64_t v37 = (uint64_t)p_fInputCache->__ptr_ + 72;
      }
      else {
        uint64_t v37 = 0LL;
      }
      *(void *)buf = v37;
      *(void *)&uint8_t buf[8] = cntrl;
      if (cntrl)
      {
        v38 = (unint64_t *)((char *)cntrl + 8);
        do
          unint64_t v39 = __ldxr(v38);
        while (__stxr(v39 + 1, v38));
      }

      v40 = p_fVO2MaxSessionAttributesDb->__cntrl_;
      if (p_fVO2MaxSessionAttributesDb->__ptr_) {
        uint64_t v41 = (uint64_t)p_fVO2MaxSessionAttributesDb->__ptr_ + 72;
      }
      else {
        uint64_t v41 = 0LL;
      }
      uint64_t v61 = v41;
      v62 = v40;
      if (v40)
      {
        v42 = (unint64_t *)((char *)v40 + 8);
        do
          unint64_t v43 = __ldxr(v42);
        while (__stxr(v43 + 1, v42));
      }

      v44 = p_fVO2MaxOutputRecorderDb->__cntrl_;
      if (p_fVO2MaxOutputRecorderDb->__ptr_) {
        uint64_t v45 = (uint64_t)p_fVO2MaxOutputRecorderDb->__ptr_ + 72;
      }
      else {
        uint64_t v45 = 0LL;
      }
      uint64_t v63 = v45;
      v64 = v44;
      if (v44)
      {
        v46 = (unint64_t *)((char *)v44 + 8);
        do
          unint64_t v47 = __ldxr(v46);
        while (__stxr(v47 + 1, v46));
      }

      v48 = p_fVO2MaxSummaryRecorderDb->__cntrl_;
      if (p_fVO2MaxSummaryRecorderDb->__ptr_) {
        uint64_t v49 = (uint64_t)p_fVO2MaxSummaryRecorderDb->__ptr_ + 72;
      }
      else {
        uint64_t v49 = 0LL;
      }
      uint64_t v65 = v49;
      v66 = v48;
      if (v48)
      {
        v50 = (unint64_t *)((char *)v48 + 8);
        do
          unint64_t v51 = __ldxr(v50);
        while (__stxr(v51 + 1, v50));
      }

      for (uint64_t i = 0LL; i != 64; i += 16LL)
      {
        id v53 = +[CLActivityRecorderUtils getDbDetails:]( &OBJC_CLASS___CLActivityRecorderUtils,  "getDbDetails:",  *(void *)&buf[i]);
        objc_msgSend( v35,  "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:",  objc_msgSend(v53, "objectForKeyedSubscript:", @"url"),  objc_msgSend(v53, "objectForKeyedSubscript:", @"name"),  1,  0,  0);
      }

      for (uint64_t j = 48LL; j != -16; j -= 16LL)
        sub_10000AE14((uint64_t)&buf[j]);
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v55 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Not starting up CLVO2MaxService because it is not enabled",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v59[0] = 0;
      LODWORD(v58) = 2;
      v57 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Not starting up CLVO2MaxService because it is not enabled",  v59,  v58);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService beginService]", "%s\n", v57);
    }
  }

- (void)endService
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  objc_super v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Shutting down CLVO2MaxService",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService endService]", "%s\n", v4);
  }
}

- (void)registerForRetrocomputeStatusUpdates:(id)a3
{
  v12[0] = 0LL;
  v12[1] = 0LL;
  int v13 = 3;
  uint64_t v19 = 0LL;
  __int128 v14 = 0u;
  memset(v15, 0, sizeof(v15));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  memset(v18, 0, sizeof(v18));
  if (sub_10058C240((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v12) == 100)
  {
    unint64_t v5 = objc_alloc(&OBJC_CLASS___NSDate);
    v6 =  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v5,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)((char *)&v14 + 4));
    unint64_t v7 = objc_alloc(&OBJC_CLASS___NSDate);
    v8 =  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v7,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)&v15[1]);
    BOOL v9 = objc_alloc(&OBJC_CLASS___NSNumber);
    unint64_t v10 = -[NSNumber initWithDouble:](v9, "initWithDouble:", *(double *)&v16);
    objc_msgSend( a3,  "onRetrocomputeStatusUpdate:",   objc_msgSend( [CMVO2MaxRetrocomputeState alloc],  "initWithStatus:startDate:endDate:meanDelta:",  (int)v14,  v6,  v8,  v10));
  }

  sub_1001BA1BC(v11);
}

- (void)unregisterForRetrocomputeStatusUpdates:(id)a3
{
}

- (void)sendRetroComputeAnalytics
{
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection)
    && (objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_101994238);
    if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_101994238))
    {
      __int128 v27 = xmmword_1012E6030;
      v28[0] = unk_1012E6040;
      *(_OWORD *)((char *)v28 + 12) = unk_1012E604C;
      *(_OWORD *)buf = xmmword_1012E6010;
      __int128 v26 = unk_1012E6020;
      sub_1001B4118(&qword_101994220, buf, 0x13uLL);
      __cxa_atexit((void (*)(void *))sub_1001B4198, &qword_101994220, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_101994238);
    }

    __int128 v19 = 0uLL;
    LODWORD(v20[0]) = 3;
    uint64_t v24 = 0LL;
    memset((char *)v20 + 4, 0, 44);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    memset(v23, 0, 28);
    if (sub_10058C240((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)&v19) != 109)
    {
      v8[1] = 3221225472LL;
      __int128 v15 = v22;
      __int128 v16 = *(_OWORD *)v23;
      __int128 v17 = *(_OWORD *)&v23[16];
      __int128 v11 = v20[1];
      __int128 v12 = v20[2];
      __int128 v13 = v20[3];
      __int128 v14 = v21;
      __int128 v9 = v19;
      v8[0] = _NSConcreteStackBlock;
      v8[2] = sub_1002FCD0C;
      v8[3] = &unk_101831AD0;
      v8[4] = self;
      uint64_t v18 = v24;
      __int128 v10 = v20[0];
      AnalyticsSendEventLazy(@"com.apple.VO2MaxRetroCompute", v8);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v4 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Succesfully accessed history table, sent Core Analytics event",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        v7[0] = 0;
        unint64_t v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  2LL,  "Succesfully accessed history table, sent Core Analytics event",  v7,  2);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v5);
LABEL_22:
      }
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Retro-compute, not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v19) = 0;
      unint64_t v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  2LL,  "Retro-compute, not sending analytics, no IHA permission",  &v19,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v5);
      goto LABEL_22;
    }
  }

- (void)scheduleRetrocomputePreprocessing
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1006E27E8();
  sub_100413284(v4, &v18);
  double v17 = 0.0;
  sub_1002A82BC(v18, "VO2MaxRetrocomputeNextPreprocessingTime", &v17);
  double v5 = v17;
  if (v17 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int128 v27 = "VO2MaxRetrocomputeNextPreprocessingTime";
      __int16 v28 = 2050;
      double v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      int v20 = 136446466;
      __int128 v21 = "VO2MaxRetrocomputeNextPreprocessingTime";
      __int16 v22 = 2050;
      double v23 = v17;
      __int128 v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  &v20,  22);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v14);
    }

    sub_1002A667C(v18, "VO2MaxRetrocomputeNextPreprocessingTime", 0xFFFFFFFFLL);
    double v17 = 0.0;
    double v5 = 0.0;
  }

  double v7 = v5 - Current;
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  __int128 v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int128 v27 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    __int16 v28 = 2050;
    double v29 = v17;
    __int16 v30 = 2050;
    int64_t v31 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v20 = 136446722;
    __int128 v21 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    __int16 v22 = 2050;
    double v23 = v17;
    __int16 v24 = 2050;
    int64_t v25 = v8;
    LODWORD(v15) = 32;
    __int128 v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)",  &v20,  v15);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v13);
  }

  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputePreprocessing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002FD440;
  handler[3] = &unk_1018268C8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLVO2MaxService");
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputePreprocessing", XPC_ACTIVITY_CHECK_IN, handler);
  __int128 v10 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

- (void)resetRetrocomputePreProcessingActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v13 = v6;
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  double v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "VO2MaxRetrocomputeNextPreprocessingTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Resetting next activity time to: %{public}.1f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v14 = 136446466;
    uint64_t v15 = "VO2MaxRetrocomputeNextPreprocessingTime";
    __int16 v16 = 2050;
    double v17 = v6;
    unint64_t v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "%{public}s: Resetting next activity time to: %{public}.1f",  &v14,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:]",  "%s\n",  v12);
    if (v12 != buf) {
      free(v12);
    }
  }

  uint64_t v8 = sub_1006E27E8();
  sub_100413284(v8, buf);
  sub_1002AC7B8(*(uint64_t *)buf, "VO2MaxRetrocomputeNextPreprocessingTime", &v13);
  __int128 v9 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    __int128 v10 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  -[CLVO2MaxService scheduleRetrocomputePreprocessing](self, "scheduleRetrocomputePreprocessing");
}

- (void)onRetrocomputePreprocessingActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    uint64_t v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Invalid xpc activity.");
LABEL_31:
    unint64_t v12 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v9);
    if (v12 != buf) {
      free(v12);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    double v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Preparing to execute VO2MaxRetrocomputePreProcessing",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v13) = 0;
      unint64_t v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Preparing to execute VO2MaxRetrocomputePreProcessing",  &v13,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v11);
    }

    -[CLVO2MaxService executeRetrocomputePreprocessing:](self, "executeRetrocomputePreprocessing:", a3);
    return;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  __int128 v10 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unexpected VO2MaxRetrocomputePreProcessing activity state: %ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unexpected VO2MaxRetrocomputePreProcessing activity state: %ld",  &v13);
    goto LABEL_31;
  }

- (void)queryVO2MaxRetrocomputeStatusWithReply:(id)a3
{
  v27[0] = 0LL;
  v27[1] = 0LL;
  int v28 = 3;
  uint64_t v34 = 0LL;
  __int128 v29 = 0u;
  memset(v30, 0, sizeof(v30));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  memset(v33, 0, sizeof(v33));
  uint64_t v4 = sub_10058C240((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v27);
  if ((_DWORD)v4 == 100)
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSDate);
    xpc_activity_state_t v6 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( v5,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)((char *)&v29 + 4));
    double v7 = objc_alloc(&OBJC_CLASS___NSDate);
    uint64_t v8 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( v7,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)&v30[1]);
    __int128 v9 = objc_alloc(&OBJC_CLASS___NSNumber);
    __int128 v10 = -[NSNumber initWithDouble:](v9, "initWithDouble:", *(double *)&v31);
    id v11 = [[CMVO2MaxRetrocomputeState alloc] initWithStatus:(int)v29 startDate:v6 endDate:v8 meanDelta:v10];
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    unint64_t v12 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      int v24 = 3;
      __int16 v25 = 2080;
      id v26 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Queried VO2MaxRetrocomputeHistory for algVersion = %d and received %s",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      uint64_t v15 = qword_1019346E8;
      int v19 = 67109378;
      int v20 = 3;
      __int16 v21 = 2080;
      id v22 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      LODWORD(v18) = 18;
      __int16 v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  2LL,  "Queried VO2MaxRetrocomputeHistory for algVersion = %d and received %s",  &v19,  v18);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v16);
    }

    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 100LL);
  }

  else
  {
    uint64_t v13 = v4;
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v14 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error querying VO2MaxRetrocomputeHistory: %u",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      int v19 = 67109120;
      int v20 = v13;
      double v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Error querying VO2MaxRetrocomputeHistory: %u",  &v19);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v17);
    }

    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0LL, v13);
  }

- (void)markXpcActivityDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    uint64_t v4 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "Failed to mark activity as done. Current state is %{public}ld",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      uint64_t v5 = qword_1019346E8;
      int v7 = 134349056;
      xpc_activity_state_t v8 = xpc_activity_get_state((xpc_activity_t)a3);
      xpc_activity_state_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  17LL,  "Failed to mark activity as done. Current state is %{public}ld",  &v7,  12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService markXpcActivityDone:]", "%s\n", v6);
    }
  }

- (void)runAggregationForStagingTables
{
}

- (BOOL)isEligibleForPreProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  return (a3->var19 & 0x340) == 0 && (a3->var3 & 0xFFFFFFFE) != 2;
}

- (unsigned)retrocomputeForSamples:(const void *)a3 withRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a4
{
  uint64_t v4 = *(double **)a3;
  if (*(void *)a3 == *((void *)a3 + 1))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    id v35 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "There are no VO2Max HealthKit samples to retrocompute",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v64[0]) = 0;
      v44 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "There are no VO2Max HealthKit samples to retrocompute",  v64,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]",  "%s\n",  v44);
    }

    return 0;
  }

  else
  {
    uint64_t v49 = 0LL;
    v50 = 0LL;
    uint64_t v51 = 0LL;
    double var8 = a4->var8;
    if (var8 == 0.0) {
      double var8 = *v4 + -1.0;
    }
    uint64_t v8 = sub_100D74AD8();
    sub_100D755B8(v8, (char **)&v49, var8);
    unint64_t v9 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v50 - (_BYTE *)v49) >> 4));
    if (v50 == v49) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = v9;
    }
    sub_100305940((uint64_t)v49, v50, v10, 1);
    unint64_t v12 = (double *)v49;
    id v11 = v50;
    if (v49 == v50)
    {
      LODWORD(v13) = 0;
LABEL_46:
      if (0x8E38E38E38E38E39LL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > (int)v13)
      {
        unint64_t v13 = (int)v13;
        uint64_t v36 = 72LL * (int)v13 + 24;
        do
        {
          uint64_t v37 =  -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  *(void *)a3 + v36);
          if (qword_1019346E0 != -1) {
            dispatch_once(&qword_1019346E0, &stru_101831B18);
          }
          v38 = (os_log_s *)qword_1019346E8;
          if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v39 = -[NSUUID UUIDString](v37, "UUIDString");
            *(_DWORD *)buf = 138477827;
            v66 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346E0 != -1) {
              dispatch_once(&qword_1019346E0, &stru_101831B18);
            }
            uint64_t v40 = qword_1019346E8;
            uint64_t v41 = -[NSUUID UUIDString](v37, "UUIDString");
            LODWORD(v64[0]) = 138477827;
            *(void *)((char *)v64 + 4) = v41;
            LODWORD(v45) = 12;
            v42 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v40,  0LL,  "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@",  v64,  v45);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]",  "%s\n",  v42);
          }

          ++a4->var15;
          ++v13;
          v36 += 72LL;
        }

        while (0x8E38E38E38E38E39LL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v13);
      }

      unsigned int v34 = -[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]( self,  "updateRetrocomputeHistoryPostProcessing:",  a4);
    }

    else
    {
      unint64_t v13 = 0LL;
      v46 = v50;
      while (1)
      {
        v64[0] = *(_OWORD *)v12;
        __int128 v14 = *((_OWORD *)v12 + 1);
        __int128 v15 = *((_OWORD *)v12 + 2);
        __int128 v16 = *((_OWORD *)v12 + 4);
        v64[3] = *((_OWORD *)v12 + 3);
        v64[4] = v16;
        v64[1] = v14;
        v64[2] = v15;
        __int128 v61 = 0uLL;
        *(void *)v62 = 0xBFF0000000000000LL;
        *(_DWORD *)&v62[24] = 0;
        sub_1010DDBC0(&v63, "");
        int v17 = -[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]( self,  "getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:",  a3,  v64,  v13);
        int v18 = v17;
        if ((v17 & 0x80000000) == 0)
        {
          unsigned int v47 = v17;
          if ((int)v13 < v17)
          {
            uint64_t v19 = 72LL * (int)v13;
            uint64_t v20 = v17 - (uint64_t)(int)v13;
            do
            {
              __int16 v21 =  -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  *(void *)a3 + v19 + 24);
              double var4 = a4->var4;
              BOOL v23 = var4 > 0.0 && *(double *)(*(void *)a3 + v19) > var4;
              if (qword_1019346E0 != -1) {
                dispatch_once(&qword_1019346E0, &stru_101831B18);
              }
              int v24 = (os_log_s *)qword_1019346E8;
              if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v25 = -[NSUUID UUIDString](v21, "UUIDString");
                uint64_t v26 = *(void *)(*(void *)a3 + v19);
                *(_DWORD *)buf = 138478339;
                v66 = v25;
                __int16 v67 = 2049;
                uint64_t v68 = v26;
                __int16 v69 = 1026;
                BOOL v70 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@, startTi me:%{private}f, isLostEstimate:%{public}d",  buf,  0x1Cu);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346E0 != -1) {
                  dispatch_once(&qword_1019346E0, &stru_101831B18);
                }
                uint64_t v27 = qword_1019346E8;
                int v28 = -[NSUUID UUIDString](v21, "UUIDString");
                uint64_t v29 = *(void *)(*(void *)a3 + v19);
                int v55 = 138478339;
                v56 = v28;
                __int16 v57 = 2049;
                uint64_t v58 = v29;
                __int16 v59 = 1026;
                BOOL v60 = v23;
                LODWORD(v45) = 28;
                __int16 v30 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v27,  0LL,  "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{priv ate}@, startTime:%{private}f, isLostEstimate:%{public}d",  &v55,  v45);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]",  "%s\n",  v30);
              }

              if (v23)
              {
                ++a4->var14;
                -[CLVO2MaxService persistLostEstimateToStagingTables:]( self,  "persistLostEstimateToStagingTables:",  *(void *)a3 + v19);
              }

              v19 += 72LL;
              --v20;
            }

            while (v20);
            LODWORD(v13) = v18;
            id v11 = v46;
          }

          uint64_t v31 = *(void *)a3 + 72LL * v47;
          __int128 v32 = *(_OWORD *)(v31 + 28);
          __int128 v33 = *(_OWORD *)(v31 + 16);
          __int128 v61 = *(_OWORD *)v31;
          *(_OWORD *)v62 = v33;
          *(_OWORD *)&v62[12] = v32;
          std::string::operator=(&v63, (const std::string *)(v31 + 48));
          unint64_t v13 = (v13 + 1);
        }

        __int128 v52 = v61;
        v53[0] = *(_OWORD *)v62;
        *(_OWORD *)((char *)v53 + 12) = *(_OWORD *)&v62[12];
        else {
          std::string __p = v63;
        }
        unsigned int v34 = -[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]( self,  "retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:",  v64,  &v52,  a4);
        if (v34) {
          break;
        }
        v12 += 10;
        if (v12 == v11) {
          goto LABEL_46;
        }
      }
    }

    if (v49)
    {
      v50 = (double *)v49;
      operator delete(v49);
    }
  }

  return v34;
}

- (int)getIndexInHealthKitSamples:(const void *)a3 forSessionAttributes:(const VO2MaxSessionAttributes *)a4 withStartIndex:(int)a5
{
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t v8 = *(void *)a3 + 72LL * a5;
  var2 = a4->var2;
  if (v8 != v7)
  {
    while (uuid_compare(var2, (const unsigned __int8 *)(v8 + 24)))
    {
      v8 += 72LL;
      if (v8 == v7)
      {
        uint64_t v8 = v7;
        break;
      }
    }
  }

  uint64_t v10 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", var2);
  if (v8 == *((void *)a3 + 1))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v16 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v27 = -[NSUUID UUIDString](v10, "UUIDString");
      __int16 v28 = 1026;
      int v29 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "CLVO2MaxService::getIndexInHealthKitSamples - index not found for sessionId: %{private}@, startIndex: %{public}d",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      uint64_t v18 = qword_1019346E8;
      int v20 = 138478083;
      __int16 v21 = -[NSUUID UUIDString](v10, "UUIDString");
      __int16 v22 = 1026;
      int v23 = a5;
      uint64_t v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  2LL,  "CLVO2MaxService::getIndexInHealthKitSamples - index not found for sessionId: %{private}@, startIndex: %{public}d",  &v20,  18);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]",  "%s\n",  v19);
    }

    LODWORD(v12) = -1;
  }

  else
  {
    uint64_t v11 = (v8 - *(void *)a3) >> 3;
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    unint64_t v12 = 0x8E38E38E38E38E39LL * v11;
    unint64_t v13 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      uint64_t v27 = -[NSUUID UUIDString](v10, "UUIDString");
      __int16 v28 = 1026;
      int v29 = a5;
      __int16 v30 = 2050;
      unint64_t v31 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CLVO2MaxService::getIndexInHealthKitSamples - sessionId: %{private}@, startIndex: %{public}d, index: %{public}zu",  buf,  0x1Cu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      uint64_t v14 = qword_1019346E8;
      int v20 = 138478339;
      __int16 v21 = -[NSUUID UUIDString](v10, "UUIDString");
      __int16 v22 = 1026;
      int v23 = a5;
      __int16 v24 = 2050;
      unint64_t v25 = v12;
      __int128 v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  2LL,  "CLVO2MaxService::getIndexInHealthKitSamples - sessionId: %{private}@, startIndex: %{public}d, index: %{public}zu",  &v20,  28);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]",  "%s\n",  v15);
    }
  }

  return v12;
}

- (unsigned)retrocomputeSession:(const VO2MaxSessionAttributes *)a3 withHealthKitSample:(VO2MaxHealthKitSample *)a4 withRetrocomputeHistory:
{
  uint64_t v5 = v4;
  if (-[CLVO2MaxService validateBodyMetrics](self, "validateBodyMetrics"))
  {
    *(void *)&dst[8] = 0LL;
    *(void *)dst = 0LL;
    *(double *)&dst[16] = a3->var1;
    dst[24] = a3->var6;
    __int128 v125 = 0u;
    memset(v126, 0, sizeof(v126));
    __int128 v9 = *(_OWORD *)&a4->var0;
    __int128 v10 = *(_OWORD *)&a4->var2;
    *(_OWORD *)((char *)v128 + 12) = *(_OWORD *)&a4->var3[4];
    v128[0] = v10;
    __int128 v127 = v9;
    if (*((char *)&a4->var5.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1010DD48C(&__src, a4->var5.__r_.__value_.var0.var1.__data_, a4->var5.__r_.__value_.var0.var1.__size_);
    }

    else
    {
      __int128 __src = *(_OWORD *)a4->var5.__r_.__value_.var0.var0.__data_;
      uint64_t v130 = *((void *)&a4->var5.__r_.__value_.var0.var1 + 2);
    }

    int var7 = a3->var7;
    var2 = a3->var2;
    uuid_copy(dst, a3->var2);
    uuid_copy(uu, a3->var2);
    sub_100E3F21C((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_100E3F20C(self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_100E3F560((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_100D58978(uu, (uint64_t *)self->fInputStore.__ptr_, &v101);
    std::string __p = 0LL;
    __dst = 0LL;
    unint64_t v100 = 0LL;
    double v14 = *(double *)&dst[16] + -18144000.0;
    if (*(double *)(v5 + 32) == 0.0)
    {
      uint64_t v15 = sub_100D74AD8();
      if (!sub_100D75614(v15, (char **)&__p, v14, *(double *)&dst[16]))
      {
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        __int128 v16 = (os_log_s *)qword_1019346E8;
        if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Query for historical summaries failed due to device lock",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346E0 != -1) {
            dispatch_once(&qword_1019346E0, &stru_101831B18);
          }
          LOWORD(v122[0]) = 0;
          int v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Query for historical summaries failed due to device lock",  v122,  2);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]",  "%s\n",  v17);
          if (v17 != buf) {
            free(v17);
          }
        }

- (void)persistRetrocomputeResultsToStagingTables:(VO2MaxRetrocomputeSessionResult *)a3
{
  var0 = a3->var3.var0;
  var1 = a3->var3.var1;
  if (var0 != var1)
  {
    uint64_t v7 = (char *)var0 + 88;
    do
    {
      v11[0] = 0LL;
      uint64_t v12 = 0LL;
      int64_t var4 = 0x7FEFFFFFFFFFFFFFLL;
      memset(v15, 0, sizeof(v15));
      LODWORD(v16) = 1;
      v11[1] = *((void *)v7 - 10);
      uuid_copy((unsigned __int8 *)v13, (const unsigned __int8 *)v7 - 64);
      uint64_t v12 = *((void *)v7 - 9);
      int64_t var4 = *((void *)v7 - 6);
      *(void *)&v15[0] = *((void *)v7 - 5);
      *(_OWORD *)((char *)v15 + 8) = *((_OWORD *)v7 - 2);
      *(_OWORD *)((char *)&v15[1] + 8) = *((_OWORD *)v7 - 1);
      *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)v7;
      *(_OWORD *)((char *)&v15[3] + 8) = *((_OWORD *)v7 + 1);
      *(_OWORD *)((char *)&v15[4] + 8) = *((_OWORD *)v7 + 2);
      *(_OWORD *)((char *)&v15[5] + 8) = *((_OWORD *)v7 + 3);
      *(_OWORD *)((char *)&v15[6] + 8) = *((_OWORD *)v7 + 4);
      *((void *)&v15[7] + 1) = *((void *)v7 + 10);
      uint64_t v16 = *((void *)v7 + 11);
      sub_100E3F210((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
      uint64_t v8 = (VO2MaxSummary *)(v7 + 96);
      v7 += 184;
    }

    while (v8 != var1);
  }

  if (a3->var4.var2 > 0.0)
  {
    v13[0] = 0LL;
    memset((char *)&v15[4] + 8, 0, 24);
    *(void *)&v15[6] = 3LL;
    BYTE8(v15[6]) = 0;
    sub_1010DDBC0(&v15[7], "");
    double var2 = -1.0;
    v13[0] = *(void *)&a3->var4.var2;
    uuid_copy((unsigned __int8 *)&v15[1] + 8, a3->var4.var8);
    v13[1] = *(void *)&a3->var4.var3;
    int64_t var4 = a3->var4.var4;
    v15[0] = *(_OWORD *)&a3->var4.var5;
    *(double *)&v15[1] = a3->var4.var7;
    *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)&a3->var4.var9;
    DWORD2(v15[3]) = a3->var4.var11;
    WORD6(v15[3]) = *(_WORD *)&a3->var4.var12;
    LODWORD(v15[4]) = a3->var4.var14;
    __int128 v9 = *(_OWORD *)&a3->var4.var15;
    unsigned int v10 = a3->var5.var4 + 1;
    LODWORD(v15[6]) = 3;
    DWORD1(v15[6]) = v10;
    BYTE8(v15[6]) = a3->var2;
    *(_OWORD *)((char *)&v15[4] + 8) = v9;
    std::string::operator=((std::string *)&v15[7], (const std::string *)&a3->var5.var5);
    double var2 = a3->var5.var2;
    sub_100E3F204(self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)&v15[7]);
    }
  }

- (void)persistLostEstimateToStagingTables:(const void *)a3
{
  v4[0] = 0LL;
  v4[1] = *(void *)a3;
  uuid_copy(v5, (const unsigned __int8 *)a3 + 24);
  sub_100E3F554((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v4);
}

- (void)updateRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a3 withResult:(VO2MaxRetrocomputeSessionResult *)a4
{
  double var1 = a4->var1;
  a3->double var8 = var1;
  var9 = a3->var9;
  uuid_copy(a3->var9, a4->var0);
  if (a4->var4.var2 <= 0.0)
  {
    if (a3->var4 > 0.0 && a4->var5.var2 > -1.0)
    {
      ++a3->var14;
      -[CLVO2MaxService persistLostEstimateToStagingTables:](self, "persistLostEstimateToStagingTables:", &a4->var5);
    }
  }

  else
  {
    if (a4->var5.var5.__r_.var0 <= 2)
    {
      if (a3->var4 == 0.0) {
        a3->double var4 = var1;
      }
      a3->double var7 = var1;
    }

    a3->double var6 = var1;
    double var2 = a4->var5.var2;
    if (var2 == -1.0)
    {
      ++a3->var13;
    }

    else
    {
      double v10 = a4->var4.var3 - var2;
      unsigned int var12 = a3->var12;
      double v12 = v10 + a3->var10 * (double)var12;
      double v13 = v10 / var2 + a3->var11 * (double)var12++;
      a3->unsigned int var12 = var12;
      a3->double var10 = v12 / (double)var12;
      a3->double var11 = v13 / (double)var12;
    }
  }

  if (a3->var5 == 0.0)
  {
    var0 = a4->var3.var0;
    if (var0 != a4->var3.var1) {
      a3->var5 = *((double *)var0 + 1);
    }
  }

  __int128 v45 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", var9);
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  uint64_t v15 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = self;
    double v17 = a3->var1;
    int v18 = a3->var2;
    int var3 = a3->var3;
    double var8 = a3->var8;
    uint64_t v21 = -[NSUUID UUIDString](v45, "UUIDString");
    double var4 = a3->var4;
    double var6 = a3->var6;
    double var7 = a3->var7;
    double var10 = a3->var10;
    double var11 = a3->var11;
    unsigned int v27 = a3->var12;
    unsigned int var13 = a3->var13;
    unsigned int var14 = a3->var14;
    *(_DWORD *)buf = 134286595;
    double v73 = v17;
    self = v16;
    __int16 v74 = 1025;
    int v75 = v18;
    __int16 v76 = 1025;
    int v77 = var3;
    __int16 v78 = 2049;
    double v79 = var8;
    __int16 v80 = 2113;
    v81 = v21;
    __int16 v82 = 2049;
    double v83 = var4;
    __int16 v84 = 2049;
    double v85 = var6;
    __int16 v86 = 2049;
    double v87 = var7;
    __int16 v88 = 2049;
    double v89 = var10;
    __int16 v90 = 2049;
    double v91 = var11;
    __int16 v92 = 1025;
    unsigned int v93 = v27;
    __int16 v94 = 1025;
    unsigned int v95 = var13;
    __int16 v96 = 1025;
    unsigned int v97 = var14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating VO2MaxRetrocomputeHistory: startTime,%{private}f,algVersion,%{private}d,status,%{private}d,lastSessionTim estamp,%{private}f,lastSessionId,%{private}@,firstSampleDate,%{private}f,lastSampleDate,%{private}f,lastSampleDate PrevAlg,%{private}f,meanDelta,%{private}f,meanPercentileDelta,%{private}f,numUpdatedEstimates,%{private}d,numNewEs timates,%{private}d,numLostEstimates,%{private}d",  buf,  0x70u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    uint64_t v30 = qword_1019346E8;
    double v31 = a3->var1;
    int v32 = a3->var2;
    int v33 = a3->var3;
    double v34 = a3->var8;
    id v35 = -[NSUUID UUIDString](v45, "UUIDString");
    double v36 = a3->var4;
    double v37 = a3->var6;
    double v38 = a3->var7;
    double v39 = a3->var10;
    double v40 = a3->var11;
    unsigned int v41 = a3->var12;
    unsigned int v42 = a3->var13;
    unsigned int v43 = a3->var14;
    int v46 = 134286595;
    double v47 = v31;
    __int16 v48 = 1025;
    int v49 = v32;
    __int16 v50 = 1025;
    int v51 = v33;
    __int16 v52 = 2049;
    double v53 = v34;
    __int16 v54 = 2113;
    __int128 v55 = v35;
    __int16 v56 = 2049;
    double v57 = v36;
    __int16 v58 = 2049;
    double v59 = v37;
    __int16 v60 = 2049;
    double v61 = v38;
    __int16 v62 = 2049;
    double v63 = v39;
    __int16 v64 = 2049;
    double v65 = v40;
    __int16 v66 = 1025;
    unsigned int v67 = v41;
    __int16 v68 = 1025;
    unsigned int v69 = v42;
    __int16 v70 = 1025;
    unsigned int v71 = v43;
    __int128 v44 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v30,  0LL,  "Updating VO2MaxRetrocomputeHistory: startTime,%{private}f,algVersion,%{private}d,status,%{private}d, lastSessionTimestamp,%{private}f,lastSessionId,%{private}@,firstSampleDate,%{private}f,lastSampleDat e,%{private}f,lastSampleDatePrevAlg,%{private}f,meanDelta,%{private}f,meanPercentileDelta,%{private} f,numUpdatedEstimates,%{private}d,numNewEstimates,%{private}d,numLostEstimates,%{private}d",  &v46,  112);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService updateRetrocomputeHistory:withResult:]", "%s\n", v44);
  }

  sub_10058BF4C((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
}

- (unsigned)updateRetrocomputeHistoryPostProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  uint64_t v83 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0LL;
  if (sub_100E3F274((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v83, 0.0) == 100)
  {
    uint64_t v80 = 0LL;
    uint64_t v81 = 0LL;
    uint64_t v82 = 0LL;
    if (sub_100E3F2CC(self->fStagingOutputStore.__ptr_.__value_, &v80) == 100)
    {
      std::string __p = 0LL;
      __int16 v78 = 0LL;
      double v79 = 0LL;
      uint64_t v5 = v83;
      uint64_t v6 = v84;
      if (v83 == v84)
      {
        a3->var17 = 0.0;
        double v41 = 0.0;
        double v40 = 0.0;
      }

      else
      {
        int v7 = 0;
        int v8 = 0;
        double v9 = 0.0;
        double v10 = 0.0;
        double v72 = 0.0;
        double v73 = 0.0;
        double v11 = 0.0;
        double v12 = 0.0;
        do
        {
          *(_OWORD *)buf = *(_OWORD *)v5;
          __int128 v13 = *(_OWORD *)(v5 + 16);
          __int128 v14 = *(_OWORD *)(v5 + 32);
          __int128 v15 = *(_OWORD *)(v5 + 64);
          *(_OWORD *)&v107[16] = *(_OWORD *)(v5 + 48);
          __int128 v108 = v15;
          *(_OWORD *)&uint8_t buf[16] = v13;
          *(_OWORD *)__int128 v107 = v14;
          __int128 v16 = *(_OWORD *)(v5 + 80);
          __int128 v17 = *(_OWORD *)(v5 + 96);
          __int128 v18 = *(_OWORD *)(v5 + 128);
          __int128 v111 = *(_OWORD *)(v5 + 112);
          __int128 v112 = v18;
          __int128 v109 = v16;
          __int128 v110 = v17;
          uint64_t v19 = *(void *)(v5 + 144);
          char v114 = *(_BYTE *)(v5 + 152);
          uint64_t v113 = v19;
          if (*(char *)(v5 + 183) < 0)
          {
            sub_1010DD48C(&v115, *(void **)(v5 + 160), *(void *)(v5 + 168));
          }

          else
          {
            __int128 v20 = *(_OWORD *)(v5 + 160);
            uint64_t v116 = *(void *)(v5 + 176);
            __int128 v115 = v20;
          }

          double v21 = *(double *)(v5 + 184);
          double v117 = v21;
          if (v21 <= 0.0)
          {
            double v26 = v12;
            double v22 = v11;
            double v23 = v10;
            double v24 = v9;
          }

          else
          {
            double v22 = 0.0;
            double v23 = 0.0;
            double v24 = v21;
            if (v8)
            {
              double v24 = v9 + (v21 - v9) / (double)(v8 + 1);
              double v23 = v10 + (v21 - v9) * (v21 - v24);
              double v73 = v23;
            }

            int v25 = v7 + 1;
            double v26 = *(double *)v107;
            if (v7)
            {
              double v26 = v12 + (*(double *)v107 - v12) / (double)v25;
              double v22 = v11 + (*(double *)v107 - v12) * (*(double *)v107 - v26);
              double v72 = v22;
            }

            double v27 = *(double *)v107 - v21;
            __int128 v28 = v78;
            if (v78 >= v79)
            {
              uint64_t v30 = (double *)__p;
              uint64_t v31 = ((char *)v78 - (_BYTE *)__p) >> 3;
              unint64_t v32 = v31 + 1;
              uint64_t v33 = (char *)v79 - (_BYTE *)__p;
              else {
                unint64_t v34 = v32;
              }
              if (v34)
              {
                id v35 = (char *)sub_1000071BC((uint64_t)&v79, v34);
                uint64_t v30 = (double *)__p;
                __int128 v28 = v78;
              }

              else
              {
                id v35 = 0LL;
              }

              double v36 = (double *)&v35[8 * v31];
              *double v36 = v27;
              __int128 v29 = v36 + 1;
              while (v28 != v30)
              {
                uint64_t v37 = *((void *)v28-- - 1);
                *((void *)v36-- - 1) = v37;
              }

              std::string __p = v36;
              __int16 v78 = v29;
              double v79 = (double *)&v35[8 * v34];
              if (v30) {
                operator delete(v30);
              }
            }

            else
            {
              *__int16 v78 = v27;
              __int128 v29 = v28 + 1;
            }

            __int16 v78 = v29;
            ++v8;
            int v7 = v25;
          }

          if (SHIBYTE(v116) < 0) {
            operator delete((void *)v115);
          }
          v5 += 192LL;
          double v9 = v24;
          double v10 = v23;
          double v11 = v22;
          double v12 = v26;
        }

        while (v5 != v6);
        double v38 = 0.0;
        double v39 = 0.0;
        if (__p != v78) {
          double v39 = sub_100DEA794((uint64_t)&__p, 90);
        }
        a3->var17 = v39;
        if (v7 >= 2) {
          double v38 = v72 / (double)(v7 - 1);
        }
        double v40 = 0.0;
        double v41 = sqrt(v38);
        if (v8 >= 2) {
          double v40 = v73 / (double)(v8 - 1);
        }
      }

      a3->var18 = v41 - sqrt(v40);
      double v76 = 15552000.0;
      uint64_t v45 = sub_1006E27E8();
      sub_100413284(v45, buf);
      sub_1002A82BC(*(uint64_t *)buf, "VO2MaxRetrocomputeMinPrevAlgSampleInterval", &v76);
      int v46 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        double v47 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }

      double v49 = a3->var7 - a3->var4;
      if (v49 >= v76 || self->fShouldBypassPreviousSampleInternal)
      {
        int v50 = 0;
      }

      else
      {
        a3->var19 |= 8u;
        int v50 = 1;
      }

      double v75 = 0.9;
      uint64_t v51 = sub_1006E27E8();
      sub_100413284(v51, buf);
      sub_1002A82BC(*(uint64_t *)buf, "VO2MaxRetrocomputeMinEstimatesUpdatedRatio", &v75);
      __int16 v52 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        double v53 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
      }

      double v55 = (double)a3->var12 / (double)(a3->var14 + a3->var12 + a3->var15);
      if (!a3->var3 && v55 < v75 && !self->fShouldBypassMinEstimatesUpdatedRatio)
      {
        a3->var19 |= 0x10u;
        int v50 = 1;
      }

      double v74 = 1.0;
      uint64_t v56 = sub_1006E27E8();
      sub_100413284(v56, buf);
      sub_1002A82BC(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta", &v74);
      double v57 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        __int16 v58 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v59 = __ldaxr(v58);
        while (__stlxr(v59 - 1, v58));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }

      if (!a3->var3 && fabs(a3->var10) < v74 && !self->fShouldBypassMinDelta)
      {
        a3->var19 |= 0x20u;
        int v50 = 1;
      }

      uint64_t v60 = v80;
      uint64_t v61 = v81;
      if (v80 != v81)
      {
        a3->var19 |= 0x40u;
        int v50 = 1;
      }

      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      __int16 v62 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        double var10 = a3->var10;
        int var3 = a3->var3;
        *(_DWORD *)buf = 134285825;
        *(double *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2049;
        *(double *)&buf[14] = v76;
        *(_WORD *)&buf[22] = 2049;
        *(double *)&buf[24] = v55;
        *(_WORD *)__int128 v107 = 2049;
        *(double *)&v107[2] = v75;
        *(_WORD *)&v107[10] = 2049;
        *(double *)&v107[12] = var10;
        *(_WORD *)&v107[20] = 2049;
        *(double *)&v107[22] = v74;
        *(_WORD *)&v107[30] = 1026;
        LODWORD(v108) = v60 != v61;
        WORD2(v108) = 1025;
        *(_DWORD *)((char *)&v108 + 6) = v50;
        WORD5(v108) = 1026;
        HIDWORD(v108) = var3;
        LOWORD(v109) = 1026;
        *(_DWORD *)((char *)&v109 + 2) = v50 ^ 1;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "VO2MaxRetrocomputeHistory data checks: prevAlgSampleInterval,%{private}f,minPrevAlgSampleInterval,%{private}f, estimatesUpdatedRatio,%{private}f,minEstimatesUpdatedRatio,%{private}f,meanDelta,%{private}f,minMeanDelta,%{pr ivate}f,badStagingDataExists,%{public}d,failedDataCheck,%{private}d,oldRetrocomputeStatus,%{public}d,newRetroc omputeStatus,%{public}d",  buf,  0x56u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        double v69 = a3->var10;
        int v70 = a3->var3;
        int v86 = 134285825;
        double v87 = v49;
        __int16 v88 = 2049;
        double v89 = v76;
        __int16 v90 = 2049;
        double v91 = v55;
        __int16 v92 = 2049;
        double v93 = v75;
        __int16 v94 = 2049;
        double v95 = v69;
        __int16 v96 = 2049;
        double v97 = v74;
        __int16 v98 = 1026;
        BOOL v99 = v60 != v61;
        __int16 v100 = 1025;
        int v101 = v50;
        __int16 v102 = 1026;
        int v103 = v70;
        __int16 v104 = 1026;
        int v105 = v50 ^ 1;
        unsigned int v71 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "VO2MaxRetrocomputeHistory data checks: prevAlgSampleInterval,%{private}f,minPrevAlgSampleInterva l,%{private}f,estimatesUpdatedRatio,%{private}f,minEstimatesUpdatedRatio,%{private}f,meanDelta,% {private}f,minMeanDelta,%{private}f,badStagingDataExists,%{public}d,failedDataCheck,%{private}d, oldRetrocomputeStatus,%{public}d,newRetrocomputeStatus,%{public}d",  &v86,  86);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]",  "%s\n",  v71);
        if (v71 != buf) {
          free(v71);
        }
      }

      if (a3->var3 == 1) {
        char v65 = 1;
      }
      else {
        char v65 = v50;
      }
      if ((v65 & 1) == 0) {
        a3->var20 = CFAbsoluteTimeGetCurrent();
      }
      a3->int var3 = v50 ^ 1;
      sub_10058BF4C((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
      if (__p)
      {
        __int16 v78 = (double *)__p;
        operator delete(__p);
      }

      unsigned int v43 = 0;
    }

    else
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      __int128 v44 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Unable to check for bad staging data due to device lock",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        LOWORD(v86) = 0;
        __int16 v68 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to check for bad staging data due to device lock",  &v86,  2);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]",  "%s\n",  v68);
        if (v68 != buf) {
          free(v68);
        }
      }

      unsigned int v43 = 2;
    }

    *(void *)buf = &v80;
    sub_100306FF0((void ***)buf);
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    unsigned int v42 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Unable to query for staging output due to device lock",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v86) = 0;
      unsigned int v67 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to query for staging output due to device lock",  &v86,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v67);
      if (v67 != buf) {
        free(v67);
      }
    }

    unsigned int v43 = 2;
  }

  *(void *)buf = &v83;
  sub_100306FF0((void ***)buf);
  return v43;
}

- (void)triggerRetrocomputeWithReply:(id)a3
{
  self->fTriggerRetrocomputeInProgress = 1;
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrocompute triggered", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v29[0]) = 0;
    __int128 v18 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Retrocompute triggered",  v29,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v18);
  }

  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:]( self,  "updateRetrocomputeStatus:unavailableReasons:",  2LL,  0LL);
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100307030((uint64_t *)&self->fPendingHealthKitWrites);
  uint64_t v6 = sub_100E3F274((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t *)&self->fPendingHealthKitWrites, 0.0);
  if ((_DWORD)v6 != 100)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v16 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to query for staging output: %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v29[0] = 67109120;
      v29[1] = v6;
      uint64_t v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unable to query for staging output: %d",  v29);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v19);
    }

    -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:]( self,  "updateRetrocomputeStatus:unavailableReasons:",  1LL,  0LL);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
    goto LABEL_22;
  }

  (*((void (**)(id, uint64_t))a3 + 2))(a3, 100LL);
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v17 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No staging data found", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v29[0]) = 0;
      LODWORD(v21) = 2;
      __int128 v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "No staging data found",  v29,  v21);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v20);
    }

    -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:]( self,  "updateRetrocomputeStatus:unavailableReasons:",  3LL,  0LL);
    sub_1001B5E8C((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
LABEL_22:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_26;
  }

  v23[0] = *(_OWORD *)end[-1].var1;
  __int128 v8 = *(_OWORD *)&end[-1].var2;
  __int128 v9 = *(_OWORD *)&end[-1].var4;
  __int128 v10 = *(_OWORD *)end[-1].var8;
  v23[3] = *(_OWORD *)&end[-1].var6;
  v23[4] = v10;
  v23[1] = v8;
  v23[2] = v9;
  __int128 v11 = *(_OWORD *)&end[-1].var9;
  __int128 v12 = *(_OWORD *)&end[-1].var11;
  __int128 v13 = *(_OWORD *)&end[-1].var17;
  v23[7] = *(_OWORD *)&end[-1].var15;
  v23[8] = v13;
  v23[5] = v11;
  v23[6] = v12;
  uint64_t v14 = *(void *)&end[-1].var20;
  char v25 = end[-1].var21.__r_.__value_.var0.var0.__data_[0];
  uint64_t v24 = v14;
  if (*((char *)&end[-1].var21.__r_.var1 + 3) < 0)
  {
    sub_1010DD48C( &__p,  (void *)end[-1].var21.__r_.__value_.var0.var1.__size_,  *((void *)&end[-1].var21.__r_.__value_.var0.var1 + 2));
  }

  else
  {
    __int128 v15 = *(_OWORD *)&end[-1].var21.__r_.__value_.var0.var1.__size_;
    uint64_t v27 = *(void *)&end[-1].var21.__r_.var0;
    __int128 __p = v15;
  }

  int64_t var0 = end[-1].var21.var0;
  -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v23, 0LL);
  if (SHIBYTE(v27) < 0) {
    operator delete((void *)__p);
  }
LABEL_26:
  sub_1001BA1BC(v22);
}

- (void)onRetrocomputeHealthKitSampleSavedWithStartTime:(double)a3 activity:(id)a4
{
  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ != end && end[-1].var3 == a3)
  {
    if (!-[CLVO2MaxService updateRetrocomputeLastTimestampToHealthKit:]( self,  "updateRetrocomputeLastTimestampToHealthKit:",  a3))
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      __int128 v13 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134283521;
        double v41 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to update retrocompute history record with lastTimestampToHealthKit (%{private}f). Will attempt to proc eed with remaining HealthKit writes.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        int v34 = 134283521;
        double v35 = a3;
        uint64_t v27 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Failed to update retrocompute history record with lastTimestampToHealthKit (%{private}f). Will a ttempt to proceed with remaining HealthKit writes.",  &v34,  12);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]",  "%s\n",  v27);
      }
    }

    self->fUpdateRetrocomputedDataAttempts = 0;
    uint64_t v14 = p_fPendingHealthKitWrites->__end_;
    p_fPendingHealthKitWrites->__end_ = (VO2MaxStagingOutput *)((char *)v14 - 192);
    if (p_fPendingHealthKitWrites->__begin_ == (VO2MaxStagingOutput *)v14[-1].var1)
    {
      -[CLVO2MaxService promoteStagingData:](self, "promoteStagingData:", a4);
    }

    else
    {
      v28[0] = *(_OWORD *)&v14[-2].var1[8];
      __int128 v15 = *(_OWORD *)&v14[-2].var3;
      __int128 v16 = *(_OWORD *)&v14[-2].var5;
      __int128 v17 = *(_OWORD *)&v14[-2].var8[8];
      v28[3] = *(_OWORD *)&v14[-2].var7;
      v28[4] = v17;
      v28[1] = v15;
      v28[2] = v16;
      __int128 v18 = *(_OWORD *)&v14[-2].var10;
      __int128 v19 = *(_OWORD *)&v14[-2].var14;
      __int128 v20 = *(_OWORD *)&v14[-2].var18;
      v28[7] = *(_OWORD *)&v14[-2].var16;
      v28[8] = v20;
      v28[5] = v18;
      v28[6] = v19;
      data = v14[-2].var21.__r_.__value_.var0.var1.__data_;
      char v30 = v14[-2].var21.__r_.__value_.var0.var0.__data_[8];
      __int128 v29 = data;
      if (SHIBYTE(v14[-2].var21.var0) < 0)
      {
        sub_1010DD48C(&__p, *((void **)&v14[-2].var21.__r_.__value_.var0.var1 + 2), *(void *)&v14[-2].var21.__r_.var0);
      }

      else
      {
        __int128 v22 = *((_OWORD *)&v14[-2].var21.__r_.__value_.var0.var1 + 1);
        int64_t var0 = v14[-2].var21.var0;
        __int128 __p = v22;
      }

      unint64_t v33 = v14[-1].var0;
      -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v28, a4);
      if (SHIBYTE(var0) < 0) {
        operator delete((void *)__p);
      }
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v9 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      __int128 v10 = p_fPendingHealthKitWrites->__end_;
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v10 == p_fPendingHealthKitWrites->__begin_) {
        double var3 = 0.0;
      }
      else {
        double var3 = v10[-1].var3;
      }
      *(_DWORD *)buf = 134349569;
      double v41 = *(double *)&v11;
      __int16 v42 = 2049;
      double v43 = a3;
      __int16 v44 = 2049;
      double v45 = var3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Will retry retrocompute trigger due to unexpected state. fPendingHealthKitWrites count: %{public}lu, expected sa mple startTime: %{private}f, actual sample startTime: %{private}f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      double v23 = p_fPendingHealthKitWrites->__end_;
      unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v23 == p_fPendingHealthKitWrites->__begin_) {
        double v25 = 0.0;
      }
      else {
        double v25 = v23[-1].var3;
      }
      int v34 = 134349569;
      double v35 = *(double *)&v24;
      __int16 v36 = 2049;
      double v37 = a3;
      __int16 v38 = 2049;
      double v39 = v25;
      double v26 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Will retry retrocompute trigger due to unexpected state. fPendingHealthKitWrites count: %{public}l u, expected sample startTime: %{private}f, actual sample startTime: %{private}f",  &v34,  32);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]",  "%s\n",  v26);
    }

    if (a4) {
      -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a4);
    }
    else {
      -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
    }
  }

- (void)onRetrocomputeHealthKitSampleFailed:(id)a3
{
  if (a3) {
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:");
  }
  else {
    -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
  }
}

- (void)promoteStagingData:(id)a3
{
  int v5 = sub_100E3F270(self->fStagingOutputStore.__ptr_.__value_, a2);
  if (v5 != 100)
  {
    int v6 = v5;
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not promote staging data: %d", buf, 8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v9[0] = 67109120;
      v9[1] = v6;
      __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Could not promote staging data: %d",  v9);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService promoteStagingData:]", "%s\n", v8);
    }

    if (!a3)
    {
      -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
      return;
    }

- (void)retryTriggerRetrocompute
{
  self->fTriggerRetrocomputeInProgress = 1;
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  unsigned __int8 v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    __int128 v10 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up %{public}s activity", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v7 = 136446210;
    __int128 v8 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    int v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Setting up %{public}s activity",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService retryTriggerRetrocompute]", "%s\n", v5);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100302BC8;
  handler[3] = &unk_101831AF8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLVO2MaxService");
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger", v4, handler);
  xpc_release(v4);
}

- (void)onRetryTriggerRetrocompute:(id)a3
{
  if (!a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Invalid xpc activity.");
LABEL_22:
    __int128 v10 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService onRetryTriggerRetrocompute:]", "%s\n", v8);
    if (v10 != buf) {
      free(v10);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    -[CLVO2MaxService handleRetryTriggerRetrocompute:](self, "handleRetryTriggerRetrocompute:", a3);
    return;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  __int128 v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unexpected activity state: %ld",  &v11);
    goto LABEL_22;
  }

- (void)handleRetryTriggerRetrocompute:(id)a3
{
  v29[0] = 0LL;
  v29[1] = 0LL;
  int v30 = 3;
  v35[4] = 0.0;
  __int128 v31 = 0u;
  memset(v32, 0, sizeof(v32));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(v35, 0, 28);
  if (self->fUpdateRetrocomputedDataSuccess)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Retrying retrocompute trigger already succeeded, cancelling activity",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_7;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v21) = 0;
    xpc_activity_state_t v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Retrying retrocompute trigger already succeeded, cancelling activity",  &v21,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v13);
    goto LABEL_51;
  }

  if (sub_10058C240((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v29) == 109)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    xpc_activity_state_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Unable to query for retrocompute history due to device lock",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v21) = 0;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unable to query for retrocompute history due to device lock",  &v21,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v14);
    goto LABEL_55;
  }

  if ((_DWORD)v31 != 2)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      int v26 = v31;
      __int16 v27 = 1026;
      int v28 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Will not attempt to retry retrocompute trigger, status: %{public}d, algVersion: %{public}d",  buf,  0xEu);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_7;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v21 = 67240448;
    int v22 = v31;
    __int16 v23 = 1026;
    int v24 = v30;
    xpc_activity_state_t v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Will not attempt to retry retrocompute trigger, status: %{public}d, algVersion: %{public}d",  &v21,  14);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v13);
LABEL_51:
    free(v13);
LABEL_7:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
LABEL_8:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_9;
  }

  if (self->fUpdateRetrocomputedDataAttempts >= 3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Giving up attempting to retry retrocompute trigger",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      LOWORD(v21) = 0;
      __int128 v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Giving up attempting to retry retrocompute trigger",  &v21,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v15);
    }

    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
    if (v35[0] == 0.0) {
      -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:]( self,  "updateRetrocomputeStatus:unavailableReasons:",  1LL,  0LL,  v35[0]);
    }
    goto LABEL_8;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  __int128 v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrying retrocompute trigger", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v21) = 0;
    __int128 v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Retrying retrocompute trigger",  &v21,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v16);
  }

  ++self->fUpdateRetrocomputedDataAttempts;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100307030((uint64_t *)&self->fPendingHealthKitWrites);
  int v10 = sub_100E3F274( (uint64_t)self->fStagingOutputStore.__ptr_.__value_,  (uint64_t *)&self->fPendingHealthKitWrites,  v35[0]);
  if (v10 != 100)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v12 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to query for staging output: %d",  buf,  8u);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v21 = 67109120;
    int v22 = v10;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unable to query for staging output: %d",  &v21);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v14);
LABEL_55:
    free(v14);
LABEL_16:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    goto LABEL_9;
  }

  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    -[CLVO2MaxService promoteStagingData:](self, "promoteStagingData:", a3);
  }

  else
  {
    sub_100301B2C((uint64_t)v18, (uint64_t)end[-1].var1);
    -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v18, a3);
    if (v20 < 0) {
      operator delete(__p);
    }
  }

- (void)deleteHealthKitSamples:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  int v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Attempting to delete samples without estimates in HKHealthStore",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v16) = 0;
    __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Attempting to delete samples without estimates in HKHealthStore",  &v16,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v8);
  }

  __int128 v16 = 0LL;
  __int128 v17 = 0LL;
  uint64_t v18 = 0LL;
  if (sub_100E3F568((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (char **)&v16) == 100)
  {
    if (v16 == v17)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      int v7 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "No sessions to delete from HKHealthStore",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_101831B18);
        }
        v15[0] = 0;
        LODWORD(v11) = 2;
        int v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "No sessions to delete from HKHealthStore",  v15,  v11);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v10);
      }
    }

    else
    {
      __int128 __p = 0LL;
      xpc_activity_state_t v13 = 0LL;
      uint64_t v14 = 0LL;
      sub_1002C0E60(&__p, v16, (uint64_t)v17, (v17 - (_BYTE *)v16) >> 5);
      -[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:]( self,  "deleteSessionsFromHealthKit:withRetry:",  &__p,  v3);
      if (__p)
      {
        xpc_activity_state_t v13 = __p;
        operator delete(__p);
      }
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    xpc_activity_state_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Unable to fetch sessions without estimates",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      v15[0] = 0;
      LODWORD(v11) = 2;
      __int128 v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Unable to fetch sessions without estimates",  v15,  v11);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v9);
    }

    if (v3) {
      -[CLVO2MaxService retryHealthKitDeleteSamples](self, "retryHealthKitDeleteSamples");
    }
  }

  if (v16)
  {
    __int128 v17 = v16;
    operator delete(v16);
  }

- (void)retryHealthKitDeleteSamples
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  BOOL v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Setting up activity to attempt deleting sessions without estimates from HKHealthStore",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    v7[0] = 0;
    int v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Setting up activity to attempt deleting sessions without estimates from HKHealthStore",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService retryHealthKitDeleteSamples]", "%s\n", v5);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 30LL);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1003041EC;
  handler[3] = &unk_101831AF8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLVO2MaxService");
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete", v4, handler);
  xpc_release(v4);
}

- (void)onRetryHealthKitDeleteSamples:(id)a3
{
  if (!a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v1sub_100222B94(v17, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0) = 0;
    __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Invalid xpc activity.",  &v10,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService onRetryHealthKitDeleteSamples:]", "%s\n", v8);
LABEL_22:
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    sub_100222B94(buf, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
    -[CLVO2MaxService handleRetryHealthKitDeleteSamples:](self, "handleRetryHealthKitDeleteSamples:", a3);
    sub_1001BA1BC((id *)buf);
    return;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  __int128 v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v10 = 134217984;
    xpc_activity_state_t v11 = v6;
    __int128 v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unexpected activity state: %ld",  &v10);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxService onRetryHealthKitDeleteSamples:]", "%s\n", v8);
    goto LABEL_22;
  }

- (void)handleRetryHealthKitDeleteSamples:(id)a3
{
  if (self->fDeleteHealthKitSamplesSuccess)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    int v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "HealthKit samples without an estimate have been deleted, cancelling activity",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_22;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v11[0]) = 0;
    xpc_activity_state_t v6 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "HealthKit samples without an estimate have been deleted, cancelling activity",  v11,  2,  v11[0]);
LABEL_30:
    int v10 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v6);
    if (v10 != buf) {
      free(v10);
    }
LABEL_22:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
    return;
  }

  if (self->fDeleteHealthKitSamplesAttempts > 2)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int128 v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Giving up attempting to delete HealthKit samples without an estimate",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_22;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v11[0]) = 0;
    xpc_activity_state_t v6 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Giving up attempting to delete HealthKit samples without an estimate",  v11,  2,  v11[0]);
    goto LABEL_30;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_101831B18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Attempting to retry deleting HealthKit samples without an estimate",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    LOWORD(v11[0]) = 0;
    __int128 v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "Attempting to retry deleting HealthKit samples without an estimate",  v11,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v9);
  }

  ++self->fDeleteHealthKitSamplesAttempts;
  -[CLVO2MaxService deleteHealthKitSamples:](self, "deleteHealthKitSamples:", 0LL);
  -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
}

- (void)updateRetrocomputeStatus:(int)a3 unavailableReasons:(unsigned int)a4
{
  v25[0] = 0LL;
  v25[1] = 0LL;
  int v26 = 3;
  uint64_t v32 = 0LL;
  __int128 v27 = 0u;
  memset(v28, 0, sizeof(v28));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  memset(v31, 0, 28);
  if (sub_10058C240((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v25) == 100)
  {
    int v7 = v27;
    LODWORD(v27) = a3;
    DWORD2(v31[1]) = a4;
    sub_10058BF4C((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v25, v25[0]);
    if (v7 != a3)
    {
      __int128 v8 = objc_alloc(&OBJC_CLASS___NSDate);
      __int128 v9 =  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v8,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)((char *)&v27 + 4));
      int v10 = objc_alloc(&OBJC_CLASS___NSDate);
      xpc_activity_state_t v11 =  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v10,  "initWithTimeIntervalSinceReferenceDate:",  *(double *)&v28[1]);
      __int128 v12 = objc_alloc(&OBJC_CLASS___NSNumber);
      xpc_activity_state_t v13 = -[NSNumber initWithDouble:](v12, "initWithDouble:", *(double *)&v29);
      id v14 =  [[CMVO2MaxRetrocomputeState alloc] initWithStatus:(int)v27 startDate:v9 endDate:v11 meanDelta:v13];
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v15 = -[CLVO2MaxService retrocomputeStatusClients](self, "retrocomputeStatusClients", 0LL);
      id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          __int128 v19 = 0LL;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) onRetrocomputeStatusUpdate:v14];
            __int128 v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        }

        while (v17);
      }

      if (a3 == 3) {
        objc_msgSend( objc_msgSend( objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLVO2MaxCloudKitManager"),  "saveRetrocomputedOutputs");
      }
    }
  }

- (BOOL)updateRetrocomputeLastTimestampToHealthKit:(double)a3
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  int v7 = 3;
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  memset(v9, 0, 28);
  memset(&v9[44], 0, 60);
  *(double *)&v9[76] = a3;
  return sub_10058BF4C((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v6, v6[0]);
}

- (BOOL)validateBodyMetrics
{
  p_fOriginalBodyMetrics = &self->fOriginalBodyMetrics;
  p_fUserInfo = &self->fUserInfo;
  if (self->fOriginalBodyMetrics.biologicalSex == self->fUserInfo.biologicalSex
    && vabds_f32(self->fOriginalBodyMetrics.age, self->fUserInfo.age) <= 3.0
    && vabds_f32(self->fOriginalBodyMetrics.heightM, self->fUserInfo.heightM) <= 0.0254
    && vabds_f32(self->fOriginalBodyMetrics.weightKG, self->fUserInfo.weightKG) <= 9.08)
  {
    LOBYTE(v13) = 1;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    xpc_object_t v4 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      int biologicalSex = p_fUserInfo->biologicalSex;
      double age = p_fUserInfo->age;
      double heightM = p_fUserInfo->heightM;
      double weightKG = p_fUserInfo->weightKG;
      int v9 = p_fOriginalBodyMetrics->biologicalSex;
      double v10 = p_fOriginalBodyMetrics->age;
      double v11 = p_fOriginalBodyMetrics->heightM;
      double v12 = p_fOriginalBodyMetrics->weightKG;
      *(_DWORD *)buf = 67176449;
      int v40 = biologicalSex;
      __int16 v41 = 2049;
      double v42 = age;
      __int16 v43 = 2049;
      double v44 = heightM;
      __int16 v45 = 2049;
      double v46 = weightKG;
      __int16 v47 = 1025;
      int v48 = v9;
      __int16 v49 = 2049;
      double v50 = v10;
      __int16 v51 = 2049;
      double v52 = v11;
      __int16 v53 = 2049;
      double v54 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Significant change in BodyMetrics during pre-processing. Original values -- biologicalSex: %{private}d, age: %{p rivate}f, height: %{private}f, weight: %{private}f\n \n Current values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f",  buf,  0x4Au);
    }

    BOOL v13 = sub_1002921D0(115, 2);
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      int v14 = p_fUserInfo->biologicalSex;
      double v15 = p_fUserInfo->age;
      double v16 = p_fUserInfo->heightM;
      double v17 = p_fUserInfo->weightKG;
      int v18 = p_fOriginalBodyMetrics->biologicalSex;
      double v19 = p_fOriginalBodyMetrics->age;
      double v20 = p_fOriginalBodyMetrics->heightM;
      double v21 = p_fOriginalBodyMetrics->weightKG;
      v24[0] = 67176449;
      v24[1] = v14;
      __int16 v25 = 2049;
      double v26 = v15;
      __int16 v27 = 2049;
      double v28 = v16;
      __int16 v29 = 2049;
      double v30 = v17;
      __int16 v31 = 1025;
      int v32 = v18;
      __int16 v33 = 2049;
      double v34 = v19;
      __int16 v35 = 2049;
      double v36 = v20;
      __int16 v37 = 2049;
      double v38 = v21;
      __int128 v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Significant change in BodyMetrics during pre-processing. Original values -- biologicalSex: %{priva te}d, age: %{private}f, height: %{private}f, weight: %{private}f\n \n Current values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f",  v24,  74);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService validateBodyMetrics]", "%s\n", v22);
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    p_fUserInfo = &self->fUserInfo;
    __int128 v9 = *((_OWORD *)a4 + 1);
    __int128 v8 = *((_OWORD *)a4 + 2);
    __int128 v10 = *(_OWORD *)a4;
    *(_OWORD *)&p_fUserInfo->runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&p_fUserInfo->vo2max = v9;
    *(_OWORD *)&p_fUserInfo->hronset = v8;
    *(_OWORD *)&p_fUserInfo->gender = v10;
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    double v11 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isAgeSet = p_fUserInfo->_isAgeSet;
      double age = p_fUserInfo->age;
      int biologicalSex = p_fUserInfo->biologicalSex;
      BOOL isHeightSet = p_fUserInfo->_isHeightSet;
      double heightM = p_fUserInfo->heightM;
      BOOL isWeightSet = p_fUserInfo->_isWeightSet;
      double weightKG = p_fUserInfo->weightKG;
      *(_DWORD *)buf = 67241729;
      int v35 = isAgeSet;
      __int16 v36 = 2049;
      double v37 = age;
      __int16 v38 = 1025;
      int v39 = biologicalSex;
      __int16 v40 = 1026;
      BOOL v41 = isHeightSet;
      __int16 v42 = 2049;
      double v43 = heightM;
      __int16 v44 = 1026;
      BOOL v45 = isWeightSet;
      __int16 v46 = 2049;
      double v47 = weightKG;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CLVO2MaxService: Received user info update. IsAgeSet,%{public}d,Age,%{private}f,BiologicalSex,%{private}d,IsHeig htSet,%{public}d,Height,%{private}f,IsWeightSet,%{public}d,Weight,%{private}f",  buf,  0x38u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      BOOL v19 = p_fUserInfo->_isAgeSet;
      double v20 = p_fUserInfo->age;
      int v21 = p_fUserInfo->biologicalSex;
      BOOL v22 = p_fUserInfo->_isHeightSet;
      double v23 = p_fUserInfo->heightM;
      BOOL v24 = p_fUserInfo->_isWeightSet;
      double v25 = p_fUserInfo->weightKG;
      LODWORD(v3sub_100222B94(v17, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0) = 67241729;
      HIDWORD(v3sub_100222B94(v17, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0) = v19;
      LOWORD(v31) = 2049;
      *(double *)((char *)&v31 + 2) = v20;
      WORD5(v31) = 1025;
      HIDWORD(v31) = v21;
      LOWORD(v32) = 1026;
      *(_DWORD *)((char *)&v32 + 2) = v22;
      HIWORD(v32) = 2049;
      LOWORD(v33) = 1026;
      *(_DWORD *)((char *)&v33 + 2) = v24;
      HIWORD(v33) = 2049;
      double v26 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "CLVO2MaxService: Received user info update. IsAgeSet,%{public}d,Age,%{private}f,BiologicalSe x,%{private}d,IsHeightSet,%{public}d,Height,%{private}f,IsWeightSet,%{public}d,Weight,%{private}f",  &v30,  56,  v30,  v31,  v32,  *(void *)&v23,  v33,  *(void *)&v25);
LABEL_19:
      __int16 v29 = (uint8_t *)v26;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxService onUserInfoUpdate:data:]", "%s\n", v26);
      if (v29 != buf) {
        free(v29);
      }
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_101831B18);
    }
    __int16 v27 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = *a3;
      *(_DWORD *)buf = 67109120;
      int v35 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#Warning Unhandled notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_101831B18);
      }
      double v26 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "#Warning Unhandled notification type, %d",  &v30);
      goto LABEL_19;
    }
  }

- (NSMutableSet)retrocomputeStatusClients
{
  return self->_retrocomputeStatusClients;
}

- (void)setRetrocomputeStatusClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  sub_100306FF0((void ***)&p_fPendingHealthKitWrites);
  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  sub_10000AE14((uint64_t)&self->fVO2MaxSummaryRecorderDb);
  sub_10000AE14((uint64_t)&self->fVO2MaxOutputRecorderDb);
  sub_10000AE14((uint64_t)&self->fVO2MaxSessionAttributesDb);
  xpc_object_t v4 = self->fRetrocomputeBodyMetricsDb.__ptr_.__value_;
  self->fRetrocomputeBodyMetricsDb.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(CLVO2MaxRetrocomputeBodyMetricsDb *))(*(void *)v4 + 24LL))(v4);
  }
  int v5 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *))(*(void *)v5 + 24LL))(v5);
  }
  xpc_activity_state_t v6 = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = 0LL;
  if (v6) {
    sub_10028EBB0((uint64_t)&self->fStagingOutputStore, (uint64_t)v6);
  }
  sub_10000AE14((uint64_t)&self->fInputStore);
  sub_10000AE14((uint64_t)&self->fInputCache);
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
  *((void *)self + 1sub_100222B94(v17, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 17) = 0LL;
  *((void *)self + 34) = 0LL;
  *((void *)self + 35) = 0LL;
  *((void *)self + 33) = 0LL;
  return self;
}

@end