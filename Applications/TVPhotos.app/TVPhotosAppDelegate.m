@interface TVPhotosAppDelegate
- (BOOL)_isDisplayingPhotoStreamContent;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)didFinishAppLaunch;
- (BOOL)isPhotoPickerModeEnabled;
- (BOOL)screenSaverModeEnabled;
- (PHPhotoLibrary)photoLibrary;
- (TVPhotosAppDelegate)init;
- (TVPhotosAppDelegateTesting)applicationTesting;
- (TVPiCloudPhotoSettings)iCloudSettings;
- (UIViewController)photoPickerViewController;
- (UIWindow)window;
- (void)_deactivateApplication;
- (void)_displayActivityIndicator;
- (void)_performAppLaunchForScheme:(id)a3;
- (void)_setUpScreensaverPickerUI;
- (void)_tvs_enableMyPhotoStreamPostUpdateForAccount:(id)a3;
- (void)_tvs_enableSharedPhotoStreamPostUpdateForAccount:(id)a3;
- (void)_updateApplicationUIWithRootController:(id)a3 forceRefresh:(BOOL)a4;
- (void)_updateCRDPreferencesWithImage:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)iCloudAccountStatusChanged:(id)a3;
- (void)internetAvailabilityChanged:(id)a3;
- (void)photoPickerViewController:(id)a3 selectedPhotoAsset:(id)a4;
- (void)setDidFinishAppLaunch:(BOOL)a3;
- (void)setICloudSettings:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPhotoPickerModeEnabled:(BOOL)a3;
- (void)setPhotoPickerViewController:(id)a3;
- (void)setScreenSaverModeEnabled:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVPhotosAppDelegate

