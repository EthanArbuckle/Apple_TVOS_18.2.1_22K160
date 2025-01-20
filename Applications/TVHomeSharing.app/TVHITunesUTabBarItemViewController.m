@interface TVHITunesUTabBarItemViewController
+ (id)new;
- (NSSet)mediaCategoryTypes;
- (TVHITunesUMainViewController)iTunesUMainViewController;
- (TVHITunesUTabBarItemViewController)init;
- (TVHITunesUTabBarItemViewController)initWithCoder:(id)a3;
- (TVHITunesUTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHITunesUTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preferredFocusEnvironments;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)didLoseSelection;
- (void)didReceiveSelection;
- (void)setITunesUMainViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHITunesUTabBarItemViewController

+ (id)new
{
  return 0LL;
}

- (TVHITunesUTabBarItemViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHITunesUTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHITunesUTabBarItemViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHITunesUTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHITunesUTabBarItemViewController;
  v5 = -[TVHITunesUTabBarItemViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = -[TVHITunesUMainViewController initWithMediaLibrary:showingInTabBar:]( objc_alloc(&OBJC_CLASS___TVHITunesUMainViewController),  "initWithMediaLibrary:showingInTabBar:",  v4,  1LL);
    iTunesUMainViewController = v5->_iTunesUMainViewController;
    v5->_iTunesUMainViewController = v6;
  }

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHITunesUTabBarItemViewController;
  -[TVHITunesUTabBarItemViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUTabBarItemViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUTabBarItemViewController iTunesUMainViewController](self, "iTunesUMainViewController"));
  -[TVHITunesUTabBarItemViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 bounds];
  objc_msgSend(v5, "setFrame:");
  [v3 addSubview:v5];
  [v4 didMoveToParentViewController:self];
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHITunesUTabBarItemViewController iTunesUMainViewController](self, "iTunesUMainViewController"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (unint64_t)type
{
  return 7LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_100106618, 0LL);
}

- (unint64_t)selectedMediaCategoryType
{
  return 7LL;
}

- (void)didReceiveSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHITunesUTabBarItemViewController iTunesUMainViewController](self, "iTunesUMainViewController"));
  [v2 enableFetching];
}

- (void)didLoseSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHITunesUTabBarItemViewController iTunesUMainViewController](self, "iTunesUMainViewController"));
  [v2 disableFetching];
}

- (TVHITunesUMainViewController)iTunesUMainViewController
{
  return self->_iTunesUMainViewController;
}

- (void)setITunesUMainViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end