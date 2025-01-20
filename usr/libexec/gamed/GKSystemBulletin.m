@interface GKSystemBulletin
+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 group:(id)a6;
+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 profile:(id)a6 client:(id)a7 localPlayerInternal:(id)a8;
+ (void)expireFriendCodeDetails:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)expireGetPerGameFriendPlayerIDsCache:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)expireGetPerGameSettingsCaches:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)presentGameCenterInviteUpdate:(id)a3 playerAlias:(id)a4;
- (void)handleAction:(id)a3;
@end

@implementation GKSystemBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKSystemBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletin cacheTransactionGroup](&OBJC_CLASS___GKBulletin, "cacheTransactionGroup"));
  id v13 = [objc_alloc((Class)a1) initWithPushNotification:v6];
  id v14 = [v13 pushCommand];
  int v15 = (int)v14;
  if ((unsigned __int16)v14 <= 0xEFu)
  {
    if ((unsigned __int16)v14 == 51)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:GKFriendRequestURLFriendCode]);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1001076D8;
      v27[3] = &unk_10026B408;
      id v28 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:GKFriendRequestPushAcceptorID]);
      id v29 = v20;
      id v30 = v6;
      id v21 = v20;
      id v22 = v28;
      [v12 performOnManagedObjectContext:v27];

      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"game"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"bundle-id"]);
    v18 = v17;
    if (v16 && v17)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1001074C4;
      v34[3] = &unk_10026B608;
      id v35 = v17;
      id v36 = v16;
      [v12 performOnManagedObjectContext:v34];
    }

LABEL_19:
    if (!v8) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  switch((unsigned __int16)v14)
  {
    case 0xF0u:
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKPushReceiverID]);
      BOOL v19 = +[GKBulletin playerIsLocal:](&OBJC_CLASS___GKBulletin, "playerIsLocal:", v16);
      if (!v19)
      {
        if (!os_log_GKGeneral) {
          id v25 = (id)GKOSLoggers(v19);
        }
        v26 = (os_log_s *)os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "GKSystemBulletin bulletin is not meant for current local player. Skipping.",  buf,  2u);
        }

        v8[2](v8, 0LL);

        goto LABEL_30;
      }

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100107570;
      v31[3] = &unk_10026B608;
      id v32 = v6;
      id v33 = v12;
      [v33 performOnManagedObjectContext:v31];

      goto LABEL_19;
    case 0xFEu:
      [v11 resetEnvironment];
      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
    case 0xFDu:
      [v11 clearPushEnvironment];
      if (!v8) {
        goto LABEL_30;
      }
      goto LABEL_29;
  }

+ (void)presentGameCenterInviteUpdate:(id)a3 playerAlias:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [objc_alloc((Class)a1) initWithPushNotification:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v16 setDate:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  [v16 setExpirationDate:v9];

  [v16 setBulletinType:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings GAME_CENTER_FRIEND_REQUEST_ACCEPTED]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "GAME_CENTER_FRIEND_REQUEST_ACCEPTED"));
  [v16 setMessage:v10];

  [v16 setHasSound:1];
  [v16 setSoundPath:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v16 setDate:v11];

  [v16 setTitle:v6];
  v12 = objc_alloc_init(&OBJC_CLASS___GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 2LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings BULLETIN_VIEW]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "BULLETIN_VIEW"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKFriendRequestPushAcceptorID]);
  -[GKBulletinAction setInfo:](v12, "setInfo:", v14);

  [v16 setDefaultAction:v12];
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  [v15 presentBulletin:v16];
}

+ (void)expireGetPerGameSettingsCaches:(id)a3 payload:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDGameSettings _gkFetchRequest](&OBJC_CLASS___GKCDGameSettings, "_gkFetchRequest"));
  if ([v7 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"bundleID == %@",  v7));
    [v10 setPredicate:v11];
  }

  id v43 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v10 error:&v43]);
  id v13 = v43;
  if (v13)
  {
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    __int128 v39 = 0uLL;
    __int128 v40 = 0uLL;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          [v9 deleteObject:*(void *)(*((void *)&v39 + 1) + 8 * (void)i)];
        }

        id v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }

      while (v16);
    }

    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers(v19);
    }
    id v21 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "expireGetPerGameSettingsCaches: Could not fetch data from cache: %@",  buf,  0xCu);
    }
  }

  else
  {
    __int128 v37 = 0uLL;
    __int128 v38 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    id v22 = v12;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) setExpirationDate:0];
        }

        id v24 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }

      while (v24);
    }
  }

  uint64_t v27 = GKPushFriendsAuthorizationStatus;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:GKPushFriendsAuthorizationStatus]);
  if (v28)
  {
    id v29 = (void *)v28;
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v27]);
    id v31 = [v30 integerValue];
    id v32 = (id)GKPushFriendsAuthorizationStatusRemoved;

    if (v31 == v32)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:credential:]( &OBJC_CLASS___GKGameService,  "serviceWithTransport:forClient:credential:",  0LL,  v33,  0LL));
      [v34 resetTCCAuthorization:&stru_100273080];
    }
  }
}

