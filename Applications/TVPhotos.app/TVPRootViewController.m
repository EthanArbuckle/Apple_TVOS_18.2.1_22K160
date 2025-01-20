@interface TVPRootViewController
+ (id)photoLibraryTabControllerWithLibraryFilterState:(id)a3;
- (BOOL)_handleTurnOniCloud:(BOOL)a3 withError:(id *)a4;
- (BOOL)_isEnrolledDemoDevice;
- (BOOL)_isInDemoMode;
- (BOOL)_isUserLoggedIn;
- (BOOL)_shouldDisplayICloudPhotoLibraryOptInOfferView;
- (BOOL)didPerformLoginAction;
- (BOOL)isAuthenticationInProgress;
- (BOOL)isMyPhotoStreamSettingEnabled;
- (BOOL)isSharedPhotoStreamSettingEnabled;
- (BOOL)isiCloudPhotoLibraryEnabled;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (TVPErrorView)errorView;
- (TVPPhotoLibraryOptInOfferViewController)photoLibraryOptInOfferViewController;
- (TVPPhotoLibraryTabViewController)tabViewController;
- (TVPRootViewController)init;
- (TVPSignInLandingView)iCloudPromptView;
- (TVPSignInLandingView)landingView;
- (TVPiCloudPhotosWelcomeViewController)iCloudWelcomeViewController;
- (TVSiCloudAccountManager)accountManager;
- (UIView)loadingView;
- (void)_checkPhotoSettingsAndUpdateUI;
- (void)_displayActivityIndicatorView;
- (void)_displayICloudPhotoLibraryOptInOfferView;
- (void)_displayNoNetworkAlert;
- (void)_displaySignInLandingView;
- (void)_displayiCloudPromptView;
- (void)_enableAuthenticateSettingsWithAuthenticationType:(int64_t)a3 block:(id)a4 completion:(id)a5;
- (void)_enableICloudPhotoSettingsWithCompletion:(id)a3;
- (void)_launchAppViewPostAuthenticationWithController:(id)a3;
- (void)_removeAllViews;
- (void)_removeAllViewsIncludingWelcomeScreen:(BOOL)a3;
- (void)_resetFlags;
- (void)authenticateUserOnSelectSignIn;
- (void)openiCloudPromptView;
- (void)setAccountManager:(id)a3;
- (void)setDidPerformLoginAction:(BOOL)a3;
- (void)setErrorView:(id)a3;
- (void)setICloudPromptView:(id)a3;
- (void)setICloudWelcomeViewController:(id)a3;
- (void)setIsAuthenticationInProgress:(BOOL)a3;
- (void)setLandingView:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setPhotoLibraryOptInOfferViewController:(id)a3;
- (void)setTabViewController:(id)a3;
- (void)turnOnWelcomeSectionType:(int64_t)a3;
- (void)updateAuthenticationStatus;
- (void)viewDidLoad;
@end

@implementation TVPRootViewController

- (TVPRootViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPRootViewController;
  v2 = -[TVPRootViewController init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    accountManager = v2->_accountManager;
    v2->_accountManager = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v2->_photoLibrary));
    v8 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]( objc_alloc(&OBJC_CLASS___PXLibraryFilterState),  "initWithSharedLibraryStatusProvider:",  v7);
    libraryFilterState = v2->_libraryFilterState;
    v2->_libraryFilterState = v8;
  }

  return v2;
}

