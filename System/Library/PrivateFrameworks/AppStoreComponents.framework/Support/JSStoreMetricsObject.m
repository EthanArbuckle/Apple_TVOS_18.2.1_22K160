@interface JSStoreMetricsObject
- (_TtC19appstorecomponentsd20JSStoreMetricsObject)init;
- (id)flushUnrecordedEvents;
- (id)recordEvent:(id)a3 :(id)a4;
@end

@implementation JSStoreMetricsObject

- (id)recordEvent:(id)a3 :(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)static JSContext.requiredCurrent.getter();
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v11 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000B8710, v13);

  return v11;
}

- (id)flushUnrecordedEvents
{
  v3 = self;
  v4 = (void *)static JSContext.requiredCurrent.getter();
  v7[2] = v3;
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000B8554, v7);

  return v5;
}

- (_TtC19appstorecomponentsd20JSStoreMetricsObject)init
{
  result = (_TtC19appstorecomponentsd20JSStoreMetricsObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSStoreMetricsObject",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder));
}

@end