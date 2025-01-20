@interface MTTVListViewController
- (BOOL)hasItems;
- (BOOL)hidesFooterWhenEmpty;
- (BOOL)showMarkButtonInsteadOfRemoveButton;
- (MTTVContentUnavailableViewController)emptyContentViewController;
- (MTTVListViewController)initWithCompositeFetchedResultsController:(id)a3;
- (MTTVListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)footerView;
- (int64_t)state;
- (void)controllerDidChangeContent:(id)a3;
- (void)loadView;
- (void)refetchWithPredicate:(id)a3;
- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5;
- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4;
- (void)setEmptyContentViewController:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHidesFooterWhenEmpty:(BOOL)a3;
- (void)setShowMarkButtonInsteadOfRemoveButton:(BOOL)a3;
- (void)standupEmptyContentViewController;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tearDownEmptyContentViewController;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)updateEmptyView;
- (void)updateListStateAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTTVListViewController

- (MTTVListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MTTVListViewController initWithCompositeFetchedResultsController:]( self,  "initWithCompositeFetchedResultsController:",  0LL,  a4);
}

- (MTTVListViewController)initWithCompositeFetchedResultsController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  v3 = -[MTTVFetchedTableWithSectionsViewController initWithCompositeFetchedResultsController:]( &v7,  "initWithCompositeFetchedResultsController:",  a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resultsChangedBlocks = v3->_resultsChangedBlocks;
    v3->_resultsChangedBlocks = (NSMutableDictionary *)v4;

    v3->_state = MTListStateUnknown;
    v3->_hidesFooterWhenEmpty = 1;
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", v3);
}

- (void)loadView
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___MTTableView);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  objc_super v5 = -[MTTableView initWithFrame:](v3, "initWithFrame:");

  -[MTTableView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
  -[MTTableView setDataSource:](v5, "setDataSource:", self);
  -[MTTableView setDelegate:](v5, "setDelegate:", self);
  -[MTTVListViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController viewDidLoad](&v12, "viewDidLoad");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
  [v3 setSeparatorStyle:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v4 setBackgroundColor:v5];

  v6 = objc_alloc(&OBJC_CLASS___UIImageView);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"episodeCellSeperatorTop"));
  v8 = -[UIImageView initWithImage:](v6, "initWithImage:", v7);
  defaultFooterView = self->_defaultFooterView;
  self->_defaultFooterView = v8;

  v10 = self->_defaultFooterView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController view](self, "view"));
  [v11 frame];
  -[UIImageView setFrame:](v10, "setFrame:", 0.0, 0.0, CGRectGetWidth(v13), 1.0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  id v7 = a4;
  -[MTTVListViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D376C;
  v8[3] = &unk_100241C60;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  id v6 = a4;
  -[MTTVListViewController willTransitionToTraitCollection:withTransitionCoordinator:]( &v8,  "willTransitionToTraitCollection:withTransitionCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D3818;
  v7[3] = &unk_100241C60;
  v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

- (void)setFooterView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController footerView](self, "footerView"));
    [v6 setTableFooterView:v7];

    objc_super v5 = v8;
  }
}

- (void)refetchWithPredicate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController refetchWithPredicate:](&v4, "refetchWithPredicate:", a3);
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", 0LL);
}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController refetchWithSortDescriptors:animated:]( &v6,  "refetchWithSortDescriptors:animated:",  a3);
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", v4);
}

- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController refetchWithPredicate:sortDescriptors:animated:]( &v7,  "refetchWithPredicate:sortDescriptors:animated:",  a3,  a4);
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", v5);
}

- (void)controllerDidChangeContent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVListViewController;
  -[MTTVFetchedTableWithSectionsViewController controllerDidChangeContent:](&v4, "controllerDidChangeContent:", a3);
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", 1LL);
}

- (void)setEmptyContentViewController:(id)a3
{
  BOOL v5 = (MTTVContentUnavailableViewController *)a3;
  if (self->_emptyContentViewController != v5)
  {
    objc_super v7 = v5;
    -[MTTVListViewController tearDownEmptyContentViewController](self, "tearDownEmptyContentViewController");
    objc_storeStrong((id *)&self->_emptyContentViewController, a3);
    int64_t v6 = -[MTTVListViewController state](self, "state");
    BOOL v5 = v7;
    if (!v6)
    {
      -[MTTVListViewController standupEmptyContentViewController](self, "standupEmptyContentViewController");
      BOOL v5 = v7;
    }
  }
}

