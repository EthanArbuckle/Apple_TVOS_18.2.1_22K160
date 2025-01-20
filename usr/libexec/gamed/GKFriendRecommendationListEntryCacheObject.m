@interface GKFriendRecommendationListEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKFriendRecommendationListEntryCacheObject

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRecommendationListEntryCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendRecommendationListEntryCacheObject internalRepresentation]",  [v8 UTF8String],  2885));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject playerID](self, "playerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v11,  v10));

  id v13 = [[GKFriendRecommendationInternal alloc] initWithCacheObject:v12];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject reason](self, "reason"));
  [v13 setReason:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject reason2](self, "reason2"));
  [v13 setReason2:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject rid](self, "rid"));
  objc_msgSend(v13, "setRid:", objc_msgSend(v16, "integerValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject source](self, "source"));
  objc_msgSend(v13, "setSource:", objc_msgSend(v17, "integerValue"));

  return v13;
}

+ (id)entityName
{
  return @"FriendRecommendationEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRecommendationListEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKFriendRecommendationListEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  2904));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKFriendRecommendationListEntryCacheObject;
  -[GKRecommendationEntryCacheObject updateWithServerRepresentation:](&v18, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:GKPlayerIDKey]);
  -[GKFriendRecommendationListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"reason"]);
  -[GKFriendRecommendationListEntryCacheObject setReason:](self, "setReason:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"alt-reason"]);
  -[GKFriendRecommendationListEntryCacheObject setReason2:](self, "setReason2:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"reason-id"]);
  -[GKFriendRecommendationListEntryCacheObject setReasonID:](self, "setReasonID:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"rid"]);
  -[GKFriendRecommendationListEntryCacheObject setRid:](self, "setRid:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"source"]);
  -[GKFriendRecommendationListEntryCacheObject setSource:](self, "setSource:", v17);
}

@end