@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)applicationWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = objc_alloc(&OBJC_CLASS___UINavigationController);
  v6 = objc_opt_new(&OBJC_CLASS___AXRNearbyDevicesViewController);
  v7 = -[UINavigationController initWithRootViewController:](v5, "initWithRootViewController:", v6);

  v8 = objc_alloc(&OBJC_CLASS___UIWindow);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 bounds];
  v10 = -[UIWindow initWithFrame:](v8, "initWithFrame:");
  -[AppDelegate setWindow:](self, "setWindow:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  [v12 setBackgroundColor:v11];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  [v13 setRootViewController:v7];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  [v14 makeKeyAndVisible];

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end