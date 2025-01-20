@interface MTAppDelegate_Shared
- (BOOL)_hasMainWindow;
- (BOOL)_isApplicationActive;
- (BOOL)_isApplicationTerminating;
- (BOOL)_mainWindowIsKey;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canOpenURL:(id)a3;
- (MTAppController)appController;
- (MTAppDelegate_Shared)init;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (MTSiriPlistDumper)siriDumper;
- (NSOperationQueue)updateQueue;
- (PFFairPlayValidationManager)fairPlayValidationManager;
- (UIViewController)rootViewController;
- (UIWindow)window;
- (_TtC18PodcastsFoundation11SiriDonator)siriDonator;
- (int64_t)_hostWindowLayoutDirection;
- (unint64_t)fairPlayMigrationBackgroundTask;
- (void)_setupPlayer;
- (void)_submitForegroundAnalytics;
- (void)_validateFairPlayEpisodes;
- (void)_validateFairPlayEpisodesWithCompletionHandler:(id)a3;
- (void)_verifyFairPlayMigrationWithCompletionHandler:(id)a3;
- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)setAppController:(id)a3;
- (void)setFairPlayMigrationBackgroundTask:(unint64_t)a3;
- (void)setWindow:(id)a3;
- (void)setupAfterBecomingActive;
- (void)storeAccountDidChange;
@end

@implementation MTAppDelegate_Shared

- (MTAppDelegate_Shared)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTAppDelegate_Shared;
  v2 = -[MTAppDelegate_Shared init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.AppDelegateAccountChangeQueue", 0LL);
    accountChangeQueue = v2->_accountChangeQueue;
    v2->_accountChangeQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTAppDelegate_Shared;
  -[MTAppDelegate_Shared dealloc](&v4, "dealloc");
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
  unsigned int v7 = +[MTDBUtil isSupportedUrlString:](&OBJC_CLASS___MTDBUtil, "isSupportedUrlString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
    unsigned int v9 = [v8 hasPrefix:@"feed:http"];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
      v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"feed:",  &stru_100248948,  8,  0,  5));

      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
      id v5 = (id)v12;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 scheme]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);

    if ([v14 hasPrefix:@"itms"])
    {
      int64_t v15 = 1000000000LL;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000088A4;
      v25[3] = &unk_10023FF98;
      id v5 = v5;
      v25[4] = v5;
      v16 = (id *)v25;
    }

    else if ([v14 hasPrefix:@"podcasts"])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000088E8;
      v24[3] = &unk_10023FF98;
      id v5 = v5;
      int64_t v15 = 0LL;
      v24[4] = v5;
      v16 = (id *)v24;
    }

    else
    {
      if (+[DebugUI isDebugUrl:](&OBJC_CLASS___DebugUI, "isDebugUrl:", v5))
      {
        +[DebugUI showDebugUI](&OBJC_CLASS___DebugUI, "showDebugUI");
LABEL_15:

        goto LABEL_16;
      }

      if ([v14 isEqualToString:@"podcast"])
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
        v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"podcast",  @"http",  8,  0,  objc_msgSend(@"podcast", "length")));

        uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));
        id v5 = (id)v19;
      }

      int64_t v15 = 1000000000LL;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10000892C;
      v23[3] = &unk_10023FF98;
      id v5 = v5;
      v23[4] = v5;
      v16 = (id *)v23;
    }

    v20 = objc_retainBlock(v16);

    if (v20)
    {
      dispatch_time_t v21 = dispatch_time(0LL, v15);
      dispatch_after(v21, &_dispatch_main_q, v20);
    }

    goto LABEL_15;
  }

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](&OBJC_CLASS___IMNetworkObserver, "sharedInstance"));
  [v6 beginObserving];

  if (+[DebugUtil isInternalInstall](&OBJC_CLASS___DebugUtil, "isInternalInstall"))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v8 = [v7 BOOLForKey:@"EnableCharlesSupport"];

    if (v8) {
      +[AMSDefaults setIgnoreServerTrustEvaluation:](&OBJC_CLASS___AMSDefaults, "setIgnoreServerTrustEvaluation:", 1LL);
    }
  }

  id v9 = +[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance");
  +[UIViewController swizzleMethodsForMetrics](&OBJC_CLASS___UIViewController, "swizzleMethodsForMetrics");
  +[MTDebugDataManager setup](&OBJC_CLASS___MTDebugDataManager, "setup");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDeviceCapacityMonitor shared](&OBJC_CLASS___MTDeviceCapacityMonitor, "shared"));
  [v10 setActiveNotificationName:MTApplicationDidBecomeActiveNotification];
  id v11 = +[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance");
  if ((os_feature_enabled_bluemoon(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance")) & 1) == 0) {
    -[MTAppDelegate_Shared _setupPlayer](self, "_setupPlayer");
  }
  [v5 setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = MTApplicationDidFinishLaunchingNotification;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v6 postNotificationName:v7 object:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
  id v10 = [v5 applicationState];

  [v9 setUIApplicationState:v10];
  if ((os_feature_enabled_bluemoon(v11) & 1) == 0) {
    dispatch_async(&_dispatch_main_q, &stru_10023FFD8);
  }
  dispatch_async(&_dispatch_main_q, &stru_10023FFF8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"didChangeStoreAccountDSID" name:@"AccountDSIDChangedNotification" object:0];

  uint64_t v14 = _MTLogCategoryDefault();
  int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "MTAppDelegate_Shared SiriX donation will begin",  buf,  2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008D84;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(v17, block);

  dispatch_async(&_dispatch_main_q, &stru_100240018);
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = MTApplicationWillResignActiveNotification;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 postNotificationName:v5 object:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
  id v8 = [v3 applicationState];

  [v7 setUIApplicationState:v8];
  +[MTBaseFeedManager saveSubscriptionMetadata](&OBJC_CLASS___MTBaseFeedManager, "saveSubscriptionMetadata");
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v10 setLastAppUseDate:v9];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = MTApplicationDidEnterBackgroundNotification;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 postNotificationName:v5 object:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
  id v8 = [v3 applicationState];

  [v7 setUIApplicationState:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsController shared](&OBJC_CLASS___PFRestrictionsController, "shared"));
  [v9 stopListening];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v11, &stru_100240038);

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](&OBJC_CLASS___IMNetworkObserver, "sharedInstance"));
  [v12 endObserving];
}

