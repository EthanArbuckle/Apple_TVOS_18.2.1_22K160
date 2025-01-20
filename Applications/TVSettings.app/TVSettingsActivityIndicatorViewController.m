@interface TVSettingsActivityIndicatorViewController
- (BOOL)isActivityIndicatorHidden;
- (NSString)activityText;
- (TVSettingsActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)activityIndicatorDelay;
- (void)dealloc;
- (void)loadView;
- (void)setActivityIndicatorDelay:(double)a3;
- (void)setActivityIndicatorHidden:(BOOL)a3;
- (void)setActivityText:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsActivityIndicatorViewController

- (TVSettingsActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsActivityIndicatorViewController;
  result = -[TVSettingsActivityIndicatorViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
  if (result) {
    result->_activityIndicatorDelay = 1.0;
  }
  return result;
}

- (void)dealloc
{
  spinnerTimer = self->_spinnerTimer;
  if (spinnerTimer)
  {
    dispatch_source_cancel((dispatch_source_t)spinnerTimer);
    v4 = self->_spinnerTimer;
    self->_spinnerTimer = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsActivityIndicatorViewController;
  -[TVSettingsActivityIndicatorViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  v15 = -[UIView initWithFrame:](v3, "initWithFrame:");

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v5);

  -[TVSettingsActivityIndicatorViewController setView:](self, "setView:", v15);
  v6 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 1000LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v8));

  v10 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v9);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v10;

  -[UIVisualEffectView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18LL);
  v12 = self->_visualEffectView;
  -[UIView bounds](v15, "bounds");
  -[UIVisualEffectView setFrame:](v12, "setFrame:");
  -[UIView addSubview:](v15, "addSubview:", self->_visualEffectView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
  [v13 addSubview:self->_spinnerView];

  if (self->_activityTextLabel)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
    [v14 addSubview:self->_activityTextLabel];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsActivityIndicatorViewController;
  -[TVSettingsActivityIndicatorViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  if (!self->_spinnerTimer)
  {
    if (!self->_activityIndicatorHidden)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
      spinnerTimer = self->_spinnerTimer;
      self->_spinnerTimer = v4;

      v6 = self->_spinnerTimer;
      dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(self->_activityIndicatorDelay * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      objc_initWeak(&location, self);
      v8 = self->_spinnerTimer;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000B2650;
      v9[3] = &unk_10018E810;
      objc_copyWeak(&v10, &location);
      dispatch_source_set_event_handler((dispatch_source_t)v8, v9);
      dispatch_resume((dispatch_object_t)self->_spinnerTimer);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      return;
    }

- (void)viewDidLayoutSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = +[UIActivityIndicatorView defaultSizeForStyle:]( &OBJC_CLASS___UIActivityIndicatorView,  "defaultSizeForStyle:",  20LL);
  UIRectCenteredIntegralRect(v12, CGPointZero.x, CGPointZero.y, v13, v14, v5, v7, v9, v11);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:");
  if (self->_activityTextLabel)
  {
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    double v15 = CGRectGetWidth(v23) + -200.0;
    -[UILabel sizeThatFits:](self->_activityTextLabel, "sizeThatFits:", v15, 0.0);
    double v17 = v16;
    double v19 = v18;
    -[UIActivityIndicatorView frame](self->_spinnerView, "frame");
    v20.n128_f64[0] = CGRectGetMinY(v24) - v19 + -10.0;
    if (v17 >= v15) {
      v21.n128_f64[0] = v15;
    }
    else {
      v21.n128_f64[0] = v17;
    }
    activityTextLabel = self->_activityTextLabel;
    UIRectCenteredXInRect(100.0, v20, v21, v19, v5, v7, v9, v11);
    -[UILabel setFrame:](activityTextLabel, "setFrame:");
  }

- (void)setActivityText:(id)a3
{
  id v18 = a3;
  unsigned __int8 v4 = -[NSString isEqualToString:](self->_activityText, "isEqualToString:", v18);
  double v5 = v18;
  if ((v4 & 1) == 0)
  {
    double v6 = (NSString *)[v18 copy];
    activityText = self->_activityText;
    self->_activityText = v6;

    NSUInteger v8 = -[NSString length](self->_activityText, "length");
    activityTextLabel = self->_activityTextLabel;
    if (v8)
    {
      if (!activityTextLabel)
      {
        double v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
        double v11 = self->_activityTextLabel;
        self->_activityTextLabel = v10;

        -[UILabel setOpaque:](self->_activityTextLabel, "setOpaque:", 0LL);
        -[UILabel setBackgroundColor:](self->_activityTextLabel, "setBackgroundColor:", 0LL);
        id v12 = self->_activityTextLabel;
        double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
        -[UILabel setFont:](v12, "setFont:", v13);

        -[UILabel setTextAlignment:](self->_activityTextLabel, "setTextAlignment:", 1LL);
        -[UILabel setNumberOfLines:](self->_activityTextLabel, "setNumberOfLines:", 0LL);
        double v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
        [v14 addSubview:self->_activityTextLabel];

        activityTextLabel = self->_activityTextLabel;
      }

      -[UILabel setText:](activityTextLabel, "setText:", self->_activityText);
      -[UILabel sizeToFit](self->_activityTextLabel, "sizeToFit");
      BOOL v15 = !self->_activityIndicatorHidden && !self->_showingSpinner;
      -[UILabel setHidden:](self->_activityTextLabel, "setHidden:", v15);
      goto LABEL_11;
    }

    double v5 = v18;
    if (activityTextLabel)
    {
      -[UILabel removeFromSuperview](activityTextLabel, "removeFromSuperview");
      double v16 = self->_activityTextLabel;
      self->_activityTextLabel = 0LL;

LABEL_11:
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsActivityIndicatorViewController view](self, "view"));
      [v17 layoutIfNeeded];

      double v5 = v18;
    }
  }
}

- (NSString)activityText
{
  return self->_activityText;
}

- (BOOL)isActivityIndicatorHidden
{
  return self->_activityIndicatorHidden;
}

- (void)setActivityIndicatorHidden:(BOOL)a3
{
  self->_activityIndicatorHidden = a3;
}

- (double)activityIndicatorDelay
{
  return self->_activityIndicatorDelay;
}

- (void)setActivityIndicatorDelay:(double)a3
{
  self->_activityIndicatorDelay = a3;
}

- (void).cxx_destruct
{
}

@end