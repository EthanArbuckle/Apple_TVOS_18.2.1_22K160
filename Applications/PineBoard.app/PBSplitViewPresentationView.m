@interface PBSplitViewPresentationView
- (PBApplication)application;
- (PBSplitViewPresentationView)initWithApplicationIconProvider:(id)a3;
- (UIEdgeInsets)scenePresentationInsets;
- (UIScenePresentation)scenePresentationView;
- (int64_t)effectiveUserInterfaceLayoutDirection;
- (void)_layoutSubviewsForHiddenState:(BOOL)a3;
- (void)_updateShadowPath;
- (void)_updateShroudAnimated:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (void)_userInterfaceLayoutDirectionChanged:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)sceneContentStateDidChange:(id)a3;
- (void)setApplication:(id)a3;
- (void)setScenePresentationInsets:(UIEdgeInsets)a3;
- (void)setScenePresentationView:(id)a3;
- (void)setScenePresentationViewHidden:(BOOL)a3 animated:(BOOL)a4 animationSettings:(id)a5 completion:(id)a6;
@end

@implementation PBSplitViewPresentationView

- (PBSplitViewPresentationView)initWithApplicationIconProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"applicationIconProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10026E9FC(a2, (uint64_t)self, (uint64_t)v78);
    }
    _bs_set_crash_log_message([v78 UTF8String]);
    __break(0);
    JUMPOUT(0x1000062F0LL);
  }

  v7 = v6;
  v88.receiver = self;
  v88.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationView;
  v8 = -[PBSplitViewPresentationView initWithFrame:]( &v88,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_applicationIconProvider, a3);
    v9->_scenePresentationViewHidden = 1;
    v10 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v10;

    v12 = v9->_backgroundView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v87 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainWorkspace]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 geometry]);

    id v16 = sub_1000E3C90(1LL, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 attributesForKey:@"application"]);
    [v18 cornerRadius];
    double v20 = v19;

    -[UIView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:", v20);
    v21 = v9->_backgroundView;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.100000001));
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_backgroundView, "layer"));
    objc_msgSend(v23, "setShadowOffset:", 10.0, 0.0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_backgroundView, "layer"));
    LODWORD(v25) = 1034147595;
    [v24 setShadowOpacity:v25];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_backgroundView, "layer"));
    id v27 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    objc_msgSend(v26, "setShadowColor:", objc_msgSend(v27, "CGColor"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_backgroundView, "layer"));
    [v28 setShadowRadius:45.0];

    v29 = objc_alloc_init(&OBJC_CLASS___UIBezierPath);
    shadowPath = v9->_shadowPath;
    v9->_shadowPath = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_backgroundView, "layer"));
    objc_msgSend(v31, "setShadowPath:", -[UIBezierPath CGPath](v9->_shadowPath, "CGPath"));

    -[PBSplitViewPresentationView addSubview:](v9, "addSubview:", v9->_backgroundView);
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
    v32 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v86);
    shroudView = v9->_shroudView;
    v9->_shroudView = v32;
    v85 = v32;

    v34 = v9->_shroudView;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 mainWorkspace]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 geometry]);

    id v38 = sub_1000E3C90(1LL, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 attributesForKey:@"application"]);
    [v40 cornerRadius];
    double v42 = v41;

    -[UIVisualEffectView _setContinuousCornerRadius:](v34, "_setContinuousCornerRadius:", v42);
    -[PBSplitViewPresentationView addSubview:](v9, "addSubview:", v9->_shroudView);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v85, "contentView"));
    v43 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v43,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v43, "setAxis:", 1LL);
    -[UIStackView setAlignment:](v43, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v43, "setSpacing:", 4.0);
    [v84 addSubview:v43];
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v43, "centerXAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v84 centerXAnchor]);
    v80 = (void *)objc_claimAutoreleasedReturnValue([v82 constraintEqualToAnchor:v81]);
    v90[0] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v43, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v84 centerYAnchor]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v79 constraintEqualToAnchor:v44]);
    v90[1] = v45;
    v83 = v43;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v43, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v84 leadingAnchor]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintGreaterThanOrEqualToAnchor:v47 constant:20.0]);
    v90[2] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v43, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v84 trailingAnchor]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintGreaterThanOrEqualToAnchor:v50 constant:20.0]);
    v90[3] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v52);

    v53 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = v53;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v9->_iconImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v9->_iconImageView, "setContentMode:", 1LL);
    id v55 = -[UIImageView setClipsToBounds:](v9->_iconImageView, "setClipsToBounds:", 1LL);
    v56 = v9->_iconImageView;
    TVSUIAppIconCornerRadiusForWidth(v55, 100.0);
    -[UIImageView _setContinuousCornerRadius:](v56, "_setContinuousCornerRadius:");
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v9->_iconImageView, "layer"));
    objc_msgSend(v57, "setShadowOffset:", 0.0, 6.0);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v9->_iconImageView, "layer"));
    LODWORD(v59) = 1028443341;
    [v58 setShadowOpacity:v59];

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v9->_iconImageView, "layer"));
    id v61 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    objc_msgSend(v60, "setShadowColor:", objc_msgSend(v61, "CGColor"));

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v9->_iconImageView, "layer"));
    [v62 setShadowRadius:5.0];

    -[UIStackView addArrangedSubview:](v83, "addArrangedSubview:", v9->_iconImageView);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v9->_iconImageView, "widthAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToConstant:100.0]);
    v89[0] = v64;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v9->_iconImageView, "heightAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToConstant:60.0]);
    v89[1] = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v67);

    v68 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleView = v9->_titleView;
    v9->_titleView = v68;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v9->_titleView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setNumberOfLines:](v9->_titleView, "setNumberOfLines:", 0LL);
    v70 = v9->_titleView;
    v71 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    -[UILabel setFont:](v70, "setFont:", v71);

    -[UILabel setTextAlignment:](v9->_titleView, "setTextAlignment:", 1LL);
    v72 = v9->_titleView;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v72, "setTextColor:", v73);

    v7 = v87;
    -[UIStackView addArrangedSubview:](v83, "addArrangedSubview:", v9->_titleView);
    -[PBSplitViewPresentationView _updateShroudAnimated:animations:completion:]( v9,  "_updateShroudAnimated:animations:completion:",  0LL,  0LL,  0LL);
    v74 = objc_alloc_init(&OBJC_CLASS___UIApplicationSceneSettingsDiffInspector);
    sceneSettingsDiffInspector = v9->_sceneSettingsDiffInspector;
    v9->_sceneSettingsDiffInspector = v74;

    -[UIApplicationSceneSettingsDiffInspector observeSafeAreaInsetsPortraitWithBlock:]( v9->_sceneSettingsDiffInspector,  "observeSafeAreaInsetsPortraitWithBlock:",  &stru_1003CFE90);
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v76 addObserver:v9 selector:"_userInterfaceLayoutDirectionChanged:" name:@"kPBUserInterfaceLayoutDirectionChangedNotification" object:0];
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationView;
  -[PBSplitViewPresentationView dealloc](&v4, "dealloc");
}

