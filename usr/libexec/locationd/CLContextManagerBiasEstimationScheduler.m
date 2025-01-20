@interface CLContextManagerBiasEstimationScheduler
- (BOOL)isRefDataAvailableBetweenStartTime:(double)a3 andEndTime:(double)a4;
- (BOOL)shouldStartNewTrack:(unint64_t)a3;
- (CLContextManagerBiasEstimationScheduler)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (double)getTrackLengthSecondsForSource:(unint64_t)a3;
- (id).cxx_construct;
- (uint64_t)stepCountElevationNotification:(uint64_t)a3;
- (void)dealloc;
- (void)sendTrackAndScheduleNextTick:(double)a3;
- (void)sourceUpdated:(unint64_t)currentSource;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLContextManagerBiasEstimationScheduler

- (CLContextManagerBiasEstimationScheduler)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLContextManagerBiasEstimationScheduler;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v15,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    v6->_currentTrack = 0LL;
    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:]( v6->super._sourceAggregator,  "enableSources:forContext:",  &off_1018D7198,  v6);
    v14[0] = 180;
    sub_10023AE2C(buf, "BarometerCalibrationBiasEstimationTrackPeriod", v14, 0);
    double v8 = (double)*(int *)&buf[4];
    v7->_biasEstimationTrackPeriodSeconds = (double)*(int *)&buf[4];
    v7->_double biasEstimationTrackDataBufferSizeSeconds = v8 + v8;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187AED8);
    }
    v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Bias Scheduler Context created", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      LOWORD(v14[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "Bias Scheduler Context created",  v14,  2);
      v13 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerBiasEstimationScheduler initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    v7->_waitPeriodSeconds = -1.0;
    v7->_currentSource = 10LL;
    double biasEstimationTrackDataBufferSizeSeconds = v7->_biasEstimationTrackDataBufferSizeSeconds;
    *(void *)buf = 0LL;
    *(double *)&buf[8] = biasEstimationTrackDataBufferSizeSeconds;
    sub_100C87330((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    *(_OWORD *)buf = xmmword_101358790;
    sub_100C87330((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    v7->_lastWetStateTimestamp = 1.79769313e308;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLContextManagerBiasEstimationScheduler;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (double)getTrackLengthSecondsForSource:(unint64_t)a3
{
  unint64_t v4 = a3;
  v5 = &v4;
  return *((double *)sub_100595AA4( (uint64_t **)&self->_trackLengthSecondsForSource,  &v4,  (uint64_t)&unk_1012CF090,  (uint64_t **)&v5)
         + 5);
}

- (BOOL)shouldStartNewTrack:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)sourceUpdated:(unint64_t)currentSource
{
  if (-[CLContextManagerBiasEstimationScheduler shouldStartNewTrack:](self, "shouldStartNewTrack:"))
  {
    self->_currentSource = currentSource;
    if (!self->_currentTrack)
    {
      if (currentSource >= 0xA) {
        sub_10000C918("array::at");
      }
      v5 = (char *)self->super.fDataBuffers + 48 * currentSource;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      v7 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v18 = v6;
        __int16 v19 = 1024;
        int v20 = currentSource;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "New reference data, starting track, TrackStartTime %f, reference type %d",  buf,  0x12u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10187AED8);
        }
        int v13 = 134218240;
        double v14 = v6;
        __int16 v15 = 1024;
        int v16 = currentSource;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "New reference data, starting track, TrackStartTime %f, reference type %d",  COERCE_DOUBLE(&v13),  18);
        v12 = (uint8_t *)v11;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerBiasEstimationScheduler sourceUpdated:]", "%s\n", v11);
        if (v12 != buf) {
          free(v12);
        }
      }

      -[CLBarometerCalibrationSourceAggregator enableSources:forContext:]( self->super._sourceAggregator,  "enableSources:forContext:",  &off_1018D71B0,  self);
      double v8 = -[CLBarometerCalibrationTrack initWithContextType:forNotification:startTime:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationTrack),  "initWithContextType:forNotification:startTime:",  6LL,  2LL,  v6);
      self->_currentTrack = v8;
      -[CLBarometerCalibrationTrack fStartTime](v8, "fStartTime");
      self->_lastTrackEndTime = v9 + -0.1;
      currentSource = self->_currentSource;
    }

    -[CLContextManagerBiasEstimationScheduler getTrackLengthSecondsForSource:]( self,  "getTrackLengthSecondsForSource:",  currentSource);
    self->_waitPeriodSeconds = v10;
  }

