void sub_1000039F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A1C(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004010(id a1)
{
  id v1 = -[ATAPPTController _init](objc_alloc(&OBJC_CLASS___ATAPPTController), "_init");
  v2 = (void *)qword_10001A3C0;
  qword_10001A3C0 = (uint64_t)v1;
}

id sub_1000043D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_1000044C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000044D8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = [*(id *)(a1 + 32) hasPrefix:a2];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

BOOL sub_100004730(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  VUITabBarItemIdentifierKeyWatchNow,  a3);
}

BOOL sub_10000474C(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  VUITabBarItemIdentifierKeyLibrary,  a3);
}

BOOL sub_100004768(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  VUITabBarItemIdentifierKeySearch,  a3);
}

BOOL sub_100004784(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  0LL);

  return v8;
}

BOOL sub_100004824(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  1LL,  v7,  &stru_1000149D8);

  return v8;
}

UIScrollView *__cdecl sub_1000048C8(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewByIndexInStackCollectionView:index:",  a2,  1LL);
}

BOOL sub_1000048DC(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  &stru_100014A18);

  return v8;
}

UIScrollView *__cdecl sub_100004980(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](&OBJC_CLASS___ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v2, "view"));

  id v4 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v3,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (UIScrollView *)v5;
}

BOOL sub_100004A00(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  &stru_100014A58);

  return v8;
}

UIScrollView *__cdecl sub_100004AA4(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](&OBJC_CLASS___ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](v2, "childViewControllers"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  id v8 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v7,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (UIScrollView *)v9;
}

BOOL sub_100004B70(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  &stru_100014A98);

  return v8;
}

UIScrollView *__cdecl sub_100004C14(id a1, UIViewController *a2)
{
  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](&OBJC_CLASS___ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](v2, "childViewControllers"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  id v8 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v7,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (UIScrollView *)v9;
}

BOOL sub_100004CE0(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities resetNumScrollViewFound](&OBJC_CLASS___ATAPPTUtilities, "resetNumScrollViewFound");
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  1LL,  v7,  &stru_100014AD8);

  return v8;
}

UIScrollView *__cdecl sub_100004D78(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewByIndexInStackCollectionView:index:",  a2,  2LL);
}

BOOL sub_100004D8C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  VUITabBarItemIdentifierKeyPPTStack,  v6);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v8,  v6,  1LL);
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  }

  BOOL v11 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v7,  0LL,  1LL,  v6,  &stru_100014AF8);

  return v11;
}

UIScrollView *__cdecl sub_100004E78(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewByIndexInStackCollectionView:index:",  a2,  3LL);
}

BOOL sub_100004E8C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  VUITabBarItemIdentifierKeyPPTStack,  v6);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v8,  v6,  1LL);
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
    [*(id *)(a1 + 32) _scrollHalfTheScreenHeightIn:v6];
  }

  BOOL v11 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v7,  0LL,  1LL,  v6,  &stru_100014B40);

  return v11;
}

UIScrollView *__cdecl sub_100004F84(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewByIndexInStackCollectionView:index:",  a2,  5LL);
}

BOOL sub_100004F98(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTSports;
  id v6 = a4;
  id v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  0LL);

  return v8;
}

BOOL sub_100005038(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5 = VUITabBarItemIdentifierKeyPPTShowProduct;
  id v6 = a4;
  id v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:]( &OBJC_CLASS___ATAPPTUtilities,  "selectTabWithTitle:inTabBarController:",  v5,  v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:]( &OBJC_CLASS___ATAPPTUtilities,  "waitForTabWithTitleToLoad:inTabBarController:totalChildren:",  v5,  v7,  1LL);
  BOOL v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:]( &OBJC_CLASS___ATAPPTUtilities,  "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:",  v6,  0LL,  2LL,  v7,  0LL);

  return v8;
}

void sub_10000525C(_Unwind_Exception *a1)
{
}

void sub_100005270(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 splitViewController]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005350;
  block[3] = &unk_100014BD0;
  id v7 = v3;
  BOOL v8 = @"watchnow";
  id v9 = WeakRetained;
  id v10 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_sync(&_dispatch_main_q, block);
}

void sub_100005350(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000053F0;
  v4[3] = &unk_100014BA8;
  v3 = *(void **)(a1 + 56);
  v4[4] = *(void *)(a1 + 48);
  id v5 = v3;
  dispatch_after(v2, &_dispatch_main_q, v4);
}

id sub_1000053F0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _runTVRecapVerticalScrollingCommands:*(void *)(a1 + 40)];
}

void sub_1000056B0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v2 finishedTest:*(void *)(a1 + 32) extraResults:0];
}

void sub_1000057BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tv", "ATAPPTUtilities");
  id v2 = (void *)qword_10001A3D0;
  qword_10001A3D0 = (uint64_t)v1;
}

void sub_10000582C(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  id v2 = (void *)qword_10001A3E0;
  qword_10001A3E0 = (uint64_t)v1;

  [(id)qword_10001A3E0 setMaxConcurrentOperationCount:1];
  _[(id)qword_10001A3E0 setQualityOfService:17];
}

void sub_100005C44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

uint64_t sub_100005C80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005C90(uint64_t a1)
{
}

void sub_100005C98(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _topViewControllerInTabBarController:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    id v5 = [(id)objc_opt_class(*(void *)(a1 + 48)) topMostController];
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_100005D14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(v2 + 16))( v2,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 56) _findScrollViewInViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100005D78(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 68);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005E30;
  v6[3] = &unk_100014D18;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 _performScrollTest:v5 iterations:10 delta:v3 length:v4 scrollAxis:v1 extraResultsBlock:&stru_100014CF0 completionBlock:v6];
}

NSDictionary *__cdecl sub_100005E24(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

uint64_t sub_100005E30(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100005E38()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_10001A3F8;
  uint64_t v7 = qword_10001A3F8;
  if (!qword_10001A3F8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100008138;
    v3[3] = &unk_100014D68;
    v3[4] = &v4;
    sub_100008138((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005ED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005EEC(void *a1)
{
  if (a1[6] == 1LL
    && ([*(id *)(*(void *)(a1[5] + 8) + 40) _contentScrollsAlongXAxis] & 1) == 0)
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) _setContentScrollsAlongXAxis:1];
  }

  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000LL;
  uint64_t v2 = (void *)qword_10001A408;
  uint64_t v9 = qword_10001A408;
  if (!qword_10001A408)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100008238;
    v5[3] = &unk_100014D68;
    v5[4] = &v6;
    sub_100008238((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }

  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = [[v3 alloc] initWithTestName:a1[4] scrollView:*(void *)(*(void *)(a1[5] + 8) + 40) completionHandler:0];
  [sub_100005E38() runTestWithParameters:v4];
}

void sub_100005FEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000060C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000060D8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](&OBJC_CLASS___UIWindow, "keyWindow"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 rootViewController]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) navigationController]);
  id v6 = [v7 popToRootViewControllerAnimated:0];
}

void sub_100006574( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006598(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tabBarItems]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "vui_stringForKey:",  v7,  (void)v23));
        if ([v9 isEqualToString:*(void *)(a1 + 40)])
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;

          goto LABEL_11;
        }

        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      }

      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](&OBJC_CLASS___ATAPPTUtilities, "testLog"));
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v13;
      __int16 v29 = 2048;
      uint64_t v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found '%@' at index %lu", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setSelectedIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewControllers]);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v16 tabBarController:*(void *)(a1 + 32) didSelectViewController:v12];
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_10000D89C(a1, v12, v17, v18, v19, v20, v21, v22);
  }
}

  return v11;
}

uint64_t sub_1000068E8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_7:
  v12 = v9;
LABEL_21:

  return v12;
}

int64_t sub_100006CE0(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIScrollView);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIScrollView), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    id v8 = v5;
    [v4 frame];
    double v10 = v9;
    [v8 frame];
    double v12 = v11;

    if (v10 > v12) {
      int64_t v13 = 1LL;
    }
    else {
      int64_t v13 = -1LL;
    }
  }

  else
  {
    int64_t v13 = 0LL;
  }

  return v13;
}

BOOL +[ATAPPTUtilities _blockExecutionInTabBarController:documentRef:totalChildren:]( id a1, SEL a2, id a3, id a4, unint64_t a5)
{
  id v7 = a3;
  id v8 = a4;
  __int16 v29 = v7;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 tabBarItems]);
  double v10 = (char *)[v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v10)
  {
    double v11 = 0LL;
    uint64_t v12 = *(void *)v42;
    uint64_t v13 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      uint64_t v14 = 0LL;
      uint64_t v30 = &v10[(void)v11];
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)v14), "vui_stringForKey:", v13));
        unsigned __int8 v16 = [v15 isEqualToString:v8];

        if ((v16 & 1) != 0)
        {
          uint64_t v30 = &v14[(void)v11];
          goto LABEL_12;
        }

        ++v14;
      }

      while (v10 != v14);
      double v10 = (char *)[v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
      double v11 = v30;
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v30 = 0LL;
  }

