@interface CMHealthColdStorageService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CMHealthColdStorageService)init;
- (id).cxx_construct;
- (id)syncgetFetchColdStorageConfiguration;
- (int)getTotalDBSizeInMB;
- (int64_t)getHealthColdStorageDbCleanupActivityInterval;
- (void)beginService;
- (void)endService;
- (void)logAnalytics:(id)a3;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onDbCleanupActivity:(id)a3;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)performDbCleanUpOnActivity:(id)a3;
- (void)performSyncWithCompletion:(id)a3 activity:(id)a4;
- (void)registerDatabaseAtURL:(id)a3 tableName:(id)a4 isClassB:(BOOL)a5 sourceDevice:(int)a6 cloudKitDelegate:(id)a7;
- (void)resetAnalytics;
- (void)sendAnalytics;
- (void)setupDbCleanupActivity;
- (void)setupSyncActivity;
@end

@implementation CMHealthColdStorageService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199D4B0 != -1) {
    dispatch_once(&qword_10199D4B0, &stru_10187AFF0);
  }
  return (id)qword_10199D4A8;
}

- (CMHealthColdStorageService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMHealthColdStorageService;
  return -[CMHealthColdStorageService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CMHealthColdStorageServiceProtocol,  &OBJC_PROTOCOL___CMHealthColdStorageServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10199D4C0 != -1) {
    dispatch_once(&qword_10199D4C0, &stru_10187B010);
  }
  return byte_10199D4B8;
}

- (void)beginService
{
  LOBYTE(v17[0]) = 0;
  sub_1012049AC(buf, "ColdStorageManagerEnableCloudKit", (unsigned __int8 *)v17, 0);
  int v3 = buf[1];
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  v4 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning CMHealthColdStorageService, CloudKit sync: %d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v17[0] = 67109120;
    v17[1] = v3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Beginning CMHealthColdStorageService, CloudKit sync: %d",  v17);
    v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService beginService]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

  unint64_t v5 = operator new(0x98uLL);
  sub_100BE5AF8((uint64_t)v5, v3 != 0);
  sub_100C8D628((uint64_t *)&self->fManager, (uint64_t)v5);
  sub_100BE70F4((uint64_t)self->fManager.__ptr_.__value_, buf);
  sub_10005F550((uint64_t)&self->fStats, (__int128 *)buf);
  v6 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v7 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  sub_100ACD980((uint64_t)sub_100C88D3C, (uint64_t)self, self, buf);
  v9 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = v9;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    uint64_t v11 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
    }
  }

  [*((id *)self->fDataProtectionClient.__ptr_.__value_ + 2) register:*((void *)self->fDataProtectionClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_10060B0A4((uint64_t)sub_100C88D4C, (uint64_t)self, -[CMHealthColdStorageService universe](self, "universe"), buf);
  v12 = *(Client **)buf;
  *(void *)buf = 0LL;
  v13 = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = v12;
  if (v13)
  {
    (*(void (**)(Client *))(*(void *)v13 + 8LL))(v13);
    uint64_t v14 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
    }
  }

  [*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2) register:*((void *)self->fFitnessTrackingClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  [*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2) register:*((void *)self->fFitnessTrackingClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  -[CMHealthColdStorageService setupSyncActivity](self, "setupSyncActivity");
  -[CMHealthColdStorageService setupDbCleanupActivity](self, "setupDbCleanupActivity");
}

- (void)endService
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  int v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Shutting down CMHealthColdStorageService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "Shutting down CMHealthColdStorageService",  v8,  2);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService endService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  unint64_t v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:0];
    [*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2) unregister:*((void *)self->fFitnessTrackingClient.__ptr_.__value_ + 1) forNotification:6];
  }

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  v7 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onDataProtectionNotification", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v11[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "onDataProtectionNotification",  v11,  2);
    v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageService onDataProtectionNotification:data:]",  "%s\n",  v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  if (!*a3)
  {
    value = self->fManager.__ptr_.__value_;
    if (value) {
      sub_100BE66A4(value, *(_DWORD *)a4 == 1);
    }
  }

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  v7 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onFitnessTrackingNotification", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    LOWORD(v23[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "onFitnessTrackingNotification",  v23,  2);
    v21 = (uint8_t *)v20;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]",  "%s\n",  v20);
    if (v21 != buf) {
      free(v21);
    }
  }

  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  if (*a3 == 6)
  {
    int v8 = *(_DWORD *)a4;
    if (*(_DWORD *)a4)
    {
      if (v8 == 2)
      {
        value = self->fManager.__ptr_.__value_;
        __int16 v10 = 0;
      }

      else
      {
        if (v8 != 1) {
          return;
        }
        value = self->fManager.__ptr_.__value_;
        __int16 v10 = 1;
      }

      sub_100BE84DC((uint64_t)value, v10);
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      v17 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "[Service] Received an unknown Watch.app Fitness Tracking state",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        LOWORD(v23[0]) = 0;
        LODWORD(v22) = 2;
        double v18 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[Service] Received an unknown Watch.app Fitness Tracking state",  v23,  v22);
        v16 = v19;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]",  "%s\n",  v18);
        goto LABEL_29;
      }
    }
  }

  else
  {
    if (!*a3)
    {
      sub_100BE8138((uint64_t)self->fManager.__ptr_.__value_, *((unsigned __int8 *)a4 + 3));
      return;
    }

    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    uint64_t v11 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_FAULT))
    {
      int v12 = *a3;
      *(_DWORD *)buf = 67109120;
      int v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "FitnessTracking: Unexpected notification type %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      int v13 = *a3;
      v23[0] = 67109120;
      v23[1] = v13;
      double v14 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  17LL,  "FitnessTracking: Unexpected notification type %d",  v23);
      v16 = v15;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]",  "%s\n",  v14);
