@interface TVMusicAppDelegate_New
+ (BOOL)_shouldLaunchForScreensaverWithLaunchOptions:(id)a3;
- (AMSBag)appBag;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)isAppInitialized;
- (BOOL)isAppViewVisible;
- (MPCLyricsReportingController)lyricsReportingController;
- (NSDictionary)launchOptions;
- (NSString)activeAccountIdentifier;
- (NSString)itmlPageFeatureName;
- (OS_dispatch_queue)getDSIDQueue;
- (PBSSuppressNowPlayingBulletinAssertion)nowPlayingBulletinAssertion;
- (TVApplicationController)appController;
- (TVMusicJSAppController)subscriptionsAppController;
- (TVMusicPlayer)player;
- (UINavigationController)navigationController;
- (UIViewController)mainViewController;
- (UIWindow)window;
- (id)performWhenVisibleBlock;
- (void)_getActiveAccountDSIDWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)_initializeApp;
- (void)_openMusicSubscriptionsApp;
- (void)_performWhenVisible:(id)a3;
- (void)_playFromURL:(id)a3;
- (void)_playbackLeaseEnded:(id)a3;
- (void)_playerMediaItemDidChange:(id)a3;
- (void)_playlistMediaChangeRequested:(id)a3;
- (void)_registerScreenSaverService;
- (void)_setSpotlightRegistrationWithAccountIdentifier:(id)a3;
- (void)_subscriptionChangedNotification:(id)a3;
- (void)_updateActiveAccountIfChanged;
- (void)activateAndShowNowPlaying;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)didShowMainViewController;
- (void)launchAppWithCompletionHandler:(id)a3;
- (void)openJavascriptAppWithURL:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAppBag:(id)a3;
- (void)setAppInitialized:(BOOL)a3;
- (void)setAppViewVisible:(BOOL)a3;
- (void)setGetDSIDQueue:(id)a3;
- (void)setItmlPageFeatureName:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setLyricsReportingController:(id)a3;
- (void)setNowPlayingBulletinAssertion:(id)a3;
- (void)setPerformWhenVisibleBlock:(id)a3;
- (void)setSubscriptionsAppController:(id)a3;
- (void)setWindow:(id)a3;
- (void)showPrivacyNotice;
- (void)systemServicePresentNowPlayingUI;
@end

@implementation TVMusicAppDelegate_New

- (UINavigationController)navigationController
{
  return 0LL;
}

- (UIViewController)mainViewController
{
  return (UIViewController *)+[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared");
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New mainViewController](self, "mainViewController"));
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)openJavascriptAppWithURL:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "openJavascriptAppWithURL:%@",  (uint8_t *)&v5,  0xCu);
  }
}

- (TVMusicPlayer)player
{
  return +[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer");
}

- (AMSBag)appBag
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021E5C;
  block[3] = &unk_100268CF0;
  block[4] = self;
  if (qword_1002BE7C0 != -1) {
    dispatch_once(&qword_1002BE7C0, block);
  }
  return self->_appBag;
}

- (void)systemServicePresentNowPlayingUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024CB8;
  block[3] = &unk_100268D60;
  id v3 = &stru_100269D18;
  dispatch_async(&_dispatch_main_q, block);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002BE7C8 != -1) {
    dispatch_once(&qword_1002BE7C8, &stru_100269D38);
  }
  -[TVMusicAppDelegate_New setLaunchOptions:](self, "setLaunchOptions:", v7);
  if (objc_msgSend((id)objc_opt_class(self, v8), "_shouldLaunchForScreensaverWithLaunchOptions:", v7))
  {
    id v9 = +[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary");
    -[TVMusicAppDelegate_New _registerScreenSaverService](self, "_registerScreenSaverService");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
    [v10 setScreenSaverWithName:0 style:0 extraInfo:0 showConfirmation:0 completion:0];
  }

  else
  {
    -[TVMusicAppDelegate_New _initializeApp](self, "_initializeApp");
  }

  return 1;
}