LABEL_12:
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v29 viewControllers]);
  uint64_t v28 = (char *)[v17 count];

  if (v30 < v28)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v29 viewControllers]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:v30]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___UINavigationController);
    if ((objc_opt_isKindOfClass(v27, v19) & 1) != 0) {
      id v20 = v27;
    }
    else {
      id v20 = 0LL;
    }
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 viewControllers]);
    if ((unint64_t)[v21 count] >= a5)
    {
LABEL_20:
    }

    else
    {
      int v22 = 11;
      while (1)
      {

        if (!--v22) {
          break;
        }
        usleep(0xC350u);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 viewControllers]);
      }
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v20 viewControllers]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lastObject]);

    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    char v40 = 0;
    block = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_100007128;
    v34 = &unk_100014E20;
    uint64_t v36 = &v37;
    id v26 = v24;
    id v35 = v26;
    dispatch_sync(&_dispatch_main_q, &block);
    while (*((_BYTE *)v38 + 24))
    {
      usleep(0xC350u);
      block = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      v33 = sub_100007128;
      v34 = &unk_100014E20;
      uint64_t v36 = &v37;
      objc_storeStrong(&v35, v24);
      dispatch_sync(&_dispatch_main_q, &block);
    }

    _Block_object_dispose(&v37, 8);
  }

  return v30 < v28;
}

void sub_100007108( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id sub_100007128(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "vui_ppt_isLoading");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_10000752C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UILabel);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
  id v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  return v7;
}

id sub_100007A94(uint64_t a1)
{
  return _[*(id *)(a1 + 32) sendActionsForControlEvents:64];
}

uint64_t sub_100007C54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_isKindOfClass(v3, *(void *)(a1 + 40)) & 1) != 0)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabels", 0));
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) text]);
          unsigned __int8 v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

          if ((v10 & 1) != 0)
          {
            uint64_t v11 = 1LL;
            goto LABEL_13;
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = 0LL;
LABEL_13:
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

id sub_100007E58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "textContentView") & 1) != 0) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 performSelector:"textContentView"]);
  }
  else {
    uint64_t v4 = 0LL;
  }
  if ((objc_opt_respondsToSelector(v4, "text") & 1) != 0) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performSelector:"text"]);
  }
  else {
    id v5 = 0LL;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

id sub_100007FE8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 currentTitle]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

Class sub_100008138(uint64_t a1)
{
  Class result = objc_getClass("RPTTestRunner");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10000D904();
  }
  qword_10001A3F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000818C()
{
  id v1 = 0LL;
  if (!qword_10001A400)
  {
    __int128 v2 = off_100014E90;
    uint64_t v3 = 0LL;
    qword_10001A400 = _sl_dlopen(&v2, &v1);
  }

  v0 = v1;
  if (!qword_10001A400)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }

  if (v1) {
LABEL_7:
  }
    free(v0);
}

Class sub_100008238(uint64_t a1)
{
  Class result = objc_getClass("RPTScrollViewTestParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10000D928();
  }
  qword_10001A408 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000828C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = VUISignpostLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Launch.Main",  "",  buf,  2u);
  }

  uint64_t v6 = VUISignpostLogObject();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Launch.FirstTab",  "",  v18,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  [v8 preWarm:0];

  id v9 = objc_autoreleasePoolPush();
  unsigned __int8 v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppleTVAppDelegate);
  uint64_t v11 = NSStringFromClass(v10);
  uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___ATAUIApplication);
  __int128 v14 = NSStringFromClass(v13);
  __int128 v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
  objc_autoreleasePoolPop(v9);
  uint64_t v16 = UIApplicationMain(a1, a2, v15, v12);

  return v16;
}

uint64_t sub_100008408()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000B114(v0, qword_10001B0B8);
  sub_10000851C(v0, (uint64_t)qword_10001B0B8);
  id v1 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    unint64_t v5 = v4;
  }

  else
  {
    unint64_t v5 = 0xEC00000076742E65LL;
    uint64_t v3 = 0x6C7070612E6D6F63LL;
  }

  return Logger.init(subsystem:category:)(v3, v5, 0x746E497070415654LL, 0xEC00000073746E65LL);
}

uint64_t sub_1000084F8()
{
  return sub_1000089A8( &qword_10001A410,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)qword_10001B0B8,  (uint64_t)sub_100008408);
}

