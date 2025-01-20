@interface CLPrivacyManager
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isReadyToVacuumEncryptionClass:(id)a3;
- (CLPrivacyManager)init;
- (id).cxx_construct;
- (void)beginService;
- (void)checkInForActivityWithIdentifier:(id)a3;
- (void)dealloc;
- (void)onActivity:(id)a3 withIdentifier:(id)a4;
- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4;
- (void)retryActivityForEncryptionClass:(id)a3 reason:(int)a4;
- (void)scheduleVacuumWithReason:(id)a3;
- (void)vacuumAll;
@end

@implementation CLPrivacyManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A0788 != -1) {
    dispatch_once(&qword_1019A0788, &stru_1018A3708);
  }
  return (id)qword_1019A0780;
}

- (CLPrivacyManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLPrivacyManager;
  v2 = -[CLPrivacyManager initWithInboundProtocol:outboundProtocol:]( &v4,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPrivacyManagerProtocol,  &OBJC_PROTOCOL___CLPrivacyManagerClientProtocol);
  if (v2) {
    v2->_activities = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  self->_activities = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPrivacyManager;
  -[CLPrivacyManager dealloc](&v3, "dealloc");
}

- (void)beginService
{
  self->_timeStarted = mach_continuous_approximate_time();
  sub_1002F0B04(&buf);
  int v3 = sub_1002A6F64((uint64_t)buf.__r_.__value_.__l.__data_, "DisableCLPrivacyManager", &v12);
  if (v12) {
    BOOL disabled = v3;
  }
  else {
    BOOL disabled = 0;
  }
  self->_BOOL disabled = disabled;
  size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
  if (buf.__r_.__value_.__l.__size_)
  {
    v6 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }

    BOOL disabled = self->_disabled;
  }

  if (disabled)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      buf.__r_.__value_.__r.__words[0] = 68289026LL;
      LOWORD(buf.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning CLPrivacyManager is disabled by defaults write!}",  (uint8_t *)&buf,  0x12u);
    }
  }

  sub_100583844((uint64_t)sub_10120C9B8, (uint64_t)self, -[CLPrivacyManager universe](self, "universe"), &buf);
  v9 = (Client *)buf.__r_.__value_.__r.__words[0];
  buf.__r_.__value_.__r.__words[0] = 0LL;
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = v9;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    std::string::size_type v11 = buf.__r_.__value_.__r.__words[0];
    buf.__r_.__value_.__r.__words[0] = 0LL;
    if (v11) {
      (*(void (**)(std::string::size_type))(*(void *)v11 + 8LL))(v11);
    }
  }

  memset(&buf, 0, sizeof(buf));
  std::string::operator=(&buf, &stru_1019A0768);
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_10120E548((uint64_t)&buf)];
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  -[CLPrivacyManager checkInForActivityWithIdentifier:]( self,  "checkInForActivityWithIdentifier:",  @"CLPrivacyManager.B");
  -[CLPrivacyManager checkInForActivityWithIdentifier:]( self,  "checkInForActivityWithIdentifier:",  @"CLPrivacyManager.C");
  -[CLPrivacyManager checkInForActivityWithIdentifier:]( self,  "checkInForActivityWithIdentifier:",  @"CLPrivacyManager.D");
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  if ([a1 valid])
  {
    if (a3 == 4)
    {
      if (*(_DWORD *)(a4 + 188) != 1)
      {
        unint64_t v7 = @"LocationServicesStatus";
        goto LABEL_15;
      }
    }

    else if (!a3)
    {
      unint64_t v7 = @"ResetLocationPrivacy";
LABEL_15:
      _[a1 scheduleVacuumWithReason:v7];
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor}",  (uint8_t *)&v10,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
    }

    v9 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor",  "{msg%{public}.0s:CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor}",  (uint8_t *)&v10,  0x12u);
    }
  }

