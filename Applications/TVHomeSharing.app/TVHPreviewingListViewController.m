@interface TVHPreviewingListViewController
+ (TVHPreviewingListViewController)new;
- (BOOL)_isAutoUpdatingPreviewViewControllerEnabled;
- (BOOL)_listViewBackdropCanBeShown;
- (BOOL)_shouldHideListViewBackdrop;
- (BOOL)_updatesListViewCellSelectedAppearance;
- (BOOL)animatesPreviewTransition;
- (BOOL)listViewCell:(id)a3 shouldAppearSelectedForPreviouslyFocusedView:(id)a4;
- (BOOL)listViewRespectSafeAreaInsets;
- (BOOL)performedInitalPreviewViewControllerAutoUpdate;
- (BOOL)previewOnRightSide;
- (BOOL)previewViewRespectSafeAreaInsets;
- (BOOL)updatesListViewCellSelectedAppearance;
- (NSDirectionalEdgeInsets)listHeaderViewMargin;
- (NSDirectionalEdgeInsets)listViewMargin;
- (NSDirectionalEdgeInsets)previewViewMargin;
- (NSIndexPath)lastAutoUpdatePreviewIndexPath;
- (NSIndexPath)pendingAutoUpdatePreviewIndexPath;
- (TVHListView)listView;
- (TVHPreviewingListView)previewingListView;
- (TVHPreviewingListViewController)init;
- (TVHPreviewingListViewController)initWithCoder:(id)a3;
- (TVHPreviewingListViewController)initWithItemSize:(CGSize)a3;
- (TVHPreviewingListViewController)initWithListViewLayout:(id)a3;
- (TVHPreviewingListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIImage)backgroundImage;
- (UIView)headerView;
- (UIView)listHeaderView;
- (UIView)previewView;
- (UIViewController)previewViewController;
- (double)lastAutoUpdatePreviewDelay;
- (id)_previewManager;
- (id)autoUpdatePreviewViewControllerBlock;
- (id)preferredFocusEnvironments;
- (unint64_t)_listViewBackdropStyleForCurrentSize;
- (unint64_t)listViewBackdropMode;
- (unint64_t)listViewBackdropSize;
- (void)_cancelAutoUpdatingPreviewViewController;
- (void)_cancelDelayedAutoUpdateOfPreviewViewController;
- (void)_delayedAutoUpdatePreviewViewController;
- (void)_handleApplicationDidFinishSuspensionSnapshotNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)_registerForListViewBackdropHiddenStateUpdates;
- (void)_resetAutoUpdatePreviewViewControllerState;
- (void)_setPreviewPaused:(BOOL)a3;
- (void)_unregisterForListViewBackdropHideStateUpdates;
- (void)_updateListViewBackdropAfterSettingPreviewViewIfNecessary;
- (void)_updateListViewBackdropBeforeSettingPreviewViewIfNecessary;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadView;
- (void)setAnimatesPreviewTransition:(BOOL)a3;
- (void)setAutoUpdatePreviewViewControllerBlock:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLastAutoUpdatePreviewDelay:(double)a3;
- (void)setLastAutoUpdatePreviewIndexPath:(id)a3;
- (void)setListHeaderView:(id)a3;
- (void)setListHeaderViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setListViewBackdropMode:(unint64_t)a3;
- (void)setListViewBackdropSize:(unint64_t)a3;
- (void)setListViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setListViewRespectSafeAreaInsets:(BOOL)a3;
- (void)setPendingAutoUpdatePreviewIndexPath:(id)a3;
- (void)setPerformedInitalPreviewViewControllerAutoUpdate:(BOOL)a3;
- (void)setPreviewOnRightSide:(BOOL)a3;
- (void)setPreviewView:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setPreviewViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setPreviewViewRespectSafeAreaInsets:(BOOL)a3;
- (void)setUpdatesListViewCellSelectedAppearance:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVHPreviewingListViewController

+ (TVHPreviewingListViewController)new
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v3);

  return 0LL;
}

- (TVHPreviewingListViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPreviewingListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHPreviewingListViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHPreviewingListViewController)initWithItemSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHPreviewingListViewController;
  v5 = -[TVHPreviewingListViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
    -[TVHListViewLayout setItemSize:](v6, "setItemSize:", width, height);
    sub_10007DA28(v5, v6);
  }

  return v5;
}

- (TVHPreviewingListViewController)initWithListViewLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHPreviewingListViewController;
  v5 = -[TVHPreviewingListViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    sub_10007DA28(v5, v4);
  }

  return v6;
}

