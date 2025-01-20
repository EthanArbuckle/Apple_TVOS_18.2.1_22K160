@interface TVPreviewTableViewController
+ (double)defaultRowHeight;
+ (double)defaultSectionHeaderHeight;
- (BOOL)_isAutoUpdatingPreviewViewController;
- (BOOL)_isBackdropViewVisible;
- (BOOL)_layoutIsRTL;
- (BOOL)fadeThroughPreviews;
- (BOOL)previewOnRightSide;
- (BOOL)useSmallBackdropStyle;
- (CGRect)_frameForHeaderView;
- (CGRect)_frameForPreview;
- (CGRect)_frameForTable;
- (CGRect)adjustedFrameForPreviewFrame:(CGRect)a3;
- (TVPreviewTableViewController)initWithStyle:(int64_t)a3;
- (TVTableView)tableView;
- (UIEdgeInsets)previewViewPadding;
- (UIEdgeInsets)smallBackdropInsets;
- (UIEdgeInsets)tableViewPadding;
- (UIView)bannerView;
- (UIView)headerView;
- (UIView)previewView;
- (UIViewController)previewViewController;
- (double)tableViewWidth;
- (id)autoUpdatePreviewViewControllerBlock;
- (id)preferredFocusEnvironments;
- (unint64_t)backdropViewMode;
- (void)_addBackdropView;
- (void)_applicationDidFinishSuspension:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_cancelAutoUpdatingPreviewViewController;
- (void)_delayedAutoUpdatePreviewViewController;
- (void)_registerForBackdropViewHideStateUpdates;
- (void)_removeBackdropView;
- (void)_resetAutoUpdatePreviewViewControllerState;
- (void)_setPreviewPaused:(BOOL)a3;
- (void)_setPreviewView:(id)a3 forced:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_unregisterForBackdropViewHideStateUpdates;
- (void)_updateBackdropViewAfterSettingPreviewViewIfNessecary;
- (void)_updateBackdropViewBeforeSettingPreviewViewIfNessecary;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setAutoUpdatePreviewViewControllerBlock:(id)a3;
- (void)setBackdropViewHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBackdropViewMode:(unint64_t)a3;
- (void)setBannerView:(id)a3;
- (void)setFadeThroughPreviews:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setPreviewOnRightSide:(BOOL)a3;
- (void)setPreviewView:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setPreviewViewController:(id)a3 forced:(BOOL)a4;
- (void)setPreviewViewPadding:(UIEdgeInsets)a3;
- (void)setSmallBackdropInsets:(UIEdgeInsets)a3;
- (void)setTableViewPadding:(UIEdgeInsets)a3;
- (void)setTableViewWidth:(double)a3;
- (void)setUseSmallBackdropStyle:(BOOL)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPreviewTableViewController

