@interface TVMusicLyricsViewController
- (BOOL)_showLyrics:(id)a3 error:(id)a4;
- (BOOL)autoColorScheme;
- (BOOL)isViewVisible;
- (MPModelPlayEvent)PAFContainerData;
- (MPModelSong)song;
- (NSAttributedString)lyricsText;
- (NSData)PAFRecommendationData;
- (NSString)PAFFeatureName;
- (NSString)language;
- (NSString)songArtist;
- (NSString)songTitle;
- (TVMusicLyricsViewController)init;
- (TVMusicLyricsViewController)initWithDataSource:(id)a3;
- (TVMusicLyricsViewController)initWithDataSource:(id)a3 autoColorScheme:(BOOL)a4;
- (TVMusicLyricsViewDataSource)dataSource;
- (double)_lyricsFontSize;
- (id)_attributedStringFromLyricsInfo:(id)a3;
- (id)_boldLyricsFont;
- (id)_regularLyricsFont;
- (id)_textColor;
- (id)_titleColor;
- (id)preferredFocusEnvironments;
- (void)_handleTogglePlayPause;
- (void)_hideActivityIndicator;
- (void)_loadAndDisplayStoreLyrics;
- (void)_registerForTraitChanges;
- (void)_reportPAFEventForLyricsView;
- (void)_showActivityIndicator;
- (void)_showErrorAlertWithTitle:(id)a3 message:(id)a4;
- (void)_updateLyricsLabelFont;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)setAutoColorScheme:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLyricsText:(id)a3;
- (void)setPAFContainerData:(id)a3;
- (void)setPAFFeatureName:(id)a3;
- (void)setPAFRecommendationData:(id)a3;
- (void)setSong:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVMusicLyricsViewController

- (TVMusicLyricsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  v2 = -[TVMusicLyricsViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0LL, 0LL);
  v3 = v2;
  if (v2)
  {
    -[TVMusicLyricsViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 8LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];
    [v4 addObserver:v3 selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  }

  return v3;
}

- (TVMusicLyricsViewController)initWithDataSource:(id)a3 autoColorScheme:(BOOL)a4
{
  id v7 = a3;
  v8 = -[TVMusicLyricsViewController init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dataSource, a3);
    v9->_autoColorScheme = a4;
  }

  return v9;
}

- (TVMusicLyricsViewController)initWithDataSource:(id)a3
{
  return -[TVMusicLyricsViewController initWithDataSource:autoColorScheme:]( self,  "initWithDataSource:autoColorScheme:",  a3,  0LL);
}

