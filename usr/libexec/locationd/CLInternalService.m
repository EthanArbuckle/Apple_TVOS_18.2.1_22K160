@interface CLInternalService
+ (BOOL)getEffectiveClientName:(id)a3 bundlePath:(id)a4 name:(void *)a5;
+ (id)getAsyncResponseSilo;
+ (id)getIntersiloDelegate;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)currentToken;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLInternalService)init;
- (NSXPCListener)listener;
- (double)groundAltitudeDistanceThreshold;
- (void)applyArchivedAuthorizationDecisions:(id)a3 withConfirmationToken:(id)a4 replyBlock:(id)a5;
- (void)beginService;
- (void)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 replyBlock:(id)a6;
- (void)configure:(id)a3 replyBlock:(id)a4;
- (void)copyLastLogWithReplyBlock:(id)a3;
- (void)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)displayStatisticsWithReplyBlock:(id)a3;
- (void)dumpLogsWithDescription:(id)a3 replyBlock:(id)a4;
- (void)endService;
- (void)getAccessoryMotionSensorLogsWithReply:(id)a3;
- (void)getAccessoryPASCDTransmissionStateWithReplyBlock:(id)a3;
- (void)getAccessoryTypeBitSetWithReplyBlock:(id)a3;
- (void)getActiveClientsUsingLocationWithReplyBlock:(id)a3;
- (void)getActivitiesWithReplyBlock:(id)a3;
- (void)getAppsUsingLocationWithReplyBlock:(id)a3;
- (void)getArchivedAuthorizationDecisionsWithReplyBlock:(id)a3;
- (void)getAuthorizationPromptMapDisplayEnabledWithReplyBlock:(id)a3;
- (void)getAuthorizationStatusForAppWithAuditToken:(id *)a3 replyBlock:(id)a4;
- (void)getAuthorizationStatusForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getClientManagerInternalStateWithReplyBlock:(id)a3;
- (void)getControlPlaneStatusReportClear:(int)a3 replyBlock:(id)a4;
- (void)getGestureServiceEnabledWithReplyBlock:(id)a3;
- (void)getGnssBandsInUseWithReplyBlock:(id)a3;
- (void)getGroundAltitudeForBundleID:(id)a3 orBundlePath:(id)a4 location:(id)a5 replyBlock:(id)a6;
- (void)getGyroCalibrationDatabaseBiasFitAtTemperature:(float)a3 withReply:(id)a4;
- (void)getGyroCalibrationDatabaseBiasFitAtTemplerature:(float)a3 replyBlock:(id)a4;
- (void)getIncidentalUseModeForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getLocationDefaultForKey:(id)a3 replyBlock:(id)a4;
- (void)getLocationForBundleID:(id)a3 orBundlePath:(id)a4 dynamicAccuracyReductionEnabled:(BOOL)a5 allowsAlteredAccessoryLocations:(BOOL)a6 replyBlock:(id)a7;
- (void)getLocationServicesEnabledWithReplyBlock:(id)a3;
- (void)getMicroLocationInternalVersionWithReplyBlock:(id)a3;
- (void)getMonitoredRegionsForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getMotionSensorLogsWithReply:(id)a3;
- (void)getOdometryBatchedLocationsWithReplyBlock:(id)a3;
- (void)getOscarTimeSyncWithReplyBlock:(id)a3;
- (void)getPipelinedCacheWithReply:(id)a3;
- (void)getPrecisionPermissionForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getPrivateMode:(id)a3;
- (void)getStatusBarIconEnabledForEntityClass:(unsigned int)a3 replyBlock:(id)a4;
- (void)getStatusBarIconState:(id)a3;
- (void)getTechnologiesInUseWithReplyBlock:(id)a3;
- (void)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getZaxisStatsWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseWipeWithReplyBlock:(id)a3;
- (void)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6 replyBlock:(id)a7;
- (void)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5;
- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8;
- (void)performMigrationWithReplyBlock:(id)a3;
- (void)pingDaemonWithReplyBlock:(id)a3;
- (void)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 replyBlock:(id)a11;
- (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9;
- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4 withReplyBlock:(id)a5;
- (void)resetAllClientsWithReplyBlock:(id)a3;
- (void)resetClientForBundleId:(id)a3 orBundlePath:(id)a4 withReplyBlock:(id)a5;
- (void)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setAuthorizationStatus:(BOOL)a3 withCorrectiveCompensation:(int)a4 forBundleID:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7;
- (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(id)a5 andSubIdentityIdentifier:(id)a6 forBundleID:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9;
- (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setGestureServiceEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setGroundAltitudeDistanceThreshold:(double)a3;
- (void)setIncidentalUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setListener:(id)a3;
- (void)setLocationButtonUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setLocationDefaultForKey:(id)a3 andValue:(id)a4 replyBlock:(id)a5;
- (void)setLocationServicesEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setMapMatchingRouteHint:(id)a3 routingType:(int)a4 stepType:(int)a5 replyBlock:(id)a6;
- (void)setPrivateMode:(BOOL)a3 replyBlock:(id)a4;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7;
- (void)setStatusBarIconEnabledForEntityClass:(unsigned int)a3 enabled:(BOOL)a4 replyBlock:(id)a5;
- (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 orAuditToken:(id *)a6 byLocationButton:(BOOL)a7 voiceInteractionEnabled:(BOOL)a8 replyBlock:(id)a9;
- (void)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5 replyBlock:(id)a6;
- (void)setTemporaryPreciseAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setTrackRunHint:(id)a3 replyBlock:(id)a4;
- (void)shutdownDaemonWithReplyBlock:(id)a3;
- (void)startStopAdvertisingBeacon:(id)a3 atPower:(int)a4 replyBlock:(id)a5;
- (void)tearDownLocationAuthPromptForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)timeZoneForLocation:(id *)a3 replyBlock:(id)a4;
- (void)triggerExpiredAuthorizationPurgeWithReplyBlock:(id)a3;
- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3 replyBlock:(id)a4;
- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4 replyBlock:(id)a5;
@end

@implementation CLInternalService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A06A8 != -1) {
    dispatch_once(&qword_1019A06A8, &stru_1018A2B28);
  }
  return (id)qword_1019A06A0;
}

- (CLInternalService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLInternalService;
  return -[CLInternalService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLInternalServiceSiloProtocol,  &OBJC_PROTOCOL___CLInternalServiceSiloClientProtocol);
}

- (void)beginService
{
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  objc_super v3 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, beginService", (uint8_t *)buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    *(_WORD *)v17 = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, beginService",  v17,  2);
    v12 = (char *)v11;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService beginService]", "%s\n", v11);
  }

  sub_1002F0B04(buf);
  int v4 = sub_1002A82BC(*(uint64_t *)&buf[0], "CLGetGroundAltitudeDistThres", v17);
  double v5 = *(double *)v17;
  if (!v4) {
    double v5 = 80000.0;
  }
  self->_groundAltitudeDistanceThreshold = v5;
  v6 = (std::__shared_weak_count *)*((void *)&buf[0] + 1);
  if (*((void *)&buf[0] + 1))
  {
    v7 = (unint64_t *)(*((void *)&buf[0] + 1) + 8LL);
    do
      unint64_t v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  self->_listener = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.synchronous");
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    listener = self->_listener;
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = listener;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "#Spi , Listener?, %{public}@",  (uint8_t *)buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    v13 = self->_listener;
    *(_DWORD *)v17 = 138543362;
    *(void *)&v17[4] = v13;
    LODWORD(v16) = 12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  2LL,  "#Spi , Listener?, %{public}@",  v17,  v16);
    v15 = (char *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService beginService]", "%s\n", v14);
  }

  -[NSXPCListener _setQueue:]( -[CLInternalService listener](self, "listener"),  "_setQueue:",  objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"));
  -[NSXPCListener setDelegate:](-[CLInternalService listener](self, "listener"), "setDelegate:", self);
  -[NSXPCListener resume](-[CLInternalService listener](self, "listener"), "resume");
}

- (void)endService
{
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  objc_super v3 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, endService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, endService",  v6,  2);
    double v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService endService]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1019A06B8 != -1) {
    dispatch_once(&qword_1019A06B8, &stru_1018A2B48);
  }
  [a4 setExportedInterface:qword_1019A06B0];
  [a4 setExportedObject:self];
  unsigned int v6 = [a4 processIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1011D8BC8;
  v11[3] = &unk_1018891A8;
  unsigned int v12 = v6;
  [a4 setInterruptionHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1011D8CB0;
  v9[3] = &unk_1018891A8;
  unsigned int v10 = v6;
  [a4 setInvalidationHandler:v9];
  objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"));
  [a4 resume];
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 1026;
    unsigned int v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, New connection resumed, pid:%{public}d}",  buf,  0x18u);
  }

  return 1;
}

+ (id)getIntersiloDelegate
{
  if (qword_1019A06C8 != -1) {
    dispatch_once(&qword_1019A06C8, &stru_1018A2B68);
  }
  return (id)qword_1019A06C0;
}

+ (id)getAsyncResponseSilo
{
  if (qword_1019A06D8 != -1) {
    dispatch_once(&qword_1019A06D8, &stru_1018A2B88);
  }
  return (id)qword_1019A06D0;
}

- (void)getAppsUsingLocationWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetAppsUsingLocation (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2082;
    v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetAppsUsingLocation, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    unsigned int v10 = (NSError *)objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientManager"),  "syncgetCopyClients");
    if (v10)
    {
      (*((void (**)(id, void, NSError *))a3 + 2))(a3, 0LL, v10);
    }

    else
    {
      unsigned int v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v10, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      int v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getAppsUsingLocationWithReplyBlock:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    unsigned int v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v12, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getActiveClientsUsingLocationWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetActiveClientsUsingLocation (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2082;
    v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetActiveClientsUsingLocation, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    unsigned int v10 = (NSError *)objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientManager"),  "syncgetCopyClients");
    if (v10)
    {
      (*((void (**)(id, void, NSError *))a3 + 2))(a3, 0LL, v10);
    }

    else
    {
      unsigned int v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v10, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      int v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getActiveClientsUsingLocationWithReplyBlock:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    unsigned int v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v12, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getTechnologiesInUseWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetTechnologiesInUse (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2082;
    v34 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetTechnologiesInUse, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v26 = 0LL;
    uint64_t v27 = 0LL;
    v25 = (int *)&v26;
    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLLocationController"),  "syncgetActiveTechs:",  &v25))
    {
      unsigned int v10 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      v11 = -[NSMutableArray initWithCapacity:](v10, "initWithCapacity:", v27);
      unsigned int v12 = v25;
      if (v25 != (int *)&v26)
      {
        do
        {
          if (v12[7] >= 1) {
            -[NSMutableArray addObject:]( v11,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
          }
          v13 = (int *)*((void *)v12 + 1);
          if (v13)
          {
            do
            {
              int v14 = v13;
              v13 = *(int **)v13;
            }

            while (v13);
          }

          else
          {
            do
            {
              int v14 = (int *)*((void *)v12 + 2);
              BOOL v15 = *(void *)v14 == (void)v12;
              unsigned int v12 = v14;
            }

            while (!v15);
          }

          unsigned int v12 = v14;
        }

        while (v14 != (int *)&v26);
      }

      (*((void (**)(id, void, NSMutableArray *))a3 + 2))(a3, 0LL, v11);
    }

    else
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      int v18 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#Spi, #warning Couldn't get active location technologies",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        v24[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, #warning Couldn't get active location technologies",  v24,  2);
        v23 = (uint8_t *)v22;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v22);
        if (v23 != buf) {
          free(v23);
        }
      }

      __int16 v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v19, 0LL);
    }

    sub_100008390((uint64_t)&v25, v26);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v16 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v25) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v25,  2);
      __int16 v21 = (uint8_t *)v20;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v20);
      if (v21 != buf) {
        free(v21);
      }
    }

    __int16 v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v17, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getClientManagerInternalStateWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetClientManagerInternalState (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2082;
    v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetClientManagerInternalState, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1011D9F10;
    v14[3] = &unk_1018A2BB0;
    v14[4] = a3;
    objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService"),  "getClientManagerInternalStateWithReply:",  v14);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    unsigned int v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      v13 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getClientManagerInternalStateWithReplyBlock:]",  "%s\n",  v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v11, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getGnssBandsInUseWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetGnssBandsInUse (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v28 = 0;
    __int16 v29 = 2082;
    int v30 = "";
    __int16 v31 = 2082;
    v32 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetGnssBandsInUse, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    __p = 0LL;
    v24 = 0LL;
    uint64_t v25 = 0LL;
    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGnssProvider"),  "syncgetActiveGnssBands:",  &__p))
    {
      unsigned int v10 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      v11 = -[NSMutableArray initWithCapacity:](v10, "initWithCapacity:", ((char *)v24 - (_BYTE *)__p) >> 2);
      unsigned int v12 = (unsigned int *)__p;
      v13 = v24;
      while (v12 != v13)
        -[NSMutableArray addObject:]( v11,  "addObject:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *v12++));
      (*((void (**)(id, void, NSMutableArray *))a3 + 2))(a3, 0LL, v11);
    }

    else
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v16 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#Spi, #warning Couldn't get active GNSS bands",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        v22[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, #warning Couldn't get active GNSS bands",  v22,  2);
        __int16 v21 = (uint8_t *)v20;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v20);
        if (v21 != buf) {
          free(v21);
        }
      }

      __int16 v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v17, 0LL);
    }

    if (__p)
    {
      v24 = (unsigned int *)__p;
      operator delete(__p);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(__p) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &__p,  2);
      __int16 v19 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    BOOL v15 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v15, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setLocationDefaultForKey:(id)a3 andValue:(id)a4 replyBlock:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetLocationDefault (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v35 = 2082;
    *(void *)&v35[2] = "";
    __int16 v36 = 2082;
    *(void *)v37 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetLocationDefault, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.defaults_access");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      sub_100F4B1DC((uint64_t)v23, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v24);
      if (v48 < 0) {
        operator delete(__p);
      }
      if (v46 < 0) {
        operator delete(v45);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(*(void **)&v37[4]);
      }
      if ((v37[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      __int16 v17 = &v24;
      if ((v24.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        __int16 v17 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)v26 = 68289538;
      int v27 = 0;
      __int16 v28 = 2082;
      __int16 v29 = "";
      __int16 v30 = 2114;
      id v31 = a3;
      __int16 v32 = 2082;
      __int16 v33 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Setting default, key:%{public, location:escape_only}@, from:%{public, loc ation:escape_only}s}",  v26,  0x26u);
    }

    if (a4) {
      +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a4,  0LL,  0LL,  0LL);
    }
    sub_1002F0B04(buf);
    sub_1002AB3DC(*(uint64_t *)buf);
    int v18 = *(std::__shared_weak_count **)v35;
    if (*(void *)v35)
    {
      __int16 v19 = (unint64_t *)(*(void *)v35 + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    BOOL v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)v26 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v26,  2);
      v22 = (uint8_t *)v21;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setLocationDefaultForKey:andValue:replyBlock:]",  "%s\n",  v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    uint64_t v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v16);
  }

  os_activity_scope_leave(&state);
}

- (void)getLocationDefaultForKey:(id)a3 replyBlock:(id)a4
{
  v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetLocationDefault (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v32 = 2082;
    *(void *)&v32[2] = "";
    __int16 v33 = 2082;
    *(void *)v34 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetLocationDefault, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.defaults_access");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      sub_100F4B1DC((uint64_t)v21, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v22);
      if (v45 < 0) {
        operator delete(__p);
      }
      if (v43 < 0) {
        operator delete(v42);
      }
      if (v41 < 0) {
        operator delete(v40);
      }
      if (v39 < 0) {
        operator delete(v38);
      }
      if (v37 < 0) {
        operator delete(v36);
      }
      if (v35 < 0) {
        operator delete(*(void **)&v34[4]);
      }
      if ((v34[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      BOOL v15 = &v22;
      if ((v22.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        BOOL v15 = (std::string *)v22.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string v24 = 68289538;
      *(_DWORD *)&v24[4] = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2114;
      id v28 = a3;
      __int16 v29 = 2082;
      __int16 v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Getting default, key:%{public, location:escape_only}@, for:%{public, loca tion:escape_only}s}",  v24,  0x26u);
    }

    *(void *)std::string v24 = 0LL;
    sub_1002F0B04(buf);
    sub_1002A6F20(*(uint64_t *)buf, (uint64_t)a3, (CFTypeRef *)v24);
    uint64_t v16 = *(std::__shared_weak_count **)v32;
    if (*(void *)v32)
    {
      __int16 v17 = (unint64_t *)(*(void *)v32 + 8LL);
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    if (*(void *)v24) {
      +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  *(void *)v24,  200LL,  0LL,  0LL);
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)std::string v24 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v24,  2);
      unint64_t v20 = (uint8_t *)v19;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getLocationDefaultForKey:replyBlock:]", "%s\n", v19);
      if (v20 != buf) {
        free(v20);
      }
    }

    int v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a4 + 2))(a4, v14, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)timeZoneForLocation:(id *)a3 replyBlock:(id)a4
{
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  v7 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonTimeZoneAtLocation (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonTimeZoneAtLocation, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v9 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.time_zone");
  if (v9
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    memset(&__p, 0, sizeof(__p));
    uint64_t v11 = sub_10040BAC0();
    __int128 v12 = *(_OWORD *)&a3->var11;
    __int128 v13 = *(_OWORD *)&a3->var14;
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v33[0] = v13;
    *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)&a3->var16;
    __int128 v14 = *(_OWORD *)&a3->var5;
    __int128 v27 = *(_OWORD *)&a3->var3;
    __int128 v28 = v14;
    __int128 v15 = *(_OWORD *)&a3->var9;
    __int128 v29 = *(_OWORD *)&a3->var7;
    __int128 v30 = v15;
    __int128 v31 = v12;
    __int128 v16 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(_OWORD *)&buf[16] = v16;
    if (sub_10040BF3C(v11, (uint64_t)buf, &__p, &v23))
    {
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      (*((void (**)(id, void, NSString *))a4 + 2))( a4,  0LL,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
    }

    else
    {
      unint64_t v20 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a4 + 2))(a4, v20, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    unint64_t v18 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &__p,  2);
      std::string v22 = (char *)v21;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService timeZoneForLocation:replyBlock:]", "%s\n", v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    __int16 v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a4 + 2))(a4, v19, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setAuthorizationStatus:(BOOL)a3 withCorrectiveCompensation:(int)a4 forBundleID:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  HIDWORD(v32) = a4;
  BOOL v10 = a3;
  __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  __int128 v13 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetAuthorizationStatus (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  __int128 v14 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetAuthorizationStatus, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v15 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v15
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && ([v15 BOOLValue] & 1) != 0)
  {
    if ([a5 length] || objc_msgSend(a6, "length"))
    {
      memset(v53, 0, 35);
      *(_OWORD *)v52 = 0u;
      *(_OWORD *)std::string __p = 0u;
      memset(v51, 0, sizeof(v51));
      __int128 v54 = 0u;
      memset(v55, 0, 59);
      if ([a5 length])
      {
        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)buf);
      }

      else
      {
        if (![a6 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v48, 0, sizeof(v48));
          }
          CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v48, v17);
          sub_100FE36F4((std::string *)__p, (const std::string *)buf);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if (v10) {
            uint64_t v21 = 3LL;
          }
          else {
            uint64_t v21 = 2LL;
          }
          id v22 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_1011F69B0((char *)__dst, (__int128 *)__p);
          id v23 = sub_1011DBFBC((__int128 *)__dst);
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v33, 0, sizeof(v33));
          }
          sub_100F4B1DC((uint64_t)v33, (uint64_t)buf);
          double v24 = sub_1011E2990((uint64_t)buf, &__str);
          if (SHIBYTE(v70) < 0) {
            operator delete((void *)v69);
          }
          if (SHIBYTE(v68) < 0) {
            operator delete((void *)v67);
          }
          if (SHIBYTE(v66) < 0) {
            operator delete((void *)v65);
          }
          if (SHIBYTE(v62) < 0) {
            operator delete((void *)v61);
          }
          if (SHIBYTE(v60) < 0) {
            operator delete((void *)v59);
          }
          if (SHIBYTE(v58) < 0) {
            operator delete(*(void **)&buf[24]);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            p_str = &__str;
          }
          else {
            p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
          }
          objc_msgSend( v22,  "setClientAuthorization:zoneIdentifier:subIdentityIdentifier:status:correctiveCompensation:mayIncreaseAuth:entity:",  v23,  0,  0,  v21,  HIDWORD(v32),  1,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_str, v24));
          if (v47 < 0) {
            operator delete(v46);
          }
          if (v45 < 0) {
            operator delete(v44);
          }
          if (v43 < 0) {
            operator delete(v42);
          }
          if (v41 < 0) {
            operator delete(v40);
          }
          if (v39 < 0) {
            operator delete(v38);
          }
          if (v37 < 0) {
            operator delete(v36);
          }
          if (v35 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a7 + 2))(a7, 0LL);
          if (SBYTE7(v55[3]) < 0) {
            operator delete(*(void **)&v55[2]);
          }
          if (SHIBYTE(v55[1]) < 0) {
            operator delete(*((void **)&v55[0] + 1));
          }
          if (SBYTE7(v55[0]) < 0) {
            operator delete((void *)v54);
          }
          if (SHIBYTE(v53[3]) < 0) {
            operator delete(v53[1]);
          }
          if (SHIBYTE(v53[0]) < 0) {
            operator delete(v52[0]);
          }
          if (SHIBYTE(v51[3]) < 0) {
            operator delete(v51[1]);
          }
          if (SHIBYTE(v51[0]) < 0) {
            operator delete(__p[0]);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a6 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)buf);
      }

      if (SHIBYTE(v51[0]) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::string __p = *(_OWORD *)buf;
      v51[0] = *(void **)&buf[16];
      buf[23] = 0;
      buf[0] = 0;
      if (SHIBYTE(v51[3]) < 0) {
        operator delete(v51[1]);
      }
      *(_OWORD *)&v51[1] = *(_OWORD *)&buf[24];
      v51[3] = v58;
      HIBYTE(v58) = 0;
      buf[24] = 0;
      if (SHIBYTE(v53[0]) < 0) {
        operator delete(v52[0]);
      }
      *(_OWORD *)v52 = v59;
      v53[0] = v60;
      HIBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      if (SHIBYTE(v53[3]) < 0) {
        operator delete(v53[1]);
      }
      *(_OWORD *)&v53[1] = v61;
      v53[3] = v62;
      HIBYTE(v62) = 0;
      LOBYTE(v61) = 0;
      LOWORD(v53[4]) = v63;
      BYTE2(v53[4]) = v64;
      if (SBYTE7(v55[0]) < 0) {
        operator delete((void *)v54);
      }
      __int128 v54 = v65;
      *(void *)&v55[0] = v66;
      HIBYTE(v66) = 0;
      LOBYTE(v65) = 0;
      if (SHIBYTE(v55[1]) < 0) {
        operator delete(*((void **)&v55[0] + 1));
      }
      char v20 = 0;
      *(_OWORD *)((char *)v55 + 8) = v67;
      *((void *)&v55[1] + 1) = v68;
      HIBYTE(v68) = 0;
      LOBYTE(v67) = 0;
      if (SBYTE7(v55[3]) < 0)
      {
        operator delete(*(void **)&v55[2]);
        char v20 = HIBYTE(v68);
      }

      v55[2] = v69;
      *(void *)&v55[3] = v70;
      HIBYTE(v70) = 0;
      LOBYTE(v69) = 0;
      WORD4(v55[3]) = v71;
      BYTE10(v55[3]) = v72;
      if (v20 < 0) {
        operator delete((void *)v67);
      }
      if (SHIBYTE(v66) < 0) {
        operator delete((void *)v65);
      }
      if (SHIBYTE(v62) < 0) {
        operator delete((void *)v61);
      }
      if (SHIBYTE(v60) < 0) {
        operator delete((void *)v59);
      }
      if (SHIBYTE(v58) < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    v26 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(__p[0]) = 0;
      LODWORD(v32) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status",  __p,  v32);
      __int128 v31 = (char *)v30;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v30);
      if (v31 != buf) {
        free(v31);
      }
    }

    __int128 v27 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a7 + 2))(a7, v27);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    unint64_t v18 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(__p[0]) = 0;
      LODWORD(v32) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  __p,  v32);
      __int128 v29 = (char *)v28;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v28);
      if (v29 != buf) {
        free(v29);
      }
    }

    __int16 v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a7 + 2))(a7, v19);
  }

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4 withReplyBlock:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: -[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:] (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2082;
    v26[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:], event:%{publi c, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.report_location_utility_event");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int128 v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v22 = 0;
      __int16 v23 = 2082;
      double v24 = "";
      __int16 v25 = 1026;
      LODWORD(v26[0]) = v7;
      WORD2(v26[0]) = 2114;
      *(void *)((char *)v26 + 6) = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, #LocationUtilityEvent Reported, utility:%{public}d, date:%{public, locati on:escape_only}@}",  buf,  0x22u);
    }

    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "reportLocationUtilityEvent:atDate:",  v7,  a4);
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v19[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v19,  2);
      unint64_t v18 = (uint8_t *)v17;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:]",  "%s\n",  v17);
      if (v18 != buf) {
        free(v18);
      }
    }

    uint64_t v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v16);
  }

  os_activity_scope_leave(&state);
}

