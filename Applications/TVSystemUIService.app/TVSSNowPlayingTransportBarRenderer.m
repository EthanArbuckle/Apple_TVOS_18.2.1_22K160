@interface TVSSNowPlayingTransportBarRenderer
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (NSLayoutConstraint)progressWidthConstraint;
- (TVSSDurationTimeFormatter)durationFormatter;
- (TVSSNowPlayingTransportBar)transportBar;
- (TVSSNowPlayingTransportBarRenderer)initWithIdentifier:(id)a3 formatProvider:(id)a4 content:(id)a5 overrideStylings:(id)a6;
- (TVSUIGradientView)gradientTrackView;
- (UILabel)elapsedTimeLabel;
- (UILabel)liveLabel;
- (UILabel)remainingTimeLabel;
- (UIView)backgroundTrackView;
- (UIView)progressTrackView;
- (void)_updateEffectForTraitEnvironment:(id)a3;
- (void)_updateValues;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)configureContentView:(id)a3;
@end

@implementation TVSSNowPlayingTransportBarRenderer

- (TVSSNowPlayingTransportBarRenderer)initWithIdentifier:(id)a3 formatProvider:(id)a4 content:(id)a5 overrideStylings:(id)a6
{
  v24 = self;
  SEL v23 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v20 = 0LL;
  objc_storeStrong(&v20, a5);
  id v19 = 0LL;
  objc_storeStrong(&v19, a6);
  v6 = v24;
  v24 = 0LL;
  v18.receiver = v6;
  v18.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBarRenderer;
  v17 = -[TVSSNowPlayingTransportBarRenderer initWithIdentifier:formatProvider:content:overrideStylings:]( &v18,  "initWithIdentifier:formatProvider:content:overrideStylings:",  location,  v21,  v20,  v19);
  v24 = v17;
  objc_storeStrong((id *)&v24, v17);
  if (v17)
  {
    id v13 = v20;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSSNowPlayingTransportBar);
    if (((objc_opt_isKindOfClass(v13, v7) ^ 1) & 1) != 0)
    {
      v12 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v12,  "handleFailureInMethod:object:file:lineNumber:description:",  v23,  v24,  @"TVSSNowPlayingTransportBarRenderer.m",  48LL,  @"Expecting TVSSNowPlayingTransportBar class");
    }

    objc_storeStrong((id *)&v24->_transportBar, v20);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSSDurationTimeFormatter);
    durationFormatter = v24->_durationFormatter;
    v24->_durationFormatter = v8;
  }

  v11 = v24;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  return v11;
}

