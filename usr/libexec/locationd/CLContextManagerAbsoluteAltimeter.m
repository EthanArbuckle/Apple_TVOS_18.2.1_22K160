@interface CLContextManagerAbsoluteAltimeter
- (BOOL)shouldEnableGPSAtTime:(double)a3;
- (BOOL)shouldEnableWifiAtTime:(double)a3;
- (CLContextManagerAbsoluteAltimeter)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (double)capAccuracy:(double)result;
- (id).cxx_construct;
- (void)calculateAndSendAltitudeFromBaro;
- (void)calculateAndSendAltitudeFromCompanion;
- (void)calculateAndSendAltitudeFromLocation;
- (void)chooseUncertaintyDuringWorkout:(double *)a3 withAltitude:(double)a4 atTime:(double)a5;
- (void)dealloc;
- (void)filteredElevation:(double *)a3 absAltUncertainty:(double *)a4 withTimestamp:(double *)a5;
- (void)forceGPSIfUnderground;
- (void)forceLocationAtTime:(double)a3;
- (void)onCompanionConnectionNotification:(int)a3 data:(_BYTE *)a4;
- (void)releasePowerAssertions;
- (void)setTimerForGPSOff;
- (void)setTimerForWifiOff;
- (void)setupTimers;
- (void)sourceUpdated:(unint64_t)a3;
- (void)teardownTimers;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLContextManagerAbsoluteAltimeter

- (CLContextManagerAbsoluteAltimeter)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CLContextManagerAbsoluteAltimeter;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v30,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  if (v6)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Absolute Altimeter Context created", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      LOWORD(v31[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Absolute Altimeter Context created",  v31,  2);
      v23 = (uint8_t *)v22;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v22);
      if (v23 != buf) {
        free(v23);
      }
    }

    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:]( v6->super._sourceAggregator,  "enableSources:forContext:",  &off_1018D6F10,  v6);
    sub_10043AC3C((uint64_t)sub_100A8D598, (uint64_t)v6, v6->super._universe, buf);
    v8 = *(Client **)buf;
    *(void *)buf = 0LL;
    value = v6->_locationControllerClient.__ptr_.__value_;
    v6->_locationControllerClient.__ptr_.__value_ = v8;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      v10 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v10) {
        (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
      }
    }

    v6->_lastForcedWifiTime = 1.79769313e308;
    v6->_lastForcedGPSTime = 1.79769313e308;
    v6->_lastAltitudeSentTimestamp = 1.79769313e308;
    v6->_lastDefaultLevelLogTimestamp = 1.79769313e308;
    v6->_currentWetState = 0LL;
    v6->_currentStatusInfo = 1LL;
    v11 = (CLPowerAssertion *)operator new(0x30uLL);
    sub_100AD558C((uint64_t)v11, (uint64_t)"AbsoluteAltimetryWifi", (uint64_t)v6, 10.0);
    v12 = v6->_powerAssertionWifi.__ptr_.__value_;
    v6->_powerAssertionWifi.__ptr_.__value_ = v11;
    if (v12) {
      (*(void (**)(CLPowerAssertion *))(*(void *)v12 + 8LL))(v12);
    }
    v13 = (CLPowerAssertion *)operator new(0x30uLL);
    sub_100AD558C((uint64_t)v13, (uint64_t)"AbsoluteAltimetryGPS", (uint64_t)v6, 30.0);
    v14 = v6->_powerAssertionGPS.__ptr_.__value_;
    v6->_powerAssertionGPS.__ptr_.__value_ = v13;
    if (v14) {
      (*(void (**)(CLPowerAssertion *))(*(void *)v14 + 8LL))(v14);
    }
    -[CLContextManagerAbsoluteAltimeter setupTimers](v6, "setupTimers");
    sub_1003A09BC((uint64_t)sub_100A8D6BC, (uint64_t)v6, v6->super._universe, buf);
    v15 = *(Client **)buf;
    *(void *)buf = 0LL;
    v16 = v6->fCompanionClient.__ptr_.__value_;
    v6->fCompanionClient.__ptr_.__value_ = v15;
    if (v16)
    {
      (*(void (**)(Client *))(*(void *)v16 + 8LL))(v16);
      v17 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v17) {
        (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
      }
    }

    sub_1004F2598();
    if (sub_1001B9A1C())
    {
      [*((id *)v6->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)v6->fCompanionClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      v18 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "registering for phone detailed connection updates on watch",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        LOWORD(v31[0]) = 0;
        LODWORD(v29) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "registering for phone detailed connection updates on watch",  v31,  v29);
        v28 = (uint8_t *)v27;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v27);
        if (v28 != buf) {
          free(v28);
        }
      }
    }

    v6->_userUnderground = 0;
    v6->_uncalibratedState = 1;
    LOBYTE(v31[0]) = 1;
    sub_1012049AC(buf, "AOPAltimeter", (unsigned __int8 *)v31, 0);
    v6->_BOOL useAOPAltimeter = buf[1];
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    v19 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL useAOPAltimeter = v6->_useAOPAltimeter;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = useAOPAltimeter;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AOPAltimeter is used,%d", buf, 8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      BOOL v24 = v6->_useAOPAltimeter;
      v31[0] = 67109120;
      v31[1] = v24;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "AOPAltimeter is used,%d",  v31);
      v26 = (uint8_t *)v25;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }
  }

  return v6;
}

- (void)setupTimers
{
  v3 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->super._universe, "silo"), "newTimer");
  self->_forceWifiTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100A8DE40;
  v6[3] = &unk_10181A288;
  v6[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v6);
  v4 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->super._universe, "silo"), "newTimer");
  self->_forceGPSTimer = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100A8E010;
  v5[3] = &unk_10181A288;
  v5[4] = self;
  -[CLTimer setHandler:](v4, "setHandler:", v5);
}

- (void)teardownTimers
{
  self->_forceWifiTimer = 0LL;
  -[CLTimer invalidate](self->_forceGPSTimer, "invalidate");

  self->_forceGPSTimer = 0LL;
}