- (void)resetClientForBundleId:(id)a3 orBundlePath:(id)a4 withReplyBlock:(id)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonResetClient (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonResetClient, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A2D08);
    }
    unint64_t v18 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539LL;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:bundleId or bundlePath must be provided to reset client authorization, event:%{publ ic, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A2D08);
      }
    }

    __int16 v19 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539LL;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "bundleId or bundlePath must be provided to reset client authorization",  "{msg%{public}.0s:bundleId or bundlePath must be provided to reset client authorization, event:%{publ ic, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A2D08);
      }
    }

    a5 = (id)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539LL;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)a5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:bundleId or bundlePath must be provided to reset client authorization, event:%{publ ic, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLInternalService.mm",  549,  "-[CLInternalService resetClientForBundleId:orBundlePath:withReplyBlock:]");
    __break(1u);
LABEL_80:
    dispatch_once(&qword_101934970, &stru_1018A2D28);
    goto LABEL_42;
  }

  if ((sub_1011DCD7C((uint64_t)@"com.apple.locationd.clearauthorizations") & 1) != 0
    || (sub_1011DCD7C((uint64_t)@"com.apple.locationd.authorizeapplications") & 1) != 0)
  {
    memset(v41, 0, 35);
    *(_OWORD *)char v40 = 0u;
    memset(buf, 0, sizeof(buf));
    __int128 v42 = 0u;
    memset(v43, 0, 59);
    if ([a3 length])
    {
      sub_1010DDBC0(&__str, (char *)[a3 UTF8String]);
      sub_100FE2D54(&__str, (uint64_t)&v22);
    }

    else
    {
      if (![a4 length]) {
        goto LABEL_39;
      }
      sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
      sub_100FE2DDC(&__str, (uint64_t)&v22);
    }

    buf[0] = v22;
    v22.__r_.__value_.__s.__size_ = 0;
    v22.__r_.__value_.__s.__data_[0] = 0;
    buf[1] = v23;
    v23.__r_.__value_.__s.__size_ = 0;
    v23.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v41[0]) < 0) {
      operator delete(v40[0]);
    }
    *(_OWORD *)char v40 = v24;
    v41[0] = v25;
    HIBYTE(v25) = 0;
    LOBYTE(v24) = 0;
    if (SHIBYTE(v41[3]) < 0) {
      operator delete(v41[1]);
    }
    *(_OWORD *)&v41[1] = v26;
    v41[3] = v27;
    HIBYTE(v27) = 0;
    LOBYTE(v26) = 0;
    LOWORD(v41[4]) = v28;
    BYTE2(v41[4]) = v29;
    if (SBYTE7(v43[0]) < 0) {
      operator delete((void *)v42);
    }
    __int128 v42 = v30;
    *(void *)&v43[0] = v31;
    HIBYTE(v31) = 0;
    LOBYTE(v30) = 0;
    if (SHIBYTE(v43[1]) < 0) {
      operator delete(*((void **)&v43[0] + 1));
    }
    char v13 = 0;
    *(_OWORD *)((char *)v43 + 8) = v32;
    *((void *)&v43[1] + 1) = v33;
    HIBYTE(v33) = 0;
    LOBYTE(v32) = 0;
    if (SBYTE7(v43[3]) < 0)
    {
      operator delete(*(void **)&v43[2]);
      char v13 = HIBYTE(v33);
    }

    v43[2] = v34;
    *(void *)&v43[3] = v35;
    HIBYTE(v35) = 0;
    LOBYTE(v34) = 0;
    WORD4(v43[3]) = v36;
    BYTE10(v43[3]) = v37;
    if (v13 < 0) {
      operator delete((void *)v32);
    }
    if (SHIBYTE(v31) < 0) {
      operator delete((void *)v30);
    }
    if (SHIBYTE(v27) < 0) {
      operator delete((void *)v26);
    }
    if (SHIBYTE(v25) < 0) {
      operator delete((void *)v24);
    }
    if ((char)__str.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(__str.__r_.__value_.__l.__data_);
      if (self) {
        goto LABEL_40;
      }
      goto LABEL_46;
    }

- (void)resetAllClientsWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unsigned int v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonResetAllClients (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v21 = 2082;
    std::string v22 = "";
    __int16 v23 = 2082;
    v24[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonResetAllClients, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v10 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    sub_100F4B1DC((uint64_t)v17, (uint64_t)buf);
    double v13 = sub_1011E2990((uint64_t)buf, &v18);
    if (v35 < 0) {
      operator delete(__p);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(*(void **)((char *)v24 + 4));
    }
    if (SBYTE3(v24[0]) < 0) {
      operator delete(*(void **)buf);
    }
    if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      __int128 v14 = &v18;
    }
    else {
      __int128 v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
    objc_msgSend( v10,  "setLastLocationSettingsEventSource:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14, v13));
    [v10 resetClients];
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v18.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v18,  2);
      id v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService resetAllClientsWithReplyBlock:]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    id v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a3 + 2))(a3, v12);
  }

  os_activity_scope_leave(&state);
}

- (void)getArchivedAuthorizationDecisionsWithReplyBlock:(id)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.archived_authorization_decisions");
  if (v6
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && ([v6 BOOLValue] & 1) != 0)
  {
    id v8 = objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "syncgetArchivedAuthorizationDecisions");
    if (v8) {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0LL, v8);
    }
    else {
      (*((void (**)(id, NSError *, void))a3 + 2))( a3,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  0LL),  0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v9 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v13,  2);
      id v12 = (uint8_t *)v11;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getArchivedAuthorizationDecisionsWithReplyBlock:]",  "%s\n",  v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    id v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v10, 0LL);
  }
}

- (void)applyArchivedAuthorizationDecisions:(id)a3 withConfirmationToken:(id)a4 replyBlock:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.archived_authorization_decisions");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    (*((void (**)(id, id))a5 + 2))( a5,  objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "syncgetApplyArchivedAuthorizationDecisionsAndDie:unlessTokenMatches:",  a3,  a4));
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      id v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService applyArchivedAuthorizationDecisions:withConfirmationToken:replyBlock:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    double v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v13);
  }
}

- (void)setPrivateMode:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  BOOL v26 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetPrivateMode (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v28 = 0;
    __int16 v29 = 2082;
    __int128 v30 = "";
    __int16 v31 = 2082;
    __int128 v32 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetPrivateMode, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.CoreLocation.PrivateMode");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    uint64_t v12 = sub_1002F8DDC();
    char v13 = sub_1002A6FD4(v12, (uint64_t)@"PrivateMode", v24);
    if (v24[0] == v5) {
      char v14 = v13;
    }
    else {
      char v14 = 0;
    }
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = sub_1002F8DDC();
      sub_1002AB464(v15, @"PrivateMode", &v26);
      uint64_t v16 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v16 + 944LL))(v16);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      __int16 v17 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289282;
        int v28 = 0;
        __int16 v29 = 2082;
        __int128 v30 = "";
        __int16 v31 = 1026;
        LODWORD(v32) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, private mode changed, privateModeEnabled:%{public}hhd}",  buf,  0x18u);
      }

      id v18 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLNetworkLocationProvider");
      [v18 setPrivateMode:v26];
      id v19 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLHarvesterService");
      [v19 setPrivateMode:v26];
    }

    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v20 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v24 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v24,  2);
      __int16 v23 = (uint8_t *)v22;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setPrivateMode:replyBlock:]", "%s\n", v22);
      if (v23 != buf) {
        free(v23);
      }
    }

    __int16 v21 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v21);
  }

  os_activity_scope_leave(&state);
}

- (void)getPrivateMode:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetPrivateMode (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    std::string v22 = "";
    __int16 v23 = 2082;
    __int128 v24 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetPrivateMode, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v7 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.CoreLocation.PrivateMode");
  if (v7
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v9 = sub_1002F8DDC();
    unsigned int v10 = sub_1002A6FD4(v9, (uint64_t)@"PrivateMode", v17);
    if (v17[0]) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0LL;
    }
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      std::string v22 = "";
      __int16 v23 = 1026;
      LODWORD(v24) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:getPrivateMode called, privateMode:%{public}hhd}",  buf,  0x18u);
    }

    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0LL, v11);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int16 v17 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v17,  2);
      uint64_t v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPrivateMode:]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    char v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v14, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setLocationServicesEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetLocationServicesEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v38 = 2082;
    char v39 = "";
    __int16 v40 = 2082;
    *(void *)char v41 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetLocationServicesEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v29, 0, sizeof(v29));
      }
      sub_100F4B1DC((uint64_t)v29, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, v31);
      if (v52 < 0) {
        operator delete(__p);
      }
      if (v50 < 0) {
        operator delete(v49);
      }
      if (v48 < 0) {
        operator delete(v47);
      }
      if (v46 < 0) {
        operator delete(v45);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(*(void **)&v41[4]);
      }
      if ((v41[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v15 = v31;
      if ((v31[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v15 = (std::string *)v31[0].__r_.__value_.__r.__words[0];
      }
      uint64_t v16 = "enabled";
      if (!v5) {
        uint64_t v16 = "disabled";
      }
      LODWORD(v32.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      WORD2(v32.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v32.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, %{public}s is setting location services to %{public}s",  (uint8_t *)&v32,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v22 = qword_101934978;
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      sub_100F4B1DC((uint64_t)v28, (uint64_t)v31);
      sub_1011E2990((uint64_t)v31, &v32);
      sub_1011F6920((uint64_t)v31);
      __int16 v23 = (std::string *)v32.__r_.__value_.__r.__words[0];
      __int128 v24 = "disabled";
      if ((v32.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        __int16 v23 = &v32;
      }
      if (v5) {
        __int128 v24 = "enabled";
      }
      int v33 = 136446466;
      __int128 v34 = v23;
      __int16 v35 = 2082;
      __int16 v36 = v24;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v22,  0LL,  "#Spi, %{public}s is setting location services to %{public}s",  &v33,  22);
      BOOL v26 = v25;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v26);
    }

    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    sub_100F4B1DC((uint64_t)v27, (uint64_t)buf);
    double v17 = sub_1011E2990((uint64_t)buf, v31);
    if (v52 < 0) {
      operator delete(__p);
    }
    if (v50 < 0) {
      operator delete(v49);
    }
    if (v48 < 0) {
      operator delete(v47);
    }
    if (v46 < 0) {
      operator delete(v45);
    }
    if (v44 < 0) {
      operator delete(v43);
    }
    if (v42 < 0) {
      operator delete(*(void **)&v41[4]);
    }
    if ((v41[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if ((v31[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      id v18 = v31;
    }
    else {
      id v18 = (std::string *)v31[0].__r_.__value_.__r.__words[0];
    }
    id v19 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18, v17);
    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "syncgetSetLocationServicesEnabledStatically:withEventSource:",  v5,  v19);
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v31[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v31,  2);
      __int16 v21 = (uint8_t *)v20;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v20);
      if (v21 != buf) {
        free(v21);
      }
    }

    char v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v14);
  }

  os_activity_scope_leave(&state);
}

- (void)getLocationServicesEnabledWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetLocationServicesEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2082;
    char v14 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetLocationServicesEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  uint64_t v7 = sub_1002958AC();
  (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0LL, v7);
  os_activity_scope_leave(&v8);
}

- (void)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  BOOL v35 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetAuthorizationPromptMapDisplayEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)char v43 = 2082;
    *(void *)&v43[2] = "";
    __int16 v44 = 2082;
    *(void *)char v45 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetAuthorizationPromptMapDisplayEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }

      else
      {
        __int128 v32 = 0u;
        __int128 v33 = 0u;
      }

      sub_100F4B1DC((uint64_t)&v32, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, v36);
      if (v56 < 0) {
        operator delete(__p);
      }
      if (v54 < 0) {
        operator delete(v53);
      }
      if (v52 < 0) {
        operator delete(v51);
      }
      if (v50 < 0) {
        operator delete(v49);
      }
      if (v48 < 0) {
        operator delete(v47);
      }
      if (v46 < 0) {
        operator delete(*(void **)&v45[4]);
      }
      if ((v45[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v15 = v36;
      if ((v36[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v15 = (std::string *)v36[0].__r_.__value_.__r.__words[0];
      }
      uint64_t v16 = "enabled";
      if (!v5) {
        uint64_t v16 = "disabled";
      }
      LODWORD(v37.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v37.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      WORD2(v37.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v37.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, %{public}s is setting authorization prompt map display to %{public}s",  (uint8_t *)&v37,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v25 = qword_101934978;
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }

      else
      {
        __int128 v30 = 0u;
        __int128 v31 = 0u;
      }

      sub_100F4B1DC((uint64_t)&v30, (uint64_t)v36);
      sub_1011E2990((uint64_t)v36, &v37);
      sub_1011F6920((uint64_t)v36);
      BOOL v26 = (std::string *)v37.__r_.__value_.__r.__words[0];
      char v27 = "disabled";
      if ((v37.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        BOOL v26 = &v37;
      }
      if (v5) {
        char v27 = "enabled";
      }
      int v38 = 136446466;
      char v39 = v26;
      __int16 v40 = 2082;
      char v41 = v27;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v25,  0LL,  "#Spi, %{public}s is setting authorization prompt map display to %{public}s",  &v38,  22,  v30,  v31,  v32,  v33);
      __int16 v29 = v28;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]",  "%s\n",  v29);
    }

    sub_1002F0B04(buf);
    sub_1002AB464(*(uint64_t *)buf, @"AuthorizationPromptMapDisplayEnabled", &v35);
    double v17 = *(std::__shared_weak_count **)v43;
    if (*(void *)v43)
    {
      id v18 = (unint64_t *)(*(void *)v43 + 8LL);
      do
        unint64_t v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    sub_1002F0B04(buf);
    sub_1002F13B4(*(uint64_t *)buf);
    int v20 = *(std::__shared_weak_count **)v43;
    if (*(void *)v43)
    {
      __int16 v21 = (unint64_t *)(*(void *)v43 + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v36[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v36,  2);
      __int128 v24 = (uint8_t *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    char v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v14);
  }

  os_activity_scope_leave(&state);
}

- (void)getAuthorizationPromptMapDisplayEnabledWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetAuthorizationPromptMapDisplayEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2082;
    char v14 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetAuthorizationPromptMapDisplayEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  BOOL v7 = sub_1002958D8();
  (*((void (**)(id, void, BOOL))a3 + 2))(a3, 0LL, v7);
  os_activity_scope_leave(&v8);
}

- (void)setGestureServiceEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v42 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v7 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetGestureServiceEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  os_activity_scope_state_s v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetGestureServiceEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v9 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v9
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(buf, 0, 32);
    }
    sub_100F4B1DC((uint64_t)buf, (uint64_t)v27);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      sub_100F4B1DC((uint64_t)v25, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v26);
      if (v61 < 0) {
        operator delete(__p);
      }
      if (v59 < 0) {
        operator delete(v58);
      }
      if (v57 < 0) {
        operator delete(v56);
      }
      if (v55 < 0) {
        operator delete(v54);
      }
      if (v53 < 0) {
        operator delete(v52);
      }
      char v14 = &v26;
      if ((v26.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        char v14 = (std::string *)v26.__r_.__value_.__r.__words[0];
      }
      uint64_t v15 = "enabled";
      *(_DWORD *)char v43 = 68289538;
      if (!v42) {
        uint64_t v15 = "disabled";
      }
      int v44 = 0;
      __int16 v45 = 2082;
      char v46 = "";
      __int16 v47 = 2082;
      char v48 = v14;
      __int16 v49 = 2082;
      char v50 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, Setting ear gesture service, bundle:%{public, location:escape_only}s, setti ng:%{public, location:escape_only}s}",  v43,  0x26u);
    }

    sub_1002F0B04(buf);
    sub_1002AB464(*(uint64_t *)buf, @"GestureServiceEnabled", &v42);
    uint64_t v16 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      double v17 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    sub_1002F0B04(buf);
    sub_1002F13B4(*(uint64_t *)buf);
    unint64_t v19 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      int v20 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd/Prefs", 0LL, 0LL, 1u);
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
    if (v40 < 0) {
      operator delete(v39);
    }
    if (v38 < 0) {
      operator delete(v37);
    }
    if (v36 < 0) {
      operator delete(v35);
    }
    if (v34 < 0) {
      operator delete(v33);
    }
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27[0]);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v27[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v27,  2);
      __int128 v24 = (uint8_t *)v23;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setGestureServiceEnabled:replyBlock:]", "%s\n", v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    uint64_t v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v12);
  }

  os_activity_scope_leave(&state);
}

- (void)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5 replyBlock:(id)a6
{
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLSetClientTransientAuthorizationInfo (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    unint64_t v21 = "";
    __int16 v22 = 2082;
    __int16 v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLSetClientTransientAuthorizationInfo, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    (*((void (**)(id, NSError *))a6 + 2))( a6,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  1LL,  0LL));
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      uint64_t v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:replyBlock:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    __int16 v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v13);
  }

  os_activity_scope_leave(&state);
}

- (void)getAuthorizationStatusForAppWithAuditToken:(id *)a3 replyBlock:(id)a4
{
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetAuthorizationStatusForAppWithAuditToken (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v68 = 2082;
    __int128 v69 = "";
    __int16 v70 = 2082;
    *(void *)__int16 v71 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetAuthorizationStatusForAppWithAuditToken, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.effective_bundle");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    sub_100F4B1DC((uint64_t)a3, (uint64_t)v42);
    id v12 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
    sub_1011F69B0((char *)__dst, (__int128 *)v42);
    id v13 = [v12 syncgetClientEffectiveRegistrationResultWithTransientAwareness:sub_1011DBFBC((__int128 *)__dst)];
    if (v41 < 0) {
      operator delete(__p);
    }
    if (v39 < 0) {
      operator delete(v38);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(__dst[0]);
    }
    id v14 = [v12 syncgetRegistrationResultToAuthorizationStatus:v13];
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      __int128 v16 = *(_OWORD *)&a3->var0[4];
      v26[0] = *(_OWORD *)a3->var0;
      v26[1] = v16;
      sub_100F4B1DC((uint64_t)v26, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v27);
      if (v82 < 0) {
        operator delete(v81);
      }
      if (v80 < 0) {
        operator delete(v79);
      }
      if (v78 < 0) {
        operator delete(v77);
      }
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(*(void **)&v71[4]);
      }
      if ((v71[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        double v17 = &v27;
      }
      else {
        double v17 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }
      sub_100FE3FB4((uint64_t)v42, (uint64_t)buf);
      int v18 = v71[3];
      int v19 = *(uint8_t **)buf;
      __int16 v20 = sub_100297548(v14);
      unint64_t v21 = buf;
      *(_DWORD *)char v57 = 68289794;
      if (v18 < 0) {
        unint64_t v21 = v19;
      }
      int v58 = 0;
      __int16 v59 = 2082;
      v60 = "";
      __int16 v61 = 2082;
      v62 = v17;
      __int16 v63 = 2082;
      char v64 = v21;
      __int16 v65 = 2082;
      uint64_t v66 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Authorization status for App With Audit Token, bundle:%{public, location:esca pe_only}s, clientKey:%{public, location:escape_only}s, status:%{public, location:escape_only}s}",  v57,  0x30u);
      if ((v71[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }

    (*((void (**)(id, void, id))a4 + 2))(a4, 0LL, v14);
    if (v55 < 0) {
      operator delete(v54);
    }
    if (v53 < 0) {
      operator delete(v52);
    }
    if (v51 < 0) {
      operator delete(v50);
    }
    if (v49 < 0) {
      operator delete(v48);
    }
    if (v47 < 0) {
      operator delete(v46);
    }
    if (v45 < 0) {
      operator delete(v44);
    }
    if (v43 < 0) {
      operator delete(v42[0]);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v22 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v42[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v42,  2);
      uint64_t v25 = (uint8_t *)v24;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getAuthorizationStatusForAppWithAuditToken:replyBlock:]",  "%s\n",  v24);
      if (v25 != buf) {
        free(v25);
      }
    }

    __int16 v23 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a4 + 2))(a4, v23, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v7 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLGetClientTransientAuthorizationInfo (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  os_activity_scope_state_s v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLGetClientTransientAuthorizationInfo, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v9 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v9
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    (*((void (**)(id, NSError *, void))a5 + 2))( a5,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  1LL,  0LL),  0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      id v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getTemporaryAuthorizationStatusForBundleId:orBundlePath:replyBlock:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    id v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, v12, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLInternalChangeClientAuthorizationTime (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2082;
    __int16 v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLInternalChangeClientAuthorizationTime, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.integritycheck");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    (*((void (**)(id, void, double))a6 + 2))(a6, 0LL, 0.0);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      uint64_t v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService modifyOrSetAuthorizationTime:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    id v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, double))a6 + 2))(a6, v13, -1.0);
  }

  os_activity_scope_leave(&state);
}

- (void)triggerExpiredAuthorizationPurgeWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLInternalTriggerExpiredAuthorizationPurge (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2082;
    __int16 v21 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLInternalTriggerExpiredAuthorizationPurge, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.integritycheck");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "triggerClearAppClipAuthorizationIfNecessary");
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v14,  2);
      id v13 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService triggerExpiredAuthorizationPurgeWithReplyBlock:]",  "%s\n",  v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    uint64_t v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a3 + 2))(a3, v11);
  }

  os_activity_scope_leave(&state);
}

- (void)getGestureServiceEnabledWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetGestureServiceEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int128 v16 = 2082;
    *(void *)&v16[2] = "";
    __int16 v17 = 2082;
    __int16 v18 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetGestureServiceEnabled, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  sub_1002F0B04(buf);
  int v7 = sub_1002A6FD4(*(uint64_t *)buf, (uint64_t)@"GestureServiceEnabled", &v13);
  int v8 = v7;
  uint64_t v9 = *(std::__shared_weak_count **)v16;
  if (*(void *)v16)
  {
    id v10 = (unint64_t *)(*(void *)v16 + 8LL);
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      if (v8) {
        goto LABEL_10;
      }
LABEL_12:
      BOOL v12 = 0LL;
      BOOL v13 = 0;
      goto LABEL_13;
    }
  }

  if (!v7) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v12 = v13;
LABEL_13:
  (*((void (**)(id, void, BOOL))a3 + 2))(a3, 0LL, v12);
  os_activity_scope_leave(&state);
}

