@interface TVSSDebugSystemMenuViewController
- (TVSPPillView)pillView;
- (TVSSDebugSystemMenuViewController)initWithDataSourceController:(id)a3;
- (TVSSDebugSystemMenuViewController)initWithMenuItemProvider:(id)a3;
- (TVSSMenuDataSourceContentView)menuBarContentView;
- (TVSSMenuDataSourceController)dataSourceController;
- (void)_updatePillContentView;
- (void)menuDataSourceControllerDidChange:(id)a3;
- (void)setDataSourceController:(id)a3;
- (void)setMenuBarContentView:(id)a3;
- (void)setPillView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSDebugSystemMenuViewController

- (TVSSDebugSystemMenuViewController)initWithMenuItemProvider:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController);
  id v11 = location[0];
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL);
  v8 = -[TVSSMenuDataSourceController initWithMode:providers:](v5, "initWithMode:providers:", 2LL);

  v3 = v10;
  v10 = 0LL;
  v10 = -[TVSSDebugSystemMenuViewController initWithDataSourceController:](v3, "initWithDataSourceController:", v8);
  v7 = v10;
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (TVSSDebugSystemMenuViewController)initWithDataSourceController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSDebugSystemMenuViewController;
  v8 = -[TVSSDebugSystemMenuViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dataSourceController, location[0]);
    -[TVSSMenuDataSourceController addControllerObserver:](v8->_dataSourceController, "addControllerObserver:", v8);
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)viewDidLoad
{
  v22 = self;
  SEL v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSSDebugSystemMenuViewController;
  -[TVSSDebugSystemMenuViewController viewDidLoad](&v20, "viewDidLoad");
  id v19 = -[TVSSDebugSystemMenuViewController view](v22, "view");
  id v6 = v19;
  v7 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  objc_msgSend(v6, "setBackgroundColor:");

  v2 = objc_alloc_init(&OBJC_CLASS___TVSPPillView);
  pillView = v22->_pillView;
  v22->_pillView = v2;

  -[TVSPPillView setTranslatesAutoresizingMaskIntoConstraints:]( v22->_pillView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v19 addSubview:v22->_pillView];
  v8 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceContentView);
  id v9 =  +[TVSPMenuBarContentViewConfiguration standardConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "standardConfiguration");
  v4 = -[TVSSMenuDataSourceContentView initWithConfiguration:](v8, "initWithConfiguration:");
  menuBarContentView = v22->_menuBarContentView;
  v22->_menuBarContentView = v4;

  -[TVSPPillView setContentView:withTransition:]( v22->_pillView,  "setContentView:withTransition:",  v22->_menuBarContentView);
  id v10 = -[TVSSDebugSystemMenuViewController view](v22, "view");
  id v18 = [v10 safeAreaLayoutGuide];

  id v17 = -[TVSPPillView topAnchor](v22->_pillView, "topAnchor");
  id v16 = [v18 topAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v23[0] = v15;
  id v14 = -[TVSPPillView centerXAnchor](v22->_pillView, "centerXAnchor");
  id v13 = [v18 centerXAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v23[1] = v12;
  id v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSDebugSystemMenuViewController _updatePillContentView](v22, "_updatePillContentView");
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
}

- (void)menuDataSourceControllerDidChange:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSDebugSystemMenuViewController _updatePillContentView](v4, "_updatePillContentView");
  objc_storeStrong(location, 0LL);
}

- (void)_updatePillContentView
{
  id v18 = self;
  v17[1] = (id)a2;
  v5 = -[TVSSDebugSystemMenuViewController dataSourceController](self, "dataSourceController");
  v17[0] = -[TVSSMenuDataSourceController dataSource](v5, "dataSource");

  id v6 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_1000EDB98();
  v15[1] = v2;
  v15[2] = v3;
  id v16 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v6,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  180.0,  19.0,  *(double *)&v2,  *(double *)&v3);
  v4 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v15[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v4,  "initWithDuration:timingParameters:",  v16,  0.8);
  id v7 = v15[0];
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_1000EDBC4;
  id v12 = &unk_1001B61C0;
  id v13 = v18;
  id v14 = v17[0];
  objc_msgSend(v7, "addAnimations:");
  [v15[0] startAnimation];
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(v17, 0LL);
}

  ;
}

- (TVSSMenuDataSourceController)dataSourceController
{
  return self->_dataSourceController;
}

- (void)setDataSourceController:(id)a3
{
}

- (TVSPPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (TVSSMenuDataSourceContentView)menuBarContentView
{
  return self->_menuBarContentView;
}

- (void)setMenuBarContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end