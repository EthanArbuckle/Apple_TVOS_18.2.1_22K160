@interface MTTVEpisodeListViewController
+ (Class)episodeCellClass;
+ (double)episodeCellHeight;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldShowNowPlayingGlyphWhenPaused;
- (BOOL)showFooterView;
- (BOOL)showsArtworkInCells;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (CGRect)tableViewFrame;
- (CGSize)cachedExpandedRowSize;
- (MTTVEpisodeActionController)actionController;
- (MTTVEpisodeListViewController)initWithCompositeFetchedResultsController:(id)a3;
- (MTTVEpisodeListViewControllerDelegate)delegate;
- (NSIndexPath)lastFocusedIndexPath;
- (NSIndexPath)selectedIndexPath;
- (NSString)expandedEpisodeUuid;
- (NSString)playingUuid;
- (UIEdgeInsets)_layoutMargins;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITabBarController)tabBarController;
- (UITapGestureRecognizer)playButtonRecognizer;
- (double)cachedFixedRowHeight;
- (double)tableView:(id)a3 headerSizeForIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)footerView;
- (id)indexPathForEpisodeUuid:(id)a3;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)rightButtonItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)cellStyle;
- (unint64_t)explicitTreatment;
- (unint64_t)sectionTypeForIndexPath:(id)a3;
- (void)_updateNowPlayingState;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)fixSectionHeaderInsetsIfNeeded;
- (void)longPressAction:(id)a3;
- (void)nowPlayingStateChanged:(id)a3;
- (void)playEpisodeAtIndexPath:(id)a3;
- (void)playEpisodeWithUUID:(id)a3;
- (void)playPauseButtonAction:(id)a3;
- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4;
- (void)registerForArtworkChangeNotifications:(id)a3;
- (void)scrollToLatestIfNeeded:(BOOL)a3;
- (void)selectedItemAtIndexPath:(id)a3;
- (void)setActionController:(id)a3;
- (void)setCachedExpandedRowSize:(CGSize)a3;
- (void)setCachedFixedRowHeight:(double)a3;
- (void)setCellStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedEpisodeUuid:(id)a3;
- (void)setExplicitTreatment:(unint64_t)a3;
- (void)setLastFocusedIndexPath:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setPlayButtonRecognizer:(id)a3;
- (void)setPlayingUuid:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setShowFooterView:(BOOL)a3;
- (void)setShowsArtworkInCells:(BOOL)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)unregisterForArtworkChangeNotifications:(id)a3;
- (void)updateIfNeededLayoutMarginsForViewWidth:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTTVEpisodeListViewController

+ (Class)episodeCellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MTTVEpisodeGenericCell, a2);
}

+ (double)episodeCellHeight
{
  if ((objc_opt_respondsToSelector([a1 episodeCellClass], "height") & 1) == 0) {
    return 100.0;
  }
  objc_msgSend(objc_msgSend(a1, "episodeCellClass"), "height");
  return result;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVListViewController viewDidLoad](&v16, "viewDidLoad");
  self->_needsScrollAdjust = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
  -[MTTVEpisodeListViewController setExplicitTreatment:]( self,  "setExplicitTreatment:",  [v3 explicitContentBadgeTreatment]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController view](self, "view"));
  [v5 setBackgroundColor:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v6 setShowsHorizontalScrollIndicator:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v7 setShowsVerticalScrollIndicator:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v8 setRemembersLastFocusedIndexPath:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVEpisodeListViewController setPlayButtonRecognizer:](self, "setPlayButtonRecognizer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController playButtonRecognizer](self, "playButtonRecognizer"));
  [v10 addGestureRecognizer:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UILongPressGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UILongPressGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "longPressAction:",  4LL));
  -[MTTVEpisodeListViewController setLongPressRecognizer:](self, "setLongPressRecognizer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController longPressRecognizer](self, "longPressRecognizer"));
  [v13 addGestureRecognizer:v14];

  v15 = -[IMActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVEpisodeActionController),  "initWithDelegate:",  self);
  -[MTTVEpisodeListViewController setActionController:](self, "setActionController:", v15);

  -[MTTVEpisodeListViewController _updateNowPlayingState](self, "_updateNowPlayingState");
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVEpisodeListViewController viewWillLayoutSubviews](&v15, "viewWillLayoutSubviews");
  -[MTTVEpisodeListViewController tableViewFrame](self, "tableViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v11 frame];
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  BOOL v12 = CGRectEqualToRect(v16, v17);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setLayoutMargins:", 0.0, 0.0, 0.0, 54.0);
}

