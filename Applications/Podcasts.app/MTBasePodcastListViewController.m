@interface MTBasePodcastListViewController
+ (id)defaultsKey;
- (BOOL)indexPathIsCurrentlySelectedRow:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (MTRefreshControlDelegate)refreshDelegate;
- (MTSourceListDelegate)delegate;
- (NSAttributedString)attributedTitleForRefreshControl;
- (NSString)selectedUuid;
- (SEL)selectorForRefreshControl;
- (id)_selectItemWithUuid:(id)a3;
- (id)firstValidIndexPath;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)storedUuid;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)targetForRefreshControl;
- (int64_t)flattenedCellIndexForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)configureRowHeight;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)didEndDraggingScrollView;
- (void)didReceiveMemoryWarning;
- (void)endRefreshingWhenDraggingCompletes;
- (void)loadView;
- (void)restoreSelection;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)selectItemWithUuid:(id)a3 forceScroll:(BOOL)a4;
- (void)setAttributedTitleForRefreshControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRefreshDelegate:(id)a3;
- (void)setRefreshing:(BOOL)a3;
- (void)setSelectedUuid:(id)a3;
- (void)setSelectorForRefreshControl:(SEL)a3;
- (void)setTargetForRefreshControl:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updatedDefaults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTBasePodcastListViewController

+ (id)defaultsKey
{
  return 0LL;
}

- (id)storedUuid
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "defaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = objc_msgSend((id)objc_opt_class(self, v6), "defaultsKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:v8]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return +[MTGenericCell reuseIdentifier](&OBJC_CLASS___MTPodcastCell, "reuseIdentifier", a3);
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  v4 = -[MTPodcastCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTPodcastCell),  "initWithStyle:reuseIdentifier:",  0LL,  v3);

  return v4;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"MTAbstractMethod",  @"Handle this method in the subclass",  0LL));
  objc_exception_throw(v10);
  -[MTBasePodcastListViewController tableView:editingStyleForRowAtIndexPath:](v11, v12, v13, v14);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[MTBasePodcastListViewController isEditing](self, "isEditing", a3, a4);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexPath:v17]);

  if ((objc_opt_respondsToSelector(v6, "uuid") & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController delegate](self, "delegate"));
    [v8 sourceList:self didSelectItemUuid:v7 atIndexPath:v17];

    id v10 = objc_msgSend((id)objc_opt_class(self, v9), "defaultsKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
    {
      SEL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v14 = objc_msgSend((id)objc_opt_class(self, v13), "defaultsKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v12 setObject:v7 forKey:v15];

      id v16 = -[MTBasePodcastListViewController _selectItemWithUuid:](self, "_selectItemWithUuid:", v7);
    }
  }
}

- (void)restoreSelection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController storedUuid](self, "storedUuid"));
  -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController selectedUuid](self, "selectedUuid"));
  -[MTBasePodcastListViewController selectItemWithUuid:forceScroll:](self, "selectItemWithUuid:forceScroll:", v4, 0LL);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    -[MTBasePodcastListViewController didEndDraggingScrollView](self, "didEndDraggingScrollView", a3);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)didEndDraggingScrollView
{
  if (self->_endRefreshWhenDraggingEnds)
  {
    -[MTBasePodcastListViewController setRefreshing:](self, "setRefreshing:", 0LL);
    self->_endRefreshWhenDraggingEnds = 0;
  }

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  return -[MTFetchedTableViewController numberOfSectionsInTableView:](&v4, "numberOfSectionsInTableView:", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  return -[MTFetchedTableViewController tableView:numberOfRowsInSection:]( &v5,  "tableView:numberOfRowsInSection:",  a3,  a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  id v4 = -[MTFetchedTableViewController tableView:cellForRowAtIndexPath:](&v6, "tableView:cellForRowAtIndexPath:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return a5;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:]( &v16,  "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:",  a3,  v12,  a5,  a6,  a7);
  if ((objc_opt_respondsToSelector(v12, "uuid") & 1) != 0) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
  }
  else {
    uint64_t v13 = 0LL;
  }
  if ([v13 isEqual:self->_selectedUuid])
  {
    if (a6 == 2)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController navigationController](self, "navigationController"));
      id v15 = [v14 popToRootViewControllerAnimated:1];
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController delegate](self, "delegate"));
      [v14 sourceList:self didUpdateSelectedItemUuid:v13];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController controllerDidChangeContent:](&v6, "controllerDidChangeContent:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven")
    && (-[MTBasePodcastListViewController isHorizontallyCompact](self, "isHorizontallyCompact") & 1) == 0)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathForSelectedRow]);
    if (v5)
    {
    }

    else if ((uint64_t)[v4 numberOfRowsInSection:0] >= 1)
    {
      -[MTBasePodcastListViewController restoreSelection](self, "restoreSelection");
    }
  }
}