uint64_t sub_10000851C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008534@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001A410 != -1) {
    swift_once(&qword_10001A410, sub_100008408);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0B8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_1000085A8()
{
  return IntentParameter.wrappedValue.getter();
}

void sub_1000085C8()
{
  id v0 = [(id)objc_opt_self(VUILocalizationManager) sharedInstance];
  if (v0)
  {
    id v1 = v0;
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = [v1 localizedStringForKey:v2];

    if (v3)
    {
      uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
      uint64_t v6 = v5;
    }

    else
    {
      uint64_t v4 = 0LL;
      uint64_t v6 = 0LL;
    }

    qword_10001A420 = v4;
    qword_10001A428 = v6;
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100008690()
{
  uint64_t v0 = sub_100008C94(&qword_10001A2A8);
  uint64_t v1 = type metadata accessor for StringSearchScope(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = swift_allocObject(v0, v4 + *(void *)(v2 + 72), v3 | 7);
  *(_OWORD *)(v5 + 16) = xmmword_100011C40;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))( v5 + v4,  enum case for StringSearchScope.general(_:),  v1);
  qword_10001B0D0 = v5;
  return result;
}

uint64_t *sub_100008724()
{
  if (qword_10001A430 != -1) {
    swift_once(&qword_10001A430, sub_100008690);
  }
  return &qword_10001B0D0;
}

uint64_t sub_100008764()
{
  if (qword_10001A430 != -1) {
    swift_once(&qword_10001A430, sub_100008690);
  }
  swift_beginAccess(&qword_10001B0D0, v1, 0LL, 0LL);
  return swift_bridgeObjectRetain(qword_10001B0D0);
}

uint64_t sub_1000087D0(uint64_t a1)
{
  if (qword_10001A430 != -1) {
    swift_once(&qword_10001A430, sub_100008690);
  }
  swift_beginAccess(&qword_10001B0D0, v4, 1LL, 0LL);
  uint64_t v2 = qword_10001B0D0;
  qword_10001B0D0 = a1;
  return swift_bridgeObjectRelease(v2);
}

void *sub_100008844(uint64_t a1)
{
  if (qword_10001A430 != -1) {
    swift_once(&qword_10001A430, sub_100008690);
  }
  swift_beginAccess(&qword_10001B0D0, a1, 33LL, 0LL);
  return &j__swift_endAccess;
}

void *sub_1000088B4()
{
  return &unk_100011C60;
}

uint64_t sub_1000088C0()
{
  return 0LL;
}

uint64_t sub_1000088C8()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  sub_10000B114(v0, qword_10001B0D8);
  sub_10000851C(v0, (uint64_t)qword_10001B0D8);
  if (qword_10001A418 != -1) {
    swift_once(&qword_10001A418, sub_1000085C8);
  }
  if (qword_10001A428) {
    unint64_t v1 = qword_10001A420;
  }
  else {
    unint64_t v1 = 0xD000000000000010LL;
  }
  if (qword_10001A428) {
    unint64_t v2 = qword_10001A428;
  }
  else {
    unint64_t v2 = 0x8000000100012A20LL;
  }
  swift_bridgeObjectRetain(qword_10001A428);
  return LocalizedStringResource.init(stringLiteral:)(v1, v2);
}

uint64_t sub_100008984()
{
  return sub_1000089A8( qword_10001A438,  (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource,  (uint64_t)qword_10001B0D8,  (uint64_t)sub_1000088C8);
}

uint64_t sub_1000089A8(void *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  if (*a1 != -1LL) {
    swift_once(a1, a4);
  }
  uint64_t v6 = a2(0LL);
  return sub_10000851C(v6, a3);
}

uint64_t sub_1000089EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001A438[0] != -1) {
    swift_once(qword_10001A438, sub_1000088C8);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0D8);
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_100008A84(uint64_t a1)
{
  if (qword_10001A438[0] != -1) {
    swift_once(qword_10001A438, sub_1000088C8);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0D8);
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_100008B34(uint64_t a1))(void)
{
  if (qword_10001A438[0] != -1) {
    swift_once(qword_10001A438, sub_1000088C8);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0D8);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return j_j__swift_endAccess;
}

uint64_t sub_100008BAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StringSearchCriteria(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  IntentParameter.wrappedValue.setter(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_100008C44(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100008C8C;
}

uint64_t sub_100008C94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100008CD4()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100008CF4(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_100008C94(&qword_10001A208);
  v2[6] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for StringSearchCriteria(0LL);
  v2[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[8] = v5;
  v2[9] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100008C94(&qword_10001A210);
  v2[10] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  v2[11] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[12] = v8;
  uint64_t v9 = *(void *)(v8 + 64);
  v2[13] = v9;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[14] = swift_task_alloc(v10);
  v2[15] = swift_task_alloc(v10);
  v2[16] = swift_task_alloc(v10);
  return swift_task_switch(sub_100008DE4, 0LL, 0LL);
}

uint64_t sub_100008DE4()
{
  uint64_t v1 = v0[12];
  uint64_t v78 = v0[11];
  uint64_t v81 = 0xD000000000000021LL;
  uint64_t v3 = (void *)v0[9];
  uint64_t v2 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  unint64_t v82 = 0x8000000100012770LL;
  uint64_t v6 = IntentParameter.wrappedValue.getter(v3);
  uint64_t v7 = StringSearchCriteria.term.getter(v6);
  uint64_t v9 = v8;
  unint64_t v10 = *(void (**)(void *, uint64_t))(v4 + 8);
  v10(v3, v5);
  v11._countAndFlagsBits = v7;
  v11._object = v9;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v9);
  URL.init(string:)(0xD000000000000021LL, 0x8000000100012770LL);
  swift_bridgeObjectRelease(0x8000000100012770LL);
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1LL, v78);
  uint64_t v13 = v0[16];
  if (v12 == 1)
  {
    uint64_t v14 = v0[15];
    __int128 v15 = (void *)v0[9];
    uint64_t v16 = v0[10];
    uint64_t v17 = v0[7];
    uint64_t v76 = v0[14];
    uint64_t v79 = v0[6];
    sub_10000AF98(v16, &qword_10001A210);
    uint64_t v81 = 0xD000000000000021LL;
    unint64_t v82 = 0x8000000100012770LL;
    uint64_t v18 = IntentParameter.wrappedValue.getter(v15);
    uint64_t v19 = StringSearchCriteria.term.getter(v18);
    id v20 = v10;
    int v22 = v21;
    v20(v15, v17);
    v23._countAndFlagsBits = v19;
    v23._object = v22;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v22);
    unint64_t v24 = sub_100009348();
    swift_allocError(&type metadata for TVAppShowInSearchResults.ShowSearchIntentError, v24, 0LL, 0LL);
    *__int128 v25 = 0xD000000000000021LL;
    v25[1] = 0x8000000100012770LL;
    swift_willThrow();
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v76);
    swift_task_dealloc(v16);
    swift_task_dealloc(v15);
    swift_task_dealloc(v79);
    id v26 = (uint64_t (*)(void))v0[1];
  }

  else
  {
    v74 = v10;
    v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[12] + 32LL);
    v80(v13, v0[10], v0[11]);
    if (qword_10001A410 != -1) {
      swift_once(&qword_10001A410, sub_100008408);
    }
    uint64_t v27 = v0[15];
    uint64_t v28 = v0[16];
    uint64_t v29 = v0[11];
    uint64_t v30 = v0[12];
    uint64_t v31 = v0[5];
    uint64_t v32 = type metadata accessor for Logger(0LL);
    sub_10000851C(v32, (uint64_t)qword_10001B0B8);
    v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
    v77(v27, v28, v29);
    uint64_t v33 = swift_retain_n(v31, 2LL);
    v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.info.getter();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = v0[15];
    uint64_t v38 = v0[11];
    uint64_t v39 = v0[12];
    if (v36)
    {
      char v40 = (void *)v0[9];
      uint64_t v41 = v0[7];
      uint64_t v42 = v0[5];
      uint64_t v43 = swift_slowAlloc(22LL, -1LL);
      uint64_t v72 = swift_slowAlloc(64LL, -1LL);
      uint64_t v81 = v72;
      *(_DWORD *)uint64_t v43 = 136315394;
      os_log_type_t type = v35;
      __int128 v44 = IntentParameter.wrappedValue.getter(v40);
      uint64_t v45 = StringSearchCriteria.term.getter(v44);
      uint64_t v69 = v39;
      uint64_t v46 = v38;
      unint64_t v48 = v47;
      v74(v40, v41);
      v0[2] = sub_10000A2B8(v45, v48, &v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease(v48);
      swift_release_n(v42, 2LL);
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v49 = sub_10000B1D8( &qword_10001A230,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      uint64_t v50 = v46;
      uint64_t v51 = dispatch thunk of CustomStringConvertible.description.getter(v46, v49);
      unint64_t v53 = v52;
      v0[3] = sub_10000A2B8(v51, v52, &v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v43 + 14, v43 + 22);
      swift_bridgeObjectRelease(v53);
      v54 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
      v54(v37, v50);
      _os_log_impl( (void *)&_mh_execute_header,  v34,  type,  "TVAppShowSearchResults - Launching with search term: %s and URL: %s",  (uint8_t *)v43,  0x16u);
      swift_arrayDestroy(v72, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v72, -1LL, -1LL);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v0[5], 2LL);
      v54 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v54(v37, v38);
    }

    uint64_t v55 = v0[16];
    uint64_t v56 = v0[13];
    uint64_t v57 = v0[14];
    uint64_t v59 = v0[11];
    uint64_t v58 = v0[12];
    *(void *)typea = v0[15];
    uint64_t v73 = v0[10];
    uint64_t v75 = v0[9];
    uint64_t v60 = v0[6];
    uint64_t v61 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56LL))(v60, 1LL, 1LL, v61);
    v77(v57, v55, v59);
    type metadata accessor for MainActor(0LL);
    uint64_t v62 = static MainActor.shared.getter();
    uint64_t v63 = *(unsigned __int8 *)(v58 + 80);
    uint64_t v64 = (v63 + 32) & ~v63;
    uint64_t v65 = swift_allocObject(&unk_100014EB8, v64 + v56, v63 | 7);
    *(void *)(v65 + 16) = v62;
    *(void *)(v65 + 24) = &protocol witness table for MainActor;
    v80(v65 + v64, v57, v59);
    uint64_t v66 = sub_100009834(v60, (uint64_t)&unk_10001A228, v65);
    uint64_t v67 = swift_release(v66);
    static IntentResult.result<>()(v67);
    v54(v55, v59);
    swift_task_dealloc(v55);
    swift_task_dealloc(*(void *)typea);
    swift_task_dealloc(v57);
    swift_task_dealloc(v73);
    swift_task_dealloc(v75);
    swift_task_dealloc(v60);
    id v26 = (uint64_t (*)(void))v0[1];
  }

  return v26();
}

unint64_t sub_100009348()
{
  unint64_t result = qword_10001A218;
  if (!qword_10001A218)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011DB8, &type metadata for TVAppShowInSearchResults.ShowSearchIntentError);
    atomic_store(result, &qword_10001A218);
  }

  return result;
}

uint64_t sub_10000938C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a1;
  v4[16] = a4;
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  v4[17] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[18] = v6;
  v4[19] = v7;
  return swift_task_switch(sub_1000093F8, v6, v7);
}

uint64_t sub_1000093F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  id v3 = [(id)objc_opt_self(UIApplication) sharedApplication];
  v1[20] = v3;
  URL._bridgeToObjectiveC()(v4);
  uint64_t v6 = v5;
  v1[21] = v5;
  unint64_t v7 = sub_100009708((uint64_t)&_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_10000B1D8( &qword_10001A290,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100011FE4);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1[22] = isa;
  swift_bridgeObjectRelease(v7);
  v1[7] = v1 + 23;
  v1[2] = v1;
  v1[3] = sub_100009540;
  uint64_t v9 = swift_continuation_init(v2, 0LL);
  v1[10] = _NSConcreteStackBlock;
  v1 += 10;
  v1[1] = 0x40000000LL;
  v1[2] = sub_100009820;
  v1[3] = &unk_1000150E0;
  v1[4] = v9;
  [v3 openURL:v6 options:isa completionHandler:v1];
  return swift_continuation_await(v2);
}

uint64_t sub_100009540()
{
  return swift_task_switch(sub_100009584, *(void *)(*(void *)v0 + 144LL), *(void *)(*(void *)v0 + 152LL));
}

