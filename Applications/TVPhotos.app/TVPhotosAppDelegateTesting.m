@interface TVPhotosAppDelegateTesting
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (NSDictionary)testOptions;
- (NSString)testName;
- (PXStoryPPTPerformer)currentStoryPPTPerformer;
- (TVPPhotoLibraryTabViewController)photoLibraryTabViewController;
- (TVPhotosAppDelegateTestingDelegate)delegate;
- (UIApplication)application;
- (UIViewController)rootViewController;
- (int)_scrollTestDelta:(id)a3 options:(id)a4;
- (int)_scrollTestLength:(id)a3;
- (unint64_t)_scrollAxisForTestWithOptions:(id)a3;
- (void)_dismissStoryFeed:(id)a3 completion:(id)a4;
- (void)_dismissStoryPlayer:(id)a3 completion:(id)a4;
- (void)_failedCurrentTestWithFailure:(id)a3;
- (void)_finishedCurrentTest;
- (void)_navigateToLatestMemoryWithWillPresentHandler:(id)a3;
- (void)_navigateToStoryFeedWithConfiguration:(id)a3 completion:(id)a4;
- (void)_navigateToStoryPlayerWithConfiguration:(id)a3 completion:(id)a4;
- (void)_performFocusMoveTestOnWindow:(id)a3;
- (void)_performFocusSwipeTestOnWindow:(id)a3;
- (void)_performScrollTestOnScrollView:(id)a3 completionHandler:(id)a4;
- (void)_performScrollTestOnScrollView:(id)a3 testName:(id)a4 completionHandler:(id)a5;
- (void)_runAssetViewTest:(id)a3 usingBlock:(id)a4;
- (void)_runHeadlessStoryTest:(id)a3 usingBlock:(id)a4;
- (void)_runStoryFeedTest:(id)a3 usingBlock:(id)a4;
- (void)_runStoryPlayerTest:(id)a3 usingBlock:(id)a4;
- (void)_startedCurrentTest;
- (void)failedTest:(id)a3;
- (void)failedTest:(id)a3 withFailureFormat:(id)a4;
- (void)finishedSubTest:(id)a3 forTest:(id)a4;
- (void)finishedTest:(id)a3;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)runAssetViewLocalizedTitleTest:(id)a3;
- (void)runAssetViewScrubbingTest:(id)a3;
- (void)runFocusMoveAlbumsTest:(id)a3;
- (void)runFocusMoveMemoriesFeedTest:(id)a3;
- (void)runFocusMoveMomentsTest:(id)a3;
- (void)runInteractiveMemoryFeedScrollingTest:(id)a3;
- (void)runInteractiveMemoryPlaybackStartTest:(id)a3;
- (void)runInteractiveMemoryPlaybackTest:(id)a3;
- (void)runInteractiveMemoryRecipeProductionTest:(id)a3;
- (void)runInteractiveMemoryScrubbingTest:(id)a3;
- (void)runInteractiveMemoryTimelineProductionTest:(id)a3;
- (void)runScrollAlbumsTest:(id)a3;
- (void)runScrollMemoriesFeedTest:(id)a3;
- (void)runScrollMomentsTest:(id)a3;
- (void)runScrollTestOnScrollView:(id)a3 withOptions:(id)a4 subTestName:(id)a5 completion:(id)a6;
- (void)runSwipeAlbumsTest:(id)a3;
- (void)runSwipeMemoriesFeedTest:(id)a3;
- (void)runSwipeMomentsTest:(id)a3;
- (void)setApplication:(id)a3;
- (void)setCurrentStoryPPTPerformer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTestName:(id)a3;
- (void)setTestOptions:(id)a3;
- (void)startSwitchTabTest:(id)a3;
- (void)startedSubTest:(id)a3 forTest:(id)a4;
- (void)startedSubTest:(id)a3 forTest:(id)a4 withMetrics:(id)a5;
- (void)startedTest:(id)a3;
@end

@implementation TVPhotosAppDelegateTesting

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"selector"]);
  v12 = v11;
  if (v11
    && !-[NSString isEqualToString:](v11, "isEqualToString:", &stru_1000CC6C8)
    && (SEL v13 = NSSelectorFromString(v12), (objc_opt_respondsToSelector(self, v13) & 1) != 0))
  {
    -[TVPhotosAppDelegateTesting setApplication:](self, "setApplication:", v8);
    -[TVPhotosAppDelegateTesting setTestName:](self, "setTestName:", v9);
    -[TVPhotosAppDelegateTesting setTestOptions:](self, "setTestOptions:", v10);
    ((void (*)(TVPhotosAppDelegateTesting *, SEL, id))-[TVPhotosAppDelegateTesting methodForSelector:]( self,  "methodForSelector:",  v13))( self,  v13,  v10);
    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (UIViewController)rootViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  return (UIViewController *)v4;
}

