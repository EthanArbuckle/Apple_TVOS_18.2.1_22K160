@interface TVSettingsUserProfilesViewController
+ (id)_addGuestUserDeepLinkKey;
+ (id)_addPrimaryUserDeepLinkKey;
+ (id)_addUserDeepLinkKeyForSuggestedUser:(id)a3;
+ (id)_deepLinkKeyForUser:(id)a3;
- (BOOL)_isLanguage:(id)a3 equivalentTo:(id)a4;
- (BOOL)_isRMVEnabledInHome:(id)a3 homeUserInfo:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldHideExpanse;
- (NSURL)lastDeepLinkURL;
- (TVSUIUserPickerSelectedUserController)selectedUserController;
- (TVSettingsHomeSetupController)homeSetupController;
- (TVSettingsIMAccountsFacade)imAccountsFacade;
- (TVSettingsITMSSandboxFacade)sandboxFacade;
- (TVSettingsTapToAddUserResult)tapToAddResult;
- (TVSettingsUserProfileListFacade)userProfilesFacade;
- (TVSettingsUserProfilesViewController)initWithUserProfilesFacade:(id)a3;
- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)tapToAddUserPresenter;
- (id)_addGuestUserGroup;
- (id)_appleConnect;
- (id)_currentUserGroup;
- (id)_deviceAccountsGroup;
- (id)_guestUsersGroup;
- (id)_location;
- (id)_primaryUserGroup;
- (id)_sandboxAccount;
- (id)_suggestedUserGroup;
- (id)loadSettingGroups;
- (void)_addGuestUser:(id)a3;
- (void)_addPrimaryUser:(id)a3;
- (void)_addSuggestedUser:(id)a3;
- (void)_addUserWithProfileType:(int64_t)a3;
- (void)_checkLanguageListForUserProfile:(id)a3;
- (void)_finishTapToAddUserWithState:(int64_t)a3;
- (void)_handleSeedRecognizer:(id)a3;
- (void)_menuPressed:(id)a3;
- (void)_promptPrimaryLanguage:(id)a3 orOtherLanguage:(id)a4 forUserProfile:(id)a5;
- (void)_promptRMVForUserProfile:(id)a3 completion:(id)a4;
- (void)_promptRecognizeUserForUserProfile:(id)a3 isVoiceProfileAvailable:(BOOL)a4 isHomeRMVEnabled:(BOOL)a5;
- (void)_signIntoSandboxAccount:(id)a3;
- (void)_signOutSandboxAccount:(id)a3;
- (void)_startTapToAddFlowWithPresenter:(id)a3;
- (void)_startTapToAddFlowWithPresenter:(id)a3 suggestedUser:(id)a4;
- (void)_switchUser:(id)a3;
- (void)_toggleExpanse:(id)a3;
- (void)setHomeSetupController:(id)a3;
- (void)setImAccountsFacade:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setSandboxFacade:(id)a3;
- (void)setSelectedUserController:(id)a3;
- (void)setTapToAddResult:(id)a3;
- (void)setTapToAddUserPresenter:(id)a3;
- (void)setUserProfilesFacade:(id)a3;
- (void)tapToAddUserPresenter:(id)a3 didFinishWithResult:(id)a4;
- (void)tapToAddUserPresenter:(id)a3 finishHomeKitSetupWithResult:(id)a4;
- (void)tapToAddUserPresenterDidDismiss:(id)a3;
- (void)tapToAddUserPresenterDidSuppressSuggestion:(id)a3;
- (void)tapToAddUserPresenterManualSignInTriggered:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsUserProfilesViewController

- (TVSettingsUserProfilesViewController)initWithUserProfilesFacade:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilesViewController;
  v6 = -[TVSettingsUserProfilesViewController initWithStyle:](&v13, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userProfilesFacade, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSettingsITMSSandboxFacade);
    sandboxFacade = v7->_sandboxFacade;
    v7->_sandboxFacade = v8;

    v10 = -[TVSettingsIMAccountsFacade initWithUserProfilesFacade:]( objc_alloc(&OBJC_CLASS___TVSettingsIMAccountsFacade),  "initWithUserProfilesFacade:",  v5);
    imAccountsFacade = v7->_imAccountsFacade;
    v7->_imAccountsFacade = v10;
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilesViewController;
  -[TVSettingsUserProfilesViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AEB60);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  id v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleSeedRecognizer:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1001AEB78);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 4LL);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &__NSArray0__struct);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController tableView](self, "tableView"));
  [v6 addGestureRecognizer:v5];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _currentUserGroup](self, "_currentUserGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _primaryUserGroup](self, "_primaryUserGroup", v3));
  v14[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _guestUsersGroup](self, "_guestUsersGroup"));
  v14[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _suggestedUserGroup](self, "_suggestedUserGroup"));
  v14[3] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _addGuestUserGroup](self, "_addGuestUserGroup"));
  v14[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _deviceAccountsGroup](self, "_deviceAccountsGroup"));
  v14[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _appleConnect](self, "_appleConnect"));
  v14[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _sandboxAccount](self, "_sandboxAccount"));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController _location](self, "_location"));
  v14[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 9LL));

  return v12;
}

