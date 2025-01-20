@interface PBUserSwitchingShroudView
+ (id)_switchingLabelText;
- (PBUserSwitchingShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4;
- (UIImageView)appIconImageView;
- (void)_dismissAppIconImageViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentAppIconImageViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)_setAdditionalViewsPresented:(BOOL)a3 animated:(BOOL)a4 animationGroup:(id)a5;
- (void)setAppIconImageView:(id)a3;
@end

@implementation PBUserSwitchingShroudView

+ (id)_switchingLabelText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfileApplicationManager sharedInstance]( &OBJC_CLASS___PBUserProfileApplicationManager,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 updatingUserProfile]);

  if (v3)
  {
    id v4 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v3];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"UserSwitchingShroudTextFormat" value:&stru_1003E2910 table:@"Localizable-UserProfiles"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedShortName]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v6, v7));
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"UserSwitchingShroudTextFallback" value:&stru_1003E2910 table:@"Localizable-UserProfiles"]);
  }

  return v8;
}

- (PBUserSwitchingShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PBUserSwitchingShroudView;
  v7 = -[PBSceneShroudView initWithSceneHandle:isOverLiveScene:](&v36, "initWithSceneHandle:isOverLiveScene:", v6, v4);
  if (v7)
  {
    TVSUIAppIconAttributesForVariant(v34, 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 clientProcessBundleIdentifier]);
    v9 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfoController enabledAndVisibleAppsFilter]( &OBJC_CLASS___PBAppInfoController,  "enabledAndVisibleAppsFilter"));
    v12 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v9,  "initWithInfoStore:filter:delegate:",  v10,  v11,  0LL);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v12, "appInfos"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v8]);

    v15 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    appIconImageView = v7->_appIconImageView;
    v7->_appIconImageView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v7->_appIconImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v17 = v7->_appIconImageView;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage tvsui_applicationIconImageForBundleIdentifier:]( &OBJC_CLASS___UIImage,  "tvsui_applicationIconImageForBundleIdentifier:",  v8));
    -[UIImageView setImage:](v17, "setImage:", v18);

    -[UIImageView setAlpha:](v7->_appIconImageView, "setAlpha:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7->_appIconImageView, "layer"));
    [v19 setCornerCurve:v35];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7->_appIconImageView, "layer"));
    [v20 setCornerRadius:*(double *)&v34[4]];

    -[UIImageView setClipsToBounds:](v7->_appIconImageView, "setClipsToBounds:", 1LL);
    v21 = v7->_appIconImageView;
    CGAffineTransformMakeScale(&v33, 0.33, 0.33);
    -[UIImageView setTransform:](v21, "setTransform:", &v33);
    -[UIImageView setHidden:](v7->_appIconImageView, "setHidden:", v14 == 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView stackView](v7, "stackView"));
    [v22 insertArrangedSubview:v7->_appIconImageView atIndex:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView stackView](v7, "stackView"));
    [v23 setCustomSpacing:v7->_appIconImageView afterView:80.0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v7->_appIconImageView, "widthAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToConstant:*(double *)&v34[2]]);
    v37[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v7->_appIconImageView, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToConstant:*(double *)&v34[3]]);
    v37[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v28);

    id v29 = [(id)objc_opt_class(v7) _switchingLabelText];
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView switchingLabel](v7, "switchingLabel"));
    [v31 setText:v30];
  }

  return v7;
}

- (void)_setAdditionalViewsPresented:(BOOL)a3 animated:(BOOL)a4 animationGroup:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = (dispatch_group_s *)a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBUserSwitchingShroudView;
  -[PBSceneShroudView _setAdditionalViewsPresented:animated:animationGroup:]( &v13,  "_setAdditionalViewsPresented:animated:animationGroup:",  v6,  v5,  v8);
  dispatch_group_enter(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C7EA0;
  v11[3] = &unk_1003CFF08;
  v12 = v8;
  v9 = v8;
  v10 = objc_retainBlock(v11);
  if (v6) {
    -[PBUserSwitchingShroudView _presentAppIconImageViewAnimated:completion:]( self,  "_presentAppIconImageViewAnimated:completion:",  v5,  v10);
  }
  else {
    -[PBUserSwitchingShroudView _dismissAppIconImageViewAnimated:completion:]( self,  "_dismissAppIconImageViewAnimated:completion:",  v5,  v10);
  }
}

