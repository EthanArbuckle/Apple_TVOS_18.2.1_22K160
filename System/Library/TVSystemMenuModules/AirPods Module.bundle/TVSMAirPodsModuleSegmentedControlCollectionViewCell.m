@interface TVSMAirPodsModuleSegmentedControlCollectionViewCell
- (BOOL)disabled;
- (BOOL)displayAsSelected;
- (NSString)packageName;
- (NSString)title;
- (TVSMAirPodsModuleCAPackageView)focusedPackageView;
- (TVSMAirPodsModuleCAPackageView)normalPackageView;
- (TVSMAirPodsModuleSegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)overrideTintColor;
- (UILabel)titleLabel;
- (UIView)backgroundColorView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_controlStateForCell;
- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)_setupConstraints;
- (void)_setupPackageViews;
- (void)_updatePackageRasterizationScale;
- (void)_updatePackageViewVisibility;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setBackgroundColorView:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayAsSelected:(BOOL)a3;
- (void)setFloatingContentView:(id)a3;
- (void)setFocusedPackageView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNormalPackageView:(id)a3;
- (void)setOverrideTintColor:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVSMAirPodsModuleSegmentedControlCollectionViewCell

- (TVSMAirPodsModuleSegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v26 = a3;
  SEL v24 = a2;
  v25 = 0LL;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell;
  v25 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v25->_floatingContentView;
    v25->_floatingContentView = v3;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v25->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v13 = v25->_floatingContentView;
    sub_24EB4();
    v22[1] = v5;
    v22[2] = v6;
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v13,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v5,  *(double *)&v6);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v25->_floatingContentView, "setFocusedSizeIncrease:", 5.0);
    v14 = v25->_floatingContentView;
    v15 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[_UIFloatingContentView setBackgroundColor:forState:](v14, "setBackgroundColor:forState:");

    id v16 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell contentView](v25, "contentView");
    [v16 addSubview:v25->_floatingContentView];

    v22[0] = -[_UIFloatingContentView contentView](v25->_floatingContentView, "contentView");
    v7 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v25->_backgroundColorView;
    v25->_backgroundColorView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v25->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v17 = v25->_backgroundColorView;
    v18 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:");

    [v22[0] addSubview:v25->_backgroundColorView];
    v9 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v25->_titleLabel;
    v25->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v25->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setTextAlignment:](v25->_titleLabel, "setTextAlignment:", 1LL);
    v19 = v25->_titleLabel;
    v20 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
    -[UILabel setFont:](v19, "setFont:");

    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v25->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    id v21 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell contentView](v25, "contentView");
    [v21 addSubview:v25->_titleLabel];

    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _setupConstraints](v25, "_setupConstraints");
    objc_storeStrong(v22, 0LL);
  }

  v12 = v25;
  objc_storeStrong((id *)&v25, 0LL);
  return v12;
}

  ;
}

- (void)setTitle:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_title, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_title, location[0]);
    -[UILabel setText:](v4->_titleLabel, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPackageName:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_packageName, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_packageName, location[0]);
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _setupPackageViews](v4, "_setupPackageViews");
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v4,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](v4, "_controlStateForCell"),  0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setOverrideTintColor:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[UIColor isEqual:](v4->_overrideTintColor, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_overrideTintColor, location[0]);
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v4,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](v4, "_controlStateForCell"),  0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDisplayAsSelected:(BOOL)a3
{
  if (self->_displayAsSelected != a3)
  {
    self->_displayAsSelected = a3;
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _updatePackageViewVisibility]( self,  "_updatePackageViewVisibility");
    if (-[TVSMAirPodsModuleSegmentedControlCollectionViewCell displayAsSelected](self, "displayAsSelected"))
    {
      v5 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell normalPackageView](self, "normalPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v5, "setStateName:");

      v6 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell focusedPackageView](self, "focusedPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v6, "setStateName:", @"active");
    }

    else
    {
      v3 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell normalPackageView](self, "normalPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v3, "setStateName:");

      v4 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell focusedPackageView](self, "focusedPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v4, "setStateName:", 0LL);
    }
  }

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
  }