- (CGRect)tableViewFrame
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 superview]);
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5 + 112.0;
  double v13 = v7 + 0.0;
  double v14 = v9 + -178.0;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)playPauseButtonAction:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if (![v9 isTargetPlaying])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    if (v5)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController objectAtIndexPath:](self, "objectAtIndexPath:", v5));
      if (v6)
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTEpisode);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          -[MTTVEpisodeListViewController playEpisodeAtIndexPath:](self, "playEpisodeAtIndexPath:", v5);
LABEL_10:

          goto LABEL_11;
        }
      }
    }

    else
    {
      double v6 = 0LL;
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue([v9 currentItem]);

    if (v8) {
      [v9 playWithReason:3];
    }
    goto LABEL_10;
  }

  [v9 pausePlayerTarget];
LABEL_11:
}

- (void)longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController objectAtIndexPath:](self, "objectAtIndexPath:", v12));
    if (v5)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTEpisode);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
        double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cellForRowAtIndexPath:v12]);

        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController actionController](self, "actionController"));
        [v9 setActionObject:v5];

        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController actionController](self, "actionController"));
        id v11 = [v10 presentAvailableActionsFromView:v8];
      }
    }
  }

- (void)selectedItemAtIndexPath:(id)a3
{
  id v5 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v4 deselectRowAtIndexPath:v5 animated:0];

  -[MTTVEpisodeListViewController playEpisodeAtIndexPath:](self, "playEpisodeAtIndexPath:", v5);
}

- (id)rightButtonItems
{
  return 0LL;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend( objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "episodeCellClass")),  "initWithStyle:reuseIdentifier:",  0,  v4);

  id v6 = [(id)objc_opt_class(self) episodeCellClass];
  objc_opt_isKindOfClass(v5, v6);
  return v5;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [v8 setEpisode:v7];
  objc_msgSend( v8,  "setExplicitTreatment:",  -[MTTVEpisodeListViewController explicitTreatment](self, "explicitTreatment"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 uuid]);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController playingUuid](self, "playingUuid"));
  [v8 setCurrentPlayerItem:v10 == v9];
}

- (void)setSelectedIndexPath:(id)a3
{
  id v10 = a3;
  p_selectedIndexPath = &self->_selectedIndexPath;
  if (self->_selectedIndexPath)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cellForRowAtIndexPath:*p_selectedIndexPath]);

    [v7 setSelected:0];
  }

  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
  if (*p_selectedIndexPath)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cellForRowAtIndexPath:*p_selectedIndexPath]);

    [v9 setSelected:1];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = (void *)objc_opt_class(self, a2);
  _[v4 episodeCellHeight];
  return result;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedIndexPath]);
  if (v9)
  {
  }

  else
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v7 previouslyFocusedIndexPath]);

    if (v14)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedView]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVMTExpandingTextView);
      char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v7 previouslyFocusedIndexPath]);
        if (v18)
        {
          v20 = _NSConcreteStackBlock;
          uint64_t v21 = 3221225472LL;
          v22 = sub_100061AAC;
          v23 = &unk_100240240;
          v24 = self;
          id v25 = v18;
          id v12 = v18;
          [v8 addCoordinatedAnimations:&v20 completion:0];

          goto LABEL_5;
        }
      }
    }
  }

  -[MTTVEpisodeListViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector( WeakRetained,  "detailListController:didUpdateFocusInContext:withAnimationCoordinator:");

  if ((v11 & 1) == 0) {
    goto LABEL_6;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 detailListController:self didUpdateFocusInContext:v7 withAnimationCoordinator:v8];
LABEL_5:

LABEL_6:
  double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedIndexPath", v20, v21, v22, v23, v24));
  if (v13)
  {
    -[MTTVEpisodeListViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v13);
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
    -[MTTVEpisodeListViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v19);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MTEpisodeCellProtocol])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTVisitedEpisodeManager sharedInstance](&OBJC_CLASS___MTVisitedEpisodeManager, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 episode]);
    [v6 startVisitingEpisode:v7];
  }

  -[MTTVEpisodeListViewController registerForArtworkChangeNotifications:]( self,  "registerForArtworkChangeNotifications:",  v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathForClosestFocusableRowToIndexPath:v6]);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)registerForArtworkChangeNotifications:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "artworkDidChange:") & 1) != 0)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v4 selector:"artworkDidChange:" name:kMTImageDownloaderArtworkDidLoadNotification object:0];
  }
}

- (void)unregisterForArtworkChangeNotifications:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:v3 name:kMTImageDownloaderArtworkDidLoadNotification object:0];
}