uint64_t sub_100009584()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v2 = *(void **)(v0 + 176);
  id v3 = *(void **)(v0 + 160);
  uint64_t v4 = *(_BYTE **)(v0 + 120);
  swift_release(*(void *)(v0 + 136));
  *uint64_t v4 = *(_BYTE *)(v0 + 184);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000095DC()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100009650(uint64_t a1)
{
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for URL(0LL) - 8) + 80LL);
  uint64_t v5 = v1 + ((v4 + 32) & ~v4);
  uint64_t v6 = (void *)swift_task_alloc(dword_10001A224);
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_1000096C0;
  return sub_10000938C(a1, v7, v8, v5);
}

uint64_t sub_1000096C0()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100009708(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008C94(&qword_10001A298);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000B0BC(v7, (uint64_t)&v14);
    uint64_t v8 = v14;
    unint64_t result = sub_10000A8F8(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_10000B104(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100009820(uint64_t a1, char a2)
{
  **(_BYTE **)(*(void *)(*(void *)(a1 + 32) + 64LL) + 40LL) = a2;
  return swift_continuation_resume();
}

uint64_t sub_100009834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000AF98(a1, &qword_10001A208);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_1000150C8, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, &type metadata for Bool, &unk_10001A288, v16);
}

uint64_t sub_10000997C()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008C94(&qword_10001A1E8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008C94(&qword_10001A1F0);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008C94(&qword_10001A1F8);
  LocalizedStringResource.init(stringLiteral:)(0x6169726574697243LL, 0xE800000000000000LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1LL, 1LL, v8);
  uint64_t v12 = type metadata accessor for IntentDialog(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v5, 1LL, 1LL, v12);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for InputConnectionBehavior.default(_:),  v0);
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v11, v7, v5, v3);
}

uint64_t sub_100009B34@<X0>(void *a1@<X8>)
{
  if (qword_10001A430 != -1) {
    swift_once(&qword_10001A430, sub_100008690);
  }
  swift_beginAccess(&qword_10001B0D0, v4, 0LL, 0LL);
  uint64_t v2 = qword_10001B0D0;
  *a1 = qword_10001B0D0;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_100009BA8()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009BC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StringSearchCriteria(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  IntentParameter.wrappedValue.setter(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_100009C60(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100008C8C;
}

void sub_100009CA8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

uint64_t sub_100009CE8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc(dword_10001A204);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000096C0;
  return sub_100008CF4(a1, v4);
}

uint64_t sub_100009D40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000997C();
  *a1 = result;
  return result;
}

uint64_t sub_100009D64(uint64_t a1)
{
  unint64_t v2 = sub_10000AC1C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100009D8C(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(45LL, 1LL);
  v6._object = (void *)0x80000001000127A0LL;
  v6._countAndFlagsBits = 0xD00000000000002DLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v6);
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v8);
  return LocalizedStringResource.init(stringInterpolation:)(v5);
}

uint64_t sub_100009E50()
{
  unint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = *v0;
  uint64_t v4 = (void *)v0[1];
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(45LL, 1LL);
  v5._object = (void *)0x80000001000127A0LL;
  v5._countAndFlagsBits = 0xD00000000000002DLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v5);
  v6._countAndFlagsBits = v3;
  v6._object = v4;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v6);
  v7._countAndFlagsBits = 0LL;
  v7._object = (void *)0xE000000000000000LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v7);
  return LocalizedStringResource.init(stringInterpolation:)(v2);
}

