@interface TVHRootViewController
+ (TVHRootViewController)new;
- (OS_dispatch_source)mediaLibrariesWaitTimer;
- (TVHKMediaLibrary)currentMediaLibrary;
- (TVHKStateMachine)stateMachine;
- (TVHMediaLibrariesEnviroment)mediaLibrariesEnviroment;
- (TVHRootViewController)init;
- (TVHRootViewController)initWithCoder:(id)a3;
- (TVHRootViewController)initWithMediaLibrariesEnviroment:(id)a3;
- (TVHRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHRootViewControllerDelegate)delegate;
- (TVHURL)openURL;
- (id)_activityIndicatorViewController;
- (id)_browseViewControllersAndClearOpenURLWithMediaLibrary:(id)a3;
- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4;
- (id)_mediaLibrariesManager;
- (id)_mediaLibraryForOpenURL:(id)a3;
- (id)_mediaLibraryPickerViewController;
- (id)_noMediaLibrariesDiscoveredViewController;
- (id)_setupHomeSharingViewController;
- (id)preferredFocusEnvironments;
- (void)_addViewControllerToNavigationController:(id)a3 animate:(BOOL)a4 removePlaybackViewControllers:(BOOL)a5 otherViewControllersToRemove:(id)a6;
- (void)_configureStateMachine;
- (void)_didFinish;
- (void)_dismissRestartingMediaLibraryDiscoveryViewController;
- (void)_enqueueAsyncMainQueueBlock:(id)a3;
- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3;
- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3;
- (void)_presentConnectionFailedDialogWithMediaLibrary:(id)a3 completionHandler:(id)a4;
- (void)_presentFatalErrorDialogWithError:(id)a3;
- (void)_presentRestartingMediaLibraryDiscoveryViewController;
- (void)_registerStateMachineHandlers;
- (void)_removePlaybackViewControllerAnimated:(BOOL)a3;
- (void)_showPlaybackViewController:(id)a3 animate:(BOOL)a4 canReuseExistingViewController:(BOOL)a5 viewControllersToRemove:(id)a6;
- (void)_showViewController:(id)a3 animate:(BOOL)a4 removePlaybackViewControllers:(BOOL)a5 otherViewControllersToRemove:(id)a6;
- (void)_startListentingToMediaLibraryRelatedNotifications;
- (void)_startMediaLibrariesWaitTimer;
- (void)_stopListentingToMediaLibraryRelatedNotifications;
- (void)_stopMediaLibrariesWaitTimer;
- (void)_updateMediaLibraryPickerController;
- (void)accountSetupViewController:(id)a3 didSucceedWithAccountName:(id)a4;
- (void)accountSetupViewControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)mediaLibraryPickerViewController:(id)a3 didPickMediaLibrary:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)restartMediaLibraryDiscoveryForNoMediaLibrariesDiscoveredViewController:(id)a3;
- (void)setCurrentMediaLibrary:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaLibrariesWaitTimer:(id)a3;
- (void)setOpenURL:(id)a3;
- (void)showMediaEntityCollectionForMediaItem:(id)a3 mediaEntityCollectionType:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVHRootViewController

+ (TVHRootViewController)new
{
  return 0LL;
}

- (TVHRootViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHRootViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHRootViewController)initWithMediaLibrariesEnviroment:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrariesEnviroment");
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  v6 = -[TVHRootViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrariesEnviroment, a3);
    v8 = objc_alloc(&OBJC_CLASS___TVHKStateMachine);
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = -[TVHKStateMachine initWithName:initialState:mode:]( v8,  "initWithName:initialState:mode:",  v11,  @"__StateIdle",  0LL);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v12;

    -[TVHRootViewController _configureStateMachine](v7, "_configureStateMachine");
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  -[TVHRootViewController dealloc](&v4, "dealloc");
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v6, "tvhk_setObjectIfNotNil:forKey:", v4, @"URL");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v5 postEvent:@"UISceneDidDisconnect" withContext:0 userInfo:v6];
}

- (void)showMediaEntityCollectionForMediaItem:(id)a3 mediaEntityCollectionType:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIViewController tvh_mediaEntityCollectionViewControllerForMediaItem:mediaEntityCollectionType:]( &OBJC_CLASS___UIViewController,  "tvh_mediaEntityCollectionViewControllerForMediaItem:mediaEntityCollectionType:",  a3,  a4));
  if (v5)
  {
    v6 = v5;
    -[TVHRootViewController _showViewController:animate:removePlaybackViewControllers:otherViewControllersToRemove:]( self,  "_showViewController:animate:removePlaybackViewControllers:otherViewControllersToRemove:",  v5,  1LL,  1LL,  0LL);
    id v5 = v6;
  }
}

- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4
{
  id v4 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (void)_didFinish
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHRootViewController delegate](self, "delegate"));
  [v3 rootViewControllerDidFinish:self];
}

- (void)_showViewController:(id)a3 animate:(BOOL)a4 removePlaybackViewControllers:(BOOL)a5 otherViewControllersToRemove:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  objc_super v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v11,  @"ViewController");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v15, "tvhk_setObjectIfNotNil:forKey:", v12, @"Animate");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v13,  @"RemovePlaybackViewControllers");

  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v10,  @"ViewControllersToRemove");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v14 postEvent:@"EventShowViewController" withContext:0 userInfo:v15];
}

- (void)_showPlaybackViewController:(id)a3 animate:(BOOL)a4 canReuseExistingViewController:(BOOL)a5 viewControllersToRemove:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  objc_super v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v11,  @"ViewController");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v15, "tvhk_setObjectIfNotNil:forKey:", v12, @"Animate");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v13,  @"CanReuseExistingPlaybackViewController");

  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v15,  "tvhk_setObjectIfNotNil:forKey:",  v10,  @"ViewControllersToRemove");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v14 postEvent:@"EventShowPlaybackViewController" withContext:0 userInfo:v15];
}

- (void)_removePlaybackViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v7, "tvhk_setObjectIfNotNil:forKey:", v5, @"Animate");

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v6 postEvent:@"EventRemovePlaybackViewController" withContext:0 userInfo:v7];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  -[TVHRootViewController viewDidLoad](&v5, "viewDidLoad");
  -[TVHRootViewController _startListentingToMediaLibraryRelatedNotifications]( self,  "_startListentingToMediaLibraryRelatedNotifications");
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___TVHNavigationController);
  -[TVHRootViewController tvh_setFullViewChildViewController:](self, "tvh_setFullViewChildViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleNavigationControllerDidDisplayViewControllerNotification:" name:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  -[TVHRootViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v4 postEvent:@"ViewDidAppear"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  -[TVHRootViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v4 postEvent:@"ViewDidDisappear"];
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHRootViewController _navigationController](self, "_navigationController"));
  BOOL v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)accountSetupViewController:(id)a3 didSucceedWithAccountName:(id)a4
{
  id v4 = sub_100079F98();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "TVHAccountSetupViewController has succeeded",  v6,  2u);
  }
}

- (void)accountSetupViewControllerDidCancel:(id)a3
{
  id v4 = sub_100079F98();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "TVHAccountSetupViewController has been cancelled",  v6,  2u);
  }

  -[TVHRootViewController _didFinish](self, "_didFinish");
}

- (void)mediaLibraryPickerViewController:(id)a3 didPickMediaLibrary:(id)a4
{
  v8 = @"MediaLibrary";
  id v9 = a4;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  [v7 postEvent:@"DidPickMediaLibrary" withContext:0 userInfo:v6];
}

- (void)restartMediaLibraryDiscoveryForNoMediaLibrariesDiscoveredViewController:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine", a3));
  [v3 postEvent:@"RestartMediaLibraryDiscovery"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100155F58 == a6)
  {
    id v13 = sub_100079F98();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received KVO notification that the media server discovery configuration has changed.",  buf,  2u);
    }

    objc_super v15 = &stru_1000FDCF8;
    goto LABEL_10;
  }

  if (off_100155F60 == a6)
  {
    id v16 = sub_100079F98();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received KVO notification that the media libraries have changed.",  buf,  2u);
    }

    objc_super v15 = &stru_1000FDD18;
LABEL_10:
    -[TVHRootViewController _enqueueAsyncMainQueueBlock:](self, "_enqueueAsyncMainQueueBlock:", v15);
    goto LABEL_11;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHRootViewController;
  -[TVHRootViewController observeValueForKeyPath:ofObject:change:context:]( &v18,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_11:
}

- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_numberForKey:", TVHKMediaLibraryConnectionStateUserInfoKeyToState));
  if (v5 && v7)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003A4C4;
    block[3] = &unk_1000FCED0;
    objc_copyWeak(&v12, &location);
    id v9 = v5;
    id v10 = self;
    id v11 = v7;
    dispatch_async(&_dispatch_main_q, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ViewController"]);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v9 = @"ViewController";
    uint64_t v10 = v5;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
    [v8 postEvent:@"NavigationControllerDidShowViewController" withContext:0 userInfo:v7];
  }
}

