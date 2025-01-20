@interface CLWMOdometer
- (CLWMOdometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (double)makeSafeAbsoluteElevation:(double)a3;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMOdometer

- (CLWMOdometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMOdometer;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disablePrivacyElevationOffset = a5->disablePrivacyElevationOffset;
    result->_disableForceActiveListeners = a5->disableForceActiveListeners;
    result->_sampleCount = 0;
  }

  return result;
}

- (void)setupListener
{
  if (self->_odometerObserverClient.__ptr_.__value_)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A36C8);
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
      v16 = "!_odometerObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of odometer listener., event:%{public, location:escape_only}s,  condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A36C8);
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
      v16 = "!_odometerObserverClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of odometer listener.",  "{msg%{public}.0s:Duplicate creation of odometer listener., event:%{public, location:escape_only}s,  condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A36C8);
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
      v16 = "!_odometerObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of odometer listener., event:%{public, location:escape_only}s,  condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMOdometer.mm",  66,  "-[CLWMOdometer setupListener]");
  }

  sub_10027EB5C((uint64_t)sub_10120B620, (uint64_t)self, self->_delegate, buf);
  v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = v3;
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
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  [*((id *)self->_odometerObserverClient.__ptr_.__value_ + 2) register:*((void *)self->_odometerObserverClient.__ptr_.__value_ + 1) forNotification:v6 registrationInfo:0];
}

- (void)teardownListeners
{
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_101125260(v44);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v46 |= 1u;
      v44[77] = v7;
      sub_101138E98(v44);
      sub_10116D9C0(v45);
      v8 = v45;
      sub_1011894E8((_DWORD *)v45[1]);
      uint64_t v9 = v8[1];
      uint64_t v10 = *(void *)(v9 + 72);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *(double *)a4);
      *(_WORD *)(v10 + 100) |= 0x80u;
      *(void *)(v10 + 64) = v11;
      uint64_t v12 = *(void *)(v9 + 72);
      uint64_t v13 = *((void *)a4 + 1);
      *(_WORD *)(v12 + 100) |= 2u;
      *(void *)(v12 + 16) = v13;
      uint64_t v14 = *(void *)(v9 + 72);
      uint64_t v15 = *((void *)a4 + 2);
      *(_WORD *)(v14 + 100) |= 1u;
      *(void *)(v14 + 8) = v15;
      uint64_t v16 = *(void *)(v9 + 72);
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 3));
      *(_WORD *)(v16 + 100) |= 4u;
      *(void *)(v16 + 24) = v17;
      uint64_t v18 = *(void *)(v9 + 72);
      uint64_t v19 = *((void *)a4 + 4);
      *(_WORD *)(v18 + 100) |= 0x40u;
      *(void *)(v18 + 56) = v19;
      uint64_t v20 = *(void *)(v9 + 72);
      uint64_t v21 = *((void *)a4 + 5);
      *(_WORD *)(v20 + 100) |= 0x20u;
      *(void *)(v20 + 48) = v21;
      uint64_t v22 = *(void *)(v9 + 72);
      uint64_t v23 = *((void *)a4 + 6);
      *(_WORD *)(v22 + 100) |= 0x10u;
      *(void *)(v22 + 40) = v23;
      uint64_t v24 = *(void *)(v9 + 72);
      uint64_t v25 = *((void *)a4 + 7);
      *(_WORD *)(v24 + 100) |= 8u;
      *(void *)(v24 + 32) = v25;
      uint64_t v26 = *(void *)(v9 + 72);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 8));
      *(_WORD *)(v26 + 100) |= 0x100u;
      *(void *)(v26 + 72) = v27;
      uint64_t v28 = *(void *)(v9 + 72);
      int v29 = *((_DWORD *)a4 + 21);
      *(_WORD *)(v28 + 100) |= 0x400u;
      *(_DWORD *)(v28 + 84) = v29;
      uint64_t v30 = *(void *)(v9 + 72);
      int v31 = *((_DWORD *)a4 + 20);
      *(_WORD *)(v30 + 100) |= 0x800u;
      *(_DWORD *)(v30 + 88) = v31;
      uint64_t v32 = v8[1];
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 12));
      *(_BYTE *)(v32 + 80) |= 4u;
      *(void *)(v32 + 24) = v33;
      uint64_t v34 = v8[1];
      uint64_t v35 = *((void *)a4 + 13);
      *(_BYTE *)(v34 + 80) |= 8u;
      *(void *)(v34 + 32) = v35;
      uint64_t v36 = v8[1];
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 14));
      *(_BYTE *)(v36 + 80) |= 0x40u;
      *(void *)(v36 + 56) = v37;
      uint64_t v38 = v8[1];
      uint64_t v39 = *((void *)a4 + 15);
      *(_BYTE *)(v38 + 80) |= 0x80u;
      *(void *)(v38 + 64) = v39;
      uint64_t v40 = v8[1];
      uint64_t v41 = *((void *)a4 + 16);
      *(_BYTE *)(v40 + 80) |= 2u;
      *(void *)(v40 + 16) = v41;
      uint64_t v42 = v8[1];
      uint64_t v43 = *((void *)a4 + 17);
      *(_BYTE *)(v42 + 80) |= 1u;
      *(void *)(v42 + 8) = v43;
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v44);
      sub_101127D00((PB::Base *)v44);
    }
  }

- (double)makeSafeAbsoluteElevation:(double)a3
{
  if (a3 != 0.0 && self->_privacyElevationOffset == 0.0 && !self->_disablePrivacyElevationOffset)
  {
    self->_double privacyElevationOffset = a3;
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A36C8);
    }
    v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      double privacyElevationOffset = self->_privacyElevationOffset;
      *(_DWORD *)buf = 134283521;
      double v14 = privacyElevationOffset;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Offsetting elevation by %{private}f", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A36C8);
      }
      double v8 = self->_privacyElevationOffset;
      int v11 = 134283521;
      double v12 = v8;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Offsetting elevation by %{private}f",  &v11,  12);
      uint64_t v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMOdometer makeSafeAbsoluteElevation:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  return a3 - self->_privacyElevationOffset;
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
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0LL;
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