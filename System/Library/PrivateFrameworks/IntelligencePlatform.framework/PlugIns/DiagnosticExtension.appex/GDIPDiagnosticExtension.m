@interface GDIPDiagnosticExtension
- (GDIPDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation GDIPDiagnosticExtension

- (id)attachmentList
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  return isa;
}

- (id)attachmentsForParameters:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  swift_bridgeObjectRelease(v3);
  sub_10000384C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  return isa;
}

- (GDIPDiagnosticExtension)init
{
  return (GDIPDiagnosticExtension *)sub_1000037AC();
}

@end