+ (void)expireGetPerGameFriendPlayerIDsCache:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDGameFriendList _gkFetchRequest](&OBJC_CLASS___GKCDGameFriendList, "_gkFetchRequest"));
  if ([v6 length])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"bundleID == %@",  v6));
    [v8 setPredicate:v9];
  }

  id v33 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v8 error:&v33]);
  id v11 = v33;
  if (v11)
  {
    __int128 v31 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v30 = 0uLL;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          [v7 deleteObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)i)];
        }

        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v14);
    }

    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers(v17);
    }
    uint64_t v19 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@",  buf,  0xCu);
    }
  }

  else
  {
    __int128 v27 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    id v20 = v10;
    id v21 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) setExpirationDate:0];
        }

        id v22 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }

      while (v22);
    }
  }
}

+ (void)expireFriendCodeDetails:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDFriendCodeDetail _gkFetchRequest](&OBJC_CLASS___GKCDFriendCodeDetail, "_gkFetchRequest"));
  if ([v6 length])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"friendCode == %@",  v6));
    [v8 setPredicate:v9];
  }

  id v33 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v8 error:&v33]);
  id v11 = v33;
  if (v11)
  {
    __int128 v31 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v30 = 0uLL;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          [v7 deleteObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)i)];
        }

        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v14);
    }

    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers(v17);
    }
    uint64_t v19 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@",  buf,  0xCu);
    }
  }

  else
  {
    __int128 v27 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    id v20 = v10;
    id v21 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) setExpirationDate:0];
        }

        id v22 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }

      while (v22);
    }
  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 group:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v12);
  }
  uint64_t v15 = (os_log_s *)os_log_GKTrace;
  BOOL v16 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKSystemBulletin expireCachesForKey: context:",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v16);
  }
  id v18 = (os_log_s *)os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_100109D90((uint64_t)v9, v18);
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v20, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]",  v21));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSystemBulletin.m"));
    id v24 = objc_claimAutoreleasedReturnValue([v23 lastPathComponent]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v22,  "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]",  [v24 UTF8String],  251));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v25);
  }

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "localPlayerInManagedObjectContext:",  v11));
  if (v26)
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 internalRepresentation]);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKUtilityServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v27,  v28));
    +[GKSystemBulletin expireCachesForBagKey:payload:context:profile:client:localPlayerInternal:]( &OBJC_CLASS___GKSystemBulletin,  "expireCachesForBagKey:payload:context:profile:client:localPlayerInternal:",  v9,  v10,  v11,  v26,  v27,  v28);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1001084D0;
    v31[3] = &unk_10026B170;
    id v32 = v29;
    id v33 = v9;
    id v30 = v29;
    [v13 perform:v31];
  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 profile:(id)a6 client:(id)a7 localPlayerInternal:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKFriendServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v18,  v19));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v18,  v19));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameStatServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v18,  v19));
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKProfileServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v18,  v19));
  v59 = v14;
  if ([v14 isEqualToString:GKBagKeyGetFriendIDs])
  {
    v56 = v21;
    id v23 = v15;
    [v17 invalidate];
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 friendList]);
    [v24 invalidate];

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 friendRequestList]);
    [v25 invalidate];

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v17 playerID]);
    __int128 v27 = (void *)v26;
    __int128 v28 = v58;
    if (v26)
    {
      uint64_t v65 = v26;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
      [v58 getProfilesForPlayerIDs:v29 handler:&stru_1002730C0];
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v17 internalRepresentation]);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100108C80;
    v60[3] = &unk_100271B50;
    id v61 = v18;
    id v62 = v19;
    [v20 getFriendsForPlayer:v30 commonFriends:0 handler:v60];

    +[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKCompatiblePlayerListCacheObject,  "invalidateObjectsMatchingPredicate:context:",  0LL,  v16);
    id v15 = v23;
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:payload:context:]( &OBJC_CLASS___GKSystemBulletin,  "expireGetPerGameFriendPlayerIDsCache:payload:context:",  0LL,  v23,  v16);
    +[GKSystemBulletin expireFriendCodeDetails:payload:context:]( &OBJC_CLASS___GKSystemBulletin,  "expireFriendCodeDetails:payload:context:",  0LL,  v23,  v16);

    id v21 = v56;
    goto LABEL_8;
  }

  if (([v14 isEqualToString:GKBagKeyGetGamesPlayed] & 1) != 0
    || [v14 isEqualToString:@"gk-get-games-played"])
  {
    [v17 expire];
    id v54 = v15;
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v17 gameList]);
    [v31 expire];

    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player = %@",  v17));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKGameRecordCacheObject,  "expireObjectsMatchingPredicate:context:",  v32,  v16);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 playerID]);
    v64 = v33;
    id v53 = v19;
    id v34 = v18;
    __int128 v35 = v22;
    id v36 = v20;
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    __int128 v28 = v58;
    [v58 getProfilesForPlayerIDs:v37 handler:&stru_1002730E0];

    id v15 = v54;
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v17 internalRepresentation]);
    [v21 getGamesForPlayer:v38 includeInstalled:0 handler:0];

    id v20 = v36;
    id v22 = v35;
    id v18 = v34;
    id v19 = v53;

    goto LABEL_8;
  }

  if ([v14 isEqualToString:GKBagKeyGamesFriendsPlayed])
  {
    [v22 expireGamesFriendsPlayed];
LABEL_18:
    __int128 v28 = v58;
    goto LABEL_8;
  }

  if ([v14 isEqualToString:@"gk-get-player-achievements"])
  {
    [v17 expire];
    v57 = v20;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v17 gameRecords]);
    [v39 makeObjectsPerformSelector:"expire"];

    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"player == %@",  a1));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]( &OBJC_CLASS___GKAchievementListCacheObject,  "expireObjectsMatchingPredicate:context:",  v55,  v16);
    __int128 v40 = v22;
    id v41 = v15;
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v17 playerID]);
    v63 = v42;
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v63, 1LL));
    [v58 getProfilesForPlayerIDs:v43 handler:&stru_100273100];

    id v15 = v41;
    id v22 = v40;
    __int128 v28 = v58;

    id v20 = v57;
    goto LABEL_8;
  }

  if ([v14 isEqualToString:GKBagKeyGetPerGameSettings])
  {
    v44 = v22;
    v45 = v20;
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:GKInviteGameIDKey]);
    +[GKSystemBulletin expireGetPerGameSettingsCaches:payload:context:]( &OBJC_CLASS___GKSystemBulletin,  "expireGetPerGameSettingsCaches:payload:context:",  v46,  v15,  v16);
