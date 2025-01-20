@interface TVPSlideshowMarimbaViewController
+ (id)_photoAssetsFromPHAssets:(id)a3;
- (BOOL)didPauseMarimbaRenderer;
- (BOOL)didReachSlideshowEnd;
- (BOOL)didStartSlideshow;
- (BOOL)displayThemeOptions;
- (BOOL)displaysTransitionStyleOptions;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5;
- (NSArray)photoAssets;
- (NSArray)slideshowThemeSettings;
- (NSArray)slideshowTransitionSettings;
- (NSDictionary)assetKeysToAssetPaths;
- (NSDictionary)options;
- (NSDictionary)themeParameters;
- (NSString)focusedThemeForPreview;
- (NSString)slideshowStyle;
- (NSTimer)themeTimer;
- (OS_dispatch_source)assetsRefreshTimer;
- (PXDisplayAssetCountsByPlaybackStyle)assetCountsByPlaybackStyle;
- (TVPMarimbaView)marimbaView;
- (TVPSlideshowMarimbaViewController)init;
- (TVPSlideshowMarimbaViewController)initWithPhotoAssets:(id)a3;
- (TVPSlideshowMarimbaViewController)initWithPhotoAssets:(id)a3 displayThemeOptions:(BOOL)a4;
- (TVPSlideshowUtilities)slideshowUtilites;
- (UIActivityIndicatorView)preloadSpinnerView;
- (UITableView)slideshowOptionsView;
- (UITapGestureRecognizer)leftButtonRecognizer;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UITapGestureRecognizer)playPauseGestureRecognizer;
- (UITapGestureRecognizer)rightButtonRecognizer;
- (UIView)headerView;
- (UIVisualEffectView)blurBackgroundView;
- (id)_defaultImageRequestOptions;
- (id)absolutePathForAssetKey:(id)a3;
- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_indexOfAssetPathInOrderedAssets:(id)a3;
- (int64_t)indexOfNextImageToPrefetch;
- (int64_t)initialImagePrefetchCount;
- (int64_t)maxImageBatchPreloadCount;
- (int64_t)minImageFetchPreloadGap;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)slideshowStartIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelExistingTimer;
- (void)_didFinishTimedInterval:(id)a3;
- (void)_dismissImagePreloadSpinnerView;
- (void)_displayImagePreloadSpinnerView;
- (void)_fingerTouchAction:(id)a3;
- (void)_initializeSlideshowMarimbaParametersWithOptions:(id)a3 displayThemeOptions:(BOOL)a4;
- (void)_leftAction:(id)a3;
- (void)_marimbaSlideshowPlaybackFinished:(id)a3;
- (void)_menuAction:(id)a3;
- (void)_pauseMarimbaRenderer;
- (void)_playPauseAction:(id)a3;
- (void)_preloadImagesForAssetsWithCompletion:(id)a3;
- (void)_refreshMarimbaPreviewWithPhotoAssets:(id)a3;
- (void)_reorderAssets;
- (void)_rightAction:(id)a3;
- (void)_startSlideshow;
- (void)_unpauseMarimbaRenderer;
- (void)_updateMarimbaDocumentWithAddedAssets:(id)a3;
- (void)_usedAllPathsNotification:(id)a3;
- (void)dealloc;
- (void)immediatelyRefreshPhotoAssets:(id)a3;
- (void)loadView;
- (void)refreshPhotoAssets:(id)a3;
- (void)setAssetCountsByPlaybackStyle:(id)a3;
- (void)setAssetKeysToAssetPaths:(id)a3;
- (void)setAssetsRefreshTimer:(id)a3;
- (void)setBlurBackgroundView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDidPauseMarimbaRenderer:(BOOL)a3;
- (void)setDidReachSlideshowEnd:(BOOL)a3;
- (void)setDidStartSlideshow:(BOOL)a3;
- (void)setDisplayThemeOptions:(BOOL)a3;
- (void)setDisplaysTransitionStyleOptions:(BOOL)a3;
- (void)setFocusedThemeForPreview:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIndexOfNextImageToPrefetch:(int64_t)a3;
- (void)setInitialImagePrefetchCount:(int64_t)a3;
- (void)setLeftButtonRecognizer:(id)a3;
- (void)setMarimbaView:(id)a3;
- (void)setMaxImageBatchPreloadCount:(int64_t)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setMinImageFetchPreloadGap:(int64_t)a3;
- (void)setPhotoAssets:(id)a3;
- (void)setPlayPauseGestureRecognizer:(id)a3;
- (void)setPreloadSpinnerView:(id)a3;
- (void)setRightButtonRecognizer:(id)a3;
- (void)setSlideshowOptionsView:(id)a3;
- (void)setSlideshowStartIndex:(int64_t)a3;
- (void)setSlideshowStyle:(id)a3;
- (void)setSlideshowThemeSettings:(id)a3;
- (void)setSlideshowTransitionSettings:(id)a3;
- (void)setSlideshowUtilites:(id)a3;
- (void)setThemeParameters:(id)a3;
- (void)setThemeTimer:(id)a3;
- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVPSlideshowMarimbaViewController

- (TVPSlideshowMarimbaViewController)initWithPhotoAssets:(id)a3
{
  return -[TVPSlideshowMarimbaViewController initWithPhotoAssets:displayThemeOptions:]( self,  "initWithPhotoAssets:displayThemeOptions:",  a3,  0LL);
}

- (TVPSlideshowMarimbaViewController)initWithPhotoAssets:(id)a3 displayThemeOptions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  v7 = -[TVPSlideshowMarimbaViewController init](&v14, "init");
  v9 = v7;
  if (v7)
  {
    if (!v6) {
      sub_100079BDC();
    }
    id v10 = objc_msgSend((id)objc_opt_class(v7, v8), "_photoAssetsFromPHAssets:", v6);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    photoAssets = v9->_photoAssets;
    v9->_photoAssets = (NSArray *)v11;

    -[TVPSlideshowMarimbaViewController _initializeSlideshowMarimbaParametersWithOptions:displayThemeOptions:]( v9,  "_initializeSlideshowMarimbaParametersWithOptions:displayThemeOptions:",  0LL,  v4);
  }

  return v9;
}

