@interface TVMusicAppDelegate_Old
+ (BOOL)_shouldLaunchForScreensaverWithLaunchOptions:(id)a3;
+ (void)initialize;
- (AMSBag)appBag;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)isAppInitialized;
- (BOOL)isAppViewVisible;
- (BOOL)shouldBeForcedLeftToRight;
- (BOOL)supportsIdleModeVisualEffects;
- (MPCLyricsReportingController)lyricsReportingController;
- (NSDictionary)launchOptions;
- (NSString)activeAccountIdentifier;
- (NSString)itmlPageFeatureName;
- (PBSSuppressNowPlayingBulletinAssertion)nowPlayingBulletinAssertion;
- (TVMusicJSAppController)subscriptionsAppController;
- (TVMusicPlayer)player;
- (UINavigationController)navigationController;
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
- (void)_showTabNamed:(id)a3;
- (void)_subscriptionChangedNotification:(id)a3;
- (void)_updateActiveAccountIfChanged;
- (void)activateAndShowNowPlaying;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)didShowViewController;
- (void)launchAppWithCompletionHandler:(id)a3;
- (void)openJavascriptAppWithURL:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAppBag:(id)a3;
- (void)setAppInitialized:(BOOL)a3;
- (void)setAppViewVisible:(BOOL)a3;
- (void)setItmlPageFeatureName:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setLyricsReportingController:(id)a3;
- (void)setNowPlayingBulletinAssertion:(id)a3;
- (void)setPerformWhenVisibleBlock:(id)a3;
- (void)setSubscriptionsAppController:(id)a3;
- (void)showPrivacyNotice;
- (void)systemServicePresentNowPlayingUI;
@end

@implementation TVMusicAppDelegate_Old

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "AppDelegate");
  v3 = (void *)qword_1002BE7A8;
  qword_1002BE7A8 = (uint64_t)v2;
}

- (UINavigationController)navigationController
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old appController](self, "appController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 navigationController]);

  return (UINavigationController *)v3;
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old navigationController](self, "navigationController"));
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)openJavascriptAppWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "openJavascriptAppWithURL:%@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scheme]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
  id v10 = [v9 length];

  if (v10)
  {
    v20[0] = @"showAlbum";
    v20[1] = @"showArtist";
    v20[2] = @"showPlaylist";
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
    unsigned int v12 = [v8 containsObject:v11];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v4,  0LL));
      [v13 setScheme:@"tvmusic"];
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 URL]);

      v15 = (os_log_s *)qword_1002BE7A8;
      if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "openJavascriptAppWithURL adjusted URL:%@",  buf,  0xCu);
      }

      goto LABEL_10;
    }

- (TVMusicPlayer)player
{
  return +[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer");
}

- (AMSBag)appBag
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E7AC;
  block[3] = &unk_100268CF0;
  block[4] = self;
  if (qword_1002BE7B0 != -1) {
    dispatch_once(&qword_1002BE7B0, block);
  }
  return self->_appBag;
}

- (void)systemServicePresentNowPlayingUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000218A8;
  block[3] = &unk_100268D60;
  v3 = &stru_100269B80;
  dispatch_async(&_dispatch_main_q, block);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  -[TVMusicAppDelegate_Old setLaunchOptions:](self, "setLaunchOptions:", v5);
  unsigned int v7 = objc_msgSend((id)objc_opt_class(self, v6), "_shouldLaunchForScreensaverWithLaunchOptions:", v5);

  if (v7)
  {
    -[TVMusicAppDelegate_Old _registerScreenSaverService](self, "_registerScreenSaverService");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
    [v8 setScreenSaverWithName:0 style:0 extraInfo:0 showConfirmation:0 completion:0];
  }

  else
  {
    -[TVMusicAppDelegate_Old _initializeApp](self, "_initializeApp");
  }

  return 1;
}

