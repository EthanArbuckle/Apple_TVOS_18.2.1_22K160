@interface TVSettingsVideoSubscriberAccountViewController
- (BOOL)isDeepLinkInstallApp;
- (BOOL)isDeepLinkSignIn;
- (NSURL)deeplink;
- (TSKSettingGroup)voucherList;
- (TSKSettingItem)signInItem;
- (TVSettingsVideoSubscriberAccountViewController)initWithCoder:(id)a3;
- (TVSettingsVideoSubscriberAccountViewController)initWithStyle:(int64_t)a3;
- (UIVisualEffectView)blurEffectView;
- (VSLoadingViewController_tvOS)loadingViewController;
- (VSOnboardingInfoCenter)onboardingInfoCenter;
- (VSRemoteNotifier)remoteNotifier;
- (id)_appSettingsViewModelForItemAtIndexPath:(id)a3;
- (id)createGroupForSection:(id)a3 ofKind:(id)a4;
- (id)externalValue;
- (id)loadSettingGroups;
- (id)settingItemUpdateBlock;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_appsDidChange;
- (void)_initiateSetTopBoxOptOut:(id)a3;
- (void)_performAction:(id)a3;
- (void)_presentError:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_showMoreApps:(id)a3;
- (void)_showPrivacy:(id)a3;
- (void)_signIn:(id)a3;
- (void)_signOut:(id)a3;
- (void)_startSignInWithIdentityProvider:(id)a3 pickerViewController:(id)a4;
- (void)addBlur;
- (void)dealloc;
- (void)deepLinkInstallApp;
- (void)deepLinkSignIn;
- (void)dismissIdentityProviderViewController:(id)a3;
- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4;
- (void)identityProviderPickerViewControllerDidCancel:(id)a3;
- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5;
- (void)identityProviderViewControllerDidCancel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentActionForDisplayedDeepLinkURL;
- (void)presentDeepLinkAction;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)removeBlur;
- (void)setBlurEffectView:(id)a3;
- (void)setDeeplink:(id)a3;
- (void)setExternalValue:(id)a3;
- (void)setIsDeepLinkInstallApp:(BOOL)a3;
- (void)setIsDeepLinkSignIn:(BOOL)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)setOnboardingInfoCenter:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setSignInItem:(id)a3;
- (void)setVoucherList:(id)a3;
- (void)startObservingAppsViewModels;
- (void)stopObservingAppsViewModels;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TVSettingsVideoSubscriberAccountViewController

- (TVSettingsVideoSubscriberAccountViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireMainThread(v4, v5);
  VSRequireKeyedCoder(v4);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberAccountViewController;
  v6 = -[TVSettingsVideoSubscriberAccountViewController initWithCoder:](&v8, "initWithCoder:", v4);

  if (v6) {
    sub_5928(v6);
  }
  return v6;
}

- (TVSettingsVideoSubscriberAccountViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberAccountViewController;
  uint64_t v5 = -[TVSettingsVideoSubscriberAccountViewController initWithStyle:](&v8, "initWithStyle:", a3);
  v6 = v5;
  if (v5) {
    sub_5928(v5);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberAccountViewController;
  -[TVSettingsVideoSubscriberAccountViewController dealloc](&v3, "dealloc");
}

- (void)_appsDidChange
{
  if (-[TVSettingsVideoSubscriberAccountViewController isDeepLinkInstallApp](self, "isDeepLinkInstallApp"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccount]);

    if (v3) {
      -[TVSettingsVideoSubscriberAccountViewController deepLinkInstallApp](self, "deepLinkInstallApp");
    }
    else {
      -[TVSettingsVideoSubscriberAccountViewController deepLinkSignIn](self, "deepLinkSignIn");
    }
  }

  else if (-[TVSettingsVideoSubscriberAccountViewController isDeepLinkSignIn](self, "isDeepLinkSignIn"))
  {
    -[TVSettingsVideoSubscriberAccountViewController deepLinkSignIn](self, "deepLinkSignIn");
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController deeplink](self, "deeplink"));

    if (v4)
    {
      -[TVSettingsVideoSubscriberAccountViewController setDeeplink:](self, "setDeeplink:", 0LL);
      -[TVSettingsVideoSubscriberAccountViewController reloadSettings](self, "reloadSettings");
    }

    else
    {
      -[TVSettingsVideoSubscriberAccountViewController removeBlur](self, "removeBlur");
    }
  }

- (void)startObservingAppsViewModels
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"appSections" options:3 context:off_162B0];
}

