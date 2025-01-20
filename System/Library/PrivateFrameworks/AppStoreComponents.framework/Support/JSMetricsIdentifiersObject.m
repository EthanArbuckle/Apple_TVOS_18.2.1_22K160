@interface JSMetricsIdentifiersObject
- (NSString)currentTopic;
- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)init;
- (id)getIdentifierForContext:(id)a3;
- (id)getIdentifierForContextSync:(id)a3;
- (id)getMetricsFieldsForContexts:(id)a3;
@end

@implementation JSMetricsIdentifiersObject

- (NSString)currentTopic
{
  v2 = self;
  MetricsTopicProvider.currentMetricsTopic.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (id)getIdentifierForContext:(id)a3
{
  return sub_1000ADD9C(self, (uint64_t)a2, a3, (uint64_t)sub_1000AE1CC);
}

- (id)getIdentifierForContextSync:(id)a3
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v10[2] = v5;
  v10[3] = v6;
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000AE1B4, v10);

  return v8;
}

- (id)getMetricsFieldsForContexts:(id)a3
{
  return sub_1000ADD9C(self, (uint64_t)a2, a3, (uint64_t)sub_1000ADF68);
}

- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)init
{
  result = (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSMetricsIdentifiersObject",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore);
  swift_unknownObjectRelease(*(void *)&self->metricsIdStore[OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore]);

  sub_10009D284((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsTopicProvider);
}

@end