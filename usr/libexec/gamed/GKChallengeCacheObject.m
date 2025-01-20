@interface GKChallengeCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)challengeWithServerRepresentation:(id)a3 context:(id)a4;
+ (id)challengesWithChallengeIDs:(id)a3 context:(id)a4;
+ (id)entityName;
+ (id)fetchSortDescriptors;
+ (id)uniqueAttributeName;
- (BOOL)hasDetails;
- (Class)classForInternalRepresentation;
- (id)internalRepresentation;
- (id)orderedSetOfCompatibleBundleIDs;
- (void)invalidate;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKChallengeCacheObject

+ (id)uniqueAttributeName
{
  return @"challengeID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKChallengeCacheObjectUniqueObjectIDLookupKey";
}

+ (id)challengesWithChallengeIDs:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKChallengeCacheObject challengesWithChallengeIDs:context:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKChallengeCacheObject challengesWithChallengeIDs:context:]",  [v13 UTF8String],  4496));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueObjectIDLookupWithContext:v7]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueObjectsForKeys:v6 context:v7 newObject:0]);

  return v16;
}

+ (id)challengeWithServerRepresentation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKChallengeCacheObject challengeWithServerRepresentation:context:]",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v11,  "+[GKChallengeCacheObject challengeWithServerRepresentation:context:]",  [v13 UTF8String],  4502));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueObjectIDLookupWithContext:v7]);
  id v23 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D5A3C;
  v21[3] = &unk_1002716C0;
  id v22 = v7;
  id v17 = v7;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 insertObjectsForServerRepresentations:v16 context:v17 newObject:v21]);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastObject]);
  return v19;
}

+ (id)fetchSortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"issueDate",  0LL));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (Class)classForInternalRepresentation
{
  return 0LL;
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKChallengeCacheObject internalRepresentation]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKChallengeCacheObject internalRepresentation]",  [v8 UTF8String],  4537));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  uint64_t v11 = objc_opt_class(self, v10);
  if (v11 != objc_opt_class(&OBJC_CLASS___GKChallengeCacheObject, v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class internalRepresentation]( -[GKChallengeCacheObject classForInternalRepresentation](self, "classForInternalRepresentation"),  "internalRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject bundleID](self, "bundleID"));
    [v13 setBundleID:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject issuingPlayerID](self, "issuingPlayerID"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerInternal internalRepresentation]( &OBJC_CLASS___GKPlayerInternal,  "internalRepresentation"));
      [v16 setPlayerID:v15];
      [v13 setIssuingPlayer:v16];
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject receivingPlayerID](self, "receivingPlayerID"));
    if (v17)
    {
      v18 = (void *)v17;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject selfPlayerID]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "selfPlayerID"));

      if (!v18)
      {
LABEL_11:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject issueDate](self, "issueDate"));
        [v13 setIssueDate:v20];

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject completionDate](self, "completionDate"));
        [v13 setCompletionDate:v21];

        objc_msgSend(v13, "setState:", -[GKChallengeCacheObject state](self, "state"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject challengeID](self, "challengeID"));
        [v13 setChallengeID:v22];

        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject message](self, "message"));
        [v13 setMessage:v23];

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 valueForKeyPath:@"bundleID"]);
        [v13 setCompatibleBundleIDs:v25];

        return v13;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentation](&OBJC_CLASS___GKPlayerInternal, "internalRepresentation"));
    [v19 setPlayerID:v18];
    [v13 setReceivingPlayer:v19];

    goto LABEL_11;
  }

  id v13 = 0LL;
  return v13;
}

- (id)orderedSetOfCompatibleBundleIDs
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKChallengeCacheObject orderedSetOfCompatibleBundleIDs]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKChallengeCacheObject orderedSetOfCompatibleBundleIDs]",  [v8 UTF8String],  4574));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
  id v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___NSMutableOrderedSet);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    v14 = -[NSMutableOrderedSet initWithCapacity:](v12, "initWithCapacity:", [v13 count]);

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)v19) bundleID]);
          -[NSMutableOrderedSet addObject:](v14, "addObject:", v20);

          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v17);
    }
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKChallengeCacheObject updateWithServerRepresentation:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKChallengeCacheObject updateWithServerRepresentation:]",  [v10 UTF8String],  4587));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___GKChallengeCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v40, "updateWithServerRepresentation:", v4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject managedObjectContext](self, "managedObjectContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"challenge-id"]);
  -[GKChallengeCacheObject setChallengeID:](self, "setChallengeID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"issue-timestamp"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v14));
  -[GKChallengeCacheObject setIssueDate:](self, "setIssueDate:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"message"]);
  if (v16) {
    -[GKChallengeCacheObject setMessage:](self, "setMessage:", v16);
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"issuing-player-id"]);

  if (v17) {
    -[GKChallengeCacheObject setIssuingPlayerID:](self, "setIssuingPlayerID:", v17);
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"receiving-player-id"]);

  if (v18) {
    -[GKChallengeCacheObject setReceivingPlayerID:](self, "setReceivingPlayerID:", v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundle-id"]);

  if (v19) {
    -[GKChallengeCacheObject setBundleID:](self, "setBundleID:", v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"completion-timestamp"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](&OBJC_CLASS___NSDate, "_gkDateFromServerTimestamp:", v20));

  if (v21) {
    -[GKChallengeCacheObject setCompletionDate:](self, "setCompletionDate:", v21);
  }
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"completion-status"]);

  if (v22) {
    -[GKChallengeCacheObject setState:](self, "setState:", [v22 unsignedIntValue]);
  }
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"compatible-games"]);
  if (v23)
  {
    v34 = v22;
    id v35 = v4;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject compatibleBundleIDs](self, "compatibleBundleIDs"));
    __int128 v25 = (NSMutableOrderedSet *)[v24 mutableCopy];

    if (!v25) {
      __int128 v25 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v23 count]);
    }
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    v33 = v23;
    id v26 = v23;
    id v27 = [v26 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v37;
      do
      {
        v30 = 0LL;
        do
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)v30);
          v32 = (GKChallengeCompatibleBundleID *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](v25, "firstObject"));
          if (!v32)
          {
            v32 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKChallengeCompatibleBundleID),  "initWithManagedObjectContext:",  v12);
            -[GKChallengeCompatibleBundleID setChallenge:](v32, "setChallenge:", self);
          }

          -[GKChallengeCompatibleBundleID setBundleID:](v32, "setBundleID:", v31);
          -[NSMutableOrderedSet removeObject:](v25, "removeObject:", v32);

          v30 = (char *)v30 + 1;
        }

        while (v28 != v30);
        id v28 = [v26 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v28);
    }

    [v12 _gkDeleteObjects:v25];
    __int128 v22 = v34;
    id v4 = v35;
    __int128 v23 = v33;
  }
}

+ (id)entityName
{
  return @"Challenge";
}

- (BOOL)hasDetails
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKChallengeCacheObject hasDetails]",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v6,  "-[GKChallengeCacheObject hasDetails]",  [v8 UTF8String],  4649));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeCacheObject detailsExpirationDate](self, "detailsExpirationDate"));
  BOOL v11 = v10 != 0LL;

  return v11;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKChallengeCacheObject;
  -[GKCacheObject invalidate](&v3, "invalidate");
  -[GKChallengeCacheObject setDetailsExpirationDate:](self, "setDetailsExpirationDate:", 0LL);
}

@end