- (void)_initializeApp
{
  id v3 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "TVMusic app is performing one-time initialization.",  v35,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v36 = @"TVMusicNowPlayingManagerIdleLyricsEnabledKey";
  v37 = &__kCFBooleanTrue;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
  [v4 registerDefaults:v5];

  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TVMusic.TVMusicAppDelegate.GetDSID", v7);
  getDSIDQueue = self->_getDSIDQueue;
  self->_getDSIDQueue = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[AVResourceReclamationController defaultController]( &OBJC_CLASS___AVResourceReclamationController,  "defaultController"));
  [v10 permitReclamationWhileSuspended];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVMusicInterfaceFactory,  "sharedInterfaceFactory"));
  [v11 setup];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 systemServiceProxy]);
  [v13 registerNowPlayingDelegate:self];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  -[TVMusicAppDelegate_New _updateActiveAccountIfChanged](self, "_updateActiveAccountIfChanged");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v17 = TVPPlaybackCurrentMediaItemDidChangeNotification;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New player](self, "player"));
  [v16 addObserver:self selector:"_playerMediaItemDidChange:" name:v17 object:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New player](self, "player"));
  [v16 addObserver:self selector:"_playbackLeaseEnded:" name:@"TVMusicPlayerLeaseDidEndNotification" object:v19];

  [v16 addObserver:self selector:"_accountChangedNotification:" name:ICActiveUserIdentityDidChangeNotification object:v14];
  [v16 addObserver:self selector:"_subscriptionChangedNotification:" name:TVMusicSubscriptionStatusChangedNotification object:v15];
  [v16 addObserver:self selector:"_playlistMediaChangeRequested:" name:TVPPlaylistMediaChangeRequestedNotification object:0];
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification mainViewControllerDidAppear]( &OBJC_CLASS___NSNotification,  "mainViewControllerDidAppear"));
  [v16 addObserver:self selector:"didShowMainViewController" name:v20 object:0];

  +[MPMediaQuery setFilteringDisabled:](&OBJC_CLASS___MPMediaQuery, "setFilteringDisabled:", 1LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  v22 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Completed Media Library initialization.",  v35,  2u);
  }

  [v21 setCloudFilteringType:0];
  [v21 beginGeneratingLibraryChangeNotifications];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v23 becomeActive];

  -[TVMusicAppDelegate_New _registerScreenSaverService](self, "_registerScreenSaverService");
  id v24 = +[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance");
  v25 = objc_alloc_init(&OBJC_CLASS___MPCLyricsReportingController);
  lyricsReportingController = self->_lyricsReportingController;
  self->_lyricsReportingController = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[MPUbiquitousPlaybackPositionController sharedUbiquitousPlaybackPositionController]( &OBJC_CLASS___MPUbiquitousPlaybackPositionController,  "sharedUbiquitousPlaybackPositionController"));
  [v27 beginUsingPlaybackPositionMetadata];

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicHUDController sharedInstance](&OBJC_CLASS___TVMusicHUDController, "sharedInstance"));
  [v28 startObserving];

  id v29 = +[ICAgeVerificationManager defaultManager](&OBJC_CLASS___ICAgeVerificationManager, "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  [v30 setup];

  v31 = objc_alloc_init(&OBJC_CLASS___UIWindow);
  -[TVMusicAppDelegate_New setWindow:](self, "setWindow:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New window](self, "window"));
  [v33 setRootViewController:v32];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New window](self, "window"));
  [v34 makeKeyAndVisible];

  -[TVMusicAppDelegate_New setAppInitialized:](self, "setAppInitialized:", 1LL);
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v9;
    __int16 v53 = 2112;
    id v54 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TVMusic openURL: %@ options: %@", buf, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
  if (![v12 isEqualToString:@"nowplaying"])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v14 = [v13 isEqualToString:@"show-now-playing"];

    if (v14) {
      goto LABEL_6;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v20 = [v19 isEqualToString:@"play"];

    if (v20)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100022B04;
      v45[3] = &unk_100269DA0;
      v45[4] = self;
      id v46 = v9;
      -[TVMusicAppDelegate_New launchAppWithCompletionHandler:](self, "launchAppWithCompletionHandler:", v45);

      goto LABEL_11;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v22 = [v21 isEqualToString:@"MUSICPRIVACY"];

    if (v22)
    {
      -[TVMusicAppDelegate_New showPrivacyNotice](self, "showPrivacyNotice");
      goto LABEL_11;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v24 = [v23 isEqualToString:@"internal"];

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v49 = @"url";
      id v50 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
      [v25 postNotificationName:@"TVMusicAppOpenURLNotification" object:self userInfo:v26];
LABEL_21:

      goto LABEL_22;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v28 = [v27 isEqualToString:@"showtab"];

    if (v28)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByTrimmingCharactersInSet:v30]);

      if ([v25 length])
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v47 = @"tabName";
        v48 = v25;
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
        [v26 postNotificationName:@"TVMusicSetTabNotification" object:self userInfo:v31];

        goto LABEL_21;
      }
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
      unsigned int v33 = [v32 isEqualToString:@"showPlaylist"];

      if (!v33)
      {
        id v35 = v9;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleIdentifier]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 stringByAppendingString:@":"]);

        v39 = (void *)objc_claimAutoreleasedReturnValue([v35 absoluteString]);
        if ([v39 hasPrefix:v38])
        {
          uint64_t v40 = objc_claimAutoreleasedReturnValue( objc_msgSend( v39,  "stringByReplacingCharactersInRange:withString:",  0,  objc_msgSend(v38, "length"),  @"https:"));

          uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v40));
          id v35 = (id)v41;
          v39 = (void *)v40;
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
        [v42 openURL:v35];

        goto LABEL_11;
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue([v9 queryParameters]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"playlistID"]);

      if (v25)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100022B10;
        v43[3] = &unk_100268CF0;
        id v44 = v25;
        -[TVMusicAppDelegate_New _performWhenVisible:](self, "_performWhenVisible:", v43);
      }
    }

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5 = a4;
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activityType]);
  unsigned int v7 = [v6 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 webpageURL]);
    BOOL v9 = v8 != 0LL;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
      [v10 openURL:v8];
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)_shouldLaunchForScreensaverWithLaunchOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:UIApplicationLaunchOptionsURLKey]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    if ([v4 applicationState] == (id)2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
      if ([v5 isEqualToString:PBSSystemServiceSpecialLaunchScheme])
      {
        dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
        unsigned __int8 v7 = [v6 isEqualToString:PBSAppProviderTypeScreenSaver];
      }

      else
      {
        unsigned __int8 v7 = 0;
      }
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_registerScreenSaverService
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVMusicScreenSaverService);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v3 registerAppWithProviderObject:v2];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverService sharedInstance](&OBJC_CLASS___TVScreenSaverService, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100022DC0;
  v6[3] = &unk_100269BC8;
  unsigned __int8 v7 = v2;
  id v5 = v2;
  [v4 setDefaultRequestHandler:v6];
}