- (void)setPreviewOnRightSide:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v4 setPreviewOnRightSide:v3];
}

- (BOOL)previewOnRightSide
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = [v2 previewOnRightSide];

  return v3;
}

- (void)setBackgroundImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v5 setBackgroundImage:v4];
}

- (UIImage)backgroundImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundImage]);

  return (UIImage *)v3;
}

- (void)setHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v5 setHeaderView:v4];
}

- (UIView)headerView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 headerView]);

  return (UIView *)v3;
}

- (TVHListView)listView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 listView]);

  return (TVHListView *)v3;
}

- (void)setListViewMargin:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  objc_msgSend(v7, "setListViewMargin:", top, leading, bottom, trailing);
}

- (NSDirectionalEdgeInsets)listViewMargin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v2 listViewMargin];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double trailing = v14;
  result.double bottom = v13;
  result.double leading = v12;
  result.double top = v11;
  return result;
}

- (void)setListViewBackdropMode:(unint64_t)a3
{
  if (self->_listViewBackdropMode != a3)
  {
    self->_listViewBackdropMode = a3;
    if (a3 - 1 >= 2)
    {
      if (a3) {
        return;
      }
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
      id v7 = v5;
      unint64_t v6 = 0LL;
    }

    else
    {
      unint64_t v4 = -[TVHPreviewingListViewController _listViewBackdropStyleForCurrentSize]( self,  "_listViewBackdropStyleForCurrentSize");
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
      id v7 = v5;
      unint64_t v6 = v4;
    }

    [v5 setListViewBackdropStyle:v6];
  }

- (void)setListViewBackdropSize:(unint64_t)a3
{
  if (self->_listViewBackdropSize != a3)
  {
    self->_listViewBackdropSize = a3;
    if (-[TVHPreviewingListViewController listViewBackdropMode](self, "listViewBackdropMode"))
    {
      unint64_t v4 = -[TVHPreviewingListViewController _listViewBackdropStyleForCurrentSize]( self,  "_listViewBackdropStyleForCurrentSize");
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
      [v5 setListViewBackdropStyle:v4];
    }
  }

- (void)setListHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v5 setListHeaderView:v4];
}

- (UIView)listHeaderView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 listHeaderView]);

  return (UIView *)v3;
}

- (void)setListHeaderViewMargin:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  objc_msgSend(v7, "setListHeaderViewMargin:", top, leading, bottom, trailing);
}

- (NSDirectionalEdgeInsets)listHeaderViewMargin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v2 listHeaderViewMargin];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double trailing = v14;
  result.double bottom = v13;
  result.double leading = v12;
  result.double top = v11;
  return result;
}

- (void)setPreviewView:(id)a3
{
  id v4 = a3;
  -[TVHPreviewingListViewController setPreviewViewController:](self, "setPreviewViewController:", 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v5 setPreviewView:v4];
}

- (UIView)previewView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 previewView]);

  return (UIView *)v3;
}

- (void)setPreviewViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  previewViewController = self->_previewViewController;
  if (previewViewController != v5)
  {
    double v7 = previewViewController;
    -[UIViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", 0LL);
    -[TVHPreviewingListViewController _unregisterForListViewBackdropHideStateUpdates]( self,  "_unregisterForListViewBackdropHideStateUpdates");
    objc_storeStrong((id *)&self->_previewViewController, a3);
    -[TVHPreviewingListViewController _registerForListViewBackdropHiddenStateUpdates]( self,  "_registerForListViewBackdropHiddenStateUpdates");
    if (v5)
    {
      -[TVHPreviewingListViewController addChildViewController:](self, "addChildViewController:", v5);
      id v8 = -[TVHPreviewingListViewController view](self, "view");
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v5, "view"));
      double v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      v15 = sub_10007E228;
      v16 = &unk_1000FCDB8;
      v17 = v7;
      v18 = self;
      double v10 = objc_retainBlock(&v13);
      -[TVHPreviewingListViewController _updateListViewBackdropBeforeSettingPreviewViewIfNecessary]( self,  "_updateListViewBackdropBeforeSettingPreviewViewIfNecessary",  v13,  v14,  v15,  v16);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
      [v11 setPreviewView:v9 completion:v10];
    }

    else
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
      [v12 setPreviewView:0];

      -[TVHPreviewingListViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
    }
  }
}

- (void)setAutoUpdatePreviewViewControllerBlock:(id)a3
{
  id v4 = [a3 copy];
  id autoUpdatePreviewViewControllerBlock = self->_autoUpdatePreviewViewControllerBlock;
  self->_id autoUpdatePreviewViewControllerBlock = v4;

  -[TVHPreviewingListViewController _cancelAutoUpdatingPreviewViewController]( self,  "_cancelAutoUpdatingPreviewViewController");
}

