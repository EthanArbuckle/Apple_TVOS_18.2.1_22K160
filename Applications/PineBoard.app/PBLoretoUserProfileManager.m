@interface PBLoretoUserProfileManager
+ (id)_makeProfileBulletinControllerWithCallinQueue:(id)a3 profileStoreSnapshotProvider:(id)a4 presentationElementFocusCoordinator:(id)a5 powerManager:(id)a6;
+ (unint64_t)_maxNumberOfGuestUsers;
+ (unint64_t)_maxNumberOfUsers;
- (BOOL)_queue_canAddNewUserWithType:(int64_t)a3;
- (BOOL)_queue_isMigratingProfiles;
- (BOOL)canAddNewUserWithType:(id)a3;
- (BOOL)hasActiveUserBulletin;
- (BOOL)hasMultipleUsers;
- (BOOL)updateWithAddProfileRequests:(id)a3 updateProfileRequests:(id)a4 removeProfileRequests:(id)a5 error:(id *)a6;
- (BOOL)updateWithUpdateProfileRequest:(id)a3 error:(id *)a4;
- (NSString)selectedUserProfileIdentifier;
- (PBLoretoUserProfileManager)initWithUserProfileApplicationManager:(id)a3 presentationElementFocusCoordinator:(id)a4 powerManager:(id)a5;
- (PBSGroupRecommendationsSession)groupRecommendationsSession;
- (PBSUserProfilesSnapshot)currentUserProfilesSnapshot;
- (PBSUserProfilesSnapshot)userProfilesSnapshot;
- (PBUserProfileManagerServiceConfiguration)serviceConfiguration;
- (UPProfileStoreSnapshot)snapshot;
- (id)_currentProfileStoreSnapshot;
- (id)_queue_addProfileWithRequest:(id)a3 error:(id *)a4;
- (id)_queue_makeProfileStoreSnapshotControllerWithQueue:(id)a3;
- (id)_queue_removeProfileWithRequest:(id)a3 error:(id *)a4;
- (id)_queue_updateProfileStoreWithAddProfileRequests:(id)a3 updateProfileRequests:(id)a4 removeProfileRequests:(id)a5 error:(id *)a6;
- (id)_queue_updateProfileWithRequest:(id)a3 error:(id *)a4;
- (id)profileStoreSnapshotForProfilesStateDumpController:(id)a3;
- (id)welcomeBulletinProfilePictureDataForUserProfile:(id)a3;
- (void)_notifyObserverUserSwitchedToUserIdentifier:(id)a3 previousUserIdentifier:(id)a4;
- (void)_notifyObserversDidUpdate;
- (void)_performAsyncBlock:(id)a3;
- (void)_queue_beginIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)_queue_endIgnoringProfileAccountNotificationsWithReason:(id)a3;
- (void)_queue_handleProfileStoreSnapshotUpdate:(id)a3;
- (void)_queue_handleProfilesMigrationCompletion;
- (void)_queue_initializeProfilesStorage;
- (void)_queue_notifyObserversDidUpdateRecommendationGroupSession;
- (void)_queue_presentWelcomeBackBulletinWithActiveProfile:(id)a3 previousActiveProfile:(id)a4;
- (void)_updateCurrentProfileProfileStoreSnapshot:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginIgnoringUserProfileAccountNotifications;
- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4;
- (void)endIgnoringUserProfileAccountNotifications;
- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3;
- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3;
- (void)handleUserProfileAccountNotification:(id)a3;
- (void)performUpdatesUsingBlock:(id)a3 completion:(id)a4;
- (void)profileAccountsController:(id)a3 quitApplicationsRunningWithPersonaUniqueString:(id)a4 completion:(id)a5;
- (void)removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendDailyAnalyticsEvents;
- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5;
@end

@implementation PBLoretoUserProfileManager

