@interface GKRecentGameListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKRecentGameListCacheObject

+ (id)entityName
{
  return @"RecentGameList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKRecentGameListEntryCacheObject, a2);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKRecentGameListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKRecentGameListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  3427));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKRecentGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v16,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"results"]);
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  &stru_1002714D0,  1LL);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKRecentGameListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKRecentGameListCacheObject internalRepresentation]",  [v8 UTF8String],  3438));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _gkValuesForKeyPath:@"bundleIDs"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameCacheObject gamesForBundleIDs:context:]( &OBJC_CLASS___GKGameCacheObject,  "gamesForBundleIDs:context:",  v12,  v10));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject otherPlayer](self, "otherPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameRecordCacheObject recordsForGames:playerProfile:]( &OBJC_CLASS___GKGameRecordCacheObject,  "recordsForGames:playerProfile:",  v13,  v14));

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _gkMapDictionaryWithKeyPath:@"game.bundleID"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject otherPlayer](self, "otherPlayer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 internalRepresentation]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject entries](self, "entries"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 array]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000CFE20;
  v25[3] = &unk_1002714F8;
  id v26 = v16;
  id v27 = v18;
  id v21 = v18;
  id v22 = v16;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v20 _gkMapWithBlock:v25]);

  return v23;
}

@end