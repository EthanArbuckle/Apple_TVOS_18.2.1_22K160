@interface CLClientManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasAuthorizedClients;
- (BOOL)syncgetIsMapsANonSystemLocationClient;
- (BOOL)syncgetSetLocationServicesEnabledStatically:(BOOL)a3 withEventSource:(id)a4;
- (CLClientManagerAdapter)init;
- (double)syncgetAndSetOrChangeAppClipAuthorizationTime:(double)a3 forClient:(id)a4;
- (id)syncgetApplyArchivedAuthorizationDecisionsAndDie:(id)a3 unlessTokenMatches:(id)a4;
- (id)syncgetArchivedAuthorizationDecisions;
- (id)syncgetCopyClients;
- (id)syncgetLocationClientKeys;
- (id)syncgetNonSystemLocationClientKey;
- (id)syncgetNonSystemLocationClientKeys;
- (id)syncgetTemporaryAuthorizationStatusForClient:(id)a3;
- (int)syncgetClientEffectiveRegistrationResultWithTransientAwareness:(id)a3;
- (int)syncgetRegistrationResultToAuthorizationStatus:(int)a3;
- (void)adaptee;
- (void)appLaunchedByAppLifecycleManager:(id)a3;
- (void)appsWithClientKeysAreInstalledOnAPairedDevice:(id)a3;
- (void)beginService;
- (void)calculateCheeseCoverage:(id)a3 interestInterval:(id)a4 withOptions:(id)a5 lookbackWindowStartDate:(id)a6 withReply:(id)a7;
- (void)checkAppInstallationStatus;
- (void)checkWeakPersistentClientWithIdentifier:(id)a3;
- (void)considerPromptingForTranscriptSession:(id)a3 dictionary:(id)a4 requestType:(int)a5 withReply:(id)a6;
- (void)deleteInterestZoneWithId:(id)a3 registeredForClientKey:(id)a4 withReply:(id)a5;
- (void)dingAllActiveTranscriptSubscriptions;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchClientStaticRegistrationResult:(id)a3 withReply:(id)a4;
- (void)fetchLocationClientKeysWithReply:(id)a3;
- (void)getClientManagerInternalStateWithReply:(id)a3;
- (void)getIncidentalUseModeForClient:(id)a3 withReply:(id)a4;
- (void)handleProvisionalIntermediationForService:(unint64_t)a3 forClientKey:(id)a4 at:(id)a5 withReply:(id)a6;
- (void)inUseAssertionInvalidatedDueToWatchConnectivityForClientKey:(id)a3;
- (void)markClientEmergencyEnablementTransition:(BOOL)a3;
- (void)markClientEmergencyEnablementTransition:(BOOL)a3 shouldOverrideDeauthorization:(BOOL)a4 forBeneficiary:(id)a5;
- (void)markClientTemporaryAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4 andAuditToken:(id *)a5 byLocationButton:(BOOL)a6 voiceInteractionEnabled:(BOOL)a7;
- (void)markReceivingLocationInformation:(id)a3;
- (void)markTemporaryPreciseAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4;
- (void)onCapabilityChange;
- (void)performMigrationWithReply:(id)a3;
- (void)reduceAccuracy:(id)a3 withReply:(id)a4;
- (void)registerCircularInterestZoneForClientKey:(id)a3 withId:(id)a4 latitude:(double)a5 longitude:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 radius:(double)a9 withReply:(id)a10;
- (void)registerPhenolicInterestZoneForClientKey:(id)a3 withId:(id)a4 phenolicLocation:(int)a5 serviceMaskOperator:(int)a6 provenanceType:(int)a7 withReply:(id)a8;
- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4;
- (void)resetClient:(id)a3;
- (void)resetClients;
- (void)resetNotificationConsumedForIdentifier:(id)a3;
- (void)sendMetricForFunctionCallsForClientKey:(id)a3 info:(id)a4;
- (void)setAllowableAuthorizationMask:(unint64_t)a3 forClientKey:(id)a4;
- (void)setClient:(id)a3;
- (void)setClientAuthorization:(id)a3 zoneIdentifier:(id)a4 subIdentityIdentifier:(id)a5 status:(int)a6 correctiveCompensation:(int)a7 mayIncreaseAuth:(BOOL)a8 entity:(id)a9;
- (void)setClientBackgroundIndicator:(id)a3 enabled:(BOOL)a4 entity:(id)a5;
- (void)setClients:(id)a3 locationPushTo:(BOOL)a4;
- (void)setClients:(id)a3 regionOfType:(int)a4 to:(BOOL)a5;
- (void)setClients:(id)a3 significantLocationChangeTo:(BOOL)a4;
- (void)setClients:(id)a3 significantLocationVisitTo:(BOOL)a4;
- (void)setClients:(id)a3 transcriptSessionChangeTo:(BOOL)a4;
- (void)setIncidentalUseMode:(int)a3 forClient:(id)a4;
- (void)setLastLocationSettingsEventSource:(id)a3;
- (void)setLocationButtonUseMode:(int)a3 forClient:(id)a4;
- (void)setProvisionalAuthorization:(id)a3;
- (void)setPurpose:(id)a3 forClient:(id)a4;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5 withReply:(id)a6;
- (void)setTemporaryAuthorizationStatusInfoForClient:(id)a3 data:(id)a4;
- (void)takeInUseAssertionForClientKey:(id)a3 reason:(id)a4 assertionLevel:(int)a5 withReply:(id)a6;
- (void)tearDownLocationAuthPrompt:(id)a3;
- (void)triggerAnalyticsCollect;
- (void)triggerClearAppClipAuthorizationIfNecessary;
- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3;
- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4;
- (void)wakeUpLaunchdManagedClient:(id)a3;
@end

