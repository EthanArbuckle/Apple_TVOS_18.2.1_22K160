@interface GKGameCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)_gamesForFullGameDescriptors:(id)a3 context:(id)a4;
+ (id)entityName;
+ (id)fetchSortDescriptors;
+ (id)gameForBundleID:(id)a3 context:(id)a4;
+ (id)gameForGameDescriptor:(id)a3 context:(id)a4;
+ (id)gamesForBundleIDs:(id)a3 context:(id)a4;
+ (id)gamesForGameDescriptors:(id)a3 context:(id)a4;
+ (id)uniqueAttributeName;
- (BOOL)isValid;
- (id)gameDescriptor;
- (id)internalRepresentation;
- (id)leaderboardSetWithIdentifier:(id)a3;
- (void)updateWithGameDescriptor:(id)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameCacheObject

+ (id)uniqueAttributeName
{
  return @"bundleID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKGameCacheObjectUniqueObjectIDLookupKey";
}

+ (id)fetchSortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"bundleID",  1LL));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"timeStamp",  0LL));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

+ (id)gameForGameDescriptor:(id)a3 context:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForGameDescriptors:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForGameDescriptors:context:",  v7,  v5,  v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  return v9;
}

+ (id)gameForBundleID:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    id v15 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 gamesForBundleIDs:v9 context:v8]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v7);
    }
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000D807C(v13);
    }
    id v11 = 0LL;
  }

  return v11;
}

+ (id)gamesForBundleIDs:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D810C();
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 gameDescriptorsWithInstalledBundleVersionsForBundleIDs:v5]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject _gamesForFullGameDescriptors:context:]( &OBJC_CLASS___GKGameCacheObject,  "_gamesForFullGameDescriptors:context:",  v10,  v7));
  return v11;
}

+ (id)gamesForGameDescriptors:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D8138();
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:v5]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject _gamesForFullGameDescriptors:context:]( &OBJC_CLASS___GKGameCacheObject,  "_gamesForFullGameDescriptors:context:",  v10,  v7));
  return v11;
}

