@interface MRDGroupSessionDiscoverySession
- (MRDGroupSession)session;
- (NSArray)availableOutputDevices;
- (NSString)description;
- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)init;
- (id)addOutputDevicesChangedCallback:(id)a3;
- (void)handleGroupSessionServerStart:(id)a3;
- (void)handleGroupSessionServerStop:(id)a3;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)removeOutputDevicesChangedCallback:(id)a3;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
@end

@implementation MRDGroupSessionDiscoverySession

- (NSArray)availableOutputDevices
{
  v2 = self;
  sub_100156B68(&qword_1003F8268);
  sub_100236804((void (*)(void))sub_100160CF8);

  sub_100162954();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (MRDGroupSession)session
{
  v2 = self;
  sub_100156B68(&qword_1003F82D0);
  sub_100236804((void (*)(void))sub_100160DE4);

  return (MRDGroupSession *)v4;
}

- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)init
{
  return (_TtC12mediaremoted31MRDGroupSessionDiscoverySession *)sub_100160DF8();
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v7);
  v11 = &v19[-v10];
  v12 = _Block_copy(a3);
  uint64_t v13 = swift_allocObject(&unk_1003A3870, 24LL, 7LL);
  *(void *)(v13 + 16) = v12;
  v14 = self;
  v15 = _Block_copy(v12);
  UUID.init()(v15);
  v20 = v14;
  v21 = v9;
  v22 = sub_100164920;
  uint64_t v23 = v13;
  sub_100236804((void (*)(void))sub_100164B3C);
  (*(void (**)(void))((swift_isaMask & (uint64_t)v14->super.isa) + 0x88))();
  sub_100162954();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, Class))v12 + 2))(v12, isa);
  swift_bridgeObjectRelease();

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(v11, v9, v5);
  swift_release(v13);
  _Block_release(v12);

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(v9, v11, v5);
  v17 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v5);
  return v17;
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  uint64_t v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_1001613F4((uint64_t)v6);

  sub_1001607E0(v6);
}

- (NSString)description
{
  v2 = self;
  sub_10016166C((uint64_t)v2, v3);

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v7 = self;
  sub_1001619CC(a3, a4);
  swift_unknownObjectRelease(a3);
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  uint64_t v7 = sub_100156B68(&qword_1003FA150);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  swift_unknownObjectRetain(a3);
  v9 = self;
  sub_100161CDC(a3, v8);
  swift_unknownObjectRelease(a3);

  swift_bridgeObjectRelease();
}

- (void)handleGroupSessionServerStart:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  sub_100164554((uint64_t)v6, v5);
}

- (void)handleGroupSessionServerStop:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  sub_10016471C((uint64_t)v6, v5);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremoted31MRDGroupSessionDiscoverySession_lock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12mediaremoted31MRDGroupSessionDiscoverySession_callbacks));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12mediaremoted31MRDGroupSessionDiscoverySession__session));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12mediaremoted31MRDGroupSessionDiscoverySession__outputDevices));
}

@end