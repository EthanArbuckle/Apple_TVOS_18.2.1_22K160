@interface ICDMediaUserStateCenterServer
- (BOOL)_locked_userStatesChanged:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDMediaUserStateCenterServer)init;
- (ICDMediaUserStateCenterServerNotificationsManager)serverNotificationsManager;
- (NSArray)userStatesCache;
- (NSMutableArray)activeConnections;
- (id)_getUserIdentitiesfromDefaultStore;
- (id)_sanitizedUserStatesForRemoteClientConnection:(id)a3;
- (id)_storeRequestContextFromUserIdentity:(id)a3;
- (id)_updatedUserStateFromState:(id)a3 withUserProfile:(id)a4;
- (unint64_t)_userStateAccessForConnection:(id)a3;
- (void)_buildUserStateFromUserIdentity:(id)a3 storeRequestContext:(id)a4 tokensDictionary:(id)a5 ignoreResponseCache:(BOOL)a6 completion:(id)a7;
- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 completion:(id)a4;
- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 ignoreResponseCache:(BOOL)a4 completion:(id)a5;
- (void)_fetchUpdatedUserProfilesForUserStates:(id)a3 completion:(id)a4;
- (void)_getTokenStatusesForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)_getUserStateFromIdentity:(id)a3 tokensDictionary:(id)a4 ignoreResponseCache:(BOOL)a5 completion:(id)a6;
- (void)_notifyServerStateUpdatedIfNeeded:(id)a3;
- (void)getCachedUserStatesWithReply:(id)a3;
- (void)getUserStatesForcingRefresh:(BOOL)a3 withReply:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveNotificationChangingUserState:(id)a4;
- (void)refreshSocialProfilesWithReply:(id)a3;
- (void)setActiveConnections:(id)a3;
- (void)start;
- (void)stop;
- (void)updateUserProfile:(id)a3 forRequestContext:(id)a4;
@end

@implementation ICDMediaUserStateCenterServer

- (ICDMediaUserStateCenterServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ICDMediaUserStateCenterServer;
  v2 = -[ICDMediaUserStateCenterServer init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_hasStarted = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICDMediaUserStateCenterServer", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    cachedUserStateByDSID = v3->_cachedUserStateByDSID;
    v3->_cachedUserStateByDSID = (NSDictionary *)v6;

    v8 = -[ICDMusicUserSocialProfileProvider initWithDelegate:]( objc_alloc(&OBJC_CLASS___ICDMusicUserSocialProfileProvider),  "initWithDelegate:",  v3);
    userSocialProfileProvider = v3->_userSocialProfileProvider;
    v3->_userSocialProfileProvider = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingCompletionHandlers = v3->_pendingCompletionHandlers;
    v3->_pendingCompletionHandlers = (NSMutableArray *)v10;

    *(_WORD *)&v3->_coalescedForceRefreshValue = 0;
  }

  return v3;
}

- (NSArray)userStatesCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_cachedUserStateByDSID, "allValues"));
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)getCachedUserStatesWithReply:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _sanitizedUserStatesForRemoteClientConnection:]( self,  "_sanitizedUserStatesForRemoteClientConnection:",  v5));

  v4[2](v4, v6);
  if (!v6)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@ Lazily fetching user states",  buf,  0xCu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100043538;
    block[3] = &unk_1001A6B90;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (void)getUserStatesForcingRefresh:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v8 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v7;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received request for user states from client connection %{public}@. forceRefresh=%{BOOL}u",  buf,  0x1Cu);
  }

  if (v4
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServer userStatesCache](self, "userStatesCache")),
        id v10 = [v9 count],
        v9,
        !v10))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100043390;
    v13[3] = &unk_1001A2788;
    v13[4] = self;
    id v15 = v6;
    id v14 = v7;
    -[ICDMediaUserStateCenterServer _fetchAccountsWithForceRefresh:completion:]( self,  "_fetchAccountsWithForceRefresh:completion:",  v4,  v13);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _sanitizedUserStatesForRemoteClientConnection:]( self,  "_sanitizedUserStatesForRemoteClientConnection:",  v7));
    v12 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v7;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Returning cached user states to client connection %{public}@: %{public}@",  buf,  0x20u);
    }

    (*((void (**)(id, void *, void))v6 + 2))(v6, v11, 0LL);
  }
}

