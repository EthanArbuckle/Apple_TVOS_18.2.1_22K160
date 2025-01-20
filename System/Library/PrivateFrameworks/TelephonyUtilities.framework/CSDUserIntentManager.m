@interface CSDUserIntentManager
- (BOOL)validateUserIntentForCallSource:(id)a3;
- (CSDUserIntentManager)init;
- (CSDUserIntentManager)initWithQueue:(id)a3;
- (void)donateUserIntentForCallProviderIdentifier:(id)a3;
@end

@implementation CSDUserIntentManager

- (CSDUserIntentManager)initWithQueue:(id)a3
{
  return (CSDUserIntentManager *)sub_1001B1744(a3);
}

- (void)donateUserIntentForCallProviderIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1001B18A8(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (BOOL)validateUserIntentForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1001B19E0(v4);

  return self & 1;
}

- (CSDUserIntentManager)init
{
}

- (void).cxx_destruct
{
}

@end