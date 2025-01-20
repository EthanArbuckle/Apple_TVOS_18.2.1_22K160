@interface CLWorkoutRecorder
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)acquireTokenWithSettings:(void *)a3 publisher:(id)a4;
- (BOOL)canStartRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5;
- (BOOL)createWorkingDirectory;
- (BOOL)didPublishRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5;
- (BOOL)workingDirectoryHasSufficientFreeSpace;
- (CLDaemonLocation)getRecentLocation;
- (CLWorkoutRecorder)init;
- (CLWorkoutRecorderPublisher)publisher;
- (id).cxx_construct;
- (id)getRecentWeatherData;
- (id)getWorkingDirectory;
- (void)beginService;
- (void)dealloc;
- (void)didUpdateWeather:(id)a3;
- (void)endService;
- (void)handleResponse:(id)a3;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onWorkoutEffortScoreUpdate:(id)a3;
@end

@implementation CLWorkoutRecorder

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A0748 != -1) {
    dispatch_once(&qword_1019A0748, &stru_1018A3668);
  }
  return (id)qword_1019A0740;
}

- (CLWorkoutRecorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLWorkoutRecorder;
  v2 = -[CLWorkoutRecorder initWithInboundProtocol:outboundProtocol:]( &v5,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWorkoutRecorderProtocol,  &OBJC_PROTOCOL___CLWorkoutRecorderClientProtocol);
  v3 = v2;
  if (v2)
  {
    v2->_recentLocation.ellipsoidalAltitude = 0.0;
    v2->_workoutRecorderTrigger = -[CLWorkoutRecorderTrigger initWithDelegate:andUniverse:]( objc_alloc(&OBJC_CLASS___CLWorkoutRecorderTrigger),  "initWithDelegate:andUniverse:",  v2,  -[CLWorkoutRecorder universe](v2, "universe"));
    v3->_drivingRecorderTrigger = -[CLDrivingRecorderTrigger initWithDelegate:andUniverse:]( objc_alloc(&OBJC_CLASS___CLDrivingRecorderTrigger),  "initWithDelegate:andUniverse:",  v3,  -[CLWorkoutRecorder universe](v3, "universe"));
    v3->_serviceLocationClient.__ptr_.__value_ = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3688);
  }
  v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: dealloc", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: dealloc",  v8,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder dealloc]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  self->_workingDirectory = 0LL;
  self->_workoutRecorderTrigger = 0LL;

  self->_drivingRecorderTrigger = 0LL;
  value = self->_serviceLocationClient.__ptr_.__value_;
  if (value)
  {

    self->_serviceLocationClient.__ptr_.__value_ = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLWorkoutRecorder;
  -[CLWorkoutRecorder dealloc](&v7, "dealloc");
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3688);
  }
  v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Beginning service.", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v15[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Beginning service.",  v15,  2);
    v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder beginService]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  if (-[CLWorkoutRecorder createWorkingDirectory](self, "createWorkingDirectory"))
  {
    sub_100ACD980((uint64_t)sub_101207D14, (uint64_t)self, self, buf);
    v4 = *(Client **)buf;
    *(void *)buf = 0LL;
    value = self->_dataProtectionClient.__ptr_.__value_;
    self->_dataProtectionClient.__ptr_.__value_ = v4;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      v6 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v6) {
        (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
      }
    }

    [*((id *)self->_dataProtectionClient.__ptr_.__value_ + 2) register:*((void *)self->_dataProtectionClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    [*((id *)self->_dataProtectionClient.__ptr_.__value_ + 2) register:*((void *)self->_dataProtectionClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
    objc_super v7 = operator new(0xC0uLL);
    sub_100AEB404(v7, "MotionCalibration", self);
    *(void *)&self->_recentLocation.ellipsoidalAltitude = v7;
    sub_100AEB408((uint64_t)v7, (uint64_t)sub_101207D24, (uint64_t)self, self, buf);
    v8 = *(Client **)buf;
    *(void *)buf = 0LL;
    uint64_t v9 = *(void *)&self->_recentLocation.fromSimulationController;
    *(void *)&self->_recentLocation.fromSimulationController = v8;
    if (v9)
    {
      (*(void (**)(uint64_t))(*(void *)v9 + 8LL))(v9);
      v10 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v10) {
        (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
      }
    }

    [*(id *)(*(void *)&self->_recentLocation.fromSimulationController + 16) register:*(void *)(*(void *)&self->_recentLocation.fromSimulationController + 8) forNotification:5 registrationInfo:0];
    id v11 = objc_msgSend(-[CLWorkoutRecorder vendor](self, "vendor"), "proxyForService:", @"CLWeatherService");
    self->_serviceLocationProvider = v11;
    objc_msgSend(v11, "registerDelegate:inSilo:", self, -[CLWorkoutRecorder silo](self, "silo"));
    [self->_serviceLocationProvider setDelegateEntityName:"CLWorkoutRecorder"];
    [self->_serviceLocationProvider registerForWeatherUpdates:self];
    v12 = (CLWeatherServiceProtocol *) objc_msgSend( -[CLWorkoutRecorder vendor](self, "vendor"),  "proxyForService:",  @"CLWorkoutEffortService");
    self->_weatherServiceProxy = v12;
    -[CLWeatherServiceProtocol registerDelegate:inSilo:]( v12,  "registerDelegate:inSilo:",  self,  -[CLWorkoutRecorder silo](self, "silo"));
    -[CLWeatherServiceProtocol setDelegateEntityName:]( self->_weatherServiceProxy,  "setDelegateEntityName:",  "CLWorkoutRecorder");
    -[CLWeatherServiceProtocol registerForUpdates:](self->_weatherServiceProxy, "registerForUpdates:", self);
    -[CLWorkoutRecorderTrigger setupListeners](self->_workoutRecorderTrigger, "setupListeners");
    -[CLDrivingRecorderTrigger setupListeners](self->_drivingRecorderTrigger, "setupListeners");
  }

- (void)endService
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3688);
  }
  v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Ending service.", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v9[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Ending service.",  v9,  2);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder endService]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  double ellipsoidalAltitude = self->_recentLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0)
  {
    (*(void (**)(double))(**(void **)&ellipsoidalAltitude + 8LL))(COERCE_DOUBLE(*(void *)&ellipsoidalAltitude));
    self->_recentLocation.double ellipsoidalAltitude = 0.0;
  }

  uint64_t v6 = *(void *)&self->_recentLocation.fromSimulationController;
  *(void *)&self->_recentLocation.fromSimulationController = 0LL;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
  }
  [self->_serviceLocationProvider unregisterForWeatherUpdates:self];

  self->_serviceLocationProvider = 0LL;
}