- (TVPSlideshowMarimbaViewController)init
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPSlideshowMarimbaViewController.m",  169,  @"%s is not available as initializer",  "-[TVPSlideshowMarimbaViewController init]");

  abort();
}

- (void)immediatelyRefreshPhotoAssets:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100079C04();
  }
  v5 = v4;
  if ([v4 count])
  {
    assetsRefreshTimer = self->_assetsRefreshTimer;
    if (assetsRefreshTimer)
    {
      dispatch_source_cancel((dispatch_source_t)assetsRefreshTimer);
      v7 = self->_assetsRefreshTimer;
      self->_assetsRefreshTimer = 0LL;
    }

    objc_initWeak(&location, self);
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    v9 = self->_assetsRefreshTimer;
    self->_assetsRefreshTimer = v8;

    id v10 = self->_assetsRefreshTimer;
    dispatch_time_t v11 = dispatch_time(0LL, 0LL);
    dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    v12 = self->_assetsRefreshTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002FF88;
    handler[3] = &unk_1000C9AF0;
    objc_copyWeak(&v15, &location);
    id v14 = v5;
    dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
    dispatch_resume((dispatch_object_t)self->_assetsRefreshTimer);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)refreshPhotoAssets:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100079C2C();
  }
  v5 = v4;
  if ([v4 count])
  {
    assetsRefreshTimer = self->_assetsRefreshTimer;
    if (assetsRefreshTimer)
    {
      dispatch_source_cancel((dispatch_source_t)assetsRefreshTimer);
      v7 = self->_assetsRefreshTimer;
      self->_assetsRefreshTimer = 0LL;
    }

    objc_initWeak(&location, self);
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    v9 = self->_assetsRefreshTimer;
    self->_assetsRefreshTimer = v8;

    id v10 = self->_assetsRefreshTimer;
    dispatch_time_t v11 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    v12 = self->_assetsRefreshTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003013C;
    handler[3] = &unk_1000C9AF0;
    objc_copyWeak(&v15, &location);
    id v14 = v5;
    dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
    dispatch_resume((dispatch_object_t)self->_assetsRefreshTimer);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (UITapGestureRecognizer)playPauseGestureRecognizer
{
  playPauseGestureRecognizer = self->_playPauseGestureRecognizer;
  if (!playPauseGestureRecognizer)
  {
    id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_playPauseAction:");
    v5 = self->_playPauseGestureRecognizer;
    self->_playPauseGestureRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_playPauseGestureRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedPressTypes:]( self->_playPauseGestureRecognizer,  "setAllowedPressTypes:",  &off_1000D1BD0);
    playPauseGestureRecognizer = self->_playPauseGestureRecognizer;
  }

  return playPauseGestureRecognizer;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  menuGestureRecognizer = self->_menuGestureRecognizer;
  if (!menuGestureRecognizer)
  {
    id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuAction:");
    v5 = self->_menuGestureRecognizer;
    self->_menuGestureRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_menuGestureRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedPressTypes:]( self->_menuGestureRecognizer,  "setAllowedPressTypes:",  &off_1000D1BE8);
    menuGestureRecognizer = self->_menuGestureRecognizer;
  }

  return menuGestureRecognizer;
}

- (UITapGestureRecognizer)leftButtonRecognizer
{
  leftButtonRecognizer = self->_leftButtonRecognizer;
  if (!leftButtonRecognizer)
  {
    id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_leftAction:");
    v5 = self->_leftButtonRecognizer;
    self->_leftButtonRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_leftButtonRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedPressTypes:]( self->_leftButtonRecognizer,  "setAllowedPressTypes:",  &off_1000D1C00);
    leftButtonRecognizer = self->_leftButtonRecognizer;
  }

  return leftButtonRecognizer;
}

- (UITapGestureRecognizer)rightButtonRecognizer
{
  rightButtonRecognizer = self->_rightButtonRecognizer;
  if (!rightButtonRecognizer)
  {
    id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_rightAction:");
    v5 = self->_rightButtonRecognizer;
    self->_rightButtonRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_rightButtonRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedPressTypes:]( self->_rightButtonRecognizer,  "setAllowedPressTypes:",  &off_1000D1C18);
    rightButtonRecognizer = self->_rightButtonRecognizer;
  }

  return rightButtonRecognizer;
}