- (TVPhotosAppDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPhotosAppDelegate;
  v2 = -[TVPhotosAppDelegate init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVPhotosAppDelegateTesting);
    applicationTesting = v2->_applicationTesting;
    v2->_applicationTesting = v3;

    -[TVPhotosAppDelegateTesting setDelegate:](v2->_applicationTesting, "setDelegate:", v2);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v5;
  }

  return v2;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "resourceSpecifier", a3));
  -[TVPhotosAppDelegate _performAppLaunchForScheme:](self, "_performAppLaunchForScheme:", v6);

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  PLDebugEnableCoreDataMultithreadedAsserts();
  PXApplicationAudioSessionSetCategory(1LL, &stru_1000CA330);
  v6 = objc_alloc(&OBJC_CLASS___UIWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 bounds];
  objc_super v8 = -[UIWindow initWithFrame:](v6, "initWithFrame:");
  window = self->_window;
  self->_window = v8;

  -[UIWindow setAlpha:](self->_window, "setAlpha:", 1.0);
  v10 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v14]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:@"MyPhotoStreamImages"]);
  +[TVAssetLibrary initializeAssetLibraryWithCachePath:]( &OBJC_CLASS___TVAssetLibrary,  "initializeAssetLibraryWithCachePath:",  v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVPhotos"));
  v18 = objc_alloc_init(&OBJC_CLASS___TVPScreenSaverService);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v19 registerAppWithProviderObject:v18];

  v20 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v20, "activeAccount"));
  if ([v21 isAuthenticated])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aa_personID"));
    [v17 setObject:v22 forKey:@"userAccount"];
  }

  else
  {
    [v17 setObject:0 forKey:@"userAccount"];
  }

  if (objc_msgSend(v21, "tvs_sharedPhotoStreamEnabled")
    && ([v21 isEnabledForDataclass:kAccountDataclassSharedStreams] & 1) == 0)
  {
    -[TVPhotosAppDelegate _tvs_enableSharedPhotoStreamPostUpdateForAccount:]( self,  "_tvs_enableSharedPhotoStreamPostUpdateForAccount:",  v21);
    [v17 setBool:1 forKey:@"__showICPLOptInOfferPreferencesKey"];
  }

  if (objc_msgSend(v21, "tvs_myPhotoStreamEnabled")
    && ([v21 isEnabledForDataclass:kAccountDataclassMediaStream] & 1) == 0)
  {
    -[TVPhotosAppDelegate _tvs_enableMyPhotoStreamPostUpdateForAccount:]( self,  "_tvs_enableMyPhotoStreamPostUpdateForAccount:",  v21);
    [v17 setBool:1 forKey:@"__showICPLOptInOfferPreferencesKey"];
  }

  v23 = objc_alloc_init(&OBJC_CLASS___TVPiCloudPhotoSettings);
  iCloudSettings = self->_iCloudSettings;
  self->_iCloudSettings = v23;

  -[TVPiCloudPhotoSettings setUserAuthenticated:]( self->_iCloudSettings,  "setUserAuthenticated:",  [v21 isAuthenticated]);
  -[TVPiCloudPhotoSettings setICloudPhotoLibraryEnabled:]( self->_iCloudSettings,  "setICloudPhotoLibraryEnabled:",  objc_msgSend(v21, "tvs_iCloudPhotoLibraryEnabled"));
  -[TVPiCloudPhotoSettings setMyPhotoStreamEnabled:]( self->_iCloudSettings,  "setMyPhotoStreamEnabled:",  objc_msgSend(v21, "tvs_myPhotoStreamEnabled"));
  -[TVPiCloudPhotoSettings setSharedPhotoStreamsEnabled:]( self->_iCloudSettings,  "setSharedPhotoStreamsEnabled:",  objc_msgSend(v21, "tvs_sharedPhotoStreamEnabled"));
  -[TVPiCloudPhotoSettings setDisplayingError:](self->_iCloudSettings, "setDisplayingError:", 0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v25 addObserver:self selector:"iCloudAccountStatusChanged:" name:ACAccountStoreDidChangeNotification object:0];

  +[PXRemoteDiagnosticsService startServerOnInternalDevicesWithAgentClass:]( &OBJC_CLASS___PXRemoteDiagnosticsService,  "startServerOnInternalDevicesWithAgentClass:",  objc_opt_class(&OBJC_CLASS___TVPDiagnosticsAgent, v26));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  +[CPAnalytics setupWithConfigurationFilename:inBundle:]( &OBJC_CLASS___CPAnalytics,  "setupWithConfigurationFilename:inBundle:",  @"CPAnalyticsConfig-TVPhotos",  v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate photoLibrary](self, "photoLibrary"));
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:]( &OBJC_CLASS___CPAnalytics,  "setupSystemPropertyProvidersForLibrary:",  v28);

  +[CPAnalytics startAppTracking](&OBJC_CLASS___CPAnalytics, "startAppTracking");
  PXAnalyticsPrepare(+[CPAnalytics startViewTracking](&OBJC_CLASS___CPAnalytics, "startViewTracking"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](&OBJC_CLASS___PXPreloadScheduler, "sharedScheduler"));
  [v29 scheduleDeferredTaskWithQoS:1 block:&stru_1000CA350];

  TVPPreferencesSetWelcomeScreenDisplayed(0LL);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_URLForKey:", UIApplicationLaunchOptionsURLKey));

  if (v30)
  {
    v31 = objc_alloc_init(&OBJC_CLASS___TVPNavigationController);
  }

  else
  {
    v32 = objc_alloc_init(&OBJC_CLASS___TVPRootViewController);
    v31 = -[TVPNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVPNavigationController),  "initWithRootViewController:",  v32);
    self->_didFinishAppLaunch = 1;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v33 addObserver:self selector:"internetAvailabilityChanged:" name:kATVInternetAvailabilityChanged object:0];
  }

  -[TVPNavigationController pu_configureAsRootViewController](v31, "pu_configureAsRootViewController");
  -[TVPhotosAppDelegate setWindow:](self, "setWindow:", self->_window);
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v31);
  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");

  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  if (-[TVPhotosAppDelegate screenSaverModeEnabled](self, "screenSaverModeEnabled", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
    -[TVPhotosAppDelegate _updateApplicationUIWithRootController:forceRefresh:]( self,  "_updateApplicationUIWithRootController:forceRefresh:",  v4,  1LL);
    -[TVPhotosAppDelegate setScreenSaverModeEnabled:](self, "setScreenSaverModeEnabled:", 0LL);
  }

- (void)applicationWillResignActive:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](&OBJC_CLASS___PLPhotoLibrary, "systemPhotoLibrary", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetsdClient]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudInternalClient]);
  [v6 syncCloudPhotoLibrary];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate window](self, "window"));
  if (v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate window](self, "window"));
    unsigned __int8 v9 = [v8 isKeyWindow];

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 windows]);
      id v12 = [v11 count];

      if (v12 == (id)1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 windows]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate window](self, "window"));

        if (v15 == v16)
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate window](self, "window"));
          [v17 makeKeyWindow];
        }
      }
    }
  }

- (void)applicationWillTerminate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self];
}

