@interface GKLeaderboardTitleMapCacheObject
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardTitleMapCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKLeaderboardTitleMapCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v7, "updateWithServerRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"category-name"]);
  if (v5) {
    -[GKLeaderboardTitleMapCacheObject setIdentifier:](self, "setIdentifier:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"category-title"]);

  if (v6) {
    -[GKLeaderboardTitleMapCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v6);
  }
}

+ (id)entityName
{
  return @"LeaderboardTitleMap";
}

@end