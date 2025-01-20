@interface PBLegacyUserProfileManager
+ (unint64_t)_maxNumberOfGuestUsers;
+ (unint64_t)_maxNumberOfUsers;
+ (void)_createGuestPersonaWithCompletionHandler:(id)a3;
+ (void)_performCreateUserProfilesMigrationWithContext:(id)a3 completionHandler:(id)a4;
- (BOOL)canAddNewUserWithType:(id)a3;
- (BOOL)hasActiveUserBulletin;
- (BOOL)hasMultipleUsers;
- (NSString)description;
- (NSString)selectedUserProfileIdentifier;
- (PBLegacyUserProfileManager)initWithWindowManager:(id)a3 userProfileApplicationManager:(id)a4 powerManager:(id)a5 userProfilePictureStore:(id)a6;
- (PBSGroupRecommendationsSession)groupRecommendationsSession;
- (PBSUserProfilesSnapshot)currentUserProfilesSnapshot;
- (PBSUserProfilesSnapshot)userProfilesSnapshot;
- (PBUserProfileManagerServiceConfiguration)serviceConfiguration;
- (id)_initWithAccountStore:(id)a3 bulletinService:(id)a4 userProfileStore:(id)a5 homeKitManager:(id)a6 windowManager:(id)a7 userProfileApplicationManager:(id)a8 powerManager:(id)a9 userProfilePictureStore:(id)a10;
- (id)_initWithAccountStore:(id)a3 bulletinService:(id)a4 userProfileStore:(id)a5 homeKitManager:(id)a6 windowManager:(id)a7 userProfileApplicationManager:(id)a8 powerManager:(id)a9 userProfilePictureStore:(id)a10 shouldDoInitialStorageValidation:(BOOL)a11;
- (id)observeUserProfileManagerDidSwitchUserUsingBlock:(id)a3;
- (id)observeUserProfileManagerDidUpdateGroupRecommendationsSessionUsingBlock:(id)a3;
- (id)observeUserProfileManagerDidUpdateUsingBlock:(id)a3;
- (id)welcomeBulletinProfilePictureDataForUserProfile:(id)a3;
- (void)_handleUserProfileAccountNotification:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginIgnoringUserProfileAccountNotifications;
- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4;
- (void)endIgnoringUserProfileAccountNotifications;
- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3;
- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3;
- (void)handleUserProfileAccountNotification:(id)a3;
- (void)performUpdatesUsingBlock:(id)a3 completion:(id)a4;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4;
- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendDailyAnalyticsEvents;
- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5;
- (void)userProfileStore:(id)a3 didChangeSelectedUserProfile:(id)a4 previousSelectedUserProfile:(id)a5;
- (void)userProfileStore:(id)a3 didUpdateiTunesForSelectedUserProfile:(id)a4;
@end

@implementation PBLegacyUserProfileManager

- (id)_initWithAccountStore:(id)a3 bulletinService:(id)a4 userProfileStore:(id)a5 homeKitManager:(id)a6 windowManager:(id)a7 userProfileApplicationManager:(id)a8 powerManager:(id)a9 userProfilePictureStore:(id)a10
{
  LOBYTE(v11) = 1;
  return -[PBLegacyUserProfileManager _initWithAccountStore:bulletinService:userProfileStore:homeKitManager:windowManager:userProfileApplicationManager:powerManager:userProfilePictureStore:shouldDoInitialStorageValidation:]( self,  "_initWithAccountStore:bulletinService:userProfileStore:homeKitManager:windowManager:userProfileApplicationMan ager:powerManager:userProfilePictureStore:shouldDoInitialStorageValidation:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  v11);
}

- (id)_initWithAccountStore:(id)a3 bulletinService:(id)a4 userProfileStore:(id)a5 homeKitManager:(id)a6 windowManager:(id)a7 userProfileApplicationManager:(id)a8 powerManager:(id)a9 userProfilePictureStore:(id)a10 shouldDoInitialStorageValidation:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v73 = a5;
  id v72 = a6;
  id v19 = a7;
  id obj = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v70 = v17;
  if (!v17)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"accountStore != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C778();
    }