LABEL_29:
      if (v16 != buf) {
        free(v16);
      }
    }
  }

- (void)registerDatabaseAtURL:(id)a3 tableName:(id)a4 isClassB:(BOOL)a5 sourceDevice:(int)a6 cloudKitDelegate:(id)a7
{
  if (a4 && a3 && self->fManager.__ptr_.__value_)
  {
    id v12 = [a3 absoluteString];
    sub_100104050(__dst, [v12 UTF8String], (size_t)objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4));
    sub_100104050(__p, [a4 UTF8String], (size_t)objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4));
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int v13 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      double v14 = __p;
      if (v21 < 0) {
        double v14 = (void **)__p[0];
      }
      v15 = __dst;
      if (v23 < 0) {
        v15 = (void **)__dst[0];
      }
      *(_DWORD *)buf = 136315394;
      v29 = v14;
      __int16 v30 = 2080;
      v31 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[Service] Adding DB for table %s in %s",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      v16 = __p;
      if (v21 < 0) {
        v16 = (void **)__p[0];
      }
      v17 = __dst;
      if (v23 < 0) {
        v17 = (void **)__dst[0];
      }
      int v24 = 136315394;
      int v25 = v16;
      __int16 v26 = 2080;
      v27 = v17;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[Service] Adding DB for table %s in %s",  (const char *)&v24,  22);
      v19 = (uint8_t *)v18;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageService registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:]",  "%s\n",  v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    sub_100BE5B74((uint64_t)self->fManager.__ptr_.__value_, (uint64_t)__dst, (std::string::size_type)__p, a5, a6, a7, 0);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
    if (v23 < 0) {
      operator delete(__dst[0]);
    }
  }

- (id)syncgetFetchColdStorageConfiguration
{
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p);
  v6[0] = CMColdStorageDatabasePath;
  v7[0] = -[NSString stringByAppendingPathComponent:]( v3,  "stringByAppendingPathComponent:",  @"cold_encryptedB.db");
  v7[1] = &off_1018D71C8;
  v6[1] = CMColdStorageCardioTableNames;
  v6[2] = CMColdStorageMobilityTableNames;
  v7[2] = &off_1018D71E0;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL);
}

- (void)setupSyncActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1LL);
  sub_10120AA44(v5, "HealthColdStorageSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100C89B4C;
  v4[3] = &unk_101831AF8;
  v4[4] = objc_msgSend( objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageSync", v3, v4);
  xpc_release(v3);
}

- (void)onSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "com.apple.locationd.Motion.ColdStorageSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int v12 = 136315138;
    int v13 = "com.apple.locationd.Motion.ColdStorageSync";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "Invalid xpc activity (%s).",  &v12);