- (MTTVEpisodeListViewController)initWithCompositeFetchedResultsController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  id v3 = -[MTTVListViewController initWithCompositeFetchedResultsController:]( &v8,  "initWithCompositeFetchedResultsController:",  a3);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v3 selector:"nowPlayingItemChanged:" name:@"TVMusicPlayerMediaItemDidChangeNotification" object:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v3 selector:"nowPlayingStateChanged:" name:@"TVMusicPlayerStateDidChangeNotification" object:0];
  }

  return v3;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVFetchedTableWithSectionsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVEpisodeListViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (self->_viewSizeChangedWhileNotVisible)
  {
    -[MTTVEpisodeListViewController set_layoutMargins:]( self,  "set_layoutMargins:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    self->_needsToFixUpHeaderInsets = 1;
    self->_viewSizeChangedWhileNotVisible = 0;
  }

  if ((-[MTTVEpisodeListViewController isHorizontallyCompact](self, "isHorizontallyCompact") & 1) == 0)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForSelectedRow]);
    [v4 deselectRowAtIndexPath:v6 animated:1];
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVEpisodeListViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTVisitedEpisodeManager sharedInstance](&OBJC_CLASS___MTVisitedEpisodeManager, "sharedInstance"));
  [v3 flushVisitedEpisodes];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVEpisodeListViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTVisitedEpisodeManager sharedInstance](&OBJC_CLASS___MTVisitedEpisodeManager, "sharedInstance"));
  [v3 flushVisitedEpisodes];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v10 = a4;
  -[MTTVEpisodeListViewController set_layoutMargins:]( self,  "set_layoutMargins:",  UIEdgeInsetsZero.top,  left,  bottom,  right);
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController view](self, "view"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);

  if (!v12) {
    self->_viewSizeChangedWhileNotVisible = 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVListViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v14,  "viewWillTransitionToSize:withTransitionCoordinator:",  v10,  width,  height);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006209C;
  v13[3] = &unk_100241C60;
  v13[4] = self;
  [v10 animateAlongsideTransition:v13 completion:&stru_1002422F8];
}

- (void)playEpisodeWithUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController indexPathForEpisodeUuid:](self, "indexPathForEpisodeUuid:", a3));
  -[MTTVEpisodeListViewController playEpisodeAtIndexPath:](self, "playEpisodeAtIndexPath:", v4);
}

- (void)fixSectionHeaderInsetsIfNeeded
{
  if (self->_needsToFixUpHeaderInsets)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView", 0LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subviews]);

    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___UITableViewHeaderFooterView);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
            [v9 setNeedsLayout];
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    self->_needsToFixUpHeaderInsets = 0;
  }

- (BOOL)shouldShowNowPlayingGlyphWhenPaused
{
  return 1;
}

- (void)_updateNowPlayingState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  if ([v3 isTargetPlaying])
  {

LABEL_4:
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playingEpisodeUuid]);

    goto LABEL_6;
  }

  unsigned __int8 v4 = -[MTTVEpisodeListViewController shouldShowNowPlayingGlyphWhenPaused](self, "shouldShowNowPlayingGlyphWhenPaused");

  if ((v4 & 1) != 0) {
    goto LABEL_4;
  }
  id v6 = 0LL;
LABEL_6:
  -[MTTVEpisodeListViewController setPlayingUuid:](self, "setPlayingUuid:", v6);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView", 0LL));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 visibleCells]);

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v13 conformsToProtocol:&OBJC_PROTOCOL___MTEpisodeCellProtocol])
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 episode]);
          double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);

          objc_msgSend(v13, "setCurrentPlayerItem:", objc_msgSend(v6, "isEqualToString:", v15));
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062498;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)nowPlayingStateChanged:(id)a3
{
  if (!-[MTTVEpisodeListViewController shouldShowNowPlayingGlyphWhenPaused]( self,  "shouldShowNowPlayingGlyphWhenPaused",  a3)) {
    -[MTTVEpisodeListViewController _updateNowPlayingState](self, "_updateNowPlayingState");
  }
}

- (id)indexPathForEpisodeUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

  if ([v4 length]
    && (uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 episodeForUuid:v4])) != 0)
  {
    objc_super v8 = (void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController indexPathForObject:](self, "indexPathForObject:", v7));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (unint64_t)sectionTypeForIndexPath:(id)a3
{
  return 0LL;
}

- (void)setShowsArtworkInCells:(BOOL)a3
{
  if (self->_showsArtworkInCells != a3) {
    self->_showsArtworkInCells = a3;
  }
}