uint64_t sub_100009F0C(uint64_t a1, uint64_t a2)
{
  return sub_10000A054(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100009F18(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100009F8C(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10000A008@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_10000A048(uint64_t a1, uint64_t a2)
{
  return sub_10000A054(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000A054(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000A090(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000A0D0(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10000A140(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10000A1C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000A20C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000A234(uint64_t a1)
{
  uint64_t v2 = sub_10000B1D8( &qword_10001A290,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100011FE4);
  uint64_t v3 = sub_10000B1D8( &qword_10001A2D0,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100011F38);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000A2B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A388(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AF58((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000AF58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000AF38(v12);
  return v7;
}

uint64_t sub_10000A388(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_10000A540(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_10000A540(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A5D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A7AC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A7AC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A5D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_10000A748(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10000A748(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_100008C94(&qword_10001A278);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000A7AC(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100008C94(&qword_10001A278);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_10000A8F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10000A978(a1, v7);
}

unint64_t sub_10000A978(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

uint64_t sub_10000AAEC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_10000AB54;
  return v5(v2 + 32);
}

uint64_t sub_10000AB54()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(_BYTE **)(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 24));
  _BYTE *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

unint64_t sub_10000ABA8()
{
  unint64_t result = qword_10001A238;
  if (!qword_10001A238)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011CBC, &type metadata for TVAppShowInSearchResults);
    atomic_store(result, (unint64_t *)&qword_10001A238);
  }

  return result;
}

uint64_t sub_10000ABEC()
{
  return sub_10000B1D8( &qword_10001A240,  (uint64_t (*)(uint64_t))&type metadata accessor for StringSearchCriteria,  (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
}

unint64_t sub_10000AC1C()
{
  unint64_t result = qword_10001A248;
  if (!qword_10001A248)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011CE4, &type metadata for TVAppShowInSearchResults);
    atomic_store(result, (unint64_t *)&qword_10001A248);
  }

  return result;
}

unint64_t sub_10000AC64()
{
  unint64_t result = qword_10001A250;
  if (!qword_10001A250)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011D74, &type metadata for TVAppShowInSearchResults);
    atomic_store(result, (unint64_t *)&qword_10001A250);
  }

  return result;
}

unint64_t sub_10000ACAC()
{
  unint64_t result = qword_10001A258;
  if (!qword_10001A258)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011D9C, &type metadata for TVAppShowInSearchResults);
    atomic_store(result, (unint64_t *)&qword_10001A258);
  }

  return result;
}

uint64_t sub_10000ACF0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000135D4, 1LL);
}

uint64_t sub_10000AD00(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_10000AC1C();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>,  1LL);
}

ValueMetadata *type metadata accessor for AppIntentLogger()
{
  return &type metadata for AppIntentLogger;
}

ValueMetadata *type metadata accessor for TVAppShowInSearchResults()
{
  return &type metadata for TVAppShowInSearchResults;
}

void *initializeBufferWithCopyOfBuffer for TVAppShowInSearchResults.ShowSearchIntentError( void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TVAppShowInSearchResults.ShowSearchIntentError(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for TVAppShowInSearchResults.ShowSearchIntentError(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for TVAppShowInSearchResults.ShowSearchIntentError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for TVAppShowInSearchResults.ShowSearchIntentError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVAppShowInSearchResults.ShowSearchIntentError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVAppShowInSearchResults.ShowSearchIntentError( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(va, 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(va, 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TVAppShowInSearchResults.ShowSearchIntentError()
{
  return &type metadata for TVAppShowInSearchResults.ShowSearchIntentError;
}

unint64_t sub_10000AEA8()
{
  unint64_t result = qword_10001A268;
  if (!qword_10001A268)
  {
    uint64_t v1 = sub_10000AEF4(&qword_10001A270);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A268);
  }

  return result;
}

uint64_t sub_10000AEF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000AF38(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000AF58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AF98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008C94(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000AFD4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000AFF8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_10001A284);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1000096C0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001A280 + dword_10001A280))(a1, v4);
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_10001A2B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100015108);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001A2B0);
    }
  }

uint64_t sub_10000B0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008C94(&qword_10001A2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000B104(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_10000B114(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_10000B154()
{
  return sub_10000B1D8( &qword_10001A2B8,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100011EFC);
}

uint64_t sub_10000B180()
{
  return sub_10000B1D8( &qword_10001A2C0,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)"q3");
}

uint64_t sub_10000B1AC()
{
  return sub_10000B1D8( &qword_10001A2C8,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100011F6C);
}

uint64_t sub_10000B1D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000B224(char a1)
{
  return *(void *)&aPerson_1[8 * a1];
}

uint64_t sub_10000B244(char *a1, char *a2)
{
  return sub_10000B250(*a1, *a2);
}

uint64_t sub_10000B250(char a1, char a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)&aPerson_1[v2 * 8];
  uint64_t v4 = qword_1000122D0[v2];
  uint64_t v5 = a2;
  uint64_t v6 = *(void *)&aPerson_1[v5 * 8];
  uint64_t v7 = qword_1000122D0[v5];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_1000122D0[a2], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

Swift::Int sub_10000B2D4()
{
  return sub_10000B2DC(*v0);
}

Swift::Int sub_10000B2DC(char a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = qword_1000122D0[v2];
  String.hash(into:)(v5, *(void *)&aPerson_1[v2 * 8], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000B344(uint64_t a1)
{
  return sub_10000B34C(a1, *v1);
}

uint64_t sub_10000B34C(uint64_t a1, char a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_1000122D0[v2];
  String.hash(into:)(a1, *(void *)&aPerson_1[v2 * 8], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10000B38C(uint64_t a1)
{
  return sub_10000B394(a1, *v1);
}

Swift::Int sub_10000B394(uint64_t a1, char a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_1000122D0[v3];
  String.hash(into:)(v6, *(void *)&aPerson_1[v3 * 8], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_10000B3F8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10000C230(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000B424@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000B224(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL sub_10000B44C(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000B45C(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000B480(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_10000B4C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000B4D8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000B51C()
{
}

Swift::Int sub_10000B544(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000B584()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  sub_10000B114(v0, qword_10001B0F0);
  sub_10000851C(v0, (uint64_t)qword_10001B0F0);
  return LocalizedStringResource.init(stringLiteral:)(0x666E4920776F6853LL, 0xED0000626154206FLL);
}

uint64_t sub_10000B5EC()
{
  if (qword_10001AAC0 != -1) {
    swift_once(&qword_10001AAC0, sub_10000B584);
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  return sub_10000851C(v0, (uint64_t)qword_10001B0F0);
}

uint64_t sub_10000B634@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001AAC0 != -1) {
    swift_once(&qword_10001AAC0, sub_10000B584);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0F0);
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_10000B6CC(uint64_t a1)
{
  if (qword_10001AAC0 != -1) {
    swift_once(&qword_10001AAC0, sub_10000B584);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0F0);
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_10000B77C(uint64_t a1))(void)
{
  if (qword_10001AAC0 != -1) {
    swift_once(&qword_10001AAC0, sub_10000B584);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000851C(v2, (uint64_t)qword_10001B0F0);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return j__swift_endAccess;
}

uint64_t sub_10000B7F4()
{
  return v1;
}

uint64_t sub_10000B824(uint64_t a1, uint64_t a2)
{
  v3[0] = a1;
  v3[1] = a2;
  return IntentParameter.wrappedValue.setter(v3);
}

void (*sub_10000B854(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100009CA8;
}

uint64_t sub_10000B8A0(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000B900, 0LL, 0LL);
}

uint64_t sub_10000B900()
{
  v1._countAndFlagsBits = v0[2];
  uint64_t v2 = (void *)v0[3];
  v1._object = v2;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000152F0, v1);
  swift_bridgeObjectRelease(v2);
  uint64_t v5 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[7];
  uint64_t v7 = sub_1000084F8();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  char v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    if (v3 >= 3) {
      char v11 = 2;
    }
    else {
      char v11 = v3;
    }
    size_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v13;
    *(_DWORD *)size_t v12 = 136315138;
    uint64_t v14 = v11;
    unint64_t v15 = qword_1000122D0[v14];
    uint64_t v16 = v0[8];
    uint64_t v25 = v0[9];
    uint64_t v17 = v0[7];
    v0[4] = sub_10000A2B8(*(void *)&aPerson_1[v14 * 8], v15, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 4, v0 + 5, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "ShowInfoTab intent: triggered with query: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v25, v17);
  }

  else
  {
    uint64_t v19 = v0[8];
    uint64_t v18 = v0[9];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }

  uint64_t v21 = type metadata accessor for MainActor(0LL);
  v0[10] = static MainActor.shared.getter();
  uint64_t v22 = dispatch thunk of Actor.unownedExecutor.getter(v21, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000BB20, v22, v23);
}

uint64_t sub_10000BB20()
{
  *(void *)(v0 + 8_Block_object_dispose(va, 8) = 0LL;
  return swift_task_switch(sub_10000BB80, 0LL, 0LL);
}

uint64_t sub_10000BB80()
{
  uint64_t v1 = *(void *)(v0 + 72);
  static IntentResult.result<>()();
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BBC0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000BBF4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v33 - v6;
  __chkstk_darwin(v5);
  char v9 = (char *)&v33 - v8;
  os_log_type_t v10 = (void *)objc_opt_self(&OBJC_CLASS___VUITVOSPlaybackManager);
  id v11 = [v10 sharedInstance];
  unsigned int v12 = [v11 isFullscreenPlaybackUIBeingShown];

  if (!v12)
  {
    uint64_t v21 = sub_1000084F8();
    uint64_t v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v21, v0);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    uint64_t v25 = v1;
    if (!os_log_type_enabled(v23, v24))
    {
      char v27 = 0;
      uint64_t v7 = v4;
      goto LABEL_14;
    }

    uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "ShowInfoTab intent: no full screen playback occurring",  v26,  2u);
    char v27 = 0;
    uint64_t v7 = v4;
LABEL_11:
    swift_slowDealloc(v26, -1LL, -1LL);
LABEL_14:

    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v0);
    unint64_t v31 = sub_10000C5D4();
    swift_allocError(&type metadata for TVAppShowInfoTab.TVAppShowInfoTabError, v31, 0LL, 0LL);
    *uint64_t v32 = v27;
    swift_willThrow();
    return;
  }

  if ((TVAppFeature.isEnabled.getter(11LL) & 1) == 0
    || (id v13 = [v10 sharedInstance],
        unsigned int v14 = [v13 hasTimedMetadataForCurrentMediaItem],
        v13,
        !v14))
  {
    uint64_t v28 = sub_1000084F8();
    uint64_t v25 = v1;
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v7, v28, v0);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v23, v30))
    {
      char v27 = 1;
      goto LABEL_14;
    }

    uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  v30,  "ShowInfoTab intent: the content doesn't have timed metadata",  v26,  2u);
    char v27 = 1;
    goto LABEL_11;
  }

  uint64_t v15 = sub_1000084F8();
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v9, v15, v0);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "ShowInfoTab intent: presenting the InSights tab", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
  id v20 = [v10 sharedInstance];
  [v20 presentPlayerTabWithIdentifier:VUIPlaybackTabManagerTimedMetadataTabId];
}

uint64_t sub_10000BF60()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100008C94(&qword_10001A1E8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100008C94(&qword_10001A2D8);
  __chkstk_darwin(v7);
  char v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100008C94(&qword_10001A1F0);
  __chkstk_darwin(v10);
  unsigned int v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008C94(&qword_10001A2E0);
  LocalizedStringResource.init(stringLiteral:)(0x7079547972657551LL, 0xE900000000000065LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1LL, 1LL, v13);
  uint64_t v17 = type metadata accessor for String.IntentInputOptions(0LL);
  v20[0] = 0LL;
  v20[1] = 0LL;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v9, 1LL, 1LL, v17);
  uint64_t v18 = type metadata accessor for IntentDialog(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v6, 1LL, 1LL, v18);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for InputConnectionBehavior.default(_:),  v0);
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)( v16,  v12,  v20,  v9,  v6,  v3);
}

uint64_t sub_10000C18C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc(dword_10001A2EC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000096C0;
  return sub_10000B8A0(a1, v4);
}

uint64_t sub_10000C1E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000BF60();
  *a1 = result;
  return result;
}

uint64_t sub_10000C208(uint64_t a1)
{
  unint64_t v2 = sub_10000C3E8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000C230(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000152F0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_10000C27C()
{
  unint64_t result = qword_10001A2F0;
  if (!qword_10001A2F0)
  {
    unint64_t result = swift_getWitnessTable("M4", &type metadata for TVAppShowInfoTab.QueryType);
    atomic_store(result, (unint64_t *)&qword_10001A2F0);
  }

  return result;
}

unint64_t sub_10000C2C4()
{
  unint64_t result = qword_10001A2F8;
  if (!qword_10001A2F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000120F4, &type metadata for TVAppShowInfoTab.TVAppShowInfoTabError);
    atomic_store(result, (unint64_t *)&qword_10001A2F8);
  }

  return result;
}

unint64_t sub_10000C30C()
{
  unint64_t result = qword_10001A300;
  if (!qword_10001A300)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001222C, &type metadata for TVAppShowInfoTab);
    atomic_store(result, (unint64_t *)&qword_10001A300);
  }

  return result;
}

unint64_t sub_10000C354()
{
  unint64_t result = qword_10001A308;
  if (!qword_10001A308)
  {
    unint64_t result = swift_getWitnessTable(&unk_100012254, &type metadata for TVAppShowInfoTab);
    atomic_store(result, (unint64_t *)&qword_10001A308);
  }

  return result;
}

uint64_t sub_10000C398(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013688, 1LL);
}

uint64_t sub_10000C3A8(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_10000C3E8();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>,  1LL);
}

unint64_t sub_10000C3E8()
{
  unint64_t result = qword_10001A310;
  if (!qword_10001A310)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001219C, &type metadata for TVAppShowInfoTab);
    atomic_store(result, (unint64_t *)&qword_10001A310);
  }

  return result;
}

ValueMetadata *type metadata accessor for TVAppShowInfoTab()
{
  return &type metadata for TVAppShowInfoTab;
}

_BYTE *initializeBufferWithCopyOfBuffer for TVAppShowInfoTab.QueryType(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TVAppShowInfoTab.QueryType()
{
  return &type metadata for TVAppShowInfoTab.QueryType;
}

uint64_t _s7AppleTV16TVAppShowInfoTabV9QueryTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s7AppleTV16TVAppShowInfoTabV9QueryTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10000C540 + 4 * byte_100012045[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000C574 + 4 * byte_100012040[v4]))();
}

uint64_t sub_10000C574(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C57C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000C584LL);
  }
  return result;
}

uint64_t sub_10000C590(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000C598LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10000C59C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C5A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C5B0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000C5B8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TVAppShowInfoTab.TVAppShowInfoTabError()
{
  return &type metadata for TVAppShowInfoTab.TVAppShowInfoTabError;
}

unint64_t sub_10000C5D4()
{
  unint64_t result = qword_10001A320;
  if (!qword_10001A320)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001215C, &type metadata for TVAppShowInfoTab.TVAppShowInfoTabError);
    atomic_store(result, (unint64_t *)&qword_10001A320);
  }

  return result;
}

uint64_t sub_10000C620()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

id sub_10000C630()
{
  uint64_t v0 = type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id result = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  qword_10001AF58 = (uint64_t)result;
  return result;
}

uint64_t sub_10000C680(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B108, 0x6C6E776F642E6B34LL, 0xEC0000007364616FLL);
}