- (BOOL)hasItems
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController",  0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 controllers]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) numberOfObjects])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)updateListStateAnimated:(BOOL)a3
{
  unsigned __int8 v4 = -[MTTVListViewController hasItems](self, "hasItems");
  int64_t state = self->_state;
  if ((v4 & 1) != 0)
  {
    if (state == 1) {
      return;
    }
    int64_t v6 = 1LL;
  }

  else
  {
    if (!state) {
      return;
    }
    int64_t v6 = 0LL;
  }

  self->_int64_t state = v6;
  -[MTTVListViewController transitionToState:animated:](self, "transitionToState:animated:");
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    if (a4)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000D3E10;
      v17[3] = &unk_10023FF98;
      v17[4] = self;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000D3E5C;
      v16[3] = &unk_100240110;
      v16[4] = self;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v17,  v16,  0.200000003);
    }

    else
    {
      -[MTTVListViewController tearDownEmptyContentViewController](self, "tearDownEmptyContentViewController");
    }

    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController footerView](self, "footerView"));
    [v9 setTableFooterView:v10];

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    [v11 setSeparatorStyle:0];
  }

  else
  {
    if (-[MTTVListViewController hidesFooterWhenEmpty](self, "hidesFooterWhenEmpty"))
    {
      -[MTTVListViewController standupEmptyContentViewController](self, "standupEmptyContentViewController");
      int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      __int128 v8 = v7;
      if (v4)
      {
        [v7 setAlpha:0.0];

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000D3E64;
        v15[3] = &unk_10023FF98;
        v15[4] = self;
        +[UIView animateWithDuration:animations:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:",  v15,  0.200000003);
      }

      else
      {
        [v7 setAlpha:1.0];
      }

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
      [v12 setTableFooterView:self->_defaultFooterView];
    }

    else
    {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
      CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
      [v13 setAlpha:0.0];
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v11 setSeparatorColor:v14];
  }
}

- (void)standupEmptyContentViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    [v4 reloadData];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
    -[MTTVListViewController addChildViewController:](self, "addChildViewController:", v5);

    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    [v8 setBackgroundView:v7];

    -[MTTVListViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)tearDownEmptyContentViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController tableView](self, "tableView"));
    [v4 reloadData];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
    [v5 willMoveToParentViewController:0];

    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
    [v6 removeFromParentViewController];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    [v8 removeFromSuperview];

    -[MTTVListViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)updateEmptyView
{
  if (!-[MTTVListViewController state](self, "state"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));

    if (v3)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController view](self, "view"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
      int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
      [v4 addSubview:v6];

      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController view](self, "view"));
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
      [v7 bringSubviewToFront:v9];

      id v20 = (id)objc_claimAutoreleasedReturnValue(-[MTTVListViewController view](self, "view"));
      [v20 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListViewController emptyContentViewController](self, "emptyContentViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
    }
  }

- (void)setHidesFooterWhenEmpty:(BOOL)a3
{
  if (self->_hidesFooterWhenEmpty != a3)
  {
    self->_hidesFooterWhenEmpty = a3;
    -[MTTVListViewController transitionToState:animated:](self, "transitionToState:animated:", self->_state, 0LL);
  }

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (MTTVContentUnavailableViewController)emptyContentViewController
{
  return self->_emptyContentViewController;
}

- (int64_t)state
{
  return self->_state;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)hidesFooterWhenEmpty
{
  return self->_hidesFooterWhenEmpty;
}

- (BOOL)showMarkButtonInsteadOfRemoveButton
{
  return self->_showMarkButtonInsteadOfRemoveButton;
}

- (void)setShowMarkButtonInsteadOfRemoveButton:(BOOL)a3
{
  self->_showMarkButtonInsteadOfRemoveButton = a3;
}

- (void).cxx_destruct
{
}

@end