@interface CLBarometerCalibrationBiasEstimator
+ (void)getLocationSampleAltitudeAndUncertainty:(void *)a3 andRefAltitude:(double *)a4 andRefUncertainty:(double *)a5;
- (BOOL)getLastPressureSample:(double *)a3;
- (BOOL)isIHAAuthorized;
- (BOOL)updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (BiasEstimatorLocation)centroidOfLocationVector:(const void *)a3;
- (CLBarometerCalibrationBiasEstimator)initWithUniverse:(id)a3 delegate:(id)a4 buffers:(void *)a5 contextManager:(id)a6;
- (CLBarometerCalibrationPressureData)getClosestEntryToRefTime:(double)a3 inPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>;
- (double)crossEntropyOfreference:(ReferencePairedWithPressure *)a3;
- (double)getAbsoluteAltitudeUncertainty;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (int)selectReferenceWithReference:(void *)a3 withBaroElevation:(double)a4 betweenStartTime:(double)a5 andEndTime:(double)a6;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)computeMeanSeaLevelPressureWithRebasingLocationData:(id)a3 referenceMap:(void *)a4 andLocationType:(int)a5;
- (void)cumulateReference:(void *)a3 andRefAltitude:(double)a4 andRefVariance:(double)a5 andBaroElevation:(double)a6 andType:(int)a7;
- (void)dealloc;
- (void)rebaseSignificantElevationWithEndTime:(double)a3;
- (void)retrieveBiasInfo;
- (void)saveBiasInfo;
- (void)sendRebaseAnalyticsWithAltitudeError:(double)a3 andUncertainty:(double)a4 andRefUncertainty:(double)a5 andDemAvailable:(BOOL)a6 andWorkout:(BOOL)a7 andReferenceSource:(int)a8 andCorrection:(double)a9 andDistance:(double)a10;
- (void)sendVisitExitAnalyticsWithDuration:(double)a3 andRebaseEvent:(void *)a4 andUncertaintyAtEntry:(double)a5;
- (void)sendVisitExitWifiImprovementAnalyticsEventWithDuration:(double)a3 uncertaintyAtVisitEntry:(double)a4 uncertaintyAtVisitExit:(double)a5 timeDiffBtwArrivalAndLastRebase:(double)a6;
- (void)updateBiasUncertaintyWithAbsSigElevation:(double)a3 withCompanion:(BOOL)a4;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)updateHistoricalMslpArray:(id)a3;
- (void)updateLoiInfo:(const void *)a3;
- (void)updatePressureUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateVisitState:(BOOL)a3 arrivalTime:(double)a4 departureTime:(double)a5;
@end

@implementation CLBarometerCalibrationBiasEstimator

- (CLBarometerCalibrationBiasEstimator)initWithUniverse:(id)a3 delegate:(id)a4 buffers:(void *)a5 contextManager:(id)a6
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationBiasEstimator;
  v10 = -[CLBarometerCalibrationBiasEstimator init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    v10->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v10->_universe = (CLIntersiloUniverse *)a3;
    v10->_dataBuffers = a5;
    *(_OWORD *)&v10->_biasPressure = xmmword_1012ED940;
    *(_OWORD *)&v10->_biasUncertaintyTimestamp = xmmword_1012ED950;
    v10->_estimatedMeanSeaLevelPressure = 101325.0;
    *(_OWORD *)&v10->_weatherEstimateInMeter = xmmword_1012ED960;
    *(_OWORD *)&v10->_previousBiasTimestamp = xmmword_1012ED930;
    v10->_pressureUncertainty = 0.0;
    v10->_distanceTraveled = 0.0;
    *(_OWORD *)&v10->_distanceSinceLastRebase = xmmword_1012ED970;
    *(void *)&v10->_offSetAscendedDelta = 0LL;
    v10->_previousCumulativeDeltaIOSTime = 1.79769313e308;
    v12 = (CLSignificantElevationEstimator *)operator new(0x2B8uLL);
    sub_1010DDBC0(__p, "BarometerRebaseSignificantElevation");
    sub_1005FCFDC(v12, __p);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
    value = (void **)v11->_fSignificantElevationEstimatorRebase.__ptr_.__value_;
    v11->_fSignificantElevationEstimatorRebase.__ptr_.__value_ = v12;
    if (value) {
      sub_1004907D8((_DWORD)v11 + 136, value);
    }
    sub_101206C88((unsigned __int8 *)__p, "BarometerCalibrationMaxBiasAgeFromRecovery", dword_1012EDB20, 0);
    v11->_maxBiasAgeFromRecovery = *((float *)__p + 1);
    v11->_inVisitStatus = 0;
    *(_WORD *)&v11->_companionRebase = 0;
    v11->_forceCalibrate = 0;
    v11->_lastVisitEntryTime = 1.79769313e308;
    v11->_locationdStartTime = CFAbsoluteTimeGetCurrent();
    *(_OWORD *)&v11->_lastForcedGpsTime = xmmword_1012ED980;
    *(int64x2_t *)&v11->_lastRebaseTimestamp = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v11->_visitArrivalTimestamp = 1.79769313e308;
    v11->_lastTimestampSavedRecovery = 1.79769313e308;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___CLContextManagerElevationProfile);
    if ((objc_opt_isKindOfClass(a6, v14) & 1) != 0)
    {
      v11->_meanSeaLevelPressureEstimator = -[CLMeanSeaLevelPressureEstimator initWithContextManager:andUniverse:andDelegate:andBuffers:]( objc_alloc(&OBJC_CLASS___CLMeanSeaLevelPressureEstimator),  "initWithContextManager:andUniverse:andDelegate:andBuffers:",  a6,  v11->_universe,  v11->_delegate,  v11->_dataBuffers);
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      v15 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "wrong type of context manager for elevation profile context manager.",  (uint8_t *)__p,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        *(_WORD *)v18 = 0;
        v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "wrong type of context manager for elevation profile context manager.",  v18,  2);
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLBarometerCalibrationBiasEstimator initWithUniverse:delegate:buffers:contextManager:]",  "%s\n",  v17);
      }
    }

    -[CLBarometerCalibrationBiasEstimator retrieveBiasInfo](v11, "retrieveBiasInfo");
    v18[0] = 0;
    sub_1012049AC((unsigned __int8 *)__p, "BarometerCalibrationLoiRebase", v18, 0);
    v11->_enableLoiRebase = BYTE1(__p[0]);
  }

  return v11;
}

- (void)dealloc
{
  self->_delegate = 0LL;
  self->_universe = 0LL;
  self->_meanSeaLevelPressureEstimator = 0LL;
  self->_queriedMeanSeaLevelPressureData = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationBiasEstimator;
  -[CLBarometerCalibrationBiasEstimator dealloc](&v3, "dealloc");
}

- (id)copyCurrentBias
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationBiasData);
  -[CLBarometerCalibrationBiasData setTimestamp:](v3, "setTimestamp:", self->_biasTimestamp);
  -[CLBarometerCalibrationBiasData setBiasInMeters:](v3, "setBiasInMeters:", self->_bias);
  if (-[CLMeanSeaLevelPressureEstimator getMeanSeaLevelArrayCount]( self->_meanSeaLevelPressureEstimator,  "getMeanSeaLevelArrayCount"))
  {
    -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
  }

  else
  {
    double v4 = 500.0;
  }

  -[CLBarometerCalibrationBiasData setUncertaintyInMeters:](v3, "setUncertaintyInMeters:", v4);
  -[CLBarometerCalibrationBiasData setEstimatedMeanSeaLevelPressure:]( v3,  "setEstimatedMeanSeaLevelPressure:",  self->_estimatedMeanSeaLevelPressure);
  -[CLBarometerCalibrationBiasData setEstimatedUncertainty:]( v3,  "setEstimatedUncertainty:",  self->_estimatedAbsoluteAltitudeUncertainty);
  -[CLBarometerCalibrationBiasData setWeatherEstimateInMeter:]( v3,  "setWeatherEstimateInMeter:",  *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
  - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82));
  -[CLBarometerCalibrationBiasData setPreviousCumulativeDeltaIOSTime:]( v3,  "setPreviousCumulativeDeltaIOSTime:",  (unint64_t)self->_previousCumulativeDeltaIOSTime);
  -[CLBarometerCalibrationBiasData setStatusInfo:](v3, "setStatusInfo:", 0LL);
  return v3;
}

- (CLBarometerCalibrationPressureData)getClosestEntryToRefTime:(double)a3 inPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  begin = a4->__map_.__begin_;
  if (a4->__map_.__end_ != begin)
  {
    unint64_t start = a4->__start_;
    v6 = &begin[start >> 8];
    v7 = (char *)*v6 + 16 * start;
    if (v7 != (char *)v8)
    {
      double v10 = 1.79769313e308;
      *(double *)&uint64_t v11 = 1.79769313e308;
      double v12 = 1.79769313e308;
      while (1)
      {
        uint64_t v13 = *(void *)v7;
        uint64_t v14 = (std::__shared_weak_count *)*((void *)v7 + 1);
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            unint64_t v16 = __ldxr(p_shared_owners);
          while (__stxr(v16 + 1, p_shared_owners));
        }

        double v17 = vabdd_f64(a3, *(double *)v13);
        if (v17 >= v10 || v17 > 5.0)
        {
          if (v17 > v10)
          {
            int v19 = 0;
            if (v14) {
              goto LABEL_16;
            }
            goto LABEL_20;
          }
        }

        else
        {
          uint64_t v11 = *(uint64_t *)(v13 + 8);
          double v12 = *(double *)v13;
          double v10 = v17;
        }

        int v19 = 1;
        if (v14)
        {
LABEL_16:
          v20 = (unint64_t *)&v14->__shared_owners_;
          do
            unint64_t v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
            std::__shared_weak_count::__release_weak(v14);
          }
        }

- (double)getAbsoluteAltitudeUncertainty
{
  return fmin(self->_biasUncertainty, 500.0);
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  double previousCumulativeDeltaIOSTime = self->_previousCumulativeDeltaIOSTime;
  if (previousCumulativeDeltaIOSTime == 1.79769313e308)
  {
    self->_offSetAscendedDelta = a3;
    self->_offSetDescendedDelta = a4;
    double previousCumulativeDeltaIOSTime = a5;
    self->_double previousCumulativeDeltaIOSTime = a5;
  }

  if (vabdd_f64(a5, previousCumulativeDeltaIOSTime) > 18.0) {
    sub_1005FCFE0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  }
  sub_1005FD5B4( (unsigned __int16 *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_,  a3 - self->_offSetAscendedDelta,  a4 - self->_offSetDescendedDelta,  1000,  (int)-[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit"),  a5);
  self->_double previousCumulativeDeltaIOSTime = a5;
  if (-[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v27))
  {
    -[CLMeanSeaLevelPressureEstimator minPressure](self->_meanSeaLevelPressureEstimator, "minPressure");
    if (v11 == 1.79769313e308
      || (-[CLMeanSeaLevelPressureEstimator maxPressure](self->_meanSeaLevelPressureEstimator, "maxPressure"),
          v12 == 1.79769313e308))
    {
      -[CLMeanSeaLevelPressureEstimator setMinPressure:](self->_meanSeaLevelPressureEstimator, "setMinPressure:", v27);
      double v13 = v27;
LABEL_9:
      -[CLMeanSeaLevelPressureEstimator setMaxPressure:](self->_meanSeaLevelPressureEstimator, "setMaxPressure:", v13);
      goto LABEL_10;
    }

    -[CLMeanSeaLevelPressureEstimator minPressure](self->_meanSeaLevelPressureEstimator, "minPressure");
    if (v18 > v27) {
      -[CLMeanSeaLevelPressureEstimator setMinPressure:](self->_meanSeaLevelPressureEstimator, "setMinPressure:");
    }
    -[CLMeanSeaLevelPressureEstimator maxPressure](self->_meanSeaLevelPressureEstimator, "maxPressure");
    double v20 = v19;
    double v13 = v27;
    if (v20 < v27) {
      goto LABEL_9;
    }
  }

- (double)crossEntropyOfreference:(ReferencePairedWithPressure *)a3
{
  double v5 = 1.0;
  double v6 = (a3->var0.var0 - a3->var1.var0) * (a3->var0.var0 - a3->var1.var0);
  if (!self->_inVisitStatus) {
    double v5 = v6 / (v6 + *(double *)&qword_101995C68);
  }
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisitStatus = self->_inVisitStatus;
    *(_DWORD *)buf = 136315906;
    double v25 = "crossEntropyWeighting";
    __int16 v26 = 2048;
    double v27 = v5;
    __int16 v28 = 2080;
    double v29 = "inVisitStatus";
    __int16 v30 = 1024;
    BOOL v31 = inVisitStatus;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cross entropy weighting,%s,%f,%s,%d",  buf,  0x26u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    BOOL v13 = self->_inVisitStatus;
    int v16 = 136315906;
    double v17 = "crossEntropyWeighting";
    __int16 v18 = 2048;
    double v19 = v5;
    __int16 v20 = 2080;
    double v21 = "inVisitStatus";
    __int16 v22 = 1024;
    BOOL v23 = v13;
    LODWORD(v15) = 38;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "cross entropy weighting,%s,%f,%s,%d",  (const char *)&v16,  v15);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:]",  "%s\n",  v14);
  }

  double var1 = a3->var0.var1;
  double v10 = log(var1 * 17.0794684);
  double v11 = a3->var1.var1;
  return v10 + v5 * ((v6 + var1) / v11 + log(v11 / var1) + -1.0);
}

+ (void)getLocationSampleAltitudeAndUncertainty:(void *)a3 andRefAltitude:(double *)a4 andRefUncertainty:(double *)a5
{
  uint64_t v5 = *(void *)a3;
  uint64_t v6 = 24LL;
  *a4 = *(double *)(v5 + v6);
  uint64_t v7 = 40LL;
  *a5 = *(double *)(v5 + v7);
}

- (void)cumulateReference:(void *)a3 andRefAltitude:(double)a4 andRefVariance:(double)a5 andBaroElevation:(double)a6 andType:(int)a7
{
  int v25 = a7;
  if (a5 <= 9.0 || a7 != 4)
  {
    double v12 = (char *)a3 + 8;
    BOOL v13 = (char *)*((void *)a3 + 1);
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = (char *)a3 + 8;
    do
    {
      int v15 = *((_DWORD *)v13 + 8);
      BOOL v16 = v15 < a7;
      if (v15 >= a7) {
        double v17 = (char **)v13;
      }
      else {
        double v17 = (char **)(v13 + 8);
      }
      if (!v16) {
        uint64_t v14 = v13;
      }
      BOOL v13 = *v17;
    }

    while (*v17);
    if (v14 == v12 || *((_DWORD *)v14 + 8) > a7) {
LABEL_15:
    }
      uint64_t v14 = (char *)a3 + 8;
    if (a5 > 0.0 && v14 == v12)
    {
      int v24 = 0;
      memset(v23, 0, sizeof(v23));
      sub_100490810((uint64_t **)a3, &v25, &v25, (uint64_t)v23);
    }

    if (a5 > 0.0)
    {
      double v19 = sub_10000C6DC((uint64_t)a3, &v25);
      *(double *)double v19 = *(double *)v19 + a4;
      __int16 v20 = sub_10000C6DC((uint64_t)a3, &v25);
      *((double *)v20 + 1) = *((double *)v20 + 1) + a5;
      double v21 = sub_10000C6DC((uint64_t)a3, &v25);
      *((double *)v21 + 2) = *((double *)v21 + 2) + a6;
      __int16 v22 = sub_10000C6DC((uint64_t)a3, &v25);
      ++*((_DWORD *)v22 + 8);
    }
  }

- (BiasEstimatorLocation)centroidOfLocationVector:(const void *)a3
{
  objc_super v3 = *(double **)a3;
  double v4 = (double *)*((void *)a3 + 1);
  unint64_t v5 = 0LL;
  double v6 = 0.0;
  double v7 = 0.0;
  do
  {
    if (*v3 != 1.79769313e308)
    {
      double v8 = v3[1];
      if (v8 != 1.79769313e308)
      {
        double v6 = v6 + *v3;
        double v7 = v7 + v8;
        ++v5;
      }
    }

    v3 += 2;
  }

  while (v3 != v4);
  if (!v5)
  {
LABEL_14:
    double v10 = 1.79769313e308;
    double v11 = 1.79769313e308;
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v21 = v6 / (double)v5;
      __int16 v22 = 2048;
      double v23 = v7 / (double)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "new centroid: latitude %f, longitude %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v10 = v6 / (double)v5;
      double v11 = v7 / (double)v5;
      int v16 = 134218240;
      double v17 = v10;
      __int16 v18 = 2048;
      double v19 = v11;
      LODWORD(v15) = 22;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "new centroid: latitude %f, longitude %f",  COERCE_DOUBLE(&v16),  v15);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator centroidOfLocationVector:]",  "%s\n",  v14);
    }

    else
    {
      double v10 = v6 / (double)v5;
      double v11 = v7 / (double)v5;
    }
  }

  double v12 = v10;
  double v13 = v11;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (void)updatePressureUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  if (a5 != 1.79769313e308 && a6 != 1.79769313e308)
  {
    double latitude = self->_biasLocation.latitude;
    if (latitude != 1.79769313e308)
    {
      double v13 = fabs(sub_100D2EC74(latitude, self->_biasLocation.longitude, a5, a6));
      self->_double pressureUncertainty = self->_pressureUncertainty + v13 * 0.00200000009;
      self->_double distanceTraveled = v13;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      uint64_t v14 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        double distanceTraveled = self->_distanceTraveled;
        double pressureUncertainty = self->_pressureUncertainty;
        *(_DWORD *)buf = 134218496;
        *(double *)v55 = distanceTraveled;
        *(_WORD *)&v55[8] = 2048;
        *(double *)&v55[10] = distanceTraveled * 0.00200000009;
        *(_WORD *)&v55[18] = 2048;
        *(double *)&v55[20] = pressureUncertainty;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "updated pressure uncertainty due to distance %f by %f uncertainty now is %f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v44 = self->_distanceTraveled;
        double v45 = self->_pressureUncertainty;
        *(_DWORD *)v50 = 134218496;
        *(double *)&v50[4] = v44;
        *(_WORD *)&v50[12] = 2048;
        *(double *)&v50[14] = v44 * 0.00200000009;
        *(_WORD *)&v50[22] = 2048;
        *(double *)&v50[24] = v45;
        LODWORD(v49) = 32;
        __int16 v46 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "updated pressure uncertainty due to distance %f by %f uncertainty now is %f",  COERCE_DOUBLE(v50),  v49);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v46);
      }
    }

    self->_biasLocation.double latitude = a5;
    self->_biasLocation.longitude = a6;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    double v17 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v55 = a5;
      *(_WORD *)&v55[8] = 2048;
      *(double *)&v55[10] = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "updated bias location latitude %f longitude %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      *(_DWORD *)v50 = 134218240;
      *(double *)&v50[4] = a5;
      *(_WORD *)&v50[12] = 2048;
      *(double *)&v50[14] = a6;
      LODWORD(v49) = 22;
      __int16 v34 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "updated bias location latitude %f longitude %f",  COERCE_DOUBLE(v50),  v49);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v34);
    }
  }

  if (self->_biasUncertaintyTimestamp < a4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (vabdd_f64(Current, a4) < 10.0)
    {
      self->_BOOL inVisitStatus = -[CLBarometerCalibrationContextClient isInVisit]( self->_delegate,  "isInVisit");
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v19 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        BOOL inVisitStatus = self->_inVisitStatus;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v55 = inVisitStatus;
        *(_WORD *)&v55[4] = 2048;
        *(double *)&v55[6] = a4;
        *(_WORD *)&v55[14] = 2048;
        *(double *)&v55[16] = Current;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "updated visit status for bias estimator, %d, step count timestamp, %f, current time, %f",  buf,  0x1Cu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        BOOL v47 = self->_inVisitStatus;
        *(_DWORD *)v50 = 67109632;
        *(_DWORD *)&v50[4] = v47;
        *(_WORD *)&v50[8] = 2048;
        *(double *)&v50[10] = a4;
        *(_WORD *)&v50[18] = 2048;
        *(double *)&v50[20] = Current;
        LODWORD(v49) = 28;
        v48 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "updated visit status for bias estimator, %d, step count timestamp, %f, current time, %f",  v50,  v49,  *(double *)v50);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v48);
      }
    }

    if (*((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154)) {
      double v21 = 0.0277777778;
    }
    else {
      double v21 = dbl_1012ED990[!self->_inVisitStatus];
    }
    float v22 = a3;
    BOOL v23 = sub_100FADFE8(v22, 101320.0) < 3000.0;
    double v24 = 0.05;
    if (v23) {
      double v24 = v21;
    }
    else {
      double v25 = 0.0;
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    __int16 v26 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      int v27 = *((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154);
      BOOL v28 = self->_inVisitStatus;
      float v29 = sub_100FADFE8(v22, 101320.0);
      *(_DWORD *)buf = 134218752;
      *(double *)v55 = v25;
      *(_WORD *)&v55[8] = 1024;
      *(_DWORD *)&v55[10] = v27;
      *(_WORD *)&v55[14] = 1024;
      *(_DWORD *)&v55[16] = v28;
      *(_WORD *)&v55[20] = 2048;
      *(double *)&v55[22] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "updated weather drift due to time, %f, sig elev state, %d, inVisit, %d, altitude %f",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      uint64_t v35 = qword_1019346A8;
      int v36 = *((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154);
      BOOL v37 = self->_inVisitStatus;
      float v38 = sub_100FADFE8(v22, 101320.0);
      *(_DWORD *)v50 = 134218752;
      *(double *)&v50[4] = v25;
      *(_WORD *)&v50[12] = 1024;
      *(_DWORD *)&v50[14] = v36;
      *(_WORD *)&v50[18] = 1024;
      *(_DWORD *)&v50[20] = v37;
      *(_WORD *)&v50[24] = 2048;
      *(double *)&v50[26] = v38;
      double v39 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v35,  2LL,  "updated weather drift due to time, %f, sig elev state, %d, inVisit, %d, altitude %f",  COERCE_DOUBLE(v50),  34);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v39);
    }

    self->_double pressureUncertainty = self->_pressureUncertainty + v25 * (a4 - self->_biasUncertaintyTimestamp);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    __int16 v30 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      double biasTimestamp = self->_biasTimestamp;
      double biasUncertaintyTimestamp = self->_biasUncertaintyTimestamp;
      double v33 = self->_pressureUncertainty;
      *(_DWORD *)buf = 134219008;
      *(double *)v55 = a4;
      *(_WORD *)&v55[8] = 2048;
      *(double *)&v55[10] = biasTimestamp;
      *(_WORD *)&v55[18] = 2048;
      *(double *)&v55[20] = biasUncertaintyTimestamp;
      *(_WORD *)&v55[28] = 2048;
      double v56 = v25 * (a4 - biasUncertaintyTimestamp);
      __int16 v57 = 2048;
      double v58 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "updated pressure uncertainty due to time: timestamp %f _biasTimestamp %f _biasUncertaintyTimestamp %f by %f unce rtainty now is %f",  buf,  0x34u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v40 = self->_biasTimestamp;
      double v41 = self->_biasUncertaintyTimestamp;
      double v42 = self->_pressureUncertainty;
      *(_DWORD *)v50 = 134219008;
      *(double *)&v50[4] = a4;
      *(_WORD *)&v50[12] = 2048;
      *(double *)&v50[14] = v40;
      *(_WORD *)&v50[22] = 2048;
      *(double *)&v50[24] = v41;
      *(_WORD *)&v50[32] = 2048;
      double v51 = v25 * (a4 - v41);
      __int16 v52 = 2048;
      double v53 = v42;
      LODWORD(v49) = 52;
      double v43 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "updated pressure uncertainty due to time: timestamp %f _biasTimestamp %f _biasUncertaintyTimestamp %f by %f uncertainty now is %f",  COERCE_DOUBLE(v50),  v49);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v43);
    }

    self->_double biasUncertaintyTimestamp = a4;
  }

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  if (self->_biasUncertaintyTimestamp == 1.79769313e308)
  {
    sub_1004908E0((uint64_t)buf, (void *)self->_dataBuffers + 6);
    if (!*((void *)&v71 + 1))
    {
      sub_10049108C(buf);
      return;
    }

    double v12 = *(double **)v11;
    double v13 = *(std::__shared_weak_count **)(v11 + 8);
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      self->_double biasUncertaintyTimestamp = *v12;
      self->_float biasPressure = v12[1] * 1000.0;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    else
    {
      self->_double biasUncertaintyTimestamp = *v12;
      self->_float biasPressure = v12[1] * 1000.0;
    }

    sub_10049108C(buf);
  }

  -[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]( self,  "updatePressureUncertaintyWithPressure:andTime:andLat:andLon:",  a3,  a4,  a5,  a6);
  float v17 = a3;
  double v18 = sub_100FAE194(v17, 0.0065, 288.15);
  double v19 = fabs(self->_pressureUncertainty);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  double v20 = v19 * v18;
  double v21 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    float v22 = a3;
    float v23 = sub_100FAE194(v22, 0.0065, 288.15);
    double v24 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218752;
    *(double *)v68 = v20;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v23;
    __int16 v69 = 2048;
    double v70 = v24;
    LOWORD(v71) = 2048;
    *(double *)((char *)&v71 + 2) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "term1 %f, dElevationdPresure(pmeas) %f std::abs(_pressureUncertainty) %f pmeas %f",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v42 = qword_1019346A8;
    float v43 = a3;
    float v44 = sub_100FAE194(v43, 0.0065, 288.15);
    double v45 = fabs(self->_pressureUncertainty);
    int v59 = 134218752;
    double v60 = v20;
    __int16 v61 = 2048;
    double v62 = v44;
    __int16 v63 = 2048;
    double v64 = v45;
    __int16 v65 = 2048;
    double v66 = a3;
    LODWORD(v58) = 42;
    __int16 v46 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v42,  2LL,  "term1 %f, dElevationdPresure(pmeas) %f std::abs(_pressureUncertainty) %f pmeas %f",  COERCE_DOUBLE(&v59),  v58);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v46);
  }

  float biasPressure = self->_biasPressure;
  double v26 = sub_100FAE134(biasPressure);
  double v27 = vabdd_f64(a3, self->_biasPressure);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  double v28 = v27 * v26;
  float v29 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    float v30 = self->_biasPressure;
    float v31 = sub_100FAE134(v30);
    double v32 = vabdd_f64(a3, self->_biasPressure);
    *(_DWORD *)buf = 134218496;
    *(double *)v68 = v28;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v31;
    __int16 v69 = 2048;
    double v70 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "term2 %f, slopeDiffDElevationDPressure(pbias) %f std::abs(pressure - _biasPressure) %f",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v47 = qword_1019346A8;
    float v48 = self->_biasPressure;
    float v49 = sub_100FAE134(v48);
    double v50 = vabdd_f64(a3, self->_biasPressure);
    int v59 = 134218496;
    double v60 = v28;
    __int16 v61 = 2048;
    double v62 = v49;
    __int16 v63 = 2048;
    double v64 = v50;
    LODWORD(v58) = 32;
    double v51 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v47,  2LL,  "term2 %f, slopeDiffDElevationDPressure(pbias) %f std::abs(pressure - _biasPressure) %f",  COERCE_DOUBLE(&v59),  v58);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v51);
  }

  float v33 = a3;
  double v34 = sub_100FAE134(v33);
  double v35 = fabs(self->_pressureUncertainty);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  double v36 = v35 * v34;
  BOOL v37 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    float v38 = sub_100FAE134(v17);
    double v39 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218496;
    *(double *)v68 = v36;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v38;
    __int16 v69 = 2048;
    double v70 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "term3 %f, slopeDiffDElevationDPressure(pmeas) %f std::abs(_pressureUncertainty %f",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v52 = qword_1019346A8;
    float v53 = sub_100FAE134(v17);
    double v54 = fabs(self->_pressureUncertainty);
    int v59 = 134218496;
    double v60 = v36;
    __int16 v61 = 2048;
    double v62 = v53;
    __int16 v63 = 2048;
    double v64 = v54;
    LODWORD(v58) = 32;
    v55 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v52,  2LL,  "term3 %f, slopeDiffDElevationDPressure(pmeas) %f std::abs(_pressureUncertainty %f",  COERCE_DOUBLE(&v59),  v58);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v55);
  }

  self->_double biasUncertainty = fabs(v36) + fabs(v28) + fabs(v20) + self->_biasUncertaintyAtRebase;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  double v40 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    double biasUncertainty = self->_biasUncertainty;
    *(_DWORD *)buf = 134217984;
    *(double *)v68 = biasUncertainty;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "total bias uncertainty %f", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    double v56 = self->_biasUncertainty;
    int v59 = 134217984;
    double v60 = v56;
    __int16 v57 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "total bias uncertainty %f",  COERCE_DOUBLE(&v59));
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]",  "%s\n",  v57);
  }