- (void)tapToAddUserPresenterManualSignInTriggered:(id)a3
{
  id v4 = [a3 userType];
  if (!v4 || v4 == (id)2)
  {
    -[TVSettingsUserProfileListFacade addGuestUserWithPresentingViewController:]( self->_userProfilesFacade,  "addGuestUserWithPresentingViewController:",  self);
  }

  else if (v4 == (id)1)
  {
    -[TVSettingsUserProfileListFacade addPrimaryUserWithPresentingViewController:]( self->_userProfilesFacade,  "addPrimaryUserWithPresentingViewController:",  self);
  }

- (void)tapToAddUserPresenter:(id)a3 didFinishWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tapToAddResult)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_tapToAddResult == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7090();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100028EF8LL);
  }

  objc_storeStrong((id *)&self->_tapToAddResult, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 home]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hmHome]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 homeUserInfo]);
  unsigned int v13 = -[TVSettingsUserProfilesViewController _isRMVEnabledInHome:homeUserInfo:]( self,  "_isRMVEnabledInHome:homeUserInfo:",  v11,  v12);

  id v14 = sub_100028F00();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfile]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfile]);
    unsigned int v19 = [v7 isVoiceProfileAvailable];
    id v22 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
    *(_DWORD *)buf = 138544386;
    v24 = v17;
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 1024;
    unsigned int v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 1024;
    unsigned int v32 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Tap to add user finished. {userIdentifier = %{public}@, userProfile = %@, isVoiceProfileAvailable = %d,  homeUniqu eIdentifier = %@, isHomeRMVEnabled = %d}",  buf,  0x2Cu);

    id v6 = v22;
  }

  -[TVSettingsUserProfilesViewController _finishTapToAddUserWithState:](self, "_finishTapToAddUserWithState:", 0LL);
}

- (void)tapToAddUserPresenter:(id)a3 finishHomeKitSetupWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___TVSettingsHomeSetupController);
  homeSetupController = self->_homeSetupController;
  self->_homeSetupController = v8;

  id v10 = sub_100028F00();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfile]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfile]);
    *(_DWORD *)buf = 138543874;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = [v7 isVoiceProfileAvailable];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Tap to add user finished with HomeKit setup needed. {userIdentifier = %{public}@, userProfile = %@, isVoiceProfileAvailable = %d}",  buf,  0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v15 = self->_homeSetupController;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  unsigned int v19 = sub_100029140;
  v20 = &unk_10018E568;
  objc_copyWeak(&v22, (id *)buf);
  id v16 = v7;
  id v21 = v16;
  -[TVSettingsHomeSetupController setCompletionHandler:](v15, "setCompletionHandler:", &v17);
  -[TVSettingsHomeSetupController pushRoomPickerFromInitialViewController:]( self->_homeSetupController,  "pushRoomPickerFromInitialViewController:",  self,  v17,  v18,  v19,  v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)tapToAddUserPresenterDidSuppressSuggestion:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController userProfilesFacade](self, "userProfilesFacade"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 suggestedUserIdentifier]);

  [v6 suppressSuggestedUserWithIdentifier:v5];
}

