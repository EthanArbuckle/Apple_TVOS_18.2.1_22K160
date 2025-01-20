@interface GKInviteSession
- (BOOL)shouldBeCleared;
- (CKRecordID)shareRecordID;
- (GKInviteSession)init;
- (GKInviteSession)initWithSessionToken:(id)a3;
- (NSArray)responses;
- (NSData)sessionToken;
- (NSMutableArray)invitedPlayers;
- (NSMutableArray)shareInvitees;
- (NSMutableDictionary)invitees;
- (OS_dispatch_queue)syncQueue;
- (id)allInvitees;
- (id)referencesForInvitee:(id)a3;
- (void)addInvitee:(id)a3 reference:(id)a4;
- (void)addResponse:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)removeAllInvitees;
- (void)removeAllResponses;
- (void)removeInvitee:(id)a3 reference:(id)a4;
- (void)setInvitedPlayers:(id)a3;
- (void)setInvitees:(id)a3;
- (void)setResponses:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setShareInvitees:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setSyncQueue:(id)a3;
@end

@implementation GKInviteSession

- (GKInviteSession)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKInviteSession;
  v2 = -[GKInviteSession init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.gamed.invitesession", v4);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v5;

    v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    invitees = v2->_invitees;
    v2->_invitees = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSArray);
    responses = v2->_responses;
    v2->_responses = v9;

    v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    invitedPlayers = v2->_invitedPlayers;
    v2->_invitedPlayers = v11;

    v13 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    shareInvitees = v2->_shareInvitees;
    v2->_shareInvitees = v13;
  }

  return v2;
}

- (GKInviteSession)initWithSessionToken:(id)a3
{
  id v5 = a3;
  v6 = -[GKInviteSession init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionToken, a3);
  }

  return v7;
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKInviteSession: performAsync", v8, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_syncQueue, v5);
}

- (void)performSync:(id)a3
{
}

- (void)addInvitee:(id)a3 reference:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_invitees, "objectForKey:", v7));
    if (v8)
    {
      if (!v6)
      {
LABEL_5:

        goto LABEL_6;
      }
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
      -[NSMutableDictionary setObject:forKey:](self->_invitees, "setObject:forKey:", v8, v7);
      -[NSMutableArray addObject:](self->_invitedPlayers, "addObject:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"inviteInvitee.%@",  v7));
      [v9 beginTransaction:v10];

      if (!v6) {
        goto LABEL_5;
      }
    }

    [v8 addObject:v6];
    goto LABEL_5;
  }

- (void)removeInvitee:(id)a3 reference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
    *(_DWORD *)buf = 138412546;
    v41 = v12;
    __int16 v42 = 2112;
    v43 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKInviteSession: removeInvitee: %@ refrence: %@",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_invitees, "objectForKey:", v13));
    v15 = v14;
    if (v14)
    {
      if (!v8 || ([v14 removeObject:v8], !objc_msgSend(v15, "count")))
      {
        -[NSMutableDictionary removeObjectForKey:](self->_invitees, "removeObjectForKey:", v13);
        id v16 = -[NSMutableArray removeObject:](self->_invitedPlayers, "removeObject:", v6);
        if (!os_log_GKGeneral) {
          id v17 = (id)GKOSLoggers(v16);
        }
        v18 = (os_log_s *)os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "GKInviteSession: removeInvitee: reference exist and player has been removed from _invitees/_invitedPlayers",  buf,  2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"inviteInvitee.%@",  v13));
        [v19 endTransaction:v20];
      }
    }

    id v21 = -[NSMutableDictionary count](self->_invitees, "count");
    if (v21 || (id v21 = -[NSMutableArray count](self->_shareInvitees, "count")) != 0LL)
    {
      if (!os_log_GKGeneral) {
        id v22 = (id)GKOSLoggers(v21);
      }
      v23 = (void *)os_log_GKMatch;
      BOOL v24 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v24)
      {
        v25 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession sessionToken](self, "sessionToken"));
        *(_DWORD *)buf = 138412290;
        v41 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "GKInviteSession - Still have invitees in invite session, %@",  buf,  0xCu);
      }

      if (!os_log_GKGeneral) {
        id v27 = (id)GKOSLoggers(v24);
      }
      v28 = (void *)os_log_GKMatch;
      BOOL v29 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v29)
      {
        v30 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession invitees](self, "invitees"));
        *(_DWORD *)buf = 138412290;
        v41 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "invitees %@", buf, 0xCu);
      }

      if (!os_log_GKGeneral) {
        id v32 = (id)GKOSLoggers(v29);
      }
      v33 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession shareInvitees](self, "shareInvitees"));
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "shareInvitees %@", buf, 0xCu);
      }
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v36 = (id)GKOSLoggers(0LL);
      }
      v37 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession sessionToken](self, "sessionToken"));
        *(_DWORD *)buf = 138412290;
        v41 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "No more invitees, clearing session token %@",  buf,  0xCu);
      }

      -[GKInviteSession setSessionToken:](self, "setSessionToken:", 0LL);
    }
  }
}

