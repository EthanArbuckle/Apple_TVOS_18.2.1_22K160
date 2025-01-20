@interface ADNotificationManager
+ (id)_createBBObserverWithQueue:(id)a3;
+ (id)sharedManager;
- (ADNotificationManagerDataSource)dataSource;
- (BOOL)_isAppRestrictedAndSiriRelated:(id)a3;
- (BOOL)hasIncomingCallNotification;
- (id)_afbulletinForBBBulletin:(id)a3 forFeed:(unint64_t)a4;
- (id)_displayNameForBulletin:(id)a3;
- (id)_init;
- (id)_siriRelatedRestrictedAppsForApps:(id)a3;
- (void)_bulletinsDidChange;
- (void)_fetchFromDataSourceIfNecessary;
- (void)_fetchInitialState;
- (void)_getNotificationsFromBulletinBoard;
- (void)_getRestrictedAppsFromBulletinBoard;
- (void)_notifyDelegatesDidAddBulletin:(id)a3;
- (void)_notifyDelegatesDidRemoveBulletin:(id)a3;
- (void)_performActionWithIdentifier:(id)a3 forAFBulletin:(id)a4 completion:(id)a5;
- (void)_setUpBBObserver;
- (void)addDelegate:(id)a3;
- (void)fetchActionsForBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchAllBulletinsWithCompletion:(id)a3;
- (void)fetchBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchBulletinsAfterBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchBulletinsOnLockScreenWithCompletion:(id)a3;
- (void)fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:(id)a3;
- (void)fetchSpokenNotificationEnabledAppsWithCompletion:(id)a3;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)performActionWithIdentifier:(id)a3 forBulletinWithIdentifier:(id)a4 completion:(id)a5;
- (void)performActionWithIdentifier:(id)a3 forUNNotificationWithIdentifier:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
@end

@implementation ADNotificationManager

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADNotificationManager;
  v2 = -[ADNotificationManager init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADNotificationManager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    settingsGroup = v2->_settingsGroup;
    v2->_settingsGroup = (OS_dispatch_group *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    notificationsGroup = v2->_notificationsGroup;
    v2->_notificationsGroup = (OS_dispatch_group *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___ADNotificationOrderedDictionary);
    allBulletins = v2->_allBulletins;
    v2->_allBulletins = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bulletinsOnLockScreen = v2->_bulletinsOnLockScreen;
    v2->_bulletinsOnLockScreen = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v17;

    -[ADNotificationManager _setUpBBObserver](v2, "_setUpBBObserver");
    v19 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100351ACC;
    block[3] = &unk_1004FD940;
    v22 = v2;
    dispatch_async(v19, block);
  }

  return v2;
}

- (void)_setUpBBObserver
{
  uint64_t v3 = AFIsHorseman(self);
  if ((v3 & 1) == 0 && (!AFIsNano(v3) || AFDeviceSupportsANE()))
  {
    id v4 = [(id)objc_opt_class(self) _createBBObserverWithQueue:self->_queue];
    dispatch_queue_attr_t v5 = (BBObserver *)objc_claimAutoreleasedReturnValue(v4);
    observer = self->_observer;
    self->_observer = v5;

    -[BBObserver setDelegate:](self->_observer, "setDelegate:", self);
    -[BBObserver setObserverFeed:](self->_observer, "setObserverFeed:", 0xFFFFLL);
  }

- (void)_fetchInitialState
{
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100351A60;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchAllBulletinsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100351990;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)fetchBulletinsOnLockScreenWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100351834;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)fetchBulletinsAfterBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003516F0;
    block[3] = &unk_1004FD9E0;
    id v10 = v6;
    dispatch_group_t v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)fetchBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003515F0;
    block[3] = &unk_1004FD9E0;
    id v10 = v6;
    dispatch_group_t v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)fetchActionsForBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003515A8;
    v8[3] = &unk_1004FDA08;
    id v9 = v6;
    -[ADNotificationManager fetchBulletinWithID:completion:](self, "fetchBulletinWithID:completion:", a3, v8);
  }
}

- (void)performActionWithIdentifier:(id)a3 forBulletinWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (![v9 length])
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ADNotificationManager performActionWithIdentifier:forBulletinWithIdentifier:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Missing bulletin identifer",  buf,  0xCu);
      if (!v10) {
        goto LABEL_6;
      }
    }

    else if (!v10)
    {
      goto LABEL_6;
    }

    v10[2](v10, 0LL);
    goto LABEL_6;
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10035153C;
  v13[3] = &unk_1004FDA30;
  id v14 = v9;
  v15 = self;
  id v16 = v8;
  uint64_t v17 = v10;
  dispatch_async(queue, v13);

LABEL_6:
}

- (void)performActionWithIdentifier:(id)a3 forUNNotificationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (![v9 length])
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[ADNotificationManager performActionWithIdentifier:forUNNotificationWithIdentifier:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Missing notification identifier",  buf,  0xCu);
      if (!v10) {
        goto LABEL_6;
      }
    }

    else if (!v10)
    {
      goto LABEL_6;
    }

    v10[2](v10, 0LL);
    goto LABEL_6;
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003514F0;
  v13[3] = &unk_1004FDA30;
  void v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  dispatch_async(queue, v13);

