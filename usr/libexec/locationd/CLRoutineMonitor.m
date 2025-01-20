@interface CLRoutineMonitor
+ (BOOL)isSupported;
+ (id)bundlePath;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)armed;
- (BOOL)authorized;
- (BOOL)diminishedMode;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)updating;
- (BOOL)updatingPredictedApplications;
- (CLLocation)lastLocation;
- (CLRoutineMonitor)init;
- (NSMutableArray)cachedPlaceInferences;
- (NSMutableArray)inertialSamples;
- (NSMutableArray)locations;
- (NSMutableDictionary)scenarioTriggerClients;
- (NSMutableSet)leechClients;
- (NSMutableSet)lowConfidenceVisitLeechClients;
- (NSMutableSet)visitClients;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (RTRoutineManager)routineManager;
- (id).cxx_construct;
- (void)addInertialData:(id)a3;
- (void)addLocation:(id)a3;
- (void)beginService;
- (void)checkAuthorization;
- (void)checkDiminishedMode;
- (void)dealloc;
- (void)endService;
- (void)enumerateStoredLocationsWithOptions:(id)a3 withReply:(id)a4;
- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchCachedPlaceInferencesWithReply:(id)a3;
- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)fetchEstimatedLocationAtDate:(id)a3 withReply:(id)a4;
- (void)fetchFormattedPostalAddressesFromMeCardWithReply:(id)a3;
- (void)fetchLocationOfInterestAtLocation:(id)a3 withReply:(id)a4;
- (void)fetchLocationOfInterestForRegion:(id)a3 withReply:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withReply:(id)a4;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withReply:(id)a5;
- (void)fetchLookbackWindowStartDateWithReply:(id)a3;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withReply:(id)a6;
- (void)fetchPlaceInferencesWithOptions:(id)a3 withReply:(id)a4;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withReply:(id)a4;
- (void)fetchRecentLocationsOfInterestWithReply:(id)a3;
- (void)fetchRemoteStatusWithReply:(id)a3;
- (void)fetchRoutineModeFromLocation:(id)a3 withReply:(id)a4;
- (void)fetchStoredVisitsWithOptions:(id)a3 withReply:(id)a4;
- (void)flush;
- (void)getFamiliarityIndexForVisit:(id)a3 withReply:(id)a4;
- (void)getStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 withReply:(id)a7;
- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
- (void)onVdrNotification:(int)a3 data:(NotificationData *)a4;
- (void)onWakeRoutinedTimer;
- (void)sendInertialData;
- (void)sendLocations;
- (void)sendLocationsWithReply:(id)a3;
- (void)setArmed:(BOOL)a3;
- (void)setAuthorized:(BOOL)a3;
- (void)setCachedPlaceInferences:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDiminishedMode:(BOOL)a3;
- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withReply:(id)a5;
- (void)setInertialSamples:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLeechClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocations:(id)a3;
- (void)setLowConfidenceVisitLeechClients:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setScenarioTriggerClients:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)setUpdatingPredictedApplications:(BOOL)a3;
- (void)setVisitClients:(id)a3;
- (void)startLeechingLowConfidenceVisitsForClient:(id)a3;
- (void)startLeechingVisitsForClient:(id)a3;
- (void)startMonitoringPlaceInferencesForCache;
- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4;
- (void)startMonitoringVisitsForClient:(id)a3;
- (void)startUpdatingLocation;
- (void)startWakeRoutinedTimer;
- (void)stopLeechingLowConfidenceVisitsForClient:(id)a3;
- (void)stopLeechingVisitsForClient:(id)a3;
- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4;
- (void)stopMonitoringVisitsForClient:(id)a3;
- (void)stopUpdatingLocation;
- (void)stopWakeRoutinedTimer;
- (void)zipperedStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 custeredWithVisits:(id)a7 withReply:(id)a8;
@end

@implementation CLRoutineMonitor

+ (BOOL)isSupported
{
  if (qword_101999AC0 != -1) {
    dispatch_once(&qword_101999AC0, &stru_101865258);
  }
  return byte_101999AB8;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999AD0 != -1) {
    dispatch_once(&qword_101999AD0, &stru_101865278);
  }
  return (id)qword_101999AC8;
}

+ (id)bundlePath
{
  if (qword_101999AE0 != -1) {
    dispatch_once(&qword_101999AE0, &stru_101865298);
  }
  return (id)qword_101999AD8;
}

- (CLRoutineMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRoutineMonitor;
  return -[CLRoutineMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLRoutineMonitorServiceProtocol,  &OBJC_PROTOCOL___CLRoutineMonitorClientProtocol);
}