- (BOOL)canStartRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  if (+[CLWorkoutRecorder isSupported](&OBJC_CLASS___CLWorkoutRecorder, "isSupported"))
  {
    if (self->_workingDirectory)
    {
      if (-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace](self, "workingDirectoryHasSufficientFreeSpace"))
      {
        if (*a3)
        {
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3688);
          }
          uint64_t v9 = (os_log_s *)qword_101934678;
          if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, already recording.",  buf,  2u);
          }

          BOOL v10 = sub_1002921D0(115, 2);
          if (v10)
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934670 != -1) {
              dispatch_once(&qword_101934670, &stru_1018A3688);
            }
            LOWORD(v24[0]) = 0;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, already recording.",  v24,  2,  v24[0]);
LABEL_81:
            v20 = (uint8_t *)v11;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecorder canStartRecording:settings:publisher:]",  "%s\n",  v11);
            if (v20 != buf) {
              free(v20);
            }
            LOBYTE(v10) = 0;
          }
        }

        else if (a5)
        {
          if ([a5 canPublish])
          {
            if (-[CLRecordingTriggerBase isRecording](self->_workoutRecorderTrigger, "isRecording")
              || -[CLRecordingTriggerBase isRecording](self->_drivingRecorderTrigger, "isRecording"))
            {
              if (qword_101934670 != -1) {
                dispatch_once(&qword_101934670, &stru_1018A3688);
              }
              v15 = (os_log_s *)qword_101934678;
              if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, session already being captured.",  buf,  2u);
              }

              BOOL v10 = sub_1002921D0(115, 2);
              if (v10)
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934670 != -1) {
                  dispatch_once(&qword_101934670, &stru_1018A3688);
                }
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, session already being captured.",  v24,  2,  v24[0]);
                goto LABEL_81;
              }
            }

            else if (-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]( self,  "acquireTokenWithSettings:publisher:",  a4,  a5))
            {
              if (qword_101934670 != -1) {
                dispatch_once(&qword_101934670, &stru_1018A3688);
              }
              v18 = (os_log_s *)qword_101934678;
              if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Can Start Recording",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934670 != -1) {
                  dispatch_once(&qword_101934670, &stru_1018A3688);
                }
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Can Start Recording",  v24,  2);
                v22 = (uint8_t *)v21;
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecorder canStartRecording:settings:publisher:]",  "%s\n",  v21);
                if (v22 != buf) {
                  free(v22);
                }
              }

              LOBYTE(v10) = 1;
            }

            else
            {
              if (qword_101934670 != -1) {
                dispatch_once(&qword_101934670, &stru_1018A3688);
              }
              v19 = (os_log_s *)qword_101934678;
              if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Not recording, rate limit reached.",  buf,  2u);
              }

              BOOL v10 = sub_1002921D0(115, 2);
              if (v10)
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934670 != -1) {
                  dispatch_once(&qword_101934670, &stru_1018A3688);
                }
                LOWORD(v24[0]) = 0;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Not recording, rate limit reached.",  v24,  2,  v24[0]);
                goto LABEL_81;
              }
            }
          }

          else
          {
            if (qword_101934670 != -1) {
              dispatch_once(&qword_101934670, &stru_1018A3688);
            }
            v17 = (os_log_s *)qword_101934678;
            if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, publisher is not ready to publish.",  buf,  2u);
            }

            BOOL v10 = sub_1002921D0(115, 2);
            if (v10)
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934670 != -1) {
                dispatch_once(&qword_101934670, &stru_1018A3688);
              }
              LOWORD(v24[0]) = 0;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, publisher is not ready to publish.",  v24,  2,  v24[0]);
              goto LABEL_81;
            }
          }
        }

        else
        {
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3688);
          }
          v16 = (os_log_s *)qword_101934678;
          if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, no publisher.",  buf,  2u);
          }

          BOOL v10 = sub_1002921D0(115, 2);
          if (v10)
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934670 != -1) {
              dispatch_once(&qword_101934670, &stru_1018A3688);
            }
            LOWORD(v24[0]) = 0;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, no publisher.",  v24,  2,  v24[0]);
            goto LABEL_81;
          }
        }
      }

      else
      {
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3688);
        }
        v14 = (os_log_s *)qword_101934678;
        if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, not enough free space in working directory.",  buf,  2u);
        }

        BOOL v10 = sub_1002921D0(115, 2);
        if (v10)
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3688);
          }
          LOWORD(v24[0]) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, not enough free space in working directory.",  v24,  2,  v24[0]);
          goto LABEL_81;
        }
      }
    }

    else
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      v13 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, no working directory.",  buf,  2u);
      }

      BOOL v10 = sub_1002921D0(115, 2);
      if (v10)
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3688);
        }
        LOWORD(v24[0]) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, no working directory.",  v24,  2,  v24[0]);
        goto LABEL_81;
      }
    }
  }

  else
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v12 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: Unable to start recording, no longer allowed.",  buf,  2u);
    }

    BOOL v10 = sub_1002921D0(115, 2);
    if (v10)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v24[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: Unable to start recording, no longer allowed.",  v24,  2,  v24[0]);
      goto LABEL_81;
    }
  }

  return v10;
}

