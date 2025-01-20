@interface TVNPAirPlayRoutingModuleOverlayViewController
- (TVNPAirPlayRoutingModuleOverlayViewController)initWithRoutingController:(id)a3;
- (TVNPGroupableRoutingController)routingController;
- (TVNPRoutingMainViewController)routingViewController;
- (TVSMModuleOverlayContentViewControllerDelegate)delegate;
- (id)preferredFocusEnvironments;
- (void)setDelegate:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVNPAirPlayRoutingModuleOverlayViewController

- (TVNPAirPlayRoutingModuleOverlayViewController)initWithRoutingController:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0LL;
  v10.receiver = v3;
  v10.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModuleOverlayViewController;
  v9 = -[TVNPAirPlayRoutingModuleOverlayViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL);
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v12->_routingController, location[0]);
    v4 = objc_alloc(&OBJC_CLASS___TVNPRoutingMainViewController);
    v5 = -[TVNPRoutingMainViewController initWithRoutingController:options:]( v4,  "initWithRoutingController:options:",  location[0],  &__NSDictionary0__struct);
    routingViewController = v12->_routingViewController;
    v12->_routingViewController = v5;

    -[TVNPRoutingMainViewController setDelegate:](v12->_routingViewController, "setDelegate:", v12);
  }

  v8 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v8;
}

- (void)viewDidLoad
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModuleOverlayViewController;
  -[TVNPAirPlayRoutingModuleOverlayViewController viewDidLoad](&v9, "viewDidLoad");
  -[TVNPAirPlayRoutingModuleOverlayViewController addChildViewController:]( v11,  "addChildViewController:",  v11->_routingViewController);
  id v8 = -[TVNPAirPlayRoutingModuleOverlayViewController view](v11, "view");
  id v7 = -[TVNPRoutingMainViewController view](v11->_routingViewController, "view");
  id v6 = v7;
  [v8 bounds];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
  [v8 addSubview:v7];
  -[TVNPRoutingMainViewController didMoveToParentViewController:]( v11->_routingViewController,  "didMoveToParentViewController:",  v11);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
}

- (void)viewWillAppear:(BOOL)a3
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModuleOverlayViewController;
  -[TVNPAirPlayRoutingModuleOverlayViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  id v9 = -[TVNPGroupableRoutingController currentDestination](v13->_routingController, "currentDestination");
  double v4 = -[TVNPGroupableRoutingController availableDestinations](v13->_routingController, "availableDestinations");
  double v5 = -[NSArray indexOfObject:](v4, "indexOfObject:", v9);

  id v8 = v5;
  else {
    double v3 = v8;
  }
  id v8 = v3;
  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"Device%lu", v3 + 1);
  id v6 =  +[TVSMPageAnalytics infoWithPageContext:pageId:pageType:]( &OBJC_CLASS___TVSMPageAnalytics,  "infoWithPageContext:pageId:pageType:",  @"AudioRouting",  v7,  @"Picker");
  +[TVSMAnalytics reportPageEvent:](&OBJC_CLASS___TVSMAnalytics, "reportPageEvent:", v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v9, 0LL);
}

- (id)preferredFocusEnvironments
{
  routingViewController = self->_routingViewController;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &routingViewController,  1LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  id v5 = -[TVNPAirPlayRoutingModuleOverlayViewController delegate](v8, "delegate");
  if (a4) {
    [v5 contentModuleViewControllerDidRequestDismissal:v8];
  }
  else {
    [v5 contentModuleViewControllerDidRequestSystemDismissal:v8 animated:1];
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleOverlayContentViewControllerDelegate)delegate
{
  return (TVSMModuleOverlayContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (TVNPRoutingMainViewController)routingViewController
{
  return self->_routingViewController;
}

- (void).cxx_destruct
{
}

@end