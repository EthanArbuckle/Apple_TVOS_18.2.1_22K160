@interface PBRecognizeMyVoiceObserver
- (ACAccountStore)accountStore;
- (AFSettingsConnection)siriConnection;
- (NSMutableDictionary)queuedBulletins;
- (NSString)lastSelectedUserIdentifier;
- (OS_dispatch_queue)workQueue;
- (PBBulletinService)bulletinService;
- (PBRecognizeMyVoiceObserver)init;
- (void)_checkSelectedUserRMVStateIfBulletinQueued;
- (void)_handleRMVHomeNotification:(id)a3;
- (void)_handleRMVSettingChangedNotification;
- (void)_presentBulletinIfNeeded;
- (void)_queueBulletinForUser:(id)a3 type:(unint64_t)a4;
- (void)dealloc;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)setAccountStore:(id)a3;
- (void)setBulletinService:(id)a3;
- (void)setLastSelectedUserIdentifier:(id)a3;
- (void)setQueuedBulletins:(id)a3;
- (void)setSiriConnection:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation PBRecognizeMyVoiceObserver

- (PBRecognizeMyVoiceObserver)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBRecognizeMyVoiceObserver;
  v2 = -[PBRecognizeMyVoiceObserver init](&v25, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PineBoard.PBRecognizeMyVoiceManager.work", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    siriConnection = v2->_siriConnection;
    v2->_siriConnection = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    queuedBulletins = v2->_queuedBulletins;
    v2->_queuedBulletins = (NSMutableDictionary *)v11;

    v13 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    bulletinService = v2->_bulletinService;
    v2->_bulletinService = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userProfilesSnapshot]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 selectedUserProfileIdentifier]);
    lastSelectedUserIdentifier = v2->_lastSelectedUserIdentifier;
    v2->_lastSelectedUserIdentifier = (NSString *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    [v19 addObserver:v2];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v20 addObserver:v2 selector:"_handleRMVHomeNotification:" name:kAFHomeBulletinAllowedNotification object:0 suspensionBehavior:4];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v21 addObserver:v2 selector:"_handleRMVHomeNotification:" name:@"com.apple.siri.home_update" object:0 suspensionBehavior:4];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v22 addObserver:v2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100092DCC,  kAFRecognizeMyVoiceSettingChangedDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v4 removeObserver:self];

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFRecognizeMyVoiceSettingChangedDarwinNotification, 0LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRecognizeMyVoiceObserver;
  -[PBRecognizeMyVoiceObserver dealloc](&v7, "dealloc");
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userProfilesSnapshot]);
  dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 selectedUserProfileIdentifier]);

  if (v5 != self->_lastSelectedUserIdentifier)
  {
    id v6 = sub_100083B40();
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      lastSelectedUserIdentifier = self->_lastSelectedUserIdentifier;
      *(_DWORD *)buf = 138543618;
      v15 = lastSelectedUserIdentifier;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Selected user identifier changed. {prevIdentifier=%{public}@, currentIdentifier=%{public}@",  buf,  0x16u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v9 = dispatch_time(0LL, 2000000000LL);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000931F4;
    block[3] = &unk_1003D0890;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_after(v9, workQueue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  uint64_t v11 = self->_lastSelectedUserIdentifier;
  self->_lastSelectedUserIdentifier = v5;
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  id v6 = a5;
  objc_super v7 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v6);

  if (-[PBSceneHandle isDefaultKioskAppScene](v7, "isDefaultKioskAppScene"))
  {
    objc_initWeak(&location, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000932F0;
    v9[3] = &unk_1003D0890;
    objc_copyWeak(&v10, &location);
    dispatch_async(workQueue, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_handleRMVSettingChangedNotification
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfiles]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&__int128 v8 = 138543874LL;
    __int128 v20 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iCloudAltDSID", v20));

        if (v13)
        {
          siriConnection = self->_siriConnection;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_10009356C;
          v21[3] = &unk_1003D4438;
          v21[4] = v12;
          -[AFSettingsConnection getSiriRMVStatusForiCloudAltDSID:completion:]( siriConnection,  "getSiriRMVStatusForiCloudAltDSID:completion:",  v15,  v21);
        }

        else
        {
          id v16 = sub_100083B40();
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);
            *(_DWORD *)buf = v20;
            v27 = v18;
            __int16 v28 = 2160;
            uint64_t v29 = 1752392040LL;
            __int16 v30 = 2112;
            v31 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "User does not have iCloud. {userIdentifier=%{public}@, altDSID=%{mask.hash}@}",  buf,  0x20u);
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }

    while (v9);
  }
}

- (void)_handleRMVHomeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083B40();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received RMV notification. {notification=%@}",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"profileID"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userProfilesSnapshot]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 userProfileWithIdentifier:v8]);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v13 = objc_msgSend(v12, "pbs_rmvBulletinShownToUserWithIdentifier:", v8);

      if (!v13)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        v19 = (void *)([v18 isEqualToString:kAFHomeBulletinAllowedNotification] ^ 1);

        objc_initWeak((id *)buf, self);
        workQueue = (dispatch_queue_s *)self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100093AF4;
        block[3] = &unk_1003D1CD0;
        objc_copyWeak(v23, (id *)buf);
        id v11 = v11;
        id v22 = v11;
        v23[1] = v19;
        dispatch_async(workQueue, block);

        objc_destroyWeak(v23);
        objc_destroyWeak((id *)buf);
        goto LABEL_14;
      }

      id v14 = sub_100083B40();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "RMV bulletin already shown to user. Will ignore. {userIdentifier=%{public}@",  buf,  0xCu);
      }
    }

    else
    {
      id v17 = sub_100083B40();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1002796B4((uint64_t)v8, v15);
      }
    }
  }

  else
  {
    id v16 = sub_100083B40();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_100279674((os_log_t)v11);
    }
  }