- (void)loadView
{
  v35 = objc_alloc_init(&OBJC_CLASS___UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  -[UIView setFrame:](v35, "setFrame:");

  -[TVPSlideshowMarimbaViewController setView:](self, "setView:", v35);
  id v4 = objc_alloc(&OBJC_CLASS___TVPMarimbaView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 bounds];
  id v6 = -[TVPMarimbaView initWithFrame:](v4, "initWithFrame:");
  marimbaView = self->_marimbaView;
  self->_marimbaView = v6;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController view](self, "view"));
  [v8 addSubview:self->_marimbaView];

  if (self->_displayThemeOptions)
  {
    v9 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
    dispatch_time_t v11 = -[UIVisualEffectView initWithEffect:](v9, "initWithEffect:", v10);
    blurBackgroundView = self->_blurBackgroundView;
    self->_blurBackgroundView = v11;

    v13 = self->_blurBackgroundView;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController view](self, "view"));
    [v14 bounds];
    -[UIVisualEffectView setFrame:](v13, "setFrame:", 1280.0, 0.0, 640.0);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController view](self, "view"));
    [v15 addSubview:self->_blurBackgroundView];

    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v16, "setNumberOfLines:", 1LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v19);

    -[UILabel setTextAlignment:](v16, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v16, "setLineBreakMode:", 2LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"Themes" value:&stru_1000CC6C8 table:0]);
    -[UILabel setText:](v16, "setText:", v21);

    v22 = objc_alloc_init(&OBJC_CLASS___UIView);
    headerView = self->_headerView;
    self->_headerView = v22;

    v24 = self->_headerView;
    -[UIVisualEffectView bounds](self->_blurBackgroundView, "bounds");
    -[UIView setBounds:](v24, "setBounds:", 0.0, 0.0);
    v25 = self->_headerView;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UIView addSubview:](self->_headerView, "addSubview:", v16);
    -[UILabel setFrame:](v16, "setFrame:", 0.0, 66.0, 460.0, 64.0);
    v27 = objc_alloc(&OBJC_CLASS___UITableView);
    -[UIVisualEffectView bounds](self->_blurBackgroundView, "bounds");
    v28 = -[UITableView initWithFrame:style:](v27, "initWithFrame:style:", 0LL, 90.0, 0.0, 460.0);
    slideshowOptionsView = self->_slideshowOptionsView;
    self->_slideshowOptionsView = v28;

    -[UITableView setDataSource:](self->_slideshowOptionsView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_slideshowOptionsView, "setDelegate:", self);
    -[UITableView setAutoresizingMask:](self->_slideshowOptionsView, "setAutoresizingMask:", 18LL);
    v30 = self->_slideshowOptionsView;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[UITableView setSeparatorStyle:](self->_slideshowOptionsView, "setSeparatorStyle:", 0LL);
    -[UITableView setTableHeaderView:](self->_slideshowOptionsView, "setTableHeaderView:", self->_headerView);
    -[UITableView setTag:](self->_slideshowOptionsView, "setTag:", 0LL);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurBackgroundView, "contentView"));
    [v32 addSubview:self->_slideshowOptionsView];

    v33 = self->_slideshowOptionsView;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController menuGestureRecognizer](self, "menuGestureRecognizer"));
    -[UITableView addGestureRecognizer:](v33, "addGestureRecognizer:", v34);
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  -[TVPSlideshowMarimbaViewController viewDidLoad](&v15, "viewDidLoad");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView document](self->_marimbaView, "document"));
  if (!v4)
  {
    dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"TVPSlideshowMarimbaViewController.m" lineNumber:330 description:@"marimba view has no associated document"];
  }

  [v4 setAssetKeyDelegate:self];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  else {
    uint64_t v8 = 0LL;
  }
  [v4 setLoopingMode:v8];
  if (([v7 repeatPhotos] & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:self selector:"_marimbaSlideshowPlaybackFinished:" name:kMRNotificationPlaybackOver object:0];
  }

  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseLoopTransition];
  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseDefaultAudio];
  [v6 setObject:&__kCFBooleanTrue forKey:kMPAuthoringLive];
  [v6 setObject:kMPFadeInEffect forKey:kMPAuthoringIntroEffectID];
  [v6 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
  [v6 setObject:&__kCFBooleanTrue forKey:kMPAuthoringUseImageOnlyTitleEffect];
  [v6 setObject:&__kCFBooleanFalse forKey:kMPAuthoringUseClustering];
  [v6 setObject:&off_1000D15C0 forKey:kMPAuthoringLiveMaxSlidePreload];
  [v4 setDocumentAttribute:v6 forKey:kMPDocumentAuthoringOptions];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"_usedAllPathsNotification:" name:kMPAuthoringLiveUsedAllPathsNotification object:v4];

  -[TVPSlideshowMarimbaViewController _reorderAssets](self, "_reorderAssets");
  -[TVPSlideshowMarimbaViewController _displayImagePreloadSpinnerView](self, "_displayImagePreloadSpinnerView");
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100030AB0;
  v12[3] = &unk_1000C9D18;
  objc_copyWeak(&v13, &location);
  -[TVPSlideshowMarimbaViewController _preloadImagesForAssetsWithCompletion:]( self,  "_preloadImagesForAssetsWithCompletion:",  v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  -[TVPSlideshowMarimbaViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[TVPSlideshowMarimbaViewController _unpauseMarimbaRenderer](self, "_unpauseMarimbaRenderer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  -[TVPSlideshowMarimbaViewController viewWillDisappear:](&v11, "viewWillDisappear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController completionHandler](self, "completionHandler"));

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 document]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authoringOptionForKey:kMPAuthoringLiveSlideIndex]);

    unint64_t v8 = (unint64_t)[v7 integerValue];
    if ((v8 & 0x8000000000000000LL) != 0)
    {
      v9 = 0LL;
    }

    else
    {
      v9 = (char *)v8;
      if (v8 >= -[NSArray count](self->_photoAssets, "count")) {
        v9 = (char *)-[NSArray count](self->_photoAssets, "count") - 1;
      }
    }

    id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[TVPSlideshowMarimbaViewController completionHandler]( self,  "completionHandler"));
    ((void (**)(void, char *))v10)[2](v10, v9);
  }

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  -[TVPSlideshowMarimbaViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  -[TVPSlideshowMarimbaViewController _cancelExistingTimer](self, "_cancelExistingTimer");
  -[TVPSlideshowMarimbaViewController _pauseMarimbaRenderer](self, "_pauseMarimbaRenderer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:0];

  if (-[TVPSlideshowMarimbaViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    if (-[TVPSlideshowMarimbaViewController didStartSlideshow](self, "didStartSlideshow")) {
      -[TVPSlideshowUtilities logSlideshowDidEndReachingSlideshowEnd:]( self->_slideshowUtilites,  "logSlideshowDidEndReachingSlideshowEnd:",  -[TVPSlideshowMarimbaViewController didReachSlideshowEnd](self, "didReachSlideshowEnd"));
    }
    -[TVPSlideshowUtilities cleanUpMarimbaResources:]( self->_slideshowUtilites,  "cleanUpMarimbaResources:",  self->_marimbaView);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSlideshowMarimbaViewController;
  -[TVPSlideshowMarimbaViewController dealloc](&v4, "dealloc");
}

- (id)preferredFocusEnvironments
{
  if (self->_slideshowOptionsView)
  {
    slideshowOptionsView = self->_slideshowOptionsView;
    p_slideshowOptionsView = &slideshowOptionsView;
  }

  else
  {
    if (!self->_marimbaView) {
      return &__NSArray0__struct;
    }
    marimbaView = self->_marimbaView;
    p_slideshowOptionsView = (UITableView **)&marimbaView;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  p_slideshowOptionsView,  1LL));
}

- (void)_menuAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    -[UITableView setTag:](self->_slideshowOptionsView, "setTag:", 0LL);
    -[UITableView setTableHeaderView:](self->_slideshowOptionsView, "setTableHeaderView:", self->_headerView);
    -[UITableView reloadData](self->_slideshowOptionsView, "reloadData");
    -[UITableView setContentOffset:animated:]( self->_slideshowOptionsView,  "setContentOffset:animated:",  1LL,  CGPointZero.x,  CGPointZero.y);
  }

- (void)_playPauseAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    if (self->_didPauseMarimbaRenderer)
    {
      -[TVPSlideshowMarimbaViewController _unpauseMarimbaRenderer](self, "_unpauseMarimbaRenderer");
      -[TVPSlideshowUtilities logSlideshowDidResume](self->_slideshowUtilites, "logSlideshowDidResume");
    }

    else
    {
      -[TVPSlideshowMarimbaViewController _pauseMarimbaRenderer](self, "_pauseMarimbaRenderer");
      -[TVPSlideshowUtilities logSlideshowDidPause](self->_slideshowUtilites, "logSlideshowDidPause");
    }
  }