LABEL_43:
    _bs_set_crash_log_message([v59 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA5E4LL);
  }

  if (!v18)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"bulletinService != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C824();
    }
    _bs_set_crash_log_message([v60 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA648LL);
  }

  if (!v73)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfileStore != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C8D0();
    }
    _bs_set_crash_log_message([v61 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA6ACLL);
  }

  if (!v72)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"homeKitManager != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C97C();
    }
    _bs_set_crash_log_message([v62 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA710LL);
  }

  v69 = v22;
  id v23 = v19;
  Class v24 = NSClassFromString(@"PBWindowManager");
  if (!v23)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CA28();
    }
    _bs_set_crash_log_message([v63 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA774LL);
  }

  if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBWindowManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CDAC();
    }
    _bs_set_crash_log_message([v64 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA7D8LL);
  }

  id v25 = v20;
  Class v26 = NSClassFromString(@"PBUserProfileApplicationManager");
  if (!v25)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CADC();
    }
    _bs_set_crash_log_message([v65 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA83CLL);
  }

  if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBUserProfileApplicationManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CCF8();
    }
    _bs_set_crash_log_message([v66 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA8A0LL);
  }

  id v27 = v21;
  Class v28 = NSClassFromString(@"PBPowerManager");
  if (!v27)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CB90();
    }
    _bs_set_crash_log_message([v67 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CA904LL);
  }

  if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBPowerManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CC44();
    }
    goto LABEL_43;
  }

  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___PBLegacyUserProfileManager;
  v29 = -[PBLegacyUserProfileManager init](&v80, "init");
  if (v29)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLegacyUserProfileManager.workQueue");
    workQueue = v29->_workQueue;
    v29->_workQueue = (OS_dispatch_queue *)Serial;

    uint64_t v32 = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLegacyUserProfileManager.observerQueue");
    observerQueue = v29->_observerQueue;
    v29->_observerQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBLegacyUserProfileManager.homeKitQueue");
    homeKitQueue = v29->_homeKitQueue;
    v29->_homeKitQueue = (OS_dispatch_queue *)v34;

    objc_storeStrong((id *)&v29->_accountStore, a3);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    observers = v29->_observers;
    v29->_observers = (NSHashTable *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    userProfileManagerDidUpdateObservers = v29->_userProfileManagerDidUpdateObservers;
    v29->_userProfileManagerDidUpdateObservers = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    userProfileManagerDidUpdateGroupSessionsObservers = v29->_userProfileManagerDidUpdateGroupSessionsObservers;
    v29->_userProfileManagerDidUpdateGroupSessionsObservers = (NSMutableDictionary *)v40;

    uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    userProfileManagerDidSwitchUserObservers = v29->_userProfileManagerDidSwitchUserObservers;
    v29->_userProfileManagerDidSwitchUserObservers = (NSMutableDictionary *)v42;

    objc_storeStrong((id *)&v29->_bulletinService, a4);
    v29->_shouldPresentAutomaticWelcomeBackBulletin = 1;
    v44 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    ignoringUserProfileAccountNotificationsReasons = v29->_ignoringUserProfileAccountNotificationsReasons;
    v29->_ignoringUserProfileAccountNotificationsReasons = v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    provisioningUserProfileAttributes = v29->_provisioningUserProfileAttributes;
    v29->_provisioningUserProfileAttributes = (NSMutableSet *)v46;

    objc_storeStrong((id *)&v29->_userProfileStore, a5);
    -[PBUserProfileStore setDelegate:](v29->_userProfileStore, "setDelegate:", v29);
    objc_storeStrong((id *)&v29->_profilePictureStore, a10);
    objc_storeStrong((id *)&v29->_homeKitManager, a6);
    -[CUHomeKitManager setDispatchQueue:](v29->_homeKitManager, "setDispatchQueue:", v29->_homeKitQueue);
    -[CUHomeKitManager setLabel:]( v29->_homeKitManager,  "setLabel:",  @"com.apple.PineBoard.PBLegacyUserProfileManager.homeKitManager");
    -[CUHomeKitManager setFlags:](v29->_homeKitManager, "setFlags:", 66LL);
    -[CUHomeKitManager activate](v29->_homeKitManager, "activate");
    objc_storeStrong((id *)&v29->_userProfileApplicationManager, obj);
    v48 = (dispatch_queue_s *)v29->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CA988;
    block[3] = &unk_1003D2008;
    BOOL v79 = a11;
    v49 = v29;
    v78 = v49;
    dispatch_sync(v48, block);
    -[PBBulletinService setDelegate:](v29->_bulletinService, "setDelegate:", v49);
    uint64_t v50 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    dateLastSystemWake = v49->_dateLastSystemWake;
    v49->_dateLastSystemWake = (NSDate *)v50;

    uint64_t v52 = objc_claimAutoreleasedReturnValue([v23 focusCoordinator]);
    presentationElementFocusCoordinator = v49->_presentationElementFocusCoordinator;
    v49->_presentationElementFocusCoordinator = (PBPresentationElementFocusCoordinator *)v52;

    -[PBPresentationElementFocusCoordinator addObserver:]( v49->_presentationElementFocusCoordinator,  "addObserver:",  v49);
    [v27 addObserver:v49];
    objc_initWeak(&location, v49);
    v54 = &_dispatch_main_q;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_1000CB234;
    v74[3] = &unk_1003D04B8;
    objc_copyWeak(&v75, &location);
    uint64_t v55 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( &_dispatch_main_q,  @"PineBoard - User Profiles - All Users",  v74);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
    stateCaptureHandle = v49->_stateCaptureHandle;
    v49->_stateCaptureHandle = (BSInvalidatable *)v56;

    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
  }

  return v29;
}