- (BOOL)didPublishRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  id v6 = *a3;
  if (!*a3) {
    return (char)v6;
  }
  [v6 stopTime];
  if (v10 == 0.0)
  {
LABEL_30:
    LOBYTE(v6) = 0;
    return (char)v6;
  }

  if (self->_deviceUnlocked)
  {
    if (a5)
    {
      if (+[CLWorkoutRecorder isSupported](&OBJC_CLASS___CLWorkoutRecorder, "isSupported"))
      {
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3688);
        }
        id v11 = (os_log_s *)qword_101934678;
        if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Publishing Recording",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3688);
          }
          LOWORD(v25[0]) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Publishing Recording",  v25,  2);
          v21 = (uint8_t *)v20;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]",  "%s\n",  v20);
          if (v21 != buf) {
            free(v21);
          }
        }

        id v12 = [*a3 recordingURLs];
        id v13 = [*a3 metadata];
        [*a3 startTime];
        v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
        [*a3 stopTime];
        objc_msgSend( a5,  "publishDataFiles:metadata:startDate:endDate:settings:",  v12,  v13,  v14,  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:"),  a4);
      }

      else
      {
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3688);
        }
        v19 = (os_log_s *)qword_101934678;
        if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Unable to publish recording, no longer allowed.",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3688);
          }
          LOWORD(v25[0]) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Unable to publish recording, no longer allowed.",  v25,  2);
          v23 = (uint8_t *)v22;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]",  "%s\n",  v22);
          if (v23 != buf) {
            free(v23);
          }
        }
      }

      LOBYTE(v6) = 1;
      return (char)v6;
    }

    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v17 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Deferring publishing of recording until publisher is created.",  buf,  2u);
    }

    LODWORD(v6) = sub_1002921D0(115, 2);
    if ((_DWORD)v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Deferring publishing of recording until publisher is created.",  v25,  2,  v25[0]);
LABEL_28:
      v18 = (uint8_t *)v16;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v16);
      if (v18 != buf) {
        free(v18);
      }
      goto LABEL_30;
    }
  }

  else
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    v15 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Deferring publishing of recording until device is unlocked.",  buf,  2u);
    }

    LODWORD(v6) = sub_1002921D0(115, 2);
    if ((_DWORD)v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Deferring publishing of recording until device is unlocked.",  v25,  2,  v25[0]);
      goto LABEL_28;
    }
  }

  return (char)v6;
}