- (void)stopObservingAppsViewModels
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"appSections" context:off_162B0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_162B0 == a6)
  {
    id v11 = a5;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"old"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"new"]);
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberAccountViewController;
    id v10 = a5;
    -[TVSettingsVideoSubscriberAccountViewController observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  v10,  a6);
  }

- (id)loadSettingGroups
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController deeplink](self, "deeplink"));
  if (v3 || -[TVSettingsVideoSubscriberAccountViewController isDeepLinkSignIn](self, "isDeepLinkSignIn"))
  {

LABEL_4:
    v54 = (NSMutableArray *)&__NSArray0__struct;
    return v54;
  }

  if (-[TVSettingsVideoSubscriberAccountViewController isDeepLinkInstallApp](self, "isDeepLinkInstallApp")) {
    goto LABEL_4;
  }
  v54 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v53 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  signInItem = self->_signInItem;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_647C;
  v63[3] = &unk_107C0;
  id v8 = v6;
  id v64 = v8;
  -[TSKSettingItem setUpdateBlock:](signInItem, "setUpdateBlock:", v63);
  v52 = v5;
  -[NSMutableArray addObject:](v5, "addObject:", self->_signInItem);
  LODWORD(signInItem) = [v8 currentIdentityProviderIsFullySupported];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v10 = v9;
  if ((_DWORD)signInItem) {
    id v11 = @"SIGN_OUT_BUTTON_TITLE";
  }
  else {
    id v11 = @"SIGN_OUT_BUTTON_NON_PARTICIPATING_TITLE";
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:0 table:0]);

  uint64_t v13 = 0LL;
  if ([v8 currentIdentityProviderIsFullySupported])
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"SETTINGS_FOOTER_SYNCHRONIZABLE_NOTE" value:0 table:0]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 currentAccount]);
    unsigned __int8 v17 = [v16 isSynchronizable];

    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"SETTINGS_FOOTER_NOT_SYNCHRONIZABLE_NOTE_FORMAT" value:0 table:0]);

      v15 = (void *)v19;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 currentIdentityProviderDisplayName]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v20));
  }

  v50 = (void *)v13;
  v51 = (void *)v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  v13,  v8,  @"signOutHash",  self,  "_signOut:"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_64F8;
  v61[3] = &unk_107C0;
  id v22 = v8;
  id v62 = v22;
  [v21 setUpdateBlock:v61];
  v49 = v21;
  -[NSMutableArray addObject:](v52, "addObject:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 localizedStringForKey:@"STB_OPT_OUT_TITLE" value:0 table:0]);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:@"STB_OPT_OUT_DESCRIPTION" value:0 table:0]);

  v47 = (void *)v26;
  v48 = (void *)v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v24,  v26,  v22,  @"stbOptOutHash",  self,  "_initiateSetTopBoxOptOut:"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_6630;
  v59[3] = &unk_107C0;
  id v28 = v22;
  id v60 = v28;
  [v27 setUpdateBlock:v59];
  v46 = v27;
  -[NSMutableArray addObject:](v52, "addObject:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController onboardingInfoCenter](self, "onboardingInfoCenter"));
  uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 localizedButtonTitle]);

  v45 = (void *)v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v30,  0LL,  0LL,  0LL,  self,  "_showPrivacy:"));
  [v31 setShouldPresentChildController:1];
  v44 = v31;
  -[NSMutableArray addObject:](v52, "addObject:", v31);
  -[TSKSettingGroup setSettingItems:](v53, "setSettingItems:", v52);
  -[NSMutableArray addObject:](v54, "addObject:", v53);
  v66[0] = @"decided";
  v66[1] = @"available";
  v66[2] = @"subscribed";
  v66[3] = @"upgrade";
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 4LL));
  id v33 = [v32 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v28 appSections]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 allKeys]);
        unsigned int v40 = [v39 containsObject:v37];

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([v28 appSections]);
          v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v37]);

          v43 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberAccountViewController createGroupForSection:ofKind:]( self,  "createGroupForSection:ofKind:",  v42,  v37));
          -[NSMutableArray addObject:](v54, "addObject:", v43);
        }
      }

      id v34 = [v32 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }

    while (v34);
  }

  return v54;
}

- (id)createGroupForSection:(id)a3 ofKind:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName", v20));
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v13,  0LL,  v12,  @"installState",  self,  "_performAction:"));
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberAccountViewController settingItemUpdateBlock]( self,  "settingItemUpdateBlock"));
        [v14 setUpdateBlock:v15];

        -[NSMutableArray addObject:](v7, "addObject:", v14);
      }

      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }

  v16 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v17 = VSAppSettingsSectionLocalizedTitle(v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[TSKSettingGroup setLocalizedTitle:](v16, "setLocalizedTitle:", v18);

  -[TSKSettingGroup setSettingItems:](v16, "setSettingItems:", v7);
  return v16;
}

