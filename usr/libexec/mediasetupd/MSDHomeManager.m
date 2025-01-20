@interface MSDHomeManager
+ (id)sharedManager;
- (BOOL)isHomeKitInitialized;
- (BOOL)isHomeKitReady;
- (BOOL)isHomeManagerReady:(id)a3;
- (BOOL)isWaitingForHomesToLoad;
- (BOOL)isWaitingToStart;
- (BOOL)listeningHistorySetting:(id)a3 accessoryID:(id)a4;
- (HMAccessory)currentAccessory;
- (HMHome)currentHome;
- (HMHomeManager)homeManager;
- (MSDHomeManager)init;
- (MSHomeHubManager)homehubManager;
- (NSArray)allHomes;
- (NSMutableArray)queuedAwaitingCurrentHome;
- (NSMutableSet)delegates;
- (NSMutableSet)pendingAccessoryIDs;
- (NSUUID)homeOwnerUniqueIdentifier;
- (id)getHomeForUserIdentifier:(id)a3;
- (id)homeWithIdentifier:(id)a3;
- (void)_addHomeDelegates:(id)a3;
- (void)_addSubscriptionsForPendingEndpoints;
- (void)_addUserSettingsDelegate:(id)a3;
- (void)_clearCachedEndpointData:(id)a3;
- (void)_handleHomeKitFinishedInitialization;
- (void)_handleHomeKitSyncComplete;
- (void)_handleUsersChangedInHome:(id)a3;
- (void)_homeWasRemoved;
- (void)_noteHomesStillLoading;
- (void)_notifyQueuedOfCurrentHome;
- (void)_settingsForActivatedEndpoint:(id)a3 home:(id)a4;
- (void)_updateAllowExplicitContentPreferenceForAllUsers:(id)a3;
- (void)_updateAllowExplicitContentPreferenceForUser:(id)a3 settingValue:(BOOL)a4;
- (void)_updateAllowInHomePreferenceForAllUsers:(id)a3;
- (void)_updateAllowInHomePreferenceForUser:(id)a3 settingValue:(BOOL)a4;
- (void)_updateListeningHistoryPreferenceForUser:(id)a3 listeningHistory:(id)a4;
- (void)_updateListeningHistorySettingPreferenceForAllUsers:(id)a3;
- (void)_updatePrimaryUserForHomePodAccessory:(id)a3;
- (void)_updatePrimaryUserForSiriEndpoint:(id)a3;
- (void)_updatePrimaryUserForSiriEndpoints:(id)a3;
- (void)_updateSettingsCacheForAllUsers:(id)a3 settingsKeyPath:(id)a4 defaultsKey:(id)a5;
- (void)_updateSiriEndpointSettings;
- (void)_withReadinessLock:(id)a3;
- (void)_withRequestLock:(id)a3;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)addDelegate:(id)a3;
- (void)awaitCurrentHomeWithCompletion:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHomePermanently:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)homehubManager:(id)a3 didAddEndpoint:(id)a4;
- (void)homehubManager:(id)a3 didRemoveEndpoint:(id)a4;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomehubManager:(id)a3;
- (void)setIsHomeKitInitialized:(BOOL)a3;
- (void)setIsWaitingToStart:(BOOL)a3;
- (void)setPendingAccessoryIDs:(id)a3;
- (void)setQueuedAwaitingCurrentHome:(id)a3;
- (void)setWaitingForHomesToLoad:(BOOL)a3;
- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5;
- (void)updateCachedDataWithUsersInHome:(id)a3;
- (void)updatePrimaryUserOnDevice:(id)a3;
- (void)user:(id)a3 didUpdateUserListeningHistoryUpdateControl:(id)a4 forHome:(id)a5;
@end

@implementation MSDHomeManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015AC0;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_1000707A0 != -1) {
    dispatch_once(&qword_1000707A0, block);
  }
  return (id)qword_1000707A8;
}

