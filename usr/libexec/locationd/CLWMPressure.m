@interface CLWMPressure
- (CLWMPressure)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onPressureData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMPressure

- (CLWMPressure)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLWMPressure;
  v8 = -[CLWMBase init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_kPressureUpdateInterval = a5->kPressureUpdateInterval;
    uint64_t v10 = rand();
    float v11 = a5->kPrivacyPressureMaxOffset
    v9->_privacyPressureOffset = v11;
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  if (sub_1005BDE54())
  {
    id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v4 = (Dispatcher *)operator new(0x38uLL);
    sub_10122121C(v4, v3, (uint64_t)sub_101220E58, (uint64_t)self, 0LL);
    value = self->_pressureDispatcher.__ptr_.__value_;
    self->_pressureDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v6 = sub_1005BDE54();
    sub_1006DCB40(v6, 1, (uint64_t)self->_pressureDispatcher.__ptr_.__value_, self->_kPressureUpdateInterval);
  }

- (void)teardownListeners
{
  if (self->_pressureDispatcher.__ptr_.__value_ && sub_1005BDE54())
  {
    uint64_t v3 = sub_1005BDE54();
    sub_1006DD2A0(v3, 1, (uint64_t)self->_pressureDispatcher.__ptr_.__value_);
    value = self->_pressureDispatcher.__ptr_.__value_;
    self->_pressureDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A43E0);
    }
    v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording pressure stopped.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A43E0);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Recording pressure stopped.",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMPressure teardownListeners]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (void)onPressureData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disablePressure)
  {
    ++self->_sampleCount;
    sub_101125260(v12);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v14 |= 1u;
    v12[77] = v6;
    sub_101139138(v12);
    sub_10116DD34(v13);
    v7 = v13;
    uint64_t v8 = v13[1];
    double var0 = a3->var0;
    *(_BYTE *)(v8 + 24) |= 1u;
    *(double *)(v8 + 8) = var0;
    uint64_t v10 = v7[1];
    *(float *)&double var0 = a3->var1.var0 + self->_privacyPressureOffset;
    *(_BYTE *)(v10 + 24) |= 2u;
    *(_DWORD *)(v10 + 16) = LODWORD(var0);
    uint64_t v11 = v7[1];
    *(float *)&double var0 = a3->var1.var1;
    *(_BYTE *)(v11 + 24) |= 4u;
    *(_DWORD *)(v11 + 20) = LODWORD(var0);
    sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v12);
    sub_101127D00((PB::Base *)v12);
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
  value = self->_pressureDispatcher.__ptr_.__value_;
  self->_pressureDispatcher.__ptr_.__value_ = 0LL;
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