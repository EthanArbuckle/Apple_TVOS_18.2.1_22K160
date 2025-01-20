@interface TVPNavigationController
- (TVPNavigationController)init;
- (TVPNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPNavigationController)initWithRootViewController:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)pu_configureAsRootViewController;
- (void)setDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPNavigationController

- (void)pu_configureAsRootViewController
{
  value = objc_alloc_init(&OBJC_CLASS___TVOneUpPresentationImplementationDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPNavigationController px_oneUpPresentation](self, "px_oneUpPresentation"));
  [v3 setImplementationDelegate:value];
  objc_setAssociatedObject(v3, off_100102050, value, (void *)1);
}

- (TVPNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
  v4 = -[TVPNavigationController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
    -[TVPNavigationController setDelegate:](&v7, "setDelegate:", v4);
  }

  return v5;
}

- (TVPNavigationController)initWithRootViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
  v3 = -[TVPNavigationController initWithRootViewController:](&v7, "initWithRootViewController:", a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
    -[TVPNavigationController setDelegate:](&v6, "setDelegate:", v3);
  }

  return v4;
}

- (TVPNavigationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
  v2 = -[TVPNavigationController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
    -[TVPNavigationController setDelegate:](&v5, "setDelegate:", v2);
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
  -[TVPNavigationController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)2) {
    -[TVPNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1LL);
  }
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPNavigationController;
  -[TVPNavigationController setDelegate:](&v5, "setDelegate:", a3);
  if (_TVSLogInternalLogLevel >= 4)
  {
    uint64_t v4 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 4LL, v4);
  }

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 customAnimatorForNavigationControllerOperation:a4 toViewController:v9]);
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 customAnimatorForNavigationControllerOperation:a4 fromViewController:v8]);
  }

  return v10;
}

@end