- (PBLegacyUserProfileManager)initWithWindowManager:(id)a3 userProfileApplicationManager:(id)a4 powerManager:(id)a5 userProfilePictureStore:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v15 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
  v16 = -[PBUserProfileStore initWithType:](objc_alloc(&OBJC_CLASS___PBUserProfileStore), "initWithType:", 1LL);
  id v17 = objc_alloc_init(&OBJC_CLASS___CUHomeKitManager);
  id v18 = -[PBLegacyUserProfileManager _initWithAccountStore:bulletinService:userProfileStore:homeKitManager:windowManager:userProfileApplicationManager:powerManager:userProfilePictureStore:]( self,  "_initWithAccountStore:bulletinService:userProfileStore:homeKitManager:windowManager:userProfileApplicationMana ger:powerManager:userProfilePictureStore:",  v14,  v15,  v16,  v17,  v13,  v12,  v11,  v10);

  return v18;
}

- (void)dealloc
{
  stateCaptureHandle = self->_stateCaptureHandle;
  self->_stateCaptureHandle = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBLegacyUserProfileManager;
  -[PBLegacyUserProfileManager dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_1000CB81C;
  v9 = &unk_1003CFEB8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  id v11 = self;
  id v3 = v10;
  [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build", v6, v7, v8, v9));

  return (NSString *)v4;
}

- (PBUserProfileManagerServiceConfiguration)serviceConfiguration
{
  return  -[PBUserProfileManagerServiceConfiguration initWithService:queue:]( objc_alloc(&OBJC_CLASS___PBUserProfileManagerServiceConfiguration),  "initWithService:queue:",  self,  0LL);
}

- (PBSUserProfilesSnapshot)currentUserProfilesSnapshot
{
  return (PBSUserProfilesSnapshot *)(id)objc_claimAutoreleasedReturnValue( -[PBLegacyUserProfileManager userProfilesSnapshot]( self,  "userProfilesSnapshot"));
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CB948;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (id)observeUserProfileManagerDidUpdateUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CBA9C;
    block[3] = &unk_1003D5958;
    void block[4] = self;
    id v15 = v4;
    id v7 = v5;
    id v14 = v7;
    id v8 = v4;
    dispatch_sync(workQueue, block);
    v9 = v14;
    id v10 = v7;

    return v10;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CF44();
    }
    id result = (id) _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

  return result;
}

- (id)observeUserProfileManagerDidUpdateGroupRecommendationsSessionUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CBC20;
    block[3] = &unk_1003D5958;
    void block[4] = self;
    id v15 = v4;
    id v7 = v5;
    id v14 = v7;
    id v8 = v4;
    dispatch_sync(workQueue, block);
    v9 = v14;
    id v10 = v7;

    return v10;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027CFEC();
    }
    id result = (id) _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

  return result;
}

- (id)observeUserProfileManagerDidSwitchUserUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CBDA4;
    block[3] = &unk_1003D5958;
    void block[4] = self;
    id v15 = v4;
    id v7 = v5;
    id v14 = v7;
    id v8 = v4;
    dispatch_sync(workQueue, block);
    v9 = v14;
    id v10 = v7;

    return v10;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027D094();
    }
    id result = (id) _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000CBE84;
    v6[3] = &unk_1003CFEB8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(workQueue, v6);
  }
}

- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CBF60;
  v7[3] = &unk_1003CFEB8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CC0C8;
  v7[3] = &unk_1003CFEB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)sendDailyAnalyticsEvents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBLegacyUserProfileManager userProfilesSnapshot](self, "userProfilesSnapshot"));
  id v3 = objc_alloc_init(&OBJC_CLASS___TVCSUserProfilesAnalyticsUsersStateEvent);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfiles]);
  v47 = v3;
  objc_msgSend(v3, "setUsersCount:", objc_msgSend(v4, "count"));

  v49 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  uint64_t v46 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfiles]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v50 = *(void *)v61;
    uint64_t v51 = 0LL;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        if ([v16 type] == (id)1) {
          ++v14;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 iCloudAltDSID]);
        if (v17) {
          ++v13;
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 iTunesAltDSID]);
        if (v18)
        {
          ++v12;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 iTunesAltDSID]);
          -[NSCountedSet addObject:](v49, "addObject:", v19);
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 gameCenterAltDSID]);
        if (v20) {
          ++v11;
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 homeUserIdentifier]);
        if (v21)
        {
          ++v10;
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 iCloudAltDSID]);
          if (v22) {
            ++v9;
          }

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 gameCenterAltDSID]);
          uint64_t v24 = v51;
          if (v23) {
            uint64_t v24 = v51 + 1;
          }
          uint64_t v51 = v24;
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }

    while (v8);
  }

  else
  {
    uint64_t v51 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  [v47 setGuestUsersCount:v14];
  [v47 setUsersWithiCloudAccountCount:v13];
  [v47 setUsersWithiTunesAccountCount:v12];
  [v47 setUsersWithGameCenterAccountCount:v11];
  [v47 setHomeUsersCount:v10];
  [v47 setHomeUsersWithiCloudAccountCount:v9];
  [v47 setHomeUsersWithGameCenterAccountCount:v51];
  [v47 setHaveHomeUsers:v10 > 0];
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v25 = v49;
  id v26 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v56,  v65,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v57;
    while (2)
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v57 != v28) {
          objc_enumerationMutation(v25);
        }
        if (-[NSCountedSet countForObject:]( v25,  "countForObject:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)j)) >= 2)
        {
          [v47 setHaveSharediTunesAccounts:1];
          goto LABEL_34;
        }
      }

      id v27 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v56,  v65,  16LL);
      if (v27) {
        continue;
      }
      break;
    }
  }

