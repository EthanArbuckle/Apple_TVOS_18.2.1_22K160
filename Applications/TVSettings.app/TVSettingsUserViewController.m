@interface TVSettingsUserViewController
- (AFSettingsConnection)siriSettingsConnection;
- (BOOL)shouldPresentManageSubscriptionsWhenURLBagLoads;
- (FLTVSettingsAccountItemsController)followUpController;
- (NSArray)supportedMultiUserLanguageCodes;
- (NSURL)lastDeepLinkURL;
- (TSKSettingItem)asnFreeItem;
- (TSKSettingItem)asnPaidItem;
- (TSKSettingItem)editAccountMemojiItem;
- (TSKSettingItem)editAccountNameItem;
- (TSKSettingItem)editNameItem;
- (TVApplicationController)subscriptionsAppController;
- (TVSettingsITMSFacade)itmsFacade;
- (TVSettingsPreferenceFacade)groupRecommendationsPrefsFacade;
- (TVSettingsUser)user;
- (TVSettingsUserProfileFacade)userProfileFacade;
- (TVSettingsUserViewController)initWithUser:(id)a3;
- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)tapToRepairUserPresenter;
- (id)_appleIDs;
- (id)_followUps;
- (id)_iCloudPhotoSectionValueUsingUserProfileFacade:(id)a3;
- (id)_makeAccountUserChangeNameChildViewController;
- (id)_manage;
- (id)_manageSubscriptionsViewController;
- (id)_primaryiCloudOptions;
- (id)_requirePassword;
- (id)_sharedWithYou;
- (id)_siri;
- (id)loadSettingGroups;
- (void)_completeUser:(id)a3;
- (void)_enableSharedWithYou:(id)a3;
- (void)_handleFollowUpItem:(id)a3;
- (void)_removeUser;
- (void)_showRMVErrorAlertForError:(id)a3;
- (void)_startTapToRepairThenEnableRMVWithPrompt:(BOOL)a3;
- (void)_startTapToRepairUserWithConfiguration:(id)a3;
- (void)_startTapToRepairUserWithCopyStyle:(int64_t)a3 needsCDPRepair:(BOOL)a4;
- (void)_toggleGroupRecommendationsConsent;
- (void)_togglePasswordFreeSetting;
- (void)_toggleRecognizeMyVoiceSetting;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onboardingViewControllerDidCancel:(id)a3;
- (void)onboardingViewControllerDidSucceed:(id)a3;
- (void)presentActionForDisplayedDeepLinkURL;
- (void)setAsnFreeItem:(id)a3;
- (void)setAsnPaidItem:(id)a3;
- (void)setEditAccountMemojiItem:(id)a3;
- (void)setEditAccountNameItem:(id)a3;
- (void)setEditNameItem:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setGroupRecommendationsPrefsFacade:(id)a3;
- (void)setItmsFacade:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setShouldPresentManageSubscriptionsWhenURLBagLoads:(BOOL)a3;
- (void)setSiriSettingsConnection:(id)a3;
- (void)setSubscriptionsAppController:(id)a3;
- (void)setSupportedMultiUserLanguageCodes:(id)a3;
- (void)setTapToRepairUserPresenter:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserProfileFacade:(id)a3;
- (void)tapToRepairUserDidFinish:(id)a3;
- (void)tapToRepairUserPresenterDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsUserViewController

- (TVSettingsUserViewController)initWithUser:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
  v6 = -[TVSettingsUserViewController init](&v26, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_user, a3);
    v8 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v5);
    userProfileFacade = v7->_userProfileFacade;
    v7->_userProfileFacade = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
    itmsFacade = v7->_itmsFacade;
    v7->_itmsFacade = (TVSettingsITMSFacade *)v10;

    v12 = objc_alloc(&OBJC_CLASS___TVSettingsPreferenceFacade);
    v13 = -[TVSettingsPreferenceFacade initWithDomain:notifyChanges:]( v12,  "initWithDomain:notifyChanges:",  TVSUIGroupRecommendationsDefaultsDomain,  1LL);
    groupRecommendationsPrefsFacade = v7->_groupRecommendationsPrefsFacade;
    v7->_groupRecommendationsPrefsFacade = v13;

    v15 = objc_alloc(&OBJC_CLASS___FLTVSettingsAccountItemsController);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifiers]);
    v17 = -[FLTVSettingsAccountItemsController initWithAccountIdentifiers:](v15, "initWithAccountIdentifiers:", v16);
    followUpController = v7->_followUpController;
    v7->_followUpController = v17;

    [v5 addObserver:v7 forKeyPath:@"name" options:5 context:off_1001DFA60];
    [v5 addObserver:v7 forKeyPath:@"accountIdentifiers" options:0 context:off_1001DFA68];
    -[TVSettingsUserProfileFacade addObserver:forKeyPath:options:context:]( v7->_userProfileFacade,  "addObserver:forKeyPath:options:context:",  v7,  @"userHasBeenRemoved",  1LL,  off_1001DFA70);
    -[TVSettingsITMSFacade addObserver:forKeyPath:options:context:]( v7->_itmsFacade,  "addObserver:forKeyPath:options:context:",  v7,  @"isManagedSubscriptionsURLLoaded",  0LL,  off_1001DFA78);
    objc_initWeak(&location, v7);
    v19 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    siriSettingsConnection = v7->_siriSettingsConnection;
    v7->_siriSettingsConnection = v19;

    v21 = v7->_siriSettingsConnection;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004FAA4;
    v23[3] = &unk_100190960;
    objc_copyWeak(&v24, &location);
    -[AFSettingsConnection fetchSupportedMultiUserLanguageCodes:](v21, "fetchSupportedMultiUserLanguageCodes:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
  -[TVSettingsUserViewController dealloc](&v3, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
  -[TVSettingsUserViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (-[TVSettingsUserProfileFacade userHasBeenRemoved](self->_userProfileFacade, "userHasBeenRemoved"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
    id v5 = [v4 popViewControllerAnimated:1];
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
  -[TVSettingsUserViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSettingsUserProfileFacade setAuthenticationNeededToChangeiCloudPhotoOptions]( self->_userProfileFacade,  "setAuthenticationNeededToChangeiCloudPhotoOptions");
}

- (id)loadSettingGroups
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _appleIDs](self, "_appleIDs"));
  v11[0] = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _primaryiCloudOptions](self, "_primaryiCloudOptions"));
  v11[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _sharedWithYou](self, "_sharedWithYou"));
  v11[2] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _requirePassword](self, "_requirePassword"));
  v11[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _siri](self, "_siri"));
  v11[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _manage](self, "_manage"));
  v11[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 6LL));

  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001DFA60 == a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser name](self->_user, "name"));
    -[TVSettingsUserViewController setTitle:](self, "setTitle:", v13);
LABEL_7:

    goto LABEL_16;
  }

  if (off_1001DFA68 == a6)
  {
    followUpController = self->_followUpController;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser accountIdentifiers](self->_user, "accountIdentifiers"));
    -[FLTVSettingsAccountItemsController setAccountIdentifiers:](followUpController, "setAccountIdentifiers:", v15);
    goto LABEL_9;
  }

  if (off_1001DFA70 == a6)
  {
    if (!-[TVSettingsUserProfileFacade userHasBeenRemoved](self->_userProfileFacade, "userHasBeenRemoved")) {
      goto LABEL_16;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
    v17 = (TVSettingsUserViewController *)objc_claimAutoreleasedReturnValue([v16 topViewController]);

    if (v17 != self) {
      goto LABEL_16;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
    id v18 = [v15 popViewControllerAnimated:1];
LABEL_9:

    goto LABEL_16;
  }

  if (off_1001DFA78 != a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
    -[TVSettingsUserViewController observeValueForKeyPath:ofObject:change:context:]( &v19,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
    goto LABEL_16;
  }

  if (self->_shouldPresentManageSubscriptionsWhenURLBagLoads
    && -[TVSettingsITMSFacade isManagedSubscriptionsURLLoaded](self->_itmsFacade, "isManagedSubscriptionsURLLoaded"))
  {
    self->_shouldPresentManageSubscriptionsWhenURLBagLoads = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsUserViewController _manageSubscriptionsViewController]( self,  "_manageSubscriptionsViewController"));
    -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v13,  1LL,  0LL);
    goto LABEL_7;
  }

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc(&OBJC_CLASS___TVJSITunesStore);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[IKAppContext currentAppContext](&OBJC_CLASS___IKAppContext, "currentAppContext"));
  id v7 = [v5 initWithAppContext:v6];

  [v4 setObject:v7 forKeyedSubscript:@"itms"];
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVApplicationController navigationController]( self->_subscriptionsAppController,  "navigationController",  a3,  a4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005009C;
  v7[3] = &unk_10018E440;
  v7[4] = self;
  [v5 dismissViewControllerAnimated:0 completion:v7];

  subscriptionsAppController = self->_subscriptionsAppController;
  self->_subscriptionsAppController = 0LL;
}

