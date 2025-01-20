@interface SDAuthenticationTransportNearbyAgent
- (void)handleBLEMessage:(id)a3;
@end

@implementation SDAuthenticationTransportNearbyAgent

- (void)handleBLEMessage:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain();
  sub_1003F2310();
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end