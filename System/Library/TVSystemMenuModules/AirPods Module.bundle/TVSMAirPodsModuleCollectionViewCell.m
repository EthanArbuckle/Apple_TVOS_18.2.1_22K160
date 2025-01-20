@interface TVSMAirPodsModuleCollectionViewCell
- (BOOL)disabled;
- (BOOL)displayAsSelected;
- (NSString)packageName;
- (NSString)title;
- (TVSMAirPodsModuleCAPackageView)focusedPackageView;
- (TVSMAirPodsModuleCAPackageView)normalPackageView;
- (TVSMAirPodsModuleCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)statusLabel;
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
- (void)setPackageName:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVSMAirPodsModuleCollectionViewCell

- (TVSMAirPodsModuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v32 = a3;
  SEL v30 = a2;
  v31 = 0LL;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell;
  v31 = -[TVSMAirPodsModuleCollectionViewCell initWithFrame:]( &v29,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v31->_floatingContentView;
    v31->_floatingContentView = v3;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v31->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = v31->_floatingContentView;
    sub_2A98();
    v28[1] = v5;
    v28[2] = v6;
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v15,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v5,  *(double *)&v6);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v31->_floatingContentView, "setFocusedSizeIncrease:", 5.0);
    v16 = v31->_floatingContentView;
    v17 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[_UIFloatingContentView setBackgroundColor:forState:](v16, "setBackgroundColor:forState:");

    id v18 = -[TVSMAirPodsModuleCollectionViewCell contentView](v31, "contentView");
    [v18 addSubview:v31->_floatingContentView];

    v28[0] = -[_UIFloatingContentView contentView](v31->_floatingContentView, "contentView");
    v7 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v31->_backgroundColorView;
    v31->_backgroundColorView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v31->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v19 = v31->_backgroundColorView;
    v20 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:");

    [v28[0] addSubview:v31->_backgroundColorView];
    v9 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v31->_titleLabel;
    v31->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v31->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v21 = v31->_titleLabel;
    v22 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    -[UILabel setFont:](v21, "setFont:");

    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v31->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    [v28[0] addSubview:v31->_titleLabel];
    v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
    statusLabel = v31->_statusLabel;
    v31->_statusLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v31->_statusLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v23 = v31->_statusLabel;
    v24 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    -[UILabel setFont:](v23, "setFont:");

    v25 = v31->_statusLabel;
    v27 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell));
    v26 =  -[NSBundle localizedStringForKey:value:table:]( v27,  "localizedStringForKey:value:table:",  @"SpatializeStereoAudioOff",  &stru_51218);
    -[UILabel setText:](v25, "setText:");

    [v28[0] addSubview:v31->_statusLabel];
    -[TVSMAirPodsModuleCollectionViewCell _setupConstraints](v31, "_setupConstraints");
    objc_storeStrong(v28, 0LL);
  }

  v14 = v31;
  objc_storeStrong((id *)&v31, 0LL);
  return v14;
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
    -[TVSMAirPodsModuleCollectionViewCell _setupPackageViews](v4, "_setupPackageViews");
    -[TVSMAirPodsModuleCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v4,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleCollectionViewCell _controlStateForCell](v4, "_controlStateForCell"),  0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDisplayAsSelected:(BOOL)a3
{
  BOOL v12 = a3;
  if (self->_displayAsSelected != a3)
  {
    self->_displayAsSelected = a3;
    v11 = -[TVSMAirPodsModuleCollectionViewCell statusLabel](self, "statusLabel");
    v3 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell));
    v10 = v3;
    if (v12) {
      v4 = @"SpatializeStereoAudioOn";
    }
    else {
      v4 = @"SpatializeStereoAudioOff";
    }
    v9 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_51218);
    -[UILabel setText:](v11, "setText:");

    -[TVSMAirPodsModuleCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
    -[TVSMAirPodsModuleCollectionViewCell _updatePackageViewVisibility](self, "_updatePackageViewVisibility");
    if (-[TVSMAirPodsModuleCollectionViewCell displayAsSelected](self, "displayAsSelected"))
    {
      v7 = -[TVSMAirPodsModuleCollectionViewCell normalPackageView](self, "normalPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v7, "setStateName:");

      v8 = -[TVSMAirPodsModuleCollectionViewCell focusedPackageView](self, "focusedPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v8, "setStateName:", @"active");
    }

    else
    {
      v5 = -[TVSMAirPodsModuleCollectionViewCell normalPackageView](self, "normalPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v5, "setStateName:");

      v6 = -[TVSMAirPodsModuleCollectionViewCell focusedPackageView](self, "focusedPackageView");
      -[TVSMAirPodsModuleCAPackageView setStateName:](v6, "setStateName:", 0LL);
    }
  }

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[TVSMAirPodsModuleCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
  }

- (void)setHighlighted:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell;
  -[TVSMAirPodsModuleCollectionViewCell setHighlighted:](&v3, "setHighlighted:", a3);
  -[TVSMAirPodsModuleCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v6,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVSMAirPodsModuleCollectionViewCell _controlStateForCell](v6, "_controlStateForCell"),  0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  v9.receiver = v12;
  v9.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell;
  -[TVSMAirPodsModuleCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v10);
  id v7 = [location[0] nextFocusedView];
  unsigned __int8 v4 = [v7 isDescendantOfView:v12];
  v12->_isFocused = v4 & 1;

  v8 = v12;
  id v5 = -[TVSMAirPodsModuleCollectionViewCell _controlStateForCell](v12, "_controlStateForCell");
  -[TVSMAirPodsModuleCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v8,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v5,  v10);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_setupConstraints
{
  v60 = self;
  v59[1] = (id)a2;
  v59[0] = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v58 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v2 = v58;
  id v6 = -[_UIFloatingContentView leadingAnchor](v60->_floatingContentView, "leadingAnchor");
  id v5 = -[TVSMAirPodsModuleCollectionViewCell contentView](v60, "contentView");
  id v4 = [v5 leadingAnchor];
  id v3 = objc_msgSend(v6, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v2, "addObject:");

  id v7 = v58;
  id v11 = -[_UIFloatingContentView trailingAnchor](v60->_floatingContentView, "trailingAnchor");
  id v10 = -[TVSMAirPodsModuleCollectionViewCell contentView](v60, "contentView");
  id v9 = [v10 trailingAnchor];
  id v8 = objc_msgSend(v11, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v7, "addObject:");

  BOOL v12 = v58;
  id v16 = -[_UIFloatingContentView topAnchor](v60->_floatingContentView, "topAnchor");
  id v15 = -[TVSMAirPodsModuleCollectionViewCell contentView](v60, "contentView");
  id v14 = [v15 topAnchor];
  id v13 = objc_msgSend(v16, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v12, "addObject:");

  v17 = v58;
  id v21 = -[_UIFloatingContentView bottomAnchor](v60->_floatingContentView, "bottomAnchor");
  id v20 = -[TVSMAirPodsModuleCollectionViewCell contentView](v60, "contentView");
  id v19 = [v20 bottomAnchor];
  id v18 = objc_msgSend(v21, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v17, "addObject:");

  v22 = v58;
  v25 = -[UIView leadingAnchor](v60->_backgroundColorView, "leadingAnchor");
  id v24 = [v59[0] leadingAnchor];
  id v23 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v25, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v22, "addObject:");

  v26 = v58;
  objc_super v29 = -[UIView trailingAnchor](v60->_backgroundColorView, "trailingAnchor");
  id v28 = [v59[0] trailingAnchor];
  id v27 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v29, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v26, "addObject:");

  SEL v30 = v58;
  v33 = -[UIView topAnchor](v60->_backgroundColorView, "topAnchor");
  id v32 = [v59[0] topAnchor];
  id v31 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v33, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v30, "addObject:");

  v34 = v58;
  v37 = -[UIView bottomAnchor](v60->_backgroundColorView, "bottomAnchor");
  id v36 = [v59[0] bottomAnchor];
  id v35 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v37, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v34, "addObject:");

  v38 = v58;
  id v41 = -[UILabel leadingAnchor](v60->_titleLabel, "leadingAnchor");
  id v40 = [v59[0] leadingAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", 122.0);
  -[NSMutableArray addObject:](v38, "addObject:");

  v42 = v58;
  id v45 = -[UILabel centerYAnchor](v60->_titleLabel, "centerYAnchor");
  id v44 = [v59[0] centerYAnchor];
  id v43 = objc_msgSend(v45, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v42, "addObject:");

  v46 = v58;
  id v49 = -[UILabel leadingAnchor](v60->_statusLabel, "leadingAnchor");
  id v48 = -[UILabel trailingAnchor](v60->_titleLabel, "trailingAnchor");
  id v47 = objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:constant:", 74.0);
  -[NSMutableArray addObject:](v46, "addObject:");

  v50 = v58;
  id v53 = -[UILabel centerYAnchor](v60->_statusLabel, "centerYAnchor");
  id v52 = [v59[0] centerYAnchor];
  id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v50, "addObject:");

  v54 = v58;
  id v57 = -[UILabel trailingAnchor](v60->_statusLabel, "trailingAnchor");
  id v56 = [v59[0] trailingAnchor];
  id v55 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", -30.0);
  -[NSMutableArray addObject:](v54, "addObject:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v58);
  objc_storeStrong((id *)&v58, 0LL);
  objc_storeStrong(v59, 0LL);
}