- (void)tapToAddUserPresenterDidDismiss:(id)a3
{
  id v4 = (_TtC10TVSettings31TVSettingsTapToAddUserPresenter *)a3;
  if (self->_tapToAddUserPresenter == v4)
  {
    self->_tapToAddUserPresenter = 0LL;
    id v5 = v4;

    id v4 = v5;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return !-[TVSettingsUserProfileListFacade isAddingAnyUser](self->_userProfilesFacade, "isAddingAnyUser", a3);
}

- (id)_currentUserGroup
{
  v3 = self->_userProfilesFacade;
  uint64_t v4 = TSKLocString(@"AccountsCurrentUserTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  @"selectedUser",  self,  "_switchUser:"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000294CC;
  v11[3] = &unk_10018F7A0;
  v12 = v3;
  id v7 = v3;
  [v6 setUpdateBlock:v11];
  unsigned int v13 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  return v9;
}

- (id)_primaryUserGroup
{
  v3 = self->_userProfilesFacade;
  uint64_t v4 = TSKFeatureLocString("TVApp", "testarossa", @"AccountsDefaultUserProfileDescription");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000297C8;
  v27[3] = &unk_10018EC30;
  id v6 = v3;
  unsigned int v28 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  v5,  v6,  @"primaryUser.name",  v27));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002981C;
  v25[3] = &unk_10018E608;
  v8 = v6;
  v26 = v8;
  [v7 setUpdateBlock:v25];
  uint64_t v9 = TSKLocString(@"AccountsUserProfilesAddPrimaryUserTitle");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKFeatureLocString("TVApp", "testarossa", @"AccountsAddDefaultUserProfileDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  v12,  v8,  @"isAddingPrimaryUser",  self,  "_addPrimaryUser:"));

  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_1000298D8;
  v23 = &unk_10018F7C8;
  v24 = v8;
  id v14 = v8;
  [v13 setUpdateBlock:&v20];
  uint64_t v15 = TSKLocString(@"AccountsUserProfilesPrimaryUserGroupTitle");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v29[0] = v7;
  v29[1] = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v29,  2LL,  v20,  v21,  v22,  v23));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v16,  v17));

  return v18;
}

- (id)_guestUsersGroup
{
  v2 = self->_userProfilesFacade;
  uint64_t v3 = TSKLocString(@"AccountsUserProfilesGuestUsersGroupTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100029AAC;
  v8[3] = &unk_10018F818;
  uint64_t v9 = v2;
  id v5 = v2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  v5,  @"guestUsers",  v8));

  return v6;
}

- (id)_suggestedUserGroup
{
  uint64_t v3 = self->_userProfilesFacade;
  objc_initWeak(&location, self);
  uint64_t v4 = TSKLocString(@"AccountsSuggestedUserProfilesSectionTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100029E48;
  v9[3] = &unk_10018F868;
  objc_copyWeak(&v11, &location);
  id v6 = v3;
  id v10 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  v6,  @"suggestedUsers",  v9));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_addGuestUserGroup
{
  uint64_t v3 = self->_userProfilesFacade;
  uint64_t v4 = TSKLocString(@"AccountsAddNewUserTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = TSKFeatureLocString("TVApp", "testarossa", @"AccountsAddAdditionalUserProfileDescription");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  v7,  v3,  @"isAddingGuestUser",  self,  "_addGuestUser:"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002A184;
  v16[3] = &unk_10018F7C8;
  uint64_t v9 = v3;
  v17 = v9;
  [v8 setUpdateBlock:v16];
  uint64_t v18 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v10));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002A2D0;
  v14[3] = &unk_10018E608;
  uint64_t v15 = v9;
  v12 = v9;
  [v11 setUpdateBlock:v14];

  return v11;
}

- (id)_deviceAccountsGroup
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/" stringByAppendingPathComponent:@"System/Library/PreferenceBundles/VideoSubscriberAccountSettings.bundle"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v7));

    [v8 setDeepLinkKey:@"TV_PROVIDER"];
    [v8 setUpdateBlock:&stru_10018F888];
    [v8 _preloadViewController];
    -[NSMutableArray addObject:](v3, "addObject:", v8);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:@"/System/Library/PreferenceBundles/TVHomeSharingAccountSettings.bundle"];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/TVHomeSharingAccountSettings.bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v11));

    [v12 _preloadViewController];
    -[NSMutableArray addObject:](v3, "addObject:", v12);
  }

  objc_initWeak(&location, self);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  @"SharePlay",  @"Allow SharePlay sessions using your iCloud account on your Apple TV.",  self->_imAccountsFacade,  @"faceTimeEnabled",  self,  "_toggleExpanse:"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v13 setLocalizedValueFormatter:v14];

  objc_msgSend( v13,  "setEnabled:",  -[TVSettingsIMAccountsFacade isExpanseSupported](self->_imAccountsFacade, "isExpanseSupported"));
  objc_msgSend( v13,  "setHidden:",  -[TVSettingsUserProfilesViewController shouldHideExpanse](self, "shouldHideExpanse") ^ 1);
  unsigned int v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = sub_10002A668;
  id v22 = &unk_10018E9B0;
  objc_copyWeak(&v23, &location);
  [v13 setUpdateBlock:&v19];
  -[NSMutableArray addObject:](v3, "addObject:", v13, v19, v20, v21, v22);
  uint64_t v15 = TSKLocString(@"AccountsDeviceAccountsSectionTitle");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v16,  v3));

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_toggleExpanse:(id)a3
{
}

