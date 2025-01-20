@interface PBUIDebugWindow
- (BOOL)_ignoresHitTest;
- (BOOL)canBecomeKeyWindow;
- (PBUIDebugWindow)initWithWindowScene:(id)a3;
- (void)_updateRootViewController;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setRootViewController:(id)a3;
@end

@implementation PBUIDebugWindow

- (PBUIDebugWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBUIDebugWindow;
  v3 = -[PBUIDebugWindow initWithWindowScene:](&v7, "initWithWindowScene:", a3);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugWindow setWindowLevel:](v3, "setWindowLevel:", 1000000.0);
    -[PBUIDebugWindow setOpaque:](v4, "setOpaque:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 addObserver:v4 forKeyPath:@"ShowUIDebug" options:4 context:&off_1003DD390];
    [v5 addObserver:v4 forKeyPath:@"ShowExternalControlDebug" options:4 context:&off_1003DD398];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"ShowUIDebug"];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 removeObserver:self forKeyPath:@"ShowExternalControlDebug"];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBUIDebugWindow;
  -[PBUIDebugWindow dealloc](&v5, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003DD390 || a6 == &off_1003DD398)
  {
    -[PBUIDebugWindow _updateRootViewController](self, "_updateRootViewController", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PBUIDebugWindow;
    -[PBUIDebugWindow observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setRootViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBUIDebugWindow;
  id v5 = -[PBUIDebugWindow rootViewController](&v9, "rootViewController");
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)v6;
  if ((id)v6 != v4)
  {
    if ((objc_opt_respondsToSelector(v6, "invalidate") & 1) != 0) {
      [v7 invalidate];
    }
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBUIDebugWindow;
    -[PBUIDebugWindow setRootViewController:](&v8, "setRootViewController:", v4);
  }
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void)_updateRootViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v4 = [v3 BOOLForKey:@"ShowUIDebug"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:@"ShowExternalControlDebug"];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugWindow rootViewController](self, "rootViewController"));
  if ((v4 & 1) != 0 || v6)
  {
    if (!v7)
    {
      objc_super v8 = objc_alloc_init(&OBJC_CLASS___PBUIDebugRootViewController);
      -[PBUIDebugWindow setRootViewController:](self, "setRootViewController:", v8);
    }
  }

  else if (v7)
  {
    -[PBUIDebugWindow setRootViewController:](self, "setRootViewController:", 0LL);
  }

@end