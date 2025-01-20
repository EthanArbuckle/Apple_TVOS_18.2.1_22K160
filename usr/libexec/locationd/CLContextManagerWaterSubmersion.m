@interface CLContextManagerWaterSubmersion
+ (double)calculateDepthFromPressure:(double)a3 withSurfacePressure:(double)a4;
- (CLContextManagerWaterSubmersion)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (float)calculateFilterSurfaceCal:()deque<std:(std:(BOOL *)a4 :allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a3 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData> withSuccess:;
- (id).cxx_construct;
- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4;
- (void)dealloc;
- (void)forceGPSIfSurfaceCalStale;
- (void)onCharger:(BOOL)a3;
- (void)onEnableEasySubmersion:(BOOL)a3;
- (void)retrieveCachedSubmersionState;
- (void)retrieveCachedSurfacePressure;
- (void)saveCachedSurfacePressure:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3;
- (void)sendSurfacePressureToAOP:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3;
- (void)setTimerForGPSOff;
- (void)setUpGPSSubscriptionForSurfaceCal;
- (void)sourceUpdated:(unint64_t)a3;
- (void)updateSurfaceCalWithSource:(unint64_t)a3 andPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>;
@end

@implementation CLContextManagerWaterSubmersion

- (CLContextManagerWaterSubmersion)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersion;
  v6 = -[CLContextManagerWaterSubmersionBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v14,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  if (v6)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Water Submersion Context created", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Water Submersion Context created",  v13,  2);
      v12 = (uint8_t *)v11;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    v6->_forcingGPS = 0;
    v13[0] = 1097859072;
    sub_101206C88(buf, "CalibrationTimeOffset", v13, 0);
    v6->_calibrationTimeOffset = v16;
    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:]( v6->super.super._sourceAggregator,  "enableSources:forContext:",  &off_1018D6D78,  v6);
    v6->_lastPressureTimestampSaved = 1.79769313e308;
    v6->_tempEstimator = objc_alloc_init(&OBJC_CLASS___CLWaterTemperatureEstimator);
    -[CLContextManagerWaterSubmersion retrieveCachedSurfacePressure](v6, "retrieveCachedSurfacePressure");
    -[CLContextManagerWaterSubmersion setUpGPSSubscriptionForSurfaceCal](v6, "setUpGPSSubscriptionForSurfaceCal");
    -[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale](v6, "forceGPSIfSurfaceCalStale");
    -[CLContextManagerWaterSubmersion retrieveCachedSubmersionState](v6, "retrieveCachedSubmersionState");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_10078FF9C,  @"com.apple.locationd.WaterSubmersion.EnableEasySubmersion",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v9,  v6,  (CFNotificationCallback)sub_10078FF9C,  @"com.apple.locationd.WaterSubmersion.DisableEasySubmersion",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)dealloc
{
  self->_tempEstimator = 0LL;
  -[CLTimer invalidate](self->_forceGPSTimer, "invalidate");

  self->_forceGPSTimer = 0LL;
  value = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
  }

  else
  {
    sub_100AD5D38((uint64_t)value);
    value = self->_powerAssertionGPS.__ptr_.__value_;
    self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
    if (!value) {
      goto LABEL_6;
    }
  }

  (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
LABEL_6:
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase dealloc](&v4, "dealloc");
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase clientConnected:withNotification:](&v6, "clientConnected:withNotification:", a3);
  if (a4 == 3) {
    -[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale](self, "forceGPSIfSurfaceCalStale");
  }
}

- (void)setUpGPSSubscriptionForSurfaceCal
{
  v3 = v10;
  v10 = 0LL;
  value = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = v10;
    v10 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  objc_super v6 = (CLPowerAssertion *)operator new(0x30uLL);
  sub_100AD558C((uint64_t)v6, (uint64_t)"SurfaceCalibrationGPS", (uint64_t)self, 30.0);
  v7 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = v6;
  if (v7) {
    (*(void (**)(CLPowerAssertion *))(*(void *)v7 + 8LL))(v7);
  }
  v8 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->super.super._universe, "silo"), "newTimer");
  self->_forceGPSTimer = v8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100790240;
  v9[3] = &unk_10181A288;
  v9[4] = self;
  -[CLTimer setHandler:](v8, "setHandler:", v9);
}