- (void)_removeUser
{
  id v4 = self->_userProfileFacade;
  uint64_t v5 = TSKLocString(@"AccountsUserRemoveUserConfirmationActionTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[TVSettingsUser isPrimary](self->_user, "isPrimary"))
  {
    uint64_t v7 = TSKLocString(@"AccountsUserRemoveUserConfirmationTitleDefaultUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = @"AccountsUserRemoveUserConfirmationMessageDefaultUser";
  }

  else
  {
    uint64_t v10 = TSKLocString(@"AccountsUserRemoveUserConfirmationTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = @"AccountsUserRemoveUserConfirmationMessage";
  }

  uint64_t v11 = TSKLocString(v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser shortName](self->_user, "shortName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  if (![v8 length])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[alertTitle length] > 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7AC8(a2);
    }
LABEL_16:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100050440LL);
  }

  if (![v14 length])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[message length] > 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7B78(a2);
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x1000504A4LL);
  }

  if (![v6 length])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[removeActionTitle length] > 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7C28(a2);
    }
    goto LABEL_16;
  }

  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100050530;
  v23[3] = &unk_10018FF80;
  v15 = v4;
  id v24 = v15;
  objc_copyWeak(&v25, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  2LL,  v23));
  uint64_t v17 = TSKLocString(@"AccountsUserRemoveUserConfirmationCancelTitle");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  1LL,  0LL));

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v14,  1LL));
  [v20 addAction:v16];
  [v20 addAction:v19];
  -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v20,  1LL,  0LL);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (id)_manageSubscriptionsViewController
{
  if (-[TVSettingsITMSFacade isManagedSubscriptionsURLLoaded](self->_itmsFacade, "isManagedSubscriptionsURLLoaded"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsITMSFacade manageSubscriptionsURL](self->_itmsFacade, "manageSubscriptionsURL"));
    if (v3)
    {
      id v4 =  +[TVSettingsInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVSettingsInterfaceFactory,  "sharedInterfaceFactory");
      id v5 = objc_alloc_init(&OBJC_CLASS___TVApplicationControllerContext);
      [v5 setJavaScriptApplicationURL:v3];
      [v5 setStorageIdentifier:@"itms_subscriptions"];
      lastDeepLinkURL = self->_lastDeepLinkURL;
      if (lastDeepLinkURL)
      {
        UIApplicationLaunchOptionsKey v13 = UIApplicationLaunchOptionsURLKey;
        v14 = lastDeepLinkURL;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
        [v5 setLaunchOptions:v7];

        v8 = self->_lastDeepLinkURL;
        self->_lastDeepLinkURL = 0LL;
      }

      v9 = -[TVApplicationController initWithContext:window:delegate:]( objc_alloc(&OBJC_CLASS___TVApplicationController),  "initWithContext:window:delegate:",  v5,  0LL,  self);
      subscriptionsAppController = self->_subscriptionsAppController;
      self->_subscriptionsAppController = v9;

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVApplicationController navigationController]( self->_subscriptionsAppController,  "navigationController"));
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    return v11;
  }

  else
  {
    self->_shouldPresentManageSubscriptionsWhenURLBagLoads = 1;
    return 0LL;
  }

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (TSKSettingItem *)a5;
  uint64_t v11 = v10;
  if (self->_editNameItem == v10)
  {
    -[TVSettingsUser setName:](self->_user, "setName:", v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
    id v13 = [v12 popToViewController:self animated:1];
LABEL_9:

    goto LABEL_10;
  }

  if (self->_asnPaidItem == v10)
  {
    if (_os_feature_enabled_impl("PineBoard", "Newport"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
      id v15 = [v14 popToViewController:self animated:1];
    }

    else
    {
      -[TVSettingsUserViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser passwordSetting](self->_user, "passwordSetting"));
    [v12 setAsnPaidSetting:v9 presentingViewController:self];
    goto LABEL_9;
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsUserViewController;
  -[TVSettingsUserViewController editingController:didProvideValue:forSettingItem:]( &v16,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
LABEL_10:
}

- (void)presentActionForDisplayedDeepLinkURL
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  id v4 = [v3 containsString:@"cfuAction=repairCDP"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v6 = [v5 containsString:@"action=completeUser"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v8 = [v7 containsString:@"action=acceptiCloudTerms"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v10 = [v9 containsString:@"action=setUpiCloudPhotos"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v12 = [v11 containsString:@"action=repairCDPThenEnableRMV"];

  if (v12)
  {
    -[TVSettingsUserViewController _startTapToRepairThenEnableRMVWithPrompt:]( self,  "_startTapToRepairThenEnableRMVWithPrompt:",  0LL);
LABEL_5:
    lastDeepLinkURL = self->_lastDeepLinkURL;
    self->_lastDeepLinkURL = 0LL;

    return;
  }

  if ((v4 | v6) == 1)
  {
    -[TVSettingsUserViewController _startTapToRepairUserWithCopyStyle:needsCDPRepair:]( self,  "_startTapToRepairUserWithCopyStyle:needsCDPRepair:",  v6,  v4);
    goto LABEL_5;
  }

  if (v8)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___TVSettingsActivityIndicatorViewController);
    -[TVSettingsActivityIndicatorViewController setActivityIndicatorDelay:](v14, "setActivityIndicatorDelay:", 0.3);
    -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v14,  1LL,  0LL);
    objc_initWeak(&location, self);
    userProfileFacade = self->_userProfileFacade;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100050C0C;
    v25[3] = &unk_10018E810;
    objc_copyWeak(&v26, &location);
    -[TVSettingsUserProfileFacade presentTermsUIForiCloudAccountWithCompletion:]( userProfileFacade,  "presentTermsUIForiCloudAccountWithCompletion:",  v25);
    objc_super v16 = self->_lastDeepLinkURL;
    self->_lastDeepLinkURL = 0LL;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    return;
  }

  if (v10)
  {
    id v24 = self->_userProfileFacade;
    uint64_t v17 = (TVSettingsUserProfilePhotosViewController *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileFacade user](v24, "user"));
    if (-[TVSettingsUserProfilePhotosViewController hasiCloudAccount](v17, "hasiCloudAccount"))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileFacade user](v24, "user"));
      unsigned int v19 = [v18 isPrimary];

      if (!v19)
      {
LABEL_14:
        v23 = self->_lastDeepLinkURL;
        self->_lastDeepLinkURL = 0LL;

        return;
      }

      uint64_t v17 = -[TVSettingsUserProfilePhotosViewController initWithUserProfileFacade:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfilePhotosViewController),  "initWithUserProfileFacade:",  v24);
      uint64_t v20 = TSKLocString(@"iCloudPhotoSectionTitleNew");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[TVSettingsUserProfilePhotosViewController setTitle:](v17, "setTitle:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController navigationController](self, "navigationController"));
      [v22 pushViewController:v17 animated:1];
    }

    goto LABEL_14;
  }

