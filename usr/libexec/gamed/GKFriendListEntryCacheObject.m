@interface GKFriendListEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKFriendListEntryCacheObject

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendListEntryCacheObject internalRepresentation]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKFriendListEntryCacheObject internalRepresentation]",  [v8 UTF8String],  2611));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListEntryCacheObject playerID](self, "playerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v10,  v11));

  v13 = -[GKFriendPlayerInternal initWithCacheObject:]( objc_alloc(&OBJC_CLASS___GKFriendPlayerInternal),  "initWithCacheObject:",  v12);
  return v13;
}

+ (id)entityName
{
  return @"FriendEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  2623));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GKFriendListEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v25, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"player-id"]);
  -[GKFriendListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"played-with"]);
  -[GKFriendListEntryCacheObject setFriendPlayedWith:](self, "setFriendPlayedWith:", [v13 BOOLValue]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bi-directional"]);
  -[GKFriendListEntryCacheObject setFriendBiDirectional:]( self,  "setFriendBiDirectional:",  [v14 BOOLValue]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"played-nearby"]);
  -[GKFriendListEntryCacheObject setFriendPlayedNearby:](self, "setFriendPlayedNearby:", [v15 BOOLValue]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"accepted-game-invitation"]);
  -[GKFriendListEntryCacheObject setAcceptedGameInviteFromThisFriend:]( self,  "setAcceptedGameInviteFromThisFriend:",  [v16 BOOLValue]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"initiated-game-invitation"]);
  -[GKFriendListEntryCacheObject setInitiatedGameInviteToThisFriend:]( self,  "setInitiatedGameInviteToThisFriend:",  [v17 BOOLValue]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"automatched-together"]);
  -[GKFriendListEntryCacheObject setAutomatchedTogether:]( self,  "setAutomatchedTogether:",  [v18 BOOLValue]);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"challenged-together"]);
  -[GKFriendListEntryCacheObject setChallengedTogether:](self, "setChallengedTogether:", [v19 BOOLValue]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"last-challenged-timestamp"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v20));
  -[GKFriendListEntryCacheObject setLastChallengedDate:](self, "setLastChallengedDate:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"last-challenged-game"]);
  -[GKFriendListEntryCacheObject setLastChallengedGame:](self, "setLastChallengedGame:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKContactsAssociationIDKey]);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKContactsIntegrationUserSettings associationIDFromServerResult:]( &OBJC_CLASS___GKContactsIntegrationUserSettings,  "associationIDFromServerResult:",  v23));
  -[GKFriendListEntryCacheObject setContactAssociationID:](self, "setContactAssociationID:", v24);
}

@end