- (void)_queueBulletinForUser:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _welcomeBulletinProfilePictureDataForUserProfile:v6]);

  id v9 = [[PBSUserProfileAccountInfo alloc] initWithAccountStore:self->_accountStore userProfile:v6];
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  -[PBSBulletin setServiceIdentifier:](v10, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  -[PBSBulletin setViewControllerClassName:]( v10,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4 == 1)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"RMVEnabledInHomeBulletinTitle" value:&stru_1003E2910 table:@"Localizable-RMV"]);
    [v11 setObject:v18 forKeyedSubscript:PBSSystemBulletinTitleKey];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v15 = v14;
    id v16 = @"RMVEnabledInHomeBulletinMessage";
  }

  else
  {
    if (a4) {
      goto LABEL_6;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"RMVEnabledFromHomeBulletinTitle" value:&stru_1003E2910 table:@"Localizable-RMV"]);
    [v11 setObject:v13 forKeyedSubscript:PBSSystemBulletinTitleKey];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v15 = v14;
    id v16 = @"RMVEnabledFromHomeBulletinMessage";
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:v16 value:&stru_1003E2910 table:@"Localizable-RMV"]);
  [v11 setObject:v19 forKeyedSubscript:PBSSystemBulletinMessageKey];

LABEL_6:
  [v11 setObject:v8 forKeyedSubscript:PBSSystemBulletinImageDataKey];
  [v11 setObject:&off_1003FD9E0 forKeyedSubscript:PBSSystemBulletinTimeoutKey];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:PBSWelcomeBackBulletinKey];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 personNameComponents]);
  [v11 setObject:v20 forKeyedSubscript:PBSWelcomeBackBulletinPersonNameComponentsKey];

  -[PBSBulletin setMessage:](v10, "setMessage:", v11);
  queuedBulletins = self->_queuedBulletins;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary setObject:forKey:](queuedBulletins, "setObject:forKey:", v10, v22);

  id v23 = sub_100083B40();
  __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    int v26 = 138543362;
    v27 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Queued bulletin for user. {userIdentifier=%{public}@}",  (uint8_t *)&v26,  0xCu);
  }
}

- (void)_checkSelectedUserRMVStateIfBulletinQueued
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedUserProfile]);

  queuedBulletins = self->_queuedBulletins;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](queuedBulletins, "objectForKey:", v7));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);

    if (v9)
    {
      objc_initWeak(&location, self);
      siriConnection = self->_siriConnection;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100094054;
      v14[3] = &unk_1003D4460;
      objc_copyWeak(&v16, &location);
      id v15 = v5;
      -[AFSettingsConnection getSiriRMVStatusForiCloudAltDSID:completion:]( siriConnection,  "getSiriRMVStatusForiCloudAltDSID:completion:",  v11,  v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

    else
    {
      id v12 = sub_100083B40();
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100279728(v5, v13);
      }
    }
  }
}

- (void)_presentBulletinIfNeeded
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedUserProfileIdentifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedBulletins, "objectForKey:", v5));
  if (v6)
  {
    *(void *)&__int128 v21 = 0LL;
    *((void *)&v21 + 1) = &v21;
    uint64_t v22 = 0x2020000000LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100094610;
    block[3] = &unk_1003D0790;
    void block[4] = &v21;
    dispatch_sync(&_dispatch_main_q, block);
    if (*(_BYTE *)(*((void *)&v21 + 1) + 24LL))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_queuedBulletins, "removeObjectForKey:", v5);
      id v7 = sub_100083B40();
      __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Presenting bulletin for user. {userIdentifier=%{public}@}",  buf,  0xCu);
      }

      objc_initWeak((id *)buf, self);
      bulletinService = self->_bulletinService;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10009466C;
      v14[3] = &unk_1003D4488;
      objc_copyWeak(&v17, (id *)buf);
      id v15 = v5;
      id v16 = v6;
      -[PBBulletinService presentBulletin:withCompletion:](bulletinService, "presentBulletin:withCompletion:", v16, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      id v12 = sub_100083B40();
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Attempted to present bulletin but HeadBoard is not focused. {userIdentifier=%{public}@}",  buf,  0xCu);
      }
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v10 = sub_100083B40();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v21) = 138543362;
      *(void *)((char *)&v21 + 4) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempted to present bulletin but no bulletin queued for selected user. {userIdentifier=%{public}@}",  (uint8_t *)&v21,  0xCu);
    }
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (AFSettingsConnection)siriConnection
{
  return self->_siriConnection;
}

- (void)setSiriConnection:(id)a3
{
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSMutableDictionary)queuedBulletins
{
  return self->_queuedBulletins;
}

- (void)setQueuedBulletins:(id)a3
{
}

- (NSString)lastSelectedUserIdentifier
{
  return self->_lastSelectedUserIdentifier;
}

- (void)setLastSelectedUserIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end