- (void)onboardingViewControllerDidSucceed:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050C98;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)onboardingViewControllerDidCancel:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050D00;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)tapToRepairUserDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
  unsigned int v6 = [v5 shouldEnableRecognizeMyVoiceAfterRepair];

  if (v6)
  {
    objc_initWeak(&location, self);
    userProfileFacade = self->_userProfileFacade;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100050DF4;
    v8[3] = &unk_100190690;
    objc_copyWeak(&v9, &location);
    -[TVSettingsUserProfileFacade enableRecognizeMyVoiceWithCompletion:]( userProfileFacade,  "enableRecognizeMyVoiceWithCompletion:",  v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)tapToRepairUserPresenterDidDismiss:(id)a3
{
  id v4 = (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter *)a3;
  if (self->_tapToRepairUserPresenter == v4)
  {
    self->_tapToRepairUserPresenter = 0LL;
    id v5 = v4;

    id v4 = v5;
  }
}

- (id)_followUps
{
  followUpController = self->_followUpController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100050F70;
  v6[3] = &unk_100190988;
  objc_copyWeak(&v7, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  followUpController,  @"itemModels",  v6));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_appleIDs
{
  v34 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  objc_initWeak(&location, self);
  v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = TSKLocString(@"AccountsEditUserCompleteAllAccountsTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"AccountsEditUserCompleteAllAccountsDescription");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v4,  v6,  self->_user,  @"hasAllAccounts",  self,  "_completeUser:"));

  [v7 setUpdateBlock:&stru_1001909A8];
  -[NSMutableArray addObject:](v35, "addObject:", v7);
  uint64_t v8 = TSKLocString(@"AccountsICloudTitle");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  user = self->_user;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10005169C;
  v42[3] = &unk_10018E9D8;
  objc_copyWeak(&v43, &location);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  user,  @"iCloudUsername",  v42));

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100051708;
  v40[3] = &unk_10018FFD0;
  objc_copyWeak(&v41, &location);
  [v11 setUpdateBlock:v40];
  -[NSMutableArray addObject:](v35, "addObject:", v11);
  uint64_t v12 = TSKLocString(@"AccountsUserITMSTitle");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = TSKLocString(@"AccountsEditUserProfileItunesDescription");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_super v16 = self->_user;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100051820;
  v38[3] = &unk_10018E9D8;
  objc_copyWeak(&v39, &location);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v13,  v15,  v16,  @"iTunesUsername",  v38));

  [v17 setUpdateBlock:&stru_1001909E8];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);

  if ([v19 length])
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v20,  v19));
    [v17 setLocalizedDescription:v21];
  }

  -[NSMutableArray addObject:](v35, "addObject:", v17);
  uint64_t v22 = TSKLocString(@"AccountsGameCenterTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = TSKLocString(@"AccountsEditUserProfileGameCenterDescription");
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = self->_user;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100051894;
  v36[3] = &unk_10018E9D8;
  objc_copyWeak(&v37, &location);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v23,  v25,  v26,  @"gameCenterUsername",  v36));

  [v27 setUpdateBlock:&stru_100190A08];
  -[NSMutableArray addObject:](v35, "addObject:", v27);
  -[TSKSettingGroup setSettingItems:](v34, "setSettingItems:", v35);
  uint64_t v28 = TSKLocString(@"AccountsUserAppleIDSectionTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserViewController _followUps](self, "_followUps"));
  v45[0] = v30;
  v45[1] = v34;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 2LL));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v29,  v31));

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&location);
  return v32;
}