- (BOOL)updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  p_dataBuffers = &self->_dataBuffers;
  sub_1004908E0((uint64_t)&v202, (void *)self->_dataBuffers);
  sub_1004908E0((uint64_t)&v196, (void *)*p_dataBuffers + 6);
  v194 = 0LL;
  double v195 = 0.0;
  double v11 = 0.0;
  if (v204 == v203
    || (double v12 = (void *)(v203 + 8 * (v205 >> 8)),
        double v13 = (double **)(*v12 + 16LL * v205),
        uint64_t v14 = *(void *)(v203 + (((v206 + v205) >> 5) & 0x7FFFFFFFFFFFFF8LL)) + 16LL * (v206 + v205),
        v13 == (double **)v14))
  {
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    double v103 = 0.0;
    double v104 = 0.0;
    double v184 = 0.0;
    double v186 = 0.0;
  }

  else
  {
    v185 = 0LL;
    double v182 = 0.0;
    HIDWORD(v189) = 0;
    double v183 = 0.0;
    *(void *)&__int128 v10 = 134219264LL;
    __int128 v187 = v10;
    double v180 = 0.0;
    double v181 = 0.0;
    double v179 = 0.0;
    double v184 = 0.0;
    double v186 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      float v17 = *v13;
      double v18 = **v13;
      if (v18 >= a3 && v18 < a4)
      {
        double v20 = v13[1];
        v192 = (const char *)*v13;
        double v193 = *(double *)&v20;
        if (*(double *)&v20 != 0.0)
        {
          double v21 = (unint64_t *)(v20 + 1);
          do
            unint64_t v22 = __ldxr(v21);
          while (__stxr(v22 + 1, v21));
        }

        if (*((_DWORD *)v17 + 25) == 1) {
          HIDWORD(v189) += (*((unsigned __int16 *)v17 + 65) >> 1) & 1;
        }
        if (v198 == v197) {
          goto LABEL_34;
        }
        float v23 = &v197[8 * (v200 >> 8)];
        uint64_t v24 = *(void *)v23 + 16LL * v200;
        uint64_t v25 = *(void *)&v197[((v201 + v200) >> 5) & 0x7FFFFFFFFFFFFF8LL] + 16LL * (v201 + v200);
        if (v24 == v25) {
          goto LABEL_34;
        }
        double v26 = 1.79769313e308;
        do
        {
          double v27 = *(double **)v24;
          double v28 = vabdd_f64(**v13, **(double **)v24);
          if (v28 < v26 && v28 <= 5.0)
          {
            double v30 = *(double *)(v24 + 8);
            if (v30 != 0.0)
            {
              float v31 = (unint64_t *)(*(void *)&v30 + 8LL);
              do
                unint64_t v32 = __ldxr(v31);
              while (__stxr(v32 + 1, v31));
            }

            float v33 = *(std::__shared_weak_count **)&v195;
            v194 = (const char *)v27;
            double v195 = v30;
            if (v33)
            {
              p_shared_owners = (unint64_t *)&v33->__shared_owners_;
              do
                unint64_t v35 = __ldaxr(p_shared_owners);
              while (__stlxr(v35 - 1, p_shared_owners));
              if (!v35)
              {
                ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                std::__shared_weak_count::__release_weak(v33);
              }
            }

            double v26 = v28;
          }

          v24 += 16LL;
          if (v24 - *(void *)v23 == 4096)
          {
            uint64_t v36 = *((void *)v23 + 1);
            v23 += 8;
            uint64_t v24 = v36;
          }
        }

        while (v24 != v25);
        if (v26 == 1.79769313e308)
        {
LABEL_34:
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          BOOL v37 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
          {
            float v38 = *(const char **)*v13;
            uint64_t v39 = **(void **)(*(void *)&v197[(v200 >> 5) & 0x7FFFFFFFFFFFFF8LL] + 16LL * v200);
            uint64_t v40 = **(void **)(*(void *)&v197[((v200 + v201 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL]
                              + 16LL * (v200 + v201 - 1));
            *(_DWORD *)buf = v187;
            v226 = v38;
            __int16 v227 = 2048;
            *(void *)v228 = v39;
            *(_WORD *)&v228[8] = 2048;
            *(void *)&v228[10] = v40;
            *(_WORD *)&v228[18] = 2048;
            *(double *)&v228[20] = a3;
            *(_WORD *)&v228[28] = 2048;
            *(double *)&v228[30] = a4;
            *(_WORD *)&v228[38] = 2048;
            *(double *)&v228[40] = a5;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "pressure too far from reference data,locationTime,%f,firstPsTime,%f,lastPsTime,%f,startTime,%f,endTime,%f, nextTrackStartTime,%f",  buf,  0x3Eu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            v75 = *(const char **)*v13;
            uint64_t v76 = **(void **)(*(void *)&v197[(v200 >> 5) & 0x7FFFFFFFFFFFFF8LL] + 16LL * v200);
            uint64_t v77 = **(void **)(*(void *)&v197[((v200 + v201 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL]
                              + 16LL * (v200 + v201 - 1));
            int v207 = v187;
            v208 = v75;
            __int16 v209 = 2048;
            *(void *)v210 = v76;
            *(_WORD *)&v210[8] = 2048;
            *(void *)&v210[10] = v77;
            *(_WORD *)&v210[18] = 2048;
            *(double *)&v210[20] = a3;
            *(_WORD *)&v210[28] = 2048;
            *(double *)&v210[30] = a4;
            *(_WORD *)&v210[38] = 2048;
            *(double *)&v210[40] = a5;
            LODWORD(v178) = 62;
            v78 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "pressure too far from reference data,locationTime,%f,firstPsTime,%f,lastPsTime,%f,startTime, %f,endTime,%f,nextTrackStartTime,%f",  COERCE_DOUBLE(&v207),  v178,  v179,  v180,  v181,  v182);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime: andNextTrackStartTime:]",  "%s\n",  v78);
          }
        }

        else
        {
          double v45 = v194;
          float v46 = *((double *)v194 + 1) * 1000.0;
          float v47 = sub_100FADFE8(v46, 101320.0);
          *(double *)&v190 = -1.0;
          double v191 = 1.79769313e308;
          +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:]( &OBJC_CLASS___CLBarometerCalibrationBiasEstimator,  "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:",  &v192,  &v191,  &v190);
          if ((*((_DWORD *)v192 + 25) & 0x80000000) == 0 && **v13 < a5)
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            float v48 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
            {
              int v49 = *((_DWORD *)v192 + 25);
              uint64_t v50 = *(void *)*v13;
              uint64_t v51 = *(void *)v45;
              uint64_t v52 = *((void *)v192 + 4);
              uint64_t v54 = *((void *)v192 + 6);
              uint64_t v53 = *((void *)v192 + 7);
              *(_DWORD *)buf = 136319490;
              v226 = "type";
              __int16 v227 = 1024;
              *(_DWORD *)v228 = v49;
              *(_WORD *)&v228[4] = 2080;
              *(void *)&v228[6] = "locTime";
              *(_WORD *)&v228[14] = 2048;
              *(void *)&v228[16] = v50;
              *(_WORD *)&v228[24] = 2080;
              *(void *)&v228[26] = "pressureTime";
              *(_WORD *)&v228[34] = 2048;
              *(void *)&v228[36] = v51;
              *(_WORD *)&v228[44] = 2080;
              *(void *)&v228[46] = "locationAlt";
              *(_WORD *)&v228[54] = 2048;
              *(double *)&v228[56] = v191;
              *(_WORD *)&v228[64] = 2080;
              *(void *)&v228[66] = "pressureAlt";
              *(_WORD *)&v228[74] = 2048;
              *(double *)&v228[76] = v47;
              *(_WORD *)&v228[84] = 2080;
              *(void *)&v228[86] = "locVerticalUnc";
              *(_WORD *)&v228[94] = 2048;
              *(void *)&v228[96] = v190;
              *(_WORD *)&v228[104] = 2080;
              *(void *)&v228[106] = "locHorizontalUnc";
              *(_WORD *)&v228[114] = 2048;
              *(void *)&v228[116] = v52;
              __int16 v229 = 2080;
              v230 = "demAlt";
              __int16 v231 = 2048;
              *(void *)v232 = v54;
              *(_WORD *)&v232[8] = 2080;
              *(void *)&v232[10] = "demVerticalUnc";
              *(_WORD *)&v232[18] = 2048;
              *(void *)&v232[20] = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0xB2u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              int v79 = *((_DWORD *)v192 + 25);
              uint64_t v80 = *(void *)*v13;
              uint64_t v81 = *(void *)v45;
              uint64_t v82 = *((void *)v192 + 4);
              uint64_t v84 = *((void *)v192 + 6);
              uint64_t v83 = *((void *)v192 + 7);
              int v207 = 136319490;
              v208 = "type";
              __int16 v209 = 1024;
              *(_DWORD *)v210 = v79;
              *(_WORD *)&v210[4] = 2080;
              *(void *)&v210[6] = "locTime";
              *(_WORD *)&v210[14] = 2048;
              *(void *)&v210[16] = v80;
              *(_WORD *)&v210[24] = 2080;
              *(void *)&v210[26] = "pressureTime";
              *(_WORD *)&v210[34] = 2048;
              *(void *)&v210[36] = v81;
              *(_WORD *)&v210[44] = 2080;
              *(void *)&v210[46] = "locationAlt";
              *(_WORD *)&v210[54] = 2048;
              *(double *)&v210[56] = v191;
              *(_WORD *)&v210[64] = 2080;
              *(void *)&v210[66] = "pressureAlt";
              *(_WORD *)&v210[74] = 2048;
              *(double *)&v210[76] = v47;
              *(_WORD *)&v210[84] = 2080;
              *(void *)&v210[86] = "locVerticalUnc";
              *(_WORD *)&v210[94] = 2048;
              *(void *)&v210[96] = v190;
              *(_WORD *)&v210[104] = 2080;
              *(void *)&v210[106] = "locHorizontalUnc";
              *(_WORD *)&v210[114] = 2048;
              *(void *)&v210[116] = v82;
              __int16 v211 = 2080;
              v212 = "demAlt";
              __int16 v213 = 2048;
              *(void *)v214 = v84;
              *(_WORD *)&v214[8] = 2080;
              *(void *)&v214[10] = "demVerticalUnc";
              *(_WORD *)&v214[18] = 2048;
              *(void *)&v214[20] = v83;
              v85 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v207,  178,  *(const char **)&v179,  v180,  *(const char **)&v181,  v182,  *(const char **)&v183,  v184,  v185,  v186,  (const char *)v187,  *((double *)&v187 + 1),  v188,  v189,  v190,  v191,  v192,  v193);
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTim e:andNextTrackStartTime:]",  "%s\n",  v85);
            }

            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            v55 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v56 = *((void *)v192 + 1);
              uint64_t v57 = *((void *)v192 + 2);
              uint64_t v58 = *((void *)v192 + 8);
              uint64_t v59 = *((void *)v192 + 9);
              uint64_t v60 = *((void *)v192 + 10);
              uint64_t v61 = *((void *)v192 + 11);
              int v62 = *((_DWORD *)v192 + 24);
              int v63 = *((_DWORD *)v192 + 26);
              uint64_t v64 = *((void *)v192 + 3);
              double v65 = *((double *)v192 + 5);
              double v66 = *((double *)v192 + 14);
              uint64_t v67 = *((void *)v192 + 15);
              *(_DWORD *)buf = 136321026;
              v226 = "lat";
              __int16 v227 = 2048;
              *(void *)v228 = v56;
              *(_WORD *)&v228[8] = 2080;
              *(void *)&v228[10] = "lon";
              *(_WORD *)&v228[18] = 2048;
              *(void *)&v228[20] = v57;
              *(_WORD *)&v228[28] = 2080;
              *(void *)&v228[30] = "slope";
              *(_WORD *)&v228[38] = 2048;
              *(void *)&v228[40] = v58;
              *(_WORD *)&v228[48] = 2080;
              *(void *)&v228[50] = "maxAbsSlope";
              *(_WORD *)&v228[58] = 2048;
              *(void *)&v228[60] = v59;
              *(_WORD *)&v228[68] = 2080;
              *(void *)&v228[70] = "speed";
              *(_WORD *)&v228[78] = 2048;
              *(void *)&v228[80] = v60;
              *(_WORD *)&v228[88] = 2080;
              *(void *)&v228[90] = "speedAccuracy";
              *(_WORD *)&v228[98] = 2048;
              *(void *)&v228[100] = v61;
              *(_WORD *)&v228[108] = 2080;
              *(void *)&v228[110] = "environment";
              *(_WORD *)&v228[118] = 1024;
              *(_DWORD *)&v228[120] = v62;
              __int16 v229 = 2080;
              v230 = "matchQuality";
              __int16 v231 = 1024;
              *(_DWORD *)v232 = v63;
              *(_WORD *)&v232[4] = 2080;
              *(void *)&v232[6] = "altitude";
              *(_WORD *)&v232[14] = 2048;
              *(void *)&v232[16] = v64;
              *(_WORD *)&v232[24] = 2080;
              *(void *)&v232[26] = "verticalAccuracy";
              __int16 v233 = 2048;
              double v234 = v65;
              __int16 v235 = 2080;
              v236 = "rawAltitude";
              __int16 v237 = 2048;
              double v238 = v66;
              __int16 v239 = 2080;
              v240 = "rawVerticalAccuracy";
              __int16 v241 = 2048;
              uint64_t v242 = v67;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEBUG,  "unused location data,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0xEAu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              uint64_t v86 = *((void *)v192 + 1);
              uint64_t v87 = *((void *)v192 + 2);
              uint64_t v88 = *((void *)v192 + 8);
              uint64_t v89 = *((void *)v192 + 9);
              uint64_t v90 = *((void *)v192 + 10);
              uint64_t v91 = *((void *)v192 + 11);
              int v92 = *((_DWORD *)v192 + 24);
              int v93 = *((_DWORD *)v192 + 26);
              uint64_t v94 = *((void *)v192 + 3);
              double v95 = *((double *)v192 + 5);
              double v96 = *((double *)v192 + 14);
              uint64_t v97 = *((void *)v192 + 15);
              int v207 = 136321026;
              v208 = "lat";
              __int16 v209 = 2048;
              *(void *)v210 = v86;
              *(_WORD *)&v210[8] = 2080;
              *(void *)&v210[10] = "lon";
              *(_WORD *)&v210[18] = 2048;
              *(void *)&v210[20] = v87;
              *(_WORD *)&v210[28] = 2080;
              *(void *)&v210[30] = "slope";
              *(_WORD *)&v210[38] = 2048;
              *(void *)&v210[40] = v88;
              *(_WORD *)&v210[48] = 2080;
              *(void *)&v210[50] = "maxAbsSlope";
              *(_WORD *)&v210[58] = 2048;
              *(void *)&v210[60] = v89;
              *(_WORD *)&v210[68] = 2080;
              *(void *)&v210[70] = "speed";
              *(_WORD *)&v210[78] = 2048;
              *(void *)&v210[80] = v90;
              *(_WORD *)&v210[88] = 2080;
              *(void *)&v210[90] = "speedAccuracy";
              *(_WORD *)&v210[98] = 2048;
              *(void *)&v210[100] = v91;
              *(_WORD *)&v210[108] = 2080;
              *(void *)&v210[110] = "environment";
              *(_WORD *)&v210[118] = 1024;
              *(_DWORD *)&v210[120] = v92;
              __int16 v211 = 2080;
              v212 = "matchQuality";
              __int16 v213 = 1024;
              *(_DWORD *)v214 = v93;
              *(_WORD *)&v214[4] = 2080;
              *(void *)&v214[6] = "altitude";
              *(_WORD *)&v214[14] = 2048;
              *(void *)&v214[16] = v94;
              *(_WORD *)&v214[24] = 2080;
              *(void *)&v214[26] = "verticalAccuracy";
              __int16 v215 = 2048;
              double v216 = v95;
              __int16 v217 = 2080;
              v218 = "rawAltitude";
              __int16 v219 = 2048;
              double v220 = v96;
              __int16 v221 = 2080;
              v222 = "rawVerticalAccuracy";
              __int16 v223 = 2048;
              uint64_t v224 = v97;
              LODWORD(v178) = 234;
              v98 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "unused location data,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v207,  v178,  *(const char **)&v179,  v180,  *(const char **)&v181,  v182,  *(const char **)&v183,  v184,  v185,  v186,  (const char *)v187,  *((double *)&v187 + 1),  v188,  LODWORD(v189),  v190,  LODWORD(v191),  v192,  v193,  v194,  v195,  v196,  *(double *)&v197,  v198,  v199);
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTim e:andNextTrackStartTime:]",  "%s\n",  v98);
            }
          }

          double v68 = *((double *)v192 + 1);
          if (v68 != 1.79769313e308)
          {
            double v69 = *((double *)v192 + 2);
            BOOL v70 = v69 == 1.79769313e308;
            double v71 = v15 + v68;
            double v72 = v16 + v69;
            if (!v70)
            {
              double v16 = v72;
              double v15 = v71;
            }

            v73 = v185;
            if (!v70) {
              v73 = v185 + 1;
            }
            v185 = v73;
          }

          if (*((_DWORD *)v192 + 25) == 1)
          {
            double v74 = *((double *)v192 + 7);
            if (v74 > 0.0)
            {
              ++HIDWORD(v182);
              double v180 = v180 + v74;
              double v181 = v181 + *((double *)v192 + 6);
              double v179 = v179 + v191;
              double v183 = v183 + v47;
              double v184 = v184 + *(double *)&v190;
              double v186 = v186 + *((double *)v194 + 1) * 1000.0;
              LODWORD(v182) += *((_WORD *)v192 + 65) & 1;
            }
          }
        }

        double v41 = *(std::__shared_weak_count **)&v193;
        if (v193 != 0.0)
        {
          uint64_t v42 = (unint64_t *)(*(void *)&v193 + 8LL);
          do
            unint64_t v43 = __ldaxr(v42);
          while (__stlxr(v43 - 1, v42));
          if (!v43)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
      }

      v13 += 2;
      if ((double **)((char *)v13 - *v12) == (double **)4096)
      {
        float v44 = (double **)v12[1];
        ++v12;
        double v13 = v44;
      }
    }

    while (v13 != (double **)v14);
    if (v185)
    {
      -[CLMeanSeaLevelPressureEstimator setCurrentLatitude:]( self->_meanSeaLevelPressureEstimator,  "setCurrentLatitude:",  v15 / (double)(unint64_t)v185);
      double v11 = v183;
      int v100 = LODWORD(v182);
      int v99 = HIDWORD(v182);
      double v103 = v180;
      double v102 = v181;
      double v104 = v179;
      int v101 = HIDWORD(v189);
      -[CLMeanSeaLevelPressureEstimator setCurrentLongitude:]( self->_meanSeaLevelPressureEstimator,  "setCurrentLongitude:",  v16 / (double)(unint64_t)v185);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      v105 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureEstimator currentLatitude](self->_meanSeaLevelPressureEstimator, "currentLatitude");
        v107 = v106;
        -[CLMeanSeaLevelPressureEstimator currentLongitude](self->_meanSeaLevelPressureEstimator, "currentLongitude");
        *(_DWORD *)buf = 134218240;
        v226 = v107;
        __int16 v227 = 2048;
        *(void *)v228 = v108;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "update mean sea level pressure location,lat,%f,lon,%f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        uint64_t v173 = qword_1019346A8;
        -[CLMeanSeaLevelPressureEstimator currentLatitude](self->_meanSeaLevelPressureEstimator, "currentLatitude");
        v175 = v174;
        -[CLMeanSeaLevelPressureEstimator currentLongitude](self->_meanSeaLevelPressureEstimator, "currentLongitude");
        int v207 = 134218240;
        v208 = v175;
        __int16 v209 = 2048;
        *(void *)v210 = v176;
        LODWORD(v178) = 22;
        v177 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v173,  0LL,  "update mean sea level pressure location,lat,%f,lon,%f",  COERCE_DOUBLE(&v207),  v178);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andN extTrackStartTime:]",  "%s\n",  v177);
        double v11 = v183;
        int v100 = LODWORD(v182);
        int v99 = HIDWORD(v182);
        double v103 = v180;
        double v102 = v181;
        double v104 = v179;
        int v101 = HIDWORD(v189);
      }

      -[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]( self->_meanSeaLevelPressureEstimator,  "refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:",  a4 + -10800.0,  a4);
    }

    else
    {
      double v11 = v183;
      int v100 = LODWORD(v182);
      int v99 = HIDWORD(v182);
      double v103 = v180;
      double v102 = v181;
      double v104 = v179;
      int v101 = HIDWORD(v189);
    }
  }

  self->_BOOL inOutdoorWorkoutStatus = v101 > 119;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  v109 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inOutdoorWorkoutStatus = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136316930;
    v226 = "inOutdoorWorkoutPoint";
    __int16 v227 = 1024;
    *(_DWORD *)v228 = v101;
    *(_WORD *)&v228[4] = 2080;
    *(void *)&v228[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v228[14] = 1024;
    *(_DWORD *)&v228[16] = inOutdoorWorkoutStatus;
    *(_WORD *)&v228[20] = 2080;
    *(void *)&v228[22] = "trackStartTime";
    *(_WORD *)&v228[30] = 2048;
    *(double *)&v228[32] = a3;
    *(_WORD *)&v228[40] = 2080;
    *(void *)&v228[42] = "trackEndTime";
    *(_WORD *)&v228[50] = 2048;
    *(double *)&v228[52] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "in outdoor workout info,%s,%u,%s,%d,%s,%f,%s,%f",  buf,  0x4Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    BOOL v157 = self->_inOutdoorWorkoutStatus;
    int v207 = 136316930;
    v208 = "inOutdoorWorkoutPoint";
    __int16 v209 = 1024;
    *(_DWORD *)v210 = v101;
    *(_WORD *)&v210[4] = 2080;
    *(void *)&v210[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v210[14] = 1024;
    *(_DWORD *)&v210[16] = v157;
    *(_WORD *)&v210[20] = 2080;
    *(void *)&v210[22] = "trackStartTime";
    *(_WORD *)&v210[30] = 2048;
    *(double *)&v210[32] = a3;
    *(_WORD *)&v210[40] = 2080;
    *(void *)&v210[42] = "trackEndTime";
    *(_WORD *)&v210[50] = 2048;
    *(double *)&v210[52] = a4;
    v158 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "in outdoor workout info,%s,%u,%s,%d,%s,%f,%s,%f",  (const char *)&v207,  74,  *(const char **)&v179,  LODWORD(v180),  *(const char **)&v181,  v182,  *(const char **)&v183,  v184);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v158);
  }

  if (!v99) {
    goto LABEL_109;
  }
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  v111 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v226 = "GPSBasedDEMPoints";
    __int16 v227 = 1024;
    *(_DWORD *)v228 = v99;
    *(_WORD *)&v228[4] = 2080;
    *(void *)&v228[6] = "underDEMPoints";
    *(_WORD *)&v228[14] = 1024;
    *(_DWORD *)&v228[16] = v100;
    _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "under Dem or latched high data points check,%s,%d,%s,%d",  buf,  0x22u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    int v207 = 136315906;
    v208 = "GPSBasedDEMPoints";
    __int16 v209 = 1024;
    *(_DWORD *)v210 = v99;
    *(_WORD *)&v210[4] = 2080;
    *(void *)&v210[6] = "underDEMPoints";
    *(_WORD *)&v210[14] = 1024;
    *(_DWORD *)&v210[16] = v100;
    v159 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "under Dem or latched high data points check,%s,%d,%s,%d",  (const char *)&v207,  34,  *(const char **)&v179,  LODWORD(v180));
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v159);
  }

  v112 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
  -[CLMeanSeaLevelPressureData setTimestamp:](v112, "setTimestamp:", a4);
  if (v99 != v100)
  {
    double v113 = v11 / (double)v99;
    double v126 = v102 / (double)v99;
    double v127 = v104 / (double)v99;
    double v128 = v184 / (double)v99;
    double v129 = v113 + self->_bias - self->_weatherEstimateInMeter;
    if (v129 > v126 + 100.0 && v129 > v128 + v127)
    {
      self->_double biasUncertaintyAtRebase = v128;
      double v132 = v186 / (double)v99;
      self->_double bias = v127 - v113;
      self->_float biasPressure = v132;
      float v133 = v127;
      float v134 = v132;
      float v135 = sub_100FAE05C(v133, v134);
      self->_estimatedAbsoluteAltitudeUncertainty = v128;
      self->_estimatedMeanSeaLevelPressure = v135;
      float biasPressure = self->_biasPressure;
      float v137 = v127;
      -[CLMeanSeaLevelPressureData setUncertainty:](v112, "setUncertainty:", v128 * sub_100FAE0E8(v137, biasPressure));
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:]( v112,  "setMeanSeaLevelPressure:",  self->_estimatedMeanSeaLevelPressure);
      double v124 = v129 - v127;
      uint64_t v125 = 4294967293LL;
      goto LABEL_110;
    }

