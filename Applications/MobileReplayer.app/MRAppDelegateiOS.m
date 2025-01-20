@interface MRAppDelegateiOS
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation MRAppDelegateiOS

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  sub_100004098((uint64_t)v19, 1, 1);
  v6 = objc_alloc(&OBJC_CLASS___UIWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 bounds];
  v8 = -[UIWindow initWithFrame:](v6, "initWithFrame:");
  v9 = *(void **)(&self->super._shouldCreateViewController + 1);
  *(void *)(&self->super._shouldCreateViewController + 1) = v8;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18[0] = xmmword_100005EF0;
  v18[1] = unk_100005F00;
  v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v18);
  v12 = objc_alloc(&OBJC_CLASS___UIView);
  [*(id *)(&self->super._shouldCreateViewController + 1) bounds];
  v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v13, "layer"));
  [v14 setBackgroundColor:v11];

  CGColorRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
  [v5 setIdleTimerDisabled:1];
  [v5 setIdleTimerDisabled:1];
  v15 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  v16 = *(UIWindow **)((char *)&self->_window + 1);
  *(UIWindow **)((char *)&self->_window + 1) = (UIWindow *)v15;

  [*(id *)((char *)&self->_window + 1) setView:v13];
  [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:*(UIWindow **)((char *)&self->_window + 1)];
  [*(id *)(&self->super._shouldCreateViewController + 1) makeKeyAndVisible];

  sub_100004160((uint64_t)v19);
  -[MRAppDelegate startupAndCreateViewController:](self, "startupAndCreateViewController:", 1LL);

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
}

- (void)setViewController:(id)a3
{
  id v4 = a3;
  sub_100004098((uint64_t)v5, 1, 1);
  if (v4) {
    [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:v4];
  }
  else {
    [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:*(UIWindow **)((char *)&self->_window + 1)];
  }
  sub_100004160((uint64_t)v5);
}

- (void).cxx_destruct
{
}

@end