- (void)applicationWillResignActive:(id)a3
{
  if (-[TVMusicLyricsViewController isViewVisible](self, "isViewVisible", a3)) {
    -[TVMusicLyricsViewController _reportPAFEventForLyricsView](self, "_reportPAFEventForLyricsView");
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  if (-[TVMusicLyricsViewController isViewVisible](self, "isViewVisible", a3)) {
    self->_startViewTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;

  objc_super v6 = -[_TVMusicLyricsScrollView initWithFrame:]( objc_alloc(&OBJC_CLASS____TVMusicLyricsScrollView),  "initWithFrame:",  0.0,  0.0,  700.0,  v5 + -226.0);
  lyricsScrollView = self->_lyricsScrollView;
  self->_lyricsScrollView = &v6->super;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView panGestureRecognizer](self->_lyricsScrollView, "panGestureRecognizer"));
  [v8 setAllowedTouchTypes:&off_100282048];

  -[UIScrollView setUserInteractionEnabled:](self->_lyricsScrollView, "setUserInteractionEnabled:", 1LL);
  -[UIScrollView setBounces:](self->_lyricsScrollView, "setBounces:", 1LL);
  v9 = objc_alloc(&OBJC_CLASS___UILabel);
  -[UIScrollView bounds](self->_lyricsScrollView, "bounds");
  v10 = -[UILabel initWithFrame:](v9, "initWithFrame:");
  lyricsLabel = self->_lyricsLabel;
  self->_lyricsLabel = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController _regularLyricsFont](self, "_regularLyricsFont"));
  -[UILabel setFont:](self->_lyricsLabel, "setFont:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController _textColor](self, "_textColor"));
  -[UILabel setTextColor:](self->_lyricsLabel, "setTextColor:", v13);

  -[UILabel setNumberOfLines:](self->_lyricsLabel, "setNumberOfLines:", 0LL);
  -[UIScrollView addSubview:](self->_lyricsScrollView, "addSubview:", self->_lyricsLabel);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_lyricsScrollView, "setContentInsetAdjustmentBehavior:", 2LL);
  -[UIScrollView setContentInset:](self->_lyricsScrollView, "setContentInset:", 42.0, 0.0, 0.0, 0.0);
  v14 = objc_opt_new(&OBJC_CLASS___UIView);
  gradientView = self->_gradientView;
  self->_gradientView = v14;

  v16 = objc_opt_new(&OBJC_CLASS___UIView);
  gradientMaskView = self->_gradientMaskView;
  self->_gradientMaskView = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer"));
  [v18 setLocations:&off_100282060];
  id v19 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 CGColor]);

  id v21 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 CGColor]);

  v29[0] = v22;
  v29[1] = v20;
  v29[2] = v20;
  v29[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL));
  [v18 setColors:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_gradientMaskView, "layer"));
  [v24 addSublayer:v18];

  -[UIView setMaskView:](self->_gradientView, "setMaskView:", self->_gradientMaskView);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
  [v25 addSubview:self->_gradientView];

  -[UIView addSubview:](self->_gradientView, "addSubview:", self->_lyricsScrollView);
  v26 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleTogglePlayPause");
  -[UITapGestureRecognizer setAllowedPressTypes:](v26, "setAllowedPressTypes:", &off_100282078);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
  [v27 addGestureRecognizer:v26];

  -[TVMusicLyricsViewController _registerForTraitChanges](self, "_registerForTraitChanges");
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  if (!self->_viewAppeared)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController dataSource](self, "dataSource"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryLyricsText]);

    if (v5)
    {
      objc_super v6 = objc_alloc(&OBJC_CLASS___NSAttributedString);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController dataSource](self, "dataSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryLyricsText]);
      v9 = -[NSAttributedString initWithString:](v6, "initWithString:", v8);

      -[TVMusicLyricsViewController _showLyrics:error:](self, "_showLyrics:error:", v9, 0LL);
    }

    else
    {
      -[TVMusicLyricsViewController _loadAndDisplayStoreLyrics](self, "_loadAndDisplayStoreLyrics");
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController lyricsText](self, "lyricsText"));

    if (!v10) {
      -[TVMusicLyricsViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_showActivityIndicator",  0LL,  1.0);
    }
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TVMusicLyricsViewController setViewVisible:](self, "setViewVisible:", 1LL);
  if (self->_startViewTime != 0.0) {
    self->_startViewTime = CFAbsoluteTimeGetCurrent();
  }
  self->_viewAppeared = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVMusicLyricsViewController _reportPAFEventForLyricsView](self, "_reportPAFEventForLyricsView");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[TVMusicLyricsViewController setViewVisible:](self, "setViewVisible:", 0LL);
}

- (void)_registerForTraitChanges
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___UITraitLegibilityWeight);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10 = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013058;
  v7[3] = &unk_1002693E0;
  objc_copyWeak(&v8, &location);
  id v6 =  -[TVMusicLyricsViewController registerForTraitChanges:withHandler:]( self,  "registerForTraitChanges:withHandler:",  v5,  v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (double)_lyricsFontSize
{
  return 32.0;
}

- (id)_boldLyricsFont
{
  return +[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:");
}

- (id)_regularLyricsFont
{
  return +[UIFont systemFontOfSize:weight:](&OBJC_CLASS___UIFont, "systemFontOfSize:weight:");
}

- (void)_updateLyricsLabelFont
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_lyricsLabel, "attributedText"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController _regularLyricsFont](self, "_regularLyricsFont"));
  -[UILabel setFont:](self->_lyricsLabel, "setFont:", v3);

  -[UILabel setAttributedText:](self->_lyricsLabel, "setAttributedText:", v4);
}