- (void)beginService
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0,  0,  (dispatch_queue_t)objc_msgSend( objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo"),  "queue"));
  self->_wakeRoutinedTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3052000000LL;
  v36[3] = sub_1009B53CC;
  v36[4] = sub_1009B53DC;
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  v36[5] = self;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1009B53E8;
  handler[3] = &unk_10182EFC8;
  handler[4] = v36;
  dispatch_source_set_event_handler((dispatch_source_t)wakeRoutinedTimer, handler);
  dispatch_resume((dispatch_object_t)self->_wakeRoutinedTimer);
  unint64_t v5 = operator new(0xC0uLL);
  sub_100AEB404(v5, "Routine", -[CLRoutineMonitor universe](self, "universe"));
  self->_serviceLocationProvider = v5;
  sub_100AEB408((uint64_t)v5, (uint64_t)sub_1009B53F8, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v6 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = v6;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v8 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    }
  }

  [*((id *)self->_serviceLocationClient.__ptr_.__value_ + 2) register:*((void *)self->_serviceLocationClient.__ptr_.__value_ + 1) forNotification:22 registrationInfo:0];
  [*((id *)self->_serviceLocationClient.__ptr_.__value_ + 2) register:*((void *)self->_serviceLocationClient.__ptr_.__value_ + 1) forNotification:39 registrationInfo:0];
  [*((id *)self->_serviceLocationClient.__ptr_.__value_ + 2) register:*((void *)self->_serviceLocationClient.__ptr_.__value_ + 1) forNotification:14 registrationInfo:0];
  sub_1007BEE4C((uint64_t)sub_1009B551C, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v9 = *(Client **)buf;
  *(void *)buf = 0LL;
  v10 = self->_vdrNotifierClient.__ptr_.__value_;
  self->_vdrNotifierClient.__ptr_.__value_ = v9;
  if (v10)
  {
    (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
    v11 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v11) {
      (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    }
  }

  [*((id *)self->_vdrNotifierClient.__ptr_.__value_ + 2) register:*((void *)self->_vdrNotifierClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_100583844((uint64_t)sub_1009B5560, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v12 = *(Client **)buf;
  *(void *)buf = 0LL;
  v13 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = v12;
  if (v13)
  {
    (*(void (**)(Client *))(*(void *)v13 + 8LL))(v13);
    v14 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v14) {
      (*(void (**)(Client *))(*(void *)v14 + 8LL))(v14);
    }
  }

  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  memset(&v34, 0, sizeof(v34));
  std::string::operator=(&v34, (const std::string *)&qword_101999AA0);
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_10120E548((uint64_t)&v34)];
  sub_1004EEF6C((uint64_t)sub_1009B53F8, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v15 = *(Client **)buf;
  *(void *)buf = 0LL;
  v16 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = v15;
  if (v16)
  {
    (*(void (**)(Client *))(*(void *)v16 + 8LL))(v16);
    v17 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v17) {
      (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
    }
  }

  sub_10034FF34((uint64_t)nullsub_874, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v18 = *(Client **)buf;
  *(void *)buf = 0LL;
  v19 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = v18;
  if (v19)
  {
    (*(void (**)(Client *))(*(void *)v19 + 8LL))(v19);
    v20 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v20) {
      (*(void (**)(Client *))(*(void *)v20 + 8LL))(v20);
    }
  }

  self->_inertialSamples = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  self->_locations = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  self->_lastLocation = 0LL;
  v21 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.routine");
  self->_listener = v21;
  -[NSXPCListener _setQueue:]( v21,  "_setQueue:",  objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo"), "queue"));
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  self->_routineManager = objc_alloc_init(&OBJC_CLASS___RTRoutineManager);
  self->_visitClients = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  self->_leechClients = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  self->_lowConfidenceVisitLeechClients = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd.routine", 0LL, 0LL, 1u);
  self->_scenarioTriggerClients = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  sub_100D311BC((uint64_t)nullsub_875, (uint64_t)self, -[CLRoutineMonitor universe](self, "universe"), buf);
  v23 = *(Client **)buf;
  *(void *)buf = 0LL;
  v24 = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = v23;
  if (v24)
  {
    (*(void (**)(Client *))(*(void *)v24 + 8LL))(v24);
    v25 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v25) {
      (*(void (**)(Client *))(*(void *)v25 + 8LL))(v25);
    }
  }

  *(int64x2_t *)&self->_awarenessRegInfo.unsettledParameters.latencyBudget = vdupq_n_s64(0x408C200000000000uLL);
  *(int64x2_t *)&self->_awarenessRegInfo.settledParameters.latencyBudget = vdupq_n_s64(0x40AC200000000000uLL);
  sub_1002A5370(v33);
  sub_1002F0B04(buf);
  BOOL v26 = sub_1002A8F8C(*(uint64_t *)buf, "SLVAwarenessParameters", v33);
  BOOL v27 = v26;
  v28 = *(std::__shared_weak_count **)v38;
  if (!*(void *)v38) {
    goto LABEL_23;
  }
  v29 = (unint64_t *)(*(void *)v38 + 8LL);
  do
    unint64_t v30 = __ldaxr(v29);
  while (__stlxr(v30 - 1, v29));
  if (!v30)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if (!v27) {
      goto LABEL_29;
    }
  }

  else
  {
LABEL_23:
    if (!v26) {
      goto LABEL_29;
    }
  }

  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  v31 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = sub_1002A59CC((uint64_t)v33);
    *(void *)buf = 68289282LL;
    *(_WORD *)v38 = 2082;
    *(void *)&v38[2] = "";
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Overriding awareness parameters, foundParameters:%{public, location:escape_only}@}",  buf,  0x1Cu);
  }

  sub_100D3169C((BOOL *)&self->_awarenessRegInfo, (uint64_t)v33);
LABEL_29:
  self->_cachedPlaceInferences = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[CLRoutineMonitor startMonitoringPlaceInferencesForCache](self, "startMonitoringPlaceInferencesForCache");
  sub_1002A5590(v33);
  _Block_object_dispose(v36, 8);
}

- (void)endService
{
  value = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v4 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  unint64_t v5 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }
  v6 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
  }
  v7 = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
  }
  serviceLocationProvider = self->_serviceLocationProvider;
  if (serviceLocationProvider)
  {
    (*(void (**)(void *))(*(void *)serviceLocationProvider + 8LL))(serviceLocationProvider);
    self->_serviceLocationProvider = 0LL;
  }

  -[RTRoutineManager stopMonitoringVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopMonitoringVisits");
  -[CLRoutineMonitor setVisitClients:](self, "setVisitClients:", 0LL);
  -[RTRoutineManager stopLeechingVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopLeechingVisits");
  -[CLRoutineMonitor setLeechClients:](self, "setLeechClients:", 0LL);
  -[RTRoutineManager stopLeechingLowConfidenceVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopLeechingLowConfidenceVisits");
  -[CLRoutineMonitor setLowConfidenceVisitLeechClients:](self, "setLowConfidenceVisitLeechClients:", 0LL);
  -[RTRoutineManager stopMonitoringPlaceInferences]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopMonitoringPlaceInferences");
  -[CLRoutineMonitor setCachedPlaceInferences:](self, "setCachedPlaceInferences:", 0LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1009B5808;
  v9[3] = &unk_1018652C0;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( -[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"),  "enumerateKeysAndObjectsUsingBlock:",  v9);
  -[CLRoutineMonitor setScenarioTriggerClients:](self, "setScenarioTriggerClients:", 0LL);
  -[CLRoutineMonitor setRoutineManager:](self, "setRoutineManager:", 0LL);
}

- (void)startMonitoringPlaceInferencesForCache
{
  id v3 =  [[RTPlaceInferenceOptions alloc] initWithFidelityPolicy:0 locations:&__NSArray0__struct accessPoints:&__NSArray0__struct];
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  v4 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "start monitoring place inferences for cache",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "start monitoring place inferences for cache",  v8,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor startMonitoringPlaceInferencesForCache]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1009B5A38;
  v7[3] = &unk_10181A2B0;
  v7[4] = self;
  -[RTRoutineManager startMonitoringPlaceInferencesWithOptions:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "startMonitoringPlaceInferencesWithOptions:handler:",  v3,  v7);
}

- (void)startMonitoringVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#slv telling routined to start visit monitoring",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "#slv telling routined to start visit monitoring",  v9,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor startMonitoringVisitsForClient:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1009B5E1C;
    v8[3] = &unk_1018652E8;
    v8[4] = self;
    -[RTRoutineManager startMonitoringVisitsWithHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "startMonitoringVisitsWithHandler:",  v8);
    *(_DWORD *)buf = 3600;
    *(_WORD *)&buf[4] = 1;
    *(void *)&uint8_t buf[8] = "visits";
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:sub_10039E77C(buf)];
    [*((id *)self->_awarenessClient.__ptr_.__value_ + 2) register:*((void *)self->_awarenessClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_100957404(&self->_awarenessRegInfo.settledParameters.latencyBudget)];
  }

  -[NSMutableSet addObject:](-[CLRoutineMonitor visitClients](self, "visitClients"), "addObject:", a3);
  -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
}

- (void)stopMonitoringVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#slv telling routined to stop visit monitoring",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "#slv telling routined to stop visit monitoring",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor stopMonitoringVisitsForClient:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    -[RTRoutineManager stopMonitoringVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopMonitoringVisits");
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
    [*((id *)self->_awarenessClient.__ptr_.__value_ + 2) unregister:*((void *)self->_awarenessClient.__ptr_.__value_ + 1) forNotification:0];
  }

  -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
}

