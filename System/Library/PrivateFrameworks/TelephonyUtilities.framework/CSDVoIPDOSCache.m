@interface CSDVoIPDOSCache
- (BOOL)shouldAllowCallFor:(id)a3;
- (CSDVoIPDOSCache)init;
@end

@implementation CSDVoIPDOSCache

- (CSDVoIPDOSCache)init
{
  return (CSDVoIPDOSCache *)sub_1002AFE54();
}

- (BOOL)shouldAllowCallFor:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1002AFEE0(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (void).cxx_destruct
{
}

@end