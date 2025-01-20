@interface GKAchievementListCacheObject
+ (id)entityName;
- (BOOL)isValid;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKAchievementListCacheObject

+ (id)entityName
{
  return @"AchievementList";
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKAchievementListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  BOOL v5 = v4 != 0LL;

  return v5;
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  1828));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKAchievementListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v16,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"results"]);
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  &stru_1002712B0,  1LL);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementListCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKAchievementListCacheObject internalRepresentation]",  [v8 UTF8String],  1838));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject game](self, "game"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 achievementDescriptionList]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 entries]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject entries](self, "entries"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject player](self, "player"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playerID]);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000C6FA8;
  v26[3] = &unk_1002712D8;
  objc_super v16 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  2 * (void)[v13 count]);
  v27 = v16;
  [v13 enumerateObjectsUsingBlock:v26];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 array]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C702C;
  v23[3] = &unk_100271300;
  v24 = v16;
  id v25 = v15;
  id v18 = v15;
  v19 = v16;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 _gkFilterWithBlock:v23]);

  if (v20) {
    v21 = (void *)v20;
  }
  else {
    v21 = &__NSArray0__struct;
  }

  return v21;
}

@end