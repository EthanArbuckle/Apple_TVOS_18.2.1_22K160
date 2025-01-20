@interface LocationManager
- (_TtC7parsecd15LocationManager)init;
- (void)bagChangeNotification:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)performedSearchNotification:(id)a3;
- (void)updateCountryCode:(id)a3;
- (void)updateMapsClientMetadata:(id)a3;
@end

@implementation LocationManager

- (void)dealloc
{
  v2 = self;
  sub_100043F30();
}

- (void).cxx_destruct
{
}

- (void)bagChangeNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10004442C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)performedSearchNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100044C90();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)updateMapsClientMetadata:(id)a3
{
}

- (void)updateCountryCode:(id)a3
{
}

- (_TtC7parsecd15LocationManager)init
{
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v7 = sub_100046FD8();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v8 = a3;
  v9 = self;
  sub_100046870();

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  unint64_t v7 = self;
  sub_1000468E0((uint64_t)v7, a4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  unint64_t v7 = self;
  sub_100046B2C();
}

@end