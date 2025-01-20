@interface PREStackViewController
- (NSArray)viewControllers;
- (PREStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PREStackViewController)initWithRootViewController:(id)a3;
- (UIViewController)topViewController;
- (UIViewController)visibleViewController;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)popToViewController:(id)a3 animated:(BOOL)a4;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeViewController:(id)a3 animated:(BOOL)a4;
- (void)replaceViewController:(id)a3 withViewController:(id)a4 animated:(BOOL)a5;
- (void)setViewControllers:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PREStackViewController

- (PREStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PREStackViewController;
  v4 = -[PREStackViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v5 = v4;
  if (v4)
  {
    viewControllers = v4->_viewControllers;
    v4->_viewControllers = (NSArray *)&__NSArray0__struct;
  }

  return v5;
}

- (PREStackViewController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v5 = -[PREStackViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
  -[PREStackViewController pushViewController:animated:completion:]( v5,  "pushViewController:animated:completion:",  v4,  0LL,  0LL);

  return v5;
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  -[PREStackViewController setView:](self, "setView:", self->_containerView);
}

- (void)setViewControllers:(id)a3
{
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v34 = a4;
  id v7 = a3;
  v39 = (void (**)(void))a5;
  objc_super v8 = self->_viewControllers;
  id v9 = [v7 copy];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController topViewController](self, "topViewController"));
  v38 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v35 = v9;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v13)
  {
    id v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v71;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v71 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
        if (!-[NSArray containsObject:](v8, "containsObject:", v18))
        {
          -[PREStackViewController addChildViewController:](self, "addChildViewController:", v18);
          if (v18 == v11) {
            char v15 = 1;
          }
          else {
            [v18 didMoveToParentViewController:self];
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v70 objects:v75 count:16];
    }

    while (v14);
  }

  else
  {
    char v15 = 0;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  v19 = v8;
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v66,  v74,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v67;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v67 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
        if (([v12 containsObject:v24] & 1) == 0)
        {
          [v24 willMoveToParentViewController:0];
          if (v24 != v10) {
            [v24 removeFromParentViewController];
          }
        }
      }

      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v66,  v74,  16LL);
    }

    while (v21);
  }

  objc_storeStrong((id *)&self->_viewControllers, v35);
  if (v10 != v11)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
    -[UIView bounds](self->_containerView, "bounds");
    objc_msgSend(v25, "setFrame:");
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100005E18;
    v64[3] = &unk_10000C508;
    id v33 = (id)objc_claimAutoreleasedReturnValue([v10 view]);
    id v65 = v33;
    v32 = objc_retainBlock(v64);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100005E24;
    v62[3] = &unk_10000C508;
    id v36 = v25;
    id v63 = v36;
    v31 = objc_retainBlock(v62);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_100005E30;
    v59[3] = &unk_10000C990;
    char v61 = 0;
    id v26 = v10;
    id v60 = v26;
    v37 = objc_retainBlock(v59);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100005E44;
    v55[3] = &unk_10000C9B8;
    char v58 = v15 & 1;
    id v27 = v11;
    id v56 = v27;
    v57 = self;
    v28 = objc_retainBlock(v55);
    if (!v34)
    {
      if (v26)
      {
        ((void (*)(void))v37[2])();
        [v33 removeFromSuperview];
        if (v39) {
          v39[2]();
        }
      }

      if (v27)
      {
        -[UIView addSubview:](self->_containerView, "addSubview:", v36);
        ((void (*)(void *))v28[2])(v28);
        if (v39) {
          v39[2]();
        }
      }

      goto LABEL_42;
    }

    if (v26 && v27)
    {
      [v36 setAlpha:1.0];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100005E60;
      v51[3] = &unk_10000CA00;
      v52 = v37;
      v53 = v28;
      v54 = v39;
      -[PREStackViewController transitionFromViewController:toViewController:duration:options:animations:completion:]( self,  "transitionFromViewController:toViewController:duration:options:animations:completion:",  v26,  v27,  5242880LL,  &stru_10000C9D8,  v51,  0.5);

      v29 = v52;
    }

    else if (!v26 || v27)
    {
      if (v26 || !v27) {
        goto LABEL_42;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController view](self, "view"));
      [v30 addSubview:v36];

      [v36 setAlpha:0.0];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_100005F00;
      v43[3] = &unk_10000CA28;
      v44 = v31;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100005F0C;
      v40[3] = &unk_10000CA78;
      v41 = v28;
      v42 = v39;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v43,  v40,  0.5);

      v29 = v44;
    }

    else
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100005EAC;
      v49[3] = &unk_10000CA28;
      v50 = v32;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100005EB8;
      v45[3] = &unk_10000CA50;
      v47 = v37;
      id v46 = v33;
      v48 = v39;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v49,  v45,  0.5);

      v29 = v50;
    }

