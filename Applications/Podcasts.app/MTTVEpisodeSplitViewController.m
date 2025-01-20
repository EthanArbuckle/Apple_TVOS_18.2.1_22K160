@interface MTTVEpisodeSplitViewController
- (BOOL)_isShowingDetailViewController;
- (BOOL)_isShowingEpisodeDetails;
- (MTTVContentUnavailableViewController)emptyContentViewController;
- (MTTVEpisodeSplitViewController)init;
- (MTTVListViewControllerProtocol)episodeList;
- (NSTimer)fastScrollTimer;
- (UINavigationController)leftNavController;
- (UINavigationController)rightNavController;
- (UIViewController)placeholderDetailViewController;
- (id)preferredFocusedView;
- (int64_t)listState;
- (void)_dismissDetailsForCurrentItemAnimated:(BOOL)a3;
- (void)_dismissDetailsForCurrentItemIfNeededAnimated:(BOOL)a3;
- (void)_masterListFocusChangeDidBecomeIdle;
- (void)_masterListFocusDidChange;
- (void)_showDetailViewController:(id)a3 animated:(BOOL)a4;
- (void)_showDetailsForEpisode:(id)a3 animated:(BOOL)a4;
- (void)_showDetailsForFirstItemAnimated:(BOOL)a3;
- (void)_showDetailsForFirstItemIfNeededAnimated:(BOOL)a3;
- (void)_showDetailsForFocusUpdateInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_showDetailsForFocusedItemAnimated:(BOOL)a3;
- (void)_showDetailsForIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_showDetailsForPlaceholderAnimated:(BOOL)a3;
- (void)_showDetailsForPlaceholderIfNeededAnimated:(BOOL)a3;
- (void)detailListController:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)detailListController:(id)a3 didTransitionToState:(int64_t)a4;
- (void)detailListController:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)episodeDetailViewController:(id)a3 playEpisode:(id)a4;
- (void)setEmptyContentViewController:(id)a3;
- (void)setEpisodeList:(id)a3;
- (void)setFastScrollTimer:(id)a3;
- (void)setLeftNavController:(id)a3;
- (void)setListState:(int64_t)a3;
- (void)setPlaceholderDetailViewController:(id)a3;
- (void)setRightNavController:(id)a3;
- (void)standupEmptyContentViewController;
- (void)tearDownEmptyContentViewController;
- (void)updateEmptyView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTTVEpisodeSplitViewController

- (MTTVEpisodeSplitViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  result = -[MTTVEpisodeSplitViewController init](&v3, "init");
  if (result) {
    result->_listState = MTListStateUnknown;
  }
  return result;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  -[MTTVEpisodeSplitViewController viewDidLoad](&v13, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;

  double v6 = v5 + -64.0 - 640.0 + -64.0;
  -[MTTVEpisodeSplitViewController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:", v6);
  -[MTTVEpisodeSplitViewController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
  [v7 setBackgroundColor:0];

  v8 = objc_opt_new(&OBJC_CLASS___UINavigationController);
  -[MTTVEpisodeSplitViewController setLeftNavController:](self, "setLeftNavController:", v8);

  v9 = objc_opt_new(&OBJC_CLASS___UINavigationController);
  -[MTTVEpisodeSplitViewController setRightNavController:](self, "setRightNavController:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController leftNavController](self, "leftNavController"));
  v14[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  -[MTTVEpisodeSplitViewController setViewControllers:](self, "setViewControllers:", v12);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  -[MTTVEpisodeSplitViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[MTTVEpisodeSplitViewController _showDetailsForPlaceholderIfNeededAnimated:]( self,  "_showDetailsForPlaceholderIfNeededAnimated:",  0LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "mt_hideNavigationBarOnFirstScreen");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  id v7 = a4;
  -[MTTVEpisodeSplitViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004C774;
  v8[3] = &unk_100241C60;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  id v6 = a4;
  -[MTTVEpisodeSplitViewController willTransitionToTraitCollection:withTransitionCoordinator:]( &v8,  "willTransitionToTraitCollection:withTransitionCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004C820;
  v7[3] = &unk_100241C60;
  v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

- (id)preferredFocusedView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));

  if (v5 == v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController masterViewController](self, "masterViewController"));
  }
  objc_super v8 = v7;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredFocusedView]);

  return v9;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTTVEpisodeSplitViewController;
  -[MTTVEpisodeSplitViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v18,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 selectedIndexPath]);
  if (!v9) {
    goto LABEL_4;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___UITableViewCell);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___UITableViewCell);
  char isKindOfClass = objc_opt_isKindOfClass(v13, v14);

  if ((isKindOfClass & 1) == 0)
  {
    if (v7)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10004CA4C;
      v17[3] = &unk_10023FF98;
      v17[4] = self;
      [v7 addCoordinatedAnimationsForAnimation:1 animations:v17 completion:0];
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
      [v16 setSelectedIndexPath:0];
    }
  }