LABEL_109:
    BOOL v131 = 0;
    goto LABEL_121;
  }

  double v113 = v11 / (double)v100;
  double v114 = v102 / (double)v100;
  double v115 = v103 / (double)v100;
  double bias = self->_bias;
  double weatherEstimateInMeter = self->_weatherEstimateInMeter;
  self->_double biasUncertaintyAtRebase = v115;
  double v118 = v186 / (double)v100;
  self->_double bias = v114 - v113;
  self->_float biasPressure = v118;
  float v119 = v114;
  float v120 = v118;
  float v121 = sub_100FAE05C(v119, v120);
  self->_estimatedAbsoluteAltitudeUncertainty = v115;
  self->_estimatedMeanSeaLevelPressure = v121;
  float v122 = self->_biasPressure;
  float v123 = v114;
  -[CLMeanSeaLevelPressureData setUncertainty:](v112, "setUncertainty:", v115 * sub_100FAE0E8(v123, v122));
  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:]( v112,  "setMeanSeaLevelPressure:",  self->_estimatedMeanSeaLevelPressure);
  double v124 = v113 + bias - weatherEstimateInMeter - v114;
  uint64_t v125 = 4294967294LL;
LABEL_110:
  self->_forceCalibrate = 1;
  -[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:](self, "updateHistoricalMslpArray:", v112);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  v138 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v112, "meanSeaLevelPressure");
    uint64_t v140 = v139;
    -[CLMeanSeaLevelPressureData uncertainty](v112, "uncertainty");
    uint64_t v142 = v141;
    -[CLMeanSeaLevelPressureData timestamp](v112, "timestamp");
    *(_DWORD *)buf = 136317954;
    v226 = "type";
    __int16 v227 = 1024;
    *(_DWORD *)v228 = v125;
    *(_WORD *)&v228[4] = 2080;
    *(void *)&v228[6] = "meanSeaLevelPressure";
    *(_WORD *)&v228[14] = 2048;
    *(void *)&v228[16] = v140;
    *(_WORD *)&v228[24] = 2080;
    *(void *)&v228[26] = "uncertainty";
    *(_WORD *)&v228[34] = 2048;
    *(void *)&v228[36] = v142;
    *(_WORD *)&v228[44] = 2080;
    *(void *)&v228[46] = "timestamp";
    *(_WORD *)&v228[54] = 2048;
    *(void *)&v228[56] = v143;
    *(_WORD *)&v228[64] = 2080;
    *(void *)&v228[66] = "startAt";
    *(_WORD *)&v228[74] = 2048;
    *(double *)&v228[76] = a3;
    *(_WORD *)&v228[84] = 2080;
    *(void *)&v228[86] = "endAt";
    *(_WORD *)&v228[94] = 2048;
    *(double *)&v228[96] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v138,  OS_LOG_TYPE_DEFAULT,  "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x76u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v160 = qword_1019346A8;
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v112, "meanSeaLevelPressure");
    uint64_t v162 = v161;
    -[CLMeanSeaLevelPressureData uncertainty](v112, "uncertainty");
    uint64_t v164 = v163;
    -[CLMeanSeaLevelPressureData timestamp](v112, "timestamp");
    int v207 = 136317954;
    v208 = "type";
    __int16 v209 = 1024;
    *(_DWORD *)v210 = v125;
    *(_WORD *)&v210[4] = 2080;
    *(void *)&v210[6] = "meanSeaLevelPressure";
    *(_WORD *)&v210[14] = 2048;
    *(void *)&v210[16] = v162;
    *(_WORD *)&v210[24] = 2080;
    *(void *)&v210[26] = "uncertainty";
    *(_WORD *)&v210[34] = 2048;
    *(void *)&v210[36] = v164;
    *(_WORD *)&v210[44] = 2080;
    *(void *)&v210[46] = "timestamp";
    *(_WORD *)&v210[54] = 2048;
    *(void *)&v210[56] = v165;
    *(_WORD *)&v210[64] = 2080;
    *(void *)&v210[66] = "startAt";
    *(_WORD *)&v210[74] = 2048;
    *(double *)&v210[76] = a3;
    *(_WORD *)&v210[84] = 2080;
    *(void *)&v210[86] = "endAt";
    *(_WORD *)&v210[94] = 2048;
    *(double *)&v210[96] = a4;
    v166 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v160,  0LL,  "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v207,  118,  *(const char **)&v179,  v180,  *(const char **)&v181,  v182,  *(const char **)&v183,  v184,  v185,  v186,  (const char *)v187,  *((double *)&v187 + 1));
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v166);
  }

  self->_double biasTimestamp = a4;
  self->_double pressureUncertainty = 0.0;
  self->_double distanceTraveled = 0.0;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  sub_1005FD5A0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]( self,  "rebaseSignificantElevationWithEndTime:",  a4);
  -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]( self,  "updateBiasUncertaintyWithAbsSigElevation:withCompanion:",  0LL,  sub_1005FD1F8((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v144, v145, v146));
  -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:]( self,  "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource: andCorrection:andDistance:",  1LL,  self->_inOutdoorWorkoutStatus,  v125,  v124,  self->_biasUncertainty,  self->_biasUncertaintyAtRebase,  v124,  self->_distanceSinceLastRebase);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  v147 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    double v148 = self->_bias;
    double biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
    double biasUncertainty = self->_biasUncertainty;
    double v151 = self->_weatherEstimateInMeter;
    BOOL v152 = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136320514;
    v226 = "type";
    __int16 v227 = 1024;
    *(_DWORD *)v228 = v125;
    *(_WORD *)&v228[4] = 2080;
    *(void *)&v228[6] = "newBias";
    *(_WORD *)&v228[14] = 2048;
    *(double *)&v228[16] = v148;
    *(_WORD *)&v228[24] = 2080;
    *(void *)&v228[26] = "newBiasUncertainty";
    *(_WORD *)&v228[34] = 2048;
    *(double *)&v228[36] = biasUncertaintyAtRebase;
    *(_WORD *)&v228[44] = 2080;
    *(void *)&v228[46] = "oldBaroAltitude";
    *(_WORD *)&v228[54] = 2048;
    *(double *)&v228[56] = v113;
    *(_WORD *)&v228[64] = 2080;
    *(void *)&v228[66] = "oldRefAltitude";
    *(_WORD *)&v228[74] = 2048;
    *(double *)&v228[76] = v113 + v148;
    *(_WORD *)&v228[84] = 2080;
    *(void *)&v228[86] = "oldBaroUncertainty";
    *(_WORD *)&v228[94] = 2048;
    *(double *)&v228[96] = biasUncertainty;
    *(_WORD *)&v228[104] = 2080;
    *(void *)&v228[106] = "oldRefUncertainty";
    *(_WORD *)&v228[114] = 2048;
    *(double *)&v228[116] = biasUncertaintyAtRebase;
    __int16 v229 = 2080;
    v230 = "weatherEstimateInMeter";
    __int16 v231 = 2048;
    *(double *)v232 = v151;
    *(_WORD *)&v232[8] = 2080;
    *(void *)&v232[10] = "inOutdoorWorkout";
    *(_WORD *)&v232[18] = 1024;
    *(_DWORD *)&v232[20] = v152;
    *(_WORD *)&v232[24] = 2080;
    *(void *)&v232[26] = "calculatedFromTrackStartAt";
    __int16 v233 = 2048;
    double v234 = a3;
    __int16 v235 = 2080;
    v236 = "endAt";
    __int16 v237 = 2048;
    double v238 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_DEFAULT,  "pressure height rebase to,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%f,%s,%f",  buf,  0xD6u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    double v167 = self->_bias;
    double v168 = self->_biasUncertaintyAtRebase;
    double v169 = self->_biasUncertainty;
    double v170 = self->_weatherEstimateInMeter;
    BOOL v171 = self->_inOutdoorWorkoutStatus;
    int v207 = 136320514;
    v208 = "type";
    __int16 v209 = 1024;
    *(_DWORD *)v210 = v125;
    *(_WORD *)&v210[4] = 2080;
    *(void *)&v210[6] = "newBias";
    *(_WORD *)&v210[14] = 2048;
    *(double *)&v210[16] = v167;
    *(_WORD *)&v210[24] = 2080;
    *(void *)&v210[26] = "newBiasUncertainty";
    *(_WORD *)&v210[34] = 2048;
    *(double *)&v210[36] = v168;
    *(_WORD *)&v210[44] = 2080;
    *(void *)&v210[46] = "oldBaroAltitude";
    *(_WORD *)&v210[54] = 2048;
    *(double *)&v210[56] = v113;
    *(_WORD *)&v210[64] = 2080;
    *(void *)&v210[66] = "oldRefAltitude";
    *(_WORD *)&v210[74] = 2048;
    *(double *)&v210[76] = v113 + v167;
    *(_WORD *)&v210[84] = 2080;
    *(void *)&v210[86] = "oldBaroUncertainty";
    *(_WORD *)&v210[94] = 2048;
    *(double *)&v210[96] = v169;
    *(_WORD *)&v210[104] = 2080;
    *(void *)&v210[106] = "oldRefUncertainty";
    *(_WORD *)&v210[114] = 2048;
    *(double *)&v210[116] = v168;
    __int16 v211 = 2080;
    v212 = "weatherEstimateInMeter";
    __int16 v213 = 2048;
    *(double *)v214 = v170;
    *(_WORD *)&v214[8] = 2080;
    *(void *)&v214[10] = "inOutdoorWorkout";
    *(_WORD *)&v214[18] = 1024;
    *(_DWORD *)&v214[20] = v171;
    *(_WORD *)&v214[24] = 2080;
    *(void *)&v214[26] = "calculatedFromTrackStartAt";
    __int16 v215 = 2048;
    double v216 = a3;
    __int16 v217 = 2080;
    v218 = "endAt";
    __int16 v219 = 2048;
    double v220 = a4;
    v172 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "pressure height rebase to,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%f,%s,%f",  (const char *)&v207,  214,  *(const char **)&v179,  v180,  *(const char **)&v181,  v182,  *(const char **)&v183,  v184,  v185,  v186,  (const char *)v187,  *((double *)&v187 + 1),  v188,  v189,  v190,  v191,  v192,  LODWORD(v193),  v194,  v195,  v196,  *(double *)&v197);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v172);
  }

  self->_forceCalibrate = 0;
  BOOL v131 = 1;