uint64_t sub_10000C6A8()
{
  return sub_10000C720(&qword_10001AF60, (uint64_t)qword_10001B108, (uint64_t)sub_10000C680);
}

uint64_t sub_10000C6C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF60, (uint64_t)qword_10001B108, (uint64_t)sub_10000C680, a1);
}

uint64_t sub_10000C6E0(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B120, 0xD00000000000001BLL, 0x8000000100012E90LL);
}

uint64_t sub_10000C704()
{
  return sub_10000C720(&qword_10001AF68, (uint64_t)qword_10001B120, (uint64_t)sub_10000C6E0);
}

uint64_t sub_10000C720(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v4 = type metadata accessor for ImageResource(0LL);
  return sub_10000851C(v4, a2);
}

uint64_t sub_10000C760@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF68, (uint64_t)qword_10001B120, (uint64_t)sub_10000C6E0, a1);
}

uint64_t sub_10000C77C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = type metadata accessor for ImageResource(0LL);
  uint64_t v7 = sub_10000851C(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t sub_10000C7E4(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B138, 0xD000000000000015LL, 0x8000000100012E70LL);
}

uint64_t sub_10000C808()
{
  return sub_10000C720(&qword_10001AF70, (uint64_t)qword_10001B138, (uint64_t)sub_10000C7E4);
}

uint64_t sub_10000C824@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF70, (uint64_t)qword_10001B138, (uint64_t)sub_10000C7E4, a1);
}

uint64_t sub_10000C840(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B150, 0x77656976657250LL, 0xE700000000000000LL);
}

uint64_t sub_10000C860()
{
  return sub_10000C720(&qword_10001AF78, (uint64_t)qword_10001B150, (uint64_t)sub_10000C840);
}

uint64_t sub_10000C87C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF78, (uint64_t)qword_10001B150, (uint64_t)sub_10000C840, a1);
}

uint64_t sub_10000C898(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B168, 0xD000000000000014LL, 0x8000000100012E50LL);
}

uint64_t sub_10000C8BC()
{
  return sub_10000C720(&qword_10001AF80, (uint64_t)qword_10001B168, (uint64_t)sub_10000C898);
}

uint64_t sub_10000C8D8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF80, (uint64_t)qword_10001B168, (uint64_t)sub_10000C898, a1);
}

uint64_t sub_10000C8F4(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B180, 0x666C656853706F54LL, 0xED00006567616D49LL);
}

uint64_t sub_10000C920()
{
  return sub_10000C720(&qword_10001AF88, (uint64_t)qword_10001B180, (uint64_t)sub_10000C8F4);
}

uint64_t sub_10000C93C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF88, (uint64_t)qword_10001B180, (uint64_t)sub_10000C8F4, a1);
}

uint64_t sub_10000C958(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B198, 0x65726E65672E7674LL, 0xEF6E6F697463612ELL);
}

uint64_t sub_10000C984()
{
  return sub_10000C720(&qword_10001AF90, (uint64_t)qword_10001B198, (uint64_t)sub_10000C958);
}

uint64_t sub_10000C9A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF90, (uint64_t)qword_10001B198, (uint64_t)sub_10000C958, a1);
}

uint64_t sub_10000C9BC(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B1B0, 0xD000000000000012LL, 0x8000000100012E30LL);
}

uint64_t sub_10000C9E0()
{
  return sub_10000C720(&qword_10001AF98, (uint64_t)qword_10001B1B0, (uint64_t)sub_10000C9BC);
}

uint64_t sub_10000C9FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AF98, (uint64_t)qword_10001B1B0, (uint64_t)sub_10000C9BC, a1);
}

uint64_t sub_10000CA18(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B1C8, 0xD000000000000012LL, 0x8000000100012E10LL);
}

uint64_t sub_10000CA3C()
{
  return sub_10000C720(&qword_10001AFA0, (uint64_t)qword_10001B1C8, (uint64_t)sub_10000CA18);
}

uint64_t sub_10000CA58@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFA0, (uint64_t)qword_10001B1C8, (uint64_t)sub_10000CA18, a1);
}

uint64_t sub_10000CA74(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B1E0, 0x65726E65672E7674LL, 0xEE00656D696E612ELL);
}

uint64_t sub_10000CAA0()
{
  return sub_10000C720(&qword_10001AFA8, (uint64_t)qword_10001B1E0, (uint64_t)sub_10000CA74);
}

uint64_t sub_10000CABC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFA8, (uint64_t)qword_10001B1E0, (uint64_t)sub_10000CA74, a1);
}

uint64_t sub_10000CAD8(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B1F8, 0xD000000000000015LL, 0x8000000100012DF0LL);
}

uint64_t sub_10000CAFC()
{
  return sub_10000C720(&qword_10001AFB0, (uint64_t)qword_10001B1F8, (uint64_t)sub_10000CAD8);
}

uint64_t sub_10000CB18@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFB0, (uint64_t)qword_10001B1F8, (uint64_t)sub_10000CAD8, a1);
}

uint64_t sub_10000CB34(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B210, 0xD000000000000012LL, 0x8000000100012DD0LL);
}

uint64_t sub_10000CB58()
{
  return sub_10000C720(&qword_10001AFB8, (uint64_t)qword_10001B210, (uint64_t)sub_10000CB34);
}

uint64_t sub_10000CB74@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFB8, (uint64_t)qword_10001B210, (uint64_t)sub_10000CB34, a1);
}

uint64_t sub_10000CB90(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B228, 0xD000000000000012LL, 0x8000000100012DB0LL);
}

uint64_t sub_10000CBB4()
{
  return sub_10000C720(&qword_10001AFC0, (uint64_t)qword_10001B228, (uint64_t)sub_10000CB90);
}

uint64_t sub_10000CBD0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFC0, (uint64_t)qword_10001B228, (uint64_t)sub_10000CB90, a1);
}

uint64_t sub_10000CBEC(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B240, 0xD000000000000011LL, 0x8000000100012D90LL);
}

uint64_t sub_10000CC10()
{
  return sub_10000C720(&qword_10001AFC8, (uint64_t)qword_10001B240, (uint64_t)sub_10000CBEC);
}

uint64_t sub_10000CC2C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFC8, (uint64_t)qword_10001B240, (uint64_t)sub_10000CBEC, a1);
}

uint64_t sub_10000CC48(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B258, 0x65726E65672E7674LL, 0xEF7964656D6F632ELL);
}

uint64_t sub_10000CC74()
{
  return sub_10000C720(&qword_10001AFD0, (uint64_t)qword_10001B258, (uint64_t)sub_10000CC48);
}

uint64_t sub_10000CC90@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFD0, (uint64_t)qword_10001B258, (uint64_t)sub_10000CC48, a1);
}

uint64_t sub_10000CCAC(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B270, 0xD000000000000014LL, 0x8000000100012D70LL);
}

