@interface BagNotificationListener
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener)init;
- (void)bagChanged:(id)a3;
- (void)dealloc;
@end

@implementation BagNotificationListener

- (void)dealloc
{
  v2 = self;
  sub_100127800();
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener_continuation;
  uint64_t v3 = sub_10007B1FC(&qword_10032C270);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

- (void)bagChanged:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10012796C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D23BagNotificationListener)init
{
}

  ;
}

@end