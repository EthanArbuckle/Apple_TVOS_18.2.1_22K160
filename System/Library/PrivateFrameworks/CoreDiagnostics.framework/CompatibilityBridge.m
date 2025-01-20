@interface CompatibilityBridge
+ (BOOL)WriteJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4;
- (_TtC15CoreDiagnostics19CompatibilityBridge)init;
@end

@implementation CompatibilityBridge

+ (BOOL)WriteJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    sub_18914A7B8();
    sub_18914A7F4();
    uint64_t v5 = sub_189153334();
  }

  if (a4)
  {
    sub_18914A7B8();
    sub_18914A7F4();
    a4 = (id)sub_189153334();
  }

  char v6 = _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0( v5,  (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC15CoreDiagnostics19CompatibilityBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return -[CompatibilityBridge init](&v3, sel_init);
}

@end