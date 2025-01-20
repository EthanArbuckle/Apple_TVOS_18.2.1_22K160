@interface CLVO2MaxCloudKitManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldKeepLocalDataOnAccountChange;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CLVO2MaxCloudKitManager)init;
- (VO2MaxCloudKitSyncEngineMetadata)getCKSyncEngineMetadata;
- (id).cxx_construct;
- (id)createCKRecordForInput:(id)a3;
- (id)createCKRecordForOutput:(id)a3;
- (id)getSystemFieldsFromCKRecord:(id)a3;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)addRecordIDsForSessionId:(id)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5;
- (void)beginService;
- (void)bulkUploadRecordIDsShouldReupload:(BOOL)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5 shouldThrottle:(BOOL)a6;
- (void)checkForDeletionOfVO2MaxData:(int)a3;
- (void)cloudKitAccountDidChange:(id)a3;
- (void)createVO2MaxInputZone;
- (void)createVO2MaxOutputZone;
- (void)deleteCloudKitRecords;
- (void)deleteLocalVO2MaxData;
- (void)deleteZone:(id)a3;
- (void)endService;
- (void)handleFetchedInputRecord:(id)a3;
- (void)handleFetchedOutputRecord:(id)a3;
- (void)handleServerRecordChanged:(id)a3;
- (void)handleSyncUpload:(id)a3;
- (void)handleUnknownItem:(id)a3;
- (void)handleZoneDeleted:(id)a3;
- (void)handleZoneNotFound:(id)a3;
- (void)handleZonePurge:(id)a3;
- (void)initializeSyncEngine;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)resetDailyStats;
- (void)resetSyncActivity:(id)a3 withDelay:(int64_t)a4;
- (void)saveInputsAndOutputsForSessionId:(id)a3;
- (void)saveRetrocomputedOutputs;
- (void)setUpSyncActivity;
- (void)setUserRecordIDName:(id)a3;
- (void)stopSyncing:(BOOL)a3;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
- (void)updateDeviceUnlocked:(BOOL)a3;
- (void)updateInputSystemFields:(id)a3 inputRecord:(id)a4;
- (void)updateOutputSystemFields:(id)a3 outputRecord:(id)a4;
- (void)validateAccount;
@end

@implementation CLVO2MaxCloudKitManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993F60 != -1) {
    dispatch_once(&qword_101993F60, &stru_10182DE48);
  }
  return (id)qword_101993F58;
}

- (CLVO2MaxCloudKitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLVO2MaxCloudKitManager;
  return -[CLVO2MaxCloudKitManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLVO2MaxCloudKitManagerProtocol,  &OBJC_PROTOCOL___CLVO2MaxCloudKitManagerClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_101993F70 != -1) {
    dispatch_once(&qword_101993F70, &stru_10182DE68);
  }
  return byte_101993F68;
}

- (void)beginService
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  objc_super v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxCloudKitManager", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LOWORD(v45) = 0;
    LODWORD(v44) = 2;
    v39 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Starting up CLVO2MaxCloudKitManager",  &v45,  v44);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager beginService]", "%s\n", v39);
  }

  self->_syncEngine = 0LL;
  self->fDeviceUnlocked = 0;
  HIBYTE(v44) = 0;
  sub_10028E878((unsigned __int8 *)&v44 + 7, buf);
  sub_10005F550((uint64_t)&self->fInputCache, (__int128 *)buf);
  v4 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    unint64_t v5 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  sub_10028E968((uint64_t *)&self->fInputCache, buf);
  sub_10005F550((uint64_t)&self->fInputStore, (__int128 *)buf);
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

  v10 = (CLVO2MaxStagingOutputStore *)operator new(0x6D0uLL);
  sub_100E3F200((uint64_t)v10, 0LL);
  *(void *)buf = 0LL;
  value = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = v10;
  if (value)
  {
    sub_10028EBB0((uint64_t)&self->fStagingOutputStore, (uint64_t)value);
    uint64_t v12 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v12) {
      sub_10028EBB0((uint64_t)buf, v12);
    }
  }

  v13 = (CLVO2MaxRetrocomputeRecorderDb *)operator new(0x1F8uLL);
  sub_10058BF10(v13, 0LL);
  v14 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = v13;
  if (v14) {
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *))(*(void *)v14 + 24LL))(v14);
  }
  sub_1004F2598();
  self->fFetchChangesForInputZone = sub_1004F7000();
  self->fOutputZoneID = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"VO2MaxOutputZone",  CKCurrentUserDefaultName);
  self->fInputZoneID = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"VO2MaxInputZone",  CKCurrentUserDefaultName);
  p_fMaxSessionsForUploadThrottling = &self->fMaxSessionsForUploadThrottling;
  self->fMaxSessionsForUploadThrottling = 50;
  uint64_t v16 = sub_1006E27E8();
  sub_100413284(v16, buf);
  int v17 = sub_1002A7CB0(*(uint64_t *)buf, "VO2MaxCloudKitMaxSessionsForUpload", &self->fMaxSessionsForUploadThrottling);
  int v18 = v17;
  v19 = *(std::__shared_weak_count **)&buf[8];
  if (!*(void *)&buf[8]) {
    goto LABEL_25;
  }
  v20 = (unint64_t *)(*(void *)&buf[8] + 8LL);
  do
    unint64_t v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (!v18) {
      goto LABEL_31;
    }
  }

  else
  {
LABEL_25:
    if (!v17) {
      goto LABEL_31;
    }
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  v22 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = *p_fMaxSessionsForUploadThrottling;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Max sessions for each CloudKit upload: %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v40 = *p_fMaxSessionsForUploadThrottling;
    int v45 = 67240192;
    LODWORD(v46) = v40;
    LODWORD(v44) = 8;
    v41 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Max sessions for each CloudKit upload: %{public}d",  &v45,  v44);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager beginService]", "%s\n", v41);
  }

- (void)endService
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  objc_super v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxCloudKitManager", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    v7[0] = 0;
    unint64_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Shutting down CLVO2MaxCloudKitManager",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager endService]", "%s\n", v6);
  }

  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  CKAccountChangedNotification,  0LL);
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  unint64_t v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5) {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:6];
  }

  self->_syncEngine = 0LL;
  self->_container = 0LL;
}

- (void)saveInputsAndOutputsForSessionId:(id)a3
{
  unint64_t v5 = objc_autoreleasePoolPush();
  -[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]( self,  "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:",  a3,  1LL,  1LL);
  objc_autoreleasePoolPop(v5);
}

- (void)saveRetrocomputedOutputs
{
  if (self->_syncEngine)
  {
    *(void *)buf = 0LL;
    v10 = 0LL;
    uint64_t v11 = 0LL;
    sub_100E3F224((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (char **)buf);
    *(void *)uu1 = 0LL;
    uint64_t v13 = 0LL;
    objc_super v3 = *(unsigned __int8 **)buf;
    v4 = v10;
    if (*(unsigned __int8 **)buf != v10)
    {
      do
      {
        unint64_t v5 = objc_autoreleasePoolPush();
        if (uuid_compare(uu1, v3 + 24))
        {
          uuid_copy(uu1, v3 + 24);
          -[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]( self,  "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:",  -[NSUUID UUIDString]( -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v3 + 24),  "UUIDString"),  1LL,  0LL);
        }

        objc_autoreleasePoolPop(v5);
        v3 += 184;
      }

      while (v3 != v4);
      objc_super v3 = *(unsigned __int8 **)buf;
    }

    if (v3)
    {
      v10 = v3;
      operator delete(v3);
    }
  }

  else
  {
    uint64_t v6 = sub_100D74AD8();
    if (!sub_100D763A4(v6))
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      v7 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Attempt to save retrocomputed outputs to CloudKit failed",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        *(_WORD *)uu1 = 0;
        v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Attempt to save retrocomputed outputs to CloudKit failed",  uu1,  2);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager saveRetrocomputedOutputs]", "%s\n", v8);
      }
    }
  }

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (!*a3) {
    -[CLVO2MaxCloudKitManager updateDeviceUnlocked:](self, "updateDeviceUnlocked:", *(_DWORD *)a4 == 1);
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 6)
  {
    -[CLVO2MaxCloudKitManager handleWatchAppFitnessTrackingUpdate:]( self,  "handleWatchAppFitnessTrackingUpdate:",  *(_DWORD *)a4);
  }

  else if (*a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_FAULT))
    {
      int v8 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "[CKManager] #Warning: Unhandled FitnessTracking notification type, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v9 = *a3;
      v11[0] = 67109120;
      v11[1] = v9;
      v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  17LL,  "[CKManager] #Warning: Unhandled FitnessTracking notification type, %d",  v11);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager onFitnessTrackingNotification:data:]",  "%s\n",  v10);
    }
  }

  else
  {
    -[CLVO2MaxCloudKitManager handleFitnessTrackingEnabled:](self, "handleFitnessTrackingEnabled:", *(_BYTE *)a4 & 1);
  }