- (void)setHighlighted:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell;
  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell setHighlighted:](&v3, "setHighlighted:", a3);
  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v6,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](v6, "_controlStateForCell"),  0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell;
  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v9);
  unsigned __int8 v4 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell isFocused](v11, "isFocused");
  v11->_isFocused = v4 & 1;
  v7 = v11;
  id v5 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _controlStateForCell](v11, "_controlStateForCell");
  -[TVSMAirPodsModuleSegmentedControlCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v7,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v5,  v9);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_setupConstraints
{
  v50 = self;
  v49[1] = (id)a2;
  v49[0] = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v48 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v2 = v48;
  id v6 = -[_UIFloatingContentView leadingAnchor](v50->_floatingContentView, "leadingAnchor");
  id v5 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell contentView](v50, "contentView");
  id v4 = [v5 leadingAnchor];
  id v3 = objc_msgSend(v6, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v2, "addObject:");

  v7 = v48;
  id v11 = -[_UIFloatingContentView trailingAnchor](v50->_floatingContentView, "trailingAnchor");
  id v10 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell contentView](v50, "contentView");
  id v9 = [v10 trailingAnchor];
  id v8 = objc_msgSend(v11, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v7, "addObject:");

  v12 = v48;
  id v16 = -[_UIFloatingContentView topAnchor](v50->_floatingContentView, "topAnchor");
  id v15 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell contentView](v50, "contentView");
  id v14 = [v15 topAnchor];
  id v13 = objc_msgSend(v16, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v12, "addObject:");

  v17 = v48;
  id v19 = -[_UIFloatingContentView heightAnchor](v50->_floatingContentView, "heightAnchor");
  id v18 = [v19 constraintEqualToConstant:138.0];
  -[NSMutableArray addObject:](v17, "addObject:");

  v20 = v48;
  objc_super v23 = -[UIView leadingAnchor](v50->_backgroundColorView, "leadingAnchor");
  id v22 = [v49[0] leadingAnchor];
  id v21 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v23, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v20, "addObject:");

  SEL v24 = v48;
  v27 = -[UIView trailingAnchor](v50->_backgroundColorView, "trailingAnchor");
  id v26 = [v49[0] trailingAnchor];
  id v25 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v27, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v24, "addObject:");

  v28 = v48;
  v31 = -[UIView topAnchor](v50->_backgroundColorView, "topAnchor");
  id v30 = [v49[0] topAnchor];
  id v29 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v31, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v28, "addObject:");

  v32 = v48;
  v35 = -[UIView bottomAnchor](v50->_backgroundColorView, "bottomAnchor");
  id v34 = [v49[0] bottomAnchor];
  id v33 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v35, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v32, "addObject:");

  v36 = v48;
  id v39 = -[UILabel leadingAnchor](v50->_titleLabel, "leadingAnchor");
  id v38 = [v49[0] leadingAnchor];
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v36, "addObject:");

  v40 = v48;
  id v43 = -[UILabel trailingAnchor](v50->_titleLabel, "trailingAnchor");
  id v42 = [v49[0] trailingAnchor];
  id v41 = objc_msgSend(v43, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v40, "addObject:");

  v44 = v48;
  id v47 = -[UILabel firstBaselineAnchor](v50->_titleLabel, "firstBaselineAnchor");
  id v46 = [v49[0] bottomAnchor];
  id v45 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", 28.0);
  -[NSMutableArray addObject:](v44, "addObject:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v48);
  objc_storeStrong((id *)&v48, 0LL);
  objc_storeStrong(v49, 0LL);
}