- (TVPreviewTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  result = -[TVPreviewTableViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (result)
  {
    result->_tableViewWidth = 894.0;
    result->_fadeThroughPreviews = 1;
    *(_OWORD *)&result->_tableViewPadding.top = xmmword_1001E80B0;
    *(_OWORD *)&result->_tableViewPadding.bottom = xmmword_1001E80B0;
    __int128 v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_previewViewPadding.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_previewViewPadding.bottom = v4;
    int64x2_t v5 = vdupq_n_s64(0x4049000000000000uLL);
    *(int64x2_t *)&result->_smallBackdropInsets.top = v5;
    *(int64x2_t *)&result->_smallBackdropInsets.bottom = v5;
  }

  return result;
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  -[TVPreviewTableViewController loadView](&v20, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  v13 = -[TVTableView initWithFrame:style:]( [TVTableView alloc],  "initWithFrame:style:",  [v12 style],  v5,  v7,  v9,  v11);
  -[TVTableView setDelegate:](v13, "setDelegate:", self);
  -[TVTableView setDataSource:](v13, "setDataSource:", self);
  -[TVTableView setAutoresizingMask:](v13, "setAutoresizingMask:", 18LL);
  -[TVPreviewTableViewController setTableView:](self, "setTableView:", v13);
  v14 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  tableContainingView = self->_tableContainingView;
  self->_tableContainingView = v14;

  v16 = -[TVFocusRedirectView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVFocusRedirectView),  "initWithFrame:",  v5,  v7,  v9,  v11);
  -[TVPreviewTableViewController setView:](self, "setView:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v17 setBackgroundColor:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  [v19 addSubview:self->_tableContainingView];

  if (self->_backdropViewMode) {
    -[TVPreviewTableViewController _addBackdropView](self, "_addBackdropView");
  }
}

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  lastFocusedDescendentView = self->_lastFocusedDescendentView;
  if (lastFocusedDescendentView)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
    unsigned __int8 v6 = -[UIView isDescendantOfView:](lastFocusedDescendentView, "isDescendantOfView:", v5);

    if ((v6 & 1) == 0) {
      [v3 addObject:self->_lastFocusedDescendentView];
    }
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
    [v3 addObject:v8];
  }

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  -[TVPreviewTableViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  unsigned int v9 = [v7 isDescendantOfView:v8];

  if (v9)
  {
    double v10 = (UIView *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
    lastFocusedDescendentView = self->_lastFocusedDescendentView;
    self->_lastFocusedDescendentView = v10;
  }
}

- (TVTableView)tableView
{
  tableContainingView = self->_tableContainingView;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVTableView, a2);
  if ((objc_opt_isKindOfClass(tableContainingView, v4) & 1) != 0) {
    double v5 = self->_tableContainingView;
  }
  else {
    double v5 = 0LL;
  }
  return (TVTableView *)v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  -[TVPreviewTableViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 addObserver:self selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v6 addObserver:self selector:"_applicationDidFinishSuspension:" name:v7 object:v8];

  -[TVPreviewTableViewController _setPreviewPaused:](self, "_setPreviewPaused:", 0LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  -[TVPreviewTableViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v6 removeObserver:self name:v7 object:v8];

  -[TVPreviewTableViewController _setPreviewPaused:](self, "_setPreviewPaused:", 1LL);
}

- (void)viewDidLayoutSubviews
{
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___TVPreviewTableViewController;
  -[TVPreviewTableViewController viewDidLayoutSubviews](&v74, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  int v12 = -[TVPreviewTableViewController _layoutIsRTL](self, "_layoutIsRTL");
  headerView = self->_headerView;
  -[TVPreviewTableViewController _frameForHeaderView](self, "_frameForHeaderView");
  -[UIView setFrame:](headerView, "setFrame:", sub_100046A18(v12, v14, v15, v16, v17, v5, v7, v9, v11));
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView sizeThatFits:](bannerView, "sizeThatFits:", v9, v11);
    -[UIView setFrame:](self->_bannerView, "setFrame:", sub_100046AB0(v12, 0.0, 0.0, v19, v20, v5, v7, v9, v11));
  }

  -[TVPreviewTableViewController _frameForTable](self, "_frameForTable");
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  unint64_t backdropViewMode = self->_backdropViewMode;
  if (backdropViewMode)
  {
    if (self->_previewOnRightSide)
    {
      backdropView = self->_backdropView;
      double v71 = v24;
      double v31 = v23;
      double v32 = v22;
      double v33 = v21;
      CGFloat v34 = CGRectGetMinX(*(CGRect *)&v21) + 90.0;
      v75.origin.x = v5;
      v75.origin.y = v7;
      v75.size.width = v9;
      v75.size.height = v11;
      double Height = CGRectGetHeight(v75);
      double v36 = 0.0;
      double v37 = v34;
      double v25 = v33;
      double v26 = v32;
      double v27 = v31;
      double v28 = v71;
      CGFloat v38 = v5;
      CGFloat v39 = v7;
      CGFloat v40 = v9;
      CGFloat v41 = v11;
      int v42 = v12;
    }

    else
    {
      if (-[TVPreviewTableViewController useSmallBackdropStyle](self, "useSmallBackdropStyle"))
      {
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v69 = v25 - v43;
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v68 = v26 - v44;
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v72 = v25;
        double v46 = v27 + v45;
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v67 = v46 + v47;
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v49 = v28 + v48;
        -[TVPreviewTableViewController smallBackdropInsets](self, "smallBackdropInsets");
        double v51 = v49 + v50;
        double v25 = v72;
        double v52 = sub_100046AB0(v12, v69, v68, v67, v51, v5, v7, v9, v11);
        backdropView = self->_backdropView;
LABEL_11:
        -[UIVisualEffectView setFrame:](backdropView, "setFrame:", v52);
        goto LABEL_12;
      }

      v76.origin.x = v25;
      v76.origin.y = v26;
      v76.size.width = v27;
      v76.size.height = v28;
      CGFloat v73 = CGRectGetMinX(v76) + -90.0;
      backdropView = self->_backdropView;
      v77.origin.x = v5;
      v77.origin.y = v7;
      v77.size.width = v9;
      v77.size.height = v11;
      CGFloat v70 = CGRectGetWidth(v77) - v73;
      v78.origin.x = v5;
      v78.origin.y = v7;
      v78.size.width = v9;
      v78.size.height = v11;
      double Height = CGRectGetHeight(v78);
      double v37 = v70;
      double v36 = v73;
      CGFloat v38 = v5;
      CGFloat v39 = v7;
      CGFloat v40 = v9;
      int v42 = v12;
      CGFloat v41 = v11;
    }

    double v52 = sub_100046AB0(v42, v36, 0.0, v37, Height, v38, v39, v40, v41);
    goto LABEL_11;
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
    [v8 reloadData];
  }

- (void)_applicationWillEnterForeground:(id)a3
{
}

- (void)_applicationDidFinishSuspension:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    int v12 = v5;
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[UIView bounds](*p_headerView, "bounds");
    if (v8 == 0.0)
    {
      CGFloat v9 = *p_headerView;
      -[UIView bounds](*p_headerView, "bounds");
      -[UIView setBounds:](v9, "setBounds:", 0.0, 0.0);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    [v10 addSubview:*p_headerView];

    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    [v11 setNeedsLayout];

    CGFloat v5 = v12;
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = a4;
  if (-[TVPreviewTableViewController _isAutoUpdatingPreviewViewController]( self,  "_isAutoUpdatingPreviewViewController"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedIndexPath]);

    if (v7)
    {
      double v8 = (NSIndexPath *)objc_claimAutoreleasedReturnValue([v6 nextFocusedIndexPath]);
      pendingAutoUpdatePreviewIndexPath = self->_pendingAutoUpdatePreviewIndexPath;
      self->_pendingAutoUpdatePreviewIndexPath = v8;
      double v10 = v8;

      self->_lastAutoUpdatePreviewDelay = 0.0;
      if (self->_lastAutoUpdatePreviewIndexPath)
      {
        [v6 _focusVelocity];
        if (fabs(v11) >= 7500.0)
        {
          double v12 = 0.6;
        }

        else
        {
          double v12 = 0.6;
          if (self->_lastAutoUpdatePreviewDelay != 0.6) {
            double v12 = 0.2;
          }
        }

        self->_lastAutoUpdatePreviewDelay = v12;
      }

      else
      {
        double v12 = 0.0;
      }

      dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v12 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000832DC;
      block[3] = &unk_100268CF0;
      block[4] = self;
      dispatch_after(v13, &_dispatch_main_q, block);
    }
  }
}

- (void)setPreviewViewController:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIViewController *)a3;
  p_previewViewController = &self->_previewViewController;
  previewViewController = self->_previewViewController;
  if (previewViewController != v7 || v4)
  {
    double v11 = previewViewController;
    -[UIViewController willMoveToParentViewController:](v11, "willMoveToParentViewController:", 0LL);
    -[TVPreviewTableViewController _unregisterForBackdropViewHideStateUpdates]( self,  "_unregisterForBackdropViewHideStateUpdates");
    objc_storeStrong((id *)&self->_previewViewController, a3);
    -[TVPreviewTableViewController _registerForBackdropViewHideStateUpdates]( self,  "_registerForBackdropViewHideStateUpdates");
    if (*p_previewViewController)
    {
      -[TVPreviewTableViewController addChildViewController:](self, "addChildViewController:");
      id v12 = -[TVPreviewTableViewController view](self, "view");
      dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
      [v13 bounds];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;

      LODWORD(v13) = -[TVPreviewTableViewController _layoutIsRTL](self, "_layoutIsRTL");
      double v22 = objc_alloc_init(&OBJC_CLASS___TVFocusRedirectView);
      previewContainerView = self->_previewContainerView;
      self->_previewContainerView = v22;

      double v24 = self->_previewContainerView;
      -[TVPreviewTableViewController _frameForPreview](self, "_frameForPreview");
      -[TVFocusRedirectView setFrame:]( v24,  "setFrame:",  sub_100046A18((int)v13, v25, v26, v27, v28, v15, v17, v19, v21));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_previewViewController, "view"));
      -[TVFocusRedirectView bounds](self->_previewContainerView, "bounds");
      objc_msgSend(v29, "setFrame:");
      -[TVFocusRedirectView addSubview:](self->_previewContainerView, "addSubview:", v29);
      double v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472LL;
      CGFloat v34 = sub_1000834EC;
      v35 = &unk_100268B30;
      double v36 = v11;
      double v37 = self;
      v30 = objc_retainBlock(&v32);
      BOOL v31 = -[UIViewController shouldAnimatePreviewView]( *p_previewViewController,  "shouldAnimatePreviewView",  v32,  v33,  v34,  v35);
      -[TVPreviewTableViewController _updateBackdropViewBeforeSettingPreviewViewIfNessecary]( self,  "_updateBackdropViewBeforeSettingPreviewViewIfNessecary");
      -[TVPreviewTableViewController _setPreviewView:forced:animated:completion:]( self,  "_setPreviewView:forced:animated:completion:",  self->_previewContainerView,  0LL,  v31,  v30);
    }

    else
    {
      -[TVPreviewTableViewController setPreviewView:](self, "setPreviewView:");
      -[TVPreviewTableViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
    }
  }
}