- (void)releasePowerAssertions
{
  value = self->_powerAssertionWifi.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionWifi.__ptr_.__value_ = 0LL;
    goto LABEL_5;
  }

  sub_100AD5D38((uint64_t)value);
  value = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0LL;
  if (value) {
LABEL_5:
  }
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
    goto LABEL_10;
  }

  sub_100AD5D38((uint64_t)v4);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
  if (v4) {
LABEL_10:
  }
    (*(void (**)(CLPowerAssertion *))(*(void *)v4 + 8LL))(v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLContextManagerAbsoluteAltimeter;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (void)sourceUpdated:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 4)
    {
      if (self->_currentWetState == 1) {
        -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]( self,  "calculateAndSendAltitudeFromCompanion");
      }
    }

    else if (a3 == 5)
    {
      if (self->_currentWetState == 1)
      {
        if (self->_currentStatusInfo - 1 >= 2)
        {
          v4 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
          -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v4, "setTimestamp:", CFAbsoluteTimeGetCurrent());
          -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v4, "setAltitude:", 0.0);
          -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", 1.79769313e308);
          -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v4, "setAccuracy:");
          -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v4, "setPrecision:", 5.0);
          -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v4, "setStatusInfo:", 1LL);
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:]( self->super._delegate,  "absoluteAltitudeUpdate:",  v4);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v4, "timestamp");
          self->_double lastAltitudeSentTimestamp = v5;
          self->_unint64_t currentStatusInfo = -[CLBarometerCalibrationAbsoluteAltitude statusInfo](v4, "statusInfo");
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          v6 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v4, "altitude");
            uint64_t v8 = v7;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v4, "accuracy");
            uint64_t v10 = v9;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v4, "precision");
            unint64_t currentStatusInfo = self->_currentStatusInfo;
            double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219008;
            uint64_t v36 = v8;
            __int16 v37 = 2048;
            uint64_t v38 = v10;
            __int16 v39 = 2048;
            uint64_t v40 = v13;
            __int16 v41 = 1024;
            int v42 = currentStatusInfo;
            __int16 v43 = 2048;
            double v44 = lastAltitudeSentTimestamp;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source timestamp %f t his should be one shot",  buf,  0x30u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            uint64_t v14 = qword_1019346A8;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v4, "altitude");
            uint64_t v16 = v15;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v4, "accuracy");
            uint64_t v18 = v17;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v4, "precision");
            unint64_t v19 = self->_currentStatusInfo;
            double v20 = self->_lastAltitudeSentTimestamp;
            int v25 = 134219008;
            uint64_t v26 = v16;
            __int16 v27 = 2048;
            uint64_t v28 = v18;
            __int16 v29 = 2048;
            uint64_t v30 = v21;
            __int16 v31 = 1024;
            int v32 = v19;
            __int16 v33 = 2048;
            double v34 = v20;
            LODWORD(v24) = 48;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source timestamp %f t his should be one shot",  COERCE_DOUBLE(&v25),  v24);
            v23 = (uint8_t *)v22;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter sourceUpdated:]", "%s\n", v22);
            if (v23 != buf) {
              free(v23);
            }
          }
        }
      }

      else
      {
        -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro](self, "calculateAndSendAltitudeFromBaro");
      }
    }
  }

  else
  {
    if (self->_currentWetState == 1 || self->_uncalibratedState) {
      -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]( self,  "calculateAndSendAltitudeFromLocation");
    }
    -[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground](self, "forceGPSIfUnderground");
  }

- (void)forceGPSIfUnderground
{
  id v3 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude](self->super._delegate, "latestAbsoluteAltitude");
  [v3 timestamp];
  if (v4 != 1.79769313e308)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    double v5 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      [v3 timestamp];
      uint64_t v7 = v6;
      [v3 altitude];
      *(_DWORD *)buf = 134218240;
      uint64_t v57 = v7;
      __int16 v58 = 2048;
      uint64_t v59 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "checking if DEM underground, latest alt timestamp %f, latest abs alt %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      uint64_t v27 = qword_1019346A8;
      [v3 timestamp];
      uint64_t v29 = v28;
      [v3 altitude];
      int v52 = 134218240;
      *(void *)v53 = v29;
      *(_WORD *)&v53[8] = 2048;
      *(void *)&v53[10] = v30;
      LODWORD(v39) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v27,  2LL,  "checking if DEM underground, latest alt timestamp %f, latest abs alt %f",  COERCE_DOUBLE(&v52),  v39);
      int v32 = (uint8_t *)v31;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]", "%s\n", v31);
      if (v32 != buf) {
        free(v32);
      }
    }

    double Current = CFAbsoluteTimeGetCurrent();
    sub_1004908E0((uint64_t)&v52, (void *)self->super.fDataBuffers);
    __int128 v43 = v10;
    v11 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (*((void *)&v10 + 1))
    {
      v12 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
      do
        unint64_t v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }

    uint64_t v14 = v10;
    if (*(double *)(v10 + 56) > 0.0)
    {
      double v15 = *(double *)v10;
      [v3 timestamp];
      if (vabdd_f64(v15, v16) < 5.0)
      {
        [v3 altitude];
        double v17 = *(double *)(v14 + 48);
        if (v18 > v17 + -20.0) {
          self->_userUnderground = 0;
        }
        [v3 altitude];
        if (v17 - v19 > 20.0 && !self->_userUnderground)
        {
          self->_userUnderground = 1;
          if (*(_DWORD *)(v14 + 100) != 1 && !self->_GPSInProgress)
          {
            value = self->_powerAssertionGPS.__ptr_.__value_;
            sub_1010DDBC0(__p, "Altimeter, power assertion GPS underground");
            sub_100AD5668((uint64_t)value, (uint64_t *)__p);
            if (v42 < 0) {
              operator delete(__p[0]);
            }
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            uint64_t v21 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
            {
              [v3 altitude];
              uint64_t v22 = *(void *)(v14 + 48);
              int v23 = *(_DWORD *)(v14 + 100);
              *(_DWORD *)buf = 134218752;
              uint64_t v57 = v24;
              __int16 v58 = 2048;
              uint64_t v59 = v22;
              __int16 v60 = 1024;
              int v61 = v23;
              __int16 v62 = 2048;
              double v63 = Current;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "forcing GPS, detected underground, altitude %f, DEM %f, DEM source %d, time, %f",  buf,  0x26u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10186C0F0);
              }
              uint64_t v33 = qword_1019346A8;
              [v3 altitude];
              uint64_t v34 = *(void *)(v14 + 48);
              int v35 = *(_DWORD *)(v14 + 100);
              int v44 = 134218752;
              uint64_t v45 = v36;
              __int16 v46 = 2048;
              uint64_t v47 = v34;
              __int16 v48 = 1024;
              int v49 = v35;
              __int16 v50 = 2048;
              double v51 = Current;
              LODWORD(v39) = 38;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v33,  0LL,  "forcing GPS, detected underground, altitude %f, DEM %f, DEM source %d, time, %f",  COERCE_DOUBLE(&v44),  v39,  v40,  *(double *)__p);
              uint64_t v38 = (uint8_t *)v37;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]",  "%s\n",  v37);
              if (v38 != buf) {
                free(v38);
              }
            }

            [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
            self->_lastForcedGPSTime = Current;
            self->_GPSInProgress = 1;
            -[CLContextManagerAbsoluteAltimeter setTimerForGPSOff](self, "setTimerForGPSOff");
            -[CLBarometerCalibrationContextClient announceMostRecentForcedGPS:]( self->super._delegate,  "announceMostRecentForcedGPS:",  self->_lastForcedGPSTime);
          }
        }
      }
    }

    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    sub_10049108C(&v52);
  }