- (void)startLeechingVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#slv Telling routined to start visit leeching",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "#slv Telling routined to start visit leeching",  v9,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor startLeechingVisitsForClient:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1009B6520;
    v8[3] = &unk_1018652E8;
    v8[4] = self;
    -[RTRoutineManager startLeechingVisitsWithHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "startLeechingVisitsWithHandler:",  v8);
  }

  -[NSMutableSet addObject:](-[CLRoutineMonitor leechClients](self, "leechClients"), "addObject:", a3);
}

- (void)stopLeechingVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#slv Telling routined to stop visit leeching",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "#slv Telling routined to stop visit leeching",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor stopLeechingVisitsForClient:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    -[RTRoutineManager stopLeechingVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopLeechingVisits");
  }

- (void)startLeechingLowConfidenceVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count]( -[CLRoutineMonitor lowConfidenceVisitLeechClients](self, "lowConfidenceVisitLeechClients"),  "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#slv Telling routined to start low confidence visit leeching",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "#slv Telling routined to start low confidence visit leeching",  v9,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLRoutineMonitor startLeechingLowConfidenceVisitsForClient:]",  "%s\n",  v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1009B6BEC;
    v8[3] = &unk_1018652E8;
    v8[4] = self;
    -[RTRoutineManager startLeechingLowConfidenceVisitsWithHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "startLeechingLowConfidenceVisitsWithHandler:",  v8);
  }

  -[NSMutableSet addObject:]( -[CLRoutineMonitor lowConfidenceVisitLeechClients](self, "lowConfidenceVisitLeechClients"),  "addObject:",  a3);
}

- (void)stopLeechingLowConfidenceVisitsForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLRoutineMonitor leechClients](self, "leechClients"), "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    unint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#slv Telling routined to stop low confidence visit leeching",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "#slv Telling routined to stop low confidence visit leeching",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor stopLeechingLowConfidenceVisitsForClient:]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    -[RTRoutineManager stopLeechingLowConfidenceVisits]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopLeechingLowConfidenceVisits");
  }

- (void)fetchLocationOfInterestAtLocation:(id)a3 withReply:(id)a4
{
}