- (void)updateAuthenticationStatus
{
  if (+[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable"))
  {
    if (!self->_isAuthenticationInProgress)
    {
      if (-[TVPRootViewController _isUserLoggedIn](self, "_isUserLoggedIn"))
      {
        self->_isAuthenticationInProgress = 1;
        -[TVPRootViewController _checkPhotoSettingsAndUpdateUI](self, "_checkPhotoSettingsAndUpdateUI");
      }

      else
      {
        -[TVPRootViewController _displaySignInLandingView](self, "_displaySignInLandingView");
      }
    }
  }

  else
  {
    -[TVPRootViewController _displayNoNetworkAlert](self, "_displayNoNetworkAlert");
  }

+ (id)photoLibraryTabControllerWithLibraryFilterState:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
  uint64_t v5 = -[TVPPhotoLibraryTabViewController initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPPhotoLibraryTabViewController),  "initWithPhotoLibrary:libraryFilterState:",  v4,  v3);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MemoriesContentEnabled"]);

  v39 = v8;
  if (v8 && ![v8 BOOLValue])
  {
    int v36 = 0;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAppSettings sharedInstance](&OBJC_CLASS___TVPAppSettings, "sharedInstance"));
    unsigned int v10 = [v9 replaceMemoriesFeed];

    if (v10)
    {
      id v11 = [[PXStoryMemoryFeedConfiguration alloc] initWithMemoriesInPhotoLibrary:v4 layoutKind:1 viewControllerSetupBlock:0];
      v12 = (TVPMemoriesTabCollectionViewController *)objc_claimAutoreleasedReturnValue( +[PXStoryUIFactory feedViewControllerWithConfiguration:]( &OBJC_CLASS___PXStoryUIFactory,  "feedViewControllerWithConfiguration:",  v11));
    }

    else
    {
      v12 = -[TVPMemoriesTabCollectionViewController initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabCollectionViewController),  "initWithPhotoLibrary:libraryFilterState:",  v4,  v3);
      uint64_t v13 = PXLocalizedString(@"PXMemoriesFeedTitle");
      id v11 = (id)objc_claimAutoreleasedReturnValue(v13);
      -[TVPMemoriesTabCollectionViewController setTitle:](v12, "setTitle:", v11);
    }

    -[NSMutableArray addObject:](v6, "addObject:", v12);
    int v36 = 1;
  }

  v38 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v38, "activeAccount"));
  if (objc_msgSend(v37, "tvp_isSharedAlbumsEnabled"))
  {
    v14 = -[TVPSharedPSMainViewController initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPSharedPSMainViewController),  "initWithPhotoLibrary:libraryFilterState:",  v4,  v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"sharedTab" value:&stru_1000CC6C8 table:0]);
    -[TVPSharedPSMainViewController setTitle:](v14, "setTitle:", v16);

    -[NSMutableArray addObject:](v6, "addObject:", v14);
  }

  v17 = -[TVPPhotoLibraryAlbumsListController initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController),  "initWithPhotoLibrary:libraryFilterState:",  v4,  v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"albumsTab" value:&stru_1000CC6C8 table:0]);
  -[TVPPhotoLibraryAlbumsListController setTitle:](v17, "setTitle:", v19);

  -[NSMutableArray addObject:](v6, "addObject:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAppSettings sharedInstance](&OBJC_CLASS___TVPAppSettings, "sharedInstance"));
  LODWORD(v19) = [v20 enablePhotosTab];

  if ((_DWORD)v19)
  {
    v35 = v5;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000205));
    id v22 = [[PXPhotosDataSourceConfiguration alloc] initWithAssetCollection:v21 options:1027];
    [v22 setReverseSortOrder:1];
    v34 = (void *)v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:]( &OBJC_CLASS___PXContentFilterState,  "defaultFilterStateForContainerCollection:photoLibrary:",  v21,  v4));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 predicateForUseCase:0]);
    [v22 setFilterPredicate:v24];

    id v33 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v22];
    id v25 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v33];
    id v26 = objc_alloc(&OBJC_CLASS___PXPhotosViewConfiguration);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:]( &OBJC_CLASS___PXPhotoKitUIMediaProvider,  "mediaProviderWithLibrary:",  v4));
    id v28 = [v26 initWithDataSourceManager:v25 mediaProvider:v27 selectionManager:0 assetActionManager:0 assetCollectionActionManager:0];

    [v28 setContentMode:1];
    [v28 setAllowedBehaviors:0];
    [v28 setNavBarStyle:1];
    [v28 setWantsDynamicTitles:1];
    v29 = -[TVPPhotosUIViewController initWithConfiguration:photoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPPhotosUIViewController),  "initWithConfiguration:photoLibrary:libraryFilterState:",  v28,  v4,  v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedStringForKey:@"photosTab" value:&stru_1000CC6C8 table:0]);
    -[TVPPhotosUIViewController setTitle:](v29, "setTitle:", v31);

    if (v36) {
      -[NSMutableArray addObject:](v6, "addObject:", v29);
    }
    else {
      -[NSMutableArray insertObject:atIndex:](v6, "insertObject:atIndex:", v29, 0LL);
    }

    uint64_t v5 = v35;
  }

  -[TVPPhotoLibraryTabViewController setViewControllers:](v5, "setViewControllers:", v6);

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPRootViewController;
  -[TVPRootViewController viewDidLoad](&v4, "viewDidLoad");
  -[TVPRootViewController updateAuthenticationStatus](self, "updateAuthenticationStatus");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"updateAuthenticationStatus" name:UIApplicationDidBecomeActiveNotification object:0];
}

- (void)authenticateUserOnSelectSignIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));

  if (v5 == v6)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100010E3C;
    v11[3] = &unk_1000C9D18;
    objc_copyWeak(&v12, &location);
    -[TVPRootViewController _enableICloudPhotoSettingsWithCompletion:]( self,  "_enableICloudPhotoSettingsWithCompletion:",  v11);
    -[TVPRootViewController _displayActivityIndicatorView](self, "_displayActivityIndicatorView");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](self->_accountManager, "activeAccount"));
    if (v7)
    {
      self->_isAuthenticationInProgress = 1;
      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100010D6C;
      v13[3] = &unk_1000C9CF0;
      objc_copyWeak(&v14, &location);
      v8 = objc_retainBlock(v13);
      -[TVSiCloudAccountManager _renewCredentialsForAccount:withCompletion:]( self->_accountManager,  "_renewCredentialsForAccount:withCompletion:",  v7,  v8);
      -[TVPRootViewController _displayActivityIndicatorView](self, "_displayActivityIndicatorView");

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=APPLE_ACCOUNT"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      [v10 openSensitiveURL:v9 withOptions:0];
    }
  }

- (void)_removeAllViews
{
}

- (void)_removeAllViewsIncludingWelcomeScreen:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subviews]);

  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
        unsigned int v14 = [v11 isEqual:v13];

        if (v14) {
          BOOL v15 = !v3;
        }
        else {
          BOOL v15 = 0;
        }
        if (!v15) {
          [v11 removeFromSuperview];
        }
        unsigned int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  if (v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
      [v17 willMoveToParentViewController:0];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
      [v19 removeFromSuperview];

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
      -[TVPRootViewController removeChildViewController:](self, "removeChildViewController:", v20);

      -[TVPRootViewController setICloudWelcomeViewController:](self, "setICloudWelcomeViewController:", 0LL);
    }
  }

- (BOOL)_isUserLoggedIn
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](self->_accountManager, "activeAccount"));
  if (-[TVPRootViewController _isInDemoMode](self, "_isInDemoMode")) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isAuthenticated];
  }

  return v4;
}

- (BOOL)_isInDemoMode
{
  return +[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode");
}

- (BOOL)_isEnrolledDemoDevice
{
  if (qword_100102ED8 != -1) {
    dispatch_once(&qword_100102ED8, &stru_1000C9D38);
  }
  return byte_100102ED0;
}

- (BOOL)isMyPhotoStreamSettingEnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](self->_accountManager, "activeAccount"));
  if (-[TVPRootViewController _isInDemoMode](self, "_isInDemoMode")) {
    objc_msgSend(v3, "tvp_setMyPhotoStreamEnabled:error:", 0, 0);
  }
  unsigned __int8 v4 = objc_msgSend(v3, "tvp_isMyPhotoStreamEnabled");

  return v4;
}

- (BOOL)isSharedPhotoStreamSettingEnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](self->_accountManager, "activeAccount"));
  if (-[TVPRootViewController _isInDemoMode](self, "_isInDemoMode")) {
    objc_msgSend(v3, "tvp_setSharedAlbumsEnabled:error:", 0, 0);
  }
  unsigned __int8 v4 = objc_msgSend(v3, "tvp_isSharedAlbumsEnabled");

  return v4;
}

- (BOOL)isiCloudPhotoLibraryEnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](self->_accountManager, "activeAccount"));
  unsigned __int8 v4 = objc_msgSend(v3, "tvp_isCPLEnabled");
  unsigned int v5 = -[TVPRootViewController _isInDemoMode](self, "_isInDemoMode");
  unsigned __int8 v6 = -[TVPRootViewController _isEnrolledDemoDevice](self, "_isEnrolledDemoDevice");
  if ((v6 & 1) == 0 && v5) {
    objc_msgSend(v3, "tvp_setCPLEnabled:error:", 0, 0);
  }

  return v5 | v6 | v4;
}

- (void)_displayActivityIndicatorView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v5,  0LL,  *(double *)&qword_100101F18));
    -[TVPRootViewController setLoadingView:](self, "setLoadingView:", v4);
  }

