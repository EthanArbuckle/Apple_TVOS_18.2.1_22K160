@interface VSSetupActivityIndicatorViewController
- (void)viewDidLoad;
@end

@implementation VSSetupActivityIndicatorViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSetupActivityIndicatorViewController;
  -[VSSetupActivityIndicatorViewController viewDidLoad](&v6, "viewDidLoad");
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  -[VSSetupActivityIndicatorViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupActivityIndicatorViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 addSubview:v5];

  [v3 didMoveToParentViewController:self];
}

@end