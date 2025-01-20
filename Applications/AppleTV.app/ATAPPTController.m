@interface ATAPPTController
+ (id)sharedInstance;
- (ATAPPTController)init;
- (BOOL)_canHandleTest:(id)a3;
- (NSDictionary)testsManifest;
- (OS_dispatch_queue)workQueue;
- (id)_init;
- (id)applicationLoadCompletion;
- (void)_registerTests;
- (void)_runTVRecapVerticalScrollingCommands:(id)a3;
- (void)_runTest:(id)a3 app:(id)a4;
- (void)_scrollHalfTheScreenHeightIn:(id)a3;
- (void)_waitForSearchShelfsToLoadInTabBarController:(id)a3;
- (void)runTest:(id)a3 app:(id)a4;
- (void)setApplicationLoadCompletion:(id)a3;
- (void)setTestsManifest:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)waitForApplicationToLoadNotification:(id)a3;
@end

@implementation ATAPPTController

+ (id)sharedInstance
{
  if (qword_10001A3C8 != -1) {
    dispatch_once(&qword_10001A3C8, &stru_100014888);
  }
  return (id)qword_10001A3C0;
}

- (ATAPPTController)init
{
  return 0LL;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ATAPPTController;
  v2 = -[ATAPPTController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_appLoadedLock._os_unfair_lock_opaque = 0;
    -[ATAPPTController _registerTests](v2, "_registerTests");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"waitForApplicationToLoadNotification:" name:_VUITVAppNavigationDidDisplayViewControllerNotification object:0];
  }

  return v3;
}

- (void)runTest:(id)a3 app:(id)a4
{
}

- (OS_dispatch_queue)workQueue
{
  workQueue = self->_workQueue;
  if (!workQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.tv.ppt", 0LL);
    v5 = self->_workQueue;
    self->_workQueue = v4;

    workQueue = self->_workQueue;
  }

  return workQueue;
}

- (void)_waitForSearchShelfsToLoadInTabBarController:(id)a3
{
  id v18 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKeyPath:@"tabBar.items.title"]);
  id v4 = [v3 indexOfObject:VUITabBarItemIdentifierKeySearch];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v18 viewControllers]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v5]);

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___UINavigationController);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      id v9 = v7;
    }
    else {
      id v9 = 0LL;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 childViewControllers]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 childViewControllers]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 childViewControllers]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    while (1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 childViewControllers]);
      id v17 = [v16 count];

      if (v17) {
        break;
      }
      usleep(0xC350u);
    }
  }
}

- (void)_scrollHalfTheScreenHeightIn:(id)a3
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities topMostController](&OBJC_CLASS___ATAPPTUtilities, "topMostController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
  id v4 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewInView:desiredScrollViewClass:",  v3,  NSClassFromString(@"VideosUI.StackCollectionView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  [v5 contentOffset];
  double v7 = v6;
  double v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue([UIApp keyWindow]);
  [v10 frame];
  double v12 = v9 + v11 * 0.5;

  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    objc_msgSend(v5, "setContentOffset:animated:", 0, v7, v12);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000043D0;
    block[3] = &unk_1000148B0;
    id v15 = v5;
    double v16 = v7;
    double v17 = v12;
    dispatch_sync(&_dispatch_main_q, block);
  }

  sleep(2u);
}

- (BOOL)_canHandleTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ATAPPTController testsManifest](self, "testsManifest"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000044D8;
  v9[3] = &unk_1000148D8;
  id v7 = v4;
  id v10 = v7;
  double v11 = &v12;
  [v6 enumerateObjectsUsingBlock:v9];
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (void)_registerTests
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004D8C;
  v10[3] = &unk_100014B20;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004E8C;
  v9[3] = &unk_100014B20;
  void v9[4] = self;
  id v4 = objc_retainBlock(v9);
  v11[0] = @"ScrollPage";
  v11[1] = @"ScrollWhatToWatch";
  v12[0] = &stru_100014978;
  v12[1] = &stru_100014AB8;
  v11[2] = @"ScrollSwoosh";
  id v5 = objc_retainBlock(v3);
  v12[2] = v5;
  v11[3] = @"ScrollBricks";
  double v6 = objc_retainBlock(v4);
  v12[3] = v6;
  v12[4] = &stru_100014998;
  v11[4] = @"ScrollUpNext";
  v11[5] = @"ScrollSportsPage";
  v12[5] = &stru_100014B60;
  v12[6] = &stru_100014B80;
  v11[6] = @"ScrollShowProductPage";
  v11[7] = @"ScrollLibrary";
  v12[7] = &stru_1000149F8;
  v12[8] = &stru_100014A38;
  v11[8] = @"ScrollLibraryCategories";
  v11[9] = @"ScrollLibraryCategoryGrid";
  v12[9] = &stru_100014A78;
  v12[10] = &stru_100014918;
  v11[10] = @"LaunchToWatchNow";
  v11[11] = @"LaunchToLibrary";
  v11[12] = @"LaunchToSearch";
  v12[11] = &stru_100014938;
  v12[12] = &stru_100014958;
  id v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  13LL));
  testsManifest = self->_testsManifest;
  self->_testsManifest = v7;
}

- (void)waitForApplicationToLoadNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self name:_VUITVAppNavigationDidDisplayViewControllerNotification object:0];

  os_unfair_lock_lock(&self->_appLoadedLock);
  self->_appLoaded = 1;
  os_unfair_lock_unlock(&self->_appLoadedLock);
  id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ATAPPTController applicationLoadCompletion](self, "applicationLoadCompletion"));
  if (v5)
  {
    -[ATAPPTController setApplicationLoadCompletion:](self, "setApplicationLoadCompletion:", 0LL);
    v5[2]();
  }
}

- (void)_runTest:(id)a3 app:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ATAPPTController _canHandleTest:](self, "_canHandleTest:", v6))
  {
    objc_initWeak(&location, self);
    double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ATAPPTController workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005270;
    block[3] = &unk_100014BF8;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_runTVRecapVerticalScrollingCommands:(id)a3
{
  id v20 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[0] = v19;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[1] = v18;
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[2] = v17;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[3] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v23[4] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[5] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[6] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[7] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[8] = v8;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v23[9] = v9;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v23,  10LL));
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = 5LL;
  do
  {
    if (v10) {
      -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v10);
    }
    --v12;
  }

  while (v12);
  id v13 = -[NSMutableArray copy](v11, "copy");

  id v14 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v15 startedTest:v20];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000056B0;
  v21[3] = &unk_100014C20;
  id v22 = v20;
  id v16 = v20;
  [v14 evaluateCommands:v13 completion:v21];
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