- (void)iCloudAccountStatusChanged:(id)a3
{
  v11 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v11, "activeAccount"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVPhotos"));
  if ([v4 isAuthenticated])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 topViewController]);
    if (-[TVPiCloudPhotoSettings isUserAuthenticated](self->_iCloudSettings, "isUserAuthenticated")
      || ![v4 isAuthenticated])
    {
      if (-[TVPiCloudPhotoSettings isiCloudPhotoLibraryEnabled](self->_iCloudSettings, "isiCloudPhotoLibraryEnabled")
        && !objc_msgSend(v4, "tvs_iCloudPhotoLibraryEnabled")
        || !-[TVPiCloudPhotoSettings isiCloudPhotoLibraryEnabled](self->_iCloudSettings, "isiCloudPhotoLibraryEnabled")
        && (objc_msgSend(v4, "tvs_iCloudPhotoLibraryEnabled") & 1) != 0
        || -[TVPiCloudPhotoSettings isSharedPhotoStreamsEnabled](self->_iCloudSettings, "isSharedPhotoStreamsEnabled")
        && !objc_msgSend(v4, "tvs_sharedPhotoStreamEnabled")
        || !-[TVPiCloudPhotoSettings isSharedPhotoStreamsEnabled](self->_iCloudSettings, "isSharedPhotoStreamsEnabled")
        && (objc_msgSend(v4, "tvs_sharedPhotoStreamEnabled") & 1) != 0
        || -[TVPiCloudPhotoSettings isMyPhotoStreamEnabled](self->_iCloudSettings, "isMyPhotoStreamEnabled")
        && !objc_msgSend(v4, "tvs_myPhotoStreamEnabled")
        || !-[TVPiCloudPhotoSettings isMyPhotoStreamEnabled](self->_iCloudSettings, "isMyPhotoStreamEnabled")
        && objc_msgSend(v4, "tvs_myPhotoStreamEnabled"))
      {
        -[TVPiCloudPhotoSettings setICloudPhotoLibraryEnabled:]( self->_iCloudSettings,  "setICloudPhotoLibraryEnabled:",  objc_msgSend(v4, "tvs_iCloudPhotoLibraryEnabled"));
        -[TVPiCloudPhotoSettings setSharedPhotoStreamsEnabled:]( self->_iCloudSettings,  "setSharedPhotoStreamsEnabled:",  objc_msgSend(v4, "tvs_sharedPhotoStreamEnabled"));
        -[TVPiCloudPhotoSettings setMyPhotoStreamEnabled:]( self->_iCloudSettings,  "setMyPhotoStreamEnabled:",  objc_msgSend(v4, "tvs_myPhotoStreamEnabled"));
        -[TVPhotosAppDelegate _updateApplicationUIWithRootController:forceRefresh:]( self,  "_updateApplicationUIWithRootController:forceRefresh:",  v5,  1LL);
      }
    }

    else
    {
      -[TVPiCloudPhotoSettings setUserAuthenticated:](self->_iCloudSettings, "setUserAuthenticated:", 1LL);
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
      [v6 setObject:v8 forKey:@"userAccount"];

      uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVPRootViewController, v9);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0) {
        [v7 updateAuthenticationStatus];
      }
    }
  }

  else
  {
    [v6 setObject:&stru_1000CC6C8 forKey:@"userAccount"];
    -[TVPiCloudPhotoSettings resetAccountSettings](self->_iCloudSettings, "resetAccountSettings");
    -[TVPhotosAppDelegate _updateApplicationUIWithRootController:forceRefresh:]( self,  "_updateApplicationUIWithRootController:forceRefresh:",  v5,  0LL);
  }
}

- (void)internetAvailabilityChanged:(id)a3
{
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController", a3));
  unsigned int v4 = +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable");
  if ((v4 & 1) != 0)
  {
    p_iCloudSettings = &self->_iCloudSettings;
    unsigned int v6 = -[TVPiCloudPhotoSettings isDisplayingError](*p_iCloudSettings, "isDisplayingError");
    v7 = v13;
    if (v6)
    {
      +[TVPiCloudAccountUtilities handleNetworkAvailabilityChangeWithRootController:]( &OBJC_CLASS___TVPiCloudAccountUtilities,  "handleNetworkAvailabilityChangeWithRootController:",  v13);
LABEL_6:
      -[TVPiCloudPhotoSettings setDisplayingError:](*p_iCloudSettings, "setDisplayingError:", v4 ^ 1);
      v7 = v13;
    }
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v13 topViewController]);
    uint64_t v10 = objc_opt_class(v8, v9);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVPRootViewController, v11);

    v7 = v13;
    if (v10 != v12)
    {
      +[TVPiCloudAccountUtilities handleNetworkAvailabilityChangeWithRootController:]( &OBJC_CLASS___TVPiCloudAccountUtilities,  "handleNetworkAvailabilityChangeWithRootController:",  v13);
      p_iCloudSettings = &self->_iCloudSettings;
      goto LABEL_6;
    }
  }
}