LABEL_17:

    id v20 = v45;
    id v22 = v44;
    goto LABEL_18;
  }

  if ([v14 isEqualToString:GKBagKeyGetPerGameFriendPlayerIDs])
  {
    v44 = v22;
    v45 = v20;
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:GKInviteGameIDKey]);
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:payload:context:]( &OBJC_CLASS___GKSystemBulletin,  "expireGetPerGameFriendPlayerIDsCache:payload:context:",  v46,  v15,  v16);
    goto LABEL_17;
  }

  __int128 v28 = v58;
  if ([v59 isEqualToString:GKBagKeyGetFriendInvitationMailbox])
  {
    [v17 invalidate];
    v47 = v22;
    id v48 = v15;
    v49 = v20;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v17 friendList]);
    [v50 invalidate];

    v51 = (void *)objc_claimAutoreleasedReturnValue([v17 friendRequestList]);
    [v51 invalidate];

    v52 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKBulletinService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v18,  v19));
    [v52 sendRefreshContentsForDataTypeToAllClientProxy:3];

    id v20 = v49;
    id v15 = v48;
    id v22 = v47;
  }

- (void)handleAction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSystemBulletin handleAction: %@", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKSystemBulletin;
  -[GKBulletin handleAction:](&v8, "handleAction:", v5);
}

@end