- (void)_switchUser:(id)a3
{
  if (!self->_selectedUserController)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___TVSUIUserPickerSelectedUserController);
    selectedUserController = self->_selectedUserController;
    self->_selectedUserController = v4;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[TVSUIUserPickerViewControllerConfiguration defaultConfiguration]( &OBJC_CLASS___TVSUIUserPickerViewControllerConfiguration,  "defaultConfiguration",  a3));
  uint64_t v6 = TSKLocString(@"AccountsCurrentUserSwitchUserTitle");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v9 setTitle:v7];

  id v8 = [[TVSUIUserPickerViewController alloc] initWithConfiguration:v9 dataSource:self->_selectedUserController];
  [v8 setDelegate:self->_selectedUserController];
  -[TVSettingsUserProfilesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
}

- (void)_addPrimaryUser:(id)a3
{
}

- (void)_addGuestUser:(id)a3
{
}

- (void)_addSuggestedUser:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = objc_alloc(&OBJC_CLASS____TtC10TVSettings31TVSettingsTapToAddUserPresenter);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 shortName]);
  id v7 = -[TVSettingsTapToAddUserPresenter initWithSuggestedUserIdentifier:suggestedUserShortName:]( v4,  "initWithSuggestedUserIdentifier:suggestedUserShortName:",  v5,  v6);

  -[TVSettingsUserProfilesViewController _startTapToAddFlowWithPresenter:suggestedUser:]( self,  "_startTapToAddFlowWithPresenter:suggestedUser:",  v7,  v8);
}

- (void)_addUserWithProfileType:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  if ([v5 containsString:@"root=TAP_TO_ADD_NEW_USER"])
  {
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
    unsigned int v7 = [v6 containsString:@"root=TAP_TO_ADD_NEW_GUEST_USER"];

    if (!v7)
    {
      uint64_t v9 = 1LL;
      if (!a3) {
        goto LABEL_7;
      }
LABEL_8:
      id v23 = -[TVSettingsTapToAddUserPresenter initWithUserType:allowsManualSignIn:]( objc_alloc(&OBJC_CLASS____TtC10TVSettings31TVSettingsTapToAddUserPresenter),  "initWithUserType:allowsManualSignIn:",  a3,  v9);
      -[TVSettingsUserProfilesViewController _startTapToAddFlowWithPresenter:]( self,  "_startTapToAddFlowWithPresenter:",  v23);

      return;
    }
  }

  lastDeepLinkURL = self->_lastDeepLinkURL;
  self->_lastDeepLinkURL = 0LL;

  uint64_t v9 = 0LL;
  if (a3) {
    goto LABEL_8;
  }
LABEL_7:
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](self->_userProfilesFacade, "primaryUser"));

  if (v10) {
    goto LABEL_8;
  }
  uint64_t v11 = TSKLocString(@"AccountsUserProfilesAddGuestConfirmationTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = TSKLocString(@"AccountsUserProfilesAddGuestConfirmationMessage");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v14,  1LL));

  uint64_t v16 = TSKLocString(@"AccountsUserProfilesAddGuestConfirmationContinueAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10002ABB8;
  v26[3] = &unk_10018F8B0;
  char v27 = v9;
  v26[4] = self;
  v26[5] = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v26));
  [v15 addAction:v18];

  uint64_t v19 = TSKLocString(@"AccountsUserProfilesAddGuestConfirmationAddDefaultInsteadAction");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002AC08;
  v24[3] = &unk_10018F8D8;
  char v25 = v9;
  v24[4] = self;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  0LL,  v24));

  [v15 addAction:v21];
  [v15 setPreferredAction:v21];
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v15 addAction:v22];

  -[TVSettingsUserProfilesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
}

- (void)_startTapToAddFlowWithPresenter:(id)a3
{
}

