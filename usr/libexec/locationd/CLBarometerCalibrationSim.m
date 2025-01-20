@interface CLBarometerCalibrationSim
- (BOOL)feedLoiData:(RoutineVisit *)a3;
- (BOOL)inOutdoorWorkout;
- (BOOL)isInOutdoorWorkout;
- (BOOL)isInOutdoorWorkout:(int)a3;
- (BOOL)isInVisit;
- (CLBarometerCalibrationSim)initWithAOPAltimeter:(void *)a3;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (float)getSurfacePressure;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (id)latestAbsoluteAltitude;
- (void)absoluteAltitudeUpdate:(id)a3;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)dealloc;
- (void)didUpdateDataBuffer:(unint64_t)a3;
- (void)feedCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)feedEnclosureMaterial:(unint64_t)a3;
- (void)feedLocationData:(uint64_t)a3 data:(uint64_t)a4;
- (void)feedLoiAltitude:()vector<CLBarometerCalibration_Types:(std::allocator<CLBarometerCalibration_Types::NormalDistribution>> *)a3 :NormalDistribution;
- (void)feedPrefilteredLocationData:(uint64_t)a3 data:(uint64_t)a4;
- (void)feedPressureData:(const Sample *)a3 andTempDerivative:(float)a4 andWetState:(BOOL)a5;
- (void)feedPressureKF:(const CMKFFilteredPressureSample *)a3;
- (void)feedSubmersionState:(unsigned __int8)a3;
- (void)initContextManagersForNotification:(unint64_t)a3;
- (void)onMotionStateObserverNotification:(int)a3 activityType:(int)a4;
- (void)releaseAndClearManager:(id *)a3;
- (void)releaseContextManagersForNotification:(unint64_t)a3;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)stopTrack:(id)a3;
- (void)surfacePressureCalibrationAtTime:(double)a3 andPressure:(double)a4 andLocation:(BOOL)a5;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
@end

@implementation CLBarometerCalibrationSim

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
}

- (CLBarometerCalibrationSim)initWithAOPAltimeter:(void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSim;
  v4 = -[CLBarometerCalibrationSim init](&v14, "init");
  v5 = v4;
  if (v4)
  {
    v4->_aopAltimeter = a3;
    v6 = -[CLBarometerCalibrationSourceAggregator initWithUniverse:buffers:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceAggregator),  "initWithUniverse:buffers:",  0LL,  &v4->fDataBuffers);
    v5->_sourceAggregator = v6;
    -[CLBarometerCalibrationSourceAggregator setDelegate:](v6, "setDelegate:", v5);
    *(_OWORD *)&v5->_contextManagers.__elems_[6] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[8] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[2] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[4] = 0u;
    *(_OWORD *)v5->_contextManagers.__elems_ = 0u;
    -[CLBarometerCalibrationSim initContextManagersForNotification:](v5, "initContextManagersForNotification:", 2LL);
    -[CLBarometerCalibrationSim initContextManagersForNotification:](v5, "initContextManagersForNotification:", 1LL);
    v5->_latestAbsoluteAltitude = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
    *(void *)&v5->_prevElevationAscended = 0LL;
    v5->_lastAltitudeTime = 1.79769313e308;
    *(int64x2_t *)&v5->_lastAltitude = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v5->_inOutdoorWorkout = 0;
    *(_WORD *)&v5->_currentUnderDEM = 0;
    v5->_sameElevationCounter = 0;
    v5->_fCurrentPressureCalibration = 101.5;
    v5->_fWetState = 0;
    v5->_thresholdManager = objc_alloc_init(&OBJC_CLASS___CLElevationThresholdManager);
    v7 = v5->_contextManagers.__elems_[9];
    objc_opt_class(&OBJC_CLASS___CLContextManagerElevationProfile);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v5->_elevationProfileContextManager = (CLContextManagerElevationProfile *)v5->_contextManagers.__elems_[9];
      v5->_biasEstimator = -[CLBarometerCalibrationBiasEstimator initWithUniverse:delegate:buffers:contextManager:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationBiasEstimator),  "initWithUniverse:delegate:buffers:contextManager:",  0LL,  v5,  &v5->fDataBuffers,  v5->_elevationProfileContextManager);
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101884AA8);
      }
      v9 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "elevation profile context manager does not exist!",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101884AA8);
        }
        v13[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "elevation profile context manager does not exist!",  v13,  2);
        v12 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLBarometerCalibrationSim initWithAOPAltimeter:]", "%s\n", v11);
        if (v12 != buf) {
          free(v12);
        }
      }
    }
  }

  return v5;
}