- (void)_performWhenVisible:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (-[TVMusicAppDelegate_New isAppViewVisible](self, "isAppViewVisible")) {
    v4[2]();
  }
  else {
    -[TVMusicAppDelegate_New setPerformWhenVisibleBlock:](self, "setPerformWhenVisibleBlock:", v4);
  }
}

- (void)_playFromURL:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138412290;
    id v38 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Play from url [%@]", (uint8_t *)&v37, 0xCu);
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 path]);
  if (v5)
  {
    dispatch_queue_attr_t v6 = (void *)v5;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByTrimmingCharactersInSet:v9]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"persistentID"]);
      id v13 = [v12 longLongValue];

      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"storeID"]);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"radioStationID"]);

      v18 = (void *)objc_claimAutoreleasedReturnValue([&off_1002825B0 objectForKeyedSubscript:v10]);
      v19 = v18;
      if (v18)
      {
        id v20 = [v18 unsignedLongValue];
        if (v13)
        {
          v21 = (TVMusicPlaybackIntent *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  v13));
          +[TVMusicPlaybackHelper playItemType:withPersistentID:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withPersistentID:",  v20,  v21);
LABEL_8:

LABEL_32:
          goto LABEL_33;
        }

        if ([v17 length] && v20 == (id)13)
        {
          +[TVMusicRadioUtilities playFromStationStringID:playActivityFeatureName:playActivityRecommendationData:]( &OBJC_CLASS___TVMusicRadioUtilities,  "playFromStationStringID:playActivityFeatureName:playActivityRecommendationData:",  v17,  @"url",  0LL);
          goto LABEL_32;
        }

        id v26 = [v15 length];
        v27 = (os_log_s *)qword_1002BE7B8;
        BOOL v28 = os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            int v37 = 138412290;
            id v38 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Play from store ID [%@]",  (uint8_t *)&v37,  0xCu);
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue( +[TVMSubscriptionManager sharedInstance]( &OBJC_CLASS___TVMSubscriptionManager,  "sharedInstance"));
          unsigned int v30 = [v29 hasMusicSubscription];

          if (!v30)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"artworkURL"]);

            +[Upsell showPlaybackUpsellWithId:kind:artworkURL:]( &OBJC_CLASS____TtC7TVMusic6Upsell,  "showPlaybackUpsellWithId:kind:artworkURL:",  v15,  v10,  v35);
            v36 = (os_log_s *)qword_1002BE7B8;
            if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
            {
              int v37 = 138412290;
              id v38 = v3;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Attempted to play [%@] without a subscription",  (uint8_t *)&v37,  0xCu);
            }

            goto LABEL_32;
          }

          v31 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
          uint64_t v41 = v15;
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v41,  1LL));
          v21 = -[TVMusicPlaybackIntent initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:]( v31,  "initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:",  v32,  0LL,  0LL,  0LL);

          if (v20 == (id)6) {
            uint64_t v33 = 3LL;
          }
          else {
            uint64_t v33 = 1LL;
          }
          -[TVMusicPlaybackIntent setPlaybackType:](v21, "setPlaybackType:", v33);
          +[TVMusicPlaybackHelper playWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playWithPlaybackIntent:",  v21);
          goto LABEL_8;
        }

        if (!v28) {
          goto LABEL_32;
        }
        int v37 = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        id v40 = v3;
        unsigned int v24 = "Invalid play query parameter (must be persistentID or storeID) for type [%@] in [%@]";
        v25 = v27;
      }

      else
      {
        if ([v10 isEqualToString:@"library"])
        {
          +[TVMusicPlaybackHelper shuffleAllLibrarySongs](&OBJC_CLASS___TVMusicPlaybackHelper, "shuffleAllLibrarySongs");
          goto LABEL_32;
        }

        uint64_t v23 = qword_1002BE7B8;
        if (!os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        int v37 = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        id v40 = v3;
        unsigned int v24 = "Unknown play item type [%@] in [%@]";
        v25 = (os_log_s *)v23;
      }

      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v37, 0x16u);
      goto LABEL_32;
    }
  }

  unsigned int v22 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138412290;
    id v38 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Not enough parameters for play command in [%@]",  (uint8_t *)&v37,  0xCu);
  }

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController", a3));
  [v3 becomeActive];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TVMusic app did enter background.", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v4 resignActive];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TVMusic app did become active.", v10, 2u);
  }

  if (-[TVMusicAppDelegate_New isAppInitialized](self, "isAppInitialized")) {
    -[TVMusicAppDelegate_New _updateActiveAccountIfChanged](self, "_updateActiveAccountIfChanged");
  }
  else {
    -[TVMusicAppDelegate_New _initializeApp](self, "_initializeApp");
  }
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New window](self, "window"));
  [v6 makeKeyWindow];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
  if (!v7)
  {
    id v8 = -[PBSSuppressNowPlayingBulletinAssertion initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PBSSuppressNowPlayingBulletinAssertion),  "initWithIdentifier:",  @"com.apple.TVMusic.TVMusicAppDelegate");
    -[TVMusicAppDelegate_New setNowPlayingBulletinAssertion:](self, "setNowPlayingBulletinAssertion:", v8);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
  [v9 acquire];
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion", a3));

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
    [v5 relinquish];
  }

