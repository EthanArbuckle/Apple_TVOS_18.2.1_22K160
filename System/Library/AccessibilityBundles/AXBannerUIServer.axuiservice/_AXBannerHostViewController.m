@interface _AXBannerHostViewController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
@end

@implementation _AXBannerHostViewController

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v9 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v8);

  -[_AXBannerHostViewController setView:](self, "setView:", v9);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30LL;
}

@end