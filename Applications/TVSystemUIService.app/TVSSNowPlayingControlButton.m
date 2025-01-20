@interface TVSSNowPlayingControlButton
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)canBecomeFocused;
- (BSUICAPackageView)caPackageView;
- (NSArray)tintableLayers;
- (NSArray)tintableViews;
- (NSString)symbolImageName;
- (TVSSNowPlayingControlButton)initWithCAPackageView:(id)a3 frame:(CGRect)a4;
- (TVSSNowPlayingControlButton)initWithFrame:(CGRect)a3;
- (TVSSNowPlayingControlButton)initWithSymbolImageName:(id)a3 frame:(CGRect)a4;
- (UIImageView)symbolImageView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_computedControlState;
- (void)_configure;
- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)_updateForUserInterfaceStyleChange;
- (void)addSymbolEffect:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setFloatingContentView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSymbolImageView:(id)a3;
@end

@implementation TVSSNowPlayingControlButton

- (TVSSNowPlayingControlButton)initWithFrame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = 0LL;
  v5 = -[TVSSNowPlayingControlButton initWithSymbolImageName:frame:]( self,  "initWithSymbolImageName:frame:",  @"circle",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (TVSSNowPlayingControlButton)initWithCAPackageView:(id)a3 frame:(CGRect)a4
{
  CGRect v11 = a4;
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v10;
  v10 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
  v7 = -[TVSSNowPlayingControlButton initWithFrame:]( &v8,  "initWithFrame:",  v11.origin.x,  v11.origin.y,  v11.size.width,  v11.size.height);
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    objc_storeStrong((id *)&v10->_caPackageView, location[0]);
    -[TVSSNowPlayingControlButton _configure](v10, "_configure");
    -[TVSSNowPlayingControlButton _configureAppearanceForControlState:withAnimationCoordinator:]( v10,  "_configureAppearanceForControlState:withAnimationCoordinator:",  0LL,  0LL);
  }

  CGRect v6 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (TVSSNowPlayingControlButton)initWithSymbolImageName:(id)a3 frame:(CGRect)a4
{
  CGRect v19 = a4;
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v18;
  v18 = 0LL;
  v16.receiver = v4;
  v16.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
  v12 = -[TVSSNowPlayingControlButton initWithFrame:]( &v16,  "initWithFrame:",  v19.origin.x,  v19.origin.y,  v19.size.width,  v19.size.height);
  v18 = v12;
  objc_storeStrong((id *)&v18, v12);
  if (v12)
  {
    id v15 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 4LL);
    v14 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v15,  3LL);
    id v13 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  location[0],  v14);
    v5 = objc_alloc(&OBJC_CLASS___UIImageView);
    CGRect v6 = -[UIImageView initWithImage:](v5, "initWithImage:", v13);
    symbolImageView = v18->_symbolImageView;
    v18->_symbolImageView = v6;

    objc_super v8 = (NSString *)[location[0] copy];
    symbolImageName = v18->_symbolImageName;
    v18->_symbolImageName = v8;

    -[TVSSNowPlayingControlButton _configure](v18, "_configure");
    -[TVSSNowPlayingControlButton _configureAppearanceForControlState:withAnimationCoordinator:]( v18,  "_configureAppearanceForControlState:withAnimationCoordinator:",  0LL);
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  CGRect v11 = v18;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v11;
}

- (void)layoutSubviews
{
  CGRect v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
  -[TVSSNowPlayingControlButton layoutSubviews](&v4, "layoutSubviews");
  -[_UIFloatingContentView bounds](v6->_floatingContentView, "bounds");
  -[_UIFloatingContentView setCornerRadius:](v6->_floatingContentView, "setCornerRadius:", sub_10000AD54(v2, v3) / 2.0);
}

