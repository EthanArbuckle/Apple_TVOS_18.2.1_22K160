@interface TVMusicCloudViewController
+ (void)initialize;
- (BOOL)isViewVisible;
- (TVMusicCloudProgressView)cloudProgressView;
- (TVMusicCloudViewController)init;
- (TVMusicLibraryManager)libraryManager;
- (TVMusicLibraryTopMenuViewController)topMenuViewController;
- (TVSStateMachine)stateMachine;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIView)currentDisplayedView;
- (UIView)noMusicView;
- (id)_menuItems;
- (id)_noMusicView;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)preferredFocusEnvironments;
- (void)_appDidBecomeActiveNotification:(id)a3;
- (void)_handleLibraryState:(int64_t)a3;
- (void)_libraryDidUpdate:(id)a3;
- (void)_musicLibraryStateChanged:(id)a3;
- (void)_musicLibrarySyncProgress:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_removeCloudProgressView;
- (void)_removeCurrentView;
- (void)_removeNoMusicView;
- (void)_removeTopMenu;
- (void)_removeWaitingView;
- (void)_setScreenSaverEnabledForCloudLibrary;
- (void)_showCloudProgressView;
- (void)_showNoMusicView;
- (void)_showSyncingView;
- (void)_showWaitingView;
- (void)_updateTopMenu;
- (void)dealloc;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCloudProgressView:(id)a3;
- (void)setCurrentDisplayedView:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setNoMusicView:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTopMenuViewController:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVMusicCloudViewController

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicCloudViewController");
  v3 = (void *)qword_1002BE710;
  qword_1002BE710 = (uint64_t)v2;
}

- (TVMusicCloudViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  os_log_t v2 = -[TVMusicCloudViewController init](&v9, "init");
  if (v2)
  {
    v3 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[TVMusicCloudViewController init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v4 = -[TVSStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:",  @"My Music view controller",  @"Uninitialized",  0LL);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = v4;

    -[TVSStateMachine setLogObject:](v2->_stateMachine, "setLogObject:", qword_1002BE710);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[TVMusicLibraryManager sharedInstance](&OBJC_CLASS___TVMusicLibraryManager, "sharedInstance"));
    libraryManager = v2->_libraryManager;
    v2->_libraryManager = (TVMusicLibraryManager *)v6;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  -[TVMusicCloudViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  -[TVMusicCloudViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (os_log_s *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[TVMusicCloudViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_appDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v4 addObserver:self selector:"_libraryDidUpdate:" name:MPMediaLibraryDidChangeNotification object:0];
  [v4 addObserver:self selector:"_libraryDidUpdate:" name:@"TVMusicLibraryManagerLibraryUpdatedNotification" object:self->_libraryManager];
  [v4 addObserver:self selector:"_libraryDidUpdate:" name:TVMusicSubscriptionStatusChangedNotification object:0];
  [v4 addObserver:self selector:"_libraryDidUpdate:" name:@"TVMusicAccountChangedNotification" object:0];
  [v4 addObserver:self selector:"_musicLibraryStateChanged:" name:@"TVMusicLibraryManagerStateChangedNotification" object:self->_libraryManager];
  [v4 addObserver:self selector:"_musicLibrarySyncProgress:" name:@"TVMusicLibraryManagerSyncProgressNotification" object:self->_libraryManager];
  -[TVMusicCloudViewController _registerStateMachineHandlers](self, "_registerStateMachineHandlers");
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
  [v5 setAccessibilityIdentifier:@"TVMusic.Library"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  -[TVMusicCloudViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  objc_super v4 = (void *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
  {
    stateMachine = self->_stateMachine;
    objc_super v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](stateMachine, "currentState"));
    *(_DWORD *)buf = 136315394;
    v12 = "-[TVMusicCloudViewController viewWillAppear:]";
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, state = %@", buf, 0x16u);
  }

  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));

  if (v8 == @"Uninitialized")
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController libraryManager](self, "libraryManager"));
    -[TVMusicCloudViewController _handleLibraryState:](self, "_handleLibraryState:", [v9 state]);
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  -[TVMusicCloudViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TVMusicCloudViewController setViewVisible:](self, "setViewVisible:", 1LL);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Update");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  -[TVMusicCloudViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  objc_super v4 = (os_log_s *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[TVMusicCloudViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVMusicCloudViewController setViewVisible:](self, "setViewVisible:", 0LL);
}

- (id)preferredFocusEnvironments
{
  topMenuViewController = self->_topMenuViewController;
  if (topMenuViewController)
  {
    v3 = topMenuViewController;
  }

  else
  {
    v3 = (TVMusicLibraryTopMenuViewController *)objc_claimAutoreleasedReturnValue( -[TVMusicCloudViewController currentDisplayedView]( self,  "currentDisplayedView"));
    if (!v3)
    {
      v3 = (TVMusicLibraryTopMenuViewController *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
      if (!v3) {
        return 0LL;
      }
    }
  }

  v7 = v3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicCloudViewController;
  id v3 = -[TVMusicCloudViewController contentScrollViewForEdge:](&v5, "contentScrollViewForEdge:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)_showCloudProgressView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController cloudProgressView](self, "cloudProgressView"));

  if (!v3)
  {
    objc_super v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[TVMusicCloudViewController _showCloudProgressView]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
    }

    -[TVMusicCloudViewController _removeCurrentView](self, "_removeCurrentView");
    objc_super v5 = objc_alloc(&OBJC_CLASS___TVMusicCloudProgressView);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"ICloudLibraryLoadingMessage" value:&stru_100279068 table:0]);
    v8 = -[TVMusicCloudProgressView initWithMessage:](v5, "initWithMessage:", v7);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
    [v9 addSubview:v8];

    -[TVMusicCloudViewController setCloudProgressView:](self, "setCloudProgressView:", v8);
    -[TVMusicCloudViewController setCurrentDisplayedView:](self, "setCurrentDisplayedView:", v8);
  }

- (void)_removeCloudProgressView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController cloudProgressView](self, "cloudProgressView"));

  if (v3)
  {
    objc_super v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[TVMusicCloudViewController _removeCloudProgressView]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController cloudProgressView](self, "cloudProgressView"));
    [v5 removeFromSuperview];

    -[TVMusicCloudViewController setCloudProgressView:](self, "setCloudProgressView:", 0LL);
  }

