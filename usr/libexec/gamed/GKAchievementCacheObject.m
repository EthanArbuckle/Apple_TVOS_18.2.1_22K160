@interface GKAchievementCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKAchievementCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKAchievementCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  1895));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GKAchievementCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v17, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-id"]);
  -[GKAchievementCacheObject setIdentifier:](self, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"group-achievement-id"]);
  -[GKAchievementCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"achievement-pct"]);
  [v14 floatValue];
  -[GKAchievementCacheObject setPercentComplete:](self, "setPercentComplete:");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timestamp"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v15));
  -[GKAchievementCacheObject setLastReportedDate:](self, "setLastReportedDate:", v16);
}

- (id)internalRepresentation
{
  return 0LL;
}

+ (id)entityName
{
  return @"Achievement";
}

@end