- (MSDHomeManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MSDHomeManager;
  v2 = -[MSDHomeManager init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isWaitingToStart = 1;
    *(_WORD *)&v2->_waitingForHomesToLoad = 0;
    v2->_readinessLock._os_unfair_lock_opaque = 0;
    id v4 = [[HMMutableHomeManagerConfiguration alloc] initWithOptions:32872 cachePolicy:2];
    [v4 setDiscretionary:1];
    v6 = (void *)objc_opt_new(&OBJC_CLASS___NSOperationQueue, v5);
    [v4 setDelegateQueue:v6];
    v7 = -[HMHomeManager initWithHomeMangerConfiguration:]( objc_alloc(&OBJC_CLASS___HMHomeManager),  "initWithHomeMangerConfiguration:",  v4);
    homeManager = v3->_homeManager;
    v3->_homeManager = v7;

    -[HMHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[MSHomeHubManager shared](&OBJC_CLASS___MSHomeHubManager, "shared"));
    homehubManager = v3->_homehubManager;
    v3->_homehubManager = (MSHomeHubManager *)v9;

    -[MSHomeHubManager registerForHomeHubMangerDelegate:](v3->_homehubManager, "registerForHomeHubMangerDelegate:", v3);
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet, v11);
    pendingAccessoryIDs = v3->_pendingAccessoryIDs;
    v3->_pendingAccessoryIDs = (NSMutableSet *)v12;

    uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableSet, v14);
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableSet *)v15;

    uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
    queuedAwaitingCurrentHome = v3->_queuedAwaitingCurrentHome;
    v3->_queuedAwaitingCurrentHome = (NSMutableArray *)v18;
  }

  return v3;
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](self->_delegates, "addObject:", v5);
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (id)homeWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager allHomes](self, "allHomes", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (HMHome)currentHome
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100015F04;
  v6[3] = &unk_100061520;
  v6[4] = self;
  v6[5] = &v7;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 home]);
  }

  else
  {
    id v4 = 0LL;
  }

  _Block_object_dispose(&v7, 8);
  return (HMHome *)v4;
}

- (HMAccessory)currentAccessory
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016010;
  v5[3] = &unk_100061520;
  v5[4] = self;
  v5[5] = &v6;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v5);
  if (*((_BYTE *)v7 + 24)) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  }
  else {
    v3 = 0LL;
  }
  _Block_object_dispose(&v6, 8);
  return (HMAccessory *)v3;
}

- (NSArray)allHomes
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001611C;
  v5[3] = &unk_100061520;
  v5[4] = self;
  v5[5] = &v6;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v5);
  if (*((_BYTE *)v7 + 24)) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  }
  else {
    v3 = 0LL;
  }
  _Block_object_dispose(&v6, 8);
  return (NSArray *)v3;
}

- (void)awaitCurrentHomeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0LL;
    unsigned __int8 v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    __int128 v13 = sub_10001626C;
    __int128 v14 = sub_10001627C;
    id v15 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100016284;
    v7[3] = &unk_100061548;
    uint64_t v9 = &v10;
    v7[4] = self;
    uint64_t v6 = (void (**)(void))v4;
    id v8 = v6;
    -[MSDHomeManager _withRequestLock:](self, "_withRequestLock:", v7);
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager userCloudShareManager](self->_homeManager, "userCloudShareManager"));
  [v5 setDelegate:self];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager userCloudShareManager](self->_homeManager, "userCloudShareManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000163D0;
  v8[3] = &unk_100060F30;
  id v9 = v4;
  id v7 = v4;
  [v6 registerForContainerIDs:v7 completion:v8];
}

- (id)getHomeForUserIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v20 = 0LL;
    objc_super v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_10001626C;
    v24 = sub_10001627C;
    id v25 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager allHomes](self, "allHomes"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000165DC;
    v17[3] = &unk_100061570;
    id v18 = v4;
    v19 = &v20;
    [v5 enumerateObjectsUsingBlock:v17];

    id v6 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001AA50(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (void)updateCachedDataWithUsersInHome:(id)a3
{
  if (a3)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue([a3 allUsers]);
    -[MSDHomeManager _handleUsersChangedInHome:](self, "_handleUsersChangedInHome:", v13);
  }

  else
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001AAC0(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

- (BOOL)listeningHistorySetting:(id)a3 accessoryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userWithIdentifier:v6]);
    if (v9)
    {
      if (v7)
      {
        id v10 = v7;
LABEL_12:
        v23 = (void *)objc_claimAutoreleasedReturnValue([v9 userListeningHistoryUpdateControlForHome:v8]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accessories]);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_1000168C0;
        v36[3] = &unk_100061598;
        id v37 = v10;
        objc_super v21 = (os_log_s *)v10;
        id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "na_firstObjectPassingTest:", v36));

        v26 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
        -[MSDHomeManager _updateListeningHistoryPreferenceForUser:listeningHistory:]( self,  "_updateListeningHistoryPreferenceForUser:listeningHistory:",  v26,  v23);

        BOOL v19 = v25 != 0LL;
        goto LABEL_13;
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentAccessory](self, "currentAccessory"));
      id v10 = (id)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);

      if (v10) {
        goto LABEL_12;
      }
      id v28 = sub_10003E9DC();
      objc_super v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10001AC28(v21, v29, v30, v31, v32, v33, v34, v35);
      }
    }

    else
    {
      id v20 = sub_10003E9DC();
      objc_super v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10001ABA0();
      }
    }

    BOOL v19 = 0;
