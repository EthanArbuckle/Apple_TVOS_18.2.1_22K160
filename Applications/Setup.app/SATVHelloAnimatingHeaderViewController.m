@interface SATVHelloAnimatingHeaderViewController
- (BOOL)isAnimationRunning;
- (NSArray)languageCodes;
- (NSArray)subtitleStrings;
- (NSTimer)timer;
- (SATVHelloAnimatingHeaderViewController)init;
- (SATVHelloAnimatingHeaderViewControllerDelegate)delegate;
- (TVSKLabel)subtitleLabel;
- (UICursiveTextView)cursiveTextView;
- (double)animationStartTime;
- (unint64_t)currentLanguageIndex;
- (unint64_t)currentSubtitleIndex;
- (void)_animate;
- (void)_animateNextLanguage;
- (void)setAnimationStartTime:(double)a3;
- (void)setCurrentLanguageIndex:(unint64_t)a3;
- (void)setCurrentSubtitleIndex:(unint64_t)a3;
- (void)setCursiveTextView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAnimationRunning:(BOOL)a3;
- (void)setLanguageCodes:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleStrings:(id)a3;
- (void)setTimer:(id)a3;
- (void)startAnimating;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVHelloAnimatingHeaderViewController

- (SATVHelloAnimatingHeaderViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVHelloAnimatingHeaderViewController;
  v2 = -[SATVHelloAnimatingHeaderViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 orderedGreetingLanguageCodes]);
    languageCodes = v2->_languageCodes;
    v2->_languageCodes = (NSArray *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 orderedGreetingSubtitleStrings]);
    subtitleStrings = v2->_subtitleStrings;
    v2->_subtitleStrings = (NSArray *)v7;

    id v9 = -[NSArray count](v2->_languageCodes, "count");
    if (v9 != (id)-[NSArray count](v2->_subtitleStrings, "count")) {
      sub_10007893C();
    }
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___SATVHelloAnimatingHeaderViewController;
  -[SATVHelloAnimatingHeaderViewController viewWillAppear:](&v46, "viewWillAppear:", a3);
  uint64_t v4 = objc_alloc(&OBJC_CLASS___UICursiveTextView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  [v5 frame];
  v6 = -[UICursiveTextView initWithFrame:](v4, "initWithFrame:");
  cursiveTextView = self->_cursiveTextView;
  self->_cursiveTextView = v6;

  v8 = self->_cursiveTextView;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
  -[UICursiveTextView setFillColor:](v8, "setFillColor:", v9);

  -[UICursiveTextView setTranslatesAutoresizingMaskIntoConstraints:]( self->_cursiveTextView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  [v10 addSubview:self->_cursiveTextView];

  objc_super v11 = objc_alloc_init(&OBJC_CLASS___TVSKLabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v11;

  v13 = self->_subtitleLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
  -[TVSKLabel setFont:](v13, "setFont:", v14);

  v15 = self->_subtitleLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
  -[TVSKLabel setTextColor:](v15, "setTextColor:", v16);

  v17 = self->_subtitleLabel;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVSKLabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[TVSKLabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0LL);
  -[TVSKLabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 0LL);
  -[TVSKLabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1LL);
  -[TVSKLabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  [v19 addSubview:self->_subtitleLabel];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  [v20 bounds];
  double v22 = v21 * 0.175;

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UICursiveTextView centerXAnchor](self->_cursiveTextView, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 centerXAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43]);
  v47[0] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UICursiveTextView centerYAnchor](self->_cursiveTextView, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 centerYAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v39 constant:-35.0]);
  v47[1] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UICursiveTextView heightAnchor](self->_cursiveTextView, "heightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToConstant:v22]);
  v47[2] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel topAnchor](self->_subtitleLabel, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController cursiveTextView](self, "cursiveTextView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 bottomAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33 constant:40.0]);
  v47[3] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel widthAnchor](self->_subtitleLabel, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 widthAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v24]);
  v47[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKLabel centerXAnchor](self->_subtitleLabel, "centerXAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 centerXAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v28]);
  v47[5] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 6LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v30);

  -[UICursiveTextView setAlpha:](self->_cursiveTextView, "setAlpha:", 0.0);
  -[TVSKLabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVHelloAnimatingHeaderViewController;
  -[SATVHelloAnimatingHeaderViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  self->_isAnimationRunning = 0;
  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0LL;
}

- (void)startAnimating
{
  objc_super v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  uint64_t v7 = sub_10005C08C;
  v8 = &unk_1000CAD88;
  objc_copyWeak(&v9, &location);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v5,  0.0166666667));
  timer = self->_timer;
  self->_timer = v3;

  -[SATVHelloAnimatingHeaderViewController _animateNextLanguage](self, "_animateNextLanguage", v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_animateNextLanguage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizations]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_languageCodes,  "objectAtIndexedSubscript:",  self->_currentLanguageIndex));
  v17 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v4,  v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 URLForResource:@"CursiveHello" withExtension:@"plist" subdirectory:0 localization:v8]);

  -[UICursiveTextView loadText:pointSize:](self->_cursiveTextView, "loadText:pointSize:", v10, 250.0);
  unint64_t v11 = self->_currentLanguageIndex + 1;
  self->_currentLanguageIndex = v11 % -[NSArray count](self->_languageCodes, "count");
  subtitleLabel = self->_subtitleLabel;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_subtitleStrings,  "objectAtIndexedSubscript:",  self->_currentSubtitleIndex));
  -[TVSKLabel setText:](subtitleLabel, "setText:", v13);

  unint64_t v14 = self->_currentSubtitleIndex + 1;
  self->_currentSubtitleIndex = v14 % -[NSArray count](self->_subtitleStrings, "count");
  if (v10)
  {
    self->_animationStartTime = CFAbsoluteTimeGetCurrent();
    self->_isAnimationRunning = 1;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005C338;
    v16[3] = &unk_1000C9468;
    v16[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v16, 0.5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained helloAnimatingHeaderViewController:self didBeginAnimatingLanguageCode:v8];
  }

  else
  {
    -[SATVHelloAnimatingHeaderViewController _animateNextLanguage](self, "_animateNextLanguage");
  }
}

