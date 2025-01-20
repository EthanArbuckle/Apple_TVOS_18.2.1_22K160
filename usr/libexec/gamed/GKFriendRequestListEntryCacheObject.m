@interface GKFriendRequestListEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKFriendRequestListEntryCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRequestListEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKFriendRequestListEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  3000));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___GKFriendRequestListEntryCacheObject;
  -[GKFriendListEntryCacheObject updateWithServerRepresentation:](&v21, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-id"]);
  -[GKFriendRequestListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
    id v16 =  +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v14,  v15);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"email"]);
  -[GKFriendRequestListEntryCacheObject setEmail:](self, "setEmail:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"msg"]);
  -[GKFriendRequestListEntryCacheObject setMessage:](self, "setMessage:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timestamp"]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v19));
  -[GKFriendRequestListEntryCacheObject setDate:](self, "setDate:", v20);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendRequestListEntryCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendRequestListEntryCacheObject internalRepresentation]",  [v8 UTF8String],  3014));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v11,  v10));

  if ([v12 familiarity] == 3)
  {
    id v13 = [[GKFriendRequestInternal alloc] initWithCacheObject:v12];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject date](self, "date"));
    [v13 setDate:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject message](self, "message"));
    [v13 setMessage:v15];
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)entityName
{
  return @"FriendRequestEntry";
}

@end