LABEL_42:
  }
}

- (UIViewController)topViewController
{
  return (UIViewController *)-[NSArray lastObject](self->_viewControllers, "lastObject");
}

- (UIViewController)visibleViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController topViewController](self, "topViewController"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 presentedViewController]);
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      id v5 = v4;

      id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 presentedViewController]);
      v2 = v5;
    }

    while (v4);
  }

  else
  {
    id v5 = v2;
  }

  return (UIViewController *)v5;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  viewControllers = self->_viewControllers;
  id v9 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](viewControllers, "arrayByAddingObject:", a3));
  -[PREStackViewController _setViewControllers:animated:completion:]( self,  "_setViewControllers:animated:completion:",  v10,  v5,  v9);
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  NSUInteger v5 = -[NSArray count](self->_viewControllers, "count");
  if (v5) {
    NSUInteger v6 = v5 - 1;
  }
  else {
    NSUInteger v6 = 0LL;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0LL, v6));
  -[PREStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v7, v3);
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0LL, 1LL));
  -[PREStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v5, v3);
}

- (void)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSArray subarrayWithRange:]( self->_viewControllers,  "subarrayWithRange:",  0LL,  (char *)-[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:", a3) + 1));
  -[PREStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v6, v4);
}

- (void)removeViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  viewControllers = self->_viewControllers;
  id v7 = a3;
  id v8 = -[NSArray mutableCopy](viewControllers, "mutableCopy");
  [v8 removeObject:v7];

  -[PREStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v8, v4);
}

- (void)replaceViewController:(id)a3 withViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  viewControllers = self->_viewControllers;
  id v9 = a4;
  id v10 = a3;
  id v12 = -[NSArray mutableCopy](viewControllers, "mutableCopy");
  id v11 = [v12 indexOfObject:v10];

  [v12 replaceObjectAtIndex:v11 withObject:v9];
  -[PREStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v12, v5);
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v5 = a3;
  -[PREStackViewController pushViewController:animated:completion:]( self,  "pushViewController:animated:completion:",  v5,  +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled"),  0LL);
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PREStackViewController;
  -[PREStackViewController viewDidLoad](&v8, "viewDidLoad");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController topViewController](self, "topViewController"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parentViewController]);

  if (!v4) {
    -[PREStackViewController addChildViewController:](self, "addChildViewController:", v3);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v5, "setFrame:");

  containerView = self->_containerView;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  -[UIView addSubview:](containerView, "addSubview:", v7);

  if (!v4) {
    [v3 didMoveToParentViewController:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PREStackViewController;
  -[PREStackViewController viewWillAppear:](&v23, "viewWillAppear:", a3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController view](self, "view"));
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v13 = self->_viewControllers;
  id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "view", (void)v19));
        objc_msgSend(v18, "setFrame:", v6, v8, v10, v12);

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v15);
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PREStackViewController;
  -[PREStackViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void).cxx_destruct
{
}

@end