- (void)sourceUpdated:(unint64_t)a3
{
  p_fDataBuffers = &self->super.super.fDataBuffers;
  sub_1004908E0((uint64_t)v76, (void *)self->super.super.fDataBuffers + 6);
  sub_1004908E0((uint64_t)&v72, (void *)*p_fDataBuffers + 42);
  if (a3 == 5)
  {
    __int128 v71 = v6;
    if (*((void *)&v6 + 1))
    {
      v7 = (unint64_t *)(*((void *)&v6 + 1) + 8LL);
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }

    sub_1004908E0((uint64_t)v68, (void *)self->super.super.fDataBuffers + 30);
    __int128 v9 = *(_OWORD *)(*(void *)(*((void *)&v68[0] + 1)
    __int128 v67 = v9;
    if (*((void *)&v9 + 1))
    {
      v10 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    if (v75)
    {
      uint64_t v13 = *v12;
      objc_super v14 = (std::__shared_weak_count *)v12[1];
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          unint64_t v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
        double v17 = *(double *)(v13 + 8);
        do
          unint64_t v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }

      else
      {
        double v17 = *(double *)(v13 + 8);
      }
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      v24 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "no surface pressure available, using standard sea level",  buf,  2u);
      }

      double v17 = 101.325;
      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        LOWORD(v66[0]) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "no surface pressure available, using standard sea level",  v66,  2);
        v26 = (uint8_t *)v25;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersion sourceUpdated:]", "%s\n", v25);
        if (v26 != buf) {
          free(v26);
        }
      }
    }

    tempEstimator = self->_tempEstimator;
    double v28 = *(double *)(v71 + 16);
    float v29 = *(double *)(v71 + 24);
    *(float *)buf = v29;
    float v30 = v28;
    *(float *)v66 = v30;
    -[CLWaterTemperatureEstimator updateWithTDot:andTempMeasurement:]( tempEstimator,  "updateWithTDot:andTempMeasurement:",  buf,  v66);
    v31 = objc_alloc_init(&OBJC_CLASS___CLWaterSubmersionMeasurement);
    uint64_t v32 = v67;
    -[CLWaterSubmersionMeasurement setStartAt:](v31, "setStartAt:", *(double *)v67);
    -[CLWaterSubmersionMeasurement setPressure:](v31, "setPressure:", *(double *)(v32 + 16));
    -[CLWaterSubmersionMeasurement setSurfacePressure:](v31, "setSurfacePressure:", v17);
    -[CLWaterTemperatureEstimator waterTempEst](self->_tempEstimator, "waterTempEst");
    -[CLWaterSubmersionMeasurement setTemperature:](v31, "setTemperature:", v33);
    -[CLWaterTemperatureEstimator waterTempUncertainty](self->_tempEstimator, "waterTempUncertainty");
    -[CLWaterSubmersionMeasurement setTemperatureUncertainty:](v31, "setTemperatureUncertainty:", v34);
    objc_opt_class(self);
    [v35 calculateDepthFromPressure:*(double *)(v32 + 16) withSurfacePressure:v17];
    -[CLWaterSubmersionMeasurement setDepth:](v31, "setDepth:");
    -[CLWaterSubmersionMeasurement setState:]( v31,  "setState:",  -[CLContextManagerWaterSubmersionBase submersionState](self, "submersionState"));
    -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromMeasurement:]( self,  "updateSubmersionStateFromMeasurement:",  v31);
    -[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]( self,  "updateClientsSubmersionMeasurement:",  v31);

    v36 = (std::__shared_weak_count *)*((void *)&v67 + 1);
    if (*((void *)&v67 + 1))
    {
      v37 = (unint64_t *)(*((void *)&v67 + 1) + 8LL);
      do
        unint64_t v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }

    sub_10049108C(v68);
    v39 = (std::__shared_weak_count *)*((void *)&v71 + 1);
    if (*((void *)&v71 + 1))
    {
      v40 = (unint64_t *)(*((void *)&v71 + 1) + 8LL);
      do
        unint64_t v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      goto LABEL_44;
    }

    goto LABEL_83;
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    sub_1004908E0((uint64_t)v65, v76);
    -[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]( self,  "updateSurfaceCalWithSource:andPressureQueue:",  a3,  v65);
    v23 = v65;
    goto LABEL_82;
  }

  if (a3 != 7)
  {
    if (a3 != 8) {
      goto LABEL_83;
    }
    sub_1004908E0((uint64_t)buf, (void *)self->super.super.fDataBuffers + 48);
    v68[0] = v19;
    if (*((void *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
      __int128 v64 = v19;
      do
        unint64_t v22 = __ldxr(v20);
      while (__stxr(v22 + 1, v20));
    }

    else
    {
      __int128 v64 = (unint64_t)v19;
    }

    -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:]( self,  "updateSubmersionStateFromAOPState:",  &v64);
    v55 = (std::__shared_weak_count *)*((void *)&v64 + 1);
    if (*((void *)&v64 + 1))
    {
      v56 = (unint64_t *)(*((void *)&v64 + 1) + 8LL);
      do
        unint64_t v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }

    v58 = (std::__shared_weak_count *)*((void *)&v68[0] + 1);
    if (*((void *)&v68[0] + 1))
    {
      v59 = (unint64_t *)(*((void *)&v68[0] + 1) + 8LL);
      do
        unint64_t v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }

    v23 = buf;
LABEL_82:
    sub_10049108C(v23);
    goto LABEL_83;
  }

  *(_OWORD *)buf = v42;
  if (*((void *)&v42 + 1))
  {
    v43 = (unint64_t *)(*((void *)&v42 + 1) + 8LL);
    do
      unint64_t v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
    __int128 v63 = v42;
    do
      unint64_t v45 = __ldxr(v43);
    while (__stxr(v45 + 1, v43));
  }

  else
  {
    __int128 v63 = (unint64_t)v42;
  }

  -[CLContextManagerWaterSubmersion saveCachedSurfacePressure:](self, "saveCachedSurfacePressure:", &v63);
  v46 = (std::__shared_weak_count *)*((void *)&v63 + 1);
  if (*((void *)&v63 + 1))
  {
    v47 = (unint64_t *)(*((void *)&v63 + 1) + 8LL);
    do
      unint64_t v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }

  uint64_t v61 = *(void *)buf;
  v62 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v49 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v50 = __ldxr(v49);
    while (__stxr(v50 + 1, v49));
  }

  -[CLContextManagerWaterSubmersion sendSurfacePressureToAOP:](self, "sendSurfacePressureToAOP:", &v61);
  v51 = v62;
  if (v62)
  {
    v52 = (unint64_t *)&v62->__shared_owners_;
    do
      unint64_t v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }

  v39 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v54 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v41 = __ldaxr(v54);
    while (__stlxr(v41 - 1, v54));
