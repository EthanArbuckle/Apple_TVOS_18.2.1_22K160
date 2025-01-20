@interface CLLocationMulticlientStreamer
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)emergencyEnablementAssertionActive;
- (BOOL)isClientActivityTypeAirborneActive;
- (BOOL)isClientActivityTypeFitnessActive;
- (CLLocationMulticlientStreamer)init;
- (NSMutableSet)activeStreamingClients;
- (RPCompanionLinkClient)rapportDiscoveryLink;
- (RPCompanionLinkClient)rapportStreamingLink;
- (id).cxx_construct;
- (int)currentGranularity;
- (void)activateRapportLinkIfNecessary;
- (void)beginService;
- (void)endService;
- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4;
- (void)registerRequestHandlers;
- (void)setActiveStreamingClients:(id)a3;
- (void)setClientActivityTypeAirborneActive:(BOOL)a3;
- (void)setClientActivityTypeFitnessActive:(BOOL)a3;
- (void)setCurrentGranularity:(int)a3;
- (void)setEmergencyEnablementAssertionActive:(BOOL)a3;
- (void)setRapportDiscoveryLink:(id)a3;
- (void)setRapportStreamingLink:(id)a3;
- (void)stopLocation;
- (void)toggleLocationUpdates:(BOOL)a3 inFitnessSession:(BOOL)a4 inAirborneSession:(BOOL)a5 emergencyEnablementAssertionActive:(BOOL)a6;
@end

@implementation CLLocationMulticlientStreamer

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F928 != -1) {
    dispatch_once(&qword_10199F928, &stru_1018906A8);
  }
  return (id)qword_10199F920;
}

+ (BOOL)isSupported
{
  if (qword_10199F930 != -1) {
    dispatch_once(&qword_10199F930, &stru_1018906C8);
  }
  return 0;
}

- (CLLocationMulticlientStreamer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationMulticlientStreamer;
  return -[CLLocationMulticlientStreamer initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationMulticlientStreamerServiceProtocol,  &OBJC_PROTOCOL___CLLocationMulticlientStreamerClientProtocol);
}

- (void)beginService
{
  id v3 = objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_100FA0C80;
  v11 = &unk_10181A288;
  v12 = self;
  v4 = (uint64_t *)operator new(0x30uLL);
  sub_1010DDBC0(__p, "#Multiclient Active location client on remote device");
  sub_1005D7F38((uint64_t)v4, (__int128 *)__p, v3, (uint64_t)&v8, 30.0);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  sub_1005D5C2C((uint64_t **)&self->_locationAssertion, v4);
  sub_10043AC3C( (uint64_t)sub_100FA0D60,  (uint64_t)self,  -[CLLocationMulticlientStreamer universe](self, "universe", v8, v9, v10, v11, v12),  __p);
  unint64_t v5 = (Client *)__p[0];
  __p[0] = 0LL;
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = v5;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v7 = __p[0];
    __p[0] = 0LL;
    if (v7) {
      (*(void (**)(void *))(*(void *)v7 + 8LL))(v7);
    }
  }

  -[CLLocationMulticlientStreamer activateRapportLinkIfNecessary](self, "activateRapportLinkIfNecessary");
  self->_activeStreamingClients = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
}

- (void)endService
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  sub_1005D5C2C((uint64_t **)&self->_locationAssertion, 0LL);
  -[RPCompanionLinkClient invalidate]( -[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"),  "invalidate");
  -[CLLocationMulticlientStreamer setRapportStreamingLink:](self, "setRapportStreamingLink:", 0LL);
  -[RPCompanionLinkClient invalidate]( -[CLLocationMulticlientStreamer rapportDiscoveryLink](self, "rapportDiscoveryLink"),  "invalidate");
  -[CLLocationMulticlientStreamer setRapportDiscoveryLink:](self, "setRapportDiscoveryLink:", 0LL);
}

- (void)setEmergencyEnablementAssertionActive:(BOOL)a3
{
  if (self->_emergencyEnablementAssertionActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101890770);
    }
    unint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 1026;
      BOOL v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient #CLEEA change, needed:%{public}hhd}",  (uint8_t *)v6,  0x18u);
    }

    objc_msgSend( objc_msgSend( objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLClientManager"),  "markClientEmergencyEnablementTransition:",  v3);
    self->_emergencyEnablementAssertionActive = v3;
  }

- (void)setClientActivityTypeFitnessActive:(BOOL)a3
{
  if (self->_clientActivityTypeFitnessActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101890770);
    }
    unint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient Setting fitness activity type, state:%{public}hhd}",  (uint8_t *)v9,  0x18u);
    }

    self->_clientActivityTypeFitnessActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:28 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:28];
    }
  }

