@interface GKTurnBasedSessionCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)entityName;
+ (id)relationshipKeyPathsForPrefetch;
+ (id)sessionWithID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)sessionsWithSessionIDs:(id)a3 inContext:(id)a4;
+ (id)uniqueAttributeName;
- (BOOL)isActive;
- (id)gameData;
- (id)internalRepresentation;
- (id)participantAtIndex:(int64_t)a3;
- (id)participantWithPlayerID:(id)a3;
- (void)deleteGameData;
- (void)expire;
- (void)expireGameData;
- (void)prepareForDeletion;
- (void)saveGameData:(id)a3 expirationDate:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKTurnBasedSessionCacheObject

+ (id)entityName
{
  return @"TurnBasedSession";
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"exchanges",  @"participants",  0LL);
}

- (BOOL)isActive
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject status](self, "status"));
  if ([v3 isEqualToString:@"Active"])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject status](self, "status"));
    unsigned __int8 v4 = [v5 isEqualToString:@"Invited"];
  }

  return v4;
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKTurnBasedSessionCacheObject;
  -[GKTurnBasedSessionCacheObject prepareForDeletion](&v3, "prepareForDeletion");
}

- (id)gameData
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject gameData]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionCacheObject gameData]",  [v8 UTF8String],  3770));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
  uint64_t v11 = GKTurnBasedGameDataCacheRoot();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v12));
    if (!v13) {
      -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0LL);
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)deleteGameData
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject deleteGameData]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionCacheObject deleteGameData]",  [v8 UTF8String],  3784));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
  uint64_t v11 = GKTurnBasedGameDataCacheRoot();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v14 = [v13 removeItemAtPath:v12 error:0];

    if (v14)
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v15);
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000D84C8();
      }
    }
  }

  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0LL);
}

- (void)expireGameData
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject expireGameData]",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionCacheObject expireGameData]",  [v8 UTF8String],  3797));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v10);
}

- (void)saveGameData:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]",  [v13 UTF8String],  3803));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  if (v6)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject sessionID](self, "sessionID"));
    uint64_t v16 = GKTurnBasedGameDataCacheRoot();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (!v17)
    {
LABEL_15:

      goto LABEL_16;
    }

    id v27 = 0LL;
    unsigned __int8 v18 = [v6 writeToFile:v17 options:1 error:&v27];
    id v19 = v27;
    v20 = v19;
    if ((v18 & 1) != 0)
    {
LABEL_6:
      id v21 = v7;
LABEL_14:
      -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v21);

      goto LABEL_15;
    }

    if ([v19 code] == (id)4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByDeletingLastPathComponent]);
      v23 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
      if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v23,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v22,  1LL,  0LL,  0LL))
      {
        id v26 = v20;
        unsigned int v24 = [v6 writeToFile:v17 options:1 error:&v26];
        id v25 = v26;

        if (!v24)
        {
          id v21 = 0LL;
          v20 = v25;
          goto LABEL_14;
        }

        v20 = v25;
        goto LABEL_6;
      }
    }

    id v21 = 0LL;
    goto LABEL_14;
  }

  -[GKTurnBasedSessionCacheObject deleteGameData](self, "deleteGameData");
LABEL_16:
}