- (void)_displaySignInLandingView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController landingView](self, "landingView"));

  if (!v3)
  {
    unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___TVPSignInLandingView);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v5 bounds];
    unsigned __int8 v6 = -[TVPSignInLandingView initWithFrame:](v4, "initWithFrame:");
    landingView = self->_landingView;
    self->_landingView = v6;

    -[TVPSignInLandingView setDelegate:](self->_landingView, "setDelegate:", self);
    id v8 = self->_landingView;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"TViCloudSignInTitle" value:&stru_1000CC6C8 table:0]);
    -[TVPSignInLandingView setTitle:](v8, "setTitle:", v10);

    id v11 = self->_landingView;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"TViCloudSignInMessage" value:&stru_1000CC6C8 table:0]);
    -[TVPSignInLandingView setMessage:](v11, "setMessage:", v13);

    unsigned int v14 = self->_landingView;
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Cloud"));
    -[TVPSignInLandingView setSampleImage:](v14, "setSampleImage:", v15);
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
  [v16 addSubview:self->_landingView];
}

- (void)_displayNoNetworkAlert
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController errorView](self, "errorView"));

  if (!v3)
  {
    unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___TVPErrorView);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v5 bounds];
    unsigned __int8 v6 = -[TVPErrorView initWithFrame:](v4, "initWithFrame:");
    errorView = self->_errorView;
    self->_errorView = v6;

    id v8 = self->_errorView;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"noNetworkTitle" value:&stru_1000CC6C8 table:0]);
    -[TVPErrorView setErrorTitle:](v8, "setErrorTitle:", v10);

    id v11 = self->_errorView;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"noNetworkMessage" value:&stru_1000CC6C8 table:0]);
    -[TVPErrorView setErrorMessage:](v11, "setErrorMessage:", v13);
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
  [v14 addSubview:self->_errorView];
}

- (void)_displayiCloudPromptView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));

  if (v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    [v5 setAlpha:1.0];

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    [v13 setNeedsFocusUpdate];
  }

  else
  {
    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___TVPiCloudPhotosWelcomeViewController);
    -[TVPRootViewController setICloudWelcomeViewController:](self, "setICloudWelcomeViewController:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    [v7 setDelegate:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    -[TVPRootViewController addChildViewController:](self, "addChildViewController:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    [v9 addSubview:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudWelcomeViewController](self, "iCloudWelcomeViewController"));
    [v12 didMoveToParentViewController:self];

    TVPPreferencesSetWelcomeScreenDisplayed(1LL);
  }

- (void)openiCloudPromptView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSignInLandingView superview](self->_iCloudPromptView, "superview"));

  if (!v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController iCloudPromptView](self, "iCloudPromptView"));

    if (!v4)
    {
      id v5 = objc_alloc(&OBJC_CLASS___TVPSignInLandingView);
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v6 bounds];
      id v7 = -[TVPSignInLandingView initWithFrame:](v5, "initWithFrame:");
      iCloudPromptView = self->_iCloudPromptView;
      self->_iCloudPromptView = v7;

      -[TVPSignInLandingView setDelegate:](self->_iCloudPromptView, "setDelegate:", self);
      uint64_t v9 = self->_iCloudPromptView;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"TViCloudSignInTitle" value:&stru_1000CC6C8 table:0]);
      -[TVPSignInLandingView setTitle:](v9, "setTitle:", v11);

      id v12 = self->_iCloudPromptView;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"TViCloudTurnOnPromptMessage" value:&stru_1000CC6C8 table:0]);
      -[TVPSignInLandingView setMessage:](v12, "setMessage:", v14);

      BOOL v15 = self->_iCloudPromptView;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"TViCloudTurnOnActionMessage" value:&stru_1000CC6C8 table:0]);
      -[TVPSignInLandingView setActionPromptMessage:](v15, "setActionPromptMessage:", v17);

      v18 = self->_iCloudPromptView;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Cloud"));
      -[TVPSignInLandingView setSampleImage:](v18, "setSampleImage:", v19);
    }

    id v20 = (id)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
    [v20 addSubview:self->_iCloudPromptView];
  }