- (void)setClientActivityTypeAirborneActive:(BOOL)a3
{
  if (self->_clientActivityTypeAirborneActive != a3)
  {
    BOOL v3 = a3;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101890770);
    }
    unint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient Setting airborne activity type, state:%{public}hhd}",  (uint8_t *)v9,  0x18u);
    }

    self->_clientActivityTypeAirborneActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:29 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:29];
    }
  }

- (void)toggleLocationUpdates:(BOOL)a3 inFitnessSession:(BOOL)a4 inAirborneSession:(BOOL)a5 emergencyEnablementAssertionActive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101890770);
  }
  v11 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68290050;
    v12[1] = 0;
    __int16 v13 = 2082;
    char v14 = "";
    __int16 v15 = 1026;
    BOOL v16 = v9;
    __int16 v17 = 1026;
    BOOL v18 = v8;
    __int16 v19 = 1026;
    BOOL v20 = v7;
    __int16 v21 = 1026;
    BOOL v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient toggling streaming, state:%{public}hhd, fitness:%{public}hhd, airb orne:%{public}hhd, emergency:%{public}hhd}",  (uint8_t *)v12,  0x2Au);
  }

  if (v9)
  {
    -[CLLocationMulticlientStreamer setClientActivityTypeFitnessActive:]( self,  "setClientActivityTypeFitnessActive:",  -[CLLocationMulticlientStreamer isClientActivityTypeFitnessActive]( self,  "isClientActivityTypeFitnessActive") | v8);
    -[CLLocationMulticlientStreamer setClientActivityTypeAirborneActive:]( self,  "setClientActivityTypeAirborneActive:",  -[CLLocationMulticlientStreamer isClientActivityTypeAirborneActive]( self,  "isClientActivityTypeAirborneActive") | v7);
    -[CLLocationMulticlientStreamer setEmergencyEnablementAssertionActive:]( self,  "setEmergencyEnablementAssertionActive:",  -[CLLocationMulticlientStreamer emergencyEnablementAssertionActive]( self,  "emergencyEnablementAssertionActive") | v6);
    if (!-[NSMutableSet count]( -[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"),  "count")) {
      [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
    }
  }

  else
  {
    -[CLLocationMulticlientStreamer stopLocation](self, "stopLocation");
  }

- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4
{
  if (*a3 > 2u)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101890770);
    }
    __int16 v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *a3;
      uint64_t buf = 68289282LL;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2050;
      uint64_t v32 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#Multiclient Unexpected notification, notification:%{public, location:CLLocationPro vider_Type::Notification}lld}",  (uint8_t *)&buf,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101890770);
      }
    }

    __int16 v12 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      uint64_t v13 = *a3;
      uint64_t buf = 68289282LL;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2050;
      uint64_t v32 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Multiclient Unexpected notification",  "{msg%{public}.0s:#Multiclient Unexpected notification, notification:%{public, location:CLLocationPro vider_Type::Notification}lld}",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  else if (-[NSMutableSet count]( -[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"),  "count"))
  {
    double v7 = *((double *)a4 + 11);
    if (v7 <= 0.0)
    {
      double v9 = 15.0;
    }

    else
    {
      double v8 = v7 + *(double *)((char *)a4 + 76);
      double v9 = v8 - CFAbsoluteTimeGetCurrent();
    }

    if (v9 <= 0.0)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101890770);
      }
      BOOL v22 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)((char *)a4 + 76);
        uint64_t v24 = *((void *)a4 + 11);
        uint64_t buf = 68289538LL;
        __int16 v29 = 2082;
        v30 = "";
        __int16 v31 = 2050;
        uint64_t v32 = v23;
        __int16 v33 = 2050;
        uint64_t v34 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient Dropping location due to expiration, timestamp:%{public}f, lif espan:%{public}f}",  (uint8_t *)&buf,  0x26u);
      }
    }

    else
    {
      char v14 =  -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
      __int16 v15 = objc_alloc(&OBJC_CLASS___CLLocation);
      __int128 v16 = *((_OWORD *)a4 + 7);
      v26[6] = *((_OWORD *)a4 + 6);
      v26[7] = v16;
      v27[0] = *((_OWORD *)a4 + 8);
      *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)((char *)a4 + 140);
      __int128 v17 = *((_OWORD *)a4 + 3);
      v26[2] = *((_OWORD *)a4 + 2);
      v26[3] = v17;
      __int128 v18 = *((_OWORD *)a4 + 5);
      v26[4] = *((_OWORD *)a4 + 4);
      v26[5] = v18;
      __int128 v19 = *((_OWORD *)a4 + 1);
      v26[0] = *(_OWORD *)a4;
      v26[1] = v19;
      -[NSKeyedArchiver encodeObject:forKey:]( v14,  "encodeObject:forKey:",  -[CLLocation initWithClientLocation:](v15, "initWithClientLocation:", v26),  @"kCLLocationStreamingMessageLocationKey");
      BOOL v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[NSKeyedArchiver encodedData](v14, "encodedData"),  @"kCLLocationStreamingMessageLocationKey");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[CLStreamedLocationPrivate data](  -[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]( objc_alloc(&OBJC_CLASS___CLStreamedLocationPrivate),  "initWithDaemonLocationPrivate:",  (char *)a4 + 160),  "data"),  @"kCLLocationStreamingMessageLocationPrivateKey");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  -[CLStreamedLocationInternal data](  -[CLStreamedLocationInternal initWithDaemonLocation:]( objc_alloc(&OBJC_CLASS___CLStreamedLocationInternal),  "initWithDaemonLocation:",  a4),  "data"),  @"kCLLocationStreamingMessageLocationInternalKey");
      __int16 v21 = -[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink");
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100FA1738;
      v25[3] = &unk_101830628;
      v25[4] = self;
      -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( v21,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.locationd.rapport.stream-event",  v20,  RPDestinationIdentifierInterestedPeers,  0LL,  v25);
    }
  }

