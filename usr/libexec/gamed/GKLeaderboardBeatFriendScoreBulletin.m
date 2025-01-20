@interface GKLeaderboardBeatFriendScoreBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKLeaderboardBeatFriendScoreBulletin)init;
- (GKLeaderboardBeatFriendScoreBulletin)initWithCoder:(id)a3;
- (GKLeaderboardBeatFriendScoreBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKLeaderboardBeatFriendScoreBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)handleAction:(id)a3
{
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  _Block_copy(v6);
  sub_10017A21C(v7, ObjCClassMetadata, (void (**)(void, void))v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v7, v9);
}

- (GKLeaderboardBeatFriendScoreBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_10017AF00(v3);
}

- (GKLeaderboardBeatFriendScoreBulletin)init
{
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_10017AFE8();
}

- (GKLeaderboardBeatFriendScoreBulletin)initWithCoder:(id)a3
{
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_10017B038(a3);
}

@end