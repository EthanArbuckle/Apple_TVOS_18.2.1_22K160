@interface GKUtilityServicePrivate
+ (Class)interfaceClass;
+ (id)sharedFriendSuggestionDenier;
+ (unint64_t)requiredEntitlements;
+ (void)removeCacheDirectory:(id)a3;
- (void)cancelNetworkManagerTasks;
- (void)checkAndUpdateArcadeSubscriberStatusWithHandler:(id)a3;
- (void)clearCachesWithHandler:(id)a3;
- (void)clearEntityCacheForBagKey:(id)a3 completionHandler:(id)a4;
- (void)clearFriendSuggestionsDenyList;
- (void)denyContact:(id)a3 handler:(id)a4;
- (void)denyPlayer:(id)a3 handler:(id)a4;
- (void)getArcadeSubscription:(id)a3;
- (void)getCacheLocationsForPlayerID:(id)a3 completionHandler:(id)a4;
- (void)getCentralCacheLocationForPlayerID:(id)a3 completionHandler:(id)a4;
- (void)getCredentialInfoAndStoreBagValuesForKeys:(id)a3 handler:(id)a4;
- (void)getFriendSuggestionDenyListWithHandler:(id)a3;
- (void)getHostGameWithHandler:(id)a3;
- (void)getWidgetStoreBagValueWithHandler:(id)a3;
- (void)handleFriendSuggestionDenialWithNotificationPayload:(id)a3 error:(id)a4 handler:(id)a5;
- (void)invokeASCAppLaunchTrampolineWithURL:(id)a3 handler:(id)a4;
- (void)loadDataForURL:(id)a3 postBody:(id)a4 completionHandler:(id)a5;
- (void)openGameCenterSettings;
- (void)openSettings;
- (void)pingWithHandler:(id)a3;
- (void)refreshPreferences;
- (void)refreshPreferencesWithDataType:(unsigned int)a3;
- (void)resetEnvironmentWithHandler:(id)a3;
- (void)resetSignInPromptsWithCompletionHandler:(id)a3;
- (void)suggestedFriendsWithHandler:(id)a3;
- (void)terminate;
- (void)updateNotificationTopicsForcefully:(BOOL)a3;
@end

@implementation GKUtilityServicePrivate

+ (id)sharedFriendSuggestionDenier
{
  if (qword_1002BB498 != -1) {
    dispatch_once(&qword_1002BB498, &stru_10026B250);
  }
  return (id)qword_1002BB490;
}

- (void)invokeASCAppLaunchTrampolineWithURL:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v33 = a4;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v34 = v5;
  v6 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v5,  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v6, "queryItems"));

  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v8)
  {
    v10 = 0LL;
    v11 = 0LL;
    goto LABEL_15;
  }

  id v9 = v8;
  v10 = 0LL;
  v11 = 0LL;
  uint64_t v12 = *(void *)v46;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v46 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      unsigned int v16 = [v15 isEqualToString:@"appId"];

      if (v16)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 value]);
        v18 = v11;
        v11 = (void *)v17;
      }

      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
        unsigned int v20 = [v19 isEqualToString:@"bundleId"];

        if (!v20) {
          continue;
        }
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v14 value]);
        v18 = v10;
        v10 = (void *)v21;
      }
    }

    id v9 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  }

  while (v9);
LABEL_15:

  if (+[GKGame isNewsApp:](&OBJC_CLASS___GKGame, "isNewsApp:", v10))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    [v22 openNewsApp];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009764;
    block[3] = &unk_10026B030;
    v25 = v33;
    id v44 = v33;
    id v43 = v11;
    dispatch_async(v24, block);

    id v26 = v44;
    v27 = v34;
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  630LL,  "-[GKUtilityServicePrivate invokeASCAppLaunchTrampolineWithURL:handler:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v28));

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000979C;
    v38[3] = &unk_10026B080;
    v27 = v34;
    id v39 = v34;
    id v40 = v11;
    id v26 = v29;
    id v41 = v26;
    [v26 perform:v38];
    v25 = v33;
    if (v33)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 replyQueue]);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100009BEC;
      v35[3] = &unk_10026B030;
      id v37 = v33;
      id v36 = v26;
      [v36 notifyOnQueue:v31 block:v35];
    }
  }
}

