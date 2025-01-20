@interface TVSSMarimbaViewController
+ (void)_sendAnalyticsAction:(id)a3 payload:(id)a4;
+ (void)initialize;
- (BOOL)_didScreenSaverPhotoCollectionChange;
- (TVSSMarimbaViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_photoAssetFromFilePath:(id)a3;
- (id)_photoAssetsFromImageCache;
- (id)_photoSourceWithIdentifier:(id)a3;
- (id)_preferences;
- (id)absolutePathForAssetKey:(id)a3;
- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (void)_beginObservingThemeChanges;
- (void)_displayAssetsLoadingView;
- (void)_downAction:(id)a3;
- (void)_endObservingThemeChanges;
- (void)_fetchAssetsAndBeginScreensaverPreview;
- (void)_fileAddedToImageCacheNotification:(id)a3;
- (void)_leftAction:(id)a3;
- (void)_mediaPlaybackStateWithCompletion:(id)a3;
- (void)_mediaRemotePlaybackApplicationStateDidChange:(id)a3;
- (void)_playPauseAction:(id)a3;
- (void)_rightAction:(id)a3;
- (void)_selectAction:(id)a3;
- (void)_sendEndEvent;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 dismissOnFailure:(BOOL)a4;
- (void)_sendStartEvent;
- (void)_startScreenSaverPreview;
- (void)_startScreenSaverWithPhotoAssets:(id)a3;
- (void)_stopMarimbaRenderer;
- (void)_upAction:(id)a3;
- (void)_usedAllPathsNotification:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSSMarimbaViewController

+ (void)initialize
{
  uint64_t v2 = objc_opt_class(a1, a2);
  if (v2 == objc_opt_class(&OBJC_CLASS___TVSSMarimbaViewController, v3)) {
    +[TVAssetLibrary intializeScreensaverSharedAssetLibrary]( &OBJC_CLASS___TVAssetLibrary,  "intializeScreensaverSharedAssetLibrary");
  }
}

- (TVSSMarimbaViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVSSMarimbaViewController;
  v4 = -[TVSSMarimbaViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[TVSSSlideshowUtilities initWithMarimbaMode:]( objc_alloc(&OBJC_CLASS___TVSSSlideshowUtilities),  "initWithMarimbaMode:",  1LL);
    screensaverUtilities = v4->_screensaverUtilities;
    v4->_screensaverUtilities = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController _preferences](v4, "_preferences"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 screenSaverPhotoSourceIdentifier]);
    v9 = (void *)v8;
    v10 = @"com.apple.TVPhotoSources.TVDefaultPhotosPlugin";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v11 = v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController _photoSourceWithIdentifier:](v4, "_photoSourceWithIdentifier:", v11));
    p_currentPhotoSource = (void **)&v4->_currentPhotoSource;
    currentPhotoSource = v4->_currentPhotoSource;
    v4->_currentPhotoSource = (TVPhotoSource *)v12;

    if (!v4->_currentPhotoSource)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Can't find selected photo source, using default.",  v27,  2u);
      }

      uint64_t v15 = objc_claimAutoreleasedReturnValue( -[TVSSMarimbaViewController _photoSourceWithIdentifier:]( v4,  "_photoSourceWithIdentifier:",  @"com.apple.TVPhotoSources.TVDefaultPhotosPlugin"));
      v16 = *p_currentPhotoSource;
      *p_currentPhotoSource = (void *)v15;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100006424((uint64_t)&v4->_currentPhotoSource, v17, v18, v19, v20, v21, v22, v23);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v24 addObserver:v4 selector:"_fileAddedToImageCacheNotification:" name:TVPhotoSourcesImageCacheUpdatedNotification object:0];

    MRMediaRemoteRegisterForNowPlayingNotifications(&_dispatch_main_q);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:v4 selector:"_mediaRemotePlaybackApplicationStateDidChange:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 removeObserver:self name:TVPhotoSourcesImageCacheUpdatedNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSMarimbaViewController;
  -[TVSSMarimbaViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TVSSMarimbaView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  objc_super v5 = -[TVSSMarimbaView initWithFrame:](v3, "initWithFrame:");
  marimbaView = self->_marimbaView;
  self->_marimbaView = v5;

  -[TVSSMarimbaViewController setView:](self, "setView:", self->_marimbaView);
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSSMarimbaViewController;
  -[TVSSMarimbaViewController viewDidLoad](&v20, "viewDidLoad");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
  [v3 setStopWithVideo:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView document](self->_marimbaView, "document"));
  [v4 setAssetKeyDelegate:self];
  [v4 setLoopingMode:5];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseLoopTransition];
  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseDefaultAudio];
  [v6 setObject:&__kCFBooleanTrue forKey:kMPAuthoringLive];
  [v6 setObject:kMPFadeInEffect forKey:kMPAuthoringIntroEffectID];
  [v6 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
  [v6 setObject:&__kCFBooleanTrue forKey:kMPAuthoringUseImageOnlyTitleEffect];
  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseClustering];
  [v6 setObject:&off_10000CDF8 forKey:kMPAuthoringLiveMaxSlidePreload];
  [v4 setDocumentAttribute:v6 forKey:kMPDocumentAuthoringOptions];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"_usedAllPathsNotification:" name:kMPAuthoringLiveUsedAllPathsNotification object:v4];

  uint64_t v8 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_leftAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_10000D018);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v9 addGestureRecognizer:v8];

  v10 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_rightAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v10, "setAllowedPressTypes:", &off_10000D030);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v11 addGestureRecognizer:v10];

  uint64_t v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_upAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_10000D048);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v13 addGestureRecognizer:v12];

  v14 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_downAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v14, "setAllowedPressTypes:", &off_10000D060);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v15 addGestureRecognizer:v14];

  v16 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_playPauseAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v16, "setAllowedPressTypes:", &off_10000D078);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v17 addGestureRecognizer:v16];

  uint64_t v18 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_selectAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v18, "setAllowedPressTypes:", &off_10000D090);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v19 addGestureRecognizer:v18];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSMarimbaViewController;
  -[TVSSMarimbaViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if (self->_didWarmUpAndStartMarimbaRenderer) {
    -[TVSSMarimbaViewController _sendStartEvent](self, "_sendStartEvent");
  }
  else {
    -[TVSSMarimbaViewController _startScreenSaverPreview](self, "_startScreenSaverPreview");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (id)absolutePathForAssetKey:(id)a3
{
  id v4 = a3;
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4
{
  return -[TVSSMarimbaViewController absolutePathForAssetKey:]( self,  "absolutePathForAssetKey:",  a3,  a4.width,  a4.height);
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  return 0LL;
}

- (void)_playPauseAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000035EC;
    v4[3] = &unk_10000C4D8;
    v4[4] = self;
    -[TVSSMarimbaViewController _mediaPlaybackStateWithCompletion:](self, "_mediaPlaybackStateWithCompletion:", v4);
  }

- (void)_leftAction:(id)a3
{
  if ([a3 state] == (id)3) {
    -[TVSSMarimbaViewController _sendMediaRemoteCommand:dismissOnFailure:]( self,  "_sendMediaRemoteCommand:dismissOnFailure:",  5LL,  1LL);
  }
}

- (void)_rightAction:(id)a3
{
  if ([a3 state] == (id)3) {
    -[TVSSMarimbaViewController _sendMediaRemoteCommand:dismissOnFailure:]( self,  "_sendMediaRemoteCommand:dismissOnFailure:",  4LL,  1LL);
  }
}

- (void)_upAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v3 deactivateScreenSaver];
  }