- (void)configureContentView:(id)a3
{
  v110 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v108.receiver = v110;
  v108.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBarRenderer;
  -[TVSSNowPlayingTransportBarRenderer configureContentView:](&v108, "configureContentView:", location[0]);
  id v23 = location[0];
  uint64_t v113 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
  v24 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v113, 1LL);
  id v3 = objc_msgSend(v23, "registerForTraitChanges:withAction:");

  id v25 = [location[0] layer];
  [v25 setAllowsGroupBlending:0];

  +[TVSSConstants nowPlayingTransportBarHeight](&OBJC_CLASS___TVSSConstants, "nowPlayingTransportBarHeight");
  double v107 = v4;
  v5 = objc_alloc_init(&OBJC_CLASS___UIView);
  backgroundTrackView = v110->_backgroundTrackView;
  v110->_backgroundTrackView = v5;

  -[UIView _setCornerRadius:](v110->_backgroundTrackView, "_setCornerRadius:", v107 / 2.0);
  -[UIView setClipsToBounds:](v110->_backgroundTrackView, "setClipsToBounds:", 1LL);
  v26 = v110->_backgroundTrackView;
  v27 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001BB378);
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:");

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v110->_backgroundTrackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___UIView);
  progressTrackView = v110->_progressTrackView;
  v110->_progressTrackView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v110->_progressTrackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v28 = v110->_progressTrackView;
  id v29 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  -[UIView setBackgroundColor:](v28, "setBackgroundColor:");

  v30 = v110->_progressTrackView;
  v31 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001BB398);
  -[UIView setBackgroundColor:](v30, "setBackgroundColor:");

  -[UIView addSubview:](v110->_backgroundTrackView, "addSubview:", v110->_progressTrackView);
  v9 = objc_alloc_init(&OBJC_CLASS___TVSUIGradientView);
  gradientTrackView = v110->_gradientTrackView;
  v110->_gradientTrackView = v9;

  -[TVSUIGradientView _setCornerRadius:](v110->_gradientTrackView, "_setCornerRadius:", v107 / 2.0);
  id v37 = -[TVSUIGradientView gradientLayer](v110->_gradientTrackView, "gradientLayer");
  v36 = -[UIView backgroundColor](v110->_backgroundTrackView, "backgroundColor");
  v112[0] = -[UIColor CGColor](v36, "CGColor");
  v35 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  v112[1] = -[UIColor CGColor](v35, "CGColor");
  v34 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.0);
  v112[2] = -[UIColor CGColor](v34, "CGColor");
  v33 = -[UIView backgroundColor](v110->_backgroundTrackView, "backgroundColor");
  v112[3] = -[UIColor CGColor](v33, "CGColor");
  v32 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v112, 4LL);
  objc_msgSend(v37, "setColors:");

  id v38 = -[TVSUIGradientView gradientLayer](v110->_gradientTrackView, "gradientLayer");
  [v38 setLocations:&off_1001C87C8];

  id v39 = -[TVSUIGradientView gradientLayer](v110->_gradientTrackView, "gradientLayer");
  sub_10010BBE8();
  v106[3] = v11;
  v106[4] = v12;
  objc_msgSend(v39, "setStartPoint:", *(double *)&v11, *(double *)&v12);

  id v40 = -[TVSUIGradientView gradientLayer](v110->_gradientTrackView, "gradientLayer");
  sub_10010BBE8();
  v106[1] = v13;
  v106[2] = v14;
  objc_msgSend(v40, "setEndPoint:", *(double *)&v13, *(double *)&v14);

  -[TVSUIGradientView setTranslatesAutoresizingMaskIntoConstraints:]( v110->_gradientTrackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSUIGradientView setHidden:](v110->_gradientTrackView, "setHidden:", 1LL);
  v106[0] =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
  v15 = objc_alloc_init(&OBJC_CLASS___UILabel);
  elapsedTimeLabel = v110->_elapsedTimeLabel;
  v110->_elapsedTimeLabel = v15;

  v41 = v110->_elapsedTimeLabel;
  id v43 = +[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color");
  id v42 = objc_msgSend(v43, "tvsp_darkStyleColor");
  -[UILabel setTextColor:](v41, "setTextColor:");

  v44 = v110->_elapsedTimeLabel;
  id v45 = objc_msgSend(v106[0], "tvss_fontWithMonospacedNumbers");
  -[UILabel setFont:](v44, "setFont:");

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v110->_elapsedTimeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
  remainingTimeLabel = v110->_remainingTimeLabel;
  v110->_remainingTimeLabel = v17;

  v46 = v110->_remainingTimeLabel;
  v47 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001BB3B8);
  -[UILabel setTextColor:](v46, "setTextColor:");

  v48 = v110->_remainingTimeLabel;
  id v49 = objc_msgSend(v106[0], "tvss_fontWithMonospacedNumbers");
  -[UILabel setFont:](v48, "setFont:");

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v110->_remainingTimeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v19 = objc_alloc_init(&OBJC_CLASS___UILabel);
  liveLabel = v110->_liveLabel;
  v110->_liveLabel = v19;

  v50 = v110->_liveLabel;
  v52 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v51 =  -[NSBundle localizedStringForKey:value:table:]( v52,  "localizedStringForKey:value:table:",  @"TVSSNowPlayingLive",  &stru_1001BDAC8,  0LL);
  -[UILabel setText:](v50, "setText:");

  v53 = v110->_liveLabel;
  id v54 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  -[UILabel setTextColor:](v53, "setTextColor:");

  -[UILabel setFont:](v110->_liveLabel, "setFont:", v106[0]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v110->_liveLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UILabel setHidden:](v110->_liveLabel, "setHidden:", 1LL);
  [location[0] addSubview:v110->_backgroundTrackView];
  [location[0] addSubview:v110->_gradientTrackView];
  [location[0] addSubview:v110->_elapsedTimeLabel];
  [location[0] addSubview:v110->_remainingTimeLabel];
  [location[0] addSubview:v110->_liveLabel];
  v55 = -[UIView widthAnchor](v110->_progressTrackView, "widthAnchor");
  id v21 = -[NSLayoutDimension constraintEqualToConstant:](v55, "constraintEqualToConstant:", 0.0);
  progressWidthConstraint = v110->_progressWidthConstraint;
  v110->_progressWidthConstraint = v21;

  v105 = -[UIView topAnchor](v110->_backgroundTrackView, "topAnchor");
  id v104 = [location[0] topAnchor];
  id v103 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v105, "constraintEqualToAnchor:");
  v111[0] = v103;
  v102 = -[UIView leadingAnchor](v110->_backgroundTrackView, "leadingAnchor");
  id v101 = [location[0] leadingAnchor];
  id v100 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v102, "constraintEqualToAnchor:");
  v111[1] = v100;
  v99 = -[UIView trailingAnchor](v110->_backgroundTrackView, "trailingAnchor");
  id v98 = [location[0] trailingAnchor];
  id v97 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v99, "constraintEqualToAnchor:");
  v111[2] = v97;
  v96 = -[UIView heightAnchor](v110->_backgroundTrackView, "heightAnchor");
  v95 = -[NSLayoutDimension constraintEqualToConstant:](v96, "constraintEqualToConstant:", v107);
  v111[3] = v95;
  id v94 = -[TVSUIGradientView topAnchor](v110->_gradientTrackView, "topAnchor");
  id v93 = [location[0] topAnchor];
  id v92 = objc_msgSend(v94, "constraintEqualToAnchor:");
  v111[4] = v92;
  id v91 = -[TVSUIGradientView leadingAnchor](v110->_gradientTrackView, "leadingAnchor");
  id v90 = [location[0] leadingAnchor];
  id v89 = objc_msgSend(v91, "constraintEqualToAnchor:");
  v111[5] = v89;
  id v88 = -[TVSUIGradientView trailingAnchor](v110->_gradientTrackView, "trailingAnchor");
  id v87 = [location[0] trailingAnchor];
  id v86 = objc_msgSend(v88, "constraintEqualToAnchor:");
  v111[6] = v86;
  id v85 = -[TVSUIGradientView heightAnchor](v110->_gradientTrackView, "heightAnchor");
  id v84 = [v85 constraintEqualToConstant:v107];
  v111[7] = v84;
  v111[8] = v110->_progressWidthConstraint;
  v83 = -[UIView leftAnchor](v110->_progressTrackView, "leftAnchor");
  v82 = -[UIView leftAnchor](v110->_backgroundTrackView, "leftAnchor");
  id v81 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v83, "constraintEqualToAnchor:");
  v111[9] = v81;
  v80 = -[UIView topAnchor](v110->_progressTrackView, "topAnchor");
  v79 = -[UIView topAnchor](v110->_backgroundTrackView, "topAnchor");
  id v78 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v80, "constraintEqualToAnchor:");
  v111[10] = v78;
  v77 = -[UIView bottomAnchor](v110->_progressTrackView, "bottomAnchor");
  v76 = -[UIView bottomAnchor](v110->_backgroundTrackView, "bottomAnchor");
  id v75 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v77, "constraintEqualToAnchor:");
  v111[11] = v75;
  id v74 = -[UILabel leftAnchor](v110->_elapsedTimeLabel, "leftAnchor");
  id v73 = [location[0] leftAnchor];
  id v72 = objc_msgSend(v74, "constraintEqualToAnchor:");
  v111[12] = v72;
  id v71 = -[UILabel topAnchor](v110->_elapsedTimeLabel, "topAnchor");
  v70 = -[UIView bottomAnchor](v110->_backgroundTrackView, "bottomAnchor");
  id v69 = objc_msgSend(v71, "constraintEqualToAnchor:constant:");
  v111[13] = v69;
  id v68 = -[UILabel rightAnchor](v110->_remainingTimeLabel, "rightAnchor");
  id v67 = [location[0] rightAnchor];
  id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
  v111[14] = v66;
  id v65 = -[UILabel topAnchor](v110->_remainingTimeLabel, "topAnchor");
  v64 = -[UIView bottomAnchor](v110->_backgroundTrackView, "bottomAnchor");
  id v63 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", 3.0);
  v111[15] = v63;
  id v62 = -[UILabel centerXAnchor](v110->_liveLabel, "centerXAnchor");
  id v61 = -[TVSUIGradientView centerXAnchor](v110->_gradientTrackView, "centerXAnchor");
  id v60 = objc_msgSend(v62, "constraintEqualToAnchor:");
  v111[16] = v60;
  id v59 = -[UILabel centerYAnchor](v110->_liveLabel, "centerYAnchor");
  id v58 = -[TVSUIGradientView centerYAnchor](v110->_gradientTrackView, "centerYAnchor");
  id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
  v111[17] = v57;
  v56 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v111, 18LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSNowPlayingTransportBarRenderer _updateValues](v110, "_updateValues");
  -[TVSSNowPlayingTransportBarRenderer _updateEffectForTraitEnvironment:]( v110,  "_updateEffectForTraitEnvironment:",  location[0]);
  objc_storeStrong(v106, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBarRenderer;
  -[TVSSNowPlayingTransportBarRenderer applyContent:animator:](&v5, "applyContent:animator:", location[0], v6);
  -[TVSSNowPlayingTransportBarRenderer _updateValues](v8, "_updateValues");
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateValues
{
  double Width = CGRectGetWidth(v17);
  -[TVSSNowPlayingTransportBar percentComplete](self->_transportBar, "percentComplete");
  float v3 = v2;
  -[NSLayoutConstraint setConstant:](self->_progressWidthConstraint, "setConstant:", Width * v3);
  elapsedTimeLabel = self->_elapsedTimeLabel;
  durationFormatter = self->_durationFormatter;
  -[TVSSNowPlayingTransportBar timeElapsed](self->_transportBar, "timeElapsed");
  id v8 = -[TVSSDurationTimeFormatter stringForTimeInterval:](durationFormatter, "stringForTimeInterval:");
  -[UILabel setText:](elapsedTimeLabel, "setText:");

  remainingTimeLabel = self->_remainingTimeLabel;
  v9 = self->_durationFormatter;
  -[TVSSNowPlayingTransportBar timeRemaining](self->_transportBar, "timeRemaining");
  id v11 = -[TVSSDurationTimeFormatter stringForTimeInterval:](v9, "stringForTimeInterval:", -1.0 * v4);
  -[UILabel setText:](remainingTimeLabel, "setText:");

  v14 = -[TVSSNowPlayingTransportBar audioNowPlayingController](self->_transportBar, "audioNowPlayingController");
  id v13 = -[TVSSAudioNowPlayingController nowPlayingState](v14, "nowPlayingState");
  v12 = -[TVSSNowPlayingState currentMediaItem](v13, "currentMediaItem");
  unsigned __int8 v15 = -[TVSSNowPlayingMediaItem isLiveContent](v12, "isLiveContent");

  if ((v15 & 1) != 0)
  {
    -[UILabel setHidden:](self->_liveLabel, "setHidden:", 0LL);
    -[TVSUIGradientView setHidden:](self->_gradientTrackView, "setHidden:", 0LL);
    -[UIView setHidden:](self->_backgroundTrackView, "setHidden:", 1LL);
    -[UILabel setHidden:](self->_elapsedTimeLabel, "setHidden:", 1LL);
    -[UILabel setHidden:](self->_remainingTimeLabel, "setHidden:", 1LL);
  }

  else
  {
    -[UILabel setHidden:](self->_liveLabel, "setHidden:", 1LL);
    -[TVSUIGradientView setHidden:](self->_gradientTrackView, "setHidden:", 1LL);
    -[UIView setHidden:](self->_backgroundTrackView, "setHidden:", 0LL);
    -[UILabel setHidden:](self->_elapsedTimeLabel, "setHidden:", 0LL);
    -[UILabel setHidden:](self->_remainingTimeLabel, "setHidden:", 0LL);
  }

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (BOOL)isFocusable
{
  return 0;
}

- (void)_updateEffectForTraitEnvironment:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = [location[0] traitCollection];
  BOOL v12 = [v11 userInterfaceStyle] == (id)2;

  BOOL v14 = v12;
  if (v12) {
    uint64_t v10 = kCAFilterPlusL;
  }
  else {
    uint64_t v10 = kCAFilterPlusD;
  }
  id v13 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v10);
  id v8 = -[UIView layer](v16->_backgroundTrackView, "layer");
  -[CALayer setCompositingFilter:](v8, "setCompositingFilter:", v13);

  v9 = -[UIView layer](v16->_progressTrackView, "layer");
  if (v14) {
    uint64_t v7 = v13;
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[CALayer setCompositingFilter:](v9, "setCompositingFilter:", v7);

  id v3 = -[TVSUIGradientView layer](v16->_gradientTrackView, "layer");
  [v3 setCompositingFilter:v13];

  id v4 = -[UILabel layer](v16->_elapsedTimeLabel, "layer");
  [v4 setCompositingFilter:v13];

  id v5 = -[UILabel layer](v16->_remainingTimeLabel, "layer");
  [v5 setCompositingFilter:v13];

  id v6 = -[UILabel layer](v16->_liveLabel, "layer");
  [v6 setCompositingFilter:v13];

  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (UIView)backgroundTrackView
{
  return self->_backgroundTrackView;
}

- (UIView)progressTrackView
{
  return self->_progressTrackView;
}

- (TVSUIGradientView)gradientTrackView
{
  return self->_gradientTrackView;
}

- (NSLayoutConstraint)progressWidthConstraint
{
  return self->_progressWidthConstraint;
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (UILabel)liveLabel
{
  return self->_liveLabel;
}

- (TVSSNowPlayingTransportBar)transportBar
{
  return self->_transportBar;
}

- (TVSSDurationTimeFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void).cxx_destruct
{
}

@end