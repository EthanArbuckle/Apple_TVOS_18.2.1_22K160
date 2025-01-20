@interface TVMusicPerformanceTests
+ (BOOL)_testPageName:(id)a3;
+ (BOOL)testLibrary;
+ (BOOL)testPlayback;
+ (BOOL)testShowAlbumWithAdamID:(id)a3;
+ (BOOL)testShowArtistWithAdamID:(id)a3;
+ (BOOL)testShowBrowse;
+ (BOOL)testShowBrowseVerticalScroll;
+ (BOOL)testShowListenNow;
+ (BOOL)testShowListenNowVerticalScroll;
+ (BOOL)testShowPlaylistWithGlobalID:(id)a3;
+ (BOOL)testShowRadio;
+ (BOOL)testShowVideos;
+ (id)_tabNameForPageName:(id)a3;
+ (void)_completeTest:(id)a3 afterNotification:(id)a4;
+ (void)_performAfterNotification:(id)a3 block:(id)a4;
+ (void)_performAfterPageLoaded:(id)a3 block:(id)a4;
+ (void)_scrollContentAndCompleteTest:(id)a3;
+ (void)_scrollContentVerticallyOnlyAndCompleteTest:(id)a3;
+ (void)_selectTab:(id)a3 block:(id)a4;
@end

@implementation TVMusicPerformanceTests

+ (BOOL)testShowListenNow
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000AB138;
  v3[3] = &unk_100269BE8;
  v3[4] = a1;
  [a1 _performAfterPageLoaded:@"listen_now" block:v3];
  return 1;
}

+ (BOOL)testShowListenNowVerticalScroll
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000AB1E8;
  v3[3] = &unk_100269BE8;
  v3[4] = a1;
  [a1 _performAfterPageLoaded:@"listen_now" block:v3];
  return 1;
}

+ (BOOL)testShowBrowse
{
  return _[a1 _testPageName:@"browse"];
}

+ (BOOL)testShowBrowseVerticalScroll
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _tabNameForPageName:@"browse"]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AB2C8;
  v5[3] = &unk_10026B898;
  v5[4] = a1;
  [a1 _selectTab:v3 block:v5];

  return 1;
}

+ (BOOL)testShowVideos
{
  return _[a1 _testPageName:@"videos"];
}

+ (BOOL)testShowRadio
{
  return _[a1 _testPageName:@"radio"];
}

+ (BOOL)testLibrary
{
  return 1;
}

+ (BOOL)testShowAlbumWithAdamID:(id)a3
{
  id v4 = [a3 longLongValue];
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 startedTest:@"album"];

    [a1 _completeTest:@"album" afterNotification:@"TVMusicPerformanceTestCellFocused"];
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForAlbumWithStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForAlbumWithStoreID:subscriptionID:",  v4,  v4));
      v7 = -[MPModelAlbum initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelAlbum),  "initWithIdentifiers:block:",  v6,  &stru_10026D490);
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
      [v8 showCatalogPageForAlbum:v7];

      dispatch_time_t v9 = dispatch_time(0LL, 2000000000LL);
      dispatch_after(v9, &_dispatch_main_q, &stru_10026D4B0);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v4));
      id v11 = sub_100092C74(v10, 0LL);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v7 = (MPModelAlbum *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
      -[MPModelAlbum openJavascriptAppWithURL:](v7, "openJavascriptAppWithURL:", v6);
    }
  }

  return v4 != 0LL;
}

+ (BOOL)testShowPlaylistWithGlobalID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v6 startedTest:@"playlist"];

    [a1 _completeTest:@"playlist" afterNotification:@"TVMusicPerformanceTestCellFocused"];
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v5));
      v8 = -[MPModelPlaylist initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelPlaylist),  "initWithIdentifiers:block:",  v7,  &stru_10026D4D0);
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
      [v9 showCatalogPageForPlaylist:v8];

      dispatch_time_t v10 = dispatch_time(0LL, 2000000000LL);
      dispatch_after(v10, &_dispatch_main_q, &stru_10026D4F0);
    }

    else
    {
      id v12 = sub_100092F4C(v5, 0LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v8 = (MPModelPlaylist *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
      -[MPModelPlaylist openJavascriptAppWithURL:](v8, "openJavascriptAppWithURL:", v7);
    }

    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)testShowArtistWithAdamID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 longLongValue];
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v6 startedTest:@"artist"];

    [a1 _completeTest:@"artist" afterNotification:@"TVMusicPerformanceTestArtistPageDisplayedNotification"];
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtistKind identityKind](&OBJC_CLASS___MPModelArtistKind, "identityKind"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v7,  [v4 longLongValue],  0));

      dispatch_time_t v9 = objc_alloc(&OBJC_CLASS___MPModelArtist);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000ABC98;
      v17[3] = &unk_10026C588;
      id v18 = v4;
      dispatch_time_t v10 = -[MPModelArtist initWithIdentifiers:block:](v9, "initWithIdentifiers:block:", v8, v17);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
      [v11 showPageForArtist:v10];

      dispatch_time_t v12 = dispatch_time(0LL, 2500000000LL);
      dispatch_after(v12, &_dispatch_main_q, &stru_10026D510);

      v13 = v18;
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v4 longLongValue]));
      id v15 = sub_100092E80(v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v15);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
      [v13 openJavascriptAppWithURL:v8];
    }
  }

  return v5 != 0LL;
}

