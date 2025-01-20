@interface GKBulletinController
+ (id)bulletinQueue;
+ (id)sharedController;
+ (void)startBulletinController;
- (GKAcceptedInviteManager)acceptedInviteManager;
- (GKBulletinController)init;
- (NSMutableDictionary)bulletins;
- (NSSet)notificationCategories;
- (NSString)defaultSoundPath;
- (PBSBulletinService)bulletinService;
- (id)bulletinFromGKBulletin:(id)a3;
- (id)bulletinStorageFilePathForEnvironment:(int64_t)a3;
- (id)callAction:(id)a3 forBulletinDictionary:(id)a4;
- (id)getBulletinsOfType:(Class)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)clearChallengeBulletinsForChallengeID:(id)a3;
- (void)clearSavedBulletins;
- (void)clearTurnBasedBulletinsForMatchID:(id)a3;
- (void)dealloc;
- (void)expireBulletin:(id)a3;
- (void)loadBulletins;
- (void)presentBulletin:(id)a3;
- (void)removeAllBulletins;
- (void)setAcceptedInviteManager:(id)a3;
- (void)setBulletinService:(id)a3;
- (void)setBulletins:(id)a3;
- (void)setDefaultSoundPath:(id)a3;
- (void)setNotificationCategories:(id)a3;
- (void)updateSavedBulletins;
- (void)withdrawBulletin:(id)a3;
@end

@implementation GKBulletinController

- (id)getBulletinsOfType:(Class)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common getBulletinsOfType:",  buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletins](self, "bulletins", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletins](self, "bulletins"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

        if ((objc_opt_isKindOfClass(v15, a3) & 1) != 0) {
          [v7 setObject:v15 forKey:v13];
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v10);
  }

  return v7;
}

+ (id)bulletinQueue
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1);
  }
  v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController+Common bulletinQueue", v5, 2u);
  }

  if (qword_1002BB778 != -1) {
    dispatch_once(&qword_1002BB778, &stru_100273560);
  }
  return (id)qword_1002BB780;
}

- (id)bulletinStorageFilePathForEnvironment:(int64_t)a3
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  BOOL v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common bulletinStorageFilePathForEnvironment:",  v11,  2u);
  }

  uint64_t v7 = GKSupportDataRoot(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"Bulletins.bulletins"]);

  return v9;
}

- (void)clearSavedBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common clearSavedBulletins",  buf,  2u);
  }

  id v5 = [(id)objc_opt_class(self) bulletinQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124B10;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)updateSavedBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common updateSavedBulletins",  buf,  2u);
  }

  id v5 = [(id)objc_opt_class(self) bulletinQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124E44;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)loadBulletins
{
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers(self);
  }
  id v5 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common loadBulletins",  buf,  2u);
  }

  id v6 = [(id)objc_opt_class(self) bulletinQueue];
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100125178;
  v8[3] = &unk_100270E78;
  v8[4] = self;
  v8[5] = a2;
  dispatch_sync(v7, v8);
}

- (void)clearTurnBasedBulletinsForMatchID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common clearTurnBasedBulletinsForMatchID:",  buf,  2u);
  }

  id v8 = -[GKBulletinController getBulletinsOfType:]( self,  "getBulletinsOfType:",  objc_opt_class(&OBJC_CLASS___GKTurnBasedMultiplayerBulletin));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100125AFC;
  v11[3] = &unk_100273588;
  id v12 = v5;
  uint64_t v13 = self;
  id v10 = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)clearChallengeBulletinsForChallengeID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKBulletinController+Common clearChallengeBulletinsForChallengeID:",  buf,  2u);
  }

  id v8 = -[GKBulletinController getBulletinsOfType:]( self,  "getBulletinsOfType:",  objc_opt_class(&OBJC_CLASS___GKChallengeBulletin));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100125C68;
  v11[3] = &unk_1002735B0;
  id v12 = v5;
  uint64_t v13 = self;
  id v10 = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

