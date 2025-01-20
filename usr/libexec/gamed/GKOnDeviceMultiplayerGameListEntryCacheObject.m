@interface GKOnDeviceMultiplayerGameListEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKOnDeviceMultiplayerGameListEntryCacheObject

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKOnDeviceMultiplayerGameListEntryCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKOnDeviceMultiplayerGameListEntryCacheObject internalRepresentation]",  [v8 UTF8String],  3591));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return -[GKOnDeviceMultiplayerGameListEntryCacheObject bundleID](self, "bundleID");
}

+ (id)entityName
{
  return @"GKOnDeviceMultiplayerGameListEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKOnDeviceMultiplayerGameListEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKOnDeviceMultiplayerGameListEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  3602));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKOnDeviceMultiplayerGameListEntryCacheObject;
  id v12 = -[GKCacheObject updateWithServerRepresentation:](&v18, "updateWithServerRepresentation:", v4);
  if (v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundle-id"]);
    -[GKOnDeviceMultiplayerGameListEntryCacheObject setBundleID:](self, "setBundleID:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"supports-multi-player"]);
    -[GKOnDeviceMultiplayerGameListEntryCacheObject setSupportsMultiplayer:]( self,  "setSupportsMultiplayer:",  [v14 BOOLValue]);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"supports-turn-based-multi-player"]);
    -[GKOnDeviceMultiplayerGameListEntryCacheObject setSupportsTurnBasedMultiplayer:]( self,  "setSupportsTurnBasedMultiplayer:",  [v15 BOOLValue]);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(v12);
    }
    v17 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "failed to updateWithServerRepresentation for GKOnDeviceMultiplayerGameListEntryCacheObject. serverRep: %@",  buf,  0xCu);
    }
  }
}

@end