- (void)_setSpotlightRegistrationWithAccountIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    unsigned int v5 = [v4 hasMusicSubscription];

    dispatch_queue_attr_t v6 = (os_log_s *)qword_1002BE7B8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109378;
      v11[1] = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting spotlight subscription status: %{BOOL}d for identifier: %@",  (uint8_t *)v11,  0x12u);
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSSubscriptionManager sharedManager](&OBJC_CLASS___CSSubscriptionManager, "sharedManager"));
    id v8 = v7;
    if (v5)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      [v8 registerSubscriptionWithInfo:v3 expirationDate:v9];
    }

    else
    {
      [v7 unregisterSubscriptionWithInfo:v3];
    }
  }

  else
  {
    id v10 = (os_log_s *)qword_1002BE7B8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Can't set spotlight subscription status, no account identifier has been set.",  (uint8_t *)v11,  2u);
    }
  }
}

- (void)activateAndShowNowPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@://nowplaying", v3));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
  [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)launchAppWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://internal/np-launch/?id=%@",  v5,  v7));

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v8, 0LL));
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = sub_100023ABC;
  v36 = sub_100023ACC;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  BOOL v31 = v3 != 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100023AD4;
  v24[3] = &unk_100269C10;
  id v26 = &v32;
  v27 = &v28;
  id v10 = v3;
  id v25 = v10;
  v11 = objc_retainBlock(v24);
  if (*((_BYTE *)v29 + 24))
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100023B74;
    v21[3] = &unk_100269C38;
    id v22 = v9;
    uint64_t v23 = v11;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"TVMusicAppOpenURLNotification" object:v13 queue:v14 usingBlock:v21]);
    v16 = (void *)v33[5];
    v33[5] = v15;
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100023BF8;
  v19[3] = &unk_100269590;
  v18 = v11;
  id v20 = v18;
  [v17 openURL:v9 options:&__NSDictionary0__struct completionHandler:v19];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

