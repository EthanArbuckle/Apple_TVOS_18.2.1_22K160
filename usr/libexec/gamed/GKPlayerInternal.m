@interface GKPlayerInternal
+ (int)familiarity;
+ (unsigned)piecesToLoad;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  id v26 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKPlayerInternal(Cache) updateWithCacheObject:]",  v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v7,  "-[GKPlayerInternal(Cache) updateWithCacheObject:]",  [v9 UTF8String],  170));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v26 playerID]);
  -[GKPlayerInternal setPlayerID:](self, "setPlayerID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v26 alias]);
  -[GKPlayerInternal setAlias:](self, "setAlias:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v26 avatarType]);
  -[GKPlayerInternal setAvatarType:](self, "setAvatarType:", v13);

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v26 friendLevel]);
  v15 = (void *)v14;
  if (v14) {
    v16 = (_UNKNOWN **)v14;
  }
  else {
    v16 = &off_100287BF8;
  }
  -[GKPlayerInternal setFriendLevel:](self, "setFriendLevel:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v26 friendBiDirectional]);
  -[GKPlayerInternal setFriendBiDirectional:](self, "setFriendBiDirectional:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v26 friendPlayedWith]);
  -[GKPlayerInternal setFriendPlayedWith:](self, "setFriendPlayedWith:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v26 friendPlayedNearby]);
  -[GKPlayerInternal setFriendPlayedNearby:](self, "setFriendPlayedNearby:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v26 acceptedGameInviteFromThisFriend]);
  -[GKPlayerInternal setAcceptedGameInviteFromThisFriend:](self, "setAcceptedGameInviteFromThisFriend:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v26 initiatedGameInviteToThisFriend]);
  -[GKPlayerInternal setInitiatedGameInviteToThisFriend:](self, "setInitiatedGameInviteToThisFriend:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v26 automatchedTogether]);
  -[GKPlayerInternal setAutomatchedTogether:](self, "setAutomatchedTogether:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v26 imageURLDictionary]);
  -[GKPlayerInternal setPhotos:](self, "setPhotos:", v23);

  -[GKPlayerInternal setNumberOfFriends:]( self,  "setNumberOfFriends:",  (unsigned __int16)[v26 numberOfFriends]);
  -[GKPlayerInternal setNumberOfFriendsInCommon:]( self,  "setNumberOfFriendsInCommon:",  (unsigned __int16)[v26 numberOfFriendsInCommon]);
  -[GKPlayerInternal setNumberOfGames:](self, "setNumberOfGames:", (unsigned __int16)[v26 numberOfGames]);
  -[GKPlayerInternal setNumberOfGamesInCommon:]( self,  "setNumberOfGamesInCommon:",  (unsigned __int16)[v26 numberOfGamesInCommon]);
  -[GKPlayerInternal setNumberOfAchievements:]( self,  "setNumberOfAchievements:",  [v26 numberOfAchievements]);
  -[GKPlayerInternal setNumberOfAchievementPoints:]( self,  "setNumberOfAchievementPoints:",  [v26 numberOfAchievementPoints]);
  -[GKPlayerInternal setAchievementsVisibility:]( self,  "setAchievementsVisibility:",  [v26 achievementsVisibility]);
  -[GKPlayerInternal setFriendsVisibility:](self, "setFriendsVisibility:", [v26 friendsVisibility]);
  -[GKPlayerInternal setGamesPlayedVisibility:]( self,  "setGamesPlayedVisibility:",  [v26 gamesPlayedVisibility]);
  -[GKPlayerInternal setGlobalFriendListAccess:]( self,  "setGlobalFriendListAccess:",  [v26 globalFriendListAccess]);
  -[GKPlayerInternal setIsArcadeSubscriber:](self, "setIsArcadeSubscriber:", [v26 isArcadeSubscriber]);
  -[GKPlayerInternal setContactsIntegrationConsent:]( self,  "setContactsIntegrationConsent:",  [v26 contactsIntegrationConsent]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 contactsAssociationID]);
  -[GKPlayerInternal setContactsAssociationID:](self, "setContactsAssociationID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v26 serviceLastUpdatedTimestamp]);
  -[GKPlayerInternal setServiceLastUpdatedTimestamp:](self, "setServiceLastUpdatedTimestamp:", v25);

  -[GKPlayerInternal setAllowReceivingFriendInvites:]( self,  "setAllowReceivingFriendInvites:",  [v26 allowReceivingFriendInvites]);
  -[GKPlayerInternal setAllowChallengeFriendInvites:]( self,  "setAllowChallengeFriendInvites:",  [v26 allowChallengeFriendInvites]);
  -[GKPlayerInternal setAllowMultiplayerFriendInvites:]( self,  "setAllowMultiplayerFriendInvites:",  [v26 allowMultiplayerFriendInvites]);
}

+ (unsigned)piecesToLoad
{
  return +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:]( GKPlayerProfileCacheObject,  "piecesToLoadForFamiliarity:",  [a1 familiarity]);
}

+ (int)familiarity
{
  return 0;
}

@end