- (id)settingItemUpdateBlock
{
  return &stru_10800;
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberAccountViewController;
  -[TVSettingsVideoSubscriberAccountViewController willMoveToParentViewController:]( &v4,  "willMoveToParentViewController:");
  if (a3) {
    +[VSMetricsManagerObjC recordEnterEventWithPage:pageType:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordEnterEventWithPage:pageType:",  VSMetricPageSettingsHome,  VSMetricPageTypeSettings);
  }
  else {
    +[VSMetricsManagerObjC recordExitEventWithPage:pageType:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordExitEventWithPage:pageType:",  VSMetricPageSettingsHome,  VSMetricPageTypeSettings);
  }
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSErrorLogObject(-[TVSettingsVideoSubscriberAccountViewController removeBlur](self, "removeBlur"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_91A8((uint64_t)v4, v6);
  }

  uint64_t v7 = VSAlertForError(v4, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController navigationController](self, "navigationController"));
  [v9 presentViewController:v8 animated:1 completion:0];
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v4);

  -[UINavigationController setNavigationBarHidden:](v5, "setNavigationBarHidden:", 1LL);
  -[UINavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_6D10;
  v6[3] = &unk_10570;
  v6[4] = self;
  -[TVSettingsVideoSubscriberAccountViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v5,  1LL,  v6);
}

- (void)_startSignInWithIdentityProvider:(id)a3 pickerViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  if ([v6 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 storage]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest makeAccountRequestWithStorage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "makeAccountRequestWithStorage:",  v9));

    id v11 = [[VSIdentityProviderViewController alloc] initWithIdentityProvider:v6];
    [v11 setDelegate:self];
    [v11 setCanIssuePrivacyVouchers:1];
    [v11 enqueueRequest:v10];
    if (v7)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 navigationController]);
      [v12 pushViewController:v11 animated:1];
    }

    else
    {
      -[TVSettingsVideoSubscriberAccountViewController _presentViewController:](self, "_presentViewController:", v11);
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v8 storage]);
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_6F08;
    __int128 v22 = &unk_10828;
    __int128 v23 = self;
    v15 = (TVSettingsVideoSubscriberAccountViewController *)v7;
    __int128 v24 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v13 viewControllerForUnsupportedProvider:v6 withRequestingAppDisplayName:0 storage:v14 acknowledgementHandler:&v19]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "forceUnwrapObject", v19, v20, v21, v22, v23));
    if (v15) {
      v18 = v15;
    }
    else {
      v18 = self;
    }
    -[TVSettingsVideoSubscriberAccountViewController presentViewController:animated:completion:]( v18,  "presentViewController:animated:completion:",  v17,  1LL,  0LL);
  }
}

- (void)deepLinkSignIn
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAccountUsername]);

  if (v3) {
    [v4 setNeedsUpdateApps];
  }
  else {
    -[TVSettingsVideoSubscriberAccountViewController _signIn:](self, "_signIn:", self->_signInItem);
  }
}

- (void)deepLinkInstallApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  if ([v3 shouldShowMVPDAppInstallPromptFromViewController:self])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_72A4;
    v4[3] = &unk_10850;
    v4[4] = self;
    [v3 presentMVPDAppInstallPromptFromViewController:self animated:0 completion:v4];
  }

  else
  {
    [v3 setNeedsUpdateApps];
  }
}