- (uint64_t)stepCountElevationNotification:(uint64_t)a3
{
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    double v6 = *(double *)(a3 + 8);
    [v5 fStartTime];
    double v8 = v6 - v7;
    *(double *)(a1 + 80) = v8;
    double v9 = *(double *)(a1 + 88);
    if (v9 > 0.0 && v8 >= v9) {
      [(id)a1 sendTrackAndScheduleNextTick:*(double *)(a3 + 8)];
    }
  }

  sub_1004908E0((uint64_t)&v19, (void *)(*(void *)(a1 + 24) + 48LL));
  if (v22)
  {
    v12 = *(std::__shared_weak_count **)(*(void *)(v20
                                                   + (((unint64_t)(v22 + v21 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
    if (*((void *)&v11 + 1))
    {
      int v13 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
      do
        unint64_t v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }

    objc_msgSend( *(id *)(a1 + 16),  "updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:",  *(unsigned int *)(a3 + 16),  *(unsigned int *)(a3 + 20),  *(double *)(a3 + 8),  v11,  v11);
    [*(id *)(a1 + 16) updateBiasUncertaintyWithPressure:*(double *)(v18 + 8) * 1000.0 andTime:*(double *)(a3 + 8) andLat:1.79769313e308 andLon:1.79769313e308];
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }

  return sub_10049108C(&v19);
}

- (void)sendTrackAndScheduleNextTick:(double)a3
{
  double lastTrackEndTime = self->_lastTrackEndTime;
  -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
  uint64_t v6 = v5;
  double v7 = self->_lastTrackEndTime;
  -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
  if (-[CLContextManagerBiasEstimationScheduler isRefDataAvailableBetweenStartTime:andEndTime:]( self,  "isRefDataAvailableBetweenStartTime:andEndTime:",  v7,  v8))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187AED8);
    }
    double v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double waitPeriodSeconds = self->_waitPeriodSeconds;
      *(_DWORD *)buf = 136315394;
      *(void *)v43 = "WaitPeriodInSeconds";
      *(_WORD *)&v43[8] = 2048;
      *(double *)&v43[10] = waitPeriodSeconds;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Calibration track wait period,%s %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      double v35 = self->_waitPeriodSeconds;
      *(_DWORD *)v41 = 136315394;
      *(void *)&v41[4] = "WaitPeriodInSeconds";
      *(_WORD *)&v41[12] = 2048;
      *(double *)&v41[14] = v35;
      LODWORD(v40) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Calibration track wait period,%s %f",  v41,  v40);
      v37 = (uint8_t *)v36;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]",  "%s\n",  v36);
      if (v37 != buf) {
        free(v37);
      }
    }

    -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
    double v12 = v11 + self->_waitPeriodSeconds * -50.0 / 100.0;
    -[CLBarometerCalibrationTrack setFNextTrackStartTime:](self->_currentTrack, "setFNextTrackStartTime:", v12);
    double lastWetStateTimestamp = self->_lastWetStateTimestamp;
    -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
    if (lastWetStateTimestamp >= v14
      && (double v15 = self->_lastWetStateTimestamp,
          -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime"),
          v15 <= v16))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      v28 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
        uint64_t v30 = v29;
        -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
        double v31 = self->_lastWetStateTimestamp;
        *(_DWORD *)buf = 134218496;
        *(void *)v43 = v30;
        *(_WORD *)&v43[8] = 2048;
        *(void *)&v43[10] = v32;
        *(_WORD *)&v43[18] = 2048;
        *(double *)&v43[20] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Calibration track with start time %f, end time %f will not be submitted because device was wet at %f",  buf,  0x20u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      uint64_t v38 = qword_1019346A8;
      -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
      -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v38,  0LL,  "Calibration track with start time %f, end time %f will not be submitted because device was wet at %f");
    }

    else
    {
      -[CLBarometerCalibrationContextClient startTrack:](self->super._delegate, "startTrack:", self->_currentTrack);
      -[CLBarometerCalibrationContextClient stopTrack:](self->super._delegate, "stopTrack:", self->_currentTrack);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      v17 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
        uint64_t v19 = v18;
        -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
        uint64_t v21 = v20;
        -[CLBarometerCalibrationTrack fNextTrackStartTime](self->_currentTrack, "fNextTrackStartTime");
        *(_DWORD *)buf = 136316418;
        *(void *)v43 = "startTime";
        *(_WORD *)&v43[8] = 2048;
        *(void *)&v43[10] = v19;
        *(_WORD *)&v43[18] = 2080;
        *(void *)&v43[20] = "endTime";
        *(_WORD *)&v43[28] = 2048;
        *(void *)&v43[30] = v21;
        __int16 v44 = 2080;
        v45 = "nextStartTime";
        __int16 v46 = 2048;
        uint64_t v47 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Calibration track submitted with,%s,%f,%s,%f,%s,%f",  buf,  0x3Eu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      uint64_t v23 = qword_1019346A8;
      -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
      __int16 v25 = v24;
      -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
      -[CLBarometerCalibrationTrack fNextTrackStartTime](self->_currentTrack, "fNextTrackStartTime");
      *(_DWORD *)v41 = 136316418;
      *(void *)&v41[4] = "startTime";
      *(_WORD *)&v41[12] = 2048;
      *(_WORD *)&v41[14] = v25;
      LODWORD(v40) = 62;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  0LL,  "Calibration track submitted with,%s,%f,%s,%f,%s,%f",  v41,  *(void *)&v40,  *(_OWORD *)v41);
    }

    v39 = (uint8_t *)v26;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]",  "%s\n",  v26);
    if (v39 != buf) {
      free(v39);
    }
