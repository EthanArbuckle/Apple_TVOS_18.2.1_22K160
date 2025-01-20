@interface TVSSMainViewController
- (TVSSDebugInfoHUDViewController)debugInfoHUDViewController;
- (TVSSDebugMainViewController)debugViewController;
- (TVSSMainViewController)initWithDataSourceControllerOverlord:(id)a3;
- (TVSSMenuBarViewController)menuBarViewController;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (TVSSMenuModeController)menuModeController;
- (_TVSSFocusSinkView)focusSinkView;
- (id)preferredFocusEnvironments;
- (void)dealloc;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)setDebugInfoHUDViewController:(id)a3;
- (void)setDebugViewController:(id)a3;
- (void)setFocusSinkView:(id)a3;
- (void)setMenuBarViewController:(id)a3;
- (void)setMenuModeController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSMainViewController

- (TVSSMainViewController)initWithDataSourceControllerOverlord:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0LL;
  v11.receiver = v3;
  v11.super_class = (Class)&OBJC_CLASS___TVSSMainViewController;
  v13 = -[TVSSMainViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dataSourceControllerOverlord, location[0]);
    v4 = objc_alloc(&OBJC_CLASS___TVSSMenuBarViewController);
    v5 = -[TVSSMenuBarViewController initWithDataSourceControllerOverlord:]( v4,  "initWithDataSourceControllerOverlord:",  location[0]);
    menuBarViewController = v13->_menuBarViewController;
    v13->_menuBarViewController = v5;

    v7 = (TVSSMenuModeController *)[location[0] menuModeController];
    menuModeController = v13->_menuModeController;
    v13->_menuModeController = v7;

    -[TVSSMenuModeController addControllerObserver:](v13->_menuModeController, "addControllerObserver:", v13);
  }

  v10 = v13;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v10;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuModeController removeControllerObserver:](self->_menuModeController, "removeControllerObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSMainViewController;
  -[TVSSMainViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  v98 = self;
  SEL v97 = a2;
  v96.receiver = self;
  v96.super_class = (Class)&OBJC_CLASS___TVSSMainViewController;
  -[TVSSMainViewController viewDidLoad](&v96, "viewDidLoad");
  id v95 = -[TVSSMainViewController view](v98, "view");
  v100 = (dispatch_once_t *)&unk_100221920;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6708);
  if (*v100 != -1) {
    dispatch_once(v100, location);
  }
  objc_storeStrong(&location, 0LL);
  v80 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults doubleForKey:](v80, "doubleForKey:", @"TVSUIScaleFactor");
  CGFloat v81 = v2;

  double v94 = v81;
  CGAffineTransformMakeScale(&v93, v81, v81);
  memcpy(&__dst, &v93, sizeof(__dst));
  CGAffineTransformTranslate(&v92, &__dst, (1.0 - v94) * 50.0, (1.0 - v94) * 80.0);
  memcpy(&v93, &v92, sizeof(v93));
  memcpy(v90, &v93, sizeof(v90));
  [v95 setTransform:v90];
  id v89 = [v95 safeAreaLayoutGuide];
  if ((_os_feature_enabled_impl("UIKit", "tv_focus_active_scene_hid_updates") & 1) == 0)
  {
    SEL v3 = objc_alloc_init(&OBJC_CLASS____TVSSFocusSinkView);
    focusSinkView = v98->_focusSinkView;
    v98->_focusSinkView = v3;

    -[_TVSSFocusSinkView setTranslatesAutoresizingMaskIntoConstraints:]( v98->_focusSinkView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    [v95 addSubview:v98->_focusSinkView];
    id v79 = -[_TVSSFocusSinkView trailingAnchor](v98->_focusSinkView, "trailingAnchor");
    id v78 = [v95 trailingAnchor];
    id v77 = objc_msgSend(v79, "constraintEqualToAnchor:");
    v104[0] = v77;
    id v76 = -[_TVSSFocusSinkView topAnchor](v98->_focusSinkView, "topAnchor");
    id v75 = [v95 topAnchor];
    id v74 = objc_msgSend(v76, "constraintEqualToAnchor:");
    v104[1] = v74;
    v73 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  -[TVSSMainViewController addChildViewController:](v98, "addChildViewController:", v98->_menuBarViewController);
  id v88 = -[TVSSMenuBarViewController view](v98->_menuBarViewController, "view");
  [v88 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v95 addSubview:v88];
  -[TVSSMenuBarViewController didMoveToParentViewController:]( v98->_menuBarViewController,  "didMoveToParentViewController:",  v98);
  id v72 = [v88 leadingAnchor];
  id v71 = [v95 leadingAnchor];
  id v70 = objc_msgSend(v72, "constraintEqualToAnchor:");
  v103[0] = v70;
  id v69 = [v88 trailingAnchor];
  id v68 = [v95 trailingAnchor];
  id v67 = objc_msgSend(v69, "constraintEqualToAnchor:");
  v103[1] = v67;
  id v66 = [v88 topAnchor];
  id v65 = [v95 topAnchor];
  id v64 = objc_msgSend(v66, "constraintEqualToAnchor:");
  v103[2] = v64;
  id v63 = [v88 bottomAnchor];
  id v62 = [v95 bottomAnchor];
  id v61 = objc_msgSend(v63, "constraintEqualToAnchor:");
  v103[3] = v61;
  v60 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v103, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((TVSSIsInternalVariant() & 1) != 0 && (TVSSDebugMenuEnabled() & 1) != 0)
  {
    v87 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    v25 = v87;
    id v27 = +[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor");
    id v26 = [v27 colorWithAlphaComponent:0.8];
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:");

    v28 = -[UIView layer](v87, "layer");
    -[CALayer setCornerRadius:](v28, "setCornerRadius:", 12.0);

    v29 = -[UIView layer](v87, "layer");
    -[CALayer setCornerCurve:](v29, "setCornerCurve:", kCACornerCurveContinuous);

    [v95 addSubview:v87];
    v30 = -[TVSSMainViewController dataSourceControllerOverlord](v98, "dataSourceControllerOverlord");
    v86 = -[TVSSMenuDataSourceControllerOverlord privacyController](v30, "privacyController");

    v31 = objc_alloc(&OBJC_CLASS___TVSSDebugMainViewController);
    v32 = -[TVSSMainViewController dataSourceControllerOverlord](v98, "dataSourceControllerOverlord");
    v5 = -[TVSSDebugMainViewController initWithDataSourceControllerOverlord:privacyController:]( v31,  "initWithDataSourceControllerOverlord:privacyController:");
    debugViewController = v98->_debugViewController;
    v98->_debugViewController = v5;

    v7 = objc_alloc(&OBJC_CLASS___UINavigationController);
    v85 = -[UINavigationController initWithRootViewController:]( v7,  "initWithRootViewController:",  v98->_debugViewController);
    -[TVSSMainViewController addChildViewController:](v98, "addChildViewController:", v85);
    id v33 = v95;
    id v34 = -[UINavigationController view](v85, "view");
    objc_msgSend(v33, "addSubview:");

    -[UINavigationController didMoveToParentViewController:](v85, "didMoveToParentViewController:", v98);
    id v84 = -[UINavigationController view](v85, "view");
    [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v84 setClipsToBounds:0];
    id v59 = [v84 widthAnchor];
    id v58 = [v89 widthAnchor];
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:multiplier:", 0.4);
    v102[0] = v57;
    id v56 = [v84 heightAnchor];
    id v55 = [v89 heightAnchor];
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
    v102[1] = v54;
    id v53 = [v84 leadingAnchor];
    id v52 = [v89 leadingAnchor];
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v102[2] = v51;
    id v50 = [v84 centerYAnchor];
    id v49 = [v89 centerYAnchor];
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v102[3] = v48;
    v47 = -[UIView leadingAnchor](v87, "leadingAnchor");
    id v46 = [v84 leadingAnchor];
    id v45 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v47, "constraintEqualToAnchor:");
    v102[4] = v45;
    v44 = -[UIView trailingAnchor](v87, "trailingAnchor");
    id v43 = [v84 trailingAnchor];
    id v42 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v44, "constraintEqualToAnchor:");
    v102[5] = v42;
    v41 = -[UIView topAnchor](v87, "topAnchor");
    id v40 = [v84 topAnchor];
    id v39 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v41, "constraintEqualToAnchor:");
    v102[6] = v39;
    v38 = -[UIView bottomAnchor](v87, "bottomAnchor");
    id v37 = [v84 bottomAnchor];
    id v36 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v38, "constraintEqualToAnchor:");
    v102[7] = v36;
    v35 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v102, 8LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong(&v84, 0LL);
    objc_storeStrong((id *)&v85, 0LL);
    objc_storeStrong((id *)&v86, 0LL);
    objc_storeStrong((id *)&v87, 0LL);
  }

  if ((TVSSIsInternalVariant() & 1) != 0 && (TVSSDebugInfoHUDEnabled() & 1) != 0)
  {
    v10 = -[TVSSMainViewController dataSourceControllerOverlord](v98, "dataSourceControllerOverlord");
    v83 = -[TVSSMenuDataSourceControllerOverlord privacyController](v10, "privacyController");

    objc_super v11 = objc_alloc(&OBJC_CLASS___TVSSDebugInfoHUDViewController);
    v12 = -[TVSSMainViewController menuModeController](v98, "menuModeController");
    v8 = -[TVSSDebugInfoHUDViewController initWithMenuModeController:privacyController:]( v11,  "initWithMenuModeController:privacyController:");
    debugInfoHUDViewController = v98->_debugInfoHUDViewController;
    v98->_debugInfoHUDViewController = v8;

    -[TVSSMainViewController addChildViewController:](v98, "addChildViewController:", v98->_debugInfoHUDViewController);
    id v13 = v95;
    id v14 = -[TVSSDebugInfoHUDViewController view](v98->_debugInfoHUDViewController, "view");
    objc_msgSend(v13, "addSubview:");

    -[TVSSDebugInfoHUDViewController didMoveToParentViewController:]( v98->_debugInfoHUDViewController,  "didMoveToParentViewController:",  v98);
    id v82 = -[TVSSDebugInfoHUDViewController view](v98->_debugInfoHUDViewController, "view");
    [v82 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v24 = [v82 trailingAnchor];
    id v23 = [v89 trailingAnchor];
    id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v101[0] = v22;
    id v21 = [v82 bottomAnchor];
    id v20 = [v89 bottomAnchor];
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v101[1] = v19;
    id v18 = [v82 widthAnchor];
    id v17 = [v89 widthAnchor];
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", 0.333);
    v101[2] = v16;
    v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v101, 3LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong(&v82, 0LL);
    objc_storeStrong((id *)&v83, 0LL);
  }

  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v95, 0LL);
}

