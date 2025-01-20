@interface TVHSearchResultsWrapperViewController
+ (TVHSearchResultsWrapperViewController)new;
- (TVHSearchResultsViewController)searchResultsViewController;
- (TVHSearchResultsWrapperViewController)init;
- (TVHSearchResultsWrapperViewController)initWithCoder:(id)a3;
- (TVHSearchResultsWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHSearchResultsWrapperViewController)initWithSearchResultsViewController:(id)a3;
- (UIViewController)defaultResultsViewController;
- (id)UIFocusEnvironment;
- (void)setDefaultResultsViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHSearchResultsWrapperViewController

+ (TVHSearchResultsWrapperViewController)new
{
  return 0LL;
}

- (TVHSearchResultsWrapperViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHSearchResultsWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHSearchResultsWrapperViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSearchResultsWrapperViewController)initWithSearchResultsViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHSearchResultsWrapperViewController;
  v6 = -[TVHSearchResultsWrapperViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchResultsViewController, a3);
  }

  return v7;
}

- (void)setDefaultResultsViewController:(id)a3
{
  id v10 = a3;
  p_defaultResultsViewController = &self->_defaultResultsViewController;
  if (!-[TVHSearchResultsWrapperViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_storeStrong((id *)&self->_defaultResultsViewController, a3);
    goto LABEL_5;
  }

  -[UIViewController willMoveToParentViewController:]( *p_defaultResultsViewController,  "willMoveToParentViewController:",  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_defaultResultsViewController, "view"));
  [v6 removeFromSuperview];

  -[UIViewController removeFromParentViewController](*p_defaultResultsViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_defaultResultsViewController, a3);
  v7 = v10;
  if (v10)
  {
    -[TVHSearchResultsWrapperViewController addChildViewController:](self, "addChildViewController:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsWrapperViewController view](self, "view"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    [v8 addSubview:v9];

    [v10 didMoveToParentViewController:self];
LABEL_5:
    v7 = v10;
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHSearchResultsWrapperViewController;
  -[TVHSearchResultsWrapperViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsWrapperViewController searchResultsViewController]( self,  "searchResultsViewController"));
  -[TVHSearchResultsWrapperViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsWrapperViewController view](self, "view"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 addSubview:v5];

  [v3 didMoveToParentViewController:self];
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsWrapperViewController defaultResultsViewController]( self,  "defaultResultsViewController"));
  if (v6)
  {
    -[TVHSearchResultsWrapperViewController addChildViewController:](self, "addChildViewController:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsWrapperViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v7 addSubview:v8];

    [v6 didMoveToParentViewController:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVHSearchResultsWrapperViewController;
  -[TVHSearchResultsWrapperViewController viewDidLayoutSubviews](&v31, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsWrapperViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v12 bounds];
  double v14 = v13;

  if ([v3 effectiveUserInterfaceLayoutDirection] == (id)1) {
    double v15 = v9 - v14;
  }
  else {
    double v15 = v5;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsWrapperViewController searchResultsViewController]( self,  "searchResultsViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
  objc_msgSend(v17, "setFrame:", v15, v7, v14, v11);

  v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsWrapperViewController defaultResultsViewController]( self,  "defaultResultsViewController"));
  if (v18)
  {
    [v3 safeAreaInsets];
    double v20 = v5 + v19;
    double v22 = v7 + v21;
    double v24 = v9 - (v19 + v23);
    double v26 = v11 - (v21 + v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
    v29 = v28;
    uint64_t v30 = 1LL;
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
    v29 = v28;
    uint64_t v30 = 0LL;
  }

  [v28 setHidden:v30];
}

- (id)UIFocusEnvironment
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHSearchResultsWrapperViewController defaultResultsViewController](self, "defaultResultsViewController"));
  double v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = v3;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsWrapperViewController searchResultsViewController]( self,  "searchResultsViewController"));
    double v8 = v6;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  return v5;
}

- (TVHSearchResultsViewController)searchResultsViewController
{
  return self->_searchResultsViewController;
}

- (UIViewController)defaultResultsViewController
{
  return self->_defaultResultsViewController;
}

- (void).cxx_destruct
{
}

@end