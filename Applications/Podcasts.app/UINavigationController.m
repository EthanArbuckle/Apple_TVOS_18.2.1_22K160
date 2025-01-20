@interface UINavigationController
- (void)mt_hideNavigationBarOnFirstScreen;
- (void)mt_popToRootViewController;
- (void)mt_popToRootViewControllerAnimated:(BOOL)a3;
- (void)mt_popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation UINavigationController

- (void)mt_popToRootViewController
{
  id v2 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0LL);
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3
{
  id v3 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", a3);
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v5);

    id v6 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1LL);
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }

  else
  {
    v8 = (void (**)(void))a4;
    id v7 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0LL);
    v8[2]();
  }

- (void)mt_hideNavigationBarOnFirstScreen
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  BOOL v4 = (unint64_t)[v3 count] < 2;

  -[UINavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", v4);
}

@end