- (id)_titleColor
{
  if (-[TVMusicLyricsViewController autoColorScheme](self, "autoColorScheme")) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  return v2;
}

- (id)_textColor
{
  if (-[TVMusicLyricsViewController autoColorScheme](self, "autoColorScheme"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v2 = (void *)objc_claimAutoreleasedReturnValue([v3 colorWithAlphaComponent:0.6]);
  }

  return v2;
}

- (void)_showActivityIndicator
{
  if (!self->_spinnerView)
  {
    uint64_t v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
    spinnerView = self->_spinnerView;
    self->_spinnerView = v3;

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
    [v5 center];
    -[UIActivityIndicatorView setCenter:](self->_spinnerView, "setCenter:");

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
    [v6 addSubview:self->_spinnerView];

    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  }

- (void)_hideActivityIndicator
{
  spinnerView = self->_spinnerView;
  if (spinnerView)
  {
    -[UIActivityIndicatorView removeFromSuperview](spinnerView, "removeFromSuperview");
    id v4 = self->_spinnerView;
    self->_spinnerView = 0LL;
  }

- (id)_attributedStringFromLyricsInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
    id v6 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @"\n");
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 songwriters]);
    id v8 = [v7 count];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"WrittenBy" value:&stru_100279068 table:0]);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@": "]);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 songwriters]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVMLyricsUtilities songwritersStringWithPrefix:songwriters:]( &OBJC_CLASS___TVMLyricsUtilities,  "songwritersStringWithPrefix:songwriters:",  v11,  v12));

      if (v13)
      {
        v14 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v13);
        -[NSMutableAttributedString appendAttributedString:](v14, "appendAttributedString:", v6);
        -[NSMutableAttributedString appendAttributedString:](v14, "appendAttributedString:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController _boldLyricsFont](self, "_boldLyricsFont"));
        -[NSMutableAttributedString addAttribute:value:range:]( v14,  "addAttribute:value:range:",  NSFontAttributeName,  v15,  0,  [v11 length]);

        -[NSMutableAttributedString appendAttributedString:](v5, "appendAttributedString:", v14);
      }
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v31 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 lyricsLines]);
    id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lyricsText]);
          -[NSMutableAttributedString appendAttributedString:](v5, "appendAttributedString:", v22);

          -[NSMutableAttributedString appendAttributedString:](v5, "appendAttributedString:", v6);
          uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 nextLine]);
          if (v23)
          {
            v24 = (void *)v23;
            v25 = (void *)objc_claimAutoreleasedReturnValue([v21 nextLine]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 parentSection]);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v21 parentSection]);

            if (v26 != v27) {
              -[NSMutableAttributedString appendAttributedString:](v5, "appendAttributedString:", v6);
            }
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v18);
    }

    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](&OBJC_CLASS___NSParagraphStyle, "defaultParagraphStyle"));
    id v29 = [v28 mutableCopy];

    [v29 setLineSpacing:20.0];
    -[NSMutableAttributedString addAttribute:value:range:]( v5,  "addAttribute:value:range:",  NSParagraphStyleAttributeName,  v29,  0LL,  -[NSMutableAttributedString length](v5, "length"));

    id v4 = v31;
  }

  else
  {
    double v5 = 0LL;
  }

  return v5;
}

- (void)_loadAndDisplayStoreLyrics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController dataSource](self, "dataSource"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000136BC;
  v4[3] = &unk_100269458;
  v4[4] = self;
  [v3 getLyricsTTMLWithCompletion:v4];
}

