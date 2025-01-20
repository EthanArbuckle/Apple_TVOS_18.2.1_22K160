@interface SDAirDropNearFieldService
- (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService)init;
- (void)dealloc;
- (void)didDetectDeviceNearbyForNearFieldController:(id)a3;
- (void)handleAirDropAllowedChanged;
- (void)handleBuddyExited;
- (void)handleProximityAppleIDSignInCompleted;
- (void)handleProximityAppleIDSignInStarted;
- (void)handleSystemUIChanged;
- (void)handleWifiStateChanged;
- (void)keyBagLockStateChangeWithNotification:(id)a3;
- (void)nearFieldController:(id)a3 didBeginTransaction:(id)a4;
- (void)nearFieldController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4;
- (void)nearFieldController:(id)a3 didInterruptTransaction:(id)a4 error:(id)a5;
- (void)nearFieldController:(id)a3 didInvalidateWithError:(id)a4;
- (void)nearFieldController:(id)a3 transaction:(id)a4 didReceiveTapEvent:(id)a5;
- (void)screenStateChangedWithNotification:(id)a3;
@end

@implementation SDAirDropNearFieldService

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_notificationCenter);
  v5 = self;
  [v4 removeObserver:v5];
  uint64_t v6 = sub_100183168(0LL, &qword_100646310, &OBJC_CLASS___NSDistributedNotificationCenter_ptr);
  id v7 = [(id)swift_getObjCClassFromMetadata(v6) defaultCenter];
  [v7 removeObserver:v5];

  v8.receiver = v5;
  v8.super_class = ObjectType;
  -[SDAirDropNearFieldService dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_deviceStatus));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearFieldController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbyDiscoveryClientForLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbyDiscoveryLabelForConnectionID));
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_airDropUISessionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_airDropClient));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_processingTap,  (uint64_t *)&unk_1006460C0);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_localExchangePayload,  &qword_1006460B8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_notificationCenter));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService__nearbySharingInteraction;
  uint64_t v4 = sub_100183098(&qword_100646170);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_pendingNearbySharingInteraction,  &qword_100645EE0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_assertionsByNearbySharingInteractionID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_singleBandManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbySharingAssertionTimeoutWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_cancelNearbySharingInteractionWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbySharingAirDropConnectionTimeoutWorkItem));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_activeAirDropTransactionID,  &qword_10064DA60);
}

- (void)keyBagLockStateChangeWithNotification:(id)a3
{
}

- (void)screenStateChangedWithNotification:(id)a3
{
}

- (void)handleAirDropAllowedChanged
{
}

- (void)handleWifiStateChanged
{
}

- (void)handleSystemUIChanged
{
}

- (void)handleBuddyExited
{
}

- (void)handleProximityAppleIDSignInStarted
{
}

- (void)handleProximityAppleIDSignInCompleted
{
}

- (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService)init
{
  result = (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropNearFieldService",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)nearFieldController:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t ObjectType = swift_getObjectType(self);
  uint64_t v8 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  uint64_t v12 = qword_100643F28;
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  id v16 = v14;
  id v17 = v13;
  v18 = v15;
  if (v12 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v19 = static AirDropActor.shared;
  uint64_t v20 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  v21 = (void *)swift_allocObject(&unk_1005D3970, 64LL, 7LL);
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = v16;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = ObjectType;
  swift_retain(v19);
  uint64_t v22 = sub_1001B3978( (uint64_t)v10,  (uint64_t)&unk_100646368,  (uint64_t)v21,  (uint64_t)&unk_1005D37E0,  (uint64_t)&type metadata for () + 8,  (uint64_t)&unk_100649820);

  swift_release(v22);
}

- (void)didDetectDeviceNearbyForNearFieldController:(id)a3
{
  uint64_t v5 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v5);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 1LL, 1LL, v8);
  uint64_t v9 = qword_100643F28;
  v10 = self;
  id v11 = a3;
  if (v9 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v12 = static AirDropActor.shared;
  uint64_t v13 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  uint64_t v14 = swift_allocObject(&unk_1005D3948, 48LL, 7LL);
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = v13;
  *(_BYTE *)(v14 + 32) = 0;
  *(void *)(v14 + 40) = v10;
  swift_retain(v12);
  uint64_t v15 = sub_1001B3978( (uint64_t)v7,  (uint64_t)&unk_100646358,  v14,  (uint64_t)&unk_1005D37E0,  (uint64_t)&type metadata for () + 8,  (uint64_t)&unk_100649820);

  swift_release(v15);
}

- (void)nearFieldController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  uint64_t v7 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v9, 1LL, 1LL, v10);
  uint64_t v11 = qword_100643F28;
  uint64_t v12 = self;
  id v13 = a3;
  if (v11 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v14 = static AirDropActor.shared;
  uint64_t v15 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  uint64_t v16 = swift_allocObject(&unk_1005D3920, 48LL, 7LL);
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  *(_BYTE *)(v16 + 32) = a4;
  *(void *)(v16 + 40) = v12;
  swift_retain(v14);
  uint64_t v17 = sub_1001B3978( (uint64_t)v9,  (uint64_t)&unk_100646350,  v16,  (uint64_t)&unk_1005D37E0,  (uint64_t)&type metadata for () + 8,  (uint64_t)&unk_100649820);

  swift_release(v17);
}

- (void)nearFieldController:(id)a3 didBeginTransaction:(id)a4
{
  id v7 = a3;
  swift_unknownObjectRetain(a4);
  uint64_t v8 = self;
  sub_1001CE318((uint64_t)a4, v8);

  swift_unknownObjectRelease(a4);
}

- (void)nearFieldController:(id)a3 transaction:(id)a4 didReceiveTapEvent:(id)a5
{
  uint64_t v9 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v11, 1LL, 1LL, v12);
  uint64_t v13 = qword_100643F28;
  swift_unknownObjectRetain_n(a4, 2LL);
  id v14 = a5;
  uint64_t v15 = self;
  id v16 = v14;
  uint64_t v17 = v15;
  id v18 = a3;
  if (v13 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v19 = static AirDropActor.shared;
  uint64_t v20 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  v21 = (void *)swift_allocObject(&unk_1005D38D0, 56LL, 7LL);
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = a4;
  v21[5] = v16;
  v21[6] = v17;
  swift_retain(v19);
  uint64_t v22 = sub_1001B3978( (uint64_t)v11,  (uint64_t)&unk_100646340,  (uint64_t)v21,  (uint64_t)&unk_1005D37E0,  (uint64_t)&type metadata for () + 8,  (uint64_t)&unk_100649820);

  swift_unknownObjectRelease(a4);
  swift_release(v22);
}

- (void)nearFieldController:(id)a3 didInterruptTransaction:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v11, 1LL, 1LL, v12);
  uint64_t v13 = qword_100643F28;
  swift_unknownObjectRetain_n(a4, 2LL);
  id v14 = self;
  id v15 = a3;
  id v16 = a5;
  if (v13 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v17 = static AirDropActor.shared;
  uint64_t v18 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  uint64_t v19 = (void *)swift_allocObject(&unk_1005D38A8, 48LL, 7LL);
  v19[2] = v17;
  v19[3] = v18;
  v19[4] = a4;
  v19[5] = v14;
  swift_retain(v17);
  uint64_t v20 = sub_1001B3978( (uint64_t)v11,  (uint64_t)&unk_100646330,  (uint64_t)v19,  (uint64_t)&unk_1005D37E0,  (uint64_t)&type metadata for () + 8,  (uint64_t)&unk_100649820);

  swift_unknownObjectRelease(a4);
  swift_release(v20);
}

@end