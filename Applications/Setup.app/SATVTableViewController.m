@interface SATVTableViewController
- (BOOL)isHorizontallyCentered;
- (SATVTableViewController)init;
- (double)customContentTopInset;
- (double)maxBannerViewWidth;
- (double)tableViewTopInset;
- (id)navigationController;
- (id)preferredFocusEnvironments;
- (void)_centerTableViewHorizontally;
- (void)loadView;
- (void)setCustomContentTopInset:(double)a3;
- (void)setHorizontallyCentered:(BOOL)a3;
- (void)setMaxBannerViewWidth:(double)a3;
- (void)setTableViewTopInset:(double)a3;
- (void)setTableViewWidth:(double)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SATVTableViewController

- (SATVTableViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVTableViewController;
  v2 = -[SATVTableViewController init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SATVTableViewController setTableViewTopInset:](v2, "setTableViewTopInset:", 33.0);
  }
  return v3;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVTableViewController;
  -[SATVPreviewTableViewController loadView](&v12, "loadView");
  -[SATVPreviewTableViewController setPreviewOnRightSide:](self, "setPreviewOnRightSide:", 1LL);
  -[SATVTableViewController setMaxBannerViewWidth:](self, "setMaxBannerViewWidth:", 846.0);
  -[SATVTableViewController tableViewTopInset](self, "tableViewTopInset");
  double v4 = v3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setContentInset:", v4, 0.0, 0.0, 0.0);

  -[SATVTableViewController tableViewTopInset](self, "tableViewTopInset");
  double v7 = -v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setContentOffset:", 0.0, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setDirectionalLayoutMargins:", 0.0, 70.0, 0.0, 70.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController view](self, "view"));
  [v11 setBackgroundColor:v10];

  if (!-[SATVTableViewController tvsk_layoutStyle](self, "tvsk_layoutStyle")) {
    -[SATVTableViewController setHorizontallyCentered:](self, "setHorizontallyCentered:", 1LL);
  }
}

- (void)viewDidLayoutSubviews
{
  if (-[SATVTableViewController isHorizontallyCentered](self, "isHorizontallyCentered")) {
    -[SATVTableViewController _centerTableViewHorizontally](self, "_centerTableViewHorizontally");
  }
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  -[SATVTableViewController maxBannerViewWidth](self, "maxBannerViewWidth");
  objc_msgSend(v3, "sizeThatFits:");
  double v5 = v4;
  double v7 = v6;

  -[SATVPreviewTableViewController tableViewPadding](self, "tableViewPadding");
  double v9 = v8;
  -[SATVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
  double v11 = v10;
  -[SATVTableViewController customContentTopInset](self, "customContentTopInset");
  if (v12 <= 0.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
    [v15 contentInset];
    double v14 = v16 + 0.0;
  }

  else
  {
    -[SATVTableViewController customContentTopInset](self, "customContentTopInset");
    double v14 = v13;
    -[SATVPreviewTableViewController tableViewPadding](self, "tableViewPadding");
    -[SATVTableViewController customContentTopInset](self, "customContentTopInset");
    -[SATVPreviewTableViewController setTableViewPadding:](self, "setTableViewPadding:");
  }

  CGFloat v17 = v9 + floor((v11 - v5) * 0.5);
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SATVTableViewController;
  -[SATVPreviewTableViewController viewDidLayoutSubviews](&v35, "viewDidLayoutSubviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  objc_msgSend(v18, "setFrame:", v17, v14, v5, v7);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v36.origin.x = v17;
  v36.origin.y = v14;
  v36.size.width = v5;
  v36.size.height = v7;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v21;
  v37.origin.y = v23;
  v37.size.width = v25;
  v37.size.height = v27;
  double v29 = MaxY - CGRectGetMinY(v37);
  double v30 = v23 + v29;
  double v31 = v27 - v29;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v32, "setFrame:", v21, v30, v25, v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController bannerView](self, "bannerView"));
  [v33 bringSubviewToFront:v34];
}

- (id)navigationController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVTableViewController;
  id v2 = -[SATVTableViewController navigationController](&v4, "navigationController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setTableViewWidth:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVTableViewController;
  -[SATVPreviewTableViewController setTableViewWidth:](&v7, "setTableViewWidth:");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController view](self, "view"));
  unsigned __int8 v5 = [v4 _shouldReverseLayoutDirection];

  if ((v5 & 1) != 0)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController view](self, "view"));
    [v6 frame];
  }

  -[SATVPreviewTableViewController tableViewPadding](self, "tableViewPadding");
  -[SATVPreviewTableViewController setTableViewPadding:](self, "setTableViewPadding:");
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  double v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    objc_super v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)_centerTableViewHorizontally
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewController view](self, "view"));
  [v3 frame];
  double Width = CGRectGetWidth(v7);
  -[SATVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
  double v6 = floor((Width - v5) * 0.5);

  -[SATVPreviewTableViewController setTableViewPadding:](self, "setTableViewPadding:", 0.0, v6, 0.0, 0.0);
}

- (BOOL)isHorizontallyCentered
{
  return self->_horizontallyCentered;
}

- (void)setHorizontallyCentered:(BOOL)a3
{
  self->_horizontallyCentered = a3;
}

- (double)customContentTopInset
{
  return self->_customContentTopInset;
}

- (void)setCustomContentTopInset:(double)a3
{
  self->_customContentTopInset = a3;
}

- (double)tableViewTopInset
{
  return self->_tableViewTopInset;
}

- (void)setTableViewTopInset:(double)a3
{
  self->_tableViewTopInset = a3;
}

- (double)maxBannerViewWidth
{
  return self->_maxBannerViewWidth;
}

- (void)setMaxBannerViewWidth:(double)a3
{
  self->_maxBannerViewdouble Width = a3;
}

@end