+ (void)startBulletinController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(a1);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  BOOL v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKBulletinController startBulletinController",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  uint64_t v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting up the bulletin controller", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](&OBJC_CLASS___GKDevice, "currentDevice"));
  unsigned int v9 = [v8 isFocusDevice];

  if (v9)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100126084;
    block[3] = &unk_100271FA0;
    block[4] = a1;
    dispatch_async(v11, block);
  }

  else
  {
    id v12 = [a1 sharedController];
  }

+ (id)sharedController
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1);
  }
  id v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController sharedController", v5, 2u);
  }

  if (qword_1002BB790 != -1) {
    dispatch_once(&qword_1002BB790, &stru_1002735E8);
  }
  return (id)qword_1002BB788;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKBulletinController;
  -[GKBulletinController dealloc](&v3, "dealloc");
}

- (GKBulletinController)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GKBulletinController;
  objc_super v3 = -[GKBulletinController init](&v19, "init");
  if (v3)
  {
    uint64_t v4 = GKGameCenterUIFrameworkBundle();
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathForResource:@"GKInvite" ofType:@"caf"]);

    if (!v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v16 handleFailureInMethod:a2, v3, @"GKBulletinController.m", 138, @"Invalid parameter not satisfying: %@", @"soundPath" object file lineNumber description];
    }

    -[GKBulletinController setDefaultSoundPath:](v3, "setDefaultSoundPath:", v6);
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___GKAcceptedInviteManager);
    objc_storeStrong((id *)&v3->_acceptedInviteManager, v7);
    id v8 = [(id)objc_opt_class(v3) bulletinQueue];
    unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001263CC;
    block[3] = &unk_10026B670;
    id v10 = v3;
    __int128 v18 = v10;
    dispatch_sync(v9, block);

    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v11);
    }
    uint64_t v13 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      bulletinService = v10->_bulletinService;
      *(_DWORD *)buf = 138412290;
      v21 = bulletinService;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PineBoardBulletinService: %@", buf, 0xCu);
    }
  }

  return v3;
}

