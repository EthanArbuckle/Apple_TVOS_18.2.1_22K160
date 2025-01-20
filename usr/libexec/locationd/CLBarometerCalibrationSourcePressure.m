@interface CLBarometerCalibrationSourcePressure
- (CLBarometerCalibrationSourcePressure)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3;
@end

@implementation CLBarometerCalibrationSourcePressure

- (CLBarometerCalibrationSourcePressure)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourcePressure;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v10, "initWithUniverse:delegate:", a3, a4);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    id v6 = -[CLIntersiloUniverse silo](v4->super._universe, "silo");
    v7 = operator new(0x38uLL);
    sub_1002B4F48(v7, v6, (uint64_t)sub_10103A970, v5, 0LL);
    uint64_t v8 = *(void *)(v5 + 32);
    *(void *)(v5 + 32) = v7;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
    }
    *(void *)(v5 + 40) = 0x7FEFFFFFFFFFFFFFLL;
  }

  return (CLBarometerCalibrationSourcePressure *)v5;
}

- (void)dealloc
{
  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourcePressure;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (sub_1008FA854(0))
    {
      uint64_t v3 = sub_1008FA854(0);
      sub_1006DCB40(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_, -1.0);
    }

    self->super._sourceEnabled = 1;
  }

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    if (sub_1008FA854(0))
    {
      uint64_t v3 = sub_1008FA854(0);
      sub_1006DD2A0(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_);
    }

    self->super._sourceEnabled = 0;
  }

- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_1018958B8);
  }
  id v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    double var1 = a3->var1;
    double var0 = a3->var0;
    double var5 = a3->var5;
    double var3 = a3->var3;
    double var2 = a3->var2;
    double var6 = a3->var6;
    double var4 = a3->var4;
    *(_DWORD *)buf = 134219776;
    *(CFAbsoluteTime *)&buf[4] = Current;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = var1;
    __int16 v68 = 2048;
    double v69 = var0;
    __int16 v70 = 2048;
    double v71 = var5;
    __int16 v72 = 2048;
    double v73 = var3;
    __int16 v74 = 2048;
    double v75 = var2;
    __int16 v76 = 2048;
    double v77 = var6;
    __int16 v78 = 2048;
    double v79 = var4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "received KF filtered pressure from AOP,now,%f,filteredPressureTimestamp,%f,filteredPressure,%f,kfTimestamp,%f,kfEl evation,%f,kfPressure,%f temperature,%f,absAltUnc,%f",  buf,  0x52u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_1018958B8);
    }
    double v37 = a3->var1;
    double v38 = a3->var0;
    double v39 = a3->var5;
    double v40 = a3->var3;
    double v41 = a3->var2;
    double v42 = a3->var6;
    double v43 = a3->var4;
    int v51 = 134219776;
    CFAbsoluteTime v52 = Current;
    __int16 v53 = 2048;
    double v54 = v37;
    __int16 v55 = 2048;
    double v56 = v38;
    __int16 v57 = 2048;
    double v58 = v39;
    __int16 v59 = 2048;
    double v60 = v40;
    __int16 v61 = 2048;
    double v62 = v41;
    __int16 v63 = 2048;
    double v64 = v42;
    __int16 v65 = 2048;
    double v66 = v43;
    LODWORD(v46) = 82;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "received KF filtered pressure from AOP,now,%f,filteredPressureTimestamp,%f,filteredPressure,%f,kfTimestamp,%f,kfEl evation,%f,kfPressure,%f temperature,%f,absAltUnc,%f",  COERCE_DOUBLE(&v51),  v46,  v47,  v48,  v49,  v50);
    v45 = (char *)v44;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSourcePressure onKFFilteredPressure:]", "%s\n", v44);
    if (v45 != buf) {
      free(v45);
    }
  }

  double v14 = a3->var1;
  if (vabdd_f64(v14, self->_lastPressureBufferTimestamp) > 0.833333333)
  {
    self->_lastPressureBufferTimestamp = v14;
    double v15 = COERCE_DOUBLE(operator new(0x38uLL));
    *(void *)(*(void *)&v15 + 8LL) = 0LL;
    v16 = (unint64_t *)(*(void *)&v15 + 8LL);
    *(void *)(*(void *)&v15 + 16LL) = 0LL;
    **(void **)&double v15 = off_101884AD8;
    *(double *)(*(void *)&v15 + 24LL) = a3->var1;
    *(void *)buf = *(void *)&v15 + 24LL;
    *(double *)&buf[8] = v15;
    *(double *)(*(void *)&v15 + 32LL) = (float)(a3->var0 / 1000.0);
    *(float64x2_t *)(*(void *)&v15 + 40LL) = vcvtq_f64_f32(*(float32x2_t *)&a3->var6);
    delegate = self->super._delegate;
    *(void *)&double v49 = *(void *)&v15 + 24LL;
    double v50 = v15;
    do
      unint64_t v18 = __ldxr(v16);
    while (__stxr(v18 + 1, v16));
    -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 1LL, &v49);
    v19 = *(std::__shared_weak_count **)&v50;
    if (v50 != 0.0)
    {
      v20 = (unint64_t *)(*(void *)&v50 + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v23 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }

  double v25 = COERCE_DOUBLE(operator new(0x38uLL));
  *(double *)(*(void *)&v25 + 24LL) = a3->var5;
  float v26 = a3->var3;
  float v27 = a3->var2 / 1000.0;
  *(void *)(*(void *)&v25 + 8LL) = 0LL;
  v28 = (unint64_t *)(*(void *)&v25 + 8LL);
  *(void *)(*(void *)&v25 + 16LL) = 0LL;
  **(void **)&double v25 = off_101884B28;
  *(void *)buf = *(void *)&v25 + 24LL;
  *(double *)&buf[8] = v25;
  *(double *)(*(void *)&v25 + 32LL) = v26;
  *(double *)(*(void *)&v25 + 40LL) = v27;
  *(double *)(*(void *)&v25 + 48LL) = a3->var4;
  v29 = self->super._delegate;
  *(void *)&double v47 = *(void *)&v25 + 24LL;
  double v48 = v25;
  do
    unint64_t v30 = __ldxr(v28);
  while (__stxr(v30 + 1, v28));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](v29, "didUpdateSource:withData:", 5LL, &v47);
  v31 = *(std::__shared_weak_count **)&v48;
  if (v48 != 0.0)
  {
    v32 = (unint64_t *)(*(void *)&v48 + 8LL);
    do
      unint64_t v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v35 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

- (void).cxx_destruct
{
  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0LL;
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