- (void)setUpSyncActivity
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1006E27E8();
  sub_100413284(v4, &v18);
  double v17 = 0.0;
  sub_1002A82BC(v18, "VO2MaxCloudKitManagerNextActivityTime", &v17);
  double v5 = v17;
  if (v17 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "VO2MaxCloudKitManagerNextActivityTime";
      __int16 v29 = 2050;
      double v30 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v21 = 136446466;
      v22 = "VO2MaxCloudKitManagerNextActivityTime";
      __int16 v23 = 2050;
      double v24 = v17;
      v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "%{public}s is too far in the future (%{public}.2f). Resetting!",  &v21,  22);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v14);
    }

    sub_1002A667C(v18, "VO2MaxCloudKitManagerNextActivityTime", 0xFFFFFFFFLL);
    double v17 = 0.0;
    double v5 = 0.0;
  }

  double v7 = v5 - Current;
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "com.apple.vo2max.CloudKitManager";
    __int16 v29 = 2050;
    double v30 = v17;
    __int16 v31 = 2050;
    int64_t v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v21 = 136446722;
    v22 = "com.apple.vo2max.CloudKitManager";
    __int16 v23 = 2050;
    double v24 = v17;
    __int16 v25 = 2050;
    int64_t v26 = v8;
    LODWORD(v15) = 32;
    int v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)",  &v21,  v15);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v13);
  }

  xpc_activity_unregister("com.apple.vo2max.CloudKitManager");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002841C0;
  handler[3] = &unk_1018268C8;
  handler[4] = objc_msgSend( objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLVO2MaxCloudKitManager");
  handler[5] = v8;
  xpc_activity_register("com.apple.vo2max.CloudKitManager", XPC_ACTIVITY_CHECK_IN, handler);
  v10 = v19;
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

  sub_1001BA1BC(v20);
}

- (void)resetSyncActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v19 = v6;
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  double v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "VO2MaxCloudKitManagerNextActivityTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Resetting next activity time to: %{public}.1f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v20 = 136446466;
    int v21 = "VO2MaxCloudKitManagerNextActivityTime";
    __int16 v22 = 2050;
    double v23 = v6;
    v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "%{public}s: Resetting next activity time to: %{public}.1f",  &v20,  22);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v14);
    if (v14 != buf) {
      free(v14);
    }
  }

  uint64_t v8 = sub_1006E27E8();
  sub_100413284(v8, buf);
  sub_1002AC7B8(*(uint64_t *)buf, "VO2MaxCloudKitManagerNextActivityTime", &v19);
  int v9 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v10 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    unint64_t v12 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = state;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Failed to mark activity as Done. Current state is %{public}ld",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v15 = qword_1019346E8;
      xpc_activity_state_t v16 = xpc_activity_get_state((xpc_activity_t)a3);
      int v20 = 134349056;
      int v21 = (const char *)v16;
      LODWORD(v18) = 12;
      double v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  17LL,  "Failed to mark activity as Done. Current state is %{public}ld",  &v20,  v18);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v17);
      if (v17 != buf) {
        free(v17);
      }
    }
  }

  -[CLVO2MaxCloudKitManager setUpSyncActivity](self, "setUpSyncActivity");
}

- (void)onSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    double v7 = (os_log_s *)qword_1019346E8;
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
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Invalid xpc activity.");
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager onSyncActivity:]", "%s\n", v8);
    if (v10 != buf) {
      free(v10);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    -[CLVO2MaxCloudKitManager handleSyncUpload:](self, "handleSyncUpload:", a3);
    return;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v9 = (os_log_s *)qword_1019346E8;
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
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Unexpected activity state: %ld",  &v11);
    goto LABEL_22;
  }

- (void)handleSyncUpload:(id)a3
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  double v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "com.apple.vo2max.CloudKitManager";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[CKManager] Running XPC activity: %{public}s",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v40 = 136446210;
    v41 = "com.apple.vo2max.CloudKitManager";
    v28 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "[CKManager] Running XPC activity: %{public}s",  &v40,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v28);
    if (v28 != buf) {
      free(v28);
    }
  }

  -[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]( self,  "checkForDeletionOfVO2MaxData:",  self->fCloudKitDeletionState);
  -[CLVO2MaxCloudKitManager getCKSyncEngineMetadata](self, "getCKSyncEngineMetadata");
  if (v43 && [v43 length])
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    xpc_activity_state_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync engine metadata available, so attempting to upload unsynced local data",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      *(_WORD *)uint64_t v35 = 0;
      LODWORD(v33) = 2;
      __int16 v31 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine metadata available, so attempting to upload unsynced local data",  v35,  v33);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v31);
      if (v31 != buf) {
        free(v31);
      }
    }

    uint64_t v7 = 0LL;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No sync engine metadata available, so attempting to upload all local data",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      *(_WORD *)uint64_t v35 = 0;
      LODWORD(v33) = 2;
      __int16 v29 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "No sync engine metadata available, so attempting to upload all local data",  v35,  v33);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v29);
      if (v29 != buf) {
        free(v29);
      }
    }

    uint64_t v7 = 1LL;
  }

  -[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]( self,  "bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:",  v7,  1LL,  1LL,  1LL);
  double v9 = 0.0;
  if (v42 != 1.79769313e308) {
    double v9 = CFAbsoluteTimeGetCurrent() - v42;
  }
  uint32_t v10 = arc4random_uniform(self->fMinTimeBetweenForcedFetches);
  sub_1004F2598();
  int v11 = sub_1004F8A40();
  double fMinTimeBetweenForcedFetches = self->fMinTimeBetweenForcedFetches;
  if (fMinTimeBetweenForcedFetches == 0.0) {
    int v13 = v11;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    v14 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[CKManager] INTERNAL - Forcing CloudKit Fetch. Does not count towards daily stats (VO2MaxCloudKitMinTimeBetweenF orcedFetches == 0)",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      *(_WORD *)uint64_t v35 = 0;
      LODWORD(v33) = 2;
      double v30 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "[CKManager] INTERNAL - Forcing CloudKit Fetch. Does not count towards daily stats (VO2MaxCloudKitM inTimeBetweenForcedFetches == 0)",  v35,  v33);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v30);
      if (v30 != buf) {
        free(v30);
      }
    }

    -[CKSyncEngine setNeedsToFetchChanges](self->_syncEngine, "setNeedsToFetchChanges");
  }

  else if (v9 > fMinTimeBetweenForcedFetches + (double)v10)
  {
    double v34 = 0.0;
    uint64_t v15 = sub_1006E27E8();
    sub_100413284(v15, buf);
    sub_1002A82BC(*(uint64_t *)buf, "VO2MaxCloudKitLastForcedFetch", &v34);
    xpc_activity_state_t v16 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      double v17 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    double v19 = CFAbsoluteTimeGetCurrent() - v34;
    if (v19 > self->fMinTimeBetweenForcedFetches)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v20 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(double *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v19;
        __int16 v45 = 1026;
        uint32_t v46 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Forcing fetch from CloudKit. secondsSinceMetadataUpdate: %{public}f, secondsSinceLastForcedFetch: %{public}f, buffer: %{public}d",  buf,  0x1Cu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        *(_DWORD *)uint64_t v35 = 134349568;
        *(double *)&v35[4] = v9;
        __int16 v36 = 2050;
        double v37 = v19;
        __int16 v38 = 1026;
        uint32_t v39 = v10;
        LODWORD(v33) = 28;
        int64_t v32 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Forcing fetch from CloudKit. secondsSinceMetadataUpdate: %{public}f, secondsSinceLastForcedFetch : %{public}f, buffer: %{public}d",  v35,  v33);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v32);
        if (v32 != buf) {
          free(v32);
        }
      }

      -[CKSyncEngine setNeedsToFetchChanges](self->_syncEngine, "setNeedsToFetchChanges");
      uint64_t v21 = sub_1006E27E8();
      sub_100413284(v21, buf);
      uint64_t v22 = *(void *)buf;
      *(void *)uint64_t v35 = CFAbsoluteTimeGetCurrent();
      sub_1002AC7B8(v22, "VO2MaxCloudKitLastForcedFetch", v35);
      double v23 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        double v24 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }

      ++self->fDailyStats.forcedFetchRequestedCount;
    }
  }

  int v26 = _os_feature_enabled_impl("CoreLocation", "VO2MaxRetrocompute");
  int v27 = &XPC_ACTIVITY_INTERVAL_4_HOURS;
  if (!v26) {
    int v27 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  -[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:](self, "resetSyncActivity:withDelay:", a3, *v27);
}