- (void)pingDaemonWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonPingDaemon (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2082;
    v23[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonPingDaemon, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  int v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    sub_100F4B1DC((uint64_t)v10, (uint64_t)buf);
    sub_1011E2990((uint64_t)buf, &v11);
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
      operator delete(*(void **)((char *)v23 + 4));
    }
    if (SBYTE3(v23[0]) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v9 = &v11;
    if ((v11.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)BOOL v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    __int128 v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Pinged by external process, process:%{public, location:escape_only}s}",  v13,  0x1Cu);
  }

  (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  os_activity_scope_leave(&state);
}

- (void)getPrecisionPermissionForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetPrecisionPermission (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  std::string v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetPrecisionPermission, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  *(_OWORD *)char v26 = 0u;
  memset(v27, 0, 19);
  __int128 v24 = 0u;
  *(_OWORD *)uint64_t v25 = 0u;
  memset(buf, 0, sizeof(buf));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  memset(v31, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  buf))
  {
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }

    else
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
    }

    CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)&v19, v12);
    sub_100FE36F4((std::string *)buf, &__p);
    id v14 = objc_msgSend( -[CLInternalService vendor](self, "vendor", v19, v20),  "proxyForService:",  @"CLClientAuthorizationCache");
    sub_100FE3FB4((uint64_t)buf, (uint64_t)&__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    id v16 = objc_msgSend( v14,  "syncgetAuthorizationContextIfClientIsNonZonal:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
    unsigned int v17 = [v16 isAuthorizedForServiceType:12];
    else {
      uint64_t v18 = v17;
    }
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0LL, v18);
  }

  else
  {
    BOOL v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, v13, 0LL);
  }

  if (SHIBYTE(v31[2]) < 0) {
    operator delete(v31[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(*((void **)&v29 + 1));
  }
  if (SBYTE7(v29) < 0) {
    operator delete((void *)v28);
  }
  if ((v27[15] & 0x80000000) != 0) {
    operator delete(v26[1]);
  }
  if (SHIBYTE(v26[0]) < 0) {
    operator delete(v25[0]);
  }
  if (SHIBYTE(v24) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)getAuthorizationStatusForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  __int16 v22 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetAuthorizationStatus (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v10 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v66 = 2082;
    __int128 v67 = "";
    __int16 v68 = 2082;
    *(void *)__int128 v69 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetAuthorizationStatus, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  *(_OWORD *)int v44 = 0u;
  memset(v45, 0, 19);
  __int128 v42 = 0u;
  *(_OWORD *)char v43 = 0u;
  *(_OWORD *)char v40 = 0u;
  *(_OWORD *)char v41 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  memset(v49, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  v40))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v39, v11);
    sub_100FE36F4((std::string *)v40, (const std::string *)buf);
    if ((v69[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    id v13 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
    sub_1011F69B0((char *)__dst, (__int128 *)v40);
    id v14 = [v13 syncgetClientEffectiveRegistrationResultWithTransientAwareness:sub_1011DBFBC((__int128 *)__dst)];
    if (v38 < 0) {
      operator delete(__p);
    }
    if (v36 < 0) {
      operator delete(v35);
    }
    if (v34 < 0) {
      operator delete(v33);
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
      operator delete(__dst[0]);
    }
    id v15 = [v13 syncgetRegistrationResultToAuthorizationStatus:v14];
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v16 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      sub_100F4B1DC((uint64_t)v23, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v24);
      if (v80 < 0) {
        operator delete(v79);
      }
      if (v78 < 0) {
        operator delete(v77);
      }
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(*(void **)&v69[4]);
      }
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((v24.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unsigned int v17 = &v24;
      }
      else {
        unsigned int v17 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      sub_100FE3FB4((uint64_t)v40, (uint64_t)buf);
      int v18 = v69[3];
      __int128 v19 = *(uint8_t **)buf;
      __int128 v20 = sub_100297548(v15);
      __int16 v21 = buf;
      *(_DWORD *)char v51 = 68290306;
      if (v18 < 0) {
        __int16 v21 = v19;
      }
      int v52 = 0;
      __int16 v53 = 2082;
      char v54 = "";
      __int16 v55 = 2082;
      char v56 = v17;
      __int16 v57 = 2114;
      id v58 = a3;
      __int16 v59 = 2114;
      id v60 = a4;
      __int16 v61 = 2082;
      v62 = v21;
      __int16 v63 = 2082;
      char v64 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Authorization status for BundleID or BundlePath, bundle:%{public, location:es cape_only}s, SpecifiedBundleId:%{public, location:escape_only}@, SpecifiedBundlePath:%{public, location: escape_only}@, clientKey:%{public, location:escape_only}s, status:%{public, location:escape_only}s}",  v51,  0x44u);
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }

    (*((void (**)(id, void, id))a5 + 2))(a5, 0LL, v15);
  }

  else
  {
    BOOL v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, v12, 0LL);
  }

  if (SHIBYTE(v49[2]) < 0) {
    operator delete(v49[0]);
  }
  if (SHIBYTE(v48) < 0) {
    operator delete(*((void **)&v47 + 1));
  }
  if (SBYTE7(v47) < 0) {
    operator delete((void *)v46);
  }
  if ((v45[15] & 0x80000000) != 0) {
    operator delete(v44[1]);
  }
  if (SHIBYTE(v44[0]) < 0) {
    operator delete(v43[0]);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete(v41[1]);
  }
  if (SHIBYTE(v41[0]) < 0) {
    operator delete(v40[0]);
  }
  os_activity_scope_leave(&state);
}

- (void)getIncidentalUseModeForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  std::string v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289282LL;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock:, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  __int128 v36 = 0u;
  memset(v37, 0, 19);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  memset(buf, 0, sizeof(buf));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  memset(v41, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  buf))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v30, 0, sizeof(v30));
    }
    CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v30, v12);
    sub_100FE36F4((std::string *)buf, &__p);
    id v14 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
    sub_1011F69B0((char *)__dst, (__int128 *)buf);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1011E1E5C;
    v15[3] = &unk_101872E20;
    v15[4] = a5;
    [v14 getIncidentalUseModeForClient:sub_1011DBFBC((__int128 *)__dst) withReply:v15];
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(v24);
    }
    if (v23 < 0) {
      operator delete(v22);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(__dst[0]);
    }
  }

  else
  {
    id v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, v13, 0LL);
  }

  if (SHIBYTE(v41[2]) < 0) {
    operator delete(v41[0]);
  }
  if (SHIBYTE(v40) < 0) {
    operator delete(*((void **)&v39 + 1));
  }
  if (SBYTE7(v39) < 0) {
    operator delete((void *)v38);
  }
  if ((v37[15] & 0x80000000) != 0) {
    operator delete(*((void **)&v36 + 1));
  }
  if (SBYTE7(v36) < 0) {
    operator delete((void *)v35);
  }
  if (SHIBYTE(v34) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 replyBlock:(id)a11
{
  char v19 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  __int128 v20 = _os_activity_create( (void *)&_mh_execute_header,  "CL: registerCircularInterestZoneWithId: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v20, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  char v21 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:registerCircularInterestZoneWithId:, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v22 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v22
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v22, v23) & 1) != 0)
    && ([v22 BOOLValue] & 1) != 0)
  {
    if ([a9 length] || objc_msgSend(a10, "length"))
    {
      memset(v65, 0, 35);
      __int128 v64 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v66 = 0u;
      memset(v67, 0, 59);
      if ([a9 length])
      {
        sub_1010DDBC0(&__str, (char *)[a9 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)v48);
      }

      else
      {
        if (![a10 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v45, 0, sizeof(v45));
          }
          CLConnection::getUserNameFromAuditToken(v48, (CLConnection *)v45, v24);
          sub_100FE36F4(buf, (const std::string *)v48);
          if ((v48[23] & 0x80000000) != 0) {
            operator delete(*(void **)v48);
          }
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          char v28 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            double v29 = sub_1011E2990((uint64_t)buf, &__str);
            int size = (char)__str.__r_.__value_.__s.__size_;
            std::string::size_type v31 = __str.__r_.__value_.__r.__words[0];
            id v32 = objc_msgSend(a3, "UTF8String", v29);
            p_str = &__str;
            *(_DWORD *)__int128 v48 = 68289538;
            if (size < 0) {
              p_str = (std::string *)v31;
            }
            *(_DWORD *)&v48[4] = 0;
            *(_WORD *)&v48[8] = 2082;
            *(void *)&v48[10] = "";
            *(_WORD *)&v48[18] = 2082;
            *(void *)&v48[20] = p_str;
            *(_WORD *)&v48[28] = 2082;
            *(void *)&v48[30] = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, Register Circular InterestZone, client:%{public, location:escape_only}s , ZoneName:%{public, location:escape_only}s}",  v48,  0x26u);
          }

          id v34 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)v48);
          if (v48[23] >= 0) {
            __int128 v35 = v48;
          }
          else {
            __int128 v35 = *(_BYTE **)v48;
          }
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_1011E2DA8;
          v44[3] = &unk_101861B48;
          v44[4] = a11;
          objc_msgSend( v34,  "registerCircularInterestZoneForClientKey:withId:latitude:longitude:serviceMaskOperator:provenanceType:radius:withReply:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35),  a3,  a7,  a8,  v44,  a4,  a5,  a6);
          if ((v48[23] & 0x80000000) != 0) {
            operator delete(*(void **)v48);
          }
          if (SBYTE7(v67[3]) < 0) {
            operator delete(*(void **)&v67[2]);
          }
          if (SHIBYTE(v67[1]) < 0) {
            operator delete(*((void **)&v67[0] + 1));
          }
          if (SBYTE7(v67[0]) < 0) {
            operator delete((void *)v66);
          }
          if (SHIBYTE(v65[3]) < 0) {
            operator delete((void *)v65[1]);
          }
          if (SHIBYTE(v65[0]) < 0) {
            operator delete((void *)v64);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a10 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)v48);
      }

      buf[0] = *(std::string *)v48;
      v48[23] = 0;
      v48[0] = 0;
      buf[1] = *(std::string *)&v48[24];
      v48[47] = 0;
      v48[24] = 0;
      if (SHIBYTE(v65[0]) < 0) {
        operator delete((void *)v64);
      }
      __int128 v64 = v49;
      v65[0] = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      if (SHIBYTE(v65[3]) < 0) {
        operator delete((void *)v65[1]);
      }
      *(_OWORD *)&v65[1] = v51;
      v65[3] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      LOWORD(v65[4]) = v53;
      BYTE2(v65[4]) = v54;
      if (SBYTE7(v67[0]) < 0) {
        operator delete((void *)v66);
      }
      __int128 v66 = v55;
      *(void *)&v67[0] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      if (SHIBYTE(v67[1]) < 0) {
        operator delete(*((void **)&v67[0] + 1));
      }
      char v27 = 0;
      *(_OWORD *)((char *)v67 + 8) = v57;
      *((void *)&v67[1] + 1) = v58;
      HIBYTE(v58) = 0;
      LOBYTE(v57) = 0;
      if (SBYTE7(v67[3]) < 0)
      {
        operator delete(*(void **)&v67[2]);
        char v27 = HIBYTE(v58);
      }

      v67[2] = v59;
      *(void *)&v67[3] = v60;
      HIBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      WORD4(v67[3]) = v61;
      BYTE10(v67[3]) = v62;
      if (v27 < 0) {
        operator delete((void *)v57);
      }
      if (SHIBYTE(v56) < 0) {
        operator delete((void *)v55);
      }
      if (SHIBYTE(v52) < 0) {
        operator delete((void *)v51);
      }
      if (SHIBYTE(v50) < 0) {
        operator delete((void *)v49);
      }
      if ((v48[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v48[24]);
      }
      if ((v48[23] & 0x80000000) != 0) {
        operator delete(*(void **)v48);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int128 v36 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_FAULT,  "#Spi registerCircularInterestZone, Must provide a bundle identifier or bundle path",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v48 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi registerCircularInterestZone, Must provide a bundle identifier or bundle path",  v48,  2);
      char v41 = (std::string *)v40;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceT ype:forBundleId:orBundlePath:replyBlock:]",  "%s\n",  v40);
      if (v41 != buf) {
        free(v41);
      }
    }

    char v37 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a11 + 2))(a11, v37);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v25 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v48 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v48,  2);
      __int128 v39 = (std::string *)v38;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceT ype:forBundleId:orBundlePath:replyBlock:]",  "%s\n",  v38);
      if (v39 != buf) {
        free(v39);
      }
    }

    char v26 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a11 + 2))(a11, v26);
  }

- (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  id v13 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v14 = _os_activity_create( (void *)&_mh_execute_header,  "CL: registerPhenolicInterestZoneWithId: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v15 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:registerPhenolicInterestZoneWithId:, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v16 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v16
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    && ([v16 BOOLValue] & 1) != 0)
  {
    if ([a7 length] || objc_msgSend(a8, "length"))
    {
      memset(v60, 0, 35);
      __int128 v59 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v61 = 0u;
      memset(v62, 0, 59);
      if ([a7 length])
      {
        sub_1010DDBC0(&__str, (char *)[a7 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)v43);
      }

      else
      {
        if (![a8 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v40, 0, sizeof(v40));
          }
          CLConnection::getUserNameFromAuditToken(v43, (CLConnection *)v40, v18);
          sub_100FE36F4(buf, (const std::string *)v43);
          if ((v43[23] & 0x80000000) != 0) {
            operator delete(*(void **)v43);
          }
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          id v22 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            double v23 = sub_1011E2990((uint64_t)buf, &__str);
            int size = (char)__str.__r_.__value_.__s.__size_;
            std::string::size_type v25 = __str.__r_.__value_.__r.__words[0];
            id v26 = objc_msgSend(a3, "UTF8String", v23);
            p_str = &__str;
            *(_DWORD *)char v43 = 68289538;
            if (size < 0) {
              p_str = (std::string *)v25;
            }
            *(_DWORD *)&uint8_t v43[4] = 0;
            *(_WORD *)&v43[8] = 2082;
            *(void *)&_BYTE v43[10] = "";
            *(_WORD *)&v43[18] = 2082;
            *(void *)&v43[20] = p_str;
            *(_WORD *)&v43[28] = 2082;
            *(void *)&v43[30] = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, Register Phenolic InterestZone, client:%{public, location:escape_only}s , ZoneName:%{public, location:escape_only}s}",  v43,  0x26u);
          }

          id v28 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)v43);
          if (v43[23] >= 0) {
            double v29 = v43;
          }
          else {
            double v29 = *(_BYTE **)v43;
          }
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          _OWORD v39[2] = sub_1011E37C4;
          v39[3] = &unk_101861B48;
          v39[4] = a9;
          objc_msgSend( v28,  "registerPhenolicInterestZoneForClientKey:withId:phenolicLocation:serviceMaskOperator:provenanceType:withReply:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v29),  a3,  a4,  a5,  a6,  v39);
          if ((v43[23] & 0x80000000) != 0) {
            operator delete(*(void **)v43);
          }
          if (SBYTE7(v62[3]) < 0) {
            operator delete(*(void **)&v62[2]);
          }
          if (SHIBYTE(v62[1]) < 0) {
            operator delete(*((void **)&v62[0] + 1));
          }
          if (SBYTE7(v62[0]) < 0) {
            operator delete((void *)v61);
          }
          if (SHIBYTE(v60[3]) < 0) {
            operator delete((void *)v60[1]);
          }
          if (SHIBYTE(v60[0]) < 0) {
            operator delete((void *)v59);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a8 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)v43);
      }

      buf[0] = *(std::string *)v43;
      v43[23] = 0;
      v43[0] = 0;
      buf[1] = *(std::string *)&v43[24];
      v43[47] = 0;
      v43[24] = 0;
      if (SHIBYTE(v60[0]) < 0) {
        operator delete((void *)v59);
      }
      __int128 v59 = v44;
      v60[0] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      if (SHIBYTE(v60[3]) < 0) {
        operator delete((void *)v60[1]);
      }
      *(_OWORD *)&v60[1] = v46;
      v60[3] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      LOWORD(v60[4]) = v48;
      BYTE2(v60[4]) = v49;
      if (SBYTE7(v62[0]) < 0) {
        operator delete((void *)v61);
      }
      __int128 v61 = v50;
      *(void *)&v62[0] = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SHIBYTE(v62[1]) < 0) {
        operator delete(*((void **)&v62[0] + 1));
      }
      char v21 = 0;
      *(_OWORD *)((char *)v62 + 8) = v52;
      *((void *)&v62[1] + 1) = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SBYTE7(v62[3]) < 0)
      {
        operator delete(*(void **)&v62[2]);
        char v21 = HIBYTE(v53);
      }

      v62[2] = v54;
      *(void *)&v62[3] = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      WORD4(v62[3]) = v56;
      BYTE10(v62[3]) = v57;
      if (v21 < 0) {
        operator delete((void *)v52);
      }
      if (SHIBYTE(v51) < 0) {
        operator delete((void *)v50);
      }
      if (SHIBYTE(v47) < 0) {
        operator delete((void *)v46);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)v44);
      }
      if ((v43[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v43[24]);
      }
      if ((v43[23] & 0x80000000) != 0) {
        operator delete(*(void **)v43);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v30 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "#Spi registerPhenolicInterestZone, Must provide a bundle identifier or bundle path",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)char v43 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi registerPhenolicInterestZone, Must provide a bundle identifier or bundle path",  v43,  2);
      __int128 v35 = (std::string *)v34;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBu ndleId:orBundlePath:replyBlock:]",  "%s\n",  v34);
      if (v35 != buf) {
        free(v35);
      }
    }

    std::string::size_type v31 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a9 + 2))(a9, v31);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v19 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)char v43 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v43,  2);
      char v33 = (std::string *)v32;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBu ndleId:orBundlePath:replyBlock:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }

    __int128 v20 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a9 + 2))(a9, v20);
  }

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  BOOL v35 = a3;
  BOOL v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v13 = _os_activity_create( (void *)&_mh_execute_header,  "CL: setRelevance:forInterestZoneWithName: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v14 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:setRelevance:forInterestZoneWithName:, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v15 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v15
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && ([v15 BOOLValue] & 1) != 0)
  {
    if ([a5 length] || objc_msgSend(a6, "length"))
    {
      memset(v57, 0, 35);
      __int128 v56 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v58 = 0u;
      memset(v59, 0, 59);
      if ([a5 length])
      {
        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)v40);
      }

      else
      {
        if (![a6 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v37, 0, sizeof(v37));
          }
          CLConnection::getUserNameFromAuditToken(v40, (CLConnection *)v37, v17);
          sub_100FE36F4(buf, (const std::string *)v40);
          if ((v40[23] & 0x80000000) != 0) {
            operator delete(*(void **)v40);
          }
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          char v21 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            double v22 = sub_1011E2990((uint64_t)buf, &__str);
            int size = (char)__str.__r_.__value_.__s.__size_;
            std::string::size_type v24 = __str.__r_.__value_.__r.__words[0];
            id v25 = objc_msgSend(a4, "UTF8String", v22);
            p_str = &__str;
            *(_DWORD *)__int128 v40 = 68289538;
            if (size < 0) {
              p_str = (std::string *)v24;
            }
            *(_DWORD *)&v40[4] = 0;
            *(_WORD *)&v40[8] = 2082;
            *(void *)&v40[10] = "";
            *(_WORD *)&v40[18] = 2082;
            *(void *)&v40[20] = p_str;
            *(_WORD *)&v40[28] = 2082;
            *(void *)&v40[30] = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, SetRelevanceForInterestZone, client:%{public, location:escape_only}s,  ZoneName:%{public, location:escape_only}s}",  v40,  0x26u);
          }

          id v27 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)v40);
          if (v40[23] >= 0) {
            id v28 = v40;
          }
          else {
            id v28 = *(_BYTE **)v40;
          }
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_1011E41D8;
          v36[3] = &unk_101861B48;
          v36[4] = a7;
          objc_msgSend( v27,  "setRelevance:forInterestZoneWithId:registeredForClientKey:withReply:",  v35,  a4,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28),  v36);
          if ((v40[23] & 0x80000000) != 0) {
            operator delete(*(void **)v40);
          }
          if (SBYTE7(v59[3]) < 0) {
            operator delete(*(void **)&v59[2]);
          }
          if (SHIBYTE(v59[1]) < 0) {
            operator delete(*((void **)&v59[0] + 1));
          }
          if (SBYTE7(v59[0]) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(v57[3]) < 0) {
            operator delete((void *)v57[1]);
          }
          if (SHIBYTE(v57[0]) < 0) {
            operator delete((void *)v56);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a6 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)v40);
      }

      buf[0] = *(std::string *)v40;
      v40[23] = 0;
      v40[0] = 0;
      buf[1] = *(std::string *)&v40[24];
      v40[47] = 0;
      v40[24] = 0;
      if (SHIBYTE(v57[0]) < 0) {
        operator delete((void *)v56);
      }
      __int128 v56 = v41;
      v57[0] = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      if (SHIBYTE(v57[3]) < 0) {
        operator delete((void *)v57[1]);
      }
      *(_OWORD *)&v57[1] = v43;
      v57[3] = v44;
      HIBYTE(v44) = 0;
      LOBYTE(v43) = 0;
      LOWORD(v57[4]) = v45;
      BYTE2(v57[4]) = v46;
      if (SBYTE7(v59[0]) < 0) {
        operator delete((void *)v58);
      }
      __int128 v58 = v47;
      *(void *)&v59[0] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      if (SHIBYTE(v59[1]) < 0) {
        operator delete(*((void **)&v59[0] + 1));
      }
      char v20 = 0;
      *(_OWORD *)((char *)v59 + 8) = v49;
      *((void *)&v59[1] + 1) = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      if (SBYTE7(v59[3]) < 0)
      {
        operator delete(*(void **)&v59[2]);
        char v20 = HIBYTE(v50);
      }

      v59[2] = v51;
      *(void *)&v59[3] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      WORD4(v59[3]) = v53;
      BYTE10(v59[3]) = v54;
      if (v20 < 0) {
        operator delete((void *)v49);
      }
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v44) < 0) {
        operator delete((void *)v43);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete((void *)v41);
      }
      if ((v40[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v40[24]);
      }
      if ((v40[23] & 0x80000000) != 0) {
        operator delete(*(void **)v40);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    double v29 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "#Spi setRelevanceForInterestZone, Must provide a bundle identifier or bundle path",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v40 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi setRelevanceForInterestZone, Must provide a bundle identifier or bundle path",  v40,  2);
      id v34 = (std::string *)v33;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]",  "%s\n",  v33);
      if (v34 != buf) {
        free(v34);
      }
    }

    char v30 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a7 + 2))(a7, v30);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v18 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v40 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v40,  2);
      id v32 = (std::string *)v31;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]",  "%s\n",  v31);
      if (v32 != buf) {
        free(v32);
      }
    }

    char v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a7 + 2))(a7, v19);
  }

- (void)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  std::string v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: deleteInterestZoneWithId: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:deleteInterestZoneWithId:, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v55, 0, 35);
      __int128 v54 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v56 = 0u;
      memset(v57, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)v38);
      }

      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v35, 0, sizeof(v35));
          }
          CLConnection::getUserNameFromAuditToken(v38, (CLConnection *)v35, v16);
          sub_100FE36F4(buf, (const std::string *)v38);
          if ((v38[23] & 0x80000000) != 0) {
            operator delete(*(void **)v38);
          }
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          char v20 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            double v21 = sub_1011E2990((uint64_t)buf, &__str);
            int size = (char)__str.__r_.__value_.__s.__size_;
            std::string::size_type v23 = __str.__r_.__value_.__r.__words[0];
            id v24 = objc_msgSend(a3, "UTF8String", v21);
            p_str = &__str;
            *(_DWORD *)__int128 v38 = 68289538;
            if (size < 0) {
              p_str = (std::string *)v23;
            }
            *(_DWORD *)&v38[4] = 0;
            *(_WORD *)&v38[8] = 2082;
            *(void *)&v38[10] = "";
            *(_WORD *)&v38[18] = 2082;
            *(void *)&v38[20] = p_str;
            *(_WORD *)&v38[28] = 2082;
            *(void *)&v38[30] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, delete interest zone, client:%{public, location:escape_only}s, ZoneNa me:%{public, location:escape_only}s}",  v38,  0x26u);
          }

          id v26 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)v38);
          if (v38[23] >= 0) {
            id v27 = v38;
          }
          else {
            id v27 = *(_BYTE **)v38;
          }
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_1011E4BE4;
          v34[3] = &unk_101861B48;
          v34[4] = a6;
          objc_msgSend( v26,  "deleteInterestZoneWithId:registeredForClientKey:withReply:",  a3,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27),  v34);
          if ((v38[23] & 0x80000000) != 0) {
            operator delete(*(void **)v38);
          }
          if (SBYTE7(v57[3]) < 0) {
            operator delete(*(void **)&v57[2]);
          }
          if (SHIBYTE(v57[1]) < 0) {
            operator delete(*((void **)&v57[0] + 1));
          }
          if (SBYTE7(v57[0]) < 0) {
            operator delete((void *)v56);
          }
          if (SHIBYTE(v55[3]) < 0) {
            operator delete((void *)v55[1]);
          }
          if (SHIBYTE(v55[0]) < 0) {
            operator delete((void *)v54);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)v38);
      }

      buf[0] = *(std::string *)v38;
      v38[23] = 0;
      v38[0] = 0;
      buf[1] = *(std::string *)&v38[24];
      v38[47] = 0;
      v38[24] = 0;
      if (SHIBYTE(v55[0]) < 0) {
        operator delete((void *)v54);
      }
      __int128 v54 = v39;
      v55[0] = v40;
      HIBYTE(v40) = 0;
      LOBYTE(v39) = 0;
      if (SHIBYTE(v55[3]) < 0) {
        operator delete((void *)v55[1]);
      }
      *(_OWORD *)&v55[1] = v41;
      v55[3] = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      LOWORD(v55[4]) = v43;
      BYTE2(v55[4]) = v44;
      if (SBYTE7(v57[0]) < 0) {
        operator delete((void *)v56);
      }
      __int128 v56 = v45;
      *(void *)&v57[0] = v46;
      HIBYTE(v46) = 0;
      LOBYTE(v45) = 0;
      if (SHIBYTE(v57[1]) < 0) {
        operator delete(*((void **)&v57[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v57 + 8) = v47;
      *((void *)&v57[1] + 1) = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      if (SBYTE7(v57[3]) < 0)
      {
        operator delete(*(void **)&v57[2]);
        char v19 = HIBYTE(v48);
      }

      v57[2] = v49;
      *(void *)&v57[3] = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      WORD4(v57[3]) = v51;
      BYTE10(v57[3]) = v52;
      if (v19 < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v46) < 0) {
        operator delete((void *)v45);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete((void *)v41);
      }
      if (SHIBYTE(v40) < 0) {
        operator delete((void *)v39);
      }
      if ((v38[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v38[24]);
      }
      if ((v38[23] & 0x80000000) != 0) {
        operator delete(*(void **)v38);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v28 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "#Spi deleteInterestZoneWithId, Must provide a bundle identifier or bundle path",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v38 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi deleteInterestZoneWithId, Must provide a bundle identifier or bundle path",  v38,  2);
      char v33 = (std::string *)v32;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }

    double v29 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v29);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v38 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v38,  2);
      std::string::size_type v31 = (std::string *)v30;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]",  "%s\n",  v30);
      if (v31 != buf) {
        free(v31);
      }
    }

    int v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v18);
  }

