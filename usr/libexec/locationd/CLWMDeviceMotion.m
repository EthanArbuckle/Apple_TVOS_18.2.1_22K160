@interface CLWMDeviceMotion
- (CLWMDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onDeviceMotionData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMDeviceMotion

- (CLWMDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMDeviceMotion;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_rotationRateIntervalSeconds = a5->rotationRateIntervalSeconds;
    result->_sampleCount = 0;
  }

  return result;
}

- (void)setupListener
{
  if (sub_100DDA4D4())
  {
    if (self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A21A8);
      }
      v8 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        v14 = "";
        __int16 v15 = 2082;
        v16 = "assert";
        __int16 v17 = 2081;
        v18 = "!_deviceMotionDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of rotation rate listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A21A8);
        }
      }

      objc_super v9 = (os_log_s *)qword_101934678;
      if (os_signpost_enabled((os_log_t)qword_101934678))
      {
        *(_DWORD *)buf = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        v14 = "";
        __int16 v15 = 2082;
        v16 = "assert";
        __int16 v17 = 2081;
        v18 = "!_deviceMotionDispatcher";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of rotation rate listener.",  "{msg%{public}.0s:Duplicate creation of rotation rate listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A21A8);
        }
      }

      v10 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        v14 = "";
        __int16 v15 = 2082;
        v16 = "assert";
        __int16 v17 = 2081;
        v18 = "!_deviceMotionDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of rotation rate listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMDeviceMotion.mm",  62,  "-[CLWMDeviceMotion setupListener]");
      __break(1u);
    }

    v3 = -[CLDeviceMotionProperties initWithMode:]( objc_alloc(&OBJC_CLASS___CLDeviceMotionProperties),  "initWithMode:",  3LL);
    id v4 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v5 = (Dispatcher *)operator new(0x38uLL);
    sub_1011C06A0(v5, v4, (uint64_t)sub_1011C02F0, (uint64_t)self, v3);
    value = self->_deviceMotionDispatcher.__ptr_.__value_;
    self->_deviceMotionDispatcher.__ptr_.__value_ = v5;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }

    uint64_t v7 = sub_100DDA4D4();
    sub_100DDAEA4(v7, (uint64_t)self->_deviceMotionDispatcher.__ptr_.__value_, self->_rotationRateIntervalSeconds);
  }

- (void)teardownListeners
{
  if (self->_deviceMotionDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100DDA4D4();
    sub_100DDB140(v3, (uint64_t)self->_deviceMotionDispatcher.__ptr_.__value_);
    value = self->_deviceMotionDispatcher.__ptr_.__value_;
    self->_deviceMotionDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A21A8);
    }
    v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording rotation rate stopped.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A21A8);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Recording rotation rate stopped.",  v8,  2);
      uint64_t v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMDeviceMotion teardownListeners]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (void)onDeviceMotionData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_101125260(v13);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v15 |= 1u;
      v13[77] = v6;
      sub_101138E44(v13);
      sub_10116E0A8(v14);
      uint64_t v7 = v14;
      uint64_t v8 = v14[1];
      double var0 = a3->var0;
      *(_BYTE *)(v8 + 28) |= 1u;
      *(double *)(v8 + 8) = var0;
      uint64_t v10 = v7[1];
      LODWORD(var0) = HIDWORD(a3[2].var0);
      *(_BYTE *)(v10 + 28) |= 2u;
      *(_DWORD *)(v10 + 16) = LODWORD(var0);
      uint64_t v11 = v7[1];
      *(float *)&double var0 = a3[2].var1.var0;
      *(_BYTE *)(v11 + 28) |= 4u;
      *(_DWORD *)(v11 + 20) = LODWORD(var0);
      uint64_t v12 = v7[1];
      *(float *)&double var0 = a3[2].var1.var1;
      *(_BYTE *)(v12 + 28) |= 8u;
      *(_DWORD *)(v12 + 24) = LODWORD(var0);
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v13);
      sub_101127D00((PB::Base *)v13);
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
  value = self->_deviceMotionDispatcher.__ptr_.__value_;
  self->_deviceMotionDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
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