LABEL_22:
    __int16 v10 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageService onSyncActivity:]", "%s\n", v8);
    if (v10 != buf) {
      free(v10);
    }
    return;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100C8A1C8;
    v11[3] = &unk_10182D2A0;
    v11[4] = a3;
    -[CMHealthColdStorageService performSyncWithCompletion:activity:]( self,  "performSyncWithCompletion:activity:",  v11,  a3);
    return;
  }

  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  v9 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "com.apple.locationd.Motion.ColdStorageSync";
    __int16 v18 = 2048;
    xpc_activity_state_t v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[Service] Unexpected activity (%s) state: %ld",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int v12 = 136315394;
    int v13 = "com.apple.locationd.Motion.ColdStorageSync";
    __int16 v14 = 2048;
    xpc_activity_state_t v15 = v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[Service] Unexpected activity (%s) state: %ld",  &v12,  22);
    goto LABEL_22;
  }

- (void)performSyncWithCompletion:(id)a3 activity:(id)a4
{
  dispatch_group_t v7 = dispatch_group_create();
  sub_100BE70F4((uint64_t)self->fManager.__ptr_.__value_, &v16);
  sub_10005F550((uint64_t)&self->fStats, &v16);
  int v8 = (std::__shared_weak_count *)*((void *)&v16 + 1);
  if (*((void *)&v16 + 1))
  {
    v9 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  dispatch_group_t v19 = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  -[CMHealthColdStorageService queryHealthKitWithGroup:](self, "queryHealthKitWithGroup:", &v19);
  if (v19) {
    dispatch_release(v19);
  }
  *(void *)&__int128 v16 = 0LL;
  *((void *)&v16 + 1) = &v16;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 100;
  dispatch_group_t v15 = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }

  id v11 = objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768LL;
  v13[2] = sub_100C8A8A4;
  v13[3] = &unk_10187B060;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = &v16;
  dispatch_group_t group = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }

  [v11 async:v13];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100C8A9E0;
  block[3] = &unk_10187B098;
  block[4] = self;
  block[5] = a3;
  block[6] = &v16;
  dispatch_group_notify( v7,  (dispatch_queue_t)objc_msgSend( objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo"),  "queue"),  block);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }

  if (v7)
  {
    dispatch_group_leave(v7);
    dispatch_release(v7);
    _Block_object_dispose(&v16, 8);
    dispatch_release(v7);
  }

  else
  {
    _Block_object_dispose(&v16, 8);
  }

- (BOOL)checkDeferral:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      unint64_t v5 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        char v21 = "com.apple.locationd.Motion.ColdStorageSync";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[Service] Cancelling (%{public}s) early due to deferral.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        int v18 = 136446210;
        dispatch_group_t v19 = "com.apple.locationd.Motion.ColdStorageSync";
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[Service] Cancelling (%{public}s) early due to deferral.",  &v18,  12);
        int v12 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      if (xpc_activity_set_state((xpc_activity_t)a3, 3LL))
      {
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        xpc_activity_state_t v6 = (os_log_s *)qword_1019347B8;
        if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "[Service] Activity deferred",  &v18,  v17);
        int v8 = (uint8_t *)v7;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v7);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      else
      {
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        v9 = (os_log_s *)qword_1019347B8;
        if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          char v21 = (const char *)state;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "[Service] Failed to defer activity. Current state is %{public}ld",  buf,  0xCu);
        }

        if (!sub_1002921D0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10187B0E0);
        }
        uint64_t v13 = qword_1019347B8;
        xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
        int v18 = 134349056;
        dispatch_group_t v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  17LL,  "[Service] Failed to defer activity. Current state is %{public}ld",  &v18,  v17);
        int v8 = (uint8_t *)v15;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v15);
        if (v8 == buf) {
          goto LABEL_24;
        }
      }

      free(v8);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }

  else
  {
    LOBYTE(should_defer) = 0;
  }

  return should_defer;
}

- (int64_t)getHealthColdStorageDbCleanupActivityInterval
{
  int64_t v7 = XPC_ACTIVITY_INTERVAL_4_HOURS;
  sub_10120AA44(v6, "HealthColdStorageDbCleanupActivityInterval", &v7, 0);
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  v2 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "HealthColdStorage: Db Vacuum interval, %lld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int v8 = 134217984;
    int64_t v9 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "HealthColdStorage: Db Vacuum interval, %lld",  &v8);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageService getHealthColdStorageDbCleanupActivityInterval]",  "%s\n",  v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  return v7;
}