- (void)calculateAndSendAltitudeFromCompanion
{
  __int128 v50 = v3;
  __int128 v51 = v3;
  double v4 = *(std::__shared_weak_count **)(*(void *)(v53 + (((unint64_t)(v55 + v54 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
  if (*((void *)&v3 + 1))
  {
    double v5 = (unint64_t *)(*((void *)&v3 + 1) + 8LL);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
  -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v7, "setTimestamp:", *(double *)v50);
  -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v7, "setAltitude:", *(double *)(v50 + 8));
  -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", *(double *)(v50 + 16));
  -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v7, "setAccuracy:");
  -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v7, "setPrecision:", 100.0);
  -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v7, "setStatusInfo:", 2LL);
  double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
  -[CLBarometerCalibrationAbsoluteAltitude timestamp](v7, "timestamp");
  if (lastAltitudeSentTimestamp != v9)
  {
    -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v7);
    -[CLBarometerCalibrationAbsoluteAltitude timestamp](v7, "timestamp");
    self->_double lastAltitudeSentTimestamp = v10;
    self->_unint64_t currentStatusInfo = 2LL;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    v11 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
    {
      -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
      uint64_t v13 = v12;
      -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
      uint64_t v15 = v14;
      -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
      unint64_t currentStatusInfo = self->_currentStatusInfo;
      double v17 = self->_lastAltitudeSentTimestamp;
      *(_DWORD *)buf = 134219264;
      uint64_t v69 = v13;
      __int16 v70 = 2048;
      uint64_t v71 = v15;
      __int16 v72 = 2048;
      uint64_t v73 = v18;
      __int16 v74 = 1024;
      int v75 = currentStatusInfo;
      __int16 v76 = 1024;
      int v77 = 5;
      __int16 v78 = 2048;
      double v79 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      uint64_t v29 = qword_1019346A8;
      -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
      uint64_t v31 = v30;
      -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
      uint64_t v33 = v32;
      -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
      unint64_t v34 = self->_currentStatusInfo;
      double v35 = self->_lastAltitudeSentTimestamp;
      int v56 = 134219264;
      uint64_t v57 = v31;
      __int16 v58 = 2048;
      uint64_t v59 = v33;
      __int16 v60 = 2048;
      uint64_t v61 = v36;
      __int16 v62 = 1024;
      int v63 = v34;
      __int16 v64 = 1024;
      int v65 = 5;
      __int16 v66 = 2048;
      double v67 = v35;
      LODWORD(v49) = 54;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v29,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v56),  v49,  *(double *)&v50,  DWORD2(v50),  (_DWORD)v51,  *((double *)&v51 + 1));
      uint64_t v38 = (uint8_t *)v37;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]",  "%s\n",  v37);
      if (v38 != buf) {
        free(v38);
      }
    }

    if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      double v19 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
        uint64_t v21 = v20;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
        uint64_t v23 = v22;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
        unint64_t v24 = self->_currentStatusInfo;
        double v25 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134219264;
        uint64_t v69 = v21;
        __int16 v70 = 2048;
        uint64_t v71 = v23;
        __int16 v72 = 2048;
        uint64_t v73 = v26;
        __int16 v74 = 1024;
        int v75 = v24;
        __int16 v76 = 1024;
        int v77 = 5;
        __int16 v78 = 2048;
        double v79 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        uint64_t v39 = qword_1019346A8;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
        uint64_t v41 = v40;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
        uint64_t v43 = v42;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
        unint64_t v44 = self->_currentStatusInfo;
        double v45 = self->_lastAltitudeSentTimestamp;
        int v56 = 134219264;
        uint64_t v57 = v41;
        __int16 v58 = 2048;
        uint64_t v59 = v43;
        __int16 v60 = 2048;
        uint64_t v61 = v46;
        __int16 v62 = 1024;
        int v63 = v44;
        __int16 v64 = 1024;
        int v65 = 5;
        __int16 v66 = 2048;
        double v67 = v45;
        LODWORD(v49) = 54;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v39,  0LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v56),  v49,  *(double *)&v50,  DWORD2(v50),  (_DWORD)v51,  *((double *)&v51 + 1));
        __int16 v48 = (uint8_t *)v47;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]",  "%s\n",  v47);
        if (v48 != buf) {
          free(v48);
        }
      }

      self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }

  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  sub_10049108C(&v52);
}