- (id)_primaryiCloudOptions
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"AccountsICloudTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100051BFC;
  v31[3] = &unk_10018E9B0;
  objc_copyWeak(&v32, location);
  -[TSKSettingGroup setUpdateBlock:](v6, "setUpdateBlock:", v31);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = self->_userProfileFacade;
  uint64_t v9 = TSKLocString(@"iCloudPhotoSectionTitleNew");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"iCloudPhotoSectionDescriptionNew");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100051C88;
  v29[3] = &unk_10018EC30;
  id v13 = v8;
  v30 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v10,  v12,  v13,  @"iCloudPhotoLibraryEnabled",  v29));

  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  id v25 = sub_100051CF8;
  id v26 = &unk_10018FFA8;
  objc_copyWeak(&v28, location);
  id v15 = v13;
  v27 = v15;
  [v14 setUpdateBlock:&v23];
  -[NSMutableArray addObject:](v7, "addObject:", v14, v23, v24, v25, v26);
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomeScreenSyncFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomeScreenSyncFacade,  "sharedInstance"));
  uint64_t v17 = TSKLocString(@"iCloudHomeScreenSyncTitle");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = TSKLocString(@"iCloudHomeScreenSyncDescription");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v18,  v20,  v16,  @"homeScreenSyncEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v7, "addObject:", v21);
  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v7);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
  return v6;
}

- (id)_iCloudPhotoSectionValueUsingUserProfileFacade:(id)a3
{
  id v3 = a3;
  uint64_t v4 = TSKLocString(@"iCloudPhotoSectionTitleOff");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = [v3 iCloudPhotoLibraryEnabled];
  unsigned int v7 = [v3 iCloudSharedPhotosEnabled];
  if (v6)
  {
    if (v7) {
      uint64_t v8 = @"iCloudPhotoSectionTitleOn";
    }
    else {
      uint64_t v8 = @"iCloudPhotoSectionTitleLibrary";
    }
    goto LABEL_9;
  }

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = @"iCloudPhotoSectionTitleSharedAlbum";
LABEL_9:
    uint64_t v9 = TSKLocString(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    uint64_t v5 = (void *)v10;
    goto LABEL_10;
  }

  if ([v3 iCloudPhotoStreamEnabled])
  {
    uint64_t v8 = @"iCloudPhotoSectionTitleMyPhotoStreamOnly";
    goto LABEL_9;
  }

- (id)_sharedWithYou
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appInfos]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"com.apple.TVWatchList"]);

  if (!v5) {
    return -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  }
  objc_initWeak(&location, self);
  unsigned int v6 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v7 = TSKLocString(@"AccountsSharedWithYouTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = -[TSKSettingGroup initWithTitle:](v6, "initWithTitle:", v8);

  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_10005205C;
  uint64_t v20 = &unk_10018E9B0;
  objc_copyWeak(&v21, &location);
  -[TSKSettingGroup setUpdateBlock:](v9, "setUpdateBlock:", &v17);
  uint64_t v10 = TSKLocString(@"AccountsSharedWithYouTitle");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = TSKLocString(@"AccountsSharedWithYouDescription");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  v13,  0LL,  0LL,  self,  "_enableSharedWithYou:",  v17,  v18,  v19,  v20));

  [v14 setUpdateBlock:&stru_100190A28];
  v23 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  -[TSKSettingGroup setSettingItems:](v9, "setSettingItems:", v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v9;
}

- (void)_enableSharedWithYou:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMSharedWithYouManager sharedManager](&OBJC_CLASS___IMSharedWithYouManager, "sharedManager", a3));
  unsigned int v5 = [v4 isSharedWithYouEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMSharedWithYouManager sharedManager](&OBJC_CLASS___IMSharedWithYouManager, "sharedManager"));
    [v6 setSharedWithYouEnabled:0];
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SLOnboardingShieldViewController);
    [v6 setDelegate:self];
    -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
  }
}

- (id)_requirePassword
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"AccountsUserRequirePasswordSectionTitle");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000526C0;
  v43[3] = &unk_10018E9B0;
  objc_copyWeak(&v44, &location);
  -[TSKSettingGroup setUpdateBlock:](v6, "setUpdateBlock:", v43);
  uint64_t v7 = TSKLocString(@"iTMSPasswordAlways");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v47[0] = v8;
  uint64_t v9 = TSKLocString(@"iTMSPasswordSometimes");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v47[1] = v10;
  uint64_t v11 = TSKLocString(@"iTMSPasswordNever");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v47[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));

  uint64_t v14 = TSKLocString(@"AccountsUserPasswordPurchasesTitle");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_super v16 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v15,  0LL,  self->_user,  @"passwordSetting.asnPaidSetting",  &off_1001AED10));
  asnPaidItem = self->_asnPaidItem;
  self->_asnPaidItem = v16;

  uint64_t v18 = self->_asnPaidItem;
  uint64_t v19 = TSKLocString(@"AccountsUserPasswordPurchasesAlertTitle");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[TSKSettingItem setDetailedLocalizedTitle:](v18, "setDetailedLocalizedTitle:", v20);

  id v21 = self->_asnPaidItem;
  uint64_t v22 = TSKLocString(@"AccountsUserPasswordPurchasesAlertMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iTunesUsername](self->_user, "iTunesUsername"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v24));
  -[TSKSettingItem setDetailedLocalizedDescription:](v21, "setDetailedLocalizedDescription:", v25);

  id v26 = self->_asnPaidItem;
  v27 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AED10,  v13);
  -[TSKSettingItem setLocalizedValueFormatter:](v26, "setLocalizedValueFormatter:", v27);

  id v28 = self->_asnPaidItem;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10005272C;
  v41[3] = &unk_10018E9B0;
  objc_copyWeak(&v42, &location);
  -[TSKSettingItem setUpdateBlock:](v28, "setUpdateBlock:", v41);
  uint64_t v29 = TSKLocString(@"AccountsUserPasswordFreeDownloadsTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v30,  0LL,  self->_user,  @"passwordSetting.asnFreeSetting",  self,  "_togglePasswordFreeSetting"));
  asnFreeItem = self->_asnFreeItem;
  self->_asnFreeItem = v31;

  v33 = self->_asnFreeItem;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter yesNoFormatter](&OBJC_CLASS___TSKBoolFormatter, "yesNoFormatter"));
  -[TSKSettingItem setLocalizedValueFormatter:](v33, "setLocalizedValueFormatter:", v34);

  v35 = self->_asnFreeItem;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000527E4;
  v39[3] = &unk_10018E9B0;
  objc_copyWeak(&v40, &location);
  -[TSKSettingItem setUpdateBlock:](v35, "setUpdateBlock:", v39);
  v36 = self->_asnFreeItem;
  v46[0] = self->_asnPaidItem;
  v46[1] = v36;
  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_togglePasswordFreeSetting
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUser passwordSetting](self->_user, "passwordSetting"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 asnFreeSetting]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 BOOLValue] ^ 1));

  [v5 setAsnFreeSetting:v4 presentingViewController:self];
}

