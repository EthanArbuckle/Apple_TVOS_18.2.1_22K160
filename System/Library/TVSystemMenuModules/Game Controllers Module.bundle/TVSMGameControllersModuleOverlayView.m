@interface TVSMGameControllersModuleOverlayView
- (BOOL)showingDeviceOptionsHint;
- (TVSMGameControllersModuleOverlayView)initWithFrame:(CGRect)a3;
- (UICollectionView)collectionView;
- (UILabel)deviceOptionsHintLabel;
- (UILabel)titleLabel;
- (UIView)collectionViewWrapperView;
- (id)_collectionViewWrapperViewGradientMask;
- (id)menuButtonHandler;
- (void)_handleMenuPress:(id)a3;
- (void)layoutSubviews;
- (void)setMenuButtonHandler:(id)a3;
- (void)setShowingDeviceOptionsHint:(BOOL)a3;
@end

@implementation TVSMGameControllersModuleOverlayView

- (TVSMGameControllersModuleOverlayView)initWithFrame:(CGRect)a3
{
  CGRect v90 = a3;
  SEL v88 = a2;
  v89 = 0LL;
  v87.receiver = self;
  v87.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModuleOverlayView;
  v89 = -[TVSMGameControllersModuleOverlayView initWithFrame:]( &v87,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v89, v89);
  if (v89)
  {
    v86 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
    -[UIScreen bounds](v86, "bounds");
    uint64_t v82 = v3;
    uint64_t v83 = v4;
    double v84 = v5;
    uint64_t v85 = v6;
    -[UIScreen scale](v86, "scale");
    double v81 = v7;
    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v89->_titleLabel;
    v89->_titleLabel = v8;

    -[UILabel setOpaque:](v89->_titleLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v89->_titleLabel, "setBackgroundColor:");
    -[UILabel setMinimumScaleFactor:](v89->_titleLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setAdjustsFontSizeToFitWidth:](v89->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setLineBreakMode:](v89->_titleLabel, "setLineBreakMode:");
    -[UILabel setTextAlignment:](v89->_titleLabel, "setTextAlignment:");
    v27 = v89->_titleLabel;
    v28 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2);
    -[UILabel setFont:](v27, "setFont:");

    v29 = v89->_titleLabel;
    v30 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v29, "setTextColor:");

    v31 = v89->_titleLabel;
    v33 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
    v32 =  -[NSBundle localizedStringForKey:value:table:]( v33,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleGameControllers");
    -[UILabel setText:](v31, "setText:");

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v89->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSMGameControllersModuleOverlayView addSubview:](v89, "addSubview:", v89->_titleLabel);
    v10 = objc_alloc_init(&OBJC_CLASS___UIView);
    collectionViewWrapperView = v89->_collectionViewWrapperView;
    v89->_collectionViewWrapperView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v89->_collectionViewWrapperView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSMGameControllersModuleOverlayView addSubview:](v89, "addSubview:", v89->_collectionViewWrapperView);
    v80 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setScrollDirection:](v80, "setScrollDirection:", 0LL);
    v34 = v80;
    sub_8B7C();
    v79[6] = v12;
    v79[7] = v13;
    -[UICollectionViewFlowLayout setItemSize:](v34, "setItemSize:", *(double *)&v12, *(double *)&v13);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v80, "setMinimumLineSpacing:");
    v14 = objc_alloc(&OBJC_CLASS___UICollectionView);
    v15 = -[UICollectionView initWithFrame:collectionViewLayout:]( v14,  "initWithFrame:collectionViewLayout:",  v80,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    collectionView = v89->_collectionView;
    v89->_collectionView = v15;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:]( v89->_collectionView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UICollectionView setIndexDisplayMode:](v89->_collectionView, "setIndexDisplayMode:", 1LL);
    id v17 = -[UICollectionView _setContentInsetAdjustmentBehavior:]( v89->_collectionView,  "_setContentInsetAdjustmentBehavior:",  2LL);
    v79[5] = COERCE_ID(BSFloatRoundForScale(v17, (v84 - 760.0) / 2.0, v81));
    sub_8BA8();
    v79[1] = v18;
    v79[2] = v19;
    v79[3] = v20;
    v79[4] = v21;
    -[UICollectionView setContentInset:]( v89->_collectionView,  "setContentInset:",  *(double *)&v18,  *(double *)&v19,  *(double *)&v20,  *(double *)&v21);
    -[UIView addSubview:](v89->_collectionViewWrapperView, "addSubview:", v89->_collectionView);
    v22 = objc_alloc_init(&OBJC_CLASS___UILabel);
    deviceOptionsHintLabel = v89->_deviceOptionsHintLabel;
    v89->_deviceOptionsHintLabel = v22;

    -[UILabel setTextAlignment:](v89->_deviceOptionsHintLabel, "setTextAlignment:", 1LL);
    v35 = v89->_deviceOptionsHintLabel;
    v36 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    -[UILabel setFont:](v35, "setFont:");

    v37 = v89->_deviceOptionsHintLabel;
    v38 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v37, "setTextColor:");

    v39 = v89->_deviceOptionsHintLabel;
    v41 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
    v40 =  -[NSBundle localizedStringForKey:value:table:]( v41,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleDeviceOptionsHint",  &stru_14478,  0LL);
    -[UILabel setText:](v39, "setText:");

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v89->_deviceOptionsHintLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setHidden:](v89->_deviceOptionsHintLabel, "setHidden:", 1LL);
    -[TVSMGameControllersModuleOverlayView addSubview:](v89, "addSubview:", v89->_deviceOptionsHintLabel);
    id v77 = -[UILabel lastBaselineAnchor](v89->_titleLabel, "lastBaselineAnchor");
    id v76 = -[TVSMGameControllersModuleOverlayView topAnchor](v89, "topAnchor");
    id v75 = objc_msgSend(v77, "constraintEqualToAnchor:constant:", 240.0);
    v91[0] = v75;
    id v74 = -[UILabel centerXAnchor](v89->_titleLabel, "centerXAnchor");
    id v73 = -[TVSMGameControllersModuleOverlayView centerXAnchor](v89, "centerXAnchor");
    id v72 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v91[1] = v72;
    id v71 = -[UILabel lastBaselineAnchor](v89->_deviceOptionsHintLabel, "lastBaselineAnchor");
    id v70 = -[TVSMGameControllersModuleOverlayView bottomAnchor](v89, "bottomAnchor");
    id v69 = objc_msgSend(v71, "constraintEqualToAnchor:constant:", -42.0);
    v91[2] = v69;
    id v68 = -[UILabel centerXAnchor](v89->_deviceOptionsHintLabel, "centerXAnchor");
    id v67 = -[TVSMGameControllersModuleOverlayView centerXAnchor](v89, "centerXAnchor");
    id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
    v91[3] = v66;
    v65 = -[UIView leadingAnchor](v89->_collectionViewWrapperView, "leadingAnchor");
    id v64 = -[TVSMGameControllersModuleOverlayView leadingAnchor](v89, "leadingAnchor");
    id v63 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v65, "constraintEqualToAnchor:");
    v91[4] = v63;
    v62 = -[UIView trailingAnchor](v89->_collectionViewWrapperView, "trailingAnchor");
    id v61 = -[TVSMGameControllersModuleOverlayView trailingAnchor](v89, "trailingAnchor");
    id v60 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v62, "constraintEqualToAnchor:");
    v91[5] = v60;
    v59 = -[UIView topAnchor](v89->_collectionViewWrapperView, "topAnchor");
    id v58 = -[UILabel lastBaselineAnchor](v89->_titleLabel, "lastBaselineAnchor");
    id v57 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:](v59, "constraintEqualToAnchor:constant:", 36.0);
    v91[6] = v57;
    v56 = -[UIView bottomAnchor](v89->_collectionViewWrapperView, "bottomAnchor");
    id v55 = -[UILabel lastBaselineAnchor](v89->_deviceOptionsHintLabel, "lastBaselineAnchor");
    id v54 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:](v56, "constraintEqualToAnchor:constant:", -20.0);
    v91[7] = v54;
    id v53 = -[UICollectionView leadingAnchor](v89->_collectionView, "leadingAnchor");
    v52 = -[UIView leadingAnchor](v89->_collectionViewWrapperView, "leadingAnchor");
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v91[8] = v51;
    id v50 = -[UICollectionView trailingAnchor](v89->_collectionView, "trailingAnchor");
    v49 = -[UIView trailingAnchor](v89->_collectionViewWrapperView, "trailingAnchor");
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v91[9] = v48;
    id v47 = -[UICollectionView topAnchor](v89->_collectionView, "topAnchor");
    v46 = -[UIView topAnchor](v89->_collectionViewWrapperView, "topAnchor");
    id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v91[10] = v45;
    id v44 = -[UICollectionView bottomAnchor](v89->_collectionView, "bottomAnchor");
    v43 = -[UIView bottomAnchor](v89->_collectionViewWrapperView, "bottomAnchor");
    id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
    v91[11] = v42;
    v79[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 12LL);

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v79[0]);
    v24 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v78 = -[UITapGestureRecognizer initWithTarget:action:](v24, "initWithTarget:action:", v89, "_handleMenuPress:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v78, "setAllowedPressTypes:", &off_149E0);
    -[TVSMGameControllersModuleOverlayView addGestureRecognizer:](v89, "addGestureRecognizer:", v78);
    objc_storeStrong((id *)&v78, 0LL);
    objc_storeStrong(v79, 0LL);
    objc_storeStrong((id *)&v80, 0LL);
    objc_storeStrong((id *)&v86, 0LL);
  }

  v26 = v89;
  objc_storeStrong((id *)&v89, 0LL);
  return v26;
}

  ;
}

  ;
}