- (void)setPreviewViewMargin:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  objc_msgSend(v7, "setPreviewViewMargin:", top, leading, bottom, trailing);
}

- (NSDirectionalEdgeInsets)previewViewMargin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v2 previewViewMargin];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double trailing = v14;
  result.double bottom = v13;
  result.double leading = v12;
  result.double top = v11;
  return result;
}

- (void)setPreviewViewRespectSafeAreaInsets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v4 setPreviewViewRespectSafeAreaInsets:v3];
}

- (BOOL)previewViewRespectSafeAreaInsets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = [v2 previewViewRespectSafeAreaInsets];

  return v3;
}

- (void)setAnimatesPreviewTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  [v4 setAnimatesPreviewTransition:v3];
}

- (BOOL)animatesPreviewTransition
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  unsigned __int8 v3 = [v2 animatesPreviewTransition];

  return v3;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  -[TVHPreviewingListViewController setView:](self, "setView:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHPreviewingListViewController;
  -[TVHPreviewingListViewController viewWillAppear:](&v16, "viewWillAppear:", a3);
  if (-[TVHPreviewingListViewController listViewRespectSafeAreaInsets](self, "listViewRespectSafeAreaInsets"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController tabBarController](self, "tabBarController"));
    double v5 = v4;
    if (v4)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tabBar]);
      id v7 = [v6 _displayStyle];

      if (v7 == (id)1)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
        [v8 setListViewRespectSafeAreaInsets:1];
      }
    }
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v9 addObserver:self selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:v10];

  uint64_t v11 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v9 addObserver:self selector:"_handleApplicationDidFinishSuspensionSnapshotNotification:" name:v11 object:v12];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController tabBarController](self, "tabBarController"));
  if (!v13
    || !-[TVHPreviewingListViewController _isAutoUpdatingPreviewViewControllerEnabled]( self,  "_isAutoUpdatingPreviewViewControllerEnabled"))
  {
    goto LABEL_12;
  }

  unsigned __int8 v14 = -[TVHPreviewingListViewController performedInitalPreviewViewControllerAutoUpdate]( self,  "performedInitalPreviewViewControllerAutoUpdate");

  if ((v14 & 1) == 0)
  {
    -[TVHPreviewingListViewController setPerformedInitalPreviewViewControllerAutoUpdate:]( self,  "setPerformedInitalPreviewViewControllerAutoUpdate:",  1LL);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
    if ((uint64_t)[v13 numberOfSections] >= 1
      && (uint64_t)[v13 numberOfItemsInSection:0] >= 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
      -[TVHPreviewingListViewController setPendingAutoUpdatePreviewIndexPath:]( self,  "setPendingAutoUpdatePreviewIndexPath:",  v15);
      -[TVHPreviewingListViewController _delayedAutoUpdatePreviewViewController]( self,  "_delayedAutoUpdatePreviewViewController");
    }

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHPreviewingListViewController;
  -[TVHPreviewingListViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:v5];

  uint64_t v6 = _UIApplicationDidFinishSuspensionSnapshotNotification;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 removeObserver:self name:v6 object:v7];

  -[TVHPreviewingListViewController _setPreviewPaused:](self, "_setPreviewPaused:", 1LL);
}