- (BOOL)hasMultipleUsers
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  workQueue = (dispatch_queue_s *)v2->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CC7BC;
  v5[3] = &unk_1003D0210;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  LOBYTE(v2) = (unint64_t)v7[3] > 1;
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasActiveUserBulletin
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CC8A8;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)selectedUserProfileIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileStore snapshot](self->_userProfileStore, "snapshot"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedUserProfileIdentifier]);

  return (NSString *)v3;
}

- (void)removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CC994;
  v7[3] = &unk_1003CFEB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (id)welcomeBulletinProfilePictureDataForUserProfile:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_1000CCC2C;
  uint64_t v32 = sub_1000CCC3C;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = (double *)&v24;
  uint64_t v26 = 0x4010000000LL;
  id v27 = &unk_1003A084B;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  profilePictureStore = self->_profilePictureStore;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CCC54;
  v20[3] = &unk_1003D5A48;
  id v22 = &v28;
  id v23 = &v24;
  id v7 = v5;
  id v21 = v7;
  -[PBUserProfilePictureStore profilePictureFileForUserProfile:completionHandler:]( profilePictureStore,  "profilePictureFileForUserProfile:completionHandler:",  v4,  v20);
  dispatch_time_t v8 = dispatch_time(0LL, 500000000LL);
  if (!dispatch_semaphore_wait(v7, v8))
  {
    id v9 = sub_100084680();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      sub_10027D13C(v11, (uint64_t)v34, v10);
    }
  }

  uint64_t v12 = (void *)v29[5];
  if (v12
    && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](&OBJC_CLASS___UIImage, "imageWithContentsOfFile:", v13)),
        v13,
        v14))
  {
    uint64_t v15 = TVSUIResizedUserProfilePictureImage(80.0, v25[4], v25[5], v25[6], v25[7]);
    v16 = (UIImage *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = UIImageJPEGRepresentation(v16, 0.9);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    id v18 = 0LL;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (void)performUpdatesUsingBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_1000CCC2C;
  v17[4] = sub_1000CCC3C;
  id v18 = 0LL;
  userProfileStore = self->_userProfileStore;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000CCE14;
  v14[3] = &unk_1003D5A70;
  id v9 = v6;
  id v15 = v9;
  v16 = v17;
  -[PBUserProfileStore performBatchUpdatesUsingBlock:](userProfileStore, "performBatchUpdatesUsingBlock:", v14);
  -[PBUserProfileStore save](self->_userProfileStore, "save");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000CCEA4;
  v11[3] = &unk_1003D07B8;
  id v10 = v7;
  id v12 = v10;
  uint64_t v13 = v17;
  BSDispatchMain(v11);

  _Block_object_dispose(v17, 8);
}

- (PBSUserProfilesSnapshot)userProfilesSnapshot
{
  id v18 = 0LL;
  id v3 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v18);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v18;
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10027D188();
  }

  if (v4)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    id v15 = sub_1000CCC2C;
    v16 = sub_1000CCC3C;
    id v17 = 0LL;
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CD1A4;
    block[3] = &unk_1003D0210;
    void block[4] = self;
    void block[5] = &v12;
    dispatch_sync(workQueue, block);
    id v9 = (PBSUserProfilesSnapshot *)(id)v13[5];
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    id v9 = -[PBSUserProfilesSnapshot initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:]( objc_alloc(&OBJC_CLASS___PBSUserProfilesSnapshot),  "initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:",  &__NSDictionary0__struct,  0LL,  0LL);
  }

  return v9;
}

- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000CD338;
  v15[3] = &unk_1003D5A98;
  id v4 = a3;
  id v16 = v4;
  id v5 = objc_retainBlock(v15);
  id v14 = 0LL;
  id v6 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v14);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v14;
  id v9 = sub_100084680();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10027D2F8();
  }

  if (v7)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CD358;
    v12[3] = &unk_1003D2560;
    v12[4] = self;
    uint64_t v13 = v5;
    dispatch_async(workQueue, v12);
  }

  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v8);
  }
}

