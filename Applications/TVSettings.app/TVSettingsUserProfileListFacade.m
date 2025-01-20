@interface TVSettingsUserProfileListFacade
- (BOOL)canAddNewGuestUser;
- (BOOL)canAddPrimaryUser;
- (BOOL)hideAppleConnectItem;
- (BOOL)isAddingAnyUser;
- (BOOL)isAddingGuestUser;
- (BOOL)isAddingPrimaryUser;
- (NSArray)allUsers;
- (NSArray)guestUsers;
- (NSArray)suggestedUsers;
- (TVSettingsUser)primaryUser;
- (TVSettingsUser)selectedUser;
- (TVSettingsUserProfileListFacade)init;
- (TVSettingsUserProfileListFacade)initWithFollowUpController:(id)a3;
- (void)addGuestUserWithPresentingViewController:(id)a3;
- (void)addGuestUserWithSuggestedUser:(id)a3 presentingViewController:(id)a4;
- (void)addPrimaryUserWithPresentingViewController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHideAppleConnectItem:(BOOL)a3;
- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5;
- (void)suggestedUserProfileManagerDidUpdate:(id)a3;
- (void)suppressSuggestedUserWithIdentifier:(id)a3;
- (void)switchSelectedUserToUser:(id)a3;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation TVSettingsUserProfileListFacade

- (TVSettingsUserProfileListFacade)initWithFollowUpController:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileListFacade;
  v6 = -[TVSettingsUserProfileListFacade init](&v20, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask bagSubProfile]( &OBJC_CLASS___AMSSyncPasswordSettingsTask,  "bagSubProfile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask bagSubProfileVersion]( &OBJC_CLASS___AMSSyncPasswordSettingsTask,  "bagSubProfileVersion"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v7, v8));
    amsBag = v6->_amsBag;
    v6->_amsBag = (AMSBag *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    profileManager = v6->_profileManager;
    v6->_profileManager = (PBSUserProfileManager *)v11;

    -[PBSUserProfileManager addObserver:](v6->_profileManager, "addObserver:", v6);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v6->_accountStore;
    v6->_accountStore = (ACAccountStore *)v13;

    objc_storeStrong((id *)&v6->_followUpController, a3);
    -[FLTVSettingsController addObserver:forKeyPath:options:context:]( v6->_followUpController,  "addObserver:forKeyPath:options:context:",  v6,  @"accountsItemsCount",  0LL,  off_1001E0010);
    sub_100096728((uint64_t)v6);
    v15 = objc_alloc_init(&OBJC_CLASS___PBSSuggestedUserProfileManager);
    suggestedUserProfileManager = v6->_suggestedUserProfileManager;
    v6->_suggestedUserProfileManager = v15;

    -[PBSSuggestedUserProfileManager addObserver:](v6->_suggestedUserProfileManager, "addObserver:", v6);
    sub_100096BB0((uint64_t)v6);
    v6->_hideAppleConnectItem = 1;
    v17 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfilesValidator);
    userProfilesValidator = v6->_userProfilesValidator;
    v6->_userProfilesValidator = v17;

    -[TVSettingsUserProfilesValidator setUserActionType:](v6->_userProfilesValidator, "setUserActionType:", 0LL);
  }

  return v6;
}

