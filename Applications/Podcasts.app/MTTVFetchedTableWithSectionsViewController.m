@interface MTTVFetchedTableWithSectionsViewController
- (BOOL)changeIsUserDriven;
- (BOOL)hideHeaderForEmptySection:(int64_t)a3;
- (BOOL)inSwipeToDeleteMode;
- (MTCompositeResultsController)compositeResultsController;
- (MTCoreDataResultsController)frc;
- (MTTVFetchedTableWithSectionsViewController)initWithCoder:(id)a3;
- (MTTVFetchedTableWithSectionsViewController)initWithCompositeFetchedResultsController:(id)a3;
- (MTTVFetchedTableWithSectionsViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (MTTVFetchedTableWithSectionsViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6;
- (MTTVFetchedTableWithSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MTTVFetchedTableWithSectionsViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_controllerForSection:(unint64_t)a3;
- (id)indexPathForObject:(id)a3;
- (id)indexPathsForObject:(id)a3;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_sectionForController:(id)a3;
- (void)_updateTableAnimated:(BOOL)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)refetchWithPredicate:(id)a3;
- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5;
- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4;
- (void)setChangeIsUserDriven:(BOOL)a3;
- (void)setCompositeResultsController:(id)a3;
- (void)setInSwipeToDeleteMode:(BOOL)a3;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTTVFetchedTableWithSectionsViewController

- (MTTVFetchedTableWithSectionsViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[MTTVFetchedTableWithSectionsViewController initWithEntityName:predicate:sortDescriptors:propertyKeys:]( self,  "initWithEntityName:predicate:sortDescriptors:propertyKeys:",  a3,  a4,  a5,  0LL);
}

- (MTTVFetchedTableWithSectionsViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:propertyKeys:]( objc_alloc(&OBJC_CLASS___MTCoreDataResultsController),  "initWithEntityName:predicate:sortDescriptors:propertyKeys:",  v13,  v12,  v11,  v10);

  v15 = objc_alloc(&OBJC_CLASS___MTCompositeResultsController);
  v20 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v17 = -[MTCompositeResultsController initWithControllers:](v15, "initWithControllers:", v16);

  v18 = -[MTTVFetchedTableWithSectionsViewController initWithCompositeFetchedResultsController:]( self,  "initWithCompositeFetchedResultsController:",  v17);
  return v18;
}

- (MTTVFetchedTableWithSectionsViewController)initWithCompositeFetchedResultsController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVFetchedTableWithSectionsViewController;
  v6 = -[MTTVFetchedTableWithSectionsViewController initWithStyle:](&v9, "initWithStyle:", 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_compositeResultsController, a3);
    -[MTCompositeResultsController setDelegate:](v7->_compositeResultsController, "setDelegate:", v7);
  }

  return v7;
}

- (MTTVFetchedTableWithSectionsViewController)initWithStyle:(int64_t)a3
{
  return -[MTTVFetchedTableWithSectionsViewController initWithCompositeFetchedResultsController:]( self,  "initWithCompositeFetchedResultsController:",  0LL);
}

- (MTTVFetchedTableWithSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MTTVFetchedTableWithSectionsViewController initWithCompositeFetchedResultsController:]( self,  "initWithCompositeFetchedResultsController:",  0LL,  a4);
}

- (MTTVFetchedTableWithSectionsViewController)initWithCoder:(id)a3
{
  return -[MTTVFetchedTableWithSectionsViewController initWithCompositeFetchedResultsController:]( self,  "initWithCompositeFetchedResultsController:",  0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVFetchedTableWithSectionsViewController;
  -[MTTVFetchedTableWithSectionsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVFetchedTableWithSectionsViewController;
  -[MTTVFetchedTableWithSectionsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(MTTVTableSectionHeaderView) forHeaderFooterViewReuseIdentifier:@"ThinHeaderReuseID"];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVFetchedTableWithSectionsViewController;
  -[MTTVFetchedTableWithSectionsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController mt_topNavigationController]( self,  "mt_topNavigationController"));
  [v5 setTabBarObservedScrollView:v4];
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  int64_t userDrivenCounter = self->_userDrivenCounter;
  if (a3) {
    int64_t v4 = userDrivenCounter + 1;
  }
  else {
    int64_t v4 = userDrivenCounter - 1;
  }
  self->_int64_t userDrivenCounter = v4;
}

- (BOOL)changeIsUserDriven
{
  return self->_userDrivenCounter > 0;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexPath:v4]);

  return v6;
}

- (id)indexPathsForObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathsForObject:v4]);

  return v6;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForObject:v4]);

  return v6;
}

- (void)setCompositeResultsController:(id)a3
{
  p_compositeResultsController = &self->_compositeResultsController;
  objc_storeStrong((id *)&self->_compositeResultsController, a3);
  id v6 = a3;
  -[MTCompositeResultsController setDelegate:](*p_compositeResultsController, "setDelegate:", self);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
  [v7 reloadData];
}

- (id)_controllerForSection:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 controllerAtIndex:a3]);

  return v5;
}

