@interface TVHPPTController
+ (TVHPPTController)new;
+ (TVHPPTController)sharedInstance;
- (BOOL)_canHandleTest:(id)a3;
- (BOOL)_workQueue_moveFocusInDirection:(int64_t)a3 toListItemWithTitle:(id)a4 inSelectedViewControllerOfTabBarController:(id)a5;
- (BOOL)_workQueue_performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 scrollViewBlock:(id)a6;
- (BOOL)_workQueue_performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 viewController:(id)a6 scrollViewBlock:(id)a7;
- (BOOL)_workQueue_selectTabWithTabItemType:(unint64_t)a3 inTabBarController:(id)a4;
- (BOOL)_workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController;
- (BOOL)_workQueue_waitForLoadingToCompleteForTabItemType:(unint64_t)a3 inTabBarController:(id)a4;
- (BOOL)_workQueue_waitForLoadingToCompleteForViewController:(id)a3;
- (BOOL)_workQueue_waitForVisibleChildViewControllerToFinishLoadingWithClass:(Class)a3;
- (BOOL)isApplicationLoaded;
- (NSDictionary)testsManifest;
- (OS_dispatch_queue_serial)workQueue;
- (TVHHIDEventManager)HIDManager;
- (TVHPPTController)init;
- (id)_findCellWithTitle:(id)a3 inCollectionView:(id)a4;
- (id)_findCellWithTitle:(id)a3 inTopmostViewController:(id)a4 returningCollectionView:(id *)a5;
- (id)_findCellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5;
- (id)_findChildViewControllerWithClass:(Class)a3 inViewController:(id)a4;
- (id)_findCollectionViewInView:(id)a3;
- (id)_findLabelInView:(id)a3;
- (id)_findLabelWithTitle:(id)a3 inView:(id)a4;
- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4;
- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollSubviewsToSkip:(unint64_t)a5 numScrollSubviewsFound:(unint64_t *)a6;
- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(unint64_t)a5;
- (id)_findScrollViewInViewController:(id)a3;
- (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5;
- (id)_init;
- (id)_libraryViewController;
- (id)_navigationController;
- (id)_selectedViewControllerInTabBarController:(id)a3;
- (id)_workQueue_prepareForPPT;
- (id)applicationLoadCompletion;
- (unint64_t)_viewControllerIndexWithTabItemType:(unint64_t)a3 inTabBarController:(id)a4;
- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3;
- (void)_registerTests;
- (void)_runTest:(id)a3 application:(id)a4;
- (void)_workQueue_dispatchHIDEventWithType:(unint64_t)a3;
- (void)_workQueue_runTest:(id)a3 application:(id)a4;
- (void)runTest:(id)a3 application:(id)a4;
- (void)setApplicationLoadCompletion:(id)a3;
- (void)setApplicationLoaded:(BOOL)a3;
- (void)setHIDManager:(id)a3;
- (void)setTestsManifest:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation TVHPPTController

+ (TVHPPTController)sharedInstance
{
  if (qword_1001573A0 != -1) {
    dispatch_once(&qword_1001573A0, &stru_1000FE778);
  }
  return (TVHPPTController *)(id)qword_100157398;
}

+ (TVHPPTController)new
{
  return 0LL;
}

- (TVHPPTController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHPPTController;
  v2 = -[TVHPPTController init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVHomeSharing.ppt", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue_serial *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___TVHHIDEventManager);
    HIDManager = v2->_HIDManager;
    v2->_HIDManager = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_handleNavigationControllerDidDisplayViewControllerNotification:" name:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:0];

    -[TVHPPTController _registerTests](v2, "_registerTests");
  }

  return v2;
}

- (void)runTest:(id)a3 application:(id)a4
{
}

- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ViewController"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:0];

    -[TVHPPTController setApplicationLoaded:](self, "setApplicationLoaded:", 1LL);
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[TVHPPTController applicationLoadCompletion]( self,  "applicationLoadCompletion"));
    if (v7)
    {
      -[TVHPPTController setApplicationLoadCompletion:](self, "setApplicationLoadCompletion:", 0LL);
      v7[2](v7);
    }
  }
}

- (void)_registerTests
{
  v4[0] = @"ScrollMovies";
  v4[1] = @"ScrollMovieContributors";
  v5[0] = &stru_1000FE818;
  v5[1] = &stru_1000FE878;
  v4[2] = @"ScrollMusicAlbums";
  v4[3] = @"ScrollRelatedMovies";
  v5[2] = &stru_1000FE938;
  v5[3] = &stru_1000FE8B8;
  v4[4] = @"ScrollShows";
  v4[5] = @"LaunchToMovies";
  v5[4] = &stru_1000FE8F8;
  v5[5] = &stru_1000FE7B8;
  v4[6] = @"LaunchToMusic";
  v4[7] = @"LaunchToShows";
  v5[6] = &stru_1000FE7F8;
  v5[7] = &stru_1000FE7D8;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  8LL));
  -[TVHPPTController setTestsManifest:](self, "setTestsManifest:", v3);
}

