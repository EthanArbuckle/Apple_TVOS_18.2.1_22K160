@interface MTTVOptionsTableViewController
+ (id)footerFont;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVOptionsTableViewController

+ (id)footerFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVOptionsTableViewController;
  -[MTOptionsTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTTVOptionsTableViewController setEdgesForExtendedLayout:]( self,  "setEdgesForExtendedLayout:",  (unint64_t)-[MTTVOptionsTableViewController edgesForExtendedLayout](self, "edgesForExtendedLayout") & 0xFFFFFFFFFFFFFFFELL);
  -[MTTVOptionsTableViewController setTitle:](self, "setTitle:", 0LL);
}

- (void)viewWillLayoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MTTVOptionsTableViewController;
  -[MTTVOptionsTableViewController viewWillLayoutSubviews](&v44, "viewWillLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController view](self, "view"));
  if ([v11 effectiveUserInterfaceLayoutDirection] == (id)1) {
    double v12 = 30.0;
  }
  else {
    double v12 = 0.0;
  }

  double v13 = v6 + v12;
  double v14 = v8 + -30.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController navigationController](self, "navigationController"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 navigationBar]);
  [(id)v16 frame];
  double MaxY = CGRectGetMaxY(v45);

  double v18 = v10 - MaxY;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  [v19 frame];
  v47.origin.x = v13;
  v47.origin.y = MaxY;
  v47.size.width = v14;
  v47.size.height = v18;
  LOBYTE(v16) = CGRectEqualToRect(v46, v47);

  if ((v16 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v20, "setFrame:", v13, MaxY, v14, v18);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  [v21 contentInset];
  double v23 = v22;
  double v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  [v26 contentInset];
  if (v30 != v23 || v27 != 0.0 || v29 != v25)
  {

LABEL_12:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v32, "setContentInset:", 0.0, v23, 0.0, v25);

    goto LABEL_13;
  }

  double v31 = v28;

  if (v31 != 0.0) {
    goto LABEL_12;
  }
LABEL_13:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  [v33 _gradientMaskEdgeInsets];
  if (v37 != v23 || v34 != 0.0 || v36 != v25)
  {

LABEL_19:
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v39, "_setGradientMaskEdgeInsets:", 0.0, v23, 0.0, v25);

    goto LABEL_20;
  }

  double v38 = v35;

  if (v38 != 0.0) {
    goto LABEL_19;
  }
LABEL_20:
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVOptionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v43, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVOptionsTableViewController;
  id v4 = -[MTOptionsTableViewController tableView:cellForRowAtIndexPath:](&v7, "tableView:cellForRowAtIndexPath:", a3, a4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setShowsSeparator:0];
  return v5;
}

@end