LABEL_44:
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

- (void)updateSurfaceCalWithSource:(unint64_t)a3 andPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  if (a3 >= 0xA) {
    sub_10000C918("array::at");
  }
  sub_1004908E0((uint64_t)v76, (void *)self->super.super.fDataBuffers + 6 * a3);
  __int128 v75 = v7;
  unint64_t v8 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  __int128 v67 = (double *)v7;
  if (*((void *)&v7 + 1))
  {
    __int128 v9 = (unint64_t *)(*((void *)&v7 + 1) + 8LL);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  *(double *)&unint64_t v11 = COERCE_DOUBLE("companion update");
  *(double *)&v12 = COERCE_DOUBLE("companionTimestamp");
  if (a3 == 4) {
    int v13 = 2;
  }
  else {
    int v13 = 3;
  }
  if (a3 != 4)
  {
    *(double *)&v12 = 0.0;
    *(double *)&unint64_t v11 = 0.0;
  }

  BOOL v14 = a3 == 0;
  if (a3) {
    int v15 = v13;
  }
  else {
    int v15 = 0;
  }
  if (a3) {
    unint64_t v16 = v12;
  }
  else {
    *(double *)&unint64_t v16 = COERCE_DOUBLE("locationTimestamp");
  }
  if (v14) {
    *(double *)&double v17 = COERCE_DOUBLE("leeched location");
  }
  else {
    double v17 = v11;
  }
  if (!-[CLContextManagerWaterSubmersionBase updatingSurfacePressure](self, "updatingSurfacePressure"))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    v43 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      double v45 = *v67;
      *(_DWORD *)buf = 134349570;
      CFAbsoluteTime v92 = Current;
      __int16 v93 = 2082;
      CFAbsoluteTime v94 = *(double *)&v16;
      __int16 v95 = 2050;
      double v96 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "caching pressure,timestamp,%{public}f,pressureTimestamp,0,pressure,0,%{public}s,%{public}f",  buf,  0x20u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_63;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v46 = qword_1019346A8;
    CFAbsoluteTime v47 = CFAbsoluteTimeGetCurrent();
    double v48 = *v67;
    int v79 = 134349570;
    CFAbsoluteTime v80 = v47;
    __int16 v81 = 2082;
    CFAbsoluteTime v82 = *(double *)&v16;
    __int16 v83 = 2050;
    double v84 = v48;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v46,  0LL,  "caching pressure,timestamp,%{public}f,pressureTimestamp,0,pressure,0,%{public}s,%{public}f",  &v79,  32);
    unint64_t v50 = (uint8_t *)v49;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]",  "%s\n",  v49);
