@interface UINavigationController
- (id)tvh_viewControllersWithNoPlaybackViewControllers;
- (void)tvh_replaceLastViewControllerWithViewController:(id)a3;
@end

@implementation UINavigationController

- (void)tvh_replaceLastViewControllerWithViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  id v6 = [v5 mutableCopy];

  [v6 removeLastObject];
  [v6 addObject:v4];

  -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v6, 1LL);
}

- (id)tvh_viewControllersWithNoPlaybackViewControllers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_filter:", &stru_1000FE398));

  return v3;
}

@end