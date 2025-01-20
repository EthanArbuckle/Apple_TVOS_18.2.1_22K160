@interface GKAchievementThatAFriendHasCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementThatAFriendHasCacheObject

+ (id)entityName
{
  return @"AchievementThatAFriendHas";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"friend"]);
  -[GKAchievementThatAFriendHasCacheObject setFriend:](self, "setFriend:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"timestamp"]);
  -[GKAchievementThatAFriendHasCacheObject setTimestamp:](self, "setTimestamp:", v6);
}

- (id)internalRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKAchievementThatAFriendHasInternal internalRepresentation]( &OBJC_CLASS___GKAchievementThatAFriendHasInternal,  "internalRepresentation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasCacheObject friend](self, "friend"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 internalRepresentation]);
  [v3 setFriendPlayer:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasCacheObject timestamp](self, "timestamp"));
  [v3 setTimestamp:v6];

  return v3;
}

@end