- (void)_initializeApp
{
  v3 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "TVMusic app is performing one-time initialization.",  buf,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v29 = @"TVMusicNowPlayingManagerIdleLyricsEnabledKey";
  v30 = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  [v4 registerDefaults:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AVResourceReclamationController defaultController]( &OBJC_CLASS___AVResourceReclamationController,  "defaultController"));
  [v6 permitReclamationWhileSuspended];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVMusicInterfaceFactory,  "sharedInterfaceFactory"));
  [v7 setup];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 systemServiceProxy]);
  [v9 registerNowPlayingDelegate:self];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  -[TVMusicAppDelegate_Old _updateActiveAccountIfChanged](self, "_updateActiveAccountIfChanged");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v13 = TVPPlaybackCurrentMediaItemDidChangeNotification;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old player](self, "player"));
  [v12 addObserver:self selector:"_playerMediaItemDidChange:" name:v13 object:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old player](self, "player"));
  [v12 addObserver:self selector:"_playbackLeaseEnded:" name:@"TVMusicPlayerLeaseDidEndNotification" object:v15];

  [v12 addObserver:self selector:"_accountChangedNotification:" name:ICActiveUserIdentityDidChangeNotification object:v10];
  [v12 addObserver:self selector:"_subscriptionChangedNotification:" name:TVMusicSubscriptionStatusChangedNotification object:v11];
  [v12 addObserver:self selector:"_playlistMediaChangeRequested:" name:TVPPlaylistMediaChangeRequestedNotification object:0];
  +[MPMediaQuery setFilteringDisabled:](&OBJC_CLASS___MPMediaQuery, "setFilteringDisabled:", 1LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  [v16 setCloudFilteringType:0];
  [v16 beginGeneratingLibraryChangeNotifications];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v17 becomeActive];

  -[TVMusicAppDelegate_Old _registerScreenSaverService](self, "_registerScreenSaverService");
  id v18 = +[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance");
  v19 = objc_alloc_init(&OBJC_CLASS___MPCLyricsReportingController);
  lyricsReportingController = self->_lyricsReportingController;
  self->_lyricsReportingController = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old launchOptions](self, "launchOptions"));
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVMusicAppDelegate_Old;
  -[TVMusicAppDelegate_Old application:didFinishLaunchingWithOptions:]( &v27,  "application:didFinishLaunchingWithOptions:",  v21,  v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[MPUbiquitousPlaybackPositionController sharedUbiquitousPlaybackPositionController]( &OBJC_CLASS___MPUbiquitousPlaybackPositionController,  "sharedUbiquitousPlaybackPositionController"));
  [v23 beginUsingPlaybackPositionMetadata];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicHUDController sharedInstance](&OBJC_CLASS___TVMusicHUDController, "sharedInstance"));
  [v24 startObserving];

  id v25 = +[ICAgeVerificationManager defaultManager](&OBJC_CLASS___ICAgeVerificationManager, "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  [v26 setup];

  -[TVMusicAppDelegate_Old setAppInitialized:](self, "setAppInitialized:", 1LL);
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v45 = v9;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TVMusic openURL: %@ options: %@", buf, 0x16u);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
  if (![v12 isEqualToString:@"nowplaying"])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v14 = [v13 isEqualToString:@"show-now-playing"];

    if (v14) {
      goto LABEL_6;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v22 = [v21 isEqualToString:@"play"];

    if (v22)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10001F1D8;
      v40[3] = &unk_100268B30;
      v40[4] = self;
      id v41 = v9;
      -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", v40);
      v23 = v41;
LABEL_12:

      goto LABEL_20;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v25 = [v24 isEqualToString:@"MUSICPRIVACY"];

    if (v25)
    {
      -[TVMusicAppDelegate_Old showPrivacyNotice](self, "showPrivacyNotice");
      goto LABEL_20;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
    unsigned int v27 = [v26 isEqualToString:@"internal"];

    if (v27)
    {
      id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v42 = @"url";
      id v43 = v9;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      [v28 postNotificationName:@"TVMusicAppOpenURLNotification" object:self userInfo:v29];
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 host]);
      unsigned int v31 = [v30 isEqualToString:@"showtab"];

      if (!v31)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_10001F1F0;
        v36[3] = &unk_100268B30;
        v36[4] = self;
        id v37 = v9;
        -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", v36);
        v23 = v37;
        goto LABEL_12;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v32 stringByTrimmingCharactersInSet:v33]);

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10001F1E4;
      v38[3] = &unk_100268B30;
      v38[4] = self;
      id v39 = v34;
      id v28 = v34;
      -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", v38);
    }

    goto LABEL_20;
  }

LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance"));
  unsigned __int8 v16 = [v15 isNowPlayingVisible];

  if ((v16 & 1) == 0) {
    -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", &stru_100269BA0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old player](self, "player"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));

  if (v18 == v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old player](self, "player"));
    [v20 play];
  }

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activityType]);
  unsigned int v8 = [v7 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 webpageURL]);
    id v10 = v9;
    BOOL v11 = v9 != 0LL;
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001F304;
      v13[3] = &unk_100268B30;
      v13[4] = self;
      id v14 = v9;
      -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", v13);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldLaunchForScreensaverWithLaunchOptions:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:UIApplicationLaunchOptionsURLKey]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    if ([v4 applicationState] == (id)2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
      if ([v5 isEqualToString:PBSSystemServiceSpecialLaunchScheme])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
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
  os_log_t v2 = objc_alloc_init(&OBJC_CLASS___TVMusicScreenSaverService);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v3 registerAppWithProviderObject:v2];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverService sharedInstance](&OBJC_CLASS___TVScreenSaverService, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001F4D4;
  v6[3] = &unk_100269BC8;
  unsigned __int8 v7 = v2;
  id v5 = v2;
  [v4 setDefaultRequestHandler:v6];
}

- (void)_performWhenVisible:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (-[TVMusicAppDelegate_Old isAppViewVisible](self, "isAppViewVisible")) {
    v4[2]();
  }
  else {
    -[TVMusicAppDelegate_Old setPerformWhenVisibleBlock:](self, "setPerformWhenVisibleBlock:", v4);
  }
}

- (void)_playFromURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 path]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);

    if (v6)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByTrimmingCharactersInSet:v8]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"persistentID"]);
      id v12 = [v11 longLongValue];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"storeID"]);

      v15 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"radioStationID"]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([&off_100282560 objectForKeyedSubscript:v9]);
      id v18 = v17;
      if (v17)
      {
        id v19 = [v17 unsignedLongValue];
        if (v12)
        {
          v20 = (TVMusicPlaybackIntent *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  v12));
          +[TVMusicPlaybackHelper playItemType:withPersistentID:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withPersistentID:",  v19,  v20);
LABEL_6:

LABEL_32:
          goto LABEL_33;
        }

        if ([v16 length] && v19 == (id)13)
        {
          +[TVMusicRadioUtilities playFromStationStringID:playActivityFeatureName:playActivityRecommendationData:]( &OBJC_CLASS___TVMusicRadioUtilities,  "playFromStationStringID:playActivityFeatureName:playActivityRecommendationData:",  v16,  @"url",  0LL);
          goto LABEL_32;
        }

        if ([v14 length])
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVMSubscriptionManager sharedInstance]( &OBJC_CLASS___TVMSubscriptionManager,  "sharedInstance"));
          unsigned int v25 = [v24 hasMusicSubscription];

          if (!v25)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            v30 = (void *)objc_claimAutoreleasedReturnValue([v3 queryParameters]);
            unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"artworkURL"]);

            if (v31)
            {
              id v43 = @"url";
              v44 = v31;
              v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
              [v29 setObject:v32 forKeyedSubscript:@"artwork"];
            }

            v33 = &off_10026C780;
            if (v19 != (id)6) {
              v33 = off_10026C618;
            }
            [v29 setObject:*v33 forKeyedSubscript:@"kind"];
            dispatch_time_t v34 = dispatch_time(0LL, 500000000LL);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10001FAE8;
            block[3] = &unk_100268CF0;
            id v35 = v29;
            id v38 = v35;
            dispatch_after(v34, &_dispatch_main_q, block);
            v36 = (os_log_s *)qword_1002BE7A8;
            if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v3;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Attempted to play [%@] without a subscription",  buf,  0xCu);
            }

            goto LABEL_32;
          }

          v26 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
          id v45 = v14;
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v45,  1LL));
          v20 = -[TVMusicPlaybackIntent initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:]( v26,  "initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:",  v27,  0LL,  0LL,  0LL);

          if (v19 == (id)6) {
            uint64_t v28 = 3LL;
          }
          else {
            uint64_t v28 = 1LL;
          }
          -[TVMusicPlaybackIntent setPlaybackType:](v20, "setPlaybackType:", v28);
          +[TVMusicPlaybackHelper playWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playWithPlaybackIntent:",  v20);
          goto LABEL_6;
        }

        unsigned int v22 = (os_log_s *)qword_1002BE7A8;
        if (!os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 138412546;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v3;
        v23 = "Invalid play query parameter (must be persistentID or storeID) for type [%@] in [%@]";
      }

      else
      {
        if ([v9 isEqualToString:@"library"])
        {
          +[TVMusicPlaybackHelper shuffleAllLibrarySongs](&OBJC_CLASS___TVMusicPlaybackHelper, "shuffleAllLibrarySongs");
          goto LABEL_32;
        }

        unsigned int v22 = (os_log_s *)qword_1002BE7A8;
        if (!os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 138412546;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v3;
        v23 = "Unknown play item type [%@] in [%@]";
      }

      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      goto LABEL_32;
    }
  }

  v21 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Not enough parameters for play command in [%@]",  buf,  0xCu);
  }

