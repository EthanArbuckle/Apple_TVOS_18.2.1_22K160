@interface HBWindowSceneDelegate
- (HBWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation HBWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = [[HBLaunchManager alloc] initWithScene:v6];
  [v6 _registerSceneComponent:v7 forKey:HBLaunchManagerSceneComponentKey];

  id v8 = [[HBUIFocusHidingSceneComponent alloc] initWithScene:v6];
  [v6 _registerSceneComponent:v8 forKey:HBUIFocusHidingSceneComponentKey];

  id v9 = [[HBUILaunchAnimator alloc] initWithScene:v6];
  [v6 _registerSceneComponent:v9 forKey:HBUILaunchAnimatorSceneComponentKey];

  id v10 = [[HBUIUserInteractionManager alloc] initWithScene:v6];
  [v6 _registerSceneComponent:v10 forKey:HBUIUserInteractionManagerSceneComponentKey];

  objc_msgSend(v6, "hbui_setIdleModeVisualEffectsEnabled:", 1);
  v13 = -[HBWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___HBWindow), "initWithWindowScene:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[HBWindow setTintColor:](v13, "setTintColor:", v11);

  -[HBWindowSceneDelegate setWindow:](self, "setWindow:", v13);
  v12 = objc_alloc_init(&OBJC_CLASS___HBMainViewController);
  -[HBWindow setRootViewController:](v13, "setRootViewController:", v12);
  -[HBWindow makeKeyAndVisible](v13, "makeKeyAndVisible");
}

- (HBWindow)window
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