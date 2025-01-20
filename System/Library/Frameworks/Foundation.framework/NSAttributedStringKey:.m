@interface NSAttributedStringKey:
- (uint64_t)Any;
@end

@implementation NSAttributedStringKey:

- (uint64_t)Any
{
  v2 = *(void (**)(void))(a1 + 32);
  specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v2();
  return swift_bridgeObjectRelease();
}

@end