- (PBLoretoUserProfileManager)initWithUserProfileApplicationManager:(id)a3 presentationElementFocusCoordinator:(id)a4 powerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  Class v13 = NSClassFromString(@"PBUserProfileApplicationManager");
  if (!v12)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026ED08();
    }
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A324LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBUserProfileApplicationManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026F08C();
    }
    _bs_set_crash_log_message([v52 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A388LL);
  }

  id v14 = v10;
  Class v15 = NSClassFromString(@"PBPresentationElementFocusCoordinator");
  if (!v14)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026EDBC();
    }
    _bs_set_crash_log_message([v53 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A3ECLL);
  }

  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBPresentationElementFocusCoordinatorClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026EFD8();
    }
    _bs_set_crash_log_message([v54 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A450LL);
  }

  id v16 = v11;
  Class v17 = NSClassFromString(@"PBPowerManager");
  if (!v16)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026EE70();
    }
    _bs_set_crash_log_message([v55 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A4B4LL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBPowerManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026EF24();
    }
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x10000A518LL);
  }

  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManager;
  v18 = -[PBLoretoUserProfileManager init](&v61, "init");
  v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[UPProfileStoreSnapshot emptySnapshot](&OBJC_CLASS___UPProfileStoreSnapshot, "emptySnapshot"));
    lock_snapshot = v19->_lock_snapshot;
    v19->_lock_snapshot = (UPProfileStoreSnapshot *)v20;

    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLoretoUserProfileManager.queue");
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)Serial;

    v24 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v19->_observers;
    v19->_observers = v24;

    uint64_t v26 = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLoretoUserProfileManager.calloutQueue");
    calloutQueue = v19->_calloutQueue;
    v19->_calloutQueue = (OS_dispatch_queue *)v26;

    v28 = -[PBUserProfileManagerServiceConfiguration initWithService:queue:]( objc_alloc(&OBJC_CLASS___PBUserProfileManagerServiceConfiguration),  "initWithService:queue:",  v19,  v19->_queue);
    serviceConfiguration = v19->_serviceConfiguration;
    v19->_serviceConfiguration = v28;

    v30 = -[PBProfilesAnalyticsController initWithPowerManager:]( objc_alloc(&OBJC_CLASS___PBProfilesAnalyticsController),  "initWithPowerManager:",  v16);
    analyticsController = v19->_analyticsController;
    v19->_analyticsController = v30;

    v32 = -[PBProfilesStateDumpController initWithDelegate:]( objc_alloc(&OBJC_CLASS___PBProfilesStateDumpController),  "initWithDelegate:",  v19);
    stateDumpController = v19->_stateDumpController;
    v19->_stateDumpController = v32;

    objc_storeStrong((id *)&v19->_queue_userProfileApplicationManager, a3);
    v34 = -[PBProfileAccountsController initWithProfileStoreSnapshotProvider:delegate:]( objc_alloc(&OBJC_CLASS___PBProfileAccountsController),  "initWithProfileStoreSnapshotProvider:delegate:",  v19,  v19);
    queue_accountsController = v19->_queue_accountsController;
    v19->_queue_accountsController = v34;

    v36 = -[PBProfileRecommendationGroupsController initWithProfileStoreSnapshotProvider:]( objc_alloc(&OBJC_CLASS___PBProfileRecommendationGroupsController),  "initWithProfileStoreSnapshotProvider:",  v19);
    queue_recommendationGroupsController = v19->_queue_recommendationGroupsController;
    v19->_queue_recommendationGroupsController = v36;

    id v38 = [(id)objc_opt_class(v19) _makeProfileBulletinControllerWithCallinQueue:v19->_queue profileStoreSnapshotProvider:v19 presentationElementFocusCoordinat or:v14 powerManager:v16];
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    queue_profileBulletinController = v19->_queue_profileBulletinController;
    v19->_queue_profileBulletinController = (PBProfileBulletinController *)v39;

    unsigned int v41 = +[PBProfileAccountsMigrator isMigrationRequired]( &OBJC_CLASS___PBProfileAccountsMigrator,  "isMigrationRequired");
    id v42 = sub_100084680();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v41)
    {
      if (v44)
      {
        *(_DWORD *)buf = 136315138;
        v63 = "-[PBLoretoUserProfileManager initWithUserProfileApplicationManager:presentationElementFocusCoordinator:powerManager:]";
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s: Account profile migration *is* required.",  buf,  0xCu);
      }

      v45 = objc_alloc_init(&OBJC_CLASS___PBProfileAccountsMigrator);
      queue_profileAccountsMigrator = v19->_queue_profileAccountsMigrator;
      v19->_queue_profileAccountsMigrator = v45;

      objc_initWeak((id *)buf, v19);
      v47 = v19->_queue_profileAccountsMigrator;
      v48 = v19->_queue;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_10000A548;
      v59[3] = &unk_1003D01C0;
      objc_copyWeak(&v60, (id *)buf);
      -[PBProfileAccountsMigrator performMigrationWithCompletionQueue:completion:]( v47,  "performMigrationWithCompletionQueue:completion:",  v48,  v59);
      -[PBUserProfileManagerServiceConfiguration setMigratingProfiles:]( v19->_serviceConfiguration,  "setMigratingProfiles:",  1LL);
      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (v44)
      {
        *(_DWORD *)buf = 136315138;
        v63 = "-[PBLoretoUserProfileManager initWithUserProfileApplicationManager:presentationElementFocusCoordinator:powerManager:]";
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s: Account profile migration is *not* required.",  buf,  0xCu);
      }

      v49 = (dispatch_queue_s *)v19->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000A588;
      block[3] = &unk_1003CFF08;
      v58 = v19;
      dispatch_sync(v49, block);
    }
  }

  return v19;
}

- (void)dealloc
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A61C;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManager;
  -[PBLoretoUserProfileManager dealloc](&v4, "dealloc");
}

- (PBUserProfileManagerServiceConfiguration)serviceConfiguration
{
  return self->_serviceConfiguration;
}

- (PBSUserProfilesSnapshot)currentUserProfilesSnapshot
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManager _currentProfileStoreSnapshot](self, "_currentProfileStoreSnapshot"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_userProfilesSnapshot"));

  return (PBSUserProfilesSnapshot *)v4;
}

- (BOOL)hasMultipleUsers
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot profiles](self->_lock_snapshot, "profiles"));
  id v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return (unint64_t)v5 > 1;
}

- (NSString)selectedUserProfileIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot activeProfile](self->_lock_snapshot, "activeProfile"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pb_identifier"));

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", v4);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026F140();
    }
    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    -[TVSObserverSet removeObserver:](self->_observers, "removeObserver:", v4);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026F1E8();
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A978;
  v6[3] = &unk_1003D01E8;
  id v7 = v4;
  id v5 = v4;
  -[PBLoretoUserProfileManager _performAsyncBlock:](self, "_performAsyncBlock:", v6);
}

- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000AA18;
  v6[3] = &unk_1003D01E8;
  id v7 = v4;
  id v5 = v4;
  -[PBLoretoUserProfileManager _performAsyncBlock:](self, "_performAsyncBlock:", v6);
}

