@interface TVSSBannerInternalPresentableViewController
- (BNPresentable)contentViewController;
- (BOOL)hasPrimaryAction;
- (TVSSBannerInternalPillContentView)pillWrapperView;
- (TVSSBannerInternalPresentableViewController)initWithContentViewController:(id)a3;
- (id)pillContentView;
- (void)sendActionWithExternalGesture:(id)a3;
- (void)setPillWrapperView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSBannerInternalPresentableViewController

- (TVSSBannerInternalPresentableViewController)initWithContentViewController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSBannerInternalPresentableViewController;
  v8 = -[TVSSBannerInternalPresentableViewController initWithPresentable:](&v6, "initWithPresentable:", location[0]);
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_contentViewController, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)viewDidLoad
{
  v26 = self;
  SEL v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSSBannerInternalPresentableViewController;
  -[TVSSBannerInternalPresentableViewController viewDidLoad](&v24, "viewDidLoad");
  id v23 = -[TVSSBannerInternalPresentableViewController view](v26, "view");
  [v23 setPreservesSuperviewLayoutMargins:0];
  [v23 setInsetsLayoutMarginsFromSafeArea:0];
  v8 = objc_alloc(&OBJC_CLASS___TVSSBannerInternalPillContentView);
  [v23 bounds];
  v22[1] = v2;
  v22[2] = v3;
  v22[3] = v4;
  v22[4] = v5;
  objc_super v6 = -[TVSSBannerInternalPillContentView initWithFrame:]( v8,  "initWithFrame:",  *(double *)&v2,  *(double *)&v3,  *(double *)&v4,  *(double *)&v5);
  pillWrapperView = v26->_pillWrapperView;
  v26->_pillWrapperView = v6;

  -[TVSSBannerInternalPillContentView setAutoresizingMask:](v26->_pillWrapperView, "setAutoresizingMask:", 18LL);
  [v23 addSubview:v26->_pillWrapperView];
  -[BNPresentable willMoveToParentViewController:](v26->_contentViewController, "willMoveToParentViewController:", v26);
  v22[0] = -[BNPresentable view](v26->_contentViewController, "view");
  [v22[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVSSBannerInternalPillContentView addSubview:](v26->_pillWrapperView, "addSubview:", v22[0]);
  -[BNPresentable didMoveToParentViewController:](v26->_contentViewController, "didMoveToParentViewController:", v26);
  id v21 = [v22[0] topAnchor];
  id v20 = -[TVSSBannerInternalPillContentView topAnchor](v26->_pillWrapperView, "topAnchor");
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v27[0] = v19;
  id v18 = [v22[0] bottomAnchor];
  id v17 = -[TVSSBannerInternalPillContentView bottomAnchor](v26->_pillWrapperView, "bottomAnchor");
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v27[1] = v16;
  id v15 = [v22[0] leadingAnchor];
  id v14 = -[TVSSBannerInternalPillContentView leadingAnchor](v26->_pillWrapperView, "leadingAnchor");
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v27[2] = v13;
  id v12 = [v22[0] trailingAnchor];
  id v11 = -[TVSSBannerInternalPillContentView trailingAnchor](v26->_pillWrapperView, "trailingAnchor");
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v27[3] = v10;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSBannerInternalPresentableViewController _setContentView:](v26, "_setContentView:", v26->_pillWrapperView);
  objc_storeStrong(v22, 0LL);
  objc_storeStrong(&v23, 0LL);
}

- (id)pillContentView
{
  return -[TVSSBannerInternalPresentableViewController view](self, "view", a2, self);
}

- (BOOL)hasPrimaryAction
{
  v4 = -[TVSSBannerPresentableViewController presentableUserInfo](self, "presentableUserInfo");
  id v3 =  -[NSDictionary bs_safeNumberForKey:]( v4,  "bs_safeNumberForKey:",  TVSPBannerPresentableKeyHostedBannerWantsGestureForAction);
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5 & 1;
}

- (void)sendActionWithExternalGesture:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSSBannerInternalPresentableViewController hasPrimaryAction](v11, "hasPrimaryAction"))
  {
    v7 = -[TVSSBannerPresentableViewController presentableUserInfo](v11, "presentableUserInfo");
    id v8 = -[NSDictionary bs_safeNumberForKey:](v7, "bs_safeNumberForKey:", TVSPBannerPresentableKeyActionTrigger);

    if (v8) {
      uint64_t v6 = (uint64_t)[v8 unsignedIntegerValue];
    }
    else {
      uint64_t v6 = 3LL;
    }
    if (TVSSBannerShouldExternalGestureTriggerAction(location[0], v6))
    {
      id v4 = -[TVSSBannerInternalPresentableViewController presentable](v11, "presentable");
      char v5 = objc_opt_respondsToSelector(v4, "handleBannerActionEvent:");

      if ((v5 & 1) != 0)
      {
        id v3 = -[TVSSBannerInternalPresentableViewController presentable](v11, "presentable");
        [v3 handleBannerActionEvent:1];
      }
    }

    objc_storeStrong(&v8, 0LL);
    int v9 = 0;
  }

  else
  {
    int v9 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (BNPresentable)contentViewController
{
  return self->_contentViewController;
}

- (TVSSBannerInternalPillContentView)pillWrapperView
{
  return self->_pillWrapperView;
}

- (void)setPillWrapperView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end