@interface GKPlayerListCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKPlayerListCacheObject

+ (id)entityName
{
  return @"PlayerList";
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKPlayerListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  4373));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKPlayerListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v16,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"results"]);
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  &stru_100271670,  1LL);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKPlayerListCacheObject internalRepresentation]",  [v8 UTF8String],  4383));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerListCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _gkValuesForKeyPath:@"playerID"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v12,  v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _gkMapDictionaryWithKeyPath:@"playerID"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerListCacheObject entries](self, "entries"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 array]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000D4F60;
  v20[3] = &unk_100271698;
  id v21 = v14;
  id v17 = v14;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 _gkMapWithBlock:v20]);

  return v18;
}

@end