- (void)calculateAndSendAltitudeFromLocation
{
  __int128 v180 = v3;
  __int128 v176 = v3;
  if (*((void *)&v3 + 1))
  {
    double v4 = (unint64_t *)(*((void *)&v3 + 1) + 8LL);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    __int128 v179 = v3;
    do
      unint64_t v6 = __ldxr(v4);
    while (__stxr(v6 + 1, v4));
  }

  else
  {
    __int128 v179 = (unint64_t)v3;
  }

  double v177 = -1.0;
  double v178 = 1.79769313e308;
  +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:]( &OBJC_CLASS___CLBarometerCalibrationBiasEstimator,  "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:",  &v179,  &v178,  &v177);
  unsigned int v7 = -[CLBarometerCalibrationContextClient inOutdoorWorkout](self->super._delegate, "inOutdoorWorkout");
  int v8 = *(_DWORD *)(v176 + 100);
  if (!v7)
  {
    if (v8 == 1)
    {
      uint64_t v12 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
      -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
      -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 48));
      -[CLContextManagerAbsoluteAltimeter capAccuracy:]( self,  "capAccuracy:",  vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)));
      -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
      -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
      -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2LL);
      double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
      -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
      if (lastAltitudeSentTimestamp != v33)
      {
        -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:]( self->super._delegate,  "absoluteAltitudeUpdate:",  v12);
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        self->_double lastAltitudeSentTimestamp = v34;
        self->_unint64_t currentStatusInfo = 2LL;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        double v35 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          uint64_t v37 = v36;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          uint64_t v39 = v38;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          unint64_t currentStatusInfo = self->_currentStatusInfo;
          double v41 = self->_lastAltitudeSentTimestamp;
          *(_DWORD *)buf = 134219264;
          uint64_t v197 = v37;
          __int16 v198 = 2048;
          uint64_t v199 = v39;
          __int16 v200 = 2048;
          uint64_t v201 = v42;
          __int16 v202 = 1024;
          int v203 = currentStatusInfo;
          __int16 v204 = 1024;
          int v205 = 2;
          __int16 v206 = 2048;
          double v207 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          uint64_t v135 = qword_1019346A8;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          uint64_t v137 = v136;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          uint64_t v139 = v138;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          unint64_t v140 = self->_currentStatusInfo;
          double v141 = self->_lastAltitudeSentTimestamp;
          int v184 = 134219264;
          uint64_t v185 = v137;
          __int16 v186 = 2048;
          uint64_t v187 = v139;
          __int16 v188 = 2048;
          uint64_t v189 = v142;
          __int16 v190 = 1024;
          int v191 = v140;
          __int16 v192 = 1024;
          int v193 = 2;
          __int16 v194 = 2048;
          double v195 = v141;
          LODWORD(v175) = 54;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v135,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
          v144 = (uint8_t *)v143;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v143);
          if (v144 != buf) {
            free(v144);
          }
        }

        if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
        {
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          uint64_t v43 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v45 = v44;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v47 = v46;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v48 = self->_currentStatusInfo;
            double v49 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v197 = v45;
            __int16 v198 = 2048;
            uint64_t v199 = v47;
            __int16 v200 = 2048;
            uint64_t v201 = v50;
            __int16 v202 = 1024;
            int v203 = v48;
            __int16 v204 = 1024;
            int v205 = 2;
            __int16 v206 = 2048;
            double v207 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            uint64_t v165 = qword_1019346A8;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v167 = v166;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v169 = v168;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v170 = self->_currentStatusInfo;
            double v171 = self->_lastAltitudeSentTimestamp;
            int v184 = 134219264;
            uint64_t v185 = v167;
            __int16 v186 = 2048;
            uint64_t v187 = v169;
            __int16 v188 = 2048;
            uint64_t v189 = v172;
            __int16 v190 = 1024;
            int v191 = v170;
            __int16 v192 = 1024;
            int v193 = 2;
            __int16 v194 = 2048;
            double v195 = v171;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v165,  0LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
            v174 = (uint8_t *)v173;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v173);
            if (v174 != buf) {
              free(v174);
            }
          }

          self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
        }
      }
    }

    else
    {
      if (v8 != 11 && v8 != 4) {
        goto LABEL_87;
      }
      if (*(double *)(v176 + 56) > 0.0 && v177 > 0.0 && vabdd_f64(v178, *(double *)(v176 + 48)) <= 10.0)
      {
        uint64_t v12 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
        -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
        -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 48));
        -[CLContextManagerAbsoluteAltimeter capAccuracy:]( self,  "capAccuracy:",  vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)));
        -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
        -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
        -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2LL);
        double v51 = self->_lastAltitudeSentTimestamp;
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        if (v51 != v52)
        {
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:]( self->super._delegate,  "absoluteAltitudeUpdate:",  v12);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
          self->_double lastAltitudeSentTimestamp = v53;
          self->_unint64_t currentStatusInfo = 2LL;
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          uint64_t v54 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v56 = v55;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v58 = v57;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v59 = self->_currentStatusInfo;
            double v60 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v197 = v56;
            __int16 v198 = 2048;
            uint64_t v199 = v58;
            __int16 v200 = 2048;
            uint64_t v201 = v61;
            __int16 v202 = 1024;
            int v203 = v59;
            __int16 v204 = 1024;
            int v205 = 3;
            __int16 v206 = 2048;
            double v207 = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            uint64_t v105 = qword_1019346A8;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v107 = v106;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v109 = v108;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v110 = self->_currentStatusInfo;
            double v111 = self->_lastAltitudeSentTimestamp;
            int v184 = 134219264;
            uint64_t v185 = v107;
            __int16 v186 = 2048;
            uint64_t v187 = v109;
            __int16 v188 = 2048;
            uint64_t v189 = v112;
            __int16 v190 = 1024;
            int v191 = v110;
            __int16 v192 = 1024;
            int v193 = 3;
            __int16 v194 = 2048;
            double v195 = v111;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v105,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
            v114 = (uint8_t *)v113;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v113);
            if (v114 != buf) {
              free(v114);
            }
          }

          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            __int16 v62 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
            {
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              uint64_t v64 = v63;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              uint64_t v66 = v65;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              unint64_t v67 = self->_currentStatusInfo;
              double v68 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              uint64_t v197 = v64;
              __int16 v198 = 2048;
              uint64_t v199 = v66;
              __int16 v200 = 2048;
              uint64_t v201 = v69;
              __int16 v202 = 1024;
              int v203 = v67;
              __int16 v204 = 1024;
              int v205 = 3;
              __int16 v206 = 2048;
              double v207 = v68;
              _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10186C0F0);
              }
              uint64_t v145 = qword_1019346A8;
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              uint64_t v147 = v146;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              uint64_t v149 = v148;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              unint64_t v150 = self->_currentStatusInfo;
              double v151 = self->_lastAltitudeSentTimestamp;
              int v184 = 134219264;
              uint64_t v185 = v147;
              __int16 v186 = 2048;
              uint64_t v187 = v149;
              __int16 v188 = 2048;
              uint64_t v189 = v152;
              __int16 v190 = 1024;
              int v191 = v150;
              __int16 v192 = 1024;
              int v193 = 3;
              __int16 v194 = 2048;
              double v195 = v151;
              LODWORD(v175) = 54;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v145,  0LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
              v154 = (uint8_t *)v153;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v153);
              if (v154 != buf) {
                free(v154);
              }
            }

            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }

      else
      {
        if (v177 <= 0.0) {
          goto LABEL_87;
        }
        uint64_t v12 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
        -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
        -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 24));
        -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", *(double *)(v176 + 40));
        -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
        -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
        -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2LL);
        double v13 = self->_lastAltitudeSentTimestamp;
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        if (v13 != v14)
        {
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:]( self->super._delegate,  "absoluteAltitudeUpdate:",  v12);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
          self->_double lastAltitudeSentTimestamp = v15;
          self->_unint64_t currentStatusInfo = 2LL;
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          double v16 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v18 = v17;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v20 = v19;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v21 = self->_currentStatusInfo;
            double v22 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            uint64_t v197 = v18;
            __int16 v198 = 2048;
            uint64_t v199 = v20;
            __int16 v200 = 2048;
            uint64_t v201 = v23;
            __int16 v202 = 1024;
            int v203 = v21;
            __int16 v204 = 1024;
            int v205 = 4;
            __int16 v206 = 2048;
            double v207 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            uint64_t v95 = qword_1019346A8;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            uint64_t v97 = v96;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            uint64_t v99 = v98;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            unint64_t v100 = self->_currentStatusInfo;
            double v101 = self->_lastAltitudeSentTimestamp;
            int v184 = 134219264;
            uint64_t v185 = v97;
            __int16 v186 = 2048;
            uint64_t v187 = v99;
            __int16 v188 = 2048;
            uint64_t v189 = v102;
            __int16 v190 = 1024;
            int v191 = v100;
            __int16 v192 = 1024;
            int v193 = 4;
            __int16 v194 = 2048;
            double v195 = v101;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v95,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
            v104 = (uint8_t *)v103;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v103);
            if (v104 != buf) {
              free(v104);
            }
          }

          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10186C0F0);
            }
            unint64_t v24 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
            {
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              uint64_t v26 = v25;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              uint64_t v28 = v27;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              unint64_t v29 = self->_currentStatusInfo;
              double v30 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              uint64_t v197 = v26;
              __int16 v198 = 2048;
              uint64_t v199 = v28;
              __int16 v200 = 2048;
              uint64_t v201 = v31;
              __int16 v202 = 1024;
              int v203 = v29;
              __int16 v204 = 1024;
              int v205 = 4;
              __int16 v206 = 2048;
              double v207 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  buf,  0x36u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10186C0F0);
              }
              uint64_t v125 = qword_1019346A8;
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              uint64_t v127 = v126;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              uint64_t v129 = v128;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              unint64_t v130 = self->_currentStatusInfo;
              double v131 = self->_lastAltitudeSentTimestamp;
              int v184 = 134219264;
              uint64_t v185 = v127;
              __int16 v186 = 2048;
              uint64_t v187 = v129;
              __int16 v188 = 2048;
              uint64_t v189 = v132;
              __int16 v190 = 1024;
              int v191 = v130;
              __int16 v192 = 1024;
              int v193 = 4;
              __int16 v194 = 2048;
              double v195 = v131;
              LODWORD(v175) = 54;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v125,  0LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f",  COERCE_DOUBLE(&v184),  v175,  *(double *)&v176,  DWORD2(v176),  LODWORD(v177),  v178);
              v134 = (uint8_t *)v133;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]",  "%s\n",  v133);
              if (v134 != buf) {
                free(v134);
              }
            }

            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }
    }

