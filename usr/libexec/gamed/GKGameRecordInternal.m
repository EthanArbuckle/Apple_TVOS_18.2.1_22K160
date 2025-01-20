@interface GKGameRecordInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKGameRecordInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 game]);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKGameRecordInternal;
  -[GKGameRecordInternal updateWithCacheObject:](&v19, "updateWithCacheObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPlayedDate]);
  -[GKGameRecordInternal setLastPlayedDate:](self, "setLastPlayedDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 purchaseDate]);
  -[GKGameRecordInternal setPurchaseDate:](self, "setPurchaseDate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 rank]);
  -[GKGameRecordInternal setRank:](self, "setRank:", [v8 unsignedIntegerValue]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 maxRank]);
  -[GKGameRecordInternal setMaxRank:](self, "setMaxRank:", [v9 unsignedIntegerValue]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 friendRank]);
  -[GKGameRecordInternal setFriendRank:]( self,  "setFriendRank:",  (unsigned __int16)[v10 unsignedIntegerValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 maxFriendRank]);
  -[GKGameRecordInternal setMaxFriendRank:]( self,  "setMaxFriendRank:",  (unsigned __int16)[v11 unsignedIntegerValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 achievements]);
  -[GKGameRecordInternal setAchievements:]( self,  "setAchievements:",  (unsigned __int16)[v12 unsignedIntegerValue]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 achievementPoints]);
  -[GKGameRecordInternal setAchievementPoints:]( self,  "setAchievementPoints:",  (__int16)[v13 unsignedIntegerValue]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 defaultLeaderboardIdentifier]);
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 game]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v15 defaultCategory]);
  }

  -[GKGameRecordInternal setDefaultLeaderboardIdentifier:](self, "setDefaultLeaderboardIdentifier:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v16 timeIntervalSinceDate:v17];
  -[GKGameRecordInternal setValid:](self, "setValid:", v18 > 0.0);
}

@end