LABEL_121:
  v153 = *(std::__shared_weak_count **)&v195;
  if (v195 != 0.0)
  {
    v154 = (unint64_t *)(*(void *)&v195 + 8LL);
    do
      unint64_t v155 = __ldaxr(v154);
    while (__stlxr(v155 - 1, v154));
    if (!v155)
    {
      ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
      std::__shared_weak_count::__release_weak(v153);
    }
  }

  sub_10049108C(&v196);
  sub_10049108C(&v202);
  return v131;
}

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  double v5 = a4;
  double v6 = a3;
  if (a4 - a3 <= 1800.0)
  {
    p_dataBuffers = &self->_dataBuffers;
    sub_1004908E0((uint64_t)&v346, (void *)self->_dataBuffers);
    sub_1004908E0((uint64_t)&v341, (void *)*p_dataBuffers + 6);
    sub_1004908E0((uint64_t)&v336, (void *)self->_dataBuffers + 24);
    if (!-[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v335))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      uint64_t v84 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v372 = v6;
        *(_WORD *)&v372[8] = 2048;
        *(double *)&v372[10] = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "filtered pressure queue is empty,startTime,%f,endTime,%f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        int v351 = 134218240;
        *(double *)v352 = v6;
        *(_WORD *)&v352[8] = 2048;
        *(double *)&v352[10] = v5;
        LODWORD(v303) = 22;
        v85 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "filtered pressure queue is empty,startTime,%f,endTime,%f",  COERCE_DOUBLE(&v351),  v303);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v85);
      }

      goto LABEL_260;
    }

    -[CLMeanSeaLevelPressureEstimator setNumberOfTrackEndedBtwRefresh:]( self->_meanSeaLevelPressureEstimator,  "setNumberOfTrackEndedBtwRefresh:",  -[CLMeanSeaLevelPressureEstimator numberOfTrackEndedBtwRefresh]( self->_meanSeaLevelPressureEstimator,  "numberOfTrackEndedBtwRefresh")
    + 1);
    if (-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]( self,  "updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:",  v6,  v5,  a5))
    {
LABEL_260:
      sub_10049108C(&v336);
      sub_10049108C(&v341);
      sub_10049108C(&v346);
      return;
    }

    __p = 0LL;
    v333 = 0LL;
    v334 = 0LL;
    v330 = 0LL;
    v331 = 0LL;
    *(double *)&v308 = v6;
    double v309 = v5;
    if (v338 != v337)
    {
      double v13 = (void *)(v337 + 8 * (v339 >> 8));
      uint64_t v14 = *v13 + 16LL * v339;
      uint64_t v15 = *(void *)(v337 + (((v340 + v339) >> 5) & 0x7FFFFFFFFFFFFF8LL)) + 16LL * (v340 + v339);
      if (v14 != v15)
      {
        int v317 = 0;
        double v16 = 0.0;
        p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
        *(void *)&__int128 v12 = 134218240LL;
        __int128 v312 = v12;
        double v311 = 1000.0;
        HIDWORD(v307) = 1204151936;
        *(void *)&__int128 v12 = 134219008LL;
        __int128 v305 = v12;
        *(void *)&__int128 v12 = 136319490LL;
        __int128 v304 = v12;
        double v18 = 0.0;
        double v314 = 0.0;
        double v315 = 0.0;
        double v19 = 0.0;
        do
        {
          double v20 = *(double **)v14;
          double v21 = **(double **)v14;
          if (v21 >= v6 && v21 < v5)
          {
            float v23 = *(std::__shared_weak_count **)(v14 + 8);
            v327 = *(double **)v14;
            v328 = v23;
            if (v23)
            {
              p_int shared_owners = (unint64_t *)&v23->__shared_owners_;
              do
                unint64_t v25 = __ldxr(p_shared_owners);
              while (__stxr(v25 + 1, p_shared_owners));
            }

            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            double v26 = (os_log_s *)p_vtable[213];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v28 = *(void *)v20;
              uint64_t v27 = *((void *)v20 + 1);
              *(_DWORD *)buf = v312;
              *(void *)v372 = v27;
              *(_WORD *)&v372[8] = 2048;
              *(void *)&v372[10] = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "companion data found,altitude,%f,timestamp,%f",  buf,  0x16u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              uint64_t v67 = p_vtable[213];
              uint64_t v69 = *(void *)v20;
              uint64_t v68 = *((void *)v20 + 1);
              int v351 = v312;
              *(void *)v352 = v68;
              *(_WORD *)&v352[8] = 2048;
              *(void *)&v352[10] = v69;
              LODWORD(v303) = 22;
              BOOL v70 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v67,  2LL,  "companion data found,altitude,%f,timestamp,%f",  COERCE_DOUBLE(&v351),  v303);
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v70);
            }

            float v29 = p_vtable;
            if (v343 == v342) {
              goto LABEL_60;
            }
            double v30 = (void *)(v342 + 8 * (v344 >> 8));
            uint64_t v31 = *v30 + 16LL * v344;
            uint64_t v32 = *(void *)(v342 + (((v345 + v344) >> 5) & 0x7FFFFFFFFFFFFF8LL))
                + 16LL * (v345 + v344);
            if (v31 == v32) {
              goto LABEL_60;
            }
            double v33 = 1.79769313e308;
            do
            {
              double v34 = *(double **)v31;
              double v35 = vabdd_f64(*v327, **(double **)v31);
              if (v35 < v33 && v35 <= 5.0)
              {
                BOOL v37 = *(std::__shared_weak_count **)(v31 + 8);
                if (v37)
                {
                  float v38 = (unint64_t *)&v37->__shared_owners_;
                  do
                    unint64_t v39 = __ldxr(v38);
                  while (__stxr(v39 + 1, v38));
                }

                uint64_t v40 = v331;
                v330 = v34;
                v331 = v37;
                if (v40)
                {
                  double v41 = (unint64_t *)&v40->__shared_owners_;
                  do
                    unint64_t v42 = __ldaxr(v41);
                  while (__stlxr(v42 - 1, v41));
                  if (!v42)
                  {
                    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                    std::__shared_weak_count::__release_weak(v40);
                  }
                }

                double v33 = v35;
              }

              v31 += 16LL;
              if (v31 - *v30 == 4096)
              {
                uint64_t v43 = v30[1];
                ++v30;
                uint64_t v31 = v43;
              }
            }

            while (v31 != v32);
            if (v33 == 1.79769313e308)
            {
LABEL_60:
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              p_vtable = v29;
              int v63 = (os_log_s *)v29[213];
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "pressure too far from companion data",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_10183BC80);
                }
                double v71 = v29[213];
                LOWORD(v351) = 0;
                LODWORD(v303) = 2;
                double v72 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v71,  0LL,  "pressure too far from companion data",  &v351,  *(void *)&v303);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v72);
              }
            }

            else
            {
              double v44 = v16;
              double v45 = v18;
              double v46 = v327[1];
              double v47 = v330[1];
              float v48 = v47 * v311;
              float v49 = sub_100FADFE8(v48, *((float *)&v307 + 1));
              double v50 = v327[1];
              p_vtable = v29;
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              *(double *)&v310 = v19;
              double v51 = v49;
              double v52 = v50 - v51;
              uint64_t v53 = (os_log_s *)v29[213];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                double v54 = *v327;
                uint64_t v55 = *((void *)v327 + 1);
                uint64_t v56 = *(void *)v330;
                *(_DWORD *)buf = v305;
                *(double *)v372 = v52;
                *(_WORD *)&v372[8] = 2048;
                *(double *)&v372[10] = v54;
                *(_WORD *)&v372[18] = 2048;
                *(void *)&v372[20] = v55;
                *(_WORD *)&v372[28] = 2048;
                *(void *)&v372[30] = v56;
                *(_WORD *)&v372[38] = 2048;
                *(double *)&v372[40] = v51;
                _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "individual bias calculated: %f, companion timestamp %f,  companion altitude %f, pressure timestamp %f, pressure altitude %f",  buf,  0x34u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_10183BC80);
                }
                v73 = v29[213];
                double v74 = *v327;
                uint64_t v75 = *((void *)v327 + 1);
                uint64_t v76 = *(void *)v330;
                int v351 = v305;
                *(double *)v352 = v52;
                *(_WORD *)&v352[8] = 2048;
                *(double *)&v352[10] = v74;
                *(_WORD *)&v352[18] = 2048;
                *(void *)&v352[20] = v75;
                *(_WORD *)&v352[28] = 2048;
                *(void *)&v352[30] = v76;
                *(_WORD *)&v352[38] = 2048;
                *(double *)&v352[40] = v51;
                LODWORD(v303) = 52;
                uint64_t v77 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v73,  2LL,  "individual bias calculated: %f, companion timestamp %f,  companion altitude %f, pressure timestamp %f, pressure altitude %f",  COERCE_DOUBLE(&v351),  v303,  *(double *)&v304,  *((double *)&v304 + 1),  *(double *)&v305);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v77);
                p_vtable = v29;
              }

              double v57 = v327[2];
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              uint64_t v58 = (os_log_s *)p_vtable[213];
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v59 = *(void *)v330;
                double v60 = *v327;
                double v61 = v327[1];
                double v62 = v327[2];
                *(_DWORD *)buf = v304;
                *(void *)v372 = "type";
                *(_WORD *)&v372[8] = 1024;
                *(_DWORD *)&v372[10] = -1;
                *(_WORD *)&v372[14] = 2080;
                *(void *)&v372[16] = "locTime";
                *(_WORD *)&v372[24] = 2048;
                *(double *)&v372[26] = v60;
                *(_WORD *)&v372[34] = 2080;
                *(void *)&v372[36] = "pressureTime";
                *(_WORD *)&v372[44] = 2048;
                *(void *)&v372[46] = v59;
                *(_WORD *)&v372[54] = 2080;
                *(void *)&v372[56] = "locationAlt";
                __int16 v373 = 2048;
                double v374 = v61;
                __int16 v375 = 2080;
                *(void *)v376 = "pressureAlt";
                *(_WORD *)&v376[8] = 2048;
                *(double *)&v376[10] = v51;
                *(_WORD *)&v376[18] = 2080;
                *(void *)&v376[20] = "locVerticalUnc";
                __int16 v377 = 2048;
                double v378 = v62;
                __int16 v379 = 2080;
                v380 = "locHorizontalUnc";
                __int16 v381 = 2048;
                uint64_t v382 = 0LL;
                __int16 v383 = 2080;
                v384 = "demAlt";
                __int16 v385 = 2048;
                uint64_t v386 = 0LL;
                __int16 v387 = 2080;
                v388 = "demVerticalUnc";
                __int16 v389 = 2048;
                uint64_t v390 = 0LL;
                _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0xB2u);
              }

              ++v317;
              double v314 = v314 + v47 * v311;
              double v315 = v315 + v46;
              double v18 = v45 + v51;
              double v16 = v44 + v52;
              double v19 = *(double *)&v310 + v57;
              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_10183BC80);
                }
                v78 = v29[213];
                uint64_t v79 = *(void *)v330;
                double v80 = *v327;
                double v81 = v327[1];
                double v82 = v327[2];
                int v351 = v304;
                *(void *)v352 = "type";
                *(_WORD *)&v352[8] = 1024;
                *(_DWORD *)&v352[10] = -1;
                *(_WORD *)&v352[14] = 2080;
                *(void *)&v352[16] = "locTime";
                *(_WORD *)&v352[24] = 2048;
                *(double *)&v352[26] = v80;
                *(_WORD *)&v352[34] = 2080;
                *(void *)&v352[36] = "pressureTime";
                *(_WORD *)&v352[44] = 2048;
                *(void *)&v352[46] = v79;
                *(_WORD *)&v352[54] = 2080;
                *(void *)&v352[56] = "locationAlt";
                __int16 v353 = 2048;
                double v354 = v81;
                __int16 v355 = 2080;
                *(void *)v356 = "pressureAlt";
                *(_WORD *)&v356[8] = 2048;
                *(double *)&v356[10] = v51;
                *(_WORD *)&v356[18] = 2080;
                *(void *)&v356[20] = "locVerticalUnc";
                __int16 v357 = 2048;
                double v358 = v82;
                __int16 v359 = 2080;
                v360 = "locHorizontalUnc";
                __int16 v361 = 2048;
                uint64_t v362 = 0LL;
                __int16 v363 = 2080;
                v364 = "demAlt";
                __int16 v365 = 2048;
                uint64_t v366 = 0LL;
                __int16 v367 = 2080;
                v368 = "demVerticalUnc";
                __int16 v369 = 2048;
                uint64_t v370 = 0LL;
                uint64_t v83 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v78,  0LL,  "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v351,  178,  (const char *)v304,  *((double *)&v304 + 1),  (const char *)v305,  *((double *)&v305 + 1),  v306,  v307,  v308,  v309,  v310,  v311,  (const char *)v312,  *((double *)&v312 + 1),  v313,  v314,  *(const char **)&v315,  v316);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v83);
                p_vtable = v29;
              }

              double v6 = *(double *)&v308;
              double v5 = v309;
            }

            if (v328)
            {
              uint64_t v64 = (unint64_t *)&v328->__shared_owners_;
              do
                unint64_t v65 = __ldaxr(v64);
              while (__stlxr(v65 - 1, v64));
              if (!v65)
              {
                ((void (*)(std::__shared_weak_count *))v328->__on_zero_shared)(v328);
                std::__shared_weak_count::__release_weak(v328);
              }
            }
          }

          v14 += 16LL;
          if (v14 - *v13 == 4096)
          {
            uint64_t v66 = v13[1];
            ++v13;
            uint64_t v14 = v66;
          }
        }

        while (v14 != v15);
        if (v317)
        {
          uint64_t v86 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
          double v87 = (double)v317;
          self->_double biasTimestamp = v5;
          double v88 = v314 / (double)v317;
          self->_double bias = v16 / (double)v317;
          self->_float biasPressure = v88;
          self->_double biasUncertaintyAtRebase = v19 / (double)v317;
          double v89 = v315 / (double)v317;
          float v90 = v89;
          *(float *)&double v88 = v88;
          float v91 = sub_100FAE05C(v90, *(float *)&v88);
          self->_double estimatedAbsoluteAltitudeUncertainty = self->_biasUncertaintyAtRebase;
          self->_estimatedMeanSeaLevelPressure = v91;
          float biasPressure = self->_biasPressure;
          float v93 = v89;
          -[CLMeanSeaLevelPressureData setUncertainty:]( v86,  "setUncertainty:",  self->_biasUncertaintyAtRebase * sub_100FAE0E8(v93, biasPressure));
          -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:]( v86,  "setMeanSeaLevelPressure:",  self->_estimatedMeanSeaLevelPressure);
          -[CLMeanSeaLevelPressureData setTimestamp:](v86, "setTimestamp:", v5);
          self->_companionRebase = 1;
          -[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:](self, "updateHistoricalMslpArray:", v86);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          uint64_t v94 = (os_log_s *)p_vtable[213];
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v86, "meanSeaLevelPressure");
            uint64_t v96 = v95;
            -[CLMeanSeaLevelPressureData uncertainty](v86, "uncertainty");
            uint64_t v98 = v97;
            -[CLMeanSeaLevelPressureData timestamp](v86, "timestamp");
            *(_DWORD *)buf = 136317954;
            *(void *)v372 = "type";
            *(_WORD *)&v372[8] = 1024;
            *(_DWORD *)&v372[10] = -1;
            *(_WORD *)&v372[14] = 2080;
            *(void *)&v372[16] = "meanSeaLevelPressure";
            *(_WORD *)&v372[24] = 2048;
            *(void *)&v372[26] = v96;
            *(_WORD *)&v372[34] = 2080;
            *(void *)&v372[36] = "uncertainty";
            *(_WORD *)&v372[44] = 2048;
            *(void *)&v372[46] = v98;
            *(_WORD *)&v372[54] = 2080;
            *(void *)&v372[56] = "timestamp";
            __int16 v373 = 2048;
            double v374 = v99;
            __int16 v375 = 2080;
            *(void *)v376 = "startAt";
            *(_WORD *)&v376[8] = 2048;
            *(double *)&v376[10] = v6;
            *(_WORD *)&v376[18] = 2080;
            *(void *)&v376[20] = "endAt";
            __int16 v377 = 2048;
            double v378 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x76u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            v284 = p_vtable[213];
            -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v86, "meanSeaLevelPressure");
            uint64_t v286 = v285;
            -[CLMeanSeaLevelPressureData uncertainty](v86, "uncertainty");
            uint64_t v288 = v287;
            -[CLMeanSeaLevelPressureData timestamp](v86, "timestamp");
            int v351 = 136317954;
            *(void *)v352 = "type";
            *(_WORD *)&v352[8] = 1024;
            *(_DWORD *)&v352[10] = -1;
            *(_WORD *)&v352[14] = 2080;
            *(void *)&v352[16] = "meanSeaLevelPressure";
            *(_WORD *)&v352[24] = 2048;
            *(void *)&v352[26] = v286;
            *(_WORD *)&v352[34] = 2080;
            *(void *)&v352[36] = "uncertainty";
            *(_WORD *)&v352[44] = 2048;
            *(void *)&v352[46] = v288;
            *(_WORD *)&v352[54] = 2080;
            *(void *)&v352[56] = "timestamp";
            __int16 v353 = 2048;
            double v354 = v289;
            __int16 v355 = 2080;
            *(void *)v356 = "startAt";
            *(_WORD *)&v356[8] = 2048;
            *(void *)&v356[10] = v308;
            *(_WORD *)&v356[18] = 2080;
            *(void *)&v356[20] = "endAt";
            __int16 v357 = 2048;
            double v358 = v309;
            v290 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v284,  0LL,  "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v351,  118,  (const char *)v304,  *((double *)&v304 + 1),  (const char *)v305,  *((double *)&v305 + 1),  v306,  v307,  v308,  v309,  v310,  v311);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v290);
            double v6 = *(double *)&v308;
            double v5 = v309;
          }

          self->_double pressureUncertainty = 0.0;
          self->_double distanceTraveled = 0.0;
          self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
          sub_1005FD5A0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          int v100 = (os_log_s *)p_vtable[213];
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            double bias = self->_bias;
            double biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
            double biasUncertainty = self->_biasUncertainty;
            double weatherEstimateInMeter = self->_weatherEstimateInMeter;
            BOOL inOutdoorWorkoutStatus = self->_inOutdoorWorkoutStatus;
            *(_DWORD *)buf = 67111680;
            *(_DWORD *)v372 = -1;
            *(_WORD *)&v372[4] = 2048;
            *(double *)&v372[6] = bias;
            *(_WORD *)&v372[14] = 2048;
            *(double *)&v372[16] = biasUncertaintyAtRebase;
            *(_WORD *)&v372[24] = 2048;
            *(double *)&v372[26] = v18 / v87;
            *(_WORD *)&v372[34] = 2048;
            *(double *)&v372[36] = v315 / (double)v317;
            *(_WORD *)&v372[44] = 2048;
            *(double *)&v372[46] = biasUncertainty;
            *(_WORD *)&v372[54] = 2048;
            *(double *)&v372[56] = biasUncertaintyAtRebase;
            __int16 v373 = 2048;
            double v374 = weatherEstimateInMeter;
            __int16 v375 = 1024;
            *(_DWORD *)v376 = inOutdoorWorkoutStatus;
            *(_WORD *)&v376[4] = 2048;
            *(double *)&v376[6] = v6;
            *(_WORD *)&v376[14] = 2048;
            *(double *)&v376[16] = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,ol dBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrack StartAt,%f,endAt,%f",  buf,  0x68u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            v291 = p_vtable[213];
            double v292 = self->_bias;
            double v293 = self->_biasUncertaintyAtRebase;
            double v294 = self->_biasUncertainty;
            double v295 = self->_weatherEstimateInMeter;
            BOOL v296 = self->_inOutdoorWorkoutStatus;
            int v351 = 67111680;
            *(_DWORD *)v352 = -1;
            *(_WORD *)&v352[4] = 2048;
            *(double *)&v352[6] = v292;
            *(_WORD *)&v352[14] = 2048;
            *(double *)&v352[16] = v293;
            *(_WORD *)&v352[24] = 2048;
            *(double *)&v352[26] = v18 / v87;
            *(_WORD *)&v352[34] = 2048;
            *(double *)&v352[36] = v315 / (double)v317;
            *(_WORD *)&v352[44] = 2048;
            *(double *)&v352[46] = v294;
            *(_WORD *)&v352[54] = 2048;
            *(double *)&v352[56] = v293;
            __int16 v353 = 2048;
            double v354 = v295;
            __int16 v355 = 1024;
            *(_DWORD *)v356 = v296;
            *(_WORD *)&v356[4] = 2048;
            *(void *)&v356[6] = v308;
            *(_WORD *)&v356[14] = 2048;
            *(double *)&v356[16] = v309;
            LODWORD(v303) = 104;
            v297 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v291,  0LL,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRe fAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoor Workout,%d,calculatedFromTrackStartAt,%f,endAt,%f",  &v351,  v303,  *(double *)&v304,  *((double *)&v304 + 1),  *(double *)&v305,  *((double *)&v305 + 1),  *(double *)&v306,  v307,  (_DWORD)v308,  v309,  *(double *)&v310);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v297);
            double v5 = v309;
          }

          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          v106 = (os_log_s *)p_vtable[213];
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            double v107 = self->_bias;
            double v108 = self->_biasPressure;
            double biasTimestamp = self->_biasTimestamp;
            *(_DWORD *)buf = v305;
            *(double *)v372 = v107;
            *(_WORD *)&v372[8] = 2048;
            *(double *)&v372[10] = v18 / v87;
            *(_WORD *)&v372[18] = 2048;
            *(double *)&v372[20] = v315 / (double)v317;
            *(_WORD *)&v372[28] = 2048;
            *(double *)&v372[30] = v108;
            *(_WORD *)&v372[38] = 2048;
            *(double *)&v372[40] = biasTimestamp;
            _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "new bias calculated from companion is %f, average baroAlt %f, average companion alt %f, average pressure %f, timestamp %f",  buf,  0x34u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            v298 = p_vtable[213];
            double v299 = self->_bias;
            double v300 = self->_biasPressure;
            double v301 = self->_biasTimestamp;
            int v351 = v305;
            *(double *)v352 = v299;
            *(_WORD *)&v352[8] = 2048;
            *(double *)&v352[10] = v18 / v87;
            *(_WORD *)&v352[18] = 2048;
            *(double *)&v352[20] = v315 / (double)v317;
            *(_WORD *)&v352[28] = 2048;
            *(double *)&v352[30] = v300;
            *(_WORD *)&v352[38] = 2048;
            *(double *)&v352[40] = v301;
            LODWORD(v303) = 52;
            v302 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v298,  0LL,  "new bias calculated from companion is %f, average baroAlt %f, average companion alt %f, ave rage pressure %f, timestamp %f",  COERCE_DOUBLE(&v351),  v303,  *(double *)&v304,  *((double *)&v304 + 1),  *(double *)&v305);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v302);
            double v5 = v309;
          }

          -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]( self,  "rebaseSignificantElevationWithEndTime:",  v5);
          -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]( self,  "updateBiasUncertaintyWithAbsSigElevation:withCompanion:",  1LL,  sub_1005FD1F8((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v110, v111, v112));
          id v113 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude]( self->_delegate,  "latestAbsoluteAltitude");
          double v114 = v113;
          if (v113)
          {
            [v113 timestamp];
            if (v115 != 1.79769313e308)
            {
              [v114 altitude];
              double v117 = v116;
              double v118 = self->_biasUncertainty;
              double v119 = self->_biasUncertaintyAtRebase;
              BOOL v120 = self->_inOutdoorWorkoutStatus;
              [v114 altitude];
              -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:]( self,  "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andRefe renceSource:andCorrection:andDistance:",  0LL,  v120,  0xFFFFFFFFLL,  v117 - v89,  v118,  v119,  v121 - v89,  self->_distanceSinceLastRebase);
            }
          }

          self->_companionRebase = 0;
