@interface SATVAirplay2HomePickerViewController
- (SATVAirplay2DataSource)dataSource;
- (SATVAirplay2HomePickerViewController)initWithDataSource:(id)a3;
- (SATVAirplay2HomePickerViewControllerDelegate)delegate;
- (TVSUITableViewDiffableDataSource)diffableDataSource;
- (id)_cellForRowAtIndexPath:(id)a3 itemIdentifier:(id)a4;
- (id)_homeAtIndexPath:(id)a3;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)_updateTableViewAndAnimateChanges:(BOOL)a3;
- (void)airplay2DataSourceDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVAirplay2HomePickerViewController

- (SATVAirplay2HomePickerViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomePickerViewController;
  v6 = -[SATVPreviewTableViewController initWithStyle:](&v9, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomePickerViewController;
  -[SATVAirplay2HomePickerViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];

  objc_initWeak(&location, self);
  v8 = objc_alloc(&OBJC_CLASS___TVSUITableViewDiffableDataSource);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100063D20;
  v13 = &unk_1000C9DF0;
  objc_copyWeak(&v14, &location);
  objc_super v9 = -[TVSUITableViewDiffableDataSource initWithTableView:cellProvider:]( v8,  "initWithTableView:cellProvider:",  v3,  &v10);
  -[TVSUITableViewDiffableDataSource setDataSourceProxy:](v9, "setDataSourceProxy:", self, v10, v11, v12, v13);
  -[SATVAirplay2HomePickerViewController setDiffableDataSource:](self, "setDiffableDataSource:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomePickerViewController;
  -[SATVPreviewTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[SATVAirplay2HomePickerViewController _updateTableViewAndAnimateChanges:]( self,  "_updateTableViewAndAnimateChanges:",  0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController dataSource](self, "dataSource"));
  [v4 addObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomePickerViewController;
  -[SATVAirplay2HomePickerViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController dataSource](self, "dataSource"));
  [v4 removeObserver:self];
}

- (void)airplay2DataSourceDidUpdate:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController dataSource](self, "dataSource", a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homes]);
  id v6 = [v5 count];

  if (v6) {
    -[SATVAirplay2HomePickerViewController _updateTableViewAndAnimateChanges:]( self,  "_updateTableViewAndAnimateChanges:",  1LL);
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_10000D7CC(@"WHA_YOUR_HOMES_TITLE", @"Localizable");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController _homeAtIndexPath:](self, "_homeAtIndexPath:", a4));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController delegate](self, "delegate"));
  [v5 homePickerViewController:self didSelectHome:v6];
}

- (id)_homeAtIndexPath:(id)a3
{
  id v4 = [a3 item];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 homes]);

  if (v4 >= [v6 count]) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v4]);
  }

  return v7;
}

- (id)_cellForRowAtIndexPath:(id)a3 itemIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController _homeAtIndexPath:](self, "_homeAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  objc_super v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v5]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 textLabel]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  [v12 setText:v13];

  return v11;
}

- (void)_updateTableViewAndAnimateChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SATVAirplay2HomePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
    uint64_t v11 = @"Homes";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 homes]);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1000CAE80));
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v9,  @"Homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomePickerViewController diffableDataSource](self, "diffableDataSource"));
    [v10 applySnapshot:v5 animatingDifferences:v3 completion:0];
  }

- (SATVAirplay2HomePickerViewControllerDelegate)delegate
{
  return (SATVAirplay2HomePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SATVAirplay2DataSource)dataSource
{
  return self->_dataSource;
}

- (TVSUITableViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end