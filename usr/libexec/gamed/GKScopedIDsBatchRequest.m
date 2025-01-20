@interface GKScopedIDsBatchRequest
- (GKScopedIDsBatchRequest)init;
- (NSArray)gameBundleIDs;
- (NSArray)playerIDs;
@end

@implementation GKScopedIDsBatchRequest

- (NSArray)playerIDs
{
  return (NSArray *)sub_100136430(self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.playerIDs.getter);
}

- (NSArray)gameBundleIDs
{
  return (NSArray *)sub_100136430(self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.gameBundleIDs.getter);
}

- (GKScopedIDsBatchRequest)init
{
}

- (void).cxx_destruct
{
}

@end