uint64_t sub_10000CCD0()
{
  return sub_10000C720(&qword_10001AFD8, (uint64_t)qword_10001B270, (uint64_t)sub_10000CCAC);
}

uint64_t sub_10000CCEC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFD8, (uint64_t)qword_10001B270, (uint64_t)sub_10000CCAC, a1);
}

uint64_t sub_10000CD08(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B288, 0x65726E65672E7674LL, 0xEE00616D6172642ELL);
}

uint64_t sub_10000CD34()
{
  return sub_10000C720(&qword_10001AFE0, (uint64_t)qword_10001B288, (uint64_t)sub_10000CD08);
}

uint64_t sub_10000CD50@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFE0, (uint64_t)qword_10001B288, (uint64_t)sub_10000CD08, a1);
}

uint64_t sub_10000CD6C(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B2A0, 0xD000000000000010LL, 0x8000000100012D50LL);
}

uint64_t sub_10000CD90()
{
  return sub_10000C720(&qword_10001AFE8, (uint64_t)qword_10001B2A0, (uint64_t)sub_10000CD6C);
}

uint64_t sub_10000CDAC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFE8, (uint64_t)qword_10001B2A0, (uint64_t)sub_10000CD6C, a1);
}

uint64_t sub_10000CDC8(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B2B8, 0xD000000000000010LL, 0x8000000100012D30LL);
}

uint64_t sub_10000CDEC()
{
  return sub_10000C720(&qword_10001AFF0, (uint64_t)qword_10001B2B8, (uint64_t)sub_10000CDC8);
}

uint64_t sub_10000CE08@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFF0, (uint64_t)qword_10001B2B8, (uint64_t)sub_10000CDC8, a1);
}

uint64_t sub_10000CE24(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B2D0, 0xD000000000000010LL, 0x8000000100012D10LL);
}

uint64_t sub_10000CE48()
{
  return sub_10000C720(&qword_10001AFF8, (uint64_t)qword_10001B2D0, (uint64_t)sub_10000CE24);
}

uint64_t sub_10000CE64@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001AFF8, (uint64_t)qword_10001B2D0, (uint64_t)sub_10000CE24, a1);
}

uint64_t sub_10000CE80(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B2E8, 0xD000000000000010LL, 0x8000000100012CF0LL);
}

uint64_t sub_10000CEA4()
{
  return sub_10000C720(&qword_10001B000, (uint64_t)qword_10001B2E8, (uint64_t)sub_10000CE80);
}

uint64_t sub_10000CEC0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B000, (uint64_t)qword_10001B2E8, (uint64_t)sub_10000CE80, a1);
}

uint64_t sub_10000CEDC(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B300, 0x65726E65672E7674LL, 0xEF726F72726F682ELL);
}

uint64_t sub_10000CF08()
{
  return sub_10000C720(&qword_10001B008, (uint64_t)qword_10001B300, (uint64_t)sub_10000CEDC);
}

uint64_t sub_10000CF24@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B008, (uint64_t)qword_10001B300, (uint64_t)sub_10000CEDC, a1);
}

uint64_t sub_10000CF40(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B318, 0xD000000000000014LL, 0x8000000100012CD0LL);
}

uint64_t sub_10000CF64()
{
  return sub_10000C720(&qword_10001B010, (uint64_t)qword_10001B318, (uint64_t)sub_10000CF40);
}

uint64_t sub_10000CF80@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B010, (uint64_t)qword_10001B318, (uint64_t)sub_10000CF40, a1);
}

uint64_t sub_10000CF9C(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B330, 0xD000000000000016LL, 0x8000000100012CB0LL);
}

uint64_t sub_10000CFC0()
{
  return sub_10000C720(&qword_10001B018, (uint64_t)qword_10001B330, (uint64_t)sub_10000CF9C);
}

uint64_t sub_10000CFDC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B018, (uint64_t)qword_10001B330, (uint64_t)sub_10000CF9C, a1);
}

uint64_t sub_10000CFF8(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B348, 0xD000000000000018LL, 0x8000000100012C90LL);
}

uint64_t sub_10000D01C()
{
  return sub_10000C720(&qword_10001B020, (uint64_t)qword_10001B348, (uint64_t)sub_10000CFF8);
}

uint64_t sub_10000D038@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B020, (uint64_t)qword_10001B348, (uint64_t)sub_10000CFF8, a1);
}

uint64_t sub_10000D054(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B360, 0xD000000000000018LL, 0x8000000100012C70LL);
}

uint64_t sub_10000D078()
{
  return sub_10000C720(&qword_10001B028, (uint64_t)qword_10001B360, (uint64_t)sub_10000D054);
}

uint64_t sub_10000D094@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B028, (uint64_t)qword_10001B360, (uint64_t)sub_10000D054, a1);
}

uint64_t sub_10000D0B0(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B378, 0xD000000000000011LL, 0x8000000100012C50LL);
}

uint64_t sub_10000D0D4()
{
  return sub_10000C720(&qword_10001B030, (uint64_t)qword_10001B378, (uint64_t)sub_10000D0B0);
}

uint64_t sub_10000D0F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B030, (uint64_t)qword_10001B378, (uint64_t)sub_10000D0B0, a1);
}

uint64_t sub_10000D10C(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B390, 0x65726E65672E7674LL, 0xEE00636973756D2ELL);
}

uint64_t sub_10000D138()
{
  return sub_10000C720(&qword_10001B038, (uint64_t)qword_10001B390, (uint64_t)sub_10000D10C);
}

uint64_t sub_10000D154@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B038, (uint64_t)qword_10001B390, (uint64_t)sub_10000D10C, a1);
}

uint64_t sub_10000D170(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B3A8, 0xD000000000000010LL, 0x8000000100012C30LL);
}

uint64_t sub_10000D194()
{
  return sub_10000C720(&qword_10001B040, (uint64_t)qword_10001B3A8, (uint64_t)sub_10000D170);
}

uint64_t sub_10000D1B0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B040, (uint64_t)qword_10001B3A8, (uint64_t)sub_10000D170, a1);
}

uint64_t sub_10000D1CC(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B3C0, 0xD000000000000010LL, 0x8000000100012C10LL);
}

uint64_t sub_10000D1F0()
{
  return sub_10000C720(&qword_10001B048, (uint64_t)qword_10001B3C0, (uint64_t)sub_10000D1CC);
}

uint64_t sub_10000D20C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B048, (uint64_t)qword_10001B3C0, (uint64_t)sub_10000D1CC, a1);
}

uint64_t sub_10000D228(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B3D8, 0xD000000000000010LL, 0x8000000100012BF0LL);
}

uint64_t sub_10000D24C()
{
  return sub_10000C720(&qword_10001B050, (uint64_t)qword_10001B3D8, (uint64_t)sub_10000D228);
}

uint64_t sub_10000D268@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B050, (uint64_t)qword_10001B3D8, (uint64_t)sub_10000D228, a1);
}

uint64_t sub_10000D284(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B3F0, 0xD000000000000010LL, 0x8000000100012BD0LL);
}

uint64_t sub_10000D2A8()
{
  return sub_10000C720(&qword_10001B058, (uint64_t)qword_10001B3F0, (uint64_t)sub_10000D284);
}

uint64_t sub_10000D2C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B058, (uint64_t)qword_10001B3F0, (uint64_t)sub_10000D284, a1);
}

uint64_t sub_10000D2E0(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B408, 0xD000000000000018LL, 0x8000000100012BB0LL);
}

uint64_t sub_10000D304()
{
  return sub_10000C720(&qword_10001B060, (uint64_t)qword_10001B408, (uint64_t)sub_10000D2E0);
}

uint64_t sub_10000D320@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B060, (uint64_t)qword_10001B408, (uint64_t)sub_10000D2E0, a1);
}

uint64_t sub_10000D33C(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B420, 0xD000000000000010LL, 0x8000000100012B90LL);
}

uint64_t sub_10000D360()
{
  return sub_10000C720(&qword_10001B068, (uint64_t)qword_10001B420, (uint64_t)sub_10000D33C);
}

uint64_t sub_10000D37C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B068, (uint64_t)qword_10001B420, (uint64_t)sub_10000D33C, a1);
}

uint64_t sub_10000D398(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B438, 0xD000000000000010LL, 0x8000000100012B70LL);
}

uint64_t sub_10000D3BC()
{
  return sub_10000C720(&qword_10001B070, (uint64_t)qword_10001B438, (uint64_t)sub_10000D398);
}

uint64_t sub_10000D3D8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B070, (uint64_t)qword_10001B438, (uint64_t)sub_10000D398, a1);
}

