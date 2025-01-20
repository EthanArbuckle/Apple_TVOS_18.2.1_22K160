@interface CLBarometerCalibrationSourceSubmersionState
- (CLBarometerCalibrationSourceSubmersionState)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onSubmersionState:(const CMSubmersionState *)a3;
@end

@implementation CLBarometerCalibrationSourceSubmersionState

- (CLBarometerCalibrationSourceSubmersionState)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceSubmersionState;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v10, "initWithUniverse:delegate:", a3, a4);
  v5 = v4;
  if (v4)
  {
    id v6 = -[CLIntersiloUniverse silo](v4->super._universe, "silo");
    v7 = operator new(0x38uLL);
    sub_100B86E14(v7, v6, (uint64_t)sub_100B86870, (uint64_t)v5, 0LL);
    value = v5->_submersionStateDispatcher.__ptr_.__value_;
    v5->_submersionStateDispatcher.__ptr_.__value_ = v7;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8LL))(value);
    }
  }

  return v5;
}

- (void)dealloc
{
  value = self->_submersionStateDispatcher.__ptr_.__value_;
  self->_submersionStateDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceSubmersionState;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (sub_1008FA854(0))
    {
      uint64_t v3 = sub_1008FA854(0);
      sub_1006DCB40(v3, 37, (uint64_t)self->_submersionStateDispatcher.__ptr_.__value_, -1.0);
    }

    self->super._sourceEnabled = 1;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_1018743A8);
    }
    objc_super v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "submersion state source enabled", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018743A8);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "submersion state source enabled",  v7,  2);
      id v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSourceSubmersionState enableSource]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }
  }

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    if (sub_1008FA854(0))
    {
      uint64_t v3 = sub_1008FA854(0);
      sub_1006DD2A0(v3, 37, (uint64_t)self->_submersionStateDispatcher.__ptr_.__value_);
    }

    self->super._sourceEnabled = 0;
  }

- (void)onSubmersionState:(const CMSubmersionState *)a3
{
  v5 = operator new(0x28uLL);
  v5[1] = 0LL;
  id v6 = v5 + 1;
  v5[2] = 0LL;
  void *v5 = off_10184EAB0;
  v5[3] = *(void *)&a3->var0;
  v5[4] = 0LL;
  v21 = (char *)(v5 + 3);
  v22 = (std::__shared_weak_count *)v5;
  *((_BYTE *)v5 + 32) = a3->var1;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_1018743A8);
  }
  v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ping on submersion state", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_1018743A8);
    }
    v20[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "ping on submersion state",  v20,  2);
    v17 = (uint8_t *)v16;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceSubmersionState onSubmersionState:]",  "%s\n",  v16);
    if (v17 != buf) {
      free(v17);
    }
  }

  delegate = self->super._delegate;
  v18 = (char *)(v5 + 3);
  v19 = (std::__shared_weak_count *)v5;
  do
    unint64_t v9 = __ldxr(v6);
  while (__stxr(v9 + 1, v6));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 8LL, &v18);
  objc_super v10 = v19;
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

  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

- (void).cxx_destruct
{
  value = self->_submersionStateDispatcher.__ptr_.__value_;
  self->_submersionStateDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  return self;
}

@end