- (void)setupDbCleanupActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1LL);
  xpc_dictionary_set_int64( v3,  XPC_ACTIVITY_INTERVAL,  -[CMHealthColdStorageService getHealthColdStorageDbCleanupActivityInterval]( self,  "getHealthColdStorageDbCleanupActivityInterval"));
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100C8B1F0;
  handler[3] = &unk_101831AF8;
  handler[4] = objc_msgSend( objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CMHealthColdStorageService");
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageDbCleanup", v3, handler);
  xpc_release(v3);
}

- (void)performDbCleanUpOnActivity:(id)a3
{
}

- (void)onDbCleanupActivity:(id)a3
{
  if (!a3)
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int64_t v11 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_group_t v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "Invalid xpc activity (%s).",  &v14);
LABEL_32:
    unint64_t v10 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v12);
    if (v10 == buf) {
      return;
    }
    goto LABEL_33;
  }

  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    -[CMHealthColdStorageService performDbCleanUpOnActivity:](self, "performDbCleanUpOnActivity:", a3);
    if (xpc_activity_get_state((xpc_activity_t)a3) == 3 || xpc_activity_set_state((xpc_activity_t)a3, 5LL)) {
      return;
    }
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int64_t v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_group_t v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      __int16 v20 = 2050;
      xpc_activity_state_t v21 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "[Service] Failed to mark (%s) activity as done. Current state is %{public}ld",  buf,  0x16u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    uint64_t v8 = qword_1019347B8;
    int v14 = 136315394;
    dispatch_group_t v15 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
    __int16 v16 = 2050;
    xpc_activity_state_t v17 = xpc_activity_get_state((xpc_activity_t)a3);
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  17LL,  "[Service] Failed to mark (%s) activity as done. Current state is %{public}ld",  &v14,  22);
    unint64_t v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v9);
    if (v10 == buf) {
      return;
    }
LABEL_33:
    free(v10);
    return;
  }

  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  uint64_t v13 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_group_t v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
    __int16 v20 = 2048;
    xpc_activity_state_t v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[Service] Unexpected activity (%s) state: %ld",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[Service] Unexpected activity (%s) state: %ld",  &v14,  22);
    goto LABEL_32;
  }

- (void)resetAnalytics
{
  ptr = self->fStats.__ptr_;
  *(void *)ptr = 0LL;
  *((void *)ptr + 1) = 0LL;
  *((_DWORD *)ptr + 4) = 0;
  sub_1000229D4((uint64_t)ptr + 24, *((char **)ptr + 4));
  *((void *)ptr + 3) = (char *)ptr + 32;
  *((void *)ptr + 5) = 0LL;
  *((void *)ptr + 4) = 0LL;
  v4 = self->fStats.__ptr_;
  *((_DWORD *)v4 + 13) = 0;
  *((_DWORD *)v4 + 14) = 0;
}

- (void)logAnalytics:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  xpc_activity_state_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100C8BCCC;
  v10[3] = &unk_10187B0C0;
  v10[4] = v4;
  v10[5] = v5;
  v10[6] = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10187B0E0);
  }
  int64_t v7 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2114;
    __int16 v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:[Service::logAnalytics], Daily additions:%{public, location:escape_only}@}",  buf,  0x1Cu);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
  }

  uint64_t v8 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2114;
    __int16 v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:[Service::logAnalytics], Daily purges:%{public, location:escape_only}@}",  buf,  0x1Cu);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
  }

  int64_t v9 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:[Service::logAnalytics], Other:%{public, location:escape_only}@}",  buf,  0x1Cu);
  }
}