- (void)_animate
{
  if (self->_isAnimationRunning)
  {
    CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - self->_animationStartTime;
    float v4 = v3;
    *(float *)&CFAbsoluteTime v3 = v4;
    -[UICursiveTextView setTime:](self->_cursiveTextView, "setTime:", v3);
    double v5 = v4;
    -[UICursiveTextView duration](self->_cursiveTextView, "duration");
    if (v6 * 0.5 <= v5)
    {
      -[TVSKLabel alpha](self->_subtitleLabel, "alpha");
      if (v7 == 0.0)
      {
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10005C4C8;
        v11[3] = &unk_1000C9468;
        v11[4] = self;
        +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v11, 0.5);
      }
    }

    double v8 = 5.0;
    if (self->_currentLanguageIndex == 1) {
      double v8 = 10.0;
    }
    if (v8 <= v5)
    {
      self->_isAnimationRunning = 0;
      v9[4] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10005C4E0;
      v10[3] = &unk_1000C9468;
      v10[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10005C528;
      v9[3] = &unk_1000C9490;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v10,  v9,  1.0);
    }
  }

- (SATVHelloAnimatingHeaderViewControllerDelegate)delegate
{
  return (SATVHelloAnimatingHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UICursiveTextView)cursiveTextView
{
  return self->_cursiveTextView;
}

- (void)setCursiveTextView:(id)a3
{
}

- (TVSKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (void)setLanguageCodes:(id)a3
{
}

- (NSArray)subtitleStrings
{
  return self->_subtitleStrings;
}

- (void)setSubtitleStrings:(id)a3
{
}

- (unint64_t)currentLanguageIndex
{
  return self->_currentLanguageIndex;
}

- (void)setCurrentLanguageIndex:(unint64_t)a3
{
  self->_currentLanguageIndex = a3;
}

- (unint64_t)currentSubtitleIndex
{
  return self->_currentSubtitleIndex;
}

- (void)setCurrentSubtitleIndex:(unint64_t)a3
{
  self->_currentSubtitleIndex = a3;
}

- (double)animationStartTime
{
  return self->_animationStartTime;
}

- (void)setAnimationStartTime:(double)a3
{
  self->_animationStartTime = a3;
}

- (BOOL)isAnimationRunning
{
  return self->_isAnimationRunning;
}

- (void)setIsAnimationRunning:(BOOL)a3
{
  self->_isAnimationRunning = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end