- (void)showPrivacyNotice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.applemusic"));
  id v4 = objc_alloc(&OBJC_CLASS___OBPrivacySplashController);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 flow]);
  id v6 = [v4 initWithFlow:v5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100023CE0;
  v8[3] = &unk_100268B30;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[TVMusicAppDelegate_New _performWhenVisible:](self, "_performWhenVisible:", v8);
}

- (void)didShowMainViewController
{
  id v3 = (os_log_s *)qword_1002BE7B8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "didShowMainViewController", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100023D94;
  v4[3] = &unk_100268F50;
  v4[4] = self;
  +[TVMusicRestrictionsUI presentExplicitRestrictionAlertIfNeededOfType:completionBlock:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:",  0LL,  v4);
}

- (void)_playerMediaItemDidChange:(id)a3
{
}

- (void)_playlistMediaChangeRequested:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance", a3));
  BOOL v5 = [v4 allowsExplicitContent] != 0;

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
  [v6 setSkipExplicit:v5];
}

- (void)_playbackLeaseEnded:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000240BC;
  v5[3] = &unk_100268B30;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)_updateActiveAccountIfChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002456C;
  v2[3] = &unk_100269C88;
  v2[4] = self;
  -[TVMusicAppDelegate_New _getActiveAccountDSIDWithCompletionQueue:completion:]( self,  "_getActiveAccountDSIDWithCompletionQueue:completion:",  &_dispatch_main_q,  v2);
}

- (void)_getActiveAccountDSIDWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New getDSIDQueue](self, "getDSIDQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_1000248F4;
  v11[3] = &unk_100269CD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)_subscriptionChangedNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100024A64;
  v3[3] = &unk_100269C88;
  v3[4] = self;
  -[TVMusicAppDelegate_New _getActiveAccountDSIDWithCompletionQueue:completion:]( self,  "_getActiveAccountDSIDWithCompletionQueue:completion:",  &_dispatch_main_q,  v3);
}

- (void)_openMusicSubscriptionsApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New subscriptionsAppController](self, "subscriptionsAppController"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSAppController subscriptionsAppController]( &OBJC_CLASS___TVMusicJSAppController,  "subscriptionsAppController"));
    -[TVMusicAppDelegate_New setSubscriptionsAppController:](self, "setSubscriptionsAppController:", v4);
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New subscriptionsAppController](self, "subscriptionsAppController"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_New navigationController](self, "navigationController"));
  [v6 launchApplicationWithNavigationController:v5 launchOptions:&off_1002825D8];
}

- (TVApplicationController)appController
{
  return self->appController;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (NSString)itmlPageFeatureName
{
  return self->_itmlPageFeatureName;
}

- (void)setItmlPageFeatureName:(id)a3
{
}

- (MPCLyricsReportingController)lyricsReportingController
{
  return self->_lyricsReportingController;
}

- (void)setLyricsReportingController:(id)a3
{
}

- (TVMusicJSAppController)subscriptionsAppController
{
  return self->_subscriptionsAppController;
}

- (void)setSubscriptionsAppController:(id)a3
{
}

- (BOOL)isAppViewVisible
{
  return self->_appViewVisible;
}

- (void)setAppViewVisible:(BOOL)a3
{
  self->_appViewVisible = a3;
}

- (id)performWhenVisibleBlock
{
  return self->_performWhenVisibleBlock;
}

- (void)setPerformWhenVisibleBlock:(id)a3
{
}

- (NSString)activeAccountIdentifier
{
  return self->_activeAccountIdentifier;
}

- (void)setActiveAccountIdentifier:(id)a3
{
}

- (BOOL)isAppInitialized
{
  return self->_appInitialized;
}

- (void)setAppInitialized:(BOOL)a3
{
  self->_appInitialized = a3;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
}

- (PBSSuppressNowPlayingBulletinAssertion)nowPlayingBulletinAssertion
{
  return self->_nowPlayingBulletinAssertion;
}

- (void)setNowPlayingBulletinAssertion:(id)a3
{
}

- (void)setAppBag:(id)a3
{
}

- (OS_dispatch_queue)getDSIDQueue
{
  return self->_getDSIDQueue;
}

- (void)setGetDSIDQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end