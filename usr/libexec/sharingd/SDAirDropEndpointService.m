@interface SDAirDropEndpointService
- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)init;
- (id)addClient:(id)a3;
- (id)endpointsChangedHandler;
- (void)nearFieldDidTap;
- (void)removeClientWithToken:(id)a3;
- (void)screenStateChangedWithNotification:(id)a3;
- (void)setEndpointsChangedHandler:(id)a3;
@end

@implementation SDAirDropEndpointService

- (id)endpointsChangedHandler
{
  if (!*(Class *)((char *)&self->super.isa {
  uint64_t v2 = *(void *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler];
  }
  v6[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  uint64_t v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_1002E9B4C;
  v6[3] = &unk_1005D9ED0;
  v3 = _Block_copy(v6);
  uint64_t v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setEndpointsChangedHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v4 = (void *)swift_allocObject(&unk_1005D9EB8, 24LL, 7LL);
    v4[2] = v5;
    v6 = sub_1002FC4D4;
  }

  else
  {
    v6 = 0LL;
  }

  uint64_t v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  uint64_t v8 = *(void *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler];
  *uint64_t v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;
  sub_100224FF8(v9, v8);
}

- (id)addClient:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1002E9EE8(v4);

  return v6;
}

- (void)removeClientWithToken:(id)a3
{
  uint64_t v5 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 1LL, 1LL, v8);
  uint64_t v9 = qword_100643F28;
  id v10 = a3;
  v11 = self;
  id v12 = v10;
  v13 = v11;
  if (v9 != -1) {
    swift_once(&qword_100643F28, sub_100205C24);
  }
  uint64_t v14 = static AirDropActor.shared;
  uint64_t v15 = sub_100183F14( (unint64_t *)&qword_100656410,  (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor,  (uint64_t)&protocol conformance descriptor for AirDropActor);
  v16 = (void *)swift_allocObject(&unk_1005D9DC8, 48LL, 7LL);
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v12;
  v16[5] = v13;
  swift_retain(v14);
  uint64_t v17 = sub_1001B37E8((uint64_t)v7, (uint64_t)&unk_10064DB40, (uint64_t)v16);
  swift_release(v17);
}

- (void)nearFieldDidTap
{
  uint64_t v2 = self;
  sub_1002F8078();
}

- (void)screenStateChangedWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  sub_1002F8174();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)init
{
  result = (_TtC16DaemoniOSLibrary24SDAirDropEndpointService *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropEndpointService",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_applicationServiceBrowser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bonjourBrowser));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_classroomBrowser));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_sessionID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  *(void *)&double v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_allDiscoveredEndpoints)).n128_u64[0];
  *(void *)&double v6 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_allDiscovered),  v5).n128_u64[0];
  *(void *)&double v7 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_browseClientIDs),  v6).n128_u64[0];
  *(void *)&double v8 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_displayableIDs),  v7).n128_u64[0];
  *(void *)&double v9 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_connectableByDisplayableID),  v8).n128_u64[0];
  *(void *)&double v10 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_transferringConnectables),  v9).n128_u64[0];
  *(void *)&double v11 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_receivingDisplayables),  v10).n128_u64[0];
  *(void *)&double v12 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_delegateByConnectableID),  v11).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bonjourDiscoveryContinuations),  v12);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_sessionLogger));
  sub_100224FF8( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler),  *(void *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler]);
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_delegate);
}

@end