@interface SATVPreviewTableViewController
+ (double)defaultRowHeight;
+ (double)defaultSectionHeaderHeight;
- (BOOL)_isAutoUpdatingPreviewViewController;
- (BOOL)_isBackdropViewVisible;
- (BOOL)fadeThroughPreviews;
- (BOOL)previewOnRightSide;
- (CGRect)_frameForHeaderView;
- (CGRect)_frameForPreview;
- (CGRect)_frameForTable;
- (CGRect)adjustedFrameForPreviewFrame:(CGRect)a3;
- (SATVPreviewTableViewController)initWithStyle:(int64_t)a3;
- (SATVTableView)tableView;
- (UIEdgeInsets)previewViewPadding;
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
- (void)_cancelDelayedAutoUpdateOfPreviewViewController;
- (void)_delayedAutoUpdatePreviewViewController;
- (void)_registerForBackdropViewHideStateUpdates;
- (void)_removeBackdropView;
- (void)_resetAutoUpdatePreviewViewControllerState;
- (void)_setPreviewPaused:(BOOL)a3;
- (void)_setPreviewView:(id)a3 forced:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_unregisterForBackdropViewHideStateUpdates;
- (void)_updateBackdropViewAfterSettingPreviewViewIfNessecary;
- (void)_updateBackdropViewBeforeSettingPreviewViewIfNessecary;
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
- (void)setTableViewPadding:(UIEdgeInsets)a3;
- (void)setTableViewWidth:(double)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVPreviewTableViewController

