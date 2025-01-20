@interface CLAvengerObservationReporterService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAvengerObservationReporterService)init;
- (id).cxx_construct;
- (id)clientIdentifier;
- (id)onAppMonitorNotification:(int)a3 data:(uint64_t)a4;
- (int64_t)determineStateWithContext:(CLAvengerObservationReporterServiceStateContext)a3;
- (void)beginService;
- (void)endService;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)registerForAppMonitorNotification;
- (void)registerForAvengerScanner;
- (void)unregisterForAppMonitorNotification;
- (void)unregisterForAvengerScanner;
- (void)updateContext:(CLAvengerObservationReporterServiceStateContext)a3;
@end

@implementation CLAvengerObservationReporterService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A628 != -1) {
    dispatch_once(&qword_10199A628, &stru_10186D130);
  }
  return (id)qword_10199A620;
}

+ (BOOL)isSupported
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10186D150);
  }
  v2 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    __int16 v7 = 1026;
    int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLAvengerObservationReporterService isSupported, supported:%{public}hhd}",  (uint8_t *)v4,  0x18u);
  }

  return 0;
}

- (CLAvengerObservationReporterService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerObservationReporterService;
  return -[CLAvengerObservationReporterService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAvengerObservationReporterServiceProtocol,  &OBJC_PROTOCOL___CLAvengerObservationReporterClientProtocol);
}

- (void)beginService
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10186D150);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLAvengerObservationReporterService beginService}",  (uint8_t *)v4,  0x12u);
  }

  -[CLAvengerObservationReporterService registerForAppMonitorNotification](self, "registerForAppMonitorNotification");
  self->_currentState = 0LL;
  -[CLAvengerObservationReporterService updateContext:]( self,  "updateContext:",  self->_currentContext.cameraForegrounded);
}

- (void)endService
{
}

- (void)updateContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  self->_currentContext = a3;
  int64_t v4 = -[CLAvengerObservationReporterService determineStateWithContext:]( self,  "determineStateWithContext:",  a3.cameraForegrounded);
  if (v4 != self->_currentState)
  {
    self->_int64_t currentState = v4;
    if (v4)
    {
      if (v4 == 1) {
        -[CLAvengerObservationReporterService registerForAvengerScanner](self, "registerForAvengerScanner");
      }
    }

    else
    {
      -[CLAvengerObservationReporterService unregisterForAvengerScanner](self, "unregisterForAvengerScanner");
    }

    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10186D150);
    }
    __int16 v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentState = self->_currentState;
      BOOL cameraForegrounded = self->_currentContext.cameraForegrounded;
      v8[0] = 68289538;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 1026;
      int v12 = currentState;
      __int16 v13 = 1026;
      BOOL v14 = cameraForegrounded;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLAvengerObservationReporterService changed state, _currentState:%{public}d, _cu rrentContext.cameraForegrounded:%{public}hhd}",  (uint8_t *)v8,  0x1Eu);
    }
  }

- (int64_t)determineStateWithContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  return ~*(_DWORD *)&a3.cameraForegrounded & 1LL;
}

- (id)clientIdentifier
{
  return @"CLAvengerObservationReporterService";
}

- (void)registerForAvengerScanner
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10186D150);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLAvengerObservationReporterService received avenger scanner registration}",  (uint8_t *)v5,  0x12u);
  }

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (!self->_scannerClient) {
      self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:optedIn:]( [CLAvengerScannerClient alloc],  "initWithDelegate:queue:optedIn:",  self,  objc_msgSend( objc_msgSend(-[CLAvengerObservationReporterService universe](self, "universe"), "silo"),  "queue"),  0);
    }
  }

  else if (!self->_avengerScannerProxy)
  {
    int64_t v4 = (CLAvengerScannerServiceProtocol *) objc_msgSend( objc_msgSend( -[CLAvengerObservationReporterService universe](self, "universe"),  "vendor"),  "proxyForService:",  @"CLAvengerScanner");
    self->_avengerScannerProxy = v4;
    -[CLAvengerScannerServiceProtocol registerDelegate:inSilo:]( v4,  "registerDelegate:inSilo:",  self,  -[CLAvengerObservationReporterService silo](self, "silo"));
    -[CLAvengerScannerServiceProtocol setDelegateEntityName:]( self->_avengerScannerProxy,  "setDelegateEntityName:",  "CLAvengerObservationReporterService");
    -[CLAvengerScannerServiceProtocol startMonitoringAvengerAdvertisementsForClient:clientName:]( self->_avengerScannerProxy,  "startMonitoringAvengerAdvertisementsForClient:clientName:",  CLISP_ME_TOKEN,  @"CLAvengerObservationReporterService");
  }