- (void)_setPreviewView:(id)a3 forced:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  double v11 = (UIView *)a3;
  id v12 = a6;
  p_previewView = &self->_previewView;
  previewView = self->_previewView;
  if (previewView == v11 && !v8) {
    goto LABEL_16;
  }
  double v16 = previewView;
  CGFloat v17 = v11;
  objc_storeStrong((id *)&self->_previewView, a3);
  unsigned int v18 = -[TVPreviewTableViewController fadeThroughPreviews](self, "fadeThroughPreviews");
  double v19 = 1.0;
  if ((v18 & v7) != 0) {
    double v19 = 0.0;
  }
  -[UIView setAlpha:](v17, "setAlpha:", v19);
  if (self->_backdropView)
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    CGFloat v21 = v20;
    double v22 = *p_previewView;
    backdropView = self->_backdropView;
  }

  else
  {
    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));

    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    CGFloat v21 = v20;
    double v22 = *p_previewView;
    if (!v24)
    {
      [v20 addSubview:v22];
      goto LABEL_12;
    }

    backdropView = (UIVisualEffectView *)self->_tableContainingView;
  }

  [v20 insertSubview:v22 belowSubview:backdropView];
LABEL_12:

  if (-[TVPreviewTableViewController fadeThroughPreviews](self, "fadeThroughPreviews")) {
    double v25 = 0.2;
  }
  else {
    double v25 = 0.0;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100083744;
  v33[3] = &unk_100268CF0;
  CGFloat v34 = v16;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100083750;
  v28[3] = &unk_10026BE50;
  v29 = v34;
  double v32 = v25;
  v30 = v17;
  id v31 = v12;
  double v26 = v17;
  double v27 = v34;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v33,  v28,  v25);

