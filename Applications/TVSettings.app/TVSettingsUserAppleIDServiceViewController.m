@interface TVSettingsUserAppleIDServiceViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (TVSettingsUser)user;
- (TVSettingsUserAppleIDServiceViewController)initWithUser:(id)a3 serviceType:(int64_t)a4;
- (TVSettingsUserProfileFacade)profileFacade;
- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)tapToRepairPresenter;
- (id)_appleIdOptions;
- (id)_gameCenterOptions;
- (id)loadSettingGroups;
- (int64_t)serviceType;
- (void)_menuPressed:(id)a3;
- (void)_presentGameCenterAboutFriends:(id)a3;
- (void)_signIn:(id)a3;
- (void)_signInManually;
- (void)_signOut:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setProfileFacade:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setTapToRepairPresenter:(id)a3;
- (void)setUser:(id)a3;
- (void)tapToRepairUserPresenterDidCancel:(id)a3;
- (void)tapToRepairUserPresenterDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsUserAppleIDServiceViewController

- (TVSettingsUserAppleIDServiceViewController)initWithUser:(id)a3 serviceType:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsUserAppleIDServiceViewController;
  v8 = -[TVSettingsUserAppleIDServiceViewController initWithStyle:](&v13, "initWithStyle:", 1LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a3);
    v9->_serviceType = a4;
    v10 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v7);
    profileFacade = v9->_profileFacade;
    v9->_profileFacade = v10;

    [v7 addObserver:v9 forKeyPath:@"name" options:5 context:off_1001DF880];
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsUserAppleIDServiceViewController;
  -[TVSettingsUserAppleIDServiceViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsUserAppleIDServiceViewController;
  -[TVSettingsUserAppleIDServiceViewController viewDidLoad](&v5, "viewDidLoad");
  objc_super v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AEC20);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserAppleIDServiceViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (id)loadSettingGroups
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserAppleIDServiceViewController _appleIdOptions](self, "_appleIdOptions"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserAppleIDServiceViewController _gameCenterOptions](self, "_gameCenterOptions"));
  v7[1] = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF880 == a6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUser name](self->_user, "name", a3, a4, a5));
    -[TVSettingsUserAppleIDServiceViewController setTitle:](self, "setTitle:", v7);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingsUserAppleIDServiceViewController;
    -[TVSettingsUserAppleIDServiceViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (-[TVSettingsUserProfileFacade isSigningInOrOutInProgress](self->_profileFacade, "isSigningInOrOutInProgress", a3)) {
    return 0;
  }
  else {
    return !-[TVSettingsUserProfileFacade isRemovingUser](self->_profileFacade, "isRemovingUser");
  }
}

- (void)tapToRepairUserPresenterDidCancel:(id)a3
{
}

- (void)tapToRepairUserPresenterDidDismiss:(id)a3
{
  tapToRepairPresenter = self->_tapToRepairPresenter;
  self->_tapToRepairPresenter = 0LL;
}

