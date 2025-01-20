@interface NearbySessionsPendingParticipant
- (BOOL)connected;
- (BOOL)guest;
- (BOOL)hidden;
- (MRUserIdentity)identity;
- (NSString)identifier;
- (_TtC12mediaremoted32NearbySessionsPendingParticipant)init;
- (void)setConnected:(BOOL)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation NearbySessionsPendingParticipant

- (NSString)identifier
{
  v2 = (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identifier;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identifier,  v6,  0LL,  0LL);
  uint64_t v3 = *((void *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identifier);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (MRUserIdentity)identity
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity,  v4,  0LL,  0LL);
  return (MRUserIdentity *)*v2;
}

- (void)setIdentity:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity,  v7,  1LL,  0LL);
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (BOOL)connected
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setConnected:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected,  v5,  1LL,  0LL);
  *uint64_t v4 = a3;
}

- (BOOL)guest
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest, v4, 0LL, 0LL);
  return *v2;
}

- (void)setGuest:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (BOOL)hidden
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden,  v5,  1LL,  0LL);
  *uint64_t v4 = a3;
}

- (_TtC12mediaremoted32NearbySessionsPendingParticipant)init
{
  result = (_TtC12mediaremoted32NearbySessionsPendingParticipant *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.NearbySessionsPendingParticipant",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connectionRequest;
  uint64_t v4 = sub_100156B68(&qword_1003FB640);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end