@interface MTTVSettingsSplitViewController
+ (double)rightViewControllerTopMargin;
- (void)layoutRightViewController;
- (void)setupColumnWidth;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTTVSettingsSplitViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVSettingsSplitViewController;
  -[MTTVSettingsSplitViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTTVSettingsSplitViewController setupColumnWidth](self, "setupColumnWidth");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVSettingsSplitViewController;
  -[MTTVSettingsSplitViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsSplitViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "mt_hideNavigationBarOnFirstScreen");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVSettingsSplitViewController;
  -[MTTVSettingsSplitViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[MTTVSettingsSplitViewController layoutRightViewController](self, "layoutRightViewController");
}

+ (double)rightViewControllerTopMargin
{
  return 0.0;
}

- (void)setupColumnWidth
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;

  double v6 = v5 + -760.0 + -100.0;
  -[MTTVSettingsSplitViewController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:", v6);
  -[MTTVSettingsSplitViewController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:", v6);
}

- (void)layoutRightViewController
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsSplitViewController viewControllers](self, "viewControllers"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);

  double v4 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [(id)objc_opt_class(self) rightViewControllerTopMargin];
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsSplitViewController view](self, "view"));
  [v11 frame];
  double v13 = v12;
  [(id)objc_opt_class(self) rightViewControllerTopMargin];
  double v15 = v13 - v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
  objc_msgSend(v16, "setFrame:", v6, v10, v8, v15);
}

@end