@interface TVSMAirPodsModuleOverlayViewController
- (NSString)foregroundAppBundleID;
- (TVNPGroupableRoutingController)routeController;
- (TVSMAirPodsModuleMainViewController)airpodsSettingsViewController;
- (TVSMAirPodsModuleOverlayViewController)initWithRouteController:(id)a3;
- (TVSMModuleOverlayContentViewControllerDelegate)delegate;
- (id)preferredFocusEnvironments;
- (void)setAirpodsSettingsViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForegroundAppBundleID:(id)a3;
- (void)setRouteController:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation TVSMAirPodsModuleOverlayViewController

- (TVSMAirPodsModuleOverlayViewController)initWithRouteController:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0LL;
  v9.receiver = v3;
  v9.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleOverlayViewController;
  v11 = -[TVSMAirPodsModuleOverlayViewController init](&v9, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_routeController, location[0]);
    v4 = objc_alloc(&OBJC_CLASS___TVSMAirPodsModuleMainViewController);
    v5 = -[TVSMAirPodsModuleMainViewController initWithRouteController:](v4, "initWithRouteController:", location[0]);
    airpodsSettingsViewController = v11->_airpodsSettingsViewController;
    v11->_airpodsSettingsViewController = v5;

    -[TVSMAirPodsModuleMainViewController setDelegate:](v11->_airpodsSettingsViewController, "setDelegate:", v11);
  }

  v8 = v11;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v8;
}

- (void)setForegroundAppBundleID:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMAirPodsModuleMainViewController setForegroundAppBundleID:]( v4->_airpodsSettingsViewController,  "setForegroundAppBundleID:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)viewDidLoad
{
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = -[TVSMAirPodsModuleOverlayViewController view](self, "view");
  -[TVSMAirPodsModuleOverlayViewController addChildViewController:]( v22,  "addChildViewController:",  v22->_airpodsSettingsViewController);
  id v20 = -[TVSMAirPodsModuleMainViewController view](v22->_airpodsSettingsViewController, "view");
  id v6 = v20;
  [v21[0] bounds];
  v19[1] = v2;
  v19[2] = v3;
  v19[3] = v4;
  v19[4] = v5;
  objc_msgSend(v6, "setFrame:", *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);
  [v21[0] addSubview:v20];
  -[TVSMAirPodsModuleMainViewController didMoveToParentViewController:]( v22->_airpodsSettingsViewController,  "didMoveToParentViewController:",  v22);
  id v18 = [v20 leadingAnchor];
  id v17 = [v21[0] leadingAnchor];
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v23[0] = v16;
  id v15 = [v20 trailingAnchor];
  id v14 = [v21[0] trailingAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v23[1] = v13;
  id v12 = [v20 topAnchor];
  id v11 = [v21[0] topAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v23[2] = v10;
  id v9 = [v20 bottomAnchor];
  id v8 = [v21[0] bottomAnchor];
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v23[3] = v7;
  v19[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v19[0]);
  -[TVNPGroupableRoutingController setWantsVolumeUpdates:](v22->_routeController, "setWantsVolumeUpdates:", 1LL);
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v21, 0LL);
}

- (id)preferredFocusEnvironments
{
  airpodsSettingsViewController = self->_airpodsSettingsViewController;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &airpodsSettingsViewController,  1LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPGroupableRoutingController setWantsVolumeUpdates:](v5->_routeController, "setWantsVolumeUpdates:", 0LL);
  -[TVSMAirPodsModuleOverlayViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleOverlayContentViewControllerDelegate)delegate
{
  return (TVSMModuleOverlayContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)foregroundAppBundleID
{
  return self->_foregroundAppBundleID;
}

- (TVSMAirPodsModuleMainViewController)airpodsSettingsViewController
{
  return self->_airpodsSettingsViewController;
}

- (void)setAirpodsSettingsViewController:(id)a3
{
}

- (TVNPGroupableRoutingController)routeController
{
  return self->_routeController;
}

- (void)setRouteController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end