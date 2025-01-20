@interface DeviceAppStateDataSource
- (_TtC19appstorecomponentsd24DeviceAppStateDataSource)init;
@end

@implementation DeviceAppStateDataSource

- (_TtC19appstorecomponentsd24DeviceAppStateDataSource)init
{
  result = (_TtC19appstorecomponentsd24DeviceAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.DeviceAppStateDataSource",  44LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_query));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_fetcher));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_availableUpdatesRegistry));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_workQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_expectedAppStates));
  sub_10004C810((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_queryObservation);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19appstorecomponentsd24DeviceAppStateDataSource_onSynchronizeAppStates));
}

@end