- (void)_configureStateMachine
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  id v3 = sub_100079F98();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v5 setLogObject:v4];

  [v5 setShouldAcceptEvents:1];
}

- (void)_registerStateMachineHandlers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](self, "stateMachine"));
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_10003B1F4;
  v65[3] = &unk_1000FDD80;
  v65[4] = self;
  v66 = &stru_1000FDD58;
  id v4 = objc_retainBlock(v65);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10003B620;
  v62[3] = &unk_1000FDDA8;
  objc_copyWeak(&v64, &location);
  id v5 = v4;
  id v63 = v5;
  uint64_t v6 = objc_retainBlock(v62);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10003B698;
  v59[3] = &unk_1000FD948;
  objc_copyWeak(&v61, &location);
  BOOL v7 = v5;
  id v60 = v7;
  [v3 registerHandlerForEvent:@"ViewDidAppear" onState:@"__StateIdle" withBlock:v59];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_10003B74C;
  v57[3] = &unk_1000FD310;
  objc_copyWeak(&v58, &location);
  [v3 registerHandlerForEvent:@"ViewDidDisappear" onState:@"ShowingFatalError" withBlock:v57];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10003B7C0;
  v54[3] = &unk_1000FD948;
  objc_copyWeak(&v56, &location);
  v8 = v7;
  id v55 = v8;
  [v3 registerDefaultHandlerForEvent:@"UISceneDidDisconnect" withBlock:v54];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10003B8B8;
  v51[3] = &unk_1000FD948;
  objc_copyWeak(&v53, &location);
  id v9 = v8;
  id v52 = v9;
  [v3 registerHandlerForEvent:@"MediaLibrariesWaitTimerDidFire" onState:@"WaitingForMediaLibraries" withBlock:v51];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10003B92C;
  v49[3] = &unk_1000FD310;
  objc_copyWeak(&v50, &location);
  [v3 registerDefaultHandlerForEvent:@"NavigationControllerDidShowViewController" withBlock:v49];
  v69[0] = @"ShowingNoMediaLibraries";
  v69[1] = @"WaitingForMediaLibraries";
  v69[2] = @"ShowingFatalError";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 3LL));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10003BAD8;
  v46[3] = &unk_1000FD948;
  objc_copyWeak(&v48, &location);
  id v11 = v9;
  id v47 = v11;
  [v3 registerHandlerForEvent:@"MediaLibrariesDidChange" onStates:v10 withBlock:v46];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10003BB4C;
  v43[3] = &unk_1000FDDD0;
  objc_copyWeak(&v45, &location);
  v43[4] = self;
  id v16 = v11;
  id v44 = v16;
  [v3 registerHandlerForEvent:@"MediaLibrariesDidChange" onState:@"ShowingMediaLibraryPicker" withBlock:v43];
  v68[0] = @"ConnectingMediaLibrary";
  v68[1] = @"BrowsingMediaLibrary";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10003BC04;
  v41[3] = &unk_1000FD338;
  objc_copyWeak(&v42, &location);
  v41[4] = self;
  [v3 registerHandlerForEvent:@"MediaLibrariesDidChange" onStates:v12 withBlock:v41];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10003BD80;
  v39[3] = &unk_1000FD310;
  objc_copyWeak(&v40, &location);
  [v3 registerHandlerForEvent:@"RestartMediaLibraryDiscovery" onState:@"ShowingNoMediaLibraries" withBlock:v39];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10003BE2C;
  v36[3] = &unk_1000FD948;
  objc_copyWeak(&v38, &location);
  v37 = &stru_1000FDD58;
  [v3 registerHandlerForEvent:@"DidPickMediaLibrary" onState:@"ShowingMediaLibraryPicker" withBlock:v36];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10003BF30;
  v34[3] = &unk_1000FD310;
  objc_copyWeak(&v35, &location);
  [v3 registerDefaultHandlerForEvent:@"MediaLibraryPickerDocumentWillAppear" withBlock:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10003BFA8;
  v31[3] = &unk_1000FD948;
  objc_copyWeak(&v33, &location);
  id v13 = v6;
  id v32 = v13;
  [v3 registerDefaultHandlerForEvent:@"MediaServerDiscoveryConfigurationDidChange" withBlock:v31];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10003C01C;
  v29[3] = &unk_1000FD310;
  objc_copyWeak(&v30, &location);
  [v3 registerHandlerForEvent:@"CurrentMediaLibraryConnectionStateDidChange" onState:@"ConnectingMediaLibrary" withBlock:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10003C2F8;
  v26[3] = &unk_1000FD948;
  objc_copyWeak(&v28, &location);
  v14 = v13;
  id v27 = v14;
  [v3 registerHandlerForEvent:@"CurrentMediaLibraryConnectionStateDidChange" onState:@"BrowsingMediaLibrary" withBlock:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10003C410;
  v23[3] = &unk_1000FD948;
  objc_copyWeak(&v25, &location);
  objc_super v15 = v14;
  id v24 = v15;
  [v3 registerHandlerForEvent:@"FinishedShowingConnectionFailedError" onState:@"ShowingConnectionFailedError" withBlock:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003C4D0;
  v21[3] = &unk_1000FD310;
  objc_copyWeak(&v22, &location);
  [v3 registerHandlerForEvent:@"EventShowViewController" onState:@"BrowsingMediaLibrary" withBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10003C5F4;
  v19[3] = &unk_1000FD338;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  [v3 registerHandlerForEvent:@"EventShowPlaybackViewController" onState:@"BrowsingMediaLibrary" withBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003C760;
  v17[3] = &unk_1000FD310;
  objc_copyWeak(&v18, &location);
  [v3 registerHandlerForEvent:@"EventRemovePlaybackViewController" onState:@"BrowsingMediaLibrary" withBlock:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v64);

  objc_destroyWeak(&location);
}

- (id)_activityIndicatorViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVHLoadingViewController);
}

- (id)_mediaLibraryPickerViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaLibraries]);

  id v5 = -[TVHMediaLibraryPickerViewController initWithMediaLibraries:]( objc_alloc(&OBJC_CLASS___TVHMediaLibraryPickerViewController),  "initWithMediaLibraries:",  v4);
  -[TVHMediaLibraryPickerViewController setMediaLibraryPickerDelegate:](v5, "setMediaLibraryPickerDelegate:", self);

  return v5;
}