- (void)_leftAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    -[TVPSlideshowMarimbaViewController _pauseMarimbaRenderer](self, "_pauseMarimbaRenderer");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    [v4 gotoPreviousSlide];
  }

- (void)_rightAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    -[TVPSlideshowMarimbaViewController _pauseMarimbaRenderer](self, "_pauseMarimbaRenderer");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    [v4 gotoNextSlide];
  }

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_menuGestureRecognizer != a3 || -[UITableView tag](self->_slideshowOptionsView, "tag") != 0LL;
}

- (id)absolutePathForAssetKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (v5->_indexOfNextImageToPrefetch <= 0) {
    -[TVPSlideshowMarimbaViewController setIndexOfNextImageToPrefetch:]( v5,  "setIndexOfNextImageToPrefetch:",  -[TVPSlideshowMarimbaViewController initialImagePrefetchCount](v5, "initialImagePrefetchCount"));
  }
  objc_sync_exit(v5);

  v55 = v4;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5->_assetKeysToAssetPaths, "objectForKey:", v4));
  [v56 setPendingRequestID:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v56 fullResolutionURL]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 path]);

  if ([v6 fileExistsAtPath:v8])
  {
    id v8 = v8;
    id v9 = v8;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v56 photoAsset]);

    if (v10)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v56 photoAsset]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSlideshowMarimbaViewController _defaultImageRequestOptions]( v5,  "_defaultImageRequestOptions"));
      if (![v56 pendingRequestID])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v14 bounds];
        double v16 = v15;
        double v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        id v20 = [v19 scale];
        double v22 = PXSizeScale(v20, v16, v18, v21);
        double v24 = v23;
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_1000317D4;
        v68[3] = &unk_1000CA378;
        id v69 = v56;
        objc_msgSend( v69,  "setPendingRequestID:",  objc_msgSend( v13,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v11,  0,  v12,  v68,  v22,  v24));
      }
    }

    id v25 = -[NSArray copy](v5->_photoAssets, "copy");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tvs_randomizedArray"));

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v27 = v26;
    id v9 = [v27 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v9)
    {
      uint64_t v28 = *(void *)v65;
      while (2)
      {
        v29 = 0LL;
        v30 = v8;
        do
        {
          if (*(void *)v65 != v28) {
            objc_enumerationMutation(v27);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v64 + 1) + 8 * (void)v29) fullResolutionURL]);
          id v8 = (id)objc_claimAutoreleasedReturnValue([v31 path]);

          if ([v6 fileExistsAtPath:v8])
          {
            id v8 = v8;
            id v9 = v8;
            goto LABEL_19;
          }

          v29 = (char *)v29 + 1;
          v30 = v8;
        }

        while (v9 != v29);
        id v9 = [v27 countByEnumeratingWithState:&v64 objects:v70 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4
{
  return -[TVPSlideshowMarimbaViewController absolutePathForAssetKey:]( self,  "absolutePathForAssetKey:",  a3,  a4.width,  a4.height);
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  return 0LL;
}

- (void)_usedAllPathsNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences",  a3));
  unsigned int v5 = [v4 repeatPhotos];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView document](self->_marimbaView, "document"));
    [v6 setAuthoringOption:&off_1000D15D8 forKey:kMPAuthoringLiveSlideIndex];
  }

- (void)_marimbaSlideshowPlaybackFinished:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController navigationController](self, "navigationController"));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([a3 tag] == (id)1) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [a3 tag];
  if (v6 == (id)1)
  {
    if (a4)
    {
      id v8 = &OBJC_IVAR___TVPSlideshowMarimbaViewController__slideshowTransitionSettings;
      return (int64_t)[*(id *)((char *)&self->super.super.super.isa + *v8) count];
    }

    return 1LL;
  }

  else
  {
    if (!v6)
    {
      int64_t result = -[NSArray count](self->_photoAssets, "count");
      if (!result) {
        return result;
      }
      id v8 = &OBJC_IVAR___TVPSlideshowMarimbaViewController__slideshowThemeSettings;
      return (int64_t)[*(id *)((char *)&self->super.super.super.isa + *v8) count];
    }

    return 0LL;
  }

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [a3 tag];
  id v6 = &stru_1000CC6C8;
  if (a4 == 1 && v5 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"Transitions" value:&stru_1000CC6C8 table:0]);
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  id v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableCellWithIdentifier:@"tableViewCellReuseIdentifier"]);
  if (!v9) {
    id v9 = -[UITableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___UITableViewCell),  "initWithStyle:reuseIdentifier:",  1LL,  @"tableViewCellReuseIdentifier");
  }
  id v10 = [v6 tag];
  if (v10 == (id)1)
  {
    id v16 = [v7 section];
    if (v16 == (id)1)
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeTransitionSettings]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v7, "row")));

      double v22 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowTransitionStyle]);
      unsigned int v23 = [v12 isEqualToString:v22];

      if (v23) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 0LL;
      }
      uint64_t v24 = 18LL;
LABEL_20:
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue( -[objc_class objectAtIndex:]( (&self->super.super.super.isa)[v24],  "objectAtIndex:",  [v7 row]));
      id v20 = &stru_1000CC6C8;
      goto LABEL_21;
    }

    if (!v16)
    {
      v12 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter, v17);
      [v12 setUnitsStyle:3];
      [v12 setAllowedUnits:128];
      double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);

      id v20 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "stringFromTimeInterval:",  (double)(uint64_t)objc_msgSend(v8, "timePerSlide")));
      uint64_t v15 = 0LL;
