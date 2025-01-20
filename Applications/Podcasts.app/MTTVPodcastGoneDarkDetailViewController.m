@interface MTTVPodcastGoneDarkDetailViewController
- (MTAllPropertyChangesQueryObserver)darkObserver;
- (MTTVPodcastGoneDarkDetailViewController)initWithPodcast:(id)a3;
- (NSString)darkReason;
- (UILabel)reasonLabel;
- (void)_updateColors;
- (void)loadView;
- (void)setDarkObserver:(id)a3;
- (void)setDarkReason:(id)a3;
- (void)setPodcast:(id)a3;
- (void)setReasonLabel:(id)a3;
- (void)updateDarkReason;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVPodcastGoneDarkDetailViewController

- (MTTVPodcastGoneDarkDetailViewController)initWithPodcast:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  return -[MTTVPodcastEpisodePlaceholderViewController initWithPodcast:](&v4, "initWithPodcast:", a3);
}

- (void)setPodcast:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  id v4 = a3;
  -[MTTVPodcastEpisodePlaceholderViewController setPodcast:](&v8, "setPodcast:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid", v8.receiver, v8.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUUID:](&OBJC_CLASS___MTPodcast, "predicateForPodcastUUID:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController darkObserver](self, "darkObserver"));
  [v7 setPredicate:v6];
}

- (void)_updateColors
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  -[MTTVPodcastEpisodePlaceholderViewController _updateColors](&v5, "_updateColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  -[MTTVPodcastEpisodePlaceholderViewController _isDarkBackground](self, "_isDarkBackground")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
  [v4 setTextColor:v3];
}

- (void)updateDarkReason
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController podcast](self, "podcast"));
  unsigned int v4 = [v3 isAuthenticatedDark];

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (id)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TV_GONE_DARK_AUTHENTICATION" value:&stru_100248948 table:0]);
  }

  else
  {
    id v6 = 0LL;
  }

  -[MTTVPodcastGoneDarkDetailViewController setDarkReason:](self, "setDarkReason:", v6);
}

- (void)setDarkReason:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_darkReason, a3);
  if (-[MTTVPodcastGoneDarkDetailViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
    [v5 setText:v7];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController view](self, "view"));
    [v6 setNeedsLayout];
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  -[MTTVPodcastEpisodePlaceholderViewController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController view](self, "view"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
  [v3 addSubview:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  -[MTTVPodcastEpisodePlaceholderViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController darkObserver](self, "darkObserver"));
  [v3 startObserving];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController;
  -[MTTVPodcastGoneDarkDetailViewController viewWillLayoutSubviews](&v21, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController imageView](self, "imageView"));
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
  objc_msgSend(v12, "sizeThatFits:", 640.0, 1.79769313e308);
  double v14 = v13;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  CGFloat v15 = CGRectGetMaxY(v22) + 36.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 font]);
  objc_msgSend(v17, "mt_offsetFromCapHeightToAscent");
  CGFloat v19 = v15 - v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController reasonLabel](self, "reasonLabel"));
  objc_msgSend(v20, "setFrame:", 64.0, v19, 640.0, v14);
}

- (UILabel)reasonLabel
{
  reasonLabel = self->_reasonLabel;
  if (!reasonLabel)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    CGFloat v5 = self->_reasonLabel;
    self->_reasonLabel = v4;

    -[UILabel setNumberOfLines:](self->_reasonLabel, "setNumberOfLines:", 0LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](self->_reasonLabel, "setFont:", v6);

    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastGoneDarkDetailViewController darkReason](self, "darkReason"));
    -[UILabel setText:](self->_reasonLabel, "setText:", v7);

    reasonLabel = self->_reasonLabel;
  }

  return reasonLabel;
}

- (MTAllPropertyChangesQueryObserver)darkObserver
{
  darkObserver = self->_darkObserver;
  if (!darkObserver)
  {
    objc_initWeak(&location, self);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController podcast](self, "podcast"));
    CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUUID:](&OBJC_CLASS___MTPodcast, "predicateForPodcastUUID:", v5));

    CGFloat v7 = objc_alloc(&OBJC_CLASS___MTAllPropertyChangesQueryObserver);
    double v8 = -[MTAllPropertyChangesQueryObserver initWithEntityName:predicate:]( v7,  "initWithEntityName:predicate:",  kMTPodcastEntityName,  v6);
    CGFloat v9 = self->_darkObserver;
    self->_darkObserver = v8;

    double v10 = self->_darkObserver;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000E31BC;
    v13[3] = &unk_100240440;
    objc_copyWeak(&v14, &location);
    id v11 = -[MTAllPropertyChangesQueryObserver addResultsChangedHandler:](v10, "addResultsChangedHandler:", v13);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
    darkObserver = self->_darkObserver;
  }

  return darkObserver;
}

- (void)setReasonLabel:(id)a3
{
}

- (NSString)darkReason
{
  return self->_darkReason;
}

- (void)setDarkObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end