- (void)removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000AAB8;
  v6[3] = &unk_1003D01E8;
  id v7 = v4;
  id v5 = v4;
  -[PBLoretoUserProfileManager _performAsyncBlock:](self, "_performAsyncBlock:", v6);
}

- (void)sendDailyAnalyticsEvents
{
  v3 = (void *)objc_opt_class(self->_analyticsController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManager _currentProfileStoreSnapshot](self, "_currentProfileStoreSnapshot"));
  [v3 sendDailyAnalyticsEventsWithProfileStoreSnapshot:v4];
}

- (BOOL)hasActiveUserBulletin
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)v2->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000ABC0;
  v5[3] = &unk_1003D0210;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)welcomeBulletinProfilePictureDataForUserProfile:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v12 = 0LL;
  Class v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  Class v15 = sub_10000ACE0;
  id v16 = sub_10000ACF0;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AD08;
  block[3] = &unk_1003D0238;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)performUpdatesUsingBlock:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, PBLoretoUserProfileManagerUpdater *))a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000B020;
    v24[3] = &unk_1003D0048;
    id v8 = v7;
    id v25 = v8;
    char v9 = objc_retainBlock(v24);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManager _currentProfileStoreSnapshot](self, "_currentProfileStoreSnapshot"));
    id v11 = -[PBLoretoUserProfileManagerUpdater initWithProfileStoreSnapshot:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerUpdater),  "initWithProfileStoreSnapshot:",  v10);
    v6[2](v6, v11);
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_10000ACE0;
    v22 = sub_10000ACF0;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerUpdater errors](v11, "errors"));
    id v23 = (id)objc_claimAutoreleasedReturnValue([v12 firstObject]);

    if (v19[5])
    {
      ((void (*)(void *, void))v9[2])(v9, 0LL);
    }

    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10000B0E0;
      v14[3] = &unk_1003D0260;
      Class v15 = v11;
      id v17 = &v18;
      id v16 = v9;
      -[PBLoretoUserProfileManager _performAsyncBlock:](self, "_performAsyncBlock:", v14);
    }

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    Class v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026F32C();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

- (UPProfileStoreSnapshot)snapshot
{
  return (UPProfileStoreSnapshot *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _currentProfileStoreSnapshot]( self,  "_currentProfileStoreSnapshot"));
}

- (BOOL)updateWithAddProfileRequests:(id)a3 updateProfileRequests:(id)a4 removeProfileRequests:(id)a5 error:(id *)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:]( self,  "_queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:",  v13,  v12,  v11,  a6));

  return v14 != 0LL;
}

- (BOOL)updateWithUpdateProfileRequest:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  LOBYTE(a4) = -[PBLoretoUserProfileManager updateWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:]( self,  "updateWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:",  0LL,  v7,  0LL,  a4,  v9);
  return (char)a4;
}

- (id)profileStoreSnapshotForProfilesStateDumpController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _currentProfileStoreSnapshot]( self,  "_currentProfileStoreSnapshot"));
}

- (void)profileAccountsController:(id)a3 quitApplicationsRunningWithPersonaUniqueString:(id)a4 completion:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  id v8 = a5;
  id v9 = a4;
  dispatch_assert_queue_V2(queue);
  -[PBUserProfileApplicationManager quitApplicationsRunningWithPersonaUniqueString:completionHandler:]( self->_queue_userProfileApplicationManager,  "quitApplicationsRunningWithPersonaUniqueString:completionHandler:",  v9,  v8);
}

- (PBSUserProfilesSnapshot)userProfilesSnapshot
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotController snapshot](self->_queue_profileStoreSnapshotController, "snapshot"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pb_userProfilesSnapshot"));

  return (PBSUserProfilesSnapshot *)v4;
}

- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManager userProfilesSnapshot](self, "userProfilesSnapshot"));
    v4[2](v4, v5, 0LL);
  }
}

- (PBSGroupRecommendationsSession)groupRecommendationsSession
{
  return self->_queue_recommendationGroupSession;
}

- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, PBSGroupRecommendationsSession *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4) {
    v4[2](v4, self->_queue_recommendationGroupSession, 0LL);
  }
}

- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10000B86C;
  v39[3] = &unk_1003D0048;
  id v8 = v7;
  id v40 = v8;
  id v9 = objc_retainBlock(v39);
  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotController snapshot]( self->_queue_profileStoreSnapshotController,  "snapshot"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeProfile]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pb_identifier"));

    if (BSEqualStrings(v6, v12))
    {
      ((void (*)(void *, uint64_t, void))v9[2])(v9, 1LL, 0LL);
      -[PBProfileBulletinController presentWelcomeBackBulletinWithReason:]( self->_queue_profileBulletinController,  "presentWelcomeBackBulletinWithReason:",  2LL);
LABEL_17:

      goto LABEL_18;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UPProfilePredicate predicateForSystemAppUserIdentifier:]( &OBJC_CLASS___UPProfilePredicate,  "predicateForSystemAppUserIdentifier:",  v6));
    if (!v14)
    {
      uint64_t v30 = PBSUserProfileServiceErrorForCodeWithDebugDescription( 200LL,  @"Profile identifier string must be a UUID");
      Class v15 = (UPUpdateProfileRequest *)objc_claimAutoreleasedReturnValue(v30);
      ((void (*)(void *, void, UPUpdateProfileRequest *))v9[2])(v9, 0LL, v15);
LABEL_16:

      goto LABEL_17;
    }

    Class v15 = -[UPUpdateProfileRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___UPUpdateProfileRequest),  "initWithPredicate:",  v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updateIsActiveRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updateIsActiveRequest:",  1LL));
    unsigned int v41 = v36;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
    -[UPUpdateProfileRequest setUpdateMetadataRequests:](v15, "setUpdateMetadataRequests:", v16);

    id v38 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileWithRequest:error:]( self,  "_queue_updateProfileWithRequest:error:",  v15,  &v38));
    id v37 = v38;
    if (v17)
    {
      v32 = v15;
      v33 = v14;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentSnapshot]);
      v19 = v17;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v18 activeProfile]);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pb_identifier"));
      unsigned int v21 = [v20 isEqual:v6];

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v19 previousSnapshot]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activeProfile]);

        v35 = v17;
        -[PBLoretoUserProfileManager _queue_presentWelcomeBackBulletinWithActiveProfile:previousActiveProfile:]( self,  "_queue_presentWelcomeBackBulletinWithActiveProfile:previousActiveProfile:",  v17,  v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 remoteProcess]);

        analyticsController = self->_analyticsController;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
        -[PBProfilesAnalyticsController sendSwitchProfileEventWithClientBundleIdentifier:]( analyticsController,  "sendSwitchProfileEventWithClientBundleIdentifier:",  v27);

        uint64_t v28 = 1LL;
        v29 = v19;
        Class v15 = v32;
        uint64_t v14 = v33;
LABEL_15:

        ((void (*)(void *, uint64_t, id))v9[2])(v9, v28, v37);
        goto LABEL_16;
      }

      v34 = v19;
      Class v15 = v32;
      uint64_t v14 = v33;
    }

    else
    {
      v34 = 0LL;
    }

    v35 = v17;
    id v31 = sub_100084680();
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      sub_10026F3D8();
    }
    uint64_t v28 = 0LL;
    v29 = v34;
    goto LABEL_15;
  }

  uint64_t v13 = PBSUserProfileServiceErrorForCode(200LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
  ((void (*)(void *, void, void *))v9[2])(v9, 0LL, v10);
LABEL_18:
}

- (BOOL)canAddNewUserWithType:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [v5 integerValue];

  return -[PBLoretoUserProfileManager _queue_canAddNewUserWithType:](self, "_queue_canAddNewUserWithType:", v6);
}

- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = sub_100084680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[PBLoretoUserProfileManager createUserProfileWithAttributes:completionHandler:]";
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Creating user profile. {attributes=%@}",  buf,  0x16u);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000BD30;
  v32[3] = &unk_1003D0288;
  id v10 = v7;
  id v33 = v10;
  id v11 = objc_retainBlock(v32);
  if (-[PBLoretoUserProfileManager _queue_canAddNewUserWithType:]( self,  "_queue_canAddNewUserWithType:",  [v6 type]))
  {
    id v31 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UPAddProfileRequest pb_addProfileRequestWithCreateUserProfileAttributes:error:]( &OBJC_CLASS___UPAddProfileRequest,  "pb_addProfileRequestWithCreateUserProfileAttributes:error:",  v6,  &v31));
    id v13 = v31;
    if (v12)
    {
      id v30 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_addProfileWithRequest:error:]( self,  "_queue_addProfileWithRequest:error:",  v12,  &v30));
      id v15 = v30;

      if (v14)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 currentSnapshot]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 profileForIdentity:v17]);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pb_userProfile"));
        id v20 = sub_100084680();
        unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        v22 = v21;
        if (v19)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[PBLoretoUserProfileManager createUserProfileWithAttributes:completionHandler:]";
            __int16 v36 = 2112;
            id v37 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Created user profile. {userProfile=%@}",  buf,  0x16u);
          }

          if (v15)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10026F588();
            }
            _bs_set_crash_log_message([v23 UTF8String]);
            __break(0);
            JUMPOUT(0x10000BBBCLL);
          }
        }

        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10026F51C();
          }
        }
      }

      else
      {
        id v29 = sub_100084680();
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
          sub_10026F4B0();
        }
        v19 = 0LL;
      }

      ((void (*)(void *, void *, id))v11[2])(v11, v19, v15);
    }

    else
    {
      id v27 = sub_100084680();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10026F444();
      }

      ((void (*)(void *, void, id))v11[2])(v11, 0LL, v13);
      id v15 = v13;
    }
  }

  else
  {
    id v24 = sub_100084680();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10026F630(v6, v25);
    }

    uint64_t v26 = PBSUserProfileServiceErrorForCode(104LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v26);
    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v15);
  }
}

- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000C16C;
  v30[3] = &unk_1003D0288;
  id v11 = v10;
  id v31 = v11;
  id v12 = objc_retainBlock(v30);
  id v13 = sub_100084680();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v33 = "-[PBLoretoUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]";
    __int16 v34 = 2114;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Updating user profile. {identifier=%{public}@, attributes=%@}",  buf,  0x20u);
  }

  id v29 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest pb_updateProfileRequestWithUserProfileIdentifier:attributes:error:]( &OBJC_CLASS___UPUpdateProfileRequest,  "pb_updateProfileRequestWithUserProfileIdentifier:attributes:error:",  v8,  v9,  &v29));
  id v16 = v29;
  if (v15)
  {
    id v28 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileWithRequest:error:]( self,  "_queue_updateProfileWithRequest:error:",  v15,  &v28));
    id v18 = v28;

    id v27 = v11;
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 currentSnapshot]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 profileForSystemAppUserIdentifier:v8]);

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pb_userProfile"));
      id v22 = sub_100084680();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v33 = "-[PBLoretoUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]";
          __int16 v34 = 2114;
          id v35 = v8;
          __int16 v36 = 2112;
          id v37 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Updated user profile. {identifier=%{public}@, userProfile=%@}",  buf,  0x20u);
        }

        if (v18)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10026F6D4();
          }
          _bs_set_crash_log_message([v25 UTF8String]);
          __break(0);
          JUMPOUT(0x10000BFDCLL);
        }
      }

      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          id v33 = "-[PBLoretoUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]";
          __int16 v34 = 2114;
          id v35 = v8;
          __int16 v36 = 2112;
          id v37 = v9;
          __int16 v38 = 2112;
          id v39 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to find updated user profile. {identifier=%{public}@, attributes=%@, error=%@}",  buf,  0x2Au);
        }
      }
    }

    else
    {
      id v26 = sub_100084680();
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v33 = "-[PBLoretoUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]";
        __int16 v34 = 2114;
        id v35 = v8;
        __int16 v36 = 2112;
        id v37 = v9;
        __int16 v38 = 2112;
        id v39 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to update user profile. {identifier=%{public}@, attributes=%@, error=%@}",  buf,  0x2Au);
      }

      unsigned int v21 = 0LL;
    }

    ((void (*)(void *, void *, id))v12[2])(v12, v21, v18);
    id v11 = v27;
  }

  else
  {
    ((void (*)(void *, void, id))v12[2])(v12, 0LL, v16);
    id v18 = v16;
  }
}

- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000C4E4;
  v26[3] = &unk_1003D0048;
  id v8 = v7;
  id v27 = v8;
  id v9 = objc_retainBlock(v26);
  id v10 = sub_100084680();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v29 = "-[PBLoretoUserProfileManager removeUserProfileWithIdentifier:completionHandler:]";
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Removing user profile. {identifier=%{public}@}",  buf,  0x16u);
  }

  id v25 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UPRemoveProfileRequest pb_removeProfileRequestWithIdentifier:error:]( &OBJC_CLASS___UPRemoveProfileRequest,  "pb_removeProfileRequestWithIdentifier:error:",  v6,  &v25));
  id v13 = v25;
  if (v12)
  {
    id v24 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_removeProfileWithRequest:error:]( self,  "_queue_removeProfileWithRequest:error:",  v12,  &v24));
    id v15 = v24;

    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 previousSnapshot]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profileForSystemAppUserIdentifier:v6]);

      id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pb_userProfile"));
      id v19 = sub_100084680();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      unsigned int v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v29 = "-[PBLoretoUserProfileManager removeUserProfileWithIdentifier:completionHandler:]";
          __int16 v30 = 2114;
          id v31 = v6;
          __int16 v32 = 2112;
          id v33 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Removed user profile. {identifier=%{public}@, userProfile=%@}",  buf,  0x20u);
        }

        if (v15)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10026F7E8();
          }
          _bs_set_crash_log_message([v22 UTF8String]);
          __break(0);
          JUMPOUT(0x10000C3F8LL);
        }
      }

      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10026F77C();
        }
      }
    }

    else
    {
      id v23 = sub_100084680();
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
        sub_10026F890();
      }
    }

    ((void (*)(void *, BOOL, id))v9[2])(v9, v14 != 0LL, v15);
  }

  else
  {
    ((void (*)(void *, void, id))v9[2])(v9, 0LL, v13);
    id v15 = v13;
  }
}

- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = sub_100084680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[PBLoretoUserProfileManager effectiveUserProfileWithHomeUserIdentifier:completionHandler:]";
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Fetching effective user profile with home user identifier. {homeUserIdentifier=%{public}@}",  (uint8_t *)&v10,  0x16u);
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10000CA74;
  v39[3] = &unk_1003D0288;
  id v11 = v10;
  id v40 = v11;
  __int16 v12 = objc_retainBlock(v39);
  unint64_t v13 = sub_1000909C0((unint64_t)[v8 integerValue]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotController snapshot](self->_queue_profileStoreSnapshotController, "snapshot"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 profileForSystemAppUserIdentifier:v9]);
  id v16 = sub_100084680();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v15)
  {
    id v37 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 identity]);
      uint64_t v20 = UPConsentDescription(v13);
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 136315906;
      id v42 = "-[PBLoretoUserProfileManager updateGroupRecommendationsConsent:forUserProfileWithIdentifier:completionHandler:]";
      __int16 v43 = 2114;
      id v44 = v9;
      __int16 v45 = 2114;
      v46 = v19;
      __int16 v47 = 2114;
      v48 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Updating user profile group recommendations consent. {identifier=%{public}@, identity=%{public}@, consent=%{public}@}",  buf,  0x2Au);
    }

    queue_recommendationGroupsController = self->_queue_recommendationGroupsController;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 identity]);
    id v38 = 0LL;
    LODWORD(queue_recommendationGroupsController) = -[PBProfileRecommendationGroupsController updateConsent:forProfileIdentity:error:]( queue_recommendationGroupsController,  "updateConsent:forProfileIdentity:error:",  v13,  v23,  &v38);
    id v24 = v38;

    if ((_DWORD)queue_recommendationGroupsController)
    {
      if (v24)
      {
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10026FA2C();
        }
        _bs_set_crash_log_message([v36 UTF8String]);
        __break(0);
        JUMPOUT(0x10000CA6CLL);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotController snapshot]( self->_queue_profileStoreSnapshotController,  "snapshot"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v15 identity]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 profileForIdentity:v26]);

      if (!v27)
      {
        id v28 = sub_100084680();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10026F9C0();
        }
      }
    }

    else
    {
      id v31 = sub_100084680();
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 identity]);
        uint64_t v34 = UPConsentDescription(v13);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 136316162;
        id v42 = "-[PBLoretoUserProfileManager updateGroupRecommendationsConsent:forUserProfileWithIdentifier:completionHandler:]";
        __int16 v43 = 2114;
        id v44 = v9;
        __int16 v45 = 2114;
        v46 = v33;
        __int16 v47 = 2114;
        v48 = v35;
        __int16 v49 = 2112;
        id v50 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "%s: Failed to update the profile recommendation group consent. {identifier=%{public}@, identity=%{public}@, co nsent=%{public}@, error=%@}",  buf,  0x34u);
      }
    }

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "pb_userProfile"));
    ((void (*)(void *, void *, id))v12[2])(v12, v32, v24);

    id v8 = v37;
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10026F908((uint64_t)v9, v13, v18);
    }

    uint64_t v30 = PBSUserProfileServiceErrorForCode(200LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v30);
    ((void (*)(void *, void, id))v12[2])(v12, 0LL, v24);
  }
}

- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10000CF3C;
  v48[3] = &unk_1003D02B0;
  id v9 = v8;
  id v49 = v9;
  id v10 = objc_retainBlock(v48);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotController snapshot](self->_queue_profileStoreSnapshotController, "snapshot"));
  uint64_t v45 = 0LL;
  v46[0] = &v45;
  v46[1] = 0x3032000000LL;
  v46[2] = sub_10000ACE0;
  v46[3] = sub_10000ACF0;
  __int16 v47 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10000CF5C;
  v42[3] = &unk_1003D02D8;
  id v12 = v11;
  id v43 = v12;
  id v44 = &v45;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_compactMap:", v42));
  if ([*(id *)(v46[0] + 40) count])
  {
    id v14 = sub_100084770();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10026FB48((uint64_t)v46, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = PBSUserProfileServiceErrorForCodeWithDebugDescription( 400LL,  @"The set of user identifiers for group recommendations session is invalid.");
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v23);
  }

  else
  {
    id v24 = sub_100084680();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[PBLoretoUserProfileManager updateGroupRecommendationsSessionWithUserIdentifiers:completionHandler:]";
      __int16 v52 = 2114;
      id v53 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: Updating group recommendations session. {userIdentifiers=%{public}@}",  buf,  0x16u);
    }

    queue_recommendationGroupsController = self->_queue_recommendationGroupsController;
    id v41 = 0LL;
    unsigned int v27 = -[PBProfileRecommendationGroupsController updateActiveSessionWithRecommendationGroupIdentities:error:]( queue_recommendationGroupsController,  "updateActiveSessionWithRecommendationGroupIdentities:error:",  v13,  &v41);
    id v28 = v41;
    id v23 = v28;
    if (v27)
    {
      if (v28)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
        id v34 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v35 = NSStringFromSelector(a2);
          __int16 v36 = (char *)(id)objc_claimAutoreleasedReturnValue(v35);
          id v37 = (objc_class *)objc_opt_class(self);
          id v38 = NSStringFromClass(v37);
          id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          *(_DWORD *)buf = 138544642;
          v51 = v36;
          __int16 v52 = 2114;
          id v53 = v39;
          __int16 v54 = 2048;
          v55 = self;
          __int16 v56 = 2114;
          v57 = @"PBLoretoUserProfileManager.m";
          __int16 v58 = 1024;
          int v59 = 810;
          __int16 v60 = 2114;
          objc_super v61 = v33;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
        }

        uint64_t v40 = _bs_set_crash_log_message([v33 UTF8String]);
        sub_10026FAD4(v40);
      }

      id v29 = sub_100084680();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([0 userIdentifiers]);
        *(_DWORD *)buf = 136315394;
        v51 = "-[PBLoretoUserProfileManager updateGroupRecommendationsSessionWithUserIdentifiers:completionHandler:]";
        __int16 v52 = 2114;
        id v53 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: Updated group recommendations session. {userIdentifiers=%{public}@}",  buf,  0x16u);
      }
    }

    else
    {
      id v32 = sub_100084680();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10026FADC();
      }
    }

    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v23);
  }

  _Block_object_dispose(&v45, 8);
}

- (void)beginIgnoringUserProfileAccountNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteProcess]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    uint64_t v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received begin ignoring user profile account notifications request. {clientProcess=%{public}@}",  (uint8_t *)&v16,  0xCu);
  }

  if (v5)
  {
    -[PBLoretoUserProfileManager _queue_beginIgnoringProfileAccountNotificationsWithReason:]( self,  "_queue_beginIgnoringProfileAccountNotificationsWithReason:",  v5);
  }

  else
  {
    id v8 = sub_100084680();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10026FBC8((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)endIgnoringUserProfileAccountNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteProcess]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    uint64_t v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received end ignoring user profile account notifications request. {clientProcess=%{public}@}",  (uint8_t *)&v16,  0xCu);
  }

  if (v5)
  {
    -[PBLoretoUserProfileManager _queue_endIgnoringProfileAccountNotificationsWithReason:]( self,  "_queue_endIgnoringProfileAccountNotificationsWithReason:",  v5);
  }

  else
  {
    id v8 = sub_100084680();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10026FC2C((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)handleUserProfileAccountNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = sub_100084680();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBLoretoUserProfileManager handleUserProfileAccountNotification:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Received handle user profile account notification request. {notification=%@}",  (uint8_t *)&v7,  0x16u);
  }

  -[PBProfileAccountsController handleProfileAccountNotification:]( self->_queue_accountsController,  "handleProfileAccountNotification:",  v4);
}

