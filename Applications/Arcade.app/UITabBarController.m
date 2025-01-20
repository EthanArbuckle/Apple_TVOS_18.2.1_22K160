@interface UITabBarController
- (void)as_updateOffScreenStatus:(BOOL)a3;
@end

@implementation UITabBarController

- (void)as_updateOffScreenStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_opt_respondsToSelector(self, "_updateOffscreenStatus:") & 1) != 0) {
    -[UITabBarController _updateOffscreenStatus:](self, "_updateOffscreenStatus:", v3);
  }
}

@end