- (void)registerRequestHandlers
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101890770);
  }
  BOOL v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    __int128 v16 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Multiclient registering request handlers}",  buf,  0x12u);
  }

  rapportDiscoveryLink = self->_rapportDiscoveryLink;
  uint64_t v5 = RPOptionStatusFlags;
  uint64_t v11 = RPOptionStatusFlags;
  __int16 v12 = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 532482LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100FA1B7C;
  v8[3] = &unk_1018906F0;
  v8[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:]( rapportDiscoveryLink,  "registerRequestID:options:handler:",  @"com.apple.locationd.rapport.availability-interest",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL),  v8);
  BOOL v6 = self->_rapportDiscoveryLink;
  v9[1] = v5;
  v10[0] = &__kCFBooleanTrue;
  v9[0] = RPOptionInterest;
  v10[1] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 532482LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100FA1D88;
  v7[3] = &unk_1018906F0;
  v7[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:]( v6,  "registerRequestID:options:handler:",  @"com.apple.locationd.rapport.stream-request",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL),  v7);
}

- (void)activateRapportLinkIfNecessary
{
  if (!self->_rapportDiscoveryLink)
  {
    self->_rapportDiscoveryLink = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:]( self->_rapportDiscoveryLink,  "setDispatchQueue:",  objc_msgSend(objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo"), "queue"));
    -[RPCompanionLinkClient setControlFlags:](self->_rapportDiscoveryLink, "setControlFlags:", 2LL);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100FA22E0;
    v4[3] = &unk_101830650;
    v4[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_rapportDiscoveryLink, "setDeviceLostHandler:", v4);
    -[RPCompanionLinkClient setDeviceFoundHandler:]( self->_rapportDiscoveryLink,  "setDeviceFoundHandler:",  &stru_101890710);
    -[CLLocationMulticlientStreamer registerRequestHandlers](self, "registerRequestHandlers");
    -[RPCompanionLinkClient activateWithCompletion:]( self->_rapportDiscoveryLink,  "activateWithCompletion:",  &stru_101890730);
  }

  if (!-[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"))
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    self->_rapportStreamingLink = v3;
    if (v3)
    {
      -[RPCompanionLinkClient setDispatchQueue:]( self->_rapportStreamingLink,  "setDispatchQueue:",  objc_msgSend(objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo"), "queue"));
      -[RPCompanionLinkClient setControlFlags:](self->_rapportStreamingLink, "setControlFlags:", 2LL);
      -[RPCompanionLinkClient activateWithCompletion:]( -[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"),  "activateWithCompletion:",  &stru_101890750);
    }
  }

- (void)stopLocation
{
  value = self->_locationAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v4 = *(void *)value;
  *(void *)value = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101890770);
  }
  uint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    double v8 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Multiclient Shut down location streaming}",  (uint8_t *)v6,  0x12u);
  }

- (int)currentGranularity
{
  return self->_currentGranularity;
}

- (void)setCurrentGranularity:(int)a3
{
  self->_currentGranularity = a3;
}

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (RPCompanionLinkClient)rapportDiscoveryLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRapportDiscoveryLink:(id)a3
{
}

- (NSMutableSet)activeStreamingClients
{
  return self->_activeStreamingClients;
}

- (void)setActiveStreamingClients:(id)a3
{
}

- (RPCompanionLinkClient)rapportStreamingLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRapportStreamingLink:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end