- (void)_downAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v3 deactivateScreenSaver];
  }

- (void)_sendMediaRemoteCommand:(unsigned int)a3 dismissOnFailure:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000037D4;
  v4[3] = &unk_10000C4F8;
  unsigned int v5 = a3;
  BOOL v6 = a4;
  -[TVSSMarimbaViewController _mediaPlaybackStateWithCompletion:](self, "_mediaPlaybackStateWithCompletion:", v4);
}

- (void)_selectAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v3 deactivateScreenSaver];
  }

- (void)_usedAllPathsNotification:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView document](self->_marimbaView, "document", a3));
  [v3 setAuthoringOption:&off_10000CEA0 forKey:kMPAuthoringLiveSlideIndex];
}

- (void)_mediaRemotePlaybackApplicationStateDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003990;
  v5[3] = &unk_10000C520;
  objc_copyWeak(&v6, &location);
  -[TVSSMarimbaViewController _mediaPlaybackStateWithCompletion:](self, "_mediaPlaybackStateWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_sendStartEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController _preferences](self, "_preferences"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006494(v3, (uint64_t)self);
  }
  unsigned int v5 = (void *)objc_opt_class(self, v4);
  v19[0] = @"source";
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 screenSaverPhotoSourceIdentifier]);
  v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (const __CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_10000C750;
  }
  v20[0] = v8;
  v19[1] = @"collection";
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 screenSaverPhotoCollectionIdentifier]);
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = &stru_10000C750;
  }
  v20[1] = v11;
  v19[2] = @"name";
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVPhotoCollection collectionName](self->_selectedPhotoCollection, "collectionName"));
  v13 = (void *)v12;
  if (v12) {
    v14 = (const __CFString *)v12;
  }
  else {
    v14 = &stru_10000C750;
  }
  v20[2] = v14;
  v19[3] = @"style";
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v3 screenSaverStyle]);
  v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (const __CFString *)v15;
  }
  else {
    uint64_t v17 = &stru_10000C750;
  }
  v20[3] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  [v5 _sendAnalyticsAction:@"started" payload:v18];
}