- (void)setShowingDeviceOptionsHint:(BOOL)a3
{
  if (a3 != self->_showingDeviceOptionsHint)
  {
    self->_showingDeviceOptionsHint = a3;
    uint64_t v3 = -[TVSMGameControllersModuleOverlayView deviceOptionsHintLabel](self, "deviceOptionsHintLabel");
    -[UILabel setHidden:](v3, "setHidden:", !self->_showingDeviceOptionsHint);
  }

- (void)layoutSubviews
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModuleOverlayView;
  -[TVSMGameControllersModuleOverlayView layoutSubviews](&v17, "layoutSubviews");
  id v16 = -[TVSMGameControllersModuleOverlayView collectionViewWrapperView](v19, "collectionViewWrapperView");
  id v11 = [v16 layer];
  id v15 = [v11 mask];

  if (!v15) {
    goto LABEL_3;
  }
  [v16 bounds];
  rect1.origin.x = v2;
  rect1.origin.y = v3;
  rect1.size.width = v4;
  rect1.size.height = v5;
  [v15 bounds];
  rect2.origin.x = v6;
  rect2.origin.y = v7;
  rect2.size.width = v8;
  rect2.size.height = v9;
  if (!CGRectEqualToRect(rect1, rect2))
  {
LABEL_3:
    id v12 =  -[TVSMGameControllersModuleOverlayView _collectionViewWrapperViewGradientMask]( v19,  "_collectionViewWrapperViewGradientMask");
    id v10 = [v16 layer];
    [v10 setMask:v12];

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
}

- (void)_handleMenuPress:(id)a3
{
  CGFloat v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSMGameControllersModuleOverlayView menuButtonHandler](v5, "menuButtonHandler");
  if (v3) {
    (*((void (**)(void))v3 + 2))();
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_collectionViewWrapperViewGradientMask
{
  v17[2] = self;
  v17[1] = (id)a2;
  v17[0] = -[TVSMGameControllersModuleOverlayView collectionViewWrapperView](self, "collectionViewWrapperView");
  [v17[0] bounds];
  CGRect v16 = v20;
  double Height = CGRectGetHeight(v20);
  id v14 = +[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer");
  objc_msgSend(v14, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  id v3 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  CGFloat v4 = -[UIColor CGColor](v3, "CGColor");

  CGFloat v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0);
  CGFloat v6 = -[UIColor CGColor](v5, "CGColor");

  id v7 = v14;
  v19[0] = v4;
  v19[1] = v6;
  v19[2] = v6;
  v19[3] = v4;
  CGFloat v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19);
  objc_msgSend(v7, "setColors:");

  id v9 = v14;
  v18[0] = &off_14A10;
  id v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 14.0 / Height);
  v18[1] = v12;
  id v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (Height - 15.0) / Height);
  v18[2] = v11;
  v18[3] = &off_14A20;
  id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL);
  objc_msgSend(v9, "setLocations:");

  id v13 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v17, 0LL);
  return v13;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)showingDeviceOptionsHint
{
  return self->_showingDeviceOptionsHint;
}

- (id)menuButtonHandler
{
  return self->_menuButtonHandler;
}

- (void)setMenuButtonHandler:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)deviceOptionsHintLabel
{
  return self->_deviceOptionsHintLabel;
}

- (UIView)collectionViewWrapperView
{
  return self->_collectionViewWrapperView;
}

- (void).cxx_destruct
{
}

@end