- (void)fetchRoutineModeFromLocation:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager")) {
    -[RTRoutineManager fetchRoutineModeFromLocation:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchRoutineModeFromLocation:withHandler:",  a3,  a4);
  }
  else {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)fetchLocationOfInterestForRegion:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
  {
    -[RTRoutineManager fetchLocationOfInterestForRegion:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationOfInterestForRegion:withHandler:",  a3,  a4);
  }

  else if (a4)
  {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withReply:(id)a5
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager"))
  {
    -[RTRoutineManager setHintForRegionState:significantRegion:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "setHintForRegionState:significantRegion:withHandler:",  a3,  a4,  a5);
  }

  else if (a5)
  {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0LL, 0LL);
  }

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager")) {
    -[RTRoutineManager fetchLocationsOfInterestAssociatedToIdentifier:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationsOfInterestAssociatedToIdentifier:withHandler:",  a3,  a4);
  }
  else {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager")) {
    -[RTRoutineManager fetchLocationOfInterestWithIdentifier:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationOfInterestWithIdentifier:withHandler:",  a3,  a4);
  }
  else {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withReply:(id)a5
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager")) {
    -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:",  a4,  a5,  a3);
  }
  else {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0LL, 0LL);
  }
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withReply:(id)a4
{
  if (-[CLRoutineMonitor routineManager](self, "routineManager")) {
    -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationsOfInterestOfType:withHandler:",  a3,  a4);
  }
  else {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)fetchRecentLocationsOfInterestWithReply:(id)a3
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }
  -[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchLocationsOfInterestVisitedSinceDate:withHandler:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -4233600.0),  a3);
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withReply:(id)a6
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a6 + 2))(a6, 0LL, 0LL);
  }
  -[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:",  a3,  a4,  a6,  a5);
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
  -[RTRoutineManager fetchPredictedLocationsOfInterestOnDate:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchPredictedLocationsOfInterestOnDate:withHandler:",  a3,  a4);
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0LL, 0LL);
  }
  -[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:",  a3,  a4,  a5);
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
  -[RTRoutineManager fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:",  a3,  a4);
}

- (void)dealloc
{
  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  if (wakeRoutinedTimer)
  {
    dispatch_source_cancel((dispatch_source_t)wakeRoutinedTimer);
    dispatch_release((dispatch_object_t)self->_wakeRoutinedTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLRoutineMonitor;
  -[CLRoutineMonitor dealloc](&v4, "dealloc");
}

- (void)addLocation:(id)a3
{
  unint64_t v5 = -[CLRoutineMonitor lastLocation](self, "lastLocation");
  if (!v5) {
    goto LABEL_21;
  }
  v6 = v5;
  objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", -[CLLocation timestamp](v5, "timestamp"));
  if (fabs(v7) >= 1.0) {
    goto LABEL_21;
  }
  [a3 coordinate];
  double v9 = v8;
  -[CLLocation coordinate](v6, "coordinate");
  if (v9 != v10) {
    goto LABEL_21;
  }
  [a3 coordinate];
  double v12 = v11;
  -[CLLocation coordinate](v6, "coordinate");
  if (v12 != v13) {
    goto LABEL_21;
  }
  [a3 horizontalAccuracy];
  double v15 = v14;
  -[CLLocation horizontalAccuracy](v6, "horizontalAccuracy");
  if (v15 != v16) {
    goto LABEL_21;
  }
  [a3 altitude];
  double v18 = v17;
  -[CLLocation altitude](v6, "altitude");
  if (v18 != v19) {
    goto LABEL_21;
  }
  [a3 verticalAccuracy];
  double v21 = v20;
  -[CLLocation verticalAccuracy](v6, "verticalAccuracy");
  if (v21 != v22) {
    goto LABEL_21;
  }
  [a3 speed];
  double v24 = v23;
  -[CLLocation speed](v6, "speed");
  if (v24 != v25) {
    goto LABEL_21;
  }
  [a3 course];
  double v27 = v26;
  -[CLLocation course](v6, "course");
  if (v27 == v28
    && (unsigned int v29 = [a3 type], v29 == -[CLLocation type](v6, "type"))
    && (id v30 = objc_msgSend(objc_msgSend(a3, "floor"), "level"),
        v30 == (id)-[CLFloor level](-[CLLocation floor](v6, "floor"), "level")))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v31 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v44 = (uint64_t)a3;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "dropping duplicate location, %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v41 = 138477827;
      uint64_t v42 = (uint64_t)a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "dropping duplicate location, %{private}@",  &v41,  12);
      v33 = (uint8_t *)v32;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor addLocation:]", "%s\n", v32);
      if (v33 != buf) {
        free(v33);
      }
    }
  }

  else
  {
LABEL_21:
    -[CLRoutineMonitor setLastLocation:](self, "setLastLocation:", a3);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    std::string v34 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v44 = (uint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "received location, %{private}@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v41 = 138477827;
      uint64_t v42 = (uint64_t)a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "received location, %{private}@",  &v41,  12);
      v37 = (uint8_t *)v36;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor addLocation:]", "%s\n", v36);
      if (v37 != buf) {
        free(v37);
      }
    }

    -[NSMutableArray addObject:](-[CLRoutineMonitor locations](self, "locations"), "addObject:", a3);
    if (-[CLRoutineMonitor updating](self, "updating"))
    {
      -[CLRoutineMonitor sendLocations](self, "sendLocations");
    }

    else
    {
      -[CLRoutineMonitor setArmed:](self, "setArmed:", 1LL);
      if ((unint64_t)-[NSMutableArray count](-[CLRoutineMonitor locations](self, "locations"), "count") >= 0x272)
      {
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_101865440);
        }
        v35 = (os_log_s *)qword_1019349A8;
        if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v44 = 625LL;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "#warning in-memory cache has exceeded threshold of %{public}lu, removing oldest fix",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019349A0 != -1) {
            dispatch_once(&qword_1019349A0, &stru_101865440);
          }
          int v41 = 134349056;
          uint64_t v42 = 625LL;
          LODWORD(v40) = 12;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  0LL,  "#warning in-memory cache has exceeded threshold of %{public}lu, removing oldest fix",  &v41,  v40);
          __int16 v39 = (uint8_t *)v38;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor addLocation:]", "%s\n", v38);
          if (v39 != buf) {
            free(v39);
          }
        }

        -[NSMutableArray removeObjectAtIndex:]( -[CLRoutineMonitor locations](self, "locations"),  "removeObjectAtIndex:",  0LL);
      }
    }
  }

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3)
  {
    if (a3 == 4)
    {
      -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
    }

    else
    {
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      double v9 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        int v14 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "received unhandled notification %{public, location:CLClientManager_Type::Notification}d",  buf,  8u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_101865440);
        }
        v12[0] = 67240192;
        v12[1] = a3;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  17LL,  "received unhandled notification %{public, location:CLClientManager_Type::Notification}d",  v12,  8);
        double v11 = (uint8_t *)v10;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLRoutineMonitor onClientManagerNotification:data:]", "%s\n", v10);
        if (v11 != buf) {
          free(v11);
        }
      }
    }
  }

  else
  {
    -[CLRoutineMonitor flush](self, "flush");
    -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
    id v7 = objc_msgSend( objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientManager");
    if (byte_101999AB7 >= 0) {
      double v8 = &qword_101999AA0;
    }
    else {
      double v8 = (uint64_t *)qword_101999AA0;
    }
    objc_msgSend( v7,  "resetNotificationConsumedForIdentifier:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  }

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 <= 21)
  {
    if (a3 != 4)
    {
      if (a3 == 14)
      {
        -[CLRoutineMonitor checkAuthorization](self, "checkAuthorization");
        return;
      }

      goto LABEL_13;
    }

    goto LABEL_11;
  }

  if (a3 == 39)
  {
LABEL_11:
    double v19 = objc_alloc(&OBJC_CLASS___CLLocation);
    __int128 v20 = *((_OWORD *)a4 + 7);
    v30[6] = *((_OWORD *)a4 + 6);
    v30[7] = v20;
    v31[0] = *((_OWORD *)a4 + 8);
    *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)((char *)a4 + 140);
    __int128 v21 = *((_OWORD *)a4 + 3);
    v30[2] = *((_OWORD *)a4 + 2);
    v30[3] = v21;
    __int128 v22 = *((_OWORD *)a4 + 5);
    v30[4] = *((_OWORD *)a4 + 4);
    v30[5] = v22;
    __int128 v23 = *((_OWORD *)a4 + 1);
    v30[0] = *(_OWORD *)a4;
    v30[1] = v23;
    double v24 = -[CLLocation initWithClientLocation:](v19, "initWithClientLocation:", v30);
    -[CLRoutineMonitor addLocation:](self, "addLocation:", v24);

LABEL_12:
    objc_msgSend( objc_msgSend( objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientManager"),  "dingAllActiveTranscriptSubscriptions");
    return;
  }

  if (a3 == 22)
  {
    if (sub_100CBED60(*((int **)a4 + 100)))
    {
      uint64_t v7 = 0LL;
      unint64_t v8 = 0LL;
      do
      {
        double v9 = objc_alloc(&OBJC_CLASS___CLLocation);
        uint64_t v10 = sub_1000F0F50(*((void *)a4 + 100));
        __int128 v11 = *(_OWORD *)(v10 + v7 + 16);
        v28[0] = *(_OWORD *)(v10 + v7);
        v28[1] = v11;
        __int128 v12 = *(_OWORD *)(v10 + v7 + 80);
        __int128 v14 = *(_OWORD *)(v10 + v7 + 32);
        __int128 v13 = *(_OWORD *)(v10 + v7 + 48);
        v28[4] = *(_OWORD *)(v10 + v7 + 64);
        v28[5] = v12;
        v28[2] = v14;
        v28[3] = v13;
        __int128 v16 = *(_OWORD *)(v10 + v7 + 112);
        __int128 v15 = *(_OWORD *)(v10 + v7 + 128);
        __int128 v17 = *(_OWORD *)(v10 + v7 + 96);
        *(_OWORD *)&v29[12] = *(_OWORD *)(v10 + v7 + 140);
        v28[7] = v16;
        *(_OWORD *)unsigned int v29 = v15;
        v28[6] = v17;
        double v18 = -[CLLocation initWithClientLocation:](v9, "initWithClientLocation:", v28);
        -[CLRoutineMonitor addLocation:](self, "addLocation:", v18);

        ++v8;
        v7 += 156LL;
      }

      while (v8 < sub_100CBED60(*((int **)a4 + 100)));
    }

    goto LABEL_12;
  }

- (void)addInertialData:(id)a3
{
  if (qword_101999AE8 != -1) {
    dispatch_once(&qword_101999AE8, &stru_101865308);
  }
  -[NSMutableArray addObject:](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "addObject:", a3);
  if (-[CLRoutineMonitor updating](self, "updating")
    && (id v5 = -[NSMutableArray count](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "count"),
        (unint64_t)v5 > qword_10198EA48))
  {
    -[CLRoutineMonitor sendInertialData](self, "sendInertialData");
  }

  else if ((unint64_t)-[NSMutableArray count]( -[CLRoutineMonitor inertialSamples](self, "inertialSamples"),  "count") >= 0x272)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v12 = 625LL;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#warning in-memory inertial cache has exceeded threshold of %{public}lu, removing oldest samples",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v9 = 134349056;
      uint64_t v10 = 625LL;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  0LL,  "#warning in-memory inertial cache has exceeded threshold of %{public}lu, removing oldest samples",  &v9,  12);
      unint64_t v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor addInertialData:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }

    -[NSMutableArray removeObjectAtIndex:]( -[CLRoutineMonitor inertialSamples](self, "inertialSamples"),  "removeObjectAtIndex:",  0LL);
  }

- (void)onVdrNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    uint64_t v7 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CLTSP,unknown CLVDRNotifier_Type::Notification,%u",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v26 = 67109120;
      LODWORD(v27) = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  16LL,  "CLTSP,unknown CLVDRNotifier_Type::Notification,%u",  &v26);
      int v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    uint64_t v10 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
    {
      __int128 v11 = *(void **)a4;
      uint64_t v12 = *((void *)a4 + 1);
      uint64_t v13 = *((void *)a4 + 2);
      uint64_t v14 = *((void *)a4 + 3);
      *(_DWORD *)buf = 134218752;
      id v35 = v11;
      __int16 v36 = 2048;
      uint64_t v37 = v12;
      __int16 v38 = 2048;
      uint64_t v39 = v13;
      __int16 v40 = 2048;
      uint64_t v41 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "CLTSP,vdr2DofMeasurementSample,t,%.3lf,dataPeriod,%.2lf,deltaCourse,%.3lf,deltaSpeed,%.3lf",  buf,  0x2Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      __int128 v17 = *(void **)a4;
      uint64_t v18 = *((void *)a4 + 1);
      uint64_t v19 = *((void *)a4 + 2);
      uint64_t v20 = *((void *)a4 + 3);
      int v26 = 134218752;
      id v27 = v17;
      __int16 v28 = 2048;
      uint64_t v29 = v18;
      __int16 v30 = 2048;
      uint64_t v31 = v19;
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      LODWORD(v25) = 42;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  2LL,  "CLTSP,vdr2DofMeasurementSample,t,%.3lf,dataPeriod,%.2lf,deltaCourse,%.3lf,deltaSpeed,%.3lf",  COERCE_DOUBLE(&v26),  v25);
      __int128 v22 = (uint8_t *)v21;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    id v15 = objc_msgSend( [CLTripSegmentInertialData alloc],  "initWithTime:dataPeriodSec:deltaCourseRad:deltaSpeedMps:deltaCourseVarRad2:deltaSpeedVarMps2:deltaCourseSpeedCovarRadMps:",  -[NSDate initWithTimeIntervalSinceReferenceDate:]( [NSDate alloc],  "initWithTimeIntervalSinceReferenceDate:",  *(double *)a4),  *((double *)a4 + 1),  *((double *)a4 + 2),  *((double *)a4 + 3),  *((double *)a4 + 4),  *((double *)a4 + 5),  *((double *)a4 + 6));
    if ([v15 isValid])
    {
      -[CLRoutineMonitor addInertialData:](self, "addInertialData:", v15);
    }

    else
    {
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      __int128 v16 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CLTSP,invalid tripSegmentInertialData,%@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_101865440);
        }
        int v26 = 138412290;
        id v27 = v15;
        LODWORD(v25) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  16LL,  "CLTSP,invalid tripSegmentInertialData,%@",  &v26,  *(void *)&v25);
        double v24 = (uint8_t *)v23;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLRoutineMonitor onVdrNotification:data:]", "%s\n", v23);
        if (v24 != buf) {
          free(v24);
        }
      }
    }
  }