- (void)performMigrationWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonPerformMigration (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)char v19 = 2082;
    *(void *)&v19[2] = "";
    __int16 v20 = 2082;
    double v21 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonPerformMigration, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.integritycheck");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1011E5000;
    v15[3] = &unk_101835490;
    v15[4] = self;
    *(void *)buf = mach_absolute_time();
    *(void *)char v19 = v15;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1011E521C;
    v14[3] = &unk_1018653A8;
    v14[4] = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
    void v14[5] = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLDaemonStatus");
    v14[6] = a3;
    objc_msgSend(+[CLSilo main](CLSilo, "main"), "async:", v14);
    sub_1011F6BE4((uint64_t *)buf);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      id v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService performMigrationWithReplyBlock:]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    std::string v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a3 + 2))(a3, v11);
  }

  os_activity_scope_leave(&state);
}

- (void)shutdownDaemonWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonShutdownDaemon (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v20 = 2082;
    double v21 = "";
    __int16 v22 = 2082;
    v23[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonShutdownDaemon, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  id v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    sub_100F4B1DC((uint64_t)v10, (uint64_t)buf);
    sub_1011E2990((uint64_t)buf, &v11);
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
      operator delete(*(void **)((char *)v23 + 4));
    }
    if (SBYTE3(v23[0]) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v9 = &v11;
    if ((v11.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)id v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2082;
    int v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, Daemon shutdown requested, requester:%{public, location:escape_only}s}",  v13,  0x1Cu);
  }

  sub_1011C5324((unsigned int *)qword_1019A41A0, 1);
  (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  os_activity_scope_leave(&state);
}

- (void)displayStatisticsWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonDisplayStatistics (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2082;
    v24[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonDisplayStatistics, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  id v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    sub_100F4B1DC((uint64_t)v11, (uint64_t)buf);
    sub_1011E2990((uint64_t)buf, &v12);
    if (v35 < 0) {
      operator delete(__p);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(*(void **)((char *)v24 + 4));
    }
    if (SBYTE3(v24[0]) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v9 = &v12;
    if ((v12.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)int v14 = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    char v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, Daemon stats requested, requester:%{public, location:escape_only}s}",  v14,  0x1Cu);
  }

  uint64_t v10 = sub_1004DD868();
  sub_1004DE770(v10);
  (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  os_activity_scope_leave(&state);
}

- (void)dumpLogsWithDescription:(id)a3 replyBlock:(id)a4
{
  int v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonDumpLogs (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v31 = 2082;
    char v32 = "";
    __int16 v33 = 2082;
    *(void *)char v34 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonDumpLogs, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  uint64_t v10 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }

    else
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
    }

    sub_100F4B1DC((uint64_t)&v21, (uint64_t)buf);
    sub_1011E2990((uint64_t)buf, v24);
    if (v45 < 0) {
      operator delete(__p);
    }
    if (v43 < 0) {
      operator delete(v42);
    }
    if (v41 < 0) {
      operator delete(v40);
    }
    if (v39 < 0) {
      operator delete(v38);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(*(void **)&v34[4]);
    }
    if ((v34[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    std::string v11 = v24;
    if ((v24[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string v11 = (std::string *)v24[0].__r_.__value_.__r.__words[0];
    }
    std::string v12 = &stru_1018A4B00;
    if (a3) {
      std::string v12 = (const __CFString *)a3;
    }
    LODWORD(v25.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)v11;
    WORD2(v25.__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, Log dump requested by %s: %@",  (uint8_t *)&v25,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v14 = qword_101934978;
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }

    else
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
    }

    sub_100F4B1DC((uint64_t)&v19, (uint64_t)v24);
    sub_1011E2990((uint64_t)v24, &v25);
    sub_1011F6920((uint64_t)v24);
    if ((v25.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v15 = &v25;
    }
    else {
      int v15 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    __int16 v16 = &stru_1018A4B00;
    if (a3) {
      __int16 v16 = (const __CFString *)a3;
    }
    int v26 = 136315394;
    char v27 = v15;
    __int16 v28 = 2112;
    char v29 = v16;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  0LL,  "#Spi, Log dump requested by %s: %@",  &v26,  22,  v19,  v20,  v21,  v22);
    __int16 v18 = v17;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService dumpLogsWithDescription:replyBlock:]", "%s\n", v18);
  }

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"com.apple.locationd.DumpDiagnostics", 0LL, 0LL, 1u);
  (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  os_activity_scope_leave(&state);
}

- (void)copyLastLogWithReplyBlock:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonCopyLastLog (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v23 = 2082;
    char v24 = "";
    __int16 v25 = 2082;
    v26[0] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonCopyLastLog, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  id v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    sub_100F4B1DC((uint64_t)v13, (uint64_t)buf);
    sub_1011E2990((uint64_t)buf, &v14);
    if (v37 < 0) {
      operator delete(__p);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(*(void **)((char *)v26 + 4));
    }
    if (SBYTE3(v26[0]) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v9 = &v14;
    if ((v14.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v9 = (std::string *)v14.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int16 v16 = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    __int128 v19 = "";
    __int16 v20 = 2082;
    __int128 v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, requested to copy locationd's last logs to crash reporter, requester:%{public, location:escape_only}s}",  v16,  0x1Cu);
  }

  uint64_t v10 = sub_1007B3C30();
  if (sub_100E665CC(v10) && (uint64_t v11 = sub_100E00E14(), sub_100E665CC(v11)))
  {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

  else
  {
    std::string v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a3 + 2))(a3, v12);
  }

  os_activity_scope_leave(&state);
}

- (void)getMonitoredRegionsForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  char v39 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetMonitoredRegions (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetMonitoredRegions, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  sub_1002A5370(v50);
  *(_OWORD *)v73 = 0u;
  memset(v74, 0, 19);
  __int128 v71 = 0u;
  *(_OWORD *)char v72 = 0u;
  memset(buf, 0, sizeof(buf));
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  memset(v78, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  buf))
  {
    uint64_t v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, v11, 0LL);

    goto LABEL_69;
  }

  if (self) {
    -[CLInternalService currentToken](self, "currentToken");
  }
  else {
    memset(v49, 0, sizeof(v49));
  }
  CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v49, v10);
  sub_100FE36F4((std::string *)buf, (const std::string *)&__p);
  if ((v58[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  sub_100FE3FB4((uint64_t)buf, (uint64_t)v44);
  id v12 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLFenceManager");
  if (v45 >= 0) {
    id v13 = v44;
  }
  else {
    id v13 = (void **)v44[0];
  }
  if ((objc_msgSend( v12,  "syncgetFences:forKey:",  &v46,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13)) & 1) == 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = v44;
      if (v45 < 0) {
        int v15 = (void **)v44[0];
      }
      std::string __p = (void *)68289282;
      *(_WORD *)__int128 v58 = 2082;
      *(void *)&v58[2] = "";
      *(_WORD *)&v58[10] = 2082;
      *(void *)&v58[12] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, #warning Couldn't get fences for client key, clientKey:%{public, location:escape_only}s}",  (uint8_t *)&__p,  0x1Cu);
    }
  }

  if (v46 == v47)
  {
LABEL_56:
    std::string __p = &__p;
    *(void *)__int128 v58 = &__p;
    *(void *)&v58[8] = 0LL;
    id v29 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLBTLEFenceManager");
    if (v45 >= 0) {
      char v30 = v44;
    }
    else {
      char v30 = (void **)v44[0];
    }
    objc_msgSend( v29,  "syncgetMonitoredRegions:forClient:",  &__p,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
    sub_1002A5370(&v52);
    for (uint64_t i = *(void *)v58; (void **)i != &__p; uint64_t i = *(void *)(i + 8))
    {
      sub_1002A5370(v43);
      char v32 = (const char *)(i + 104);
      sub_1002ACD58((uint64_t)v43, "kCLConnectionMessageNameKey", (char *)(i + 104));
      sub_1002ACD58((uint64_t)v43, "kCLConnectionMessageOnBehalfOfKey", (char *)(i + 80));
      LODWORD(v42[0]) = 0;
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageRegionTypeKey", v42);
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageRegionDefinitionKey", (const void *)(i + 52));
      char v33 = (char *)(i + 24);
      sub_1002ACA84((uint64_t)v43, "kCLConnectionMessageProximityUUIDKey", v33);
      sub_1002AB6D8((uint64_t)v43, "kCLConnectionMessageMajorKey", (unsigned __int16 *)(i + 48));
      sub_1002AB6D8((uint64_t)v43, "kCLConnectionMessageMinorKey", (unsigned __int16 *)(i + 50));
      LODWORD(v42[0]) = *(_DWORD *)(i + 128) & 1;
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageNotifyOnEntryKey", v42);
      LODWORD(v42[0]) = *(_DWORD *)(i + 128) & 2;
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageNotifyOnExitKey", v42);
      LODWORD(v42[0]) = *(_DWORD *)(i + 128) & 4;
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageNotifyEntryStateOnDisplayKey", v42);
      LODWORD(v42[0]) = *(_DWORD *)(i + 128) & 8;
      sub_1002AC220((uint64_t)v43, "kCLConnectionMessageConservativeEntry", v42);
      LOBYTE(v42[0]) = 0;
      sub_1002AB3FC((uint64_t)v43, "kCLConnectionMessageEmergencyKey", v42);
      sub_1002ACE6C((uint64_t)&v52, v32, (uint64_t)v43);
      sub_1002A5590(v43);
    }

    sub_1002ACE6C((uint64_t)v50, "kCLConnectionMessageBeaconRegionKey", (uint64_t)&v52);
    sub_1002A5590(&v52);
    sub_100527B44((uint64_t *)&__p);
    uint64_t v34 = sub_1002A59CC((uint64_t)v50);
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0LL, v34);
    goto LABEL_66;
  }

  char v37 = self;
  sub_1002A5370(v43);
  uint64_t v16 = v46;
  uint64_t v17 = v47;
  if (v46 == v47)
  {
LABEL_55:
    sub_1002ACE6C((uint64_t)v50, "kCLConnectionMessageCircularRegionKey", (uint64_t)v43);
    self = v37;
    sub_1002A5590(v43);
    goto LABEL_56;
  }

  while (1)
  {
    sub_1002A5370(v42);
    __int16 v18 = (const char *)(v16 + 24);
    sub_1002ACD58((uint64_t)v42, "kCLConnectionMessageNameKey", (char *)(v16 + 24));
    sub_100FE3188((std::string *)(v16 + 48), (uint64_t)&__p);
    sub_100FE370C((uint64_t)&__p);
    unint64_t v19 = v65;
    if ((v65 & 0x80u) != 0) {
      unint64_t v19 = (unint64_t)v64[1];
    }
    __int16 v20 = (char *)&v60;
    if (v19)
    {
      sub_100FE370C((uint64_t)&__p);
      __int16 v20 = (char *)v64;
    }

    sub_1002ACD58((uint64_t)v42, "kCLConnectionMessageOnBehalfOfKey", v20);
    LODWORD(v52) = *(_DWORD *)(v16 + 180);
    sub_1002AC220((uint64_t)v42, "kCLConnectionMessageReferenceFrameKey", &v52);
    LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 4) != 0;
    sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageConservativeEntry", &v52);
    LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 0x10) != 0;
    sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageEmergencyKey", &v52);
    LOBYTE(v52) = *(_BYTE *)(v16 + 160) & 1;
    sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageNotifyOnEntryKey", &v52);
    LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 2) != 0;
    sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageNotifyOnExitKey", &v52);
    unint64_t v21 = *(void *)(v16 + 232) - *(void *)(v16 + 224);
    if (!v21)
    {
      if ((*(_BYTE *)(v16 + 160) & 0x80) != 0) {
        LODWORD(v52) = 3;
      }
      else {
        LODWORD(v52) = 1;
      }
      sub_1002AC220((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", &v52);
      sub_1002AC7B8((uint64_t)v42, "kCLConnectionMessageLatitudeKey", (const void *)(v16 + 72));
      sub_1002AC7B8((uint64_t)v42, "kCLConnectionMessageLongitudeKey", (const void *)(v16 + 80));
      sub_1002AC7B8((uint64_t)v42, "kCLConnectionMessageRadiusKey", (const void *)(v16 + 88));
      LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 8) != 0;
      sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", &v52);
      LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 0x20) != 0;
      sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageLowPowerFenceKey", &v52);
      goto LABEL_38;
    }

    int v41 = v21 >> 4;
    __int128 v22 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    __int16 v23 = -[NSMutableArray initWithCapacity:](v22, "initWithCapacity:", v41);
    if (v41 >= 1)
    {
      uint64_t v24 = 0LL;
      for (uint64_t j = 0LL; j < v41; ++j)
      {
        id v26 = objc_msgSend( [_CLVertex alloc],  "initWithClientCoordinate:",  *(double *)(*(void *)(v16 + 224) + v24),  *(double *)(*(void *)(v16 + 224) + v24 + 8));
        -[NSMutableArray addObject:](v23, "addObject:", v26);

        v24 += 16LL;
      }
    }

    uint64_t v40 = 0LL;
    char v27 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v23,  1LL,  &v40);
    if (v40) {
      break;
    }
    uint64_t v28 = (uint64_t)v27;
    LODWORD(v52) = 2;
    sub_1002AC220((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", &v52);
    sub_1002AC220((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesCountKey", &v41);
    sub_1002AB370((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesKey", v28);
    LOBYTE(v52) = (*(_BYTE *)(v16 + 160) & 8) != 0;
    sub_1002AB3FC((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", &v52);

LABEL_38:
    sub_1002ACE6C((uint64_t)v43, v18, (uint64_t)v42);
    if (v69 < 0) {
      operator delete(v68);
    }
    if (v67 < 0) {
      operator delete(v66);
    }
    if (v63 < 0) {
      operator delete(v62);
    }
    if (v61 < 0) {
      operator delete(v60);
    }
    if (v59 < 0) {
      operator delete(*(void **)&v58[16]);
    }
    if ((v58[15] & 0x80000000) != 0) {
      operator delete(__p);
    }
    sub_1002A5590(v42);
    v16 += 248LL;
    if (v16 == v17) {
      goto LABEL_55;
    }
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  char v35 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
  {
    uint64_t v52 = 68289282LL;
    __int16 v53 = 2082;
    __int128 v54 = "";
    __int16 v55 = 2114;
    uint64_t v56 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#Spi, #error Unable to encode vertices, error:%{public, location:escape_only}@}",  (uint8_t *)&v52,  0x1Cu);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
  }

  __int128 v36 = (os_log_s *)qword_101934978;
  if (os_signpost_enabled((os_log_t)qword_101934978))
  {
    uint64_t v52 = 68289282LL;
    __int16 v53 = 2082;
    __int128 v54 = "";
    __int16 v55 = 2114;
    uint64_t v56 = v40;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Spi, #error Unable to encode vertices",  "{msg%{public}.0s:#Spi, #error Unable to encode vertices, error:%{public, location:escape_only}@}",  (uint8_t *)&v52,  0x1Cu);
  }

  if (v69 < 0) {
    operator delete(v68);
  }
  if (v67 < 0) {
    operator delete(v66);
  }
  if (v63 < 0) {
    operator delete(v62);
  }
  if (v61 < 0) {
    operator delete(v60);
  }
  if (v59 < 0) {
    operator delete(*(void **)&v58[16]);
  }
  if ((v58[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  sub_1002A5590(v42);
  sub_1002A5590(v43);
LABEL_66:
  if (v45 < 0) {
    operator delete(v44[0]);
  }
  std::string __p = &v46;
  sub_1006684D8((void ***)&__p);
LABEL_69:
  if (SHIBYTE(v78[2]) < 0) {
    operator delete(v78[0]);
  }
  if (SHIBYTE(v77) < 0) {
    operator delete(*((void **)&v76 + 1));
  }
  if (SBYTE7(v76) < 0) {
    operator delete((void *)v75);
  }
  if ((v74[15] & 0x80000000) != 0) {
    operator delete(v73[1]);
  }
  if (SHIBYTE(v73[0]) < 0) {
    operator delete(v72[0]);
  }
  if (SHIBYTE(v71) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  sub_1002A5590(v50);
  os_activity_scope_leave(&state);
}

- (void)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 replyBlock:(id)a6
{
  char v27 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v11 = _os_activity_create( (void *)&_mh_execute_header,  "CL: checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v12 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:, event:%{p ublic, location:escape_only}s}",  buf,  0x1Cu);
  }

  *(_OWORD *)__int128 v58 = 0u;
  memset(v59, 0, 19);
  __int128 v56 = 0u;
  *(_OWORD *)char v57 = 0u;
  memset(buf, 0, sizeof(buf));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  buf))
  {
    std::string v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a6 + 2))(a6, v14, 0LL);

    goto LABEL_59;
  }

  if (self) {
    -[CLInternalService currentToken](self, "currentToken");
  }
  else {
    memset(v44, 0, sizeof(v44));
  }
  CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v44, v13);
  sub_100FE36F4((std::string *)buf, (const std::string *)&__p);
  if (SBYTE3(v50) < 0) {
    operator delete(__p);
  }
  sub_100FE3FB4((uint64_t)buf, (uint64_t)&__p);
  if (SBYTE3(v50) >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v16 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p);
  if (SBYTE3(v50) < 0) {
    operator delete(__p);
  }
  id v17 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientAuthorizationCache");
  id v18 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService");
  id v19 = [v17 syncgetAuthorizationContextIfClientIsNonZonal:v16];
  id v20 = [v19 isNonProvisionallyAuthorizedForServiceTypeMask:a5];
  if ((v20 & 1) != 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A2D08);
    }
    unint64_t v21 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      sub_100FE3FB4((uint64_t)buf, (uint64_t)v42);
      __int128 v22 = v43 >= 0 ? v42 : (void **)v42[0];
      std::string __p = (void *)68289282;
      __int16 v47 = 2082;
      uint64_t v48 = "";
      __int16 v49 = 2082;
      uint64_t v50 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:markReceivingLocationInformation, Client:%{public, location:escape_only}s}",  (uint8_t *)&__p,  0x1Cu);
      if (v43 < 0) {
        operator delete(v42[0]);
      }
    }

    sub_1011F69B0((char *)__dst, (__int128 *)buf);
    [v18 markReceivingLocationInformation:sub_1011DBFBC((__int128 *)__dst)];
    if (v41 < 0) {
      operator delete(v40);
    }
    if (v39 < 0) {
      operator delete(v38);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(__dst[0]);
    }
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v23 = (os_log_s *)qword_101934978;
    if (!os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_58;
    }
    sub_100FE3FB4((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0) {
      uint64_t v24 = v42;
    }
    else {
      uint64_t v24 = (void **)v42[0];
    }
    std::string __p = (void *)68289794;
    __int16 v47 = 2082;
    uint64_t v48 = "";
    __int16 v49 = 2082;
    uint64_t v50 = v24;
    __int16 v51 = 2050;
    unint64_t v52 = a5;
    __int16 v53 = 2114;
    id v54 = v19;
    __int16 v25 = "{msg%{public}.0s:checkAndExerciseAuthorization response is YES, client:%{public, location:escape_o"
          "nly}s, requiredServices:%{public}ld, authContext:%{public, location:escape_only}@}";
  }

  else
  {
    if ([v19 isAuthorizedForServiceTypeMask:a5]) {
      [v18 handleProvisionalIntermediationForService:10 forClientKey:v16 at:0 withReply:&stru_1018A2BF0];
    }
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v23 = (os_log_s *)qword_101934978;
    if (!os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_58;
    }
    sub_100FE3FB4((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0) {
      id v26 = v42;
    }
    else {
      id v26 = (void **)v42[0];
    }
    std::string __p = (void *)68289794;
    __int16 v47 = 2082;
    uint64_t v48 = "";
    __int16 v49 = 2082;
    uint64_t v50 = v26;
    __int16 v51 = 2050;
    unint64_t v52 = a5;
    __int16 v53 = 2114;
    id v54 = v19;
    __int16 v25 = "{msg%{public}.0s:checkAndExerciseAuthorization response is NO, client:%{public, location:escape_on"
          "ly}s, requiredServices:%{public}ld, authContext:%{public, location:escape_only}@}";
  }

  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&__p, 0x30u);
  if (v43 < 0) {
    operator delete(v42[0]);
  }
LABEL_58:
  (*((void (**)(id, void, id))a6 + 2))(a6, 0LL, v20);
LABEL_59:
  if (SHIBYTE(v63[2]) < 0) {
    operator delete(v63[0]);
  }
  if (SHIBYTE(v62) < 0) {
    operator delete(*((void **)&v61 + 1));
  }
  if (SBYTE7(v61) < 0) {
    operator delete((void *)v60);
  }
  if ((v59[15] & 0x80000000) != 0) {
    operator delete(v58[1]);
  }
  if (SHIBYTE(v58[0]) < 0) {
    operator delete(v57[0]);
  }
  if (SHIBYTE(v56) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)getLocationForBundleID:(id)a3 orBundlePath:(id)a4 dynamicAccuracyReductionEnabled:(BOOL)a5 allowsAlteredAccessoryLocations:(BOOL)a6 replyBlock:(id)a7
{
  unint64_t v46 = __PAIR64__(a6, a5);
  __int16 v49 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v11 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetLocation (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v12 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v129 = 2082;
    v130 = "";
    __int16 v131 = 2082;
    *(void *)v132 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetLocation, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  uint64_t v95 = 0LL;
  v96 = &v95;
  uint64_t v97 = 0xD012000000LL;
  v98 = sub_1011E808C;
  v99 = nullsub_1283;
  v100 = &unk_10175E27B;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  memset(v109, 0, sizeof(v109));
  unsigned int v13 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v46),  "processIdentifier");
  *(_OWORD *)v89 = 0u;
  memset(v90, 0, 19);
  __int128 v87 = 0u;
  *(_OWORD *)v88 = 0u;
  *(_OWORD *)v85 = 0u;
  *(_OWORD *)v86 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  memset(v94, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  v85))
  {
    int v15 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void))a7 + 2))(a7, v15, 0LL);

    goto LABEL_71;
  }

  if (self) {
    -[CLInternalService currentToken](self, "currentToken");
  }
  else {
    memset(v84, 0, sizeof(v84));
  }
  CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v84, v14);
  sub_100FE36F4((std::string *)v85, (const std::string *)buf);
  if ((v132[3] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  id v16 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientAuthorizationCache");
  sub_100FE3FB4((uint64_t)v85, (uint64_t)buf);
  if (v132[3] >= 0) {
    id v17 = buf;
  }
  else {
    id v17 = *(uint8_t **)buf;
  }
  id v18 = objc_msgSend( v16,  "syncgetAuthorizationContextIfClientIsNonZonal:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
  if ((v132[3] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  id v19 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
  objc_msgSend( v19,  "registerDelegate:inSilo:",  +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"),  +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
  if (v18)
  {
    if ([v18 isNonProvisionallyAuthorizedForServiceType:4])
    {
      if ([v18 isNonProvisionallyAuthorizedForServiceType:12])
      {
        id v20 = objc_msgSend( -[CLInternalService vendor](self, "vendor", sub_100869DC8(buf).n128_f64[0]),  "proxyForService:",  @"CLLocationController");
        unsigned int v21 = [v20 syncgetLocation:v96 + 6];
        unsigned int v22 = objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLLocationController"),  "syncgetLocationPrivate:",  buf);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        __int16 v23 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v111 = 68291075;
          *(_DWORD *)&v111[4] = 0;
          __int16 v112 = 2082;
          v113 = "";
          __int16 v114 = 1040;
          *(_DWORD *)v115 = 156;
          *(_WORD *)&v115[4] = 2097;
          *(void *)&v115[6] = v96 + 6;
          __int16 v116 = 2049;
          uint64_t v117 = *(void *)&v132[4];
          __int16 v118 = 2049;
          uint64_t v119 = *(void *)&v132[12];
          __int16 v120 = 1025;
          unsigned int v121 = v21;
          __int16 v122 = 2049;
          uint64_t v123 = v133;
          __int16 v124 = 2049;
          uint64_t v125 = v134;
          __int16 v126 = 2049;
          uint64_t v127 = v135;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, altered getLocation, location:%{private, location:CLClientLocation}.*P,  timestampGps:%{private}f, machTime:%{private}f, gotLocation:%{private}hhd, specialCoordi nateLat:%{private}f, specialCoordinateLon:%{private}f, specialHorizontalAccuracy:%{private}f}",  v111,  0x5Au);
        }

        if ((v21 & 1) != 0
          && ((v48 & 1) != 0
           || !sub_10100DBA0((uint64_t)(v96 + 6))
           || v22 && sub_10100DBB8((uint64_t)(v96 + 6), (uint64_t)buf)))
        {
          if (v47)
          {
            uint64_t v24 = dispatch_group_create();
            dispatch_group_enter(v24);
            __int16 v25 = objc_alloc(&OBJC_CLASS___CLLocation);
            __int128 v26 = *((_OWORD *)v96 + 5);
            __int128 v27 = *((_OWORD *)v96 + 8);
            __int128 v28 = *((_OWORD *)v96 + 9);
            *(_OWORD *)((char *)v68 + 12) = *(_OWORD *)((char *)v96 + 188);
            __int128 v29 = *((_OWORD *)v96 + 10);
            __int128 v30 = *((_OWORD *)v96 + 11);
            v67[6] = v28;
            v67[7] = v29;
            v68[0] = v30;
            __int128 v31 = *((_OWORD *)v96 + 6);
            __int128 v32 = *((_OWORD *)v96 + 7);
            v67[2] = v26;
            v67[3] = v31;
            v67[4] = v32;
            v67[5] = v27;
            __int128 v33 = *((_OWORD *)v96 + 4);
            v67[0] = *((_OWORD *)v96 + 3);
            v67[1] = v33;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472LL;
            v66[2] = sub_1011E83EC;
            v66[3] = &unk_1018A2C50;
            v66[4] = v24;
            v66[5] = &v95;
            objc_msgSend( v19,  "reduceAccuracy:withReply:",  -[CLLocation initWithClientLocation:](v25, "initWithClientLocation:", v67),  v66);
            dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
            dispatch_release(v24);
          }

          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_1018A2D08);
          }
          uint64_t v34 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
          {
            sub_100FE3FB4((uint64_t)v85, (uint64_t)__p);
            char v35 = v65 >= 0 ? __p : (void **)__p[0];
            *(_DWORD *)v111 = 68289282;
            *(_DWORD *)&v111[4] = 0;
            __int16 v112 = 2082;
            v113 = "";
            __int16 v114 = 2082;
            *(void *)v115 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:markReceivingLocationInformation, Client:%{public, location:escape_only}s}",  v111,  0x1Cu);
            if (v65 < 0) {
              operator delete(__p[0]);
            }
          }

          sub_1011F69B0((char *)__dst, (__int128 *)v85);
          [v19 markReceivingLocationInformation:sub_1011DBFBC((__int128 *)__dst)];
          if (v63 < 0) {
            operator delete(v62);
          }
          if (v61 < 0) {
            operator delete(v60);
          }
          if (v59 < 0) {
            operator delete(v58);
          }
          if (v57 < 0) {
            operator delete(v56);
          }
          if (v55 < 0) {
            operator delete(v54);
          }
          if (v53 < 0) {
            operator delete(v52);
          }
          if (v51 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void, NSData *))a7 + 2))( a7,  0LL,  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v96 + 6, 156LL));
        }

        else
        {
          uint64_t v42 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
          (*((void (**)(id, NSError *, void))a7 + 2))(a7, v42, 0LL);
        }

        char v43 = v136;
        if (v136)
        {
          p_shared_owners = (unint64_t *)&v136->__shared_owners_;
          do
            unint64_t v45 = __ldaxr(p_shared_owners);
          while (__stlxr(v45 - 1, p_shared_owners));
          if (!v45)
          {
            ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
            std::__shared_weak_count::__release_weak(v43);
          }
        }
      }

      else
      {
        id v41 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLCorrectiveCompensatedLocationProvider",  @"CLInternalService");
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3321888768LL;
        v69[2] = sub_1011E80C4;
        v69[3] = &unk_1018A2C18;
        sub_1011F69B0((char *)&v70, (__int128 *)v85);
        v69[4] = v19;
        v69[5] = a7;
        [v41 fetchLocationWithReply:v69];
        if (v83 < 0) {
          operator delete(v82);
        }
        if (v81 < 0) {
          operator delete(v80);
        }
        if (v79 < 0) {
          operator delete(v78);
        }
        if (v77 < 0) {
          operator delete(v76);
        }
        if (v75 < 0) {
          operator delete(v74);
        }
        if (v73 < 0) {
          operator delete(v72);
        }
        if (v71 < 0) {
          operator delete(v70);
        }
      }

      goto LABEL_71;
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int128 v36 = (os_log_s *)qword_101934978;
    if (!os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_64;
    }
    sub_1011E2990((uint64_t)v85, (std::string *)v111);
    if (v115[3] >= 0) {
      char v37 = v111;
    }
    else {
      char v37 = *(uint8_t **)v111;
    }
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v129 = 2082;
    v130 = "";
    __int16 v131 = 2082;
    *(void *)v132 = v37;
    *(_WORD *)&v132[8] = 1026;
    *(_DWORD *)&v132[10] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning #Spi, GetLocation rejected for entity: no way to establish effective authorization , name:%{public, location:escape_only}s, pid:%{public}d}",  buf,  0x22u);
    if ((v115[3] & 0x80000000) != 0) {
      operator delete(*(void **)v111);
    }
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
LABEL_64:
  __int128 v38 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    sub_1011E2990((uint64_t)v85, (std::string *)v111);
    char v39 = v115[3] >= 0 ? v111 : *(uint8_t **)v111;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v129 = 2082;
    v130 = "";
    __int16 v131 = 2082;
    *(void *)v132 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, GetLocation rejected for entity: insufficient effective authorization, name:%{p ublic, location:escape_only}s}",  buf,  0x1Cu);
    if ((v115[3] & 0x80000000) != 0) {
      operator delete(*(void **)v111);
    }
  }

  uint64_t v40 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
  (*((void (**)(id, NSError *, void))a7 + 2))(a7, v40, 0LL);

