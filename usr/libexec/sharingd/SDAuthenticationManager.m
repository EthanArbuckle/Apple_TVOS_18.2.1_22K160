@interface SDAuthenticationManager
+ (_TtC16DaemoniOSLibrary23SDAuthenticationManager)shared;
- (OS_dispatch_queue)queue;
- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)init;
- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)initWithQueue:(id)a3;
- (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_)delegate;
- (void)addAuthenticationStateChangesObserver:(id)a3 identifier:(id)a4;
- (void)authenticateFor:(unint64_t)a3 sessionID:(id)a4 options:(id)a5;
- (void)canAuthenticateFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5;
- (void)cancel:(id)a3;
- (void)disableFor:(unint64_t)a3 idsDeviceID:(id)a4 sessionID:(id)a5;
- (void)enableFor:(unint64_t)a3 deviceID:(id)a4 passcode:(id)a5 sessionID:(id)a6;
- (void)handleDelegateInvalidated;
- (void)listEligibleDevicesFor:(unint64_t)a3 completionHandler:(id)a4;
- (void)registerForApprovalRequestsFor:(unint64_t)a3;
- (void)removeAuthenticationStateChangesObserverFor:(id)a3;
- (void)reportApprovalResultWithAcmToken:(id)a3 error:(id)a4 sessionID:(id)a5;
- (void)requestEnablementFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation SDAuthenticationManager

- (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_)delegate
{
  return (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_delegate, a2);
}

- (void)setDelegate:(id)a3
{
}

+ (_TtC16DaemoniOSLibrary23SDAuthenticationManager)shared
{
  if (qword_100644410 != -1) {
    swift_once(&qword_100644410, sub_10045862C);
  }
  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)(id)qword_100669A30;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_queue));
}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)initWithQueue:(id)a3
{
  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)sub_1004589D0(a3);
}

- (void)start
{
  v2 = self;
  sub_10045EAD0();
}

- (void)listEligibleDevicesFor:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1005E3598, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1005E35C0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100656C20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1005E35E8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100656C30;
  v14[5] = v13;
  v15 = self;
  uint64_t v16 = sub_100480B84((uint64_t)v9, (uint64_t)&unk_100656C40, (uint64_t)v14);
  swift_release(v16);
}

- (void)enableFor:(unint64_t)a3 deviceID:(id)a4 passcode:(id)a5 sessionID:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v17 = self;
  sub_100488EE8(a3, v14, v16);

  __n128 v18 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v11 + 8))(v13, v10, v18);
}

- (void)requestEnablementFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5
{
}

- (void)disableFor:(unint64_t)a3 idsDeviceID:(id)a4 sessionID:(id)a5
{
}

- (void)canAuthenticateFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5
{
}

- (void)authenticateFor:(unint64_t)a3 sessionID:(id)a4 options:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v13 = a5;
  uint64_t v14 = self;
  sub_1004653C0(a3, v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)cancel:(id)a3
{
}

- (void)registerForApprovalRequestsFor:(unint64_t)a3
{
  v3 = self;
  sub_100489164();
}

- (void)reportApprovalResultWithAcmToken:(id)a3 error:(id)a4 sessionID:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = self;
  if (a3)
  {
    id v16 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v18 = v17;
  }

  else
  {
    unint64_t v18 = 0xF000000000000000LL;
  }

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);

  sub_100467DE0((uint64_t)a3, v18, (uint64_t)a4, (uint64_t)v12);
  sub_100189B0C((uint64_t)a3, v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)addAuthenticationStateChangesObserver:(id)a3 identifier:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain(a3);
  uint64_t v11 = self;
  sub_100468AEC((uint64_t)a3, (uint64_t)v10);
  swift_unknownObjectRelease(a3);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)removeAuthenticationStateChangesObserverFor:(id)a3
{
}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)init
{
  result = (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAuthenticationManager",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingLockSessionGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingKeySessionGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_commonContextGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_flowGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_sessionGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lockSessionGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessionInitiatorGenerator]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessionGenerator]);
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_idsService));
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_securityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_transportManager));
  *(void *)&double v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingLockSessions)).n128_u64[0];
  *(void *)&double v4 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingKeySessions),  v3).n128_u64[0];
  *(void *)&double v5 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessions),  v4).n128_u64[0];
  *(void *)&double v6 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lockSessions),  v5).n128_u64[0];
  *(void *)&double v7 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_sessions),  v6).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_sessionAuthTypes),  v7);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_nearbyActionAdvertiser));
  sub_1001A4BC8( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_metrics,  type metadata accessor for StateMetrics);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiator));
  if (*(void *)&self->pairingLockSessionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream]) {
    sub_10018709C((Class *)((char *)&self->super.isa
  }
                          + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_previousUnlockClassCLockDevice,  &qword_100654080);
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_registrationStateByDeviceID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_registrationManager));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lastMacThatDidMacUnlockPhone,  &qword_100654080);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_macUnlockPhoneSessionIDThatNeedsArmingUI,  &qword_10064DA60);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_approveNearbyInfoAdvertiser));
  *(void *)&double v8 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_authenticationStateChangesObservers)).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_requestContinuationsBySessionID),  v8);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_generateAWDLInfo]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_isWifiEnabled]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_isBluetoothEnabled]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_autoUnlockEligibleDevices]);
  swift_release(*(void *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_idsDeviceForUniqueID]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager____lazy_storage___unlockVolumeManager));
}

- (void)handleDelegateInvalidated
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_approveNearbyInfoAdvertiser);
  if (v2)
  {
    double v3 = self;
    swift_retain();
    sub_10021C13C();

    swift_release(v2);
  }

@end