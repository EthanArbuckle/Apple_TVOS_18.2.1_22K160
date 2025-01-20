@interface DiagnosticExtensionProvider
- (_TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DiagnosticExtensionProvider

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v8 = sub_1000058DC(v10);
  swift_bridgeObjectRelease(v10);

  if (v8)
  {
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    Class v7 = isa;
  }

  else
  {
    Class v7 = 0LL;
  }

  return v7;
}

- (_TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider)init
{
  return (_TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider *)sub_100005BDC();
}

- (void).cxx_destruct
{
}

@end