- (void)setEpisodeList:(id)a3
{
  double v4 = (MTTVListViewControllerProtocol *)a3;
  episodeList = self->_episodeList;
  if (episodeList) {
    -[MTTVListViewControllerProtocol setDelegate:](episodeList, "setDelegate:", 0LL);
  }
  id v6 = self->_episodeList;
  self->_episodeList = v4;
  id v7 = v4;

  -[MTTVListViewControllerProtocol setDelegate:](v7, "setDelegate:", self);
  v10 = v7;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController leftNavController](self, "leftNavController"));
  [v9 setViewControllers:v8];
}

- (void)_showDetailsForFocusUpdateInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController fastScrollTimer](self, "fastScrollTimer"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController fastScrollTimer](self, "fastScrollTimer"));
    [v7 invalidate];

    -[MTTVEpisodeSplitViewController setFastScrollTimer:](self, "setFastScrollTimer:", 0LL);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004CC10;
  v8[3] = &unk_10023FF98;
  v8[4] = self;
  [v5 addCoordinatedAnimations:0 completion:v8];
}

- (void)_masterListFocusDidChange
{
}

- (void)_masterListFocusChangeDidBecomeIdle
{
}

- (void)_showDetailsForFocusedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tableView]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_indexPathForFocusedCell"));

  -[MTTVEpisodeSplitViewController _showDetailsForIndexPath:animated:]( self,  "_showDetailsForIndexPath:animated:",  v7,  v3);
}

- (void)_showDetailsForIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v9
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexPath:v9]),
        v6,
        v7))
  {
    -[MTTVEpisodeSplitViewController _showDetailsForEpisode:animated:](self, "_showDetailsForEpisode:animated:", v7, v4);
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeSplitViewController placeholderDetailViewController]( self,  "placeholderDetailViewController"));

    if (v8) {
      -[MTTVEpisodeSplitViewController _dismissDetailsForCurrentItemAnimated:]( self,  "_dismissDetailsForCurrentItemAnimated:",  v4);
    }
  }
}

- (void)_showDetailsForEpisode:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = -[MTTVEpisodeDetailViewController initWithEpisode:]( objc_alloc(&OBJC_CLASS___MTTVEpisodeDetailViewController),  "initWithEpisode:",  v6);

  -[MTTVEpisodeDetailViewController setDelegate:](v7, "setDelegate:", self);
  -[MTTVEpisodeSplitViewController _showDetailViewController:animated:]( self,  "_showDetailViewController:animated:",  v7,  v4);
}

- (void)_showDetailsForFirstItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tableView]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 indexPathForFirstFocusableRow]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexPath:v9]);

  if (v8) {
    -[MTTVEpisodeSplitViewController _showDetailsForEpisode:animated:](self, "_showDetailsForEpisode:animated:", v8, v3);
  }
}

- (void)_showDetailsForFirstItemIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MTTVEpisodeSplitViewController _isShowingEpisodeDetails](self, "_isShowingEpisodeDetails"))
  {
    -[MTTVEpisodeSplitViewController _showDetailsForFirstItemAnimated:](self, "_showDetailsForFirstItemAnimated:", v3);
    -[MTTVEpisodeSplitViewController _showDetailsForPlaceholderIfNeededAnimated:]( self,  "_showDetailsForPlaceholderIfNeededAnimated:",  v3);
  }

- (void)_dismissDetailsForCurrentItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeSplitViewController placeholderDetailViewController]( self,  "placeholderDetailViewController"));

  if (v5) {
    -[MTTVEpisodeSplitViewController _showDetailsForPlaceholderAnimated:]( self,  "_showDetailsForPlaceholderAnimated:",  v3);
  }
  else {
    -[MTTVEpisodeSplitViewController _showDetailViewController:animated:]( self,  "_showDetailViewController:animated:",  0LL,  v3);
  }
}

- (void)_dismissDetailsForCurrentItemIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTTVEpisodeSplitViewController _isShowingDetailViewController](self, "_isShowingDetailViewController")) {
    -[MTTVEpisodeSplitViewController _dismissDetailsForCurrentItemAnimated:]( self,  "_dismissDetailsForCurrentItemAnimated:",  v3);
  }
}

- (BOOL)_isShowingEpisodeDetails
{
  if (-[MTTVEpisodeSplitViewController _isShowingDetailViewController](self, "_isShowingDetailViewController"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeSplitViewController placeholderDetailViewController]( self,  "placeholderDetailViewController"));
    unsigned int v6 = [v4 containsObject:v5] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_isShowingDetailViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewControllers]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_showDetailsForPlaceholderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeSplitViewController placeholderDetailViewController]( self,  "placeholderDetailViewController"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeSplitViewController placeholderDetailViewController]( self,  "placeholderDetailViewController"));
    -[MTTVEpisodeSplitViewController _showDetailViewController:animated:]( self,  "_showDetailViewController:animated:",  v6,  v3);
  }

  else
  {
    -[MTTVEpisodeSplitViewController _showDetailsForFirstItemAnimated:](self, "_showDetailsForFirstItemAnimated:", v3);
  }

- (void)_showDetailsForPlaceholderIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MTTVEpisodeSplitViewController _isShowingDetailViewController](self, "_isShowingDetailViewController")) {
    -[MTTVEpisodeSplitViewController _showDetailsForPlaceholderAnimated:]( self,  "_showDetailsForPlaceholderAnimated:",  v3);
  }
}

- (void)_showDetailViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 animationKeys]);
  unsigned int v11 = [v10 containsObject:@"fadeTransitionAnimationKey"];

  if (!v4 || (v11 & 1) != 0)
  {
    if (!v4 && ((v11 ^ 1) & 1) == 0) {
      [v9 removeAnimationForKey:@"fadeTransition"];
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](&OBJC_CLASS___CATransition, "animation"));
    [v12 setDuration:0.150000006];
    [v12 setType:kCATransitionFade];
    [v9 addAnimation:v12 forKey:@"fadeTransion"];
  }

  if (v6)
  {
    id v17 = v6;
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  }

  else
  {
    objc_super v13 = &__NSArray0__struct;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
  [v14 setViewControllers:v13];

  if (v6) {
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController rightNavController](self, "rightNavController"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  [v16 setNeedsLayout];
}

- (void)episodeDetailViewController:(id)a3 playEpisode:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tableView]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "im_indexPathForFocusedCell"));
  id v9 = v8;
  if (v8)
  {
    id v18 = v8;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 selectedIndexPath]);
    uint64_t v12 = v11;
    if (v11)
    {
      id v18 = v11;
    }

    else
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
      id v18 = (id)objc_claimAutoreleasedReturnValue([v13 lastFocusedIndexPath]);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexPath:v18]);
  unsigned int v16 = [v15 isEqual:v5];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
    [v17 playEpisodeAtIndexPath:v18];
  }
}

- (void)detailListController:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
  [v6 playEpisodeAtIndexPath:v5];
}

- (void)detailListController:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
}

- (void)detailListController:(id)a3 didTransitionToState:(int64_t)a4
{
}

- (void)setEmptyContentViewController:(id)a3
{
  id v5 = (MTTVContentUnavailableViewController *)a3;
  if (self->_emptyContentViewController != v5)
  {
    id v7 = v5;
    -[MTTVEpisodeSplitViewController tearDownEmptyContentViewController](self, "tearDownEmptyContentViewController");
    objc_storeStrong((id *)&self->_emptyContentViewController, a3);
    int64_t v6 = -[MTTVEpisodeSplitViewController listState](self, "listState");
    id v5 = v7;
    if (!v6)
    {
      -[MTTVEpisodeSplitViewController standupEmptyContentViewController](self, "standupEmptyContentViewController");
      id v5 = v7;
    }
  }
}

- (void)setListState:(int64_t)a3
{
  if (self->_listState != a3)
  {
    self->_listState = a3;
    if (a3)
    {
      -[MTTVEpisodeSplitViewController _showDetailsForFirstItemIfNeededAnimated:]( self,  "_showDetailsForFirstItemIfNeededAnimated:",  0LL);
      -[MTTVEpisodeSplitViewController tearDownEmptyContentViewController](self, "tearDownEmptyContentViewController");
    }

    else
    {
      -[MTTVEpisodeSplitViewController _dismissDetailsForCurrentItemIfNeededAnimated:]( self,  "_dismissDetailsForCurrentItemIfNeededAnimated:");
      -[MTTVEpisodeSplitViewController standupEmptyContentViewController](self, "standupEmptyContentViewController");
    }
  }

- (void)standupEmptyContentViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    [v4 addSubview:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
    objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    [v18 viewDidLoad];

    -[MTTVEpisodeSplitViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)tearDownEmptyContentViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    [v4 willMoveToParentViewController:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    -[MTTVEpisodeSplitViewController removeChildViewController:](self, "removeChildViewController:", v5);

    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v7 removeFromSuperview];

    -[MTTVEpisodeSplitViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)updateEmptyView
{
  if (!-[MTTVEpisodeSplitViewController listState](self, "listState"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));

    if (v3)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
      int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
      [v4 addSubview:v6];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
      [v7 bringSubviewToFront:v9];

      id v20 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController view](self, "view"));
      [v20 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController emptyContentViewController](self, "emptyContentViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
    }
  }

- (MTTVListViewControllerProtocol)episodeList
{
  return self->_episodeList;
}

- (MTTVContentUnavailableViewController)emptyContentViewController
{
  return self->_emptyContentViewController;
}

- (int64_t)listState
{
  return self->_listState;
}

- (UINavigationController)leftNavController
{
  return self->_leftNavController;
}

- (void)setLeftNavController:(id)a3
{
}

- (UINavigationController)rightNavController
{
  return self->_rightNavController;
}

- (void)setRightNavController:(id)a3
{
}

- (UIViewController)placeholderDetailViewController
{
  return self->_placeholderDetailViewController;
}

- (void)setPlaceholderDetailViewController:(id)a3
{
}

- (NSTimer)fastScrollTimer
{
  return self->_fastScrollTimer;
}

- (void)setFastScrollTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end