- (void)_showTabNamed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", &off_1002820A8));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v6 = [v5 hasMusicSubscription];

  if ((v6 & 1) == 0)
  {
    [v4 removeObject:@"browse"];
    goto LABEL_5;
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed];

  if (v8 != 1) {
LABEL_5:
  }
    [v4 removeObject:@"videos"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);
  id v10 = [v4 indexOfObject:v9];

  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = (os_log_s *)qword_1002BE7A8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unknown tab name [%@]",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    id v14 = sub_10001FD10;
    v15 = &unk_100269BE8;
    id v16 = v10;
    id v12 = v13;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v14((uint64_t)v12);
    }

    else
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      id v18 = sub_1000218B4;
      id v19 = &unk_100268D60;
      v20 = v12;
      dispatch_async(&_dispatch_main_q, &buf);
    }
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  if (objc_msgSend( objc_msgSend((id)objc_opt_class(self, v5), "superclass"),  "instancesRespondToSelector:",  "applicationWillEnterForeground:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVMusicAppDelegate_Old;
    -[TVMusicAppDelegate_Old applicationWillEnterForeground:](&v7, "applicationWillEnterForeground:", v4);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v6 becomeActive];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TVMusic app did enter background.", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicAppDelegate_Old;
  -[TVMusicAppDelegate_Old applicationDidEnterBackground:](&v7, "applicationDidEnterBackground:", v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v6 resignActive];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1002BE7A8;
  if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TVMusic app did become active.", v10, 2u);
  }

  if (-[TVMusicAppDelegate_Old isAppInitialized](self, "isAppInitialized")) {
    -[TVMusicAppDelegate_Old _updateActiveAccountIfChanged](self, "_updateActiveAccountIfChanged");
  }
  else {
    -[TVMusicAppDelegate_Old _initializeApp](self, "_initializeApp");
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old window](self, "window"));
  [v6 makeKeyWindow];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
  if (!v7)
  {
    unsigned int v8 = -[PBSSuppressNowPlayingBulletinAssertion initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PBSSuppressNowPlayingBulletinAssertion),  "initWithIdentifier:",  @"com.apple.TVMusic.TVMusicAppDelegate");
    -[TVMusicAppDelegate_Old setNowPlayingBulletinAssertion:](self, "setNowPlayingBulletinAssertion:", v8);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
  [v9 acquire];
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion", a3));

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old nowPlayingBulletinAssertion](self, "nowPlayingBulletinAssertion"));
    [v5 relinquish];
  }

- (void)_setSpotlightRegistrationWithAccountIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    unsigned int v5 = [v4 hasMusicSubscription];

    unsigned __int8 v6 = (os_log_s *)qword_1002BE7A8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109378;
      v11[1] = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting spotlight subscription status: %{BOOL}d for identifier: %@",  (uint8_t *)v11,  0x12u);
    }

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSSubscriptionManager sharedManager](&OBJC_CLASS___CSSubscriptionManager, "sharedManager"));
    unsigned int v8 = v7;
    if (v5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      [v8 registerSubscriptionWithInfo:v3 expirationDate:v9];
    }

    else
    {
      [v7 unregisterSubscriptionWithInfo:v3];
    }
  }

  else
  {
    id v10 = (os_log_s *)qword_1002BE7A8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Can't set spotlight subscription status, no account identifier has been set.",  (uint8_t *)v11,  2u);
    }
  }
}

