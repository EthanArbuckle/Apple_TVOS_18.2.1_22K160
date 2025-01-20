@interface TVHSeasonDetailsContainerViewController
- (void)viewDidLayoutSubviews;
@end

@implementation TVHSeasonDetailsContainerViewController

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHSeasonDetailsContainerViewController;
  -[TVHSeasonDetailsContainerViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsContainerViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsContainerViewController detailsViewController](self, "detailsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v5, v7);
}

@end