- (id)participantWithPlayerID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]",  [v10 UTF8String],  3832));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000D203C;
    v17[3] = &unk_10026F070;
    id v18 = v4;
    id v13 = [v12 indexOfObjectPassingTest:v17];

    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v14 = 0LL;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v13]);
    }
  }

  else
  {
    unsigned int v14 = 0LL;
  }

  return v14;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D81F0();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]",  v12));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]",  [v15 UTF8String],  3853));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v83.receiver = self;
  v83.super_class = (Class)&OBJC_CLASS___GKTurnBasedSessionCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v83,  "updateWithServerRepresentation:expirationDate:",  v6,  0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"session-id"]);
  if (v17) {
    -[GKTurnBasedSessionCacheObject setSessionID:](self, "setSessionID:", v17);
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"created-at"]);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v18));
    -[GKTurnBasedSessionCacheObject setCreationDate:](self, "setCreationDate:", v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"session-status"]);

  if (v20) {
    -[GKTurnBasedSessionCacheObject setStatus:](self, "setStatus:", v20);
  }
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"current-player-id"]);

  if (v21)
  {
    if ([v21 length]) {
      v22 = v21;
    }
    else {
      v22 = 0LL;
    }
    -[GKTurnBasedSessionCacheObject setCurrentPlayerID:](self, "setCurrentPlayerID:", v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"current-guest-id"]);

  if (v23)
  {
    if ([v23 length]) {
      unsigned int v24 = v23;
    }
    else {
      unsigned int v24 = 0LL;
    }
    -[GKTurnBasedSessionCacheObject setCurrentGuestID:](self, "setCurrentGuestID:", v24);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"last-turn-at"]);

  if (v25)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v25));
    -[GKTurnBasedSessionCacheObject setLastTurnDate:](self, "setLastTurnDate:", v26);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle-id"]);

  if (v27) {
    -[GKTurnBasedSessionCacheObject setBundleID:](self, "setBundleID:", v27);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle-version"]);

  if (v28) {
    -[GKTurnBasedSessionCacheObject setBundleVersion:](self, "setBundleVersion:", v28);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"short-bundle-version"]);

  if (v29) {
    -[GKTurnBasedSessionCacheObject setShortBundleVersion:](self, "setShortBundleVersion:", v29);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"platform"]);

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:]( &OBJC_CLASS___GKGameDescriptor,  "gamePlatformFromServerGameDescriptorString:",  v30)));
    -[GKTurnBasedSessionCacheObject setPlatform:](self, "setPlatform:", v31);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"slots"]);
  if (v32)
  {
    -[GKTurnBasedSessionCacheObject setExpirationDate:](self, "setExpirationDate:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"match-id"]);

    if (v33) {
      -[GKTurnBasedSessionCacheObject setUnusedID:](self, "setUnusedID:", v33);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"taken-at"]);

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v34));
      -[GKTurnBasedSessionCacheObject setLastTurnDate:](self, "setLastTurnDate:", v35);
    }

    v71 = v8;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"delete-at"]);

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v36));
      -[GKTurnBasedSessionCacheObject setDeletionDate:](self, "setDeletionDate:", v37);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"message"]);

    if (v38) {
      -[GKTurnBasedSessionCacheObject setMessage:](self, "setMessage:", v38);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"localized-message"]);

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v39,  100LL,  0LL,  0LL));
      -[GKTurnBasedSessionCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v40);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"reason"]);

    if (v41) {
      -[GKTurnBasedSessionCacheObject setReason:](self, "setReason:", v41);
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"min-players"]);

    if (v42) {
      -[GKTurnBasedSessionCacheObject setMinPlayers:](self, "setMinPlayers:", [v42 integerValue]);
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"max-players"]);

    if (v43) {
      -[GKTurnBasedSessionCacheObject setMaxPlayers:](self, "setMaxPlayers:", [v43 integerValue]);
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"whose-turn"]);

    if (v44)
    {
      if ([v44 length]) {
        v45 = v44;
      }
      else {
        v45 = 0LL;
      }
      -[GKTurnBasedSessionCacheObject setCurrentPlayerID:](self, "setCurrentPlayerID:", v45);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"turn-on-slot"]);

    if (v46) {
      -[GKTurnBasedSessionCacheObject setCurrentParticipant:]( self,  "setCurrentParticipant:",  [v46 integerValue]);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"turn-number"]);

    if (v47)
    {
      id v48 = [v47 integerValue];
      if (v48 != (id)(int)-[GKTurnBasedSessionCacheObject turnNumber](self, "turnNumber"))
      {
        -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", 0LL);
        -[GKTurnBasedSessionCacheObject setTurnNumber:](self, "setTurnNumber:", v48);
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"submitted-by"]);

    if (v30)
    {
      if ([v30 length]) {
        v49 = v30;
      }
      else {
        v49 = 0LL;
      }
      -[GKTurnBasedSessionCacheObject setLastTurnPlayerID:](self, "setLastTurnPlayerID:", v49);
    }

    v50 = objc_autoreleasePoolPush();
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject managedObjectContext](self, "managedObjectContext"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedSessionCacheObject mutableOrderedSetValueForKey:]( self,  "mutableOrderedSetValueForKey:",  @"participants"));
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_1000D2A2C;
    v81[3] = &unk_100270060;
    id v53 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v52 count]));
    id v82 = v53;
    [v52 enumerateObjectsUsingBlock:v81];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_1000D2A98;
    v77[3] = &unk_10026DB50;
    id v54 = v53;
    id v78 = v54;
    id v55 = v51;
    id v79 = v55;
    id v56 = v52;
    id v80 = v56;
    [v32 enumerateObjectsUsingBlock:v77];
    v57 = (void *)objc_claimAutoreleasedReturnValue([v54 allValues]);
    [v55 _gkDeleteObjects:v57];

    v58 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"exchanges"]);
    if (v58)
    {
      v69 = v50;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject exchanges](self, "exchanges"));
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 _gkMapDictionaryWithKeyPath:@"exchangeID"]);
      v70 = v32;
      id v61 = [v60 mutableCopy];

      v62 = (void *)objc_claimAutoreleasedReturnValue( -[GKTurnBasedSessionCacheObject mutableOrderedSetValueForKey:]( self,  "mutableOrderedSetValueForKey:",  @"exchanges"));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = sub_1000D2B54;
      v72[3] = &unk_10026DA10;
      id v73 = v61;
      id v63 = v55;
      id v74 = v63;
      id v75 = v56;
      id v76 = v62;
      id v68 = v62;
      id v64 = v61;
      [v58 enumerateObjectsUsingBlock:v72];
      v65 = (void *)objc_claimAutoreleasedReturnValue([v64 allValues]);
      [v63 _gkDeleteObjects:v65];

      v50 = v69;
      v32 = v70;
    }

    objc_autoreleasePoolPop(v50);
    id v8 = v71;
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"game-state"]);

  if (v66) {
    -[GKTurnBasedSessionCacheObject saveGameData:expirationDate:](self, "saveGameData:expirationDate:", v66, v8);
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"game-state-version"]);

  if (v67) {
    -[GKTurnBasedSessionCacheObject setMatchDataVersion:](self, "setMatchDataVersion:", v67);
  }
}

