@interface MTFetchedTableViewController
- (BOOL)changeIsUserDriven;
- (BOOL)hasSectionNameKeyPathChanged;
- (BOOL)inSwipeToDeleteMode;
- (MTFetchedTableViewController)initWithEntityName:(id)a3;
- (MTFetchedTableViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (NSArray)sortDescriptors;
- (NSFetchedResultsController)frc;
- (NSPredicate)fetchPredicate;
- (NSString)fetchEntityName;
- (NSString)sectionName;
- (NSString)sectionNameKeyPath;
- (id)fetchRequestInManagedObjectContext:(id)a3;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowAnimation;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateTableAnimated:(BOOL)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)initializeFrc;
- (void)refetchWithPredicate:(id)a3;
- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5;
- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4;
- (void)reloadVisibleCellsWithAnimation:(int64_t)a3;
- (void)setChangeIsUserDriven:(BOOL)a3;
- (void)setFetchEntityName:(id)a3;
- (void)setFetchPredicate:(id)a3;
- (void)setFrc:(id)a3;
- (void)setInSwipeToDeleteMode:(BOOL)a3;
- (void)setRefreshControl:(id)a3;
- (void)setRowAnimation:(int64_t)a3;
- (void)setSectionName:(id)a3;
- (void)setSectionNameKeyPath:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTFetchedTableViewController

- (MTFetchedTableViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = -[MTFetchedTableViewController init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchPredicate, a4);
    objc_storeStrong((id *)&v13->_sortDescriptors, a5);
    objc_storeStrong((id *)&v13->_fetchEntityName, a3);
    v13->_rowAnimation = 0LL;
    v15 = (objc_class *)objc_opt_class(v13, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MTFetchedTableViewController setRestorationIdentifier:](v13, "setRestorationIdentifier:", v17);

    v18 = v13;
  }

  return v13;
}

- (MTFetchedTableViewController)initWithEntityName:(id)a3
{
  return -[MTFetchedTableViewController initWithEntityName:predicate:sortDescriptors:]( self,  "initWithEntityName:predicate:sortDescriptors:",  a3,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController dealloc](&v3, "dealloc");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)initializeFrc
{
  if (!self->_frc)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedTableViewController fetchRequestInManagedObjectContext:]( self,  "fetchRequestInManagedObjectContext:",  v4));
    v6 = -[NSFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:]( objc_alloc(&OBJC_CLASS___NSFetchedResultsController),  "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:",  v5,  v4,  self->_sectionNameKeyPath,  0LL);
    -[NSFetchedResultsController setDelegate:](v6, "setDelegate:", self);
    id v10 = 0LL;
    unsigned int v7 = -[NSFetchedResultsController performFetch:](v6, "performFetch:", &v10);
    id v8 = v10;
    id v9 = v8;
    if (v7) {
      -[MTFetchedTableViewController setFrc:](self, "setFrc:", v6);
    }
    else {
      [v8 logAndThrow:1];
    }
  }

- (NSFetchedResultsController)frc
{
  return self->_frc;
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

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidLoad
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  [v3 setRestorationIdentifier:@"FetchedResultsTableView"];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController viewDidLoad](&v6, "viewDidLoad");
  int64_t v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController editButtonItem](self, "editButtonItem"));
  editButtonItem_localIvar = self->_editButtonItem_localIvar;
  self->_editButtonItem_localIvar = v4;
}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchRequest]);
  [v7 setSortDescriptors:v6];

  -[MTFetchedTableViewController setSortDescriptors:](self, "setSortDescriptors:", v6);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", v4);
}

- (void)refetchWithPredicate:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRequest]);
  [v5 setPredicate:v4];

  -[MTFetchedTableViewController setFetchPredicate:](self, "setFetchPredicate:", v4);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", 1LL);
}

- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 fetchRequest]);
  [v10 setPredicate:v9];

  -[MTFetchedTableViewController setFetchPredicate:](self, "setFetchPredicate:", v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 fetchRequest]);
  [v11 setSortDescriptors:v8];

  -[MTFetchedTableViewController setSortDescriptors:](self, "setSortDescriptors:", v8);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", v5);
}