LABEL_71:
  if (SHIBYTE(v94[2]) < 0) {
    operator delete(v94[0]);
  }
  if (SHIBYTE(v93) < 0) {
    operator delete(*((void **)&v92 + 1));
  }
  if (SBYTE7(v92) < 0) {
    operator delete((void *)v91);
  }
  if ((v90[15] & 0x80000000) != 0) {
    operator delete(v89[1]);
  }
  if (SHIBYTE(v89[0]) < 0) {
    operator delete(v88[0]);
  }
  if (SHIBYTE(v87) < 0) {
    operator delete(v86[1]);
  }
  if (SHIBYTE(v86[0]) < 0) {
    operator delete(v85[0]);
  }
  _Block_object_dispose(&v95, 8);
  os_activity_scope_leave(&state);
}

- (void)getGroundAltitudeForBundleID:(id)a3 orBundlePath:(id)a4 location:(id)a5 replyBlock:(id)a6
{
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetGroundAltitude (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  unsigned int v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetGroundAltitude, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  *(_OWORD *)__int128 v92 = 0u;
  memset(v93, 0, 19);
  __int128 v90 = 0u;
  *(_OWORD *)__int128 v91 = 0u;
  *(_OWORD *)v88 = 0u;
  *(_OWORD *)v89 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  memset(__p, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:]( &OBJC_CLASS___CLInternalService,  "getEffectiveClientName:bundlePath:name:",  a3,  a4,  v88))
  {
    if (self) {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else {
      memset(v84, 0, sizeof(v84));
    }
    CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v84, v14);
    sub_100FE36F4((std::string *)v88, (const std::string *)buf);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    sub_100FE3FB4((uint64_t)v88, (uint64_t)buf);
    if (buf[23] >= 0) {
      id v16 = buf;
    }
    else {
      id v16 = *(_BYTE **)buf;
    }
    id v17 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    id v18 = objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientAuthorizationCache"),  "syncgetAuthorizationContextIfClientIsNonZonal:",  v17);
    if ([v18 isNonProvisionallyAuthorizedForServiceType:10])
    {
      uint64_t v75 = 0LL;
      __int128 v76 = &v75;
      uint64_t v77 = 0x3052000000LL;
      char v78 = sub_1011E8CD8;
      char v79 = sub_1011E8CE8;
      uint64_t v80 = 0LL;
      uint64_t v60 = 0LL;
      char v61 = &v60;
      uint64_t v62 = 0xD012000000LL;
      char v63 = sub_1011E808C;
      __int128 v64 = nullsub_1283;
      char v65 = &unk_10175E27B;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      memset(v74, 0, sizeof(v74));
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_1011E8CF4;
      v59[3] = &unk_1018A2C98;
      v59[4] = &v75;
      v59[5] = &v60;
      -[CLInternalService getLocationForBundleID:orBundlePath:dynamicAccuracyReductionEnabled:allowsAlteredAccessoryLocations:replyBlock:]( self,  "getLocationForBundleID:orBundlePath:dynamicAccuracyReductionEnabled:allowsAlteredAccessoryLocations:replyBlock:",  a3,  a4,  0LL,  0LL,  v59);
      if (v76[5])
      {
        id v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
        __int128 v56 = xmmword_1012EA5D0;
        uint64_t v57 = 0LL;
        uint64_t v58 = 0xFFFFFFFFLL;
        (*((void (**)(id, NSError *, __int128 *))a6 + 2))(a6, v19, &v56);
      }

      else
      {
        double v21 = *(double *)((char *)v61 + 52);
        double v22 = *(double *)((char *)v61 + 60);
        [a5 coordinate];
        double v24 = v23;
        [a5 coordinate];
        if (sub_100D2EC74(v21, v22, v24, v25) <= self->_groundAltitudeDistanceThreshold)
        {
          *(void *)&buf[12] = 0LL;
          *(void *)&uint8_t buf[4] = 0LL;
          *(_OWORD *)&buf[20] = xmmword_1012E0070;
          __asm { FMOV            V0.2D, #-1.0 }

          *(_OWORD *)&buf[36] = _Q0;
          *(_OWORD *)&buf[52] = _Q0;
          *(_OWORD *)&buf[68] = _Q0;
          *(_DWORD *)buf = 0xFFFF;
          *(_DWORD *)&buf[84] = 0;
          *(void *)&buf[88] = 0xBFF0000000000000LL;
          __int128 v100 = 0uLL;
          *(void *)((char *)&v101 + 4) = 0xBFF0000000000000LL;
          LODWORD(v101) = 0;
          HIDWORD(v101) = 0x7FFFFFFF;
          memset(v102, 0, 25);
          *(void *)&double v32 = sub_100869DC8(v103).n128_u64[0];
          if (a5)
          {
            objc_msgSend(a5, "clientLocation", v32);
          }

          else
          {
            __int128 v51 = 0u;
            memset(v52, 0, 28);
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            __int128 v44 = 0u;
          }

          __int128 v100 = v50;
          __int128 v101 = v51;
          *(_OWORD *)__int128 v102 = v52[0];
          *(_OWORD *)&v102[12] = *(_OWORD *)((char *)v52 + 12);
          *(_OWORD *)&_BYTE buf[32] = v46;
          *(_OWORD *)&uint8_t buf[48] = v47;
          *(_OWORD *)&buf[64] = v48;
          *(_OWORD *)&buf[80] = v49;
          *(_OWORD *)buf = v44;
          *(_OWORD *)&buf[16] = v45;
          int v43 = 0;
          *(void *)&__int128 v44 = 0LL;
          if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLDigitalElevationModel"),  "syncgetAltitude:rel:undulation:",  buf,  &v43,  &v44))
          {
            __int128 v40 = *(_OWORD *)&v103[376];
            uint64_t v41 = v44;
            uint64_t v42 = 2LL;
            (*((void (**)(id, void, __int128 *))a6 + 2))(a6, 0LL, &v40);
          }

          else
          {
            __int128 v33 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
            __int128 v37 = xmmword_1012EA5D0;
            uint64_t v38 = 0LL;
            uint64_t v39 = 0xFFFFFFFFLL;
            (*((void (**)(id, NSError *, __int128 *))a6 + 2))(a6, v33, &v37);
          }

          uint64_t v34 = v104;
          if (v104)
          {
            p_shared_owners = (unint64_t *)&v104->__shared_owners_;
            do
              unint64_t v36 = __ldaxr(p_shared_owners);
            while (__stlxr(v36 - 1, p_shared_owners));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
        }

        else
        {
          __int128 v26 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
          __int128 v53 = xmmword_1012EA5D0;
          uint64_t v54 = 0LL;
          uint64_t v55 = 0xFFFFFFFFLL;
          (*((void (**)(id, NSError *, __int128 *))a6 + 2))(a6, v26, &v53);
        }
      }

      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v75, 8);
    }

    else
    {
      if ([v18 isAuthorizedForServiceType:10]) {
        objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLInternalService"),  "handleProvisionalIntermediationForService:forClientKey:at:withReply:",  10,  v17,  0,  &stru_1018A2C70);
      }
      id v20 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  3LL,  0LL);
      __int128 v81 = xmmword_1012EA5D0;
      uint64_t v82 = 0LL;
      uint64_t v83 = 0xFFFFFFFFLL;
      (*((void (**)(id, NSError *, __int128 *))a6 + 2))(a6, v20, &v81);
    }
  }

  else
  {
    int v15 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    __int128 v85 = xmmword_1012EA5D0;
    uint64_t v86 = 0LL;
    uint64_t v87 = 0xFFFFFFFFLL;
    (*((void (**)(id, NSError *, __int128 *))a6 + 2))(a6, v15, &v85);
  }

  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v96) < 0) {
    operator delete(*((void **)&v95 + 1));
  }
  if (SBYTE7(v95) < 0) {
    operator delete((void *)v94);
  }
  if ((v93[15] & 0x80000000) != 0) {
    operator delete(v92[1]);
  }
  if (SHIBYTE(v92[0]) < 0) {
    operator delete(v91[0]);
  }
  if (SHIBYTE(v90) < 0) {
    operator delete(v89[1]);
  }
  if (SHIBYTE(v89[0]) < 0) {
    operator delete(v88[0]);
  }
  os_activity_scope_leave(&state);
}

- (void)getStatusBarIconState:(id)a3
{
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetStatusBarIconState (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2082;
    __int128 v26 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetStatusBarIconState, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v10 = objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLStatusBarIconManager"),  "syncgetIconState");
    if (v10 >= 3)
    {
      uint64_t v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      std::string v14 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = (int)v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Unexpected iconState: %d", buf, 8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        v20[0] = 67109120;
        v20[1] = (_DWORD)v10;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  2LL,  "Unexpected iconState: %d",  v20);
        id v18 = (uint8_t *)v17;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getStatusBarIconState:]", "%s\n", v17);
        if (v18 != buf) {
          free(v18);
        }
      }

      id v10 = 0LL;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    (*((void (**)(id, NSError *, id))a3 + 2))(a3, v11, v10);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v20[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v20,  2);
      id v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getStatusBarIconState:]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    unsigned int v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v13, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setStatusBarIconEnabledForEntityClass:(unsigned int)a3 enabled:(BOOL)a4 replyBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetStatusBarIconEnabledForEntityClass (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    char v35 = "";
    __int16 v36 = 2082;
    *(void *)__int128 v37 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetStatusBarIconEnabledForEntityClass, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v20, 0, sizeof(v20));
      }
      sub_100F4B1DC((uint64_t)v20, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v21);
      if (v48 < 0) {
        operator delete(__p);
      }
      if (v46 < 0) {
        operator delete(v45);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(*(void **)&v37[4]);
      }
      if ((v37[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v17 = &v21;
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        id v17 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int16 v23 = 68289794;
      int v24 = 0;
      __int16 v25 = 2082;
      __int128 v26 = "";
      __int16 v27 = 2082;
      __int128 v28 = v17;
      __int16 v29 = 1026;
      int v30 = v7;
      __int16 v31 = 1026;
      BOOL v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, setting the status bar icon enabled state, name:%{public, location:escape_onl y}s, entityClass:%{public}u, enabled:%{public}hhd}",  v23,  0x28u);
    }

    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLStatusBarIconManager"),  "setStatusBarIconForEntityClass:visible:",  v7,  v6);
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int16 v23 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v23,  2);
      id v19 = (uint8_t *)v18;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setStatusBarIconEnabledForEntityClass:enabled:replyBlock:]",  "%s\n",  v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    id v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v16);
  }

  os_activity_scope_leave(&state);
}

- (void)getStatusBarIconEnabledForEntityClass:(unsigned int)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetStatusBarIconEnabledForEntityClass (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v30 = 2082;
    __int16 v31 = "";
    __int16 v32 = 2082;
    *(void *)__int128 v33 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetStatusBarIconEnabledForEntityClass, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      sub_100F4B1DC((uint64_t)v18, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v19);
      if (v44 < 0) {
        operator delete(__p);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(*(void **)&v33[4]);
      }
      if ((v33[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      int v15 = &v19;
      if ((v19.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v15 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string v21 = 68289538;
      int v22 = 0;
      __int16 v23 = 2082;
      int v24 = "";
      __int16 v25 = 2082;
      __int128 v26 = v15;
      __int16 v27 = 1026;
      int v28 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Spi, Retrieved the status bar icon enabled state, name:%{public, location:escape_o nly}s, entityClass:%{public}u}",  v21,  0x22u);
    }

    (*((void (**)(id, void, id))a4 + 2))( a4,  0,  objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLStatusBarIconManager"),  "syncgetStatusBarIconForEntityClass:",  v5));
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)std::string v21 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v21,  2);
      id v17 = (uint8_t *)v16;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getStatusBarIconEnabledForEntityClass:replyBlock:]",  "%s\n",  v16);
      if (v17 != buf) {
        free(v17);
      }
    }

    std::string v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a4 + 2))(a4, v14, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setMapMatchingRouteHint:(id)a3 routingType:(int)a4 stepType:(int)a5 replyBlock:(id)a6
{
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetMapMatchingRouteHint (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v66 = 2082;
    __int128 v67 = "";
    __int16 v68 = 2082;
    *(void *)__int128 v69 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetMapMatchingRouteHint, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.route_hint");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    unint64_t v52 = v11;
    id v16 = (char *)[a3 bytes];
    __int128 v50 = (void (**)(id, void))a6;
    int v53 = a4;
    int v54 = a5;
    unint64_t v17 = (unint64_t)[a3 length];
    unint64_t v51 = v17 / 0x28;
    std::string __p = 0LL;
    char v59 = 0LL;
    uint64_t v60 = 0LL;
    if (v17 >= 0x28)
    {
      id v18 = 0LL;
      uint64_t v19 = 0LL;
      if (v51 <= 1) {
        unint64_t v20 = 1LL;
      }
      else {
        unint64_t v20 = v17 / 0x28;
      }
      do
      {
        std::string v21 = &v16[40 * v19];
        if (v18 >= (_OWORD *)v60)
        {
          int v24 = __p;
          unint64_t v25 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v18 - (_BYTE *)__p) >> 3);
          unint64_t v26 = v25 + 1;
          if (v25 + 1 > 0x666666666666666LL) {
            sub_100007008();
          }
          if (0x999999999999999ALL * ((v60 - (_BYTE *)__p) >> 3) > v26) {
            unint64_t v26 = 0x999999999999999ALL * ((v60 - (_BYTE *)__p) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v60 - (_BYTE *)__p) >> 3) >= 0x333333333333333LL) {
            unint64_t v27 = 0x666666666666666LL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27)
          {
            int v28 = (char *)sub_100100EF8((uint64_t)&v60, v27);
            int v24 = __p;
            id v18 = v59;
          }

          else
          {
            int v28 = 0LL;
          }

          __int16 v29 = &v28[40 * v25];
          __int128 v30 = *(_OWORD *)v21;
          __int128 v31 = *((_OWORD *)v21 + 1);
          *((void *)v29 + 4) = *((void *)v21 + 4);
          *(_OWORD *)__int16 v29 = v30;
          *((_OWORD *)v29 + 1) = v31;
          if (v18 == v24)
          {
            char v35 = &v28[40 * v25];
          }

          else
          {
            __int16 v32 = &v28[40 * v25];
            do
            {
              __int128 v33 = *(_OWORD *)((char *)v18 - 40);
              __int128 v34 = *(_OWORD *)((char *)v18 - 24);
              char v35 = v32 - 40;
              *((void *)v32 - 1) = *((void *)v18 - 1);
              *(_OWORD *)(v32 - 24) = v34;
              *(_OWORD *)(v32 - 40) = v33;
              id v18 = (_OWORD *)((char *)v18 - 40);
              v32 -= 40;
            }

            while (v18 != v24);
          }

          id v18 = v29 + 40;
          std::string __p = v35;
          char v59 = v29 + 40;
          uint64_t v60 = &v28[40 * v27];
          if (v24) {
            operator delete(v24);
          }
        }

        else
        {
          __int128 v22 = *(_OWORD *)v21;
          __int128 v23 = *((_OWORD *)v21 + 1);
          *((void *)v18 + 4) = *((void *)v21 + 4);
          *id v18 = v22;
          v18[1] = v23;
          id v18 = (_OWORD *)((char *)v18 + 40);
        }

        char v59 = v18;
        ++v19;
      }

      while (v19 != v20);
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = v52;
    char v36 = (void (**)(id, void))a6;
    unsigned int v38 = v53;
    unsigned int v37 = v54;
    uint64_t v39 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
    {
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v57, 0, sizeof(v57));
      }
      sub_100F4B1DC((uint64_t)v57, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, &v62);
      if (v80 < 0) {
        operator delete(v79);
      }
      if (v78 < 0) {
        operator delete(v77);
      }
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(*(void **)&v69[4]);
      }
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      char v42 = &v62;
      if ((v62.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        char v42 = (std::string *)v62.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 v81 = 134349826;
      unint64_t v82 = v51;
      __int16 v83 = 1026;
      int v84 = v53;
      __int16 v85 = 1026;
      int v86 = v54;
      __int16 v87 = 2082;
      v88 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "#Spi,RouteHints,setMapMatchingRouteHint,received,%{public}lu,routeType,%{public}d,stepType,%{public}d,source,%{public}s",  v81,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v46 = qword_101934978;
      if (self) {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else {
        memset(v55, 0, sizeof(v55));
      }
      sub_100F4B1DC((uint64_t)v55, (uint64_t)v81);
      sub_1011E2990((uint64_t)v81, &v56);
      sub_1011F6920((uint64_t)v81);
      if ((v56.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        __int128 v47 = &v56;
      }
      else {
        __int128 v47 = (std::string *)v56.__r_.__value_.__r.__words[0];
      }
      LODWORD(v62.__r_.__value_.__l.__data_) = 134349826;
      *(std::string::size_type *)((char *)v62.__r_.__value_.__r.__words + 4) = v51;
      WORD2(v62.__r_.__value_.__r.__words[1]) = 1026;
      *(_DWORD *)((char *)&v62.__r_.__value_.__r.__words[1] + 6) = v53;
      WORD1(v62.__r_.__value_.__r.__words[2]) = 1026;
      HIDWORD(v62.__r_.__value_.__r.__words[2]) = v54;
      __int16 v63 = 2082;
      __int128 v64 = v47;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v46,  2LL,  "#Spi,RouteHints,setMapMatchingRouteHint,received,%{public}lu,routeType,%{public}d,stepType,%{public}d,source,%{public}s",  &v62,  34);
      __int128 v49 = v48;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]",  "%s\n",  v49);
      uint64_t v11 = v52;
      char v36 = v50;
      unsigned int v38 = v53;
      unsigned int v37 = v54;
    }

    uint64_t v43 = sub_1006088E8();
    sub_100609294(v43, v38, v37, (uint64_t)&__p);
    v36[2](v36, 0LL);
    if (__p)
    {
      char v59 = __p;
      operator delete(__p);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    char v40 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      *(_WORD *)__int128 v81 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v81,  2);
      __int128 v45 = (uint8_t *)v44;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]",  "%s\n",  v44);
      if (v45 != buf) {
        free(v45);
      }
    }

    uint64_t v41 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v41);
  }

  os_activity_scope_leave(&state);
}

- (void)setTrackRunHint:(id)a3 replyBlock:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetTrackRunHint (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v32 = 2082;
    __int128 v33 = "";
    __int16 v34 = 2082;
    *(void *)char v35 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetTrackRunHint, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v10 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.grassland");
  if (v10
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_101934490 != -1) {
      dispatch_once(&qword_101934490, &stru_1018A2D48);
    }
    id v12 = (os_log_s *)qword_101934498;
    if (os_log_type_enabled((os_log_t)qword_101934498, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }

      else
      {
        __int128 v24 = 0u;
        __int128 v25 = 0u;
      }

      sub_100F4B1DC((uint64_t)&v24, (uint64_t)buf);
      sub_1011E2990((uint64_t)buf, v27);
      if (v46 < 0) {
        operator delete(__p);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(*(void **)&v35[4]);
      }
      if ((v35[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v15 = v27;
      if ((v27[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v15 = (std::string *)v27[0].__r_.__value_.__r.__words[0];
      }
      LODWORD(v28.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v28.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#Spi,CLTR,Daemon,setTrackRunHint,received,source,%{public}s",  (uint8_t *)&v28,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934490 != -1) {
        dispatch_once(&qword_101934490, &stru_1018A2D48);
      }
      uint64_t v18 = qword_101934498;
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }

      else
      {
        __int128 v22 = 0u;
        __int128 v23 = 0u;
      }

      sub_100F4B1DC((uint64_t)&v22, (uint64_t)v27);
      sub_1011E2990((uint64_t)v27, &v28);
      sub_1011F6920((uint64_t)v27);
      if ((v28.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v19 = &v28;
      }
      else {
        uint64_t v19 = (std::string *)v28.__r_.__value_.__r.__words[0];
      }
      int v29 = 136446210;
      __int128 v30 = v19;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  0LL,  "#Spi,CLTR,Daemon,setTrackRunHint,received,source,%{public}s",  &v29,  12,  v22,  v23,  v24,  v25);
      std::string v21 = v20;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v21);
    }

    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLLocationController"),  "setTrackRunHint:",  a3);
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v27[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v27,  2);
      unint64_t v17 = (uint8_t *)v16;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v16);
      if (v17 != buf) {
        free(v17);
      }
    }

    id v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v14);
  }

  os_activity_scope_leave(&state);
}

- (void)getAccessoryTypeBitSetWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: getAccessoryTypeBitSetWithReplyBlock (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    std::string v21 = "";
    __int16 v22 = 2082;
    __int128 v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:getAccessoryTypeBitSetWithReplyBlock, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.accessory_location");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v10 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLAccessoryLocationProvider");
    objc_msgSend( v10,  "registerDelegate:inSilo:",  +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"),  +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1011EAE10;
    v15[3] = &unk_101872E20;
    v15[4] = a3;
    [v10 fetchAccessoryBitSetWithReply:v15];
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      id v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getAccessoryTypeBitSetWithReplyBlock:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    id v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, uint64_t))a3 + 2))(a3, v12, 0xFFFFFFFFLL);
  }

  os_activity_scope_leave(&state);
}

- (void)getAccessoryPASCDTransmissionStateWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: getAccessoryPASCDTransmissionStateWithReplyBlock (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    std::string v21 = "";
    __int16 v22 = 2082;
    __int128 v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:getAccessoryPASCDTransmissionStateWithReplyBlock, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.accessory_location");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v10 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLAccessoryLocationProvider");
    objc_msgSend( v10,  "registerDelegate:inSilo:",  +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"),  +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1011EB1E0;
    v15[3] = &unk_101872E20;
    v15[4] = a3;
    [v10 fetchAccessoryPASCDTransmissionStateWithReply:v15];
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      id v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getAccessoryPASCDTransmissionStateWithReplyBlock:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    id v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, uint64_t))a3 + 2))(a3, v12, 4LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getOdometryBatchedLocationsWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: getOdometryBatchedLocationsWithReplyBlock (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2082;
    std::string v21 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:getOdometryBatchedLocationsWithReplyBlock, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v7 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.batched_location");
  if (v7
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  1LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v9, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v14,  2);
      uint64_t v13 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getOdometryBatchedLocationsWithReplyBlock:]",  "%s\n",  v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    uint64_t v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v11, 0LL);
  }

  os_activity_scope_leave(&state);
}

+ (BOOL)getEffectiveClientName:(id)a3 bundlePath:(id)a4 name:(void *)a5
{
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (![a3 length] && !objc_msgSend(a4, "length")
    || (id v9 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.effective_bundle")) != 0LL && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    if ([a3 length])
    {
      sub_1010DDBC0(__str, (char *)[a3 UTF8String]);
      sub_100FE2D54((std::string *)__str, (uint64_t)buf);
      sub_1011DBE2C((uint64_t)a5, (__int128 *)buf);
      if (v44 < 0) {
        operator delete(__p);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v11 = (os_log_s *)qword_101934978;
      if (!os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      sub_100FE370C((uint64_t)a5);
      id v14 = (char *)*((void *)a5 + 13);
      uint64_t v13 = (char *)a5 + 104;
      id v12 = v14;
      if (v13[23] >= 0) {
        id v12 = v13;
      }
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v12;
      uint64_t v15 = "{msg%{public}.0s:#Spi, Called for bundle identifier, bundleID:%{public, location:escape_only}s}";
    }

    else
    {
      if (![a4 length])
      {
        unint64_t v27 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection");
        if (v27) {
          -[NSXPCConnection auditToken](v27, "auditToken");
        }
        else {
          memset(__str, 0, sizeof(__str));
        }
        sub_100F4B1DC((uint64_t)__str, (uint64_t)buf);
        sub_1011DBE2C((uint64_t)a5, (__int128 *)buf);
        if (v44 < 0) {
          operator delete(__p);
        }
        if (v42 < 0) {
          operator delete(v41);
        }
        if (v40 < 0) {
          operator delete(v39);
        }
        if (v38 < 0) {
          operator delete(v37);
        }
        if (v36 < 0) {
          operator delete(v35);
        }
        if (v34 < 0) {
          operator delete(*(void **)&buf[24]);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_64;
      }

      sub_1010DDBC0(__str, (char *)[a4 UTF8String]);
      sub_100FE2DDC((std::string *)__str, (uint64_t)buf);
      sub_1011DBE2C((uint64_t)a5, (__int128 *)buf);
      if (v44 < 0) {
        operator delete(__p);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v11 = (os_log_s *)qword_101934978;
      if (!os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      __int16 v22 = (char *)*((void *)a5 + 6);
      std::string v21 = (char *)a5 + 48;
      __int16 v20 = v22;
      if (v21[23] >= 0) {
        __int16 v20 = v21;
      }
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v20;
      uint64_t v15 = "{msg%{public}.0s:#Spi, Called for bundle path, bundlePath:%{public, location:escape_only}s}";
    }

    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v15, buf, 0x1Cu);
LABEL_64:
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
LABEL_66:
    __int128 v23 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v24 = &stru_1018A4B00;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      if (a3) {
        __int128 v25 = (const __CFString *)a3;
      }
      else {
        __int128 v25 = &stru_1018A4B00;
      }
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      if (a4) {
        __int128 v24 = (const __CFString *)a4;
      }
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v25;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:client getting effective client name, bundleId:%{public, location:escape_only}@,  bundlePath:%{public, location:escape_only}@}",  buf,  0x26u);
    }

    BOOL v19 = 1;
    goto LABEL_74;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v16 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
  {
    int v17 = &stru_1018A4B00;
    if (a3) {
      __int16 v18 = (const __CFString *)a3;
    }
    else {
      __int16 v18 = &stru_1018A4B00;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = @"com.apple.locationd.effective_bundle";
    *(_WORD *)&buf[12] = 2114;
    if (a4) {
      int v17 = (const __CFString *)a4;
    }
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "#Spi, requires entitlement '%{public}@' with bundle identifier '%{public}@' or bundle path '%{public}@'",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v28 = &stru_1018A4B00;
    if (a3) {
      int v29 = (const __CFString *)a3;
    }
    else {
      int v29 = &stru_1018A4B00;
    }
    *(_DWORD *)std::string __str = 138543874;
    if (a4) {
      std::string v28 = (const __CFString *)a4;
    }
    *(void *)&__str[4] = @"com.apple.locationd.effective_bundle";
    *(_WORD *)&__str[12] = 2114;
    *(void *)&__str[14] = v29;
    *(_WORD *)&__str[22] = 2114;
    *(void *)&__str[24] = v28;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "#Spi, requires entitlement '%{public}@' with bundle identifier '%{public}@' or bundle path '%{public}@'",  COERCE_DOUBLE(138543874LL),  __str,  32);
    __int128 v31 = (char *)v30;
    sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLInternalService getEffectiveClientName:bundlePath:name:]", "%s\n", v30);
    if (v31 != buf) {
      free(v31);
    }
  }

  BOOL v19 = 0;
LABEL_74:

  return v19;
}

- (void)getPipelinedCacheWithReply:(id)a3
{
  char v76 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemongetPipelinedCache (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)v99 = 0;
    *(_WORD *)&v99[4] = 2082;
    *(void *)&v99[6] = "";
    *(_WORD *)&v99[14] = 2082;
    *(void *)&v99[16] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemongetPipelinedCache, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v7 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.pipelined_diagnostic");
  if (!v7
    || (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    || ([v7 BOOLValue] & 1) == 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v94) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v94,  2);
      int v53 = (uint8_t *)v52;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v52);
      if (v53 != buf) {
        free(v53);
      }
    }

    __int16 v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, NSArray *))a3 + 2))( a3,  v18,  +[NSArray array](&OBJC_CLASS___NSArray, "array"));

    goto LABEL_44;
  }

  id v9 = [@"/var/mobile/Library/Logs/pipelined" stringByAppendingPathComponent:@"/tiles"];
  uint64_t v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (qword_1019A0698)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply cancelling previous delete due to new request",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v94) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply cancelling previous delete due to new request",  &v94,  2);
      uint64_t v55 = (uint8_t *)v54;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v54);
      if (v55 != buf) {
        free(v55);
      }
    }

    dispatch_block_cancel((dispatch_block_t)qword_1019A0698);
    _Block_release((const void *)qword_1019A0698);
    qword_1019A0698 = 0LL;
  }

  id v12 = getgrnam("_analyticsusers");
  uint64_t v13 = getpwnam("root");
  if (!v12 || !v13)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    BOOL v19 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply FAILED to find root uid and _analyticsusers gid",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v94) = 0;
      LODWORD(v70) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply FAILED to find root uid and _analyticsusers gid",  &v94,  v70);
      uint64_t v57 = (uint8_t *)v56;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v56);
      if (v57 != buf) {
        free(v57);
      }
    }

    __int16 v20 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void *))a3 + 2))(a3, v20, &__NSArray0__struct);

    goto LABEL_44;
  }

  uid_t pw_uid = v13->pw_uid;
  gid_t gr_gid = v12->gr_gid;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v10, "fileExistsAtPath:isDirectory:", v9, 0LL))
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply destination root path exists, deleting directory now...",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v94) = 0;
      LODWORD(v70) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply destination root path exists, deleting directory now...",  &v94,  v70);
      char v59 = (uint8_t *)v58;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v58);
      if (v59 != buf) {
        free(v59);
      }
    }

    uint64_t v89 = 0LL;
    if (!-[NSFileManager removeItemAtPath:error:](v10, "removeItemAtPath:error:", v9, &v89))
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      __int16 v22 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v99 = v9;
        *(_WORD *)&v99[8] = 2112;
        *(void *)&v99[10] = v89;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply removal of %@ FAILED with error %@",  buf,  0x16u);
      }

      if (!sub_1002921D0(115, 0)) {
        goto LABEL_62;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      int v94 = 138412546;
      id v95 = v9;
      __int16 v96 = 2112;
      uint64_t v97 = v89;
      LODWORD(v70) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply removal of %@ FAILED with error %@",  &v94,  v70);
      __int16 v63 = (uint8_t *)v65;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v65);
      if (v63 == buf) {
        goto LABEL_62;
      }
LABEL_164:
      free(v63);
LABEL_62:
      __int128 v23 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void *))a3 + 2))(a3, v23, &__NSArray0__struct);

      goto LABEL_44;
    }
  }

  uint64_t v89 = 0LL;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v10,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v9,  1LL,  0LL,  &v89))
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v99 = v9;
      *(_WORD *)&v99[8] = 2112;
      *(void *)&v99[10] = v89;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply FAILED to create destination root path %@ with error %@",  buf,  0x16u);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_62;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v94 = 138412546;
    id v95 = v9;
    __int16 v96 = 2112;
    uint64_t v97 = v89;
    LODWORD(v70) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply FAILED to create destination root path %@ with error %@",  &v94,  v70);
    __int16 v63 = (uint8_t *)v62;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v62);
    if (v63 == buf) {
      goto LABEL_62;
    }
    goto LABEL_164;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v15 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v99 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply created destination root path %@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v94 = 138412290;
    id v95 = v9;
    LODWORD(v70) = 12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply created destination root path %@",  &v94,  v70);
    char v61 = (uint8_t *)v60;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v60);
    if (v61 != buf) {
      free(v61);
    }
  }

  if (chown((const char *)[v9 UTF8String], pw_uid, gr_gid)
    || chmod((const char *)[v9 UTF8String], 0x1E8u))
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v16 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v99 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_62;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v94 = 138412290;
    id v95 = v9;
    LODWORD(v70) = 12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible",  &v94,  v70);
    __int16 v63 = (uint8_t *)v64;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v64);
    if (v63 == buf) {
      goto LABEL_62;
    }
    goto LABEL_164;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  __int128 v24 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v99 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v94 = 138412290;
    id v95 = v9;
    LODWORD(v70) = 12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible",  &v94,  v70);
    __int128 v67 = (uint8_t *)v66;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v66);
    if (v67 != buf) {
      free(v67);
    }
  }

  __int128 v71 = self;
  char v72 = (void (**)(id, void, NSArray *))a3;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v86 = 0u;
  __int128 v85 = 0u;
  id v25 = [&off_1018D7360 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v25)
  {
    uint64_t v73 = *(void *)v86;
    do
    {
      uint64_t v26 = 0LL;
      id v74 = v25;
      do
      {
        if (*(void *)v86 != v73) {
          objc_enumerationMutation(&off_1018D7360);
        }
        uint64_t v75 = v26;
        unint64_t v27 = *(void **)(*((void *)&v85 + 1) + 8 * v26);
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        std::string v28 = -[NSFileManager subpathsAtPath:](v10, "subpathsAtPath:", v27);
        id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v81,  v92,  16LL);
        if (v29)
        {
          uint64_t v30 = *(void *)v82;
          do
          {
            __int128 v31 = 0LL;
            do
            {
              if (*(void *)v82 != v30) {
                objc_enumerationMutation(v28);
              }
              __int16 v32 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)v31);
              id v33 = [v27 stringByAppendingPathComponent:v32];
              id v34 = objc_msgSend(v9, "stringByAppendingPathComponent:", objc_msgSend(v32, "lastPathComponent"));
              unsigned int v35 = -[NSFileManager fileExistsAtPath:isDirectory:](v10, "fileExistsAtPath:isDirectory:", v33, &v80);
              if (v80) {
                unsigned int v36 = 0;
              }
              else {
                unsigned int v36 = v35;
              }
              if (v36 == 1)
              {
                if (sub_100292DA4( (const char *)[v33 UTF8String],  (const char *)objc_msgSend(v34, "UTF8String")))
                {
                  if (qword_101934970 != -1) {
                    dispatch_once(&qword_101934970, &stru_1018A2D28);
                  }
                  unsigned int v37 = (os_log_s *)qword_101934978;
                  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v99 = v33;
                    *(_WORD *)&v99[8] = 2112;
                    *(void *)&v99[10] = v34;
                    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply successfully copied %@ to %@",  buf,  0x16u);
                  }

                  if (sub_1002921D0(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_101934970 != -1) {
                      dispatch_once(&qword_101934970, &stru_1018A2D28);
                    }
                    int v94 = 138412546;
                    id v95 = v33;
                    __int16 v96 = 2112;
                    uint64_t v97 = (uint64_t)v34;
                    LODWORD(v70) = 22;
                    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply successfully copied %@ to %@",  &v94,  v70);
                    __int128 v45 = (uint8_t *)v44;
                    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getPipelinedCacheWithReply:]",  "%s\n",  v44);
                    if (v45 != buf) {
                      free(v45);
                    }
                  }

                  if (chown((const char *)[v34 UTF8String], pw_uid, gr_gid))
                  {
                    if (qword_101934970 != -1) {
                      dispatch_once(&qword_101934970, &stru_1018A2D28);
                    }
                    char v38 = (os_log_s *)qword_101934978;
                    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v99 = v34;
                      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible",  buf,  0xCu);
                    }

                    if (sub_1002921D0(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_101934970 != -1) {
                        dispatch_once(&qword_101934970, &stru_1018A2D28);
                      }
                      int v94 = 138412290;
                      id v95 = v34;
                      LODWORD(v70) = 12;
                      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible",  &v94,  v70);
                      char v40 = (uint8_t *)v39;
                      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService getPipelinedCacheWithReply:]",  "%s\n",  v39);
LABEL_119:
                      if (v40 != buf) {
                        free(v40);
                      }
                    }
                  }

                  else
                  {
                    if (qword_101934970 != -1) {
                      dispatch_once(&qword_101934970, &stru_1018A2D28);
                    }
                    uint64_t v43 = (os_log_s *)qword_101934978;
                    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v99 = v34;
                      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible",  buf,  0xCu);
                    }

                    if (sub_1002921D0(115, 2))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_101934970 != -1) {
                        dispatch_once(&qword_101934970, &stru_1018A2D28);
                      }
                      int v94 = 138412290;
                      id v95 = v34;
                      LODWORD(v70) = 12;
                      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible",  &v94,  v70);
                      char v40 = (uint8_t *)v46;
                      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getPipelinedCacheWithReply:]",  "%s\n",  v46);
                      goto LABEL_119;
                    }
                  }
                }

                else
                {
                  if (qword_101934970 != -1) {
                    dispatch_once(&qword_101934970, &stru_1018A2D28);
                  }
                  uint64_t v41 = (os_log_s *)qword_101934978;
                  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v99 = v33;
                    *(_WORD *)&v99[8] = 2112;
                    *(void *)&v99[10] = v34;
                    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "getPipelinedCacheWithReply FAILED to copy %@ to %@. Check PROTECTION CLASS of the file and device protection state.",  buf,  0x16u);
                  }

                  if (sub_1002921D0(115, 0))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_101934970 != -1) {
                      dispatch_once(&qword_101934970, &stru_1018A2D28);
                    }
                    int v94 = 138412546;
                    id v95 = v33;
                    __int16 v96 = 2112;
                    uint64_t v97 = (uint64_t)v34;
                    LODWORD(v70) = 22;
                    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "getPipelinedCacheWithReply FAILED to copy %@ to %@. Check PROTECTION CLASS of the file and device protection state.",  &v94,  v70);
                    char v40 = (uint8_t *)v42;
                    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService getPipelinedCacheWithReply:]",  "%s\n",  v42);
                    goto LABEL_119;
                  }
                }
              }

              __int128 v31 = (char *)v31 + 1;
            }

            while (v29 != v31);
            id v47 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v81,  v92,  16LL);
            id v29 = v47;
          }

          while (v47);
        }

        uint64_t v26 = v75 + 1;
      }

      while ((id)(v75 + 1) != v74);
      id v25 = [&off_1018D7360 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }

    while (v25);
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  char v48 = v72;
  __int128 v49 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v99 = v9;
    *(_WORD *)&v99[8] = 2048;
    *(void *)&v99[10] = 3600LL;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "getPipelinedCacheWithReply deleting %@ in %llu seconds",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v94 = 138412546;
    id v95 = v9;
    __int16 v96 = 2048;
    uint64_t v97 = 3600LL;
    LODWORD(v70) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  1LL,  "getPipelinedCacheWithReply deleting %@ in %llu seconds",  &v94,  v70);
    __int128 v69 = (uint8_t *)v68;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v68);
    if (v69 != buf) {
      free(v69);
    }
    char v48 = v72;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1011ED638;
  block[3] = &unk_10181A328;
  block[4] = v10;
  block[5] = v9;
  qword_1019A0698 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v50 = dispatch_time(0LL, 3600000000000LL);
  unint64_t v51 = (dispatch_queue_s *)objc_msgSend(-[CLInternalService silo](v71, "silo"), "queue");
  dispatch_after(v50, v51, (dispatch_block_t)qword_1019A0698);
  id v91 = v9;
  v48[2](v48, 0LL, +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
LABEL_44:
  os_activity_scope_leave(&state);
}

- (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 orAuditToken:(id *)a6 byLocationButton:(BOOL)a7 voiceInteractionEnabled:(BOOL)a8 replyBlock:(id)a9
{
  BOOL v35 = a8;
  BOOL v36 = a7;
  BOOL v34 = a3;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v14 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v15 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetAuthorizationStatusByType, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v16 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v16)
  {
    objc_opt_class(&OBJC_CLASS___NSNumber);
    if (objc_opt_isKindOfClass(v16, v17) & 1) != 0 && ([v16 BOOLValue])
    {
      if (![a4 length] && !objc_msgSend(a5, "length") && !v36)
      {
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        __int16 v22 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path if setting temporary authorization not by LocationButton",  (uint8_t *)buf,  2u);
        }

        if (sub_1002921D0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          LOWORD(v41.__r_.__value_.__l.__data_) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path if setting temporary authorization not by LocationButton",  &v41,  2);
          id v33 = (std::string *)v32;
          sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton: voiceInteractionEnabled:replyBlock:]",  "%s\n",  v32);
          if (v33 != buf) {
            free(v33);
          }
        }

        __int128 v23 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
        (*((void (**)(id, NSError *))a9 + 2))(a9, v23);

        goto LABEL_46;
      }

      memset(v60, 0, 35);
      *(_OWORD *)char v59 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v61 = 0u;
      memset(v62, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)&v41);
        buf[0] = v41;
        v41.__r_.__value_.__s.__size_ = 0;
        v41.__r_.__value_.__s.__data_[0] = 0;
        buf[1] = v42;
        v42.__r_.__value_.__s.__size_ = 0;
        v42.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v60[0]) < 0) {
          operator delete(v59[0]);
        }
        *(_OWORD *)char v59 = v43;
        v60[0] = v44;
        HIBYTE(v44) = 0;
        LOBYTE(v43) = 0;
        if (SHIBYTE(v60[3]) < 0) {
          operator delete(v60[1]);
        }
        *(_OWORD *)&v60[1] = v45;
        v60[3] = v46;
        HIBYTE(v46) = 0;
        LOBYTE(v45) = 0;
        LOWORD(v60[4]) = v47;
        BYTE2(v60[4]) = v48;
        if (SBYTE7(v62[0]) < 0) {
          operator delete((void *)v61);
        }
        __int128 v61 = v49;
        *(void *)&v62[0] = v50;
        HIBYTE(v50) = 0;
        LOBYTE(v49) = 0;
        if (SHIBYTE(v62[1]) < 0) {
          operator delete(*((void **)&v62[0] + 1));
        }
        char v19 = 0;
        *(_OWORD *)((char *)v62 + 8) = v51;
        *((void *)&v62[1] + 1) = v52;
        HIBYTE(v52) = 0;
        LOBYTE(v51) = 0;
        if (SBYTE7(v62[3]) < 0)
        {
          operator delete(*(void **)&v62[2]);
          char v19 = HIBYTE(v52);
        }

        v62[2] = v53;
        *(void *)&v62[3] = v54;
        HIBYTE(v54) = 0;
        LOBYTE(v53) = 0;
        WORD4(v62[3]) = v55;
        BYTE10(v62[3]) = v56;
        if (v19 < 0) {
          operator delete((void *)v51);
        }
        if (SHIBYTE(v50) < 0) {
          operator delete((void *)v49);
        }
        if (SHIBYTE(v46) < 0) {
          operator delete((void *)v45);
        }
        if (SHIBYTE(v44) < 0) {
          operator delete((void *)v43);
        }
        if (self) {
          -[CLInternalService currentToken](self, "currentToken");
        }
        else {
          memset(v39, 0, sizeof(v39));
        }
        CLConnection::getUserNameFromAuditToken(&v41, (CLConnection *)v39, v18);
        sub_100FE36F4(buf, &v41);
      }

      else
      {
        if (![a5 length])
        {
          sub_100F4B1DC((uint64_t)a6, (uint64_t)&v41);
          sub_1011DBE2C((uint64_t)buf, (__int128 *)&v41);
          sub_1011F6920((uint64_t)&v41);
LABEL_93:
          id v26 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)&v41);
          if ((v41.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            unint64_t v27 = &v41;
          }
          else {
            unint64_t v27 = (std::string *)v41.__r_.__value_.__r.__words[0];
          }
          std::string v28 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27);
          __int128 v29 = *(_OWORD *)&a6->var0[4];
          v37[0] = *(_OWORD *)a6->var0;
          v37[1] = v29;
          [v26 markClientTemporaryAuthorizationGranted:v34 forClientKey:v28 andAuditToken:v37 byLocationButton:v36 voiceInteractionEnabled:v35];
          (*((void (**)(id, void))a9 + 2))(a9, 0LL);
          if (SBYTE7(v62[3]) < 0) {
            operator delete(*(void **)&v62[2]);
          }
          if (SHIBYTE(v62[1]) < 0) {
            operator delete(*((void **)&v62[0] + 1));
          }
          if (SBYTE7(v62[0]) < 0) {
            operator delete((void *)v61);
          }
          if (SHIBYTE(v60[3]) < 0) {
            operator delete(v60[1]);
          }
          if (SHIBYTE(v60[0]) < 0) {
            operator delete(v59[0]);
          }
          goto LABEL_46;
        }

        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)&v41);
        buf[0] = v41;
        v41.__r_.__value_.__s.__size_ = 0;
        v41.__r_.__value_.__s.__data_[0] = 0;
        buf[1] = v42;
        v42.__r_.__value_.__s.__size_ = 0;
        v42.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v60[0]) < 0) {
          operator delete(v59[0]);
        }
        *(_OWORD *)char v59 = v43;
        v60[0] = v44;
        HIBYTE(v44) = 0;
        LOBYTE(v43) = 0;
        if (SHIBYTE(v60[3]) < 0) {
          operator delete(v60[1]);
        }
        *(_OWORD *)&v60[1] = v45;
        v60[3] = v46;
        HIBYTE(v46) = 0;
        LOBYTE(v45) = 0;
        LOWORD(v60[4]) = v47;
        BYTE2(v60[4]) = v48;
        if (SBYTE7(v62[0]) < 0) {
          operator delete((void *)v61);
        }
        __int128 v61 = v49;
        *(void *)&v62[0] = v50;
        HIBYTE(v50) = 0;
        LOBYTE(v49) = 0;
        if (SHIBYTE(v62[1]) < 0) {
          operator delete(*((void **)&v62[0] + 1));
        }
        char v25 = 0;
        *(_OWORD *)((char *)v62 + 8) = v51;
        *((void *)&v62[1] + 1) = v52;
        HIBYTE(v52) = 0;
        LOBYTE(v51) = 0;
        if (SBYTE7(v62[3]) < 0)
        {
          operator delete(*(void **)&v62[2]);
          char v25 = HIBYTE(v52);
        }

        v62[2] = v53;
        *(void *)&v62[3] = v54;
        HIBYTE(v54) = 0;
        LOBYTE(v53) = 0;
        WORD4(v62[3]) = v55;
        BYTE10(v62[3]) = v56;
        if (v25 < 0) {
          operator delete((void *)v51);
        }
        if (SHIBYTE(v50) < 0) {
          operator delete((void *)v49);
        }
        if (SHIBYTE(v46) < 0) {
          operator delete((void *)v45);
        }
        if (SHIBYTE(v44) < 0) {
          operator delete((void *)v43);
        }
        if (self) {
          -[CLInternalService currentToken](self, "currentToken");
        }
        else {
          memset(v38, 0, sizeof(v38));
        }
        CLConnection::getUserNameFromAuditToken(&v41, (CLConnection *)v38, v24);
        sub_100FE36F4(buf, &v41);
      }

      goto LABEL_93;
    }
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  __int16 v20 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    LOWORD(v41.__r_.__value_.__l.__data_) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v41,  2);
    __int128 v31 = (std::string *)v30;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton:voiceI nteractionEnabled:replyBlock:]",  "%s\n",  v30);
    if (v31 != buf) {
      free(v31);
    }
  }

  std::string v21 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
  (*((void (**)(id, NSError *))a9 + 2))(a9, v21);