- (TVPPhotoLibraryTabViewController)photoLibraryTabViewController
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting rootViewController](self, "rootViewController"));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___UINavigationController, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      goto LABEL_3;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v18 = (objc_class *)objc_opt_class(&OBJC_CLASS___UINavigationController, v17);
    v19 = NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_descriptionForAssertionMessage"));
    [v12 handleFailureInMethod:a2, self, @"TVPhotosAppDelegateTesting.m", 85, @"%@ should be an instance inheriting from %@, but it is %@", @"self.rootViewController", v16, v20 object file lineNumber description];
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    BOOL v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___UINavigationController, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v12 handleFailureInMethod:a2, self, @"TVPhotosAppDelegateTesting.m", 85, @"%@ should be an instance inheriting from %@, but it is nil", @"self.rootViewController", v16 object file lineNumber description];
  }

LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 viewControllers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryTabViewController, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {

    id v8 = 0LL;
  }

  return (TVPPhotoLibraryTabViewController *)v8;
}

- (void)_startedCurrentTest
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  [v4 startedTest:v3];
}

- (void)_finishedCurrentTest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  [v3 finishedTest:v4];

  -[TVPhotosAppDelegateTesting setTestName:](self, "setTestName:", 0LL);
  -[TVPhotosAppDelegateTesting setTestOptions:](self, "setTestOptions:", 0LL);
}

- (void)_failedCurrentTestWithFailure:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  [v5 failedTest:v6 withFailure:v4];

  -[TVPhotosAppDelegateTesting setTestName:](self, "setTestName:", 0LL);
  -[TVPhotosAppDelegateTesting setTestOptions:](self, "setTestOptions:", 0LL);
}

- (int)_scrollTestLength:(id)a3
{
  id v3 = a3;
  [v3 contentSize];
  double v5 = v4;
  [v3 contentSize];
  double v7 = v6;

  if (v5 >= v7) {
    double v8 = v5;
  }
  else {
    double v8 = v7;
  }
  else {
    return (int)v8;
  }
}

- (int)_scrollTestDelta:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"offset"]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"fullScreen"]);

  LODWORD(v6) = [v8 intValue];
  if ((_DWORD)v6 == 1)
  {
    [v5 frame];
    double v10 = v9;
    [v5 frame];
    if (v10 >= v11) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
    int v13 = (int)v12;
  }

  else if (v7)
  {
    int v13 = [v7 intValue];
  }

  else
  {
    int v13 = 50;
  }

  return v13;
}

- (unint64_t)_scrollAxisForTestWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"scrollAxis"]);
  unsigned int v4 = [v3 isEqualToString:@"horizontal"];

  if (v4) {
    return 1LL;
  }
  else {
    return 2LL;
  }
}

- (void)_performScrollTestOnScrollView:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  -[TVPhotosAppDelegateTesting _performScrollTestOnScrollView:testName:completionHandler:]( self,  "_performScrollTestOnScrollView:testName:completionHandler:",  v7,  v8,  v6);
}

- (void)_performScrollTestOnScrollView:(id)a3 testName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testOptions](self, "testOptions"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"iterations"]);
    id v13 = [v12 intValue];
    uint64_t v14 = -[TVPhotosAppDelegateTesting _scrollTestDelta:options:](self, "_scrollTestDelta:options:", v8, v11);
    uint64_t v15 = -[TVPhotosAppDelegateTesting _scrollTestLength:](self, "_scrollTestLength:", v8);
    unint64_t v16 = -[TVPhotosAppDelegateTesting _scrollAxisForTestWithOptions:](self, "_scrollAxisForTestWithOptions:", v11);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000365C;
    v17[3] = &unk_1000C9578;
    id v18 = v10;
    [v8 _performScrollTest:v9 iterations:v13 delta:v14 length:v15 scrollAxis:v16 extraResultsBlock:0 completionBlock:v17];
  }

  else
  {
    -[TVPhotosAppDelegateTesting _failedCurrentTestWithFailure:]( self,  "_failedCurrentTestWithFailure:",  @"Scroll view is nil");
  }
}

- (void)_performFocusSwipeTestOnWindow:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testOptions](self, "testOptions", a3));
  unint64_t v5 = -[TVPhotosAppDelegateTesting _scrollAxisForTestWithOptions:](self, "_scrollAxisForTestWithOptions:", v4);

  BOOL v6 = v5 == 1;
  if (v5 == 1) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 1LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  v7));
  v29[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v29[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  id v11 = sub_1000038E4(v10, 3LL);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL * v6));
  v28[0] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v28[1] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v16 = sub_1000038E4(v15, 3LL);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testOptions](self, "testOptions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"iterations"]);
  id v20 = [v19 integerValue];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v17]);
  id v22 = sub_1000038E4(v21, (uint64_t)v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  id v24 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  [v25 startedTest:v26];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100003954;
  v27[3] = &unk_1000C9528;
  v27[4] = self;
  [v24 evaluateCommands:v23 completion:v27];
}

