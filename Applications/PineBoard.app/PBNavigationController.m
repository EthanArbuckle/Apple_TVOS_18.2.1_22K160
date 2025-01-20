@interface PBNavigationController
- (id)_lastViewController;
- (id)dismissLastViewControllerBlock;
- (void)_delegateDidDismissViewController:(id)a3 completion:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)removeViewController:(id)a3 completion:(id)a4;
- (void)setDismissLastViewControllerBlock:(id)a3;
@end

@implementation PBNavigationController

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBNavigationController presentedViewController](self, "presentedViewController"));
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000EF01C;
    v10[3] = &unk_1003D2F08;
    v10[4] = self;
    id v8 = v7;
    id v11 = v8;
    id v12 = v6;
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PBNavigationController;
    -[PBNavigationController dismissViewControllerAnimated:completion:]( &v9,  "dismissViewControllerAnimated:completion:",  v4,  v10);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PBNavigationController topViewController](self, "topViewController"));
    -[PBNavigationController _delegateDidDismissViewController:completion:]( self,  "_delegateDidDismissViewController:completion:",  v8,  v6);
  }
}

- (void)removeViewController:(id)a3 completion:(id)a4
{
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EF0FC;
  v8[3] = &unk_1003D2F08;
  objc_super v9 = self;
  id v10 = a3;
  id v11 = a4;
  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___PBNavigationController;
  v8[0] = _NSConcreteStackBlock;
  id v5 = v11;
  id v6 = v10;
  -[PBNavigationController removeViewController:completion:](&v7, "removeViewController:completion:", v6, v8);
}

- (void)_delegateDidDismissViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBNavigationController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "navigationController:didDismissViewController:") & 1) != 0) {
    [v8 navigationController:self didDismissViewController:v6];
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[PBNavigationController _lastViewController](self, "_lastViewController"));
  id v10 = (void *)v9;
  if ((id)v9 == v6 || !v9)
  {
    id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBNavigationController dismissLastViewControllerBlock]( self,  "dismissLastViewControllerBlock"));
    -[PBNavigationController setDismissLastViewControllerBlock:](self, "setDismissLastViewControllerBlock:", 0LL);
    if (v11) {
      ((void (**)(void, PBNavigationController *))v11)[2](v11, self);
    }
  }

  if (v7) {
    v7[2](v7);
  }
}

- (id)_lastViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBNavigationController viewControllers](self, "viewControllers"));
  if ([v3 count] == (id)1) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 lastObject]);
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PBNavigationController presentedViewController](self, "presentedViewController"));
  }
  id v5 = (void *)v4;

  return v5;
}

- (id)dismissLastViewControllerBlock
{
  return self->_dismissLastViewControllerBlock;
}

- (void)setDismissLastViewControllerBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end