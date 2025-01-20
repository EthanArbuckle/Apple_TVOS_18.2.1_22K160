@interface CLWMMagnetometer
- (CLWMMagnetometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)onMagnetometerData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMMagnetometer

- (CLWMMagnetometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMMagnetometer;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_magIntervalSeconds = a5->magIntervalSeconds;
    result->_sampleCount = 0;
  }

  return result;
}

- (void)setupListener
{
  if (sub_1007C3B70())
  {
    if (self->_magnetometerDispatcher.__ptr_.__value_)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A45F0);
      }
      v8 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
      {
        uint64_t aBlock = 68289539LL;
        *(_WORD *)v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2082;
        *(void *)&v15[12] = "assert";
        *(_WORD *)&v15[20] = 2081;
        *(void *)&v15[22] = "!_magnetometerDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of magnetometer listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&aBlock,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A45F0);
        }
      }

      objc_super v9 = (os_log_s *)qword_101934678;
      if (os_signpost_enabled((os_log_t)qword_101934678))
      {
        uint64_t aBlock = 68289539LL;
        *(_WORD *)v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2082;
        *(void *)&v15[12] = "assert";
        *(_WORD *)&v15[20] = 2081;
        *(void *)&v15[22] = "!_magnetometerDispatcher";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of magnetometer listener.",  "{msg%{public}.0s:Duplicate creation of magnetometer listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&aBlock,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A45F0);
        }
      }

      v10 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
      {
        uint64_t aBlock = 68289539LL;
        *(_WORD *)v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2082;
        *(void *)&v15[12] = "assert";
        *(_WORD *)&v15[20] = 2081;
        *(void *)&v15[22] = "!_magnetometerDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of magnetometer listener., event:%{public, location:escape_onl y}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&aBlock,  0x26u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMMagnetometer.mm",  62,  "-[CLWMMagnetometer setupListener]");
      __break(1u);
    }

    id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v4 = (Dispatcher *)operator new(0x38uLL);
    *(void *)v4 = off_1018A2210;
    *(void *)v4 = off_1018A4620;
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = sub_101222700;
    *((void *)v4 + 3) = self;
    id v5 = v3;
    *((void *)v4 + 5) = 0LL;
    *((void *)v4 + 4) = v5;
    *((void *)v4 + 6) = 0LL;
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2020000000LL;
    char v13 = 0;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    *(void *)v15 = 3221225472LL;
    *(void *)&v15[8] = sub_101222AD4;
    *(void *)&v15[16] = &unk_10182EFC8;
    *(void *)&v15[24] = v12;
    *((void *)v4 + 5) = _Block_copy(&aBlock);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_101222AE8;
    v11[3] = &unk_10182EFF0;
    v11[4] = v12;
    *((void *)v4 + 6) = _Block_copy(v11);
    _Block_object_dispose(v12, 8);
    value = self->_magnetometerDispatcher.__ptr_.__value_;
    self->_magnetometerDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v7 = sub_1007C3B70();
    sub_1006DCB40(v7, 0, (uint64_t)self->_magnetometerDispatcher.__ptr_.__value_, self->_magIntervalSeconds);
  }

- (void)teardownListeners
{
  if (self->_magnetometerDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1007C3B70();
    sub_1006DD2A0(v3, 0, (uint64_t)self->_magnetometerDispatcher.__ptr_.__value_);
    value = self->_magnetometerDispatcher.__ptr_.__value_;
    self->_magnetometerDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A45F0);
    }
    id v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording magnetometer stopped.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A45F0);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Recording magnetometer stopped.",  v8,  2);
      uint64_t v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMMagnetometer teardownListeners]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (id)metadata
{
  return 0LL;
}

- (void)onMagnetometerData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_101125260(v14);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v16 |= 1u;
      v14[77] = v6;
      sub_1011395D0(v14);
      sub_1010E6D60(v15);
      uint64_t v7 = v15;
      uint64_t v8 = v15[1];
      double var0 = a3->var0;
      *(_BYTE *)(v8 + 36) |= 1u;
      *(double *)(v8 + 8) = var0;
      uint64_t v10 = v7[1];
      *(float *)&double var0 = a3->var1.var0;
      *(_BYTE *)(v10 + 36) |= 8u;
      *(_DWORD *)(v10 + 24) = LODWORD(var0);
      uint64_t v11 = v7[1];
      *(float *)&double var0 = a3->var1.var1;
      *(_BYTE *)(v11 + 36) |= 0x10u;
      *(_DWORD *)(v11 + 28) = LODWORD(var0);
      uint64_t v12 = v7[1];
      *(float *)&double var0 = a3->var1.var2;
      *(_BYTE *)(v12 + 36) |= 0x20u;
      *(_DWORD *)(v12 + 32) = LODWORD(var0);
      uint64_t v13 = v7[1];
      *(float *)&double var0 = a3->var2;
      *(_BYTE *)(v13 + 36) |= 4u;
      *(_DWORD *)(v13 + 20) = LODWORD(var0);
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v14);
      sub_101127D00((PB::Base *)v14);
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
  value = self->_magnetometerDispatcher.__ptr_.__value_;
  self->_magnetometerDispatcher.__ptr_.__value_ = 0LL;
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