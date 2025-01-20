@interface CLOutdoorService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldRunManager;
- (CLOutdoorManagerCallbackAdapter)callbackAdapter;
- (CLOutdoorService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)bringupManager;
- (void)endService;
- (void)manager;
- (void)notifyClients:(const OutdoorUpdate *)a3;
- (void)onAmbientLightSensorData:(const CLALSLuxResult *)a3;
- (void)onBacklightStateNotification:(const int *)a3 data:(const void *)a4;
- (void)onBiomeUserFocusSleepModeEvent:(id)a3;
- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onGnssAvailabilityPredictorNotification:(const int *)a3 data:(const void *)a4;
- (void)onGnssLeechLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onHKPrivacyPreferencesEnableDaylightTime:(BOOL)a3;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onMotionStateCoprocessorData:(const void *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOldMotionCoprocessorData:(const void *)a3;
- (void)onOutdoorUpdate:(const OutdoorUpdate *)a3;
- (void)onSignalEnvironmentNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onWifiNotification:(const int *)a3 data:(const void *)a4;
- (void)pause;
- (void)registerForAlgorithmSources;
- (void)registerForHKNanoLifestylePrivacyPreferencesChangedNotification;
- (void)registerForUpdates:(id)a3;
- (void)resume;
- (void)setCallbackAdapter:(CLOutdoorManagerCallbackAdapter *)a3;
- (void)setClients:(id)a3;
- (void)setManager:(void *)a3;
- (void)setupManager;
- (void)teardownManager;
- (void)toggleManagerBySettingFlag:(BOOL *)a3 toState:(BOOL)a4;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification;
- (void)unregisterForUpdates:(id)a3;
- (void)updateLocationAuthorization;
@end

@implementation CLOutdoorService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A8E0 != -1) {
    dispatch_once(&qword_10199A8E0, &stru_10186F638);
  }
  return (id)qword_10199A8D8;
}

- (CLOutdoorService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLOutdoorService;
  v2 = -[CLOutdoorService initWithInboundProtocol:outboundProtocol:]( &v5,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLOutdoorServiceProtocol,  &OBJC_PROTOCOL___CLOutdoorServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    -[CLOutdoorService setClients:](v2, "setClients:", 0LL);
    -[CLOutdoorService setCallbackAdapter:](v3, "setCallbackAdapter:", 0LL);
    -[CLOutdoorService setManager:](v3, "setManager:", 0LL);
    v3->fBatterySaverModeEnabled = 0;
    v3->fFitnessTrackingEnabled = 0;
    v3->fLocationServicesEnabled = 0;
    v3->fBedtimeSleepModeEnabled = 0;
    v3->fClientAuthorizationCache = 0LL;
    v3->fBiomeScheduler = 0LL;
    v3->fBiomeSink = 0LL;
  }

  return v3;
}

+ (BOOL)isSupported
{
  if (qword_10199A8F0 != -1) {
    dispatch_once(&qword_10199A8F0, &stru_10186F658);
  }
  return byte_10199A8E8;
}