- (TVSettingsUserProfileListFacade)init
{
  return -[TVSettingsUserProfileListFacade initWithFollowUpController:](self, "initWithFollowUpController:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileListFacade;
  -[TVSettingsUserProfileListFacade dealloc](&v3, "dealloc");
}

- (NSArray)allUsers
{
  id v3 = -[NSArray mutableCopy](self->_guestUsers, "mutableCopy");
  v4 = v3;
  primaryUser = self->_primaryUser;
  if (primaryUser) {
    [v3 insertObject:primaryUser atIndex:0];
  }
  id v6 = [v4 copy];

  return (NSArray *)v6;
}

- (BOOL)isAddingPrimaryUser
{
  return self->_isAddingUser == 1;
}

- (BOOL)isAddingGuestUser
{
  return self->_isAddingUser == 2;
}

- (BOOL)isAddingAnyUser
{
  if (-[TVSettingsUserProfileListFacade isAddingPrimaryUser](self, "isAddingPrimaryUser")) {
    return 1;
  }
  else {
    return -[TVSettingsUserProfileListFacade isAddingGuestUser](self, "isAddingGuestUser");
  }
}

- (void)addPrimaryUserWithPresentingViewController:(id)a3
{
  if (!self->_isAddingUser)
  {
    id v4 = a3;
    sub_100096D28(self, 1LL);
    sub_100097068((uint64_t)self, 0LL, 0LL, v4);
  }

- (void)addGuestUserWithPresentingViewController:(id)a3
{
}

- (void)addGuestUserWithSuggestedUser:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isAddingUser)
  {
    sub_100096D28(self, 2LL);
    if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone"))
    {
      id v8 = sub_100097028();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Running AppleIDSetup add user flow.",  buf,  2u);
      }

      sub_100097068((uint64_t)self, (void *)1, v6, v7);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
      uint64_t v15 = kUMUserPersonaTypeKey;
      v16 = &off_1001AD578;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000973BC;
      v12[3] = &unk_100192988;
      v12[4] = self;
      id v13 = v7;
      [v10 createUserPersona:v11 passcodeData:0 completionHandler:v12];
    }
  }
}

- (void)switchSelectedUserToUser:(id)a3
{
  id v4 = a3;
  id v5 = sub_100097028();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade selectedUser](self, "selectedUser"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfile]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    __int16 v19 = 2114;
    objc_super v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Switching selected user. {currentUserIdentifier=%{public}@, newUserIdentifier=%{public}@}",  buf,  0x16u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfile]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100097A60;
  v15[3] = &unk_100191710;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v11 selectUserProfileWithIdentifier:v13 completionHandler:v15];
}

- (void)suppressSuggestedUserWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_100097028();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Suppressing Suggested User: {user=%{public}@}",  (uint8_t *)&v7,  0xCu);
  }

  -[PBSSuggestedUserProfileManager updateSuppressedForSuggestedUserWithIdentifier:suppressed:]( self->_suggestedUserProfileManager,  "updateSuppressedForSuggestedUserWithIdentifier:suppressed:",  v4,  1LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0010 == a6)
  {
    sub_100097C58((uint64_t)self);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileListFacade;
    -[TVSettingsUserProfileListFacade observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = sub_100097028();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000F9F78((uint64_t)self);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097EA4;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)suggestedUserProfileManagerDidUpdate:(id)a3
{
  id v4 = sub_100097028();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000FA00C((uint64_t)self);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097F3C;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100097FF0;
  v8[3] = &unk_1001929B0;
  id v9 = a4;
  id v10 = a5;
  id v6 = v9;
  id v7 = v10;
  +[TVSiCloudAccountManager presentTermsUIForAccount:completion:]( &OBJC_CLASS___TVSiCloudAccountManager,  "presentTermsUIForAccount:completion:",  v6,  v8);
}

- (TVSettingsUser)primaryUser
{
  return self->_primaryUser;
}

- (NSArray)guestUsers
{
  return self->_guestUsers;
}

- (NSArray)suggestedUsers
{
  return self->_suggestedUsers;
}

- (TVSettingsUser)selectedUser
{
  return self->_selectedUser;
}

- (BOOL)canAddPrimaryUser
{
  return self->_canAddPrimaryUser;
}

- (BOOL)canAddNewGuestUser
{
  return self->_canAddNewGuestUser;
}

- (BOOL)hideAppleConnectItem
{
  return self->_hideAppleConnectItem;
}

- (void)setHideAppleConnectItem:(BOOL)a3
{
  self->_hideAppleConnectItem = a3;
}

- (void).cxx_destruct
{
}

@end