- (void)feedPressureData:(const Sample *)a3 andTempDerivative:(float)a4 andWetState:(BOOL)a5
{
  v9 = (char *)operator new(0x38uLL);
  *((void *)v9 + 1) = 0LL;
  v10 = (unint64_t *)(v9 + 8);
  *((void *)v9 + 2) = 0LL;
  *(void *)v9 = off_101884AD8;
  int64x2_t v11 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v9 + 24) = v11;
  *(int64x2_t *)(v9 + 40) = v11;
  v22 = v9 + 24;
  v23 = (std::__shared_weak_count *)v9;
  *((CFAbsoluteTime *)v9 + 3) = CFAbsoluteTimeGetCurrent();
  *((float64x2_t *)v9 + 2) = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
  *((double *)v9 + 6) = a4;
  self->_fWetState = a5;
  sourceAggregator = self->_sourceAggregator;
  v20 = v9 + 24;
  v21 = (std::__shared_weak_count *)v9;
  do
    unint64_t v13 = __ldxr(v10);
  while (__stxr(v13 + 1, v10));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  1LL,  &v20);
  objc_super v14 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

- (void)feedPressureKF:(const CMKFFilteredPressureSample *)a3
{
  v5 = (char *)operator new(0x38uLL);
  *((void *)v5 + 1) = 0LL;
  v6 = (unint64_t *)(v5 + 8);
  *((void *)v5 + 2) = 0LL;
  *(void *)v5 = off_101884B28;
  int64x2_t v7 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v5 + 24) = v7;
  *(int64x2_t *)(v5 + 40) = v7;
  unint64_t v19 = v5 + 24;
  v20 = (std::__shared_weak_count *)v5;
  *((CFAbsoluteTime *)v5 + 3) = CFAbsoluteTimeGetCurrent();
  int8x16_t v8 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *((int8x16_t *)v5 + 2) = vextq_s8(v8, v8, 8uLL);
  *((double *)v5 + 6) = a3->var4;
  sourceAggregator = self->_sourceAggregator;
  v17 = v5 + 24;
  v18 = (std::__shared_weak_count *)v5;
  do
    unint64_t v10 = __ldxr(v6);
  while (__stxr(v10 + 1, v6));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  5LL,  &v17);
  int64x2_t v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  objc_super v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)feedCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  if (*(void *)&self->_prevElevationAscended != __PAIR64__(a4, a3))
  {
    self->_int sameElevationCounter = 0;
LABEL_5:
    uint64_t v9 = 0LL;
    self->_prevElevationAscended = a3;
    self->_prevElevationDescended = a4;
    p_contextManagers = &self->_contextManagers;
    do
    {
      int64x2_t v11 = p_contextManagers->__elems_[v9];
      *(double *)&v12[1] = a5;
      unsigned int v13 = a3;
      unsigned int v14 = a4;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:]( v11,  "stepCountElevationNotification:",  v12);
      ++v9;
    }

    while (v9 != 10);
    return;
  }

  int sameElevationCounter = self->_sameElevationCounter;
  if (sameElevationCounter >= 10)
  {
    self->_int sameElevationCounter = 10;
    return;
  }

  self->_int sameElevationCounter = sameElevationCounter + 1;
  if (sameElevationCounter != 9) {
    goto LABEL_5;
  }
}