- (id)getWorkingDirectory
{
  return self->_workingDirectory;
}

- (CLDaemonLocation)getRecentLocation
{
  return &self->_recentLocation;
}

- (id)getRecentWeatherData
{
  return self->_serviceLocationClient.__ptr_.__value_;
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3)
  {
    if (*a3 == 1 && *((_BYTE *)a4 + 4))
    {
      self->_deviceUnlocked = 1;
LABEL_7:
      -[CLRecordingTriggerBase publishRecording](self->_workoutRecorderTrigger, "publishRecording");
      -[CLRecordingTriggerBase publishRecording](self->_drivingRecorderTrigger, "publishRecording");
    }
  }

  else
  {
    if (*(_DWORD *)a4 == 1)
    {
      self->_deviceUnlocked = 1;
      goto LABEL_7;
    }

    self->_deviceUnlocked = 0;
  }

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 5)
  {
    __int128 v4 = *((_OWORD *)a4 + 1);
    *(_OWORD *)&self->_recentLocation.suitability = *(_OWORD *)a4;
    *(_OWORD *)&self->_recentLocation.coordinate.longitude = v4;
    __int128 v5 = *((_OWORD *)a4 + 5);
    __int128 v7 = *((_OWORD *)a4 + 2);
    __int128 v6 = *((_OWORD *)a4 + 3);
    *(_OWORD *)&self->_recentLocation.course = *((_OWORD *)a4 + 4);
    *(_OWORD *)&self->_recentLocation.timestamp = v5;
    *(_OWORD *)&self->_recentLocation.altitude = v7;
    *(_OWORD *)&self->_recentLocation.speed = v6;
    $AB5116BA7E623E054F959CECB034F4E7 v9 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
    __int128 v8 = *((_OWORD *)a4 + 8);
    __int128 v10 = *((_OWORD *)a4 + 6);
    *(_OWORD *)&self->_recentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
    self->_recentLocation.rawCoordinate = v9;
    *(_OWORD *)&self->_recentLocation.rawCourse = v8;
    *(_OWORD *)&self->_recentLocation.lifespan = v10;
  }

- (BOOL)acquireTokenWithSettings:(void *)a3 publisher:(id)a4
{
  if (sub_101206080(*(void *)a3))
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    __int128 v6 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: acquireTokenWithSettings, rate limiting is disabled",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v25[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: acquireTokenWithSettings, rate limiting is disabled",  v25,  2);
      v23 = (uint8_t *)v22;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v22);
      if (v23 != buf) {
        free(v23);
      }
    }

    goto LABEL_7;
  }

  if (!a4)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    id v12 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token, no publisher.",  buf,  2u);
    }

    BOOL v13 = sub_1002921D0(115, 0);
    LOBYTE(v7) = 0;
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v25[0]) = 0;
      double v14 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token, no publisher.",  v25,  2);
      v16 = v15;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v14);
      goto LABEL_46;
    }

    return v7;
  }

  if ((sub_1012060E0(*(void *)a3) & 1) == 0)
  {
    sub_1004F2598();
    if ((sub_1004F8A40() & 1) != 0) {
      goto LABEL_7;
    }
  }

  [a4 requestConfiguration];
  double v8 = sub_101206140(*(void *)a3);
  if ((double)rand() * 4.65661287e-10 > v8)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    $AB5116BA7E623E054F959CECB034F4E7 v9 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token. Filtered out due to server side sampling rate.",  buf,  2u);
    }

    BOOL v7 = sub_1002921D0(115, 2);
    if (v7)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LOWORD(v25[0]) = 0;
      double v11 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token. Filtered out due to server side sampling rate.",  v25,  2,  v25[0]);
