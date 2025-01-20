@interface GKTurnBasedParticipantCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKTurnBasedParticipantCacheObject

+ (id)entityName
{
  return @"TurnBasedParticipant";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4078));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GKTurnBasedParticipantCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v24, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-id"]);
  if ([v12 length]) {
    v13 = v12;
  }
  else {
    v13 = 0LL;
  }
  -[GKTurnBasedParticipantCacheObject setPlayerID:](self, "setPlayerID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"invited-by"]);

  if ([v14 length]) {
    v15 = v14;
  }
  else {
    v15 = 0LL;
  }
  -[GKTurnBasedParticipantCacheObject setInvitedBy:](self, "setInvitedBy:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"invite-message"]);
  -[GKTurnBasedParticipantCacheObject setInviteMessage:](self, "setInviteMessage:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-status-code"]);
  -[GKTurnBasedParticipantCacheObject setOutcome:](self, "setOutcome:", [v17 integerValue]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-status"]);
  -[GKTurnBasedParticipantCacheObject setStatus:](self, "setStatus:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"guest-id"]);
  -[GKTurnBasedParticipantCacheObject setGuestID:](self, "setGuestID:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-last-turn-at"]);
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v20));
    -[GKTurnBasedParticipantCacheObject setLastTurnDate:](self, "setLastTurnDate:", v21);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"player-timeout-at"]);
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v22));
    -[GKTurnBasedParticipantCacheObject setTimeoutDate:](self, "setTimeoutDate:", v23);
  }
}

- (id)internalRepresentation
{
  return 0LL;
}

@end