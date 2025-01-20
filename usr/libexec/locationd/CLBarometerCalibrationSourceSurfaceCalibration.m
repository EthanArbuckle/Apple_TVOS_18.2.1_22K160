@interface CLBarometerCalibrationSourceSurfaceCalibration
- (CLBarometerCalibrationSourceSurfaceCalibration)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onSurfaceCalibration:(const CMSurfaceCalibrationSample *)a3;
@end

@implementation CLBarometerCalibrationSourceSurfaceCalibration

- (CLBarometerCalibrationSourceSurfaceCalibration)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceSurfaceCalibration;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v10, "initWithUniverse:delegate:", a3, a4);
  v5 = v4;
  if (v4)
  {
    id v6 = -[CLIntersiloUniverse silo](v4->super._universe, "silo");
    v7 = operator new(0x38uLL);
    sub_100FBEB1C(v7, v6, (uint64_t)sub_100FBE6F4, (uint64_t)v5, 0LL);
    value = v5->_surfaceCalibrationDispatcher.__ptr_.__value_;
    v5->_surfaceCalibrationDispatcher.__ptr_.__value_ = v7;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8LL))(value);
    }
  }

  return v5;
}

- (void)dealloc
{
  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceSurfaceCalibration;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (sub_1008FA854(0))
    {
      uint64_t v3 = sub_1008FA854(0);
      sub_1006DCB40(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_, -1.0);
    }

    self->super._sourceEnabled = 1;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_1018922B0);
    }
    objc_super v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "surface calibration source enabled", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018922B0);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "surface calibration source enabled",  v7,  2);
      id v6 = (uint8_t *)v5;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceSurfaceCalibration enableSource]",  "%s\n",  v5);
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
      sub_1006DD2A0(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_);
    }

    self->super._sourceEnabled = 0;
  }

- (void)onSurfaceCalibration:(const CMSurfaceCalibrationSample *)a3
{
  v5 = operator new(0x30uLL);
  v5[2] = 0LL;
  void *v5 = off_10184EB00;
  v5[5] = 1LL;
  v5[3] = *(void *)&a3->var0;
  v17 = (char *)(v5 + 3);
  v18 = (std::__shared_weak_count *)v5;
  *((double *)v5 + 4) = a3->var1;
  v5[1] = 0LL;
  id v6 = v5 + 1;
  v15 = (char *)(v5 + 3);
  v16 = (std::__shared_weak_count *)v5;
  delegate = self->super._delegate;
  do
    unint64_t v8 = __ldxr(v6);
  while (__stxr(v8 + 1, v6));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 7LL, &v15);
  v9 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  v12 = v18;
  if (v18)
  {
    v13 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

- (void).cxx_destruct
{
  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0LL;
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