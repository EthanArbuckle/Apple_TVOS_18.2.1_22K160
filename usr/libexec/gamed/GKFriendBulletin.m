@interface GKFriendBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKFriendBulletin)init;
- (GKFriendBulletin)initWithCoder:(id)a3;
- (GKFriendBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKFriendBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  _Block_copy(v6);
  sub_10014521C(v7, ObjCClassMetadata, (void (**)(void, void))v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v7, v9);
}

- (void)handleAction:(id)a3
{
  uint64_t v5 = v4;
  uint64_t v7 = self;
  sub_100146BA0();
  swift_bridgeObjectRelease(v5, v6);
}

- (GKFriendBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return (GKFriendBulletin *)sub_100147BDC(v3);
}

- (GKFriendBulletin)init
{
  return (GKFriendBulletin *)sub_100147CBC();
}

- (GKFriendBulletin)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GKFriendBulletin *)sub_100147D0C();
}

@end