- (void)refreshSocialProfilesWithReply:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v6 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ refreshSocialProfilesWithReply: Received request for social profile refresh from client connection %{public}@.",  buf,  0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v7 = -[NSDictionary copy](self->_cachedUserStateByDSID, "copy");
  os_unfair_lock_unlock(&self->_lock);
  if ([v7 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000430E4;
    v17[3] = &unk_1001A27B0;
    v8 = &v18;
    v17[4] = self;
    __int16 v18 = v5;
    v9 = &v19;
    id v19 = v4;
    id v10 = v4;
    id v11 = v5;
    -[ICDMediaUserStateCenterServer _fetchUpdatedUserProfilesForUserStates:completion:]( self,  "_fetchUpdatedUserProfilesForUserStates:completion:",  v7,  v17);
  }

  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000431E4;
    v14[3] = &unk_1001A2788;
    v8 = &v16;
    id v15 = v5;
    id v16 = v4;
    v9 = &v15;
    v14[4] = self;
    id v12 = v4;
    id v13 = v5;
    -[ICDMediaUserStateCenterServer _fetchAccountsWithForceRefresh:ignoreResponseCache:completion:]( self,  "_fetchAccountsWithForceRefresh:ignoreResponseCache:completion:",  1LL,  1LL,  v14);
  }
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting server:",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = -[ICDMediaUserStateCenterServerNotificationsManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___ICDMediaUserStateCenterServerNotificationsManager),  "initWithDelegate:",  self);
  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = v4;

  os_unfair_lock_lock(&self->_lock);
  self->_hasStarted = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[ICDMediaUserStateCenterServer getUserStatesForcingRefresh:withReply:]( self,  "getUserStatesForcingRefresh:withReply:",  0LL,  &stru_1001A27F0);
}

- (void)stop
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Stopping server:",  (uint8_t *)&v5,  0xCu);
  }

  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = 0LL;
}

- (void)notificationsManager:(id)a3 didReceiveNotificationChangingUserState:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100042FF8;
  v4[3] = &unk_1001A6150;
  v4[4] = self;
  -[ICDMediaUserStateCenterServer _fetchAccountsWithForceRefresh:completion:]( self,  "_fetchAccountsWithForceRefresh:completion:",  0LL,  v4);
}

- (void)updateUserProfile:(id)a3 forRequestContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = -[NSDictionary mutableCopy](self->_cachedUserStateByDSID, "mutableCopy");
  os_unfair_lock_unlock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 DSID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
  id v12 = v11;
  if (v11 && (id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 music]), v13, v13))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _updatedUserStateFromState:withUserProfile:]( self,  "_updatedUserStateFromState:withUserProfile:",  v12,  v6));
    [v8 setObject:v14 forKeyedSubscript:v10];

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 allValues]);
    -[ICDMediaUserStateCenterServer _notifyServerStateUpdatedIfNeeded:](self, "_notifyServerStateUpdatedIfNeeded:", v15);
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ updateUserProfile:forRequestContext: unexpected nil ICMusicUserState for cachedUserState=%{public}@",  (uint8_t *)&v16,  0x16u);
    }
  }
}

- (void)_notifyServerStateUpdatedIfNeeded:(id)a3
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100042F30;
  v23[3] = &unk_1001A2818;
  id v4 = a3;
  id v24 = v4;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", v23));
  os_unfair_lock_lock(&self->_lock);
  if (-[ICDMediaUserStateCenterServer _locked_userStatesChanged:](self, "_locked_userStatesChanged:", v5))
  {
    id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int16 v18 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dsid]);
          -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, v13);
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v9);
    }

    cachedUserStateByDSID = self->_cachedUserStateByDSID;
    self->_cachedUserStateByDSID = v6;

    os_unfair_lock_unlock(&self->_lock);
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ User states changed - posting notification",  buf,  0xCu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v17, &stru_1001A2838);
    int v5 = v18;
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v17 = (dispatch_queue_s *)os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ No change in user state detected",  buf,  0xCu);
    }
  }
}

