@interface GKLeaderboardChallengeBulletin
+ (BOOL)shouldProcessNotification;
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKLeaderboardChallengeBulletin)init;
- (GKLeaderboardChallengeBulletin)initWithCoder:(id)a3;
- (GKLeaderboardChallengeBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKLeaderboardChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)handleAction:(id)a3
{
  uint64_t v5 = v4;
  v6 = self;
  sub_1001861F0();

  swift_bridgeObjectRelease(v5, v7);
}

+ (BOOL)shouldProcessNotification
{
  return sub_100186478() & 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  _Block_copy(v6);
  sub_10018651C(v7, ObjCClassMetadata, v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v7, v9);
}

- (GKLeaderboardChallengeBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return (GKLeaderboardChallengeBulletin *)sub_1001876A0(v3);
}

- (GKLeaderboardChallengeBulletin)init
{
  return (GKLeaderboardChallengeBulletin *)sub_1001877DC();
}

- (GKLeaderboardChallengeBulletin)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GKLeaderboardChallengeBulletin *)sub_10018782C();
}

@end