LABEL_253:
          v236 = v331;
          if (v331)
          {
            __int16 v237 = (unint64_t *)&v331->__shared_owners_;
            do
              unint64_t v238 = __ldaxr(v237);
            while (__stlxr(v238 - 1, v237));
            if (!v238)
            {
              ((void (*)(std::__shared_weak_count *))v236->__on_zero_shared)(v236);
              std::__shared_weak_count::__release_weak(v236);
            }
          }

          if (__p)
          {
            v333 = (char *)__p;
            operator delete(__p);
          }

          goto LABEL_260;
        }
      }
    }

    v328 = 0LL;
    uint64_t v329 = 0LL;
    v326[1] = 0LL;
    v327 = (double *)&v328;
    v325 = v326;
    v326[0] = 0LL;

    self->_queriedMeanSeaLevelPressureData = (CLMeanSeaLevelPressureData *) -[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]( self->_meanSeaLevelPressureEstimator,  "getEstimatedMeanSeaLevelPressure");
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    float v122 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      uint64_t v124 = v123;
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      uint64_t v126 = v125;
      -[CLMeanSeaLevelPressureData timestamp](self->_queriedMeanSeaLevelPressureData, "timestamp");
      *(_DWORD *)buf = 136316418;
      *(void *)v372 = "meanSeaLevelPressure";
      *(_WORD *)&v372[8] = 2048;
      *(void *)&v372[10] = v124;
      *(_WORD *)&v372[18] = 2080;
      *(void *)&v372[20] = "uncertainty";
      *(_WORD *)&v372[28] = 2048;
      *(void *)&v372[30] = v126;
      *(_WORD *)&v372[38] = 2080;
      *(void *)&v372[40] = "timestamp";
      *(_WORD *)&v372[48] = 2048;
      *(void *)&v372[50] = v127;
      _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "query mean sea level pressure,%s,%f,%s,%f,%s,%f",  buf,  0x3Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      uint64_t v263 = qword_1019346A8;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      uint64_t v265 = v264;
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      uint64_t v267 = v266;
      -[CLMeanSeaLevelPressureData timestamp](self->_queriedMeanSeaLevelPressureData, "timestamp");
      int v351 = 136316418;
      *(void *)v352 = "meanSeaLevelPressure";
      *(_WORD *)&v352[8] = 2048;
      *(void *)&v352[10] = v265;
      *(_WORD *)&v352[18] = 2080;
      *(void *)&v352[20] = "uncertainty";
      *(_WORD *)&v352[28] = 2048;
      *(void *)&v352[30] = v267;
      *(_WORD *)&v352[38] = 2080;
      *(void *)&v352[40] = "timestamp";
      *(_WORD *)&v352[48] = 2048;
      *(void *)&v352[50] = v268;
      LODWORD(v303) = 62;
      v269 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v263,  0LL,  "query mean sea level pressure,%s,%f,%s,%f,%s,%f",  (const char *)&v351,  v303,  (const char *)v304,  *((double *)&v304 + 1),  (const char *)v305,  *((double *)&v305 + 1));
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v269);
      double v6 = *(double *)&v308;
      double v5 = v309;
    }

    if (v348 == v347
      || (double v128 = (void *)(v347 + 8 * (v349 >> 8)),
          double v129 = (double **)(*v128 + 16LL * v349),
          uint64_t v130 = *(void *)(v347 + (((v350 + v349) >> 5) & 0x7FFFFFFFFFFFFF8LL))
               + 16LL * (v350 + v349),
          v129 == (double **)v130))
    {
      BOOL v318 = 0;
    }

    else
    {
      BOOL v318 = 0;
      do
      {
        double v131 = **v129;
        if (v131 >= v6 && v131 < v5)
        {
          float v133 = v129[1];
          v323 = *v129;
          v324 = (std::__shared_weak_count *)v133;
          if (v133)
          {
            float v134 = (unint64_t *)(v133 + 1);
            do
              unint64_t v135 = __ldxr(v134);
            while (__stxr(v135 + 1, v134));
          }

          double v321 = -1.0;
          double v322 = 1.79769313e308;
          +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:]( &OBJC_CLASS___CLBarometerCalibrationBiasEstimator,  "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:",  &v323,  &v322,  &v321);
          if (v321 <= 0.0 && v323[7] <= 0.0)
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            BOOL v152 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
            {
              double v153 = *v323;
              uint64_t v154 = *((void *)v323 + 6);
              *(_DWORD *)buf = 134218496;
              *(double *)v372 = v153;
              *(_WORD *)&v372[8] = 2048;
              *(double *)&v372[10] = v322;
              *(_WORD *)&v372[18] = 2048;
              *(void *)&v372[20] = v154;
              _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_INFO,  "individual bias error: reference Uncertainty < 0 and no DEMS, location timestamp %f, location altitude % f, location DEMS %f",  buf,  0x20u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              uint64_t v182 = *(void *)v323;
              uint64_t v183 = *((void *)v323 + 6);
              int v351 = 134218496;
              *(void *)v352 = v182;
              *(_WORD *)&v352[8] = 2048;
              *(double *)&v352[10] = v322;
              *(_WORD *)&v352[18] = 2048;
              *(void *)&v352[20] = v183;
              LODWORD(v303) = 32;
              double v184 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  1LL,  "individual bias error: reference Uncertainty < 0 and no DEMS, location timestamp %f, loca tion altitude %f, location DEMS %f",  COERCE_DOUBLE(&v351),  v303,  *(double *)&v304);
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v184);
              double v6 = *(double *)&v308;
              double v5 = v309;
            }
          }

          else
          {
            if (v343 == v342) {
              goto LABEL_159;
            }
            v136 = (void *)(v342 + 8 * (v344 >> 8));
            uint64_t v137 = *v136 + 16LL * v344;
            uint64_t v138 = *(void *)(v342 + (((v345 + v344) >> 5) & 0x7FFFFFFFFFFFFF8LL))
                 + 16LL * (v345 + v344);
            if (v137 == v138) {
              goto LABEL_159;
            }
            double v139 = 1.79769313e308;
            do
            {
              uint64_t v140 = *(double **)v137;
              double v141 = vabdd_f64(**v129, **(double **)v137);
              if (v141 < v139 && v141 <= 5.0)
              {
                uint64_t v143 = *(std::__shared_weak_count **)(v137 + 8);
                if (v143)
                {
                  double v144 = (unint64_t *)&v143->__shared_owners_;
                  do
                    unint64_t v145 = __ldxr(v144);
                  while (__stxr(v145 + 1, v144));
                }

                double v146 = v331;
                v330 = v140;
                v331 = v143;
                if (v146)
                {
                  v147 = (unint64_t *)&v146->__shared_owners_;
                  do
                    unint64_t v148 = __ldaxr(v147);
                  while (__stlxr(v148 - 1, v147));
                  if (!v148)
                  {
                    ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
                    std::__shared_weak_count::__release_weak(v146);
                  }
                }

                double v139 = v141;
              }

              v137 += 16LL;
              if (v137 - *v136 == 4096)
              {
                uint64_t v149 = v136[1];
                ++v136;
                uint64_t v137 = v149;
              }
            }

            while (v137 != v138);
            if (v139 == 1.79769313e308)
            {
LABEL_159:
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183BC80);
              }
              v150 = (os_log_s *)qword_1019346A8;
              if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v150,  OS_LOG_TYPE_DEFAULT,  "pressure too far from reference data",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_10183BC80);
                }
                LOWORD(v351) = 0;
                LODWORD(v303) = 2;
                double v151 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "pressure too far from reference data",  &v351,  *(void *)&v303);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v151);
              }
            }

            else
            {
              uint64_t v160 = *((void *)v323 + 1);
              uint64_t v159 = *((void *)v323 + 2);
              uint64_t v161 = v333;
              if (v333 >= v334)
              {
                uint64_t v163 = (char *)__p;
                uint64_t v164 = (v333 - (_BYTE *)__p) >> 4;
                unint64_t v165 = v164 + 1;
                uint64_t v166 = v334 - (_BYTE *)__p;
                if ((v334 - (_BYTE *)__p) >> 3 > v165) {
                  unint64_t v165 = v166 >> 3;
                }
                else {
                  unint64_t v167 = v165;
                }
                if (v167)
                {
                  double v168 = (char *)sub_100037038((uint64_t)&v334, v167);
                  uint64_t v163 = (char *)__p;
                  uint64_t v161 = v333;
                }

                else
                {
                  double v168 = 0LL;
                }

                double v169 = &v168[16 * v164];
                *(void *)double v169 = v160;
                *((void *)v169 + 1) = v159;
                double v170 = v169;
                if (v161 != v163)
                {
                  do
                  {
                    *((_OWORD *)v170 - 1) = *((_OWORD *)v161 - 1);
                    v170 -= 16;
                    v161 -= 16;
                  }

                  while (v161 != v163);
                  uint64_t v163 = (char *)__p;
                }

                uint64_t v162 = v169 + 16;
                __p = v170;
                v333 = v169 + 16;
                v334 = &v168[16 * v167];
                if (v163) {
                  operator delete(v163);
                }
              }

              else
              {
                *(void *)v333 = v160;
                *((void *)v161 + 1) = v159;
                uint64_t v162 = v161 + 16;
              }

              v333 = v162;
              BOOL v171 = v330;
              float v172 = v330[1] * 1000.0;
              float v173 = sub_100FADFE8(v172, 101320.0);
              double v174 = v171[1];
              -[CLMeanSeaLevelPressureData meanSeaLevelPressure]( self->_queriedMeanSeaLevelPressureData,  "meanSeaLevelPressure");
              float v175 = v174 * 1000.0;
              float v177 = v176;
              float v178 = sub_100FADFE8(v175, v177);
              double v179 = v323;
              double v180 = v323[7];
              BOOL v318 = v180 > 0.0;
              if (!self->_inOutdoorWorkoutStatus || (*((_WORD *)v323 + 65) & 2) != 0)
              {
                double v181 = v173;
                if ((*((_DWORD *)v323 + 25) & 0x80000000) == 0)
                {
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:]( self,  "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:",  &v327,  v322,  v321,  v181);
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:]( self,  "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:",  &v325,  *((unsigned int *)v323 + 25),  v322,  v321,  v178);
                  double v179 = v323;
                  double v180 = v323[7];
                }

                if (v180 > 0.0)
                {
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:]( self,  "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:",  &v327,  14LL,  v179[6]);
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:]( self,  "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:",  &v325,  14LL,  v323[6],  v323[7],  v178);
                }
              }
            }
          }

          unint64_t v155 = v324;
          if (v324)
          {
            v156 = (unint64_t *)&v324->__shared_owners_;
            do
              unint64_t v157 = __ldaxr(v156);
            while (__stlxr(v157 - 1, v156));
            if (!v157)
            {
              ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
              std::__shared_weak_count::__release_weak(v155);
            }
          }
        }

        v129 += 2;
        if ((double **)((char *)v129 - *v128) == (double **)4096)
        {
          v158 = (double **)v128[1];
          ++v128;
          double v129 = v158;
        }
      }

      while (v129 != (double **)v130);
    }

    if (v329)
    {
      -[CLBarometerCalibrationBiasEstimator centroidOfLocationVector:](self, "centroidOfLocationVector:", &__p);
      double v187 = v186;
      double v188 = v185;
      if (v186 != 1.79769313e308)
      {
        double latitude = self->_biasLocation.latitude;
        if (latitude != 1.79769313e308) {
          self->_distanceSinceLastRebase = fabs(sub_100D2EC74(latitude, self->_biasLocation.longitude, v187, v185));
        }
      }

      -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]( self,  "updateBiasUncertaintyWithPressure:andTime:andLat:andLon:",  v335,  0.0,  v187,  v188);
      -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
      double v191 = v190;
      v192 = v327;
      if (v327 == (double *)&v328)
      {
        uint64_t v194 = 0LL;
      }

      else
      {
        double v193 = log(v190 * (v190 * 17.0794684));
        uint64_t v194 = 0LL;
        do
        {
          double v195 = (double)*((int *)v192 + 18);
          double v196 = v192[6] * v192[6] / v195 / v195;
          v192[5] = v192[5] / v195;
          v192[6] = v196;
          double v197 = v192[7] / v195;
          v192[7] = v197;
          double v198 = v197 + self->_bias;
          v192[7] = v198;
          v192[7] = v198 - self->_weatherEstimateInMeter;
          v192[8] = v191 * v191;
          uint64_t v320 = *((void *)v192 + 9);
          __int128 v199 = *(_OWORD *)(v192 + 7);
          v319[0] = *(_OWORD *)(v192 + 5);
          v319[1] = v199;
          -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", v319);
          if (v193 >= v200)
          {
            uint64_t v194 = *((unsigned int *)v192 + 8);
            double v193 = v200;
          }

          uint64_t v201 = (std::__shared_weak_count *)*((void *)v192 + 1);
          if (v201)
          {
            do
            {
              uint64_t v202 = (std::__shared_weak_count **)v201;
              uint64_t v201 = (std::__shared_weak_count *)v201->__vftable;
            }

            while (v201);
          }

          else
          {
            do
            {
              uint64_t v202 = (std::__shared_weak_count **)*((void *)v192 + 2);
              BOOL v203 = *v202 == (std::__shared_weak_count *)v192;
              v192 = (double *)v202;
            }

            while (!v203);
          }

          v192 = (double *)v202;
        }

        while (v202 != &v328);
      }

      uint64_t v204 = v328;
      if (!v328) {
        goto LABEL_235;
      }
      unint64_t v205 = &v328;
      do
      {
        uint64_t v206 = v204;
        int v207 = v205;
        int shared_owners = v204[1].__shared_owners_;
        __int16 v209 = &v204->__shared_owners_;
        if (shared_owners >= (int)v194)
        {
          __int16 v209 = (uint64_t *)v206;
          unint64_t v205 = (std::__shared_weak_count **)v206;
        }

        uint64_t v204 = (std::__shared_weak_count *)*v209;
      }

      while (v204);
      if (v205 == &v328) {
        goto LABEL_235;
      }
      if ((int)v194 >= SLODWORD(v206[1].__shared_owners_))
      {
        double v239 = self->_bias;
        float v240 = *((double *)v205 + 7) + self->_weatherEstimateInMeter - v239;
        self->_float biasPressure = sub_100FAE01C(v240, 101320.0);
        double v241 = self->_bias
             + *((double *)v205 + 8)
        self->_double bias = v241 - self->_weatherEstimateInMeter;
        self->_double biasUncertaintyAtRebase = sqrt( *((double *)v205 + 8)
        self->_double pressureUncertainty = 0.0;
        self->_double distanceTraveled = 0.0;
        self->_double biasTimestamp = v5;
        sub_1005FD5A0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
        -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]( self,  "rebaseSignificantElevationWithEndTime:",  v5);
        -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]( self,  "updateBiasUncertaintyWithAbsSigElevation:withCompanion:",  0LL,  sub_1005FD1F8((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v242, v243, v244));
        -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:]( self,  "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceS ource:andCorrection:andDistance:",  v318,  self->_inOutdoorWorkoutStatus,  v194,  *((double *)v205 + 5) - *((double *)v205 + 7),  sqrt(*((double *)v205 + 8)),  sqrt(*((double *)v205 + 6)),  v241 - v239,  self->_distanceSinceLastRebase);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        v245 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          double v246 = self->_bias;
          double v247 = self->_biasUncertaintyAtRebase;
          v248 = v205[7];
          v249 = v205[5];
          double v250 = sqrt(*((double *)v205 + 8));
          double v251 = *((double *)v205 + 6);
          double v252 = self->_weatherEstimateInMeter;
          BOOL v253 = self->_inOutdoorWorkoutStatus;
          *(_DWORD *)buf = 67111680;
          *(_DWORD *)v372 = v194;
          *(_WORD *)&v372[4] = 2048;
          *(double *)&v372[6] = v246;
          *(_WORD *)&v372[14] = 2048;
          *(double *)&v372[16] = v247;
          *(_WORD *)&v372[24] = 2048;
          *(void *)&v372[26] = v248;
          *(_WORD *)&v372[34] = 2048;
          *(void *)&v372[36] = v249;
          *(_WORD *)&v372[44] = 2048;
          *(double *)&v372[46] = v250;
          *(_WORD *)&v372[54] = 2048;
          *(void *)&v372[56] = sqrt(v251);
          __int16 v373 = 2048;
          double v374 = v252;
          __int16 v375 = 1024;
          *(_DWORD *)v376 = v253;
          *(_WORD *)&v376[4] = 2048;
          *(double *)&v376[6] = v6;
          *(_WORD *)&v376[14] = 2048;
          *(double *)&v376[16] = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v245,  OS_LOG_TYPE_DEFAULT,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldB aroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f",  buf,  0x68u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_240;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v254 = self->_bias;
        double v255 = self->_biasUncertaintyAtRebase;
        v256 = v205[7];
        v257 = v205[5];
        double v258 = sqrt(*((double *)v205 + 8));
        double v259 = *((double *)v205 + 6);
        double v260 = self->_weatherEstimateInMeter;
        BOOL v261 = self->_inOutdoorWorkoutStatus;
        int v351 = 67111680;
        *(_DWORD *)v352 = v194;
        *(_WORD *)&v352[4] = 2048;
        *(double *)&v352[6] = v254;
        *(_WORD *)&v352[14] = 2048;
        *(double *)&v352[16] = v255;
        *(_WORD *)&v352[24] = 2048;
        *(void *)&v352[26] = v256;
        *(_WORD *)&v352[34] = 2048;
        *(void *)&v352[36] = v257;
        *(_WORD *)&v352[44] = 2048;
        *(double *)&v352[46] = v258;
        *(_WORD *)&v352[54] = 2048;
        *(void *)&v352[56] = sqrt(v259);
        __int16 v353 = 2048;
        double v354 = v260;
        __int16 v355 = 1024;
        *(_DWORD *)v356 = v261;
        *(_WORD *)&v356[4] = 2048;
        *(void *)&v356[6] = v308;
        *(_WORD *)&v356[14] = 2048;
        *(double *)&v356[16] = v309;
        LODWORD(v303) = 104;
        v262 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAlt itude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout, %d,calculatedFromTrackStartAt,%f,endAt,%f",  &v351,  v303,  *(double *)&v304,  *((double *)&v304 + 1),  *(double *)&v305,  *((double *)&v305 + 1),  *(double *)&v306,  v307,  (_DWORD)v308,  v309,  *(double *)&v310);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v262);
      }

      else
      {
LABEL_235:
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        v210 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          double v211 = self->_bias;
          double v212 = self->_weatherEstimateInMeter;
          BOOL v213 = self->_inOutdoorWorkoutStatus;
          *(_DWORD *)buf = 67111680;
          *(_DWORD *)v372 = v194;
          *(_WORD *)&v372[4] = 2048;
          *(double *)&v372[6] = v211;
          *(_WORD *)&v372[14] = 2048;
          *(double *)&v372[16] = v191;
          *(_WORD *)&v372[24] = 2048;
          *(void *)&v372[26] = 0xBFF0000000000000LL;
          *(_WORD *)&v372[34] = 2048;
          *(void *)&v372[36] = 0xBFF0000000000000LL;
          *(_WORD *)&v372[44] = 2048;
          *(void *)&v372[46] = 0xBFF0000000000000LL;
          *(_WORD *)&v372[54] = 2048;
          *(void *)&v372[56] = 0xBFF0000000000000LL;
          __int16 v373 = 2048;
          double v374 = v212;
          __int16 v375 = 1024;
          *(_DWORD *)v376 = v213;
          *(_WORD *)&v376[4] = 2048;
          *(double *)&v376[6] = v6;
          *(_WORD *)&v376[14] = 2048;
          *(double *)&v376[16] = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v210,  OS_LOG_TYPE_DEFAULT,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldB aroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f",  buf,  0x68u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_240;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v281 = self->_bias;
        double v282 = self->_weatherEstimateInMeter;
        BOOL v283 = self->_inOutdoorWorkoutStatus;
        int v351 = 67111680;
        *(_DWORD *)v352 = v194;
        *(_WORD *)&v352[4] = 2048;
        *(double *)&v352[6] = v281;
        *(_WORD *)&v352[14] = 2048;
        *(double *)&v352[16] = v191;
        *(_WORD *)&v352[24] = 2048;
        *(void *)&v352[26] = 0xBFF0000000000000LL;
        *(_WORD *)&v352[34] = 2048;
        *(void *)&v352[36] = 0xBFF0000000000000LL;
        *(_WORD *)&v352[44] = 2048;
        *(void *)&v352[46] = 0xBFF0000000000000LL;
        *(_WORD *)&v352[54] = 2048;
        *(void *)&v352[56] = 0xBFF0000000000000LL;
        __int16 v353 = 2048;
        double v354 = v282;
        __int16 v355 = 1024;
        *(_DWORD *)v356 = v283;
        *(_WORD *)&v356[4] = 2048;
        *(void *)&v356[6] = v308;
        *(_WORD *)&v356[14] = 2048;
        *(double *)&v356[16] = v309;
        LODWORD(v303) = 104;
        v262 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAlt itude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout, %d,calculatedFromTrackStartAt,%f,endAt,%f",  &v351,  v303,  *(double *)&v304,  *((double *)&v304 + 1),  *(double *)&v305,  *((double *)&v305 + 1),  *(double *)&v306,  v307,  (_DWORD)v308,  v309,  *(double *)&v310);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]",  "%s\n",  v262);
      }

      double v6 = *(double *)&v308;
      double v5 = v309;
    }