- (id)preferredFocusEnvironments
{
  v5 = -[TVSSMainViewController menuModeController](self, "menuModeController");
  id v6 = -[TVSSMenuModeController mode](v5, "mode");

  if (v6 == (id)3)
  {
    v4 = -[TVSSMainViewController menuBarViewController](self, "menuBarViewController");
    objc_super v11 = v4;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL);
  }

  else if (self->_focusSinkView)
  {
    focusSinkView = self->_focusSinkView;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &focusSinkView, 1LL);
  }

  else
  {
    SEL v3 = -[TVSSMainViewController menuBarViewController](self, "menuBarViewController");
    v9 = v3;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL);
  }

  return v8;
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSMainViewController setNeedsFocusUpdate](v7, "setNeedsFocusUpdate");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (TVSSMenuBarViewController)menuBarViewController
{
  return self->_menuBarViewController;
}

- (void)setMenuBarViewController:(id)a3
{
}

- (TVSSDebugMainViewController)debugViewController
{
  return self->_debugViewController;
}

- (void)setDebugViewController:(id)a3
{
}

- (TVSSDebugInfoHUDViewController)debugInfoHUDViewController
{
  return self->_debugInfoHUDViewController;
}

- (void)setDebugInfoHUDViewController:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (_TVSSFocusSinkView)focusSinkView
{
  return self->_focusSinkView;
}

- (void)setFocusSinkView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end