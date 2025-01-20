@interface VoiceBankingDiagnosticsExtension
- (VoiceBankingDiagnosticsExtension)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation VoiceBankingDiagnosticsExtension

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5 = self;
  uint64_t v6 = _s23VoiceBankingDiagnostics0abC9ExtensionC11attachments13forParametersSayypGSgSDys11AnyHashableVypGSg_tF_0();

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

- (VoiceBankingDiagnosticsExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[VoiceBankingDiagnosticsExtension init](&v3, "init");
}

@end