LABEL_27:
    -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
    self->_double lastTrackEndTime = v33;

    self->_currentTrack = -[CLBarometerCalibrationTrack initWithContextType:forNotification:startTime:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationTrack),  "initWithContextType:forNotification:startTime:",  6LL,  2LL,  v12);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187AED8);
    }
    v34 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)v43 = 0;
      *(_WORD *)&v43[4] = 2082;
      *(void *)&v43[6] = "";
      *(_WORD *)&v43[14] = 2050;
      *(double *)&v43[16] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Starting new track, TrackStartTime_s:%{public}.09f}",  buf,  0x1Cu);
    }

    return;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10187AED8);
  }
  v27 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)v43 = 0;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "";
    *(_WORD *)&v43[14] = 2050;
    *(double *)&v43[16] = lastTrackEndTime;
    *(_WORD *)&v43[24] = 2050;
    *(void *)&v43[26] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:No new data, don't start a new track between, TrackStartTime_s:%{public}.09f, T rackStopTime_s:%{public}.09f}",  buf,  0x26u);
  }

  self->_currentTrack = 0LL;
  self->_double waitPeriodSeconds = -1.0;
  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:]( self->super._sourceAggregator,  "disableSources:forContext:",  &off_1018D71B0,  self);
}

- (BOOL)isRefDataAvailableBetweenStartTime:(double)a3 andEndTime:(double)a4
{
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = [&off_1018D7198 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void *)v33;
  do
  {
    uint64_t v9 = 0LL;
    while (2)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(&off_1018D7198);
      }
      unint64_t v10 = (unint64_t)[*(id *)(*((void *)&v32 + 1) + 8 * v9) integerValue];
      if (v10 >= 0xA) {
        sub_10000C918("array::at");
      }
      sub_1004908E0((uint64_t)&v27, (void *)self->super.fDataBuffers + 6 * v10);
      uint64_t v11 = v28;
      uint64_t v12 = v29;
      int v13 = (void *)(v28 + 8 * (v30 >> 8));
      if (v29 == v28) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = *v13 + 16LL * v30;
      }
      while (1)
      {
        uint64_t v15 = v12 == v11
            ? 0LL
            : *(void *)(v11 + (((v31 + v30) >> 5) & 0x7FFFFFFFFFFFFF8LL)) + 16LL * (v31 + v30);
        if (v14 == v15) {
          break;
        }
        double v16 = *(double **)v14;
        v17 = *(std::__shared_weak_count **)(v14 + 8);
        if (v17)
        {
          p_shared_owners = (unint64_t *)&v17->__shared_owners_;
          do
            unint64_t v19 = __ldxr(p_shared_owners);
          while (__stxr(v19 + 1, p_shared_owners));
          double v20 = *v16;
          BOOL v21 = *v16 >= a3;
          BOOL v22 = v20 < a4 && v21;
          do
            unint64_t v23 = __ldaxr(p_shared_owners);
          while (__stlxr(v23 - 1, p_shared_owners));
          if (v22)
          {
            if (!v23)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }

- (void)wetStateUpdated:(unint64_t)a3
{
  if (a3 == 1)
  {
    self->_double lastWetStateTimestamp = CFAbsoluteTimeGetCurrent();
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187AED8);
    }
    unint64_t v4 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      double lastWetStateTimestamp = self->_lastWetStateTimestamp;
      *(_DWORD *)buf = 134217984;
      double v12 = lastWetStateTimestamp;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "biasEstimationScheduler, lastWetTimestamp updated to %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187AED8);
      }
      double v6 = self->_lastWetStateTimestamp;
      int v9 = 134217984;
      double v10 = v6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "biasEstimationScheduler, lastWetTimestamp updated to %f",  COERCE_DOUBLE(&v9));
      uint64_t v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerBiasEstimationScheduler wetStateUpdated:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 13) = (char *)self + 112;
  return self;
}

@end