LABEL_13:

    goto LABEL_14;
  }

  id v11 = sub_10003E9DC();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_10001AB30((os_log_s *)v8, v12, v13, v14, v15, v16, v17, v18);
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (NSUUID)homeOwnerUniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userSettingsDefaults]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AccessoryOwnerHomeUserID"]);

  id v6 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  if (!v6)
  {
    id v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 owner]);
      id v6 = (NSUUID *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);

      if (v6)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userSettingsDefaults]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));
        [v10 setObject:v11 forKey:@"AccessoryOwnerHomeUserID"];
      }
    }
  }

  return v6;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  id v9 = sub_10003E9DC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v11)
    {
      int v16 = 136315138;
      uint64_t v17 = "-[MSDHomeManager homeManager:didAddHome:]";
      uint64_t v12 = "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.";
      uint64_t v13 = v10;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }

  else
  {
    if (v11)
    {
      int v16 = 138478083;
      uint64_t v17 = v6;
      __int16 v18 = 2113;
      id v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "HMHomeManager %{private}@ Added Home %{private}@",  (uint8_t *)&v16,  0x16u);
    }

    if (![v7 isCurrentUserRestrictedGuest])
    {
      [v7 setDelegate:self];
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
      -[os_log_s refreshDataForReason:completion:](v10, "refreshDataForReason:completion:", 0LL, &stru_1000615D8);
      goto LABEL_11;
    }

    id v15 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      uint64_t v12 = "Determined that the user was a restricted guest. Skipping CloudKit refresh";
      uint64_t v13 = v10;
      uint32_t v14 = 2;
      goto LABEL_9;
    }
  }

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  if (isWaitingToStart)
  {
    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[MSDHomeManager homeManager:didRemoveHome:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.",  (uint8_t *)&v16,  0xCu);
    }
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    unsigned int v12 = [v6 isHomeRemovedPermanently:v11];

    id v13 = sub_10003E9DC();
    uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = @"NO";
      int v16 = 138478339;
      uint64_t v17 = (const char *)v6;
      __int16 v18 = 2113;
      if (v12) {
        id v15 = @"YES";
      }
      id v19 = v7;
      __int16 v20 = 2113;
      objc_super v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "HMHomeManager %{private}@ Removed Home %{private}@ isRemovedPermanently: %{private}@",  (uint8_t *)&v16,  0x20u);
    }

    if (v12) {
      -[MSDHomeManager _homeWasRemoved](self, "_homeWasRemoved");
    }
  }
}

