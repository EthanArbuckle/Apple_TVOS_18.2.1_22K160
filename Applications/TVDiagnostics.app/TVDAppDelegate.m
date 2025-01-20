@interface TVDAppDelegate
- (BOOL)allowApplicationBackgrounding;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6;
- (BOOL)shouldTerminate;
- (BOOL)shouldUnenrollDevices;
- (DADevice)device;
- (NSString)ticketNumber;
- (UIWindow)window;
- (void)allowApplicationBackgrounding:(BOOL)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)exitApplication;
- (void)handleCloseApplicationEvent;
- (void)setAllowApplicationBackgrounding:(BOOL)a3;
- (void)setShouldTerminate:(BOOL)a3;
- (void)setShouldUnenrollDevices:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVDAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = objc_alloc(&OBJC_CLASS___UIWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 bounds];
  v7 = -[UIWindow initWithFrame:](v5, "initWithFrame:");
  -[TVDAppDelegate setWindow:](self, "setWindow:", v7);

  -[TVDAppDelegate setShouldTerminate:](self, "setShouldTerminate:", 0LL);
  v8 = objc_alloc(&OBJC_CLASS___UINavigationController);
  v9 = objc_alloc_init(&OBJC_CLASS___TVDViewController);
  v10 = -[UINavigationController initWithRootViewController:](v8, "initWithRootViewController:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVDAppDelegate window](self, "window"));
  [v11 setRootViewController:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVDAppDelegate window](self, "window"));
  [v12 makeKeyAndVisible];

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6
{
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "host", a3));
  ticketNumber = self->_ticketNumber;
  self->_ticketNumber = v7;

  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  if (-[TVDAppDelegate shouldTerminate](self, "shouldTerminate", a3)) {
    [UIApp terminateWithSuccess];
  }
}

- (void)allowApplicationBackgrounding:(BOOL)a3
{
}

- (void)handleCloseApplicationEvent
{
}

- (void)exitApplication
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (DADevice)device
{
  return self->_device;
}

- (NSString)ticketNumber
{
  return self->_ticketNumber;
}

- (BOOL)allowApplicationBackgrounding
{
  return self->_allowApplicationBackgrounding;
}

- (void)setAllowApplicationBackgrounding:(BOOL)a3
{
  self->_allowApplicationBackgrounding = a3;
}

- (BOOL)shouldTerminate
{
  return self->_shouldTerminate;
}

- (void)setShouldTerminate:(BOOL)a3
{
  self->_shouldTerminate = a3;
}

- (BOOL)shouldUnenrollDevices
{
  return self->_shouldUnenrollDevices;
}

- (void)setShouldUnenrollDevices:(BOOL)a3
{
  self->_shouldUnenrollDevices = a3;
}

- (void).cxx_destruct
{
}

@end