- (id)referencesForInvitee:(id)a3
{
  invitees = self->_invitees;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 playerID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](invitees, "objectForKey:", v4));

  return v5;
}

- (id)allInvitees
{
  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_invitedPlayers);
}

- (void)removeAllInvitees
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllInvitees", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_invitees;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) conciseDescription]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"inviteInvitee.%@",  v11));
        [v5 endTransaction:v12];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v8);
  }

  -[NSMutableDictionary removeAllObjects](self->_invitees, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_invitedPlayers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_shareInvitees, "removeAllObjects");
}

- (void)addResponse:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_responses, "arrayByAddingObject:", a3));
  -[GKInviteSession setResponses:](self, "setResponses:", v4);
}

- (void)removeAllResponses
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllResponses", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  -[GKInviteSession setResponses:](self, "setResponses:", v5);
}

- (BOOL)shouldBeCleared
{
  id v3 = -[NSMutableDictionary count](self->_invitees, "count");
  if (v3
    || (id v3 = -[NSArray count](self->_responses, "count")) != 0
    || (id v3 = -[NSMutableArray count](self->_shareInvitees, "count")) != 0LL)
  {
    if (!os_log_GKGeneral) {
      id v4 = (id)GKOSLoggers(v3);
    }
    id v5 = (os_log_s *)os_log_GKMatch;
    BOOL v6 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "GKInviteSession - SHOULD NOT be cleared because still have items:",  (uint8_t *)&v20,  2u);
    }

    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v6);
    }
    id v8 = (os_log_s *)os_log_GKMatch;
    BOOL v9 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v9)
    {
      invitees = self->_invitees;
      int v20 = 138412290;
      id v21 = invitees;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "invitees %@", (uint8_t *)&v20, 0xCu);
    }

    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers(v9);
    }
    v12 = (os_log_s *)os_log_GKMatch;
    BOOL v13 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v13)
    {
      shareInvitees = self->_shareInvitees;
      int v20 = 138412290;
      id v21 = shareInvitees;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "shareInvitees %@", (uint8_t *)&v20, 0xCu);
    }

    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers(v13);
    }
    __int128 v16 = (os_log_s *)os_log_GKMatch;
    BOOL v17 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v17)
    {
      responses = self->_responses;
      int v20 = 138412290;
      id v21 = responses;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "responses %@", (uint8_t *)&v20, 0xCu);
      LOBYTE(v17) = 0;
    }
  }

  else
  {
    LOBYTE(v17) = 1;
  }

  return v17;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSMutableArray)shareInvitees
{
  return self->_shareInvitees;
}

- (void)setShareInvitees:(id)a3
{
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
}

- (NSMutableArray)invitedPlayers
{
  return self->_invitedPlayers;
}

- (void)setInvitedPlayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end