- (void)setApplication:(id)a3
{
  v5 = (PBApplication *)a3;
  if (self->_application != v5)
  {
    objc_storeStrong((id *)&self->_application, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView traitCollection](self->_iconImageView, "traitCollection"));
    [v6 displayScale];
    double v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppIconProviding iconImageForApplication:scale:]( self->_applicationIconProvider,  "iconImageForApplication:scale:",  v5,  v8));
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplication appInfo](self->_application, "appInfo"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 localizedName]);
    v12 = (void *)v11;
    v13 = &stru_1003E2910;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v14 = v13;

    -[UILabel setText:](self->_titleView, "setText:", v14);
  }
}

- (void)setScenePresentationView:(id)a3
{
  v5 = (UIScenePresentation *)a3;
  p_scenePresentationView = &self->_scenePresentationView;
  scenePresentationView = self->_scenePresentationView;
  if (scenePresentationView != v5)
  {
    double v8 = scenePresentationView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresentation presenter](v8, "presenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scene]);
    [v10 removeObserver:self];

    objc_storeStrong((id *)&self->_scenePresentationView, a3);
    -[PBSplitViewPresentationView insertSubview:belowSubview:]( self,  "insertSubview:belowSubview:",  *p_scenePresentationView,  self->_shroudView);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresentation presenter](*p_scenePresentationView, "presenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 scene]);
    [v12 addObserver:self];

    -[UIScenePresentation setClipsToBounds:](*p_scenePresentationView, "setClipsToBounds:", 1LL);
    v13 = *p_scenePresentationView;
    -[UIView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
    -[UIScenePresentation _setContinuousCornerRadius:](v13, "_setContinuousCornerRadius:");
    -[UIScenePresentation setAlpha:](v8, "setAlpha:", 0.0);
    double v14 = 1.0;
    if (!v8) {
      double v14 = 0.0;
    }
    -[UIScenePresentation setAlpha:](v5, "setAlpha:", v14);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100006648;
    v18[3] = &unk_1003CFEB8;
    double v19 = v5;
    double v20 = v8;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000667C;
    v16[3] = &unk_1003CFEE0;
    v17 = v20;
    v15 = v20;
    -[PBSplitViewPresentationView _updateShroudAnimated:animations:completion:]( self,  "_updateShroudAnimated:animations:completion:",  1LL,  v18,  v16);
  }
}

- (void)setScenePresentationViewHidden:(BOOL)a3 animated:(BOOL)a4 animationSettings:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(void))a6;
  if (self->_scenePresentationViewHidden == v8) {
    goto LABEL_5;
  }
  self->_scenePresentationViewHidden = v8;
  -[PBSplitViewPresentationView setNeedsLayout](self, "setNeedsLayout");
  if (!v7)
  {
    -[PBSplitViewPresentationView layoutIfNeeded](self, "layoutIfNeeded");
LABEL_5:
    v11[2](v11);
    goto LABEL_6;
  }

  -[PBSplitViewPresentationView _layoutSubviewsForHiddenState:](self, "_layoutSubviewsForHiddenState:", !v8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000067AC;
  v14[3] = &unk_1003CFF08;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000067C4;
  v12[3] = &unk_1003CFF30;
  v13 = v11;
  +[BSUIAnimationFactory animateWithSettings:actions:completion:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:completion:",  v10,  v14,  v12);

LABEL_6:
}

- (void)setScenePresentationInsets:(UIEdgeInsets)a3
{
  if (self->_scenePresentationInsets.left != a3.left
    || self->_scenePresentationInsets.top != a3.top
    || self->_scenePresentationInsets.right != a3.right
    || self->_scenePresentationInsets.bottom != a3.bottom)
  {
    self->_scenePresentationInsets = a3;
    -[PBSplitViewPresentationView setNeedsLayout](self, "setNeedsLayout");
  }

- (int64_t)effectiveUserInterfaceLayoutDirection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 userInterfaceLayoutDirection];

  return (int64_t)v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationView;
  -[PBSplitViewPresentationView layoutSubviews](&v3, "layoutSubviews");
  -[PBSplitViewPresentationView _layoutSubviewsForHiddenState:]( self,  "_layoutSubviewsForHiddenState:",  self->_scenePresentationViewHidden);
}

