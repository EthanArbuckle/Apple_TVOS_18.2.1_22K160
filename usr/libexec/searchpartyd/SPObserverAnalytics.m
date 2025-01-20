@interface SPObserverAnalytics
- (void)meDeviceChangedWithNotification:(id)a3;
@end

@implementation SPObserverAnalytics

- (void)meDeviceChangedWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = *(void *)self->userStatsReporting;
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 40);
    swift_retain();
    swift_retain();
    OSAllocatedUnfairLock.callAsFunction<A>(_:)( sub_10020E2A0,  v9,  v10,  (char *)&type metadata for () + 8,  (char *)&type metadata for () + 8);
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end