- (PBSGroupRecommendationsSession)groupRecommendationsSession
{
  id v21 = 0LL;
  id v3 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v21);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v21;
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10027D358();
  }

  if (v4)
  {
    uint64_t v15 = 0LL;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    id v18 = sub_1000CCC2C;
    id v19 = sub_1000CCC3C;
    id v20 = 0LL;
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CD538;
    block[3] = &unk_1003D0210;
    void block[4] = self;
    void block[5] = &v15;
    dispatch_sync(workQueue, block);
    id v9 = (PBSGroupRecommendationsSession *)(id)v16[5];
    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v10 = -[PBSUserProfilesSnapshot initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:]( objc_alloc(&OBJC_CLASS___PBSUserProfilesSnapshot),  "initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:",  &__NSDictionary0__struct,  0LL,  0LL);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___PBSGroupRecommendationsSession);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    id v9 = -[PBSGroupRecommendationsSession initWithUserIdentifiers:userProfilesSnapshot:]( v11,  "initWithUserIdentifiers:userProfilesSnapshot:",  v12,  v10);
  }

  return v9;
}

- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000CD6B0;
  v15[3] = &unk_1003D02B0;
  id v4 = a3;
  id v16 = v4;
  id v5 = objc_retainBlock(v15);
  id v14 = 0LL;
  id v6 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v14);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v14;
  id v9 = sub_100084680();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10027D3B8();
  }

  if (v7)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CD6D0;
    v12[3] = &unk_1003D2560;
    v12[4] = self;
    uint64_t v13 = v5;
    dispatch_async(workQueue, v12);
  }

  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v8);
  }
}

- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000CD920;
  v23[3] = &unk_1003D5AC0;
  id v7 = a4;
  id v24 = v7;
  id v8 = objc_retainBlock(v23);
  id v22 = 0LL;
  id v9 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.select", &v22);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v22;
  id v12 = sub_100084680();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v10;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Received select user profile request. {clientProcess=%@, userProfileIdentifier=%{public}@}",  buf,  0x16u);
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    objc_initWeak((id *)buf, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000CD940;
    v17[3] = &unk_1003D5AE8;
    objc_copyWeak(&v21, (id *)buf);
    id v20 = v8;
    id v18 = v6;
    id v19 = v14;
    id v16 = v14;
    dispatch_async(workQueue, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void *, id))v8[2])(v8, &__kCFBooleanFalse, v11);
  }
}

- (BOOL)canAddNewUserWithType:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  id v29 = 0LL;
  id v5 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v29);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v29;
  id v8 = sub_100084680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10027D4C4((uint64_t)v6, v4, v9);
  }

  if (v6)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 0;
    workQueue = (dispatch_queue_s *)self->_workQueue;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    id v20 = sub_1000CE150;
    id v21 = &unk_1003D5B10;
    id v11 = v4;
    id v23 = self;
    id v24 = &v25;
    id v22 = v11;
    dispatch_sync(workQueue, &v18);
    id v12 = sub_100084680();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = objc_msgSend(v11, "integerValue", v18, v19, v20, v21);
      int v15 = *((unsigned __int8 *)v26 + 24);
      *(_DWORD *)buf = 134218240;
      id v31 = v14;
      __int16 v32 = 1024;
      int v33 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Is adding new user with profile allowed. {type=%ld, isAllowed=%{BOOL}d}",  buf,  0x12u);
    }

    BOOL v16 = *((_BYTE *)v26 + 24) != 0;
    _Block_object_dispose(&v25, 8);
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CE460;
  v20[3] = &unk_1003D0288;
  id v7 = a4;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  id v19 = 0LL;
  id v9 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.edit", &v19);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v19;
  id v12 = sub_100084680();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Received create user profile request. {clientProcess=%@, userProfileAttributes=%@}",  buf,  0x16u);
  }

  if (v10)
  {
    objc_initWeak((id *)buf, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CE480;
    block[3] = &unk_1003D5B38;
    objc_copyWeak(&v18, (id *)buf);
    uint64_t v17 = v8;
    id v16 = v6;
    dispatch_async(workQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void, id))v8[2])(v8, 0LL, v11);
  }
}

- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000CECB0;
  v24[3] = &unk_1003D0288;
  id v10 = a5;
  id v25 = v10;
  id v11 = objc_retainBlock(v24);
  id v23 = 0LL;
  id v12 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.edit", &v23);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v23;
  id v15 = sub_100084680();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Received update user profile request. {clientProcess=%@, userProfileIdentifier=%{public}@, userProfileAttributes=%@}",  buf,  0x20u);
  }

  if (v13)
  {
    objc_initWeak((id *)buf, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000CECD0;
    v18[3] = &unk_1003D5AE8;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v11;
    id v19 = v8;
    id v20 = v9;
    dispatch_async(workQueue, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v14);
  }
}

- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CF504;
  v20[3] = &unk_1003D5AC0;
  id v7 = a4;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  id v19 = 0LL;
  id v9 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.edit", &v19);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v19;
  id v12 = sub_100084680();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Received remove user profile request. {clientProcess=%@, userProfileIdentifier=%{public}@}",  buf,  0x16u);
  }

  if (v10)
  {
    objc_initWeak((id *)buf, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CF524;
    block[3] = &unk_1003D5B38;
    objc_copyWeak(&v18, (id *)buf);
    uint64_t v17 = v8;
    id v16 = v6;
    dispatch_async(workQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void *, id))v8[2])(v8, &__kCFBooleanFalse, v11);
  }
}

- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000CFAFC;
  v21[3] = &unk_1003D0288;
  id v7 = a4;
  id v22 = v7;
  id v8 = objc_retainBlock(v21);
  id v20 = 0LL;
  id v9 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles", &v20);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v20;
  id v12 = sub_100084680();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10027D944();
  }

  if (v10)
  {
    objc_initWeak(&location, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000CFB1C;
    v15[3] = &unk_1003D5B38;
    objc_copyWeak(&v18, &location);
    uint64_t v17 = v8;
    id v16 = v6;
    dispatch_async(workQueue, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  else
  {
    ((void (*)(void *, void, id))v8[2])(v8, 0LL, v11);
  }
}

- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v11 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  id v12 = [v11 integerValue];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000D0038;
  v26[3] = &unk_1003D0288;
  id v13 = v9;
  id v27 = v13;
  id v14 = objc_retainBlock(v26);
  id v25 = 0LL;
  id v15 = sub_1000CD028( (uint64_t)self,  @"com.apple.appletv.pbs.user-profiles.group-recommendations-consent.edit",  &v25);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v25;
  id v18 = sub_100084680();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v16;
    __int16 v30 = 2114;
    id v31 = v8;
    __int16 v32 = 2048;
    id v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Received update group recommendations consent for user. {clientProcess=%@, userIdentifier=%{public}@, consent=%ld}",  buf,  0x20u);
  }

  if (v16)
  {
    objc_initWeak((id *)buf, self);
    id v20 = (dispatch_queue_s *)self->_workQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000D0058;
    v21[3] = &unk_1003D1DE8;
    objc_copyWeak(v24, (id *)buf);
    id v23 = v14;
    v24[1] = v12;
    id v22 = v8;
    dispatch_async(v20, v21);

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void, id))v14[2])(v14, 0LL, v17);
  }
}

- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D0888;
  v21[3] = &unk_1003D02B0;
  id v8 = v7;
  id v22 = v8;
  id v9 = objc_retainBlock(v21);
  id v20 = 0LL;
  id v10 = sub_1000CD028( (uint64_t)self,  @"com.apple.appletv.pbs.user-profiles.group-recommendations-session.edit",  &v20);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v20;
  id v13 = sub_100084680();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v24 = v11;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Received update group recommendations session. {clientProcess=%@, userIdentifiers=%{public}@}",  buf,  0x16u);
  }

  if (v11)
  {
    objc_initWeak((id *)buf, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D08A8;
    block[3] = &unk_1003D5B38;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v9;
    id v17 = v6;
    dispatch_async(workQueue, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ((void (*)(void *, void, id))v9[2])(v9, 0LL, v12);
  }
}

- (void)beginIgnoringUserProfileAccountNotifications
{
  id v9 = 0LL;
  id v3 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.edit", &v9);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v9;
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received begin ignoring user profile account notifications request. {clientProcess=%@}",  buf,  0xCu);
  }

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[PBLegacyUserProfileManager beginIgnoringUserProfileAccountNotificationsWithReason:]( self,  "beginIgnoringUserProfileAccountNotificationsWithReason:",  v8);
  }
}

- (void)endIgnoringUserProfileAccountNotifications
{
  id v9 = 0LL;
  id v3 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.edit", &v9);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v9;
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received end ignoring user profile account notifications request. {clientProcess=%@}",  buf,  0xCu);
  }

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[PBLegacyUserProfileManager endIgnoringUserProfileAccountNotificationsWithReason:]( self,  "endIgnoringUserProfileAccountNotificationsWithReason:",  v8);
  }
}

- (void)handleUserProfileAccountNotification:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  id v5 = sub_1000CD028((uint64_t)self, @"com.apple.appletv.pbs.user-profiles.account-notification", &v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v10;
  id v8 = sub_100084680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Received handle user profile account notification request. {clientProcess=%@, notification=%@}",  buf,  0x16u);
  }

  if (v6) {
    -[PBLegacyUserProfileManager _handleUserProfileAccountNotification:]( self,  "_handleUserProfileAccountNotification:",  v4);
  }
}