- (BOOL)_canHandleTest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPPTController testsManifest](self, "testsManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100060AF0;
  v9[3] = &unk_1000FE980;
  id v7 = v4;
  id v10 = v7;
  v11 = &v12;
  [v6 enumerateObjectsUsingBlock:v9];
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (void)_runTest:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (-[TVHPPTController _canHandleTest:](self, "_canHandleTest:", v6))
  {
    objc_initWeak(&location, self);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100060C48;
    v9[3] = &unk_1000FE9A8;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_workQueue_dispatchHIDEventWithType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPPTController HIDManager](self, "HIDManager"));
  [v4 dispatchEvent:a3];

  sleep(1u);
}

- (void)_workQueue_runTest:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100079F28();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting test. test=%@", (uint8_t *)&buf, 0xCu);
  }

  unsigned __int8 v11 = [v6 hasPrefix:@"Scroll"];
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100060F6C;
  v26[3] = &unk_1000FE9A8;
  objc_copyWeak(&v29, &location);
  id v12 = v6;
  id v27 = v12;
  id v13 = v7;
  id v28 = v13;
  uint64_t v14 = objc_retainBlock(v26);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000613B0;
  block[3] = &unk_1000FEA48;
  char v25 = v11 ^ 1;
  id v15 = v13;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  v21 = self;
  p___int128 buf = &buf;
  objc_copyWeak(&v24, &location);
  v17 = v14;
  id v22 = v17;
  dispatch_sync(&_dispatch_main_q, block);
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
    v17[2](v17);
  }

  objc_destroyWeak(&v24);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (id)_workQueue_prepareForPPT
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1000616D4;
  v18 = sub_1000616E4;
  id v19 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000616EC;
  block[3] = &unk_1000FEA70;
  void block[4] = self;
  block[5] = &v14;
  dispatch_sync(&_dispatch_main_q, block);
  if (v15[5])
  {
    uint64_t v7 = 0LL;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    id v10 = sub_1000616D4;
    unsigned __int8 v11 = sub_1000616E4;
    id v12 = 0LL;
    while (1)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100061724;
      v6[3] = &unk_1000FEA98;
      v6[4] = self;
      v6[5] = &v7;
      v6[6] = &v14;
      dispatch_sync(&_dispatch_main_q, v6);

      if (v8[5]) {
        break;
      }
      usleep(0xC350u);
    }

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  else
  {
    id v4 = 0LL;
  }

  _Block_object_dispose(&v14, 8);

  return v4;
}

- (BOOL)_workQueue_selectTabWithTabItemType:(unint64_t)a3 inTabBarController:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100079F28();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_10008561C(a3);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Selecting tab: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10006193C;
  v18 = &unk_1000FEAC0;
  id v19 = self;
  unint64_t v22 = a3;
  id v12 = v6;
  id v20 = v12;
  p___int128 buf = &buf;
  dispatch_sync(&_dispatch_main_q, &v15);
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    -[TVHPPTController _workQueue_waitForLoadingToCompleteForTabItemType:inTabBarController:]( self,  "_workQueue_waitForLoadingToCompleteForTabItemType:inTabBarController:",  a3,  v12,  v15,  v16,  v17,  v18,  v19);
    BOOL v13 = *(_BYTE *)(*((void *)&buf + 1) + 24LL) != 0;
  }

  else
  {
    BOOL v13 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v13;
}

- (BOOL)_workQueue_waitForLoadingToCompleteForTabItemType:(unint64_t)a3 inTabBarController:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v7);

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_1000616D4;
  unint64_t v22 = sub_1000616E4;
  id v23 = 0LL;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100061B1C;
  BOOL v13 = &unk_1000FEAC0;
  uint64_t v14 = self;
  unint64_t v17 = a3;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v18;
  dispatch_sync(&_dispatch_main_q, &v10);
  LOBYTE(self) = -[TVHPPTController _workQueue_waitForLoadingToCompleteForViewController:]( self,  "_workQueue_waitForLoadingToCompleteForViewController:",  v19[5],  v10,  v11,  v12,  v13,  v14);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