+ (id)_gamesForFullGameDescriptors:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C4780;
  v25[3] = &unk_1002711B8;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));
  id v26 = v8;
  [v7 enumerateObjectsUsingBlock:v25];
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueObjectIDLookupWithContext:v6]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C47DC;
  v21[3] = &unk_1002711E0;
  id v24 = a1;
  id v11 = v6;
  id v22 = v11;
  id v23 = v8;
  id v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueObjectsForKeys:v10 context:v11 newObject:v21]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C484C;
  v18[3] = &unk_10026FF20;
  id v19 = (id)objc_claimAutoreleasedReturnValue([v13 _gkMapDictionaryWithKeyPath:@"bundleID"]);
  id v20 = v11;
  id v14 = v11;
  id v15 = v19;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 _gkMapWithBlock:v18]);

  return v16;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKGameCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject name](self, "name"));
  if (v3) {
    BOOL v4 = -[GKCacheObject hasImages](self, "hasImages");
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateWithGameDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D8164();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameCacheObject updateWithGameDescriptor:]",  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v10,  "-[GKGameCacheObject updateWithGameDescriptor:]",  [v12 UTF8String],  1402));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  if (v5)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"bundle-id"]);
    if (v15)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v14);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 stringValue]);

        id v15 = (void *)v17;
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"bundle-version"]);
    if (v19)
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v18);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 stringValue]);

        id v19 = (void *)v21;
      }
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"short-bundle-version"]);
    if (v23)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v23 stringValue]);

        id v23 = (void *)v25;
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"adam-id"]);
    if (v27)
    {
      uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v26);
      if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
      {
        if ((objc_opt_respondsToSelector(v27, "longLongValue") & 1) != 0) {
          uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v27 longLongValue]));
        }
        else {
          uint64_t v29 = 0LL;
        }

        v27 = (void *)v29;
      }
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"external-version"]);
    if (v31)
    {
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber, v30);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
      {
        if ((objc_opt_respondsToSelector(v31, "longLongValue") & 1) != 0) {
          uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v31 longLongValue]));
        }
        else {
          uint64_t v33 = 0LL;
        }

        v31 = (void *)v33;
      }
    }

    id v34 = v31;
    if (v15) {
      -[GKGameCacheObject setBundleID:](self, "setBundleID:", v15);
    }
    v56 = v15;
    if (v27) {
      -[GKGameCacheObject setAdamID:](self, "setAdamID:", v27);
    }
    if (v19)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));
      if (!v35
        || (v36 = (void *)v35,
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion")),
            unsigned __int8 v38 = [v19 isEqualToString:v37],
            v37,
            v36,
            (v38 & 1) == 0))
      {
        -[GKGameCacheObject setBundleVersion:](self, "setBundleVersion:", v19);
      }
    }

    if (v23)
    {
      uint64_t v39 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));
      if (!v39
        || (v40 = (void *)v39,
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion")),
            unsigned __int8 v42 = [v23 isEqualToString:v41],
            v41,
            v40,
            (v42 & 1) == 0))
      {
        -[GKGameCacheObject setShortBundleVersion:](self, "setShortBundleVersion:", v23);
      }
    }

    if (v34)
    {
      uint64_t v43 = objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));
      if (!v43
        || (v44 = (void *)v43,
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion")),
            unsigned __int8 v46 = [v34 isEqualToNumber:v45],
            v45,
            v44,
            (v46 & 1) == 0))
      {
        -[GKGameCacheObject setExternalVersion:](self, "setExternalVersion:", v34);
      }
    }

    v55 = v19;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"platform"]);
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:]( &OBJC_CLASS___GKGameDescriptor,  "gamePlatformFromServerGameDescriptorString:",  v47)));
    -[GKGameCacheObject setPlatform:](self, "setPlatform:", v48);
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"is-arcade-game"]);
    v50 = (void *)v49;
    if (v49 && (objc_opt_respondsToSelector(v49, "BOOLValue") & 1) != 0) {
      -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", [v50 BOOLValue]);
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils constructCompatiblePlatforms:moc:]( &OBJC_CLASS___GKCachingUtils,  "constructCompatiblePlatforms:moc:",  v5,  v51));
    -[GKGameCacheObject setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils constructSupportedTransports:moc:]( &OBJC_CLASS___GKCachingUtils,  "constructSupportedTransports:moc:",  v5,  v53));
    -[GKGameCacheObject setSupportedTransportVersions:](self, "setSupportedTransportVersions:", v54);
  }
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D81F0();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]",  v12));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = v8;
    id v16 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]",  [v16 UTF8String],  1484));

    id v8 = v15;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject expirationDate](self, "expirationDate"));
  }
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___GKGameCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v55,  "updateWithServerRepresentation:expirationDate:",  v6,  v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"status"]);
  id v19 = [v18 integerValue];

  if (v19)
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers(v20);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000D8190();
    }
  }

  else
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"game"]);
    if (v22)
    {
      id v23 = (void *)v22;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___GKApplicationWorkspace,  "defaultWorkspace"));
      v56 = v23;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:v25]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 firstObject]);

      -[GKGameCacheObject updateWithGameDescriptor:](self, "updateWithGameDescriptor:", v27);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"software-type"]);
    -[GKGameCacheObject setSoftwareType:](self, "setSoftwareType:", v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"name"]);

    -[GKGameCacheObject setName:](self, "setName:", v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"is-prerendered"]);

    -[GKGameCacheObject setPrerendered:](self, "setPrerendered:", [v30 BOOLValue]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"supports-leaderboards"]);

    -[GKGameCacheObject setSupportsLeaderboards:](self, "setSupportsLeaderboards:", [v31 BOOLValue]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"has-aggregate-leaderboard"]);

    -[GKGameCacheObject setHasAggregateLeaderboard:]( self,  "setHasAggregateLeaderboard:",  [v32 BOOLValue]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"num-leaderboard-categories"]);

    -[GKGameCacheObject setNumberOfCategories:](self, "setNumberOfCategories:", [v33 integerValue]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"num-leaderboard-sets"]);

    -[GKGameCacheObject setNumberOfLeaderboardSets:]( self,  "setNumberOfLeaderboardSets:",  [v34 integerValue]);
    -[GKGameCacheObject setSupportsLeaderboardSets:]( self,  "setSupportsLeaderboardSets:",  -[GKGameCacheObject numberOfLeaderboardSets](self, "numberOfLeaderboardSets") != 0);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"default-leaderboard-category"]);

    -[GKGameCacheObject setDefaultCategory:](self, "setDefaultCategory:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"supports-achievements"]);

    -[GKGameCacheObject setSupportsAchievements:](self, "setSupportsAchievements:", [v36 BOOLValue]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"max-achievements"]);

    -[GKGameCacheObject setNumberOfAchievements:](self, "setNumberOfAchievements:", [v37 integerValue]);
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"supports-multi-player"]);

    -[GKGameCacheObject setSupportsMultiplayer:](self, "setSupportsMultiplayer:", [v38 BOOLValue]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"supports-turn-based-multi-player"]);

    -[GKGameCacheObject setSupportsTurnBasedMultiplayer:]( self,  "setSupportsTurnBasedMultiplayer:",  [v39 BOOLValue]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"max-achievements-score"]);

    -[GKGameCacheObject setMaxAchievementPoints:](self, "setMaxAchievementPoints:", [v40 integerValue]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"adam-id"]);

    if (v41) {
      -[GKGameCacheObject setAdamID:](self, "setAdamID:", v41);
    }
    unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"is-arcade-game"]);

    -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", [v42 BOOLValue]);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allow-challenges"]);

    if ([v43 BOOLValue])
    {
      -[GKGameCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", 1LL);
    }

    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
      -[GKGameCacheObject setSupportsChallenges:]( self,  "setSupportsChallenges:",  [v44 supportsChallenges]);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allow-leaderboard-challenges"]);

    if (v45)
    {
      uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber, v46);
      if ((objc_opt_isKindOfClass(v45, v47) & 1) != 0) {
        -[GKGameCacheObject setSupportsLeaderboardChallenges:]( self,  "setSupportsLeaderboardChallenges:",  [v45 BOOLValue]);
      }
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"image-urls"]);

    if (v48) {
      id v49 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v48);
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils constructCompatiblePlatforms:moc:]( &OBJC_CLASS___GKCachingUtils,  "constructCompatiblePlatforms:moc:",  v6,  v50));
    -[GKGameCacheObject setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"supported-transports"]);
    if (v52)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[GKCachingUtils constructSupportedTransports:moc:]( &OBJC_CLASS___GKCachingUtils,  "constructSupportedTransports:moc:",  v6,  v53));
      -[GKGameCacheObject setSupportedTransportVersions:](self, "setSupportedTransportVersions:", v54);
    }
  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKGameCacheObject internalRepresentation]",  [v8 UTF8String],  1585));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return +[GKGameInternal internalRepresentationForCacheObject:]( &OBJC_CLASS___GKGameInternal,  "internalRepresentationForCacheObject:",  self);
}

