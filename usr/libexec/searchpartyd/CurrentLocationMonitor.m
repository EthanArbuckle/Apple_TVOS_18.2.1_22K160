@interface CurrentLocationMonitor
- (_TtC12searchpartyd22CurrentLocationMonitor)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation CurrentLocationMonitor

- (_TtC12searchpartyd22CurrentLocationMonitor)init
{
  result = (_TtC12searchpartyd22CurrentLocationMonitor *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.CurrentLocationMonitor",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7 = sub_100022898(0LL, (unint64_t *)&qword_1009A5510, &OBJC_CLASS___CLLocation_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v9 = a3;
  v10 = self;
  sub_1001C4E40(v8);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = static os_log_type_t.error.getter(v8);
  if (qword_10099B1B0 != -1) {
    swift_once(&qword_10099B1B0, sub_1001C4DCC);
  }
  uint64_t v10 = qword_100A2A350;
  uint64_t v11 = sub_100004AEC((uint64_t *)&unk_10099D740);
  uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1007E67D0;
  id v17 = v7;
  swift_errorRetain(v7);
  uint64_t v13 = sub_100004AEC((uint64_t *)&unk_1009A5470);
  uint64_t v14 = String.init<A>(describing:)(&v17, v13);
  uint64_t v16 = v15;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_1000226F4();
  *(void *)(v12 + 32) = v14;
  *(void *)(v12 + 40) = v16;
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "failed with error - %{public}@", 30LL, 2LL, v12);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = self;
  sub_1001C5320(v4);
}

@end