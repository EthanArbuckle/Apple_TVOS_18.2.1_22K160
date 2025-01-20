@interface GKAchievementThatAFriendHasListCacheObject
+ (id)dateFromMillisecondsSinceEpoch:(double)a3;
+ (id)entityName;
+ (id)friendsForAchievement:(id)a3 plist:(id)a4 profileProvider:(id)a5;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 playerId:(id)a5 achievementId:(id)a6;
@end

@implementation GKAchievementThatAFriendHasListCacheObject

+ (id)entityName
{
  return @"AchievementThatAFriendHasList";
}

+ (id)friendsForAchievement:(id)a3 plist:(id)a4 profileProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"results"]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000C5F70;
  v40[3] = &unk_100271208;
  id v12 = v7;
  id v41 = v12;
  id v13 = [v11 indexOfObjectPassingTest:v40];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = -[NSMutableArray copy](v10, "copy");
  }

  else
  {
    id v33 = v12;
    id v34 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"results"]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v13]);

    v32 = v16;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"friends-with-achievement"]);
    id v17 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"friend-player-id"]);
          uint64_t v23 = v9[2](v9, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"timestamp"]);
          [v25 doubleValue];
          double v27 = v26;

          uint64_t v28 = objc_claimAutoreleasedReturnValue( +[GKAchievementThatAFriendHasListCacheObject dateFromMillisecondsSinceEpoch:]( &OBJC_CLASS___GKAchievementThatAFriendHasListCacheObject,  "dateFromMillisecondsSinceEpoch:",  v27));
          v29 = (void *)v28;
          if (v24)
          {
            v42[0] = @"friend";
            v42[1] = @"timestamp";
            v43[0] = v24;
            v43[1] = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
            -[NSMutableArray addObject:](v10, "addObject:", v30);
          }
        }

        id v18 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v18);
    }

    id v14 = -[NSMutableArray copy](v10, "copy");

    id v12 = v33;
    id v8 = v34;
  }

  return v14;
}

+ (id)dateFromMillisecondsSinceEpoch:(double)a3
{
  double v4 = fabs(a3);
  v5 = objc_alloc(&OBJC_CLASS___NSDate);
  double v6 = a3 / 1000.0;
  if (v4 == INFINITY) {
    double v6 = 0.0;
  }
  return -[NSDate initWithTimeIntervalSince1970:](v5, "initWithTimeIntervalSince1970:", v6);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 playerId:(id)a5 achievementId:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKAchievementThatAFriendHasListCacheObject;
  id v9 = a6;
  id v10 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v14,  "updateWithServerRepresentation:expirationDate:",  v10,  a4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C6118;
  v13[3] = &unk_100271230;
  v13[4] = self;
  v11 = objc_retainBlock(v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKAchievementThatAFriendHasListCacheObject friendsForAchievement:plist:profileProvider:]( &OBJC_CLASS___GKAchievementThatAFriendHasListCacheObject,  "friendsForAchievement:plist:profileProvider:",  v9,  v10,  v11));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v12,  &stru_100271270,  1LL);
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKAchievementThatAFriendHasListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasListCacheObject game](self, "game"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

@end