- (void)unregisterForAvengerScanner
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10186D150);
  }
  objc_super v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#CLAvengerObservationReporterService received avenger scanner unregistration}",  (uint8_t *)v5,  0x12u);
  }

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    p_scannerClient = (id *)&self->_scannerClient;
  }

  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    if (!*p_scannerClient) {
      return;
    }
    [*p_scannerClient stopMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN];
  }

  id *p_scannerClient = 0LL;
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if (_os_feature_enabled_impl("CoreLocation", "StandardUT")
    && ([a3 isApple] & 1) == 0)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10186D150);
    }
    __int16 v6 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#CLAvengerObservationReporterService onAvengerAdvertisementDetected: dropping non-Apple advertisement}",  (uint8_t *)v7,  0x12u);
    }
  }

  else if (a4)
  {
    [a4 type];
  }

- (void)registerForAppMonitorNotification
{
  value = self->_appMonitorClient.__ptr_.__value_;
  if (!value)
  {
    sub_100D96A2C( (uint64_t)sub_100A9DAE4,  (uint64_t)self,  -[CLAvengerObservationReporterService universe](self, "universe"),  &v7);
    int64_t v4 = v7;
    __int16 v7 = 0LL;
    __int16 v5 = self->_appMonitorClient.__ptr_.__value_;
    self->_appMonitorClient.__ptr_.__value_ = v4;
    if (v5)
    {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
      __int16 v6 = v7;
      __int16 v7 = 0LL;
      if (v6) {
        (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
      }
    }

    value = self->_appMonitorClient.__ptr_.__value_;
  }

  [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
}

- (void)unregisterForAppMonitorNotification
{
  value = self->_appMonitorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:2];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:1];
    int64_t v4 = self->_appMonitorClient.__ptr_.__value_;
    self->_appMonitorClient.__ptr_.__value_ = 0LL;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
    }
  }

- (id)onAppMonitorNotification:(int)a3 data:(uint64_t)a4
{
  unsigned int v4 = a3;
  unsigned int v20 = a3;
  uint64_t v5 = *(unsigned __int8 *)(a4 + 31);
  if ((v5 & 0x80u) == 0LL) {
    uint64_t v6 = *(unsigned __int8 *)(a4 + 31);
  }
  else {
    uint64_t v6 = *(void *)(a4 + 16);
  }
  uint64_t v7 = qword_10199A610;
  if (byte_10199A61F >= 0) {
    uint64_t v7 = byte_10199A61F;
  }
  if (v6 != v7) {
    return result;
  }
  __int16 v9 = (unsigned __int8 *)result;
  v10 = (const void **)(a4 + 8);
  if (byte_10199A61F >= 0) {
    __int16 v11 = &qword_10199A608;
  }
  else {
    __int16 v11 = (uint64_t *)qword_10199A608;
  }
  if ((v5 & 0x80) != 0)
  {
    result = (id)memcmp(*v10, v11, *(void *)(a4 + 16));
    if ((_DWORD)result) {
      return result;
    }
    goto LABEL_17;
  }

  if (!*(_BYTE *)(a4 + 31))
  {
LABEL_17:
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10186D150);
    }
    __int16 v13 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = sub_100D943B0((int *)&v20);
      *(_DWORD *)buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2081;
      v26 = v14;
      __int16 v27 = 2081;
      v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#CLAvengerObservationReporterService onAppMonitorNotification, notification:%{priva te, location:escape_only}s, bundleId:%{private, location:escape_only}s}",  buf,  0x26u);
      unsigned int v4 = v20;
    }

    unsigned int v15 = v9[8];
    if (v4 <= 0xC)
    {
      if (((1 << v4) & 0x1DA1) != 0)
      {
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_10186D150);
        }
        v16 = (os_log_s *)qword_1019349B8;
        if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
        {
          v17 = sub_100D943B0((int *)&v20);
          *(_DWORD *)buf = 68289283;
          int v22 = 0;
          __int16 v23 = 2082;
          v24 = "";
          __int16 v25 = 2081;
          v26 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notificatio n type for camera bundle ID, notification:%{private, location:escape_only}s}",  buf,  0x1Cu);
          if (qword_1019349B0 != -1) {
            dispatch_once(&qword_1019349B0, &stru_10186D150);
          }
        }

        v18 = (os_log_s *)qword_1019349B8;
        if (os_signpost_enabled((os_log_t)qword_1019349B8))
        {
          v19 = sub_100D943B0((int *)&v20);
          *(_DWORD *)buf = 68289283;
          int v22 = 0;
          __int16 v23 = 2082;
          v24 = "";
          __int16 v25 = 2081;
          v26 = v19;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID",  "{msg%{public}.0s:#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notificatio n type for camera bundle ID, notification:%{private, location:escape_only}s}",  buf,  0x1Cu);
        }
      }

      else
      {
        unsigned int v15 = ((1 << v4) & 0x258) != 0;
      }
    }

    return [v9 updateContext:v15];
  }

  int v12 = (unsigned __int8 *)(a4 + 8);
  while (*v12 == *(unsigned __int8 *)v11)
  {
    ++v12;
    __int16 v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v5) {
      goto LABEL_17;
    }
  }

  return result;
}

- (void).cxx_destruct
{
  value = self->_appMonitorClient.__ptr_.__value_;
  self->_appMonitorClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((void *)self + 4) = 0LL;
  return self;
}

@end