- (id)_siri
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"AccountsUserSiriSectionTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100052BE4;
  v16[3] = &unk_10018E9B0;
  objc_copyWeak(&v17, &location);
  -[TSKSettingGroup setUpdateBlock:](v6, "setUpdateBlock:", v16);
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (qword_1001E1708 != -1) {
    dispatch_once(&qword_1001E1708, &stru_100190A48);
  }
  uint64_t v8 = TSKLocRMVString(@"AccountsUserSiriRecognizeMyVoiceTitle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = TSKLocRMVString(@"AccountsUserSiriRecognizeMyVoiceDescription");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  v11,  self->_userProfileFacade,  @"recognizeMyVoiceState",  self,  "_toggleRecognizeMyVoiceSetting"));

  [v12 setLocalizedValueFormatter:qword_1001E1700];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100052DB0;
  v14[3] = &unk_10018E9B0;
  objc_copyWeak(&v15, &location);
  [v12 setUpdateBlock:v14];
  -[NSMutableArray addObject:](v7, "addObject:", v12);
  objc_destroyWeak(&v15);

  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v7);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_toggleRecognizeMyVoiceSetting
{
  if (-[TVSettingsUserProfileFacade recognizeMyVoiceState](self->_userProfileFacade, "recognizeMyVoiceState")
    && !-[TVSettingsUserProfileFacade canEnableRecognizeMyVoice](self->_userProfileFacade, "canEnableRecognizeMyVoice"))
  {
    uint64_t v4 = TSKLocRMVString(@"NoVoiceProfileFoundAlertTitle");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = TSKLocRMVString(@"NoVoiceProfileFoundAlertDescription");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v7,  1LL));

    uint64_t v8 = TSKLocRMVString(@"NoVoiceProfileFoundAlertButtonTitle");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  0LL,  0LL));
    [v12 addAction:v10];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
    [v12 addAction:v11];

    -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
  }

  else if ((id)-[TVSettingsUserProfileFacade recognizeMyVoiceAvailability]( self->_userProfileFacade,  "recognizeMyVoiceAvailability") == (id)2)
  {
    -[TVSettingsUserViewController _startTapToRepairThenEnableRMVWithPrompt:]( self,  "_startTapToRepairThenEnableRMVWithPrompt:",  1LL);
  }

  else
  {
    objc_initWeak(&location, self);
    userProfileFacade = self->_userProfileFacade;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100053124;
    v13[3] = &unk_100190690;
    objc_copyWeak(&v14, &location);
    -[TVSettingsUserProfileFacade toggleRecognizeMyVoiceWithCompletion:]( userProfileFacade,  "toggleRecognizeMyVoiceWithCompletion:",  v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

- (id)_manage
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"AccountsUserManageSectionTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v38 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  objc_initWeak(&location, self);
  uint64_t v6 = TSKLocString(@"AccountsUserChangeNameMenu");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKLocString(@"AccountsUserEditNameDescription");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  user = self->_user;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100053794;
  v49[3] = &unk_10018E9D8;
  objc_copyWeak(&v50, &location);
  uint64_t v11 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  v9,  user,  @"name",  v49));
  editNameItem = self->_editNameItem;
  self->_editNameItem = v11;

  -[TSKSettingItem setUpdateBlock:](self->_editNameItem, "setUpdateBlock:", &stru_100190A68);
  uint64_t v13 = TSKLocString(@"AccountsUserSubscriptionsTitle");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  itmsFacade = self->_itmsFacade;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000537D8;
  void v47[3] = &unk_10018E9D8;
  objc_copyWeak(&v48, &location);
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  itmsFacade,  @"isManagedSubscriptionsURLLoaded",  v47));

  [v16 setShouldPresentChildController:1];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  void v45[2] = sub_100053810;
  v45[3] = &unk_10018E9B0;
  objc_copyWeak(&v46, &location);
  [v16 setUpdateBlock:v45];
  uint64_t v17 = TSKLocString(@"AccountsUserGroupRecommendationsTitle");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = TSKLocString(@"AccountsUserGroupRecommendationsDescription");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v18,  v20,  self->_user,  @"groupRecommendationsConsent",  self,  "_toggleGroupRecommendationsConsent"));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100053930;
  v43[3] = &unk_10018E9B0;
  objc_copyWeak(&v44, &location);
  [v21 setUpdateBlock:v43];
  uint64_t v22 = TSKLocString(@"AccountsUserGroupRecommendationsTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = TSKLocString(@"AccountsUserGroupRecommendationsUpsellDescription");
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  groupRecommendationsPrefsFacade = self->_groupRecommendationsPrefsFacade;
  uint64_t v27 = TSKLocString(@"AccountsUserGroupRecommendationsHideUpsellValue");
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = TSKLocString(@"AccountsUserGroupRecommendationsShowUpsellValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v23,  v25,  groupRecommendationsPrefsFacade,  TVSUIGroupRecommendationsDefaultsShouldHideAddUserUpsellKey,  v28,  v30));

  [v31 setDefaultValue:&__kCFBooleanFalse];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100053A24;
  v41[3] = &unk_10018E9B0;
  objc_copyWeak(&v42, &location);
  [v31 setUpdateBlock:v41];
  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.appleid"));
  uint64_t v33 = TSKLocString(@"AccountsUserRemoveUserTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v34,  0LL,  self->_userProfileFacade,  @"isRemovingUser",  self,  "_removeUser"));

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100053A90;
  v39[3] = &unk_10018EA00;
  objc_copyWeak(&v40, &location);
  [v35 setUpdateBlock:v39];
  v52[0] = self->_editNameItem;
  v52[1] = v21;
  v52[2] = v31;
  v52[3] = v16;
  v52[4] = v32;
  v52[5] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 6LL));
  -[TSKSettingGroup setSettingItems:](v38, "setSettingItems:", v36);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);
  return v38;
}

