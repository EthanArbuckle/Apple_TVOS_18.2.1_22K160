@interface ASDDeviceAppFetcher.QueryObservation
- (NSString)description;
- (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation ASDDeviceAppFetcher.QueryObservation

- (NSString)description
{
  v2 = self;
  sub_100075CF8();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  uint64_t v7 = sub_10002A030(0LL, (unint64_t *)&unk_10013DBC0, &OBJC_CLASS___ASDApp_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  uint64_t v9 = *(void *)&self->taskScheduler[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler
                                     + 8];
  uint64_t v10 = *(void *)&self->taskScheduler[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler
                                      + 16];
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler),  v9);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_observer);
  uint64_t v11 = *(void *)&self->appQuery[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_observer];
  v13 = (void *)swift_allocObject(&unk_100121DF0, 40LL, 7LL);
  v13[2] = v12;
  v13[3] = v11;
  v13[4] = v8;
  id v14 = a3;
  v15 = self;
  swift_retain(v11);
  swift_bridgeObjectRetain(v8);
  dispatch thunk of TaskScheduler.schedule(task:)(sub_100076B28, v13, v9, v10);

  swift_bridgeObjectRelease(v8);
  swift_release(v13);
}

- (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation)init
{
  result = (_TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation *)_swift_stdlib_reportUnimplementedInitializer("appstorecomponentsd.QueryObservation", 36LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_appQuery));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_taskScheduler));
  swift_release(*(void *)&self->appQuery[OBJC_IVAR____TtCV19appstorecomponentsd19ASDDeviceAppFetcherP33_602223BA61A39827BF84AE6E0E050E1316QueryObservation_observer]);
}

@end