- (BOOL)_workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController
{
  v2 = self;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000616D4;
  id v10 = sub_1000616E4;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100061CEC;
  v5[3] = &unk_1000FEAE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(&_dispatch_main_q, v5);
  LOBYTE(v2) = -[TVHPPTController _workQueue_waitForLoadingToCompleteForViewController:]( v2,  "_workQueue_waitForLoadingToCompleteForViewController:",  v7[5]);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

- (BOOL)_workQueue_waitForLoadingToCompleteForViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    uint64_t v14 = 0LL;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    char v17 = 0;
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    id v10 = sub_100061EA0;
    id v11 = &unk_1000FEA70;
    BOOL v13 = &v14;
    id v12 = v5;
    dispatch_sync(&_dispatch_main_q, &v8);
    while (*((_BYTE *)v15 + 24))
    {
      usleep(0xC350u);
      uint64_t v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472LL;
      id v10 = sub_100061EA0;
      id v11 = &unk_1000FEA70;
      BOOL v13 = &v14;
      objc_storeStrong(&v12, a3);
      dispatch_sync(&_dispatch_main_q, &v8);
    }

    _Block_object_dispose(&v14, 8);
  }

  return v5 != 0LL;
}

- (BOOL)_workQueue_waitForVisibleChildViewControllerToFinishLoadingWithClass:(Class)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1000616D4;
  id v12 = sub_1000616E4;
  id v13 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061FC8;
  block[3] = &unk_1000FEB10;
  void block[4] = self;
  block[5] = &v8;
  void block[6] = a3;
  dispatch_sync(&_dispatch_main_q, block);
  LOBYTE(a3) = -[TVHPPTController _workQueue_waitForLoadingToCompleteForViewController:]( self,  "_workQueue_waitForLoadingToCompleteForViewController:",  v9[5]);
  _Block_object_dispose(&v8, 8);

  return (char)a3;
}

- (BOOL)_workQueue_performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 scrollViewBlock:(id)a6
{
  return -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:viewController:scrollViewBlock:]( self,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:viewController:scrollViewBlock:",  a3,  a4,  a5,  0LL,  a6);
}

- (BOOL)_workQueue_performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 viewController:(id)a6 scrollViewBlock:(id)a7
{
  id v12 = a3;
  id v29 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v15);

  id v16 = sub_100079F28();
  char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Running scrollview test '%@'",  (uint8_t *)&buf,  0xCu);
  }

  objc_initWeak(&location, self);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_1000616D4;
  v54 = sub_1000616E4;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_1000616D4;
  v48 = sub_1000616E4;
  id v49 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000623C4;
  block[3] = &unk_1000FEB38;
  block[1] = 3221225472LL;
  objc_copyWeak(&v43, &location);
  id v18 = v13;
  p___int128 buf = &buf;
  id v38 = v18;
  v39 = self;
  id v19 = v14;
  id v40 = v19;
  v42 = &v44;
  dispatch_sync(&_dispatch_main_q, block);
  uint64_t v20 = v45[5];
  if (v20)
  {
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v22 bounds];
    double Height = CGRectGetHeight(v56);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000624FC;
    v30[3] = &unk_1000FEBA8;
    char v33 = &v44;
    int v35 = 100;
    int v36 = (int)(Height * 5.0);
    unint64_t v34 = a5;
    id v31 = v12;
    dispatch_semaphore_t v32 = v21;
    uint64_t v24 = v21;
    dispatch_sync(&_dispatch_main_q, v30);

    dispatch_time_t v25 = dispatch_time(0LL, 300000000000LL);
    dispatch_semaphore_wait(v24, v25);
  }

  else
  {
    id v26 = sub_100079F28();
    uint64_t v24 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      sub_10009C958((uint64_t)v12, (os_log_s *)v24, v27);
    }
  }

  objc_destroyWeak(&v43);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);

  return v20 != 0;
}

- (BOOL)_workQueue_moveFocusInDirection:(int64_t)a3 toListItemWithTitle:(id)a4 inSelectedViewControllerOfTabBarController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHPPTController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v10);

  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x3032000000LL;
  v28[3] = sub_1000616D4;
  v28[4] = sub_1000616E4;
  id v29 = 0LL;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062810;
  block[3] = &unk_1000FEBD0;
  id v19 = &v26;
  objc_copyWeak(&v26, &location);
  id v18 = v9;
  id v22 = v18;
  id v23 = self;
  dispatch_time_t v25 = v28;
  id v17 = v8;
  id v24 = v17;
  dispatch_sync(&_dispatch_main_q, block);
  if (!v31[3])
  {
    unint64_t v13 = 0LL;
    else {
      int64_t v14 = a3 - 1;
    }
    while (1)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100062918;
      v20[3] = &unk_1000FEBF8;
      v20[4] = v28;
      v20[5] = &v30;
      dispatch_sync(&_dispatch_main_q, v20);

      if (v31[3]) {
        break;
      }
      -[TVHPPTController _workQueue_dispatchHIDEventWithType:]( self,  "_workQueue_dispatchHIDEventWithType:",  v14,  v17,  v18,  v19);
      uint64_t v15 = v31[3];
      BOOL v11 = v15 != 0;
      if (v15) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v13 >= 0x13;
      }
      ++v13;
      if (v16) {
        goto LABEL_3;
      }
    }
  }

  BOOL v11 = 1;