- (void)_presentAppIconImageViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(void))a4;
  v7 = self->_appIconImageView;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000C8180;
  v27[3] = &unk_1003CFF08;
  v8 = v7;
  v28 = v8;
  v9 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C81D4;
  v25[3] = &unk_1003CFF08;
  v10 = v8;
  v26 = v10;
  v11 = objc_retainBlock(v25);
  if (v4)
  {
    dispatch_group_t v12 = dispatch_group_create();
    v18 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  29.0,  0.0,  0.0);
    objc_super v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v18,  0.0);
    -[UIViewPropertyAnimator addAnimations:](v13, "addAnimations:", v9);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000C81F0;
    v23[3] = &unk_1003D4120;
    v14 = v12;
    v24 = v14;
    -[UIViewPropertyAnimator addCompletion:](v13, "addCompletion:", v23);
    dispatch_group_enter(v14);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v13, "startAnimationAfterDelay:", 0.16);
    v15 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.17,  0.17,  0.83,  0.83);
    v16 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v15,  0.11);
    -[UIViewPropertyAnimator addAnimations:](v16, "addAnimations:", v11);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000C8208;
    v21[3] = &unk_1003D4120;
    v22 = v14;
    v17 = v14;
    -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v21);
    dispatch_group_enter(v17);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v16, "startAnimationAfterDelay:", 0.16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C8220;
    block[3] = &unk_1003D0110;
    v20 = v6;
    dispatch_group_notify(v17, &_dispatch_main_q, block);
  }

  else
  {
    ((void (*)(void *))v9[2])(v9);
    ((void (*)(void *))v11[2])(v11);
    v6[2](v6);
  }
}

- (void)_dismissAppIconImageViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(void))a4;
  v7 = self->_appIconImageView;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000C8500;
  v27[3] = &unk_1003CFF08;
  v8 = v7;
  v28 = v8;
  v9 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C8554;
  v25[3] = &unk_1003CFF08;
  v10 = v8;
  v26 = v10;
  v11 = objc_retainBlock(v25);
  if (v4)
  {
    dispatch_group_t v12 = dispatch_group_create();
    v18 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.33,  0.0,  0.83,  0.83);
    objc_super v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v18,  0.28);
    -[UIViewPropertyAnimator addAnimations:](v13, "addAnimations:", v9);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000C8570;
    v23[3] = &unk_1003D4120;
    v14 = v12;
    v24 = v14;
    -[UIViewPropertyAnimator addCompletion:](v13, "addCompletion:", v23);
    dispatch_group_enter(v14);
    -[UIViewPropertyAnimator startAnimation](v13, "startAnimation");
    v15 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.17,  0.17,  0.83,  0.83);
    v16 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v15,  0.1);
    -[UIViewPropertyAnimator addAnimations:](v16, "addAnimations:", v11);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000C8588;
    v21[3] = &unk_1003D4120;
    v22 = v14;
    v17 = v14;
    -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v21);
    dispatch_group_enter(v17);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v16, "startAnimationAfterDelay:", 0.18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C85A0;
    block[3] = &unk_1003D0110;
    v20 = v6;
    dispatch_group_notify(v17, &_dispatch_main_q, block);
  }

  else
  {
    ((void (*)(void *))v9[2])(v9);
    ((void (*)(void *))v11[2])(v11);
    v6[2](v6);
  }
}

- (UIImageView)appIconImageView
{
  return self->_appIconImageView;
}

- (void)setAppIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end