- (void)beginService
{
  v3 = operator new(0x18uLL);
  void *v3 = &off_10186F6F8;
  v3[1] = self;
  v3[2] = sub_100AFAD00;
  -[CLOutdoorService setCallbackAdapter:](self, "setCallbackAdapter:", v3);
  sub_1003CC884((uint64_t)sub_100AFAD0C, (uint64_t)self, -[CLOutdoorService universe](self, "universe"), &v20);
  v4 = v20;
  v20 = 0LL;
  value = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v6 = v20;
    v20 = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:15 registrationInfo:0];
  -[CLOutdoorService universe](self, "universe");
  v7 = (void **)operator new(8uLL);
  sub_1005D0A94(v7);
  sub_100AFB1DC((void ***)&self->fAlsCollector, v7);
  id v8 = -[CLOutdoorService universe](self, "universe");
  v9 = (CLServiceLocationProvider *)operator new(0xC0uLL);
  sub_100AEB404(v9, "MotionCalibration", v8);
  v10 = self->fServiceLocationProvider.__ptr_.__value_;
  self->fServiceLocationProvider.__ptr_.__value_ = v9;
  if (v10)
  {
    (*(void (**)(CLServiceLocationProvider *))(*(void *)v10 + 8LL))(v10);
    v9 = self->fServiceLocationProvider.__ptr_.__value_;
  }

  sub_100AEB408( (uint64_t)v9,  (uint64_t)sub_100AFAD28,  (uint64_t)self,  -[CLOutdoorService universe](self, "universe"),  &v20);
  v11 = v20;
  v20 = 0LL;
  v12 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = v11;
  if (v12)
  {
    (*(void (**)(Client *))(*(void *)v12 + 8LL))(v12);
    v13 = v20;
    v20 = 0LL;
    if (v13) {
      (*(void (**)(Client *))(*(void *)v13 + 8LL))(v13);
    }
  }

  [*((id *)self->fServiceLocationClient.__ptr_.__value_ + 2) register:*((void *)self->fServiceLocationClient.__ptr_.__value_ + 1) forNotification:14 registrationInfo:0];
  v14 = (CLClientAuthorizationCacheProtocol *) objc_msgSend( objc_msgSend(-[CLOutdoorService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientAuthorizationCache");
  self->fClientAuthorizationCache = v14;
  -[CLClientAuthorizationCacheProtocol registerDelegate:inSilo:]( v14,  "registerDelegate:inSilo:",  self,  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo"));
  sub_10060B0A4((uint64_t)sub_100AFAD38, (uint64_t)self, -[CLOutdoorService universe](self, "universe"), &v20);
  v15 = v20;
  v20 = 0LL;
  v16 = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = v15;
  if (v16)
  {
    (*(void (**)(Client *))(*(void *)v16 + 8LL))(v16);
    v17 = v20;
    v20 = 0LL;
    if (v17) {
      (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
    }
  }

  [*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2) register:*((void *)self->fFitnessTrackingClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  self->fBiomeScheduler = -[BMBiomeScheduler initWithIdentifier:targetQueue:waking:]( [BMBiomeScheduler alloc],  "initWithIdentifier:targetQueue:waking:",  @"com.apple.locationd.timeindaylight",  objc_msgSend(objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo"), "queue"),  0);
  id v18 = objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "UserFocus"), "SleepMode"), "DSLPublisher"),  "subscribeOn:",  self->fBiomeScheduler);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100AFB03C;
  v19[3] = &unk_10186F6A0;
  v19[4] = self;
  self->fBiomeSink = (BPSSink *)[v18 sinkWithCompletion:&stru_10186F678 receiveInput:v19];
  -[CLOutdoorService registerForHKNanoLifestylePrivacyPreferencesChangedNotification]( self,  "registerForHKNanoLifestylePrivacyPreferencesChangedNotification");
}

- (void)endService
{
  value = self->fDaemonStatusClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:15];
    v4 = self->fDaemonStatusClient.__ptr_.__value_;
    self->fDaemonStatusClient.__ptr_.__value_ = 0LL;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
    }
  }

  objc_super v5 = self->fServiceLocationClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:14];
    v6 = self->fServiceLocationClient.__ptr_.__value_;
    self->fServiceLocationClient.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  v7 = self->fServiceLocationProvider.__ptr_.__value_;
  if (v7)
  {
    self->fServiceLocationProvider.__ptr_.__value_ = 0LL;
    (*(void (**)(CLServiceLocationProvider *))(*(void *)v7 + 8LL))(v7);
  }

  fClientAuthorizationCache = self->fClientAuthorizationCache;
  if (fClientAuthorizationCache)
  {

    self->fClientAuthorizationCache = 0LL;
  }

  v9 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v9)
  {
    [*((id *)v9 + 2) unregister:*((void *)v9 + 1) forNotification:0];
    v10 = self->fFitnessTrackingClient.__ptr_.__value_;
    self->fFitnessTrackingClient.__ptr_.__value_ = 0LL;
    if (v10) {
      (*(void (**)(Client *))(*(void *)v10 + 8LL))(v10);
    }
  }

  fBiomeScheduler = self->fBiomeScheduler;
  if (fBiomeScheduler)
  {

    self->fBiomeScheduler = 0LL;
  }

  fBiomeSink = self->fBiomeSink;
  if (fBiomeSink)
  {
    -[BPSSink cancel](fBiomeSink, "cancel");

    self->fBiomeSink = 0LL;
  }

  v13 = -[CLOutdoorService callbackAdapter](self, "callbackAdapter");
  if (v13) {
    (*((void (**)(CLOutdoorManagerCallbackAdapter *))v13->var0 + 1))(v13);
  }
  -[CLOutdoorService setCallbackAdapter:](self, "setCallbackAdapter:", 0LL);
  -[CLOutdoorService setClients:](self, "setClients:", 0LL);
}

