@interface XPCService
- (void)writeJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4 with:(id)a5;
@end

@implementation XPCService

- (void)writeJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4 with:(id)a5
{
  v8 = _Block_copy(a5);
  if (a3) {
    a3 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for Int32,  &protocol witness table for Int32);
  }
  if (a4) {
    a4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for Int32,  &protocol witness table for Int32);
  }
  _Block_copy(v8);
  swift_retain(self);
  sub_1000027F8((uint64_t)a3, (uint64_t)a4, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release(self);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
}

@end