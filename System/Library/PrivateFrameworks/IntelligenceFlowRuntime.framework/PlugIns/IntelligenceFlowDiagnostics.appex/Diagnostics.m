@interface Diagnostics
- (_TtC27IntelligenceFlowDiagnostics11Diagnostics)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation Diagnostics

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    v4 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    v4 = 0LL;
  }
  v5 = self;
  v9.value._rawValue = v4;
  unint64_t v6 = (unint64_t)Diagnostics.attachments(forParameters:)(v9);

  swift_bridgeObjectRelease(v4);
  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    v7.super.isa = 0LL;
  }

  return v7.super.isa;
}

- (_TtC27IntelligenceFlowDiagnostics11Diagnostics)init
{
  return (_TtC27IntelligenceFlowDiagnostics11Diagnostics *)Diagnostics.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC27IntelligenceFlowDiagnostics11Diagnostics_logger;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end