+ (unint64_t)_maxNumberOfUsers
{
  return 15LL;
}

+ (unint64_t)_maxNumberOfGuestUsers
{
  return 14LL;
}

+ (id)_makeProfileBulletinControllerWithCallinQueue:(id)a3 profileStoreSnapshotProvider:(id)a4 presentationElementFocusCoordinator:(id)a5 powerManager:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
  uint64_t v14 = -[PBProfileBulletinController initWithCallinQueue:profileStoreSnapshotProvider:bulletinService:presentationElementFocusCoordinator:powerManager:]( objc_alloc(&OBJC_CLASS___PBProfileBulletinController),  "initWithCallinQueue:profileStoreSnapshotProvider:bulletinService:presentationElementFocusCoordinator:powerManager:",  v12,  v11,  v13,  v10,  v9);

  return v14;
}

- (void)_performAsyncBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D480;
  block[3] = &unk_1003D0300;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_currentProfileStoreSnapshot
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = self->_lock_snapshot;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_updateCurrentProfileProfileStoreSnapshot:(id)a3
{
  id v4 = (UPProfileStoreSnapshot *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_snapshot = self->_lock_snapshot;
  self->_lock_snapshot = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_queue_addProfileWithRequest:(id)a3 error:(id *)a4
{
  id v10 = a3;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:]( self,  "_queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:",  v7,  0LL,  0LL,  a4,  v10));
  return v8;
}

- (id)_queue_removeProfileWithRequest:(id)a3 error:(id *)a4
{
  id v10 = a3;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:]( self,  "_queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:",  0LL,  0LL,  v7,  a4,  v10));
  return v8;
}

- (id)_queue_updateProfileWithRequest:(id)a3 error:(id *)a4
{
  id v10 = a3;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:]( self,  "_queue_updateProfileStoreWithAddProfileRequests:updateProfileRequests:removeProfileRequests:error:",  0LL,  v7,  0LL,  a4,  v10));
  return v8;
}

- (id)_queue_updateProfileStoreWithAddProfileRequests:(id)a3 updateProfileRequests:(id)a4 removeProfileRequests:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[PBLoretoUserProfileManager _queue_isMigratingProfiles](self, "_queue_isMigratingProfiles"))
  {
    if (a6)
    {
      uint64_t v13 = PBSUserProfileServiceMigratingProfilesError();
      uint64_t v14 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

- (id)_queue_makeProfileStoreSnapshotControllerWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = -[PBProfileStoreSnapshotController initWithCallinQueue:]( objc_alloc(&OBJC_CLASS___PBProfileStoreSnapshotController),  "initWithCallinQueue:",  v3);

  return v4;
}

- (BOOL)_queue_isMigratingProfiles
{
  return self->_queue_profileAccountsMigrator != 0LL;
}

- (void)_queue_handleProfilesMigrationCompletion
{
  queue_profileAccountsMigrator = self->_queue_profileAccountsMigrator;
  self->_queue_profileAccountsMigrator = 0LL;

  -[PBLoretoUserProfileManager _queue_initializeProfilesStorage](self, "_queue_initializeProfilesStorage");
}

- (void)_queue_initializeProfilesStorage
{
  id v3 = (PBProfileStoreSnapshotController *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManager _queue_makeProfileStoreSnapshotControllerWithQueue:]( self,  "_queue_makeProfileStoreSnapshotControllerWithQueue:",  self->_queue));
  queue_profileStoreSnapshotController = self->_queue_profileStoreSnapshotController;
  self->_queue_profileStoreSnapshotController = v3;

  -[PBProfileStoreSnapshotController setCalloutQueue:]( self->_queue_profileStoreSnapshotController,  "setCalloutQueue:",  self->_queue);
  id v5 = self->_queue_profileStoreSnapshotController;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10000DB60;
  id v12 = &unk_1003D0350;
  objc_copyWeak(&v13, &location);
  -[PBProfileStoreSnapshotController setDidUpdateHandler:](v5, "setDidUpdateHandler:", &v9);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotController snapshot]( self->_queue_profileStoreSnapshotController,  "snapshot",  v9,  v10,  v11,  v12));
  -[PBLoretoUserProfileManager _updateCurrentProfileProfileStoreSnapshot:]( self,  "_updateCurrentProfileProfileStoreSnapshot:",  v6);
  int v7 = (PBSGroupRecommendationsSession *)objc_claimAutoreleasedReturnValue( -[PBProfileRecommendationGroupsController activeSession]( self->_queue_recommendationGroupsController,  "activeSession"));
  queue_recommendationGroupSession = self->_queue_recommendationGroupSession;
  self->_queue_recommendationGroupSession = v7;

  -[PBProfileAccountsController removeOrphanAccountsAndPersonas]( self->_queue_accountsController,  "removeOrphanAccountsAndPersonas");
  -[PBLoretoUserProfileManager _notifyObserversDidUpdate](self, "_notifyObserversDidUpdate");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_queue_handleProfileStoreSnapshotUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 difference]);
  unsigned int v6 = [v5 hasChanges];

  if (!v6) {
    goto LABEL_28;
  }
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSnapshot]);
  -[PBLoretoUserProfileManager _updateCurrentProfileProfileStoreSnapshot:]( self,  "_updateCurrentProfileProfileStoreSnapshot:",  v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileRecommendationGroupsController activeSession]( self->_queue_recommendationGroupsController,  "activeSession"));
  unsigned __int8 v9 = [v8 isEqual:self->_queue_recommendationGroupSession];
  if ((v9 & 1) == 0) {
    objc_storeStrong((id *)&self->_queue_recommendationGroupSession, v8);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 activeProfile]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 difference]);
  unsigned int v12 = [v11 didChangeActiveProfile];

  if (v12)
  {
    queue_accountsController = self->_queue_accountsController;
    unsigned __int8 v14 = v9;
    if (v10) {
      -[PBProfileAccountsController activateITunesAccountWithProfile:]( queue_accountsController,  "activateITunesAccountWithProfile:",  v10);
    }
    else {
      -[PBProfileAccountsController deactivateCurrentlyActiveITunesAccount]( queue_accountsController,  "deactivateCurrentlyActiveITunesAccount");
    }
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pb_identifier"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 previousSnapshot]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 activeProfile]);
    id v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pb_identifier"));

    if (BSEqualStrings(v30, v18))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"!BSEqualStrings(newUserProfileIdentifier, previousUserProfileIdentifier)"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10026FD38();
      }
      _bs_set_crash_log_message([v33 UTF8String]);
      __break(0);
      JUMPOUT(0x10000DF40LL);
    }

    -[PBLoretoUserProfileManager _notifyObserverUserSwitchedToUserIdentifier:previousUserIdentifier:]( self,  "_notifyObserverUserSwitchedToUserIdentifier:previousUserIdentifier:",  v30,  v18);
    unsigned __int8 v9 = v14;