- (void)setupManager
{
  v3 = operator new(0x2320uLL);
  sub_100AF32D4((uint64_t)v3, (uint64_t)-[CLOutdoorService callbackAdapter](self, "callbackAdapter"));
  -[CLOutdoorService setManager:](self, "setManager:", v3);
  uint64_t v4 = sub_100AFB270();
  -[CLOutdoorService onHKPrivacyPreferencesEnableDaylightTime:](self, "onHKPrivacyPreferencesEnableDaylightTime:", v4);
}

- (void)registerForAlgorithmSources
{
  id v3 = objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  uint64_t v4 = (Dispatcher *)operator new(0x38uLL);
  sub_1003DE40C(v4, v3, (uint64_t)sub_100AFBADC, (uint64_t)self, 0LL);
  value = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = v4;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
  }
  uint64_t v6 = sub_1008FA854(0);
  sub_1006DCB40(v6, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_, -1.0);
  id v7 = objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  id v8 = (Dispatcher *)operator new(0x38uLL);
  sub_1003DE40C(v8, v7, (uint64_t)sub_100AFBAE8, (uint64_t)self, 0LL);
  v9 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
  self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = v8;
  if (v9) {
    (*(void (**)(Dispatcher *))(*(void *)v9 + 8LL))(v9);
  }
  uint64_t v10 = sub_1008FA854(0);
  sub_1006DCB40(v10, 1, (uint64_t)self->fOldMotionCoprocessorDispatcher.__ptr_.__value_, -1.0);
  v11 = self->fAlsCollector.__ptr_.__value_;
  if (v11) {
    nullsub_10(v11);
  }
  if ((sub_1001B9A1C() & 1) != 0)
  {
    sub_1005BB360((uint64_t)sub_100AFBAF4, (uint64_t)self, -[CLOutdoorService universe](self, "universe"), &v34);
    v12 = v34;
    v34 = 0LL;
    v13 = self->fBLSClient.__ptr_.__value_;
    self->fBLSClient.__ptr_.__value_ = v12;
    if (v13)
    {
      (*(void (**)(Client *))(*(void *)v13 + 8LL))(v13);
      v14 = v34;
      v34 = 0LL;
      if (v14) {
        (*(void (**)(Client *))(*(void *)v14 + 8LL))(v14);
      }
    }

    [*((id *)self->fBLSClient.__ptr_.__value_ + 2) register:*((void *)self->fBLSClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  }

  sub_101037234((uint64_t)sub_100AFBB04, (uint64_t)self, self, &v34);
  v15 = v34;
  v34 = 0LL;
  v16 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = v15;
  if (v16)
  {
    (*(void (**)(Client *))(*(void *)v16 + 8LL))(v16);
    v17 = v34;
    v34 = 0LL;
    if (v17) {
      (*(void (**)(Client *))(*(void *)v17 + 8LL))(v17);
    }
  }

  [*((id *)self->fStepCountClient.__ptr_.__value_ + 2) register:*((void *)self->fStepCountClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  id v18 = self->fServiceLocationClient.__ptr_.__value_;
  if (v18) {
    [*((id *)v18 + 2) register:*((void *)v18 + 1) forNotification:5 registrationInfo:0];
  }
  sub_10027EB5C((uint64_t)sub_100AFBB14, (uint64_t)self, self, &v34);
  v19 = v34;
  v34 = 0LL;
  v20 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = v19;
  if (v20)
  {
    (*(void (**)(Client *))(*(void *)v20 + 8LL))(v20);
    v21 = v34;
    v34 = 0LL;
    if (v21) {
      (*(void (**)(Client *))(*(void *)v21 + 8LL))(v21);
    }
  }

  [*((id *)self->fOdometerClient.__ptr_.__value_ + 2) register:*((void *)self->fOdometerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  sub_100468458((uint64_t)sub_100AFBB24, (uint64_t)self, self, &v34);
  v22 = v34;
  v34 = 0LL;
  v23 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = v22;
  if (v23)
  {
    (*(void (**)(Client *))(*(void *)v23 + 8LL))(v23);
    v24 = v34;
    v34 = 0LL;
    if (v24) {
      (*(void (**)(Client *))(*(void *)v24 + 8LL))(v24);
    }
  }

  [*((id *)self->fMotionStateMediatorClient.__ptr_.__value_ + 2) register:*((void *)self->fMotionStateMediatorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  sub_10034FF34((uint64_t)sub_100AFBB34, (uint64_t)self, self, &v34);
  v25 = v34;
  v34 = 0LL;
  v26 = self->fWifiClient.__ptr_.__value_;
  self->fWifiClient.__ptr_.__value_ = v25;
  if (v26)
  {
    (*(void (**)(Client *))(*(void *)v26 + 8LL))(v26);
    v27 = v34;
    v34 = 0LL;
    if (v27) {
      (*(void (**)(Client *))(*(void *)v27 + 8LL))(v27);
    }
  }

  [*((id *)self->fWifiClient.__ptr_.__value_ + 2) register:*((void *)self->fWifiClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  sub_100A1C6E0((uint64_t)sub_100AFBB44, (uint64_t)self, self, &v34);
  v28 = v34;
  v34 = 0LL;
  v29 = self->fSignalEnvironmentClient.__ptr_.__value_;
  self->fSignalEnvironmentClient.__ptr_.__value_ = v28;
  if (v29)
  {
    (*(void (**)(Client *))(*(void *)v29 + 8LL))(v29);
    v30 = v34;
    v34 = 0LL;
    if (v30) {
      (*(void (**)(Client *))(*(void *)v30 + 8LL))(v30);
    }
  }

  [*((id *)self->fSignalEnvironmentClient.__ptr_.__value_ + 2) register:*((void *)self->fSignalEnvironmentClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
  sub_10043AC3C((uint64_t)sub_100AFBB54, (uint64_t)self, self, &v34);
  v31 = v34;
  v34 = 0LL;
  v32 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = v31;
  if (v32)
  {
    (*(void (**)(Client *))(*(void *)v32 + 8LL))(v32);
    v33 = v34;
    v34 = 0LL;
    if (v33) {
      (*(void (**)(Client *))(*(void *)v33 + 8LL))(v33);
    }
  }

  [*((id *)self->fGnssAvailabilityPredictorClient.__ptr_.__value_ + 2) register:*((void *)self->fGnssAvailabilityPredictorClient.__ptr_.__value_ + 1) forNotification:36 registrationInfo:0];
  sub_1004F2598();
  if ((sub_1004F64FC() & 8) != 0) {
    sub_100A9E608();
  }
}

- (void)unregisterForAlgorithmSources
{
  if (self->fMotionStateCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1008FA854(0);
    sub_1006DD2A0(v3, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    value = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
  }

  if (self->fOldMotionCoprocessorDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_1008FA854(0);
    sub_1006DD2A0(v5, 1, (uint64_t)self->fOldMotionCoprocessorDispatcher.__ptr_.__value_);
    uint64_t v6 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
    self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0LL;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8LL))(v6);
    }
  }

  id v7 = self->fAlsCollector.__ptr_.__value_;
  if (v7) {
    nullsub_10(v7);
  }
  if (sub_1001B9A1C())
  {
    id v8 = self->fBLSClient.__ptr_.__value_;
    if (v8)
    {
      [*((id *)v8 + 2) unregister:*((void *)v8 + 1) forNotification:1];
      v9 = self->fBLSClient.__ptr_.__value_;
      self->fBLSClient.__ptr_.__value_ = 0LL;
      if (v9) {
        (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
      }
    }
  }

  uint64_t v10 = self->fStepCountClient.__ptr_.__value_;
  if (v10)
  {
    [*((id *)v10 + 2) unregister:*((void *)v10 + 1) forNotification:1];
    v11 = self->fStepCountClient.__ptr_.__value_;
    self->fStepCountClient.__ptr_.__value_ = 0LL;
    if (v11) {
      (*(void (**)(Client *))(*(void *)v11 + 8LL))(v11);
    }
  }

  v12 = self->fServiceLocationClient.__ptr_.__value_;
  if (v12) {
    [*((id *)v12 + 2) unregister:*((void *)v12 + 1) forNotification:5];
  }
  v13 = self->fOdometerClient.__ptr_.__value_;
  if (v13)
  {
    [*((id *)v13 + 2) unregister:*((void *)v13 + 1) forNotification:4];
    v14 = self->fOdometerClient.__ptr_.__value_;
    self->fOdometerClient.__ptr_.__value_ = 0LL;
    if (v14) {
      (*(void (**)(Client *))(*(void *)v14 + 8LL))(v14);
    }
  }

  v15 = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (v15)
  {
    [*((id *)v15 + 2) unregister:*((void *)v15 + 1) forNotification:2];
    v16 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
    if (v16) {
      (*(void (**)(Client *))(*(void *)v16 + 8LL))(v16);
    }
  }

  v17 = self->fWifiClient.__ptr_.__value_;
  if (v17)
  {
    [*((id *)v17 + 2) unregister:*((void *)v17 + 1) forNotification:3];
    id v18 = self->fWifiClient.__ptr_.__value_;
    self->fWifiClient.__ptr_.__value_ = 0LL;
    if (v18) {
      (*(void (**)(Client *))(*(void *)v18 + 8LL))(v18);
    }
  }

  v19 = self->fSignalEnvironmentClient.__ptr_.__value_;
  if (v19)
  {
    [*((id *)v19 + 2) unregister:*((void *)v19 + 1) forNotification:0];
    v20 = self->fSignalEnvironmentClient.__ptr_.__value_;
    self->fSignalEnvironmentClient.__ptr_.__value_ = 0LL;
    if (v20) {
      (*(void (**)(Client *))(*(void *)v20 + 8LL))(v20);
    }
  }

  v21 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  if (v21)
  {
    [*((id *)v21 + 2) unregister:*((void *)v21 + 1) forNotification:36];
    v22 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0LL;
    if (v22) {
      (*(void (**)(Client *))(*(void *)v22 + 8LL))(v22);
    }
  }

  v23 = self->fGnssLeechLocationClient.__ptr_.__value_;
  if (v23)
  {
    [*((id *)v23 + 2) unregister:*((void *)v23 + 1) forNotification:5];
    v24 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0LL;
    if (v24) {
      (*(void (**)(Client *))(*(void *)v24 + 8LL))(v24);
    }
  }

- (void)registerForUpdates:(id)a3
{
}

- (void)unregisterForUpdates:(id)a3
{
}

- (void)notifyClients:(const OutdoorUpdate *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var2;
  __int128 v14 = *(_OWORD *)&a3->var0;
  __int128 v15 = v3;
  __int128 v16 = *(_OWORD *)&a3->var4;
  uint64_t v17 = *(void *)&a3->var6;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = -[CLOutdoorService clients](self, "clients", 0LL);
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v23,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        __int128 v19 = v14;
        __int128 v20 = v15;
        __int128 v21 = v16;
        uint64_t v22 = v17;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_100AFDCE4;
        v18[3] = &unk_10186F798;
        objc_msgSend(v9, "onOutdoorUpdate:", objc_msgSend(v18, "copy"));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v23,  16LL);
    }

    while (v6);
  }

- (void)pause
{
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF32D8(-[CLOutdoorService manager](self, "manager"));
  }
}

- (void)resume
{
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF3470(-[CLOutdoorService manager](self, "manager"));
  }
}

- (void)bringupManager
{
  if (!-[CLOutdoorService manager](self, "manager"))
  {
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    __int128 v3 = (os_log_s *)qword_101934948;
    if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bringing up manager", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934940 != -1) {
        dispatch_once(&qword_101934940, &stru_10186F758);
      }
      v6[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934948,  0LL,  "Bringing up manager",  v6,  2);
      id v5 = (uint8_t *)v4;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService bringupManager]", "%s\n", v4);
      if (v5 != buf) {
        free(v5);
      }
    }

    -[CLOutdoorService setupManager](self, "setupManager");
    -[CLOutdoorService registerForAlgorithmSources](self, "registerForAlgorithmSources");
  }

- (void)teardownManager
{
  if (-[CLOutdoorService manager](self, "manager"))
  {
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    __int128 v3 = (os_log_s *)qword_101934948;
    if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934940 != -1) {
        dispatch_once(&qword_101934940, &stru_10186F758);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934948,  0LL,  "Tearing down manager",  v8,  2);
      uint64_t v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService teardownManager]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    -[CLOutdoorService unregisterForAlgorithmSources](self, "unregisterForAlgorithmSources");
    uint64_t v4 = -[CLOutdoorService manager](self, "manager");
    if (v4)
    {
      id v5 = (void *)sub_100AFDA54((uint64_t)v4);
      operator delete(v5);
    }

    -[CLOutdoorService setManager:](self, "setManager:", 0LL);
  }

- (BOOL)shouldRunManager
{
  return !self->fBatterySaverModeEnabled
      && self->fLocationServicesEnabled
      && self->fFitnessTrackingEnabled
      && !self->fBedtimeSleepModeEnabled;
}

- (void)toggleManagerBySettingFlag:(BOOL *)a3 toState:(BOOL)a4
{
  *a3 = a4;
  if (-[CLOutdoorService shouldRunManager](self, "shouldRunManager")) {
    -[CLOutdoorService bringupManager](self, "bringupManager");
  }
  else {
    -[CLOutdoorService teardownManager](self, "teardownManager");
  }
}

- (void)updateLocationAuthorization
{
  fClientAuthorizationCache = self->fClientAuthorizationCache;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100AFC488;
  v3[3] = &unk_10186F6C8;
  v3[4] = self;
  -[CLClientAuthorizationCacheProtocol getAuthorizationContextOfNonZonalClient:withReply:]( fClientAuthorizationCache,  "getAuthorizationContextOfNonZonalClient:withReply:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle"),  v3);
}

- (void)onMotionStateCoprocessorData:(const void *)a3
{
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF3604((int64x2_t *)-[CLOutdoorService manager](self, "manager"), (uint64_t)a3);
  }
}

- (void)onOldMotionCoprocessorData:(const void *)a3
{
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF3604((int64x2_t *)-[CLOutdoorService manager](self, "manager"), (uint64_t)a3);
  }
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    if (-[CLOutdoorService manager](self, "manager")) {
      sub_100AF3F44((uint64_t)-[CLOutdoorService manager](self, "manager"), a4);
    }
  }

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 14)
  {
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    v9 = (os_log_s *)qword_101934948;
    if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].n128_u16[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received location authorization update",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934940 != -1) {
        dispatch_once(&qword_101934940, &stru_10186F758);
      }
      v12[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934948,  0LL,  "Received location authorization update",  v12,  2);
      __int128 v11 = (__n128 *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService onLocationNotification:data:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CLOutdoorService updateLocationAuthorization](self, "updateLocationAuthorization");
  }

  else if (*a3 == 5)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      *(float *)&unsigned int v7 = *(double *)((char *)a4 + 4);
      *(float *)&unsigned int v8 = *(double *)((char *)a4 + 12);
      buf[0].n128_u64[0] = *(void *)((char *)a4 + 76);
      buf[0].n128_u64[1] = v7 | ((unint64_t)v8 << 32);
      sub_100AF3F4C((uint64_t)-[CLOutdoorService manager](self, "manager"), buf);
    }
  }

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 4)
  {
    if (-[CLOutdoorService manager](self, "manager")) {
      sub_100AF41F0((uint64_t)-[CLOutdoorService manager](self, "manager"), (__int128 *)a4);
    }
  }

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    if (-[CLOutdoorService manager](self, "manager")) {
      sub_100AF4A84((uint64_t)-[CLOutdoorService manager](self, "manager"), (uint64_t *)a4);
    }
  }