- (void)_setupPackageViews
{
  id v33 = self;
  v32[1] = (id)a2;
  v32[0] = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v2 = objc_alloc_init(&OBJC_CLASS___TVSMAirPodsModuleCAPackageView);
  focusedPackageView = v33->_focusedPackageView;
  v33->_focusedPackageView = v2;

  -[TVSMAirPodsModuleCAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v33->_focusedPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSMAirPodsModuleCAPackageView setScale:](v33->_focusedPackageView, "setScale:");
  id v6 = v33->_focusedPackageView;
  id v8 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell packageName](v33, "packageName");
  v7 = -[NSString stringByAppendingString:](v8, "stringByAppendingString:", @"_black");
  -[TVSMAirPodsModuleCAPackageView setPackageName:](v6, "setPackageName:");

  [v32[0] addSubview:v33->_focusedPackageView];
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSMAirPodsModuleCAPackageView);
  normalPackageView = v33->_normalPackageView;
  v33->_normalPackageView = v4;

  -[TVSMAirPodsModuleCAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v33->_normalPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSMAirPodsModuleCAPackageView setScale:](v33->_normalPackageView, "setScale:", 2.0);
  id v9 = v33->_normalPackageView;
  id v10 = -[TVSMAirPodsModuleSegmentedControlCollectionViewCell packageName](v33, "packageName");
  -[TVSMAirPodsModuleCAPackageView setPackageName:](v9, "setPackageName:");

  [v32[0] addSubview:v33->_normalPackageView];
  id v30 = -[TVSMAirPodsModuleCAPackageView centerXAnchor](v33->_focusedPackageView, "centerXAnchor");
  id v29 = [v32[0] centerXAnchor];
  id v28 = objc_msgSend(v30, "constraintEqualToAnchor:");
  v34[0] = v28;
  id v27 = -[TVSMAirPodsModuleCAPackageView centerYAnchor](v33->_focusedPackageView, "centerYAnchor");
  id v26 = [v32[0] centerYAnchor];
  id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v34[1] = v25;
  id v24 = -[TVSMAirPodsModuleCAPackageView widthAnchor](v33->_focusedPackageView, "widthAnchor");
  id v23 = objc_msgSend(v24, "constraintEqualToConstant:");
  v34[2] = v23;
  id v22 = -[TVSMAirPodsModuleCAPackageView heightAnchor](v33->_focusedPackageView, "heightAnchor");
  id v21 = [v22 constraintEqualToConstant:70.0];
  v34[3] = v21;
  id v20 = -[TVSMAirPodsModuleCAPackageView centerXAnchor](v33->_normalPackageView, "centerXAnchor");
  id v19 = [v32[0] centerXAnchor];
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v34[4] = v18;
  id v17 = -[TVSMAirPodsModuleCAPackageView centerYAnchor](v33->_normalPackageView, "centerYAnchor");
  id v16 = [v32[0] centerYAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v34[5] = v15;
  id v14 = -[TVSMAirPodsModuleCAPackageView widthAnchor](v33->_normalPackageView, "widthAnchor");
  id v13 = [v14 constraintEqualToConstant:70.0];
  v34[6] = v13;
  id v12 = -[TVSMAirPodsModuleCAPackageView heightAnchor](v33->_normalPackageView, "heightAnchor");
  id v11 = [v12 constraintEqualToConstant:70.0];
  v34[7] = v11;
  v31 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 8LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong(v32, 0LL);
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v16 = (dispatch_once_t *)&unk_5F930;
  id v15 = 0LL;
  objc_storeStrong(&v15, &stru_50F00);
  if (*v16 != -1) {
    dispatch_once(v16, v15);
  }
  objc_storeStrong(&v15, 0LL);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_263BC;
  id v8 = &unk_50698;
  id v9 = v14;
  id v10 = objc_retainBlock(&v4);
  if (location)
  {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v14->_floatingContentView,  "setControlState:withAnimationCoordinator:",  v12,  location);
    [location addCoordinatedAnimations:v10 completion:0];
  }

  else
  {
    -[_UIFloatingContentView setControlState:animated:]( v14->_floatingContentView,  "setControlState:animated:",  v12,  0LL);
    (*((void (**)(void))v10 + 2))();
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)_updatePackageViewVisibility
{
  if (self->_displayAsSelected || !self->_isFocused)
  {
    -[TVSMAirPodsModuleCAPackageView setHidden:](self->_focusedPackageView, "setHidden:", 1LL);
    -[TVSMAirPodsModuleCAPackageView setHidden:](self->_normalPackageView, "setHidden:", 0LL);
  }

  else
  {
    -[TVSMAirPodsModuleCAPackageView setHidden:](self->_focusedPackageView, "setHidden:", 0LL);
    -[TVSMAirPodsModuleCAPackageView setHidden:](self->_normalPackageView, "setHidden:", 1LL);
  }

  if (self->_disabled)
  {
    double v2 = 0.75;
    if (!self->_isFocused) {
      double v2 = 0.5;
    }
    double v3 = v2;
  }

  else
  {
    double v3 = 1.0;
  }

  double v4 = v3;
  -[TVSMAirPodsModuleCAPackageView setAlpha:](self->_focusedPackageView, "setAlpha:", v3, *(void *)&v3);
  -[TVSMAirPodsModuleCAPackageView setAlpha:](self->_normalPackageView, "setAlpha:", v4);
}

- (void)_updatePackageRasterizationScale
{
  double v4 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  -[UIScreen scale](v4, "scale");
  double v5 = v2;
  -[_UIFloatingContentView scaleFactor](self->_floatingContentView, "scaleFactor");
  double v6 = v5 + v3;

  -[TVSMAirPodsModuleCAPackageView setPreferredRasterizationScale:]( self->_focusedPackageView,  "setPreferredRasterizationScale:",  v6);
  -[TVSMAirPodsModuleCAPackageView setPreferredRasterizationScale:]( self->_normalPackageView,  "setPreferredRasterizationScale:",  v6);
}

- (unint64_t)_controlStateForCell
{
  uint64_t v2 = 0LL;
  if (self->_isFocused) {
    uint64_t v2 = 8LL;
  }
  uint64_t v6 = v2;
  if ((-[TVSMAirPodsModuleSegmentedControlCollectionViewCell isHighlighted]( self,  "isHighlighted",  0LL) & 1) != 0) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = v5;
  }
  return v6 | v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (BOOL)displayAsSelected
{
  return self->_displayAsSelected;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVSMAirPodsModuleCAPackageView)focusedPackageView
{
  return self->_focusedPackageView;
}

- (void)setFocusedPackageView:(id)a3
{
}

- (TVSMAirPodsModuleCAPackageView)normalPackageView
{
  return self->_normalPackageView;
}

- (void)setNormalPackageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end