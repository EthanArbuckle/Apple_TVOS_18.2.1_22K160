@interface TVSMMainViewController
- (BOOL)dismissTeachableMomentIfNeeded;
- (BOOL)isDismissingTeachableMoment;
- (PBSOverlayLayoutElementHandle)gridNavigationLayoutElement;
- (TVSMButtonGridContainerViewController)gridContainerViewController;
- (TVSMButtonGridNavigationController)gridNavigationController;
- (TVSMMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSMTeachableMomentViewController)teachableMomentViewController;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)preferredFocusEnvironments;
- (void)_menuPressed:(id)a3;
- (void)_showTeachableMoment;
- (void)_updateOverlayLayoutElementWithFrame:(CGRect)a3 andTransitionContext:(id)a4;
- (void)_updateOverlayLayoutElementWithViewController:(id)a3 transitionContext:(id)a4;
- (void)dismissContentAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForPictureInPictureStopOrSwapAnimation;
- (void)presentContentAnimated:(BOOL)a3 options:(id)a4 withCompletion:(id)a5;
- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3;
- (void)setIsDismissingTeachableMoment:(BOOL)a3;
- (void)setTeachableMomentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSMMainViewController

- (TVSMMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  v4 = v18;
  v18 = 0LL;
  v15.receiver = v4;
  v15.super_class = (Class)&OBJC_CLASS___TVSMMainViewController;
  v14 = -[TVSMMainViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", location[0], v16);
  v18 = v14;
  objc_storeStrong((id *)&v18, v14);
  if (v14)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVSMButtonGridContainerViewController);
    gridContainerViewController = v18->_gridContainerViewController;
    v18->_gridContainerViewController = v5;

    v7 = objc_alloc(&OBJC_CLASS___TVSMButtonGridNavigationController);
    v8 = -[TVSMButtonGridNavigationController initWithRootViewController:]( v7,  "initWithRootViewController:",  v18->_gridContainerViewController);
    gridNavigationController = v18->_gridNavigationController;
    v18->_gridNavigationController = v8;

    -[TVSMButtonGridNavigationController setDelegate:](v18->_gridNavigationController, "setDelegate:", v18);
    id v12 = +[TVHMPIPController defaultPIPController](&OBJC_CLASS___TVHMPIPController, "defaultPIPController");
    [v12 setInterfaceRestorer:v18];
  }

  v11 = v18;
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v11;
}

- (void)viewDidLoad
{
  v31 = self;
  SEL v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVSMMainViewController;
  -[TVSMMainViewController viewDidLoad](&v29, "viewDidLoad");
  id v28 = -[TVSMMainViewController view](v31, "view");
  -[TVSMMainViewController bs_addChildViewController:]( v31,  "bs_addChildViewController:",  v31->_gridNavigationController);
  id v27 = -[TVSMButtonGridNavigationController view](v31->_gridNavigationController, "view");
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v26 = [v28 effectiveUserInterfaceLayoutDirection] == (id)1;
  double v25 = *(double *)&qword_1000562E8 + *(double *)&qword_1000562F0;
  if (v26) {
    double tx = -v25;
  }
  else {
    double tx = v25;
  }
  CGAffineTransformMakeTranslation(&v24, tx, 0.0);
  memcpy(__dst, &v24, sizeof(__dst));
  [v27 setTransform:__dst];
  id v14 = [v27 widthAnchor];
  id v13 = [v14 constraintEqualToConstant:*(double *)&qword_1000562F0];
  v32[0] = v13;
  id v12 = [v27 topAnchor];
  id v11 = [v28 topAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", *(double *)&qword_1000562F8);
  v32[1] = v10;
  id v9 = [v27 bottomAnchor];
  id v8 = [v28 bottomAnchor];
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", -*(double *)&qword_1000562F8);
  v32[2] = v7;
  id v6 = [v27 trailingAnchor];
  id v5 = [v28 trailingAnchor];
  id v4 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", -*(double *)&qword_1000562E8);
  v32[3] = v4;
  id v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);
  v2 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  id location = -[UITapGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v31, "_menuPressed:");
  [location setAllowedPressTypes:&off_10004BAF8];
  id v15 = -[TVSMMainViewController view](v31, "view");
  [v15 addGestureRecognizer:location];

  v17 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  id v16 = -[TVSMSystemMenuManager startupContext](v17, "startupContext");
  unsigned __int8 v18 = -[TVSMSystemMenuStartupContext showTeachableMoment](v16, "showTeachableMoment");

  if ((v18 & 1) != 0)
  {
    -[TVSMMainViewController _showTeachableMoment](v31, "_showTeachableMoment");
    id v3 = -[TVSMTeachableMomentViewController view](v31->_teachableMomentViewController, "view");
    memcpy(v20, &v24, sizeof(v20));
    [v3 setTransform:v20];
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
}

- (id)preferredFocusEnvironments
{
  char v6 = 0;
  char v4 = 0;
  if (self->_teachableMomentViewController)
  {
    teachableMomentViewController = self->_teachableMomentViewController;
    id v7 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &teachableMomentViewController,  1LL);
    char v6 = 1;
    v2 = v7;
  }

  else
  {
    gridNavigationController = self->_gridNavigationController;
    id v5 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &gridNavigationController,  1LL);
    char v4 = 1;
    v2 = v5;
  }

  id v8 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  return v8;
  }
}