LABEL_21:

      goto LABEL_22;
    }
  }

  else if (!v10)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeSettings]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowStyle]);
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) != 0) {
      uint64_t v15 = 3LL;
    }
    else {
      uint64_t v15 = (([v12 isEqualToString:TVScreenSaverStyleKenBurns] & 1) != 0
    }
    uint64_t v24 = 17LL;
    goto LABEL_20;
  }

  uint64_t v15 = 0LL;
  id v20 = &stru_1000CC6C8;
  v19 = &stru_1000CC6C8;
LABEL_22:
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
  [v25 setText:v19];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v9, "detailTextLabel"));
  [v26 setText:v20];

  -[UITableViewCell setAccessoryType:](v9, "setAccessoryType:", v15);
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 cellForRowAtIndexPath:v6]);
  id v10 = [v7 tag];

  if (v10 == (id)1)
  {
    id v15 = [v6 section];
    if (v15 == (id)1)
    {
      if ([v9 accessoryType]) {
        goto LABEL_15;
      }
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeTransitionSettings]);
      double v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row")));
      [v8 setSlideshowTransitionStyle:v18];

      -[TVPSlideshowMarimbaViewController _cancelExistingTimer](self, "_cancelExistingTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController navigationController](self, "navigationController"));
      id v20 = [v19 popViewControllerAnimated:1];

      goto LABEL_14;
    }

    if (!v15)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSlideshowUtilities alertControllerDisplayingTimePerSlideOptionsForCell:]( self->_slideshowUtilites,  "alertControllerDisplayingTimePerSlideOptionsForCell:",  v9));
      -[TVPSlideshowMarimbaViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
LABEL_14:
    }
  }

  else if (!v10)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeSettings]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row")));
    if (![v9 accessoryType])
    {
      [v8 setSlideshowStyle:v12];
      double v21 = @"theme";
      double v22 = v12;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 postNotificationName:@"TVSlideshowThemeChangedNotification" object:self userInfo:v13];
    }

    if ((([v12 isEqualToString:TVScreenSaverStyleKenBurns] & 1) != 0
       || [v12 isEqualToString:TVScreenSaverStyleClassic])
      && self->_displaysTransitionStyleOptions)
    {
      -[UITableView setTag:](self->_slideshowOptionsView, "setTag:", 1LL);
      -[UITableView setTableHeaderView:](self->_slideshowOptionsView, "setTableHeaderView:", 0LL);
      -[UITableView reloadData](self->_slideshowOptionsView, "reloadData");
      -[UITableView setContentOffset:animated:]( self->_slideshowOptionsView,  "setContentOffset:animated:",  1LL,  CGPointZero.x,  CGPointZero.y);
    }

    else
    {
      -[TVPSlideshowMarimbaViewController _cancelExistingTimer](self, "_cancelExistingTimer");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController navigationController](self, "navigationController"));
      id v17 = [v16 popViewControllerAnimated:1];
    }

    goto LABEL_14;
  }

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  id v9 = [v7 tag];

  if (v9)
  {
    id v10 = 0LL;
  }

  else
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeSettings]);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row")));
    focusedThemeForPreview = self->_focusedThemeForPreview;
    self->_focusedThemeForPreview = v12;

    id v17 = @"selectedTheme";
    id v14 = -[NSString copy](self->_focusedThemeForPreview, "copy");
    id v18 = v14;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  }

  -[TVPSlideshowMarimbaViewController _cancelExistingTimer](self, "_cancelExistingTimer");
  id v15 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_didFinishTimedInterval:",  v10,  0LL,  2.0));
  themeTimer = self->_themeTimer;
  self->_themeTimer = v15;
}

- (void)_unpauseMarimbaRenderer
{
  if (self->_didPauseMarimbaRenderer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    [v3 warmupRenderer];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    [v4 play];

    self->_didPauseMarimbaRenderer = 0;
  }

- (void)_pauseMarimbaRenderer
{
  if (!self->_didPauseMarimbaRenderer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self->_marimbaView, "marimbaLayer"));
    [v3 pause];

    self->_didPauseMarimbaRenderer = 1;
  }

- (void)_refreshMarimbaPreviewWithPhotoAssets:(id)a3
{
  id v4 = a3;
  -[TVPSlideshowMarimbaViewController _pauseMarimbaRenderer](self, "_pauseMarimbaRenderer");
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_photoAssetsFromPHAssets:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TVPSlideshowMarimbaViewController setPhotoAssets:](self, "setPhotoAssets:", v7);

  -[TVPSlideshowMarimbaViewController setIndexOfNextImageToPrefetch:](self, "setIndexOfNextImageToPrefetch:", 0LL);
  -[TVPSlideshowMarimbaViewController _reorderAssets](self, "_reorderAssets");
  -[TVPSlideshowMarimbaViewController _displayImagePreloadSpinnerView](self, "_displayImagePreloadSpinnerView");
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000323FC;
  v8[3] = &unk_1000C9D18;
  objc_copyWeak(&v9, &location);
  -[TVPSlideshowMarimbaViewController _preloadImagesForAssetsWithCompletion:]( self,  "_preloadImagesForAssetsWithCompletion:",  v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_displayImagePreloadSpinnerView
{
  double v4 = v3;
  double v6 = v5;
  -[TVPMarimbaView bounds](self->_marimbaView, "bounds");
  float v8 = (v7 - v4) * 0.5;
  double v9 = floorf(v8);
  -[TVPMarimbaView bounds](self->_marimbaView, "bounds");
  float v11 = (v10 - v6) * 0.5;
  v12 = -[UIActivityIndicatorView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithFrame:",  v9,  floorf(v11),  v4,  v6);
  preloadSpinnerView = self->_preloadSpinnerView;
  self->_preloadSpinnerView = v12;

  -[UIActivityIndicatorView setActivityIndicatorViewStyle:]( self->_preloadSpinnerView,  "setActivityIndicatorViewStyle:",  20LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController view](self, "view"));
  [v14 addSubview:self->_preloadSpinnerView];

  -[UIActivityIndicatorView startAnimating](self->_preloadSpinnerView, "startAnimating");
}

- (void)_dismissImagePreloadSpinnerView
{
  preloadSpinnerView = self->_preloadSpinnerView;
  self->_preloadSpinnerView = 0LL;
}

- (void)_didFinishTimedInterval:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  if ([v4 count])
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"selectedTheme"]);
    if ([v5 isEqualToString:self->_focusedThemeForPreview])
    {
      -[TVPSlideshowUtilities updateMarimbaView:currentTheme:currentTransition:]( self->_slideshowUtilites,  "updateMarimbaView:currentTheme:currentTransition:",  self->_marimbaView,  v5,  0LL);
      -[TVPSlideshowUtilities updateMarimbaView:transitionTiming:]( self->_slideshowUtilites,  "updateMarimbaView:transitionTiming:",  self->_marimbaView,  0.0);
    }
  }

  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100032714;
  v7[3] = &unk_1000C9528;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100032798;
  v6[3] = &unk_1000C9680;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v7,  v6,  1.0,  0.0);
}