- (void)_startTapToAddFlowWithPresenter:(id)a3 suggestedUser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone"))
  {
    id v9 = sub_100028F00();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Running AppleIDSetup flow.", v13, 2u);
    }

    id v11 = [v7 userType];
    if (v11)
    {
      if (v11 == (id)2)
      {
        -[TVSettingsUserProfileListFacade addGuestUserWithSuggestedUser:presentingViewController:]( self->_userProfilesFacade,  "addGuestUserWithSuggestedUser:presentingViewController:",  v8,  self);
      }

      else if (v11 == (id)1)
      {
        -[TVSettingsUserProfileListFacade addPrimaryUserWithPresentingViewController:]( self->_userProfilesFacade,  "addPrimaryUserWithPresentingViewController:",  self);
      }
    }

    else
    {
      -[TVSettingsUserProfileListFacade addGuestUserWithPresentingViewController:]( self->_userProfilesFacade,  "addGuestUserWithPresentingViewController:",  self);
    }

    goto LABEL_12;
  }

  if (!self->_tapToAddResult)
  {
    -[TVSettingsTapToAddUserPresenter stopFlow](self->_tapToAddUserPresenter, "stopFlow");
    [v7 setDelegate:self];
    [v7 startFlowWithPresentingViewController:self];
    objc_storeStrong((id *)&self->_tapToAddUserPresenter, a3);
LABEL_12:

    return;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempted to start Tap To Add new user with leftover results from previous session."));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000F7138();
  }
  _bs_set_crash_log_message([v12 UTF8String]);
  __break(0);
}

- (void)_menuPressed:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController navigationController](self, "navigationController", a3));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (id)_appleConnect
{
  uint64_t v3 = TSKLocString(@"AccountsAppleConnectSettingsTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v4,  0LL,  self->_userProfilesFacade,  @"hideAppleConnectItem",  objc_opt_class(&OBJC_CLASS___TVSettingsAppleConnectSettingsViewController));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  [v6 setUpdateBlock:&stru_10018F8F8];
  id v7 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  unsigned int v10 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[TSKSettingGroup setSettingItems:](v7, "setSettingItems:", v8);

  return v7;
}

- (void)_handleSeedRecognizer:(id)a3
{
}

- (id)_sandboxAccount
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"iTMSSandboxAccountHeaderTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  uint64_t v7 = TSKLocString(@"iTMSSandboxAccountDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TSKSettingGroup setLocalizedDescription:](v6, "setLocalizedDescription:", v8);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002B31C;
  v19[3] = &unk_10018E9B0;
  objc_copyWeak(&v20, &location);
  -[TSKSettingGroup setUpdateBlock:](v6, "setUpdateBlock:", v19);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  0LL,  0LL,  self->_sandboxFacade,  @"sandboxAccount",  self,  "_signOutSandboxAccount:"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002B3B0;
  v17[3] = &unk_10018F920;
  objc_copyWeak(&v18, &location);
  [v9 setUpdateBlock:v17];
  uint64_t v10 = TSKLocString(@"iTMSSignInTitle");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  self->_sandboxFacade,  @"isAuthenticationInProgress",  self,  "_signIntoSandboxAccount:"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002B4E8;
  v15[3] = &unk_10018EA00;
  objc_copyWeak(&v16, &location);
  [v12 setUpdateBlock:v15];
  v22[0] = v9;
  v22[1] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_signIntoSandboxAccount:(id)a3
{
}

- (void)_signOutSandboxAccount:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsITMSSandboxFacade sandboxAccount](self->_sandboxFacade, "sandboxAccount", a3));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

  uint64_t v5 = TSKLocString(@"AccountsSandboxDeleteMessage");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v22));

  uint64_t v8 = TSKLocString(@"AccountsSandboxDeleteTitle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v7,  1LL));

  id v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = TSKLocStringFromBundleCachingKey(@"SettingsCancel", v12, 0LL, 0LL, @"Localizable");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));

  id v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = TSKLocStringFromBundleCachingKey(@"SettingsDelete", v17, 0LL, 0LL, @"Localizable");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10002B82C;
  v23[3] = &unk_10018F018;
  v23[4] = self;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  2LL,  v23));

  [v10 addAction:v15];
  [v10 addAction:v20];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController navigationController](self, "navigationController"));
  [v21 presentViewController:v10 animated:1 completion:0];
}