- (void)presentContentAnimated:(BOOL)a3 options:(id)a4 withCompletion:(id)a5
{
  v50 = self;
  SEL v49 = a2;
  BOOL v48 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v46 = 0LL;
  objc_storeStrong(&v46, a5);
  context = objc_autoreleasePoolPush();
  id v19 = -[TVSMMainViewController view](v50, "view");
  [v19 setNeedsLayout];

  id v20 = -[TVSMMainViewController view](v50, "view");
  [v20 layoutIfNeeded];

  id v21 = +[TVHMPIPController defaultPIPController](&OBJC_CLASS___TVHMPIPController, "defaultPIPController");
  unsigned __int8 v22 = [v21 isRestoringUserInterfaceFromPIP];

  if ((v22 & 1) != 0)
  {
    (*((void (**)(void))v46 + 2))();
    int v45 = 1;
  }

  else
  {
    id v44 = +[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence");
    v43[3] = COERCE_ID(1.0);
    v43[2] = (id)0x4062C00000000000LL;
    v43[1] = COERCE_ID(30.0);
    v43[0] =  +[BSSpringAnimationSettings settingsWithMass:stiffness:damping:]( &OBJC_CLASS___BSSpringAnimationSettings,  "settingsWithMass:stiffness:damping:",  1.0,  150.0,  30.0);
    id v12 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
    sub_100018890();
    v41[1] = v5;
    v41[2] = v6;
    id v42 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v12,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  150.0,  30.0,  *(double *)&v5,  *(double *)&v6);
    v41[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v42,  0.0);
    id v13 = v41[0];
    v35 = _NSConcreteStackBlock;
    int v36 = -1073741824;
    int v37 = 0;
    v38 = sub_1000188BC;
    v39 = &unk_100048E50;
    v40 = v50;
    [v13 addAnimations:&v35];
    id v14 = v41[0];
    id v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    v31 = sub_1000189A4;
    v32 = &unk_100049528;
    id v34 = v46;
    v33 = v50;
    [v14 addCompletion:&v28];
    id v7 = (PBSOverlayLayoutElementHandle *)+[PBSOverlayLayoutElementHandle newControlCenterElementHandle]( &OBJC_CLASS___PBSOverlayLayoutElementHandle,  "newControlCenterElementHandle");
    gridNavigationLayoutElement = v50->_gridNavigationLayoutElement;
    v50->_gridNavigationLayoutElement = v7;

    -[TVSMButtonGridNavigationController setLayoutElement:]( v50->_gridNavigationController,  "setLayoutElement:",  v50->_gridNavigationLayoutElement);
    id v27 =  +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  v43[0],  v44);
    id v26 = (id)grid_log( -[TVSMMainViewController _updateOverlayLayoutElementWithViewController:transitionContext:]( v50,  "_updateOverlayLayoutElementWithViewController:transitionContext:",  v50->_gridContainerViewController,  v27));
    char v25 = 1;
    id v15 = (os_log_s *)(id)grid_log(v26);
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v50);

    os_signpost_id_t v24 = v16;
    if (v16 && v24 != -1LL && os_signpost_enabled((os_log_t)v26))
    {
      log = (os_log_s *)v26;
      os_signpost_type_t type = v25;
      os_signpost_id_t spid = v24;
      sub_10000BF94(v23);
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  type,  spid,  "AnimateGrid",  (const char *)&unk_100046F3F,  v23,  2u);
    }

    objc_storeStrong(&v26, 0LL);
    [v41[0] startAnimation];
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong((id *)&v33, 0LL);
    objc_storeStrong(&v34, 0LL);
    objc_storeStrong((id *)&v40, 0LL);
    objc_storeStrong(v41, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(v43, 0LL);
    objc_storeStrong(&v44, 0LL);
    int v45 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (!v45) {
    int v45 = 0;
  }
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&location, 0LL);
}

  ;
}