- (id)leaderboardSetWithIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"list.game = %@ && identifier = %@",  self,  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject managedObjectContext](self, "managedObjectContext"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheObject firstObjectMatchingPredicate:context:]( &OBJC_CLASS___GKLeaderboardSetCacheObject,  "firstObjectMatchingPredicate:context:",  v4,  v5));

  return v6;
}

- (id)gameDescriptor
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameCacheObject gameDescriptor]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKGameCacheObject gameDescriptor]",  [v8 UTF8String],  1596));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleID](self, "bundleID"));

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleID](self, "bundleID"));
    [v10 setObject:v12 forKey:@"bundle-id"];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject bundleVersion](self, "bundleVersion"));
    [v10 setObject:v14 forKey:@"bundle-version"];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject shortBundleVersion](self, "shortBundleVersion"));
    [v10 setObject:v16 forKey:@"short-bundle-version"];
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject adamID](self, "adamID"));

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject adamID](self, "adamID"));
    [v10 setObject:v18 forKey:@"adam-id"];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject externalVersion](self, "externalVersion"));
    [v10 setObject:v20 forKey:@"external-version"];
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameCacheObject platform](self, "platform"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameDescriptor stringForPlatform:]( GKGameDescriptor,  "stringForPlatform:",  [v21 integerValue]));

  if (v22) {
    [v10 setObject:v22 forKey:@"platform"];
  }

  return v10;
}

+ (id)entityName
{
  return @"Game";
}

@end