- (void)flush
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  id v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "flushing routine data", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "flushing routine data",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor flush]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor inertialSamples](self, "inertialSamples"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor locations](self, "locations"), "removeAllObjects");
  -[CLRoutineMonitor setArmed:](self, "setArmed:", 0LL);
}

- (void)checkAuthorization
{
  if (sub_1002958AC() != 1)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    objc_super v4 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Location services are disabled; stopping routine data collection",
        buf,
        2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_17;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    LOWORD(v8[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  0LL,  "Location services are disabled; stopping routine data collection",
      v8,
      2,
      v8[0]);
    goto LABEL_22;
  }

  if (sub_1008B1A38((uint64_t)self->_serviceLocationProvider) != 3)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Routine system service disabled; stopping routine data collection",
        buf,
        2u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_17;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    LOWORD(v8[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  0LL,  "Routine system service disabled; stopping routine data collection",
      v8,
      2,
      v8[0]);
LABEL_22:
    uint64_t v7 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor checkAuthorization]", "%s\n", v5);
    if (v7 != buf) {
      free(v7);
    }
LABEL_17:
    uint64_t v3 = 0LL;
    goto LABEL_18;
  }

  uint64_t v3 = 1LL;
LABEL_18:
  -[CLRoutineMonitor setAuthorized:](self, "setAuthorized:", v3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  v6 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "LocationServer received incoming connection",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    LOWORD(v25.val[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  0LL,  "LocationServer received incoming connection",  &v25,  2);
    __int128 v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor listener:shouldAcceptNewConnection:]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

  if (a4)
  {
    id v7 = [a4 valueForEntitlement:@"com.apple.locationd.routine"];
    if (v7)
    {
      objc_opt_class(&OBJC_CLASS___NSNumber);
      if (objc_opt_isKindOfClass(v7, v8) & 1) != 0 && ([v7 BOOLValue])
      {
        objc_msgSend( a4,  "setExportedInterface:",  +[NSXPCInterface interfaceWithProtocol:]( NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLLocationManagerRoutineServerInterface));
        [a4 setExportedObject:self];
        objc_msgSend( a4,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLLocationManagerRoutineClientInterface));
        objc_msgSend( a4,  "_setQueue:",  objc_msgSend(objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo"), "queue"));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1009B9584;
        v23[3] = &unk_10181A288;
        v23[4] = self;
        [a4 setInterruptionHandler:v23];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1009B9738;
        v22[3] = &unk_10181A288;
        v22[4] = self;
        [a4 setInvalidationHandler:v22];
        -[CLRoutineMonitor setConnection:](self, "setConnection:", a4);
        -[NSXPCConnection resume](-[CLRoutineMonitor connection](self, "connection"), "resume");
        LOBYTE(v9) = 1;
        return v9;
      }
    }

    unsigned int v10 = [a4 processIdentifier];
    [a4 auditToken];
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    __int128 v11 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_FAULT))
    {
      sub_100F4B370(&v25, &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 68289538;
      int v27 = 0;
      __int16 v28 = 2082;
      uint64_t v29 = "";
      __int16 v30 = 1026;
      unsigned int v31 = v10;
      __int16 v32 = 2082;
      uint64_t v33 = p_p;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:process is not entitled to use CLLocationManagerRoutine, pid:%{public}d, executab le:%{public, location:escape_only}s}",  buf,  0x22u);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
    }

    uint64_t v13 = (os_log_s *)qword_1019349A8;
    if (os_signpost_enabled((os_log_t)qword_1019349A8))
    {
      sub_100F4B370(&v25, &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v14 = &__p;
      }
      else {
        uint64_t v14 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 68289538;
      int v27 = 0;
      __int16 v28 = 2082;
      uint64_t v29 = "";
      __int16 v30 = 1026;
      unsigned int v31 = v10;
      __int16 v32 = 2082;
      uint64_t v33 = v14;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "process is not entitled to use CLLocationManagerRoutine",  "{msg%{public}.0s:process is not entitled to use CLLocationManagerRoutine, pid:%{public}d, executab le:%{public, location:escape_only}s}",  buf,  0x22u);
    }

- (void)sendInertialData
{
}

- (void)startUpdatingLocation
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  uint64_t v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start updating location", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "start updating location",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor startUpdatingLocation]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLRoutineMonitor setUpdating:](self, "setUpdating:", 1LL);
  -[CLRoutineMonitor sendLocations](self, "sendLocations");
}