- (void)sendAnalytics
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_10199D4E0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_10199D4E0))
  {
    *(void *)buf = 0x3E800000000LL;
    int v104 = 10000;
    sub_100B48D24(&qword_10199D4C8, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100B48DA4, &qword_10199D4C8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10199D4E0);
  }

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_10199D500);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_10199D500))
  {
    *(void *)buf = &_mh_execute_header;
    int v104 = 2;
    sub_100B48D24(&qword_10199D4E8, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100B48DA4, &qword_10199D4E8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10199D500);
  }

  v106[0] = @"CountCKError_Others";
  v107[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(_DWORD *)self->fStats.__ptr_);
  v106[1] = @"CountCKError_PrivateMissingManateeIdentity";
  v107[1] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)self->fStats.__ptr_ + 1));
  v106[2] = @"CountCKError_ServerRecordChanged";
  v107[2] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)self->fStats.__ptr_ + 2));
  v106[3] = @"CountCKError_UnknownItem";
  v107[3] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)self->fStats.__ptr_ + 3));
  v106[4] = @"CountCKError_ZoneNotFound";
  v107[4] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)self->fStats.__ptr_ + 4));
  v106[5] = @"NumDailyRecords_HRRIHH";
  ptr = self->fStats.__ptr_;
  sub_1010DDBC0(buf, "HRRecoveryInputHRHistory");
  v100[0] = buf;
  v107[5] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)ptr + 3,  (const void **)buf,  (uint64_t)&unk_1012CF090,  (_OWORD **)v100)
              + 14));
  v106[6] = @"NumDailyRecords_HRRIWH";
  xpc_activity_state_t v6 = self->fStats.__ptr_;
  sub_1010DDBC0(v100, "HRRecoveryInputWRHistory");
  v98[0] = v100;
  v107[6] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v6 + 3,  (const void **)v100,  (uint64_t)&unk_1012CF090,  (_OWORD **)v98)
              + 14));
  v106[7] = @"NumDailyRecords_HRRSH";
  int64_t v7 = self->fStats.__ptr_;
  sub_1010DDBC0(v98, "HRRecoverySessionHistory");
  v96[0] = v98;
  v107[7] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v7 + 3,  (const void **)v98,  (uint64_t)&unk_1012CF090,  (_OWORD **)v96)
              + 14));
  v106[8] = @"NumDailyRecords_MBMH";
  uint64_t v8 = self->fStats.__ptr_;
  sub_1010DDBC0(v96, "MobilityBoutMetricsHistory");
  v94[0] = v96;
  v107[8] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v8 + 3,  (const void **)v96,  (uint64_t)&unk_1012CF090,  (_OWORD **)v94)
              + 14));
  v106[9] = @"NumDailyRecords_PWDBH";
  int64_t v9 = self->fStats.__ptr_;
  sub_1010DDBC0(v94, "PredictedWalkDistanceBoutHistory");
  v92[0] = v94;
  v107[9] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v9 + 3,  (const void **)v94,  (uint64_t)&unk_1012CF090,  (_OWORD **)v92)
              + 14));
  v106[10] = @"NumDailyRecords_SCH";
  unint64_t v10 = self->fStats.__ptr_;
  sub_1010DDBC0(v92, "StrideCalHistory");
  v90[0] = v92;
  v107[10] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v10 + 3,  (const void **)v92,  (uint64_t)&unk_1012CF090,  (_OWORD **)v90)
               + 14));
  v106[11] = @"NumDailyRecords_WSSC";
  int64_t v11 = self->fStats.__ptr_;
  sub_1010DDBC0(v90, "WalkingSpeedStrideCal");
  v88[0] = v90;
  v107[11] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v11 + 3,  (const void **)v90,  (uint64_t)&unk_1012CF090,  (_OWORD **)v88)
               + 14));
  v106[12] = @"NumDailyRecords_SGMH";
  int v12 = self->fStats.__ptr_;
  sub_1010DDBC0(v88, "SmoothedGaitMetricsHistory");
  v86[0] = v88;
  v107[12] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v12 + 3,  (const void **)v88,  (uint64_t)&unk_1012CF090,  (_OWORD **)v86)
               + 14));
  v106[13] = @"NumDailyRecords_EGH";
  __int16 v13 = self->fStats.__ptr_;
  sub_1010DDBC0(v86, "ElevationGradeHistory");
  v84[0] = v86;
  v107[13] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v13 + 3,  (const void **)v86,  (uint64_t)&unk_1012CF090,  (_OWORD **)v84)
               + 14));
  v106[14] = @"NumDailyRecords_VOMH";
  int v14 = self->fStats.__ptr_;
  sub_1010DDBC0(v84, "VO2MaxHistory");
  v82[0] = v84;
  v107[14] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v14 + 3,  (const void **)v84,  (uint64_t)&unk_1012CF090,  (_OWORD **)v82)
               + 14));
  v106[15] = @"NumDailyRecords_VOMIH";
  __int16 v15 = self->fStats.__ptr_;
  sub_1010DDBC0(v82, "VO2MaxInputHistory");
  v80[0] = v82;
  v107[15] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v15 + 3,  (const void **)v82,  (uint64_t)&unk_1012CF090,  (_OWORD **)v80)
               + 14));
  v106[16] = @"NumDailyRecords_VOMSAH";
  __int16 v16 = self->fStats.__ptr_;
  sub_1010DDBC0(v80, "VO2MaxSessionAttributesHistory");
  v78[0] = v80;
  v107[16] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v16 + 3,  (const void **)v80,  (uint64_t)&unk_1012CF090,  (_OWORD **)v78)
               + 14));
  v106[17] = @"NumDailyRecords_VOMSH";
  xpc_activity_state_t v17 = self->fStats.__ptr_;
  sub_1010DDBC0(v78, "VO2MaxSummaryHistory");
  v76[0] = v78;
  v107[17] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v17 + 3,  (const void **)v78,  (uint64_t)&unk_1012CF090,  (_OWORD **)v76)
               + 14));
  v106[18] = @"NumPurgedDailyRecords_HRRIHH";
  int v18 = self->fStats.__ptr_;
  sub_1010DDBC0(v76, "HRRecoveryInputHRHistory");
  v74[0] = v76;
  v107[18] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v18 + 3,  (const void **)v76,  (uint64_t)&unk_1012CF090,  (_OWORD **)v74)
               + 15));
  v106[19] = @"NumPurgedDailyRecords_HRRIWH";
  dispatch_group_t v19 = self->fStats.__ptr_;
  sub_1010DDBC0(v74, "HRRecoveryInputWRHistory");
  v72[0] = v74;
  v107[19] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v19 + 3,  (const void **)v74,  (uint64_t)&unk_1012CF090,  (_OWORD **)v72)
               + 15));
  v106[20] = @"NumPurgedDailyRecords_HRRSH";
  __int16 v20 = self->fStats.__ptr_;
  sub_1010DDBC0(v72, "HRRecoverySessionHistory");
  v70[0] = v72;
  v107[20] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v20 + 3,  (const void **)v72,  (uint64_t)&unk_1012CF090,  (_OWORD **)v70)
               + 15));
  v106[21] = @"NumPurgedDailyRecords_MBMH";
  xpc_activity_state_t v21 = self->fStats.__ptr_;
  sub_1010DDBC0(v70, "MobilityBoutMetricsHistory");
  v68[0] = v70;
  v107[21] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v21 + 3,  (const void **)v70,  (uint64_t)&unk_1012CF090,  (_OWORD **)v68)
               + 15));
  v106[22] = @"NumPurgedDailyRecords_PWDBH";
  uint64_t v22 = self->fStats.__ptr_;
  sub_1010DDBC0(v68, "PredictedWalkDistanceBoutHistory");
  v66[0] = v68;
  v107[22] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v22 + 3,  (const void **)v68,  (uint64_t)&unk_1012CF090,  (_OWORD **)v66)
               + 15));
  v106[23] = @"NumPurgedDailyRecords_SCH";
  char v23 = self->fStats.__ptr_;
  sub_1010DDBC0(v66, "StrideCalHistory");
  v64[0] = v66;
  v107[23] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v23 + 3,  (const void **)v66,  (uint64_t)&unk_1012CF090,  (_OWORD **)v64)
               + 15));
  v106[24] = @"NumPurgedDailyRecords_WSSC";
  int v24 = self->fStats.__ptr_;
  sub_1010DDBC0(v64, "WalkingSpeedStrideCal");
  v62[0] = v64;
  v107[24] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v24 + 3,  (const void **)v64,  (uint64_t)&unk_1012CF090,  (_OWORD **)v62)
               + 15));
  v106[25] = @"NumPurgedDailyRecords_SGMH";
  int v25 = self->fStats.__ptr_;
  sub_1010DDBC0(v62, "SmoothedGaitMetricsHistory");
  v60[0] = v62;
  v107[25] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v25 + 3,  (const void **)v62,  (uint64_t)&unk_1012CF090,  (_OWORD **)v60)
               + 15));
  v106[26] = @"NumPurgedDailyRecords_EGH";
  __int16 v26 = self->fStats.__ptr_;
  sub_1010DDBC0(v60, "ElevationGradeHistory");
  v58[0] = v60;
  v107[26] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v26 + 3,  (const void **)v60,  (uint64_t)&unk_1012CF090,  (_OWORD **)v58)
               + 15));
  v106[27] = @"NumPurgedDailyRecords_VOMH";
  v27 = self->fStats.__ptr_;
  sub_1010DDBC0(v58, "VO2MaxHistory");
  v56[0] = v58;
  v107[27] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v27 + 3,  (const void **)v58,  (uint64_t)&unk_1012CF090,  (_OWORD **)v56)
               + 15));
  v106[28] = @"NumPurgedDailyRecords_VOMIH";
  v28 = self->fStats.__ptr_;
  sub_1010DDBC0(v56, "VO2MaxInputHistory");
  v54[0] = v56;
  v107[28] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v28 + 3,  (const void **)v56,  (uint64_t)&unk_1012CF090,  (_OWORD **)v54)
               + 15));
  v106[29] = @"NumPurgedDailyRecords_VOMSAH";
  v29 = self->fStats.__ptr_;
  sub_1010DDBC0(v54, "VO2MaxSessionAttributesHistory");
  v52[0] = v54;
  v107[29] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v29 + 3,  (const void **)v54,  (uint64_t)&unk_1012CF090,  (_OWORD **)v52)
               + 15));
  v106[30] = @"NumPurgedDailyRecords_VOMSH";
  __int16 v30 = self->fStats.__ptr_;
  sub_1010DDBC0(v52, "VO2MaxSummaryHistory");
  v102 = v52;
  v107[30] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)sub_1000C042C( (uint64_t **)v30 + 3,  (const void **)v52,  (uint64_t)&unk_1012CF090,  (_OWORD **)&v102)
               + 15));
  v106[31] = @"CKSyncEnabled";
  v107[31] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned __int8 *)self->fStats.__ptr_ + 48));
  v106[32] = @"DailyStepCounts";
  int v31 = *((_DWORD *)self->fStats.__ptr_ + 13);
  v50 = 0LL;
  uint64_t v51 = 0LL;
  v49 = 0LL;
  sub_10001B72C( &v49,  (const void *)qword_10199D4C8,  *(uint64_t *)algn_10199D4D0,  (*(void *)algn_10199D4D0 - qword_10199D4C8) >> 2);
  if (v50 == v49)
  {
    unint64_t v32 = 0LL;
  }

  else
  {
    unint64_t v32 = 0LL;
    unint64_t v33 = (v50 - (_BYTE *)v49) >> 2;
    if (v33 <= 1) {
      unint64_t v33 = 1LL;
    }
    while (*((_DWORD *)v49 + v32) < v31)
    {
      if (v33 == ++v32)
      {
        unint64_t v32 = v33;
        break;
      }
    }
  }

  v107[32] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v32);
  v106[33] = @"OutdoorPedWorkoutCounts";
  int v34 = *((_DWORD *)self->fStats.__ptr_ + 14);
  v47 = 0LL;
  uint64_t v48 = 0LL;
  std::string __p = 0LL;
  sub_10001B72C( &__p,  (const void *)qword_10199D4E8,  *(uint64_t *)algn_10199D4F0,  (*(void *)algn_10199D4F0 - qword_10199D4E8) >> 2);
  if (v47 == __p)
  {
    unint64_t v35 = 0LL;
  }

  else
  {
    unint64_t v35 = 0LL;
    unint64_t v36 = (v47 - (_BYTE *)__p) >> 2;
    if (v36 <= 1) {
      unint64_t v36 = 1LL;
    }
    while (*((_DWORD *)__p + v35) < v34)
    {
      if (v36 == ++v35)
      {
        unint64_t v35 = v36;
        break;
      }
    }
  }

  v107[33] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v35);
  v106[34] = @"TotalDbSizeMB";
  v107[34] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)self->fStats.__ptr_ + 15));
  v37 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v107,  v106,  35LL);
  if (__p)
  {
    v47 = __p;
    operator delete(__p);
  }

  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }

  if (v53 < 0) {
    operator delete(v52[0]);
  }
  if (v55 < 0) {
    operator delete(v54[0]);
  }
  if (v57 < 0) {
    operator delete(v56[0]);
  }
  if (v59 < 0) {
    operator delete(v58[0]);
  }
  if (v61 < 0) {
    operator delete(v60[0]);
  }
  if (v63 < 0) {
    operator delete(v62[0]);
  }
  if (v65 < 0) {
    operator delete(v64[0]);
  }
  if (v67 < 0) {
    operator delete(v66[0]);
  }
  if (v69 < 0) {
    operator delete(v68[0]);
  }
  if (v71 < 0) {
    operator delete(v70[0]);
  }
  if (v73 < 0) {
    operator delete(v72[0]);
  }
  if (v75 < 0) {
    operator delete(v74[0]);
  }
  if (v77 < 0) {
    operator delete(v76[0]);
  }
  if (v79 < 0) {
    operator delete(v78[0]);
  }
  if (v81 < 0) {
    operator delete(v80[0]);
  }
  if (v83 < 0) {
    operator delete(v82[0]);
  }
  if (v85 < 0) {
    operator delete(v84[0]);
  }
  if (v87 < 0) {
    operator delete(v86[0]);
  }
  if (v89 < 0) {
    operator delete(v88[0]);
  }
  if (v91 < 0) {
    operator delete(v90[0]);
  }
  if (v93 < 0) {
    operator delete(v92[0]);
  }
  if (v95 < 0) {
    operator delete(v94[0]);
  }
  if (v97 < 0) {
    operator delete(v96[0]);
  }
  if (v99 < 0) {
    operator delete(v98[0]);
  }
  if (v101 < 0) {
    operator delete(v100[0]);
  }
  if (v105 < 0) {
    operator delete(*(void **)buf);
  }
  -[CMHealthColdStorageService logAnalytics:](self, "logAnalytics:", v37);
  *(void *)&double v38 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v39
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v38),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100C8D164;
    v45[3] = &unk_101820740;
    v45[4] = v37;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.ColdStorage", v45);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v40 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "HealthColdStorage, sent Core Analytics event.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      LOWORD(v100[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "HealthColdStorage, sent Core Analytics event.",  v100,  2);
      v42 = (uint8_t *)v41;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService sendAnalytics]", "%s\n", v41);
