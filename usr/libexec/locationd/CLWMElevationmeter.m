@interface CLWMElevationmeter
- (CLWMElevationmeter)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onElevationmetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMElevationmeter

- (CLWMElevationmeter)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMElevationmeter;
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
  if (self->_elevationmeterObserverClient.__ptr_.__value_)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3160);
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
      v16 = "!_elevationmeterObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of elevationmeter listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3160);
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
      v16 = "!_elevationmeterObserverClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of elevationmeter listener.",  "{msg%{public}.0s:Duplicate creation of elevationmeter listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3160);
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
      v16 = "!_elevationmeterObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of elevationmeter listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMElevationmeter.mm",  62,  "-[CLWMElevationmeter setupListener]");
  }

  sub_10027EB5C((uint64_t)sub_1011FDA4C, (uint64_t)self, self->_delegate, buf);
  v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = v3;
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
    uint64_t v6 = 7LL;
  }
  else {
    uint64_t v6 = 3LL;
  }
  [*((id *)self->_elevationmeterObserverClient.__ptr_.__value_ + 2) register:*((void *)self->_elevationmeterObserverClient.__ptr_.__value_ + 1) forNotification:v6 registrationInfo:0];
}

- (void)teardownListeners
{
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (void)onElevationmetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_101125260(v17);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v19 |= 1u;
      v17[77] = v7;
      sub_101138D9C(v17);
      sub_10116C4B4(v18);
      v8 = v18;
      uint64_t v9 = v18[1];
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 1));
      *(_WORD *)(v9 + 60) |= 1u;
      *(void *)(v9 + 8) = v10;
      uint64_t v11 = v8[1];
      int v12 = *((_DWORD *)a4 + 4);
      *(_WORD *)(v11 + 60) |= 0x10u;
      *(_DWORD *)(v11 + 32) = v12;
      uint64_t v13 = v8[1];
      int v14 = *((_DWORD *)a4 + 5);
      *(_WORD *)(v13 + 60) |= 0x20u;
      *(_DWORD *)(v13 + 36) = v14;
      uint64_t v15 = v8[1];
      int v16 = *((_DWORD *)a4 + 10);
      *(_WORD *)(v15 + 60) |= 0x200u;
      *(_DWORD *)(v15 + 52) = v16;
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
      sub_101127D00((PB::Base *)v17);
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
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0LL;
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