- (void)cloudKitAccountDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002857C0;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async( (dispatch_queue_t)objc_msgSend( objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe", a3), "silo"),  "queue"),  block);
}

- (void)validateAccount
{
  container = self->_container;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100285828;
  v3[3] = &unk_10182DEB8;
  v3[4] = self;
  -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v3);
}

- (void)deleteLocalVO2MaxData
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  objc_super v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[CKManager] Deleting all VO2 Max data local to this device",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    v6[0] = 0;
    double v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "[CKManager] Deleting all VO2 Max data local to this device",  v6,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager deleteLocalVO2MaxData]", "%s\n", v5);
  }

  uint64_t v4 = (void *)sub_100D74AD8();
  sub_100D74D74(v4);
  sub_100D58D40((uint64_t)self->fInputStore.__ptr_);
  sub_100E3F524(self->fStagingOutputStore.__ptr_.__value_);
  sub_100D8BAC8((void *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (void)deleteCloudKitRecords
{
  if (self->_container && self->_syncEngine)
  {
    self->fCloudKitDeletionState = 2;
    objc_super v3 = -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10028685C;
    v6[3] = &unk_10181A2B0;
    v6[4] = self;
    -[CKDatabase fetchAllRecordZonesWithCompletionHandler:](v3, "fetchAllRecordZonesWithCompletionHandler:", v6);
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v4 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[CKManager] Attempted to delete records without a CKContainer or CKSyncEngine",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      v7[0] = 0;
      double v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "[CKManager] Attempted to delete records without a CKContainer or CKSyncEngine",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager deleteCloudKitRecords]", "%s\n", v5);
    }

    self->fCloudKitDeletionState = 3;
  }

- (BOOL)shouldKeepLocalDataOnAccountChange
{
  BOOL v9 = 0;
  uint64_t v2 = sub_1006E27E8();
  sub_100413284(v2, &v7);
  sub_1002A6F64(v7, "VO2MaxCloudKitKeepLocalDataOnAccountChange", &v9);
  objc_super v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  sub_1004F2598();
  BOOL result = sub_1004F8A40();
  if (!v9) {
    return 0;
  }
  return result;
}

- (void)setUserRecordIDName:(id)a3
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v4 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting userRecordIDName to %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v8 = 138477827;
    id v9 = a3;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Setting userRecordIDName to %{private}@",  &v8,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager setUserRecordIDName:]", "%s\n", v7);
  }

  uint64_t v5 = sub_1002F8DDC();
  sub_1002ACAEC(v5, @"kCloudKitUserRecordId", (char *)[a3 UTF8String]);
  uint64_t v6 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
}

- (id)getUserRecordIDName
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A85D0(v2, (uint64_t)@"kCloudKitUserRecordId", &__p);
  std::string::size_type size = __p.__r_.__value_.__s.__size_;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    uint64_t v6 = 0LL;
    if ((__p.__r_.__value_.__s.__size_ & 0x80) == 0) {
      return v6;
    }
    goto LABEL_8;
  }

  uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v6 = -[NSString initWithUTF8String:](v4, "initWithUTF8String:", p_p);
  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_8:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)updateDeviceUnlocked:(BOOL)a3
{
  if (!self->_syncEngine && !self->fDeviceUnlocked && a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device has been unlocked. Will now initialize the sync engine.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      v8[0] = 0;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Device has been unlocked. Will now initialize the sync engine.",  v8,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager updateDeviceUnlocked:]", "%s\n", v7);
    }

    -[CLVO2MaxCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
  }

  self->fDeviceUnlocked = a3;
}

- (void)checkForDeletionOfVO2MaxData:(int)a3
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    int v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[CKManager] Checking if CloudKit deletion is necessary. State=%{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LODWORD(v12[0]) = 67240192;
    HIDWORD(v12[0]) = a3;
    id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  2LL,  "[CKManager] Checking if CloudKit deletion is necessary. State=%{public}d",  v12,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v9);
  }

  if (a3 == 3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CKManager] Re-attempting VO2 Max data deletion after previous failure",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LOWORD(v12[0]) = 0;
    LODWORD(v11) = 2;
    uint64_t v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "[CKManager] Re-attempting VO2 Max data deletion after previous failure",  v12,  v11,  v12[0]);
    goto LABEL_30;
  }

  if (a3 != 1) {
    return;
  }
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v6 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[CKManager] VO2Max disabled via Watch FitnessTracking switch. Deleting VO2 Max data",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LOWORD(v12[0]) = 0;
    LODWORD(v11) = 2;
    uint64_t v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "[CKManager] VO2Max disabled via Watch FitnessTracking switch. Deleting VO2 Max data",  v12,  v11,  v12[0]);
LABEL_30:
    uint32_t v10 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v7);
    if (v10 != buf) {
      free(v10);
    }
  }

- (VO2MaxCloudKitSyncEngineMetadata)getCKSyncEngineMetadata
{
  retstr->var0 = 0LL;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  retstr->var3 = 0LL;
  uint64_t v4 = sub_100D74AD8();
  sub_100D75814(v4, (uint64_t)retstr);
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [retstr->var3 length];
    *(_DWORD *)buf = 134349056;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Loaded sync engine metadata, length = %{public}lu",  buf,  0xCu);
  }

  BOOL result = (VO2MaxCloudKitSyncEngineMetadata *)sub_1002921D0(115, 2);
  if ((_DWORD)result)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = qword_1019346E8;
    id v9 = [retstr->var3 length];
    int v11 = 134349056;
    id v12 = v9;
    uint32_t v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "Loaded sync engine metadata, length = %{public}lu",  &v11,  12);
    BOOL result = (VO2MaxCloudKitSyncEngineMetadata *)sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager getCKSyncEngineMetadata]",  "%s\n",  v10);
  }

  return result;
}