- (void)feedLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  unsigned __int8 v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:]( &OBJC_CLASS___CLBarometerCalibrationSourceAggregator,  "isLocationUsefulForCalibration:",  v52);

  int64x2_t v7 = v57;
  if (v57)
  {
    p_shared_owners = (unint64_t *)&v57->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v56 < 0) {
    operator delete(__p);
  }
  unint64_t v10 = v54;
  if (v54)
  {
    int64x2_t v11 = (unint64_t *)&v54->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unsigned int v13 = v53;
  if (!v53) {
    goto LABEL_17;
  }
  unsigned int v14 = (unint64_t *)&v53->__shared_owners_;
  do
    unint64_t v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if ((v6 & 1) == 0) {
      return;
    }
  }

  else
  {
LABEL_17:
    if ((v6 & 1) == 0) {
      return;
    }
  }

  sub_10059CD18(&v50);
  double v16 = *(double *)(a4 + 76);
  uint64_t v17 = v50;
  *(double *)uint64_t v50 = v16;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)(a4 + 4);
  *(int8x16_t *)(v17 + 24) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
  *(void *)(v17 + 40) = *(void *)(a4 + 36);
  int v18 = *(_DWORD *)(a4 + 96);
  *(_DWORD *)(v17 + 100) = v18;
  *(_DWORD *)(v17 + 96) = *(_DWORD *)(a4 + 140);
  *(_DWORD *)(v17 + 104) = *(_DWORD *)(a4 + 216);
  *(void *)(v17 + 48) = *(void *)(a4 + 536);
  double v19 = *(double *)(a4 + 544);
  *(double *)(v17 + 56) = v19;
  *(_OWORD *)(v17 + 64) = *(_OWORD *)(a4 + 520);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a4 + 44);
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(a4 + 704);
  *(_BYTE *)(v17 + 128) = 0;
  if (v18 == 1 && v19 > 0.0)
  {
    [*(id *)(a1 + 584) timestamp];
    if (vabdd_f64(v16, v20) < 5.0)
    {
      uint64_t v21 = v50;
      if (*(_BYTE *)(a1 + 680)) {
        *(_WORD *)(v50 + 130) |= 2u;
      }
      if (*(_DWORD *)(v21 + 104) == 2) {
        *(_WORD *)(v21 + 130) |= 4u;
      }
      [*(id *)(a1 + 584) accuracy];
      double v23 = *(double *)(v50 + 48);
      double v24 = v22 + 20.0 + *(double *)(v50 + 56);
      v25 = *(void **)(a1 + 584);
      if (*(_BYTE *)(a1 + 624))
      {
        [v25 altitude];
        if (v23 - v26 < v24 + -3.0)
        {
          char v27 = 0;
LABEL_33:
          *(_BYTE *)(a1 + 624) = v27;
        }
      }

      else
      {
        [v25 altitude];
        if (v23 - v28 > v24)
        {
          char v27 = 1;
          goto LABEL_33;
        }
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101884AA8);
      }
      v29 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        int v30 = *(unsigned __int16 *)(v50 + 130);
        *(_DWORD *)buf = 67109120;
        int v62 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "good DEM data: location altitude state is %u",  buf,  8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101884AA8);
        }
        int v45 = *(unsigned __int16 *)(v50 + 130);
        int v59 = 67109120;
        int v60 = v45;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "good DEM data: location altitude state is %u",  &v59);
        v47 = (uint8_t *)v46;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v46);
        if (v47 != buf) {
          free(v47);
        }
      }

      goto LABEL_39;
    }
  }

  *(_BYTE *)(a1 + 624) = 0;