- (void)_setupPackageViews
{
  v37 = self;
  v36[1] = (id)a2;
  v36[0] = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  -[TVSMAirPodsModuleCAPackageView removeFromSuperview](v37->_focusedPackageView, "removeFromSuperview");
  -[TVSMAirPodsModuleCAPackageView removeFromSuperview](v37->_normalPackageView, "removeFromSuperview");
  v2 = objc_alloc_init(&OBJC_CLASS___TVSMAirPodsModuleCAPackageView);
  focusedPackageView = v37->_focusedPackageView;
  v37->_focusedPackageView = v2;

  -[TVSMAirPodsModuleCAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v37->_focusedPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSMAirPodsModuleCAPackageView setScale:](v37->_focusedPackageView, "setScale:");
  id v10 = v37->_focusedPackageView;
  BOOL v12 = -[TVSMAirPodsModuleCollectionViewCell packageName](v37, "packageName");
  id v11 = -[NSString stringByAppendingString:](v12, "stringByAppendingString:", @"_black");
  -[TVSMAirPodsModuleCAPackageView setPackageName:](v10, "setPackageName:");

  [v36[0] addSubview:v37->_focusedPackageView];
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSMAirPodsModuleCAPackageView);
  normalPackageView = v37->_normalPackageView;
  v37->_normalPackageView = v4;

  -[TVSMAirPodsModuleCAPackageView setScale:](v37->_normalPackageView, "setScale:", 2.0);
  -[TVSMAirPodsModuleCAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v37->_normalPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v13 = v37->_normalPackageView;
  id v14 = -[TVSMAirPodsModuleCollectionViewCell packageName](v37, "packageName");
  -[TVSMAirPodsModuleCAPackageView setPackageName:](v13, "setPackageName:");

  [v36[0] addSubview:v37->_normalPackageView];
  id v34 = -[TVSMAirPodsModuleCAPackageView leadingAnchor](v37->_focusedPackageView, "leadingAnchor");
  id v33 = [v36[0] leadingAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:constant:");
  v38[0] = v32;
  id v31 = -[TVSMAirPodsModuleCAPackageView centerYAnchor](v37->_focusedPackageView, "centerYAnchor");
  id v30 = [v36[0] centerYAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v38[1] = v29;
  id v28 = -[TVSMAirPodsModuleCAPackageView widthAnchor](v37->_focusedPackageView, "widthAnchor");
  id v27 = objc_msgSend(v28, "constraintEqualToConstant:");
  v38[2] = v27;
  id v26 = -[TVSMAirPodsModuleCAPackageView heightAnchor](v37->_focusedPackageView, "heightAnchor");
  id v25 = [v26 constraintEqualToConstant:70.0];
  v38[3] = v25;
  id v24 = -[TVSMAirPodsModuleCAPackageView leadingAnchor](v37->_normalPackageView, "leadingAnchor");
  id v23 = [v36[0] leadingAnchor];
  id v22 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", 25.0);
  v38[4] = v22;
  id v21 = -[TVSMAirPodsModuleCAPackageView centerYAnchor](v37->_normalPackageView, "centerYAnchor");
  id v20 = [v36[0] centerYAnchor];
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v38[5] = v19;
  id v18 = -[TVSMAirPodsModuleCAPackageView widthAnchor](v37->_normalPackageView, "widthAnchor");
  id v17 = [v18 constraintEqualToConstant:70.0];
  v38[6] = v17;
  id v16 = -[TVSMAirPodsModuleCAPackageView heightAnchor](v37->_normalPackageView, "heightAnchor");
  id v15 = [v16 constraintEqualToConstant:70.0];
  v38[7] = v15;
  id location = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 8LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", location);
  if (-[TVSMAirPodsModuleCollectionViewCell displayAsSelected](v37, "displayAsSelected"))
  {
    id v8 = -[TVSMAirPodsModuleCollectionViewCell normalPackageView](v37, "normalPackageView");
    -[TVSMAirPodsModuleCAPackageView setStateName:](v8, "setStateName:");

    id v9 = -[TVSMAirPodsModuleCollectionViewCell focusedPackageView](v37, "focusedPackageView");
    -[TVSMAirPodsModuleCAPackageView setStateName:](v9, "setStateName:", @"active");
  }

  else
  {
    id v6 = -[TVSMAirPodsModuleCollectionViewCell normalPackageView](v37, "normalPackageView");
    -[TVSMAirPodsModuleCAPackageView setStateName:](v6, "setStateName:");

    id v7 = -[TVSMAirPodsModuleCollectionViewCell focusedPackageView](v37, "focusedPackageView");
    -[TVSMAirPodsModuleCAPackageView setStateName:](v7, "setStateName:", 0LL);
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v36, 0LL);
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v16 = (dispatch_once_t *)&unk_5F898;
  id v15 = 0LL;
  objc_storeStrong(&v15, &stru_50670);
  if (*v16 != -1) {
    dispatch_once(v16, v15);
  }
  objc_storeStrong(&v15, 0LL);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_4270;
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

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
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