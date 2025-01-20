@interface ZWMenuChooserTableViewController
- (BOOL)_canShowWhileLocked;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ZWMenuChooserTableViewController

- (void)loadView
{
  v9 = -[UITableView initWithFrame:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
  v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v5, "contentView"));
  [v6 addSubview:v9];

  -[ZWMenuChooserTableViewController setView:](self, "setView:", v5);
  -[ZWMenuChooserTableViewController setTableView:](self, "setTableView:", v9);
  -[UITableView setDelegate:](v9, "setDelegate:", self);
  -[UITableView setDataSource:](v9, "setDataSource:", self);
  -[UITableView setScrollEnabled:](v9, "setScrollEnabled:", 0LL);
  -[UITableView setAutoresizingMask:](v9, "setAutoresizingMask:", 18LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](v9, "setBackgroundColor:", v7);

  -[UITableView setSeparatorInset:]( v9,  "setSeparatorInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UITableView setTintColor:](v9, "setTintColor:", v8);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ZWMenuChooserTableViewController;
  -[ZWMenuChooserTableViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(ZWMenuItemSimpleButtonTableViewCell) forCellReuseIdentifier:ZWMenuItemCellReuseID];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v4 setEstimatedRowHeight:44.0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v5 setRowHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ZWMenuChooserTableViewController;
  -[ZWMenuChooserTableViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  if (ZWUseVibrantBlendModes())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.25, 1.0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
    [v5 setSeparatorColor:v4];

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
    [v8 setSeparatorEffect:v7];
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
    [v7 setSeparatorColor:v6];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ZWMenuChooserTableViewController;
  -[ZWMenuChooserTableViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v4 layoutIfNeeded];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v5 contentSize];
  -[ZWMenuChooserTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ZWMenuChooserTableViewController;
  -[ZWMenuChooserTableViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v3 contentSize];
  double v5 = v4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v6 bounds];
  BOOL v8 = v5 > v7;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuChooserTableViewController tableView](self, "tableView"));
  [v9 setScrollEnabled:v8];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [v13 deselectRowAtIndexPath:v6 animated:1];
  double v7 = (char *)[v13 numberOfRowsInSection:0];
  if (v7)
  {
    BOOL v8 = v7;
    for (i = 0LL; i != v8; ++i)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  i,  0LL));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v13 cellForRowAtIndexPath:v10]);
      if (i == [v6 row]) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 0LL;
      }
      [v11 setAccessoryType:v12];
    }
  }

  -[ZWMenuChooserTableViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", ZWMenuItemCellReuseID, a4));
  if (ZWUseVibrantBlendModes())
  {
    if (!UIAccessibilityIsInvertColorsEnabled()) {
      [v4 _setDrawsAsBackdropOverlayWithBlendMode:3];
    }
    id v5 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
    double v6 = 0.25;
  }

  else
  {
    id v5 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
    double v6 = 0.5;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v6, 1.0));
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v7);

  [v4 setSelectedBackgroundView:v5];
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0LL;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end