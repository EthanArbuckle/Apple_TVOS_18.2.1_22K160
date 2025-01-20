@interface SonicDiagnosticsExtension
- (_TtC16SonicDiagnostics25SonicDiagnosticsExtension)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation SonicDiagnosticsExtension

- (_TtC16SonicDiagnostics25SonicDiagnosticsExtension)init
{
  return result;
}

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5 = self;
  sub_100002DF0(v4);
  uint64_t v7 = v6;

  swift_bridgeObjectRelease(v4);
  if (v7)
  {
    Array._bridgeToObjectiveC()();
    sub_100003B18();
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

@end