LABEL_16:
}

- (CGRect)adjustedFrameForPreviewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = -[UIView frame](self->_previewView, "frame");
  double v12 = UIRectCenteredIntegralRect(v7, v8, v9, v10, v11, x, y, width, height);
  if (width < v14) {
    double v14 = width;
  }
  if (height < v15) {
    double v15 = height;
  }
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setAutoUpdatePreviewViewControllerBlock:(id)a3
{
  id v4 = [a3 copy];
  id autoUpdatePreviewViewControllerBlock = self->_autoUpdatePreviewViewControllerBlock;
  self->_id autoUpdatePreviewViewControllerBlock = v4;

  -[TVPreviewTableViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
}

- (void)setBannerView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  double v10 = v5;
  if (bannerView != v5)
  {
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    [v7 addSubview:v10];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    [v8 sendSubviewToBack:v10];

    objc_storeStrong((id *)&self->_bannerView, a3);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
    [v9 setNeedsLayout];
  }
}

- (void)setPreviewViewController:(id)a3
{
}

- (void)setPreviewView:(id)a3
{
}

- (void)setPreviewOnRightSide:(BOOL)a3
{
  if (self->_previewOnRightSide != a3)
  {
    self->_previewOnRightSide = a3;
    if (-[TVPreviewTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
      [v4 setNeedsLayout];
    }
  }

- (void)setBackdropViewMode:(unint64_t)a3
{
  if (self->_backdropViewMode != a3)
  {
    self->_unint64_t backdropViewMode = a3;
    if (a3)
    {
      if (-[TVPreviewTableViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[TVPreviewTableViewController _addBackdropView](self, "_addBackdropView");
        id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
        [v4 setNeedsLayout];
      }
    }

    else
    {
      -[TVPreviewTableViewController _removeBackdropView](self, "_removeBackdropView");
    }
  }

- (void)setBackdropViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  -[UIVisualEffectView alpha](self->_backdropView, "alpha");
  if (v7 != v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100083B3C;
    v10[3] = &unk_100268E30;
    v10[4] = self;
    *(double *)&v10[5] = v6;
    double v8 = objc_retainBlock(v10);
    double v9 = v8;
    if (v4) {
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x10000LL,  v8,  0LL,  0.2,  0.0);
    }
    else {
      ((void (*)(void *))v8[2])(v8);
    }
  }

- (BOOL)_layoutIsRTL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  BOOL v3 = [v2 effectiveUserInterfaceLayoutDirection] == (id)1;

  return v3;
}

- (void)_addBackdropView
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  BOOL v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5002LL));
  CGFloat v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  if (-[TVPreviewTableViewController useSmallBackdropStyle](self, "useSmallBackdropStyle")) {
    -[UIVisualEffectView _setContinuousCornerRadius:](self->_backdropView, "_setContinuousCornerRadius:", 40.0);
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));

  if (v7)
  {
    [v9 insertSubview:self->_backdropView belowSubview:self->_tableContainingView];
  }

  else
  {
    double v8 = self->_backdropView;
    if (self->_previewView) {
      objc_msgSend(v9, "insertSubview:aboveSubview:", v8);
    }
    else {
      objc_msgSend(v9, "insertSubview:atIndex:", v8);
    }
  }
}