- (void)_showNoMusicView
{
  id v3 = (os_log_s *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[TVMusicCloudViewController _showNoMusicView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[TVMusicCloudViewController _removeCurrentView](self, "_removeCurrentView");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController _noMusicView](self, "_noMusicView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
  [v5 addSubview:v4];

  -[TVMusicCloudViewController setNoMusicView:](self, "setNoMusicView:", v4);
  -[TVMusicCloudViewController setCurrentDisplayedView:](self, "setCurrentDisplayedView:", v4);
}

- (id)_noMusicView
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  if (([v2 hasMusicSubscription] & 1) != 0
    || ([v2 hasPlaybackRestrictions] & 1) != 0)
  {
    id v3 = 0LL;
    objc_super v4 = 0LL;
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"EmptyLibraryUpsellMessage" value:&stru_100279068 table:0]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"EmptyLibraryUpsellButton" value:&stru_100279068 table:0]);

    if (v3)
    {
      v15 = objc_alloc(&OBJC_CLASS___TVMusicNoMusicView);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"EmptyLibraryUpsellTitle" value:&stru_100279068 table:0]);
      v11 = -[TVMusicNoMusicView initWithTitle:message:buttonText:buttonHandler:]( v15,  "initWithTitle:message:buttonText:buttonHandler:",  v17,  v3,  v4,  &stru_100268B08);

      if (v11) {
        goto LABEL_8;
      }
    }
  }

  else {
    objc_super v5 = @"MusicLibraryNoMusicMessage";
  }
  int v6 = objc_alloc(&OBJC_CLASS___TVMusicNoMusicView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"MusicLibraryNoMusicTitle" value:&stru_100279068 table:0]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v5 value:&stru_100279068 table:0]);
  v11 = -[TVMusicNoMusicView initWithTitle:message:](v6, "initWithTitle:message:", v8, v10);

LABEL_8:
  return v11;
}

- (void)_removeNoMusicView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController noMusicView](self, "noMusicView"));

  if (v3)
  {
    objc_super v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[TVMusicCloudViewController _removeNoMusicView]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController noMusicView](self, "noMusicView"));
    [v5 removeFromSuperview];

    -[TVMusicCloudViewController setNoMusicView:](self, "setNoMusicView:", 0LL);
  }

- (void)_setScreenSaverEnabledForCloudLibrary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  id v4 = [v3 filterAvailableContentGroups:1 withOptions:0];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController libraryManager](self, "libraryManager"));
  id v6 = [v5 state];

  if (v6 == (id)3 && v4)
  {
    v7 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud music library is available and has been synced. Set screensaver preferences..",  v12,  2u);
    }

    uint64_t v13 = TVScreenSaverDisableOnSignOut;
    v14 = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    [v9 setScreenSaverDisplayStatusForBundleIdentifier:v11 isEnabled:1 extraInfo:v8];
  }