- (void)updateHistoricalMslpArray:(id)a3
{
  BOOL v5 = *(_WORD *)&self->_inOutdoorWorkoutStatus || self->_loiRebase || self->_forceCalibrate;
  if (self->_forceCalibrate) {
    -[CLMeanSeaLevelPressureEstimator cleanHistoricalMslpArrayForForceRebase:]( self->_meanSeaLevelPressureEstimator,  "cleanHistoricalMslpArrayForForceRebase:",  a3);
  }
  if (v5 || !-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    if (-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]( self->_meanSeaLevelPressureEstimator,  "updateHistoricalMslpArray:from:",  a3,  0LL))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v6 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        [a3 timestamp];
        uint64_t v8 = v7;
        [a3 meanSeaLevelPressure];
        uint64_t v10 = v9;
        [a3 uncertainty];
        uint64_t v12 = v11;
        [a3 pressureMeasurement];
        *(_DWORD *)buf = 134218752;
        uint64_t v33 = v8;
        __int16 v34 = 2048;
        uint64_t v35 = v10;
        __int16 v36 = 2048;
        uint64_t v37 = v12;
        __int16 v38 = 2048;
        uint64_t v39 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "mslp from ap,timestamp,%f,mslp,%f,uncertainty,%f,pressureMeasurement,%f",  buf,  0x2Au);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        uint64_t v14 = qword_1019346A8;
        [a3 timestamp];
        uint64_t v16 = v15;
        [a3 meanSeaLevelPressure];
        uint64_t v18 = v17;
        [a3 uncertainty];
        uint64_t v20 = v19;
        [a3 pressureMeasurement];
        int v24 = 134218752;
        uint64_t v25 = v16;
        __int16 v26 = 2048;
        uint64_t v27 = v18;
        __int16 v28 = 2048;
        uint64_t v29 = v20;
        __int16 v30 = 2048;
        uint64_t v31 = v21;
        LODWORD(v23) = 42;
        unint64_t v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  0LL,  "mslp from ap,timestamp,%f,mslp,%f,uncertainty,%f,pressureMeasurement,%f",  COERCE_DOUBLE(&v24),  v23);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:]",  "%s\n",  v22);
      }

      -[CLMeanSeaLevelPressureEstimator setNumberOfRebaseBtwRefresh:]( self->_meanSeaLevelPressureEstimator,  "setNumberOfRebaseBtwRefresh:",  -[CLMeanSeaLevelPressureEstimator numberOfRebaseBtwRefresh]( self->_meanSeaLevelPressureEstimator,  "numberOfRebaseBtwRefresh")
      + 1);
      self->_lastRebaseTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }

  else
  {
    -[CLMeanSeaLevelPressureEstimator updateInVisitRebasedMslp:]( self->_meanSeaLevelPressureEstimator,  "updateInVisitRebasedMslp:",  a3);
  }

- (void)computeMeanSeaLevelPressureWithRebasingLocationData:(id)a3 referenceMap:(void *)a4 andLocationType:(int)a5
{
  if (!a5)
  {
    objc_msgSend(a3, "setMeanSeaLevelPressure:", a3, a4, 1.0);
    double v14 = -1.0;
LABEL_15:
    [a3 setUncertainty:v14];
    return;
  }

  uint64_t v8 = (char *)*((void *)a4 + 1);
  double v6 = (char *)a4 + 8;
  uint64_t v7 = v8;
  if (v8)
  {
    uint64_t v10 = (double *)v6;
    do
    {
      int v11 = *((_DWORD *)v7 + 8);
      BOOL v12 = v11 < a5;
      if (v11 >= a5) {
        uint64_t v13 = (char **)v7;
      }
      else {
        uint64_t v13 = (char **)(v7 + 8);
      }
      if (!v12) {
        uint64_t v10 = (double *)v7;
      }
      uint64_t v7 = *v13;
    }

    while (*v13);
    if (v10 != (double *)v6 && *((_DWORD *)v10 + 8) <= a5)
    {
      double v15 = v10[7];
      double v16 = v10[8];
      double v17 = v10[5];
      double v18 = v10[6];
      double v19 = (v15 * v18 + v16 * v17) / (v16 + v18);
      float v20 = v15;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      float v22 = v21;
      float v23 = sub_100FAE01C(v20, v22);
      self->_double estimatedAbsoluteAltitudeUncertainty = sqrt(v16 * v18 / (v16 + v18));
      float v24 = v19;
      self->_estimatedMeanSeaLevelPressure = sub_100FAE05C(v24, v23);
      *(float *)&double v16 = v17;
      objc_msgSend(a3, "setMeanSeaLevelPressure:", sub_100FAE05C(*(float *)&v16, v23));
      float v25 = v17;
      double v14 = sqrt(v18) * sub_100FAE0E8(v25, v23);
      goto LABEL_15;
    }
  }

- (int)selectReferenceWithReference:(void *)a3 withBaroElevation:(double)a4 betweenStartTime:(double)a5 andEndTime:(double)a6
{
  int v72 = 0;
  self->_loiRebase = 0;
  double v62 = (uint64_t **)a3;
  if (*((void *)a3 + 2))
  {
    double v10 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    int v11 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double estimatedAbsoluteAltitudeUncertainty = self->_estimatedAbsoluteAltitudeUncertainty;
      *(_DWORD *)buf = 136318978;
      v106 = "type";
      __int16 v107 = 1024;
      int v108 = 0;
      __int16 v109 = 2080;
      double v110 = "crossEntropy";
      __int16 v111 = 2048;
      double v112 = v10;
      __int16 v113 = 2080;
      double v114 = "fromBaroAlt";
      __int16 v115 = 2048;
      unint64_t v116 = 0xBFF0000000000000LL;
      __int16 v117 = 2080;
      double v118 = "fromRefAlt";
      __int16 v119 = 2048;
      unint64_t v120 = 0xBFF0000000000000LL;
      __int16 v121 = 2080;
      float v122 = "baroUncertainty";
      __int16 v123 = 2048;
      double v124 = estimatedAbsoluteAltitudeUncertainty;
      __int16 v125 = 2080;
      uint64_t v126 = "refUncertainty";
      __int16 v127 = 2048;
      double v128 = -1.0;
      __int16 v129 = 2080;
      uint64_t v130 = "trackStartTime";
      __int16 v131 = 2048;
      double v132 = a5;
      __int16 v133 = 2080;
      float v134 = "trackEndTime";
      __int16 v135 = 2048;
      double v136 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x9Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v55 = self->_estimatedAbsoluteAltitudeUncertainty;
      int v73 = 136318978;
      double v74 = "type";
      __int16 v75 = 1024;
      int v76 = 0;
      __int16 v77 = 2080;
      v78 = "crossEntropy";
      __int16 v79 = 2048;
      double v80 = v10;
      __int16 v81 = 2080;
      double v82 = "fromBaroAlt";
      __int16 v83 = 2048;
      unint64_t v84 = 0xBFF0000000000000LL;
      __int16 v85 = 2080;
      uint64_t v86 = "fromRefAlt";
      __int16 v87 = 2048;
      unint64_t v88 = 0xBFF0000000000000LL;
      __int16 v89 = 2080;
      float v90 = "baroUncertainty";
      __int16 v91 = 2048;
      double v92 = v55;
      __int16 v93 = 2080;
      uint64_t v94 = "refUncertainty";
      __int16 v95 = 2048;
      double v96 = -1.0;
      __int16 v97 = 2080;
      uint64_t v98 = "trackStartTime";
      __int16 v99 = 2048;
      double v100 = a5;
      __int16 v101 = 2080;
      double v102 = "trackEndTime";
      __int16 v103 = 2048;
      double v104 = a6;
      uint64_t v56 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v73,  158,  v57,  v60,  v61,  *(double *)&v62,  *(const char **)&v63.var0,  v63.var1,  (const char *)v64,  *((double *)&v64 + 1),  v65,  v66,  *(const char **)&v67.var0,  v67.var1,  (const char *)v68,  *((double *)&v68 + 1));
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]",  "%s\n",  v56);
    }

    double v14 = v62 + 1;
    double v15 = *v62;
    if (*v62 != (uint64_t *)(v62 + 1))
    {
      *(void *)&__int128 v13 = 136318978LL;
      __int128 v58 = v13;
      do
      {
        double v16 = (double)*((int *)v15 + 18);
        double v17 = *((double *)v15 + 6) * *((double *)v15 + 6) / v16 / v16;
        *((double *)v15 + 5) = *((double *)v15 + 5) / v16;
        *((double *)v15 + 6) = v17;
        *((double *)v15 + 7) = *((double *)v15 + 7) / v16;
        *((double *)v15 + 8) = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        uint64_t v71 = v15[9];
        __int128 v18 = *(_OWORD *)(v15 + 7);
        v70[0] = *(_OWORD *)(v15 + 5);
        v70[1] = v18;
        -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", v70);
        double v20 = v19;
        if (v10 >= v19)
        {
          int v72 = *((_DWORD *)v15 + 8);
          double v10 = v19;
        }

        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v21 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *((_DWORD *)v15 + 8);
          unint64_t v23 = v15[7];
          unint64_t v24 = v15[5];
          double v25 = sqrt(*((double *)v15 + 8));
          double v26 = *((double *)v15 + 6);
          *(_DWORD *)buf = v58;
          v106 = "type";
          __int16 v107 = 1024;
          int v108 = v22;
          __int16 v109 = 2080;
          double v110 = "crossEntropy";
          __int16 v111 = 2048;
          double v112 = v20;
          __int16 v113 = 2080;
          double v114 = "fromBaroAlt";
          __int16 v115 = 2048;
          unint64_t v116 = v23;
          __int16 v117 = 2080;
          double v118 = "fromRefAlt";
          __int16 v119 = 2048;
          unint64_t v120 = v24;
          __int16 v121 = 2080;
          float v122 = "baroUncertainty";
          __int16 v123 = 2048;
          double v124 = v25;
          __int16 v125 = 2080;
          uint64_t v126 = "refUncertainty";
          __int16 v127 = 2048;
          double v128 = sqrt(v26);
          __int16 v129 = 2080;
          uint64_t v130 = "trackStartTime";
          __int16 v131 = 2048;
          double v132 = a5;
          __int16 v133 = 2080;
          float v134 = "trackEndTime";
          __int16 v135 = 2048;
          double v136 = a6;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x9Eu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          int v30 = *((_DWORD *)v15 + 8);
          unint64_t v31 = v15[7];
          unint64_t v32 = v15[5];
          double v33 = sqrt(*((double *)v15 + 8));
          double v34 = *((double *)v15 + 6);
          int v73 = v58;
          double v74 = "type";
          __int16 v75 = 1024;
          int v76 = v30;
          __int16 v77 = 2080;
          v78 = "crossEntropy";
          __int16 v79 = 2048;
          double v80 = v20;
          __int16 v81 = 2080;
          double v82 = "fromBaroAlt";
          __int16 v83 = 2048;
          unint64_t v84 = v31;
          __int16 v85 = 2080;
          uint64_t v86 = "fromRefAlt";
          __int16 v87 = 2048;
          unint64_t v88 = v32;
          __int16 v89 = 2080;
          float v90 = "baroUncertainty";
          __int16 v91 = 2048;
          double v92 = v33;
          __int16 v93 = 2080;
          uint64_t v94 = "refUncertainty";
          __int16 v95 = 2048;
          double v96 = sqrt(v34);
          __int16 v97 = 2080;
          uint64_t v98 = "trackStartTime";
          __int16 v99 = 2048;
          double v100 = a5;
          __int16 v101 = 2080;
          double v102 = "trackEndTime";
          __int16 v103 = 2048;
          double v104 = a6;
          uint64_t v35 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v73,  158,  (const char *)v58,  *((double *)&v58 + 1),  v61,  *(double *)&v62,  *(const char **)&v63.var0,  v63.var1,  (const char *)v64,  *((double *)&v64 + 1),  v65,  v66,  *(const char **)&v67.var0,  v67.var1,  (const char *)v68,  *((double *)&v68 + 1));
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]",  "%s\n",  v35);
        }

        uint64_t v27 = (uint64_t *)v15[1];
        if (v27)
        {
          do
          {
            __int16 v28 = v27;
            uint64_t v27 = (uint64_t *)*v27;
          }

          while (v27);
        }

        else
        {
          do
          {
            __int16 v28 = (uint64_t *)v15[2];
            BOOL v29 = *v28 == (void)v15;
            double v15 = v28;
          }

          while (!v29);
        }

        double v15 = v28;
      }

      while (v28 != (uint64_t *)v14);
    }
  }

  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    begin = self->_loiVisitAltitudes.__begin_;
    end = self->_loiVisitAltitudes.__end_;
    if (end != begin)
    {
      double v38 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
      uint64_t v39 = (int *)(v62 + 1);
      *(void *)&__int128 v40 = 136318978LL;
      __int128 v59 = v40;
      do
      {
        NormalDistribution v67 = *begin;
        double v41 = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        *(double *)&__int128 v68 = a4;
        *((double *)&v68 + 1) = v41;
        LODWORD(v69) = 1;
        unint64_t v65 = v69;
        NormalDistribution v63 = v67;
        __int128 v64 = v68;
        -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", &v63);
        double v43 = v42;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v44 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v59;
          v106 = "type";
          __int16 v107 = 1024;
          int v108 = 13;
          __int16 v109 = 2080;
          double v110 = "crossEntropy";
          __int16 v111 = 2048;
          double v112 = v43;
          __int16 v113 = 2080;
          double v114 = "fromBaroAlt";
          __int16 v115 = 2048;
          unint64_t v116 = v68;
          __int16 v117 = 2080;
          double v118 = "fromRefAlt";
          __int16 v119 = 2048;
          unint64_t v120 = *(void *)&v67.var0;
          __int16 v121 = 2080;
          float v122 = "baroUncertainty";
          __int16 v123 = 2048;
          double v124 = sqrt(*((double *)&v68 + 1));
          __int16 v125 = 2080;
          uint64_t v126 = "refUncertainty";
          __int16 v127 = 2048;
          double v128 = sqrt(v67.var1);
          __int16 v129 = 2080;
          uint64_t v130 = "trackStartTime";
          __int16 v131 = 2048;
          double v132 = a5;
          __int16 v133 = 2080;
          float v134 = "trackEndTime";
          __int16 v135 = 2048;
          double v136 = a6;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x9Eu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          int v73 = v59;
          double v74 = "type";
          __int16 v75 = 1024;
          int v76 = 13;
          __int16 v77 = 2080;
          v78 = "crossEntropy";
          __int16 v79 = 2048;
          double v80 = v43;
          __int16 v81 = 2080;
          double v82 = "fromBaroAlt";
          __int16 v83 = 2048;
          unint64_t v84 = v68;
          __int16 v85 = 2080;
          uint64_t v86 = "fromRefAlt";
          __int16 v87 = 2048;
          unint64_t v88 = *(void *)&v67.var0;
          __int16 v89 = 2080;
          float v90 = "baroUncertainty";
          __int16 v91 = 2048;
          double v92 = sqrt(*((double *)&v68 + 1));
          __int16 v93 = 2080;
          uint64_t v94 = "refUncertainty";
          __int16 v95 = 2048;
          double v96 = sqrt(v67.var1);
          __int16 v97 = 2080;
          uint64_t v98 = "trackStartTime";
          __int16 v99 = 2048;
          double v100 = a5;
          __int16 v101 = 2080;
          double v102 = "trackEndTime";
          __int16 v103 = 2048;
          double v104 = a6;
          uint64_t v53 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v73,  158,  (const char *)v59,  *((double *)&v59 + 1),  v61,  *(double *)&v62,  *(const char **)&v63.var0,  v63.var1,  (const char *)v64,  *((double *)&v64 + 1),  v65,  v66,  *(const char **)&v67.var0,  v67.var1,  (const char *)v68,  *((double *)&v68 + 1));
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]",  "%s\n",  v53);
        }

        if (v38 >= v43)
        {
          int v72 = 13;
          uint64_t v45 = *(void *)v39;
          if (!*(void *)v39) {
            goto LABEL_46;
          }
          double v46 = v39;
          do
          {
            int v47 = *(_DWORD *)(v45 + 32);
            BOOL v48 = v47 < 13;
            if (v47 >= 13) {
              float v49 = (uint64_t *)v45;
            }
            else {
              float v49 = (uint64_t *)(v45 + 8);
            }
            if (!v48) {
              double v46 = (int *)v45;
            }
            uint64_t v45 = *v49;
          }

          while (*v49);
          if (v46 != v39 && v46[8] < 14)
          {
            double v50 = sub_10000C6DC((uint64_t)v62, &v72);
            int v51 = (int)v69;
            __int128 v52 = v68;
            *(NormalDistribution *)double v50 = v67;
            *((_OWORD *)v50 + 1) = v52;
            *((_DWORD *)v50 + 8) = v51;
          }

          else
          {
LABEL_46:
            sub_100490810(v62, &v72, &v72, (uint64_t)&v67);
          }

          self->_loiRebase = 1;
          double v38 = v43;
        }

        ++begin;
      }

      while (begin != end);
    }
  }

  return v72;
}