LABEL_6:
}

- (void)_performActionWithIdentifier:(id)a3 forAFBulletin:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (![v8 length])
  {
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Missing action identifier", buf, 0xCu);
      if (!v10) {
        goto LABEL_9;
      }
    }

    else if (!v10)
    {
      goto LABEL_9;
    }

    v10[2](v10, 0LL);
    goto LABEL_9;
  }

  dispatch_group_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 actionForIdentifier:v8]);
  id v12 = v11;
  if (!v11)
  {
    unsigned int v18 = [v8 isEqualToString:UNNotificationDismissActionIdentifier];
    v19 = (void *)AFSiriLogContextDaemon;
    if (v18)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v29 = v19;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v9 bulletinID]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v9 sectionID]);
        *(_DWORD *)buf = 136315650;
        v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
        __int16 v37 = 2112;
        v38 = v30;
        __int16 v39 = 2112;
        v40 = v31;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Clearing bulletin: %@ from section: %@",  buf,  0x20u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 bbBulletin]);

      if (v20)
      {
        v21 = objc_alloc(&OBJC_CLASS___NSSet);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v9 bbBulletin]);
        v34 = v22;
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
        v13 = -[NSSet initWithArray:](v21, "initWithArray:", v23);

        observer = self->_observer;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 sectionID]);
        -[BBObserver clearBulletins:inSection:](observer, "clearBulletins:inSection:", v13, v25);

        goto LABEL_4;
      }

      v28 = (os_log_s *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      v26 = "%s bbBulletin field is nil on bulletin";
      v27 = v28;
    }

    else
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        if (!v10) {
          goto LABEL_5;
        }
LABEL_19:
        v10[2](v10, 0LL);
        goto LABEL_5;
      }

      *(_DWORD *)buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      v26 = "%s Could not find action to perform";
      v27 = (os_log_s *)v19;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

  v13 = (NSSet *)objc_claimAutoreleasedReturnValue([v11 bbAction]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bbBulletin]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 responseForAction:v13]);

  id v16 = self->_observer;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1003514DC;
  v32[3] = &unk_1004FDA58;
  v33 = v10;
  -[BBObserver sendResponse:withCompletion:](v16, "sendResponse:withCompletion:", v15, v32);

LABEL_4:
LABEL_5:

LABEL_9:
}

- (id)_siriRelatedRestrictedAppsForApps:(id)a3
{
  id v3 = a3;
  uint64_t v17 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  id v4 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"com.apple.MobileSMS",  @"com.apple.mobilephone",  @"com.apple.facetime",  @"com.apple.NanoPhone",  @"com.apple.tincan",  0LL);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[NSSet containsObject:](v4, "containsObject:", v9))
        {
          -[NSMutableArray addObject:](v17, "addObject:", v9);
        }

        else
        {
          id v10 = objc_autoreleasePoolPush();
          dispatch_group_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v9));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[INAppInfo appInfoWithAppProxy:](&OBJC_CLASS___INAppInfo, "appInfoWithAppProxy:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 supportedIntents]);
          id v14 = [v13 count];

          if (v14) {
            -[NSMutableArray addObject:](v17, "addObject:", v9);
          }

          objc_autoreleasePoolPop(v10);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);
  }

  return v17;
}

- (void)fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    settingsGroup = self->_settingsGroup;
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003514C8;
    v8[3] = &unk_1004FD990;
    void v8[4] = self;
    id v9 = v4;
    dispatch_group_notify((dispatch_group_t)settingsGroup, queue, v8);
  }
}

- (void)fetchSpokenNotificationEnabledAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    settingsGroup = self->_settingsGroup;
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003514B4;
    v8[3] = &unk_1004FD990;
    void v8[4] = self;
    id v9 = v4;
    dispatch_group_notify((dispatch_group_t)settingsGroup, queue, v8);
  }
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100351278;
  block[3] = &unk_1004FDA80;
  id v11 = v7;
  id v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003510FC;
  block[3] = &unk_1004FDA80;
  void block[4] = self;
  id v11 = v7;
  unint64_t v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 bulletinID]);
  -[ADNotificationManager observer:purgeReferencesToBulletinID:](self, "observer:purgeReferencesToBulletinID:", v6, v7);
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100350F3C;
  block[3] = &unk_1004FDA80;
  id v11 = v7;
  unint64_t v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100350D9C;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ADNotificationManager observer:purgeReferencesToBulletinID:]( self,  "observer:purgeReferencesToBulletinID:",  v6,  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[ADNotificationManager observer:updateSectionInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100350C80;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (BBObserver *)a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[ADNotificationManager observer:noteServerConnectionStateChanged:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  if (!v4 && self->_observer == v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100350C48;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_fetchFromDataSourceIfNecessary
{
  if (!self->_initialFetchSuccess)
  {
    dispatch_group_enter((dispatch_group_t)self->_notificationsGroup);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100350A78;
    v4[3] = &unk_1004FDAA8;
    v4[4] = self;
    [WeakRetained fetchBulletinsOnLockScreenForNotificationManager:self completion:v4];
  }

- (id)_afbulletinForBBBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AFBulletin);
  -[AFBulletin setRead:](v7, "setRead:", 0LL);
  -[AFBulletin setBulletin:forFeed:](v7, "setBulletin:forFeed:", v6, a4);

  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin internalID](v7, "internalID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](bulletinsOnLockScreen, "objectForKey:", v9));

  -[AFBulletin setAvailableOnLockScreen:](v7, "setAvailableOnLockScreen:", [v10 availableOnLockScreen]);
  -[AFBulletin setSupportsSpokenNotification:]( v7,  "setSupportsSpokenNotification:",  [v10 supportsSpokenNotification]);

  return v7;
}

- (void)_getNotificationsFromBulletinBoard
{
  observer = self->_observer;
  if (observer)
  {
    BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      id v6 = "-[ADNotificationManager _getNotificationsFromBulletinBoard]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
      observer = self->_observer;
    }

    -[BBObserver requestNoticesBulletinsForAllSections](observer, "requestNoticesBulletinsForAllSections");
  }

- (void)addDelegate:(id)a3
{
}

- (void)_bulletinsDidChange
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = self->_delegates;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v7),  "notificationManagerDidChangeBulletins:",  self,  (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyDelegatesDidAddBulletin:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_delegates;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "notificationManager:didAddBulletin:") & 1) != 0) {
          objc_msgSend(v10, "notificationManager:didAddBulletin:", self, v4, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)_notifyDelegatesDidRemoveBulletin:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_delegates;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "notificationManager:didRemoveBulletin:") & 1) != 0) {
          objc_msgSend(v10, "notificationManager:didRemoveBulletin:", self, v4, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (id)_displayNameForBulletin:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sectionID]);
  unsigned int v5 = [v4 isEqualToString:@"com.apple.cmas"];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sectionDisplayName]);
    if (![v6 length])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 sectionID]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v7));
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 localizedNameForContext:0]);

      id v6 = (void *)v9;
    }
  }

  return v6;
}

- (void)_getRestrictedAppsFromBulletinBoard
{
  if (self->_observer)
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADNotificationManager _getRestrictedAppsFromBulletinBoard]";
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000LL;
    v25 = sub_1003506B4;
    v26 = sub_1003506C4;
    id v27 = 0LL;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1003506CC;
    v22[3] = &unk_1004FDAD0;
    v22[4] = self;
    v22[5] = &buf;
    id v6 = -[AFSafetyBlock initWithBlock:](objc_alloc(&OBJC_CLASS___AFSafetyBlock), "initWithBlock:", v22);
    id v7 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100350800;
    v20[3] = &unk_1004FD940;
    uint64_t v9 = v6;
    __int128 v21 = v9;
    __int128 v10 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v7,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v20,  5.0);
    __int128 v11 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v10;

    dispatch_group_enter((dispatch_group_t)self->_settingsGroup);
    [*(id *)(*((void *)&buf + 1) + 40) start];
    observer = self->_observer;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10035080C;
    v16[3] = &unk_1004FDAF8;
    v16[4] = self;
    __int128 v13 = v4;
    uint64_t v17 = v13;
    __int128 v14 = v5;
    __int128 v18 = v14;
    __int128 v15 = v9;
    __int128 v19 = v15;
    -[BBObserver getSectionInfoWithCompletion:](observer, "getSectionInfoWithCompletion:", v16);
    self->_batchedUpdatePending = 0;

    _Block_object_dispose(&buf, 8);
  }

- (BOOL)_isAppRestrictedAndSiriRelated:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sectionID]);
  if ([v4 allowsNotifications]
    && [v4 lockScreenSetting] == (id)2
    && [v4 contentPreviewSetting] == (id)1)
  {
    BOOL v6 = 0;
  }

  else
  {
    __int128 v10 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADNotificationManager _siriRelatedRestrictedAppsForApps:]( self,  "_siriRelatedRestrictedAppsForApps:",  v7));
    BOOL v6 = [v8 count] != 0;
  }

  return v6;
}

- (BOOL)hasIncomingCallNotification
{
  return 0;
}

- (ADNotificationManagerDataSource)dataSource
{
  return (ADNotificationManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_1005786A8 != -1) {
    dispatch_once(&qword_1005786A8, &stru_1004FD918);
  }
  return (id)qword_1005786B0;
}

+ (id)_createBBObserverWithQueue:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  id v4 = (void *)qword_1005786B8;
  uint64_t v12 = qword_1005786B8;
  if (!qword_1005786B8)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100351BEC;
    v8[3] = &unk_1004FDB20;
    void v8[4] = &v9;
    sub_100351BEC((uint64_t)v8);
    id v4 = (void *)v10[3];
  }

  unsigned int v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithQueue:v3 calloutQueue:v3];

  return v6;
}

@end