- (void)_removeTopMenu
{
  id v3 = (TVMusicCloudViewController *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController parentViewController]( self->_topMenuViewController,  "parentViewController"));

  if (v3 == self)
  {
    id v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[TVMusicCloudViewController _removeTopMenu]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
    }

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self->_topMenuViewController, "view"));
    [v5 removeFromSuperview];

    -[TVMusicLibraryTopMenuViewController willMoveToParentViewController:]( self->_topMenuViewController,  "willMoveToParentViewController:",  0LL);
    -[TVMusicLibraryTopMenuViewController removeFromParentViewController]( self->_topMenuViewController,  "removeFromParentViewController");
    topMenuViewController = self->_topMenuViewController;
    self->_topMenuViewController = 0LL;
  }

- (id)_menuItems
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  unsigned __int16 v4 = (unsigned __int16)[v3 filterAvailableContentGroups:1828 withOptions:0];

  unsigned __int8 v5 = +[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted");
  [v2 addObject:&off_100281490];
  [v2 addObject:&off_1002814A8];
  [v2 addObject:&off_1002814C0];
  [v2 addObject:&off_1002814D8];
  [v2 addObject:&off_1002814F0];
  if ((v4 & 0x400) != 0) {
    [v2 addObject:&off_100281508];
  }
  if ((v4 & 0x300) != 0) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    [v2 addObject:&off_100281520];
  }
  if ((v4 & 0x20) != 0) {
    char v7 = v5;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0) {
    [v2 addObject:&off_100281538];
  }
  [v2 addObject:&off_100281550];
  if ((v4 & 4) != 0) {
    [v2 addObject:&off_100281568];
  }
  return v2;
}

- (void)_showWaitingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController activityIndicatorView](self, "activityIndicatorView"));

  if (!v3)
  {
    unsigned __int16 v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[TVMusicCloudViewController _showWaitingView]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    -[TVMusicCloudViewController _removeCurrentView](self, "_removeCurrentView");
    unsigned __int8 v5 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
    [v6 addSubview:v5];

    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
    [v7 center];
    -[UIActivityIndicatorView setCenter:](v5, "setCenter:");

    -[UIActivityIndicatorView setAlpha:](v5, "setAlpha:", 0.0);
    -[TVMusicCloudViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v5);
    dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_100006830;
    v14 = &unk_100268B30;
    v15 = self;
    v16 = v5;
    objc_super v9 = v5;
    dispatch_after(v8, &_dispatch_main_q, &v11);
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicCloudViewController activityIndicatorView]( self,  "activityIndicatorView",  v11,  v12,  v13,  v14,  v15));
    -[TVMusicCloudViewController setCurrentDisplayedView:](self, "setCurrentDisplayedView:", v10);
  }

- (void)_removeWaitingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController activityIndicatorView](self, "activityIndicatorView"));

  if (v3)
  {
    unsigned __int16 v4 = (os_log_s *)qword_1002BE710;
    if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      char v7 = "-[TVMusicCloudViewController _removeWaitingView]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }

    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController activityIndicatorView](self, "activityIndicatorView"));
    [v5 removeFromSuperview];

    -[TVMusicCloudViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", 0LL);
  }