- (void)_removeBackdropView
{
  backdropView = self->_backdropView;
  self->_backdropView = 0LL;
}

- (BOOL)_isAutoUpdatingPreviewViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_resetAutoUpdatePreviewViewControllerState
{
  pendingAutoUpdatePreviewIndexPath = self->_pendingAutoUpdatePreviewIndexPath;
  self->_pendingAutoUpdatePreviewIndexPath = 0LL;

  lastAutoUpdatePreviewIndexPath = self->_lastAutoUpdatePreviewIndexPath;
  self->_lastAutoUpdatePreviewIndexPath = 0LL;

  self->_lastAutoUpdatePreviewDeladouble y = 0.0;
}

- (void)_cancelAutoUpdatingPreviewViewController
{
}

- (void)_delayedAutoUpdatePreviewViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  if (v3)
  {
    pendingAutoUpdatePreviewIndexPath = self->_pendingAutoUpdatePreviewIndexPath;

    if (pendingAutoUpdatePreviewIndexPath)
    {
      self->_lastAutoUpdatePreviewDeladouble y = 0.0;
      CGFloat v5 = self->_pendingAutoUpdatePreviewIndexPath;
      double v12 = v5;
      double v6 = self->_pendingAutoUpdatePreviewIndexPath;
      self->_pendingAutoUpdatePreviewIndexPath = 0LL;

      double v7 = v12;
      if (v12)
      {
        unsigned __int8 v8 = -[NSIndexPath isEqual:](self->_lastAutoUpdatePreviewIndexPath, "isEqual:", v12);
        double v7 = v12;
        if ((v8 & 1) == 0)
        {
          objc_storeStrong((id *)&self->_lastAutoUpdatePreviewIndexPath, v5);
          id v9 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[TVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
          uint64_t v10 = ((uint64_t (**)(void, NSIndexPath *))v9)[2](v9, v12);
          double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

          if (v11) {
            -[TVPreviewTableViewController setPreviewViewController:](self, "setPreviewViewController:", v11);
          }

          double v7 = v12;
        }
      }
    }
  }

- (void)_registerForBackdropViewHideStateUpdates
{
  previewViewController = self->_previewViewController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100083EEC;
  v4[3] = &unk_100269B10;
  objc_copyWeak(&v5, &location);
  -[UIViewController setBackdropViewHideStateNeedsUpdatingBlock:]( previewViewController,  "setBackdropViewHideStateNeedsUpdatingBlock:",  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_unregisterForBackdropViewHideStateUpdates
{
}

- (BOOL)_isBackdropViewVisible
{
  return v2 != 0.0;
}

- (void)_updateBackdropViewAfterSettingPreviewViewIfNessecary
{
  if ((id)-[TVPreviewTableViewController backdropViewMode](self, "backdropViewMode") == (id)2) {
    -[TVPreviewTableViewController setBackdropViewHidden:animated:]( self,  "setBackdropViewHidden:animated:",  -[UIViewController shouldHideBackdropView](self->_previewViewController, "shouldHideBackdropView"),  1LL);
  }
}

- (void)_updateBackdropViewBeforeSettingPreviewViewIfNessecary
{
  if ((id)-[TVPreviewTableViewController backdropViewMode](self, "backdropViewMode") == (id)2)
  {
    unsigned __int8 v3 = -[TVPreviewTableViewController _isBackdropViewVisible](self, "_isBackdropViewVisible");
    unsigned __int8 v4 = -[UIViewController shouldHideBackdropView](self->_previewViewController, "shouldHideBackdropView");
    if ((v3 & 1) == 0 && (v4 & 1) == 0) {
      -[TVPreviewTableViewController setBackdropViewHidden:animated:](self, "setBackdropViewHidden:animated:", 0LL, 1LL);
    }
  }

- (CGRect)_frameForHeaderView
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  -[UIView bounds](self->_headerView, "bounds");
  double v7 = v6;

  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v5;
  double v11 = v7;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)_frameForTable
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView bounds](self->_headerView, "bounds");
  double v12 = CGRectGetHeight(v24) + self->_tableViewPadding.top;
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView sizeThatFits:](bannerView, "sizeThatFits:", v9, v11);
    double v12 = v12 + v14;
  }

  if (self->_previewOnRightSide)
  {
    double left = self->_tableViewPadding.left;
  }

  else
  {
    v25.origin.double x = v5;
    v25.origin.double y = v7;
    v25.size.double width = v9;
    v25.size.double height = v11;
    double MaxX = CGRectGetMaxX(v25);
    -[TVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
    double left = MaxX - v17 - self->_tableViewPadding.right;
  }

  -[TVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
  double v19 = v18;
  v26.origin.double x = v5;
  v26.origin.double y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  double v20 = CGRectGetHeight(v26) - v12 - self->_tableViewPadding.bottom;
  double v21 = left;
  double v22 = v12;
  double v23 = v19;
  result.size.double height = v20;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)_frameForPreview
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v38 = v7;
  CGFloat v39 = v6;
  CGFloat rect = v8;

  -[TVPreviewTableViewController _frameForTable](self, "_frameForTable");
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (self->_previewOnRightSide)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v9);
    double left = self->_previewViewPadding.left;
    if (left == 0.0) {
      double left = self->_tableViewPadding.right;
    }
    double v19 = MaxX + left;
  }

  else
  {
    double v19 = self->_previewViewPadding.left;
  }

  -[UIView bounds](self->_headerView, "bounds");
  double Height = CGRectGetHeight(v40);
  double v21 = Height;
  double top = self->_previewViewPadding.top;
  if (self->_previewOnRightSide)
  {
    double v36 = Height;
    double v23 = v19;
    double v24 = v5;
    v41.origin.double x = v5;
    v41.size.double width = v38;
    v41.origin.double y = v39;
    v41.size.double height = rect;
    double v25 = CGRectGetMaxX(v41);
    v42.origin.double x = v13;
    v42.origin.double y = v14;
    v42.size.double width = v15;
    v42.size.double height = v16;
    double v26 = v25 - CGRectGetMaxX(v42) - self->_previewViewPadding.right;
    double right = self->_previewViewPadding.left;
    if (right == 0.0) {
      double right = self->_tableViewPadding.right;
    }
    double v28 = v26 - right;
    CGFloat v5 = v24;
    double v19 = v23;
    double v21 = v36;
  }

  else
  {
    v43.origin.double x = v13;
    v43.origin.double y = v14;
    v43.size.double width = v15;
    v43.size.double height = v16;
    double v29 = CGRectGetMinX(v43) - self->_previewViewPadding.left;
    double v30 = self->_previewViewPadding.right;
    if (v30 == 0.0) {
      double v30 = self->_tableViewPadding.left;
    }
    double v28 = v29 - v30;
  }

  v44.origin.double x = v5;
  v44.size.double width = v38;
  v44.origin.double y = v39;
  v44.size.double height = rect;
  CGFloat v31 = CGRectGetHeight(v44) - self->_previewViewPadding.top - self->_previewViewPadding.bottom;
  -[UIView bounds](self->_headerView, "bounds");
  double v32 = v31 - CGRectGetHeight(v45);
  double v33 = v19;
  double v34 = v21 + top;
  double v35 = v28;
  result.size.double height = v32;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (void)_setPreviewPaused:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
  [v5 setPreviewPaused:v3];

  -[UIView setPreviewPaused:](self->_previewView, "setPreviewPaused:", v3);
}