LABEL_46:
  os_activity_scope_leave(&state);
}

- (void)setTemporaryPreciseAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  BOOL v9 = a3;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetTemporaryPreciseAuthorization (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetTemporaryPreciseAuthorization, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v49, 0, 35);
      *(_OWORD *)char v48 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v50 = 0u;
      memset(v51, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)&v30);
      }

      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v28, 0, sizeof(v28));
          }
          CLConnection::getUserNameFromAuditToken(&v30, (CLConnection *)v28, v16);
          sub_100FE36F4(buf, &v30);
          id v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)&v30);
          if ((v30.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            std::string v21 = &v30;
          }
          else {
            std::string v21 = (std::string *)v30.__r_.__value_.__r.__words[0];
          }
          objc_msgSend( v20,  "markTemporaryPreciseAuthorizationGranted:forClientKey:",  v9,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v21));
          (*((void (**)(id, void))a6 + 2))(a6, 0LL);
          if (SBYTE7(v51[3]) < 0) {
            operator delete(*(void **)&v51[2]);
          }
          if (SHIBYTE(v51[1]) < 0) {
            operator delete(*((void **)&v51[0] + 1));
          }
          if (SBYTE7(v51[0]) < 0) {
            operator delete((void *)v50);
          }
          if (SHIBYTE(v49[3]) < 0) {
            operator delete(v49[1]);
          }
          if (SHIBYTE(v49[0]) < 0) {
            operator delete(v48[0]);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)&v30);
      }

      buf[0] = v30;
      v30.__r_.__value_.__s.__size_ = 0;
      v30.__r_.__value_.__s.__data_[0] = 0;
      buf[1] = v31;
      v31.__r_.__value_.__s.__size_ = 0;
      v31.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v49[0]) < 0) {
        operator delete(v48[0]);
      }
      *(_OWORD *)char v48 = v32;
      v49[0] = v33;
      HIBYTE(v33) = 0;
      LOBYTE(v32) = 0;
      if (SHIBYTE(v49[3]) < 0) {
        operator delete(v49[1]);
      }
      *(_OWORD *)&v49[1] = v34;
      v49[3] = v35;
      HIBYTE(v35) = 0;
      LOBYTE(v34) = 0;
      LOWORD(v49[4]) = v36;
      BYTE2(v49[4]) = v37;
      if (SBYTE7(v51[0]) < 0) {
        operator delete((void *)v50);
      }
      __int128 v50 = v38;
      *(void *)&v51[0] = v39;
      HIBYTE(v39) = 0;
      LOBYTE(v38) = 0;
      if (SHIBYTE(v51[1]) < 0) {
        operator delete(*((void **)&v51[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v51 + 8) = v40;
      *((void *)&v51[1] + 1) = v41;
      HIBYTE(v41) = 0;
      LOBYTE(v40) = 0;
      if (SBYTE7(v51[3]) < 0)
      {
        operator delete(*(void **)&v51[2]);
        char v19 = HIBYTE(v41);
      }

      v51[2] = v42;
      *(void *)&v51[3] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      WORD4(v51[3]) = v44;
      BYTE10(v51[3]) = v45;
      if (v19 < 0) {
        operator delete((void *)v40);
      }
      if (SHIBYTE(v39) < 0) {
        operator delete((void *)v38);
      }
      if (SHIBYTE(v35) < 0) {
        operator delete((void *)v34);
      }
      if (SHIBYTE(v33) < 0) {
        operator delete((void *)v32);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v22 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path if setting temporary precise authorization",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v30.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path if setting temporary precise authorization",  &v30,  2);
      unint64_t v27 = (std::string *)v26;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v26);
      if (v27 != buf) {
        free(v27);
      }
    }

    __int128 v23 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v23);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v30.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v30,  2);
      char v25 = (std::string *)v24;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v24);
      if (v25 != buf) {
        free(v25);
      }
    }

    __int16 v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v18);
  }

- (void)tearDownLocationAuthPromptForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonTearDownLocationAuthPrompt (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonTearDownLocationAuthPrompt, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if ([a3 length] || objc_msgSend(a4, "length"))
    {
      memset(v47, 0, 35);
      *(_OWORD *)char v46 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v48 = 0u;
      memset(v49, 0, 59);
      if ([a3 length])
      {
        sub_1010DDBC0(&__str, (char *)[a3 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)&v28);
      }

      else
      {
        if (![a4 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v26, 0, sizeof(v26));
          }
          CLConnection::getUserNameFromAuditToken(&v28, (CLConnection *)v26, v14);
          sub_100FE36F4(buf, &v28);
          id v18 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_100FE3FB4((uint64_t)buf, (uint64_t)&v28);
          if ((v28.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            char v19 = &v28;
          }
          else {
            char v19 = (std::string *)v28.__r_.__value_.__r.__words[0];
          }
          objc_msgSend( v18,  "tearDownLocationAuthPrompt:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
          (*((void (**)(id, void))a5 + 2))(a5, 0LL);
          if (SBYTE7(v49[3]) < 0) {
            operator delete(*(void **)&v49[2]);
          }
          if (SHIBYTE(v49[1]) < 0) {
            operator delete(*((void **)&v49[0] + 1));
          }
          if (SBYTE7(v49[0]) < 0) {
            operator delete((void *)v48);
          }
          if (SHIBYTE(v47[3]) < 0) {
            operator delete(v47[1]);
          }
          if (SHIBYTE(v47[0]) < 0) {
            operator delete(v46[0]);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)&v28);
      }

      buf[0] = v28;
      v28.__r_.__value_.__s.__size_ = 0;
      v28.__r_.__value_.__s.__data_[0] = 0;
      buf[1] = v29;
      v29.__r_.__value_.__s.__size_ = 0;
      v29.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v47[0]) < 0) {
        operator delete(v46[0]);
      }
      *(_OWORD *)char v46 = v30;
      v47[0] = v31;
      HIBYTE(v31) = 0;
      LOBYTE(v30) = 0;
      if (SHIBYTE(v47[3]) < 0) {
        operator delete(v47[1]);
      }
      *(_OWORD *)&v47[1] = v32;
      v47[3] = v33;
      HIBYTE(v33) = 0;
      LOBYTE(v32) = 0;
      LOWORD(v47[4]) = v34;
      BYTE2(v47[4]) = v35;
      if (SBYTE7(v49[0]) < 0) {
        operator delete((void *)v48);
      }
      __int128 v48 = v36;
      *(void *)&v49[0] = v37;
      HIBYTE(v37) = 0;
      LOBYTE(v36) = 0;
      if (SHIBYTE(v49[1]) < 0) {
        operator delete(*((void **)&v49[0] + 1));
      }
      char v17 = 0;
      *(_OWORD *)((char *)v49 + 8) = v38;
      *((void *)&v49[1] + 1) = v39;
      HIBYTE(v39) = 0;
      LOBYTE(v38) = 0;
      if (SBYTE7(v49[3]) < 0)
      {
        operator delete(*(void **)&v49[2]);
        char v17 = HIBYTE(v39);
      }

      _OWORD v49[2] = v40;
      *(void *)&v49[3] = v41;
      HIBYTE(v41) = 0;
      LOBYTE(v40) = 0;
      WORD4(v49[3]) = v42;
      BYTE10(v49[3]) = v43;
      if (v17 < 0) {
        operator delete((void *)v38);
      }
      if (SHIBYTE(v37) < 0) {
        operator delete((void *)v36);
      }
      if (SHIBYTE(v33) < 0) {
        operator delete((void *)v32);
      }
      if (SHIBYTE(v31) < 0) {
        operator delete((void *)v30);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v20 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path if tearing down location auth prompt",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v28.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path if tearing down location auth prompt",  &v28,  2);
      char v25 = (std::string *)v24;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]",  "%s\n",  v24);
      if (v25 != buf) {
        free(v25);
      }
    }

    std::string v21 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v21);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v28.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v28,  2);
      __int128 v23 = (std::string *)v22;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]",  "%s\n",  v22);
      if (v23 != buf) {
        free(v23);
      }
    }

    id v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v16);
  }

- (void)getGyroCalibrationDatabaseBiasFitAtTemperature:(float)a3 withReply:(id)a4
{
  BOOL v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1011EF7BC;
  v8[3] = &unk_1018A2CC0;
  v8[4] = a4;
  objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLGyroCalibrationDatabase",  @"CLInternalService"),  "getBiasFitWithReply:",  v8);
  os_activity_scope_leave(&state);
}

- (void)getActivitiesWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetActivities (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    __int128 v24 = "";
    __int16 v25 = 2082;
    id v26 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetActivities, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v7 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v7
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v9 = sub_100ED5364();
    if (v9)
    {
      uint64_t v10 = sub_100ED5EEC(v9);
      (*((void (**)(id, void, NSMutableArray *))a3 + 2))(a3, 0LL, v10);
    }

    else
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      uint64_t v13 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, #warning _CLDaemonGetActivityAlarms called without support for activity alarms",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        v19[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, #warning _CLDaemonGetActivityAlarms called without support for activity alarms",  v19,  2);
        id v18 = (uint8_t *)v17;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v17);
        if (v18 != buf) {
          free(v18);
        }
      }

      __int16 v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v14, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    int v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v19[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v19,  2);
      id v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    __int16 v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v12, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(id)a5 andSubIdentityIdentifier:(id)a6 forBundleID:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v39 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v15 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v15, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v16 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetAuthorizationStatusByType, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v17 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v17
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    && ([v17 BOOLValue] & 1) != 0)
  {
    if ([a7 length] || objc_msgSend(a8, "length"))
    {
      if (v13 > 4 || (_DWORD)v13 == 1)
      {
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        id v26 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2LL;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#Spi, Invalid authorization, auth:%{public, location:CLClientAuthorizationStatus}lld}",  (uint8_t *)buf,  0x1Cu);
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
        }

        unint64_t v27 = (os_log_s *)qword_101934978;
        if (os_signpost_enabled((os_log_t)qword_101934978))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2LL;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Spi, Invalid authorization",  "{msg%{public}.0s:#Spi, Invalid authorization, auth:%{public, location:CLClientAuthorizationStatus}lld}",  (uint8_t *)buf,  0x1Cu);
        }
      }

      else
      {
        if (v12 < 3)
        {
          memset(v76, 0, 35);
          *(_OWORD *)uint64_t v75 = 0u;
          memset(buf, 0, sizeof(buf));
          __int128 v77 = 0u;
          memset(v78, 0, 59);
          if ([a7 length])
          {
            sub_1010DDBC0(__str, (char *)[a7 UTF8String]);
            sub_100FE2D54((std::string *)__str, (uint64_t)&v57);
            buf[0] = v57;
            v57.__r_.__value_.__s.__size_ = 0;
            v57.__r_.__value_.__s.__data_[0] = 0;
            buf[1] = v58;
            v58.__r_.__value_.__s.__size_ = 0;
            v58.__r_.__value_.__s.__data_[0] = 0;
            if (SHIBYTE(v76[0]) < 0) {
              operator delete(v75[0]);
            }
            *(_OWORD *)uint64_t v75 = v59;
            v76[0] = v60;
            HIBYTE(v60) = 0;
            LOBYTE(v59) = 0;
            if (SHIBYTE(v76[3]) < 0) {
              operator delete(v76[1]);
            }
            *(_OWORD *)&v76[1] = v61;
            v76[3] = v62;
            HIBYTE(v62) = 0;
            LOBYTE(v61) = 0;
            LOWORD(v76[4]) = v63;
            BYTE2(v76[4]) = v64;
            if (SBYTE7(v78[0]) < 0) {
              operator delete((void *)v77);
            }
            __int128 v77 = v65;
            *(void *)&v78[0] = v66;
            HIBYTE(v66) = 0;
            LOBYTE(v65) = 0;
            if (SHIBYTE(v78[1]) < 0) {
              operator delete(*((void **)&v78[0] + 1));
            }
            char v20 = 0;
            *(_OWORD *)((char *)v78 + 8) = v67;
            *((void *)&v78[1] + 1) = v68;
            HIBYTE(v68) = 0;
            LOBYTE(v67) = 0;
            if (SBYTE7(v78[3]) < 0)
            {
              operator delete(*(void **)&v78[2]);
              char v20 = HIBYTE(v68);
            }

            v78[2] = v69;
            *(void *)&v78[3] = v70;
            HIBYTE(v70) = 0;
            LOBYTE(v69) = 0;
            WORD4(v78[3]) = v71;
            BYTE10(v78[3]) = v72;
            if (v20 < 0) {
              operator delete((void *)v67);
            }
            if (SHIBYTE(v66) < 0) {
              operator delete((void *)v65);
            }
            if (SHIBYTE(v62) < 0) {
              operator delete((void *)v61);
            }
            if (SHIBYTE(v60) < 0) {
              operator delete((void *)v59);
            }
          }

          else
          {
            if (![a8 length])
            {
LABEL_73:
              if (self) {
                -[CLInternalService currentToken](self, "currentToken");
              }
              else {
                memset(v56, 0, sizeof(v56));
              }
              CLConnection::getUserNameFromAuditToken(&v57, (CLConnection *)v56, v19);
              sub_100FE36F4(buf, &v57);
              id v30 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLClientManager");
              sub_1011F69B0((char *)__dst, (__int128 *)buf);
              id v31 = sub_1011DBFBC((__int128 *)__dst);
              if (self) {
                -[CLInternalService currentToken](self, "currentToken");
              }
              else {
                memset(__str, 0, sizeof(__str));
              }
              sub_100F4B1DC((uint64_t)__str, (uint64_t)&v57);
              double v32 = sub_1011E2990((uint64_t)&v57, &v41);
              if ((v41.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                id v33 = &v41;
              }
              else {
                id v33 = (std::string *)v41.__r_.__value_.__r.__words[0];
              }
              objc_msgSend( v30,  "setClientAuthorization:zoneIdentifier:subIdentityIdentifier:status:correctiveCompensation:mayIncreaseAuth:entity:",  v31,  a5,  a6,  v13,  v12,  1,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v33, v32));
              if (SHIBYTE(v70) < 0) {
                operator delete((void *)v69);
              }
              if (SHIBYTE(v68) < 0) {
                operator delete((void *)v67);
              }
              if (SHIBYTE(v66) < 0) {
                operator delete((void *)v65);
              }
              if (SHIBYTE(v62) < 0) {
                operator delete((void *)v61);
              }
              if (SHIBYTE(v60) < 0) {
                operator delete((void *)v59);
              }
              if (v55 < 0) {
                operator delete(v54);
              }
              if (v53 < 0) {
                operator delete(v52);
              }
              if (v51 < 0) {
                operator delete(v50);
              }
              if (v49 < 0) {
                operator delete(v48);
              }
              if (v47 < 0) {
                operator delete(v46);
              }
              if (v45 < 0) {
                operator delete(v44);
              }
              if (v43 < 0) {
                operator delete(__dst[0]);
              }
              (*((void (**)(id, void))a9 + 2))(a9, 0LL);
              if (SBYTE7(v78[3]) < 0) {
                operator delete(*(void **)&v78[2]);
              }
              if (SHIBYTE(v78[1]) < 0) {
                operator delete(*((void **)&v78[0] + 1));
              }
              if (SBYTE7(v78[0]) < 0) {
                operator delete((void *)v77);
              }
              if (SHIBYTE(v76[3]) < 0) {
                operator delete(v76[1]);
              }
              if (SHIBYTE(v76[0]) < 0) {
                operator delete(v75[0]);
              }
              goto LABEL_46;
            }

            sub_1010DDBC0(__str, (char *)[a8 UTF8String]);
            sub_100FE2DDC((std::string *)__str, (uint64_t)&v57);
            sub_1011DBE2C((uint64_t)buf, (__int128 *)&v57);
            sub_1011F6920((uint64_t)&v57);
          }

          if ((__str[23] & 0x80000000) != 0) {
            operator delete(*(void **)__str);
          }
          goto LABEL_73;
        }

        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        __int16 v23 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#Spi, Invalid corrective compensation state, compensate:%{public, location:CLCl ientCorrectiveCompensation}lld}",  (uint8_t *)buf,  0x1Cu);
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
        }

        __int128 v24 = (os_log_s *)qword_101934978;
        if (os_signpost_enabled((os_log_t)qword_101934978))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0LL;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Spi, Invalid corrective compensation state",  "{msg%{public}.0s:#Spi, Invalid corrective compensation state, compensate:%{public, location:CLCl ientCorrectiveCompensation}lld}",  (uint8_t *)buf,  0x1Cu);
        }
      }

      __int16 v25 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *))a9 + 2))(a9, v25);

      goto LABEL_46;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v28 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v57.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status",  &v57,  2);
      uint64_t v37 = (std::string *)v36;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIden tifier:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v36);
      if (v37 != buf) {
        free(v37);
      }
    }

    std::string v29 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a9 + 2))(a9, v29);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    std::string v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v57.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v57,  2);
      char v35 = (std::string *)v34;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIden tifier:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v34);
      if (v35 != buf) {
        free(v35);
      }
    }

    int v22 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a9 + 2))(a9, v22);
  }

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: updatePillButtonChoiceForOutstandingPrompt:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    __int128 v24 = "";
    __int16 v25 = 2082;
    id v26 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:updatePillButtonChoiceForOutstandingPrompt:replyBlock:, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v19);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  int v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    __int128 v24 = "";
    __int16 v25 = 2082;
    id v26 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock:, event:%{public, l ocation:escape_only}s}",  buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "updatePillButtonChoiceForOutstandingPrompt:",  v5);
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v18[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v18,  2);
      id v17 = (uint8_t *)v16;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService updatePillButtonChoiceForOutstandingPrompt:replyBlock:]",  "%s\n",  v16);
      if (v17 != buf) {
        free(v17);
      }
    }

    uint64_t v15 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v15);
  }

  os_activity_scope_leave(&v19);
  os_activity_scope_leave(&state);
}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4 replyBlock:(id)a5
{
  uint64_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "CL: updatePromptedLatitude:longitude:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v10 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    int v22 = "";
    __int16 v23 = 2082;
    __int128 v24 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:updatePromptedLatitude:longitude:replyBlock:, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v11 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v11
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && ([v11 BOOLValue] & 1) != 0)
  {
    objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager"),  "updatePromptedLatitude:longitude:",  a3,  a4);
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v13 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v17[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v17,  2);
      id v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService updatePromptedLatitude:longitude:replyBlock:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    __int16 v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v14);
  }

  os_activity_scope_leave(&state);
}

- (void)setIncidentalUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: setIncidentalUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v62, 0, 35);
      __int128 v61 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v63 = 0u;
      memset(v64, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)&v43);
      }

      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v41, 0, 32);
          }
          CLConnection::getUserNameFromAuditToken(&v43, (CLConnection *)v41, v16);
          sub_100FE36F4(buf, &v43);
          id v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_1011F69B0((char *)__dst, (__int128 *)buf);
          [v20 setIncidentalUseMode:v9 forClient:sub_1011DBFBC((__int128 *)__dst)];
          if (v40 < 0) {
            operator delete(v39);
          }
          if (v38 < 0) {
            operator delete(v37);
          }
          if (v36 < 0) {
            operator delete(v35);
          }
          if (v34 < 0) {
            operator delete(v33);
          }
          if (v32 < 0) {
            operator delete(v31);
          }
          if (v30 < 0) {
            operator delete(v29);
          }
          if (v28 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0LL);
          if (SBYTE7(v64[3]) < 0) {
            operator delete(*(void **)&v64[2]);
          }
          if (SHIBYTE(v64[1]) < 0) {
            operator delete(*((void **)&v64[0] + 1));
          }
          if (SBYTE7(v64[0]) < 0) {
            operator delete((void *)v63);
          }
          if (SHIBYTE(v62[3]) < 0) {
            operator delete((void *)v62[1]);
          }
          if (SHIBYTE(v62[0]) < 0) {
            operator delete((void *)v61);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)&v43);
      }

      buf[0] = v43;
      v43.__r_.__value_.__s.__size_ = 0;
      v43.__r_.__value_.__s.__data_[0] = 0;
      buf[1] = v44;
      v44.__r_.__value_.__s.__size_ = 0;
      v44.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v62[0]) < 0) {
        operator delete((void *)v61);
      }
      __int128 v61 = v45;
      v62[0] = v46;
      HIBYTE(v46) = 0;
      LOBYTE(v45) = 0;
      if (SHIBYTE(v62[3]) < 0) {
        operator delete((void *)v62[1]);
      }
      *(_OWORD *)&v62[1] = v47;
      v62[3] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      LOWORD(v62[4]) = v49;
      BYTE2(v62[4]) = v50;
      if (SBYTE7(v64[0]) < 0) {
        operator delete((void *)v63);
      }
      __int128 v63 = v51;
      *(void *)&v64[0] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      if (SHIBYTE(v64[1]) < 0) {
        operator delete(*((void **)&v64[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v64 + 8) = v53;
      *((void *)&v64[1] + 1) = v54;
      HIBYTE(v54) = 0;
      LOBYTE(v53) = 0;
      if (SBYTE7(v64[3]) < 0)
      {
        operator delete(*(void **)&v64[2]);
        char v19 = HIBYTE(v54);
      }

      v64[2] = v55;
      *(void *)&v64[3] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      WORD4(v64[3]) = v57;
      BYTE10(v64[3]) = v58;
      if (v19 < 0) {
        operator delete((void *)v53);
      }
      if (SHIBYTE(v52) < 0) {
        operator delete((void *)v51);
      }
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v46) < 0) {
        operator delete((void *)v45);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path for which to set incidental use mode",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v43.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path for which to set incidental use mode",  &v43,  2);
      id v26 = (std::string *)v25;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    int v22 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v22);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v43.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v43,  2);
      __int128 v24 = (std::string *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    uint64_t v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v18);
  }

- (void)setLocationButtonUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:, event:%{public, locati on:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v62, 0, 35);
      __int128 v61 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v63 = 0u;
      memset(v64, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(&__str, (char *)[a4 UTF8String]);
        sub_100FE2D54(&__str, (uint64_t)&v43);
      }

      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v41, 0, 32);
          }
          CLConnection::getUserNameFromAuditToken(&v43, (CLConnection *)v41, v16);
          sub_100FE36F4(buf, &v43);
          id v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_1011F69B0((char *)__dst, (__int128 *)buf);
          [v20 setLocationButtonUseMode:v9 forClient:sub_1011DBFBC((__int128 *)__dst)];
          if (v40 < 0) {
            operator delete(v39);
          }
          if (v38 < 0) {
            operator delete(v37);
          }
          if (v36 < 0) {
            operator delete(v35);
          }
          if (v34 < 0) {
            operator delete(v33);
          }
          if (v32 < 0) {
            operator delete(v31);
          }
          if (v30 < 0) {
            operator delete(v29);
          }
          if (v28 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0LL);
          if (SBYTE7(v64[3]) < 0) {
            operator delete(*(void **)&v64[2]);
          }
          if (SHIBYTE(v64[1]) < 0) {
            operator delete(*((void **)&v64[0] + 1));
          }
          if (SBYTE7(v64[0]) < 0) {
            operator delete((void *)v63);
          }
          if (SHIBYTE(v62[3]) < 0) {
            operator delete((void *)v62[1]);
          }
          if (SHIBYTE(v62[0]) < 0) {
            operator delete((void *)v61);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(&__str, (char *)[a5 UTF8String]);
        sub_100FE2DDC(&__str, (uint64_t)&v43);
      }

      buf[0] = v43;
      v43.__r_.__value_.__s.__size_ = 0;
      v43.__r_.__value_.__s.__data_[0] = 0;
      buf[1] = v44;
      v44.__r_.__value_.__s.__size_ = 0;
      v44.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v62[0]) < 0) {
        operator delete((void *)v61);
      }
      __int128 v61 = v45;
      v62[0] = v46;
      HIBYTE(v46) = 0;
      LOBYTE(v45) = 0;
      if (SHIBYTE(v62[3]) < 0) {
        operator delete((void *)v62[1]);
      }
      *(_OWORD *)&v62[1] = v47;
      v62[3] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      LOWORD(v62[4]) = v49;
      BYTE2(v62[4]) = v50;
      if (SBYTE7(v64[0]) < 0) {
        operator delete((void *)v63);
      }
      __int128 v63 = v51;
      *(void *)&v64[0] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      if (SHIBYTE(v64[1]) < 0) {
        operator delete(*((void **)&v64[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v64 + 8) = v53;
      *((void *)&v64[1] + 1) = v54;
      HIBYTE(v54) = 0;
      LOBYTE(v53) = 0;
      if (SBYTE7(v64[3]) < 0)
      {
        operator delete(*(void **)&v64[2]);
        char v19 = HIBYTE(v54);
      }

      v64[2] = v55;
      *(void *)&v64[3] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      WORD4(v64[3]) = v57;
      BYTE10(v64[3]) = v58;
      if (v19 < 0) {
        operator delete((void *)v53);
      }
      if (SHIBYTE(v52) < 0) {
        operator delete((void *)v51);
      }
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v46) < 0) {
        operator delete((void *)v45);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "#Spi, Must provide a bundle identifier or bundle path for which to set location-button use mode",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v43.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Must provide a bundle identifier or bundle path for which to set location-button use mode",  &v43,  2);
      id v26 = (std::string *)v25;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    int v22 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v22);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v43.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v43,  2);
      __int128 v24 = (std::string *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }

    uint64_t v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v18);
  }