- (void)activateAndShowNowPlaying
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
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
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://internal/np-launch/?id=%@",  v5,  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v8, 0LL));
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = sub_100020534;
  v36 = sub_100020544;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  BOOL v31 = v3 != 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002054C;
  v24[3] = &unk_100269C10;
  v26 = &v32;
  unsigned int v27 = &v28;
  id v10 = v3;
  id v25 = v10;
  BOOL v11 = objc_retainBlock(v24);
  if (*((_BYTE *)v29 + 24))
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000205EC;
    v21[3] = &unk_100269C38;
    id v22 = v9;
    v23 = v11;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"TVMusicAppOpenURLNotification" object:v13 queue:v14 usingBlock:v21]);
    id v16 = (void *)v33[5];
    v33[5] = v15;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100020670;
  v19[3] = &unk_100269590;
  id v18 = v11;
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
  v8[2] = sub_100020758;
  v8[3] = &unk_100268B30;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[TVMusicAppDelegate_Old _performWhenVisible:](self, "_performWhenVisible:", v8);
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v4 = a4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IKAppContext currentAppContext](&OBJC_CLASS___IKAppContext, "currentAppContext"));
  if (!v5)
  {
    id v6 = (os_log_s *)qword_1002BE7A8;
    if (os_log_type_enabled((os_log_t)qword_1002BE7A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No IKAppContext available: Javascript will not work properly!",  v8,  2u);
    }
  }

  id v7 = -[TVMusicJSObject initWithAppContext:](objc_alloc(&OBJC_CLASS___TVMusicJSObject), "initWithAppContext:", v5);
  [v4 setObject:v7 forKeyedSubscript:@"itms"];

  [v5 setMescalPrimeEnabledForXHRRequests:1];
}

- (BOOL)shouldBeForcedLeftToRight
{
  return 0;
}

- (void)didShowViewController
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000208D8;
  v2[3] = &unk_100268F50;
  v2[4] = self;
  +[TVMusicRestrictionsUI presentExplicitRestrictionAlertIfNeededOfType:completionBlock:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:",  0LL,  v2);
}

- (BOOL)supportsIdleModeVisualEffects
{
  return 0;
}

- (void)_playerMediaItemDidChange:(id)a3
{
}

- (void)_playlistMediaChangeRequested:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance", a3));
  BOOL v5 = [v4 allowsExplicitContent] != 0;

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
  [v6 setSkipExplicit:v5];
}

- (void)_playbackLeaseEnded:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100020BE4;
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
  v2[2] = sub_1000210E8;
  v2[3] = &unk_100269C88;
  v2[4] = self;
  -[TVMusicAppDelegate_Old _getActiveAccountDSIDWithCompletionQueue:completion:]( self,  "_getActiveAccountDSIDWithCompletionQueue:completion:",  &_dispatch_main_q,  v2);
}

- (void)_getActiveAccountDSIDWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_10002146C;
  v11[3] = &unk_100269CD8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)_subscriptionChangedNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000215DC;
  v3[3] = &unk_100269C88;
  v3[4] = self;
  -[TVMusicAppDelegate_Old _getActiveAccountDSIDWithCompletionQueue:completion:]( self,  "_getActiveAccountDSIDWithCompletionQueue:completion:",  &_dispatch_main_q,  v3);
}

- (void)_openMusicSubscriptionsApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old subscriptionsAppController](self, "subscriptionsAppController"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSAppController subscriptionsAppController]( &OBJC_CLASS___TVMusicJSAppController,  "subscriptionsAppController"));
    -[TVMusicAppDelegate_Old setSubscriptionsAppController:](self, "setSubscriptionsAppController:", v4);
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old subscriptionsAppController](self, "subscriptionsAppController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAppDelegate_Old navigationController](self, "navigationController"));
  [v6 launchApplicationWithNavigationController:v5 launchOptions:&off_100282588];
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

- (void).cxx_destruct
{
}

@end