- (void)initializeSyncEngine
{
  if (self) {
    -[CLVO2MaxCloudKitManager getCKSyncEngineMetadata](self, "getCKSyncEngineMetadata");
  }
  else {
    __int128 v7 = 0u;
  }
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  uint64_t v4 =  -[CKSyncEngineConfiguration initWithDatabase:dataSource:metadata:]( objc_alloc(&OBJC_CLASS___CKSyncEngineConfiguration),  "initWithDatabase:dataSource:metadata:",  -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"),  self,  *((void *)&v7 + 1));
  -[CKSyncEngineConfiguration setApsMachServiceName:]( v4,  "setApsMachServiceName:",  @"com.apple.aps.locationd.vo2max.cloudkit");
  -[CKSyncEngineConfiguration setPriority:](v4, "setPriority:", 2LL);
  -[CKSyncEngineConfiguration setXpcActivityCriteriaOverrides:](v4, "setXpcActivityCriteriaOverrides:", v3);
  self->_syncEngine = -[CKSyncEngine initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CKSyncEngine),  "initWithConfiguration:",  v4);
  self->fDailyStats.syncEngineEnabled = 1;
  syncEngine = self->_syncEngine;
  fOutputZoneID = self->fOutputZoneID;
  -[CKSyncEngine fetchChangesForZoneIDs:completionHandler:]( syncEngine,  "fetchChangesForZoneIDs:completionHandler:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &fOutputZoneID, 1LL),  &stru_10182DED8);
  if (self->fFetchChangesForInputZone)
  {
    id v6 = self->_syncEngine;
    fInputZoneID = self->fInputZoneID;
    -[CKSyncEngine fetchChangesForZoneIDs:completionHandler:]( v6,  "fetchChangesForZoneIDs:completionHandler:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &fInputZoneID, 1LL),  &stru_10182DEF8);
  }

  xpc_release(v3);
  -[CLVO2MaxCloudKitManager setUpSyncActivity](self, "setUpSyncActivity");
}

- (void)createVO2MaxOutputZone
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  xpc_object_t v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxOutputs zone", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    __int16 v6 = 0;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Creating VO2MaxOutputs zone",  &v6,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createVO2MaxOutputZone]", "%s\n", v5);
  }

  syncEngine = self->_syncEngine;
  __int128 v7 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", self->fOutputZoneID);
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]( syncEngine,  "addRecordZonesToSave:recordZoneIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL),  0LL);
}

- (void)createVO2MaxInputZone
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  xpc_object_t v3 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxInputs zone", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    __int16 v6 = 0;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Creating VO2MaxInputs zone",  &v6,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createVO2MaxInputZone]", "%s\n", v5);
  }

  syncEngine = self->_syncEngine;
  __int128 v7 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", self->fInputZoneID);
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]( syncEngine,  "addRecordZonesToSave:recordZoneIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL),  0LL);
}

- (void)deleteZone:(id)a3
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Deleting zone with zoneID = %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v9 = 138543362;
    id v10 = a3;
    __int128 v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Deleting zone with zoneID = %{public}@",  &v9,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager deleteZone:]", "%s\n", v7);
  }

  syncEngine = self->_syncEngine;
  id v8 = a3;
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]( syncEngine,  "addRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
}

- (void)addRecordIDsForSessionId:(id)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5
{
  if (self->_syncEngine)
  {
    BOOL v6 = a5;
    if (a4)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      id v8 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxOutputZone",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        int v21 = 138543362;
        id v22 = a3;
        xpc_activity_state_t v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxOutputZone",  &v21,  12);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]",  "%s\n",  v16);
      }

      int v9 =  -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  a3,  self->fOutputZoneID);
      syncEngine = self->_syncEngine;
      int v20 = v9;
      -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( syncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL),  0LL);
      ++self->fDailyStats.outputSaveQueuedCount;
    }

    if (v6)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v11 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxInputZone",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        int v21 = 138543362;
        id v22 = a3;
        LODWORD(v18) = 12;
        double v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxInputZone",  &v21,  v18);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]",  "%s\n",  v17);
      }

      id v12 =  -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  a3,  self->fInputZoneID);
      int v13 = self->_syncEngine;
      double v19 = v12;
      -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( v13,  "addRecordIDsToSave:recordIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL),  0LL);
      ++self->fDailyStats.inputSaveQueuedCount;
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v14 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sync engine uninitialized, so not adding sessionId %{public}@ to RecordIDs for sync engine to save",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v21 = 138543362;
      id v22 = a3;
      uint64_t v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine uninitialized, so not adding sessionId %{public}@ to RecordIDs for sync engine to save",  &v21,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]",  "%s\n",  v15);
    }
  }

- (void)bulkUploadRecordIDsShouldReupload:(BOOL)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5 shouldThrottle:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v32 = a5;
  BOOL v33 = a4;
  std::string __p = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v9 = sub_100D74AD8();
  sub_100D755B8(v9, (char **)&__p, 0.0);
  unint64_t v10 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v35 - (_BYTE *)__p) >> 4));
  *(void *)buf = sub_100288EA0;
  if (v35 == __p) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = v10;
  }
  sub_10028EBF4((__n128 *)__p, v35, (unsigned int (**)(void, void))buf, v11, 1);
  *(void *)buf = sub_100288EC0;
  id v12 = sub_100290AAC((__int128 *)__p, (__int128 *)v35, (unsigned int (**)(void, void))buf);
  if (v35 != (__n128 *)v12) {
    uint64_t v35 = (__n128 *)v12;
  }
  BOOL v31 = v6 && 0xCCCCCCCCCCCCCCCDLL * (((char *)v12 - (_BYTE *)__p) >> 4) > self->fMaxSessionsForUploadThrottling;
  if (__p != v12)
  {
    int v30 = 0;
    int v13 = (__int128 *)((char *)__p + 80);
    do
    {
      __int128 v39 = *(v13 - 5);
      __int128 v14 = *(v13 - 4);
      __int128 v15 = *(v13 - 3);
      __int128 v16 = *(v13 - 1);
      v40[2] = *(v13 - 2);
      __int128 v41 = v16;
      v40[0] = v14;
      v40[1] = v15;
      double v17 = objc_autoreleasePoolPush();
      uint64_t v18 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v40);
      if (v33)
      {
        BOOL v19 = 1LL;
        if (!a3 && (void)v41) {
          BOOL v19 = [(id)v41 length] == 0;
        }
      }

      else
      {
        BOOL v19 = 0LL;
      }

      BOOL v20 = v32
         && (a3 || !*((void *)&v41 + 1) || ![*((id *)&v41 + 1) length])
         && sub_100D58D4C((uint64_t *)self->fInputStore.__ptr_, (const unsigned __int8 *)v40);
      if ((v19 || v20)
        && (-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]( self,  "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:",  -[NSUUID UUIDString](v18, "UUIDString"),  v19,  v20),  v31)
        && (++v30, v30 >= self->fMaxSessionsForUploadThrottling))
      {
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        double v23 = (os_log_s *)qword_1019346E8;
        if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
        {
          int fMaxSessionsForUploadThrottling = self->fMaxSessionsForUploadThrottling;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = fMaxSessionsForUploadThrottling;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Hit the max of %{public}d sessions per CloudKit upload. Will check for more data later.",  buf,  8u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346E0 != -1) {
            dispatch_once(&qword_1019346E0, &stru_10182DF18);
          }
          int v25 = self->fMaxSessionsForUploadThrottling;
          v37[0] = 67240192;
          v37[1] = v25;
          LODWORD(v29) = 8;
          int v26 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Hit the max of %{public}d sessions per CloudKit upload. Will check for more data later.",  v37,  v29);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone :shouldThrottle:]",  "%s\n",  v26);
        }

        char v21 = 1;
      }

      else
      {
        char v21 = 0;
      }

      objc_autoreleasePoolPop(v17);
      if (v13 == v12) {
        char v22 = 1;
      }
      else {
        char v22 = v21;
      }
      v13 += 5;
    }

    while ((v22 & 1) == 0);
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v27 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Done adding sessions to sync", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LOWORD(v39) = 0;
    LODWORD(v29) = 2;
    v28 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Done adding sessions to sync",  &v39,  v29);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]",  "%s\n",  v28);
  }

  if (__p)
  {
    uint64_t v35 = (__n128 *)__p;
    operator delete(__p);
  }