- (void)_toggleGroupRecommendationsConsent
{
  if (-[TVSettingsUser groupRecommendationsConsent](self->_user, "groupRecommendationsConsent")) {
    -[TVSettingsUserProfileFacade updateGroupRecommendationsConsentToAuthorized:presentingViewController:]( self->_userProfileFacade,  "updateGroupRecommendationsConsentToAuthorized:presentingViewController:",  (id)-[TVSettingsUser groupRecommendationsConsent](self->_user, "groupRecommendationsConsent") != (id)1,  self);
  }
}

- (void)_handleFollowUpItem:(id)a3
{
  id v9 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  Class v6 = NSClassFromString(@"FLTVSettingsItemModel");
  if (!v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7CD8(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
    JUMPOUT(0x100053D58LL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FLTVSettingsItemModelClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7CD8(a2);
    }
    goto LABEL_9;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  -[FLTVSettingsAccountItemsController executeActionForItemModel:presentationContext:]( self->_followUpController,  "executeActionForItemModel:presentationContext:",  v7,  self);
}

- (void)_completeUser:(id)a3
{
}

- (void)_startTapToRepairUserWithCopyStyle:(int64_t)a3 needsCDPRepair:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TVSettingsTapToRepairUserPresenterConfiguration);
  -[TVSettingsTapToRepairUserPresenterConfiguration setCopyStyle:](v7, "setCopyStyle:", a3);
  -[TVSettingsTapToRepairUserPresenterConfiguration setNeedsCDPRepair:](v7, "setNeedsCDPRepair:", v4);
  -[TVSettingsUserViewController _startTapToRepairUserWithConfiguration:]( self,  "_startTapToRepairUserWithConfiguration:",  v7);
}

- (void)_startTapToRepairUserWithConfiguration:(id)a3
{
  tapToRepairUserPresenter = self->_tapToRepairUserPresenter;
  id v5 = a3;
  -[TVSettingsTapToRepairUserPresenter stopFlow](tapToRepairUserPresenter, "stopFlow");
  Class v6 = -[TVSettingsTapToRepairUserPresenter initWithUser:configuration:]( objc_alloc(&OBJC_CLASS____TtC10TVSettings34TVSettingsTapToRepairUserPresenter),  "initWithUser:configuration:",  self->_user,  v5);
  uint64_t v7 = self->_tapToRepairUserPresenter;
  self->_tapToRepairUserPresenter = v6;

  -[TVSettingsTapToRepairUserPresenter setDelegate:](self->_tapToRepairUserPresenter, "setDelegate:", self);
  LODWORD(tapToRepairUserPresenter) = [v5 needsCDPRepair];

  uint64_t v8 = self->_tapToRepairUserPresenter;
  if ((_DWORD)tapToRepairUserPresenter) {
    sub_1000A1F70(v8, self);
  }
  else {
    sub_1000A22E4(v8, self);
  }
}