- (void)_sendEndEvent
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006598();
  }
  objc_msgSend((id)objc_opt_class(self, v3), "_sendAnalyticsAction:payload:", @"ended", 0);
}

+ (void)_sendAnalyticsAction:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([@"com.apple.appletv.screensaver.photos." stringByAppendingString:a3]);
  AnalyticsSendEvent(v6, v5);
}

- (void)_mediaPlaybackStateWithCompletion:(id)a3
{
  id v3 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  int v16 = 0;
  uint64_t v4 = dispatch_group_create();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_group_enter(v4);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100003D54;
  v12[3] = &unk_10000C548;
  v14 = v15;
  v7 = v4;
  v13 = v7;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState(v6, v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003D68;
  v9[3] = &unk_10000C570;
  id v10 = v3;
  v11 = v15;
  id v8 = v3;
  dispatch_group_notify(v7, &_dispatch_main_q, v9);

  _Block_object_dispose(v15, 8);
}

- (void)_startScreenSaverPreview
{
  id v3 = -[TVSSMarimbaViewController view](self, "view");
  -[TVSSMarimbaViewController _fetchAssetsAndBeginScreensaverPreview](self, "_fetchAssetsAndBeginScreensaverPreview");
}

- (void)_displayAssetsLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v12;

  id v14 = +[UIActivityIndicatorView defaultSizeForStyle:]( &OBJC_CLASS___UIActivityIndicatorView,  "defaultSizeForStyle:",  20LL);
  UIRectCenteredIntegralRect(v14, CGPointZero.x, CGPointZero.y, v15, v16, v5, v7, v9, v11);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:");
  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController view](self, "view"));
  [v17 addSubview:self->_spinnerView];
}