- (void)_displayICloudPhotoLibraryOptInOfferView
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___TVPPhotoLibraryOptInOfferViewController);
  photoLibraryOptInOfferViewController = self->_photoLibraryOptInOfferViewController;
  self->_photoLibraryOptInOfferViewController = v3;

  objc_initWeak(&location, self);
  id v5 = self->_photoLibraryOptInOfferViewController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100011B10;
  v11[3] = &unk_1000C9D18;
  objc_copyWeak(&v12, &location);
  -[TVPPhotoLibraryOptInOfferViewController setOptInBlock:](v5, "setOptInBlock:", v11);
  unsigned __int8 v6 = self->_photoLibraryOptInOfferViewController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100011D04;
  v9[3] = &unk_1000C9D18;
  objc_copyWeak(&v10, &location);
  -[TVPPhotoLibraryOptInOfferViewController setOptOutBlock:](v6, "setOptOutBlock:", v9);
  -[TVPRootViewController addChildViewController:]( self,  "addChildViewController:",  self->_photoLibraryOptInOfferViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self->_photoLibraryOptInOfferViewController, "view"));
  [v7 addSubview:v8];

  -[TVPPhotoLibraryOptInOfferViewController didMoveToParentViewController:]( self->_photoLibraryOptInOfferViewController,  "didMoveToParentViewController:",  self);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldDisplayICloudPhotoLibraryOptInOfferView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVPhotos"));
  unsigned int v4 = [v3 BOOLForKey:@"__showICPLOptInOfferPreferencesKey"];
  if (-[TVPRootViewController isSharedPhotoStreamSettingEnabled](self, "isSharedPhotoStreamSettingEnabled")
    || -[TVPRootViewController isMyPhotoStreamSettingEnabled](self, "isMyPhotoStreamSettingEnabled"))
  {
    unsigned int v5 = v4 & ~-[TVPRootViewController isiCloudPhotoLibraryEnabled](self, "isiCloudPhotoLibraryEnabled");
    if ((v5 & 1) != 0) {
      goto LABEL_8;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  if (((v4 ^ 1) & 1) == 0) {
    [v3 setBool:0 forKey:@"__showICPLOptInOfferPreferencesKey"];
  }
LABEL_8:

  return v5;
}

- (void)_checkPhotoSettingsAndUpdateUI
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOptInOfferViewController parentViewController]( self->_photoLibraryOptInOfferViewController,  "parentViewController"));

  if (v3)
  {
    -[TVPPhotoLibraryOptInOfferViewController willMoveToParentViewController:]( self->_photoLibraryOptInOfferViewController,  "willMoveToParentViewController:",  0LL);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self->_photoLibraryOptInOfferViewController, "view"));
    [v4 removeFromSuperview];

    -[TVPPhotoLibraryOptInOfferViewController removeFromParentViewController]( self->_photoLibraryOptInOfferViewController,  "removeFromParentViewController");
    photoLibraryOptInOfferViewController = self->_photoLibraryOptInOfferViewController;
    self->_photoLibraryOptInOfferViewController = 0LL;
  }

  if (-[TVPRootViewController _shouldDisplayICloudPhotoLibraryOptInOfferView]( self,  "_shouldDisplayICloudPhotoLibraryOptInOfferView"))
  {
    -[TVPRootViewController _displayICloudPhotoLibraryOptInOfferView](self, "_displayICloudPhotoLibraryOptInOfferView");
  }

  else if (-[TVPRootViewController isSharedPhotoStreamSettingEnabled](self, "isSharedPhotoStreamSettingEnabled") {
         || -[TVPRootViewController isMyPhotoStreamSettingEnabled](self, "isMyPhotoStreamSettingEnabled")
  }
         || -[TVPRootViewController isiCloudPhotoLibraryEnabled](self, "isiCloudPhotoLibraryEnabled"))
  {
    if (-[TVPRootViewController isiCloudPhotoLibraryEnabled](self, "isiCloudPhotoLibraryEnabled"))
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController tabViewController](self, "tabViewController"));

      if (!v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController libraryFilterState](self, "libraryFilterState"));
        id v18 = (id)objc_claimAutoreleasedReturnValue( +[TVPRootViewController photoLibraryTabControllerWithLibraryFilterState:]( &OBJC_CLASS___TVPRootViewController,  "photoLibraryTabControllerWithLibraryFilterState:",  v7));

        -[TVPRootViewController setTabViewController:](self, "setTabViewController:", v18);
        -[TVPRootViewController _launchAppViewPostAuthenticationWithController:]( self,  "_launchAppViewPostAuthenticationWithController:",  v18);
        -[TVPRootViewController _removeAllViews](self, "_removeAllViews");
      }
    }

    else
    {
      if (-[TVPRootViewController isSharedPhotoStreamSettingEnabled](self, "isSharedPhotoStreamSettingEnabled"))
      {
        id v8 = objc_alloc(&OBJC_CLASS___TVPSharedPSMainViewController);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController photoLibrary](self, "photoLibrary"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController libraryFilterState](self, "libraryFilterState"));
        id v11 = -[TVPSharedPSMainViewController initWithPhotoLibrary:libraryFilterState:]( v8,  "initWithPhotoLibrary:libraryFilterState:",  v9,  v10);

        -[TVPRootViewController _launchAppViewPostAuthenticationWithController:]( self,  "_launchAppViewPostAuthenticationWithController:",  v11);
      }

      else
      {
        id v12 = objc_alloc(&OBJC_CLASS___TVPMyPSMainViewController);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController photoLibrary](self, "photoLibrary"));
        id v11 = -[TVPPhotoLibraryFeedCollectionViewController initWithPhotoLibrary:](v12, "initWithPhotoLibrary:", v13);

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController photoLibrary](self, "photoLibrary"));
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 librarySpecificFetchOptions]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  1LL,  100LL,  v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
        -[TVPSharedPSMainViewController setPhotoStreamFeedCollection:](v11, "setPhotoStreamFeedCollection:", v17);

        -[TVPRootViewController _launchAppViewPostAuthenticationWithController:]( self,  "_launchAppViewPostAuthenticationWithController:",  v11);
      }

      -[TVPRootViewController _removeAllViews](self, "_removeAllViews");
    }
  }

  else if (self->_didPerformLoginAction)
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001217C;
    v19[3] = &unk_1000C9D18;
    objc_copyWeak(&v20, &location);
    -[TVPRootViewController _enableICloudPhotoSettingsWithCompletion:]( self,  "_enableICloudPhotoSettingsWithCompletion:",  v19);
    -[TVPRootViewController _displayActivityIndicatorView](self, "_displayActivityIndicatorView");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVPRootViewController _displayiCloudPromptView](self, "_displayiCloudPromptView");
  }