@implementation CLClientManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101996E10 != -1) {
    dispatch_once(&qword_101996E10, &stru_10183FDD0);
  }
  return (id)qword_101996E08;
}

- (CLClientManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLClientManagerAdapter;
  return -[CLClientManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLClientManagerProtocol,  &OBJC_PROTOCOL___CLClientManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    objc_super v3 = (CLClientManagerAdapter *)sub_10123E39C();
    -[CLClientManagerAdapter endService](v3, v4);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)dingAllActiveTranscriptSubscriptions
{
}

- (void)setProvisionalAuthorization:(id)a3
{
  SEL v4 = (__int128 *)sub_10056E164(a3);
  if (v4)
  {
    sub_1011F69B0((char *)__dst, v4);
    id v5 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v21 < 0) {
      operator delete(__p);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(v10);
    }
    if (v9 < 0) {
      operator delete(__dst[0]);
    }
    v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    id v7 = sub_1005486B8((uint64_t)v6, (uint64_t)v5);
    sub_10057D7A4((uint64_t)v6, (uint64_t)v7, 0, 0);
  }

- (void)setClients:(id)a3 regionOfType:(int)a4 to:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (__int128 *)sub_10056E164(a3);
  if (v8)
  {
    sub_1011F69B0((char *)__dst, v8);
    id v9 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    sub_10054BBA4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v9, a4, v5);
  }

- (void)setClients:(id)a3 significantLocationChangeTo:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__int128 *)sub_10056E164(a3);
  if (v6)
  {
    sub_1011F69B0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    double Current = CFAbsoluteTimeGetCurrent();
    sub_10056CADC((uint64_t)v8, (uint64_t)v7, 3LL, v4, 0, 0, Current);
  }

- (void)setClients:(id)a3 transcriptSessionChangeTo:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__int128 *)sub_10056E164(a3);
  if (v6)
  {
    sub_1011F69B0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    double Current = CFAbsoluteTimeGetCurrent();
    sub_10056CADC((uint64_t)v8, (uint64_t)v7, 16LL, v4, 0, 0, Current);
  }

- (void)setClients:(id)a3 significantLocationVisitTo:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__int128 *)sub_10056E164(a3);
  if (v6)
  {
    sub_1011F69B0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    double Current = CFAbsoluteTimeGetCurrent();
    sub_10056CADC((uint64_t)v8, (uint64_t)v7, 6LL, v4, 0, 0, Current);
  }

