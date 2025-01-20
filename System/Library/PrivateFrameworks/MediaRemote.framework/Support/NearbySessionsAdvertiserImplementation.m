@interface NearbySessionsAdvertiserImplementation
- (MRDGroupSessionAdvertiserDelegate)delegate;
- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)init;
- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)initWithDelegate:(id)a3;
- (id)assertPublicAdvertisement;
- (void)beginAdvertising;
- (void)beginProxyAdvertisingWithToken:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)endAdvertising;
- (void)endProxyAdvertising;
- (void)setActiveSession:(id)a3 identity:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NearbySessionsAdvertiserImplementation

- (MRDGroupSessionAdvertiserDelegate)delegate
{
  return (MRDGroupSessionAdvertiserDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)initWithDelegate:(id)a3
{
  return (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation *)sub_100228540((uint64_t)a3, v4);
}

- (void)dealloc
{
  v2 = self;
  sub_1002289D8((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_session));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_advertiser));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_advertisingTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_invitationTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_joinRequestTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_publicAssertion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_logBuffer));
}

- (void)setActiveSession:(id)a3 identity:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_100236388((uint64_t)a3, (uint64_t)v8);
  swift_unknownObjectRelease(a3);
}

- (void)beginAdvertising
{
  uint64_t v3 = self;
  sub_10022A108((uint64_t)v3, v2);
}

- (void)beginProxyAdvertisingWithToken:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10022BFB8(v4, (uint64_t)v5);
}

- (id)assertPublicAdvertisement
{
  id v3 = objc_allocWithZone(&OBJC_CLASS___MRGroupSessionAssertion);
  v9[4] = MRDFastSyncGroupSessionState.rawValue.getter;
  uint64_t v10 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_100157EA8;
  v9[3] = &unk_1003AA6D8;
  id v4 = _Block_copy(v9);
  uint64_t v5 = v10;
  v6 = self;
  swift_release(v5);
  id v7 = [v3 initWithCancellationHandler:v4];
  _Block_release(v4);
  if (v7)
  {

    return v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void)endAdvertising
{
  uint64_t v2 = self;
  sub_10022CE94();
}

- (void)endProxyAdvertising
{
  uint64_t v2 = self;
  sub_10022CEE4();
}

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10023226C(a3);
}

- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)init
{
  id result = (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation *)_swift_stdlib_reportUnimplementedInitializer("mediaremoted.NearbySessionsAdvertiserImplementation", 51LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

@end