- (void)_resetFlags
{
  self->_didPerformLoginAction = 0;
  self->_isAuthenticationInProgress = 0;
}

- (void)_launchAppViewPostAuthenticationWithController:(id)a3
{
  id v19 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootViewController]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 topViewController]);
  uint64_t v10 = objc_opt_class(v19, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v12 addObject:v19];
    [v7 setViewControllers:v12 animated:0];
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryTabViewController, v11);
  if ((objc_opt_isKindOfClass(v19, v13) & 1) != 0)
  {
    id v14 = v19;
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController photoLibrary](self, "photoLibrary"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 librarySpecificFetchOptions]);

    uint64_t v17 = 1LL;
    [v16 setFetchLimit:1];
    [v16 setShouldPrefetchCount:1];
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  4LL,  0x7FFFFFFFFFFFFFFFLL,  v16));
    if (![v18 count])
    {
      if (!TVPPreferencesHasWelcomeScreenDisplayed())
      {
LABEL_8:

        goto LABEL_9;
      }

      uint64_t v17 = 0LL;
    }

    [v14 navigateToTabMode:v17 animated:0 completionBlock:0];
    goto LABEL_8;
  }

- (void)_enableICloudPhotoSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_10001271C;
  v40 = sub_10001272C;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_10001271C;
  v34 = sub_10001272C;
  id v35 = 0LL;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100012734;
  v24[3] = &unk_1000C9DD8;
  objc_copyWeak(&v28, &location);
  id v26 = &v36;
  v27 = &v30;
  id v5 = v4;
  id v25 = v5;
  unsigned __int8 v6 = objc_retainBlock(v24);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"iCPLPromptTitle" value:&stru_1000CC6C8 table:0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"iCPLPromptMessage" value:&stru_1000CC6C8 table:0]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v10,  1LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"iCPLPromptUseiCPL" value:&stru_1000CC6C8 table:0]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v6));
  BOOL v15 = (void *)v37[5];
  v37[5] = v14;

  [v11 addAction:v37[5]];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"iCPLPromptUseShared" value:&stru_1000CC6C8 table:0]);
  uint64_t v18 = objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v6));
  id v19 = (void *)v31[5];
  v31[5] = v18;

  [v11 addAction:v31[5]];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100012904;
  v22[3] = &unk_1000C9E00;
  objc_copyWeak(&v23, &location);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v22));
  [v11 addAction:v20];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController navigationController](self, "navigationController"));
  [v21 presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (void)_enableAuthenticateSettingsWithAuthenticationType:(int64_t)a3 block:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100012C20;
  v36[3] = &unk_1000C97F0;
  id v9 = a5;
  id v37 = v9;
  uint64_t v10 = objc_retainBlock(v36);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100012C34;
  v33[3] = &unk_1000C9E28;
  id v11 = v8;
  id v34 = v11;
  id v12 = v10;
  id v35 = v12;
  uint64_t v13 = objc_retainBlock(v33);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController accountManager](self, "accountManager"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activeAccount]);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100012C98;
  v28[3] = &unk_1000C9EA0;
  id v16 = v15;
  id v29 = v16;
  uint64_t v30 = self;
  uint64_t v17 = v12;
  id v31 = v17;
  uint64_t v18 = v13;
  id v32 = v18;
  id v19 = objc_retainBlock(v28);
  if (v16)
  {
    if (self->_didPerformLoginAction)
    {
      v18[2](v18);
    }

    else
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___CPSSystemAuthenticationRequest);
      [v20 setService:3];
      [v20 setOptions:1];
      if (a3 == 1) {
        objc_msgSend(v20, "setOptions:", (unint64_t)objc_msgSend(v20, "options") | 4);
      }
      id v21 = [[CPSAuthenticationSession alloc] initWithRequest:v20];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100012F90;
      v26[3] = &unk_1000C9EC8;
      v27 = v18;
      [v21 setSessionFinishedHandler:v26];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000130A0;
      v23[3] = &unk_1000C9F18;
      __int128 v24 = v19;
      id v25 = v17;
      [v21 setSessionFailedHandler:v23];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10001327C;
      v22[3] = &unk_1000C9528;
      void v22[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v22, 0.3);
      [v21 start];
    }
  }

  else
  {
    ((void (*)(void *, void))v17[2])(v17, 0LL);
  }
}