- (void)_fingerTouchAction:(id)a3
{
  if ((char *)[a3 state] - 1 <= (char *)1)
  {
    -[UIVisualEffectView alpha](self->_blurBackgroundView, "alpha");
    if (v4 == 0.0)
    {
      v5[4] = self;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000328C4;
      v6[3] = &unk_1000C9528;
      v6[4] = self;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100032948;
      v5[3] = &unk_1000C9680;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v6,  v5,  1.0,  0.0);
    }
  }

- (void)_startSlideshow
{
  if (self->_photoAssets)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_themeParameters, "objectForKey:", @"transitionInterval"));
    id v13 = v3;
    if (v3)
    {
      [v3 doubleValue];
      double v5 = v4;
    }

    else
    {
      double v5 = 0.0;
    }

    slideshowUtilites = self->_slideshowUtilites;
    marimbaView = self->_marimbaView;
    float v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_themeParameters, "objectForKey:", @"theme"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_themeParameters, "objectForKey:", @"transitionStyle"));
    -[TVPSlideshowUtilities updateMarimbaView:currentTheme:currentTransition:]( slideshowUtilites,  "updateMarimbaView:currentTheme:currentTransition:",  marimbaView,  v8,  v9);

    -[TVPSlideshowUtilities updateMarimbaView:transitionTiming:]( self->_slideshowUtilites,  "updateMarimbaView:transitionTiming:",  self->_marimbaView,  v5);
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
    float v11 = self->_slideshowUtilites;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController assetCountsByPlaybackStyle](self, "assetCountsByPlaybackStyle"));
    -[TVPSlideshowUtilities logSlideshowDidStartWithAssetCountsByPlaybackStyle:repeating:shuffled:defaultSlideDuration:]( v11,  "logSlideshowDidStartWithAssetCountsByPlaybackStyle:repeating:shuffled:defaultSlideDuration:",  v12,  [v10 repeatPhotos],  objc_msgSend(v10, "shufflePhotos"),  (double)(uint64_t)objc_msgSend(v10, "timePerSlide"));

    -[TVPSlideshowMarimbaViewController setDidStartSlideshow:](self, "setDidStartSlideshow:", 1LL);
  }

- (int64_t)_indexOfAssetPathInOrderedAssets:(id)a3
{
  marimbaView = self->_marimbaView;
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](marimbaView, "marimbaLayer"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 document]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 videoPaths]);
  id v8 = [v7 indexOfObject:v4];

  return (int64_t)v8;
}

- (void)_reorderAssets
{
  if (-[NSArray count](self->_photoAssets, "count"))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedSlideshowPreferences](&OBJC_CLASS___TVSPreferences, "sharedSlideshowPreferences"));
    double v3 = self->_photoAssets;
    if ([v11 shufflePhotos])
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray tvs_randomizedArray](v3, "tvs_randomizedArray"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v4));

      double v3 = (NSArray *)v5;
    }

    else
    {
      int64_t slideshowStartIndex = self->_slideshowStartIndex;
      if (slideshowStartIndex < 1 || slideshowStartIndex >= -[NSArray count](v3, "count"))
      {
        self->_int64_t slideshowStartIndex = 0LL;
      }

      else
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0LL, self->_slideshowStartIndex));
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray subarrayWithRange:]( v3,  "subarrayWithRange:",  self->_slideshowStartIndex,  (char *)-[NSArray count](v3, "count") - self->_slideshowStartIndex));
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v7]);

        double v3 = (NSArray *)v9;
      }
    }

    photoAssets = self->_photoAssets;
    self->_photoAssets = v3;
  }

+ (id)_photoAssetsFromPHAssets:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        id v11 = objc_alloc_init(&OBJC_CLASS___TVSlideshowPhotoAsset);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localIdentifier", (void)v14));
        -[TVSlideshowPhotoAsset setAssetIdentifier:](v11, "setAssetIdentifier:", v12);

        -[TVSlideshowPhotoAsset setPhotoAsset:](v11, "setPhotoAsset:", v10);
        [v4 addObject:v11];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_updateMarimbaDocumentWithAddedAssets:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
  v26 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
  id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_photoAssets, "arrayByAddingObjectsFromArray:", v4));
  photoAssets = self->_photoAssets;
  id v25 = self;
  self->_photoAssets = v7;

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetIdentifier", v25));
        -[NSMutableArray addObject:](v6, "addObject:", v15);
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v15);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v16 setObject:&off_1000D15F0 forKey:kMPMetaDataMediaType];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v16, v15);
      }

      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v11);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v25->_assetKeysToAssetPaths));
  [v17 addEntriesFromDictionary:v5];
  id v18 = (NSDictionary *)[v17 copy];
  assetKeysToAssetPaths = v25->_assetKeysToAssetPaths;
  v25->_assetKeysToAssetPaths = v18;

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](v25->_marimbaView, "marimbaLayer"));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 document]);

  [v21 addVideoPaths:v6];
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 mediaProperties]);
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v22));

  [v23 addEntriesFromDictionary:v26];
  id v24 = [v23 copy];
  [v21 setMediaProperties:v24];
}

- (id)_defaultImageRequestOptions
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, a2);
  [v2 setNetworkAccessAllowed:1];
  [v2 setDeliveryMode:1];
  [v2 setLoadingMode:0x10000];
  return v2;
}