- (id)preferredFocusEnvironments
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewViewController](self, "previewViewController"));
  if (v3
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewView](self, "previewView"))) != 0LL)
  {
    v8[0] = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
    v8[1] = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
    id v7 = v3;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  }

  return v5;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVHListViewCell);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0
    && -[TVHPreviewingListViewController _updatesListViewCellSelectedAppearance]( self,  "_updatesListViewCellSelectedAppearance"))
  {
    id v9 = v15;
    [v9 setDelegate:self];
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 focusedView]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
    unsigned __int8 v13 = [v11 isDescendantOfView:v12];

    if ((v13 & 1) == 0)
    {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController lastAutoUpdatePreviewIndexPath]( self,  "lastAutoUpdatePreviewIndexPath"));
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHListViewCell);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
    [v6 setDelegate:0];
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v13 = a4;
  unsigned int v6 = -[TVHPreviewingListViewController _isAutoUpdatingPreviewViewControllerEnabled]( self,  "_isAutoUpdatingPreviewViewControllerEnabled");
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 nextFocusedIndexPath]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController lastAutoUpdatePreviewIndexPath]( self,  "lastAutoUpdatePreviewIndexPath"));
    if (v8 && ([v8 isEqual:v9] & 1) == 0)
    {
      -[TVHPreviewingListViewController setPendingAutoUpdatePreviewIndexPath:]( self,  "setPendingAutoUpdatePreviewIndexPath:",  v8);
      -[TVHPreviewingListViewController _cancelDelayedAutoUpdateOfPreviewViewController]( self,  "_cancelDelayedAutoUpdateOfPreviewViewController");
      if (v9)
      {
        [v13 _focusVelocity];
        if (fabs(v10) >= 7500.0)
        {
          double v11 = 0.6;
        }

        else
        {
          -[TVHPreviewingListViewController lastAutoUpdatePreviewDelay](self, "lastAutoUpdatePreviewDelay");
          double v11 = 0.6;
          if (v12 != 0.6) {
            double v11 = 0.1;
          }
        }
      }

      else
      {
        double v11 = 0.0;
      }

      -[TVHPreviewingListViewController setLastAutoUpdatePreviewDelay:](self, "setLastAutoUpdatePreviewDelay:", v11);
      -[TVHPreviewingListViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_delayedAutoUpdatePreviewViewController",  0LL,  v11);
    }

    id v7 = v13;
  }
}

- (BOOL)listViewCell:(id)a3 shouldAppearSelectedForPreviouslyFocusedView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHPreviewingListViewController _updatesListViewCellSelectedAppearance]( self,  "_updatesListViewCellSelectedAppearance"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 previewView]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 listView]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 focusedView]);

    unsigned __int8 v13 = [v12 isDescendantOfView:v9];
    unsigned __int8 v14 = [v12 isDescendantOfView:v10];
    unsigned __int8 v15 = [v7 isDescendantOfView:v10];
    unsigned __int8 v16 = [v7 isDescendantOfView:v9];
    if (v6 == v7) {
      unsigned __int8 v17 = v13;
    }
    else {
      unsigned __int8 v17 = 0;
    }
    char v18 = v17 | (v15 | v16) & ((v13 | v14) ^ 1);
  }

  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
}

- (void)_handleApplicationDidFinishSuspensionSnapshotNotification:(id)a3
{
}

- (BOOL)_shouldHideListViewBackdrop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController _previewManager](self, "_previewManager"));
  if ((objc_opt_respondsToSelector(v2, "shouldHideListViewBackdropView") & 1) != 0) {
    unsigned __int8 v3 = [v2 shouldHideListViewBackdropView];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (void)_registerForListViewBackdropHiddenStateUpdates
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController _previewManager](self, "_previewManager"));
  if ((objc_opt_respondsToSelector(v3, "setListViewBackdropViewHiddenStateNeedsUpdatingBlock:") & 1) != 0)
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10007ED20;
    v4[3] = &unk_1000FCEF8;
    objc_copyWeak(&v5, &location);
    [v3 setListViewBackdropViewHiddenStateNeedsUpdatingBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_unregisterForListViewBackdropHideStateUpdates
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController _previewManager](self, "_previewManager"));
  if ((objc_opt_respondsToSelector(v2, "setListViewBackdropViewHiddenStateNeedsUpdatingBlock:") & 1) != 0) {
    [v2 setListViewBackdropViewHiddenStateNeedsUpdatingBlock:0];
  }
}

- (id)_previewManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewViewController](self, "previewViewController"));
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (BOOL)_updatesListViewCellSelectedAppearance
{
  BOOL v3 = -[TVHPreviewingListViewController updatesListViewCellSelectedAppearance]( self,  "updatesListViewCellSelectedAppearance");
  if (v3) {
    LOBYTE(v3) = -[TVHPreviewingListViewController _isAutoUpdatingPreviewViewControllerEnabled]( self,  "_isAutoUpdatingPreviewViewControllerEnabled");
  }
  return v3;
}

- (BOOL)_isAutoUpdatingPreviewViewControllerEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_cancelAutoUpdatingPreviewViewController
{
}

- (void)_resetAutoUpdatePreviewViewControllerState
{
}

- (void)_cancelDelayedAutoUpdateOfPreviewViewController
{
}