LABEL_39:
  if (*(_BYTE *)(a1 + 624)) {
    *(_WORD *)(v50 + 130) |= 1u;
  }
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101884AA8);
  }
  v31 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
  {
    int v32 = *(unsigned __int16 *)(v50 + 130);
    *(_DWORD *)buf = 67109120;
    int v62 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "location altitude state %u", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101884AA8);
    }
    int v42 = *(unsigned __int16 *)(v50 + 130);
    int v59 = 67109120;
    int v60 = v42;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  1LL,  "location altitude state %u",  &v59);
    v44 = (uint8_t *)v43;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v43);
    if (v44 != buf) {
      free(v44);
    }
  }

  v33 = *(void **)(a1 + 568);
  uint64_t v48 = v50;
  v49 = v51;
  if (v51)
  {
    v34 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }

  [v33 didUpdateSource:0 withData:&v48];
  v36 = v49;
  if (v49)
  {
    v37 = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  v39 = v51;
  if (v51)
  {
    v40 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

- (void)feedPrefilteredLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  unsigned __int8 v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:]( &OBJC_CLASS___CLBarometerCalibrationSourceAggregator,  "isLocationUsefulForCalibration:",  v30);

  int64x2_t v7 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v34 < 0) {
    operator delete(__p);
  }
  unint64_t v10 = v32;
  if (v32)
  {
    int64x2_t v11 = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unsigned int v13 = v31;
  if (!v31) {
    goto LABEL_17;
  }
  unsigned int v14 = (unint64_t *)&v31->__shared_owners_;
  do
    unint64_t v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if ((v6 & 1) == 0) {
      return;
    }
  }

  else
  {
LABEL_17:
    if ((v6 & 1) == 0) {
      return;
    }
  }

  sub_10059CD18(&v28);
  double v16 = v28;
  *double v28 = *(void *)(a4 + 76);
  *(_OWORD *)(v16 + 1) = *(_OWORD *)(a4 + 4);
  *(int8x16_t *)(v16 + 3) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
  v16[5] = *(void *)(a4 + 36);
  *((_DWORD *)v16 + 25) = *(_DWORD *)(a4 + 96);
  *((_DWORD *)v16 + 24) = *(_DWORD *)(a4 + 140);
  *((_DWORD *)v16 + 26) = *(_DWORD *)(a4 + 216);
  *((_OWORD *)v16 + 3) = *(_OWORD *)(a4 + 536);
  *((_OWORD *)v16 + 4) = *(_OWORD *)(a4 + 520);
  *((_OWORD *)v16 + 5) = *(_OWORD *)(a4 + 44);
  *((_OWORD *)v16 + 7) = *(_OWORD *)(a4 + 704);
  *((_BYTE *)v16 + 128) = 1;
  uint64_t v17 = *(void **)(a1 + 568);
  double v26 = v16;
  char v27 = v29;
  if (v29)
  {
    int v18 = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  [v17 didUpdateSource:6 withData:&v26];
  double v20 = v27;
  if (v27)
  {
    uint64_t v21 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  double v23 = v29;
  if (v29)
  {
    double v24 = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v4 = 0LL;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager sourceUpdated:](p_contextManagers->__elems_[v4++], "sourceUpdated:", a3);
  while (v4 != 10);
}

- (void)stopTrack:(id)a3
{
  if ([a3 fNotification] == (id)2)
  {
    [a3 fStartTime];
    double v6 = v5;
    [a3 fEndTime];
    double v8 = v7;
    [a3 fNextTrackStartTime];
    -[CLBarometerCalibrationSim updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]( self,  "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:",  v6,  v8,  v9);
  }

- (void)absoluteAltitudeUpdate:(id)a3
{
  double v5 = (CLBarometerCalibrationAbsoluteAltitude *)[a3 copy];
  self->_latestAbsoluteAltitude = v5;
  int v11 = -8388609;
  int v12 = 2139095039;
  thresholdManager = self->_thresholdManager;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](v5, "altitude");
  float v8 = v7;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  *(float *)&double v10 = v9;
  *(float *)&double v9 = v8;
  -[CLElevationThresholdManager updateWithAltitude:andAccuracy:upperBound:lowerBound:]( thresholdManager,  "updateWithAltitude:andAccuracy:upperBound:lowerBound:",  &v12,  &v11,  v9,  v10);
  -[CLBarometerCalibrationSim alertElevationAlertClientsOnChange](self, "alertElevationAlertClientsOnChange");
}

- (id)copyCurrentBias
{
  return -[CLBarometerCalibrationBiasEstimator copyCurrentBias](self->_biasEstimator, "copyCurrentBias");
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
}

- (void)initContextManagersForNotification:(unint64_t)a3
{
  if (a3 == 1)
  {
    if (self->_contextManagers.__elems_[5]) {
      goto LABEL_8;
    }
    uint64_t v4 = &self->_contextManagers.__elems_[5];
    double v5 = off_101815828;
  }

  else
  {
    if (a3 != 2 || self->_contextManagers.__elems_[6]) {
      goto LABEL_8;
    }
    uint64_t v4 = &self->_contextManagers.__elems_[6];
    double v5 = off_101815830;
  }

  CLBarometerCalibrationSim *v4 = (CLBarometerCalibrationContextManager *)[objc_alloc(*v5) initWithUniverse:0 delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
LABEL_8:
  if (!self->_contextManagers.__elems_[7]) {
    self->_contextManagers.__elems_[7] = (CLBarometerCalibrationContextManager *)-[CLContextManagerWaterSubmersion initWithUniverse:delegate:withBuffer:withSourceAggregator:]( objc_alloc(&OBJC_CLASS___CLContextManagerWaterSubmersion),  "initWithUniverse:delegate:withBuffer: withSourceAggregator:",  0LL,  self,  &self->fDataBuffers,  self->_sourceAggregator);
  }
}

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = 536LL;
  }

  else
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = 528LL;
  }

  -[CLBarometerCalibrationSim releaseAndClearManager:](self, "releaseAndClearManager:", (char *)self + v3);
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    [*a3 cleanup];

    *a3 = 0LL;
  }