LABEL_72:
    if (v50 != buf) {
      free(v50);
    }
    goto LABEL_63;
  }

  unint64_t value = a4->__size_.__value_;
  if (value)
  {
    __int128 v19 = (*(_OWORD **)((char *)a4->__map_.__begin_ + (((value + a4->__start_ - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL)))[(value + LOBYTE(a4->__start_) - 1)];
    __int128 v74 = v19;
    v20 = (std::__shared_weak_count *)*((void *)&v19 + 1);
    if (*((void *)&v19 + 1))
    {
      unint64_t v21 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }

    if (vabdd_f64(*v67, *(double *)v19) < 310.0)
    {
      char v73 = 0;
      sub_1004908E0((uint64_t)v72, a4);
      -[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]( self,  "calculateFilterSurfaceCal:withSuccess:",  v72,  &v73);
      float v24 = v23;
      sub_10049108C(v72);
      if (v73)
      {
        v25 = (char *)operator new(0x30uLL);
        *((void *)v25 + 1) = 0LL;
        v26 = (unint64_t *)(v25 + 8);
        *((void *)v25 + 2) = 0LL;
        *(void *)v25 = off_10184EB00;
        *(int64x2_t *)(v25 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        *((void *)v25 + 5) = 3LL;
        uint64_t v70 = v25 + 24;
        __int128 v71 = (std::__shared_weak_count *)v25;
        CFAbsoluteTime v27 = CFAbsoluteTimeGetCurrent();
        *((_DWORD *)v25 + 10) = v15;
        *((CFAbsoluteTime *)v25 + 3) = v27;
        *((double *)v25 + 4) = v24;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        double v28 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime v29 = CFAbsoluteTimeGetCurrent();
          double v30 = *((double *)v25 + 3);
          uint64_t v31 = *((void *)v25 + 4);
          uint64_t v32 = *(void *)v67;
          *(_DWORD *)buf = 136447490;
          CFAbsoluteTime v92 = *(double *)&v17;
          __int16 v93 = 2050;
          CFAbsoluteTime v94 = v29;
          __int16 v95 = 2050;
          double v96 = v30;
          __int16 v97 = 2050;
          uint64_t v98 = v31;
          __int16 v99 = 2082;
          v100 = v16;
          __int16 v101 = 2050;
          uint64_t v102 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "caching pressure on %{public}s,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,%{public}s,%{public}f",  buf,  0x3Eu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10184EA80);
          }
          uint64_t v60 = qword_1019346A8;
          CFAbsoluteTime v61 = CFAbsoluteTimeGetCurrent();
          double v62 = *((double *)v25 + 3);
          uint64_t v63 = *((void *)v25 + 4);
          uint64_t v64 = *(void *)v67;
          int v79 = 136447490;
          CFAbsoluteTime v80 = *(double *)&v17;
          __int16 v81 = 2050;
          CFAbsoluteTime v82 = v61;
          __int16 v83 = 2050;
          double v84 = v62;
          __int16 v85 = 2050;
          uint64_t v86 = v63;
          __int16 v87 = 2082;
          v88 = v16;
          __int16 v89 = 2050;
          uint64_t v90 = v64;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v60,  0LL,  "caching pressure on %{public}s,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,%{public}s,%{public}f",  &v79,  62);
          v66 = (uint8_t *)v65;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]",  "%s\n",  v65);
          if (v66 != buf) {
            free(v66);
          }
        }

        sourceAggregator = self->super.super._sourceAggregator;
        v68 = v25 + 24;
        uint64_t v69 = (std::__shared_weak_count *)v25;
        do
          unint64_t v34 = __ldxr(v26);
        while (__stxr(v34 + 1, v26));
        -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  7LL,  &v68);
        id v35 = v69;
        if (v69)
        {
          p_shared_owners = (unint64_t *)&v69->__shared_owners_;
          do
            unint64_t v37 = __ldaxr(p_shared_owners);
          while (__stlxr(v37 - 1, p_shared_owners));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }

        unint64_t v38 = v71;
        if (v71)
        {
          v39 = (unint64_t *)&v71->__shared_owners_;
          do
            unint64_t v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }

        v20 = (std::__shared_weak_count *)*((void *)&v74 + 1);
      }
    }

    if (v20)
    {
      unint64_t v41 = (unint64_t *)&v20->__shared_owners_;
      do
        unint64_t v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    unint64_t v8 = (std::__shared_weak_count *)*((void *)&v75 + 1);
    goto LABEL_63;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  v51 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v52 = CFAbsoluteTimeGetCurrent();
    double v53 = *v67;
    *(_DWORD *)buf = 134349570;
    CFAbsoluteTime v92 = v52;
    __int16 v93 = 2080;
    CFAbsoluteTime v94 = *(double *)&v16;
    __int16 v95 = 2050;
    double v96 = v53;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "pressure data not available,timestamp,%{public}f,%s,%{public}f",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v56 = qword_1019346A8;
    CFAbsoluteTime v57 = CFAbsoluteTimeGetCurrent();
    double v58 = *v67;
    int v79 = 134349570;
    CFAbsoluteTime v80 = v57;
    __int16 v81 = 2080;
    CFAbsoluteTime v82 = *(double *)&v16;
    __int16 v83 = 2050;
    double v84 = v58;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v56,  0LL,  "pressure data not available,timestamp,%{public}f,%s,%{public}f",  &v79,  32);
    unint64_t v50 = (uint8_t *)v59;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]",  "%s\n",  v59);
    goto LABEL_72;
  }