- (id)reuseIdentifierForRow:(id)a3
{
  objc_super v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v6 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexPath:v6]);

    if (v8)
    {
      [v7 deleteObject:v8];
      [v7 saveInCurrentBlock];
    }
  }

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 1;
  -[MTFetchedTableViewController setEditing:animated:](self, "setEditing:animated:", 1LL, 1LL);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sections]);
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sections]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:a4]);

  id v8 = [v7 numberOfObjects];
  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController reuseIdentifierForRow:](self, "reuseIdentifierForRow:", v6));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v8]);

  if (!v9) {
    id v9 = -[MTFetchedTableViewController newCellInstanceWithReuseIdentifier:]( self,  "newCellInstanceWithReuseIdentifier:",  v8);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexPath:v6]);

  -[MTFetchedTableViewController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v9,  v11,  v6);
  return v9;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[UITableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___UITableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  v3);

  return v4;
}

- (void)controllerWillChangeContent:(id)a3
{
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
    [v4 beginUpdates];
  }

- (void)controllerDidChangeContent:(id)a3
{
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
    [v4 endUpdates];
  }

- (void)setRefreshControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
  id v6 = v4;
  if ((id)v5 == v4) {
    goto LABEL_4;
  }
  id v7 = (void *)v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
  unsigned int v9 = [v8 isRefreshing];

  if (v9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
    [v6 endRefreshing];
LABEL_4:
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController setRefreshControl:](&v10, "setRefreshControl:", v4);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v16 = a4;
  id v11 = a5;
  id v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    switch(a6)
    {
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v14 withRowAnimation:5];
        goto LABEL_8;
      case 3uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v15 withRowAnimation:5];

LABEL_5:
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
        [v13 insertRowsAtIndexPaths:v14 withRowAnimation:5];
        goto LABEL_8;
      case 4uLL:
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cellForRowAtIndexPath:v11]);
        if (v14) {
          -[MTFetchedTableViewController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v14,  v16,  v11);
        }
LABEL_8:

        break;
      default:
        break;
    }
  }
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView", a3, a4));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    if (a6 == 2)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", a5));
      [v10 deleteSections:v9 withRowAnimation:5];
      goto LABEL_6;
    }

    if (a6 == 1)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", a5));
      [v10 insertSections:v9 withRowAnimation:5];
LABEL_6:
    }
  }
}

- (id)fetchRequestInManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sortDescriptors](self, "sortDescriptors"));
  if (v6)
  {
    -[NSFetchRequest setSortDescriptors:](v5, "setSortDescriptors:", v6);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[NSFetchRequest setSortDescriptors:](v5, "setSortDescriptors:", v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchEntityName](self, "fetchEntityName"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v8,  v4));

  -[NSFetchRequest setEntity:](v5, "setEntity:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchPredicate](self, "fetchPredicate"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchPredicate](self, "fetchPredicate"));
    -[NSFetchRequest setPredicate:](v5, "setPredicate:", v11);
  }

  return v5;
}

- (BOOL)hasSectionNameKeyPathChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController sectionNameKeyPath](self->_frc, "sectionNameKeyPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sectionNameKeyPath](self, "sectionNameKeyPath"));

  if (v3 == v4) {
    return 0;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController sectionNameKeyPath](self->_frc, "sectionNameKeyPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sectionNameKeyPath](self, "sectionNameKeyPath"));
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  return v7 ^ 1;
}

- (void)_updateTableAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[MTFetchedTableViewController hasSectionNameKeyPathChanged](self, "hasSectionNameKeyPathChanged");
  if (v5)
  {
    -[NSFetchedResultsController setDelegate:](self->_frc, "setDelegate:", 0LL);
    frc = self->_frc;
    self->_frc = 0LL;

    -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
  }

  if (v3 && (id)-[MTFetchedTableViewController rowAnimation](self, "rowAnimation") != (id)5)
  {
    if (v5)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v11 beginUpdates];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      id v13 = [v12 numberOfSections];

      uint64_t v14 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v15 deleteSections:v14 withRowAnimation:0];

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sections]);
      id v18 = [v17 count];

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  0LL,  v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v20 insertSections:v19 withRowAnimation:0];

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v21 endUpdates];

      id v9 = 0LL;
      goto LABEL_31;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects"));
    id v23 = [v22 copy];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
    id v25 = [v24 mutableCopy];
    v26 = self->_frc;
    id v57 = 0LL;
    unsigned int v27 = -[NSFetchedResultsController performFetch:](v26, "performFetch:", &v57);
    id v9 = v57;
    if (v27)
    {
      char v50 = v27;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
      objc_msgSend(v25, "minusSet:");
      v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v52 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      id v49 = v25;
      id v29 = v25;
      id v30 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v54;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v54 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  [v23 indexOfObject:*(void *)(*((void *)&v53 + 1) + 8 * (void)i)],  0));
            -[NSMutableArray addObject:](v28, "addObject:", v34);
          }

          id v31 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }

        while (v31);
      }

      v35 = (char *)[v51 count];
      if (v35)
      {
        v36 = v35;
        for (j = 0LL; j != v36; ++j)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue([v48 objectAtIndex:j]);
          unsigned __int8 v39 = [v23 containsObject:v38];

          if ((v39 & 1) == 0)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  j,  0LL));
            -[NSMutableArray addObject:](v52, "addObject:", v40);
          }
        }
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v41 beginUpdates];

      if (-[NSMutableArray count](v52, "count")
        || -[NSMutableArray count](v28, "count")
        || ([v48 isEqualToArray:v23] & 1) != 0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        objc_msgSend( v42,  "insertRowsAtIndexPaths:withRowAnimation:",  v52,  -[MTFetchedTableViewController rowAnimation](self, "rowAnimation"));

        v43 = (NSIndexSet *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        -[NSIndexSet deleteRowsAtIndexPaths:withRowAnimation:]( v43,  "deleteRowsAtIndexPaths:withRowAnimation:",  v28,  -[MTFetchedTableViewController rowAnimation](self, "rowAnimation"));
      }

      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        id v46 = [v45 numberOfSections];

        v43 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        [v47 reloadSections:v43 withRowAnimation:0];
      }

      id v25 = v49;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v44 endUpdates];

      LOBYTE(v27) = v50;
    }

    if ((v27 & 1) == 0) {
      goto LABEL_8;
    }
  }

  else
  {
    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1LL);
    unsigned __int8 v7 = self->_frc;
    id v58 = 0LL;
    unsigned int v8 = -[NSFetchedResultsController performFetch:](v7, "performFetch:", &v58);
    id v9 = v58;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      [v10 reloadData];
    }

    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 0LL);
    if ((v8 & 1) == 0)
    {
LABEL_8:
      if (v9) {
        [v9 logAndThrow:1];
      }
    }
  }

- (void)reloadVisibleCellsWithAnimation:(int64_t)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathsForVisibleRows]);
  [v7 reloadRowsAtIndexPaths:v6 withRowAnimation:a3];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController encodeRestorableStateWithCoder:](&v3, "encodeRestorableStateWithCoder:", a3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTFetchedTableViewController;
  -[MTFetchedTableViewController decodeRestorableStateWithCoder:](&v4, "decodeRestorableStateWithCoder:", a3);
  -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
}

- (NSString)fetchEntityName
{
  return self->_fetchEntityName;
}

- (void)setFetchEntityName:(id)a3
{
}

- (NSPredicate)fetchPredicate
{
  return self->_fetchPredicate;
}

- (void)setFetchPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
}

- (int64_t)rowAnimation
{
  return self->_rowAnimation;
}

- (void)setRowAnimation:(int64_t)a3
{
  self->_rowAnimation = a3;
}

- (void)setFrc:(id)a3
{
}

- (BOOL)inSwipeToDeleteMode
{
  return self->_inSwipeToDeleteMode;
}

- (void)setInSwipeToDeleteMode:(BOOL)a3
{
  self->_inSwipeToDeleteMode = a3;
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (void)setSectionNameKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end