LABEL_45:
      v16 = v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v11);
LABEL_46:
      if (v16 != buf) {
        free(v16);
      }
      LOBYTE(v7) = 0;
      return v7;
    }

    return v7;
  }

  unsigned int v17 = sub_101205FC0(*(void *)a3);
  unsigned int v18 = sub_101206020(*(void *)a3);
  unsigned int v19 = sub_101205F04(*(void *)a3);
  uint64_t v20 = *(void *)a3;
  if (v19 >= v17)
  {
    sub_101205F60(v20, 1u);
    goto LABEL_32;
  }

  sub_101205F60(v20, v19 + 1);
  if (v19 <= v18)
  {
LABEL_7:
    LOBYTE(v7) = 1;
    return v7;
  }

- (BOOL)createWorkingDirectory
{
  v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  __int128 v4 = -[NSString UTF8String]( -[NSString stringByAppendingString:]( NSTemporaryDirectory(),  "stringByAppendingString:",  @"/WorkoutRecorder"),  "UTF8String");
  sub_1010DDBC0(v19, v4);
  sub_10120A1B0((BOOL *)buf, "WorkoutRecorderWorkingDirectory", (__int128 *)v19, 0);
  if (SHIBYTE(v23) < 0)
  {
    sub_1010DD48C(&__dst, *(void **)&v22[4], *(unint64_t *)&v22[12]);
  }

  else
  {
    __int128 __dst = *(_OWORD *)&v22[4];
    uint64_t v25 = v23;
  }

  if (v25 >= 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (__int128 *)__dst;
  }
  __int128 v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_dst);
  if (SHIBYTE(v25) < 0) {
    operator delete((void *)__dst);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(*(void **)&v22[4]);
  }
  if (v20 < 0) {
    operator delete(v19[0]);
  }
  char v18 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v3, "fileExistsAtPath:isDirectory:", v6, &v18))
  {
    if (!v18)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      v15 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecorder: Unable to create working directory, path exists as a file, path: %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LODWORD(__dst) = 138543362;
      *(void *)((char *)&__dst + 4) = v6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "CLWorkoutRecorder: Unable to create working directory, path exists as a file, path: %{public}@",  &__dst,  12);
      $AB5116BA7E623E054F959CECB034F4E7 v9 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v17);
      goto LABEL_45;
    }

    v19[0] = 0LL;
    -[NSFileManager removeItemAtPath:error:](v3, "removeItemAtPath:error:", v6, v19);
    if (v19[0])
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      BOOL v7 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void **)v22 = v19[0];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecorder: Unable to delete working directory, error: %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v19[0];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "CLWorkoutRecorder: Unable to delete working directory, error: %{public}@",  &__dst,  12);
      $AB5116BA7E623E054F959CECB034F4E7 v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v8);
LABEL_45:
      if (v9 != buf) {
        free(v9);
      }
      return 0;
    }
  }

  v19[0] = 0LL;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v6,  1LL,  0LL,  v19);
  BOOL v10 = v19[0] == 0LL;
  if (v19[0])
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    double v11 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void **)v22 = v19[0];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "CLWorkoutRecorder: Unable to create working directory, error: %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v19[0];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  1LL,  "CLWorkoutRecorder: Unable to create working directory, error: %{public}@",  &__dst,  12);
      BOOL v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }
  }

  else
  {
    p_workingDirectory = &self->_workingDirectory;

    *p_workingDirectory = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6);
  }

  return v10;
}