- (void)onWifiNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 3)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      uint64_t v7 = *((void *)a4 + 13);
      memset(v8, 0, sizeof(v8));
      sub_1002DE3C8( v8,  *((void *)a4 + 14),  *((void *)a4 + 15),  0x2E8BA2E8BA2E8BA3LL * ((uint64_t)(*((void *)a4 + 15) - *((void *)a4 + 14)) >> 3));
      sub_100AF41F8((uint64_t)-[CLOutdoorService manager](self, "manager"), &v7);
      v9 = (void **)v8;
      sub_100023498(&v9);
    }
  }

- (void)onAmbientLightSensorData:(const CLALSLuxResult *)a3
{
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF3C68((uint64_t)-[CLOutdoorService manager](self, "manager"), (__n128 *)a3);
  }
}

- (void)onOutdoorUpdate:(const OutdoorUpdate *)a3
{
}

- (void)onSignalEnvironmentNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (!*a3)
  {
    if (-[CLOutdoorService manager](self, "manager")) {
      sub_100AF48AC((uint64_t)-[CLOutdoorService manager](self, "manager"), (int *)a4);
    }
  }

- (void)onGnssAvailabilityPredictorNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 36)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      uint64_t v7 = -[CLOutdoorService manager]( self,  "manager",  CFAbsoluteTimeGetCurrent(),  *((void *)a4 + 166),  *((void *)a4 + 167),  *((void *)a4 + 168));
      sub_100AF4608((uint64_t)v7, &v8);
    }
  }