- (void)dealloc
{
  self->_biasEstimator = 0LL;
  self->_latestAbsoluteAltitude = 0LL;

  self->_thresholdManager = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSim;
  -[CLBarometerCalibrationSim dealloc](&v3, "dealloc");
}

- (BOOL)inOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (BOOL)isInOutdoorWorkout:(int)a3
{
  BOOL result = 1;
  if (a3 <= 19089)
  {
  }

  else
  {
    if (a3 > 90602)
    {
      if (a3 == 90603) {
        return result;
      }
      int v4 = 519150;
    }

    else
    {
      if (a3 == 19090) {
        return result;
      }
      int v4 = 19150;
    }

    if (a3 != v4) {
      return 0;
    }
  }

  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 activityType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101884AA8);
  }
  double v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received workout activity.", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101884AA8);
    }
    LOWORD(v19) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "received workout activity.",  &v19,  2);
    unsigned int v13 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]",  "%s\n",  v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  if (!a3)
  {
    if (-[CLBarometerCalibrationSim isInOutdoorWorkout:](self, "isInOutdoorWorkout:", v4))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101884AA8);
      }
      float v8 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v22 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "motion state observer updates,activityType,%d",  buf,  8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101884AA8);
        }
        int v19 = 67109120;
        BOOL v20 = v4;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "motion state observer updates,activityType,%d",  &v19);
        int v18 = (uint8_t *)v17;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]",  "%s\n",  v17);
        if (v18 != buf) {
          free(v18);
        }
      }

      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = 0;
    }

    self->_BOOL inOutdoorWorkout = v9;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101884AA8);
    }
    double v10 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL inOutdoorWorkout = self->_inOutdoorWorkout;
      *(_DWORD *)buf = 67109120;
      BOOL v22 = inOutdoorWorkout;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "outdoor workout status updated,inOutdoorWorkout,%d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101884AA8);
      }
      BOOL v14 = self->_inOutdoorWorkout;
      int v19 = 67109120;
      BOOL v20 = v14;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "outdoor workout status updated,inOutdoorWorkout,%d",  &v19);
      double v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }
  }

- (void)feedEnclosureMaterial:(unint64_t)a3
{
  objc_super v3 = self->_contextManagers.__elems_[7];
  if (v3) {
    -[CLBarometerCalibrationContextManager feedEnclosureMaterial:](v3, "feedEnclosureMaterial:", a3);
  }
}