- (void)dismissContentAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v59 = self;
  SEL v58 = a2;
  BOOL v57 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  context = objc_autoreleasePoolPush();
  v55[1] = (id)0x3FDCCCCCCCCCCCCDLL;
  char v4 = objc_alloc(&OBJC_CLASS___CAMediaTimingFunction);
  LODWORD(v5) = 1050253722;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0.25;
  LODWORD(v8) = 1.0;
  v55[0] = -[CAMediaTimingFunction initWithControlPoints::::](v4, "initWithControlPoints::::", v5, v6, v7, v8);
  id v54 =  +[BSAnimationSettings settingsWithDuration:timingFunction:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:timingFunction:",  v55[0],  0.45);
  id v53 = -[UICubicTimingParameters initWithCustomCurve:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithCustomCurve:",  v55[0]);
  id v52 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v53,  0.45);
  id v11 = v52;
  id v46 = _NSConcreteStackBlock;
  int v47 = -1073741824;
  int v48 = 0;
  SEL v49 = sub_100018FE8;
  v50 = &unk_100048E50;
  v51 = v59;
  [v11 addAnimations:&v46];
  id v12 = v52;
  v40 = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  v43 = sub_100019170;
  id v44 = &unk_100049550;
  id v45 = location;
  [v12 addCompletion:&v40];
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_1000191A8;
  int v36 = &unk_100049578;
  id v37 = v54;
  v38 = v59;
  id v39 = objc_retainBlock(&v32);
  os_signpost_id_t v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  id v27 = sub_1000192A0;
  id v28 = &unk_100048DD8;
  id v30 = v39;
  id v29 = v52;
  id v31 = objc_retainBlock(&v24);
  id v13 = -[TVSMMainViewController presentedViewController](v59, "presentedViewController");

  if (v13)
  {
    id v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_1000192E8;
    unsigned __int8 v18 = &unk_1000495F0;
    id v19 = v59;
    BOOL v22 = v57;
    id v20 = v31;
    id v21 = location;
    id v23 = objc_retainBlock(&v14);
    if (!v57)
    {
      id v9 = -[TVSMMainViewController view](v59, "view");
      [v9 setHidden:1];

      (*((void (**)(void))v39 + 2))();
    }

    (*((void (**)(void))v23 + 2))();
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong((id *)&v19, 0LL);
  }

  else if (v57)
  {
    (*((void (**)(void))v31 + 2))();
  }

  else
  {
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v31);
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong((id *)&v38, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(v55, 0LL);
  objc_autoreleasePoolPop(context);
  objc_storeStrong(&location, 0LL);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  if ([location[0] _appearState] == 2)
  {
    char v16 = 0;
    if (v20)
    {
      id v17 =  +[TVSMButtonGridExpandedAnimationController animationSettingsForOperation:]( TVSMButtonGridExpandedAnimationController,  "animationSettingsForOperation:",  [location[0] lastOperation]);
      char v16 = 1;
      id v5 = v17;
    }

    else
    {
      id v5 = 0LL;
    }

    id v18 = v5;
    if ((v16 & 1) != 0) {

    }
    char v13 = 0;
    if (v18)
    {
      id v14 = +[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence");
      char v13 = 1;
      id v6 = v14;
    }

    else
    {
      id v6 = 0LL;
    }

    id v15 = v6;
    if ((v13 & 1) != 0) {

    }
    char v10 = 0;
    if (v18)
    {
      id v11 =  +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  v18,  v15);
      char v10 = 1;
      double v7 = v11;
    }

    else
    {
      double v7 = (PBSOverlayLayoutTransitionContext *)0LL;
    }

    id v12 = v7;
    if ((v10 & 1) != 0) {

    }
    -[TVSMMainViewController _updateOverlayLayoutElementWithViewController:transitionContext:]( v23,  "_updateOverlayLayoutElementWithViewController:transitionContext:",  v21,  v12);
    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v18, 0LL);
    int v19 = 0;
  }

  else
  {
    int v19 = 1;
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v19 = a4;
  id v18 = 0LL;
  objc_storeStrong(&v18, a5);
  id v17 = 0LL;
  objc_storeStrong(&v17, a6);
  char v16 = objc_alloc_init(&OBJC_CLASS___TVSMButtonGridExpandedAnimationController);
  id v14 = v16;
  -[TVSMButtonGridContainerViewController selectedCellFrame](v21->_gridContainerViewController, "selectedCellFrame");
  -[TVSMButtonGridExpandedAnimationController setOriginatingFrame:](v14, "setOriginatingFrame:", v6, v7, v8, v9);
  -[TVSMButtonGridExpandedAnimationController setPresenting:](v16, "setPresenting:", v19 == 1);
  id v15 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

- (void)_showTeachableMoment
{
  v2 = objc_opt_new(&OBJC_CLASS___TVSMTeachableMomentViewController);
  teachableMomentViewController = self->_teachableMomentViewController;
  self->_teachableMomentViewController = v2;

  -[TVSMTeachableMomentViewController willMoveToParentViewController:]( self->_teachableMomentViewController,  "willMoveToParentViewController:",  self);
  -[TVSMMainViewController addChildViewController:]( self,  "addChildViewController:",  self->_teachableMomentViewController);
  id v5 = -[TVSMMainViewController view](self, "view");
  id v4 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  objc_msgSend(v5, "addSubview:");

  -[TVSMTeachableMomentViewController didMoveToParentViewController:]( self->_teachableMomentViewController,  "didMoveToParentViewController:",  self);
  id v6 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v25 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  id v24 = [v25 widthAnchor];
  id v23 = [v24 constraintEqualToConstant:*(double *)&qword_1000562F0];
  v27[0] = v23;
  id v22 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  id v21 = [v22 trailingAnchor];
  id v20 = -[TVSMMainViewController view](self, "view");
  id v19 = [v20 trailingAnchor];
  id v18 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", -*(double *)&qword_1000562E8);
  v27[1] = v18;
  id v17 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  id v16 = [v17 topAnchor];
  id v15 = -[TVSMMainViewController view](self, "view");
  id v14 = [v15 topAnchor];
  id v13 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", *(double *)&qword_1000562F8);
  v27[2] = v13;
  id v12 = -[TVSMTeachableMomentViewController view](self->_teachableMomentViewController, "view");
  id v11 = [v12 bottomAnchor];
  id v10 = -[TVSMMainViewController view](self, "view");
  id v9 = [v10 bottomAnchor];
  id v8 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -*(double *)&qword_1000562F8);
  v27[3] = v8;
  double v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
}

- (BOOL)dismissTeachableMomentIfNeeded
{
  id v28 = self;
  v27[1] = (id)a2;
  if (self->_teachableMomentViewController && !v28->_isDismissingTeachableMoment)
  {
    v28->_isDismissingTeachableMoment = 1;
    id v8 = -[TVSMMainViewController teachableMomentViewController](v28, "teachableMomentViewController");
    -[TVSMTeachableMomentViewController animateTeachableMomentAction](v8, "animateTeachableMomentAction");

    id v9 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
    sub_10001A018();
    double v25 = v2;
    double v26 = v3;
    sub_10001A018();
    v24[1] = v4;
    v24[2] = v5;
    v27[0] = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v9,  "initWithControlPoint1:controlPoint2:",  v25,  v26,  *(double *)&v4,  *(double *)&v5);
    id v6 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    v24[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v6,  "initWithDuration:timingParameters:",  v27[0],  0.22);
    id v10 = v24[0];
    id v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = sub_10001A044;
    id v22 = &unk_100048E50;
    id v23 = v28;
    [v10 addAnimations:&v18];
    id v11 = v24[0];
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_10001A0B0;
    id v16 = &unk_100049618;
    id v17 = v28;
    [v11 addCompletion:&v12];
    [v24[0] startAnimationAfterDelay:1.5];
    char v29 = 1;
    objc_storeStrong((id *)&v17, 0LL);
    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(v24, 0LL);
    objc_storeStrong(v27, 0LL);
  }

  else
  {
    char v29 = 0;
  }

  return v29 & 1;
}

  ;
}

