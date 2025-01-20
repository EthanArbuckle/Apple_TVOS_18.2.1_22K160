@interface TVCRDAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVCRDAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = objc_alloc_init(&OBJC_CLASS___TVCRDViewController);
  v6 = objc_alloc(&OBJC_CLASS___UIWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 bounds];
  v8 = -[UIWindow initWithFrame:](v6, "initWithFrame:");
  -[TVCRDAppDelegate setWindow:](self, "setWindow:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVCRDAppDelegate window](self, "window"));
  [v9 setRootViewController:v5];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVCRDAppDelegate window](self, "window"));
  [v10 makeKeyAndVisible];

  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVCRDAppDelegate window](self, "window", a3));
  [v3 setHidden:1];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVCRDAppDelegate window](self, "window", a3));
  [v3 setHidden:0];
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