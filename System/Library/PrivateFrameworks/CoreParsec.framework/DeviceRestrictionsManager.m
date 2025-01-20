@interface DeviceRestrictionsManager
- (void)accountsDidChange:(id)a3;
- (void)updateDeviceRestrictions:(id)a3;
@end

@implementation DeviceRestrictionsManager

- (void)accountsDidChange:(id)a3
{
  uint64_t v5 = sub_10000941C(&qword_1001D1DE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Notification(0LL);
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v8 = type metadata accessor for Notification(0LL);
    uint64_t v9 = 1LL;
  }

  sub_100009654((uint64_t)v7, v9, 1LL, v8);
  swift_retain(self);
  sub_10002842C((uint64_t)v7);
  swift_release();
  sub_100028CD0((uint64_t)v7, &qword_1001D1DE0);
}

- (void)updateDeviceRestrictions:(id)a3
{
  uint64_t v5 = sub_10000941C(&qword_1001D1DE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Notification(0LL);
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v8 = type metadata accessor for Notification(0LL);
    uint64_t v9 = 1LL;
  }

  sub_100009654((uint64_t)v7, v9, 1LL, v8);
  swift_retain(self);
  sub_1000282FC();
  swift_release();
  sub_100028CD0((uint64_t)v7, &qword_1001D1DE0);
}

@end