- (void)_showSyncingView
{
  id v3 = (os_log_s *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned __int8 v5 = "-[TVMusicCloudViewController _showSyncingView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[TVMusicCloudViewController _removeCurrentView](self, "_removeCurrentView");
  -[TVMusicCloudViewController _showCloudProgressView](self, "_showCloudProgressView");
}

- (void)_removeCurrentView
{
}

- (void)_registerStateMachineHandlers
{
  stateMachine = self->_stateMachine;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006DA0;
  v18[3] = &unk_100268B58;
  objc_copyWeak(&v19, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( stateMachine,  "registerDefaultHandlerForEvent:withBlock:",  @"Library initializing",  v18);
  int v4 = self->_stateMachine;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100006DD4;
  v16[3] = &unk_100268B58;
  objc_copyWeak(&v17, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v4,  "registerHandlerForEvent:onState:withBlock:",  @"Update",  @"Showing menu",  v16);
  unsigned __int8 v5 = self->_stateMachine;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006E4C;
  v14[3] = &unk_100268B58;
  objc_copyWeak(&v15, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v5,  "registerHandlerForEvent:onState:withBlock:",  @"Update",  @"Waiting",  v14);
  int v6 = self->_stateMachine;
  v22[0] = @"Uninitialized";
  v22[1] = @"Waiting";
  v22[2] = @"Syncing";
  v22[3] = @"Showing menu";
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006EEC;
  v12[3] = &unk_100268B58;
  objc_copyWeak(&v13, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Sync started",  v7,  v12);

  dispatch_time_t v8 = self->_stateMachine;
  v21[0] = @"Uninitialized";
  v21[1] = @"Waiting";
  v21[2] = @"Syncing";
  v21[3] = @"Showing menu";
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006F20;
  v10[3] = &unk_100268B58;
  objc_copyWeak(&v11, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v8,  "registerHandlerForEvent:onStates:withBlock:",  @"Sync complete",  v9,  v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_updateTopMenu
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController libraryManager](self, "libraryManager"));
  unsigned int v4 = [v3 libraryHasContent];

  if ((v4 & 1) != 0)
  {
    topMenuViewController = self->_topMenuViewController;
    if (!topMenuViewController) {
      goto LABEL_7;
    }
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController noMusicView](self, "noMusicView"));

    if (!v6)
    {
LABEL_7:
      -[TVMusicCloudViewController _removeCurrentView](self, "_removeCurrentView");
      int v10 = (void *)qword_1002BE710;
      if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_topMenuViewController) {
          id v11 = @"Reload";
        }
        else {
          id v11 = @"Show";
        }
        stateMachine = self->_stateMachine;
        id v13 = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](stateMachine, "currentState"));
        int v26 = 138412546;
        v27 = v11;
        __int16 v28 = 2112;
        v29 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ top menu, state=%@",  (uint8_t *)&v26,  0x16u);
      }

      if (v4)
      {
        id v15 = objc_alloc(&OBJC_CLASS___TVMusicLibraryTopMenuViewController);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController _menuItems](self, "_menuItems"));
        id v17 = -[TVMusicLibraryTopMenuViewController initWithMenuItems:](v15, "initWithMenuItems:", v16);
        v18 = self->_topMenuViewController;
        self->_topMenuViewController = v17;

        -[TVMusicCloudViewController addChildViewController:]( self,  "addChildViewController:",  self->_topMenuViewController);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController view](self, "view"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self->_topMenuViewController, "view"));
        [v19 addSubview:v20];

        -[TVMusicLibraryTopMenuViewController didMoveToParentViewController:]( self->_topMenuViewController,  "didMoveToParentViewController:",  self);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self->_topMenuViewController, "view"));
        -[TVMusicCloudViewController setCurrentDisplayedView:](self, "setCurrentDisplayedView:", v21);

        -[TVMusicCloudViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      }

      else
      {
        -[TVMusicCloudViewController _showNoMusicView](self, "_showNoMusicView");
      }

      return;
    }

    topMenuViewController = self->_topMenuViewController;
  }

  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController menuItems](topMenuViewController, "menuItems"));
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController _menuItems](self, "_menuItems"));
  unsigned int v9 = v4 & ~[v7 isEqualToArray:v8];

  if (v9 == 1) {
    goto LABEL_7;
  }
  v22 = (void *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_INFO))
  {
    v23 = self->_stateMachine;
    v24 = v22;
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](v23, "currentState"));
    int v26 = 138412290;
    v27 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "No change for top menu, state=%@",  (uint8_t *)&v26,  0xCu);
  }

- (void)_handleLibraryState:(int64_t)a3
{
  unsigned __int8 v5 = (void *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_INFO))
  {
    stateMachine = self->_stateMachine;
    char v7 = v5;
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](stateMachine, "currentState"));
    int v9 = 136315650;
    int v10 = "-[TVMusicCloudViewController _handleLibraryState:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s, state=%@, libraryManager state=%d",  (uint8_t *)&v9,  0x1Cu);
  }

- (void)_appDidBecomeActiveNotification:(id)a3
{
}

- (void)_musicLibraryStateChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController libraryManager](self, "libraryManager", a3));
  -[TVMusicCloudViewController _handleLibraryState:](self, "_handleLibraryState:", [v4 state]);
}

- (void)_musicLibrarySyncProgress:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController cloudProgressView](self, "cloudProgressView", a3));

  if (v4)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController libraryManager](self, "libraryManager"));
    [v9 syncProgress];
    float v6 = v5 * 100.0;
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicCloudViewController cloudProgressView](self, "cloudProgressView"));
    *(float *)&double v8 = v6;
    [v7 setProgressPercent:v8];
  }

- (void)_libraryDidUpdate:(id)a3
{
  id v4 = (os_log_s *)qword_1002BE710;
  if (os_log_type_enabled((os_log_t)qword_1002BE710, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    float v6 = "-[TVMusicCloudViewController _libraryDidUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Update");
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVMusicLibraryTopMenuViewController)topMenuViewController
{
  return self->_topMenuViewController;
}

- (void)setTopMenuViewController:(id)a3
{
}

- (TVMusicCloudProgressView)cloudProgressView
{
  return self->_cloudProgressView;
}

- (void)setCloudProgressView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIView)noMusicView
{
  return self->_noMusicView;
}

- (void)setNoMusicView:(id)a3
{
}

- (UIView)currentDisplayedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_currentDisplayedView);
}

- (void)setCurrentDisplayedView:(id)a3
{
}

- (TVMusicLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setLibraryManager:(id)a3
{
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (void).cxx_destruct
{
}

@end