@interface TVHHomeVideosTabBarItemViewController
+ (id)new;
- (NSSet)mediaCategoryTypes;
- (TVHHomeVideosMainViewController)homeVideosMainViewController;
- (TVHHomeVideosTabBarItemViewController)init;
- (TVHHomeVideosTabBarItemViewController)initWithCoder:(id)a3;
- (TVHHomeVideosTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHHomeVideosTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preferredFocusEnvironments;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)didLoseSelection;
- (void)didReceiveSelection;
- (void)setHomeVideosMainViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHHomeVideosTabBarItemViewController

+ (id)new
{
  return 0LL;
}

- (TVHHomeVideosTabBarItemViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHHomeVideosTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHHomeVideosTabBarItemViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHHomeVideosTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHHomeVideosTabBarItemViewController;
  v5 = -[TVHHomeVideosTabBarItemViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = -[TVHHomeVideosMainViewController initWithMediaLibrary:showingInTabBar:]( objc_alloc(&OBJC_CLASS___TVHHomeVideosMainViewController),  "initWithMediaLibrary:showingInTabBar:",  v4,  1LL);
    homeVideosMainViewController = v5->_homeVideosMainViewController;
    v5->_homeVideosMainViewController = v6;
  }

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHHomeVideosTabBarItemViewController;
  -[TVHHomeVideosTabBarItemViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosTabBarItemViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHHomeVideosTabBarItemViewController homeVideosMainViewController]( self,  "homeVideosMainViewController"));
  -[TVHHomeVideosTabBarItemViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 bounds];
  objc_msgSend(v5, "setFrame:");
  [v3 addSubview:v5];
  [v4 didMoveToParentViewController:self];
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHHomeVideosTabBarItemViewController homeVideosMainViewController](self, "homeVideosMainViewController"));
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
  return 2LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1001061F8, 0LL);
}

- (unint64_t)selectedMediaCategoryType
{
  return 5LL;
}

- (void)didReceiveSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosTabBarItemViewController homeVideosMainViewController](self, "homeVideosMainViewController"));
  [v2 enableFetching];
}

- (void)didLoseSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosTabBarItemViewController homeVideosMainViewController](self, "homeVideosMainViewController"));
  [v2 disableFetching];
}

- (TVHHomeVideosMainViewController)homeVideosMainViewController
{
  return self->_homeVideosMainViewController;
}

- (void)setHomeVideosMainViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end