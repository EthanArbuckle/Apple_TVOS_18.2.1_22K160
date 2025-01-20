@interface CLWMFaceCovered
- (CLWMFaceCovered)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onFaceCovered:(const FaceCovered *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMFaceCovered

- (CLWMFaceCovered)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLWMFaceCovered;
  result = -[CLWMBase init](&v8, "init", a3, a4, a5);
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_sampleCount = 0;
    result->_inSwimmingWorkout = 0;
  }

  return result;
}

- (void)setupListener
{
  id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
  v4 = operator new(0x38uLL);
  sub_1011FD1D0(v4, v3, (uint64_t)sub_1011FCB0C, (uint64_t)self, 0LL);
  value = self->_faceCoveredDispatcher.__ptr_.__value_;
  self->_faceCoveredDispatcher.__ptr_.__value_ = v4;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8LL))(value);
  }
  uint64_t v6 = sub_1008FA854(0);
  sub_1006DCB40(v6, 39, (uint64_t)self->_faceCoveredDispatcher.__ptr_.__value_, -1.0);
  sub_100468458((uint64_t)sub_1011FCB18, (uint64_t)self, self->_delegate, &v10);
  v7 = v10;
  v10 = 0LL;
  objc_super v8 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = v7;
  if (v8)
  {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    v9 = v10;
    v10 = 0LL;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
    }
  }

  [*((id *)self->_motionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->_motionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
}

- (void)teardownListeners
{
  if (self->_faceCoveredDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1008FA854(0);
    sub_1006DD2A0(v3, 39, (uint64_t)self->_faceCoveredDispatcher.__ptr_.__value_);
    value = self->_faceCoveredDispatcher.__ptr_.__value_;
    self->_faceCoveredDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8LL))(value);
    }
  }

- (void)onFaceCovered:(const FaceCovered *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    if (self->_inSwimmingWorkout)
    {
      ++self->_sampleCount;
      sub_101125260(buf);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v18 |= 1u;
      uint64_t v16 = v6;
      sub_10113A3EC(buf);
      sub_10116C828(v17);
      v7 = v17;
      uint64_t v8 = v17[1];
      double v9 = (double)a3->var0 / 1000000.0;
      *(_BYTE *)(v8 + 20) |= 1u;
      *(double *)(v8 + 8) = v9;
      uint64_t v10 = v7[1];
      LOBYTE(v8) = a3->var1;
      *(_BYTE *)(v10 + 20) |= 2u;
      *(_BYTE *)(v10 + 16) = v8;
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_101127D00((PB::Base *)buf);
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018A30E8);
      }
      v11 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CLWMFC,do not write face covered event for non-swimming workout",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_1018A30E8);
        }
        v14[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "CLWMFC,do not write face covered event for non-swimming workout",  v14,  2);
        v13 = (uint8_t *)v12;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMFaceCovered onFaceCovered:]", "%s\n", v12);
        if (v13 != buf) {
          free(v13);
        }
      }
    }
  }

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*((void *)a4 + 14) == 19LL)
  {
    uint64_t v7 = *((void *)a4 + 2);
    if ((unint64_t)(v7 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018A30E8);
      }
      v12 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CLWMFC,swimming workout stopped,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_1018A30E8);
        }
        uint64_t v13 = qword_1019346A8;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  0LL,  "CLWMFC,swimming workout stopped,timestamp,%f");
        goto LABEL_25;
      }
    }

    else if (v7 == 3 || v7 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018A30E8);
      }
      double v9 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CLWMFC,swimming workout started,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_1018A30E8);
        }
        uint64_t v10 = qword_1019346A8;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  0LL,  "CLWMFC,swimming workout started,timestamp,%f");
LABEL_25:
        v14 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMFaceCovered onMotionStateMediatorNotification:data:]", "%s\n", v11);
        if (v14 != buf) {
          free(v14);
        }
      }
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
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v4 = self->_faceCoveredDispatcher.__ptr_.__value_;
  self->_faceCoveredDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(void *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  return self;
}

@end