- (void)applicationWillEnterForeground:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](&OBJC_CLASS___IMNetworkObserver, "sharedInstance", a3));
  [v4 beginObserving];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v6 = MTApplicationWillEnterForegroundNotification;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v5 postNotificationName:v6 object:v7];

  +[IMMetrics startTimer:](&OBJC_CLASS___IMMetrics, "startTimer:", @"app_resume");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsController shared](&OBJC_CLASS___PFRestrictionsController, "shared"));
  [v8 startListening];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsController shared](&OBJC_CLASS___PFRestrictionsController, "shared"));
  [v9 reload];

  uint64_t v11 = _MTLogCategoryCloudSync(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[Foreground Sync] Application will enter foreground",  buf,  2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v14, &stru_100240058);

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](&OBJC_CLASS___MTForegroundSyncUtil, "sharedInstance"));
  [v15 updatePlaybackSettingIfNeeded];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](&OBJC_CLASS___MTForegroundSyncUtil, "sharedInstance"));
  [v16 setNeedsSyncing];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](&OBJC_CLASS___MTForegroundSyncUtil, "sharedInstance"));
  [v17 feedUpdateAllPodcastsOnForeground];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTPurchaseControllerWrapper sharedInstance]( &OBJC_CLASS___MTPurchaseControllerWrapper,  "sharedInstance"));
  [v18 syncMusicSubscriptionInformation];

  -[MTAppDelegate_Shared _validateFairPlayEpisodes](self, "_validateFairPlayEpisodes");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[MPCloudController controllerWithUserIdentity:]( &OBJC_CLASS___MPCloudController,  "controllerWithUserIdentity:",  v19));
  [v20 processPendingKeyInvalidations];

  dispatch_time_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[PFSharedDispatchQueues localAssetSupportWorkQueue]( &OBJC_CLASS___PFSharedDispatchQueues,  "localAssetSupportWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000092EC;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(v21, block);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = MTApplicationDidBecomeActiveNotification;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 postNotificationName:v5 object:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
  id v7 = [v3 applicationState];

  [v8 setUIApplicationState:v7];
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  uint64_t v3 = MTApplicationDidReceiveMemoryWarningNotification;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v5 postNotificationName:v3 object:v4];
}