+ (void)_performCreateUserProfilesMigrationWithContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v64 = v5;
  if (!v5)
  {
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"context != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027DD30();
    }
    _bs_set_crash_log_message([v60 UTF8String]);
    __break(0);
    JUMPOUT(0x1000D2DD4LL);
  }

  if (!v6)
  {
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027DDDC();
    }
    _bs_set_crash_log_message([v61 UTF8String]);
    __break(0);
    JUMPOUT(0x1000D2E38LL);
  }

  __int128 v63 = v6;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v101 = 0LL;
  v102 = (id *)&v101;
  uint64_t v103 = 0x3032000000LL;
  v104 = sub_1000CCC2C;
  v105 = sub_1000CCC3C;
  id v106 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
  if (v7)
  {
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 gameCenterAltDSID]);
    BOOL v9 = v8 == 0LL;

    if (v9)
    {
      v69 = 0LL;
      goto LABEL_27;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
  BOOL v11 = v10 == 0LL;

  if (v11
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 iTunesAccountsByAltDSID]),
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]),
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v13]),
        v13,
        v12,
        !v14))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 gameCenterAltDSID]);
    BOOL v16 = v15 == 0LL;

    if (v16
      || (id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 iTunesAccountsByAltDSID]),
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 gameCenterAltDSID]),
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v18]),
          v18,
          v17,
          !v14))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 iTunesAccounts]);
      BOOL v20 = [v19 count] == (id)1;

      if (!v20)
      {
LABEL_16:
        id v14 = 0LL;
        goto LABEL_17;
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v64 iTunesAccounts]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:0]);

      if (!v14)
      {
LABEL_17:
        id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_altDSID"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pbd_localOverrideNameForItunesAltDSID:", v26));

        __int16 v24 = 0LL;
        int v25 = 1;
        goto LABEL_18;
      }
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_homeUserIdentifiers"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));
  if ((unint64_t)[v23 count] > 1)
  {

    goto LABEL_16;
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

  if (!v24) {
    goto LABEL_17;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pbd_localOverrideNameForHomeUserIdentifier:", v24));
  int v25 = 0;
LABEL_18:
  if ([v64 hasActiveiTunesAccount])
  {
    if (v14)
    {
      unsigned int v27 = [v14 isActive];
      if (((v25 | v27 ^ 1) & 1) == 0)
      {
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pbd_selectedHomeUserIdentifier"));
        unsigned int v27 = [v24 isEqual:v28];
      }
    }

    else
    {
      unsigned int v27 = 0;
    }
  }

  else
  {
    unsigned int v27 = 1;
  }

  id v29 = objc_alloc(&OBJC_CLASS___PBSUserProfile);
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v64 iCloudAltDSID]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_altDSID"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v64 gameCenterAltDSID]);
  LOBYTE(v62) = v27;
  v35 = -[PBSUserProfile initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier:selected:overrideName:]( v29,  "initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier:s elected:overrideName:",  v31,  0LL,  v32,  v33,  v34,  0LL,  v24,  v62,  v71);

  v69 = v35;
  if (v27) {
    objc_storeStrong(v102 + 5, v35);
  }
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile identifier](v69, "identifier"));
  [v74 setObject:v69 forKey:v36];

LABEL_27:
  id v37 = dispatch_group_create();
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v64 iTunesAccounts]);
  id v67 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v98;
    do
    {
      for (i = 0LL; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v98 != v66) {
          objc_enumerationMutation(obj);
        }
        id v38 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)i);
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile iTunesAltDSID](v69, "iTunesAltDSID"));
        if (v39)
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile iTunesAltDSID](v69, "iTunesAltDSID"));
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ams_altDSID"));
          char v42 = BSEqualStrings(v40, v41);

          if ((v42 & 1) != 0) {
            continue;
          }
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ams_homeUserIdentifiers"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
        if ([v70 count])
        {
          id v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pbd_selectedHomeUserIdentifier"));
          if (!v43 || ([v70 containsObject:v43] & 1) == 0)
          {
            uint64_t v44 = objc_claimAutoreleasedReturnValue([v68 firstObject]);

            id v43 = (id)v44;
          }

          __int128 v95 = 0u;
          __int128 v96 = 0u;
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          id v45 = v70;
          id v46 = [v45 countByEnumeratingWithState:&v93 objects:v107 count:16];
          if (v46)
          {
            uint64_t v47 = *(void *)v94;
            do
            {
              for (j = 0LL; j != v46; j = (char *)j + 1)
              {
                if (*(void *)v94 != v47) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v49 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)j);
                else {
                  char v50 = 0;
                }
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pbd_localOverrideNameForHomeUserIdentifier:", v49));
                dispatch_group_enter(v37);
                v85[0] = _NSConcreteStackBlock;
                v85[1] = 3221225472LL;
                v85[2] = sub_1000D2EAC;
                v85[3] = &unk_1003D5CD8;
                id v86 = v74;
                v87 = v38;
                char v92 = v50;
                uint64_t v88 = v49;
                v91 = &v101;
                id v52 = v51;
                id v89 = v52;
                v90 = v37;
                [a1 _createGuestPersonaWithCompletionHandler:v85];
              }

              id v46 = [v45 countByEnumeratingWithState:&v93 objects:v107 count:16];
            }

            while (v46);
          }
        }

        else
        {
          if (v69) {
            unsigned __int8 v53 = 0;
          }
          else {
            unsigned __int8 v53 = [v38 isActive];
          }
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ams_altDSID"));
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pbd_localOverrideNameForItunesAltDSID:", v54));

          dispatch_group_enter(v37);
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472LL;
          v78[2] = sub_1000D302C;
          v78[3] = &unk_1003D5D00;
          id v79 = v74;
          objc_super v80 = v38;
          unsigned __int8 v84 = v53;
          v83 = &v101;
          id v43 = v55;
          id v81 = v43;
          v82 = v37;
          [a1 _createGuestPersonaWithCompletionHandler:v78];

          id v45 = v79;
        }
      }

      id v67 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
    }

    while (v67);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  __int128 v57 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D31A8;
  block[3] = &unk_1003D2560;
  id v76 = v74;
  id v77 = v63;
  id v58 = v74;
  id v59 = v63;
  dispatch_group_notify(v37, v57, block);

  _Block_object_dispose(&v101, 8);
}