- (id)getSystemFieldsFromCKRecord:(id)a3
{
  uint64_t v4 =  -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  [a3 encodeSystemFieldsWithCoder:v4];
  -[NSKeyedArchiver finishEncoding](v4, "finishEncoding");
  return -[NSKeyedArchiver encodedData](v4, "encodedData");
}

- (id)createCKRecordForOutput:(id)a3
{
  id v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v5 = sub_100D74AD8();
  if (!sub_100D754EC(v5, v32, v29))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v11 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v28 = *(double *)&a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v25 = 138543362;
    double v26 = *(double *)&a3;
    unint64_t v10 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@",  &v25,  12);
    goto LABEL_36;
  }

  if ([v30 length])
  {
    double v24 = 0.0;
    BOOL v6 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    __int128 v7 =  -[NSKeyedUnarchiver initForReadingFromData:error:]( v6,  "initForReadingFromData:error:",  [v30 copy],  &v24);
    -[NSKeyedUnarchiver setRequiresSecureCoding:](v7, "setRequiresSecureCoding:", 1LL);
    id v8 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v7);
    -[NSKeyedUnarchiver finishDecoding](v7, "finishDecoding");
    if (!v8)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v9 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v28 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to decode output record from system fields data: %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 0)) {
        return 0LL;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v25 = 138543362;
      double v26 = v24;
      unint64_t v10 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Failed to decode output record from system fields data: %{public}@",  &v25,  12);
LABEL_36:
      BOOL v19 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v10);
      if (v19 != buf) {
        free(v19);
      }
      return 0LL;
    }
  }

  else
  {
    id v8 =  -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"VO2MaxOutput",  a3);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___CLCKVO2MaxSessionOutput);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v14 = sub_100D74AD8();
  if (sub_100D75824(v14, v32, v12))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    __int128 v15 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v28 = v16 - Current;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Completed fetch of output proto; duration: %{public}f",
        buf,
        0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v20 = qword_1019346E8;
      CFAbsoluteTime v21 = CFAbsoluteTimeGetCurrent();
      int v25 = 134349056;
      double v26 = v21 - Current;
      char v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  2LL,  "Completed fetch of output proto; duration: %{public}f",
                      &v25,
                      12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v22);
    }

    objc_msgSend( -[CKRecord encryptedValuesByKey](v8, "encryptedValuesByKey"),  "setObject:forKeyedSubscript:",  -[CLCKVO2MaxSessionOutput data](v12, "data"),  @"sessionData");
    ++self->fDailyStats.outputSaveAttemptedCount;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    double v17 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to get output due to device being locked, clearing the sync engine and will try again later.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      LOWORD(v25) = 0;
      double v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to get output due to device being locked, clearing the sync engine and will try again later.",  &v25,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v23);
    }

    id v8 = 0LL;
    self->_syncEngine = 0LL;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
  }

  return v8;
}

- (void)updateOutputSystemFields:(id)a3 outputRecord:(id)a4
{
  std::string __p = 0LL;
  char v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v7 = sub_100D74AD8();
  if (sub_100D75588(v7, v32, (uint64_t)&__p))
  {
    id v8 = (__int128 *)__p;
    uint64_t v9 = v22;
    if (__p != v22)
    {
      do
      {
        __int128 v27 = *v8;
        __int128 v10 = v8[1];
        __int128 v11 = v8[2];
        __int128 v12 = v8[4];
        v28[2] = v8[3];
        __int128 v29 = v12;
        v28[0] = v10;
        v28[1] = v11;
        uuid_unparse((const unsigned __int8 *)v28, out);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        int v13 = (os_log_s *)qword_1019346E8;
        if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v31 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving output metadata %s", buf, 0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346E0 != -1) {
            dispatch_once(&qword_1019346E0, &stru_10182DF18);
          }
          int v24 = 136315138;
          int v25 = out;
          __int128 v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  2LL,  "Saving output metadata %s",  (const char *)&v24);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]",  "%s\n",  v15);
        }

        *(void *)&__int128 v29 = a3;
        uint64_t v14 = sub_100D74AD8();
        sub_100D7544C(v14, (uint64_t)&v27);
        v8 += 5;
      }

      while (v8 != v9);
    }

    ++self->fDailyStats.outputSaveSuccessCount;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    CFAbsoluteTime v16 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      double v17 = (char *)[a4 recordID];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v18 = qword_1019346E8;
      id v19 = [a4 recordID];
      LODWORD(v27) = 138543362;
      *(void *)((char *)&v27 + 4) = v19;
      uint64_t v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  16LL,  "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@",  &v27,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]",  "%s\n",  v20);
    }
  }

  if (__p)
  {
    char v22 = (__int128 *)__p;
    operator delete(__p);
  }

- (void)handleFetchedOutputRecord:(id)a3
{
  uint64_t v5 =  -[CLCKVO2MaxSessionOutput initWithData:]( [CLCKVO2MaxSessionOutput alloc],  "initWithData:",  objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", @"sessionData"));
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = sub_100D74AD8();
  if ((sub_100D75C70( v7,  v5,  (uint64_t)-[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3)) & 1) != 0)
  {
    ++self->fDailyStats.outputFetchSuccessCount;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unable to persist fetched output due to device being locked, clearing the sync engine and will try again later.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      LOWORD(v16) = 0;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to persist fetched output due to device being locked, clearing the sync engine and will try again later.",  &v16,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v14);
    }

    self->_syncEngine = 0LL;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
    ++self->fDailyStats.outputFetchFailureCount;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v9 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
  {
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349056;
    double v19 = v10 - Current;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Completed save of output proto; duration: %{public}f",
      buf,
      0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v11 = qword_1019346E8;
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent();
    int v16 = 134349056;
    double v17 = v12 - Current;
    LODWORD(v15) = 12;
    int v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  2LL,  "Completed save of output proto; duration: %{public}f",
                    &v16,
                    v15);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v13);
  }

- (id)createCKRecordForInput:(id)a3
{
  uint64_t v29 = 0LL;
  id v30 = 0LL;
  uint64_t v5 = sub_100D74AD8();
  if (!sub_100D754EC(v5, v31, v28))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v11 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v27 = *(double *)&a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v24 = 138543362;
    double v25 = *(double *)&a3;
    CFAbsoluteTime v10 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@",  &v24,  12);
    goto LABEL_37;
  }

  if ([v30 length])
  {
    double v23 = 0.0;
    BOOL v6 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    uint64_t v7 =  -[NSKeyedUnarchiver initForReadingFromData:error:]( v6,  "initForReadingFromData:error:",  [v30 copy],  &v23);
    -[NSKeyedUnarchiver setRequiresSecureCoding:](v7, "setRequiresSecureCoding:", 1LL);
    id v8 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v7);
    -[NSKeyedUnarchiver finishDecoding](v7, "finishDecoding");
    if (!v8)
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v9 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v27 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to decode input record from system fields data: %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 0)) {
        return 0LL;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v24 = 138543362;
      double v25 = v23;
      CFAbsoluteTime v10 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Failed to decode input record from system fields data: %{public}@",  &v24,  12);
LABEL_37:
      uint64_t v18 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v10);
      if (v18 != buf) {
        free(v18);
      }
      return 0LL;
    }
  }

  else
  {
    id v8 =  -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"VO2MaxInput",  a3);
  }

  CFAbsoluteTime v12 = objc_alloc_init(&OBJC_CLASS___CLCKVO2MaxSessionInput);
  double Current = CFAbsoluteTimeGetCurrent();
  if (sub_100D58D6C((uint64_t *)self->fInputStore.__ptr_, v31, v12))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v14 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v27 = v15 - Current;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Completed fetch of input proto; duration: %{public}f",
        buf,
        0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v19 = qword_1019346E8;
      CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
      int v24 = 134349056;
      double v25 = v20 - Current;
      CFAbsoluteTime v21 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  2LL,  "Completed fetch of input proto; duration: %{public}f",
                      &v24,
                      12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v21);
    }

    if (-[NSMutableArray count](-[CLCKVO2MaxSessionInput inputs](v12, "inputs"), "count"))
    {
      objc_msgSend( -[CKRecord encryptedValuesByKey](v8, "encryptedValuesByKey"),  "setObject:forKeyedSubscript:",  -[CLCKVO2MaxSessionInput data](v12, "data"),  @"sessionData");
      ++self->fDailyStats.inputSaveAttemptedCount;
      return v8;
    }

    return 0LL;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v16 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unable to get input due to device being locked, clearing the sync engine and will try again later.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LOWORD(v24) = 0;
    char v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to get input due to device being locked, clearing the sync engine and will try again later.",  &v24,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v22);
  }

  id v8 = 0LL;
  self->_syncEngine = 0LL;
  self->fDailyStats.syncEngineEnabled = 0;
  self->fDeviceUnlocked = 0;
  return v8;
}