- (id)footerView
{
  if (self->_showFooterView)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
    v2 = -[MTTVListViewController footerView](&v5, "footerView");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (void)setShowFooterView:(BOOL)a3
{
  self->_showFooterView = a3;
  if (a3)
  {
    id v4 = (UIView *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    objc_super v5 = (UIView *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController footerView](self, "footerView"));
    id v6 = v4;
    uint64_t v7 = v5;
  }

  else
  {
    objc_super v8 = objc_alloc(&OBJC_CLASS___UIView);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    [v9 bounds];
    id v4 = -[UIView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v11), 0.0);

    id v6 = (UIView *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
    objc_super v5 = v6;
    uint64_t v7 = v4;
  }

  -[UIView setTableFooterView:](v6, "setTableFooterView:", v7);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
  [v10 setNeedsLayout];
}

- (id)objectAtIndexPath:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  id v3 = -[MTTVFetchedTableWithSectionsViewController objectAtIndexPath:](&v5, "objectAtIndexPath:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVFetchedTableWithSectionsViewController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:]( &v7,  "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:",  a3,  a4,  a5,  a6,  a7);
}

- (void)controllerDidChangeContent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVListViewController controllerDidChangeContent:](&v3, "controllerDidChangeContent:", a3);
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVListViewController transitionToState:animated:](&v9, "transitionToState:animated:", a3, a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController delegate](self, "delegate"));
  char v7 = objc_opt_respondsToSelector(v6, "detailListController:didTransitionToState:");

  if ((v7 & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController delegate](self, "delegate"));
    [v8 detailListController:self didTransitionToState:a3];
  }

- (void)playEpisodeAtIndexPath:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"Subclasses must override playEpisodeAtIndexPath:",  0LL));
  objc_exception_throw(v4);
  -[MTTVEpisodeListViewController tableView:cellForRowAtIndexPath:](v5, v6, v7, v8);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController reuseIdentifierForRow:](self, "reuseIdentifierForRow:", v6));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v8]);

  if (!v9) {
    id v9 = -[MTTVEpisodeListViewController newCellInstanceWithReuseIdentifier:]( self,  "newCellInstanceWithReuseIdentifier:",  v8);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  -[MTTVEpisodeListViewController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v9,  v10,  v6);

  return v9;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return @"MTTVEpisodeGenericCell";
}

- (double)tableView:(id)a3 headerSizeForIndexPath:(id)a4
{
  return 0.0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (+[MTEpisodeLockup useSelfSizingCells](&OBJC_CLASS___MTEpisodeLockup, "useSelfSizingCells")) {
    BOOL v5 = "tableView:heightForRowAtIndexPath:" == a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  return -[MTTVEpisodeListViewController respondsToSelector:](&v7, "respondsToSelector:", a3);
}

- (UITabBarController)tabBarController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  v2 = -[MTTVEpisodeListViewController tabBarController](&v4, "tabBarController");
  return (UITabBarController *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodeListViewController;
  -[MTTVListViewController refetchWithSortDescriptors:animated:](&v6, "refetchWithSortDescriptors:animated:", a3);
  self->_needsScrollAdjust = 1;
  -[MTTVEpisodeListViewController scrollToLatestIfNeeded:](self, "scrollToLatestIfNeeded:", v4);
}

- (void)scrollToLatestIfNeeded:(BOOL)a3
{
  if (self->_needsScrollAdjust)
  {
    BOOL v3 = a3;
    self->_needsScrollAdjust = 0;
    id v39 = (id)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeListViewController indexPathForEpisodeUuid:]( self,  "indexPathForEpisodeUuid:",  self->_playingUuid));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeListViewController indexPathForEpisodeUuid:]( self,  "indexPathForEpisodeUuid:",  self->_expandedEpisodeUuid));
    if (v39)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
      objc_super v7 = v6;
      id v8 = v39;
    }

    else
    {
      if (!v5)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortDescriptors]);
        CGRect v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
        unsigned int v12 = [v11 ascending];

        if (v12)
        {
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);

          if (v7)
          {
            double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController indexPathForObject:]( self,  "indexPathForObject:",  v7));
            [v15 rectForRowAtIndexPath:v16];
            CGFloat x = v17;
            CGFloat y = v19;
            CGFloat width = v21;
            CGFloat height = v23;
          }

          else
          {
            CGFloat x = CGRectZero.origin.x;
            CGFloat y = CGRectZero.origin.y;
            CGFloat width = CGRectZero.size.width;
            CGFloat height = CGRectZero.size.height;
          }

          unsigned int v25 = -[MTTVEpisodeListViewController isHorizontallyCompact](self, "isHorizontallyCompact");
          v40.origin.CGFloat x = x;
          v40.origin.CGFloat y = y;
          v40.size.CGFloat width = width;
          v40.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
          [v27 bounds];
          double v29 = v28;

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
          [v30 contentSize];
          double v32 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
          [v33 bounds];
          double v35 = v34;

          double v36 = 0.0;
          if (v32 >= v35)
          {
            double v37 = 44.0;
            if (!v25) {
              double v37 = 0.0;
            }
            double v36 = MaxY - (v29 - v37);
            if (v36 < 0.0) {
              double v36 = 0.0;
            }
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
          objc_msgSend(v38, "scrollRectToVisible:animated:", v3, 0.0, v36, 0.0, 0.0);
        }

        else
        {
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
          objc_msgSend( v7,  "scrollRectToVisible:animated:",  1,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
        }

        goto LABEL_8;
      }

      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController tableView](self, "tableView"));
      objc_super v7 = v6;
      id v8 = v5;
    }

    [v6 scrollToRowAtIndexPath:v8 atScrollPosition:1 animated:v3];
