@interface NearbySessionsListenerImplementation
- (BOOL)hasDiscoveredSessionForIdentifier:(id)a3;
- (MRDGroupSessionListenerDelegate)delegate;
- (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation)init;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)requestToJoinDiscoveredSession:(NSString *)a3 completion:(id)a4;
- (void)requestToJoinSession:(MRGroupSessionToken *)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NearbySessionsListenerImplementation

- (MRDGroupSessionListenerDelegate)delegate
{
  return (MRDGroupSessionListenerDelegate *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_delegate));
}

- (void)setDelegate:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_delegate);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_delegate) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (void)dealloc
{
  v2 = self;
  sub_100167534((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_scanner));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_delegate));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_pendingInvitationRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation____lazy_storage___homeObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_lock));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_discoveredAdvertisements));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_notifiedSessions));
}

- (BOOL)hasDiscoveredSessionForIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_100167778(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)requestToJoinDiscoveredSession:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003A3AD8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003A3B00, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1003F8728;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003A3B28, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1003F8730;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10016F5BC((uint64_t)v9, (uint64_t)&unk_1003F8738, (uint64_t)v14);
  swift_release(v17);
}

- (void)requestToJoinSession:(MRGroupSessionToken *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003A3A38, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003A3A60, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1003F86E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003A3A88, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1003F86F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10016F5BC((uint64_t)v9, (uint64_t)&unk_1003F8708, (uint64_t)v14);
  swift_release(v17);
}

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10016EEF0(a3);
}

- (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation)init
{
  result = (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation *)_swift_stdlib_reportUnimplementedInitializer("mediaremoted.NearbySessionsListenerImplementation", 49LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

@end