- (void)scheduleVacuumWithReason:(id)a3
{
  unint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: Scheduling vacuum",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A3728);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2082;
    v21 = "activity";
    __int16 v22 = 2114;
    id v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Scheduling vacuum, event:%{public, location:escape_only}s, reason:%{public, locat ion:escape_only}@}",  buf,  0x26u);
  }

  if (self->_disabled)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    unint64_t v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning Not vacuuming due to defaults-based disablement}",  buf,  0x12u);
    }
  }

  else if (self->_deferVacuum)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Deferring previously scheduled vacuum}",  buf,  0x12u);
    }

    deferVacuum = self->_deferVacuum;
    dispatch_time_t v10 = dispatch_time(0LL, 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)deferVacuum, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }

  else
  {
    self->_deferVacuum = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( -[CLPrivacyManager silo](self, "silo"),  "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10120CFEC;
    block[3] = &unk_10181A288;
    block[4] = self;
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_source_set_event_handler((dispatch_source_t)self->_deferVacuum, v11);

    __int16 v12 = self->_deferVacuum;
    dispatch_time_t v13 = dispatch_time(0LL, 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_deferVacuum);
  }

  os_activity_scope_leave(&state);
}

- (void)vacuumAll
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A3728);
  }
  int v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 68289026;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Vacuuming all}",  buf,  0x12u);
  }

  if (!sub_10120D178(@"B")) {
    -[CLPrivacyManager retryActivityForEncryptionClass:reason:]( self,  "retryActivityForEncryptionClass:reason:",  @"B",  1LL);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10120D6DC;
  v4[3] = &unk_10181A288;
  v4[4] = self;
  objc_msgSend(objc_msgSend(-[CLPrivacyManager universe](self, "universe"), "silo"), "afterInterval:async:", v4, 15.0);
}

- (void)checkInForActivityWithIdentifier:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10120D798;
  v3[3] = &unk_101834E38;
  v3[4] = self;
  v3[5] = a3;
  xpc_activity_register((const char *)[a3 UTF8String], XPC_ACTIVITY_CHECK_IN, v3);
}

- (BOOL)isReadyToVacuumEncryptionClass:(id)a3
{
  if (![a3 isEqualToString:@"B"])
  {
LABEL_13:
    char v10 = 1;
    goto LABEL_14;
  }

  unint64_t v5 = (_xpc_activity_s *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_activities,  "objectForKeyedSubscript:",  a3);
  xpc_object_t v6 = xpc_activity_copy_criteria(v5);
  if (!v6)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    dispatch_block_t v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2114;
      id v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to copy criteria, encryptionClass:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
    }

    __int16 v12 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2114;
      id v20 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to copy criteria",  "{msg%{public}.0s:failed to copy criteria, encryptionClass:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
    }

    goto LABEL_13;
  }

  __int16 v7 = v6;
  v8 = (const char *)XPC_ACTIVITY_REQUIRES_CLASS_B;
  BOOL v9 = xpc_dictionary_get_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_B);
  if (v9)
  {
    xpc_dictionary_set_BOOL(v7, v8, 0);
    xpc_activity_set_criteria(v5, v7);
  }

  char v10 = !v9;

LABEL_14:
  uint64_t v13 = mach_continuous_approximate_time();
  if (sub_101171C7C(v13 - self->_timeStarted) >= 660.0) {
    return v10;
  }
  else {
    return 0;
  }
}

- (void)retryActivityForEncryptionClass:(id)a3 reason:(int)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A3728);
  }
  __int16 v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 68289538;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2114;
    id v22 = a3;
    __int16 v23 = 1026;
    int v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:retrying activity, encryptionClass:%{public, location:escape_only}@, reason:%{public}d}",  (uint8_t *)&v17,  0x22u);
  }

  v8 = (_xpc_activity_s *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_activities,  "objectForKeyedSubscript:",  a3);
  if (v8)
  {
    BOOL v9 = v8;
    xpc_object_t v10 = xpc_activity_copy_criteria(v8);
    if (v10)
    {
      dispatch_block_t v11 = v10;
      if (a4 == 1)
      {
        xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_4_HOURS);
      }

      else
      {
        xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
      }

      xpc_activity_set_criteria(v9, v11);

      return;
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    int v16 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2114;
      id v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to copy criteria, encryptionClass:%{public, location:escape_only}@}",  (uint8_t *)&v17,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
    }

    uint64_t v13 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2114;
      id v22 = a3;
      v14 = "failed to copy criteria";
      int v15 = "{msg%{public}.0s:failed to copy criteria, encryptionClass:%{public, location:escape_only}@}";
      goto LABEL_24;
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A3728);
    }
    __int16 v12 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2114;
      id v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to get activity, encryptionClass:%{public, location:escape_only}@}",  (uint8_t *)&v17,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
    }

    uint64_t v13 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2114;
      id v22 = a3;
      v14 = "failed to get activity";
      int v15 = "{msg%{public}.0s:failed to get activity, encryptionClass:%{public, location:escape_only}@}";