- (void)_updateMediaLibraryPickerController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _navigationController](self, "_navigationController"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v3 viewControllers]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryPickerViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaLibraries]);

    [v4 updateWithMediaLibraries:v7];
  }
}

- (id)_noMediaLibrariesDiscoveredViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 discoveryConfiguration]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homeSharingAccountName]);
  uint64_t v6 = -[TVHNoMediaLibrariesDiscoveredViewController initWithAccountName:]( objc_alloc(&OBJC_CLASS___TVHNoMediaLibrariesDiscoveredViewController),  "initWithAccountName:",  v5);
  -[TVHNoMediaLibrariesDiscoveredViewController setDelegate:](v6, "setDelegate:", self);

  return v6;
}

- (id)_setupHomeSharingViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVHAccountSetupViewController);
  -[TVHAccountSetupViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)_presentConnectionFailedDialogWithMediaLibrary:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([a3 title]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"CONNECITON_ERROR_TITLE_FORMAT" value:0 table:0]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"CONNECTION_ERROR_MESSAGE" value:0 table:0]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"OK_BUTTON_TITLE" value:0 table:0]);

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  v12,  1LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003CBFC;
  v18[3] = &unk_1000FDDF8;
  id v19 = v6;
  id v16 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  v18));
  [v15 addAction:v17];
  -[TVHRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
}

- (void)_presentFatalErrorDialogWithError:(id)a3
{
  int IsErrorCode = TVHKErrorIsErrorCode(a3, -2LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  if (IsErrorCode)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"APPLICATION_STARTUP_FAILURE_NETWORK_UNAVAILABLE_TITLE" value:0 table:0]);

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = v7;
    id v9 = @"APPLICATION_STARTUP_FAILURE_NETWORK_UNAVAILABLE_MESSAGE";
  }

  else
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"APPLICATION_STARTUP_FAILURE_MESSAGE_TITLE" value:0 table:0]);

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = v7;
    id v9 = @"APPLICATION_STARTUP_FAILURE_MESSAGE_BODY";
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:0 table:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v15,  v10,  1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"OK_BUTTON_TITLE" value:0 table:0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  &stru_1000FDE38));

  [v11 addAction:v14];
  -[TVHRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_presentRestartingMediaLibraryDiscoveryViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController presentedViewController](self, "presentedViewController"));

  if (!v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TVHLoadingViewController);
    -[TVHLoadingViewController setActivityIndicatorDelay:](v4, "setActivityIndicatorDelay:", 0.0);
    -[TVHRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v4,  1LL,  0LL);
  }