- (BOOL)shouldEnableWifiAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedWifiTime) > 900.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (BOOL)shouldEnableGPSAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedGPSTime) > 1860.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (void)setTimerForWifiOff
{
}

- (void)setTimerForGPSOff
{
}

- (void)forceLocationAtTime:(double)a3
{
  if (self->_isCompanionConnected && self->_doesCompanionHavePressureSensor && !self->_currentWetState)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    double v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      BOOL isCompanionConnected = self->_isCompanionConnected;
      BOOL doesCompanionHavePressureSensor = self->_doesCompanionHavePressureSensor;
      *(_DWORD *)buf = 67109376;
      LODWORD(v27[0]) = isCompanionConnected;
      WORD2(v27[0]) = 1024;
      *(_DWORD *)((char *)v27 + 6) = doesCompanionHavePressureSensor;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "will not force Wifi/GPS, phone connected %d, phone has pressure %d, and sensor is dry",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      BOOL v16 = self->_isCompanionConnected;
      BOOL v17 = self->_doesCompanionHavePressureSensor;
      int v24 = 67109376;
      *(_DWORD *)uint64_t v25 = v16;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v17;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "will not force Wifi/GPS, phone connected %d, phone has pressure %d, and sensor is dry",  &v24,  14);
      uint64_t v19 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v18);
      if (v19 != buf) {
        free(v19);
      }
    }
  }

  else if (-[CLContextManagerAbsoluteAltimeter shouldEnableWifiAtTime:](self, "shouldEnableWifiAtTime:", a3))
  {
    value = self->_powerAssertionWifi.__ptr_.__value_;
    sub_1010DDBC0(__p, "Altimeter, power assertion Wifi");
    sub_100AD5668((uint64_t)value, (uint64_t *)__p);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    unint64_t v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v27 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "subscribing to Wifi notifications %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      int v24 = 134217984;
      *(double *)uint64_t v25 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "subscribing to Wifi notifications %f",  COERCE_DOUBLE(&v24));
      double v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
    self->_lastForcedWifiTime = a3;
    self->_wifiInProgress = 1;
    -[CLContextManagerAbsoluteAltimeter setTimerForWifiOff](self, "setTimerForWifiOff");
  }

  else if (-[CLContextManagerAbsoluteAltimeter shouldEnableGPSAtTime:](self, "shouldEnableGPSAtTime:", a3))
  {
    unsigned int v7 = self->_powerAssertionGPS.__ptr_.__value_;
    sub_1010DDBC0(v20, "Altimeter, power assertion GPS");
    sub_100AD5668((uint64_t)v7, (uint64_t *)v20);
    if (v21 < 0) {
      operator delete(v20[0]);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    int v8 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v27 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "subscribing to GPS notifications %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      int v24 = 134217984;
      *(double *)uint64_t v25 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "subscribing to GPS notifications %f",  COERCE_DOUBLE(&v24));
      double v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    [*((id *)self->_locationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->_locationControllerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    self->_lastForcedGPSTime = a3;
    self->_GPSInProgress = 1;
    -[CLContextManagerAbsoluteAltimeter setTimerForGPSOff](self, "setTimerForGPSOff");
    -[CLBarometerCalibrationContextClient announceMostRecentForcedGPS:]( self->super._delegate,  "announceMostRecentForcedGPS:",  self->_lastForcedGPSTime);
  }

- (double)capAccuracy:(double)result
{
  if (result > 500.0) {
    return 500.0;
  }
  return result;
}

- (void)filteredElevation:(double *)a3 absAltUncertainty:(double *)a4 withTimestamp:(double *)a5
{
  *a3 = 1.79769313e308;
  *a5 = 1.79769313e308;
  *a4 = 1.79769313e308;
  sub_1004908E0((uint64_t)&v50, (void *)self->super.fDataBuffers + 30);
  __int128 v9 = *(_OWORD *)(*(void *)(v51 + (((v54 + v53 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
                 + 16LL * (v54 + v53 - 1));
  double v49 = (std::__shared_weak_count *)*((void *)&v9 + 1);
  if (*((void *)&v9 + 1))
  {
    double v10 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  double v12 = *(double *)(v9 + 16);
  double v13 = *(double *)(v9 + 24);
  double v14 = *(double *)v9;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10186C0F0);
  }
  double v15 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "latest KF,pressure,%f,absAltUnc,%f", buf, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    int v55 = 134218240;
    double v56 = v12;
    __int16 v57 = 2048;
    double v58 = v13;
    LODWORD(v46) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "latest KF,pressure,%f,absAltUnc,%f",  COERCE_DOUBLE(&v55),  v46);
    uint64_t v43 = (char *)v42;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]",  "%s\n",  v42);
    if (v43 != buf) {
      free(v43);
    }
  }

  if (v12 * 1000.0 >= 100.0 && v52 != v51)
  {
    BOOL v16 = (void *)(v51 + 8 * (v53 >> 8));
    uint64_t v17 = *v16 + 16LL * v53;
    uint64_t v18 = *(void *)(v51 + (((v54 + v53) >> 5) & 0x7FFFFFFFFFFFFF8LL)) + 16LL * (v54 + v53);
    if (v17 != v18)
    {
      unint64_t v48 = a4;
      int v19 = 0;
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      do
      {
        char v23 = *(double **)v17;
        int v24 = *(std::__shared_weak_count **)(v17 + 8);
        *(void *)buf = *(void *)v17;
        *(void *)&uint8_t buf[8] = v24;
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            unint64_t v26 = __ldxr(p_shared_owners);
          while (__stxr(v26 + 1, p_shared_owners));
        }

        double v27 = v23[2] * 1000.0;
        if (v27 > 100.0)
        {
          double v28 = *v23;
          if (*v23 >= v14 + -1.0)
          {
            if (self->_useAOPAltimeter)
            {
              double v29 = v23[1];
            }

            else
            {
              float v30 = v27;
              double v29 = sub_100FADFE8(v30, 101320.0);
              double v28 = *v23;
            }

            double v20 = v20 + v29;
            double v22 = v22 + v28;
            double v21 = v21 + v23[3];
            ++v19;
          }
        }

        if (v24)
        {
          uint64_t v31 = (unint64_t *)&v24->__shared_owners_;
          do
            unint64_t v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }

        v17 += 16LL;
        if (v17 - *v16 == 4096)
        {
          uint64_t v33 = v16[1];
          ++v16;
          uint64_t v17 = v33;
        }
      }

      while (v17 != v18);
      double v35 = a5;
      double v34 = v48;
      if (v19 >= 1 && v20 < 3.40282347e38)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        uint64_t v36 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          *(double *)&uint8_t buf[4] = v20 / (double)v19;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v22 / (double)v19;
          __int16 v62 = 2048;
          double v63 = v21 / (double)v19;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "average KF,elevation,%f,averageTimestamp,%f,aveAbsAltUnc,%f",  buf,  0x20u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          double v37 = v20 / (double)v19;
          double v38 = v22 / (double)v19;
          int v55 = 134218496;
          double v56 = v37;
          __int16 v57 = 2048;
          double v58 = v38;
          double v39 = v21 / (double)v19;
          __int16 v59 = 2048;
          double v60 = v39;
          LODWORD(v46) = 32;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "average KF,elevation,%f,averageTimestamp,%f,aveAbsAltUnc,%f",  COERCE_DOUBLE(&v55),  v46,  *(double *)&a5);
          uint64_t v45 = (char *)v44;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]",  "%s\n",  v44);
          if (v45 != buf) {
            free(v45);
          }
          double v35 = v47;
          double v34 = v48;
        }

        else
        {
          double v37 = v20 / (double)v19;
          double v38 = v22 / (double)v19;
          double v39 = v21 / (double)v19;
        }

        *a3 = v37;
        *double v35 = v38;
        *double v34 = v39;
      }
    }
  }

  if (v49)
  {
    uint64_t v40 = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }

  sub_10049108C(&v50);
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (self->_currentWetState != a3)
  {
    self->_currentWetState = a3;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    unint64_t v5 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "absolute altimeter wet state updated to %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "absolute altimeter wet state updated to %d",  v11);
      int v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }

    if (a3 == 1)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      unint64_t v6 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "absolute altimeter: watch wet, forcing location",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        LOWORD(v11[0]) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "absolute altimeter: watch wet, forcing location",  v11,  2);
        double v10 = (uint8_t *)v9;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v9);
        if (v10 != buf) {
          free(v10);
        }
      }

      self->_lastForcedWifiTime = 1.79769313e308;
      self->_lastForcedGPSTime = 1.79769313e308;
      -[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]( self,  "forceLocationAtTime:",  CFAbsoluteTimeGetCurrent());
    }
  }