- (float)calculateFilterSurfaceCal:()deque<std:(std:(BOOL *)a4 :allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a3 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData> withSuccess:
{
  __p = 0LL;
  v119 = 0LL;
  v120 = 0LL;
  memset(&v117, 0, sizeof(v117));
  v115 = 0LL;
  v116 = 0LL;
  unint64_t v6 = a3->__start_ + a3->__size_.__value_;
  begin = a3->__map_.__begin_;
  end = a3->__map_.__end_;
  __int128 v9 = &begin[v6 >> 8];
  v109 = a4;
  if (end == begin) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = (uint64_t)*v9 + 16 * v6;
  }
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v12 = end == begin
        ? 0LL
    if (v10 == v12 || i > 0x12B) {
      break;
    }
    uint64_t v13 = v10;
    v113 = *(double **)(v13 - 16);
    BOOL v14 = *(std::__shared_weak_count **)(v13 - 8);
    v114 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        unint64_t v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }

    if (vabdd_f64(CFAbsoluteTimeGetCurrent(), *v113) > 310.0 && i != 0)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      v51 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v53 = *v113;
        *(_DWORD *)buf = 134218496;
        *(CFAbsoluteTime *)&uint8_t buf[4] = Current;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 0x4073600000000000LL;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v124 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEBUG,  "ignoring pressure older than max age,timestamp,%f,maxAge,%f,pressureSampleTimestamp,%f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v54 = qword_1019346A8;
        CFAbsoluteTime v55 = CFAbsoluteTimeGetCurrent();
        uint64_t v56 = *(void *)v113;
        LODWORD(v121.__r_.__value_.__l.__data_) = 134218496;
        *(CFAbsoluteTime *)((char *)v121.__r_.__value_.__r.__words + 4) = v55;
        WORD2(v121.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = 0x4073600000000000LL;
        HIWORD(v121.__r_.__value_.__r.__words[2]) = 2048;
        *(void *)v122 = v56;
        LODWORD(v107) = 32;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v54,  2LL,  "ignoring pressure older than max age,timestamp,%f,maxAge,%f,pressureSampleTimestamp,%f",  COERCE_DOUBLE(&v121),  v107,  v108);
        double v58 = (char *)v57;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]",  "%s\n",  v57);
        goto LABEL_167;
      }

      goto LABEL_99;
    }

    if (self)
    {
      -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
      if (*(_BYTE *)(*(void *)buf + 8LL) == 1)
      {
        double v18 = *v113;
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        size = (std::__shared_weak_count *)v121.__r_.__value_.__l.__size_;
        BOOL v20 = v18 < *(double *)v121.__r_.__value_.__l.__data_ + self->_calibrationTimeOffset;
        if (v121.__r_.__value_.__l.__size_)
        {
          unint64_t v21 = (unint64_t *)(v121.__r_.__value_.__l.__size_ + 8);
          do
            unint64_t v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
            std::__shared_weak_count::__release_weak(size);
          }
        }
      }

      else
      {
        BOOL v20 = 0;
      }
    }

    else
    {
      BOOL v20 = 0;
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
    }

    float v23 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      float v24 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    if (v20)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      v59 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v60 = CFAbsoluteTimeGetCurrent();
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        uint64_t v61 = *(void *)v121.__r_.__value_.__l.__data_;
        double calibrationTimeOffset = self->_calibrationTimeOffset;
        double v63 = *v113;
        *(_DWORD *)buf = 134218752;
        *(CFAbsoluteTime *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v124 = v63;
        *(_WORD *)&v124[8] = 2048;
        *(double *)&v124[10] = calibrationTimeOffset;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "ignoring pressure older than desubmersion,timestamp,%f,desubmersionTimestamp,%f,pressureSampleTimestamp,%f,offset,%f",  buf,  0x2Au);
        uint64_t v64 = (std::__shared_weak_count *)v121.__r_.__value_.__l.__size_;
        if (v121.__r_.__value_.__l.__size_)
        {
          v65 = (unint64_t *)(v121.__r_.__value_.__l.__size_ + 8);
          do
            unint64_t v66 = __ldaxr(v65);
          while (__stlxr(v66 - 1, v65));
          if (!v66)
          {
            ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
            std::__shared_weak_count::__release_weak(v64);
          }
        }
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v101 = qword_1019346A8;
        CFAbsoluteTime v102 = CFAbsoluteTimeGetCurrent();
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        std::string::size_type v103 = *(void *)v112.__r_.__value_.__l.__data_;
        double v104 = self->_calibrationTimeOffset;
        double v105 = *v113;
        LODWORD(v121.__r_.__value_.__l.__data_) = 134218752;
        *(CFAbsoluteTime *)((char *)v121.__r_.__value_.__r.__words + 4) = v102;
        WORD2(v121.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = v103;
        HIWORD(v121.__r_.__value_.__r.__words[2]) = 2048;
        *(double *)v122 = v105;
        *(_WORD *)&v122[8] = 2048;
        *(double *)&v122[10] = v104;
        LODWORD(v107) = 42;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v101,  0LL,  "ignoring pressure older than desubmersion,timestamp,%f,desubmersionTimestamp,%f,pressureSampleTimestamp,%f,offset,%f",  COERCE_DOUBLE(&v121),  v107,  v108,  *(double *)&v109);
        double v58 = v106;
        sub_10000AE14((uint64_t)&v112);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]",  "%s\n",  v58);