- (BOOL)feedLoiData:(RoutineVisit *)a3
{
  if (a3->var2 == 0.0 && a3->var3 == 0.0) {
    return 0;
  }
  double v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->var0);
  double v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->var1);
  if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast")) & 1) != 0
    || (-[NSDate isEqual:](v7, "isEqual:", +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture")) & 1) == 0)
  {
    if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast")) & 1) != 0
      || (-[NSDate isEqual:]( v7,  "isEqual:",  +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture")) & 1) != 0)
    {
      goto LABEL_11;
    }

    BOOL v8 = 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  self->_BOOL inVisit = v8;
LABEL_11:
  if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast")) & 1) == 0
    && a3->var1 == 0.0)
  {
    self->_BOOL inVisit = 1;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101884AA8);
  }
  BOOL v9 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisit = self->_inVisit;
    *(_DWORD *)buf = 67109120;
    BOOL v16 = inVisit;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "received visit for altimeter, inVisit, %d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101884AA8);
    }
    BOOL v11 = self->_inVisit;
    v14[0] = 67109120;
    v14[1] = v11;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "received visit for altimeter, inVisit, %d",  v14);
    unsigned int v13 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSim feedLoiData:]", "%s\n", v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  -[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]( self->_biasEstimator,  "updateVisitState:arrivalTime:departureTime:",  self->_inVisit,  a3->var0,  a3->var1);
  return self->_inVisit;
}

- (void)feedLoiAltitude:()vector<CLBarometerCalibration_Types:(std::allocator<CLBarometerCalibration_Types::NormalDistribution>> *)a3 :NormalDistribution
{
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)announceMostRecentForcedGPS:(double)a3
{
}

- (void)surfacePressureCalibrationAtTime:(double)a3 andPressure:(double)a4 andLocation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = (char *)operator new(0x30uLL);
  *((void *)v8 + 1) = 0LL;
  BOOL v9 = (unint64_t *)(v8 + 8);
  *((void *)v8 + 2) = 0LL;
  *(void *)BOOL v8 = off_10184EB00;
  *(int64x2_t *)(v8 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((void *)v8 + 5) = 3LL;
  BOOL v22 = v8 + 24;
  double v23 = (std::__shared_weak_count *)v8;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)v8 + 10) = !v5;
  *((CFAbsoluteTime *)v8 + 3) = Current;
  *((double *)v8 + 4) = a4;
  if (vabdd_f64(self->_fCurrentPressureCalibration, a4) >= 3.0 || !self->_fWetState)
  {
    float v11 = a4;
    self->_fCurrentPressureCalibration = v11;
    sourceAggregator = self->_sourceAggregator;
    BOOL v20 = v8 + 24;
    uint64_t v21 = (std::__shared_weak_count *)v8;
    do
      unint64_t v13 = __ldxr(v9);
    while (__stxr(v13 + 1, v9));
    -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  7LL,  &v20);
    BOOL v14 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }

  uint64_t v17 = v23;
  if (v23)
  {
    int v18 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

- (float)getSurfacePressure
{
  return self->_fCurrentPressureCalibration;
}

- (void)feedSubmersionState:(unsigned __int8)a3
{
  BOOL v5 = (std::__shared_weak_count *)operator new(0x28uLL);
  v5->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0LL;
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_10184EAB0;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)0x7FEFFFFFFFFFFFFFLL;
  v5[1].__shared_owners_ = 0LL;
  uint64_t v17 = &v5[1].__vftable;
  int v18 = v5;
  *(CFAbsoluteTime *)&v5[1].__vftable = CFAbsoluteTimeGetCurrent();
  LOBYTE(v5[1].__shared_owners_) = a3;
  sourceAggregator = self->_sourceAggregator;
  unint64_t v15 = &v5[1].__vftable;
  unint64_t v16 = v5;
  do
    unint64_t v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]( sourceAggregator,  "didUpdateSource:withData:",  8LL,  &v15);
  BOOL v9 = v16;
  if (v16)
  {
    double v10 = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  int v12 = v18;
  if (v18)
  {
    unint64_t v13 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

- (BOOL)isInOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_BOOL inOutdoorWorkout = a3;
}

- (double)getLastAltitude
{
  return self->_lastAltitude;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (double)getLastAltitudeAccuracy
{
  return self->_lastAltitudeAccuracy;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (double)getLastAltitudeTime
{
  return self->_lastAltitudeTime;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 55LL; i != -5; i -= 6LL)
    sub_10049108C(&(&self->super.isa)[i]);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(void *)((char *)self + 636) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end