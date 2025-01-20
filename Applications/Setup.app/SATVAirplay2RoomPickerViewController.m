@interface SATVAirplay2RoomPickerViewController
- (NSArray)suggestedRooms;
- (SATVAirplay2DataSource)dataSource;
- (SATVAirplay2DataSourceObject)home;
- (SATVAirplay2RoomPickerViewController)initWithDataSource:(id)a3 home:(id)a4;
- (SATVAirplay2RoomPickerViewControllerDelegate)delegate;
- (TVSUITableViewDiffableDataSource)diffableDataSource;
- (id)_cellForRowAtIndexPath:(id)a3 itemIdentifier:(id)a4;
- (id)_existingRoomAtIndex:(unint64_t)a3;
- (id)_suggestedRoomAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)_updateTableViewAndAnimateChanges:(BOOL)a3;
- (void)airplay2DataSourceDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setSuggestedRooms:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVAirplay2RoomPickerViewController

- (SATVAirplay2RoomPickerViewController)initWithDataSource:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVAirplay2RoomPickerViewController;
  v9 = -[SATVPreviewTableViewController initWithStyle:](&v12, "initWithStyle:", 1LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVAirplay2RoomPickerViewController;
  -[SATVAirplay2RoomPickerViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];

  objc_initWeak(&location, self);
  id v8 = objc_alloc(&OBJC_CLASS___TVSUITableViewDiffableDataSource);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  objc_super v12 = sub_10002C7BC;
  v13 = &unk_1000C9DF0;
  objc_copyWeak(&v14, &location);
  v9 = -[TVSUITableViewDiffableDataSource initWithTableView:cellProvider:]( v8,  "initWithTableView:cellProvider:",  v3,  &v10);
  -[TVSUITableViewDiffableDataSource setDataSourceProxy:](v9, "setDataSourceProxy:", self, v10, v11, v12, v13);
  -[SATVAirplay2RoomPickerViewController setDiffableDataSource:](self, "setDiffableDataSource:", v9);
  -[SATVAirplay2RoomPickerViewController _updateTableViewAndAnimateChanges:]( self,  "_updateTableViewAndAnimateChanges:",  0LL);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2RoomPickerViewController;
  -[SATVPreviewTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController dataSource](self, "dataSource"));
  [v4 addObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2RoomPickerViewController;
  -[SATVAirplay2RoomPickerViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController dataSource](self, "dataSource"));
  [v4 removeObserver:self];
}

- (void)airplay2DataSourceDidUpdate:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController dataSource](self, "dataSource", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 homes]);
  if ([v4 count])
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController home](self, "home"));
    v6 = v5;
    if (v5)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10002C9BC;
      v9[3] = &unk_1000C9E18;
      id v10 = v5;
      if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v9) & 1) == 0)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController delegate](self, "delegate"));
        [v7 roomPickerViewControllerHomeHasBeenRemoved:self];
      }
    }

    -[SATVAirplay2RoomPickerViewController _updateTableViewAndAnimateChanges:]( self,  "_updateTableViewAndAnimateChanges:",  1LL);
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController diffableDataSource](self, "diffableDataSource", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshot]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sectionIdentifiers]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:a4]);
  if ([v9 isEqualToString:@"ExistingRooms"])
  {
    id v10 = sub_10000D7CC(@"WHA_ROOM_IN_HOME_TITLE_FORMAT", @"Localizable");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController home](self, "home"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v13));
  }

  else if ([v9 isEqualToString:@"SuggestedRooms"] {
         && [v8 containsObject:@"ExistingRooms"])
  }
  {
    id v15 = sub_10000D7CC(@"WHA_SUGGESTED_ROOMS_TITLE", @"Localizable");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 snapshot]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionIdentifiers]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v11, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController delegate](self, "delegate"));
  if ([v8 isEqualToString:@"ExistingRooms"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2RoomPickerViewController _existingRoomAtIndex:]( self,  "_existingRoomAtIndex:",  [v11 item]));
    [v9 roomPickerViewController:self didSelectExistingRoom:v10];
LABEL_5:

    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"SuggestedRooms"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2RoomPickerViewController _suggestedRoomAtIndex:]( self,  "_suggestedRoomAtIndex:",  [v11 item]));
    [v9 roomPickerViewController:self didSelectSuggestedRoom:v10];
    goto LABEL_5;
  }

- (id)_existingRoomAtIndex:(unint64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController home](self, "home"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 roomsForHome:v6]);

  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:a3]);
  }

  return v8;
}

- (id)_suggestedRoomAtIndex:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController suggestedRooms](self, "suggestedRooms"));
  else {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  }

  return v5;
}

- (id)_cellForRowAtIndexPath:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 snapshot]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sectionIdentifierForSectionContainingItemIdentifier:v7]);

  if ([v10 isEqualToString:@"ExistingRooms"])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2RoomPickerViewController _existingRoomAtIndex:]( self,  "_existingRoomAtIndex:",  [v6 item]));
LABEL_5:
    objc_super v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);

    goto LABEL_6;
  }

  if ([v10 isEqualToString:@"SuggestedRooms"])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2RoomPickerViewController _suggestedRoomAtIndex:]( self,  "_suggestedRoomAtIndex:",  [v6 item]));
    goto LABEL_5;
  }

  if ([v10 isEqualToString:@"AddRoom"])
  {
    id v21 = sub_10000D7CC(@"WHA_ADD_ROOM_BUTTON_TITLE", @"Localizable");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  else
  {
    v13 = 0LL;
  }

- (void)_updateTableViewAndAnimateChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SATVAirplay2RoomPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    BOOL v20 = v3;
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController home](self, "home"));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController dataSource](self, "dataSource"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 roomsForHome:v6]);
    }

    else
    {
      id v8 = 0LL;
    }

    if ([v8 count])
    {
      v24 = @"ExistingRooms";
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v9);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1000C9E38));
      -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v10,  @"ExistingRooms");
    }

    id v11 = sub_10002B4DC(v8);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[SATVAirplay2RoomPickerViewController setSuggestedRooms:](self, "setSuggestedRooms:", v12);
    v23 = @"SuggestedRooms";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bs_map:", &stru_1000C9E58));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v14));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 array]);
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v16,  @"SuggestedRooms");

    v22 = @"AddRoom";
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v17);

    id v21 = @"AddRoom";
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v18,  @"AddRoom");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2RoomPickerViewController diffableDataSource](self, "diffableDataSource"));
    [v19 applySnapshot:v5 animatingDifferences:v20 completion:0];
  }

- (SATVAirplay2DataSource)dataSource
{
  return self->_dataSource;
}

- (SATVAirplay2DataSourceObject)home
{
  return self->_home;
}

- (SATVAirplay2RoomPickerViewControllerDelegate)delegate
{
  return (SATVAirplay2RoomPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)suggestedRooms
{
  return self->_suggestedRooms;
}

- (void)setSuggestedRooms:(id)a3
{
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