- (void)applicationWillTerminate:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  uint64_t v3 = MTApplicationWillTerminateNotification;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v5 postNotificationName:v3 object:v4];
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
}

- (BOOL)_isApplicationActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v3 = [v2 applicationState] == 0;

  return v3;
}

- (void)_setupPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
  [v2 setChapterMetadataMode:1];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](&OBJC_CLASS___IMAVPlayer, "sharedPlayer"));
  [v3 becomeActiveMediaPlayer];
}

- (void)_validateFairPlayEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  id v4 = [v3 fairPlayMigrationRetryCount];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100009608;
    v5[3] = &unk_10023FF98;
    v5[4] = self;
    -[MTAppDelegate_Shared _validateFairPlayEpisodesWithCompletionHandler:]( self,  "_validateFairPlayEpisodesWithCompletionHandler:",  v5);
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000095F4;
    v6[3] = &unk_10023FF98;
    v6[4] = self;
    -[MTAppDelegate_Shared _verifyFairPlayMigrationWithCompletionHandler:]( self,  "_verifyFairPlayMigrationWithCompletionHandler:",  v6);
  }

- (void)_validateFairPlayEpisodesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PFFairPlayRolloutController sharedInstance]( &OBJC_CLASS___PFFairPlayRolloutController,  "sharedInstance"));
  unsigned int v6 = [v5 isEnabled];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared fairPlayValidationManager](self, "fairPlayValidationManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100009750;
    v13[3] = &unk_1002400C0;
    id v14 = v4;
    id v8 = (_TtC10PodcastsUI23UIStoreResponseDelegate *)v4;
    [v7 validateDownloadedEpisodesWithCompletion:v13];

    id v9 = v14;
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS____TtC10PodcastsUI23UIStoreResponseDelegate);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared secureDownloadRenewalManager](self, "secureDownloadRenewalManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000975C;
    v11[3] = &unk_1002400E8;
    id v12 = v4;
    id v9 = v4;
    [v10 updateDRMKeysForDownloadsWithUrlProtocolDelegate:v8 completionHandler:v11];
  }
}

- (void)_verifyFairPlayMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100009804;
  v8[3] = &unk_100240138;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)setupAfterBecomingActive
{
  uint64_t v3 = _MTLogCategoryDefault(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "MTAppDelegate_Shared setupAfterBecomingActive",  (uint8_t *)&v20,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PFDeferredLaunchTaskCoordinator sharedInstance]( &OBJC_CLASS___PFDeferredLaunchTaskCoordinator,  "sharedInstance"));
  [v5 scheduleDefaultDeferralDeadline];

  BOOL v6 = -[MTAppDelegate_Shared _isApplicationActive](self, "_isApplicationActive");
  if (v6)
  {
    uint64_t v8 = _MTLogCategoryDefault(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "MTAppDelegate_Shared Application is Active!",  (uint8_t *)&v20,  2u);
    }

    if (qword_1002B68B0 != -1) {
      dispatch_once(&qword_1002B68B0, &stru_100240158);
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](&OBJC_CLASS___MTForegroundSyncUtil, "sharedInstance"));
    [v10 syncEverythingIfNeeded];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v12, &stru_1002401B8);

    uint64_t v16 = _MTLogCategoryDatabase(v13, v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 2.0));
      int v20 = 138412290;
      dispatch_time_t v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Will start deleting hidden podcasts in %@ seconds",  (uint8_t *)&v20,  0xCu);
    }

    dispatch_time_t v19 = dispatch_time(0LL, 2000000000LL);
    dispatch_after(v19, &_dispatch_main_q, &stru_1002401F8);
  }

  +[IMMetrics endTimer:](&OBJC_CLASS___IMMetrics, "endTimer:", @"app_resume");
  +[IMMetrics endTimer:](&OBJC_CLASS___IMMetrics, "endTimer:", @"app_launch");
}

- (void)storeAccountDidChange
{
}

- (BOOL)canOpenURL:(id)a3
{
  return 0;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:]( &OBJC_CLASS___MTAccountController,  "iTunesAccountDidChangeForACAccountNotification:",  a3))
  {
    -[MTAppDelegate_Shared storeAccountDidChange](self, "storeAccountDidChange");
  }

- (UIViewController)rootViewController
{
  return 0LL;
}

