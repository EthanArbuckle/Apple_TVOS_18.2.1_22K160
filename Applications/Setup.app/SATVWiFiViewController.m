@interface SATVWiFiViewController
- (TVCSWiFiNetworkViewController)networkViewController;
- (TVSKAnimationStateView)animationStateView;
- (UILabel)wifiAddressLabel;
- (id)completionBlock;
- (void)_didSelectMenu;
- (void)loadView;
- (void)setAnimationStateView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setNetworkViewController:(id)a3;
- (void)setWifiAddressLabel:(id)a3;
- (void)viewController:(id)a3 connectedToNetwork:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVWiFiViewController

- (void)loadView
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___SATVWiFiViewController;
  -[SATVTableViewController loadView](&v50, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v3 setRemembersLastFocusedIndexPath:0];

  v4 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[SATVHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  uint64_t v9 = SFLocalizableWAPIStringKeyForKey(@"CHOOSE_WIFI_NETWORK");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_10000D7CC(v10, @"Localizable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v8, "titleLabel"));
  [v13 setText:v12];

  -[SATVPreviewTableViewController setBannerView:](self, "setBannerView:", v8);
  -[SATVTableViewController setCustomContentTopInset:](self, "setCustomContentTopInset:", 100.0);
  -[SATVTableViewController setMaxBannerViewWidth:](self, "setMaxBannerViewWidth:", 1144.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  if (-[SATVWiFiViewController tvsk_layoutStyle](self, "tvsk_layoutStyle") == (id)1)
  {
    v15 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v15, "setFont:", v17);

    -[UILabel setTextAlignment:](v15, "setTextAlignment:", 1LL);
    -[UILabel setNumberOfLines:](v15, "setNumberOfLines:", 2LL);
    uint64_t v18 = SFLocalizableWAPIStringKeyForKey(@"WIFI_ADDRESS");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_10000D7CC(v19, @"Localizable");
    v49 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v48 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 hardwareAddress]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v22));
    -[UILabel setText:](v15, "setText:", v23);

    wifiAddressLabel = self->_wifiAddressLabel;
    self->_wifiAddressLabel = v15;
    v43 = v15;

    v25 = objc_alloc_init(&OBJC_CLASS___TVSKAnimationStateView);
    animationStateView = self->_animationStateView;
    self->_animationStateView = v25;

    -[TVSKAnimationStateView addSubview:](self->_animationStateView, "addSubview:", v43);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController view](self, "view"));
    [v27 addSubview:self->_animationStateView];

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_wifiAddressLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSKAnimationStateView setTranslatesAutoresizingMaskIntoConstraints:]( self->_animationStateView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView widthAnchor](self->_animationStateView, "widthAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToConstant:700.0]);
    v51[0] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView heightAnchor](self->_animationStateView, "heightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToConstant:700.0]);
    v51[1] = v44;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView centerYAnchor](self->_animationStateView, "centerYAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController view](self, "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v42 centerYAnchor]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40]);
    v51[2] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView trailingAnchor](self->_animationStateView, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 trailingAnchor]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v29 constant:-150.0]);
    v51[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_wifiAddressLabel, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView centerXAnchor](self->_animationStateView, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
    v51[4] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_wifiAddressLabel, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKAnimationStateView bottomAnchor](self->_animationStateView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v35 constant:-10.0]);
    v51[5] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 6LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v37);

    v8 = v49;
    v14 = v48;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVWiFiViewController;
  -[SATVWiFiViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TVSKAnimationStateView setAnimationStateForType:inResource:]( self->_animationStateView,  "setAnimationStateForType:inResource:",  9LL,  8LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVWiFiViewController;
  -[SATVWiFiViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSKAnimationStateView setAnimationStateInCurrentResourceWithAnimationType:]( self->_animationStateView,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVWiFiViewController;
  -[SATVWiFiViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_didSelectMenu");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1000D0F98);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  v5 = objc_alloc(&OBJC_CLASS___TVCSWiFiNetworkViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v7 = -[TVCSWiFiNetworkViewController initWithTableView:](v5, "initWithTableView:", v6);
  networkViewController = self->_networkViewController;
  self->_networkViewController = v7;

  -[TVCSWiFiNetworkViewController setShowsCurrentNetwork:](self->_networkViewController, "setShowsCurrentNetwork:", 0LL);
  -[TVCSWiFiNetworkViewController setDelegate:](self->_networkViewController, "setDelegate:", self);
  -[SATVWiFiViewController addChildViewController:](self, "addChildViewController:", self->_networkViewController);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSWiFiNetworkViewController view](self->_networkViewController, "view"));
  [v9 addSubview:v10];

  -[TVCSWiFiNetworkViewController didMoveToParentViewController:]( self->_networkViewController,  "didMoveToParentViewController:",  self);
}

- (void)_didSelectMenu
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController completionBlock](self, "completionBlock"));

  if (v3)
  {
    objc_super v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController completionBlock](self, "completionBlock"));
    v4[2](v4, 1LL);
  }

- (void)viewController:(id)a3 connectedToNetwork:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController completionBlock](self, "completionBlock", a3, a4));

  if (v5)
  {
    v6 = (void (**)(id, void))objc_claimAutoreleasedReturnValue(-[SATVWiFiViewController completionBlock](self, "completionBlock"));
    v6[2](v6, 0LL);
  }

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (TVCSWiFiNetworkViewController)networkViewController
{
  return self->_networkViewController;
}

- (void)setNetworkViewController:(id)a3
{
}

- (UILabel)wifiAddressLabel
{
  return self->_wifiAddressLabel;
}

- (void)setWifiAddressLabel:(id)a3
{
}

- (TVSKAnimationStateView)animationStateView
{
  return self->_animationStateView;
}

- (void)setAnimationStateView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end