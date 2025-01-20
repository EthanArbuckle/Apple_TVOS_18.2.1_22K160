@interface UINavigationController
- (void)removeViewController:(id)a3 completion:(id)a4;
@end

@implementation UINavigationController

- (void)removeViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 lastObject]);

  if (v9 != v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v8));
    [v10 removeObjectIdenticalTo:v6];
    -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v10, 1LL);
  }

  if (v7) {
    v7[2](v7);
  }
}

@end