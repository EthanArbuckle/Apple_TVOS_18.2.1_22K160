@interface FAFetchFollowupOperation
- (id)fetchFollowUps;
@end

@implementation FAFetchFollowupOperation

- (id)fetchFollowUps
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 standardPlistRequestWithEndpoint:@"fetchFamilyFollowups"]);

  return v3;
}

@end