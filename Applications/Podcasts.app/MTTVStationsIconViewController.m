@interface MTTVStationsIconViewController
- (UIImageView)iconImageView;
- (void)_updateColors;
- (void)setIconImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVStationsIconViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationsIconViewController;
  -[MTTVStationsIconViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"large_station_icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 imageWithRenderingMode:2]);

  v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);
  -[MTTVStationsIconViewController setIconImageView:](self, "setIconImageView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController iconImageView](self, "iconImageView"));
  [v6 addSubview:v7];

  -[MTTVStationsIconViewController _updateColors](self, "_updateColors");
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVStationsIconViewController;
  -[MTTVStationsIconViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4 * 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController parentViewController](self, "parentViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  [v7 bounds];
  double v9 = v8 * 0.5;

  double v10 = IMRoundToPixel(v5);
  double v11 = IMRoundToPixel(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v12, "setCenter:", v10, v11);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationsIconViewController;
  id v4 = a3;
  -[MTTVStationsIconViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVStationsIconViewController _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController iconImageView](self, "iconImageView"));
  id v4 = objc_msgSend(v3, "mt_isDarkBackground");

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[UIColor secondaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "secondaryTextColorForDarkBackground:",  v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsIconViewController iconImageView](self, "iconImageView"));
  [v5 setTintColor:v6];
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end