@interface PBUserProfileManager
+ (PBDependencyDescription)dependencyDescription;
+ (PBUserProfileManager)sharedInstance;
- (BOOL)_hasActiveUserBulletin;
- (BOOL)_hasMultipleUsers;
- (NSString)_selectedUserProfileIdentifier;
- (NSString)description;
- (PBSUserProfilesSnapshot)userProfilesSnapshot;
- (PBUserProfileApplicationManager)userProfileApplicationManager;
- (PBUserProfileManagerServiceConfiguration)_serviceConfiguration;
- (_TtC9PineBoard25PBUserProfilePictureStore)profilePictureStore;
- (id)_init;
- (id)_makeUserProfileManagerWithWindowManager:(id)a3 userProfileApplicationManager:(id)a4 powerManager:(id)a5;
- (id)_welcomeBulletinProfilePictureDataForUserProfile:(id)a3;
- (void)_initializeWithWindowManager:(id)a3 powerManager:(id)a4;
- (void)_performBatchUpdatesUsingBlock:(id)a3 completion:(id)a4;
- (void)_removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sendDailyAnalyticsEvents;
- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5;
- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation PBUserProfileManager

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100109118;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBUserProfileManager;
  v2 = -[PBUserProfileManager init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v2->_observers;
    v2->_observers = v3;
  }

  return v2;
}

+ (PBUserProfileManager)sharedInstance
{
  if (qword_100470F08 != -1) {
    dispatch_once(&qword_100470F08, &stru_1003D7990);
  }
  return (PBUserProfileManager *)(id)qword_100470F00;
}

- (void)_initializeWithWindowManager:(id)a3 powerManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___PBUserProfileApplicationManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  v10 = -[PBUserProfileApplicationManager _initWithAppInfoStore:](v8, "_initWithAppInfoStore:", v9);

  v11 = (PBUserProfileManaging *)objc_claimAutoreleasedReturnValue( -[PBUserProfileManager _makeUserProfileManagerWithWindowManager:userProfileApplicationManager:powerManager:]( self,  "_makeUserProfileManagerWithWindowManager:userProfileApplicationManager:powerManager:",  v7,  v10,  v6));
  impl = self->_impl;
  self->_impl = v11;

  -[PBUserProfileManaging addObserver:](self->_impl, "addObserver:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManaging currentUserProfilesSnapshot](self->_impl, "currentUserProfilesSnapshot"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 selectedUserProfile]);
  -[PBUserProfileApplicationManager _processNewSelectedUserProfile:](v10, "_processNewSelectedUserProfile:", v14);

  userProfileApplicationManager = self->_userProfileApplicationManager;
  self->_userProfileApplicationManager = v10;
}

- (id)_makeUserProfileManagerWithWindowManager:(id)a3 userProfileApplicationManager:(id)a4 powerManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = _os_feature_enabled_impl("UserProfiles", "loreto");
  id v12 = sub_100084680();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Creating Loreto User Profile Manager",  buf,  2u);
    }

    v15 = objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManager);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 focusCoordinator]);

    v17 = -[PBLoretoUserProfileManager initWithUserProfileApplicationManager:presentationElementFocusCoordinator:powerManager:]( v15,  "initWithUserProfileApplicationManager:presentationElementFocusCoordinator:powerManager:",  v9,  v16,  v8);
    id v10 = (id)v16;
  }

  else
  {
    if (v14)
    {
      *(_WORD *)v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Creating Legacy User Profile Manager",  v21,  2u);
    }

    v18 = -[PBUserProfilePictureStore initWithProfileManager:]( objc_alloc(&OBJC_CLASS____TtC9PineBoard25PBUserProfilePictureStore),  "initWithProfileManager:",  self);
    profilePictureStore = self->_profilePictureStore;
    self->_profilePictureStore = v18;

    v17 = -[PBLegacyUserProfileManager initWithWindowManager:userProfileApplicationManager:powerManager:userProfilePictureStore:]( objc_alloc(&OBJC_CLASS___PBLegacyUserProfileManager),  "initWithWindowManager:userProfileApplicationManager:powerManager:userProfilePictureStore:",  v10,  v9,  v8,  self->_profilePictureStore);
  }

  return v17;
}

- (PBSUserProfilesSnapshot)userProfilesSnapshot
{
  return (PBSUserProfilesSnapshot *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManaging currentUserProfilesSnapshot]( self->_impl,  "currentUserProfilesSnapshot"));
}

- (void)addObserver:(id)a3
{
  id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
}

- (void)beginIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
}

- (void)endIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
}

- (void)sendDailyAnalyticsEvents
{
}

- (PBUserProfileManagerServiceConfiguration)_serviceConfiguration
{
  return (PBUserProfileManagerServiceConfiguration *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManaging serviceConfiguration]( self->_impl,  "serviceConfiguration"));
}

- (NSString)_selectedUserProfileIdentifier
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManaging selectedUserProfileIdentifier]( self->_impl,  "selectedUserProfileIdentifier"));
}

- (BOOL)_hasActiveUserBulletin
{
  return -[PBUserProfileManaging hasActiveUserBulletin](self->_impl, "hasActiveUserBulletin");
}

- (BOOL)_hasMultipleUsers
{
  return -[PBUserProfileManaging hasMultipleUsers](self->_impl, "hasMultipleUsers");
}

- (void)_removeAllIgnoringUserProfileAccountNotificationsWithReason:(id)a3
{
}

- (id)_welcomeBulletinProfilePictureDataForUserProfile:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManaging welcomeBulletinProfilePictureDataForUserProfile:]( self->_impl,  "welcomeBulletinProfilePictureDataForUserProfile:",  a3));
}

- (void)_performBatchUpdatesUsingBlock:(id)a3 completion:(id)a4
{
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  observers = self->_observers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001096FC;
  v4[3] = &unk_1003D79D8;
  v4[4] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v4);
}

- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4
{
  id v5 = a4;
  observers = self->_observers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001097BC;
  v8[3] = &unk_1003D7A00;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v8);
}

- (void)userProfileManager:(id)a3 didSwitchToUserWithIdentifier:(id)a4 previousUserIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  userProfileApplicationManager = self->_userProfileApplicationManager;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManaging currentUserProfilesSnapshot](self->_impl, "currentUserProfilesSnapshot"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 selectedUserProfile]);
  -[PBUserProfileApplicationManager _processNewSelectedUserProfile:]( userProfileApplicationManager,  "_processNewSelectedUserProfile:",  v11);

  observers = self->_observers;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001098E8;
  v15[3] = &unk_1003D7A28;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v15);
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[PBUserProfileManaging description](self->_impl, "description"));
}

- (_TtC9PineBoard25PBUserProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (PBUserProfileApplicationManager)userProfileApplicationManager
{
  return self->_userProfileApplicationManager;
}

- (void).cxx_destruct
{
}

@end