LABEL_92:
      if (v42 != buf) {
        free(v42);
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    v43 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "HealthColdStorage, not sending analytics, no IHA permission",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      LOWORD(v100[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "HealthColdStorage, not sending analytics, no IHA permission",  v100,  2);
      v42 = (uint8_t *)v44;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService sendAnalytics]", "%s\n", v44);
      goto LABEL_92;
    }
  }

- (int)getTotalDBSizeInMB
{
  if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v2 = __p;
  }
  else {
    v2 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
  }
  unsigned __int8 v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2);
  unsigned __int8 v4 = -[NSString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", @"cold_encryptedB.db");
  std::string::size_type v15 = 0LL;
  unint64_t v5 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  v4,  &v15);
  if (v5) {
    BOOL v6 = v15 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    unint64_t v8 = -[NSDictionary fileSize](v5, "fileSize");
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int64_t v9 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138543618;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
      WORD2(__p[0].__r_.__value_.__r.__words[1]) = 2050;
      *(std::string::size_type *)((char *)&__p[0].__r_.__value_.__r.__words[1] + 6) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "getTotalDBSize(%{public}@) %{public}llu bytes",  (uint8_t *)__p,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      int v16 = 138543618;
      xpc_activity_state_t v17 = v4;
      __int16 v18 = 2050;
      unint64_t v19 = v8;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019347B8,  1LL,  "getTotalDBSize(%{public}@) %{public}llu bytes",  &v16,  22);
      int v14 = (std::string *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", v13);
      if (v14 != __p) {
        free(v14);
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10187B0E0);
    }
    int64_t v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unable to get total DB size: %@",  (uint8_t *)__p,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10187B0E0);
      }
      int v16 = 138412290;
      xpc_activity_state_t v17 = (NSString *)v15;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "Unable to get total DB size: %@",  &v16,  12);
      int v12 = (std::string *)v11;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", v11);
      if (v12 != __p) {
        free(v12);
      }
    }

    unint64_t v8 = 0LL;
  }

  return (int)((double)v8 / 1000000.0);
}

- (void).cxx_destruct
{
  int64_t value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  unsigned __int8 v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  sub_100C8D628((uint64_t *)&self->fManager, 0LL);
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