- (id)_appleIdOptions
{
  unint64_t serviceType = self->_serviceType;
  if (serviceType > 2)
  {
    v4 = 0LL;
    v6 = 0LL;
  }

  else
  {
    v4 = *(&off_100190008 + serviceType);
    uint64_t v5 = TSKLocString(*(&off_10018FFF0 + serviceType));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  v16 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", v6);
  objc_initWeak(&location, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  0LL,  0LL,  self->_profileFacade,  @"isSigningInOrOutInProgress"));
  [v7 setAccessoryTypes:4];
  [v7 setEditable:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100039E30;
  v21[3] = &unk_10018FFA8;
  objc_copyWeak(&v23, &location);
  id v22 = v4;
  [v7 setUpdateBlock:v21];
  uint64_t v8 = TSKLocString(@"iCloudSignInTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  self->_user,  v4,  self,  "_signIn:"));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100039F04;
  v19[3] = &unk_10018FFD0;
  objc_copyWeak(&v20, &location);
  [v10 setUpdateBlock:v19];
  [v10 setDeepLinkKey:@"SIGN_IN"];
  uint64_t v11 = TSKLocString(@"iCloudSignOutTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  self->_user,  v4,  self,  "_signOut:"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100039F88;
  v17[3] = &unk_10018FFD0;
  objc_copyWeak(&v18, &location);
  [v13 setUpdateBlock:v17];
  v25[0] = v7;
  v25[1] = v10;
  v25[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  -[TSKSettingGroup setSettingItems:](v16, "setSettingItems:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (void)_signIn:(id)a3
{
  v9 = objc_alloc_init(&OBJC_CLASS___TVSettingsTapToRepairUserPresenterConfiguration);
  -[TVSettingsTapToRepairUserPresenterConfiguration setCopyStyle:](v9, "setCopyStyle:", 1LL);
  -[TVSettingsTapToRepairUserPresenterConfiguration setNeedsCDPRepair:](v9, "setNeedsCDPRepair:", 0LL);
  uint64_t v4 = TSKLocString(@"AccountsEditUserTapToSignInManualActionTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsTapToRepairUserPresenterConfiguration setCancelActionTitle:](v9, "setCancelActionTitle:", v5);

  v6 = -[TVSettingsTapToRepairUserPresenter initWithUser:configuration:]( objc_alloc(&OBJC_CLASS____TtC10TVSettings34TVSettingsTapToRepairUserPresenter),  "initWithUser:configuration:",  self->_user,  v9);
  -[TVSettingsTapToRepairUserPresenter setDelegate:](v6, "setDelegate:", self);
  tapToRepairPresenter = self->_tapToRepairPresenter;
  self->_tapToRepairPresenter = v6;
  uint64_t v8 = v6;

  sub_1000A24B8(v8, self, -[TVSettingsUserAppleIDServiceViewController serviceType](self, "serviceType"));
}

- (void)_signInManually
{
  uint64_t v3 = TSKLocString(@"AccountsEditUserManualConfirmationTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"AccountsEditUserManualConfirmationMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  uint64_t v8 = TSKLocString(@"AccountsEditUserManualConfirmationGoBackToTapToSignInAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003A448;
  v18[3] = &unk_10018F018;
  v18[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  0LL,  v18));
  [v7 addAction:v10];

  uint64_t v11 = TSKLocString(@"AccountsEditUserManualConfirmationContinueAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003A454;
  v17[3] = &unk_10018F018;
  void v17[4] = self;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  v17));
  [v7 addAction:v13];

  uint64_t v14 = TSKLocString(@"AccountsEditUserManualConfirmationCancelAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));
  [v7 addAction:v16];

  -[TVSettingsUserAppleIDServiceViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
}

- (void)_signOut:(id)a3
{
  id v4 = a3;
  if (-[TVSettingsUserProfileFacade canSignOutOfServiceType:]( self->_profileFacade,  "canSignOutOfServiceType:",  self->_serviceType))
  {
    -[TVSettingsUserProfileFacade signOutOfServiceType:]( self->_profileFacade,  "signOutOfServiceType:",  self->_serviceType);
  }

  else
  {
    objc_initWeak(&location, self);
    uint64_t v5 = TSKLocString(@"AccountsUserSignOutLastAccountConfirmationTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = TSKLocString(@"AccountsUserSignOutLastAccountConfirmationMessage");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

    uint64_t v10 = TSKLocString(@"AccountsUserSignOutLastAccountConfirmationActionTitle");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10003A6A0;
    v16[3] = &unk_10018FF80;
    v16[4] = self;
    objc_copyWeak(&v17, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  2LL,  v16));
    [v9 addAction:v12];

    uint64_t v13 = TSKLocString(@"AccountsUserSignOutLastAccountConfirmationCancelTitle");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));
    [v9 addAction:v15];

    -[TVSettingsUserAppleIDServiceViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

- (id)_gameCenterOptions
{
  uint64_t v3 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  -[TSKSettingGroup setHidden:](v3, "setHidden:", self->_serviceType != 2);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKTVSettingsSupport sharedSupport](&OBJC_CLASS___GKTVSettingsSupport, "sharedSupport"));
  objc_initWeak(&location, self);
  uint64_t v4 = TSKLocString(@"GameCenterAboutFriendsTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  self,  "_presentGameCenterAboutFriends:"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003AA80;
  v21[3] = &unk_10018E9B0;
  objc_copyWeak(&v22, &location);
  [v6 setUpdateBlock:v21];
  uint64_t v7 = TSKLocString(@"GameCenterAllowNearbyPlayersTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = TSKLocString(@"GameCenterAllowNearbyPlayersDescription");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"SettingsYES");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = TSKLocString(@"SettingsNO");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v8,  v10,  v18,  @"shouldAllowNearbyMultiplayer",  v12,  v14));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10003AAE0;
  v19[3] = &unk_10018E9B0;
  objc_copyWeak(&v20, &location);
  [v15 setUpdateBlock:v19];
  v24[0] = v6;
  v24[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  -[TSKSettingGroup setSettingItems:](v3, "setSettingItems:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  return v3;
}

- (void)_presentGameCenterAboutFriends:(id)a3
{
  uint64_t v4 = TSKLocString(@"GameCenterAboutFriendsAlertMessage");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v5,  1LL));

  uint64_t v6 = TSKLocString(@"GameCenterAboutFriendsAlertCancel");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  1LL,  0LL));
  [v9 addAction:v8];

  -[TVSettingsUserAppleIDServiceViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (void)_menuPressed:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUserAppleIDServiceViewController navigationController](self, "navigationController", a3));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (TVSettingsUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_unint64_t serviceType = a3;
}

- (TVSettingsUserProfileFacade)profileFacade
{
  return self->_profileFacade;
}

- (void)setProfileFacade:(id)a3
{
}

- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)tapToRepairPresenter
{
  return self->_tapToRepairPresenter;
}

- (void)setTapToRepairPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end