- (void)_buildUserStateFromUserIdentity:(id)a3 storeRequestContext:(id)a4 tokensDictionary:(id)a5 ignoreResponseCache:(BOOL)a6 completion:(id)a7
{
  BOOL v35 = a6;
  id v11 = a3;
  id v12 = a4;
  id v36 = a5;
  v39 = (void (**)(id, void, id))a7;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _buildUserStateFromUserIdentity: building userState for userIdentity=%{public}@",  buf,  0x16u);
  }

  group = dispatch_group_create();
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v87 = sub_10003FDD4;
  v88 = sub_10003FDE4;
  id v89 = 0LL;
  v79[0] = 0LL;
  v79[1] = v79;
  v79[2] = 0x3032000000LL;
  v79[3] = sub_10003FDD4;
  v79[4] = sub_10003FDE4;
  id v80 = 0LL;
  v77[0] = 0LL;
  v77[1] = v77;
  v77[2] = 0x3032000000LL;
  v77[3] = sub_10003FDD4;
  v77[4] = sub_10003FDE4;
  id v78 = 0LL;
  id v76 = 0LL;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v40 getPropertiesForUserIdentity:v11 error:&v76]);
  id v14 = v76;
  if (v14)
  {
    v39[2](v39, 0LL, v14);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICAgeVerificationManager defaultManager](&OBJC_CLASS___ICAgeVerificationManager, "defaultManager"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 ageVerificationStateForUserIdentity:v11]);
    BOOL v33 = [v16 status] == (id)2;

    dispatch_group_enter(group);
    id v34 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v12];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100040BE4;
    v70[3] = &unk_1001A2888;
    v70[4] = self;
    id v18 = v12;
    id v71 = v18;
    v73 = buf;
    v74 = v77;
    __int128 v19 = group;
    v72 = v19;
    v75 = v79;
    [v17 performSubscriptionStatusRequest:v34 withCompletionHandler:v70];

    v68[0] = 0LL;
    v68[1] = v68;
    v68[2] = 0x3032000000LL;
    v68[3] = sub_10003FDD4;
    v68[4] = sub_10003FDE4;
    id v69 = 0LL;
    dispatch_group_enter(v19);
    userSocialProfileProvider = self->_userSocialProfileProvider;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100040F08;
    v64[3] = &unk_1001A28B0;
    v64[4] = self;
    id v21 = v18;
    id v65 = v21;
    v67 = v68;
    __int128 v22 = v19;
    v66 = v22;
    -[ICDMusicUserSocialProfileProvider fetchMusicUserProfileWithStoreRequestContext:ignoreCache:completion:]( userSocialProfileProvider,  "fetchMusicUserProfileWithStoreRequestContext:ignoreCache:completion:",  v21,  v35,  v64);
    v62[0] = 0LL;
    v62[1] = v62;
    v62[2] = 0x3032000000LL;
    v62[3] = sub_10003FDD4;
    v62[4] = sub_10003FDE4;
    id v63 = 0LL;
    dispatch_group_enter(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10004113C;
    v59[3] = &unk_1001A28D8;
    v59[4] = self;
    v61 = v62;
    id v24 = v22;
    v60 = v24;
    [v23 getBagForRequestContext:v21 withCompletionHandler:v59];

    uint64_t v55 = 0LL;
    v56 = &v55;
    uint64_t v57 = 0x2020000000LL;
    char v58 = 0;
    if ([v37 isActive] && (MSVDeviceIsAudioAccessory() & 1) == 0)
    {
      uint64_t v82 = 0LL;
      v83 = &v82;
      uint64_t v84 = 0x2050000000LL;
      v25 = (void *)qword_1001DB658;
      uint64_t v85 = qword_1001DB658;
      if (!qword_1001DB658)
      {
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472LL;
        v81[2] = sub_10004124C;
        v81[3] = &unk_1001A6978;
        v81[4] = &v82;
        sub_10004124C((uint64_t)v81);
        v25 = (void *)v83[3];
      }

      id v26 = v25;
      _Block_object_dispose(&v82, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sharedInstance]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 storedConfiguration]);

      if (v28)
      {
        unsigned __int8 v29 = [v28 activeUser];
        *((_BYTE *)v56 + 24) = v29;
      }

      else if (sub_100041310())
      {
        dispatch_group_enter(v24);
        id v30 = [sub_100041310() sharedInstance];
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_1000413C4;
        v52[3] = &unk_1001A2900;
        v54 = &v55;
        v53 = v24;
        [v31 fetchConfigurationWithCompletionHandler:v52];
      }
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000413F8;
    block[3] = &unk_1001A2A08;
    id v42 = v37;
    v45 = v62;
    BOOL v51 = v33;
    v46 = v79;
    v47 = v77;
    id v43 = v36;
    v48 = v68;
    v49 = &v55;
    v44 = v39;
    v50 = buf;
    dispatch_group_notify(v24, queue, block);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v68, 8);
  }

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 completion:(id)a4
{
}

- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 ignoreResponseCache:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    BOOL v35 = self;
    __int16 v36 = 1024;
    *(_DWORD *)v37 = v6;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _fetchAccountsWithForceRefresh: %{BOOL}u ignoreResponseCache:%{BOOL}u",  buf,  0x18u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _getUserIdentitiesfromDefaultStore]( self,  "_getUserIdentitiesfromDefaultStore"));
  if ([v10 count])
  {
    os_unfair_lock_lock(&self->_lock);
    id v11 = -[NSMutableArray count](self->_pendingCompletionHandlers, "count");
    if (v11)
    {
      id v12 = v11;
      self->_coalescedIgnoreCacheValue |= v5;
      self->_coalescedForceRefreshValue |= v6;
      pendingCompletionHandlers = self->_pendingCompletionHandlers;
      id v14 = objc_retainBlock(v8);
      -[NSMutableArray addObject:](pendingCompletionHandlers, "addObject:", v14);

      os_unfair_lock_unlock(&self->_lock);
      id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v35 = self;
        __int16 v36 = 2048;
        *(void *)v37 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ userState account fetch in-flight with %lu pending completions. Coalescing request.",  buf,  0x16u);
      }
    }

    else
    {
      v17 = self->_pendingCompletionHandlers;
      id v18 = objc_retainBlock(v8);
      -[NSMutableArray addObject:](v17, "addObject:", v18);

      os_unfair_lock_unlock(&self->_lock);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10004050C;
      v31[3] = &unk_1001A2A58;
      v31[4] = self;
      BOOL v32 = v6;
      BOOL v33 = v5;
      __int128 v19 = objc_retainBlock(v31);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_map:", &stru_1001A2A98));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));

      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100040738;
      v25[3] = &unk_1001A2AE8;
      id v29 = v19;
      id v26 = v10;
      v27 = self;
      BOOL v30 = v5;
      id v28 = v22;
      id v23 = v22;
      id v24 = v19;
      -[ICDMediaUserStateCenterServer _getTokenStatusesForDSIDs:forceRefresh:completion:]( self,  "_getTokenStatusesForDSIDs:forceRefresh:completion:",  v21,  v6,  v25);
    }
  }

  else
  {
    int v16 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v35 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@ No user identities are found.",  buf,  0xCu);
    }

    (*((void (**)(id, void *, void))v8 + 2))(v8, &__NSArray0__struct, 0LL);
  }
}

- (void)_fetchUpdatedUserProfilesForUserStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _getUserIdentitiesfromDefaultStore]( self,  "_getUserIdentitiesfromDefaultStore"));
  id v25 = [v6 mutableCopy];
  id v8 = dispatch_group_create();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _storeRequestContextFromUserIdentity:]( self,  "_storeRequestContextFromUserIdentity:",  v13));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 DSID]);
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v15]);

        if (v16
          && (v17 = (void *)objc_claimAutoreleasedReturnValue([v16 music]), v17, v17))
        {
          dispatch_group_enter(v8);
          userSocialProfileProvider = self->_userSocialProfileProvider;
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_100040288;
          v30[3] = &unk_1001A2B10;
          v30[4] = self;
          id v31 = v25;
          BOOL v32 = v13;
          id v33 = v16;
          id v34 = v8;
          -[ICDMusicUserSocialProfileProvider fetchMusicUserProfileWithStoreRequestContext:ignoreCache:completion:]( userSocialProfileProvider,  "fetchMusicUserProfileWithStoreRequestContext:ignoreCache:completion:",  v14,  1LL,  v30);
        }

        else
        {
          __int128 v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543619;
            v40 = self;
            __int16 v41 = 2113;
            id v42 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ No ICMusicUserState for userIdentity=%{private}@ Returning cached userState.",  buf,  0x16u);
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }

    while (v10);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000404C8;
  block[3] = &unk_1001A6BB8;
  id v28 = v25;
  id v29 = v24;
  id v22 = v25;
  id v23 = v24;
  dispatch_group_notify(v8, v21, block);
}

- (void)_getTokenStatusesForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v17) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _getTokenStatusesForDSIDs:%{public}@, forceRefresh: %{BOOL}u",  buf,  0x1Cu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[ICLibraryAuthServiceClientTokenProvider sharedProvider]( &OBJC_CLASS___ICLibraryAuthServiceClientTokenProvider,  "sharedProvider"));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v17 = sub_10003FDD4;
  id v18 = sub_10003FDE4;
  id v19 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003FDEC;
  v13[3] = &unk_1001A2BB0;
  v13[4] = self;
  id v12 = v9;
  id v14 = v12;
  id v15 = buf;
  [v11 getTokenStatusForDSIDs:v8 forcingRefresh:v6 completion:v13];

  _Block_object_dispose(buf, 8);
}