- (void)_performFocusMoveTestOnWindow:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS____UIFocusMoveTest);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  id v15 = [v5 initWithIdentifier:v6];

  [v15 setContainerFocusEnvironment:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testOptions](self, "testOptions"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"iterations"]);
  objc_msgSend(v15, "setNumberOfIterations:", (int)objc_msgSend(v8, "intValue"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"maxMoves"]);
  unsigned int v10 = [v9 intValue];

  if (v10) {
    int v11 = v10;
  }
  else {
    int v11 = 30;
  }
  [v15 setMaximumMovesPerIteration:v11];
  [v15 setMovementDelay:0.05];
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testOptions](self, "testOptions"));
  unint64_t v13 = -[TVPhotosAppDelegateTesting _scrollAxisForTestWithOptions:](self, "_scrollAxisForTestWithOptions:", v12);

  if (v13 == 1) {
    uint64_t v14 = 8LL;
  }
  else {
    uint64_t v14 = 2LL;
  }
  [v15 setMovementHeading:v14];
  [v15 runWithCompletionHandler:0];
}

- (void)_navigateToLatestMemoryWithWillPresentHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003BA4;
  v7[3] = &unk_1000C95A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "ppt_navigateToTabMode:animated:completionBlock:", 1, 0, v7);
}

- (void)_navigateToStoryPlayerWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:]( &OBJC_CLASS___PXStoryUIFactory,  "viewControllerWithConfiguration:contentViewController:",  a3,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003CF4;
  v11[3] = &unk_1000C95C8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 presentViewController:v9 animated:0 completion:v11];
}

- (void)_dismissStoryPlayer:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003D80;
  v6[3] = &unk_1000C95F0;
  id v7 = a4;
  id v5 = v7;
  [a3 dismissViewControllerAnimated:0 completion:v6];
}

- (void)_navigateToStoryFeedWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PXStoryUIFactory feedViewControllerWithConfiguration:]( &OBJC_CLASS___PXStoryUIFactory,  "feedViewControllerWithConfiguration:",  a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003E60;
  v11[3] = &unk_1000C95C8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 presentViewController:v9 animated:0 completion:v11];
}

- (void)_dismissStoryFeed:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003EEC;
  v6[3] = &unk_1000C95F0;
  id v7 = a4;
  id v5 = v7;
  [a3 dismissViewControllerAnimated:0 completion:v6];
}

- (void)runScrollMomentsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003F70;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 0, 0, v5);
}

- (void)runSwipeMomentsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000408C;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 0, 0, v5);
}

- (void)runFocusMoveMomentsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004174;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 0, 0, v5);
}

- (void)runScrollAlbumsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000425C;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 3, 0, v5);
}

- (void)runSwipeAlbumsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004364;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 3, 0, v5);
}

- (void)runFocusMoveAlbumsTest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004474;
  v5[3] = &unk_1000C9618;
  v5[4] = self;
  objc_msgSend(v4, "ppt_navigateToTabMode:animated:completionBlock:", 3, 0, v5);
}

- (void)runInteractiveMemoryScrubbingTest:(id)a3
{
}

- (void)runInteractiveMemoryPlaybackStartTest:(id)a3
{
  id v4 = a3;
  id v5 = -[PXStoryPPTPerformer initWithDelegate:testOptions:]( objc_alloc(&OBJC_CLASS___PXStoryPPTPerformer),  "initWithDelegate:testOptions:",  self,  v4);

  -[TVPhotosAppDelegateTesting setCurrentStoryPPTPerformer:](self, "setCurrentStoryPPTPerformer:", v5);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000045A0;
  v6[3] = &unk_1000C96A8;
  void v6[4] = self;
  -[TVPhotosAppDelegateTesting _navigateToLatestMemoryWithWillPresentHandler:]( self,  "_navigateToLatestMemoryWithWillPresentHandler:",  v6);
}

- (void)runInteractiveMemoryPlaybackTest:(id)a3
{
}

- (void)runInteractiveMemoryRecipeProductionTest:(id)a3
{
}

- (void)runInteractiveMemoryTimelineProductionTest:(id)a3
{
}

- (void)_runStoryPlayerTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PXStoryPPTPerformer initWithDelegate:testOptions:]( objc_alloc(&OBJC_CLASS___PXStoryPPTPerformer),  "initWithDelegate:testOptions:",  self,  v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004768;
  v11[3] = &unk_1000C97C8;
  id v12 = v8;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v8;
  id v10 = v6;
  -[PXStoryPPTPerformer enumerateStoryConfigurationsUsingBlock:completion:]( v9,  "enumerateStoryConfigurationsUsingBlock:completion:",  v11,  0LL);
}