- (PBSBulletinService)bulletinService
{
  id v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (PBSBulletinService *)objc_claimAutoreleasedReturnValue(+[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance"));
  bulletinService = v2->_bulletinService;
  if (bulletinService != v3)
  {
    -[PBSBulletinService setDelegate:](bulletinService, "setDelegate:", 0LL);
    objc_storeStrong((id *)&v2->_bulletinService, v3);
    id v5 = -[PBSBulletinService setDelegate:](v2->_bulletinService, "setDelegate:", v2);
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers(v5);
    }
    uint64_t v7 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v8 = v2->_bulletinService;
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "PineBoardServicesBulletinService: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)bulletinFromGKBulletin:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKBulletinController bulletinFromGKBulletin:",  buf,  2u);
  }

  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2050000000LL;
  uint64_t v7 = (void *)qword_1002BB798;
  uint64_t v33 = qword_1002BB798;
  if (!qword_1002BB798)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    uint64_t v27 = (uint64_t)sub_100127F00;
    v28 = &unk_100273640;
    v29 = &v30;
    sub_100127F00((uint64_t)buf);
    uint64_t v7 = (void *)v31[3];
  }

  id v8 = v7;
  _Block_object_dispose(&v30, 8);
  id v9 = objc_alloc_init(v8);
  int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, @"recordID");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  PBSSystemBulletinTitleKey);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  PBSSystemBulletinMessageKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"gamecenter.fill",  PBSSystemBulletinSymbolNameKey);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___GKRealTimeMultiplayerCancelBulletin);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &off_1002880D8,  PBSSystemBulletinActivationActionKey);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[GCFLocalizedStrings GAME_INVITE_NOTIFICATION_FOOTER_TV_ACTION]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "GAME_INVITE_NOTIFICATION_FOOTER_TV_ACTION"));
    *(void *)buf = 0LL;
    uint64_t v26 = (uint64_t)buf;
    uint64_t v27 = 0x2020000000LL;
    v16 = (void *)qword_1002BB7A8;
    v28 = (void *)qword_1002BB7A8;
    if (!qword_1002BB7A8)
    {
      __int128 v17 = (void *)sub_100127F54();
      v16 = dlsym(v17, "PBSSystemBulletinTextImageIDTVButton");
      *(void *)(v26 + 24) = v16;
      qword_1002BB7A8 = (uint64_t)v16;
    }

    _Block_object_dispose(buf, 8);
    if (!v16) {
      sub_1001280E4();
    }
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, *v16));

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v18,  PBSSystemBulletinFooterMessageKey);
  }

  id v19 = -[NSMutableDictionary copy](v10, "copy");
  [v9 setMessage:v19];

  *(void *)buf = 0LL;
  uint64_t v26 = (uint64_t)buf;
  uint64_t v27 = 0x2020000000LL;
  __int128 v20 = (void *)qword_1002BB7B0;
  v28 = (void *)qword_1002BB7B0;
  if (!qword_1002BB7B0)
  {
    v21 = (void *)sub_100127F54();
    __int128 v20 = dlsym(v21, "PBSSystemBulletinServiceName");
    *(void *)(v26 + 24) = v20;
    qword_1002BB7B0 = (uint64_t)v20;
  }

  _Block_object_dispose(buf, 8);
  if (!v20) {
    sub_100128004();
  }
  [v9 setServiceIdentifier:*v20];
  *(void *)buf = 0LL;
  uint64_t v26 = (uint64_t)buf;
  uint64_t v27 = 0x2020000000LL;
  v22 = (void *)qword_1002BB7B8;
  v28 = (void *)qword_1002BB7B8;
  if (!qword_1002BB7B8)
  {
    v23 = (void *)sub_100127F54();
    v22 = dlsym(v23, "PBSSystemBulletinViewControllerClassName");
    *(void *)(v26 + 24) = v22;
    qword_1002BB7B8 = (uint64_t)v22;
  }

  _Block_object_dispose(buf, 8);
  if (!v22) {
    sub_100128074();
  }
  [v9 setViewControllerClassName:*v22];

  return v9;
}

- (void)presentBulletin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController presentBulletin:", buf, 2u);
  }

  id v8 = [(id)objc_opt_class(self) bulletinQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100126BC0;
  block[3] = &unk_10026BDB0;
  void block[4] = self;
  id v10 = v5;
  id v25 = v10;
  dispatch_sync(v9, block);

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinFromGKBulletin:](self, "bulletinFromGKBulletin:", v10));
  id v12 = (void *)v11;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v11);
  }
  uint64_t v14 = (void *)os_log_GKDaemon;
  BOOL v15 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v15)
  {
    v16 = v14;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
    *(_DWORD *)buf = 138412546;
    id v27 = v10;
    __int16 v28 = 2112;
    v29 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "GKBulletinController: presenting Bulletin:%@ dictionary:%@",  buf,  0x16u);
  }

  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v15);
  }
  id v19 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "pbsBulletin service proxy = %@", buf, 0xCu);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinService](self, "bulletinService"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100126C20;
  v22[3] = &unk_100270B40;
  v22[4] = self;
  id v23 = v12;
  id v21 = v12;
  [v20 presentBulletin:v21 withCompletion:v22];
}

- (void)withdrawBulletin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController withdrawBulletin:", buf, 2u);
  }

  id v8 = [(id)objc_opt_class(self) bulletinQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  BOOL v15 = sub_100126E74;
  v16 = &unk_10026BDB0;
  __int128 v17 = self;
  id v18 = v5;
  id v10 = v5;
  dispatch_sync(v9, &v13);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinService](self, "bulletinService", v13, v14, v15, v16, v17));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinFromGKBulletin:](self, "bulletinFromGKBulletin:", v10));
  [v11 dismissBulletin:v12];
}

