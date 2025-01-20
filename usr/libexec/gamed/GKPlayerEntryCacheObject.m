@interface GKPlayerEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKPlayerEntryCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKPlayerEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4403));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GKPlayerEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v15, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-id"]);
  -[GKPlayerEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timestamp"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v13));
  -[GKPlayerEntryCacheObject setDate:](self, "setDate:", v14);
}

- (id)internalRepresentation
{
  return 0LL;
}

+ (id)entityName
{
  return @"PlayerEntry";
}

@end