uint64_t sub_10000D3F4(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B450, 0x65726E65672E7674LL, 0xEF69662D6963732ELL);
}

uint64_t sub_10000D420()
{
  return sub_10000C720(&qword_10001B078, (uint64_t)qword_10001B450, (uint64_t)sub_10000D3F4);
}

uint64_t sub_10000D43C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B078, (uint64_t)qword_10001B450, (uint64_t)sub_10000D3F4, a1);
}

uint64_t sub_10000D458(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B468, 0xD000000000000014LL, 0x8000000100012B50LL);
}

uint64_t sub_10000D47C()
{
  return sub_10000C720(&qword_10001B080, (uint64_t)qword_10001B468, (uint64_t)sub_10000D458);
}

uint64_t sub_10000D498@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B080, (uint64_t)qword_10001B468, (uint64_t)sub_10000D458, a1);
}

uint64_t sub_10000D4B4(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B480, 0x65726E65672E7674LL, 0xEF7374726F70732ELL);
}

uint64_t sub_10000D4E0()
{
  return sub_10000C720(&qword_10001B088, (uint64_t)qword_10001B480, (uint64_t)sub_10000D4B4);
}

uint64_t sub_10000D4FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B088, (uint64_t)qword_10001B480, (uint64_t)sub_10000D4B4, a1);
}

uint64_t sub_10000D518(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B498, 0xD000000000000011LL, 0x8000000100012B30LL);
}

uint64_t sub_10000D53C()
{
  return sub_10000C720(&qword_10001B090, (uint64_t)qword_10001B498, (uint64_t)sub_10000D518);
}

uint64_t sub_10000D558@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B090, (uint64_t)qword_10001B498, (uint64_t)sub_10000D518, a1);
}

uint64_t sub_10000D574(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B4B0, 0xD000000000000012LL, 0x8000000100012B10LL);
}

uint64_t sub_10000D598()
{
  return sub_10000C720(&qword_10001B098, (uint64_t)qword_10001B4B0, (uint64_t)sub_10000D574);
}

uint64_t sub_10000D5B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B098, (uint64_t)qword_10001B4B0, (uint64_t)sub_10000D574, a1);
}

uint64_t sub_10000D5D0(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B4C8, 0x65726E65672E7674LL, 0xEF6C65766172742ELL);
}

uint64_t sub_10000D5FC()
{
  return sub_10000C720(&qword_10001B0A0, (uint64_t)qword_10001B4C8, (uint64_t)sub_10000D5D0);
}

uint64_t sub_10000D618@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B0A0, (uint64_t)qword_10001B4C8, (uint64_t)sub_10000D5D0, a1);
}

uint64_t sub_10000D634(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B4E0, 0xD000000000000010LL, 0x8000000100012AF0LL);
}

uint64_t sub_10000D658()
{
  return sub_10000C720(&qword_10001B0A8, (uint64_t)qword_10001B4E0, (uint64_t)sub_10000D634);
}

uint64_t sub_10000D674@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B0A8, (uint64_t)qword_10001B4E0, (uint64_t)sub_10000D634, a1);
}

uint64_t sub_10000D690(uint64_t a1)
{
  return sub_10000D6B4(a1, qword_10001B4F8, 0xD000000000000010LL, 0x8000000100012AD0LL);
}

uint64_t sub_10000D6B4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource(0LL);
  sub_10000B114(v7, a2);
  sub_10000851C(v7, (uint64_t)a2);
  if (qword_10001AF50 != -1) {
    swift_once(&qword_10001AF50, sub_10000C630);
  }
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_10001AF58);
}

uint64_t sub_10000D74C()
{
  return sub_10000C720(&qword_10001B0B0, (uint64_t)qword_10001B4F8, (uint64_t)sub_10000D690);
}

uint64_t sub_10000D768@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C77C(&qword_10001B0B0, (uint64_t)qword_10001B4F8, (uint64_t)sub_10000D690, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC7AppleTVP33_7CA9A91CE23DBC2939975EE0CF80278219ResourceBundleClass);
}

ValueMetadata *_s7AppIconOMa()
{
  return &_s7AppIconON;
}

ValueMetadata *_s7AppIconO10BackgroundOMa()
{
  return &_s7AppIconO10BackgroundON;
}

ValueMetadata *_s7AppIconO4LogoOMa()
{
  return &_s7AppIconO4LogoON;
}

void sub_10000D7D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D838( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D89C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D904()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "RPTTestRunner");
  sub_10000D928(v0);
}

void sub_10000D928()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "RPTScrollViewTestParameters");
  static AppIntent.openAppWhenRun.getter(v0);
}

id objc_msgSend__blockExecutionInTabBarController_documentRef_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blockExecutionInTabBarController:documentRef:totalChildren:");
}

id objc_msgSend__canHandleTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandleTest:");
}

id objc_msgSend__contentScrollsAlongXAxis(void *a1, const char *a2, ...)
{
  return _[a1 _contentScrollsAlongXAxis];
}

id objc_msgSend__findCollectionViewInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findCollectionViewInView:");
}

id objc_msgSend__findLabelInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelInView:");
}

id objc_msgSend__findLabelWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelWithTitle:inView:");
}

id objc_msgSend__findScrollViewInViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findScrollViewInViewController:");
}

id objc_msgSend__findShelfViewControllerInViewController_withShelfRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withShelfRow:");
}

id objc_msgSend__findShelfViewControllerInViewController_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withTitle:");
}

id objc_msgSend__findTVButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTVButtonWithTitle:inView:");
}

id objc_msgSend__findUIButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUIButtonWithTitle:inView:");
}

id objc_msgSend__findVUIRoundButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findVUIRoundButtonWithTitle:inView:");
}

id objc_msgSend__findViewOfType_inView_withFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findViewOfType:inView:withFilter:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__registerTests(void *a1, const char *a2, ...)
{
  return _[a1 _registerTests];
}

id objc_msgSend__scrollHalfTheScreenHeightIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollHalfTheScreenHeightIn:");
}

id objc_msgSend__selectButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectButtonWithTitle:inView:");
}

id objc_msgSend__setContentScrollsAlongXAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentScrollsAlongXAxis:");
}

id objc_msgSend__topViewControllerInTabBarController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topViewControllerInTabBarController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_applicationDidFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidFinishLaunchingWithOptions:");
}

id objc_msgSend_applicationLoadCompletion(void *a1, const char *a2, ...)
{
  return _[a1 applicationLoadCompletion];
}

id objc_msgSend_applicationWillFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWillFinishLaunchingWithOptions:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_canHandleTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canHandleTest:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return _[a1 cleanUp];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delay:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_evaluateCommands_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateCommands:completion:");
}

id objc_msgSend_fetchDeviceIsAsleepWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceIsAsleepWithResult:");
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:");
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_numScrollViewsToSkip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:");
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:extraResults:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_focusAction_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "focusAction:direction:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_openURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:");
}

id objc_msgSend_performScrollViewTest_testOptions_scrollAxis_tabBarController_scrollViewBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_preWarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preWarm:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resetNumScrollViewFound(void *a1, const char *a2, ...)
{
  return _[a1 resetNumScrollViewFound];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_runTest_app_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTest:app:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_selectTabWithTitle_inTabBarController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectTabWithTitle:inTabBarController:");
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_setApplicationLoadCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationLoadCompletion:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setMainWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainWindow:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndex:");
}

id objc_msgSend_setSelectedIndexForIdentifier_withDeeplinkURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndexForIdentifier:withDeeplinkURL:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return _[a1 splitViewController];
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_systemServiceProxy(void *a1, const char *a2, ...)
{
  return _[a1 systemServiceProxy];
}

id objc_msgSend_tabBarController_didSelectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarController:didSelectViewController:");
}

id objc_msgSend_tabBarItems(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItems];
}

id objc_msgSend_templateViewController(void *a1, const char *a2, ...)
{
  return _[a1 templateViewController];
}

id objc_msgSend_testLog(void *a1, const char *a2, ...)
{
  return _[a1 testLog];
}

id objc_msgSend_testOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 testOperationQueue];
}

id objc_msgSend_testsManifest(void *a1, const char *a2, ...)
{
  return _[a1 testsManifest];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textLabels(void *a1, const char *a2, ...)
{
  return _[a1 textLabels];
}

id objc_msgSend_topMostController(void *a1, const char *a2, ...)
{
  return _[a1 topMostController];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_vui_ppt_isLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vui_ppt_isLoading");
}

id objc_msgSend_vui_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vui_stringForKey:");
}

id objc_msgSend_waitForTabWithTitleToLoad_inTabBarController_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}