@interface CloudKitCoordinator
- (void)accountDidChange:(id)a3;
@end

@implementation CloudKitCoordinator

- (void)accountDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification(0LL, a2);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = swift_retain();
  uint64_t v9 = static os_log_type_t.default.getter(v8);
  if (qword_10099B710 != -1) {
    swift_once(&qword_10099B710, sub_1006511CC);
  }
  os_log(_:dso:log:_:_:)( v9,  &_mh_execute_header,  qword_100A2B020,  "CKAccountChanged notification received",  38LL,  2LL,  _swiftEmptyArrayStorage);
  type metadata accessor for Transaction(0LL);
  static Transaction.named<A>(_:with:)( "com.apple.icloud.searchpartyd.CloudKitCoordinator.AccountDidChange",  66LL,  2LL,  sub_10068A5B8);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end