- (void)_startTapToRepairThenEnableRMVWithPrompt:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100054050;
  v14[3] = &unk_10018E810;
  objc_copyWeak(&v15, &location);
  id v5 = objc_retainBlock(v14);
  Class v6 = v5;
  if (v3)
  {
    id v7 = [[TVSUIRecognizeMyVoiceViewController alloc] initWithiCloudAltDSID:0];
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    uint64_t v10 = sub_1000540C0;
    uint64_t v11 = &unk_10018FB10;
    objc_copyWeak(&v13, &location);
    id v12 = v6;
    [v7 setCompletionHandler:&v8];
    -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL,  v8,  v9,  v10,  v11);

    objc_destroyWeak(&v13);
  }

  else
  {
    ((void (*)(void *))v5[2])(v5);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_showRMVErrorAlertForError:(id)a3
{
  id v4 = a3;
  if (qword_1001E1718 != -1) {
    dispatch_once(&qword_1001E1718, &stru_100190A88);
  }
  id v5 = (os_log_s *)qword_1001E1710;
  if (os_log_type_enabled((os_log_t)qword_1001E1710, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Show RMV error alert. {error=%@}",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v6 = TSKLocRMVString(@"RMVEnableErrorAlertTitle");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  uint64_t v9 = kAFAssistantErrorDomain;
  if ([v8 isEqualToString:kAFAssistantErrorDomain])
  {
    id v10 = [v4 code];

    if (v10 == (id)1012)
    {
      uint64_t v11 = @"RMVMeDeviceNotSetAlertMessage";
LABEL_12:
      uint64_t v14 = TSKLocRMVString(v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v12,  1LL));
      uint64_t v16 = TSKLocString(@"OK");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  0LL));
      [v15 addAction:v18];

      -[TVSettingsUserViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
      goto LABEL_13;
    }
  }

  else
  {
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if (![v12 isEqualToString:v9])
  {
LABEL_13:

    goto LABEL_14;
  }

  id v13 = [v4 code];

  if (v13 == (id)6018)
  {
    uint64_t v11 = @"RMVOldOSAlertMessage";
    goto LABEL_12;
  }

- (id)_makeAccountUserChangeNameChildViewController
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  uint64_t v3 = TSKLocString(@"AccountsUserChangeNameTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TSKTextInputViewController setHeaderText:](v2, "setHeaderText:", v4);

  return v2;
}

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (TVSettingsITMSFacade)itmsFacade
{
  return self->_itmsFacade;
}

- (void)setItmsFacade:(id)a3
{
}

- (TVSettingsUserProfileFacade)userProfileFacade
{
  return self->_userProfileFacade;
}

- (void)setUserProfileFacade:(id)a3
{
}

- (TVSettingsUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (TVApplicationController)subscriptionsAppController
{
  return self->_subscriptionsAppController;
}

- (void)setSubscriptionsAppController:(id)a3
{
}

- (TSKSettingItem)editNameItem
{
  return self->_editNameItem;
}

- (void)setEditNameItem:(id)a3
{
}

- (TSKSettingItem)editAccountNameItem
{
  return self->_editAccountNameItem;
}

- (void)setEditAccountNameItem:(id)a3
{
}

- (TSKSettingItem)editAccountMemojiItem
{
  return self->_editAccountMemojiItem;
}

- (void)setEditAccountMemojiItem:(id)a3
{
}

- (TSKSettingItem)asnPaidItem
{
  return self->_asnPaidItem;
}

- (void)setAsnPaidItem:(id)a3
{
}

- (TSKSettingItem)asnFreeItem
{
  return self->_asnFreeItem;
}

- (void)setAsnFreeItem:(id)a3
{
}

- (BOOL)shouldPresentManageSubscriptionsWhenURLBagLoads
{
  return self->_shouldPresentManageSubscriptionsWhenURLBagLoads;
}

- (void)setShouldPresentManageSubscriptionsWhenURLBagLoads:(BOOL)a3
{
  self->_shouldPresentManageSubscriptionsWhenURLBagLoads = a3;
}

- (TVSettingsPreferenceFacade)groupRecommendationsPrefsFacade
{
  return self->_groupRecommendationsPrefsFacade;
}

- (void)setGroupRecommendationsPrefsFacade:(id)a3
{
}

- (FLTVSettingsAccountItemsController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)tapToRepairUserPresenter
{
  return self->_tapToRepairUserPresenter;
}

- (void)setTapToRepairUserPresenter:(id)a3
{
}

- (AFSettingsConnection)siriSettingsConnection
{
  return self->_siriSettingsConnection;
}

- (void)setSiriSettingsConnection:(id)a3
{
}

- (NSArray)supportedMultiUserLanguageCodes
{
  return self->_supportedMultiUserLanguageCodes;
}

- (void)setSupportedMultiUserLanguageCodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end