- (id)_location
{
  v2 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v3 = TSKLocString(@"iTMSAccountsLocationSectionTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = -[TSKSettingGroup initWithTitle:](v2, "initWithTitle:", v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
  uint64_t v7 = TSKLocString(@"iTMSLocationTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v8,  0LL,  v6,  @"locale",  objc_opt_class(&OBJC_CLASS___TVSettingsLocationViewController));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002BA74;
  v16[3] = &unk_10018E608;
  id v11 = v6;
  id v17 = v11;
  [v10 setUpdateBlock:v16];
  uint64_t v19 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  -[TSKSettingGroup setSettingItems:](v5, "setSettingItems:", v12);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002BB8C;
  v14[3] = &unk_10018E9B0;
  objc_copyWeak(&v15, &location);
  -[TSKSettingGroup setUpdateBlock:](v5, "setUpdateBlock:", v14);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v5;
}

+ (id)_deepLinkKeyForUser:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfile]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifiers]);

  if (v4)
  {
    id v6 = objc_alloc(&OBJC_CLASS___TSKBlockDeepLinkKey);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002BCF0;
    v9[3] = &unk_10018F948;
    id v10 = v4;
    id v11 = v5;
    id v7 = [v6 initWithPredicate:v9];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)_addPrimaryUserDeepLinkKey
{
  return [[TSKBlockDeepLinkKey alloc] initWithPredicate:&stru_10018F988];
}

+ (id)_addGuestUserDeepLinkKey
{
  return [[TSKBlockDeepLinkKey alloc] initWithPredicate:&stru_10018F9A8];
}

+ (id)_addUserDeepLinkKeyForSuggestedUser:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v4 = [v3 copy];

  id v5 = objc_alloc(&OBJC_CLASS___TSKBlockDeepLinkKey);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002C04C;
  v9[3] = &unk_10018F9D0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithPredicate:v9];

  return v7;
}

- (BOOL)shouldHideExpanse
{
  if ((_os_feature_enabled_impl("TelephonyUtilities", "aTVHandoff") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilesViewController imAccountsFacade](self, "imAccountsFacade"));
    unsigned int v3 = [v4 isExpanseSupported] ^ 1;
  }

  return v3;
}

- (void)_finishTapToAddUserWithState:(int64_t)a3
{
  if (a3 == 2)
  {
    tapToAddResult = self->_tapToAddResult;
    self->_tapToAddResult = 0LL;

    id v8 = sub_100028F00();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "New user added – Completed post-processing",  v17,  2u);
    }
  }

  else if (a3 == 1)
  {
    id v9 = sub_100028F00();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "New user added – Prompting for RMV",  v18,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localAccessory]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 home]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 hmHome]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToAddUserResult homeUserInfo](self->_tapToAddResult, "homeUserInfo"));
    BOOL v15 = -[TVSettingsUserProfilesViewController _isRMVEnabledInHome:homeUserInfo:]( self,  "_isRMVEnabledInHome:homeUserInfo:",  v6,  v14);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToAddUserResult userProfile](self->_tapToAddResult, "userProfile"));
    -[TVSettingsUserProfilesViewController _promptRecognizeUserForUserProfile:isVoiceProfileAvailable:isHomeRMVEnabled:]( self,  "_promptRecognizeUserForUserProfile:isVoiceProfileAvailable:isHomeRMVEnabled:",  v16,  -[TVSettingsTapToAddUserResult isVoiceProfileAvailable](self->_tapToAddResult, "isVoiceProfileAvailable"),  v15);
  }

  else
  {
    if (a3) {
      return;
    }
    id v4 = sub_100028F00();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "New user added – Checking language selection",  buf,  2u);
    }

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToAddUserResult userProfile](self->_tapToAddResult, "userProfile"));
    -[TVSettingsUserProfilesViewController _checkLanguageListForUserProfile:]( self,  "_checkLanguageListForUserProfile:",  v6);
  }
}

- (BOOL)_isLanguage:(id)a3 equivalentTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"languageCode1 != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F71E0();
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x10002C530LL);
  }

  id v7 = v6;
  if (!v6)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"languageCode2 != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7288();
    }
    _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
    JUMPOUT(0x10002C594LL);
  }

  if (([v5 isEqual:v6] & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale relatedLanguagesForLanguage:]( NSLocale,  "relatedLanguagesForLanguage:",  v5)),  unsigned __int8 v9 = [v8 containsObject:v7],  v8,  (v9 & 1) != 0))
  {
    unsigned int v10 = 1;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale baseLanguageFromLanguage:](&OBJC_CLASS___NSLocale, "baseLanguageFromLanguage:", v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale baseLanguageFromLanguage:](&OBJC_CLASS___NSLocale, "baseLanguageFromLanguage:", v7));
    unsigned int v10 = [v11 isEqual:v12];
  }

  id v13 = sub_100028F00();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = @"not ";
    *(_DWORD *)buf = 138543874;
    id v20 = v5;
    if (v10) {
      BOOL v15 = &stru_100195DD8;
    }
    __int16 v21 = 2112;
    id v22 = v15;
    __int16 v23 = 2114;
    v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ is %@considered equivalent to %{public}@",  buf,  0x20u);
  }

  return v10;
}