- (void)homeManager:(id)a3 didRemoveHomePermanently:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  id v9 = sub_10003E9DC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v11)
    {
      int v12 = 136315138;
      id v13 = "-[MSDHomeManager homeManager:didRemoveHomePermanently:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    if (v11)
    {
      int v12 = 138478083;
      id v13 = v6;
      __int16 v14 = 2113;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "HMHomeManager %{private}@ Permanently Removed Home %{private}@",  (uint8_t *)&v12,  0x16u);
    }

    -[MSDHomeManager _homeWasRemoved](self, "_homeWasRemoved");
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", v4);
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMHomeManagerStatusToString([v4 status]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v15 = 136315650;
    int v16 = "-[MSDHomeManager homeManagerDidUpdateHomes:]";
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s manager status: %@, managerIsReady: %i",  (uint8_t *)&v15,  0x1Cu);
  }

  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  if (!self->_isHomeKitInitialized) {
    self->_isHomeKitInitialized = 1;
  }
  os_unfair_lock_unlock(&self->_readinessLock);
  char v11 = v5 ^ 1;
  if (isWaitingToStart) {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    id v12 = sub_10003E9DC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (char *)objc_claimAutoreleasedReturnValue([v4 homes]);
      int v15 = 138477827;
      int v16 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received update on homes: %{private}@",  (uint8_t *)&v15,  0xCu);
    }

    -[MSDHomeManager _addHomeDelegates:](self, "_addHomeDelegates:", v4);
  }
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  unsigned int v6 = -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", v5);
  id v7 = sub_10003E9DC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMHomeManagerStatusToString([v5 status]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[MSDHomeManager homeManager:didUpdateStatus:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    unsigned int v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s manager status: %@, managerIsReady: %i",  buf,  0x1Cu);
  }

  if (v6)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100017314;
    v13[3] = &unk_100061600;
    int v15 = buf;
    v13[4] = self;
    id v14 = v5;
    -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v13);
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      -[MSDHomeManager _handleHomeKitFinishedInitialization](self, "_handleHomeKitFinishedInitialization");
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000174D8;
      v12[3] = &unk_100060E40;
      v12[4] = self;
      -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v12);
      char v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
      [v11 refreshDataForReason:9 completion:&stru_100061620];
    }

    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)isHomeManagerReady:(id)a3
{
  return ((unint64_t)[a3 status] & 0x31) == 0;
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v3 isMultiUserEnabled];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Home MUEnablement status changed : %d",  (uint8_t *)v7,  8u);
  }

  if ([v3 isMultiUserEnabled])
  {
    unsigned int v6 = -[MSDDataRefresh initWithReason:](objc_alloc(&OBJC_CLASS___MSDDataRefresh), "initWithReason:", 2LL);
    -[MSDDataRefresh performRefreshWithCompletion:](v6, "performRefreshWithCompletion:", &stru_100061640);
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  unsigned int v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  id v9 = sub_10003E9DC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138478083;
    uint64_t v31 = v6;
    __int16 v32 = 2113;
    uint64_t v33 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "DidAddUser Home: %{private}@ User: %{private}@",  (uint8_t *)&v30,  0x16u);
  }

  char v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 home]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
  unsigned __int8 v15 = [v11 isEqual:v14];

  if ((v15 & 1) != 0)
  {
    if ([v6 isCurrentUserRestrictedGuest])
    {
      id v16 = sub_10003E9DC();
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136315138;
        uint64_t v31 = "-[MSDHomeManager home:didAddUser:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Determined user was a restricted guest and not of interest",  (uint8_t *)&v30,  0xCu);
      }
    }

    else
    {
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 userSettingsForHome:v6]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s settings](v17, "settings"));
      [v26 setDelegate:self];
      -[MSDHomeManager _updateAllowInHomePreferenceForUser:settingValue:]( self,  "_updateAllowInHomePreferenceForUser:settingValue:",  v8,  objc_msgSend(v7, "ms_allowiTunesAccountInHome:", v6));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v6 allUsers]);
      -[MSDHomeManager _handleUsersChangedInHome:](self, "_handleUsersChangedInHome:", v27);

      if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
      {
        [v7 setDelegate:self];
        -[MSDHomeManager _updateAllowExplicitContentPreferenceForUser:settingValue:]( self,  "_updateAllowExplicitContentPreferenceForUser:settingValue:",  v8,  objc_msgSend(v7, "ms_allowExplicitContentInHome:", v6));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v7 userListeningHistoryUpdateControlForHome:v6]);
        -[MSDHomeManager _updateListeningHistoryPreferenceForUser:listeningHistory:]( self,  "_updateListeningHistoryPreferenceForUser:listeningHistory:",  v28,  v29);
      }
    }
  }

  else
  {
    id v18 = sub_10003E9DC();
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10001ADB8(v17, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  unsigned int v6 = (char *)a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    int v26 = 138478083;
    v27 = v6;
    __int16 v28 = 2113;
    uint64_t v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DidRemoveUser Home: %{private}@ User: %{private}@",  (uint8_t *)&v26,  0x16u);
  }

  char v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 home]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
  unsigned __int8 v15 = [v11 isEqual:v14];

  if ((v15 & 1) != 0)
  {
    if ([v6 isCurrentUserRestrictedGuest])
    {
      id v16 = sub_10003E9DC();
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136315138;
        v27 = "-[MSDHomeManager home:didRemoveUser:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Determined user was a restricted guest and not of interest",  (uint8_t *)&v26,  0xCu);
      }
    }

    else
    {
      if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
      {
        -[MSDHomeManager _updateAllowExplicitContentPreferenceForAllUsers:]( self,  "_updateAllowExplicitContentPreferenceForAllUsers:",  v6);
        -[MSDHomeManager _updateListeningHistorySettingPreferenceForAllUsers:]( self,  "_updateListeningHistorySettingPreferenceForAllUsers:",  v6);
      }

      -[MSDHomeManager _updateAllowInHomePreferenceForAllUsers:](self, "_updateAllowInHomePreferenceForAllUsers:", v6);
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 allUsers]);
      -[MSDHomeManager _handleUsersChangedInHome:](self, "_handleUsersChangedInHome:", v17);
    }
  }

  else
  {
    id v18 = sub_10003E9DC();
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10001AE28(v17, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    char v11 = "-[MSDHomeManager home:didAddAccessory:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s home %@ accessory %@",  (uint8_t *)&v10,  0x20u);
  }
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10003E9DC();
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    id v16 = "-[MSDHomeManager shareManager:didReceiveShareInvitation:completionHandler:]";
    __int16 v17 = 2113;
    id v18 = v7;
    __int16 v19 = 2113;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s, Manager:%{private}@ invitation: %{private}@",  buf,  0x20u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017E3C;
  v13[3] = &unk_100061668;
  id v14 = v9;
  id v12 = v9;
  +[MSDHomeCloudShareCreate acceptInvitation:completion:]( &OBJC_CLASS___MSDHomeCloudShareCreate,  "acceptInvitation:completion:",  v8,  v13);
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredMediaUser]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    int v10 = 136315906;
    char v11 = "-[MSDHomeManager accessoryDidUpdatePreferredMediaUser:]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    id v17 = [v4 preferredUserSelectionType];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s PrimaryUserDidUpdate %@ : PreferredUser %@ and Type: %lu",  (uint8_t *)&v10,  0x2Au);
  }

  id v9 = [[MSPrimaryUserChangedEvent alloc] initWithAccessory:v4];
  +[MSAnalytics sendPrimaryUserUpdatedOn:](&OBJC_CLASS___MSAnalytics, "sendPrimaryUserUpdatedOn:", v9);

  -[MSDHomeManager updatePrimaryUserOnDevice:](self, "updatePrimaryUserOnDevice:", v4);
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10003E9DC();
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315906;
    __int16 v28 = "-[MSDHomeManager settings:didUpdateForIdentifier:keyPath:]";
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s, %@, identifier: %@, keyPath: %@",  (uint8_t *)&v27,  0x2Au);
  }

  uint64_t v13 = allowiTunesAccountSettingsKeyPath;
  if ([v10 isEqualToString:allowiTunesAccountSettingsKeyPath])
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 rootGroup]);
    uint64_t SettingWithKeyPath = findSettingWithKeyPath(v13, v14);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(SettingWithKeyPath);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);
    id v18 = [v17 BOOLValue];

    -[MSDHomeManager _updateAllowInHomePreferenceForUser:settingValue:]( self,  "_updateAllowInHomePreferenceForUser:settingValue:",  v9,  v18);
  }

  else
  {
    uint64_t v19 = allowExplicitContentSettingsKeyPath;
    if ([v10 isEqualToString:allowExplicitContentSettingsKeyPath])
    {
      if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 rootGroup]);
        uint64_t v21 = findSettingWithKeyPath(v19, v20);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 value]);
        id v24 = [v23 BOOLValue];

        -[MSDHomeManager _updateAllowExplicitContentPreferenceForUser:settingValue:]( self,  "_updateAllowExplicitContentPreferenceForUser:settingValue:",  v9,  v24);
      }

      else
      {
        id v25 = sub_10003E9DC();
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "HomeSideKickMediaSettings feature is disabled on device",  (uint8_t *)&v27,  2u);
        }
      }
    }
  }
}