- (BOOL)_showLyrics:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_showActivityIndicator",  0LL);
  -[TVMusicLyricsViewController _hideActivityIndicator](self, "_hideActivityIndicator");
  if (v7
    && +[TVMusicLyricsRequest isExplicitLyricsRestrictedError:]( &OBJC_CLASS___TVMusicLyricsRequest,  "isExplicitLyricsRestrictedError:",  v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ExplicitLyricsErrorTitle" value:&stru_100279068 table:0]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v11 = v10;
    v12 = @"ExplicitLyricsErrorMessage";
  }

  else
  {
    if ([v6 length])
    {
      -[TVMusicLyricsViewController setLyricsText:](self, "setLyricsText:", v6);
      -[UILabel setAttributedText:](self->_lyricsLabel, "setAttributedText:", v6);
      BOOL v13 = 1;
      -[UILabel _setTextAlignmentFollowsWritingDirection:]( self->_lyricsLabel,  "_setTextAlignmentFollowsWritingDirection:",  1LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
      [v14 setNeedsLayout];

      v15 = 0LL;
      v9 = 0LL;
      self->_startViewTime = CFAbsoluteTimeGetCurrent();
      goto LABEL_10;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"LyricsUnvailableErrorTitle" value:&stru_100279068 table:0]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v11 = v10;
    v12 = @"LyricsUnvailableErrorMessage";
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v12 value:&stru_100279068 table:0]);

  if (v9) {
    -[TVMusicLyricsViewController _showErrorAlertWithTitle:message:](self, "_showErrorAlertWithTitle:message:", v9, v15);
  }
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (NSString)songTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController dataSource](self, "dataSource"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 songTitle]);

  return (NSString *)v3;
}

- (NSString)songArtist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController dataSource](self, "dataSource"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 artistName]);

  return (NSString *)v3;
}

- (id)preferredFocusEnvironments
{
  lyricsScrollView = self->_lyricsScrollView;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &lyricsScrollView,  1LL));
}

- (void)viewWillLayoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___TVMusicLyricsViewController;
  -[TVMusicLyricsViewController viewWillLayoutSubviews](&v47, "viewWillLayoutSubviews");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_lyricsLabel, "text"));
  id v4 = [v3 length];

  if (v4)
  {
    -[UILabel sizeThatFits:](self->_lyricsLabel, "sizeThatFits:", 700.0, 0.0);
    double v6 = v5;
    double v8 = v7;
    -[UILabel setSize:](self->_lyricsLabel, "setSize:");
    -[UIScrollView setContentSize:](self->_lyricsScrollView, "setContentSize:", v6, v8 + 50.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    -[UIView setFrame:](self->_gradientView, "setFrame:", floor((v11 - v6) * 0.5), 226.0, v6, floor(v13 + -226.0));
    -[UIView bounds](self->_gradientView, "bounds");
    -[UIScrollView setFrame:](self->_lyricsScrollView, "setFrame:");
    -[UIView bounds](self->_gradientView, "bounds");
    -[UIView setFrame:](self->_gradientMaskView, "setFrame:");
    -[UIView bounds](self->_gradientView, "bounds");
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_gradientMaskView, "layer"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sublayers]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
    objc_msgSend(v24, "setFrame:", v15, v17, v19, v21);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController songTitle](self, "songTitle"));
    id v26 = [v25 length];

    songTitleLabel = self->_songTitleLabel;
    if (v26)
    {
      if (!songTitleLabel)
      {
        objc_super v28 = objc_alloc(&OBJC_CLASS___UILabel);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
        [v29 frame];
        v30 = -[UILabel initWithFrame:](v28, "initWithFrame:", 312.0, 158.0, CGRectGetWidth(v48) + -624.0, 0.0);
        id v31 = self->_songTitleLabel;
        self->_songTitleLabel = v30;

        -[UILabel setTextAlignment:](self->_songTitleLabel, "setTextAlignment:", 1LL);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
        -[UILabel setFont:](self->_songTitleLabel, "setFont:", v32);

        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController _titleColor](self, "_titleColor"));
        -[UILabel setTextColor:](self->_songTitleLabel, "setTextColor:", v33);

        -[UILabel setMarqueeEnabled:](self->_songTitleLabel, "setMarqueeEnabled:", 1LL);
        -[UILabel setMarqueeRunning:](self->_songTitleLabel, "setMarqueeRunning:", 1LL);
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController view](self, "view"));
        [v34 addSubview:self->_songTitleLabel];
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController songArtist](self, "songArtist"));
      id v36 = [v35 length];

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController songTitle](self, "songTitle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController songArtist](self, "songArtist"));
        v39 = (UILabel *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ — %@",  v37,  v38));
      }

      else
      {
        v39 = (UILabel *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController songTitle](self, "songTitle"));
      }

      -[UILabel setText:](self->_songTitleLabel, "setText:", v39);
      -[UILabel frame](self->_songTitleLabel, "frame");
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      -[UILabel sizeThatFits:](self->_songTitleLabel, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      -[UILabel setFrame:](self->_songTitleLabel, "setFrame:", v41, v43, v45, v46);
    }

    else
    {
      if (!songTitleLabel) {
        return;
      }
      -[UILabel removeFromSuperview](songTitleLabel, "removeFromSuperview");
      v39 = self->_songTitleLabel;
      self->_songTitleLabel = 0LL;
    }
  }