- (void)_delayedAutoUpdatePreviewViewController
{
  if (-[TVHPreviewingListViewController _isAutoUpdatingPreviewViewControllerEnabled]( self,  "_isAutoUpdatingPreviewViewControllerEnabled"))
  {
    -[TVHPreviewingListViewController setLastAutoUpdatePreviewDelay:](self, "setLastAutoUpdatePreviewDelay:", 0.0);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController pendingAutoUpdatePreviewIndexPath]( self,  "pendingAutoUpdatePreviewIndexPath"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController lastAutoUpdatePreviewIndexPath]( self,  "lastAutoUpdatePreviewIndexPath"));
    if (v3 && ([v3 isEqual:v4] & 1) == 0)
    {
      -[TVHPreviewingListViewController setLastAutoUpdatePreviewIndexPath:]( self,  "setLastAutoUpdatePreviewIndexPath:",  v3);
      id v5 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[TVHPreviewingListViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewViewController](self, "previewViewController"));
      uint64_t v7 = ((uint64_t (**)(void, void *, void *, void *))v5)[2](v5, v3, v4, v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (v8) {
        -[TVHPreviewingListViewController setPreviewViewController:](self, "setPreviewViewController:", v8);
      }
    }
  }

  -[TVHPreviewingListViewController setPendingAutoUpdatePreviewIndexPath:]( self,  "setPendingAutoUpdatePreviewIndexPath:",  0LL);
}

- (BOOL)_listViewBackdropCanBeShown
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
  BOOL v3 = [v2 listViewBackdropStyle] != 0;

  return v3;
}

- (unint64_t)_listViewBackdropStyleForCurrentSize
{
  if (-[TVHPreviewingListViewController listViewBackdropSize](self, "listViewBackdropSize")) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (void)_updateListViewBackdropAfterSettingPreviewViewIfNecessary
{
  if ((id)-[TVHPreviewingListViewController listViewBackdropMode](self, "listViewBackdropMode") == (id)2)
  {
    BOOL v3 = -[TVHPreviewingListViewController _shouldHideListViewBackdrop](self, "_shouldHideListViewBackdrop");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
    [v4 setListViewBackdropHidden:v3 animated:1];
  }

- (void)_updateListViewBackdropBeforeSettingPreviewViewIfNecessary
{
  if ((id)-[TVHPreviewingListViewController listViewBackdropMode](self, "listViewBackdropMode") == (id)2)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
    unsigned int v4 = [v3 isListViewBackdropHidden];

    unsigned __int8 v5 = -[TVHPreviewingListViewController _shouldHideListViewBackdrop](self, "_shouldHideListViewBackdrop");
    if (v4)
    {
      if ((v5 & 1) == 0)
      {
        id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewingListView](self, "previewingListView"));
        [v6 setListViewBackdropHidden:0 animated:1];
      }
    }
  }

- (void)_setPreviewPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewView](self, "previewView"));
}

- (BOOL)listViewRespectSafeAreaInsets
{
  return self->_listViewRespectSafeAreaInsets;
}

- (void)setListViewRespectSafeAreaInsets:(BOOL)a3
{
  self->_listViewRespectSafeAreaInsets = a3;
}

- (BOOL)updatesListViewCellSelectedAppearance
{
  return self->_updatesListViewCellSelectedAppearance;
}

- (void)setUpdatesListViewCellSelectedAppearance:(BOOL)a3
{
  self->_updatesListViewCellSelectedAppearance = a3;
}

- (unint64_t)listViewBackdropMode
{
  return self->_listViewBackdropMode;
}

- (unint64_t)listViewBackdropSize
{
  return self->_listViewBackdropSize;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (id)autoUpdatePreviewViewControllerBlock
{
  return self->_autoUpdatePreviewViewControllerBlock;
}

- (TVHPreviewingListView)previewingListView
{
  return self->_previewingListView;
}

- (BOOL)performedInitalPreviewViewControllerAutoUpdate
{
  return self->_performedInitalPreviewViewControllerAutoUpdate;
}

- (void)setPerformedInitalPreviewViewControllerAutoUpdate:(BOOL)a3
{
  self->_performedInitalPreviewViewControllerAutoUpdate = a3;
}

- (NSIndexPath)lastAutoUpdatePreviewIndexPath
{
  return self->_lastAutoUpdatePreviewIndexPath;
}

- (void)setLastAutoUpdatePreviewIndexPath:(id)a3
{
}

- (NSIndexPath)pendingAutoUpdatePreviewIndexPath
{
  return self->_pendingAutoUpdatePreviewIndexPath;
}

- (void)setPendingAutoUpdatePreviewIndexPath:(id)a3
{
}

- (double)lastAutoUpdatePreviewDelay
{
  return self->_lastAutoUpdatePreviewDelay;
}

- (void)setLastAutoUpdatePreviewDelay:(double)a3
{
  self->_lastAutoUpdatePreviewDelay = a3;
}

- (void).cxx_destruct
{
}

@end