@interface TVHAnalyticsController
+ (id)_mediaCategoryTypeAnalyticsString:(unint64_t)a3;
+ (id)new;
+ (id)sharedController;
- (TVHAnalyticsController)init;
- (id)_init;
- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3;
- (void)_handleNavigationControllerWillDisplayViewControllerNotification:(id)a3;
- (void)_sendMediaItemPlayedEventWithMediaEntityType:(id)a3;
- (void)_sendPhotoSlideshowStartedEvent;
- (void)dealloc;
- (void)sendAppLaunchedEvent;
- (void)sendMediaLibraryBrowsedEventWithMediaCategoryTypes:(id)a3;
- (void)sendScreensaverPickerDisplayedEvent;
- (void)sendTopShelfItemDisplayedEventWithMediaCategoryType:(unint64_t)a3;
@end

@implementation TVHAnalyticsController

+ (id)sharedController
{
  if (qword_1001572C8 != -1) {
    dispatch_once(&qword_1001572C8, &stru_1000FD510);
  }
  return (id)qword_1001572D0;
}

+ (id)new
{
  return 0LL;
}

- (TVHAnalyticsController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHAnalyticsController;
  v2 = -[TVHAnalyticsController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_handleCurrentPlaybackMediaItemDidChangeNotification:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:0];
    [v3 addObserver:v2 selector:"_handleNavigationControllerWillDisplayViewControllerNotification:" name:@"TVHNavigationControllerWillDisplayViewControllerNotification" object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHAnalyticsController;
  -[TVHAnalyticsController dealloc](&v4, "dealloc");
}

- (void)sendAppLaunchedEvent
{
}

- (void)sendTopShelfItemDisplayedEventWithMediaCategoryType:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001F89C;
  v3[3] = &unk_1000FD578;
  v3[4] = self;
  v3[5] = a3;
  AnalyticsSendEventLazy(@"com.apple.appletv.homesharing.topShelfItemDisplayed", v3);
}

- (void)sendScreensaverPickerDisplayedEvent
{
}

- (void)sendMediaLibraryBrowsedEventWithMediaCategoryTypes:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F9E0;
  v4[3] = &unk_1000FD5C0;
  id v5 = a3;
  id v3 = v5;
  AnalyticsSendEventLazy(@"com.apple.appletv.homesharing.mediaLibraryBrowsed", v4);
}

- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVPPlayer);
  id v6 = v4;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  id v13 = (id)objc_claimAutoreleasedReturnValue([v9 currentMediaItem]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaItem]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
    -[TVHAnalyticsController _sendMediaItemPlayedEventWithMediaEntityType:]( self,  "_sendMediaItemPlayedEventWithMediaEntityType:",  v12);
  }
}

- (void)_handleNavigationControllerWillDisplayViewControllerNotification:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ViewController"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSlideshowMarimbaViewController);
  id v7 = v5;
  id v10 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v8 = v10;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;
}

- (void)_sendPhotoSlideshowStartedEvent
{
}

- (void)_sendMediaItemPlayedEventWithMediaEntityType:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FE98;
  v4[3] = &unk_1000FD608;
  void v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  AnalyticsSendEventLazy(@"com.apple.appletv.homesharing.mediaItemPlayed", v4);
}

+ (id)_mediaCategoryTypeAnalyticsString:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return 0LL;
  }
  else {
    return off_1000FD670[a3 - 1];
  }
}

@end