- (SATVPreviewTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVPreviewTableViewController;
  result = -[SATVPreviewTableViewController initWithStyle:](&v6, "initWithStyle:");
  if (result)
  {
    result->_tableViewWidth = 894.0;
    result->_fadeThroughPreviews = 1;
    *(_OWORD *)&result->_tableViewPadding.top = xmmword_1000C4720;
    *(_OWORD *)&result->_tableViewPadding.bottom = xmmword_1000C4720;
    __int128 v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_previewViewPadding.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_previewViewPadding.bottom = v5;
    result->_initializationStyle = a3;
  }

  return result;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVPreviewTableViewController;
  -[SATVPreviewTableViewController loadView](&v13, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v4 = v3;
  if (v3) {
    id initializationStyle = [v3 style];
  }
  else {
    id initializationStyle = (id)self->_initializationStyle;
  }
  objc_super v6 = -[SATVTableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___SATVTableView),  "initWithFrame:style:",  initializationStyle,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SATVTableView setDelegate:](v6, "setDelegate:", self);
  -[SATVTableView setDataSource:](v6, "setDataSource:", self);
  -[SATVTableView setAutoresizingMask:](v6, "setAutoresizingMask:", 18LL);
  -[SATVPreviewTableViewController setTableView:](self, "setTableView:", v6);
  v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  tableContainingView = self->_tableContainingView;
  self->_tableContainingView = v7;

  v9 = objc_alloc_init(&OBJC_CLASS___SATVFocusRedirectView);
  -[SATVPreviewTableViewController setView:](self, "setView:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v10 setBackgroundColor:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  [v12 addSubview:self->_tableContainingView];

  if (self->_backdropViewMode) {
    -[SATVPreviewTableViewController _addBackdropView](self, "_addBackdropView");
  }
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (SATVTableView)tableView
{
  tableContainingView = self->_tableContainingView;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SATVTableView, a2);
  if ((objc_opt_isKindOfClass(tableContainingView, v4) & 1) != 0) {
    __int128 v5 = self->_tableContainingView;
  }
  else {
    __int128 v5 = 0LL;
  }
  return (SATVTableView *)v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVPreviewTableViewController;
  -[SATVPreviewTableViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 addObserver:self selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v6 addObserver:self selector:"_applicationDidFinishSuspension:" name:v7 object:v8];

  -[SATVPreviewTableViewController _setPreviewPaused:](self, "_setPreviewPaused:", 0LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVPreviewTableViewController;
  -[SATVPreviewTableViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v6 removeObserver:self name:v7 object:v8];

  -[SATVPreviewTableViewController _setPreviewPaused:](self, "_setPreviewPaused:", 1LL);
}

- (void)viewDidLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___SATVPreviewTableViewController;
  -[SATVPreviewTableViewController viewDidLayoutSubviews](&v46, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  headerView = self->_headerView;
  -[SATVPreviewTableViewController _frameForHeaderView](self, "_frameForHeaderView");
  -[UIView setFrame:](headerView, "setFrame:");
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView sizeThatFits:](bannerView, "sizeThatFits:", v9, v11);
    -[UIView setFrame:](self->_bannerView, "setFrame:", 0.0, 0.0, v14, v15);
  }

  -[SATVPreviewTableViewController _frameForTable](self, "_frameForTable");
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  unint64_t backdropViewMode = self->_backdropViewMode;
  if (backdropViewMode)
  {
    CGFloat rect = v11;
    CGFloat v25 = v7;
    if (self->_previewOnRightSide)
    {
      backdropView = self->_backdropView;
      CGFloat v27 = CGRectGetMinX(*(CGRect *)&v16) + 90.0;
      v47.origin.x = v5;
      v47.origin.y = v25;
      v47.size.width = v9;
      v47.size.height = rect;
      double Height = CGRectGetHeight(v47);
      double v29 = 0.0;
      v30 = backdropView;
      double v31 = v27;
    }

    else
    {
      CGFloat v44 = CGRectGetMinX(*(CGRect *)&v16) + -90.0;
      v32 = self->_backdropView;
      v48.origin.x = v5;
      v48.origin.y = v7;
      v48.size.width = v9;
      v48.size.height = rect;
      CGFloat v43 = CGRectGetWidth(v48) - v44;
      v49.origin.x = v5;
      v49.origin.y = v7;
      v49.size.width = v9;
      v49.size.height = rect;
      double Height = CGRectGetHeight(v49);
      v30 = v32;
      double v31 = v43;
      double v29 = v44;
    }

    -[UIVisualEffectView setFrame:](v30, "setFrame:", v29, 0.0, v31, Height);
  }

  -[UIVisualEffectView setHidden:](self->_backdropView, "setHidden:", backdropViewMode == 0);
  -[UIView setFrame:](self->_tableContainingView, "setFrame:", v20, v21, v22, v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  [v33 setNeedsLayout];

  -[SATVPreviewTableViewController _frameForPreview](self, "_frameForPreview");
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  -[UIView sizeToFit](self->_previewView, "sizeToFit");
  -[UIView frame](self->_previewView, "frame");
  if (CGRectIsEmpty(v50)) {
    -[UIView setFrame:](self->_previewView, "setFrame:", v35, v37, v39, v41);
  }
  -[SATVPreviewTableViewController adjustedFrameForPreviewFrame:]( self,  "adjustedFrameForPreviewFrame:",  v35,  v37,  v39,  v41);
  -[UIView setFrame:](self->_previewView, "setFrame:");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
  -[SATVFocusRedirectView bounds](self->_previewContainerView, "bounds");
  objc_msgSend(v42, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
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
    v12 = v5;
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[UIView bounds](*p_headerView, "bounds");
    if (v8 <= 0.0)
    {
      double v9 = *p_headerView;
      -[UIView bounds](*p_headerView, "bounds");
      -[UIView setBounds:](v9, "setBounds:", 0.0, 0.0);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    [v10 addSubview:*p_headerView];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    [v11 setNeedsLayout];

    CGFloat v5 = v12;
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v10 = a4;
  if (-[SATVPreviewTableViewController _isAutoUpdatingPreviewViewController]( self,  "_isAutoUpdatingPreviewViewController"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 nextFocusedIndexPath]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 nextFocusedIndexPath]);
      objc_storeStrong((id *)&self->_pendingAutoUpdatePreviewIndexPath, v7);
      -[SATVPreviewTableViewController _cancelDelayedAutoUpdateOfPreviewViewController]( self,  "_cancelDelayedAutoUpdateOfPreviewViewController");
      self->_lastAutoUpdatePreviewDelay = 0.0;
      if (self->_lastAutoUpdatePreviewIndexPath)
      {
        [v10 _focusVelocity];
        if (fabs(v8) >= 7500.0)
        {
          double v9 = 0.6;
        }

        else
        {
          double v9 = 0.6;
          if (self->_lastAutoUpdatePreviewDelay != 0.6) {
            double v9 = 0.2;
          }
        }

        self->_lastAutoUpdatePreviewDelay = v9;
      }

      else
      {
        double v9 = 0.0;
      }

      -[SATVPreviewTableViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_delayedAutoUpdatePreviewViewController",  0LL,  v9);
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
    -[SATVPreviewTableViewController _unregisterForBackdropViewHideStateUpdates]( self,  "_unregisterForBackdropViewHideStateUpdates");
    objc_storeStrong((id *)&self->_previewViewController, a3);
    -[SATVPreviewTableViewController _registerForBackdropViewHideStateUpdates]( self,  "_registerForBackdropViewHideStateUpdates");
    if (*p_previewViewController)
    {
      -[SATVPreviewTableViewController addChildViewController:](self, "addChildViewController:");
      id v12 = -[SATVPreviewTableViewController view](self, "view");
      objc_super v13 = objc_alloc_init(&OBJC_CLASS___SATVFocusRedirectView);
      previewContainerView = self->_previewContainerView;
      self->_previewContainerView = v13;

      double v15 = self->_previewContainerView;
      -[SATVPreviewTableViewController _frameForPreview](self, "_frameForPreview");
      -[SATVFocusRedirectView setFrame:](v15, "setFrame:");
      -[SATVFocusRedirectView setContainsInertia:](self->_previewContainerView, "setContainsInertia:", 1LL);
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_previewViewController, "view"));
      -[SATVFocusRedirectView bounds](self->_previewContainerView, "bounds");
      objc_msgSend(v16, "setFrame:");
      -[SATVFocusRedirectView addSubview:](self->_previewContainerView, "addSubview:", v16);
      double v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472LL;
      double v21 = sub_1000678FC;
      double v22 = &unk_1000C9BA0;
      double v23 = v11;
      v24 = self;
      double v17 = objc_retainBlock(&v19);
      BOOL v18 = -[UIViewController shouldAnimatePreviewView]( *p_previewViewController,  "shouldAnimatePreviewView",  v19,  v20,  v21,  v22);
      -[SATVPreviewTableViewController _updateBackdropViewBeforeSettingPreviewViewIfNessecary]( self,  "_updateBackdropViewBeforeSettingPreviewViewIfNessecary");
      -[SATVPreviewTableViewController _setPreviewView:forced:animated:completion:]( self,  "_setPreviewView:forced:animated:completion:",  self->_previewContainerView,  0LL,  v18,  v17);
    }

    else
    {
      -[SATVPreviewTableViewController setPreviewView:](self, "setPreviewView:");
      -[SATVPreviewTableViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
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
  double v17 = v11;
  objc_storeStrong((id *)&self->_previewView, a3);
  unsigned int v18 = -[SATVPreviewTableViewController fadeThroughPreviews](self, "fadeThroughPreviews");
  double v19 = 1.0;
  if ((v18 & v7) != 0) {
    double v19 = 0.0;
  }
  -[UIView setAlpha:](v17, "setAlpha:", v19);
  if (self->_backdropView)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    double v21 = v20;
    double v22 = *p_previewView;
    backdropView = self->_backdropView;
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    double v21 = v20;
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

  if (-[SATVPreviewTableViewController fadeThroughPreviews](self, "fadeThroughPreviews")) {
    double v25 = 0.2;
  }
  else {
    double v25 = 0.0;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100067B4C;
  v33[3] = &unk_1000C9468;
  double v34 = v16;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100067B58;
  v28[3] = &unk_1000CAEC0;
  double v29 = v34;
  double v32 = v25;
  v30 = v17;
  id v31 = v12;
  v26 = v17;
  CGFloat v27 = v34;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v33,  v28,  v25);

LABEL_16:
}

- (CGRect)adjustedFrameForPreviewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView frame](self->_previewView, "frame");
  double v11 = UIRectCenteredIntegralRect(v7, v8, v9, v10, x, y, width, height);
  if (width < v13) {
    double v13 = width;
  }
  if (height < v14) {
    double v14 = height;
  }
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setAutoUpdatePreviewViewControllerBlock:(id)a3
{
  id v4 = [a3 copy];
  id autoUpdatePreviewViewControllerBlock = self->_autoUpdatePreviewViewControllerBlock;
  self->_id autoUpdatePreviewViewControllerBlock = v4;

  -[SATVPreviewTableViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
}

- (void)setBannerView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  double v10 = v5;
  if (bannerView != v5)
  {
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    [v7 addSubview:v10];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
    [v8 sendSubviewToBack:v10];

    objc_storeStrong((id *)&self->_bannerView, a3);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
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
    if (-[SATVPreviewTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
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
      if (-[SATVPreviewTableViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[SATVPreviewTableViewController _addBackdropView](self, "_addBackdropView");
        id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
        [v4 setNeedsLayout];
      }
    }

    else
    {
      -[SATVPreviewTableViewController _removeBackdropView](self, "_removeBackdropView");
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
    v10[2] = sub_100067F44;
    v10[3] = &unk_1000C94F8;
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

- (void)_addBackdropView
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  CGFloat v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
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
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[SATVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_cancelDelayedAutoUpdateOfPreviewViewController
{
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
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  if (!v3) {
    sub_100079634();
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  if (v4)
  {
    self->_lastAutoUpdatePreviewDeladouble y = 0.0;
    pendingAutoUpdatePreviewIndexPath = self->_pendingAutoUpdatePreviewIndexPath;
    double v10 = pendingAutoUpdatePreviewIndexPath;
    double v6 = self->_pendingAutoUpdatePreviewIndexPath;
    self->_pendingAutoUpdatePreviewIndexPath = 0LL;

    if (!v10) {
      sub_10007965C();
    }
    if ((-[NSIndexPath isEqual:](self->_lastAutoUpdatePreviewIndexPath, "isEqual:", v10) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastAutoUpdatePreviewIndexPath, pendingAutoUpdatePreviewIndexPath);
      double v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
      uint64_t v8 = ((uint64_t (**)(void, NSIndexPath *))v7)[2](v7, v10);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      if (v9) {
        -[SATVPreviewTableViewController setPreviewViewController:](self, "setPreviewViewController:", v9);
      }
    }
  }

- (void)_registerForBackdropViewHideStateUpdates
{
  previewViewController = self->_previewViewController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000682F0;
  v4[3] = &unk_1000C93A0;
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
  if ((id)-[SATVPreviewTableViewController backdropViewMode](self, "backdropViewMode") == (id)2) {
    -[SATVPreviewTableViewController setBackdropViewHidden:animated:]( self,  "setBackdropViewHidden:animated:",  -[UIViewController shouldHideBackdropView](self->_previewViewController, "shouldHideBackdropView"),  1LL);
  }
}

- (void)_updateBackdropViewBeforeSettingPreviewViewIfNessecary
{
  if ((id)-[SATVPreviewTableViewController backdropViewMode](self, "backdropViewMode") == (id)2)
  {
    unsigned __int8 v3 = -[SATVPreviewTableViewController _isBackdropViewVisible](self, "_isBackdropViewVisible");
    unsigned __int8 v4 = -[UIViewController shouldHideBackdropView](self->_previewViewController, "shouldHideBackdropView");
    if ((v3 & 1) == 0 && (v4 & 1) == 0) {
      -[SATVPreviewTableViewController setBackdropViewHidden:animated:]( self,  "setBackdropViewHidden:animated:",  0LL,  1LL);
    }
  }

- (CGRect)_frameForHeaderView
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
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
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
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
    -[SATVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
    double left = MaxX - v17 - self->_tableViewPadding.right;
  }

  -[SATVPreviewTableViewController tableViewWidth](self, "tableViewWidth");
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
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v38 = v7;
  CGFloat v39 = v6;
  CGFloat rect = v8;

  -[SATVPreviewTableViewController _frameForTable](self, "_frameForTable");
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (self->_previewOnRightSide)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v9);
    double right = 1.0;
    if (self->_previewViewPadding.left <= 0.0) {
      double right = self->_tableViewPadding.right;
    }
    double left = MaxX + right;
  }

  else
  {
    double left = self->_previewViewPadding.left;
  }

  -[UIView bounds](self->_headerView, "bounds");
  double Height = CGRectGetHeight(v40);
  double v21 = Height;
  double top = self->_previewViewPadding.top;
  if (self->_previewOnRightSide)
  {
    double v36 = Height;
    double v23 = left;
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
    double v27 = 1.0;
    if (self->_previewViewPadding.left <= 0.0) {
      double v27 = self->_tableViewPadding.right;
    }
    double v28 = v26 - v27;
    CGFloat v5 = v24;
    double left = v23;
    double v21 = v36;
  }

  else
  {
    v43.origin.double x = v13;
    v43.origin.double y = v14;
    v43.size.double width = v15;
    v43.size.double height = v16;
    double v29 = CGRectGetMinX(v43) - self->_previewViewPadding.left;
    double v30 = 1.0;
    if (self->_previewViewPadding.right <= 0.0) {
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
  double v33 = left;
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