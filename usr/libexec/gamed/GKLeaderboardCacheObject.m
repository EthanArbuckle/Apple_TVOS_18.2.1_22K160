@interface GKLeaderboardCacheObject
+ (BOOL)getIsPrereleaseFromServerRep:(id)a3;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardCacheObject

+ (BOOL)getIsPrereleaseFromServerRep:(id)a3
{
  return [a3 BOOLValueFromKey:@"is-prerelease" defaultValue:0];
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKLeaderboardCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKLeaderboardCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  3181));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___GKLeaderboardCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v54, "updateWithServerRepresentation:", v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"global-alltime-info"]);
  if (!v12) {
    id v12 = v4;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"leaderboard-id"]);
  if (!v13) {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"category-name"]);
  }
  if (+[GKLeaderboardCacheObject getIsPrereleaseFromServerRep:]( &OBJC_CLASS___GKLeaderboardCacheObject,  "getIsPrereleaseFromServerRep:",  v12))
  {
    uint64_t v14 = 2LL;
  }

  else
  {
    uint64_t v14 = 1LL;
  }

  -[GKLeaderboardCacheObject setReleaseState:](self, "setReleaseState:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
  unsigned __int8 v16 = [v15 isEqualToString:v13];

  if ((v16 & 1) == 0)
  {
    -[GKLeaderboardCacheObject setIdentifier:](self, "setIdentifier:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"title"]);
    if (v17
      || (v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"category-title"])) != 0)
    {
      -[GKLeaderboardCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"score-type"]);
    if (v18) {
      -[GKLeaderboardCacheObject setScoreType:](self, "setScoreType:", v18);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"base-leaderboard-id"]);

    if (v19)
    {
      -[GKLeaderboardCacheObject setBaseLeaderboardID:](self, "setBaseLeaderboardID:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));

      if (!v20) {
        -[GKLeaderboardCacheObject setIdentifier:](self, "setIdentifier:", v19);
      }
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
      -[GKLeaderboardCacheObject setBaseLeaderboardID:](self, "setBaseLeaderboardID:", v21);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"group-id"]);

    if (v22
      || (v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"group-category-name"])) != 0)
    {
      -[GKLeaderboardCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v22);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"type"]);
    v24 = (void *)v23;
    if (v23) {
      v25 = (const __CFString *)v23;
    }
    else {
      v25 = @"classic";
    }
    -[GKLeaderboardCacheObject setType:](self, "setType:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"start-date"]);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v26));
      -[GKLeaderboardCacheObject setStartDate:](self, "setStartDate:", v27);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"next-start-date"]);

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v28));
      -[GKLeaderboardCacheObject setNextStartDate:](self, "setNextStartDate:", v29);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"duration"]);

    if (v30) {
      -[GKLeaderboardCacheObject setDuration:](self, "setDuration:", v30);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"rank"]);

    if (v31) {
      -[GKLeaderboardCacheObject setRank:](self, "setRank:", v31);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"leaderboard-size"]);

    if (v32) {
      -[GKLeaderboardCacheObject setMaxRank:](self, "setMaxRank:", v32);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"friend-rank"]);

    if (v33) {
      -[GKLeaderboardCacheObject setFriendRank:](self, "setFriendRank:", v33);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"num-friends-ranked"]);

    if (v34) {
      -[GKLeaderboardCacheObject setMaxFriendRank:](self, "setMaxFriendRank:", v34);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"last-submitted"]);

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v35));
      -[GKLeaderboardCacheObject setLastSubmittedDate:](self, "setLastSubmittedDate:", v36);
    }

    -[GKLeaderboardCacheObject setIsPrimary:](self, "setIsPrimary:", 1LL);
    -[GKLeaderboardCacheObject setPreviousInstanceLoaded:](self, "setPreviousInstanceLoaded:", 0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject previousInstance](self, "previousInstance"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject managedObjectContext](self, "managedObjectContext"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject previousInstance](self, "previousInstance"));
      [v38 deleteObject:v39];
    }

    -[GKLeaderboardCacheObject setPreviousInstance:](self, "setPreviousInstance:", 0LL);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 UUIDString]);
    -[GKLeaderboardCacheObject setRecordID:](self, "setRecordID:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"image-urls"]);
    if (v42
      || (v42 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"category-image-urls"])) != 0)
    {
      id v43 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v42);
    }

    -[GKLeaderboardCacheObject setSupportsChallenges:]( self,  "setSupportsChallenges:",  [v12 BOOLValueFromKey:@"allow-challenges" defaultValue:0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"activity-type"]);
    -[GKLeaderboardCacheObject setActivityType:](self, "setActivityType:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"description"]);
    -[GKLeaderboardCacheObject setLeaderboardDescription:](self, "setLeaderboardDescription:", v45);

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"user-info"]);
    if (v46)
    {
      v47 = (void *)v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"user-info"]);
      uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary, v49);
      char isKindOfClass = objc_opt_isKindOfClass(v48, v50);

      if ((isKindOfClass & 1) != 0)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"user-info"]);
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v52));
        -[GKLeaderboardCacheObject setUserInfo:](self, "setUserInfo:", v53);
      }
    }
  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKLeaderboardCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKLeaderboardCacheObject internalRepresentation]",  [v8 UTF8String],  3297));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKLeaderboardInternal internalRepresentation]( &OBJC_CLASS___GKLeaderboardInternal,  "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject recordID](self, "recordID"));
  [v10 setRecordID:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject baseLeaderboardID](self, "baseLeaderboardID"));
  [v10 setBaseLeaderboardID:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject duration](self, "duration"));
  [v13 doubleValue];
  objc_msgSend(v10, "setDuration:");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject friendRank](self, "friendRank"));
  objc_msgSend(v10, "setFriendRank:", (unsigned __int16)objc_msgSend(v14, "unsignedIntegerValue"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject maxFriendRank](self, "maxFriendRank"));
  objc_msgSend(v10, "setFriendRankCount:", (unsigned __int16)objc_msgSend(v15, "unsignedIntegerValue"));

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject groupIdentifier](self, "groupIdentifier"));
  [v10 setGroupIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  [v10 setIcons:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject identifier](self, "identifier"));
  [v10 setIdentifier:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject localizedTitle](self, "localizedTitle"));
  [v10 setLocalizedTitle:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject nextStartDate](self, "nextStartDate"));
  [v10 setNextStartDate:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject rank](self, "rank"));
  objc_msgSend(v10, "setOverallRank:", objc_msgSend(v21, "unsignedIntegerValue"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject maxRank](self, "maxRank"));
  objc_msgSend(v10, "setOverallRankCount:", objc_msgSend(v22, "unsignedIntegerValue"));

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject recordID](self, "recordID"));
  [v10 setRecordID:v23];

  objc_msgSend(v10, "setReleaseState:", -[GKLeaderboardCacheObject releaseState](self, "releaseState"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject startDate](self, "startDate"));
  [v10 setStartDate:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject activityType](self, "activityType"));
  [v10 setActivityType:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject leaderboardDescription](self, "leaderboardDescription"));
  [v10 setLeaderboardDescription:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject userInfo](self, "userInfo"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject userInfo](self, "userInfo"));
    [v10 setUserInfo:v28];
  }

  else
  {
    [v10 setUserInfo:&__NSDictionary0__struct];
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardCacheObject type](self, "type"));
  unsigned int v30 = [v29 isEqualToString:@"recurring"];

  [v10 setType:v30];
  objc_msgSend( v10,  "setSupportsChallenges:",  -[GKLeaderboardCacheObject supportsChallenges](self, "supportsChallenges"));
  return v10;
}

+ (id)entityName
{
  return @"Leaderboard";
}

@end