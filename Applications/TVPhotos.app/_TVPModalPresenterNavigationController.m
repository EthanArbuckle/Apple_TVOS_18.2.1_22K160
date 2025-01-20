@interface _TVPModalPresenterNavigationController
- (NSArray)previousViewControllers;
- (_TVPModalPresenterNavigationController)initWithRootViewController:(id)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_dismissForLastViewController;
- (void)_dismissForLastViewController:(BOOL)a3;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reset;
- (void)setPreviousViewControllers:(id)a3;
- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3;
@end

@implementation _TVPModalPresenterNavigationController

- (_TVPModalPresenterNavigationController)initWithRootViewController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____TVPModalPresenterNavigationController;
  v6 = -[_TVPModalPresenterNavigationController initWithRootViewController:](&v13, "initWithRootViewController:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  5LL,  0x10000LL));
    pushCompletionBlocks = v7->_pushCompletionBlocks;
    v7->_pushCompletionBlocks = (NSMapTable *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  5LL,  0x10000LL));
    popCompletionBlocks = v7->_popCompletionBlocks;
    v7->_popCompletionBlocks = (NSMapTable *)v10;
  }

  return v7;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  if (a5)
  {
    pushCompletionBlocks = self->_pushCompletionBlocks;
    id v9 = objc_retainBlock(a5);
    -[NSMapTable setObject:forKey:](pushCompletionBlocks, "setObject:forKey:", v9, v10);
  }

  -[_TVPModalPresenterNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, v6);
}

- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    id v7 = objc_retainBlock(a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController viewControllers](self, "viewControllers"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);
    -[NSMapTable setObject:forKey:](popCompletionBlocks, "setObject:forKey:", v7, v9);
  }

  id v10 = -[_TVPModalPresenterNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", v4);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController viewControllers](self, "viewControllers"));
  -[_TVPModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", v7);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVPModalPresenterNavigationController;
  -[_TVPModalPresenterNavigationController pushViewController:animated:](&v8, "pushViewController:animated:", v6, v4);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController viewControllers](self, "viewControllers"));
  -[_TVPModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController viewControllers](self, "viewControllers"));
  id v7 = [v6 count];

  if (v7 == (id)2)
  {
    -[_TVPModalPresenterNavigationController _dismissForLastViewController:](self, "_dismissForLastViewController:", v3);
    return 0LL;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS____TVPModalPresenterNavigationController;
    id v9 = -[_TVPModalPresenterNavigationController popViewControllerAnimated:](&v10, "popViewControllerAnimated:", v3);
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (void)reset
{
  rootViewController = self->_rootViewController;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &rootViewController,  1LL));
  -[_TVPModalPresenterNavigationController setViewControllers:](self, "setViewControllers:", v3);
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  id v13 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController previousViewControllers](self, "previousViewControllers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController viewControllers](self, "viewControllers"));
  if (([v5 containsObject:v13] & 1) == 0
    && (id v7 = (id)objc_claimAutoreleasedReturnValue([v6 lastObject]), v7, v7 == v13))
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_pushCompletionBlocks, "objectForKey:", v13));
    -[NSMapTable removeObjectForKey:](self->_pushCompletionBlocks, "removeObjectForKey:", v13);
  }

  else
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](popCompletionBlocks, "objectForKey:", v9));

    v11 = self->_popCompletionBlocks;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    -[NSMapTable removeObjectForKey:](v11, "removeObjectForKey:", v12);
  }

  -[_TVPModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", 0LL);
  if (v10) {
    dispatch_async(&_dispatch_main_q, v10);
  }
}

- (void)_dismissForLastViewController
{
}

- (void)_dismissForLastViewController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController previousViewControllers](self, "previousViewControllers"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_popCompletionBlocks, "objectForKey:", v9));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPModalPresenter presenter](&OBJC_CLASS___TVPModalPresenter, "presenter"));
  [v7 _dismissAnimated:v3 completion:v6];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"TVPModalPresenterDismissedNotification" object:0];
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPModalPresenterNavigationController childViewControllers](self, "childViewControllers"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 lastObject]);
}

- (NSArray)previousViewControllers
{
  return self->_previousViewControllers;
}

- (void)setPreviousViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end