- (void)_showErrorAlertWithTitle:(id)a3 message:(id)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  a3,  a4,  1LL));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"MusicOK" value:&stru_100279068 table:0]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000141B4;
  v9[3] = &unk_100268EE0;
  v9[4] = self;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  0LL,  v9));
  [v5 addAction:v8];

  -[TVMusicLyricsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
}

- (void)_reportPAFEventForLyricsView
{
  if (self->_startViewTime <= 0.0) {
    return;
  }
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController song](self, "song"));
  if (!v3) {
    return;
  }
  id v4 = (void *)v3;
  unsigned int v5 = +[TVMusicAppDelegate isAppActive](&OBJC_CLASS___TVMusicAppDelegate, "isAppActive");

  if (!v5) {
    return;
  }
  double v6 = CFAbsoluteTimeGetCurrent() - self->_startViewTime;
  id v7 = objc_alloc_init(&OBJC_CLASS___MPCReportingLyricsViewEvent);
  [v7 setDisplayType:0];
  [v7 setUserPreferenceSyllable:2];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController language](self, "language"));
  [v7 setLanguage:v8];

  [v7 setVisibleDuration:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController song](self, "song"));
  [v7 setModelSong:v9];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController PAFFeatureName](self, "PAFFeatureName"));
  if (v10)
  {

LABEL_8:
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController PAFFeatureName](self, "PAFFeatureName"));
    [v7 setFeatureName:v11];
    goto LABEL_9;
  }

  if (!+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI")) {
    goto LABEL_8;
  }
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 featureNameForCurrentTab]);
  [v7 setFeatureName:v12];

LABEL_9:
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController PAFRecommendationData](self, "PAFRecommendationData"));
  [v7 setRecommendationData:v13];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController PAFContainerData](self, "PAFContainerData"));
  [v7 setModelPlayEvent:v14];

  if (qword_1002BE780 != -1) {
    dispatch_once(&qword_1002BE780, &stru_100269478);
  }
  double v15 = (void *)qword_1002BE788;
  if (os_log_type_enabled((os_log_t)qword_1002BE788, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = v15;
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLyricsViewController song](self, "song"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 title]);
    int v21 = 138412546;
    v22 = v18;
    __int16 v23 = 2048;
    double v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Reporting Static Lyrics PAF event for song %@, duration = %g sec",  (uint8_t *)&v21,  0x16u);
  }

  double v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lyricsReportingController]);
  [v20 recordLyricsViewEvent:v7];
}

- (void)_handleTogglePlayPause
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  [v2 togglePlayPause];
}

- (NSString)PAFFeatureName
{
  return self->_PAFFeatureName;
}

- (void)setPAFFeatureName:(id)a3
{
}

- (NSData)PAFRecommendationData
{
  return self->_PAFRecommendationData;
}

- (void)setPAFRecommendationData:(id)a3
{
}

- (MPModelPlayEvent)PAFContainerData
{
  return self->_PAFContainerData;
}

- (void)setPAFContainerData:(id)a3
{
}

- (NSAttributedString)lyricsText
{
  return self->_lyricsText;
}

- (void)setLyricsText:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
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

- (TVMusicLyricsViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MPModelSong)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
}

- (BOOL)autoColorScheme
{
  return self->_autoColorScheme;
}

- (void)setAutoColorScheme:(BOOL)a3
{
  self->_autoColorScheme = a3;
}

- (void).cxx_destruct
{
}

@end