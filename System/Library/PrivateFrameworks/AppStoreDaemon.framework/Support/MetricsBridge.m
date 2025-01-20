@interface MetricsBridge
+ (id)metricsFieldsFrom:(id)a3 taskMetrics:(id)a4 error:(id)a5 session:(id)a6;
+ (id)metricsFieldsFromResult:(id)a3;
+ (void)enqueueAppInstallationEventWithEvent:(id)a3;
- (_TtC9appstored13MetricsBridge)init;
@end

@implementation MetricsBridge

+ (void)enqueueAppInstallationEventWithEvent:(id)a3
{
  id v4 = a3;
  sub_10004DEAC(a3);
}

+ (id)metricsFieldsFromResult:(id)a3
{
  id v3 = a3;
  id v4 = sub_10004E650(v3);

  if (v4)
  {
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.isa = 0LL;
  }

  return v5.super.isa;
}

+ (id)metricsFieldsFrom:(id)a3 taskMetrics:(id)a4 error:(id)a5 session:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  sub_10004EC00(v9, a4, (uint64_t)a5, (uint64_t)a6);
  uint64_t v14 = v13;

  if (v14)
  {
    v15.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    v15.super.isa = 0LL;
  }

  return v15.super.isa;
}

- (_TtC9appstored13MetricsBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MetricsBridge();
  return -[MetricsBridge init](&v3, "init");
}

@end