- (unint64_t)_sectionForController:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v6 = [v5 indexOfController:v4];

  return (unint64_t)v6;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 1;
  -[MTTVFetchedTableWithSectionsViewController setEditing:animated:](self, "setEditing:animated:", 1LL, 1LL);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controllers]);
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController",  a3));
  id v6 = [v5 numberOfObjectsInSection:a4];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController _controllerForSection:]( self,  "_controllerForSection:",  a4));
  if (-[MTTVFetchedTableWithSectionsViewController hideHeaderForEmptySection:](self, "hideHeaderForEmptySection:", a4)
    && ![v6 numberOfObjects])
  {
    id v7 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController reuseIdentifierForRow:]( self,  "reuseIdentifierForRow:",  v6));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v8]);

  if (!v9) {
    id v9 = -[MTTVFetchedTableWithSectionsViewController newCellInstanceWithReuseIdentifier:]( self,  "newCellInstanceWithReuseIdentifier:",  v8);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  -[MTTVFetchedTableWithSectionsViewController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v9,  v10,  v6);

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController tableView:titleForHeaderInSection:]( self,  "tableView:titleForHeaderInSection:",  a3,  a4));
  if ([v5 length])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableHeaderFooterViewWithIdentifier:@"ThinHeaderReuseID"]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
    [v8 setText:v5];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController tableView:titleForHeaderInSection:]( self,  "tableView:titleForHeaderInSection:",  a3,  a4));
  if ([v4 length])
  {
    +[MTTVTableSectionHeaderView height](&OBJC_CLASS___MTTVTableSectionHeaderView, "height");
    double v6 = v5;
  }

  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)reuseIdentifierForRow:(id)a3
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[UITableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___UITableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  v3);

  return v4;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView", a3));
  [v3 reloadData];
}

- (BOOL)hideHeaderForEmptySection:(int64_t)a3
{
  return 1;
}

- (void)controllerWillChangeContent:(id)a3
{
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
    [v4 beginUpdates];
  }

- (void)controllerDidChangeContent:(id)a3
{
  id v8 = a3;
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    unint64_t v4 = -[MTTVFetchedTableWithSectionsViewController _sectionForController:](self, "_sectionForController:", v8);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v4));
    [v5 _reloadSectionHeaderFooters:v6 withRowAnimation:100];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
    [v7 endUpdates];
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v23 = a4;
  id v11 = a5;
  id v12 = a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    switch(a6)
    {
      case 1uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
        v15 = v13;
        v16 = v14;
        uint64_t v17 = 0LL;
        goto LABEL_6;
      case 2uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v14 withRowAnimation:0];
        goto LABEL_7;
      case 3uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v18 withRowAnimation:5];

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
        v15 = v13;
        v16 = v14;
        uint64_t v17 = 5LL;
LABEL_6:
        [v15 insertRowsAtIndexPaths:v16 withRowAnimation:v17];
        goto LABEL_7;
      case 4uLL:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 indexPathsForVisibleRows]);
        unsigned int v21 = [v20 containsObject:v11];

        if (!v21) {
          break;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v22 cellForRowAtIndexPath:v11]);

        if (v23 && v14) {
          -[MTTVFetchedTableWithSectionsViewController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v14,  v23,  v11);
        }
LABEL_7:

        break;
      default:
        break;
    }
  }
}

- (MTCoreDataResultsController)frc
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedTableWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 controllerAtIndex:0]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTCoreDataResultsController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    return (MTCoreDataResultsController *)v3;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"Using the [frc] method assumes a MTCoreDataResultsController",  0LL));
  objc_exception_throw(v6);
  -[MTTVFetchedTableWithSectionsViewController refetchWithPredicate:sortDescriptors:animated:](v7, v8, v9, v10, v11);
  return result;
}

- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v9 setPredicate:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v10 setSortDescriptors:v7];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v11 reloadData];
}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v6 setSortDescriptors:v5];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v7 reloadData];
}

- (void)refetchWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
  [v5 setPredicate:v4];

  -[MTTVFetchedTableWithSectionsViewController _updateTableAnimated:](self, "_updateTableAnimated:", 0LL);
}

- (void)_updateTableAnimated:(BOOL)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    id v6 = [v33 mutableCopy];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
    [v7 reloadData];

    v34 = self;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    objc_msgSend(v6, "minusSet:");
    id v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  [v5 indexOfObject:*(void *)(*((void *)&v36 + 1) + 8 * (void)i)],  0));
          -[NSMutableArray addObject:](v10, "addObject:", v17);
        }

        id v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v14);
    }

    v18 = (char *)[v35 count];
    if (v18)
    {
      v19 = v18;
      for (j = 0LL; j != v19; ++j)
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:j]);
        unsigned __int8 v22 = [v5 containsObject:v21];

        if ((v22 & 1) == 0)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  j,  0LL));
          -[NSMutableArray addObject:](v11, "addObject:", v23);
        }
      }
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
    [v24 beginUpdates];

    if (-[NSMutableArray count](v11, "count")
      || -[NSMutableArray count](v10, "count")
      || ([v9 isEqualToArray:v5] & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
      [v25 insertRowsAtIndexPaths:v11 withRowAnimation:5];

      v26 = (NSIndexSet *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
      -[NSIndexSet deleteRowsAtIndexPaths:withRowAnimation:](v26, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 5LL);
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
      id v31 = [v30 numberOfSections];

      v26 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
      [v32 reloadSections:v26 withRowAnimation:0];
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](v34, "tableView"));
    [v27 endUpdates];
  }

  else
  {
    -[MTTVFetchedTableWithSectionsViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController frc](self, "frc"));
    [v28 reloadData];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedTableWithSectionsViewController tableView](self, "tableView"));
    [v29 reloadData];

    -[MTTVFetchedTableWithSectionsViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 0LL);
  }

- (BOOL)inSwipeToDeleteMode
{
  return self->_inSwipeToDeleteMode;
}

- (void)setInSwipeToDeleteMode:(BOOL)a3
{
  self->_inSwipeToDeleteMode = a3;
}

- (MTCompositeResultsController)compositeResultsController
{
  return self->_compositeResultsController;
}

- (void).cxx_destruct
{
}

@end