LABEL_167:
        if (v58 != buf) {
          free(v58);
        }
      }

- (void)sendSurfacePressureToAOP:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  double v3 = *(double *)(*(void *)&a3.var0->fTimestamp + 8LL);
  float v4 = **(double **)&a3.var0->fTimestamp;
  double v7 = v4;
  float v5 = v3;
  float v8 = v5;
  uint64_t v6 = sub_1008FA854(0);
  (*(void (**)(uint64_t, double *))(*(void *)(v6 + 112) + 24LL))(v6 + 112, &v7);
}

- (void)forceGPSIfSurfaceCalStale
{
  LODWORD(v35[0]) = 1155596288;
  sub_101206C88(buf, "SurfaceCalStaleTime", v35, 0);
  float v3 = *(float *)&v45;
  if (-[CLContextManagerWaterSubmersionBase updatingSurfacePressure](self, "updatingSurfacePressure")
    && !self->_forcingGPS)
  {
    sub_1004908E0((uint64_t)v35, (void *)self->super.super.fDataBuffers + 42);
    if (v37)
    {
      __int128 v34 = v4;
      __int128 v5 = v4;
      if (*((void *)&v4 + 1))
      {
        uint64_t v6 = (unint64_t *)(*((void *)&v4 + 1) + 8LL);
        do
          unint64_t v7 = __ldxr(v6);
        while (__stxr(v7 + 1, v6));
      }

      double Current = CFAbsoluteTimeGetCurrent();
      double v9 = v3;
      double v10 = vabdd_f64(Current, *(double *)v5);
      if (v10 > v9)
      {
        self->_forcingGPS = 1;
        unint64_t value = self->_powerAssertionGPS.__ptr_.__value_;
        sub_1010DDBC0(__p, "Altimeter, surface calibration power assertion GPS");
        sub_100AD5668((uint64_t)value, (uint64_t *)__p);
        if (v33 < 0) {
          operator delete(__p[0]);
        }
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v12 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          double v13 = *(double *)v5;
          CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218496;
          CFAbsoluteTime v45 = v13;
          __int16 v46 = 2048;
          double v47 = v10;
          __int16 v48 = 2048;
          CFAbsoluteTime v49 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "surface calibration stale, subscribing to GPS notifications,surfaceCalTimestamp,%f,timeDiff,%f,now,%f",  buf,  0x20u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10184EA80);
          }
          uint64_t v24 = qword_1019346A8;
          double v25 = *(double *)v5;
          CFAbsoluteTime v26 = CFAbsoluteTimeGetCurrent();
          int v38 = 134218496;
          CFAbsoluteTime v39 = v25;
          __int16 v40 = 2048;
          double v41 = v10;
          __int16 v42 = 2048;
          CFAbsoluteTime v43 = v26;
          LODWORD(v29) = 32;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v24,  0LL,  "surface calibration stale, subscribing to GPS notifications,surfaceCalTimestamp,%f,timeDiff,%f,now,%f",  COERCE_DOUBLE(&v38),  v29,  *(double *)&v5);
          double v28 = (uint8_t *)v27;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]",  "%s\n",  v27);
          if (v28 != buf) {
            free(v28);
          }
        }

        [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
        -[CLContextManagerWaterSubmersion setTimerForGPSOff](self, "setTimerForGPSOff");
      }

      if (*((void *)&v5 + 1))
      {
        int v15 = (unint64_t *)(*((void *)&v5 + 1) + 8LL);
        do
          unint64_t v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          (*(void (**)(void))(**((void **)&v5 + 1) + 16LL))(*((void *)&v5 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
        }
      }
    }

    else
    {
      self->_forcingGPS = 1;
      double v17 = self->_powerAssertionGPS.__ptr_.__value_;
      sub_1010DDBC0(v30, "Altimeter, surface calibration power assertion GPS");
      sub_100AD5668((uint64_t)v17, (uint64_t *)v30);
      if (v31 < 0) {
        operator delete(v30[0]);
      }
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      double v18 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v45 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "no saved surface calibration, subscribing to GPS notifications %f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10184EA80);
        }
        uint64_t v20 = qword_1019346A8;
        CFAbsoluteTime v21 = CFAbsoluteTimeGetCurrent();
        int v38 = 134217984;
        CFAbsoluteTime v39 = v21;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "no saved surface calibration, subscribing to GPS notifications %f",  COERCE_DOUBLE(&v38));
        float v23 = (uint8_t *)v22;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]",  "%s\n",  v22);
        if (v23 != buf) {
          free(v23);
        }
      }

      [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
      -[CLContextManagerWaterSubmersion setTimerForGPSOff](self, "setTimerForGPSOff");
    }

    sub_10049108C(v35);
  }

