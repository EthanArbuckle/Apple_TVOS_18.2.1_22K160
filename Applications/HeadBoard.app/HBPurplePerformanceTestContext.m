@interface HBPurplePerformanceTestContext
+ (id)contextWithWindow:(id)a3;
- (HBAppGridView)appGridView;
- (HBAppGridViewController)appGridViewController;
- (HBMainViewController)mainViewController;
- (UIWindow)window;
@end

@implementation HBPurplePerformanceTestContext

+ (id)contextWithWindow:(id)a3
{
  v3 = (UIWindow *)a3;
  v4 = objc_alloc_init(&OBJC_CLASS___HBPurplePerformanceTestContext);
  window = v4->_window;
  v4->_window = v3;

  return v4;
}

- (HBMainViewController)mainViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBPurplePerformanceTestContext window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  return (HBMainViewController *)v3;
}

- (HBAppGridViewController)appGridViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBPurplePerformanceTestContext mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 gridViewController]);

  return (HBAppGridViewController *)v3;
}

- (HBAppGridView)appGridView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBPurplePerformanceTestContext appGridViewController](self, "appGridViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);

  return (HBAppGridView *)v3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
}

@end