- (void)_preloadImagesForAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_themeParameters, "objectForKey:", @"theme"));
  if (![v5 length])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 slideshowStyle]);

    id v5 = (void *)v7;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPStyleManager sharedManager](&OBJC_CLASS___MPStyleManager, "sharedManager"));
  id v9 = [v8 dynamicBatchSizeForStyleID:v5];

  else {
    uint64_t v10 = (uint64_t)v9 + 5;
  }
  -[TVPSlideshowMarimbaViewController setMinImageFetchPreloadGap:](self, "setMinImageFetchPreloadGap:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPStyleManager sharedManager](&OBJC_CLASS___MPStyleManager, "sharedManager"));
  -[TVPSlideshowMarimbaViewController setMaxImageBatchPreloadCount:]( self,  "setMaxImageBatchPreloadCount:",  (char *)[v11 numberOfSlidesToPreloadForStyleID:v5]
  + -[TVPSlideshowMarimbaViewController minImageFetchPreloadGap](self, "minImageFetchPreloadGap"));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowMarimbaViewController photoAssets](self, "photoAssets"));
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int128 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033400;
  block[3] = &unk_1000CA900;
  objc_copyWeak(&v20, &location);
  block[4] = self;
  id v18 = v12;
  id v19 = v4;
  id v15 = v4;
  id v16 = v12;
  dispatch_async(v14, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSFontAttributeName,  0LL));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a5, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_cancelExistingTimer
{
  themeTimer = self->_themeTimer;
  if (themeTimer)
  {
    -[NSTimer invalidate](themeTimer, "invalidate");
    id v4 = self->_themeTimer;
    self->_themeTimer = 0LL;
  }

- (void)_initializeSlideshowMarimbaParametersWithOptions:(id)a3 displayThemeOptions:(BOOL)a4
{
  id v6 = (NSDictionary *)a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  themeParameters = self->_themeParameters;
  self->_themeParameters = v7;

  double v9 = objc_alloc_init(&OBJC_CLASS___NSArray);
  slideshowThemeSettings = self->_slideshowThemeSettings;
  self->_slideshowThemeSettings = v9;

  double v11 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  assetKeysToAssetPaths = self->_assetKeysToAssetPaths;
  self->_assetKeysToAssetPaths = v11;

  self->_int64_t slideshowStartIndex = 0LL;
  self->_displayThemeOptions = a4;
  double v13 = self->_themeParameters;
  self->_themeParameters = v6;
  v76 = v6;

  double v14 = -[TVPSlideshowUtilities initWithMarimbaMode:]( objc_alloc(&OBJC_CLASS___TVPSlideshowUtilities),  "initWithMarimbaMode:",  0LL);
  v77 = self;
  slideshowUtilites = self->_slideshowUtilites;
  self->_slideshowUtilites = v14;

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v72 = (void *)objc_claimAutoreleasedReturnValue( [v74 localizedStringForKey:@"SlideshowThemeRandom" value:&stru_1000CC6C8 table:0]);
  v79[0] = v72;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue( [v70 localizedStringForKey:@"SlideshowThemeCoverCascade" value:&stru_1000CC6C8 table:0]);
  v79[1] = v67;
  __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v63 = (void *)objc_claimAutoreleasedReturnValue( [v65 localizedStringForKey:@"SlideshowThemeFlipup" value:&stru_1000CC6C8 table:0]);
  v79[2] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v59 = (void *)objc_claimAutoreleasedReturnValue( [v61 localizedStringForKey:@"SlideshowThemeFloating" value:&stru_1000CC6C8 table:0]);
  v79[3] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue( [v57 localizedStringForKey:@"SlideshowThemeOrigami" value:&stru_1000CC6C8 table:0]);
  v79[4] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v51 = (void *)objc_claimAutoreleasedReturnValue( [v53 localizedStringForKey:@"SlideshowThemeReflections" value:&stru_1000CC6C8 table:0]);
  v79[5] = v51;
  double v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( [v49 localizedStringForKey:@"SlideshowThemeShiftingTiles" value:&stru_1000CC6C8 table:0]);
  v79[6] = v47;
  double v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v43 = (void *)objc_claimAutoreleasedReturnValue( [v45 localizedStringForKey:@"SlideshowThemeShrinkingTiles" value:&stru_1000CC6C8 table:0]);
  v79[7] = v43;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"SlideshowThemeSlidingPanels" value:&stru_1000CC6C8 table:0]);
  v79[8] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"SlideshowThemeSnapshots" value:&stru_1000CC6C8 table:0]);
  v79[9] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"SlideshowThemeKenBurns" value:&stru_1000CC6C8 table:0]);
  v79[10] = v21;
  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"SlideshowThemeClassic" value:&stru_1000CC6C8 table:0]);
  v79[11] = v23;
  uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 12LL));
  id v25 = v77->_slideshowThemeSettings;
  v77->_slideshowThemeSettings = (NSArray *)v24;

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v73 = (void *)objc_claimAutoreleasedReturnValue( [v75 localizedStringForKey:@"SlideshowTransitionRandom" value:&stru_1000CC6C8 table:0]);
  v78[0] = v73;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v69 = (void *)objc_claimAutoreleasedReturnValue( [v71 localizedStringForKey:@"SlideshowTransitionCube" value:&stru_1000CC6C8 table:0]);
  v78[1] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v66 = (void *)objc_claimAutoreleasedReturnValue( [v68 localizedStringForKey:@"SlideshowTransitionDissolve" value:&stru_1000CC6C8 table:0]);
  v78[2] = v66;
  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue( [v64 localizedStringForKey:@"SlideshowTransitionDroplet" value:&stru_1000CC6C8 table:0]);
  v78[3] = v62;
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( [v60 localizedStringForKey:@"SlideshowTransitionFadeBlack" value:&stru_1000CC6C8 table:0]);
  v78[4] = v58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v54 = (void *)objc_claimAutoreleasedReturnValue( [v56 localizedStringForKey:@"SlideshowTransitionFadeWhite" value:&stru_1000CC6C8 table:0]);
  v78[5] = v54;
  double v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v50 = (void *)objc_claimAutoreleasedReturnValue( [v52 localizedStringForKey:@"SlideshowTransitionFlip" value:&stru_1000CC6C8 table:0]);
  v78[6] = v50;
  id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v46 = (void *)objc_claimAutoreleasedReturnValue( [v48 localizedStringForKey:@"SlideshowTransitionMoveIn" value:&stru_1000CC6C8 table:0]);
  v78[7] = v46;
  double v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue( [v44 localizedStringForKey:@"SlideshowTransitionPageFlip" value:&stru_1000CC6C8 table:0]);
  v78[8] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue( [v41 localizedStringForKey:@"SlideshowTransitionPush" value:&stru_1000CC6C8 table:0]);
  v78[9] = v26;
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"SlideshowTransitionReveal" value:&stru_1000CC6C8 table:0]);
  v78[10] = v28;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"SlideshowTransitionMosaicFlip" value:&stru_1000CC6C8 table:0]);
  v78[11] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue( [v31 localizedStringForKey:@"SlideshowTransitionTwirl" value:&stru_1000CC6C8 table:0]);
  v78[12] = v32;
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"SlideshowTransitionWipe" value:&stru_1000CC6C8 table:0]);
  v78[13] = v34;
  uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 14LL));
  slideshowTransitionSettings = v77->_slideshowTransitionSettings;
  v77->_slideshowTransitionSettings = (NSArray *)v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v37 addObserver:v77 selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v39 addObserver:v77 selector:"_applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:v40];
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)displaysTransitionStyleOptions
{
  return self->_displaysTransitionStyleOptions;
}