- (BOOL)workingDirectoryHasSufficientFreeSpace
{
  if (!self->_workingDirectory) {
    return 0;
  }
  uint64_t v17 = 0LL;
  v3 = -[NSFileManager attributesOfFileSystemForPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfFileSystemForPath:error:",  -[NSURL path](self->_workingDirectory, "path"),  &v17);
  if (!v17 && v3)
  {
    id v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", NSFileSystemFreeSize);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    __int128 v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Working directory free space: %{public}@ bytes.",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3688);
      }
      *(_DWORD *)char v18 = 138543362;
      *(void *)&v18[4] = v4;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Working directory free space: %{public}@ bytes.",  v18,  12);
      v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    *(void *)char v18 = 209715200LL;
    sub_10120AA44(buf, "WorkoutRecorderWorkingDirectoryMinSpace", v18, 0);
    unint64_t v6 = *(void *)&v22[4];
    return (unint64_t)[v4 unsignedLongLongValue] > v6;
  }

  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3688);
  }
  double v8 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
  {
    $AB5116BA7E623E054F959CECB034F4E7 v9 = -[NSURL path](self->_workingDirectory, "path");
    *(_DWORD *)buf = 138543618;
    *(void *)v22 = v9;
    *(_WORD *)&v22[8] = 2114;
    *(void *)&v22[10] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecorder: Unable to get free space of working directory. Assuming no free space, path: %{public}@, error: %{public}@",  buf,  0x16u);
  }

  BOOL v10 = sub_1002921D0(115, 0);
  BOOL result = 0;
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    uint64_t v11 = qword_101934678;
    id v12 = -[NSURL path](self->_workingDirectory, "path");
    *(_DWORD *)char v18 = 138543618;
    *(void *)&v18[4] = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v17;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  16LL,  "CLWorkoutRecorder: Unable to get free space of working directory. Assuming no free space, path: %{public}@, error: %{public}@",  v18,  22);
    double v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
    return 0;
  }

  return result;
}

- (void)handleResponse:(id)a3
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3688);
  }
  __int128 v5 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecorder: Received configuration: %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3688);
    }
    int v8 = 138477827;
    id v9 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecorder: Received configuration: %{private}@",  &v8,  12);
    BOOL v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecorder handleResponse:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  -[CLRecordingTriggerBase handlePublisherResponse:](self->_workoutRecorderTrigger, "handlePublisherResponse:", a3);
  -[CLRecordingTriggerBase handlePublisherResponse:](self->_drivingRecorderTrigger, "handlePublisherResponse:", a3);
}

- (void)didUpdateWeather:(id)a3
{
  __int128 v5 = (Client *)[a3 copy];
  self->_serviceLocationClient.__ptr_.__value_ = v5;
  -[CLRecordingTriggerBase feedWeatherData:](self->_workoutRecorderTrigger, "feedWeatherData:", v5);
  -[CLRecordingTriggerBase feedWeatherData:]( self->_drivingRecorderTrigger,  "feedWeatherData:",  self->_serviceLocationClient.__ptr_.__value_);
}

- (void)onWorkoutEffortScoreUpdate:(id)a3
{
  if (a3)
  {
    workoutRecorderTrigger = self->_workoutRecorderTrigger;
    (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
    -[CLRecordingTriggerBase feedWorkoutEffortEstimate:](workoutRecorderTrigger, "feedWorkoutEffortEstimate:", v4);
  }

- (CLWorkoutRecorderPublisher)publisher
{
  return (CLWorkoutRecorderPublisher *)self->_recentWeatherData;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_recentLocation.fromSimulationController;
  *(void *)&self->_recentLocation.fromSimulationController = 0LL;
  if (v3) {
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8LL))(v3, a2);
  }
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((_DWORD *)self + 12) = 0xFFFF;
  *(void *)((char *)self + 60) = 0LL;
  *(void *)((char *)self + 52) = 0LL;
  *(_OWORD *)((char *)self + 68) = xmmword_1012E0070;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)((char *)self + 84) = _Q0;
  *(_OWORD *)((char *)self + 100) = _Q0;
  *(_OWORD *)((char *)self + 116) = _Q0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 40) = 0;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 17) = 0xBFF0000000000000LL;
  *(void *)((char *)self + 164) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 43) = 0x7FFFFFFF;
  *((void *)self + 23) = 0LL;
  *((void *)self + 24) = 0LL;
  *((void *)self + 22) = 0LL;
  *((_BYTE *)self + 200) = 0;
  *((void *)self + 27) = 0LL;
  return self;
}

@end