- (void)gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  BOOL v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2082;
    int v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.rebuild_gytt");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGyroCalibrationDatabase"),  "syncgetSupportsMiniCalibration"))
    {
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0LL, 1LL);
    }

    else
    {
      uint64_t v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v12, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      id v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    id v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v11, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  BOOL v9 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonSetBackgroundIndicatorEnabled (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282LL;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonSetBackgroundIndicatorEnabled, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v14 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.authorizeapplications");
  if (v14
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v66, 0, 35);
      *(_OWORD *)__int128 v65 = 0u;
      memset(buf, 0, sizeof(buf));
      __int128 v67 = 0u;
      memset(v68, 0, 59);
      if ([a4 length])
      {
        sub_1010DDBC0(__str, (char *)[a4 cStringUsingEncoding:4]);
        sub_100FE2D54((std::string *)__str, (uint64_t)&v47);
      }

      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(v46, 0, sizeof(v46));
          }
          CLConnection::getUserNameFromAuditToken(&v47, (CLConnection *)v46, v16);
          sub_100FE36F4(buf, &v47);
          id v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager");
          sub_1011F69B0((char *)__dst, (__int128 *)buf);
          id v21 = sub_1011DBFBC((__int128 *)__dst);
          if (self) {
            -[CLInternalService currentToken](self, "currentToken");
          }
          else {
            memset(__str, 0, sizeof(__str));
          }
          sub_100F4B1DC((uint64_t)__str, (uint64_t)&v47);
          double v22 = sub_1011E2990((uint64_t)&v47, &v31);
          if ((v31.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            __int16 v23 = &v31;
          }
          else {
            __int16 v23 = (std::string *)v31.__r_.__value_.__r.__words[0];
          }
          objc_msgSend( v20,  "setClientBackgroundIndicator:enabled:entity:",  v21,  v9,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23, v22));
          if (SHIBYTE(v60) < 0) {
            operator delete((void *)v59);
          }
          if (SHIBYTE(v58) < 0) {
            operator delete((void *)v57);
          }
          if (SHIBYTE(v56) < 0) {
            operator delete((void *)v55);
          }
          if (SHIBYTE(v52) < 0) {
            operator delete((void *)v51);
          }
          if (SHIBYTE(v50) < 0) {
            operator delete((void *)v49);
          }
          if (v45 < 0) {
            operator delete(v44);
          }
          if (v43 < 0) {
            operator delete(v42);
          }
          if (v41 < 0) {
            operator delete(v40);
          }
          if (v39 < 0) {
            operator delete(v38);
          }
          if (v37 < 0) {
            operator delete(v36);
          }
          if (v35 < 0) {
            operator delete(v34);
          }
          if (v33 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0LL);
          if (SBYTE7(v68[3]) < 0) {
            operator delete(*(void **)&v68[2]);
          }
          if (SHIBYTE(v68[1]) < 0) {
            operator delete(*((void **)&v68[0] + 1));
          }
          if (SBYTE7(v68[0]) < 0) {
            operator delete((void *)v67);
          }
          if (SHIBYTE(v66[3]) < 0) {
            operator delete(v66[1]);
          }
          if (SHIBYTE(v66[0]) < 0) {
            operator delete(v65[0]);
          }
          goto LABEL_18;
        }

        sub_1010DDBC0(__str, (char *)[a5 cStringUsingEncoding:4]);
        sub_100FE2DDC((std::string *)__str, (uint64_t)&v47);
      }

      buf[0] = v47;
      v47.__r_.__value_.__s.__size_ = 0;
      v47.__r_.__value_.__s.__data_[0] = 0;
      buf[1] = v48;
      v48.__r_.__value_.__s.__size_ = 0;
      v48.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v66[0]) < 0) {
        operator delete(v65[0]);
      }
      *(_OWORD *)__int128 v65 = v49;
      v66[0] = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      if (SHIBYTE(v66[3]) < 0) {
        operator delete(v66[1]);
      }
      *(_OWORD *)&v66[1] = v51;
      v66[3] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      LOWORD(v66[4]) = v53;
      BYTE2(v66[4]) = v54;
      if (SBYTE7(v68[0]) < 0) {
        operator delete((void *)v67);
      }
      __int128 v67 = v55;
      *(void *)&v68[0] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      if (SHIBYTE(v68[1]) < 0) {
        operator delete(*((void **)&v68[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v68 + 8) = v57;
      *((void *)&v68[1] + 1) = v58;
      HIBYTE(v58) = 0;
      LOBYTE(v57) = 0;
      if (SBYTE7(v68[3]) < 0)
      {
        operator delete(*(void **)&v68[2]);
        char v19 = HIBYTE(v58);
      }

      _OWORD v68[2] = v59;
      *(void *)&v68[3] = v60;
      HIBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      WORD4(v68[3]) = v61;
      BYTE10(v68[3]) = v62;
      if (v19 < 0) {
        operator delete((void *)v57);
      }
      if (SHIBYTE(v56) < 0) {
        operator delete((void *)v55);
      }
      if (SHIBYTE(v52) < 0) {
        operator delete((void *)v51);
      }
      if (SHIBYTE(v50) < 0) {
        operator delete((void *)v49);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      goto LABEL_49;
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int128 v24 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "#Spi, both bundle-id and bundle-identifier are either zero-length or nil",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v47.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "#Spi, both bundle-id and bundle-identifier are either zero-length or nil",  &v47,  2);
      std::string v29 = (std::string *)v28;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v28);
      if (v29 != buf) {
        free(v29);
      }
    }

    __int16 v25 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v25);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v47.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  &v47,  2);
      unint64_t v27 = (std::string *)v26;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]",  "%s\n",  v26);
      if (v27 != buf) {
        free(v27);
      }
    }

    int v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a6 + 2))(a6, v18);
  }

- (void)getOscarTimeSyncWithReplyBlock:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonOscarTimeSync (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    int v18 = "";
    __int16 v19 = 2082;
    id v20 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonOscarTimeSync, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  uint64_t v7 = sub_1008FA854(0);
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1011F3560;
    v12[3] = &unk_1018A2CE8;
    v12[4] = a3;
    v12[5] = _Block_copy(a3);
    (*(void (**)(uint64_t, void *))(*(void *)v7 + 144LL))(v7, v12);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v8 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "TimeSyncWithReplyBlock, can't find motionCoprocessor",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "TimeSyncWithReplyBlock, can't find motionCoprocessor",  v13,  2);
      id v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getOscarTimeSyncWithReplyBlock:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    BOOL v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *, void, void))a3 + 2))(a3, v9, 0LL, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getControlPlaneStatusReportClear:(int)a3 replyBlock:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetControlPlaneStatusReport (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &v24);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  BOOL v9 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetControlPlaneStatusReport, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  if (objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "isServiceRunning:",  @"CLGnssProvider"))
  {
    id v10 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLGnssProvider");
    if (a3)
    {
      [v10 resetControlPlaneStatus];
    }

    else
    {
      __asm { FMOV            V0.2D, #-1.0 }

      *(_OWORD *)buf = _Q0;
      *(_OWORD *)&buf[16] = 0uLL;
      unint64_t v26 = 0LL;
      unint64_t v27 = 0xBFF0000000000000LL;
      uint64_t v28 = -1LL;
      unsigned int v29 = 0;
      if ([v10 syncgetControlPlaneStatusReport:buf])
      {
        v11.n128_u64[0] = *(void *)buf;
        v12.n128_u64[0] = *(void *)&buf[8];
        v14.n128_u64[0] = *(void *)&buf[24];
        v13.n128_u64[0] = *(void *)&buf[16];
        v15.n128_u64[0] = v26;
        v16.n128_u64[0] = v27;
        uint64_t v23 = v29;
LABEL_12:
        (*((void (**)(id, void, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))a4 + 2))( a4,  0LL,  v23,  v11,  v12,  v13,  v14,  v15,  v16);
        goto LABEL_13;
      }
    }

    uint64_t v23 = 0LL;
    v13.n128_u64[0] = 0LL;
    v11.n128_u64[0] = -1.0;
    v12.n128_u64[0] = -1.0;
    v14.n128_u64[0] = 0LL;
    v15.n128_u64[0] = 0LL;
    v16.n128_u64[0] = -1.0;
    goto LABEL_12;
  }

  __int16 v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  1LL,  0LL);
  (*((void (**)(id, NSError *, void, double, double, double, double, double, double))a4 + 2))( a4,  v17,  0LL,  -1.0,  -1.0,  0.0,  0.0,  0.0,  -1.0);

LABEL_13:
  os_activity_scope_leave(&v24);
}

- (void)startStopAdvertisingBeacon:(id)a3 atPower:(int)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonStartStopAdvertisingBeacon (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  __n128 v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v23 = 0;
    __int16 v24 = 2082;
    __int16 v25 = "";
    __int16 v26 = 2082;
    unint64_t v27 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonStartStopAdvertisingBeacon, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v12 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.advertise-beacon");
  if (v12
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __n128 v14 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      __int16 v26 = 2113;
      unint64_t v27 = (const char *)a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi, startStopAdvertisingBeacon, , Region:%{private, location:escape_only}@}",  buf,  0x1Cu);
    }

    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLBTLEBeaconProvider"),  "syncgetadvertiseSelfAsBeaconForRegion:power:",  a3,  v6))
    {
      (*((void (**)(id, void))a5 + 2))(a5, 0LL);
    }

    else
    {
      __int16 v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *))a5 + 2))(a5, v17);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __n128 v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v20[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v20,  2);
      __int16 v19 = (uint8_t *)v18;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService startStopAdvertisingBeacon:atPower:replyBlock:]",  "%s\n",  v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    __n128 v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a5 + 2))(a5, v16);
  }

  os_activity_scope_leave(&state);
}

- (void)getGyroCalibrationDatabaseBiasFitAtTemplerature:(float)a3 replyBlock:(id)a4
{
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v7 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &v10);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v8 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    __n128 v14 = "";
    __int16 v15 = 2082;
    __n128 v16 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGyroCalibrationDatabase"),  "syncgetBiasFit:",  buf))
  {
    BOOL v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", buf, 320LL);
    (*((void (**)(id, void, NSData *))a4 + 2))(a4, 0LL, v9);
  }

  else
  {
    BOOL v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSData *, void))a4 + 2))(a4, v9, 0LL);
  }

  os_activity_scope_leave(&v10);
}

- (void)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6 replyBlock:(id)a7
{
  $E2C29196C7A5C696474C6955C5A9CE06 v19 = a3;
  $E2C29196C7A5C696474C6955C5A9CE06 v18 = a5;
  __n128 v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  int v12 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  __int16 v13 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v21 = 0;
    __int16 v22 = 2082;
    int v23 = "";
    __int16 v24 = 2082;
    __int16 v25 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v14 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGyroCalibrationDatabase");
  *(float *)&double v15 = a4;
  if ([v14 syncgetInsertWithBias:&v19 variance:&v18 temperature:v15 timestamp:a6])
  {
    (*((void (**)(id, void))a7 + 2))(a7, 0LL);
  }

  else
  {
    __n128 v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
    (*((void (**)(id, NSError *))a7 + 2))(a7, v16);
  }

  os_activity_scope_leave(&state);
}

- (void)gyroCalibrationDatabaseWipeWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseWipe (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseWipe, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.rebuild_gytt");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGyroCalibrationDatabase"),  "syncgetWipeDatabase"))
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0LL);
    }

    else
    {
      int v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *))a3 + 2))(a3, v12);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    os_activity_scope_state_s v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v15,  2);
      id v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService gyroCalibrationDatabaseWipeWithReplyBlock:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    __n128 v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a3 + 2))(a3, v11);
  }

  os_activity_scope_leave(&state);
}

- (void)gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGyroCalibrationDatabaseGetNumTemperatures (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2082;
    int v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGyroCalibrationDatabaseGetNumTemperatures, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.rebuild_gytt");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v10 = objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLGyroCalibrationDatabase");
    if (v10)
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, [v10 syncgetNumTemperatures]);
    }

    else
    {
      __int16 v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, uint64_t))a3 + 2))(a3, v13, 0xFFFFFFFFLL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __n128 v11 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v16[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      double v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    int v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, uint64_t))a3 + 2))(a3, v12, 0xFFFFFFFFLL);
  }

  os_activity_scope_leave(&state);
}

- (void)configure:(id)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3.var7;
  unint64_t v6 = *(void *)&a3.var0;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonConfigure (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v10 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    buf[0] = 68289282;
    buf[1] = 0;
    LOWORD(buf[2]) = 2082;
    *(void *)((char *)&buf[2] + 2) = "";
    HIWORD(buf[4]) = 2082;
    *(void *)&buf[5] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonConfigure, event:%{public, location:escape_only}s}",  (uint8_t *)buf,  0x1Cu);
  }

  id v11 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.configure");
  if (v11
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && ([v11 BOOLValue] & 1) != 0)
  {
    if (sub_1008FA854(0))
    {
      memset((char *)&buf[1] + 3, 0, 32);
      memset((char *)&buf[9] + 3, 0, 27);
      LOBYTE(buf[0]) = 6;
      BYTE1(buf[0]) = v6 & 1;
      uint64x2_t v13 = (uint64x2_t)vdupq_n_s64(v6);
      int16x8_t v14 = (int16x8_t)vuzp1q_s32( (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1013E4880),  (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1013E4870));
      *(int8x8_t *)v14.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v14), (int8x8_t)0x1000100010001LL);
      *(_DWORD *)((char *)buf + 2) = vmovn_s16(v14).u32[0];
      BYTE2(buf[1]) = BYTE5(v6) & 1;
      BYTE1(buf[2]) = BYTE6(v6);
      BYTE2(buf[2]) = BYTE4(v5);
      *(_WORD *)((char *)&buf[2] + 3) = HIWORD(v5);
      *(_DWORD *)((char *)&buf[4] + 1) = v5;
      double v15 = _Block_copy(a4);
      uint64_t v16 = sub_1008FA854(0);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      _OWORD v25[2] = sub_1011F50C4;
      v25[3] = &unk_10184B0E0;
      v25[4] = v15;
      (*(void (**)(uint64_t, _DWORD *, id, void *))(*(void *)v16 + 128))( v16,  buf,  objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"),  v25);
    }

    else
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      int v19 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "#Spi, Oscar not available",  (uint8_t *)buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        v26[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  17LL,  "#Spi, Oscar not available",  v26,  2);
        __int16 v24 = (char *)v23;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService configure:replyBlock:]", "%s\n", v23);
      }

      __int16 v20 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *))a4 + 2))(a4, v20);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    __int16 v17 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v26[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v26,  2);
      __int16 v22 = (char *)v21;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService configure:replyBlock:]", "%s\n", v21);
    }

    int v18 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *))a4 + 2))(a4, v18);
  }

  os_activity_scope_leave(&state);
}

- (void)getMotionSensorLogsWithReply:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemongetMotionSensorLogs (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  unint64_t v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2082;
    int v18 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemongetMotionSensorLogs, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  if (qword_1019A1D00 != -1) {
    dispatch_once(&qword_1019A1D00, &stru_1018A2D68);
  }
  if (qword_1019A1D08)
  {
    uint64_t v7 = (NSArray *)sub_100B50054(qword_1019A1D08);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v8 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unable to access Motion Logger.  Maybe it is not enabled?",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v11[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "Unable to access Motion Logger.  Maybe it is not enabled?",  v11,  2);
      id v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getMotionSensorLogsWithReply:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    uint64_t v7 = +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }

  (*((void (**)(id, NSArray *, void))a3 + 2))(a3, v7, 0LL);
  os_activity_scope_leave(&state);
}

- (void)getAccessoryMotionSensorLogsWithReply:(id)a3
{
  int v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemongetAccessoryMotionSensorLogs (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  unint64_t v6 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    int v19 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemongetAccessoryMotionSensorLogs, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  uint64_t v7 = sub_1008C5980();
  if (v7)
  {
    id v8 = (NSArray *)sub_1008CC6C4(v7);
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    uint64_t v9 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to access CLMotionLogger", buf, 2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      v12[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  16LL,  "Unable to access CLMotionLogger",  v12,  2);
      id v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLInternalService getAccessoryMotionSensorLogsWithReply:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    id v8 = +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }

  (*((void (**)(id, NSArray *, void))a3 + 2))(a3, v8, 0LL);
  os_activity_scope_leave(&state);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentToken
{
  result = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection");
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLPassKitNotifyPayment (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v12);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    __int16 v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLPassKitNotifyPayment, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  objc_msgSend( objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLHarvesterService"),  "notifyPassKitPayment:transaction:info:",  a3,  a4,  a5);
  os_activity_scope_leave(&v12);
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
}

- (void)getMicroLocationInternalVersionWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unint64_t v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetMicroLocationInternalVersion (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2082;
    int v23 = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetMicroLocationInternalVersion, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v16[0] = 0LL;
    if (objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLMicroLocationNotifier"),  "syncgetMicroLocationInternalVersion:",  v16)
      && [v16[0] length])
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0LL, v16[0]);
    }

    else
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      os_activity_scope_state_s v12 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi,MicroLocationInternalVersion,#warning Couldn't get MicroLocation Internal Version}",  buf,  0x12u);
      }

      uint64x2_t v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v13, 0LL);
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    id v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018A2D28);
      }
      LOWORD(v16[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v16,  2);
      __int16 v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLInternalService getMicroLocationInternalVersionWithReplyBlock:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    id v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, v11, 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)getZaxisStatsWithReplyBlock:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unint64_t v6 = _os_activity_create( (void *)&_mh_execute_header,  "CL: _CLDaemonGetZaxisStats (Fallback)",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  uint64_t v7 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)std::string v31 = 2082;
    *(void *)&v31[2] = "";
    *(_WORD *)&v31[10] = 2082;
    *(void *)&v31[12] = "activity";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:_CLDaemonGetZaxisStats, event:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  id v8 = -[NSXPCConnection valueForEntitlement:]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "valueForEntitlement:",  @"com.apple.locationd.status");
  if (v8)
  {
    objc_opt_class(&OBJC_CLASS___NSNumber);
    if (objc_opt_isKindOfClass(v8, v9) & 1) != 0 && ([v8 BOOLValue])
    {
      *(void *)buf = 0LL;
      *(void *)std::string v31 = 0LL;
      *(void *)&std::string v31[8] = 0LL;
      sub_1001AC380((void **)buf, 0x18uLL);
      if (*(void *)&v31[8] - *(void *)buf > 0xBFuLL)
      {
        if (!objc_msgSend( objc_msgSend( -[CLInternalService vendor](self, "vendor"),  "proxyForService:",  @"CLLocationController"),  "syncgetZaxisStats:",  buf)
          || *(void *)v31 == *(void *)buf)
        {
          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          __int16 v17 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v26 = 68289026;
            int v27 = 0;
            __int16 v28 = 2082;
            unsigned int v29 = "";
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi,ZaxisStats,#warning Couldn't get Zaxis Stats}",  v26,  0x12u);
          }
        }

        else
        {
          uint64x2_t v13 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
          int v14 = -[NSMutableDictionary initWithCapacity:]( v13,  "initWithCapacity:",  (uint64_t)(*(void *)v31 - *(void *)buf) >> 3);
          if (v14)
          {
            uint64_t v15 = *(void *)buf;
            if (**(double **)buf == 1.0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL)),  @"CurrentMCT");
              unsigned int v16 = 2;
              uint64_t v15 = *(void *)buf;
            }

            else
            {
              unsigned int v16 = 1;
            }

            unsigned int v20 = v16 + 1;
            if (*(double *)(v15 + 8LL * v16) == 1.0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(v15 + 8LL * v20)),  @"GNSSAvailabilityPredictionTime");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v16 + 2))),  @"GNSSAvailabilityPredictionState");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v16 + 3))),  @"GNSSAvailabilityPredictionProbability");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v16 | 4))),  @"ALSDecisionTreeOutputTime");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v16 + 5))),  @"ALSDecisionTreeOutput");
              unsigned int v20 = v16 + 6;
              uint64_t v15 = *(void *)buf;
            }

            unsigned int v21 = v20 + 1;
            if (*(double *)(v15 + 8LL * v20) == 1.0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(v15 + 8LL * v21)),  @"LastAltitudeUpdateFromBaro");
              unsigned int v21 = v20 + 2;
              uint64_t v15 = *(void *)buf;
            }

            unsigned int v22 = v21 + 1;
            if (*(double *)(v15 + 8LL * v21) == 1.0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(v15 + 8LL * v22)),  @"CurrentBaroAltitude");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 2))),  @"CurrentBaroAltitudeUnc");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 3))),  @"Undulation");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 4))),  @"CalibratedAltitudeFromRefPressureAndDEM");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 5))),  @"CalibratedAltitudeFromDEMOnly");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 6))),  @"CalibratedAltitudeUpdateTime");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 7))),  @"CLBaroBiasCfAbsTime_s");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 8))),  @"CLBaroBias_pa");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v21 + 9))),  @"CLBaroBiasUnc_m");
              unsigned int v22 = v21 + 10;
              uint64_t v15 = *(void *)buf;
            }

            if (*(double *)(v15 + 8LL * v22) == 1.0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(v15 + 8LL * (v22 + 1))),  @"CurrentWiFiAltitudeTimestamp");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v22 + 2))),  @"CurrentWiFiAltitude");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)buf + 8LL * (v22 + 3))),  @"CurrentWiFiAltitudeUnc");
            }

            (*((void (**)(id, void, NSMutableDictionary *))a3 + 2))(a3, 0LL, v14);

            goto LABEL_46;
          }

          if (qword_101934970 != -1) {
            dispatch_once(&qword_101934970, &stru_1018A2D28);
          }
          __int16 v18 = (os_log_s *)qword_101934978;
          if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v26 = 68289026;
            int v27 = 0;
            __int16 v28 = 2082;
            unsigned int v29 = "";
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi,ZaxisStats,#warning dictionary allocation failed}",  v26,  0x12u);
          }
        }
      }

      else
      {
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018A2D28);
        }
        id v10 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v26 = 68289026;
          int v27 = 0;
          __int16 v28 = 2082;
          unsigned int v29 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Spi,,ZaxisStats,#warning Couldn't get vector capacity to fetch data}",  v26,  0x12u);
        }
      }

      int v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  0LL,  0LL);
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, v19, 0LL);

LABEL_46:
      if (*(void *)buf)
      {
        *(void *)std::string v31 = *(void *)buf;
        operator delete(*(void **)buf);
      }

      goto LABEL_20;
    }
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018A2D28);
  }
  id v11 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#Spi, connecting process isn't entitled, they shall not pass",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018A2D28);
    }
    *(_WORD *)__int16 v26 = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934978,  0LL,  "#Spi, connecting process isn't entitled, they shall not pass",  v26,  2);
    __int16 v24 = (uint8_t *)v23;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLInternalService getZaxisStatsWithReplyBlock:]", "%s\n", v23);
    if (v24 != buf) {
      free(v24);
    }
  }

  os_activity_scope_state_s v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.internalservice.errorDomain",  2LL,  0LL);
  (*((void (**)(id, NSError *, void))a3 + 2))(a3, v12, 0LL);

LABEL_20:
  os_activity_scope_leave(&state);
}

- (double)groundAltitudeDistanceThreshold
{
  return self->_groundAltitudeDistanceThreshold;
}

- (void)setGroundAltitudeDistanceThreshold:(double)a3
{
  self->_groundAltitudeDistanceThreshold = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

@end