- (void)setClients:(id)a3 locationPushTo:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__int128 *)sub_10056E164(a3);
  if (v6)
  {
    sub_1011F69B0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    double Current = CFAbsoluteTimeGetCurrent();
    sub_10056CADC((uint64_t)v8, (uint64_t)v7, 15LL, v4, 0, 0, Current);
  }

- (void)considerPromptingForTranscriptSession:(id)a3 dictionary:(id)a4 requestType:(int)a5 withReply:(id)a6
{
}

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  *((_DWORD *)-[CLClientManagerAdapter adaptee](self, "adaptee") + 78) = a3;
}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  v6[20] = CLLocationCoordinate2DMake(a3, a4);
}

- (void)markClientTemporaryAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4 andAuditToken:(id *)a5 byLocationButton:(BOOL)a6 voiceInteractionEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a3;
  char v11 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithLegacyClientKey:",  a4);
  v12 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_100552430((uint64_t)v12, (uint64_t)v11, v13, v9, v8, v7);
}

- (void)markTemporaryPreciseAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4
{
}

- (void)tearDownLocationAuthPrompt:(id)a3
{
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3
{
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3 shouldOverrideDeauthorization:(BOOL)a4 forBeneficiary:(id)a5
{
  BOOL v6 = a4;
  unsigned int v7 = a3;
  else {
    BOOL v9 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithLegacyClientKey:",  a5);
  }
  sub_100552A20((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v7, v6, (uint64_t)v9);
}

- (void)takeInUseAssertionForClientKey:(id)a3 reason:(id)a4 assertionLevel:(int)a5 withReply:(id)a6
{
  id v10 = sub_1005486B8( (uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"),  (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithLegacyClientKey:",  a3));
  char v11 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, (char *)[a4 UTF8String]);
  sub_10054C948((uint64_t)v11, (uint64_t)v10, &__p, a5, v14);
  v12 = sub_10056EA44((__int128 *)v14);
  sub_1008FDB5C(v14);
  (*((void (**)(id, CLCppContainer *))a6 + 2))(a6, v12);
}

- (void)inUseAssertionInvalidatedDueToWatchConnectivityForClientKey:(id)a3
{
}

- (void)reduceAccuracy:(id)a3 withReply:(id)a4
{
  BOOL v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  if (a3) {
    [a3 clientLocation];
  }
  else {
    memset(v7, 0, 156);
  }
  sub_10055785C((uint64_t)v6, v7, (uint64_t)a4);
}

- (void)markReceivingLocationInformation:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v5);
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
  sub_10055AF98((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4, 0LL, 0);
}

- (void)onCapabilityChange
{
  v2 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  objc_super v3 = (void *)v2[17];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10057E5F4;
  v4[3] = &unk_10183F8B0;
  v4[4] = v2;
  [v3 iterateAllAnchorKeyPathsWithBlock:v4];
}

- (void)wakeUpLaunchdManagedClient:(id)a3
{
  id v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4) {
  sub_100559A98((uint64_t)v4, (uint64_t *)__p);
  }
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

- (void)appLaunchedByAppLifecycleManager:(id)a3
{
}

- (void)performMigrationWithReply:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)resetNotificationConsumedForIdentifier:(id)a3
{
}

- (void)setClientBackgroundIndicator:(id)a3 enabled:(BOOL)a4 entity:(id)a5
{
  BOOL v6 = a4;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  id v8 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v10);
  if (v23 < 0) {
    operator delete(__p);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  BOOL v9 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  [a5 UTF8String];
  sub_10056F80C((uint64_t)v9, (uint64_t)v8, v6);
}