- (void)_menuPressed:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v3 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  -[TVSMSystemMenuManager dismissSystemMenuAnimated:result:](v3, "dismissSystemMenuAnimated:result:", 1LL, 0LL);

  objc_storeStrong(location, 0LL);
}

- (void)_updateOverlayLayoutElementWithViewController:(id)a3 transitionContext:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v14 = [location[0] view];
  [v14 frame];
  *(void *)&__int128 v19 = v4;
  *((void *)&v19 + 1) = v5;
  *(void *)&__int128 v20 = v6;
  *((void *)&v20 + 1) = v7;

  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___TVSMViewControllerPlatterFrameProviding])
  {
    id v18 = location[0];
    id v17 = -[TVSMButtonGridNavigationController view](v23->_gridNavigationController, "view");
    [v18 untransformedPlatterFrameInCoordinateSpace:v17];
    *(void *)&__int128 v15 = v8;
    *((void *)&v15 + 1) = v9;
    *(void *)&__int128 v16 = v10;
    *((void *)&v16 + 1) = v11;
    __int128 v19 = v15;
    __int128 v20 = v16;
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
  }

  -[TVSMMainViewController _updateOverlayLayoutElementWithFrame:andTransitionContext:]( v23,  "_updateOverlayLayoutElementWithFrame:andTransitionContext:",  v21,  v19,  v20,  &v21);
  objc_storeStrong(v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateOverlayLayoutElementWithFrame:(CGRect)a3 andTransitionContext:(id)a4
{
  CGRect v27 = a3;
  double v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  id v24 = -[TVSMButtonGridNavigationController view](v26->_gridNavigationController, "view");
  if (v24) {
    [v24 transform];
  }
  else {
    memset(&__b, 0, sizeof(__b));
  }
  CGAffineTransformInvert(&v22, &__b);
  CGRect v23 = CGRectApplyAffineTransform(v27, &v22);
  uint64_t v11 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  id v10 = -[UIScreen coordinateSpace](v11, "coordinateSpace");
  objc_msgSend( v10,  "convertRect:fromCoordinateSpace:",  v24,  v23.origin.x,  v23.origin.y,  v23.size.width,  v23.size.height);
  *(void *)&__int128 v19 = v4;
  *((void *)&v19 + 1) = v5;
  *(void *)&__int128 v20 = v6;
  *((void *)&v20 + 1) = v7;

  gridNavigationLayoutElement = v26->_gridNavigationLayoutElement;
  id v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  __int128 v15 = sub_10001A5CC;
  __int128 v16 = &unk_100049638;
  __int128 v17 = v19;
  __int128 v18 = v20;
  id v9 =  -[PBSOverlayLayoutElementHandle updateElement:withTransitionContext:]( gridNavigationLayoutElement,  "updateElement:withTransitionContext:",  &v12,  location[0]);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3
{
  __int128 v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = -[TVSMMainViewController view](v17, "view");
  id v15 = [v7 window];

  [v15 bounds];
  double v11 = v3;
  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  id v8 = [location[0] view];
  objc_msgSend(v8, "setFrame:", v11, v12, v13, v14);

  id v9 = v15;
  id v10 = [location[0] view];
  objc_msgSend(v9, "addSubview:");

  -[TVSMMainViewController presentViewController:animated:completion:]( v17,  "presentViewController:animated:completion:",  location[0],  0LL,  0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)prepareForPictureInPictureStopOrSwapAnimation
{
}

- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3
{
  id location[2] = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  [location[0] dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0LL);
}

- (TVSMButtonGridNavigationController)gridNavigationController
{
  return self->_gridNavigationController;
}

- (TVSMButtonGridContainerViewController)gridContainerViewController
{
  return self->_gridContainerViewController;
}

- (PBSOverlayLayoutElementHandle)gridNavigationLayoutElement
{
  return self->_gridNavigationLayoutElement;
}

- (BOOL)isDismissingTeachableMoment
{
  return self->_isDismissingTeachableMoment;
}

- (void)setIsDismissingTeachableMoment:(BOOL)a3
{
  self->_isDismissingTeachableMoment  = a3;
}

- (TVSMTeachableMomentViewController)teachableMomentViewController
{
  return self->_teachableMomentViewController;
}

- (void)setTeachableMomentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end