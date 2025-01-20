@interface TVHNavigationController
- (TVHNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_updatePurgeableViewControllers;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation TVHNavigationController

- (TVHNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHNavigationController;
  v4 = -[TVHNavigationController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TVHNavigationController setNavigationBarHidden:](v4, "setNavigationBarHidden:", 1LL);
    -[TVHNavigationController setDelegate:](v5, "setDelegate:", v5);
  }

  return v5;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_super v7 = v6;
  if (v6)
  {
    v10 = @"ViewController";
    id v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"TVHNavigationControllerWillDisplayViewControllerNotification" object:self userInfo:v8];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_super v7 = v6;
  if (v6)
  {
    v10 = @"ViewController";
    id v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:self userInfo:v8];

  -[TVHNavigationController _updatePurgeableViewControllers](self, "_updatePurgeableViewControllers");
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_customAnimatorForNavigationControllerOperation:toViewController:", a4, v9));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_customAnimatorForNavigationControllerOperation:fromViewController:", a4, v8));
  }

  return v10;
}

- (void)_updatePurgeableViewControllers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNavigationController navigationController](self, "navigationController"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 childViewControllers]);

  v3 = (char *)[v8 count];
  if ((unint64_t)v3 >= 3)
  {
    v4 = 0LL;
    v5 = v3 - 2;
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v4]);

      ++v4;
    }

    while (v5 != v4);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v5]);
  }
}

@end