- (void)setClientAuthorization:(id)a3 zoneIdentifier:(id)a4 subIdentityIdentifier:(id)a5 status:(int)a6 correctiveCompensation:(int)a7 mayIncreaseAuth:(BOOL)a8 entity:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v20, a3, a2);
  id v15 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v20);
  if (v33 < 0) {
    operator delete(__p);
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
    operator delete(v24);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    if (a5) {
      id v16 = a5;
    }
    else {
      id v16 = a4;
    }
    if (a5) {
      uint64_t v17 = 119LL;
    }
    else {
      uint64_t v17 = 122LL;
    }
    id v15 = [v15 clientKeyPathWithReplacementSubIdentityId:v16 subIdentityType:v17];
  }

  char v18 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  [a9 UTF8String];
  sub_10056AF30((uint64_t)v18, (uint64_t)v15, a6, v10, v19, v9, 1);
}

- (void)setLastLocationSettingsEventSource:(id)a3
{
  id v4 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__str, (char *)[a3 UTF8String]);
  std::string::operator=(v4 + 37, &__str);
}

- (void)sendMetricForFunctionCallsForClientKey:(id)a3 info:(id)a4
{
}

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4
{
}

- (void)resetClient:(id)a3
{
}

- (void)resetClients
{
}

- (void)setClient:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  BOOL v5 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  id v6 = sub_1005486B8((uint64_t)v5, (uint64_t)v4);
  sub_100564EF4((uint64_t)v5, v6, 1);
}

- (void)setPurpose:(id)a3 forClient:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_10056FE74((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a3);
}

- (BOOL)syncgetSetLocationServicesEnabledStatically:(BOOL)a3 withEventSource:(id)a4
{
  id v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100545D74((uint64_t)v6, a3, (uint64_t *)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)checkAppInstallationStatus
{
}

- (void)appsWithClientKeysAreInstalledOnAPairedDevice:(id)a3
{
}

- (void)setAllowableAuthorizationMask:(unint64_t)a3 forClientKey:(id)a4
{
}

- (id)syncgetCopyClients
{
  v2 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  return sub_1005705D0((uint64_t)v2, v3, 0);
}

- (id)syncgetLocationClientKeys
{
  return sub_100570D10((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)fetchLocationClientKeysWithReply:(id)a3
{
  id v4 = sub_100570D10((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, NSMutableSet *))a3 + 2))(a3, v4);
}

- (id)syncgetNonSystemLocationClientKeys
{
  return sub_100570E1C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (id)syncgetNonSystemLocationClientKey
{
  if (sub_100570F78((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), &__p))
  {
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)fetchClientStaticRegistrationResult:(id)a3 withReply:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v8);
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8[0]);
  }
  id v7 = sub_1005466E8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6);
  if (a4) {
    (*((void (**)(id, id))a4 + 2))(a4, v7);
  }
}

- (int)syncgetClientEffectiveRegistrationResultWithTransientAwareness:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v6);
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  return sub_100546C80((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4);
}

- (int)syncgetRegistrationResultToAuthorizationStatus:(int)a3
{
  int v4 = a3;
  return sub_100571348((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), &v4);
}

- (void)getIncidentalUseModeForClient:(id)a3 withReply:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_10054E020((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a4);
}

- (void)registerCircularInterestZoneForClientKey:(id)a3 withId:(id)a4 latitude:(double)a5 longitude:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 radius:(double)a9 withReply:(id)a10
{
  char v18 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v21, (char *)[a3 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100571764((uint64_t)v18, (uint64_t)v21, (uint64_t)__p, 1LL, 0LL, a7, a8, 1, a5, a6, a9, 0, (uint64_t)a10);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v22 < 0) {
    operator delete(v21[0]);
  }
}