LABEL_3:

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

- (id)_findChildViewControllerWithClass:(Class)a3 inViewController:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int64_t v14 = sub_1000616D4;
  uint64_t v15 = sub_1000616E4;
  id v16 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 childViewControllers]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100062A64;
  v10[3] = &unk_1000FEC20;
  v10[5] = &v11;
  v10[6] = a3;
  v10[4] = self;
  [v7 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_selectedViewControllerInTabBarController:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedViewController]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesFetchViewController);
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 contentViewController]);

    uint64_t v7 = (void *)v10;
  }

  return v7;
}

- (unint64_t)_viewControllerIndexWithTabItemType:(unint64_t)a3 inTabBarController:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewControllers]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100062D18;
  v13[3] = &unk_1000FEC48;
  v13[4] = &v14;
  v13[5] = a3;
  [v6 enumerateObjectsUsingBlock:v13];
  unint64_t v7 = v15[3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = sub_100079F28();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = sub_10008561C(a3);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      sub_10009C9C4(v11, (uint64_t)v18, v9);
    }

    unint64_t v7 = v15[3];
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)_libraryViewController
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_1000616D4;
  id v12 = sub_1000616E4;
  id v13 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPPTController _navigationController](self, "_navigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 childViewControllers]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062EA0;
  v7[3] = &unk_1000FEC70;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_findScrollViewInViewController:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (((objc_opt_respondsToSelector(v4, "collectionView") & 1) == 0
     || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performSelector:"collectionView" withObject:0])) == 0)
    && ((objc_opt_respondsToSelector(v4, "tableView") & 1) == 0
     || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performSelector:"tableView" withObject:0])) == 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:]( self,  "_findScrollViewInView:desiredScrollViewClass:",  v6,  0LL));
  }

  return v5;
}

- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4
{
  return -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( self,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  a3,  a4,  0LL);
}

- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(unint64_t)a5
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000631A8;
  v23[3] = &unk_1000FEC98;
  v23[4] = self;
  id v7 = a3;
  id v24 = v7;
  Class v25 = a4;
  unint64_t v26 = a5;
  uint64_t v8 = objc_retainBlock(v23);
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1000616D4;
  dispatch_semaphore_t v21 = sub_1000616E4;
  id v22 = 0LL;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    uint64_t v9 = ((uint64_t (*)(void *))v8[2])(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)v18[5];
    v18[5] = v10;
  }

  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000631DC;
    v14[3] = &unk_1000FECC0;
    uint64_t v16 = &v17;
    uint64_t v15 = v8;
    dispatch_sync(&_dispatch_main_q, v14);
    uint64_t v11 = v15;
  }

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)_findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollSubviewsToSkip:(unint64_t)a5 numScrollSubviewsFound:(unint64_t *)a6
{
  id v10 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (!v10) {
    goto LABEL_19;
  }
  if (a4)
  {
    id v11 = v10;
    Class v12 = a4;
LABEL_6:
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      goto LABEL_7;
    }
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subviews", 0));
    id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollSubviewsToSkip:numScrollSubviewsFound:]( self,  "_findScrollViewInView:desiredScrollViewClass:numScrollSubviewsToSkip:numScrollSubviewsFound:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v19),  a4,  a5,  a6));
          id v14 = v20;
          unint64_t v21 = *a6;
          if (v20) {
            *a6 = ++v21;
          }
          if (v21 > a5)
          {

            goto LABEL_21;
          }

          uint64_t v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

LABEL_19:
    id v14 = 0LL;
    goto LABEL_21;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___UICollectionView);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) == 0)
  {
    Class v12 = (Class)objc_opt_class(&OBJC_CLASS___UITableView);
    id v11 = v10;
    goto LABEL_6;
  }

- (id)_findCollectionViewInView:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v5 = -[TVHPPTController _findViewOfType:inView:withFilter:]( self,  "_findViewOfType:inView:withFilter:",  objc_opt_class(&OBJC_CLASS___UICollectionView),  v4,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionView);
  id v8 = 0LL;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }

  return v8;
}