- (void)sceneContentStateDidChange:(id)a3
{
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v6 = a4;
  char v15 = 0;
  sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 settingsDiff]);
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:]( sceneSettingsDiffInspector,  "inspectDiff:withContext:",  v8,  &v15);

  if (v15)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionContext]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 animationFence]);
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationView window](self, "window"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 windowScene]);

      [v12 _synchronizeDrawingWithFence:v10];
    }

    -[PBSplitViewPresentationView setNeedsLayout](self, "setNeedsLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 animationSettings]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100006A08;
    v14[3] = &unk_1003CFF08;
    v14[4] = self;
    +[BSUIAnimationFactory animateWithSettings:actions:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:",  v13,  v14);
  }
}

- (void)_updateShroudAnimated:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresentation presenter](self->_scenePresentationView, "presenter"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scene]);
  BOOL v12 = [v11 contentState] != (id)2;

  v13 = self->_shroudView;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006B80;
  v18[3] = &unk_1003CFF58;
  double v19 = v13;
  BOOL v21 = v12;
  id v14 = v8;
  id v20 = v14;
  char v15 = v13;
  id v16 = objc_retainBlock(v18);
  v17 = v16;
  if (v6)
  {
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v16,  v9,  0.3,  0.0);
  }

  else
  {
    ((void (*)(void *))v16[2])(v16);
    if (v9) {
      v9[2](v9, 1LL);
    }
  }
}