- (void)_handleUserProfileAccountNotification:(id)a3
{
  id v5 = a3;
  id v6 = sub_100084680();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received handle user profile account notification request. {notification=%@}",  buf,  0xCu);
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D4134;
  block[3] = &unk_1003D1718;
  id v11 = v5;
  SEL v12 = a2;
  void block[4] = self;
  id v9 = v5;
  dispatch_async(workQueue, block);
}

+ (void)_createGuestPersonaWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027E810();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x1000D8D88LL);
  }

  id v4 = v3;
  id v5 = sub_100084680();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = sub_100084680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "create guest persona",  "",  buf,  2u);
  }

  id v11 = sub_100084680();
  SEL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating guest persona.", buf, 2u);
  }

  uint64_t v21 = kUMUserPersonaTypeKey;
  id v22 = &off_1003FDB18;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000D8D90;
  v17[3] = &unk_1003D6040;
  id v18 = v4;
  os_signpost_id_t v19 = v7;
  id v15 = v4;
  [v14 createUserPersona:v13 passcodeData:0 completionHandler:v17];
}

+ (unint64_t)_maxNumberOfUsers
{
  return 15LL;
}

+ (unint64_t)_maxNumberOfGuestUsers
{
  return 14LL;
}

- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4
{
  dateLastSystemWake = self->_dateLastSystemWake;
  self->_dateLastSystemWake = 0LL;
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(void))a5;
  self->_shouldPresentAutomaticWelcomeBackBulletin = 1;
  -[PBBulletinPausedAssertion invalidate](self->_pauseBulletinsAssertion, "invalidate");
  if ((id)-[PBPresentationElementFocusCoordinator activeLayoutLevel]( self->_presentationElementFocusCoordinator,  "activeLayoutLevel") == (id)22)
  {
    os_signpost_id_t v7 = -[PBBulletinPausedAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBBulletinPausedAssertion),  "initWithReason:",  @"WelcomeBack");
    pauseBulletinsAssertion = self->_pauseBulletinsAssertion;
    self->_pauseBulletinsAssertion = v7;
  }

  v6[2](v6);
}

- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
  id v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now", a3, a4));
  dateLastSystemWake = self->_dateLastSystemWake;
  self->_dateLastSystemWake = v5;
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  id v8 = a3;
  id v9 = sub_100084680();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10027EDAC();
  }

  if (a5 == 22 && self->_shouldPresentAutomaticWelcomeBackBulletin)
  {
    id v11 = sub_100084680();
    SEL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "The hot black window was dismissed. Scheduling automatic welcome back bulletin delay timer.",  (uint8_t *)buf,  2u);
    }

    self->_shouldPresentAutomaticWelcomeBackBulletin = 0;
    objc_initWeak(buf, self);
    -[NSTimer invalidate](self->_automaticWelcomeBackBulletinDelayTimer, "invalidate");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000DB958;
    v20[3] = &unk_1003D17D0;
    objc_copyWeak(&v21, buf);
    __int16 v13 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v20,  2.0));
    automaticWelcomeBackBulletinDelayTimer = self->_automaticWelcomeBackBulletinDelayTimer;
    self->_automaticWelcomeBackBulletinDelayTimer = v13;

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }

  if (a4 == 12)
  {
    id v15 = sub_100084680();
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "The control center window was presented. Cleaning up welcome back bulletin.",  (uint8_t *)buf,  2u);
    }

    -[NSTimer invalidate](self->_automaticWelcomeBackBulletinDelayTimer, "invalidate");
    id v17 = self->_automaticWelcomeBackBulletinDelayTimer;
    self->_automaticWelcomeBackBulletinDelayTimer = 0LL;

    workQueue = (dispatch_queue_s *)self->_workQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000DBA3C;
    v19[3] = &unk_1003CFF08;
    v19[4] = self;
    dispatch_sync(workQueue, v19);
  }
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000DBB20;
  v9[3] = &unk_1003CFEB8;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_sync(workQueue, v9);
}

- (void)userProfileStore:(id)a3 didChangeSelectedUserProfile:(id)a4 previousSelectedUserProfile:(id)a5
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DBC00;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)userProfileStore:(id)a3 didUpdateiTunesForSelectedUserProfile:(id)a4
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end