- (id)_findLabelInView:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v5 = -[TVHPPTController _findViewOfType:inView:withFilter:]( self,  "_findViewOfType:inView:withFilter:",  objc_opt_class(&OBJC_CLASS___UILabel),  v4,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UILabel);
  id v8 = 0LL;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }

  return v8;
}

- (id)_findLabelWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UILabel);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000635F0;
  v14[3] = &unk_1000FECE8;
  id v9 = v6;
  id v15 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPPTController _findViewOfType:inView:withFilter:]( self,  "_findViewOfType:inView:withFilter:",  v8,  v7,  v14));

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UILabel);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (id)_findCellWithTitle:(id)a3 inTopmostViewController:(id)a4 returningCollectionView:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPPTController _findCellWithTitle:inViewController:returningCollectionView:]( self,  "_findCellWithTitle:inViewController:returningCollectionView:",  v8,  v9,  a5));
  if (!v10)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers", 0));
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_claimAutoreleasedReturnValue( -[TVHPPTController _findCellWithTitle:inViewController:returningCollectionView:]( self,  "_findCellWithTitle:inViewController:returningCollectionView:",  v8,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  a5));
          if (v16)
          {
            id v10 = (void *)v16;
            goto LABEL_12;
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v10 = 0LL;
LABEL_12:
  }

  return v10;
}

- (id)_findCellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if ((objc_opt_respondsToSelector(v9, "collectionView") & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionView]);
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 view]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPPTController _findCollectionViewInView:](self, "_findCollectionViewInView:", v11));
    id v9 = (id)v11;
  }

  if (v10)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[TVHPPTController _findCellWithTitle:inCollectionView:]( self,  "_findCellWithTitle:inCollectionView:",  v8,  v10));
    id v13 = (void *)v12;
    if (a5 && v12) {
      *a5 = v10;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)_findCellWithTitle:(id)a3 inCollectionView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (v7)
  {
    id v8 = [v7 visibleCells];
    __int128 v19 = (char *)[v7 numberOfSections];
    if (v19)
    {
      id v9 = 0LL;
      do
      {
        id v10 = (char *)[v7 numberOfItemsInSection:v9];
        if (v10)
        {
          uint64_t v11 = v10;
          for (i = 0LL; v11 != i; ++i)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  i,  v9));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 cellForItemAtIndexPath:v13]);

            if (v14)
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPPTController _findLabelInView:](self, "_findLabelInView:", v14));
              if (![v6 length]
                || (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 text]),
                    unsigned __int8 v17 = [v16 isEqualToString:v6],
                    v16,
                    (v17 & 1) != 0))
              {

                goto LABEL_14;
              }
            }
          }
        }

        ++v9;
      }

      while (v9 != v19);
    }
  }

  uint64_t v14 = 0LL;
LABEL_14:

  return v14;
}

- (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5
{
  id v8 = a4;
  id v9 = (uint64_t (**)(id, id))a5;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (!v8)
  {
LABEL_17:
    id v10 = 0LL;
    goto LABEL_19;
  }

  if ((objc_opt_isKindOfClass(v8, a3) & 1) == 0)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          id v10 = (id)objc_claimAutoreleasedReturnValue( -[TVHPPTController _findViewOfType:inView:withFilter:]( self,  "_findViewOfType:inView:withFilter:",  a3,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v15),  v9));
          char v16 = 1;
          if (v9 && v10) {
            char v16 = v9[2](v9, v10);
          }
          if (v10 && (v16 & 1) != 0)
          {

            goto LABEL_19;
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    goto LABEL_17;
  }

  id v10 = v8;
LABEL_19:

  return v10;
}

- (id)_navigationController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 windows]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHDefaultRootViewController);
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = v9;

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 childViewControllers]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVHNavigationController);
  id v14 = v12;
  id v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      char v16 = v15;
    }
    else {
      char v16 = 0LL;
    }
  }

  else
  {
    char v16 = 0LL;
  }

  id v17 = v16;

  return v17;
}

- (OS_dispatch_queue_serial)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSDictionary)testsManifest
{
  return self->_testsManifest;
}

- (void)setTestsManifest:(id)a3
{
}

- (TVHHIDEventManager)HIDManager
{
  return self->_HIDManager;
}

- (void)setHIDManager:(id)a3
{
}

- (BOOL)isApplicationLoaded
{
  return self->_applicationLoaded;
}

- (void)setApplicationLoaded:(BOOL)a3
{
  self->_applicationLoaded = a3;
}

- (id)applicationLoadCompletion
{
  return self->_applicationLoadCompletion;
}

- (void)setApplicationLoadCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end