- (void)_userInterfaceLayoutDirectionChanged:(id)a3
{
}

- (void)_layoutSubviewsForHiddenState:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = -[PBSplitViewPresentationView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  -[PBSplitViewPresentationView bounds](self, "bounds");
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  double v13 = v12;
  -[UIScenePresentation frame](self->_scenePresentationView, "frame");
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  double v21 = v13;
  if (v5 != 1)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v18);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    double v23 = MaxX - v15 - self->_scenePresentationInsets.right;
    goto LABEL_6;
  }

  double MaxX = CGRectGetMinX(*(CGRect *)&v18);
  if (v3) {
    goto LABEL_5;
  }
LABEL_3:
  double v23 = MaxX + self->_scenePresentationInsets.left;
LABEL_6:
  double v24 = round((v13 - v17) * 0.5);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresentation presenter](self->_scenePresentationView, "presenter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 scene]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uiSettings]);
  [v27 safeAreaInsetsPortrait];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  double v34 = v23;
  double v35 = v23 + v31;
  double v36 = v15 - (v31 + v33);
  -[UIScenePresentation setFrame:](self->_scenePresentationView, "setFrame:", v34, v24, v15, v17);
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v35, v24 + v29, v36, v17 - (v29 + 0.0));
  -[UIVisualEffectView setFrame:](self->_shroudView, "setFrame:", v35, v24 + 0.0, v36, v17);
  -[PBSplitViewPresentationView _updateShadowPath](self, "_updateShadowPath");
}

- (void)_updateShadowPath
{
  double v4 = v3 + 10.0;
  double v6 = v5 + 10.0;
  -[UIBezierPath removeAllPoints](self->_shadowPath, "removeAllPoints");
  -[UIBezierPath moveToPoint:](self->_shadowPath, "moveToPoint:", -10.0, -10.0);
  -[UIBezierPath addLineToPoint:](self->_shadowPath, "addLineToPoint:", v4, -10.0);
  -[UIBezierPath addLineToPoint:](self->_shadowPath, "addLineToPoint:", v4, v6);
  -[UIBezierPath addLineToPoint:](self->_shadowPath, "addLineToPoint:", -10.0, v6);
  -[UIBezierPath closePath](self->_shadowPath, "closePath");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v7, "setShadowPath:", -[UIBezierPath CGPath](self->_shadowPath, "CGPath"));
}

- (PBApplication)application
{
  return self->_application;
}

- (UIScenePresentation)scenePresentationView
{
  return self->_scenePresentationView;
}

- (UIEdgeInsets)scenePresentationInsets
{
  double top = self->_scenePresentationInsets.top;
  double left = self->_scenePresentationInsets.left;
  double bottom = self->_scenePresentationInsets.bottom;
  double right = self->_scenePresentationInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end