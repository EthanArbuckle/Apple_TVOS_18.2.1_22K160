@interface SDAirDropBonjourBrowser
- (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser)init;
- (void)wirelessBluetoothStateChangedWithNotification:(id)a3;
@end

@implementation SDAirDropBonjourBrowser

- (void)wirelessBluetoothStateChangedWithNotification:(id)a3
{
  uint64_t v5 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Notification(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v7, 1LL, 1LL, v12);
  uint64_t v13 = qword_100643F28;
  v14 = self;
  if (v13 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v15 = static AirDropActor.shared;
  uint64_t v16 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  v17 = (void *)swift_allocObject(&unk_1005DB940, 40LL, 7LL);
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = v14;
  swift_retain(v15);
  uint64_t v18 = sub_1001B37E8((uint64_t)v7, (uint64_t)&unk_10064F0A0, (uint64_t)v17);

  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropBonjourBrowser",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_browserQueue));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_browser));

  *(void *)&double v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToBrowseResult)).n128_u64[0];
  *(void *)&double v4 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToRetryCount),  v3).n128_u64[0];
  *(void *)&double v5 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToCurrentDiscoverConnections),  v4).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToAirDropEndpoints),  v5);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesNeedingDiscovery));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_sessionLogger));
  swift_release(*(void *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_endpointsUpdateHandler]);
}

@end