- (void)_performAction:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v5 = (int *)[v4 installState];
  if (v5 != &dword_4)
  {
    if (v5 == (int *)((char *)&dword_0 + 2))
    {
      +[VSMetricsManagerObjC recordClickEventWithPage:pageType:target:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordClickEventWithPage:pageType:target:",  VSMetricPageSettingsHome,  VSMetricPageTypeSettings,  VSMetricClickTargetInstallApp);
      id v6 = v4;
      id v7 = [[VUIAppInstallerViewController alloc] initWithInstallable:v6];
      [v7 setModalPresentationStyle:8];
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"INSTALL_APP_CONFIRMATION_FORMAT" value:0 table:0]);

      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v8));
      objc_msgSend(v7, "setConfirmationTitle:");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"INSTALL_APP_PROGRESS_FORMAT" value:0 table:0]);

      __int128 v24 = (void *)v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v8));
      [v7 setUpdateTitle:v13];
      if ([v6 canRevokeVoucher])
      {
        [v7 setDisplaySecondaryLink:1];
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
        __int128 v23 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"REVOKE_VOUCHER_FORMAT" value:0 table:0]);

        v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentIdentityProviderDisplayName]);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v8, v17));
        [v7 setSecondaryLinkTitle:v18];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_7624;
        v28[3] = &unk_104F8;
        id v29 = v6;
        uint64_t v30 = self;
        [v7 setSecondaryLinkHandler:v28];

        uint64_t v10 = v23;
      }

      -[TVSettingsVideoSubscriberAccountViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_7654;
      v26[3] = &unk_10878;
      id v27 = v8;
      id v19 = v8;
      [v7 beginInstallingAppWithProgressHandler:0 completion:v26];
    }

    goto LABEL_13;
  }

  uint64_t v20 = (char *)[v4 privacyState];
  if (v20 == (_BYTE *)&dword_0 + 2)
  {
    v21 = v4;
    uint64_t v22 = 1LL;
LABEL_12:
    [v21 setAccessGranted:v22];
    goto LABEL_13;
  }

  if (v20 == (_BYTE *)&dword_0 + 1)
  {
    v21 = v4;
    uint64_t v22 = 0LL;
    goto LABEL_12;
  }

  if (!v20)
  {
    +[VSMetricsManagerObjC recordClickEventWithPage:pageType:target:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordClickEventWithPage:pageType:target:",  VSMetricPageSettingsHome,  VSMetricPageTypeSettings,  VSMetricClickTargetOpenApp);
    [v4 launchApp];
  }

- (void)_signIn:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_7858;
  v5[3] = &unk_108C8;
  v5[4] = self;
  [v4 startSigningInWithCompletionHandler:v5];
}

- (void)_signOut:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  if ([v4 currentIdentityProviderIsFullySupported])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAccount]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_7CE8;
    v9[3] = &unk_10570;
    id v10 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 viewControllerToConfirmAccountDeletionForAccount:v6 preferredStyle:1 confirmationHandler:v9]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 forceUnwrapObject]);

    -[TVSettingsVideoSubscriberAccountViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
  }

  else
  {
    [v4 startSigningOut];
  }
}

- (void)_showMoreApps:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v5 currentIdentityProviderAppStoreRoomURL]);
  id v4 = (void *)v3;
  if (v3) {
    VSOpenURL(v3);
  }
}

- (void)_initiateSetTopBoxOptOut:(id)a3
{
  id v4 = a3;
  +[VSMetricsManagerObjC recordClickEventWithPage:pageType:target:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordClickEventWithPage:pageType:target:",  VSMetricPageSettingsHome,  VSMetricPageTypeSettings,  VSMetricClickTargetSTBOptOut);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"STB_OPT_OUT_CONFIRM_TITLE" value:0 table:0]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"STB_OPT_OUT_CONFIRM_MESSAGE" value:0 table:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"STB_OPT_OUT_CONFIRM_BUTTON_TITLE" value:0 table:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0]);

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___UIAlertController);
  -[UIAlertController setTitle:](v13, "setTitle:", v6);
  v18 = (void *)v8;
  -[UIAlertController setMessage:](v13, "setMessage:", v8);
  objc_initWeak(location, v13);
  objc_initWeak(&from, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_80C0;
  v24[3] = &unk_108F0;
  objc_copyWeak(&v25, location);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  v24));
  uint64_t v17 = v4;
  -[UIAlertController addAction:](v13, "addAction:", v14);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_8144;
  v20[3] = &unk_10940;
  id v15 = v19;
  id v21 = v15;
  objc_copyWeak(&v22, &from);
  objc_copyWeak(&v23, location);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  2LL,  v20));
  -[UIAlertController addAction:](v13, "addAction:", v16);
  -[TVSettingsVideoSubscriberAccountViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v13,  1LL,  0LL);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (void)_showPrivacy:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController onboardingInfoCenter](self, "onboardingInfoCenter", a3));
  [v4 presentDetailsFromViewController:self];
}

- (void)identityProviderPickerViewControllerDidCancel:(id)a3
{
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
}

- (void)dismissIdentityProviderViewController:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 navigationController]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 presentingViewController]);
    [v6 dismissViewControllerAnimated:1 completion:0];
  }

  else
  {
    id v5 = [v7 popViewControllerAnimated:1];
  }
}

- (void)identityProviderViewControllerDidCancel:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 navigationController]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 presentingViewController]);
    [v6 dismissViewControllerAnimated:1 completion:0];
  }

  else
  {
    id v5 = [v7 popViewControllerAnimated:1];
  }
}

- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5
{
  id v9 = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_87D0;
  v10[3] = &unk_10968;
  v10[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_88BC;
  v7[3] = &unk_10798;
  id v8 = a3;
  id v6 = v8;
  [a5 unwrapObject:v10 error:v7];
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
}

- (id)_appSettingsViewModelForItemAtIndexPath:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberAccountViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___VSAppSettingsViewModel);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___VSAppSettingsViewModel);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    {
      id v7 = (objc_class *)objc_opt_class(v4);
      id v8 = NSStringFromClass(v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Unexpectedly, object was %@, instead of VSAppSettingsViewModel.",  v9);
    }

    id v10 = v4;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0LL;
}

- (void)addBlur
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL));
  uint64_t v3 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v12);
  blurEffectView = self->_blurEffectView;
  self->_blurEffectView = v3;

  uint64_t v5 = self->_blurEffectView;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController view](self, "view"));
  [v6 bounds];
  -[UIVisualEffectView setFrame:](v5, "setFrame:");

  -[UIVisualEffectView setAutoresizingMask:](self->_blurEffectView, "setAutoresizingMask:", 18LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController view](self, "view"));
  [v7 addSubview:self->_blurEffectView];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSLoadingViewController_tvOS view](self->_loadingViewController, "view"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController view](self, "view"));
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");

  -[TVSettingsVideoSubscriberAccountViewController addChildViewController:]( self,  "addChildViewController:",  self->_loadingViewController);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController view](self, "view"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSLoadingViewController_tvOS view](self->_loadingViewController, "view"));
  [v10 addSubview:v11];

  -[VSLoadingViewController_tvOS willMoveToParentViewController:]( self->_loadingViewController,  "willMoveToParentViewController:",  self);
}

- (void)removeBlur
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSLoadingViewController_tvOS view](self->_loadingViewController, "view"));
  [v3 removeFromSuperview];

  -[VSLoadingViewController_tvOS didMoveToParentViewController:]( self->_loadingViewController,  "didMoveToParentViewController:",  0LL);
  -[UIVisualEffectView removeFromSuperview](self->_blurEffectView, "removeFromSuperview");
  -[TVSettingsVideoSubscriberAccountViewController reloadSettings](self, "reloadSettings");
}

- (void)presentDeepLinkAction
{
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsVideoSubscriberFacade sharedInstance]( &OBJC_CLASS___TVSettingsVideoSubscriberFacade,  "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController deeplink](self, "deeplink"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  id v5 = [v4 isEqualToString:VSPromptTVProviderSettingsSignInURLString];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberAccountViewController deeplink](self, "deeplink"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
    id v6 = [v8 isEqualToString:VSPromptTVProviderSettingsAppInstallURLString];
  }

  -[TVSettingsVideoSubscriberAccountViewController setIsDeepLinkSignIn:](self, "setIsDeepLinkSignIn:", v5);
  -[TVSettingsVideoSubscriberAccountViewController setIsDeepLinkInstallApp:](self, "setIsDeepLinkInstallApp:", v6);
  [v9 setNeedsUpdateApps];
}

- (void)setLastDeepLinkURL:(id)a3
{
  id v4 = a3;
  -[TVSettingsVideoSubscriberAccountViewController addBlur](self, "addBlur");
  -[TVSettingsVideoSubscriberAccountViewController setDeeplink:](self, "setDeeplink:", v4);
}

- (void)presentActionForDisplayedDeepLinkURL
{
}

- (id)externalValue
{
  return self->_externalValue;
}

- (void)setExternalValue:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSOnboardingInfoCenter)onboardingInfoCenter
{
  return self->_onboardingInfoCenter;
}

- (void)setOnboardingInfoCenter:(id)a3
{
}

- (TSKSettingGroup)voucherList
{
  return self->_voucherList;
}

- (void)setVoucherList:(id)a3
{
}

- (VSLoadingViewController_tvOS)loadingViewController
{
  return self->_loadingViewController;
}

- (void)setLoadingViewController:(id)a3
{
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
}

- (TSKSettingItem)signInItem
{
  return self->_signInItem;
}

- (void)setSignInItem:(id)a3
{
}

- (NSURL)deeplink
{
  return self->_deeplink;
}

- (void)setDeeplink:(id)a3
{
}

- (BOOL)isDeepLinkSignIn
{
  return self->_isDeepLinkSignIn;
}

- (void)setIsDeepLinkSignIn:(BOOL)a3
{
  self->_isDeepLinkSignIn = a3;
}

- (BOOL)isDeepLinkInstallApp
{
  return self->_isDeepLinkInstallApp;
}

- (void)setIsDeepLinkInstallApp:(BOOL)a3
{
  self->_isDeepLinkInstallApp = a3;
}

- (void).cxx_destruct
{
}

@end