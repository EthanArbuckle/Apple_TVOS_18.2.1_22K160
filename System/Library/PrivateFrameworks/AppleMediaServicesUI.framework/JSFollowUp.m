@interface JSFollowUp
- (_TtC14amsengagementd10JSFollowUp)init;
- (id)clearFollowUpWithBackingIdentifier:(id)a3;
- (id)clearFollowUpWithIdentifier:(id)a3 :(id)a4;
- (id)pendingFollowUpWithIdentfier:(id)a3 :(id)a4;
- (id)pendingFollowUps:(id)a3;
@end

@implementation JSFollowUp

- (id)clearFollowUpWithBackingIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = self;
  sub_10009708C(v4);
  v7 = v6;

  swift_bridgeObjectRelease();
  return v7;
}

- (id)clearFollowUpWithIdentifier:(id)a3 :(id)a4
{
  return sub_100098884( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t, uint64_t))sub_10009750C);
}

- (id)pendingFollowUpWithIdentfier:(id)a3 :(id)a4
{
  return sub_100098884( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t, uint64_t))sub_100097C98);
}

- (id)pendingFollowUps:(id)a3
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  uint64_t v4 = self;
  sub_100098924();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC14amsengagementd10JSFollowUp)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd10JSFollowUp____lazy_storage___dateFormatter));
}

@end