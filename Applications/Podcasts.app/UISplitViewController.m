@interface UISplitViewController
- (UIViewController)mt_detailViewController;
- (UIViewController)mt_masterViewController;
@end

@implementation UISplitViewController

- (UIViewController)mt_masterViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return (UIViewController *)v3;
}

- (UIViewController)mt_detailViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    v6 = 0LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
  }

  return (UIViewController *)v6;
}

@end