- (void)setDisplaysTransitionStyleOptions:(BOOL)a3
{
  self->_displaysTransitionStyleOptions = a3;
}

- (int64_t)slideshowStartIndex
{
  return self->_slideshowStartIndex;
}

- (void)setSlideshowStartIndex:(int64_t)a3
{
  self->_int64_t slideshowStartIndex = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (TVPMarimbaView)marimbaView
{
  return self->_marimbaView;
}

- (void)setMarimbaView:(id)a3
{
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
}

- (UITableView)slideshowOptionsView
{
  return self->_slideshowOptionsView;
}

- (void)setSlideshowOptionsView:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIActivityIndicatorView)preloadSpinnerView
{
  return self->_preloadSpinnerView;
}

- (void)setPreloadSpinnerView:(id)a3
{
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (void)setPlayPauseGestureRecognizer:(id)a3
{
}

- (void)setLeftButtonRecognizer:(id)a3
{
}

- (void)setRightButtonRecognizer:(id)a3
{
}

- (OS_dispatch_source)assetsRefreshTimer
{
  return self->_assetsRefreshTimer;
}

- (void)setAssetsRefreshTimer:(id)a3
{
}

- (NSArray)photoAssets
{
  return self->_photoAssets;
}

- (void)setPhotoAssets:(id)a3
{
}

- (PXDisplayAssetCountsByPlaybackStyle)assetCountsByPlaybackStyle
{
  return self->_assetCountsByPlaybackStyle;
}

- (void)setAssetCountsByPlaybackStyle:(id)a3
{
}

- (NSArray)slideshowThemeSettings
{
  return self->_slideshowThemeSettings;
}

- (void)setSlideshowThemeSettings:(id)a3
{
}

- (NSArray)slideshowTransitionSettings
{
  return self->_slideshowTransitionSettings;
}

- (void)setSlideshowTransitionSettings:(id)a3
{
}

- (NSDictionary)assetKeysToAssetPaths
{
  return self->_assetKeysToAssetPaths;
}

- (void)setAssetKeysToAssetPaths:(id)a3
{
}

- (NSDictionary)themeParameters
{
  return self->_themeParameters;
}

- (void)setThemeParameters:(id)a3
{
}

- (NSString)focusedThemeForPreview
{
  return self->_focusedThemeForPreview;
}

- (void)setFocusedThemeForPreview:(id)a3
{
}

- (TVPSlideshowUtilities)slideshowUtilites
{
  return self->_slideshowUtilites;
}

- (void)setSlideshowUtilites:(id)a3
{
}

- (int64_t)initialImagePrefetchCount
{
  return self->_initialImagePrefetchCount;
}

- (void)setInitialImagePrefetchCount:(int64_t)a3
{
  self->_initialImagePrefetchCount = a3;
}

- (int64_t)indexOfNextImageToPrefetch
{
  return self->_indexOfNextImageToPrefetch;
}

- (void)setIndexOfNextImageToPrefetch:(int64_t)a3
{
  self->_unint64_t indexOfNextImageToPrefetch = a3;
}

- (int64_t)minImageFetchPreloadGap
{
  return self->_minImageFetchPreloadGap;
}

- (void)setMinImageFetchPreloadGap:(int64_t)a3
{
  self->_minImageFetchPreloadGap = a3;
}

- (int64_t)maxImageBatchPreloadCount
{
  return self->_maxImageBatchPreloadCount;
}

- (void)setMaxImageBatchPreloadCount:(int64_t)a3
{
  self->_maxImageBatchPreloadCount = a3;
}

- (NSTimer)themeTimer
{
  return self->_themeTimer;
}

- (void)setThemeTimer:(id)a3
{
}

- (BOOL)displayThemeOptions
{
  return self->_displayThemeOptions;
}

- (void)setDisplayThemeOptions:(BOOL)a3
{
  self->_displayThemeOptions = a3;
}

- (BOOL)didPauseMarimbaRenderer
{
  return self->_didPauseMarimbaRenderer;
}

- (void)setDidPauseMarimbaRenderer:(BOOL)a3
{
  self->_didPauseMarimbaRenderer = a3;
}

- (BOOL)didStartSlideshow
{
  return self->_didStartSlideshow;
}

- (void)setDidStartSlideshow:(BOOL)a3
{
  self->_didStartSlideshow = a3;
}

- (BOOL)didReachSlideshowEnd
{
  return self->_didReachSlideshowEnd;
}

- (void)setDidReachSlideshowEnd:(BOOL)a3
{
  self->_didReachSlideshowEnd = a3;
}

- (NSString)slideshowStyle
{
  return self->_slideshowStyle;
}

- (void)setSlideshowStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end