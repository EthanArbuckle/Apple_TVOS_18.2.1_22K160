@interface GKGameInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKGameInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameInternal(Cache) updateWithCacheObject:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKGameInternal(Cache) updateWithCacheObject:]",  [v10 UTF8String],  73));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[GKGameInternal setBundleIdentifier:](self, "setBundleIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleVersion]);
  -[GKGameInternal setBundleVersion:](self, "setBundleVersion:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 shortBundleVersion]);
  -[GKGameInternal setShortBundleVersion:](self, "setShortBundleVersion:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 adamID]);
  -[GKGameInternal setAdamID:](self, "setAdamID:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 externalVersion]);
  -[GKGameInternal setExternalVersion:](self, "setExternalVersion:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 platform]);
  -[GKGameInternal setPlatform:](self, "setPlatform:", [v17 integerValue]);

  v49 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 compatiblePlatforms]);
  id v19 = [v18 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v57;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
        id v25 = [v24 length];

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
          -[NSMutableSet addObject:](v49, "addObject:", v26);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }

    while (v20);
  }

  v46 = self;
  -[GKGameInternal setCompatiblePlatforms:](self, "setCompatiblePlatforms:", v49);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedTransportVersions]);
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v27 count]));

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v47 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedTransportVersions]);
  id v29 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (j = 0LL; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v52 + 1) + 8 * (void)j) version]);
        if ([v33 isEqualToNumber:&off_100287BE0]
          && (v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared")),
              unsigned __int8 v35 = [v34 fastSyncTransportEnabled],
              v34,
              (v35 & 1) == 0))
        {
          if (!os_log_GKGeneral) {
            id v38 = (id)GKOSLoggers(v36);
          }
          v39 = (os_log_s *)os_log_GKError;
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
            sub_1000FB418(&buf, v51, v39);
          }
        }

        else if (v33)
        {
          id v37 = [[GKSupportedTransport alloc] initWithVersionNumber:v33];
          [v48 addObject:v37];
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }

    while (v30);
  }

  -[GKGameInternal setSupportedTransports:](v46, "setSupportedTransports:", v48);
  -[GKGameInternal setIsArcadeGame:](v46, "setIsArcadeGame:", [v47 isArcadeGame]);
  -[GKGameInternal setSupportsChallenges:](v46, "setSupportsChallenges:", [v47 supportsChallenges]);
  -[GKGameInternal setSupportsLeaderboardChallenges:]( v46,  "setSupportsLeaderboardChallenges:",  [v47 supportsLeaderboardChallenges]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v47 name]);
  -[GKGameInternal setName:](v46, "setName:", v40);

  -[GKGameInternal setPrerendered:](v46, "setPrerendered:", [v47 prerendered]);
  if ([v47 supportsLeaderboards])
  {
    -[GKGameInternal setSupportsLeaderboards:](v46, "setSupportsLeaderboards:", 1LL);
    -[GKGameInternal setHasAggregateLeaderboard:]( v46,  "setHasAggregateLeaderboard:",  [v47 hasAggregateLeaderboard]);
    -[GKGameInternal setNumberOfLeaderboards:]( v46,  "setNumberOfLeaderboards:",  (unsigned __int16)[v47 numberOfCategories]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v47 defaultCategory]);
    -[GKGameInternal setDefaultLeaderboardIdentifier:](v46, "setDefaultLeaderboardIdentifier:", v41);
  }

  if ([v47 supportsLeaderboardSets])
  {
    -[GKGameInternal setSupportsLeaderboardSets:](v46, "setSupportsLeaderboardSets:", 1LL);
    -[GKGameInternal setNumberOfLeaderboardSets:]( v46,  "setNumberOfLeaderboardSets:",  (unsigned __int16)[v47 numberOfLeaderboardSets]);
  }

  if ([v47 supportsAchievements])
  {
    -[GKGameInternal setSupportsAchievements:](v46, "setSupportsAchievements:", 1LL);
    -[GKGameInternal setNumberOfAchievements:]( v46,  "setNumberOfAchievements:",  (unsigned __int16)[v47 numberOfAchievements]);
    -[GKGameInternal setMaxAchievementPoints:]( v46,  "setMaxAchievementPoints:",  (unsigned __int16)[v47 maxAchievementPoints]);
  }

  -[GKGameInternal setSupportsMultiplayer:](v46, "setSupportsMultiplayer:", [v47 supportsMultiplayer]);
  -[GKGameInternal setSupportsTurnBasedMultiplayer:]( v46,  "setSupportsTurnBasedMultiplayer:",  [v47 supportsTurnBasedMultiplayer]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v47 imageURLDictionary]);
  -[GKGameInternal setIcons:](v46, "setIcons:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue([v47 expirationDate]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v43 timeIntervalSinceDate:v44];
  -[GKGameInternal setValid:](v46, "setValid:", v45 > 0.0);
}

@end