- (void)getHostGameWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0LL;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100009DD8;
  v19 = sub_100009DE8;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 originalBundleIdentifier]);

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_100009DF0;
  uint64_t v12 = &unk_10026B2C8;
  id v7 = v6;
  id v13 = v7;
  v14 = &v15;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", &v9);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "currentGame", v9, v10, v11, v12));
  v4[2](v4, v8);

  _Block_object_dispose(&v15, 8);
}

- (void)getCredentialInfoAndStoreBagValuesForKeys:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  uint64_t v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKUtilityService: getCredentialInfoAndStoreBagValuesForKeys:",  buf,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKUtilityService _bagValuesForKeys:](self, "_bagValuesForKeys:", v6));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);

  if (!v12)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pushToken]);
    [v11 setObject:v16 forKeyedSubscript:@"pushToken"];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playerInternal]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playerID]);
    [v11 setObject:v19 forKeyedSubscript:@"playerID"];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 authenticationToken]);
    [v11 setObject:v20 forKeyedSubscript:@"authToken"];

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 accountName]);
    [v11 setObject:v21 forKeyedSubscript:@"accountName"];

    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v8)
  {
LABEL_7:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000A0B0;
    v22[3] = &unk_10026B030;
    id v24 = v8;
    id v23 = v11;
    [v23 notifyOnQueue:v14 block:v22];
  }

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKUtilityServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x10000LL;
}

- (void)openSettings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  [v2 openSettings];
}

- (void)openGameCenterSettings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  [v2 openGameCenterSettings];
}

- (void)terminate
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(self, a2);
  }
  v3 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Exiting in response to termination request",  v4,  2u);
  }

  dispatch_async(&_dispatch_main_q, &stru_10026B2E8);
}

+ (void)removeCacheDirectory:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v11];
  id v6 = v11;

  if ((v5 & 1) != 0)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v7);
    }
    id v9 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Successfully cleared GameKit cache directory: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v7);
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_10000C910();
    }
  }
}

- (void)clearCachesWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000A4B0;
  v4[3] = &unk_10026B310;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A6B0;
  v7[3] = &unk_10026B310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 resetEnvironmentWithHandler:v7];
}

- (void)pingWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)updateNotificationTopicsForcefully:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  [v4 updateNotificationTopicsForceFully:v3];
}

- (void)refreshPreferences
{
}

- (void)refreshPreferencesWithDataType:(unsigned int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  [v4 synchronize];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v5 synchronize];

  CFPreferencesSynchronize(@"com.apple.VideoConference", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.persistentconnection", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesAppSynchronize(@"com.apple.logging");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A8A8;
  v6[3] = &unk_10026B330;
  unsigned int v7 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v6);
}

- (void)loadDataForURL:(id)a3 postBody:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 storeBag]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000A9CC;
    v15[3] = &unk_10026B358;
    id v16 = v8;
    [v12 readDataForURL:v10 postData:v9 client:v13 credential:v14 includeUDID:1 includeAPNS:1 completion:v15];
  }
}

- (void)cancelNetworkManagerTasks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  [v2 cancelCurrentTasks];
}

- (void)checkAndUpdateArcadeSubscriberStatusWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  830LL,  "-[GKUtilityServicePrivate checkAndUpdateArcadeSubscriberStatusWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000AB70;
  v16[3] = &unk_10026B170;
  v16[4] = self;
  id v7 = v6;
  id v17 = v7;
  [v7 perform:v16];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000AC48;
  v12[3] = &unk_10026B1E8;
  v14 = self;
  id v15 = v4;
  id v13 = v7;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)getArcadeSubscription:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    (*((void (**)(id, id))a3 + 2))(v4, [v5 arcadeSubscriptionState]);
  }

- (void)getFriendSuggestionDenyListWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKUtilityServicePrivate sharedFriendSuggestionDenier]( &OBJC_CLASS___GKUtilityServicePrivate,  "sharedFriendSuggestionDenier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B59C;
  v7[3] = &unk_10026B458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 denyListWithCompletionHandler:v7];
}

- (void)denyPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "denyPlayer: Adding %@ to the deny list.",  buf,  0xCu);
  }

  if (v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKUtilityServicePrivate sharedFriendSuggestionDenier]( &OBJC_CLASS___GKUtilityServicePrivate,  "sharedFriendSuggestionDenier"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000B8FC;
    v17[3] = &unk_10026B480;
    v17[4] = self;
    id v18 = v6;
    id v19 = v8;
    id v12 = v8;
    [v11 denyPlayerID:v18 completionHandler:v17];

    id v13 = v18;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B8EC;
    block[3] = &unk_10026B120;
    uint64_t v21 = v8;
    id v16 = v8;
    dispatch_async(v15, block);

    id v13 = v21;
  }
}