- (void)calculateAndSendAltitudeFromBaro
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = -[CLBarometerCalibrationContextClient copyCurrentBias](self->super._delegate, "copyCurrentBias");
  [v4 timestamp];
  if (vabdd_f64(Current, v5) > 900.0)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    unint64_t v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      [v4 timestamp];
      *(_DWORD *)buf = 134217984;
      double v133 = vabdd_f64(Current, v7);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "bias age is %f", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      uint64_t v69 = qword_1019346A8;
      [v4 timestamp];
      int v120 = 134217984;
      double v121 = vabdd_f64(Current, v70);
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v69,  2LL,  "bias age is %f",  COERCE_DOUBLE(&v120));
      double v72 = (uint8_t *)v71;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]",  "%s\n",  v71);
      if (v72 != buf) {
        free(v72);
      }
    }

    -[CLContextManagerAbsoluteAltimeter forceLocationAtTime:](self, "forceLocationAtTime:", Current);
  }

  -[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]( self,  "filteredElevation:absAltUncertainty:withTimestamp:",  &v119,  &v118,  &v117);
  sub_1004908E0((uint64_t)v114, (void *)self->super.fDataBuffers + 6);
  __int128 v112 = v8;
  __int128 v9 = (std::__shared_weak_count *)*((void *)&v8 + 1);
  if (*((void *)&v8 + 1))
  {
    double v10 = (unint64_t *)(*((void *)&v8 + 1) + 8LL);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  double v12 = v119;
  if (v119 == 1.79769313e308)
  {
    int v13 = (double *)v8;
    float v14 = *(double *)(v8 + 8) * 1000.0;
    float v15 = sub_100FADFE8(v14, 101320.0);
    [v4 biasInMeters];
    double v17 = v16;
    [v4 weatherEstimateInMeter];
    double v119 = v17 + v15 - v18;
    double v117 = *v13;
  }

  else
  {
    double v19 = 0.0;
    double v20 = v119;
    if (!self->_useAOPAltimeter)
    {
      objc_msgSend(v4, "biasInMeters", 0.0, v119);
      double v22 = v21;
      [v4 weatherEstimateInMeter];
      double v19 = v22 - v23;
      double v20 = v119;
    }

    double v119 = v19 + v20;
  }

  int v24 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationAbsoluteAltitude);
  -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", v118);
  double v111 = v25;
  if (-[CLBarometerCalibrationContextClient inOutdoorWorkout](self->super._delegate, "inOutdoorWorkout")) {
    -[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]( self,  "chooseUncertaintyDuringWorkout:withAltitude:atTime:",  &v111,  v119,  v117);
  }
  unsigned __int8 v26 = -[CLBarometerCalibrationContextClient isInVisit](self->super._delegate, "isInVisit");
  if (v111 > 25.0) {
    unsigned __int8 v27 = v26;
  }
  else {
    unsigned __int8 v27 = 0;
  }
  if ((v27 & 1) != 0 || v111 == 500.0)
  {
    self->_uncalibratedState = 1;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    float v30 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      double v133 = v119;
      __int16 v134 = 2048;
      double v135 = v111;
      __int16 v136 = 2048;
      double v137 = v117;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "switch to wet behavior due to large uncertainty,alt2,%f,alt2Unc,%f,timestamp,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      int v120 = 134218496;
      double v121 = v119;
      __int16 v122 = 2048;
      double v123 = v111;
      __int16 v124 = 2048;
      double v125 = v117;
      LODWORD(v108) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "switch to wet behavior due to large uncertainty,alt2,%f,alt2Unc,%f,timestamp,%f",  COERCE_DOUBLE(&v120),  v108,  v109);
      unint64_t v32 = (uint8_t *)v31;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]",  "%s\n",  v31);
      if (v32 != buf) {
        free(v32);
      }
    }
  }

  else
  {
    self->_uncalibratedState = 0;
    -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v24, "setTimestamp:", v117);
    -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v24, "setAltitude:", v119);
    -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v24, "setAccuracy:", v111);
    -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v24, "setPrecision:", 0.5);
    [v4 timestamp];
    if (v28 == 1.79769313e308) {
      uint64_t v29 = 1LL;
    }
    else {
      uint64_t v29 = (uint64_t)[v4 statusInfo];
    }
    -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v24, "setStatusInfo:", v29);
    double lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
    -[CLBarometerCalibrationAbsoluteAltitude timestamp](v24, "timestamp");
    if (lastAltitudeSentTimestamp != v34)
    {
      sub_1004F2598();
      char v35 = sub_1001B9A1C();
      if (v12 == 1.79769313e308) {
        char v36 = v35;
      }
      else {
        char v36 = 0;
      }
      if ((v36 & 1) == 0) {
        -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:]( self->super._delegate,  "absoluteAltitudeUpdate:",  v24);
      }
      -[CLBarometerCalibrationAbsoluteAltitude timestamp](v24, "timestamp");
      self->_double lastAltitudeSentTimestamp = v37;
      uint64_t v110 = 144LL;
      self->_unint64_t currentStatusInfo = -[CLBarometerCalibrationAbsoluteAltitude statusInfo](v24, "statusInfo");
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      double v38 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v40 = v39;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v42 = v41;
        [v4 weatherEstimateInMeter];
        double v44 = v43;
        [v4 weatherEstimateInMeter];
        double v45 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134218752;
        double v133 = v40;
        __int16 v134 = 2048;
        double v135 = v42 + v44;
        __int16 v136 = 2048;
        double v137 = v46;
        __int16 v138 = 2048;
        *(double *)uint64_t v139 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "absolute altitude corrected %f, absolute altitude before correction %f, weather %f, timestamp %f",  buf,  0x2Au);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        uint64_t v73 = qword_1019346A8;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v75 = v74;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v77 = v76;
        [v4 weatherEstimateInMeter];
        double v79 = v78;
        [v4 weatherEstimateInMeter];
        double v80 = self->_lastAltitudeSentTimestamp;
        int v120 = 134218752;
        double v121 = v75;
        __int16 v122 = 2048;
        double v123 = v77 + v79;
        __int16 v124 = 2048;
        double v125 = v81;
        __int16 v126 = 2048;
        *(double *)uint64_t v127 = v80;
        LODWORD(v108) = 42;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v73,  1LL,  "absolute altitude corrected %f, absolute altitude before correction %f, weather %f, timestamp %f",  COERCE_DOUBLE(&v120),  v108,  COERCE_DOUBLE(144LL),  v111);
        uint64_t v83 = (uint8_t *)v82;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]",  "%s\n",  v82);
        if (v83 != buf) {
          free(v83);
        }
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      uint64_t v47 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v49 = v48;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
        double v51 = v50;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
        double v53 = v52;
        uint64_t v54 = *(uint64_t *)((char *)&self->super.super.isa + v110);
        double v55 = self->_lastAltitudeSentTimestamp;
        [v4 uncertaintyInMeters];
        *(_DWORD *)buf = 134219520;
        double v133 = v49;
        __int16 v134 = 2048;
        double v135 = v51;
        __int16 v136 = 2048;
        double v137 = v53;
        __int16 v138 = 1024;
        *(_DWORD *)uint64_t v139 = v54;
        *(_WORD *)&v139[4] = 1024;
        *(_DWORD *)&v139[6] = 0;
        __int16 v140 = 2048;
        double v141 = v55;
        __int16 v142 = 2048;
        uint64_t v143 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f",  buf,  0x40u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        uint64_t v84 = qword_1019346A8;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        double v86 = v85;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
        double v88 = v87;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
        double v90 = v89;
        uint64_t v91 = *(uint64_t *)((char *)&self->super.super.isa + v110);
        double v92 = self->_lastAltitudeSentTimestamp;
        [v4 uncertaintyInMeters];
        int v120 = 134219520;
        double v121 = v86;
        __int16 v122 = 2048;
        double v123 = v88;
        __int16 v124 = 2048;
        double v125 = v90;
        __int16 v126 = 1024;
        *(_DWORD *)uint64_t v127 = v91;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = 0;
        __int16 v128 = 2048;
        double v129 = v92;
        __int16 v130 = 2048;
        uint64_t v131 = v93;
        LODWORD(v108) = 64;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v84,  1LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f",  COERCE_DOUBLE(&v120),  v108,  *(double *)&v110,  LODWORD(v111),  (_DWORD)v112,  *((double *)&v112 + 1),  v113);
        uint64_t v95 = (uint8_t *)v94;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]",  "%s\n",  v94);
        if (v95 != buf) {
          free(v95);
        }
      }

      if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        __int16 v57 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
          double v59 = v58;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
          double v61 = v60;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
          double v63 = v62;
          uint64_t v64 = *(uint64_t *)((char *)&self->super.super.isa + v110);
          double v65 = self->_lastAltitudeSentTimestamp;
          [v4 uncertaintyInMeters];
          *(_DWORD *)buf = 134219520;
          double v133 = v59;
          __int16 v134 = 2048;
          double v135 = v61;
          __int16 v136 = 2048;
          double v137 = v63;
          __int16 v138 = 1024;
          *(_DWORD *)uint64_t v139 = v64;
          *(_WORD *)&v139[4] = 1024;
          *(_DWORD *)&v139[6] = 0;
          __int16 v140 = 2048;
          double v141 = v65;
          __int16 v142 = 2048;
          uint64_t v143 = v66;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, % f, bias uncertainty, %f",  buf,  0x40u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          uint64_t v96 = qword_1019346A8;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
          double v98 = v97;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
          double v100 = v99;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
          double v102 = v101;
          uint64_t v103 = *(uint64_t *)((char *)&self->super.super.isa + v110);
          double v104 = self->_lastAltitudeSentTimestamp;
          [v4 uncertaintyInMeters];
          int v120 = 134219520;
          double v121 = v98;
          __int16 v122 = 2048;
          double v123 = v100;
          __int16 v124 = 2048;
          double v125 = v102;
          __int16 v126 = 1024;
          *(_DWORD *)uint64_t v127 = v103;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = 0;
          __int16 v128 = 2048;
          double v129 = v104;
          __int16 v130 = 2048;
          uint64_t v131 = v105;
          LODWORD(v108) = 64;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v96,  0LL,  "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, % f, bias uncertainty, %f",  COERCE_DOUBLE(&v120),  v108,  *(double *)&v110,  LODWORD(v111),  (_DWORD)v112,  *((double *)&v112 + 1),  v113);
          uint64_t v107 = (uint8_t *)v106;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]",  "%s\n",  v106);
          if (v107 != buf) {
            free(v107);
          }
        }

        self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
      }
    }
  }

  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v68 = __ldaxr(p_shared_owners);
    while (__stlxr(v68 - 1, p_shared_owners));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  sub_10049108C(v114);
}