- (void)expireBulletin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinController expireBulletin:", buf, 2u);
  }

  id v8 = [(id)objc_opt_class(self) bulletinQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  BOOL v15 = sub_100127000;
  v16 = &unk_10026BDB0;
  __int128 v17 = self;
  id v18 = v5;
  id v10 = v5;
  dispatch_sync(v9, &v13);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinService](self, "bulletinService", v13, v14, v15, v16, v17));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinController bulletinFromGKBulletin:](self, "bulletinFromGKBulletin:", v10));
  [v11 dismissBulletin:v12];
}

- (void)removeAllBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController removeAllBulletins", buf, 2u);
  }

  *(void *)buf = 0LL;
  __int128 v17 = buf;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_10012726C;
  __int128 v20 = sub_10012727C;
  id v21 = 0LL;
  id v5 = [(id)objc_opt_class(self) bulletinQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100127284;
  block[3] = &unk_10026E058;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(v6, block);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v7 = *((id *)v17 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[GKBulletinController withdrawBulletin:]( self,  "withdrawBulletin:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(buf, 8);
}

- (id)callAction:(id)a3 forBulletinDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKBulletinController callAction: forBulletinDictionary:",  buf,  2u);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"recordID"]);
  __int128 v12 = (void *)v11;
  *(void *)buf = 0LL;
  id v27 = buf;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_10012726C;
  uint64_t v30 = sub_10012727C;
  id v31 = 0LL;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v11);
  }
  __int128 v14 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v32 = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    v35 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Called Action: %@ Bulletin on ATV: %@",  v32,  0x16u);
  }

  id v15 = [(id)objc_opt_class(self) bulletinQueue];
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001275B4;
  block[3] = &unk_1002702B8;
  void block[4] = self;
  id v17 = v12;
  id v24 = v17;
  id v25 = buf;
  dispatch_sync(v16, block);

  uint64_t v18 = (void *)*((void *)v27 + 5);
  if (v18)
  {
    [v18 handleAction:v6];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers(0LL);
    }
    __int128 v20 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v32 = 138412290;
      id v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "no bulletin for ID: %@", v32, 0xCu);
    }
  }

  id v21 = *((id *)v27 + 5);

  _Block_object_dispose(buf, 8);
  return v21;
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  __int128 v12 = (os_log_s *)os_log_GKTrace;
  BOOL v13 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKBulletinController bulletinService: didDismissBulletin: withReason:",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v13);
  }
  id v15 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Interacted with Bulletin on ATV: %@ With Code: %lu",  buf,  0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
  if (a5 == 1)
  {
    id v17 =  -[GKBulletinController callAction:forBulletinDictionary:]( self,  "callAction:forBulletinDictionary:",  @"GKAccepted",  v16);
  }

  else if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v18 = a5 == 2;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKBulletinController.m",  323LL,  "-[GKBulletinController bulletinService:didDismissBulletin:withReason:]"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v19));

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForKey:@"recordID"]);
    v22 = v21;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    char v31 = 1;
    if (v21) {
      BOOL v23 = v18;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23)
    {
      char v31 = 0;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100127964;
      v27[3] = &unk_10026B800;
      v27[4] = self;
      id v28 = v21;
      v29 = buf;
      [v20 perform:v27];
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100127D50;
    v24[3] = &unk_10026D8E0;
    uint64_t v26 = buf;
    v24[4] = self;
    id v25 = v16;
    [v20 notifyOnMainQueueWithBlock:v24];

    _Block_object_dispose(buf, 8);
  }
}

- (NSMutableDictionary)bulletins
{
  return self->_bulletins;
}

- (void)setBulletins:(id)a3
{
}

- (GKAcceptedInviteManager)acceptedInviteManager
{
  return (GKAcceptedInviteManager *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAcceptedInviteManager:(id)a3
{
}

- (NSSet)notificationCategories
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setNotificationCategories:(id)a3
{
}

- (NSString)defaultSoundPath
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDefaultSoundPath:(id)a3
{
}

- (void)setBulletinService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end