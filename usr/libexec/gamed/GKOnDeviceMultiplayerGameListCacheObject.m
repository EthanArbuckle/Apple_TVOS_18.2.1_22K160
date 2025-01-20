@interface GKOnDeviceMultiplayerGameListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)bundleIDs;
- (id)multiplayerGames;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKOnDeviceMultiplayerGameListCacheObject

- (id)bundleIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKOnDeviceMultiplayerGameListCacheObject entries](self, "entries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 array]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _gkMapWithBlock:&stru_100271578]);

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  v7 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found cachedBundleIDs: %@", (uint8_t *)&v9, 0xCu);
  }

  return v4;
}

- (id)multiplayerGames
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKOnDeviceMultiplayerGameListCacheObject entries](self, "entries"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 array]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D05F0;
  v8[3] = &unk_1002715A0;
  id v6 = v3;
  int v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  3559));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKOnDeviceMultiplayerGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v16,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"game-features"]);
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v15,  &stru_1002715C0,  1LL);
}

+ (id)entityName
{
  return @"GKOnDeviceMultiplayerGameList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKOnDeviceMultiplayerGameListEntryCacheObject, a2);
}

@end