- (void)homehubManager:(id)a3 didAddEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[MSDHomeManager homehubManager:didAddEndpoint:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s homehubManager %@ : didAddEndpoint %@",  (uint8_t *)&v12,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accessoryId]);
  -[MSDHomeManager _settingsForActivatedEndpoint:home:](self, "_settingsForActivatedEndpoint:home:", v11, v10);
}

- (void)homehubManager:(id)a3 didRemoveEndpoint:(id)a4
{
  id v5 = a4;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
    int v11 = 136315394;
    int v12 = "-[MSDHomeManager homehubManager:didRemoveEndpoint:]";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  -[MSDHomeManager _clearCachedEndpointData:](self, "_clearCachedEndpointData:", v10);
}

- (void)user:(id)a3 didUpdateUserListeningHistoryUpdateControl:(id)a4 forHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled") & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 home]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
    unsigned __int8 v15 = [v11 isEqual:v14];

    if ((v15 & 1) != 0)
    {
      id v16 = sub_10003E9DC();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = v17;
      if (v9)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 accessories]);
          int v44 = 136315650;
          v45 = "-[MSDHomeManager user:didUpdateUserListeningHistoryUpdateControl:forHome:]";
          __int16 v46 = 2112;
          id v47 = v8;
          __int16 v48 = 2112;
          v49 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s user %@ updateListeningHistoryControl %@",  (uint8_t *)&v44,  0x20u);
        }

        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s UUIDString](v18, "UUIDString"));
        -[MSDHomeManager _updateListeningHistoryPreferenceForUser:listeningHistory:]( self,  "_updateListeningHistoryPreferenceForUser:listeningHistory:",  v20,  v9);
      }

      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_10001AEF8(v18, v37, v38, v39, v40, v41, v42, v43);
      }
    }

    else
    {
      id v29 = sub_10003E9DC();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001AF68(v18, v30, v31, v32, v33, v34, v35, v36);
      }
    }
  }

  else
  {
    id v21 = sub_10003E9DC();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001AFD8(v18, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

- (void)_addHomeDelegates:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 homes]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100018768;
  v5[3] = &unk_100061690;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (BOOL)isHomeKitReady
{
  if (self->_isHomeKitInitialized) {
    return -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", self->_homeManager);
  }
  else {
    return 0;
  }
}

- (void)_homeWasRemoved
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
  [v2 refreshDataForReason:1 completion:&stru_1000616B0];
}