- (void)stopUpdatingLocation
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  uint64_t v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop updating location", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "stop updating location",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor stopUpdatingLocation]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLRoutineMonitor setUpdating:](self, "setUpdating:", 0LL);
}

- (void)sendLocations
{
}

- (void)sendLocationsWithReply:(id)a3
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  id v5 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    unsigned int v10 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#location #routine sendLocationsWithReply}",  buf,  0x12u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1009B9E44;
  v6[3] = &unk_10184AF38;
  v6[4] = a3;
  objc_msgSend( -[NSXPCConnection remoteObjectProxy](-[CLRoutineMonitor connection](self, "connection"), "remoteObjectProxy"),  "didUpdateLocations:withReply:",  -[CLRoutineMonitor locations](self, "locations"),  v6);
  -[NSMutableArray removeAllObjects](-[CLRoutineMonitor locations](self, "locations"), "removeAllObjects");
  -[CLRoutineMonitor setArmed:](self, "setArmed:", 0LL);
}

- (void)setAuthorized:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (self->_authorized != v3)
  {
    self->_authorized = v3;
    -[CLRoutineMonitor setArmed:](self, "setArmed:", v3);
    -[CLRoutineMonitor checkDiminishedMode](self, "checkDiminishedMode");
  }

- (void)setArmed:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "silo");
  if (self->_armed != v3)
  {
    if (!-[NSMutableArray count](-[CLRoutineMonitor locations](self, "locations"), "count")) {
      goto LABEL_9;
    }
    if (-[CLRoutineMonitor authorized](self, "authorized"))
    {
      if (!v3)
      {
LABEL_9:
        if (self->_armed)
        {
          self->_armed = 0;
          -[CLRoutineMonitor stopWakeRoutinedTimer](self, "stopWakeRoutinedTimer");
        }

        return;
      }
    }

    else if (!-[CLRoutineMonitor diminishedMode](self, "diminishedMode") || !v3)
    {
      goto LABEL_9;
    }

    self->_armed = 1;
    -[CLRoutineMonitor startWakeRoutinedTimer](self, "startWakeRoutinedTimer");
  }

- (void)startWakeRoutinedTimer
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  BOOL v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start wakeRoutinedTimer", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "start wakeRoutinedTimer",  v8,  2);
    id v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor startWakeRoutinedTimer]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  wakeRoutinedTimer = self->_wakeRoutinedTimer;
  dispatch_time_t v5 = dispatch_time(0LL, 300000000000LL);
  dispatch_source_set_timer((dispatch_source_t)wakeRoutinedTimer, v5, 0x45D964B800uLL, 0LL);
}

- (void)stopWakeRoutinedTimer
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  BOOL v3 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop wakeRoutinedTimer", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "stop wakeRoutinedTimer",  v6,  2);
    dispatch_time_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor stopWakeRoutinedTimer]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  dispatch_source_set_timer( (dispatch_source_t)self->_wakeRoutinedTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
}

- (void)onWakeRoutinedTimer
{
  if (!-[CLRoutineMonitor connection](self, "connection"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    BOOL v3 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wake routined", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v6[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "wake routined",  v6,  2);
      dispatch_time_t v5 = (uint8_t *)v4;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor onWakeRoutinedTimer]", "%s\n", v4);
      if (v5 != buf) {
        free(v5);
      }
    }

    objc_msgSend( objc_msgSend( objc_msgSend(-[CLRoutineMonitor universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLApplicationLifecycleManager"),  "launchDaemon:",  +[CLRoutineMonitor bundlePath](CLRoutineMonitor, "bundlePath"));
  }

- (void)setDiminishedMode:(BOOL)a3
{
  if (self->_diminishedMode != a3)
  {
    self->_diminishedMode = a3;
    if (a3)
    {
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      objc_super v4 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "entering diminished mode; starting data collection",
          buf,
          2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_101865440);
        }
        v12[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "entering diminished mode; starting data collection",
          v12,
          2);
        __int16 v9 = (uint8_t *)v8;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v8);
        if (v9 != buf) {
          free(v9);
        }
      }

      value = self->_filteredLocationClient.__ptr_.__value_;
      if (value)
      {
        [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
        [*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2) register:*((void *)self->_filteredLocationClient.__ptr_.__value_ + 1) forNotification:22 registrationInfo:0];
      }
    }

    else
    {
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      v6 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "exiting diminished mode; stopping data collection",
          buf,
          2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_101865440);
        }
        v12[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "exiting diminished mode; stopping data collection",
          v12,
          2);
        __int128 v11 = (uint8_t *)v10;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLRoutineMonitor setDiminishedMode:]", "%s\n", v10);
        if (v11 != buf) {
          free(v11);
        }
      }

      id v7 = self->_filteredLocationClient.__ptr_.__value_;
      if (v7)
      {
        [*((id *)v7 + 2) unregister:*((void *)v7 + 1) forNotification:4];
        [*((id *)self->_filteredLocationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_filteredLocationClient.__ptr_.__value_ + 1) forNotification:22];
      }
    }

    -[CLRoutineMonitor setArmed:](self, "setArmed:", self->_diminishedMode);
  }