- (NSOperationQueue)updateQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A19C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B68C0 != -1) {
    dispatch_once(&qword_1002B68C0, block);
  }
  return self->_updateQueue;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (NSString *)a4;
  id v8 = a5;
  uint64_t v9 = ((uint64_t (*)(void))_MTLogCategoryNetwork)();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_retainBlock(v8);
    int v24 = 138412802;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[BackgroundSession] %@ handleEventsForBackgroundURLSession called for session with identifier %@ and completionHandler: %@.",  (uint8_t *)&v24,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PUIAssetDownloaders sharedDownloaders](&OBJC_CLASS___PUIAssetDownloaders, "sharedDownloaders"));
  [v12 registerBackgroundCompletion:v8 forSession:v7];

  if (-[NSString containsString:](v7, "containsString:", @"MTImageDownloader"))
  {
    uint64_t v13 = -[objc_class sharedInstance](NSClassFromString(v7), "sharedInstance");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionCompletionHandler]);

    if (v15)
    {
      uint64_t v17 = ((uint64_t (*)(void))_MTLogCategoryNetwork)();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionCompletionHandler]);
        int v20 = objc_retainBlock(v19);
        int v24 = 138412546;
        v25 = (MTAppDelegate_Shared *)v7;
        __int16 v26 = 2112;
        v27 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "handleEventsForBackgroundURLSession being called BEFORE URLSessionDidFinishEventsForBackgroundURLSession for i dentifier %@.  Invoking existing completionHandler %@.",  (uint8_t *)&v24,  0x16u);
      }

      dispatch_time_t v21 = (void (**)(void))objc_claimAutoreleasedReturnValue([v14 sessionCompletionHandler]);
      v21[2]();

      id v16 = [v14 setSessionCompletionHandler:0];
    }

    uint64_t v22 = _MTLogCategoryNetwork(v16);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Setting sessionCompletionHandler for MTImageDownloader.",  (uint8_t *)&v24,  2u);
    }

    [v14 setSessionCompletionHandler:v8];
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](&OBJC_CLASS___MTFeedManager, "sharedInstance"));
    [v14 handleEventsForBackgroundURLSessionFor:v7 completionHandler:v8];
  }
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  NSLog(@"Will Continue");
  if ([v4 isEqualToString:NSUserActivityTypeBrowsingWeb])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTHandoffController sharedInstance](&OBJC_CLASS___MTHandoffController, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedActivityTypes]);
    unsigned __int8 v5 = [v7 containsObject:v4];
  }

  return v5;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  NSLog(@"Continue Activity! %@", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 activityType]);
  unsigned int v11 = [v10 isEqualToString:NSUserActivityTypeBrowsingWeb];

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 webpageURL]);
    -[MTAppDelegate_Shared application:openURL:options:]( self,  "application:openURL:options:",  v7,  v12,  &__NSDictionary0__struct);
LABEL_5:

    goto LABEL_6;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  @"handoff",  0LL,  v13);

  if ((os_feature_enabled_bluemoon(v14) & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTHandoffController sharedInstance](&OBJC_CLASS___MTHandoffController, "sharedInstance"));
    [v12 continueActivity:v8];
    goto LABEL_5;
  }

- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
}

- (int64_t)_hostWindowLayoutDirection
{
  return 0LL;
}

- (BOOL)_hasMainWindow
{
  return 1;
}

- (BOOL)_mainWindowIsKey
{
  return 1;
}

- (BOOL)_isApplicationTerminating
{
  return 0;
}

- (void)_submitForegroundAnalytics
{
  id v3 = (id)objc_opt_new(&OBJC_CLASS___PFCoreAnalyticsChannel);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent globalRetentionPolicy](&OBJC_CLASS___PFAnalyticsEvent, "globalRetentionPolicy"));
  [v3 sendEvent:v2];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (MTAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (MTSiriPlistDumper)siriDumper
{
  return self->_siriDumper;
}

- (_TtC18PodcastsFoundation11SiriDonator)siriDonator
{
  return self->_siriDonator;
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (PFFairPlayValidationManager)fairPlayValidationManager
{
  return self->_fairPlayValidationManager;
}

- (unint64_t)fairPlayMigrationBackgroundTask
{
  return self->_fairPlayMigrationBackgroundTask;
}

- (void)setFairPlayMigrationBackgroundTask:(unint64_t)a3
{
  self->_fairPlayMigrationBackgroundTask = a3;
}

- (void).cxx_destruct
{
}

@end