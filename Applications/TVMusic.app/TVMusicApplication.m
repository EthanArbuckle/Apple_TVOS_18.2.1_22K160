@interface TVMusicApplication
+ (BOOL)usingMusicUI;
+ (NSString)launchTestName;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (id)_extendLaunchTest;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVMusicApplication

+ (NSString)launchTestName
{
  return (NSString *)@"launch";
}

+ (BOOL)usingMusicUI
{
  int v2 = _os_feature_enabled_impl("TVMusic", "MusicUI");
  if (v2)
  {
    if (MGGetProductType() == 1110205732) {
      LOBYTE(v2) = _os_feature_enabled_impl("TVMusic", "MusicUIForJ42");
    }
    else {
      LOBYTE(v2) = 1;
    }
  }

  return v2;
}

- (id)_extendLaunchTest
{
  id v2 = objc_msgSend((id)objc_opt_class(self, a2), "launchTestName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI") && (byte_1002BE790 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PageStateNotifier shared](&OBJC_CLASS____TtC7TVMusic17PageStateNotifier, "shared"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001ACC8;
    v6[3] = &unk_100268CF0;
    id v7 = v3;
    [v4 onPageLoadedForTab:@"listenNow" handler:v6];

    byte_1002BE790 = 1;
  }

  return v3;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001ADFC;
  v9[3] = &unk_1002699B0;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  if (!*((_BYTE *)v11 + 24))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVMusicApplication;
    -[TVMusicApplication pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);
  }

  _Block_object_dispose(&v10, 8);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"album"])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"albumID"]);
    if (v8) {
      v9 = (__CFString *)v8;
    }
    else {
      v9 = @"1440654069";
    }
    unsigned __int8 v10 = +[TVMusicPerformanceTests testShowAlbumWithAdamID:]( &OBJC_CLASS___TVMusicPerformanceTests,  "testShowAlbumWithAdamID:",  v9);
  }

  else if ([v6 isEqualToString:@"playlist"])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"playlistID"]);
    if (v11) {
      v9 = (__CFString *)v11;
    }
    else {
      v9 = @"pl.154af9931b214278a64274c410046e69";
    }
    unsigned __int8 v10 = +[TVMusicPerformanceTests testShowPlaylistWithGlobalID:]( &OBJC_CLASS___TVMusicPerformanceTests,  "testShowPlaylistWithGlobalID:",  v9);
  }

  else
  {
    if (![v6 isEqualToString:@"artist"])
    {
      if ([v6 isEqualToString:@"listen_now"])
      {
        if (+[TVMusicPerformanceTests testShowListenNow](&OBJC_CLASS___TVMusicPerformanceTests, "testShowListenNow")) {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"listen_now_vertical_scroll"])
      {
        if (+[TVMusicPerformanceTests testShowListenNowVerticalScroll]( &OBJC_CLASS___TVMusicPerformanceTests,  "testShowListenNowVerticalScroll"))
        {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"browse"])
      {
        if (+[TVMusicPerformanceTests testShowBrowse](&OBJC_CLASS___TVMusicPerformanceTests, "testShowBrowse")) {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"browse_vertical_scroll"])
      {
        if (+[TVMusicPerformanceTests testShowBrowseVerticalScroll]( &OBJC_CLASS___TVMusicPerformanceTests,  "testShowBrowseVerticalScroll"))
        {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"videos"])
      {
        if (+[TVMusicPerformanceTests testShowVideos](&OBJC_CLASS___TVMusicPerformanceTests, "testShowVideos")) {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"radio"])
      {
        if (+[TVMusicPerformanceTests testShowRadio](&OBJC_CLASS___TVMusicPerformanceTests, "testShowRadio")) {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"library"])
      {
        if (+[TVMusicPerformanceTests testLibrary](&OBJC_CLASS___TVMusicPerformanceTests, "testLibrary")) {
          goto LABEL_17;
        }
      }

      else if ([v6 isEqualToString:@"playback"] {
             && +[TVMusicPerformanceTests testPlayback](&OBJC_CLASS___TVMusicPerformanceTests, "testPlayback"))
      }
      {
        goto LABEL_17;
      }

@end