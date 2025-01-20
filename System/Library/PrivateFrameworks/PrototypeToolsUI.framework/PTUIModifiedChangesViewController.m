@interface PTUIModifiedChangesViewController
- (BOOL)_canShowWhileLocked;
- (PTUIModifiedChangesViewController)initWithParameterRecords:(id)a3 withTitle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_populateTableDataAndChildren;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PTUIModifiedChangesViewController

- (void)_populateTableDataAndChildren
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  tableData = self->_tableData;
  self->_tableData = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  children = self->_children;
  self->_children = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecords recordDictionary](self->_parameterRecords, "recordDictionary"));
  id v21 = (id)objc_claimAutoreleasedReturnValue([v7 allKeys]);

  if ([v21 count])
  {
    unint64_t v8 = 0LL;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecords recordDictionary](self->_parameterRecords, "recordDictionary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

      v12 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v9, 0LL);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      {
        while (1)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
          id v15 = [v14 count];

          if (v15 != (id)1) {
            break;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

          -[NSMutableArray addObject:](v12, "addObject:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v17]);

          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
          v11 = v18;
          if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0) {
            goto LABEL_8;
          }
        }
      }

      v18 = v11;
LABEL_8:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v12, "componentsJoinedByString:", @"."));
      -[NSMutableArray addObject:](self->_tableData, "addObject:", v20);
      -[NSMutableArray addObject:](self->_children, "addObject:", v18);

      ++v8;
    }

    while ((unint64_t)[v21 count] > v8);
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PTUIModifiedChangesViewController;
  -[PTUIModifiedChangesViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTUIModifiedChangesViewController view](self, "view"));
  [v4 bounds];
  v5 = -[UITableView initWithFrame:style:](v3, "initWithFrame:style:", 1LL);

  -[UITableView registerClass:forCellReuseIdentifier:]( v5,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___UITableViewCell),  @"ParameterRecordStandardCell");
  -[UITableView setDelegate:](v5, "setDelegate:", self);
  -[UITableView setDataSource:](v5, "setDataSource:", self);
  -[UITableView reloadData](v5, "reloadData");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTUIModifiedChangesViewController view](self, "view"));
  [v6 addSubview:v5];
}

- (PTUIModifiedChangesViewController)initWithParameterRecords:(id)a3 withTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PTUIModifiedChangesViewController;
  v9 = -[PTUIModifiedChangesViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterRecords, a3);
    -[PTUIModifiedChangesViewController _populateTableDataAndChildren](v10, "_populateTableDataAndChildren");
    -[PTUIModifiedChangesViewController setTitle:](v10, "setTitle:", v8);
  }

  return v10;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0LL;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", [v6 row]));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", [v6 row]));
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      [v13 deselectRowAtIndexPath:v6 animated:1];
      v10 = -[PTParameterRecords initWithDictionary:]( objc_alloc(&OBJC_CLASS___PTParameterRecords),  "initWithDictionary:",  v8);
      v11 = -[PTUIModifiedChangesViewController initWithParameterRecords:withTitle:]( objc_alloc(&OBJC_CLASS___PTUIModifiedChangesViewController),  "initWithParameterRecords:withTitle:",  v10,  v7);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTUIModifiedChangesViewController navigationController](self, "navigationController"));
      [v12 pushViewController:v11 animated:1];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = (int64_t)-[NSMutableArray count](self->_tableData, "count", a3, a4);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableCellWithIdentifier:@"ParameterRecordStandardCell"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultContentConfiguration]);
  if (-[NSMutableArray count](self->_tableData, "count"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", [v6 row]));
    [v8 setText:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", [v6 row]));
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      [v7 setAccessoryType:1];
    }

    else
    {
      [v7 setSelectionStyle:0];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v10 changedValue]);
      [v12 doubleValue];
      uint64_t v14 = v13;

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.3f", v14));
      [v8 setSecondaryText:v15];
    }
  }

  else
  {
    [v8 setText:@"Hey there! 👋 It looks like you haven't changed any parameters from their default values in this prototyping session.\n\nAny settings changes that you make will eventually be viewable here. Feel free to consult this section later whenever you're curious about how your new settings differ from default settings. 😊"];
  }

  [v7 setContentConfiguration:v8];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end