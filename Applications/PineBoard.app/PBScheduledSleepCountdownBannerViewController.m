@interface PBScheduledSleepCountdownBannerViewController
- (BOOL)providesHostedContent;
- (BSUICAPackageView)packageView;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (void)_updatePublishedObjects;
- (void)handleBannerActionEvent:(int64_t)a3;
- (void)setPackageView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PBScheduledSleepCountdownBannerViewController

- (void)viewDidLoad
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___PBScheduledSleepCountdownBannerViewController;
  -[PBScheduledSleepCountdownBannerViewController viewDidLoad](&v50, "viewDidLoad");
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSPBannerPillContentViewConfiguration);
  double height = CGSizeZero.height;
  TVSPBannerPillSizesMake(50.0, 50.0, CGSizeZero.width, height);
  TVSPBannerPillEdgeInsetsMake(objc_msgSend(v3, "setLeadingViewSizes:"), 10.0, 10.0, 0.0, 0.0);
  TVSPBannerPillEdgeInsetsMake(objc_msgSend(v3, "setLeadingViewEdgeInsets:"), 0.0, 10.0, 0.0, 0.0);
  TVSPBannerPillEdgeInsetsMake(objc_msgSend(v3, "setTrailingViewEdgeInsets:"), 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "setCenterContentEdgeInsets:");
  TVSPBannerPillSizesMake(60.0, 60.0, CGSizeZero.width, height);
  v48 = v3;
  objc_msgSend(v3, "setTrailingViewSizes:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"power"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v6));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithConfiguration:v7]);

  v8 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v49);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemMintColor](&OBJC_CLASS___UIColor, "systemMintColor"));
  v47 = v8;
  -[UIImageView setTintColor:](v8, "setTintColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController traitCollection](self, "traitCollection"));
  id v11 = [v10 userInterfaceStyle];

  v12 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  if (v11 == (id)2) {
    v13 = @"SleepTimer_20-01sec_Dark";
  }
  else {
    v13 = @"SleepTimer_20-01sec_Light";
  }
  v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = -[BSUICAPackageView initWithPackageName:inBundle:](v12, "initWithPackageName:inBundle:", v13, v15);

  -[BSUICAPackageView setState:](v16, "setState:", @"Start");
  v46 = v16;
  -[PBScheduledSleepCountdownBannerViewController setPackageView:](self, "setPackageView:", v16);
  -[PBScheduledSleepCountdownBannerViewController _updatePublishedObjects](self, "_updatePublishedObjects");
  id v17 = [[TVSPBannerPillContentView alloc] initWithConfiguration:v3 leadingView:v8 trailingView:v16];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = sub_1001C307C(@"ScheduledSleepCountdownTitle", 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v17 setTitle:v19];

  v20 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  id v21 = sub_1001C307C(@"ScheduledSleepCountdownSubtitle", 0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v22,  TVSPBannerButtonImagePlaceholderTVButton));
  v45 = -[NSAttributedString initWithString:](v20, "initWithString:", v23);

  uint64_t v24 = TVSPBannerSubtitleReplacingButtonImagePlaceholdersInAttributedString(v45);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v17 setAttributedSubtitle:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController view](self, "view"));
  [v26 addSubview:v17];

  [v17 layoutIfNeeded];
  [v17 frame];
  -[PBScheduledSleepCountdownBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v27, 80.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v17 leadingAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 leadingAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v42]);
  v51[0] = v41;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v17 trailingAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v40 trailingAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v38]);
  v51[1] = v37;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v17 topAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 topAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v30]);
  v51[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v17 bottomAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 bottomAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v34]);
  v51[3] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v36);
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBScheduledSleepCountdownBannerViewController;
  -[PBScheduledSleepCountdownBannerViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedScheduledSleepManager]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100099B0C;
  v6[3] = &unk_1003D47B0;
  v6[4] = self;
  [v5 getCurrentScheduledSleepWithCompletion:v6];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBScheduledSleepCountdownBannerViewController;
  -[PBScheduledSleepCountdownBannerViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v4 = [v3 userInterfaceLayoutDirection] == (id)1;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController traitOverrides](self, "traitOverrides"));
  [v5 setLayoutDirection:v4];
}

- (NSString)requestIdentifier
{
  return (NSString *)@"CountdownTimerBanner";
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.PineBoard";
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void)handleBannerActionEvent:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedScheduledSleepManager]);
    [v4 cancelScheduledSleepRequestWithReason:@"Countdown Banner" completion:0];
  }

- (void)_updatePublishedObjects
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v19 = v3;
  -[NSNumberFormatter setLocale:](v3, "setLocale:", v4);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController packageView](self, "packageView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 publishedObjectNames]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBScheduledSleepCountdownBannerViewController packageView](self, "packageView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 publishedObjectWithName:v11]);

        uint64_t v14 = objc_opt_class(&OBJC_CLASS___CATextLayer);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          id v15 = v13;
          [v15 fontSize];
          objc_msgSend(v15, "setFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v11 intValue]));
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v19, "stringFromNumber:", v16));
          [v15 setString:v17];

          id v18 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
          objc_msgSend(v15, "setForegroundColor:", objc_msgSend(v18, "CGColor"));
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }
}

- (BSUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end