- (void)chooseUncertaintyDuringWorkout:(double *)a3 withAltitude:(double)a4 atTime:(double)a5
{
  double v9 = *a3;
  if (*a3 > 14.9) {
    double v9 = 14.9;
  }
  *a3 = v9;
  sub_1004908E0((uint64_t)&v33, (void *)self->super.fDataBuffers);
  if (v38 == 0.0)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    int v24 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v64 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "in outdoor workout: location buffer empty, pressure timestamp, %f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      int v39 = 134217984;
      double v40 = a5;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "in outdoor workout: location buffer empty, pressure timestamp, %f",  COERCE_DOUBLE(&v39));
      unsigned __int8 v26 = (uint8_t *)v25;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }
  }

  else
  {
    __int128 v10 = *(_OWORD *)(*(void *)(*(void *)&v34
    __int128 v32 = v10;
    unint64_t v11 = *(std::__shared_weak_count **)(*(void *)(*(void *)&v34
                                                   + (((unint64_t)&v37[*(void *)&v38 - 1] >> 5) & 0x7FFFFFFFFFFFFF8LL))
    if (*((void *)&v10 + 1))
    {
      double v12 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
      do
        unint64_t v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }

    float v14 = (uint64_t *)v10;
    if (*(double *)(v10 + 56) > 0.0 && *(_DWORD *)(v10 + 100) == 1 && vabdd_f64(a5, *(double *)v10) < 5.0)
    {
      uint64_t v15 = 24LL;
      double v16 = *(double *)(v10 + v15);
      double v17 = vabdd_f64(a4, v16);
      if (v17 > 15.0)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10186C0F0);
        }
        double v18 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v14[6];
          uint64_t v20 = *v14;
          *(_DWORD *)buf = 136317954;
          double v64 = COERCE_DOUBLE("discrepancy");
          __int16 v65 = 2048;
          double v66 = v17;
          __int16 v67 = 2080;
          unint64_t v68 = "gpsAltitude";
          __int16 v69 = 2048;
          double v70 = v16;
          __int16 v71 = 2080;
          double v72 = "demAltitude";
          __int16 v73 = 2048;
          uint64_t v74 = v19;
          __int16 v75 = 2080;
          double v76 = "currentAbsoluteAltitude";
          __int16 v77 = 2048;
          double v78 = a4;
          __int16 v79 = 2080;
          double v80 = "pressureTimestamp";
          __int16 v81 = 2048;
          double v82 = a5;
          __int16 v83 = 2080;
          uint64_t v84 = "gpsTimestamp";
          __int16 v85 = 2048;
          uint64_t v86 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "discrepancy between GPS and altitude in workout,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x7Au);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10186C0F0);
          }
          uint64_t v27 = v14[6];
          uint64_t v28 = *v14;
          int v39 = 136317954;
          double v40 = COERCE_DOUBLE("discrepancy");
          __int16 v41 = 2048;
          double v42 = v17;
          __int16 v43 = 2080;
          double v44 = "gpsAltitude";
          __int16 v45 = 2048;
          double v46 = v16;
          __int16 v47 = 2080;
          double v48 = "demAltitude";
          __int16 v49 = 2048;
          uint64_t v50 = v27;
          __int16 v51 = 2080;
          double v52 = "currentAbsoluteAltitude";
          __int16 v53 = 2048;
          double v54 = a4;
          __int16 v55 = 2080;
          uint64_t v56 = "pressureTimestamp";
          __int16 v57 = 2048;
          double v58 = a5;
          __int16 v59 = 2080;
          double v60 = "gpsTimestamp";
          __int16 v61 = 2048;
          uint64_t v62 = v28;
          LODWORD(v31) = 122;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "discrepancy between GPS and altitude in workout,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v39,  v31,  (const char *)v32,  *((double *)&v32 + 1),  v33,  v34,  v35,  v36,  v37,  v38);
          float v30 = (uint8_t *)v29;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]",  "%s\n",  v29);
          if (v30 != buf) {
            free(v30);
          }
        }

        -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", v17);
        *(void *)a3 = v21;
      }
    }

    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  sub_10049108C(&v33);
}