- (void)_fetchAssetsAndBeginScreensaverPreview
{
  cachedPhotoAssets = self->_cachedPhotoAssets;
  self->_cachedPhotoAssets = 0LL;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000065DC((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
  [v11 warmupRenderer];

  self->_didWarmUpAndStartMarimbaRenderer = 1;
  currentPhotoSource = self->_currentPhotoSource;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003F6C;
  v13[3] = &unk_10000C5E8;
  v13[4] = self;
  -[TVPhotoSource fetchCollectionsWithCompletion:](currentPhotoSource, "fetchCollectionsWithCompletion:", v13);
}

- (void)_stopMarimbaRenderer
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
  [v3 pause];
  [v3 cleanup];
  +[MRMarimbaLayer releaseResources](&OBJC_CLASS___MRMarimbaLayer, "releaseResources");
  -[TVSSMarimbaViewController _endObservingThemeChanges](self, "_endObservingThemeChanges");
  self->_didWarmUpAndStartMarimbaRenderer = 0;
  -[TVSSMarimbaViewController _sendEndEvent](self, "_sendEndEvent");
}

- (void)_startScreenSaverWithPhotoAssets:(id)a3
{
  id v4 = a3;
  -[TVSSMarimbaViewController _sendStartEvent](self, "_sendStartEvent");
  screensaverUtilities = self->_screensaverUtilities;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 document]);
  uint64_t v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[TVSSSlideshowUtilities updateMarimbaDocument:photoAssets:]( screensaverUtilities,  "updateMarimbaDocument:photoAssets:",  v7,  v4));

  assetKeysToAssetPaths = self->_assetKeysToAssetPaths;
  self->_assetKeysToAssetPaths = v8;

  -[TVSSSlideshowUtilities updateMarimbaView:currentTheme:currentTransition:]( self->_screensaverUtilities,  "updateMarimbaView:currentTheme:currentTransition:",  self->_marimbaView,  0LL,  0LL);
  -[TVSSSlideshowUtilities updateTransitionTimingForMarimbaView:]( self->_screensaverUtilities,  "updateTransitionTimingForMarimbaView:",  self->_marimbaView);
  -[TVSSMarimbaViewController _beginObservingThemeChanges](self, "_beginObservingThemeChanges");
}

- (void)_beginObservingThemeChanges
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004428;
  v7[3] = &unk_10000C610;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v4,  v7));
  id preferenceObserverToken = self->_preferenceObserverToken;
  self->_id preferenceObserverToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_endObservingThemeChanges
{
  if (self->_preferenceObserverToken)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_preferenceObserverToken];

    id preferenceObserverToken = self->_preferenceObserverToken;
  }

  else
  {
    id preferenceObserverToken = 0LL;
  }

  self->_id preferenceObserverToken = 0LL;
}

- (BOOL)_didScreenSaverPhotoCollectionChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMarimbaViewController _preferences](self, "_preferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 screenSaverPhotoCollectionIdentifier]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollection collectionIdentifier](self->_selectedPhotoCollection, "collectionIdentifier"));
  LOBYTE(v3) = [v4 isEqualToString:v5] ^ 1;

  return (char)v3;
}

- (void)_fileAddedToImageCacheNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000046FC;
  v5[3] = &unk_10000C5C0;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (id)_photoAssetFromFilePath:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___TVMutablePhotoAsset);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 0LL));

  [v4 setFullResolutionURL:v5];
  id v6 = [v4 copy];

  return v6;
}

- (id)_photoAssetsFromImageCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assetPathsForGroupOfType:2]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004A9C;
  v7[3] = &unk_10000C638;
  v7[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_arrayByMappingObjectsUsingBlock:", v7));

  return v5;
}

- (id)_preferences
{
  return +[TVSPreferences sharedScreenSaverPreferences](&OBJC_CLASS___TVSPreferences, "sharedScreenSaverPreferences");
}

- (id)_photoSourceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPhotoSourceManager defaultManager](&OBJC_CLASS___TVPhotoSourceManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoSources]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceIdentifier", (void)v14));
        unsigned __int8 v12 = [v11 isEqualToString:v3];

        if ((v12 & 1) != 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void).cxx_destruct
{
}

@end