- (void)turnOnWelcomeSectionType:(int64_t)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000133E0;
  v7[3] = &unk_1000C9F40;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100013434;
  v5[3] = &unk_1000C9F68;
  objc_copyWeak(&v6, &location);
  -[TVPRootViewController _enableAuthenticateSettingsWithAuthenticationType:block:completion:]( self,  "_enableAuthenticateSettingsWithAuthenticationType:block:completion:",  a3 != 0,  v7,  v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (BOOL)_handleTurnOniCloud:(BOOL)a3 withError:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRootViewController accountManager](self, "accountManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);

  unsigned int v8 = objc_msgSend(v7, "tvp_setSharedAlbumsEnabled:error:", 1, a4);
  BOOL v9 = !a3;
  BOOL v10 = !a3 & v8;
  if (!v9 && v8)
  {
    if (objc_msgSend(v7, "tvp_setCPLEnabled:error:", 1, a4))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v11 setObject:&__kCFBooleanTrue forKey:@"MemoriesContentEnabled"];

      BOOL v10 = 1;
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (TVSiCloudAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (TVPSignInLandingView)landingView
{
  return self->_landingView;
}

- (void)setLandingView:(id)a3
{
}

- (TVPSignInLandingView)iCloudPromptView
{
  return self->_iCloudPromptView;
}

- (void)setICloudPromptView:(id)a3
{
}

- (TVPiCloudPhotosWelcomeViewController)iCloudWelcomeViewController
{
  return self->_iCloudWelcomeViewController;
}

- (void)setICloudWelcomeViewController:(id)a3
{
}

- (TVPErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (BOOL)didPerformLoginAction
{
  return self->_didPerformLoginAction;
}

- (void)setDidPerformLoginAction:(BOOL)a3
{
  self->_didPerformLoginAction = a3;
}

- (BOOL)isAuthenticationInProgress
{
  return self->_isAuthenticationInProgress;
}

- (void)setIsAuthenticationInProgress:(BOOL)a3
{
  self->_isAuthenticationInProgress = a3;
}

- (TVPPhotoLibraryOptInOfferViewController)photoLibraryOptInOfferViewController
{
  return (TVPPhotoLibraryOptInOfferViewController *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPhotoLibraryOptInOfferViewController:(id)a3
{
}

- (TVPPhotoLibraryTabViewController)tabViewController
{
  return self->_tabViewController;
}

- (void)setTabViewController:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
}

@end