LABEL_8:
  }

- (UIEdgeInsets)_layoutMargins
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController view](self, "view"));
  [v3 bounds];
  -[MTTVEpisodeListViewController updateIfNeededLayoutMarginsForViewWidth:]( self,  "updateIfNeededLayoutMarginsForViewWidth:",  v4);

  double top = self->__layoutMargins.top;
  double left = self->__layoutMargins.left;
  double bottom = self->__layoutMargins.bottom;
  double right = self->__layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)updateIfNeededLayoutMarginsForViewWidth:(double)a3
{
  p_layoutMargins = &self->__layoutMargins;
  if ((vminv_u16((uint16x4_t)vcltz_s16( vshl_n_s16( vmovn_s32( vuzp1q_s32( (int32x4_t)vceqq_f64( *(float64x2_t *)&self->__layoutMargins.top,  *(float64x2_t *)&UIEdgeInsetsZero.top),  (int32x4_t)vceqq_f64( *(float64x2_t *)&self->__layoutMargins.bottom,  *(float64x2_t *)&UIEdgeInsetsZero.bottom))),  0xFuLL))) & 1) != 0)
  {
    +[MTEpisodeLockup maximumContentWidthForStyle:]( &OBJC_CLASS___MTEpisodeLockup,  "maximumContentWidthForStyle:",  +[MTEpisodeLockup styleForWidth:showsArtwork:]( &OBJC_CLASS___MTEpisodeLockup,  "styleForWidth:showsArtwork:",  -[MTTVEpisodeListViewController showsArtworkInCells](self, "showsArtworkInCells"),  a3));
    double v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController view](self, "view"));
    objc_msgSend(v8, "mt_layoutMargins");
    CGFloat v10 = v9;
    double v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;

    if (a3 - v12 - v16 > v7)
    {
      double v12 = IMRoundToPixel((a3 - v7) * 0.5);
      double v16 = v12;
    }

    p_layoutMargins->double top = v10;
    p_layoutMargins->double left = v12;
    p_layoutMargins->double bottom = v14;
    p_layoutMargins->double right = v16;
  }

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (NSIndexPath)lastFocusedIndexPath
{
  return self->_lastFocusedIndexPath;
}

- (void)setLastFocusedIndexPath:(id)a3
{
}

- (MTTVEpisodeListViewControllerDelegate)delegate
{
  return (MTTVEpisodeListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (unint64_t)explicitTreatment
{
  return self->_explicitTreatment;
}

- (void)setExplicitTreatment:(unint64_t)a3
{
  self->_explicitTreatment = a3;
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (void)setPlayButtonRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (CGSize)cachedExpandedRowSize
{
  double width = self->_cachedExpandedRowSize.width;
  double height = self->_cachedExpandedRowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedExpandedRowSize:(CGSize)a3
{
  self->_cachedExpandedRowSize = a3;
}

- (double)cachedFixedRowHeight
{
  return self->_cachedFixedRowHeight;
}

- (void)setCachedFixedRowHeight:(double)a3
{
  self->_cachedFixedRowHeight = a3;
}

- (BOOL)showsArtworkInCells
{
  return self->_showsArtworkInCells;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(unint64_t)a3
{
  self->_cellStyle = a3;
}

- (BOOL)showFooterView
{
  return self->_showFooterView;
}

- (NSString)playingUuid
{
  return self->_playingUuid;
}

- (void)setPlayingUuid:(id)a3
{
}

- (NSString)expandedEpisodeUuid
{
  return self->_expandedEpisodeUuid;
}

- (void)setExpandedEpisodeUuid:(id)a3
{
}

- (MTTVEpisodeActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end