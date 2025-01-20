@interface CLDaemonMinimumAltitudeCondition
- (BOOL)isAuthorized;
- (BOOL)valid;
- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 callbackHandler:(id)a8;
- (unint64_t)diagnosticMaskIfNonFunctional;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLDaemonMinimumAltitudeCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 callbackHandler:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLDaemonMinimumAltitudeCondition;
  v13 = -[CLDaemonMinimumAltitudeCondition initWithAltitude:](&v17, "initWithAltitude:");
  if (v13)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10188C5E0);
    }
    v14 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      -[CLDaemonMinimumAltitudeCondition altitude](v13, "altitude");
      *(_DWORD *)buf = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2049;
      uint64_t v23 = v15;
      __int16 v24 = 2050;
      v25 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#minimumAltitudeCondition created, altitude:%{private}f, self:%{public}p}",  buf,  0x26u);
    }

    -[CLDaemonMinimumAltitudeCondition setAuthorizationContext:](v13, "setAuthorizationContext:", a5);
    -[CLDaemonMinimumAltitudeCondition setUniverse:](v13, "setUniverse:", a6);
    -[CLDaemonMinimumAltitudeCondition setOnConditionUpdateCallbackHandler:]( v13,  "setOnConditionUpdateCallbackHandler:",  a8);
    -[CLDaemonMinimumAltitudeCondition setIdentifier:](v13, "setIdentifier:", a7);
    if (-[CLDaemonMinimumAltitudeCondition isAuthorized](v13, "isAuthorized")) {
      -[CLDaemonMinimumAltitudeCondition startMonitoring](v13, "startMonitoring");
    }
  }

  return v13;
}

- (void)dealloc
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_10188C5E0);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2050;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#minimumAltitudeCondition dealloc, self:%{public}p}",  buf,  0x1Cu);
  }

  -[CLDaemonMinimumAltitudeCondition stopMonitoring](self, "stopMonitoring");
  -[CLDaemonMinimumAltitudeCondition setValid:](self, "setValid:", 0LL);

  self->_barometerCalibrationProxy = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLDaemonMinimumAltitudeCondition;
  -[CLDaemonMinimumAltitudeCondition dealloc](&v4, "dealloc");
}

- (BOOL)isAuthorized
{
  return objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  524304);
}

- (void)startMonitoring
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_10188C5E0);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
    int v6 = 68290051;
    int v7 = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2049;
    v11 = v4;
    __int16 v12 = 2050;
    v13 = self;
    __int16 v14 = 1026;
    unsigned int v15 = -[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized");
    __int16 v16 = 1026;
    unsigned int v17 = -[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #minimumAltitudeCondition startMonitoring, altitude:%{private}f, self :%{public}p, isAuthorized:%{public}d, isMonitoring:%{public}d}",  (uint8_t *)&v6,  0x32u);
  }

  if ((-[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring") & 1) == 0
    && !-[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10188C5E0);
    }
    v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 68289282;
      int v7 = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      __int16 v10 = 2050;
      v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #minimumAltitudeCondition startMonitoring not authorized, self:%{public}p}",  (uint8_t *)&v6,  0x1Cu);
    }
  }

- (void)stopMonitoring
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_10188C5E0);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
    v5[0] = 68290051;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    __int16 v8 = 2049;
    uint64_t v9 = v4;
    __int16 v10 = 2050;
    v11 = self;
    __int16 v12 = 1026;
    unsigned int v13 = -[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized");
    __int16 v14 = 1026;
    unsigned int v15 = -[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #minimumAltitudeCondition stopMonitoring, altitude:%{private}f, self :%{public}p, isAuthorized:%{public}d, isMonitoring:%{public}d}",  (uint8_t *)v5,  0x32u);
  }

  if (-[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring"))
  {
    -[CLDaemonMinimumAltitudeCondition setIsMonitoring:](self, "setIsMonitoring:", 0LL);
    -[CLDaemonMinimumAltitudeCondition setLastMonitoringState:](self, "setLastMonitoringState:", 0LL);
    -[CLDaemonMinimumAltitudeCondition setRefinement:](self, "setRefinement:", 0LL);
  }

- (unint64_t)diagnosticMaskIfNonFunctional
{
  if ((int)objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "inUseLevel") <= 0) {
    unint64_t v3 = 16LL
  }
       * (objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "transientAwareRegistrationResult") != 0);
  else {
    unint64_t v3 = 0LL;
  }
  unint64_t v4 = v3 | 0x1000;
  if (objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  16)) {
    v3 |= 0x1000uLL;
  }
  if ((objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  0x100000) & 1) == 0 && objc_msgSend( -[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"),  "transientAwareRegistrationResult") == 4)
  {
    return v4;
  }

  return v3;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end