- (void)checkDiminishedMode
{
  BOOL v3 = !-[CLRoutineMonitor authorized](self, "authorized")
    && -[NSMutableSet count](-[CLRoutineMonitor visitClients](self, "visitClients"), "count");
  -[CLRoutineMonitor setDiminishedMode:](self, "setDiminishedMode:", v3);
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  id v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
  int v8 = (NSMutableSet *)-[NSMutableDictionary objectForKey:]( -[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"),  "objectForKey:",  v7);
  if (!v8)
  {
    int v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    -[NSMutableDictionary setObject:forKey:]( -[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"),  "setObject:forKey:",  v8,  v7);
  }

  if (!-[NSMutableSet count](v8, "count"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    __int16 v9 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#scenarioTrigger Telling routined to start monitoring trigger of type, %lu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "#scenarioTrigger Telling routined to start monitoring trigger of type, %lu",  &v13);
      __int128 v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLRoutineMonitor startMonitoringScenarioTriggerOfType:forClient:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1009BABA4;
    v12[3] = &unk_101865330;
    _DWORD v12[4] = self;
    v12[5] = v7;
    -[RTRoutineManager startMonitoringScenarioTriggerOfType:withHandler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "startMonitoringScenarioTriggerOfType:withHandler:",  a3,  v12);
  }

  -[NSMutableSet addObject:](v8, "addObject:", a4);
}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 forClient:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKey:]( -[CLRoutineMonitor scenarioTriggerClients](self, "scenarioTriggerClients"),  "objectForKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v7 removeObject:a4];
  if (![v7 count])
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_101865440);
    }
    int v8 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#scenarioTrigger Telling routined to stop monitoring trigger of type, %lu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_101865440);
      }
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  1LL,  "#scenarioTrigger Telling routined to stop monitoring trigger of type, %lu",  &v11);
      unsigned int v10 = (uint8_t *)v9;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLRoutineMonitor stopMonitoringScenarioTriggerOfType:forClient:]",  "%s\n",  v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    -[RTRoutineManager stopMonitoringScenarioTriggerOfType:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "stopMonitoringScenarioTriggerOfType:",  a3);
  }

- (void)fetchPlaceInferencesWithOptions:(id)a3 withReply:(id)a4
{
}

- (void)fetchCachedPlaceInferencesWithReply:(id)a3
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  dispatch_time_t v5 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 2113;
    unsigned int v10 = -[CLRoutineMonitor cachedPlaceInferences](self, "cachedPlaceInferences");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:fetchCachedPlaceInferences, cachedPlaceInferences:%{private, location:escape_only}@}",  (uint8_t *)v6,  0x1Cu);
  }

  (*((void (**)(id, NSMutableArray *, void))a3 + 2))( a3,  -[CLRoutineMonitor cachedPlaceInferences](self, "cachedPlaceInferences"),  0LL);
}

- (void)fetchFormattedPostalAddressesFromMeCardWithReply:(id)a3
{
}

- (void)fetchStoredVisitsWithOptions:(id)a3 withReply:(id)a4
{
  if (!-[CLRoutineMonitor routineManager](self, "routineManager")) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
  -[RTRoutineManager fetchStoredVisitsWithOptions:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchStoredVisitsWithOptions:handler:",  a3,  a4);
}

- (void)getStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 withReply:(id)a7
{
  int v13 =  -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"),  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a4));
  id v14 = objc_alloc(&OBJC_CLASS___RTStoredVisitFetchOptions);
  id v15 =  objc_msgSend( v14,  "initWithAscending:confidence:dateInterval:limit:",  1,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh),  v13,  0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1009BB524;
  v16[3] = &unk_101865358;
  *(double *)&v16[7] = a3;
  *(double *)&v16[8] = a4;
  *(double *)&v16[9] = a5;
  v16[4] = objc_msgSend( -[CLRoutineMonitor vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLRoutineMonitor",  @"CLRoutineMonitor");
  v16[5] = a6;
  v16[6] = a7;
  -[RTRoutineManager fetchStoredVisitsWithOptions:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchStoredVisitsWithOptions:handler:",  v15,  v16);
}

- (void)zipperedStoredLocationsBetweenStartTime:(double)a3 endTime:(double)a4 apartFromEachOther:(double)a5 lyingWithinTimeIntervals:(id)a6 custeredWithVisits:(id)a7 withReply:(id)a8
{
  __int16 v28 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL);
  int v27 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL);
  id v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3);
  unint64_t v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a4);
  id v26 =  objc_msgSend( [RTStoredLocationEnumerationOptions alloc],  "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:",   -[NSDateInterval initWithStartDate:endDate:]( [NSDateInterval alloc],  "initWithStartDate:endDate:",  v15,  v16),  0,  0,  0.0);
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101865460);
  }
  __int128 v17 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68290562LL;
    *(_WORD *)v56 = 2082;
    *(void *)&v56[2] = "";
    *(_WORD *)&v56[10] = 2050;
    *(void *)&v56[12] = [a6 count];
    *(_WORD *)&v56[20] = 2050;
    *(void *)&v56[22] = [a7 count];
    *(_WORD *)&v56[30] = 2050;
    uint64_t v57 = (uint64_t)a3;
    __int16 v58 = 2050;
    uint64_t v59 = (uint64_t)a4;
    __int16 v60 = 2114;
    v61 = v15;
    __int16 v62 = 2114;
    v63 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#storedLocations: zipper start, IntervalCount:%{public}ld, VisitCount:%{public}ld , startTime:%{public}ld, endTime:%{public}ld, FromDate:%{public, location:escape_only}@, ToDate:%{ public, location:escape_only}@}",  buf,  0x4Eu);
  }

  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  int v44 = 0;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  int v42 = 0;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  v38[3] = 0xFFEFFFFFFFFFFFFFLL;
  *(void *)buf = 0LL;
  *(void *)v56 = buf;
  *(void *)&v56[8] = 0x3052000000LL;
  *(void *)&v56[16] = sub_1009B53CC;
  *(void *)&v56[24] = sub_1009B53DC;
  uint64_t v57 = 0LL;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  id v35 = sub_1009B53CC;
  __int16 v36 = sub_1009B53DC;
  uint64_t v37 = 0LL;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  char v31 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1009BBCCC;
  v29[3] = &unk_101865380;
  v29[8] = v43;
  v29[9] = v30;
  v29[10] = &v32;
  v29[11] = v38;
  *(double *)&v29[15] = a5;
  v29[4] = a6;
  v29[5] = a7;
  v29[12] = v41;
  v29[13] = buf;
  v29[14] = v39;
  v29[6] = v27;
  v29[7] = v28;
  -[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:]( -[CLRoutineMonitor routineManager](self, "routineManager", a8),  "enumerateStoredLocationsWithOptions:usingBlock:",  v26,  v29);
  uint64_t v18 = v33;
  uint64_t v19 = (void *)v33[5];
  if (v19)
  {

    uint64_t v18 = v33;
  }

  v18[5] = 0LL;
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101865460);
  }
  uint64_t v20 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    id v21 = -[NSMutableArray count](v28, "count");
    id v22 = -[NSMutableArray count](v27, "count");
    *(_DWORD *)v45 = 68289794;
    int v46 = 0;
    __int16 v47 = 2082;
    v48 = "";
    __int16 v49 = 2050;
    id v50 = v21;
    __int16 v51 = 2050;
    id v52 = v22;
    __int16 v53 = 2050;
    uint64_t v54 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#storedLocations: zipper finished, LocationCount:%{public}ld, ClusteredCount:%{pu blic}ld, UnattributedIntervals:%{public}ld}",  v45,  0x30u);
  }

  id v23 = sub_1009BC44C(v28, 0x64u);
  id v24 = sub_1009BC44C(v27, 0x64u);
  (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v23, v24);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