- (void)updateBiasUncertaintyWithAbsSigElevation:(double)a3 withCompanion:(BOOL)a4
{
  BOOL v4 = a4;
  sub_1004908E0((uint64_t)&v24, (void *)self->_dataBuffers + 6);
  __int128 v23 = v7;
  uint64_t v8 = *(std::__shared_weak_count **)(*(void *)(*(void *)&v25
                                                + (((unint64_t)(v27 + v26 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
  if (*((void *)&v7 + 1))
  {
    uint64_t v9 = (unint64_t *)(*((void *)&v7 + 1) + 8LL);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  float v11 = *(double *)(v7 + 8) * 1000.0;
  float v12 = sub_100FADFE8(v11, 101320.0);
  if (a3 != 1.79769313e308)
  {
    double v13 = v12;
    double bias = self->_bias;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    double v15 = bias + v13;
    double v16 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
      *(_DWORD *)buf = 136316418;
      double v41 = "takeMaxForPhone";
      __int16 v42 = 1024;
      BOOL v43 = v4;
      __int16 v44 = 2080;
      uint64_t v45 = "bayesianInferenceResult";
      __int16 v46 = 2048;
      double v47 = biasUncertaintyAtRebase;
      __int16 v48 = 2080;
      float v49 = "diffOfAbsSigElevationAndAbsAltitude";
      __int16 v50 = 2048;
      double v51 = vabdd_f64(a3, v15);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "re-initialize bias uncertainty with,%s,%d,%s,%f,%s,%f",  buf,  0x3Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v21 = self->_biasUncertaintyAtRebase;
      int v28 = 136316418;
      BOOL v29 = "takeMaxForPhone";
      __int16 v30 = 1024;
      BOOL v31 = v4;
      __int16 v32 = 2080;
      double v33 = "bayesianInferenceResult";
      __int16 v34 = 2048;
      double v35 = v21;
      __int16 v36 = 2080;
      uint64_t v37 = "diffOfAbsSigElevationAndAbsAltitude";
      __int16 v38 = 2048;
      double v39 = vabdd_f64(a3, v15);
      int v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "re-initialize bias uncertainty with,%s,%d,%s,%f,%s,%f",  (const char *)&v28,  58,  (const char *)v23,  *((double *)&v23 + 1),  v24,  v25);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]",  "%s\n",  v22);
    }

    double v18 = vabdd_f64(a3, v15);
    if (v4)
    {
    }

    else
    {
      double v18 = v18 + self->_biasUncertaintyAtRebase;
    }

    self->_double biasUncertaintyAtRebase = v18;
  }

  if (v8)
  {
    p_int shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  sub_10049108C(&v24);
}

- (void)rebaseSignificantElevationWithEndTime:(double)a3
{
  if ((-[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit") & 1) == 0
    && -[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v12))
  {
    float v5 = v12;
    float v6 = sub_100FADFE8(v5, 101320.0);
    sub_1005FD238( (uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_,  self->_bias + v6,  self->_bias,  v7,  v8);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v18 = "endTrackTime";
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "significant elevation rebase: %s,%f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      int v13 = 136315394;
      double v14 = "endTrackTime";
      __int16 v15 = 2048;
      double v16 = a3;
      LODWORD(v11) = 22;
      unint64_t v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "significant elevation rebase: %s,%f",  (const char *)&v13,  v11);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]",  "%s\n",  v10);
    }
  }

- (BOOL)getLastPressureSample:(double *)a3
{
  uint64_t v4 = v14;
  if (v14)
  {
    uint64_t v6 = *v5;
    double v7 = (std::__shared_weak_count *)v5[1];
    if (v7)
    {
      p_int shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      *a3 = *(double *)(v6 + 8) * 1000.0;
      do
        unint64_t v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    else
    {
      *a3 = *(double *)(v6 + 8) * 1000.0;
    }
  }

  sub_10049108C(v12);
  return v4 != 0;
}

- (void)updateLoiInfo:(const void *)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    uint64_t v6 = *(char **)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (v7 == *(void *)a3)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v18 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v29 = Current;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "receive visit in bias estimator with no loi,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        int v22 = 134217984;
        CFAbsoluteTime v23 = Current;
        __int16 v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "receive visit in bias estimator with no loi,timestamp,%f",  COERCE_DOUBLE(&v22));
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v19);
      }
    }

    else
    {
      if (self->_enableLoiRebase && &self->_loiVisitAltitudes != a3)
      {
        sub_10009B244((char *)&self->_loiVisitAltitudes, v6, v7, (v7 - *(void *)a3) >> 4);
        uint64_t v6 = *(char **)a3;
        uint64_t v7 = *((void *)a3 + 1);
      }

      if ((char *)v7 != v6)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = 0LL;
        uint64_t v21 = 134218496LL;
        do
        {
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          unint64_t v10 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
          {
            double v11 = (uint64_t *)(*(void *)a3 + v8);
            uint64_t v13 = *v11;
            uint64_t v12 = v11[1];
            *(_DWORD *)buf = v21;
            CFAbsoluteTime v29 = Current;
            __int16 v30 = 2048;
            uint64_t v31 = v13;
            __int16 v32 = 2048;
            uint64_t v33 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "receive visit loi in bias estimator,timestamp,%f,loiAltitude,%f,loiVerticalVariance,%f",  buf,  0x20u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183BC80);
            }
            uint64_t v14 = (uint64_t *)(*(void *)a3 + v8);
            uint64_t v16 = *v14;
            uint64_t v15 = v14[1];
            int v22 = v21;
            CFAbsoluteTime v23 = Current;
            __int16 v24 = 2048;
            uint64_t v25 = v16;
            __int16 v26 = 2048;
            uint64_t v27 = v15;
            LODWORD(v20) = 32;
            double v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "receive visit loi in bias estimator,timestamp,%f,loiAltitude,%f,loiVerticalVariance,%f",  COERCE_DOUBLE(&v22),  v20,  *(double *)&v21);
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v17);
          }

          ++v9;
          v8 += 16LL;
        }

        while (v9 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
      }
    }
  }

- (void)sendVisitExitWifiImprovementAnalyticsEventWithDuration:(double)a3 uncertaintyAtVisitEntry:(double)a4 uncertaintyAtVisitExit:(double)a5 timeDiffBtwArrivalAndLastRebase:(double)a6
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183BC80);
  }
  unint64_t v10 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    double v30 = a3;
    __int16 v31 = 2048;
    double v32 = a4;
    __int16 v33 = 2048;
    double v34 = a5;
    __int16 v35 = 2048;
    double v36 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "sent visit exit information to CoreAnalytics,visitDuration,%f,arrivalUncertainty,%f,exitUncertainty,%f,timeDiffBtw ArrivalAndLastRebase,%f",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    int v21 = 134218752;
    double v22 = a3;
    __int16 v23 = 2048;
    double v24 = a4;
    __int16 v25 = 2048;
    double v26 = a5;
    __int16 v27 = 2048;
    double v28 = a6;
    LODWORD(v12) = 42;
    double v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "sent visit exit information to CoreAnalytics,visitDuration,%f,arrivalUncertainty,%f,exitUncertainty, %f,timeDiffBtwArrivalAndLastRebase,%f",  COERCE_DOUBLE(&v21),  v12,  *(double *)&v13,  *(double *)&v14);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEnt ry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:]",  "%s\n",  v11);
  }

  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10048D8F0;
  uint64_t v16 = &unk_10183BBF8;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;
  double v20 = a6;
  AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.VisitExitWifiZImprovement", &v13);
}

- (void)updateVisitState:(BOOL)a3 arrivalTime:(double)a4 departureTime:(double)a5
{
  BOOL v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus") != v7)
  {
    meanSeaLevelPressureEstimator = self->_meanSeaLevelPressureEstimator;
    if (v7)
    {
      -[CLMeanSeaLevelPressureEstimator setCumulativeStartTime:]( meanSeaLevelPressureEstimator,  "setCumulativeStartTime:",  1.79769313e308);
    }

    else
    {
      -[CLMeanSeaLevelPressureEstimator setFirstRefreshAfterVisit:]( meanSeaLevelPressureEstimator,  "setFirstRefreshAfterVisit:",  1LL);
      -[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp]( self->_meanSeaLevelPressureEstimator,  "resetInVisitRebasedMslp");
      -[CLMeanSeaLevelPressureEstimator setExitVisitTimestamp:]( self->_meanSeaLevelPressureEstimator,  "setExitVisitTimestamp:",  a5);
      self->_loiVisitAltitudes.__end_ = self->_loiVisitAltitudes.__begin_;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v11 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureEstimator exitVisitTimestamp]( self->_meanSeaLevelPressureEstimator,  "exitVisitTimestamp");
        *(_DWORD *)buf = 134217984;
        *(void *)uint64_t v45 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "received exit visit,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        uint64_t v38 = qword_1019346A8;
        -[CLMeanSeaLevelPressureEstimator exitVisitTimestamp]( self->_meanSeaLevelPressureEstimator,  "exitVisitTimestamp");
        int v42 = 134217984;
        *(void *)BOOL v43 = v39;
        __int128 v40 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v38,  0LL,  "received exit visit,timestamp,%f",  COERCE_DOUBLE(&v42));
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]",  "%s\n",  v40);
      }
    }

    -[CLMeanSeaLevelPressureEstimator setInVisitStatus:](self->_meanSeaLevelPressureEstimator, "setInVisitStatus:", v7);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v13 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)uint64_t v45 = v7;
      *(_WORD *)&v45[4] = 2048;
      *(CFAbsoluteTime *)&v45[6] = Current;
      *(_WORD *)&v45[14] = 2048;
      *(double *)&v45[16] = a4;
      *(_WORD *)&v45[24] = 2048;
      *(double *)&v45[26] = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "visit state changed,visitState,%d,timestamp,%f,arrival,%f,departure,%f",  buf,  0x26u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      *(_WORD *)&v43[4] = 2048;
      *(CFAbsoluteTime *)&v43[6] = Current;
      *(_WORD *)&v43[14] = 2048;
      *(double *)&v43[16] = a4;
      *(_WORD *)&v43[24] = 2048;
      *(double *)&v43[26] = a5;
      LODWORD(v41) = 38;
      __int16 v35 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "visit state changed,visitState,%d,timestamp,%f,arrival,%f,departure,%f",  &v42,  v41,  COERCE_DOUBLE(__PAIR64__(v7, 67109888)),  *(double *)&v43[4]);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]",  "%s\n",  v35);
    }

    -[CLMeanSeaLevelPressureEstimator saveInVisitStateToPlist]( self->_meanSeaLevelPressureEstimator,  "saveInVisitStateToPlist");
  }

  id v14 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude](self->_delegate, "latestAbsoluteAltitude");
  uint64_t v15 = v14;
  if (v7)
  {
    self->_lastVisitEntryTime = Current;
    if (v14)
    {
      [v14 timestamp];
      if (v16 != 1.79769313e308 && self->_lastRebaseTimestamp != 1.79769313e308)
      {
        [v15 accuracy];
        self->_double uncertaintyAtVisitEntry = v17;
        self->_double timeDiffBtwVisitEntryAndLastRebase = Current - self->_lastRebaseTimestamp;
        self->_double visitArrivalTimestamp = Current;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v18 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          double uncertaintyAtVisitEntry = self->_uncertaintyAtVisitEntry;
          double timeDiffBtwVisitEntryAndLastRebase = self->_timeDiffBtwVisitEntryAndLastRebase;
          double visitArrivalTimestamp = self->_visitArrivalTimestamp;
          *(_DWORD *)buf = 134218496;
          *(double *)uint64_t v45 = uncertaintyAtVisitEntry;
          *(_WORD *)&v45[8] = 2048;
          *(double *)&v45[10] = visitArrivalTimestamp;
          *(_WORD *)&v45[18] = 2048;
          *(double *)&v45[20] = timeDiffBtwVisitEntryAndLastRebase;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "record coreAnalytics event data,uncertaintyAtVisitEntry,%f,visitArrivalTimestamp,%f,timeDiffBtwVisitEntryAndLastRebase,%f",  buf,  0x20u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          double v22 = self->_uncertaintyAtVisitEntry;
          double v24 = self->_timeDiffBtwVisitEntryAndLastRebase;
          double v23 = self->_visitArrivalTimestamp;
          int v42 = 134218496;
          *(double *)BOOL v43 = v22;
          *(_WORD *)&v43[8] = 2048;
          *(double *)&v43[10] = v23;
          *(_WORD *)&v43[18] = 2048;
          *(double *)&v43[20] = v24;
          LODWORD(v41) = 32;
          __int16 v25 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "record coreAnalytics event data,uncertaintyAtVisitEntry,%f,visitArrivalTimestamp,%f,timeDiffBt wVisitEntryAndLastRebase,%f",  COERCE_DOUBLE(&v42),  v41);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]",  "%s\n",  v25);
        }
      }
    }
  }

  else
  {
    if (!v14
      || ([v14 timestamp], v26 == 1.79769313e308)
      || (double v27 = self->_visitArrivalTimestamp, v27 == 1.79769313e308))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      __int16 v31 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        double v32 = self->_visitArrivalTimestamp;
        *(_DWORD *)buf = 134217984;
        *(double *)uint64_t v45 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "fail to send visit exit event to CA,visitArrivalTimestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        double v36 = self->_visitArrivalTimestamp;
        int v42 = 134217984;
        *(double *)BOOL v43 = v36;
        uint64_t v37 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "fail to send visit exit event to CA,visitArrivalTimestamp,%f",  COERCE_DOUBLE(&v42));
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]",  "%s\n",  v37);
      }
    }

    else
    {
      double v28 = Current - v27;
      if (Current - v27 >= 0.0)
      {
        double v33 = self->_uncertaintyAtVisitEntry;
        [v15 accuracy];
        -[CLBarometerCalibrationBiasEstimator sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:]( self,  "sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiff BtwArrivalAndLastRebase:",  v28 / 60.0,  v33,  v34,  self->_timeDiffBtwVisitEntryAndLastRebase / 60.0);
      }

      else
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183BC80);
        }
        CFAbsoluteTime v29 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "visit exit timestamp is earlier than visit entry timestamp.",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183BC80);
          }
          LOWORD(v42) = 0;
          LODWORD(v41) = 2;
          double v30 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "visit exit timestamp is earlier than visit entry timestamp.",  &v42,  *(void *)&v41);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]",  "%s\n",  v30);
        }
      }

      if (a4 > 0.0) {
        -[CLBarometerCalibrationBiasEstimator sendVisitExitAnalyticsWithDuration:andRebaseEvent:andUncertaintyAtEntry:]( self,  "sendVisitExitAnalyticsWithDuration:andRebaseEvent:andUncertaintyAtEntry:",  &self->_firstRebaseEventInVisit,  (a5 - a4) / 60.0,  self->_uncertaintyAtVisitEntry);
      }
    }

    self->_double visitArrivalTimestamp = 1.79769313e308;
  }