- (void)onGnssLeechLocationNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 5 && -[CLOutdoorService manager](self, "manager"))
  {
    *(_OWORD *)__p = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
    if (__p[1])
    {
      *(void **)&__int128 v9 = __p[1];
      operator delete(__p[1]);
    }
  }

- (void)onBacklightStateNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 1)
  {
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    __int128 v7 = (os_log_s *)qword_101934948;
    if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_INFO))
    {
      int v8 = *((unsigned __int8 *)a4 + 56);
      *(_DWORD *)buf = 67109120;
      int v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AlwaysOn enablement change, isAlwaysOnEnabled, %d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934940 != -1) {
        dispatch_once(&qword_101934940, &stru_10186F758);
      }
      int v10 = *((unsigned __int8 *)a4 + 56);
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934948,  1LL,  "AlwaysOn enablement change, isAlwaysOnEnabled, %d",  v13);
      __int128 v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService onBacklightStateNotification:data:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    value = self->fAlsCollector.__ptr_.__value_;
    if (value) {
      nullsub_10(value);
    }
  }

- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 15)
  {
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    __int128 v7 = (os_log_s *)qword_101934948;
    if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_BYTE *)a4;
      *(_DWORD *)buf = 67109376;
      int v17 = v8;
      __int16 v18 = 1024;
      BOOL v19 = -[CLOutdoorService manager](self, "manager") == 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Low power mode toggled, isBatterySaverModeEnabled, %d, isManagerNil, %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934940 != -1) {
        dispatch_once(&qword_101934940, &stru_10186F758);
      }
      uint64_t v9 = qword_101934948;
      int v10 = *(_BYTE *)a4;
      v13[0] = 67109376;
      v13[1] = v10;
      __int16 v14 = 1024;
      BOOL v15 = -[CLOutdoorService manager](self, "manager") == 0LL;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "Low power mode toggled, isBatterySaverModeEnabled, %d, isManagerNil, %d",  v13,  14);
      __int128 v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService onDaemonStatusNotification:data:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    -[CLOutdoorService toggleManagerBySettingFlag:toState:]( self,  "toggleManagerBySettingFlag:toState:",  &self->fBatterySaverModeEnabled,  *(_BYTE *)a4);
  }

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *((_BYTE *)a4 + 3) == 0;
  }
  uint64_t v8 = !v7;
  if (qword_101934940 != -1) {
    dispatch_once(&qword_101934940, &stru_10186F758);
  }
  uint64_t v9 = (os_log_s *)qword_101934948;
  if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received fitness tracking update, enabled %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    v12[0] = 67240192;
    v12[1] = v8;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934948,  0LL,  "Received fitness tracking update, enabled %{public}d",  v12,  8);
    __int128 v11 = (uint8_t *)v10;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService onFitnessTrackingNotification:data:]", "%s\n", v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  -[CLOutdoorService toggleManagerBySettingFlag:toState:]( self,  "toggleManagerBySettingFlag:toState:",  &self->fFitnessTrackingEnabled,  v8);
}