- (void)fetchEstimatedLocationAtDate:(id)a3 withReply:(id)a4
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  __int16 v7 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v21[0]) = 2082;
    *(void *)((char *)v21 + 2) = "";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#location #routine fetchEstimatedLocationAtDate}",  buf,  0x12u);
  }

  sub_1002F0B04(buf);
  int v8 = sub_1002A6F64(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v17);
  if (v17) {
    int v9 = 0;
  }
  else {
    int v9 = v8;
  }
  unsigned int v10 = (std::__shared_weak_count *)v21[0];
  if (v21[0])
  {
    int v11 = (unint64_t *)(v21[0] + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      if (v9) {
        goto LABEL_13;
      }
LABEL_19:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1009BCADC;
      v16[3] = &unk_1018653A8;
      v16[4] = self;
      v16[5] = a3;
      v16[6] = a4;
      -[CLRoutineMonitor sendLocationsWithReply:](self, "sendLocationsWithReply:", v16);
      return;
    }
  }

  if (!v9) {
    goto LABEL_19;
  }
LABEL_13:
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  int v13 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v21[0]) = 2082;
    *(void *)((char *)v21 + 2) = "";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#location #routine fetchEstimatedLocationAtDate is disabled}",  buf,  0x12u);
  }

  id v14 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
  uint64_t v19 = @"fetchEstimatedLocationAtDate is disabled";
  id v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL);
  (*((void (**)(id, void, NSError *))a4 + 2))( a4,  0LL,  -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5LL, v15));
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 withReply:(id)a5
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  int v9 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v23[0]) = 2082;
    *(void *)((char *)v23 + 2) = "";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#location #routine fetchEstimatedLocationAtDateOptions}",  buf,  0x12u);
  }

  sub_1002F0B04(buf);
  int v10 = sub_1002A6F64(*(uint64_t *)buf, "EstimatedLocationAtDateEnabled", &v19);
  if (v19) {
    int v11 = 0;
  }
  else {
    int v11 = v10;
  }
  unint64_t v12 = (std::__shared_weak_count *)v23[0];
  if (v23[0])
  {
    int v13 = (unint64_t *)(v23[0] + 8LL);
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      if (v11) {
        goto LABEL_13;
      }
LABEL_19:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1009BCE80;
      v18[3] = &unk_1018653D0;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      v18[7] = a5;
      -[CLRoutineMonitor sendLocationsWithReply:](self, "sendLocationsWithReply:", v18);
      return;
    }
  }

  if (!v11) {
    goto LABEL_19;
  }
LABEL_13:
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_101865440);
  }
  id v15 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v23[0]) = 2082;
    *(void *)((char *)v23 + 2) = "";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#location #routine fetchEstimatedLocationAtDate is disabled}",  buf,  0x12u);
  }

  unint64_t v16 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  id v21 = @"fetchEstimatedLocationAtDate is disabled";
  BOOL v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL);
  (*((void (**)(id, void, NSError *))a5 + 2))( a5,  0LL,  -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5LL, v17));
}

- (void)fetchLookbackWindowStartDateWithReply:(id)a3
{
}

- (void)fetchRemoteStatusWithReply:(id)a3
{
}

- (void)enumerateStoredLocationsWithOptions:(id)a3 withReply:(id)a4
{
  __int16 v7 = -[CLOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CLOSTransaction),  "initWithDescription:",  "CLRoutineMonitor.enumerateStoredLocations");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  void v8[2] = sub_1009BD064;
  v8[3] = &unk_1018653F8;
  v8[4] = a4;
  -[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "enumerateStoredLocationsWithOptions:usingBlock:",  a3,  v8);

  (*((void (**)(id, void, void, uint64_t))a4 + 2))(a4, 0LL, 0LL, 1LL);
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  __int16 v7 = -[CLOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CLOSTransaction),  "initWithDescription:",  "CLRoutineMonitor.fetchBackgroundInertialOdometrySamplesWithOptions");
  -[RTRoutineManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchBackgroundInertialOdometrySamplesWithOptions:handler:",  a3,  a4);
}

- (void)getFamiliarityIndexForVisit:(id)a3 withReply:(id)a4
{
  id v7 = objc_alloc(&OBJC_CLASS___RTLocation);
  [a3 coordinate];
  double v9 = v8;
  [a3 coordinate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1009BD1E8;
  v11[3] = &unk_101865420;
  v11[4] = a4;
  -[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:]( -[CLRoutineMonitor routineManager](self, "routineManager"),  "fetchFamiliarityIndexResultsWithOptions:handler:",   objc_msgSend( [RTFamiliarityIndexOptions alloc],  "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:",  0,  1,   objc_msgSend( v7,  "initWithLatitude:longitude:horizontalUncertainty:date:",  +[NSDate date](NSDate, "date"),  v9,  v10,  0.0),  1,  4838400.0,  100.0),  v11);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (BOOL)updatingPredictedApplications
{
  return self->_updatingPredictedApplications;
}

- (void)setUpdatingPredictedApplications:(BOOL)a3
{
  self->_updatingPredictedApplications = a3;
}

- (NSMutableArray)inertialSamples
{
  return self->_inertialSamples;
}

- (void)setInertialSamples:(id)a3
{
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (BOOL)armed
{
  return self->_armed;
}

- (BOOL)diminishedMode
{
  return self->_diminishedMode;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (NSMutableSet)visitClients
{
  return self->_visitClients;
}

- (void)setVisitClients:(id)a3
{
}

- (NSMutableSet)leechClients
{
  return self->_leechClients;
}

- (void)setLeechClients:(id)a3
{
}

- (NSMutableSet)lowConfidenceVisitLeechClients
{
  return self->_lowConfidenceVisitLeechClients;
}

- (void)setLowConfidenceVisitLeechClients:(id)a3
{
}

- (NSMutableDictionary)scenarioTriggerClients
{
  return self->_scenarioTriggerClients;
}

- (void)setScenarioTriggerClients:(id)a3
{
}

- (NSMutableArray)cachedPlaceInferences
{
  return self->_cachedPlaceInferences;
}

- (void)setCachedPlaceInferences:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_awarenessClient.__ptr_.__value_;
  self->_awarenessClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  objc_super v4 = self->_vdrNotifierClient.__ptr_.__value_;
  self->_vdrNotifierClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  dispatch_time_t v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  v6 = self->_filteredLocationClient.__ptr_.__value_;
  self->_filteredLocationClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8LL))(v6, a2);
  }
  id v7 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8LL))(v7, a2);
  }
  double v8 = self->_serviceLocationClient.__ptr_.__value_;
  self->_serviceLocationClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  int64x2_t v2 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(int64x2_t *)((char *)self + 72) = v2;
  *((_BYTE *)self + 88) = 0;
  *((int64x2_t *)self + 6) = v2;
  *((_BYTE *)self + 112) = 0;
  return self;
}

@end