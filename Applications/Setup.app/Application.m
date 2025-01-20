@interface Application
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationWillResignActive:(id)a3;
@end

@implementation Application

- (void)applicationDidFinishLaunching:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication", a3));
  [v4 setDelegate:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVSetupController sharedSetupController](&OBJC_CLASS___TVSetupController, "sharedSetupController"));
  [v5 run];
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSetupController sharedSetupController](&OBJC_CLASS___TVSetupController, "sharedSetupController", a3));
  [v3 resign];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSetupController sharedSetupController](&OBJC_CLASS___TVSetupController, "sharedSetupController", a3));
  [v3 resume];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSetupController sharedSetupController](&OBJC_CLASS___TVSetupController, "sharedSetupController", a3));
  [v3 didEnterBackground];
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice", a3, a4));
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return 30LL;
  }
  else {
    return 2LL;
  }
}

@end