- (void)photoPickerViewController:(id)a3 selectedPhotoAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v9);
  [v10 setNetworkAccessAllowed:1];
  [v10 setDeliveryMode:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001F460;
  v23[3] = &unk_1000CA378;
  v23[4] = self;
  uint64_t v11 = objc_retainBlock(v23);
  -[TVPhotosAppDelegate _displayActivityIndicator](self, "_displayActivityIndicator");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  id v17 = [v12 scale];
  double v19 = PXSizeScale(v17, v14, v16, v18);
  double v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
  objc_msgSend(v22, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v10, v11, v19, v21);
}

- (void)_updateCRDPreferencesWithImage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v4 setConferenceRoomDisplayBackgroundPhoto:v3];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"Screen_Saver_Albums" value:&stru_1000CC6C8 table:0]);
  [v7 setConferenceRoomDisplayBackgroundPhotoName:v6];
}

- (void)_displayActivityIndicator
{
  id v5 = objc_alloc_init(&OBJC_CLASS___TVPActivityIndicatorViewController);
  -[TVPActivityIndicatorViewController setActivityIndicatorDelay:](v5, "setActivityIndicatorDelay:", 0.0);
  -[UIViewController presentViewController:animated:completion:]( self->_photoPickerViewController,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
  id v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_deactivateApplication");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1000D1B10);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPActivityIndicatorViewController view](v5, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)_deactivateApplication
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v3 deactivateApplication];

  -[UIViewController dismissViewControllerAnimated:completion:]( self->_photoPickerViewController,  "dismissViewControllerAnimated:completion:",  0LL,  0LL);
}

- (void)_updateApplicationUIWithRootController:(id)a3 forceRefresh:(BOOL)a4
{
}

- (void)_performAppLaunchForScheme:(id)a3
{
  id v8 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
  if ([v8 containsString:@"AllPhotos"])
  {
    -[TVPhotosAppDelegate _setUpScreensaverPickerUI](self, "_setUpScreensaverPickerUI");
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unsigned int v6 = objc_alloc_init(&OBJC_CLASS___TVPRootViewController);
    [v5 addObject:v6];
    [v4 setViewControllers:v5 animated:0];
  }

  if (!self->_didFinishAppLaunch)
  {
    self->_didFinishAppLaunch = 1;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:self selector:"internetAvailabilityChanged:" name:kATVInternetAvailabilityChanged object:0];
  }
}

- (BOOL)_isDisplayingPhotoStreamContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 topViewController]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_setUpScreensaverPickerUI
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___TVPScreenSaverViewController);
  unsigned int v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 setViewControllers:v5];

  -[TVPhotosAppDelegate setScreenSaverModeEnabled:](self, "setScreenSaverModeEnabled:", 1LL);
}

- (void)_tvs_enableMyPhotoStreamPostUpdateForAccount:(id)a3
{
  uint64_t v3 = kAccountDataclassMediaStream;
  id v4 = a3;
  [v4 setEnabled:1 forDataclass:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 accountStore]);
  [v5 saveAccount:v4 withCompletionHandler:&stru_1000CA398];
}

- (void)_tvs_enableSharedPhotoStreamPostUpdateForAccount:(id)a3
{
  uint64_t v3 = kAccountDataclassSharedStreams;
  id v4 = a3;
  [v4 setEnabled:1 forDataclass:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 accountStore]);
  [v5 saveAccount:v4 withCompletionHandler:&stru_1000CA3B8];
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegate applicationTesting](self, "applicationTesting"));
  unsigned __int8 v12 = [v11 application:v10 runTest:v9 options:v8];

  return v12;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isPhotoPickerModeEnabled
{
  return self->_photoPickerModeEnabled;
}

- (void)setPhotoPickerModeEnabled:(BOOL)a3
{
  self->_photoPickerModeEnabled = a3;
}

- (TVPiCloudPhotoSettings)iCloudSettings
{
  return self->_iCloudSettings;
}

- (void)setICloudSettings:(id)a3
{
}

- (BOOL)didFinishAppLaunch
{
  return self->_didFinishAppLaunch;
}

- (void)setDidFinishAppLaunch:(BOOL)a3
{
  self->_didFinishAppLaunch = a3;
}

- (BOOL)screenSaverModeEnabled
{
  return self->_screenSaverModeEnabled;
}

- (void)setScreenSaverModeEnabled:(BOOL)a3
{
  self->_screenSaverModeEnabled = a3;
}

- (UIViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setPhotoPickerViewController:(id)a3
{
}

- (TVPhotosAppDelegateTesting)applicationTesting
{
  return self->_applicationTesting;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end