- (void)_getUserStateFromIdentity:(id)a3 tokensDictionary:(id)a4 ignoreResponseCache:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ICDMediaUserStateCenterServer _storeRequestContextFromUserIdentity:]( self,  "_storeRequestContextFromUserIdentity:",  v10));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003F690;
  v16[3] = &unk_1001A2BD8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  -[ICDMediaUserStateCenterServer _buildUserStateFromUserIdentity:storeRequestContext:tokensDictionary:ignoreResponseCache:completion:]( self,  "_buildUserStateFromUserIdentity:storeRequestContext:tokensDictionary:ignoreResponseCache:completion:",  v15,  v13,  v12,  v7,  v16);
}

- (id)_getUserIdentitiesfromDefaultStore
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v9 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userIdentitiesForManageableAccountsWithError:&v9]);
  id v5 = v9;
  if (v5)
  {
    BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to fetch user state identities, err=%{public}@",  buf,  0x16u);
    }

    id v7 = &__NSArray0__struct;
  }

  else
  {
    id v7 = v4;
  }

  return v7;
}

- (BOOL)_locked_userStatesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 == (id)-[NSDictionary count](self->_cachedUserStateByDSID, "count"))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          cachedUserStateByDSID = self->_cachedUserStateByDSID;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dsid", (void)v17));
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( cachedUserStateByDSID,  "objectForKeyedSubscript:",  v13));

          LODWORD(v11) = [v14 isEqual:v11];
          if (!(_DWORD)v11)
          {
            BOOL v15 = 1;
            goto LABEL_13;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = 0;
LABEL_13:
  }

  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (id)_sanitizedUserStatesForRemoteClientConnection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServer userStatesCache](self, "userStatesCache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:ICMediaUserStateCenterEntitlementSiri]);

  if (v4 && !v6)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Sanitizing user state for client connection %{public}@. hasSiriDataEntitlement=%{BOOL}u",  (uint8_t *)&v10,  0x1Cu);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_map:", &stru_1001A2C18));
    id v5 = (void *)v8;
  }

  return v5;
}

- (id)_storeRequestContextFromUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003F508;
  v8[3] = &unk_1001A6640;
  id v9 = v3;
  id v5 = v3;
  id v6 = -[ICStoreRequestContext initWithBlock:](v4, "initWithBlock:", v8);

  return v6;
}

- (id)_updatedUserStateFromState:(id)a3 withUserProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 music]), v8, !v8))
  {
    __int128 v17 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = self;
      __int16 v29 = 2114;
      id v30 = v6;
      __int128 v18 = "%{public}@ cannot update state. Unexpected nil ICMusicUserState for mediaUserState=%{public}@";
      __int128 v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }

- (unint64_t)_userStateAccessForConnection:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.itunescloudd.private"]);
  if (v3) {
    unint64_t v4 = -1LL;
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL hasStarted = self->_hasStarted;
  os_unfair_lock_unlock(&self->_lock);
  if (hasStarted
    && -[ICDMediaUserStateCenterServer _userStateAccessForConnection:](self, "_userStateAccessForConnection:", v5) == -1LL)
  {
    unsigned int v9 = [v5 processIdentifier];
    os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICMediaUserStateCenterServerProtocol));
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
    id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___ICMediaUserState, v12),  0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v8,  "setClasses:forSelector:argumentIndex:ofReply:",  v14,  "getUserStatesForcingRefresh:withReply:",  0LL,  1LL);

    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003F370;
    v19[3] = &unk_1001A6D98;
    v19[4] = self;
    unsigned int v20 = v9;
    [v5 setInvalidationHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003F430;
    v17[3] = &unk_1001A6D98;
    v17[4] = self;
    unsigned int v18 = v9;
    [v5 setInterruptionHandler:v17];
    [v5 resume];
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Accepted new client connection: %{public}@.",  buf,  0x16u);
    }

    BOOL v7 = 1;
LABEL_12:

    goto LABEL_13;
  }

  if (!-[ICDMediaUserStateCenterServer _userStateAccessForConnection:](self, "_userStateAccessForConnection:", v5))
  {
    os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: Refused new client connection: %{public}@. Entitlements error.",  buf,  0x16u);
    }

    BOOL v7 = 0;
    goto LABEL_12;
  }

- (ICDMediaUserStateCenterServerNotificationsManager)serverNotificationsManager
{
  return self->_serverNotificationsManager;
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end