- (void)updateInputSystemFields:(id)a3 inputRecord:(id)a4
{
  std::string __p = 0LL;
  char v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v7 = sub_100D74AD8();
  if (sub_100D75588(v7, v32, (uint64_t)&__p))
  {
    id v8 = (__int128 *)__p;
    uint64_t v9 = v22;
    if (__p != v22)
    {
      do
      {
        __int128 v27 = *v8;
        __int128 v10 = v8[1];
        __int128 v11 = v8[2];
        __int128 v12 = v8[4];
        v28[2] = v8[3];
        __int128 v29 = v12;
        v28[0] = v10;
        v28[1] = v11;
        uuid_unparse((const unsigned __int8 *)v28, out);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        int v13 = (os_log_s *)qword_1019346E8;
        if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v31 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving input metadata %s", buf, 0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346E0 != -1) {
            dispatch_once(&qword_1019346E0, &stru_10182DF18);
          }
          int v24 = 136315138;
          double v25 = out;
          CFAbsoluteTime v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  2LL,  "Saving input metadata %s",  (const char *)&v24);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]",  "%s\n",  v15);
        }

        *((void *)&v29 + 1) = a3;
        uint64_t v14 = sub_100D74AD8();
        sub_100D7544C(v14, (uint64_t)&v27);
        v8 += 5;
      }

      while (v8 != v9);
    }

    ++self->fDailyStats.inputSaveSuccessCount;
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v16 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      double v17 = (char *)[a4 recordID];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v18 = qword_1019346E8;
      id v19 = [a4 recordID];
      LODWORD(v27) = 138543362;
      *(void *)((char *)&v27 + 4) = v19;
      CFAbsoluteTime v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  16LL,  "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@",  &v27,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]",  "%s\n",  v20);
    }
  }

  if (__p)
  {
    char v22 = (__int128 *)__p;
    operator delete(__p);
  }

- (void)handleFetchedInputRecord:(id)a3
{
  if (self->fFetchChangesForInputZone)
  {
    uint64_t v5 =  -[CLCKVO2MaxSessionInput initWithData:]( [CLCKVO2MaxSessionInput alloc],  "initWithData:",  objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", @"sessionData"));
    double Current = CFAbsoluteTimeGetCurrent();
    if ((sub_100D58F34( (uint64_t *)self->fInputStore.__ptr_,  v5,  -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3)) & 1) != 0)
    {
      ++self->fDailyStats.inputFetchSuccessCount;
    }

    else
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v7 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to persist fetched input due to device being locked, clearing the sync engine and will try again later.",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        LOWORD(v15) = 0;
        int v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Unable to persist fetched input due to device being locked, clearing the sync engine and will try again later.",  &v15,  2);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v13);
      }

      self->_syncEngine = 0LL;
      self->fDailyStats.syncEngineEnabled = 0;
      self->fDeviceUnlocked = 0;
      ++self->fDailyStats.inputFetchFailureCount;
    }

    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
    {
      CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      double v18 = v9 - Current;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Completed save of input proto; duration: %{public}f",
        buf,
        0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v10 = qword_1019346E8;
      CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent();
      int v15 = 134349056;
      double v16 = v11 - Current;
      LODWORD(v14) = 12;
      __int128 v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  2LL,  "Completed save of input proto; duration: %{public}f",
                      &v15,
                      v14);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v12);
    }
  }

- (void)handleServerRecordChanged:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]( self,  "updateOutputSystemFields:outputRecord:",  -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3),  a3);
    }

    else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]( self,  "updateInputSystemFields:inputRecord:",  -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3),  a3);
    }

    else
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v7 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = [a3 recordType];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CloudKit provided server record of unexpected type: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        uint64_t v9 = qword_1019346E8;
        int v12 = 138543362;
        id v13 = [a3 recordType];
        uint64_t v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  16LL,  "CloudKit provided server record of unexpected type: %{public}@",  &v12,  12);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v10);
      }
    }

    syncEngine = self->_syncEngine;
    id v11 = [a3 recordID];
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( syncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL),  0LL);
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Expected server record is missing from error after failed record save",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      LOWORD(v12) = 0;
      BOOL v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Expected server record is missing from error after failed record save",  &v12,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v6);
    }
  }

- (void)handleUnknownItem:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
  {
    -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]( self,  "updateOutputSystemFields:outputRecord:",  0LL,  a3);
  }

  else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", @"VO2MaxInput"))
  {
    -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]( self,  "updateInputSystemFields:inputRecord:",  0LL,  a3);
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = [a3 recordType];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "CloudKit provided record of unexpected type: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v7 = qword_1019346E8;
      int v10 = 138543362;
      id v11 = [a3 recordType];
      id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  16LL,  "CloudKit provided record of unexpected type: %{public}@",  &v10,  12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleUnknownItem:]", "%s\n", v8);
    }
  }

  syncEngine = self->_syncEngine;
  id v9 = [a3 recordID];
  -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( syncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL),  0LL);
}

- (void)handleZoneNotFound:(id)a3
{
  if (objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"),  "isEqualToString:",  @"VO2MaxOutputZone"))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
    syncEngine = self->_syncEngine;
    id v15 = [a3 recordID];
    BOOL v6 = &v15;
LABEL_5:
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( syncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 1LL),  0LL);
    return;
  }

  if (objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"),  "isEqualToString:",  @"VO2MaxInputZone"))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
    syncEngine = self->_syncEngine;
    id v14 = [a3 recordID];
    BOOL v6 = &v14;
    goto LABEL_5;
  }

  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName");
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Will not attempt to save unexpected zone: %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = qword_1019346E8;
    int v10 = 138543362;
    id v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName");
    id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  16LL,  "Will not attempt to save unexpected zone: %{public}@",  &v10,  12);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleZoneNotFound:]", "%s\n", v9);
  }

- (void)handleZoneDeleted:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
    uint64_t v5 = self;
    uint64_t v6 = 1LL;
    uint64_t v7 = 0LL;
LABEL_5:
    -[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]( v5,  "bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:",  1LL,  v6,  v7,  0LL);
    return;
  }

  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
    uint64_t v5 = self;
    uint64_t v6 = 0LL;
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CKRecordZoneDefaultName))
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = [a3 zoneName];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[CKManager] Delete reported for zone (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v9 = qword_1019346E8;
      int v13 = 138412290;
      id v14 = [a3 zoneName];
      int v10 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  1LL,  "[CKManager] Delete reported for zone (%@)",  &v13,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n");
LABEL_24:
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v11 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = [a3 zoneName];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Delete reported for unexpected zone: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v12 = qword_1019346E8;
      int v13 = 138543362;
      id v14 = [a3 zoneName];
      int v10 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  16LL,  "Delete reported for unexpected zone: %{public}@",  &v13,  12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n");
      goto LABEL_24;
    }
  }