- (void)setTimerForGPSOff
{
}

- (void)saveCachedSurfacePressure:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  var0 = (const void **)a3.var0;
  uint64_t v5 = sub_1002F8DDC();
  sub_1002AC7B8(v5, "CLWaterSubmersion_SurfacePressureTimestamp", *var0);
  uint64_t v6 = sub_1002F8DDC();
  sub_1002AC7B8(v6, "CLWaterSubmersion_SurfacePressure", (char *)*var0 + 8);
  uint64_t v7 = sub_1002F8DDC();
  *(_DWORD *)buf = *((_DWORD *)*var0 + 4);
  sub_1002AC220(v7, "CLWaterSubmersion_SurfacePressureSource", buf);
  uint64_t v8 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v8 + 944LL))(v8);
  self->_double lastPressureTimestampSaved = *(double *)*var0;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  double v9 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    double lastPressureTimestampSaved = self->_lastPressureTimestampSaved;
    uint64_t v11 = *((void *)*var0 + 1);
    *(_DWORD *)buf = 134349312;
    double v21 = lastPressureTimestampSaved;
    __int16 v22 = 2050;
    uint64_t v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "saved surface calibration pressure,timestamp,%{public}f,pressure,%{public}f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    double v12 = self->_lastPressureTimestampSaved;
    uint64_t v13 = *((void *)*var0 + 1);
    int v16 = 134349312;
    double v17 = v12;
    __int16 v18 = 2050;
    uint64_t v19 = v13;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "saved surface calibration pressure,timestamp,%{public}f,pressure,%{public}f",  &v16,  22);
    int v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersion saveCachedSurfacePressure:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