- (void)denyContact:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "denyContact: Adding %@ to the deny list.",  buf,  0xCu);
  }

  if (v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKUtilityServicePrivate sharedFriendSuggestionDenier]( &OBJC_CLASS___GKUtilityServicePrivate,  "sharedFriendSuggestionDenier"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000BB88;
    v17[3] = &unk_10026B480;
    v17[4] = self;
    id v18 = v6;
    id v19 = v8;
    id v12 = v8;
    [v11 denyContactID:v18 completionHandler:v17];

    id v13 = v18;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000BB78;
    block[3] = &unk_10026B120;
    uint64_t v21 = v8;
    id v16 = v8;
    dispatch_async(v15, block);

    id v13 = v21;
  }
}

- (void)handleFriendSuggestionDenialWithNotificationPayload:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BD30;
  block[3] = &unk_10026B148;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, block);
}

- (void)clearFriendSuggestionsDenyList
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[GKUtilityServicePrivate sharedFriendSuggestionDenier]( &OBJC_CLASS___GKUtilityServicePrivate,  "sharedFriendSuggestionDenier"));
  [v2 clearDenyList];
}

- (void)suggestedFriendsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 replyQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BEB0;
  block[3] = &unk_10026B120;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void)getWidgetStoreBagValueWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKUtilityService.m",  1169LL,  "-[GKUtilityServicePrivate getWidgetStoreBagValueWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000C024;
  v15[3] = &unk_10026B170;
  void v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000C1C4;
  v12[3] = &unk_10026B310;
  id v13 = v7;
  id v14 = v4;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)clearEntityCacheForBagKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v9 deleteEntitiesWithBagKey:v7 clientProxy:v8 completionHandler:v6];
}

- (void)getCacheLocationsForPlayerID:(id)a3 completionHandler:(id)a4
{
  v28[0] = @"Insecure Cache";
  id v6 = (void (**)(id, id))a4;
  id v27 = a3;
  uint64_t v7 = GKInsecureCacheRoot();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v28[1] = @"Support Data";
  v29[0] = v8;
  uint64_t v9 = GKSupportDataRoot();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v29[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

  id v13 = objc_alloc(&OBJC_CLASS___GKSecureFileLocator);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = -[GKSecureFileLocator initWithFileManager:](v13, "initWithFileManager:", v14);

  uint64_t v16 = GKGameCenterIdentifier;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 language]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKSecureFileLocator globalContextID](&OBJC_CLASS___GKSecureFileLocator, "globalContextID"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[GKSecureFileLocator databaseDirectoryWithBundleID:language:contextID:]( v15,  "databaseDirectoryWithBundleID:language:contextID:",  v16,  v18,  v19));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 gkFileSystemRepresentation]);
  [v12 setObject:v21 forKeyedSubscript:@"Global Cache"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 language]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[GKSecureFileLocator databaseDirectoryWithBundleID:language:contextID:]( v15,  "databaseDirectoryWithBundleID:language:contextID:",  v16,  v23,  v27));

  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 gkFileSystemRepresentation]);
  [v12 setObject:v25 forKeyedSubscript:@"Player Cache"];

  id v26 = [v12 copy];
  v6[2](v6, v26);
}

- (void)getCentralCacheLocationForPlayerID:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 language]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy gameCenterCacheDatabaseURLForPlayerID:language:name:fileManager:]( &OBJC_CLASS___GKClientProxy,  "gameCenterCacheDatabaseURLForPlayerID:language:name:fileManager:",  v8,  v9,  @"database.sqlite3",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 gkFileSystemRepresentation]);
  (*((void (**)(id, void *))a4 + 2))(v7, v12);
}

- (void)resetSignInPromptsWithCompletionHandler:(id)a3
{
  BOOL v3 = (void (**)(void))a3;
  id v4 = v3;
  id v5 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = (id)GKOSLoggers(v3);
    id v5 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "GKUtilityServicePrivate: Resetting sign in prompt limits",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 removeObjectForKey:@"GKFullscreenSignInPresentationDataKey"];
  [v7 removeObjectForKey:@"GKSignInBannerPresentationDataKey"];
  v4[2](v4);
}

@end