- (void)handleZonePurge:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxOutputZone"))
  {
    uint64_t v5 = (void *)sub_100D74AD8();
    sub_100D74D74(v5);
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
  }

  else if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", @"VO2MaxInputZone"))
  {
    sub_100D58D40((uint64_t)self->fInputStore.__ptr_);
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = [a3 zoneName];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Will not attempt to purge unexpected zone: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v7 = qword_1019346E8;
      int v9 = 138543362;
      id v10 = [a3 zoneName];
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  16LL,  "Will not attempt to purge unexpected zone: %{public}@",  &v9,  12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager handleZonePurge:]", "%s\n", v8);
    }
  }

- (void)stopSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_syncEngine = 0LL;
  self->fDailyStats.syncEngineEnabled = 0;
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }

  else
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Attempting unregistration when fDataProtectionClient is not initialized",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      v8[0] = 0;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Attempting unregistration when fDataProtectionClient is not initialized",  v8,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager stopSyncing:]", "%s\n", v7);
    }
  }

  if (v3)
  {
    uint64_t v6 = sub_100D74AD8();
    sub_100D7581C(v6);
  }

- (void)resetDailyStats
{
  self->fDailyStatsStartTime = CFAbsoluteTimeGetCurrent();
  *(_OWORD *)&self->fDailyStats.outputSaveQueuedCount = 0u;
  *(_OWORD *)&self->fDailyStats.outputFetchSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputSaveSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputFetchFailureCount = 0u;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Successfully saved CKRecordZone %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v7 = 138543362;
    id v8 = a4;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Successfully saved CKRecordZone %{public}@",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecordZone:]", "%s\n", v6);
  }

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync engine reports successful deletion of CKRecordZone with zoneID: %{public}@. Will recreate zone and reupload local data.",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v8 = 138543362;
      id v9 = a4;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine reports successful deletion of CKRecordZone with zoneID: %{public}@. Will recreate zone and reupload local data.",  &v8,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordZoneWithID:]",  "%s\n",  v7);
    }

    -[CLVO2MaxCloudKitManager handleZoneDeleted:](self, "handleZoneDeleted:", a4);
  }

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v8 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = a4;
    __int16 v16 = 2114;
    id v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to save CKRecordZone: %{public}@, error = %{public}@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v10 = 138543618;
    id v11 = a4;
    __int16 v12 = 2114;
    id v13 = a5;
    id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Failed to save CKRecordZone: %{public}@, error = %{public}@",  &v10,  22);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecordZone:error:]",  "%s\n",  v9);
  }

  if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", CKErrorDomain))
  {
    if ([a5 code] == (id)112) {
      -[CLVO2MaxCloudKitManager deleteZone:](self, "deleteZone:", [a4 zoneID]);
    }
  }

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = a5;
    __int16 v15 = 2114;
    id v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we sho uld not be deleting any zones",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v9 = 138543618;
    id v10 = a5;
    __int16 v11 = 2114;
    id v12 = a4;
    int v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  17LL,  "Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpect ed, as we should not be deleting any zones",  &v9,  22);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordZoneWithID:error:]",  "%s\n",  v8);
  }

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sync engine reports that CKRecordZone with identifier %{public}@ changed",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v7 = 138543362;
    id v8 = a4;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine reports that CKRecordZone with identifier %{public}@ changed",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDChanged:]", "%s\n", v6);
  }

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync engine reports that CKRecordZone with identifier %{public}@ was deleted",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v8 = 138543362;
      id v9 = a4;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine reports that CKRecordZone with identifier %{public}@ was deleted",  &v8,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasDeleted:]", "%s\n", v7);
    }

    -[CLVO2MaxCloudKitManager handleZoneDeleted:](self, "handleZoneDeleted:", a4);
  }

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync engine reports that CKRecordZone with identifier %{public}@ was purged",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v8 = 138543362;
      id v9 = a4;
      int v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine reports that CKRecordZone with identifier %{public}@ was purged",  &v8,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasPurged:]", "%s\n", v7);
    }

    -[CLVO2MaxCloudKitManager handleZonePurge:](self, "handleZonePurge:", a4);
  }

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  if (self->_syncEngine != a3) {
    return 0LL;
  }
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sync engine is asking for CKRecord with ID %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    LODWORD(v2sub_100222B94(v20, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0) = 138543362;
    *(void *)((char *)&v20 + 4) = a4;
    id v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine is asking for CKRecord with ID %{public}@",  &v20,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v17);
  }

  if (objc_msgSend( objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"),  "isEqualToString:",  @"VO2MaxOutputZone"))
  {
    id v4 = -[CLVO2MaxCloudKitManager createCKRecordForOutput:](self, "createCKRecordForOutput:", a4);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning output CKRecord: %@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      LODWORD(v2sub_100222B94(v20, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0) = 138412290;
      *(void *)((char *)&v20 + 4) = v4;
      LODWORD(v19) = 12;
      id v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Returning output CKRecord: %@",  &v20,  v19,  v20);
LABEL_40:
      double v18 = (uint8_t *)v9;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]",  "%s\n",  v9);
      if (v18 != buf) {
        free(v18);
      }
    }
  }

  else
  {
    if (!objc_msgSend( objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"),  "isEqualToString:",  @"VO2MaxInputZone"))
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      id v12 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName");
        *(_DWORD *)buf = 138543362;
        id v22 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "RecordID associated with unexpected zone: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        uint64_t v14 = qword_1019346E8;
        id v15 = objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName");
        LODWORD(v2sub_100222B94(v20, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0) = 138543362;
        *(void *)((char *)&v20 + 4) = v15;
        LODWORD(v19) = 12;
        id v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  16LL,  "RecordID associated with unexpected zone: %{public}@",  &v20,  v19);
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]",  "%s\n",  v16);
      }

      return 0LL;
    }

    id v4 = -[CLVO2MaxCloudKitManager createCKRecordForInput:](self, "createCKRecordForInput:", a4);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v10 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning input CKRecord: %@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      LODWORD(v2sub_100222B94(v20, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0) = 138412290;
      *(void *)((char *)&v20 + 4) = v4;
      LODWORD(v19) = 12;
      id v9 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Returning input CKRecord: %@",  &v20,  v19,  v20);
      goto LABEL_40;
    }
  }

  return v4;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v6 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v20 = [a4 recordID];
      __int16 v21 = 2113;
      id v22 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync engine saved CKRecord with CKRecordID %{public}@, record = %{private}@",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v9 = qword_1019346E8;
      int v15 = 138543619;
      id v16 = [a4 recordID];
      __int16 v17 = 2113;
      id v18 = a4;
      id v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "Sync engine saved CKRecord with CKRecordID %{public}@, record = %{private}@",  &v15,  22);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v10);
    }

    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]( self,  "updateOutputSystemFields:outputRecord:",  -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a4),  a4);
    }

    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]( self,  "updateInputSystemFields:inputRecord:",  -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a4),  a4);
    }

    else
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v7 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        id v8 = [a4 recordType];
        *(_DWORD *)buf = 138543362;
        id v20 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CloudKit reporting saved record of unexpected type: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        uint64_t v11 = qword_1019346E8;
        id v12 = [a4 recordType];
        int v15 = 138543362;
        id v16 = v12;
        LODWORD(v14) = 12;
        id v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  16LL,  "CloudKit reporting saved record of unexpected type: %{public}@",  &v15,  v14);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v13);
      }
    }
  }

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    id v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544131;
      id v21 = [a5 domain];
      __int16 v22 = 2050;
      id v23 = [a5 code];
      __int16 v24 = 2114;
      id v25 = a5;
      __int16 v26 = 2113;
      id v27 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %{private}@",  buf,  0x2Au);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v10 = qword_1019346E8;
      int v12 = 138544131;
      id v13 = [a5 domain];
      __int16 v14 = 2050;
      id v15 = [a5 code];
      __int16 v16 = 2114;
      id v17 = a5;
      __int16 v18 = 2113;
      id v19 = a4;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  16LL,  "Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{publ ic}@, record = %{private}@",  &v12,  42);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecord:error:]",  "%s\n",  v11);
    }

    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      p_outputSaveFailureCount = &self->fDailyStats.outputSaveFailureCount;
    }

    else
    {
      p_outputSaveFailureCount = &self->fDailyStats.inputSaveFailureCount;
    }

    ++*p_outputSaveFailureCount;