- (void)registerForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  if (qword_10199A8F8 != -1) {
    dispatch_once(&qword_10199A8F8, &stru_10186F778);
  }
  if (qword_10199A900)
  {
    if (off_10198F6E0[0]())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      uint64_t v4 = (const __CFString *)off_10198F6E0[0]();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100AFD394,  v4,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

- (void)unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  if (qword_10199A8F8 != -1) {
    dispatch_once(&qword_10199A8F8, &stru_10186F778);
  }
  if (qword_10199A900)
  {
    if (off_10198F6E0[0]())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      uint64_t v4 = (const __CFString *)off_10198F6E0[0]();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0LL);
    }
  }

- (void)onHKPrivacyPreferencesEnableDaylightTime:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CLOutdoorService manager](self, "manager")) {
    sub_100AF4CB0((uint64_t)-[CLOutdoorService manager](self, "manager"), v3);
  }
}

- (void)onBiomeUserFocusSleepModeEvent:(id)a3
{
  if (qword_101934940 != -1) {
    dispatch_once(&qword_101934940, &stru_10186F758);
  }
  id v5 = (os_log_s *)qword_101934948;
  if (os_log_type_enabled((os_log_t)qword_101934948, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = (int)[a3 state];
    __int16 v17 = 2048;
    uint64_t v18 = (int)[a3 changeReason];
    __int16 v19 = 2112;
    id v20 = [a3 expectedEndDate];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Biome UserFocusSleepMode, state, %ld, changeReason, %ld, expectedEndDate, %@",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934940 != -1) {
      dispatch_once(&qword_101934940, &stru_10186F758);
    }
    uint64_t v6 = qword_101934948;
    int v9 = 134218498;
    uint64_t v10 = (int)[a3 state];
    __int16 v11 = 2048;
    uint64_t v12 = (int)[a3 changeReason];
    __int16 v13 = 2112;
    id v14 = [a3 expectedEndDate];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  2LL,  "Biome UserFocusSleepMode, state, %ld, changeReason, %ld, expectedEndDate, %@",  &v9,  32);
    uint64_t v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOutdoorService onBiomeUserFocusSleepModeEvent:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  -[CLOutdoorService toggleManagerBySettingFlag:toState:]( self,  "toggleManagerBySettingFlag:toState:",  &self->fBedtimeSleepModeEnabled,  [a3 state] == 3);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (CLOutdoorManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLOutdoorManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

- (void).cxx_destruct
{
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  uint64_t v4 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8LL))(v4, a2);
  }
  id v5 = self->fBLSClient.__ptr_.__value_;
  self->fBLSClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8LL))(v5, a2);
  }
  uint64_t v6 = self->fGnssLeechLocationClient.__ptr_.__value_;
  self->fGnssLeechLocationClient.__ptr_.__value_ = 0LL;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8LL))(v6, a2);
  }
  BOOL v7 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8LL))(v7, a2);
  }
  uint64_t v8 = self->fSignalEnvironmentClient.__ptr_.__value_;
  self->fSignalEnvironmentClient.__ptr_.__value_ = 0LL;
  if (v8) {
    (*(void (**)(Client *, SEL))(*(void *)v8 + 8LL))(v8, a2);
  }
  int v9 = self->fWifiClient.__ptr_.__value_;
  self->fWifiClient.__ptr_.__value_ = 0LL;
  if (v9) {
    (*(void (**)(Client *, SEL))(*(void *)v9 + 8LL))(v9, a2);
  }
  uint64_t v10 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v10) {
    (*(void (**)(Client *, SEL))(*(void *)v10 + 8LL))(v10, a2);
  }
  __int16 v11 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0LL;
  if (v11) {
    (*(void (**)(Client *, SEL))(*(void *)v11 + 8LL))(v11, a2);
  }
  uint64_t v12 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0LL;
  if (v12) {
    (*(void (**)(Client *, SEL))(*(void *)v12 + 8LL))(v12, a2);
  }
  __int16 v13 = self->fServiceLocationProvider.__ptr_.__value_;
  self->fServiceLocationProvider.__ptr_.__value_ = 0LL;
  if (v13) {
    (*(void (**)(CLServiceLocationProvider *, SEL))(*(void *)v13 + 8LL))(v13, a2);
  }
  id v14 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0LL;
  if (v14) {
    (*(void (**)(Client *, SEL))(*(void *)v14 + 8LL))(v14, a2);
  }
  sub_100AFB1DC((void ***)&self->fAlsCollector, 0LL);
  BOOL v15 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
  self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0LL;
  if (v15) {
    (*(void (**)(Dispatcher *))(*(void *)v15 + 8LL))(v15);
  }
  uint64_t v16 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0LL;
  if (v16) {
    (*(void (**)(Dispatcher *))(*(void *)v16 + 8LL))(v16);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  return self;
}

@end