- (void)addSymbolEffect:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIImageView addSymbolEffect:](v4->_symbolImageView, "addSymbolEffect:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (NSArray)tintableLayers
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)tintableViews
{
  if (self->_symbolImageView)
  {
    symbolImageView = self->_symbolImageView;
    double v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &symbolImageView, 1LL);
  }

  else
  {
    double v3 = &__NSArray0__struct;
  }

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  CGRect v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
  -[TVSSNowPlayingControlButton setHighlighted:](&v3, "setHighlighted:", a3);
  -[_UIFloatingContentView setControlState:animated:]( v6->_floatingContentView,  "setControlState:animated:",  -[TVSSNowPlayingControlButton _computedControlState](v6, "_computedControlState"),  1LL);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVSSNowPlayingControlButton _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVSSNowPlayingControlButton setHighlighted:](v8, "setHighlighted:", 1LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
    -[TVSSNowPlayingControlButton pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVSSNowPlayingControlButton _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVSSNowPlayingControlButton setHighlighted:](v8, "setHighlighted:", 0LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
    -[TVSSNowPlayingControlButton pressesCancelled:withEvent:](&v5, "pressesCancelled:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVSSNowPlayingControlButton _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVSSNowPlayingControlButton setHighlighted:](v8, "setHighlighted:", 0LL);
    -[TVSSNowPlayingControlButton sendActionsForControlEvents:](v8, "sendActionsForControlEvents:", 0x2000LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
    -[TVSSNowPlayingControlButton pressesEnded:withEvent:](&v5, "pressesEnded:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlButton;
  -[TVSSNowPlayingControlButton didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v12);
  id v10 = [location[0] previouslyFocusedView];
  id v9 = [location[0] nextFocusedView];
  unsigned __int8 v8 = 1;
  if (v10 != v14) {
    unsigned __int8 v8 = [v10 isDescendantOfView:v14];
  }
  unsigned __int8 v6 = 1;
  if (v9 != v14) {
    unsigned __int8 v6 = [v9 isDescendantOfView:v14];
  }
  if ((v6 & 1) != 0 || (v8 & 1) != 0)
  {
    objc_super v5 = v14;
    id v4 = -[TVSSNowPlayingControlButton _computedControlState](v14, "_computedControlState");
    -[TVSSNowPlayingControlButton _configureAppearanceForControlState:withAnimationCoordinator:]( v5,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v4,  v12);
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_canHandlePresses:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = 0;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (void)_updateForUserInterfaceStyleChange
{
  unint64_t v2 = -[TVSSNowPlayingControlButton _computedControlState](self, "_computedControlState");
  id v4 = -[TVSSNowPlayingControlButton _currentFocusAnimationCoordinator](self, "_currentFocusAnimationCoordinator");
  -[TVSSNowPlayingControlButton _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v2);
}

- (void)_configure
{
  v61 = self;
  v60[1] = (id)a2;
  v60[0] = self;
  -[TVSSNowPlayingControlButton bounds](v61, "bounds");
  v59[1] = v2;
  v59[2] = v3;
  v59[3] = v4;
  v59[4] = v5;
  v59[0] = -[_UIFloatingContentView initWithFrame:]( objc_alloc(&OBJC_CLASS____UIFloatingContentView),  "initWithFrame:",  *(double *)&v2,  *(double *)&v3,  *(double *)&v4,  *(double *)&v5);
  objc_msgSend(v59[0], "setFocusedSizeIncrease:");
  sub_10000BF70();
  location[1] = v6;
  id location[2] = v7;
  objc_msgSend( v59[0],  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v6,  *(double *)&v7);
  v27 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL);
  objc_msgSend(v59[0], "setFocusAnimationConfiguration:");

  [v59[0] setContinuousCornerEnabled:0];
  +[TVSPConstants defaultShadowRadius](&OBJC_CLASS___TVSPConstants, "defaultShadowRadius");
  objc_msgSend(v59[0], "setShadowRadius:");
  +[TVSPConstants defaultShadowVerticalOffset](&OBJC_CLASS___TVSPConstants, "defaultShadowVerticalOffset");
  objc_msgSend(v59[0], "setShadowVerticalOffset:");
  +[TVSPConstants defaultShadowOpacity](&OBJC_CLASS___TVSPConstants, "defaultShadowOpacity");
  objc_msgSend(v59[0], "setShadowOpacity:");
  [v59[0] setUseShadowImage:0];
  id v28 = [v59[0] contentView];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  [v59[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v60[0] addSubview:v59[0]];
  id v57 = [v59[0] leadingAnchor];
  id v56 = [v60[0] leadingAnchor];
  id v55 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", 0.0);
  v64[0] = v55;
  id v54 = [v59[0] trailingAnchor];
  id v53 = [v60[0] trailingAnchor];
  id v52 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", 0.0);
  v64[1] = v52;
  id v51 = [v59[0] topAnchor];
  id v50 = [v60[0] topAnchor];
  id v49 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", 0.0);
  v64[2] = v49;
  id v48 = [v59[0] bottomAnchor];
  id v47 = [v60[0] bottomAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", 0.0);
  v64[3] = v46;
  id v45 = [v59[0] leadingAnchor];
  id v44 = [v59[0] contentView];
  id v43 = [v44 leadingAnchor];
  id v42 = objc_msgSend(v45, "constraintEqualToAnchor:");
  v64[4] = v42;
  id v41 = [v59[0] trailingAnchor];
  id v40 = [v59[0] contentView];
  id v39 = [v40 trailingAnchor];
  id v38 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v64[5] = v38;
  id v37 = [v59[0] topAnchor];
  id v36 = [v59[0] contentView];
  id v35 = [v36 topAnchor];
  id v34 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v64[6] = v34;
  id v33 = [v59[0] bottomAnchor];
  id v32 = [v59[0] contentView];
  id v31 = [v32 bottomAnchor];
  id v30 = objc_msgSend(v33, "constraintEqualToAnchor:");
  v64[7] = v30;
  v29 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 8LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong((id *)&v61->_floatingContentView, v59[0]);
  -[TVSSNowPlayingControlButton addSubview:](v61, "addSubview:", v59[0]);
  location[0] = [v59[0] contentView];
  if (v61->_symbolImageView)
  {
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v61->_symbolImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v17 = [v59[0] contentView];
    [v17 addSubview:v61->_symbolImageView];

    id v26 = -[UIImageView centerXAnchor](v61->_symbolImageView, "centerXAnchor");
    id v25 = [v59[0] contentView];
    id v24 = [v25 centerXAnchor];
    id v23 = objc_msgSend(v26, "constraintEqualToAnchor:");
    v63[0] = v23;
    id v22 = -[UIImageView centerYAnchor](v61->_symbolImageView, "centerYAnchor");
    id v21 = [v59[0] contentView];
    id v20 = [v21 centerYAnchor];
    id v19 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v63[1] = v19;
    v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  else if (v61->_caPackageView)
  {
    -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v61->_caPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    [location[0] addSubview:v61->_caPackageView];
    id v16 = -[BSUICAPackageView centerXAnchor](v61->_caPackageView, "centerXAnchor");
    id v15 = [location[0] centerXAnchor];
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v62[0] = v14;
    id v13 = -[BSUICAPackageView centerYAnchor](v61->_caPackageView, "centerYAnchor");
    id v12 = [location[0] centerYAnchor];
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v62[1] = v11;
    id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  id v9 = [v59[0] contentView];
  id v8 = [v9 layer];
  [v8 setAllowsGroupBlending:0];

  objc_storeStrong(location, 0LL);
  objc_storeStrong(v59, 0LL);
  objc_storeStrong(v60, 0LL);
}

  ;
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v28 = self;
  SEL v27 = a2;
  unint64_t v26 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  BOOL v24 = (v26 & 8) != 0;
  id v8 = -[TVSSNowPlayingControlButton traitCollection](v28, "traitCollection");
  BOOL v9 = [v8 userInterfaceStyle] == (id)2;

  BOOL v23 = v9;
  id v22 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  id v21 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
  if (v24) {
    id v4 = v22;
  }
  else {
    id v4 = v21;
  }
  id v20 = v4;
  id v19 = 0LL;
  if (!v24)
  {
    if (v23) {
      uint64_t v7 = kCAFilterPlusL;
    }
    else {
      uint64_t v7 = kCAFilterPlusD;
    }
    objc_super v5 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v7);
    id v6 = v19;
    id v19 = v5;
  }

  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10000C2A8;
  id v14 = &unk_1001B60D0;
  id v15 = v28;
  id v16 = v20;
  id v17 = v19;
  id v18 = objc_retainBlock(&v10);
  if (location) {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v28->_floatingContentView,  "setControlState:withAnimationCoordinator:",  v26,  location);
  }
  else {
    -[_UIFloatingContentView setControlState:animated:]( v28->_floatingContentView,  "setControlState:animated:",  v26,  0LL);
  }
  (*((void (**)(void))v18 + 2))();
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (unint64_t)_computedControlState
{
  unint64_t v3 = 0LL;
  return v3;
}

- (BSUICAPackageView)caPackageView
{
  return self->_caPackageView;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end