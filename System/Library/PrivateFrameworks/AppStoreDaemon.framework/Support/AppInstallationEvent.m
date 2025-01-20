@interface AppInstallationEvent
+ (id)additionalMetricsWithRestoreInstalls:(id)a3;
+ (id)downloadLoadURLEventMetricsOverlayWithInstall:(id)a3;
+ (id)metricsOverlayWithPurchaseInfo:(id)a3;
- (_TtC9appstored20AppInstallationEvent)init;
- (_TtC9appstored20AppInstallationEvent)initWithEntity:(id)a3 package:(id)a4 finalPhase:(int64_t)a5;
@end

@implementation AppInstallationEvent

+ (id)downloadLoadURLEventMetricsOverlayWithInstall:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_100069F44(v3);

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

+ (id)metricsOverlayWithPurchaseInfo:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_10006A38C(v3);

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

+ (id)additionalMetricsWithRestoreInstalls:(id)a3
{
  uint64_t v4 = sub_10001517C(0LL, &qword_10045A020, &off_1003DA0E8);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  uint64_t v6 = sub_10006A7D0(v5);
  swift_bridgeObjectRelease(v5);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (_TtC9appstored20AppInstallationEvent)initWithEntity:(id)a3 package:(id)a4 finalPhase:(int64_t)a5
{
  return (_TtC9appstored20AppInstallationEvent *)sub_10006B174(a3, a4);
}

- (_TtC9appstored20AppInstallationEvent)init
{
  result = (_TtC9appstored20AppInstallationEvent *)_swift_stdlib_reportUnimplementedInitializer( "appstored.AppInstallationEvent",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_supplementalFields));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_identifierResetIntervalBagKey));
  swift_bridgeObjectRelease(*(void *)&self->topic[OBJC_IVAR____TtC9appstored20AppInstallationEvent_diagnosticsSubmissionBugType]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_basePropertiesToRemove));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_additionalFields));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_adamIDs));
  swift_bridgeObjectRelease(*(void *)&self->topic[OBJC_IVAR____TtC9appstored20AppInstallationEvent_errorDomain]);
  swift_bridgeObjectRelease(*(void *)&self->topic[OBJC_IVAR____TtC9appstored20AppInstallationEvent_eventType]);
}

@end