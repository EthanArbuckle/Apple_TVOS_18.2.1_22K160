@interface GKGameRatingCacheObject
+ (id)entityName;
+ (id)ratingForGameDescriptor:(id)a3 context:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameRatingCacheObject

+ (id)ratingForGameDescriptor:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKGameRatingCacheObject ratingForGameDescriptor:context:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKGameRatingCacheObject ratingForGameDescriptor:context:]",  [v13 UTF8String],  2022));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle-id"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle-version"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"bundleID = %@ && bundleVersion = %@",  v15,  v16));
  v18 = (GKGameRatingCacheObject *)objc_claimAutoreleasedReturnValue([a1 firstObjectMatchingPredicate:v17 context:v7]);
  if (!v18)
  {
    v18 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKGameRatingCacheObject),  "initWithManagedObjectContext:",  v7);
    -[GKGameRatingCacheObject setBundleID:](v18, "setBundleID:", v15);
    -[GKGameRatingCacheObject setBundleVersion:](v18, "setBundleVersion:", v16);
  }

  return v18;
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKGameRatingCacheObject updateWithServerRepresentation:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKGameRatingCacheObject updateWithServerRepresentation:expirationDate:]",  [v13 UTF8String],  2042));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GKGameRatingCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v20,  "updateWithServerRepresentation:expirationDate:",  v6,  v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"rating"]);
  v16 = v15;
  if (v15)
  {
    [v15 floatValue];
    *(float *)&double v18 = v17 / 5.0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18));
    -[GKGameRatingCacheObject setRating:](self, "setRating:", v19);
  }
}

+ (id)entityName
{
  return @"GameRating";
}

@end