- (void)_checkLanguageListForUserProfile:(id)a3
{
  id v4 = a3;
  id v5 = self->_userProfilesFacade;
  id v6 = [v4 type];
  id v7 = sub_100028F00();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 == (id)1)
  {
    if (v9)
    {
      LOWORD(v30) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Checking languages for new guest user",  (uint8_t *)&v30,  2u);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](v5, "primaryUser"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userProfile]);

    if (v13
      && (id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredLanguages]),
          v14,
          v14))
    {
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredLanguages]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 firstObject]);

      id v17 = @"primary user";
      id v11 = (void *)v16;
    }

    else
    {
      id v17 = @"device";
    }

    id v18 = sub_100028F00();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138543618;
      __int16 v31 = v17;
      __int16 v32 = 2114;
      v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Preferred language for %{public}@ is %{public}@",  (uint8_t *)&v30,  0x16u);
    }

    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 preferredLanguages]);
    id v21 = sub_100028F00();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138543362;
      __int16 v31 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Checking against {newUserLanauges=%{public}@}",  (uint8_t *)&v30,  0xCu);
    }

    if (-[__CFString count](v20, "count")) {
      id v23 = (id)objc_claimAutoreleasedReturnValue(-[__CFString firstObject](v20, "firstObject"));
    }
    else {
      id v23 = v11;
    }
    v24 = v23;
    unsigned int v25 = -[TVSettingsUserProfilesViewController _isLanguage:equivalentTo:](self, "_isLanguage:equivalentTo:", v11, v23);
    id v26 = sub_100028F00();
    char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v28)
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "No need to ask new user about preferred language",  (uint8_t *)&v30,  2u);
      }

      -[TVSettingsUserProfilesViewController _finishTapToAddUserWithState:](self, "_finishTapToAddUserWithState:", 1LL);
    }

    else
    {
      if (v28)
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Ask new user about preferred language",  (uint8_t *)&v30,  2u);
      }

      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToAddUserResult userProfile](self->_tapToAddResult, "userProfile"));
      -[TVSettingsUserProfilesViewController _promptPrimaryLanguage:orOtherLanguage:forUserProfile:]( self,  "_promptPrimaryLanguage:orOtherLanguage:forUserProfile:",  v11,  v24,  v29);
    }
  }

  else
  {
    if (v9)
    {
      LOWORD(v30) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No need to check languages for primary user",  (uint8_t *)&v30,  2u);
    }

    -[TVSettingsUserProfilesViewController _finishTapToAddUserWithState:](self, "_finishTapToAddUserWithState:", 1LL);
  }
}

