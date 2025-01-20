@interface GKNetworkRequestEligibilityChecker
- (GKNetworkRequestEligibilityChecker)init;
- (GKNetworkRequestEligibilityChecker)initWithHasAcknowledgedLatestGDPR:(BOOL)a3 alwaysAllowedBagKeysObject:(id)a4 isAppUnlistedAndDisallowed:(BOOL)a5;
- (id)verifyEligibilityWithBagKey:(id)a3;
@end

@implementation GKNetworkRequestEligibilityChecker

- (GKNetworkRequestEligibilityChecker)initWithHasAcknowledgedLatestGDPR:(BOOL)a3 alwaysAllowedBagKeysObject:(id)a4 isAppUnlistedAndDisallowed:(BOOL)a5
{
  if (a4)
  {
    uint64_t v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v10, v8);
    swift_unknownObjectRelease(a4);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
  }

  return (GKNetworkRequestEligibilityChecker *)NetworkRequestEligibiltyChecker.init(hasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:)( a3,  (uint64_t)v10,  a5);
}

- (id)verifyEligibilityWithBagKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  id v8 = NetworkRequestEligibiltyChecker.verifyEligibility(bagKey:)(v4, v6);

  swift_bridgeObjectRelease(v6, v9);
  if (v8)
  {
    v10 = (void *)_convertErrorToNSError(_:)(v8);
    swift_errorRelease(v8);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (GKNetworkRequestEligibilityChecker)init
{
}

- (void).cxx_destruct
{
}

@end