- (id)tableView
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  id v2 = -[MTBasePodcastListViewController tableView](&v4, "tableView");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
  unsigned int v5 = [v4 isRefreshing];

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    [v6 endRefreshing];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self name:NSUserDefaultsDidChangeNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForSelectedRow]);

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewWillAppear:](&v32, "viewWillAppear:", v3);
  BOOL v7 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  [v8 reloadData];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController splitViewController](self, "splitViewController"));
  unsigned __int8 v10 = [v9 isHorizontallyCompact];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:self selector:"updatedDefaults:" name:NSUserDefaultsDidChangeNotification object:0];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    [v12 selectRowAtIndexPath:v6 animated:0 scrollPosition:0];

    -[MTBasePodcastListViewController restoreSelection](self, "restoreSelection");
  }

  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v7);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    unsigned __int8 v15 = [v14 isRefreshing];

    if ((v15 & 1) == 0)
    {
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      [v16 beginRefreshing];

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      [v17 endRefreshing];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[MTBasePodcastListViewController attributedTitleForRefreshControl]( self,  "attributedTitleForRefreshControl"));
    [v18 setAttributedTitle:v19];

    if (-[MTBasePodcastListViewController isRefreshing](self, "isRefreshing"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      unsigned __int8 v21 = [v20 isRefreshing];

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
        [v22 setAdjustContentOffsetForRefreshControlAsNeeded:1];

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
        [v23 beginRefreshing];

        dispatch_time_t v24 = dispatch_time(0LL, 100000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000E0F8;
        block[3] = &unk_10023FF98;
        block[4] = self;
        dispatch_after(v24, &_dispatch_main_q, block);
      }
    }
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController targetForRefreshControl](self, "targetForRefreshControl"));
    char v26 = objc_opt_respondsToSelector( v25,  -[MTBasePodcastListViewController selectorForRefreshControl](self, "selectorForRefreshControl"));

    if ((v26 & 1) != 0)
    {
      v27 = objc_alloc_init(&OBJC_CLASS___UIRefreshControl);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController targetForRefreshControl](self, "targetForRefreshControl"));
      -[UIRefreshControl addTarget:action:forControlEvents:]( v27,  "addTarget:action:forControlEvents:",  v28,  -[MTBasePodcastListViewController selectorForRefreshControl](self, "selectorForRefreshControl"),  4096LL);

      v29 = (void *)objc_claimAutoreleasedReturnValue( -[MTBasePodcastListViewController attributedTitleForRefreshControl]( self,  "attributedTitleForRefreshControl"));
      -[UIRefreshControl setAttributedTitle:](v27, "setAttributedTitle:", v29);

      -[MTFetchedTableViewController setRefreshControl:](self, "setRefreshControl:", v27);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10000E12C;
      v30[3] = &unk_10023FF98;
      v30[4] = self;
      dispatch_async(&_dispatch_main_q, v30);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTBasePodcastListViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (-[MTBasePodcastListViewController isHorizontallyCompact](self, "isHorizontallyCompact"))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForSelectedRow]);
    [v4 deselectRowAtIndexPath:v6 animated:1];
  }

  -[MTBasePodcastListViewController simulateMemoryWarning](self, "simulateMemoryWarning");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)loadView
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___MTTableView);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  unsigned int v5 = -[MTTableView initWithFrame:style:](v3, "initWithFrame:style:", 1LL);

  -[MTTableView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
  -[MTTableView setDataSource:](v5, "setDataSource:", self);
  -[MTTableView setDelegate:](v5, "setDelegate:", self);
  -[MTTableView setSeparatorStyle:](v5, "setSeparatorStyle:", 1LL);
  -[MTTableView setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 70.0, 0.0, 0.0);
  -[MTBasePodcastListViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewDidLoad](&v7, "viewDidLoad");
  BOOL v3 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  [v4 setTableFooterView:v3];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController storedUuid](self, "storedUuid"));
  -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v5);

  -[MTBasePodcastListViewController configureRowHeight](self, "configureRowHeight");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)configureRowHeight
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  +[MTGenericCell heightForWidth:](&OBJC_CLASS___MTPodcastCell, "heightForWidth:", 1.79769313e308);
  objc_msgSend(v3, "setEstimatedRowHeight:");

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  [v4 setRowHeight:UITableViewAutomaticDimension];
}

- (void)dealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTBasePodcastListViewController;
  -[MTFetchedTableViewController dealloc](&v4, "dealloc");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController view](self, "view", a3));
  [v4 setNeedsLayout];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 tableHeaderView]);

  [v6 setNeedsLayout];
}