+ (id)sessionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionsWithSessionIDs:inContext:", v8, v6, v12));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

  return v10;
}

+ (id)uniqueAttributeName
{
  return @"sessionID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKTurnBasedSessionCacheObjectUniqueObjectIDLookupKey";
}

+ (id)sessionsWithSessionIDs:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D8528();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]",  v12));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]",  [v15 UTF8String],  4035));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueObjectIDLookupWithContext:v8]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D2EF8;
  v21[3] = &unk_100271610;
  id v22 = v8;
  id v23 = a1;
  id v18 = v8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueObjectsForKeys:v6 context:v18 newObject:v21]);

  return v19;
}

- (void)expire
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKTurnBasedSessionCacheObject;
  -[GKExpiringCacheObject expire](&v4, "expire");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject expirationDate](self, "expirationDate"));
  -[GKTurnBasedSessionCacheObject setDataExpirationDate:](self, "setDataExpirationDate:", v3);
}

- (id)participantAtIndex:(int64_t)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject participantAtIndex:]",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedSessionCacheObject participantAtIndex:]",  [v10 UTF8String],  4051));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
  id v13 = [v12 count];

  if ((unint64_t)v13 <= a3)
  {
    id v15 = 0LL;
  }

  else
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionCacheObject participants](self, "participants"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:a3]);
  }

  return v15;
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedSessionCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKTurnBasedSessionCacheObject internalRepresentation]",  [v8 UTF8String],  4061));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  return +[GKTurnBasedMatchInternal internalRepresentationForCacheObject:]( &OBJC_CLASS___GKTurnBasedMatchInternal,  "internalRepresentationForCacheObject:",  self);
}

@end