- (void)onCompanionConnectionNotification:(int)a3 data:(_BYTE *)a4
{
  if (a3 == 6)
  {
    *(_BYTE *)(a1 + 82) = *a4;
    int v5 = a4[16];
    *(_BYTE *)(a1 + 83) = v5;
    unint64_t v6 = *(void **)(a1 + 16);
    if (v5) {
      BOOL v7 = *(_BYTE *)(a1 + 82) == 0;
    }
    else {
      BOOL v7 = 1;
    }
    uint64_t v8 = !v7;
    [v6 updateCompanionConnected:v8];
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186C0F0);
    }
    double v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(unsigned __int8 *)(a1 + 82);
      int v11 = *(unsigned __int8 *)(a1 + 83);
      *(_DWORD *)buf = 67109376;
      int v20 = v10;
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "received phone connection updates, is phone connected %d, does phone have pressure sensor %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10186C0F0);
      }
      int v12 = *(unsigned __int8 *)(a1 + 82);
      int v13 = *(unsigned __int8 *)(a1 + 83);
      v16[0] = 67109376;
      v16[1] = v12;
      __int16 v17 = 1024;
      int v18 = v13;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "received phone connection updates, is phone connected %d, does phone have pressure sensor %d",  v16,  14);
      uint64_t v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerAbsoluteAltimeter onCompanionConnectionNotification:data:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }
  }

- (void).cxx_destruct
{
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  id v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(CLPowerAssertion *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  int v5 = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(CLPowerAssertion *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  unint64_t v6 = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  return self;
}

@end