- (void)_runHeadlessStoryTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PXStoryPPTPerformer initWithDelegate:testOptions:]( objc_alloc(&OBJC_CLASS___PXStoryPPTPerformer),  "initWithDelegate:testOptions:",  self,  v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004A80;
  v11[3] = &unk_1000C9818;
  id v12 = v8;
  id v13 = v6;
  id v9 = v8;
  id v10 = v6;
  -[PXStoryPPTPerformer enumerateStoryConfigurationsUsingBlock:completion:]( v9,  "enumerateStoryConfigurationsUsingBlock:completion:",  v11,  0LL);
}

- (void)runInteractiveMemoryFeedScrollingTest:(id)a3
{
}

- (void)_runStoryFeedTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PXStoryPPTPerformer initWithDelegate:testOptions:]( objc_alloc(&OBJC_CLASS___PXStoryPPTPerformer),  "initWithDelegate:testOptions:",  self,  v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004C64;
  v11[3] = &unk_1000C98A8;
  id v12 = v8;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v8;
  id v10 = v6;
  -[PXStoryPPTPerformer enumerateFeedConfigurationsUsingBlock:completion:]( v9,  "enumerateFeedConfigurationsUsingBlock:completion:",  v11,  0LL);
}

- (void)runAssetViewScrubbingTest:(id)a3
{
}

- (void)runAssetViewLocalizedTitleTest:(id)a3
{
}

- (void)_runAssetViewTest:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v8, "view"));
  [v10 setBackgroundColor:v9];

  -[UIViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 5LL);
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[PXDisplayAssetViewPPTConfiguration defaultConfigurations]( &OBJC_CLASS___PXDisplayAssetViewPPTConfiguration,  "defaultConfigurations"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting rootViewController](self, "rootViewController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100005034;
  v17[3] = &unk_1000C9958;
  id v18 = v8;
  v19 = self;
  id v21 = v11;
  id v22 = v7;
  id v20 = v6;
  id v13 = v11;
  id v14 = v7;
  id v15 = v6;
  id v16 = v8;
  [v12 presentViewController:v16 animated:1 completion:v17];
}

- (void)startedTest:(id)a3
{
  id v4 = a3;
  PXPPTWillStartTest();
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v5 startedTest:v4];
}

- (void)finishedTest:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v4 finishedTest:v5];

  PXPPTDidEndTest(v5);
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v7 finishedTest:v8 extraResults:v6];

  PXPPTDidEndTest(v8);
}

- (void)failedTest:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v4 failedTest:v5];

  PXPPTDidEndTest(v5);
}

- (void)failedTest:(id)a3 withFailureFormat:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v10);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v9 failedTest:v7 withFailure:v8];

  PXPPTDidEndTest(v7);
}

- (void)startedSubTest:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v8 startedSubTest:v7 forTest:v6];
}

- (void)startedSubTest:(id)a3 forTest:(id)a4 withMetrics:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v11 startedSubTest:v10 forTest:v9 withMetrics:v8];
}

- (void)finishedSubTest:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting application](self, "application"));
  [v8 finishedSubTest:v7 forTest:v6];
}

- (void)runScrollTestOnScrollView:(id)a3 withOptions:(id)a4 subTestName:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = v9;
  id v12 = a5;
  PXPPTWillBeginScrollTestOnScrollView(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000055E4;
  v15[3] = &unk_1000C9980;
  id v16 = v11;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  -[TVPhotosAppDelegateTesting _performScrollTestOnScrollView:testName:completionHandler:]( self,  "_performScrollTestOnScrollView:testName:completionHandler:",  v13,  v12,  v15);
}

- (void)runScrollMemoriesFeedTest:(id)a3
{
}

- (void)runSwipeMemoriesFeedTest:(id)a3
{
}

- (void)runFocusMoveMemoriesFeedTest:(id)a3
{
}

- (void)startSwitchTabTest:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting photoLibraryTabViewController](self, "photoLibraryTabViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosAppDelegateTesting testName](self, "testName"));
  objc_msgSend(v6, "ppt_runTabSwitchingTestWithName:options:delegate:completionHandler:", v5, v4, self, 0);
}

- (TVPhotosAppDelegateTestingDelegate)delegate
{
  return (TVPhotosAppDelegateTestingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (void)setTestOptions:(id)a3
{
}

- (PXStoryPPTPerformer)currentStoryPPTPerformer
{
  return self->_currentStoryPPTPerformer;
}

- (void)setCurrentStoryPPTPerformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end