LABEL_24:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v14,  v15,  (uint8_t *)&v17,  0x1Cu);
    }
  }

- (void)onActivity:(id)a3 withIdentifier:(id)a4
{
  xpc_activity_state_t v7 = xpc_activity_get_state((xpc_activity_t)a3);
  v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: CLPrivacyManager activity handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A3728);
  }
  BOOL v9 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 68289794;
    int v25 = 0;
    __int16 v26 = 2082;
    v27 = "";
    __int16 v28 = 2082;
    v29 = "activity";
    __int16 v30 = 2114;
    v31 = (const char *)a4;
    __int16 v32 = 2050;
    xpc_activity_state_t v33 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLPrivacyManager activity handler, event:%{public, location:escape_only}s, job iden tifier:%{public, location:escape_only}@, state:%{public}ld}",  buf,  0x30u);
  }

  id v10 = [a4 componentsSeparatedByString:@"."];
  if ((objc_msgSend( objc_msgSend(v10, "objectAtIndexedSubscript:", 0),  "isEqualToString:",  @"CLPrivacyManager") & 1) == 0)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018A3748);
    }
    id v20 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)std::string buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "[a[0] isEqualToString:@CLPrivacyManager]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018A3748);
      }
    }

    __int16 v21 = (os_log_s *)qword_101934A78;
    if (os_signpost_enabled((os_log_t)qword_101934A78))
    {
      *(_DWORD *)std::string buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "[a[0] isEqualToString:@CLPrivacyManager]";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Assertion failed",  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018A3748);
      }
    }

    id v22 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 68289539;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2082;
      v29 = "assert";
      __int16 v30 = 2081;
      v31 = "[a[0] isEqualToString:@CLPrivacyManager]";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/PrivacyManager/CLPrivacyManager.mm",  320,  "-[CLPrivacyManager onActivity:withIdentifier:]");
    __break(1u);
LABEL_43:
    dispatch_once(&qword_101934980, &stru_1018A3728);
LABEL_8:
    __int16 v12 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)std::string buf = 68289026;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unexpected activity state. XPC bug?}",  buf,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
    }

    uint64_t v13 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)std::string buf = 68289026;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unexpected activity state. XPC bug?",  "{msg%{public}.0s:Unexpected activity state. XPC bug?}",  buf,  0x12u);
    }

    goto LABEL_31;
  }

  id v11 = [v10 objectAtIndexedSubscript:1];
  switch(v7)
  {
    case 0LL:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activities, "setObject:forKeyedSubscript:", a3, v11);
      goto LABEL_31;
    case 1LL:
    case 3LL:
    case 4LL:
    case 5LL:
      if (qword_101934980 == -1) {
        goto LABEL_8;
      }
      goto LABEL_43;
    case 2LL:
      if (self->_disabled)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018A3728);
        }
        uint64_t v14 = qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 68289026;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = "";
          int v15 = "{msg%{public}.0s:#warning Not vacuuming due to defaults-based disablement}";
          int v16 = (os_log_s *)v14;
          uint32_t v17 = 18;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
          goto LABEL_31;
        }

        goto LABEL_31;
      }

      if (!-[CLPrivacyManager isReadyToVacuumEncryptionClass:](self, "isReadyToVacuumEncryptionClass:", v11))
      {
        uint64_t v19 = 0LL;
LABEL_30:
        -[CLPrivacyManager retryActivityForEncryptionClass:reason:]( self,  "retryActivityForEncryptionClass:reason:",  v11,  v19);
        goto LABEL_31;
      }

      if (sub_10120D178(v11)) {
        goto LABEL_31;
      }
      if (!xpc_activity_should_defer((xpc_activity_t)a3) || !xpc_activity_set_state((xpc_activity_t)a3, 3LL))
      {
        uint64_t v19 = 1LL;
        goto LABEL_30;
      }

      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A3728);
      }
      uint64_t v18 = qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 68289282;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2114;
        v29 = (const char *)v11;
        int v15 = "{msg%{public}.0s:activity deferred, encryptionClass:%{public, location:escape_only}@}";
        int v16 = (os_log_s *)v18;
        uint32_t v17 = 28;
        goto LABEL_18;
      }

- (void).cxx_destruct
{
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end