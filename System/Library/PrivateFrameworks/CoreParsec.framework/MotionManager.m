@interface MotionManager
- (void)bagChangeNotification:(id)a3;
@end

@implementation MotionManager

- (void)bagChangeNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end