LABEL_24:

    goto LABEL_25;
  }

  if (v10)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 difference]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 profilesDifference]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profileUpdates]);

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v19)
    {
      id v20 = v19;
      unsigned __int8 v34 = v9;
      id v35 = v8;
      __int16 v36 = v7;
      id v37 = v4;
      uint64_t v21 = *(void *)v39;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 updatedProfile]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identity]);

          id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 identity]);
          unsigned int v27 = [v25 isEqual:v26];

          if (v27)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v23 difference]);
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 modifiedKeyPaths]);

            if ([v29 containsObject:@"iTunesAltDSID"]) {
              -[PBProfileAccountsController activateITunesAccountWithProfile:]( self->_queue_accountsController,  "activateITunesAccountWithProfile:",  v10);
            }

            goto LABEL_20;
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v20) {
          continue;
        }
        break;
      }

- (void)_queue_presentWelcomeBackBulletinWithActiveProfile:(id)a3 previousActiveProfile:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pb_preferredLanguages"));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pb_preferredLanguages"));
  LOBYTE(v8) = BSEqualObjects(v9, v10);

  if ((v8 & 1) != 0)
  {
    -[PBProfileBulletinController presentWelcomeBackBulletinWithReason:]( self->_queue_profileBulletinController,  "presentWelcomeBackBulletinWithReason:",  1LL);
  }

  else
  {
    dispatch_time_t v11 = dispatch_time(0LL, 2000000000LL);
    unsigned int v12 = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E034;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_after(v11, v12, block);
  }

- (void)_queue_beginIgnoringProfileAccountNotificationsWithReason:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[PBProfileAccountsController beginIgnoringProfileAccountNotificationsWithReason:]( self->_queue_accountsController,  "beginIgnoringProfileAccountNotificationsWithReason:",  v5);
}

- (void)_queue_endIgnoringProfileAccountNotificationsWithReason:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[PBProfileAccountsController endIgnoringProfileAccountNotificationsWithReason:]( self->_queue_accountsController,  "endIgnoringProfileAccountNotificationsWithReason:",  v5);
}

- (BOOL)_queue_canAddNewUserWithType:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotController snapshot](self->_queue_profileStoreSnapshotController, "snapshot"));
  unsigned int v6 = v5;
  if (a3 == 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryProfiles]);
    id v9 = [v7 count];
    BOOL v8 = v9 < (id)+[PBLoretoUserProfileManager _maxNumberOfGuestUsers]( &OBJC_CLASS___PBLoretoUserProfileManager,  "_maxNumberOfGuestUsers");
  }

  else
  {
    if (a3)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryProfile]);
    BOOL v8 = v7 == 0LL;
  }

LABEL_7:
  return v8;
}

- (void)_queue_notifyObserversDidUpdateRecommendationGroupSession
{
  id v3 = self->_queue_recommendationGroupSession;
  observers = self->_observers;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E214;
  v6[3] = &unk_1003D03A0;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v6);
}

- (void)_notifyObserverUserSwitchedToUserIdentifier:(id)a3 previousUserIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000E3D4;
  v11[3] = &unk_1003D03F0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v11);
}

- (void)_notifyObserversDidUpdate
{
  observers = self->_observers;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E55C;
  v3[3] = &unk_1003D0440;
  v3[4] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v3);
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end