LABEL_12:
    if (CKErrorIsCode(a5, 14LL))
    {
      -[CLVO2MaxCloudKitManager handleServerRecordChanged:]( self,  "handleServerRecordChanged:",  objc_msgSend(objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));
    }

    else if (CKErrorIsCode(a5, 11LL))
    {
      -[CLVO2MaxCloudKitManager handleUnknownItem:](self, "handleUnknownItem:", a4);
    }

    else if (CKErrorIsCode(a5, 26LL))
    {
      -[CLVO2MaxCloudKitManager handleZoneNotFound:](self, "handleZoneNotFound:", a4);
    }

    else if (CKErrorIsCode(a5, 9LL))
    {
      -[CLVO2MaxCloudKitManager stopSyncing:](self, "stopSyncing:", 0LL);
    }

    else if (CKErrorIsCode(a5, 112LL))
    {
      -[CLVO2MaxCloudKitManager deleteZone:](self, "deleteZone:", objc_msgSend(objc_msgSend(a4, "recordID"), "zoneID"));
    }
  }

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  uint64_t v5 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sync engine deleted CKRecord with CKRecordID %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v7 = 138543362;
    id v8 = a4;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  0LL,  "Sync engine deleted CKRecord with CKRecordID %{public}@",  &v7,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordWithID:]", "%s\n", v6);
  }

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    id v19 = [a5 domain];
    __int16 v20 = 2050;
    id v21 = [a5 code];
    __int16 v22 = 2114;
    id v23 = a5;
    __int16 v24 = 2114;
    id v25 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = qword_1019346E8;
    int v10 = 138544130;
    id v11 = [a5 domain];
    __int16 v12 = 2050;
    id v13 = [a5 code];
    __int16 v14 = 2114;
    id v15 = a5;
    __int16 v16 = 2114;
    id v17 = a4;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  16LL,  "Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{publi c}@, recordID = %{public}@",  &v10,  42);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordWithID:error:]",  "%s\n",  v9);
  }

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v25[0] = [a4 zoneName];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Sync engine asking if it should fetch changes for %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v17 = qword_1019346E8;
    int v22 = 138543362;
    v23[0] = [a4 zoneName];
    __int16 v18 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  2LL,  "Sync engine asking if it should fetch changes for %{public}@",  &v22,  12);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]",  "%s\n",  v18);
  }

  if (self->_syncEngine != a3) {
    goto LABEL_13;
  }
  if (self->fCloudKitDeletionState)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v8 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_INFO))
    {
      int fCloudKitDeletionState = self->fCloudKitDeletionState;
      *(_DWORD *)buf = 67240450;
      LODWORD(v25[0]) = fCloudKitDeletionState;
      WORD2(v25[0]) = 2114;
      *(void *)((char *)v25 + 6) = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[CKManager] CloudKit deletion was requested (state=%{public}d). Not fetching changes for zone: %{public}@",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      int v19 = self->fCloudKitDeletionState;
      int v22 = 67240450;
      LODWORD(v23[0]) = v19;
      WORD2(v23[0]) = 2114;
      *(void *)((char *)v23 + 6) = a4;
      LODWORD(v21) = 18;
      __int16 v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  1LL,  "[CKManager] CloudKit deletion was requested (state=%{public}d). Not fetching changes for zone: %{public}@",  &v22,  v21);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]",  "%s\n",  v20);
    }

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  if (self->_syncEngine == a3)
  {
    uint64_t v6 = objc_autoreleasePoolPush();
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v7 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v21 = [a4 recordID];
      __int16 v22 = 2113;
      id v23 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sync engine fetched CKRecord with CKRecordID %{public}@, record = %{private}@",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v10 = qword_1019346E8;
      int v16 = 138543619;
      id v17 = [a4 recordID];
      __int16 v18 = 2113;
      id v19 = a4;
      id v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  0LL,  "Sync engine fetched CKRecord with CKRecordID %{public}@, record = %{private}@",  &v16,  22);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v11);
    }

    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxOutput"))
    {
      -[CLVO2MaxCloudKitManager handleFetchedOutputRecord:](self, "handleFetchedOutputRecord:", a4);
    }

    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", @"VO2MaxInput"))
    {
      -[CLVO2MaxCloudKitManager handleFetchedInputRecord:](self, "handleFetchedInputRecord:", a4);
    }

    else
    {
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v8 = (os_log_s *)qword_1019346E8;
      if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [a4 recordType];
        *(_DWORD *)buf = 138543362;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Fetched record of unexpected type: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346E0 != -1) {
          dispatch_once(&qword_1019346E0, &stru_10182DF18);
        }
        uint64_t v12 = qword_1019346E8;
        id v13 = [a4 recordType];
        int v16 = 138543362;
        id v17 = v13;
        LODWORD(v15) = 12;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  16LL,  "Fetched record of unexpected type: %{public}@",  &v16,  v15);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v14);
      }
    }

    objc_autoreleasePoolPop(v6);
  }

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  if (qword_1019346E0 != -1) {
    dispatch_once(&qword_1019346E0, &stru_10182DF18);
  }
  int v7 = (os_log_s *)qword_1019346E8;
  if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = a4;
    __int16 v15 = 2114;
    id v16 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Sync engine unexpectedly fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    int v9 = 138543618;
    id v10 = a4;
    __int16 v11 = 2114;
    id v12 = a5;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346E8,  16LL,  "Sync engine unexpectedly fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@",  &v9,  22);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLVO2MaxCloudKitManager syncEngine:recordWithIDWasDeleted:recordType:]",  "%s\n",  v8);
  }

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  if (self->_syncEngine == a3)
  {
    if (qword_1019346E0 != -1) {
      dispatch_once(&qword_1019346E0, &stru_10182DF18);
    }
    uint64_t v5 = (os_log_s *)qword_1019346E8;
    if (os_log_type_enabled((os_log_t)qword_1019346E8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = [a4 length];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received updated metadata from sync engine, length = %{public}lu",  (uint8_t *)&buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1019346E0 != -1) {
        dispatch_once(&qword_1019346E0, &stru_10182DF18);
      }
      uint64_t v8 = qword_1019346E8;
      int v10 = 134349056;
      id v11 = [a4 length];
      int v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "Received updated metadata from sync engine, length = %{public}lu",  &v10,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLVO2MaxCloudKitManager syncEngine:didUpdateMetadata:]", "%s\n", v9);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)&__int128 buf = 0LL;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    CFAbsoluteTime v13 = Current;
    id v14 = a4;
    uint64_t v7 = sub_100D74AD8();
    sub_100D75634(v7, (uint64_t)&buf);
  }

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  id v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  uint64_t v5 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *, SEL))(*(void *)v5 + 24LL))(v5, a2);
  }
  uint64_t v6 = self->fStagingOutputStore.__ptr_.__value_;
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
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((_BYTE *)self + 112) = 0;
  *((_DWORD *)self + 41) = -1;
  *(void *)&__int128 v2 = -1LL;
  *((void *)&v2 + 1) = -1LL;
  *(_OWORD *)((char *)self + 148) = v2;
  *(_OWORD *)((char *)self + 132) = v2;
  *(_OWORD *)((char *)self + 116) = v2;
  *((void *)self + 21) = 0xBFF0000000000000LL;
  return self;
}

@end