- (void)_noteHomesStillLoading
{
  if (!-[MSDHomeManager isWaitingForHomesToLoad](self, "isWaitingForHomesToLoad"))
  {
    self->_waitingForHomesToLoad = 1;
    self->os_signpost_id_t signpostID = MSDGenerateSignpostID();
    id v3 = MSDSignpostFacility();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = v4;
    os_signpost_id_t signpostID = self->signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)id v7 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "LookupHomes",  (const char *)&unk_10004C5A3,  v7,  2u);
    }
  }

- (void)_withReadinessLock:(id)a3
{
  p_readinessLock = &self->_readinessLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_readinessLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_readinessLock);
}

- (void)_withRequestLock:(id)a3
{
  p_requestQueueLock = &self->_requestQueueLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_requestQueueLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)_handleHomeKitFinishedInitialization
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentAccessory](self, "currentAccessory"));
  id v4 = v3;
  if (v3 && ([v3 isHomePod] & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsDefaults]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"AccessoryOwnerHomeUserID"]);

      if (!v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 owner]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

        if (v11)
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userSettingsDefaults]);
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 owner]);
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
          [v13 setObject:v16 forKey:@"AccessoryOwnerHomeUserID"];
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userSettingsDefaults]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"AccessoryHomeIDKey"]);

      if (!v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);

        if (v21)
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userSettingsDefaults]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
          [v23 setObject:v25 forKey:@"AccessoryHomeIDKey"];
        }
      }

      [v4 setDelegate:self];
      -[MSDHomeManager _addUserSettingsDelegate:](self, "_addUserSettingsDelegate:", v5);
      -[MSDHomeManager updatePrimaryUserOnDevice:](self, "updatePrimaryUserOnDevice:", v4);
      -[MSDHomeManager _updateAllowInHomePreferenceForAllUsers:](self, "_updateAllowInHomePreferenceForAllUsers:", v5);
      if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
      {
        -[MSDHomeManager _updateAllowExplicitContentPreferenceForAllUsers:]( self,  "_updateAllowExplicitContentPreferenceForAllUsers:",  v5);
        -[MSDHomeManager _updateListeningHistorySettingPreferenceForAllUsers:]( self,  "_updateListeningHistorySettingPreferenceForAllUsers:",  v5);
      }

      -[MSDHomeManager _updateSiriEndpointSettings](self, "_updateSiriEndpointSettings");
      -[MSDHomeManager _addHomeDelegates:](self, "_addHomeDelegates:", self->_homeManager);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 allUsers]);
      -[MSDHomeManager _handleUsersChangedInHome:](self, "_handleUsersChangedInHome:", v26);

      -[MSDHomeManager _notifyQueuedOfCurrentHome](self, "_notifyQueuedOfCurrentHome");
      -[MSDHomeManager _handleHomeKitSyncComplete](self, "_handleHomeKitSyncComplete");
    }

    else
    {
      id v28 = sub_10003E9DC();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10001B154(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      -[MSDHomeManager _notifyQueuedOfCurrentHome](self, "_notifyQueuedOfCurrentHome");
    }
  }

  else
  {
    id v27 = sub_10003E9DC();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10001B0A8(v4, (os_log_s *)v5);
    }
  }
}

- (void)_handleHomeKitSyncComplete
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = self->_delegates;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "homeManager:didHomeKitSyncComplete:") & 1) != 0)
        {
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
          id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          v11[2] = sub_100018E44;
          v11[3] = &unk_1000616D8;
          v11[4] = v8;
          v11[5] = self;
          dispatch_async(v10, v11);
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyQueuedOfCurrentHome
{
  v7[0] = 0LL;
  v7[1] = v7;
  _DWORD v7[2] = 0x3032000000LL;
  v7[3] = sub_10001626C;
  v7[4] = sub_10001627C;
  id v8 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100018F90;
  v6[3] = &unk_100061520;
  v6[4] = self;
  v6[5] = v7;
  -[MSDHomeManager _withRequestLock:](self, "_withRequestLock:", v6);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100018FF8;
  v5[3] = &unk_100061520;
  v5[4] = self;
  void v5[5] = v7;
  dispatch_async(v4, v5);

  _Block_object_dispose(v7, 8);
}

- (void)_handleUsersChangedInHome:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100061718));
    id v5 = sub_10003E9DC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10001B1C4();
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSettingsDefaults]);
    [v8 setObject:v4 forKey:@"AccessoryUsersInAccessoryHome"];
  }
}