+ (BOOL)testPlayback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _tabNameForPageName:@"listen_now"]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000ABDC4;
  v5[3] = &unk_10026B898;
  v5[4] = a1;
  [a1 _selectTab:v3 block:v5];

  return 1;
}

+ (void)_selectTab:(id)a3 block:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TVMusic://showtab/%@",  a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v7 openURL:v8 options:&__NSDictionary0__struct completionHandler:v5];
}

+ (BOOL)_testPageName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _tabNameForPageName:v4]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AC260;
  v8[3] = &unk_10026B830;
  id v9 = v4;
  id v10 = a1;
  id v6 = v4;
  [a1 _selectTab:v5 block:v8];

  return 1;
}

+ (void)_performAfterPageLoaded:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _tabNameForPageName:v6]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PageStateNotifier shared](&OBJC_CLASS____TtC7TVMusic17PageStateNotifier, "shared"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000AC570;
    v29[3] = &unk_100268D60;
    v30 = v7;
    [v9 onPageLoadedForTab:v8 handler:v29];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVMusicInterfaceFactory,  "sharedInterfaceFactory"));
    unsigned int v11 = [v10 isPageLoaded:v6];

    if (v11)
    {
      v7[2](v7);
    }

    else
    {
      dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      objc_initWeak(&location, v12);

      uint64_t v22 = 0LL;
      v23 = &v22;
      uint64_t v24 = 0x3032000000LL;
      v25 = sub_1000AC57C;
      v26 = sub_1000AC58C;
      id v27 = 0LL;
      id v13 = objc_loadWeakRetained(&location);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000AC594;
      v17[3] = &unk_10026D5B8;
      id v18 = v6;
      v19 = v7;
      objc_copyWeak(&v21, &location);
      v20 = &v22;
      uint64_t v15 = objc_claimAutoreleasedReturnValue( [v13 addObserverForName:@"TVMusicPerformanceTestPageDisplayed" object:0 queue:v14 usingBlock:v17]);
      v16 = (void *)v23[5];
      v23[5] = v15;

      _Block_object_dispose(&v22, 8);
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
  }
}

+ (id)_tabNameForPageName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"listen_now"])
  {
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI")) {
      id v4 = @"listenNow";
    }
    else {
      id v4 = @"listennow";
    }
  }

  else
  {
    id v4 = (__CFString *)[v3 copy];
  }

  return v4;
}

+ (void)_performAfterNotification:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  objc_initWeak(&location, v7);

  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_1000AC57C;
  id v21 = sub_1000AC58C;
  id v22 = 0LL;
  id v8 = objc_loadWeakRetained(&location);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AC83C;
  v13[3] = &unk_10026D5E0;
  id v10 = v6;
  id v14 = v10;
  objc_copyWeak(&v16, &location);
  uint64_t v15 = &v17;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 addObserverForName:v5 object:0 queue:v9 usingBlock:v13]);
  dispatch_time_t v12 = (void *)v18[5];
  v18[5] = v11;

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

+ (void)_completeTest:(id)a3 afterNotification:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AC91C;
  v7[3] = &unk_10026D608;
  id v8 = a3;
  id v6 = v8;
  [a1 _performAfterNotification:a4 block:v7];
}

+ (void)_scrollContentAndCompleteTest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v17[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v17[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  3LL));
  v17[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL));
  v17[3] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  void v17[4] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v17[5] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v17[6] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v17[7] = v11;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 8LL));

  id v13 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000ACCF0;
  v15[3] = &unk_100268CF0;
  id v16 = v3;
  id v14 = v3;
  [v13 evaluateCommands:v12 completion:v15];
}

+ (void)_scrollContentVerticallyOnlyAndCompleteTest:(id)a3
{
  id v20 = a3;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v23[0] = v19;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[1] = v18;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[2] = v17;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[3] = v16;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[4] = v15;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[5] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[6] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[7] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v23[8] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  1LL));
  v23[9] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[10] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[11] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[12] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  0LL));
  v23[13] = v11;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 14LL));

  id v13 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000AD00C;
  v21[3] = &unk_100268CF0;
  id v22 = v20;
  id v14 = v20;
  [v13 evaluateCommands:v12 completion:v21];
}

@end