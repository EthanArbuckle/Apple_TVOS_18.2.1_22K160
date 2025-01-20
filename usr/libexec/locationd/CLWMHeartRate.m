@interface CLWMHeartRate
- (CLWMHeartRate)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onHeartRateNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMHeartRate

- (CLWMHeartRate)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMHeartRate;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disableForceActiveListeners = a5->disableForceActiveListeners;
    result->_sampleCount = 0;
  }

  return result;
}

- (void)setupListener
{
  if (self->_heartRateObserverClient.__ptr_.__value_)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A4378);
    }
    v7 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "!_heartRateObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A4378);
      }
    }

    v8 = (os_log_s *)qword_101934678;
    if (os_signpost_enabled((os_log_t)qword_101934678))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "!_heartRateObserverClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of heart rate listener.",  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A4378);
      }
    }

    objc_super v9 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "!_heartRateObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMHeartRate.mm",  63,  "-[CLWMHeartRate setupListener]");
  }

  sub_10070EDF0((uint64_t)sub_1012202D4, (uint64_t)self, self->_delegate, buf);
  v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  if (self->_disableForceActiveListeners) {
    uint64_t v6 = 5LL;
  }
  else {
    uint64_t v6 = 4LL;
  }
  [*((id *)self->_heartRateObserverClient.__ptr_.__value_ + 2) register:*((void *)self->_heartRateObserverClient.__ptr_.__value_ + 1) forNotification:v6 registrationInfo:0];
}

- (void)teardownListeners
{
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (void)onHeartRateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    ++self->_sampleCount;
    if ((*a3 & 0xFFFFFFFE) == 4)
    {
      sub_101125260(v22);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v24 |= 1u;
      v22[77] = v7;
      sub_101138DF0(v22);
      sub_10114FA2C(v23);
      v8 = v23;
      uint64_t v9 = v23[1];
      int v10 = *(_DWORD *)a4;
      *(_WORD *)(v9 + 68) |= 0x40u;
      *(_DWORD *)(v9 + 52) = v10;
      uint64_t v11 = v8[1];
      uint64_t v12 = *((void *)a4 + 1);
      *(_WORD *)(v11 + 68) |= 2u;
      *(void *)(v11 + 16) = v12;
      uint64_t v13 = v8[1];
      uint64_t v14 = *((void *)a4 + 2);
      *(_WORD *)(v13 + 68) |= 1u;
      *(void *)(v13 + 8) = v14;
      uint64_t v15 = v8[1];
      LOBYTE(v10) = *((_BYTE *)a4 + 24);
      *(_WORD *)(v15 + 68) |= 0x200u;
      *(_BYTE *)(v15 + 64) = v10;
      uint64_t v16 = v8[1];
      uint64_t v17 = *((void *)a4 + 4);
      *(_WORD *)(v16 + 68) |= 0x10u;
      *(void *)(v16 + 40) = v17;
      uint64_t v18 = v8[1];
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 5));
      *(_WORD *)(v18 + 68) |= 8u;
      *(void *)(v18 + 32) = v19;
      uint64_t v20 = v8[1];
      int v21 = *((_DWORD *)a4 + 14);
      *(_WORD *)(v20 + 68) |= 0x20u;
      *(_DWORD *)(v20 + 48) = v21;
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
      sub_101127D00((PB::Base *)v22);
    }
  }

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void).cxx_destruct
{
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

@end