- (void)updatePrimaryUserOnDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    else {
      -[MSDHomeManager _updatePrimaryUserForHomePodAccessory:](self, "_updatePrimaryUserForHomePodAccessory:", v5);
    }
  }

  else
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001B224(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_updatePrimaryUserForHomePodAccessory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredMediaUser]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsDefaults]);
  [v7 setObject:v12 forKey:@"AccessoryPrimaryUserHomeUserID"];

  id v8 = [v3 preferredUserSelectionType];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userSettingsDefaults]);
  [v11 setObject:v9 forKey:@"AccessoryPrimaryUserType"];
}

- (void)_addUserSettingsDelegate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allUsers]);
    if (!v6)
    {
      id v7 = sub_10003E9DC();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10001B304(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100019470;
    v24[3] = &unk_100061740;
    v24[4] = self;
    id v25 = v5;
    [v6 enumerateObjectsUsingBlock:v24];
  }

  else
  {
    id v16 = sub_10003E9DC();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10001B294((os_log_s *)v6, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_updateAllowInHomePreferenceForUser:(id)a3 settingValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsDefaults]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"HomeAllowiTunesAccountUserIDMap"]);

  id v9 = [v8 mutableCopy];
  uint64_t v11 = v9;
  if (!v9 || ![v9 count])
  {
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);

    uint64_t v11 = (void *)v12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  [v11 setObject:v13 forKey:v14];
  id v15 = sub_10003E9DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[MSDHomeManager _updateAllowInHomePreferenceForUser:settingValue:]";
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s useInHomeCachesValues %@",  (uint8_t *)&v19,  0x16u);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userSettingsDefaults]);
  [v18 setObject:v11 forKey:@"HomeAllowiTunesAccountUserIDMap"];
}

- (void)_updateAllowInHomePreferenceForAllUsers:(id)a3
{
}

- (void)_updateAllowExplicitContentPreferenceForUser:(id)a3 settingValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsDefaults]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"HomeAllowExplicitContentUserIDMap"]);

  id v9 = [v8 mutableCopy];
  uint64_t v11 = v9;
  if (!v9 || ![v9 count])
  {
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);

    uint64_t v11 = (void *)v12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  [v11 setObject:v13 forKey:v14];
  id v15 = sub_10003E9DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[MSDHomeManager _updateAllowExplicitContentPreferenceForUser:settingValue:]";
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s allowExplicitContent Cached values %@",  (uint8_t *)&v19,  0x16u);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userSettingsDefaults]);
  [v18 setObject:v11 forKey:@"HomeAllowExplicitContentUserIDMap"];
}

- (void)_updateAllowExplicitContentPreferenceForAllUsers:(id)a3
{
}

- (void)_updateListeningHistoryPreferenceForUser:(id)a3 listeningHistory:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentAccessory](self, "currentAccessory"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userSettingsDefaults]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"HomeUpdateListeningHistoryUserIDMap"]);
  id v12 = [v11 mutableCopy];

  if (!v12 || ![v12 count])
  {
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v13);

    id v12 = (id)v14;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "accessories", v21));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100019A58;
  v23[3] = &unk_100061768;
  id v24 = v8;
  id v16 = v8;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "na_map:", v23));

  objc_msgSend(v12, "na_safeSetObject:forKey:", v17, v6);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userSettingsDefaults]);
  id v20 = [v12 copy];
  [v19 setObject:v20 forKey:@"HomeUpdateListeningHistoryUserIDMap"];
}

- (void)_updateListeningHistorySettingPreferenceForAllUsers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentAccessory](self, "currentAccessory"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSettingsDefaults]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"HomeUpdateListeningHistoryUserIDMap"]);

    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 allUsers]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100019CE0;
    v28[3] = &unk_100061790;
    id v29 = v4;
    id v13 = v6;
    id v30 = v13;
    id v14 = v11;
    id v31 = v14;
    [v12 enumerateObjectsUsingBlock:v28];

    if (([v9 isEqualToDictionary:v14] & 1) == 0)
    {
      id v15 = sub_10003E9DC();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10001B3E4();
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userSettingsDefaults]);
      id v19 = [v14 copy];
      [v18 setObject:v19 forKey:@"HomeUpdateListeningHistoryUserIDMap"];
    }
  }

  else
  {
    id v20 = sub_10003E9DC();
    id v13 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10001B374((os_log_s *)v13, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)_updateSettingsCacheForAllUsers:(id)a3 settingsKeyPath:(id)a4 defaultsKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v10 = a5;
  if (v7)
  {
    uint64_t v29 = 0LL;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 0;
    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 allUsers]);
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    uint64_t v23 = sub_10001A098;
    uint64_t v24 = &unk_1000617B8;
    id v25 = v8;
    id v26 = v7;
    id v28 = &v29;
    id v13 = v11;
    id v27 = v13;
    [v12 enumerateObjectsUsingBlock:&v21];

    if (!*((_BYTE *)v30 + 24))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSettingsDefaults settingsDefaults]( &OBJC_CLASS___MSDSettingsDefaults,  "settingsDefaults",  v21,  v22,  v23,  v24,  v25,  v26));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userSettingsDefaults]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v10]);

      if (([v16 isEqualToDictionary:v13] & 1) == 0)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userSettingsDefaults]);
        [v18 setObject:v13 forKey:v10];
      }
    }

    _Block_object_dispose(&v29, 8);
  }

  else
  {
    id v19 = sub_10003E9DC();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001B4B4();
    }
  }
}

- (void)_updatePrimaryUserForSiriEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v15 = v4;
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[MSDHomeManager _updatePrimaryUserForSiriEndpoints:](self, "_updatePrimaryUserForSiriEndpoints:", v6);
  }

  else
  {
    id v7 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001B57C(v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_updatePrimaryUserForSiriEndpoints:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userSettingsDefaults]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"EndpointPrimaryUser"]);
  id v7 = [v6 mutableCopy];

  if (!v7
    || (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]),
        id v10 = [v9 count],
        v9,
        !v10))
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);

    id v7 = (id)v11;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001A454;
  v17[3] = &unk_1000617E0;
  id v12 = v7;
  id v18 = v12;
  [v3 enumerateObjectsUsingBlock:v17];
  id v13 = sub_10003E9DC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[MSDHomeManager _updatePrimaryUserForSiriEndpoints:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Updating PreferredUser cached info %@",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userSettingsDefaults]);
  [v16 setObject:v12 forKey:@"EndpointPrimaryUser"];
}

- (void)_updateSiriEndpointSettings
{
  homehubManager = self->_homehubManager;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 home]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSHomeHubManager activeEndpointAccessories:](homehubManager, "activeEndpointAccessories:", v5));

  if ([v6 count])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_10001A5B8;
    v7[3] = &unk_1000617E0;
    v7[4] = self;
    [v6 enumerateObjectsUsingBlock:v7];
    -[MSDHomeManager _updatePrimaryUserForSiriEndpoints:](self, "_updatePrimaryUserForSiriEndpoints:", v6);
  }
}

- (void)_clearCachedEndpointData:(id)a3
{
  id v9 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userSettingsDefaults]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"EndpointPrimaryUser"]);
  id v6 = [v5 mutableCopy];

  if (v6 && [v6 count])
  {
    [v6 removeObjectForKey:v9];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSettingsDefaults]);
    [v8 setObject:v6 forKey:@"EndpointPrimaryUser"];
  }
}

- (void)_settingsForActivatedEndpoint:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessoryWithUniqueIdentifier:v6]);
  id v9 = v8;
  if (v8)
  {
    [v8 setDelegate:self];
    -[MSDHomeManager _updatePrimaryUserForSiriEndpoint:](self, "_updatePrimaryUserForSiriEndpoint:", v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
    objc_sync_enter(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
    [v11 removeObject:v6];
  }

  else
  {
    id v12 = sub_10003E9DC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001B5EC();
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
    objc_sync_enter(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
    [v11 addObject:v6];
  }

  objc_sync_exit(v10);
}

- (void)_addSubscriptionsForPendingEndpoints
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager pendingAccessoryIDs](self, "pendingAccessoryIDs"));
  id v5 = [v4 copy];

  objc_sync_exit(v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager currentHome](self, "currentHome"));
  id v7 = v6;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001A8D4;
    v10[3] = &unk_100061808;
    v10[4] = self;
    id v11 = v6;
    [v5 enumerateObjectsUsingBlock:v10];
  }

  else
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001B65C(self, v9);
    }
  }
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (NSMutableSet)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (BOOL)isWaitingForHomesToLoad
{
  return self->_waitingForHomesToLoad;
}

- (void)setWaitingForHomesToLoad:(BOOL)a3
{
  self->_waitingForHomesToLoad = a3;
}

- (BOOL)isHomeKitInitialized
{
  return self->_isHomeKitInitialized;
}

- (void)setIsHomeKitInitialized:(BOOL)a3
{
  self->_isHomeKitInitialized = a3;
}

- (BOOL)isWaitingToStart
{
  return self->_isWaitingToStart;
}

- (void)setIsWaitingToStart:(BOOL)a3
{
  self->_BOOL isWaitingToStart = a3;
}

- (NSMutableArray)queuedAwaitingCurrentHome
{
  return self->_queuedAwaitingCurrentHome;
}

- (void)setQueuedAwaitingCurrentHome:(id)a3
{
}

- (MSHomeHubManager)homehubManager
{
  return self->_homehubManager;
}

- (void)setHomehubManager:(id)a3
{
}

- (NSMutableSet)pendingAccessoryIDs
{
  return self->_pendingAccessoryIDs;
}

- (void)setPendingAccessoryIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end