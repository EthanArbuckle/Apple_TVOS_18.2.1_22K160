@interface GKGameListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (id)internalRepresentationIncludingInstalledGames:(BOOL)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameListCacheObject

+ (id)entityName
{
  return @"GameList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKGameListEntryCacheObject, a2);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  3048));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___GKGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v74,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  if (v6)
  {
    id v53 = v7;
    v55 = self;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject managedObjectContext](self, "managedObjectContext"));
    id v54 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"results"]);
    id v17 = [v16 count];
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v17));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v17));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id obj = v16;
    id v19 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v71;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v71 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"game"]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"bundle-id"]);
          if (v25)
          {
            [v59 addObject:v24];
            [v18 setObject:v23 forKey:v25];
          }
        }

        id v20 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }

      while (v20);
    }

    v52 = (void *)v15;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v57 = (id)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForGameDescriptors:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForGameDescriptors:context:",  v59,  v15));
    id v26 = [v57 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v67;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v67 != v28) {
            objc_enumerationMutation(v57);
          }
          v30 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleID]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v31]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"name"]);
          if (v33) {
            [v30 setName:v33];
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"software-type"]);
          if (v34) {
            [v30 setSoftwareType:v34];
          }
        }

        id v27 = [v57 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }

      while (v27);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject entries](v55, "entries"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 _gkMapDictionaryWithKeyPath:@"bundleID"]);

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_1000CE09C;
    v64[3] = &unk_100271400;
    id v37 = v36;
    id v65 = v37;
    -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( v55,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  obj,  v64,  0LL);
    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject player](v55, "player"));
    v39 = (void *)v38;
    if (v38)
    {
      v50 = (void *)v38;
      id v51 = v37;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v56 = (id)objc_claimAutoreleasedReturnValue( +[GKGameRecordCacheObject recordsForGames:playerProfile:]( &OBJC_CLASS___GKGameRecordCacheObject,  "recordsForGames:playerProfile:",  v57,  v38));
      id v40 = [v56 countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v61;
        do
        {
          for (k = 0LL; k != v41; k = (char *)k + 1)
          {
            if (*(void *)v61 != v42) {
              objc_enumerationMutation(v56);
            }
            v44 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)k);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 game]);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 bundleID]);

            v47 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v46]);
            v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"timestamp"]);
            if (v48)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate _gkDateFromServerTimestamp:]( &OBJC_CLASS___NSDate,  "_gkDateFromServerTimestamp:",  v48));
              [v44 setLastPlayedDate:v49];
            }
          }

          id v41 = [v56 countByEnumeratingWithState:&v60 objects:v75 count:16];
        }

        while (v41);
      }

      v39 = v50;
      id v37 = v51;
    }

    id v7 = v53;
    id v6 = v54;
  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKGameListCacheObject internalRepresentation]",  [v8 UTF8String],  3122));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return -[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]( self,  "internalRepresentationIncludingInstalledGames:",  0LL);
}

- (id)internalRepresentationIncludingInstalledGames:(BOOL)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]",  [v9 UTF8String],  3129));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _gkValuesForKeyPath:@"bundleID"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"game.bundleID IN %@",  v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameListCacheObject player](self, "player"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 gameRecords]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredSetUsingPredicate:v13]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  @"self",  0LL,  &stru_100271468));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 sortedArrayUsingDescriptors:v18]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _gkValuesForKeyPath:@"internalRepresentation"]);
  return v20;
}

@end