- (void)setRefreshing:(BOOL)a3
{
  if (self->_refreshing != a3)
  {
    BOOL v3 = a3;
    if (a3)
    {
      self->_refreshing = a3;
    }

    else
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      unsigned int v6 = [v5 isDragging];

      if (v6)
      {
        -[MTBasePodcastListViewController endRefreshingWhenDraggingCompletes]( self,  "endRefreshingWhenDraggingCompletes");
        return;
      }

      self->_refreshing = v3;
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      [v7 reloadData];
    }

    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", v3);
    if (self->_refreshing)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      unsigned __int8 v9 = [v8 isRefreshing];

      if ((v9 & 1) == 0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
        [v12 beginRefreshing];
        goto LABEL_13;
      }

      if (self->_refreshing) {
        return;
      }
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    unsigned int v11 = [v10 isRefreshing];

    if (!v11) {
      goto LABEL_14;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    [v12 endRefreshing];
LABEL_13:

LABEL_14:
    if (!self->_refreshing)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshDelegate](self, "refreshDelegate"));
      [v13 didEndRefreshing];
    }
  }

- (void)endRefreshingWhenDraggingCompletes
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  unsigned int v4 = [v3 isDragging];

  if (v4) {
    self->_endRefreshWhenDraggingEnds = 1;
  }
  else {
    -[MTBasePodcastListViewController setRefreshing:](self, "setRefreshing:", 0LL);
  }
}

- (void)setAttributedTitleForRefreshControl:(id)a3
{
  id v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:]( self->_attributedTitleForRefreshControl,  "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedTitleForRefreshControl, a3);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    [v5 setAttributedTitle:v6];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v6 setBackgroundColor:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 backgroundView]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](&OBJC_CLASS___UIColor, "backgroundColor"));
  [v9 setBackgroundColor:v8];
}

- (int64_t)flattenedCellIndexForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  int64_t v7 = -[MTBasePodcastListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v6);

  else {
    uint64_t v8 = (uint64_t)v5;
  }
  if (v8 < 1)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      v10 += -[MTBasePodcastListViewController tableView:numberOfRowsInSection:]( self,  "tableView:numberOfRowsInSection:",  v11,  v9);

      ++v9;
      id v12 = [v4 section];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      int64_t v14 = -[MTBasePodcastListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v13);

      else {
        int64_t v15 = (int64_t)v12;
      }
    }

    while (v15 > v9);
  }

  objc_super v16 = (char *)[v4 row] + v10;

  return (int64_t)v16;
}

- (void)updatedDefaults:(id)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "defaultsKey");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E9F8;
    block[3] = &unk_10023FF98;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (id)firstValidIndexPath
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataSource]);
  if ([v3 tableView:v2 numberOfRowsInSection:0]) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_selectItemWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchedObjects]);
  id v7 = [v6 count];

  if (v7)
  {
    id v12 = 0LL;
    id v13 = 0LL;
    -[MTBasePodcastListViewController getObjectId:andIndexPath:forItemWithUuid:]( self,  "getObjectId:andIndexPath:forItemWithUuid:",  &v13,  &v12,  v4);
    id v8 = v13;
    id v9 = v12;
    if (v9) {
      id v10 = v4;
    }
    else {
      id v10 = 0LL;
    }
    -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v10);
  }

  else
  {
    id v9 = 0LL;
    id v8 = 0LL;
  }

  return v9;
}

- (void)selectItemWithUuid:(id)a3 forceScroll:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController _selectItemWithUuid:](self, "_selectItemWithUuid:", a3));
  if (v6
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController firstValidIndexPath](self, "firstValidIndexPath")),
        (uint64_t v6 = (uint64_t)v7) != 0))
  {
    id v10 = (id)v6;
    if (!-[MTBasePodcastListViewController indexPathIsCurrentlySelectedRow:]( self,  "indexPathIsCurrentlySelectedRow:",  v6)
      || v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      [v8 selectRowAtIndexPath:v10 animated:0 scrollPosition:2];

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      -[MTBasePodcastListViewController tableView:didSelectRowAtIndexPath:]( self,  "tableView:didSelectRowAtIndexPath:",  v9,  v10);
    }

    id v7 = v10;
  }
}

- (BOOL)indexPathIsCurrentlySelectedRow:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForSelectedRow]);
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (MTSourceListDelegate)delegate
{
  return (MTSourceListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MTRefreshControlDelegate)refreshDelegate
{
  return (MTRefreshControlDelegate *)objc_loadWeakRetained((id *)&self->_refreshDelegate);
}

- (void)setRefreshDelegate:(id)a3
{
}

- (NSString)selectedUuid
{
  return self->_selectedUuid;
}

- (void)setSelectedUuid:(id)a3
{
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (NSAttributedString)attributedTitleForRefreshControl
{
  return self->_attributedTitleForRefreshControl;
}

- (SEL)selectorForRefreshControl
{
  return self->_selectorForRefreshControl;
}

- (void)setSelectorForRefreshControl:(SEL)a3
{
  self->_selectorForRefreshControl = a3;
}

- (id)targetForRefreshControl
{
  return objc_loadWeakRetained(&self->_targetForRefreshControl);
}

- (void)setTargetForRefreshControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end