+ (double)defaultRowHeight
{
  return 75.0;
}

+ (double)defaultSectionHeaderHeight
{
  return 52.0;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (double)tableViewWidth
{
  return self->_tableViewWidth;
}

- (void)setTableViewWidth:(double)a3
{
  self->_tableViewWidth = a3;
}

- (UIEdgeInsets)tableViewPadding
{
  double top = self->_tableViewPadding.top;
  double left = self->_tableViewPadding.left;
  double bottom = self->_tableViewPadding.bottom;
  double right = self->_tableViewPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTableViewPadding:(UIEdgeInsets)a3
{
  self->_tableViewPadding = a3;
}

- (UIEdgeInsets)previewViewPadding
{
  double top = self->_previewViewPadding.top;
  double left = self->_previewViewPadding.left;
  double bottom = self->_previewViewPadding.bottom;
  double right = self->_previewViewPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreviewViewPadding:(UIEdgeInsets)a3
{
  self->_previewViewPadding = a3;
}

- (BOOL)previewOnRightSide
{
  return self->_previewOnRightSide;
}

- (unint64_t)backdropViewMode
{
  return self->_backdropViewMode;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)useSmallBackdropStyle
{
  return self->_useSmallBackdropStyle;
}

- (void)setUseSmallBackdropStyle:(BOOL)a3
{
  self->_useSmallBackdropStyle = a3;
}

- (UIEdgeInsets)smallBackdropInsets
{
  double top = self->_smallBackdropInsets.top;
  double left = self->_smallBackdropInsets.left;
  double bottom = self->_smallBackdropInsets.bottom;
  double right = self->_smallBackdropInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSmallBackdropInsets:(UIEdgeInsets)a3
{
  self->_smallBackdropInsets = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (BOOL)fadeThroughPreviews
{
  return self->_fadeThroughPreviews;
}

- (void)setFadeThroughPreviews:(BOOL)a3
{
  self->_fadeThroughPreviews = a3;
}

- (id)autoUpdatePreviewViewControllerBlock
{
  return self->_autoUpdatePreviewViewControllerBlock;
}

- (void).cxx_destruct
{
}

@end