- (void)sendRebaseAnalyticsWithAltitudeError:(double)a3 andUncertainty:(double)a4 andRefUncertainty:(double)a5 andDemAvailable:(BOOL)a6 andWorkout:(BOOL)a7 andReferenceSource:(int)a8 andCorrection:(double)a9 andDistance:(double)a10
{
  float v18 = a3;
  float v19 = fabsf(v18);
  uint64_t v71 = 0LL;
  uint64_t v72 = 0LL;
  BOOL v70 = 0LL;
  sub_10001B72C(&v70, (const void *)qword_101995C88, qword_101995C90, (qword_101995C90 - qword_101995C88) >> 2);
  sub_1001B4760((uint64_t)&v70, &v73, v19);
  if (v70)
  {
    uint64_t v71 = v70;
    operator delete(v70);
  }

  NormalDistribution v67 = 0LL;
  uint64_t v68 = 0LL;
  double v66 = 0LL;
  sub_10001B72C(&v66, (const void *)qword_101995C70, qword_101995C78, (qword_101995C78 - qword_101995C70) >> 2);
  float v20 = a5;
  sub_1001B4760((uint64_t)&v66, &v69, v20);
  if (v66)
  {
    NormalDistribution v67 = v66;
    operator delete(v66);
  }

  uint64_t v64 = 0LL;
  __p = 0LL;
  NormalDistribution v63 = 0LL;
  sub_10001B72C(&__p, (const void *)qword_101995C70, qword_101995C78, (qword_101995C78 - qword_101995C70) >> 2);
  float v21 = a4;
  sub_1001B4760((uint64_t)&__p, &v65, v21);
  if (__p)
  {
    NormalDistribution v63 = __p;
    operator delete(__p);
  }

  uint64_t v60 = 0LL;
  __int128 v58 = 0LL;
  __int128 v59 = 0LL;
  sub_10001B72C(&v58, (const void *)qword_101995C88, qword_101995C90, (qword_101995C90 - qword_101995C88) >> 2);
  float v22 = a9;
  sub_1001B4760((uint64_t)&v58, &v61, fabsf(v22));
  if (v58)
  {
    __int128 v59 = v58;
    operator delete(v58);
  }

  if (self->_previousBiasTimestamp == 1.79769313e308)
  {
    float v23 = CFAbsoluteTimeGetCurrent() - self->_locationdStartTime;
    float v24 = fabsf(v23);
  }

  else
  {
    float v24 = -1.0;
  }

  uint64_t v56 = 0LL;
  double v54 = 0LL;
  double v55 = 0LL;
  sub_10001B72C(&v54, (const void *)qword_101995CA0, qword_101995CA8, (qword_101995CA8 - qword_101995CA0) >> 2);
  sub_1001B4760((uint64_t)&v54, &__src, v24);
  if (v54)
  {
    double v55 = v54;
    operator delete(v54);
  }

  float v25 = -1.0;
  if (self->_previousBiasTimestamp != 1.79769313e308)
  {
    float v26 = CFAbsoluteTimeGetCurrent() - self->_previousBiasTimestamp;
    float v25 = fabsf(v26);
  }

  uint64_t v52 = 0LL;
  __int16 v50 = 0LL;
  double v51 = 0LL;
  sub_10001B72C(&v50, (const void *)qword_101995CB8, qword_101995CC0, (qword_101995CC0 - qword_101995CB8) >> 2);
  sub_1001B4760((uint64_t)&v50, &v53, v25);
  if (v50)
  {
    double v51 = v50;
    operator delete(v50);
  }

  if (self->_lastVisitEntryTime == 1.79769313e308) {
    float v27 = -1.0;
  }
  else {
    float v27 = vabdd_f64(CFAbsoluteTimeGetCurrent(), self->_lastVisitEntryTime) / 60.0;
  }
  uint64_t v48 = 0LL;
  __int16 v46 = 0LL;
  double v47 = 0LL;
  sub_10001B72C(&v46, (const void *)qword_101995CD0, qword_101995CD8, (qword_101995CD8 - qword_101995CD0) >> 2);
  sub_1001B4760((uint64_t)&v46, &v49, v27);
  if (v46)
  {
    double v47 = v46;
    operator delete(v46);
  }

  BOOL v43 = 0LL;
  uint64_t v44 = 0LL;
  int v42 = 0LL;
  sub_10001B72C(&v42, (const void *)qword_101995CE8, qword_101995CF0, (qword_101995CF0 - qword_101995CE8) >> 2);
  float v28 = a10;
  sub_1001B4760((uint64_t)&v42, &v45, v28);
  if (v42)
  {
    BOOL v43 = v42;
    operator delete(v42);
  }

  *(float32x2_t *)&__int128 v32 = vcvt_f32_f64((float64x2_t)self->_biasLocation);
  BYTE8(v32) = -[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit");
  BYTE9(v32) = a6;
  BOOL v29 = self->_lastForcedGpsTime != 1.79769313e308 && CFAbsoluteTimeGetCurrent() - self->_lastForcedGpsTime < 546.0;
  BYTE10(v32) = v29;
  HIDWORD(v32) = a8;
  LOBYTE(v33) = a7;
  HIBYTE(v33) = self->_previousBiasTimestamp == 1.79769313e308;
  else {
    std::string v34 = v73;
  }
  else {
    std::string v35 = __src;
  }
  else {
    std::string v36 = v69;
  }
  else {
    std::string v37 = v65;
  }
  else {
    std::string v38 = v49;
  }
  else {
    std::string v39 = v53;
  }
  else {
    std::string v40 = v61;
  }
  else {
    std::string v41 = v45;
  }
  if (self->_lastVisitEntryTime != 1.79769313e308)
  {
    *(_OWORD *)&self->_firstRebaseEventInVisit.double latitude = v32;
    *(_WORD *)&self->_firstRebaseEventInVisit.inOutdoorWorkout = v33;
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned, &v34);
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.var0, &v35);
    std::string::operator=((std::string *)&self->_anon_160[8], &v36);
    std::string::operator=((std::string *)&self->_anon_160[32], &v37);
    std::string::operator=((std::string *)&self->_anon_160[56], &v38);
    std::string::operator=((std::string *)&self->_anon_160[80], &v39);
    std::string::operator=((std::string *)&self->_anon_160[104], &v40);
    std::string::operator=((std::string *)&self->_anon_160[128], &v41);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3321888768LL;
  v30[2] = sub_10048EB94;
  v30[3] = &unk_10183BC20;
  sub_10049006C((uint64_t)v31, &v32);
  v30[4] = self;
  AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.Rebase_Test", v30);
  self->_previousBiasTimestamp = self->_biasTimestamp;
  self->_lastVisitEntryTime = 1.79769313e308;
  self->_distanceSinceLastRebase = -1.0;
  sub_1004902E8((uint64_t)v31);
  sub_1004902E8((uint64_t)&v32);
}

- (void)sendVisitExitAnalyticsWithDuration:(double)a3 andRebaseEvent:(void *)a4 andUncertaintyAtEntry:(double)a5
{
  float v7 = a3;
  uint64_t v56 = 0LL;
  uint64_t v57 = 0LL;
  double v55 = 0LL;
  sub_10001B72C(&v55, (const void *)qword_101995D00, qword_101995D08, (qword_101995D08 - qword_101995D00) >> 2);
  sub_1001B4760((uint64_t)&v55, &v58, v7);
  if (v55)
  {
    uint64_t v56 = v55;
    operator delete(v55);
  }

  double v51 = 0LL;
  uint64_t v52 = 0LL;
  __int16 v50 = 0LL;
  sub_10001B72C(&v50, (const void *)qword_101995C70, qword_101995C78, (qword_101995C78 - qword_101995C70) >> 2);
  float v8 = a5;
  sub_1001B4760((uint64_t)&v50, &v53, v8);
  if (v50)
  {
    double v51 = v50;
    operator delete(v50);
  }

  int rebaseSource = self->_firstRebaseEventInVisit.rebaseSource;
  if (SHIBYTE(v54) < 0)
  {
    sub_1010DD48C(&v36, (void *)v53, *((unint64_t *)&v53 + 1));
  }

  else
  {
    __int128 v36 = v53;
    uint64_t v37 = v54;
  }

  if ((char)self->_anon_160[55] < 0)
  {
    sub_1010DD48C(&v38, *(void **)&self->_anon_160[32], *(void *)&self->_anon_160[40]);
  }

  else
  {
    __int128 v38 = *(_OWORD *)&self->_anon_160[32];
    uint64_t v39 = *(void *)&self->_anon_160[48];
  }

  if (SHIBYTE(v59) < 0)
  {
    sub_1010DD48C(&v40, (void *)v58, *((unint64_t *)&v58 + 1));
  }

  else
  {
    __int128 v40 = v58;
    uint64_t v41 = v59;
  }

  if ((char)self->_anon_160[79] < 0)
  {
    sub_1010DD48C(&v42, *(void **)&self->_anon_160[56], *(void *)&self->_anon_160[64]);
  }

  else
  {
    __int128 v42 = *(_OWORD *)&self->_anon_160[56];
    uint64_t v43 = *(void *)&self->_anon_160[72];
  }

  if (*((char *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1010DD48C( &v44,  self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__data_,  self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__size_);
  }

  else
  {
    __int128 v44 = *(_OWORD *)self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var0.__data_;
    uint64_t v45 = *((void *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 2);
  }

  if ((char)self->_anon_160[31] < 0)
  {
    sub_1010DD48C(&v46, *(void **)&self->_anon_160[8], *(void *)&self->_anon_160[16]);
  }

  else
  {
    __int128 v46 = *(_OWORD *)&self->_anon_160[8];
    uint64_t v47 = *(void *)&self->_anon_160[24];
  }

  if ((char)self->_anon_160[127] < 0)
  {
    sub_1010DD48C(&v48, *(void **)&self->_anon_160[104], *(void *)&self->_anon_160[112]);
  }

  else
  {
    __int128 v48 = *(_OWORD *)&self->_anon_160[104];
    uint64_t v49 = *(void *)&self->_anon_160[120];
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3321888768LL;
  v19[2] = sub_10048F4A4;
  v19[3] = &unk_10183BC50;
  sub_100490388((uint64_t)&v20, (uint64_t)&rebaseSource);
  AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.VisitExit", v19);
  *(_DWORD *)((char *)&v9 + 7) = 0;
  *(void *)&__int128 v9 = 0LL;
  HIDWORD(v9) = -10;
  __int16 v10 = 0;
  sub_1010DDBC0(v11, "NULL");
  sub_1010DDBC0(v12, "NULL");
  sub_1010DDBC0(v13, "NULL");
  sub_1010DDBC0(v14, "NULL");
  sub_1010DDBC0(v15, "NULL");
  sub_1010DDBC0(v16, "NULL");
  sub_1010DDBC0(v17, "NULL");
  sub_1010DDBC0(v18, "NULL");
  sub_10048F65C((uint64_t)&self->_firstRebaseEventInVisit, &v9);
  sub_1004902E8((uint64_t)&v9);
  if (v34 < 0) {
    operator delete(__p);
  }
  if (v32 < 0) {
    operator delete(v31);
  }
  if (v30 < 0) {
    operator delete(v29);
  }
  if (v28 < 0) {
    operator delete(v27);
  }
  if (v26 < 0) {
    operator delete(v25);
  }
  if (v24 < 0) {
    operator delete(v23);
  }
  if (v22 < 0) {
    operator delete(v21);
  }
  if (SHIBYTE(v49) < 0) {
    operator delete((void *)v48);
  }
  if (SHIBYTE(v47) < 0) {
    operator delete((void *)v46);
  }
  if (SHIBYTE(v45) < 0) {
    operator delete((void *)v44);
  }
  if (SHIBYTE(v43) < 0) {
    operator delete((void *)v42);
  }
  if (SHIBYTE(v41) < 0) {
    operator delete((void *)v40);
  }
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)v38);
  }
  if (SHIBYTE(v37) < 0) {
    operator delete((void *)v36);
  }
  if (SHIBYTE(v54) < 0) {
    operator delete((void *)v53);
  }
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
}

- (void)announceMostRecentForcedGPS:(double)a3
{
  self->_lastForcedGpsTime = a3;
}

- (void)saveBiasInfo
{
  if (self->_biasTimestamp != 1.79769313e308)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
    double v28 = v3;
    double v6 = sub_1005FD1F8((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v3, v4, v5);
    if (v6 == 1.79769313e308) {
      double v6 = -800.0;
    }
    double v27 = v6;
    uint64_t v7 = sub_1002F8DDC();
    sub_1002AC7B8(v7, "CLBarometerCalibration_Timestamp", &Current);
    uint64_t v8 = sub_1002F8DDC();
    p_double bias = &self->_bias;
    sub_1002AC7B8(v8, "CLBarometerCalibratio_Bias", &self->_bias);
    uint64_t v10 = sub_1002F8DDC();
    sub_1002AC7B8(v10, "CLBarometerCalibration_Uncertainty", &v28);
    uint64_t v11 = sub_1002F8DDC();
    p_double weatherEstimateInMeter = &self->_weatherEstimateInMeter;
    sub_1002AC7B8(v11, "CLBarometerCalibration_Weather", &self->_weatherEstimateInMeter);
    uint64_t v13 = sub_1002F8DDC();
    sub_1002AC7B8(v13, "CLBarometerCalibration_SignificantElevation", &v27);
    uint64_t v14 = sub_1002F8DDC();
    p_float biasPressure = &self->_biasPressure;
    sub_1002AC7B8(v14, "CLBarometerCalibration_BiasPressure", &self->_biasPressure);
    uint64_t v16 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v16 + 944LL))(v16);
    self->_lastTimestampSavedRecovery = Current;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    double v17 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)p_bias;
      uint64_t v19 = *(void *)p_weatherEstimateInMeter;
      uint64_t v20 = *(void *)p_biasPressure;
      *(_DWORD *)buf = 134219264;
      CFAbsoluteTime v43 = Current;
      __int16 v44 = 2048;
      uint64_t v45 = v18;
      __int16 v46 = 2048;
      double v47 = v28;
      __int16 v48 = 2048;
      uint64_t v49 = v19;
      __int16 v50 = 2048;
      double v51 = v27;
      __int16 v52 = 2048;
      uint64_t v53 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "saving rebase info to cache, timestamp %f, bias, %f, uncertainty, %f, weather estimate, %f, sig elevation, %f, pressure, %f",  buf,  0x3Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      uint64_t v21 = *(void *)p_bias;
      uint64_t v22 = *(void *)p_weatherEstimateInMeter;
      uint64_t v23 = *(void *)p_biasPressure;
      int v30 = 134219264;
      CFAbsoluteTime v31 = Current;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      __int16 v34 = 2048;
      double v35 = v28;
      __int16 v36 = 2048;
      uint64_t v37 = v22;
      __int16 v38 = 2048;
      double v39 = v27;
      __int16 v40 = 2048;
      uint64_t v41 = v23;
      LODWORD(v25) = 62;
      char v24 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "saving rebase info to cache, timestamp %f, bias, %f, uncertainty, %f, weather estimate, %f, sig el evation, %f, pressure, %f",  COERCE_DOUBLE(&v30),  v25,  v26,  v27,  v28,  Current);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationBiasEstimator saveBiasInfo]", "%s\n", v24);
    }
  }

- (void)retrieveBiasInfo
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v25 = 1.79769313e308;
  double v26 = 1.79769313e308;
  double v23 = 0.0;
  *(double *)&uint64_t v24 = 1.79769313e308;
  *(double *)&uint64_t v21 = 101325.0;
  double v22 = -800.0;
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 936LL))(v4);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A82BC(v5, "CLBarometerCalibration_Timestamp", &v26);
  uint64_t v6 = sub_1002F8DDC();
  sub_1002A82BC(v6, "CLBarometerCalibratio_Bias", &v25);
  uint64_t v7 = sub_1002F8DDC();
  sub_1002A82BC(v7, "CLBarometerCalibration_Uncertainty", &v24);
  uint64_t v8 = sub_1002F8DDC();
  sub_1002A82BC(v8, "CLBarometerCalibration_Weather", &v23);
  uint64_t v9 = sub_1002F8DDC();
  sub_1002A82BC(v9, "CLBarometerCalibration_SignificantElevation", &v22);
  uint64_t v10 = sub_1002F8DDC();
  sub_1002A82BC(v10, "CLBarometerCalibration_BiasPressure", &v21);
  double v11 = v26;
  if (v26 == 1.79769313e308 || Current - v26 >= self->_maxBiasAgeFromRecovery || (double v12 = v25, v25 == 1.79769313e308))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v19 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "state is too old to be recovered", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      LOWORD(v27) = 0;
      uint64_t v18 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "state is too old to be recovered");
      goto LABEL_23;
    }
  }

  else
  {
    self->_double biasTimestamp = v26;
    double v13 = *(double *)&v21;
    self->_double bias = v12;
    self->_double biasPressure = v13;
    double v14 = *(double *)&v24;
    self->_double biasUncertaintyTimestamp = v11;
    self->_double biasUncertaintyAtRebase = v14;
    self->_double biasUncertainty = v14;
    sub_1005FE330((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v23);
    if (v22 != -800.0) {
      sub_1005FE33C((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v22);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183BC80);
    }
    uint64_t v15 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double biasPressure = self->_biasPressure;
      *(_DWORD *)buf = 134219264;
      double v40 = v26;
      __int16 v41 = 2048;
      double v42 = v25;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2048;
      double v46 = v23;
      __int16 v47 = 2048;
      double v48 = v22;
      __int16 v49 = 2048;
      double v50 = biasPressure;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "recovering from locationd crash, timestamp %f, bias, %f, uncertainty, %f, weather, %f, sig elev, %f, pressure, %f",  buf,  0x3Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183BC80);
      }
      double v17 = self->_biasPressure;
      int v27 = 134219264;
      double v28 = v26;
      __int16 v29 = 2048;
      double v30 = v25;
      __int16 v31 = 2048;
      uint64_t v32 = v24;
      __int16 v33 = 2048;
      double v34 = v23;
      __int16 v35 = 2048;
      double v36 = v22;
      __int16 v37 = 2048;
      double v38 = v17;
      uint64_t v18 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "recovering from locationd crash, timestamp %f, bias, %f, uncertainty, %f, weather, %f, sig e lev, %f, pressure, %f");
LABEL_23:
      uint64_t v20 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationBiasEstimator retrieveBiasInfo]", "%s\n", v18);
      if (v20 != buf) {
        free(v20);
      }
    }
  }

- (BOOL)isIHAAuthorized
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___MCProfileConnection);
  if (v2) {
    LOBYTE(v2) = objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection"),  "isHealthDataSubmissionAllowed");
  }
  return v2;
}

- (void).cxx_destruct
{
  begin = self->_loiVisitAltitudes.__begin_;
  if (begin)
  {
    self->_loiVisitAltitudes.__end_ = begin;
    operator delete(begin);
  }

  value = self->_fSignificantElevationEstimatorRebase.__ptr_.__value_;
  p_fSignificantElevationEstimatorRebase = &self->_fSignificantElevationEstimatorRebase;
  uint64_t v4 = (void **)value;
  p_fSignificantElevationEstimatorRebase->__ptr_.__value_ = 0LL;
  if (value) {
    sub_1004907D8((int)p_fSignificantElevationEstimatorRebase, v4);
  }
}

- (id).cxx_construct
{
  self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ = 0LL;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_loiVisitAltitudes.__end_ = 0LL;
  self->_loiVisitAltitudes.__end_cap_.__value_ = 0LL;
  self->_loiVisitAltitudes.__begin_ = 0LL;
  sub_10049063C((uint64_t)&self->_firstRebaseEventInVisit);
  return self;
}

@end