- (void)_dismissRestartingMediaLibraryDiscoveryViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController presentedViewController](self, "presentedViewController"));

  if (v3) {
    -[TVHRootViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
  }
}

- (id)_browseViewControllersAndClearOpenURLWithMediaLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController openURL](self, "openURL"));
  -[TVHRootViewController setOpenURL:](self, "setOpenURL:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHRootViewController _browseViewControllersWithMediaLibrary:openURL:]( self,  "_browseViewControllersWithMediaLibrary:openURL:",  v4,  v5));

  id v7 = sub_100079F98();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Returning browse view controllers: %@. URL=%@",  (uint8_t *)&v10,  0x16u);
  }

  return v6;
}

- (id)_mediaLibrariesManager
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController mediaLibrariesEnviroment](self, "mediaLibrariesEnviroment"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaLibrariesManager]);

  return v3;
}

- (void)_enqueueAsyncMainQueueBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D088;
  block[3] = &unk_1000FD2E8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startListentingToMediaLibraryRelatedNotifications
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v5 addObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" options:1 context:off_100155F58];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
  [v3 addObserver:self forKeyPath:@"mediaLibraries" options:1 context:off_100155F60];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleMediaLibraryConnectionStateDidChangeNotification:" name:TVHKMediaLibraryConnectionStateDidChangeNotification object:0];
}

- (void)_stopListentingToMediaLibraryRelatedNotifications
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v5 removeObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" context:off_100155F58];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
  [v3 removeObserver:self forKeyPath:@"mediaLibraries" context:off_100155F60];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:TVHKMediaLibraryConnectionStateDidChangeNotification object:0];
}

- (id)_mediaLibraryForOpenURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaServerIdentifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _mediaLibrariesManager](self, "_mediaLibrariesManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaLibraryForMediaServerIdentifier:v4]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_startMediaLibrariesWaitTimer
{
  id v3 = sub_100079F98();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting media libraries wait timer.",  (uint8_t *)buf,  2u);
  }

  id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  -[TVHRootViewController setMediaLibrariesWaitTimer:](self, "setMediaLibrariesWaitTimer:", v5);
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003D3EC;
  handler[3] = &unk_1000FCEF8;
  objc_copyWeak(&v8, buf);
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_stopMediaLibrariesWaitTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController mediaLibrariesWaitTimer](self, "mediaLibrariesWaitTimer"));

  if (v3)
  {
    id v4 = sub_100079F98();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping media libraries wait timer.", v7, 2u);
    }

    dispatch_time_t v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController mediaLibrariesWaitTimer](self, "mediaLibrariesWaitTimer"));
    dispatch_source_cancel(v6);

    -[TVHRootViewController setMediaLibrariesWaitTimer:](self, "setMediaLibrariesWaitTimer:", 0LL);
  }

- (void)_addViewControllerToNavigationController:(id)a3 animate:(BOOL)a4 removePlaybackViewControllers:(BOOL)a5 otherViewControllersToRemove:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v17 = a3;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _navigationController](self, "_navigationController"));
  __int16 v12 = v11;
  if (v7) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvh_viewControllersWithNoPlaybackViewControllers"));
  }
  else {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 viewControllers]);
  }
  v14 = v13;
  id v15 = [v13 mutableCopy];
  id v16 = v15;
  if (v10) {
    [v15 removeObjectsInArray:v10];
  }
  if (v17) {
    [v16 addObject:v17];
  }
  [v12 setViewControllers:v16 animated:v8];
}

- (TVHMediaLibrariesEnviroment)mediaLibrariesEnviroment
{
  return self->_mediaLibrariesEnviroment;
}

- (TVHRootViewControllerDelegate)delegate
{
  return (TVHRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHKStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (TVHURL)openURL
{
  return self->_openURL;
}

- (void)setOpenURL:(id)a3
{
}

- (TVHKMediaLibrary)currentMediaLibrary
{
  return self->_currentMediaLibrary;
}

- (void)setCurrentMediaLibrary:(id)a3
{
}

- (OS_dispatch_source)mediaLibrariesWaitTimer
{
  return self->_mediaLibrariesWaitTimer;
}

- (void)setMediaLibrariesWaitTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end