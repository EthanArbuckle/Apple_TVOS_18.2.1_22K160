@interface GKAchievementPointsListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKAchievementPointsListCacheObject

+ (id)entityName
{
  return @"AchievementPointsList";
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  3637));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___GKAchievementPointsListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v77,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"results"]);
  if (v15)
  {
    id v54 = v7;
    id v55 = v6;
    v53 = self;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject managedObjectContext](self, "managedObjectContext"));
    id v16 = [v15 count];
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v16));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v16));
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    v52 = v15;
    id obj = v15;
    id v18 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v74;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v74 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"game"]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"bundle-id"]);
          if (v24)
          {
            [v59 addObject:v23];
            [v17 setObject:v22 forKey:v24];
          }
        }

        id v19 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }

      while (v19);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForGameDescriptors:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForGameDescriptors:context:",  v59,  v56));
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v16));
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v57 = v25;
    id v26 = [v57 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v70;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v70 != v28) {
            objc_enumerationMutation(v57);
          }
          v30 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleID]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v31]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"game"]);
          [v30 updateWithGameDescriptor:v33];

          v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"name"]);
          if (v34) {
            [v30 setName:v34];
          }
          [v60 setObject:v30 forKey:v31];
        }

        id v27 = [v57 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }

      while (v27);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v16));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v60 allValues]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject player](v53, "player"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameRecordCacheObject recordsForGames:playerProfile:]( &OBJC_CLASS___GKGameRecordCacheObject,  "recordsForGames:playerProfile:",  v36,  v37));

    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v39 = v38;
    id v40 = [v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v66;
      do
      {
        for (k = 0LL; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v66 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)k);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v44 game]);
          v46 = (void *)objc_claimAutoreleasedReturnValue([v45 bundleID]);

          [v35 setObject:v44 forKey:v46];
        }

        id v41 = [v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
      }

      while (v41);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementPointsListCacheObject entries](v53, "entries"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 _gkMapDictionaryWithKeyPath:@"gameRecord.game.bundleID"]);

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1000D1290;
    v61[3] = &unk_1002715E8;
    id v62 = v60;
    id v63 = v48;
    id v64 = v35;
    id v49 = v35;
    id v50 = v48;
    id v51 = v60;
    -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( v53,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  obj,  v61,  0LL);

    id v7 = v54;
    id v6 = v55;
    v15 = v52;
  }
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKAchievementPointsEntryCacheObject, a2);
}

@end