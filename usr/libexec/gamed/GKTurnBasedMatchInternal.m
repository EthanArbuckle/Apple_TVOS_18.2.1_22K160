@interface GKTurnBasedMatchInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKTurnBasedMatchInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKTurnBasedMatchInternal(Cache) updateWithCacheObject:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKTurnBasedMatchInternal(Cache) updateWithCacheObject:]",  [v10 UTF8String],  308));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
  -[GKTurnBasedMatchInternal setMatchID:](self, "setMatchID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 status]);
  -[GKTurnBasedMatchInternal setStatus:](self, "setStatus:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 creationDate]);
  -[GKTurnBasedMatchInternal setCreationDate:](self, "setCreationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 lastTurnDate]);
  -[GKTurnBasedMatchInternal setLastTurnDate:](self, "setLastTurnDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  -[GKTurnBasedMatchInternal setMessage:](self, "setMessage:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localizableMessage]);
  id v20 = +[NSPropertyListSerialization _gkTypesafePropertyListWithData:withClass:]( &OBJC_CLASS___NSPropertyListSerialization,  "_gkTypesafePropertyListWithData:withClass:",  v18,  objc_opt_class(&OBJC_CLASS___NSDictionary, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[GKTurnBasedMatchInternal setLocalizableMessage:](self, "setLocalizableMessage:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
  -[GKTurnBasedMatchInternal setReason:](self, "setReason:", v22);

  -[GKTurnBasedMatchInternal setMinPlayers:](self, "setMinPlayers:", [v4 minPlayers]);
  -[GKTurnBasedMatchInternal setMaxPlayers:](self, "setMaxPlayers:", [v4 maxPlayers]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 deletionDate]);
  -[GKTurnBasedMatchInternal setDeletionDate:](self, "setDeletionDate:", v23);

  -[GKTurnBasedMatchInternal setCurrentParticipant:]( self,  "setCurrentParticipant:",  (char)[v4 currentParticipant]);
  -[GKTurnBasedMatchInternal setTurnNumber:](self, "setTurnNumber:", [v4 turnNumber]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 lastTurnPlayerID]);
  -[GKTurnBasedMatchInternal setLastTurnPlayerID:](self, "setLastTurnPlayerID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 gameData]);
  -[GKTurnBasedMatchInternal setMatchData:](self, "setMatchData:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 matchDataVersion]);
  -[GKTurnBasedMatchInternal setMatchDataVersion:](self, "setMatchDataVersion:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[GKTurnBasedMatchInternal setBundleID:](self, "setBundleID:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleVersion]);
  -[GKTurnBasedMatchInternal setBundleVersion:](self, "setBundleVersion:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 shortBundleVersion]);
  -[GKTurnBasedMatchInternal setShortBundleVersion:](self, "setShortBundleVersion:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 participants]);
  v31 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 0LL);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPlayerID]);

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPlayerID]);
    -[NSMutableSet addObject:](v31, "addObject:", v33);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v30 _gkValuesForKeyPath:@"playerID"]);
  -[NSMutableSet addObjectsFromArray:](v31, "addObjectsFromArray:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue([v30 _gkValuesForKeyPath:@"invitedBy"]);
  -[NSMutableSet addObjectsFromArray:](v31, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v31, "allObjects"));
  v51 = (void *)v12;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfilesWithPlayerIDs:inManagedObjectContext:",  v36,  v12));

  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 _gkValuesForKeyPath:@"internalRepresentation"]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 _gkMapDictionaryWithKeyPath:@"playerID"]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPlayerID]);
  id v41 = [v40 length];

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPlayerID]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v42]);
    -[GKTurnBasedMatchInternal setCurrentPlayer:](self, "setCurrentPlayer:", v43);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v4 participants]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 array]);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000FA9CC;
  v52[3] = &unk_100272790;
  id v53 = v39;
  id v46 = v39;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v45 _gkMapWithBlock:v52]);
  -[GKTurnBasedMatchInternal setParticipants:](self, "setParticipants:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue([v4 exchanges]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 array]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 _gkMapWithBlock:&stru_1002727D0]);
  -[GKTurnBasedMatchInternal setExchanges:](self, "setExchanges:", v50);
}

@end