- (void)_promptPrimaryLanguage:(id)a3 orOtherLanguage:(id)a4 forUserProfile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"deviceLanguage != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7330(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x10002CDB0LL);
  }

  if (!v10)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"otherLanguage != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F73E0(a2);
    }
    goto LABEL_9;
  }

  v12 = v11;
  objc_initWeak(location, self);
  id v13 = objc_alloc(&OBJC_CLASS___TVCSPreferredLanguagesManager);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredLanguages]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredInputModes]);
  uint64_t v16 = -[TVCSPreferredLanguagesManager initWithLanguages:inputModes:updateFromPreferences:]( v13,  "initWithLanguages:inputModes:updateFromPreferences:",  v14,  v15,  0LL);

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10002CE60;
  v52[3] = &unk_10018FA20;
  objc_copyWeak(&v56, location);
  id v17 = v16;
  v53 = v17;
  id v18 = v9;
  id v54 = v18;
  id v19 = v12;
  id v55 = v19;
  v44 = objc_retainBlock(v52);
  id v20 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountInfo);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v22 = [v20 initWithAccountStore:v21 userProfile:v19];

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 formattedShortName]);
  uint64_t v24 = TSKCompoundLocString(@"LanguageSelectTitle", v18, v10, @"\n");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v25 = TSKCompoundLocString(@"AccountsTapToAddUserChooseLanguageMessageFormat", v18, v10, @"\n\n");
  uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v23, v23));
  v42 = (void *)v26;
  v43 = (void *)v23;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization displayNameForLanguage:displayLanguage:]( &OBJC_CLASS___TVSInternationalization,  "displayNameForLanguage:displayLanguage:",  v18,  v18));
  uint64_t v27 = TSKLocStringForLanguage(@"LanguageAddNewLanguageActionChange", v18);
  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v28, v47));

  int v30 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization displayNameForLanguage:displayLanguage:]( &OBJC_CLASS___TVSInternationalization,  "displayNameForLanguage:displayLanguage:",  v10,  v10));
  v40 = v19;
  v41 = v17;
  uint64_t v31 = TSKLocStringForLanguage(@"LanguageAddNewLanguageActionChange", v10);
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v32, v30));

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v46,  v45,  1LL));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10002CFE4;
  v50[3] = &unk_10018FA48;
  v35 = v44;
  id v51 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  0LL,  v50));
  [v34 addAction:v36];

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10002CFF4;
  v48[3] = &unk_10018FA48;
  v37 = v35;
  id v49 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v33,  0LL,  v48));
  [v34 addAction:v38];

  -[TVSettingsUserProfilesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v34,  1LL,  0LL);
  objc_destroyWeak(&v56);

  objc_destroyWeak(location);
}

- (void)_promptRecognizeUserForUserProfile:(id)a3 isVoiceProfileAvailable:(BOOL)a4 isHomeRMVEnabled:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002D194;
  v16[3] = &unk_10018E810;
  objc_copyWeak(&v17, &location);
  id v9 = objc_retainBlock(v16);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 iCloudAltDSID]);

  if (v10 && v6 && !a5)
  {
    id v11 = sub_100028F00();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting RMV view controller.", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002D1C4;
    v13[3] = &unk_10018FA70;
    id v14 = v9;
    -[TVSettingsUserProfilesViewController _promptRMVForUserProfile:completion:]( self,  "_promptRMVForUserProfile:completion:",  v8,  v13);
  }

  else
  {
    ((void (*)(void *))v9[2])(v9);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_promptRMVForUserProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___TVSUIRecognizeMyVoiceViewController);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAltDSID]);
  id v10 = [v8 initWithiCloudAltDSID:v9];

  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002D420;
  v18[3] = &unk_10018FAC0;
  objc_copyWeak(&v20, &location);
  id v11 = v7;
  id v19 = v11;
  [v10 setSystemLanguageUnsupportedHandler:v18];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002D4BC;
  v15[3] = &unk_10018FB10;
  objc_copyWeak(&v17, &location);
  id v12 = v11;
  id v16 = v12;
  [v10 setCompletionHandler:v15];
  -[TVSettingsUserProfilesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  objc_msgSend(v13, "pbs_setRMVShownToUserWithIdentifier:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (BOOL)_isRMVEnabledInHome:(id)a3 homeUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeUniqueIdentifier", (void)v17));
          unsigned __int8 v15 = [v8 isEqual:v14];

          if ((v15 & 1) != 0)
          {
            LOBYTE(v10) = [v13 isRMVEnabled];
            goto LABEL_14;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (TVSettingsUserProfileListFacade)userProfilesFacade
{
  return self->_userProfilesFacade;
}

- (void)setUserProfilesFacade:(id)a3
{
}

- (TVSUIUserPickerSelectedUserController)selectedUserController
{
  return self->_selectedUserController;
}

- (void)setSelectedUserController:(id)a3
{
}

- (TVSettingsITMSSandboxFacade)sandboxFacade
{
  return self->_sandboxFacade;
}

- (void)setSandboxFacade:(id)a3
{
}

- (TVSettingsIMAccountsFacade)imAccountsFacade
{
  return self->_imAccountsFacade;
}

- (void)setImAccountsFacade:(id)a3
{
}

- (TVSettingsHomeSetupController)homeSetupController
{
  return self->_homeSetupController;
}

- (void)setHomeSetupController:(id)a3
{
}

- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)tapToAddUserPresenter
{
  return self->_tapToAddUserPresenter;
}

- (void)setTapToAddUserPresenter:(id)a3
{
}

- (TVSettingsTapToAddUserResult)tapToAddResult
{
  return self->_tapToAddResult;
}

- (void)setTapToAddResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end