- (void)retrieveCachedSurfacePressure
{
  uint64_t v34 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v35 = 0x7FEFFFFFFFFFFFFFLL;
  int v33 = 3;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A82BC(v3, "CLWaterSubmersion_SurfacePressureTimestamp", &v35);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "CLWaterSubmersion_SurfacePressure", &v34);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A7CB0(v5, "CLWaterSubmersion_SurfacePressureSource", &v33);
  uint64_t v6 = (std::__shared_weak_count *)operator new(0x30uLL);
  v6->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0LL;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v35;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_10184EB00;
  v6[1].__shared_weak_owners_ = 3LL;
  char v31 = &v6[1].__vftable;
  uint64_t v32 = v6;
  LODWORD(v6[1].__shared_weak_owners_) = v33;
  v6[1].__shared_owners_ = v34;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  uint64_t v8 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349824;
    CFAbsoluteTime v45 = Current;
    __int16 v46 = 2050;
    uint64_t v47 = v35;
    __int16 v48 = 2050;
    uint64_t v49 = v34;
    __int16 v50 = 1026;
    int v51 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "recovering surface pressure on locationd start,timestamp,%{public}f,recoveredTimestamp,%{public}f,surface pressure ,%{public}f,calibration source,%{public}d",  buf,  0x26u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v23 = qword_1019346A8;
    CFAbsoluteTime v24 = CFAbsoluteTimeGetCurrent();
    int v36 = 134349824;
    CFAbsoluteTime v37 = v24;
    __int16 v38 = 2050;
    uint64_t v39 = v35;
    __int16 v40 = 2050;
    uint64_t v41 = v34;
    __int16 v42 = 1026;
    int v43 = v33;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  0LL,  "recovering surface pressure on locationd start,timestamp,%{public}f,recoveredTimestamp,%{public}f,surface pressure ,%{public}f,calibration source,%{public}d",  &v36,  38);
    CFAbsoluteTime v26 = (uint8_t *)v25;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerWaterSubmersion retrieveCachedSurfacePressure]",  "%s\n",  v25);
    if (v26 != buf) {
      free(v26);
    }
  }

  double v29 = &v6[1].__vftable;
  uint64_t v30 = v6;
  do
    unint64_t v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  -[CLContextManagerWaterSubmersion sendSurfacePressureToAOP:](self, "sendSurfacePressureToAOP:", &v29);
  uint64_t v11 = v30;
  if (v30)
  {
    double v12 = (unint64_t *)&v30->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  sourceAggregator = self->super.super._sourceAggregator;
  CFAbsoluteTime v27 = v31;
  double v28 = v32;
  if (v32)
  {
    int v15 = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }

  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  7LL,  &v27);
  double v17 = v28;
  if (v28)
  {
    __int16 v18 = (unint64_t *)&v28->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  uint64_t v20 = v32;
  if (v32)
  {
    double v21 = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

- (void)retrieveCachedSubmersionState
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState](&v15, "retrieveCachedSubmersionState");
  -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  float v3 = *v11;
  double v13 = v3;
  -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  char v14 = *(_BYTE *)(v9 + 8);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  if (v12)
  {
    uint64_t v6 = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  uint64_t v8 = sub_1008FA854(0);
  (*(void (**)(uint64_t, double *))(*(void *)(v8 + 112) + 32LL))(v8 + 112, &v13);
}

- (void)onCharger:(BOOL)a3
{
  if (a3)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    char v11 = 1;
    uint64_t v3 = sub_1008FA854(0);
    (*(void (**)(uint64_t, CFAbsoluteTime *))(*(void *)(v3 + 112) + 32LL))(v3 + 112, &Current);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      CFAbsoluteTime v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "detected on charger, sending state to AOP, %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10184EA80);
      }
      uint64_t v6 = qword_1019346A8;
      CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent();
      int v12 = 134217984;
      CFAbsoluteTime v13 = v7;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  0LL,  "detected on charger, sending state to AOP, %f",  COERCE_DOUBLE(&v12));
      uint64_t v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersion onCharger:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

- (void)onEnableEasySubmersion:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10184EA80);
  }
  uint64_t v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "received easy submersion notification, sending easy submersion update to AOP,timestamp,%f,enableState,%d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10184EA80);
    }
    uint64_t v6 = qword_1019346A8;
    int v9 = 134218240;
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  0LL,  "received easy submersion notification, sending easy submersion update to AOP,timestamp,%f,enableState,%d",  COERCE_DOUBLE(&v9),  18);
    uint64_t v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerWaterSubmersion onEnableEasySubmersion:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  uint64_t v5 = sub_1008FA854(0);
  (*(void (**)(uint64_t, BOOL))(*(void *)(v5 + 112) + 40LL))(v5 + 112, v3);
}

+ (double)calculateDepthFromPressure:(double)a3 withSurfacePressure:(double)a4
{
  return (a3 - a4) * 1000.0 / 10002.7832;
}

- (void).cxx_destruct
{
  unint64_t value = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  uint64_t v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(CLPowerAssertion *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 23) = 0LL;
  *((void *)self + 24) = 0LL;
  return self;
}

@end