- (void)registerPhenolicInterestZoneForClientKey:(id)a3 withId:(id)a4 phenolicLocation:(int)a5 serviceMaskOperator:(int)a6 provenanceType:(int)a7 withReply:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  char v14 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v17, (char *)[a3 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100571764((uint64_t)v14, (uint64_t)v17, (uint64_t)__p, 2LL, v11, a6, a7, 1, -1.0, -1.0, -1.0, 0, (uint64_t)a8);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5 withReply:(id)a6
{
  BOOL v9 = a3;
  char v10 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v13, (char *)[a5 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100572448((uint64_t)v10, (char *)v13, (char *)__p, v9, (uint64_t)a6);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5
{
  BOOL v7 = a3;
  char v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v11, (char *)[a5 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100572448((uint64_t)v8, (char *)v11, (char *)__p, v7, 0LL);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
}

- (void)deleteInterestZoneWithId:(id)a3 registeredForClientKey:(id)a4 withReply:(id)a5
{
  char v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v11, (char *)[a4 UTF8String]);
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  sub_100572A20((uint64_t)v8, (char *)v11, (char *)__p, (uint64_t)a5);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
}

- (void)setIncidentalUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_10054F5AC((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v4, (uint64_t)v6);
}

- (void)setLocationButtonUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_10054F92C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v4, (uint64_t)v6);
}

- (BOOL)syncgetHasAuthorizedClients
{
  return sub_100573060((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetIsMapsANonSystemLocationClient
{
  return sub_100573148( (uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"),  (uint64_t)+[CLClientKeyPath clientKeyPathWithClientAnchor:anchorType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientAnchor:anchorType:",  @"com.apple.Maps",  105LL));
}

- (id)syncgetApplyArchivedAuthorizationDecisionsAndDie:(id)a3 unlessTokenMatches:(id)a4
{
  return sub_10055A4E0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3, a4);
}

- (id)syncgetArchivedAuthorizationDecisions
{
  return sub_10055A100((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)checkWeakPersistentClientWithIdentifier:(id)a3
{
  uint64_t v4 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_10054A694((uint64_t)v4, (uint64_t *)v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)handleProvisionalIntermediationForService:(unint64_t)a3 forClientKey:(id)a4 at:(id)a5 withReply:(id)a6
{
  BOOL v7 = (CLLocation *)a5;
  if (!a5)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___CLLocation);
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    __int128 v23 = xmmword_1012E0070;
    __asm { FMOV            V0.2D, #-1.0 }

    __int128 v24 = _Q0;
    __int128 v25 = _Q0;
    __int128 v26 = _Q0;
    int v20 = 0xFFFF;
    int v27 = 0;
    unint64_t v28 = 0xBFF0000000000000LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    unint64_t v32 = 0xBFF0000000000000LL;
    int v31 = 0;
    int v33 = 0x7FFFFFFF;
    uint64_t v35 = 0LL;
    uint64_t v36 = 0LL;
    uint64_t v34 = 0LL;
    char v37 = 0;
    BOOL v7 = -[CLLocation initWithClientLocation:](v11, "initWithClientLocation:", &v20);
  }

  char v17 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithLegacyClientKey:",  a4);
  char v18 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  if (v7) {
    -[CLLocation clientLocation](v7, "clientLocation");
  }
  else {
    memset(v19, 0, 156);
  }
  sub_10055A77C((uint64_t)v18, a3, (uint64_t)v17, v19, (void (**)(void, void))a6);
}

- (void)setTemporaryAuthorizationStatusInfoForClient:(id)a3 data:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1005734D8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a4);
}

- (id)syncgetTemporaryAuthorizationStatusForClient:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v6);
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  return sub_100574420((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4);
}

- (double)syncgetAndSetOrChangeAppClipAuthorizationTime:(double)a3 forClient:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v8, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:](&OBJC_CLASS___CLClientKeyPath, "clientKeyPathFromName:", v8);
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8[0]);
  }
  sub_100574A24((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v6, a3);
  return -1.0;
}

- (void)triggerClearAppClipAuthorizationIfNecessary
{
}

- (void)triggerAnalyticsCollect
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100560360;
  v2[3] = &unk_101820718;
  v2[4] = -[CLClientManagerAdapter adaptee](self, "adaptee");
  AnalyticsSendEventLazy(@"com.apple.locationd.client.statistics", v2);
}

- (void)calculateCheeseCoverage:(id)a3 interestInterval:(id)a4 withOptions:(id)a5 lookbackWindowStartDate:(id)a6 withReply:(id)a7
{
}

- (void)getClientManagerInternalStateWithReply:(id)a3
{
  id v4 = sub_100560AE8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, id))a3 + 2))(a3, v4);
}

@end