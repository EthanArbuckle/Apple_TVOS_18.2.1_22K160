@interface UbiquitousKeyValueStoreController
- (void)storeDidChangeExternallyWithNotification:(id)a3;
@end

@implementation UbiquitousKeyValueStoreController

- (void)storeDidChangeExternallyWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  sub_10014EA9C((uint64_t)v8);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end