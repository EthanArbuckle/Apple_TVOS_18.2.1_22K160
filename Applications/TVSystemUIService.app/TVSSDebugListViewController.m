@interface TVSSDebugListViewController
- (Class)cellClass;
- (TVSSDebugListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)tableView;
- (id)debugEntries;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 withEntry:(id)a4;
- (void)didSelectDebugEntry:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVSSDebugListViewController

- (TVSSDebugListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS___TVSSDebugListViewController;
  v11 = -[TVSSDebugListViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", location[0], v9);
  objc_storeStrong((id *)&v11, v11);
  v6 = v11;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v6;
}

- (void)viewDidLoad
{
  v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSSDebugListViewController;
  -[TVSSDebugListViewController viewDidLoad](&v18, "viewDidLoad");
  id v17 = -[TVSSDebugListViewController view](v20, "view");
  v2 = objc_alloc_init(&OBJC_CLASS___UITableView);
  tableView = v20->_tableView;
  v20->_tableView = v2;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:]( v20->_tableView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UITableView registerClass:forCellReuseIdentifier:]( v20->_tableView,  "registerClass:forCellReuseIdentifier:",  -[TVSSDebugListViewController cellClass](v20, "cellClass"),  @"cell");
  -[UITableView setDelegate:](v20->_tableView, "setDelegate:", v20);
  -[UITableView setDataSource:](v20->_tableView, "setDataSource:", v20);
  -[UITableView setContentInset:]( v20->_tableView,  "setContentInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  [v17 addSubview:v20->_tableView];
  id v16 = -[UITableView leadingAnchor](v20->_tableView, "leadingAnchor");
  id v15 = [v17 leadingAnchor];
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v21[0] = v14;
  id v13 = -[UITableView trailingAnchor](v20->_tableView, "trailingAnchor");
  id v12 = [v17 trailingAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v21[1] = v11;
  id v10 = -[UITableView topAnchor](v20->_tableView, "topAnchor");
  id v9 = [v17 topAnchor];
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v21[2] = v8;
  id v7 = -[UITableView bottomAnchor](v20->_tableView, "bottomAnchor");
  id v6 = [v17 bottomAnchor];
  id v5 = objc_msgSend(v7, "constraintEqualToAnchor:");
  v21[3] = v5;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&v17, 0LL);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSDebugListViewController debugEntries](v8, "debugEntries");
  id v6 = [v5 count];

  objc_storeStrong(location, 0LL);
  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = [location[0] dequeueReusableCellWithIdentifier:@"cell"];
  id v6 = -[TVSSDebugListViewController debugEntries](v12, "debugEntries");
  id v8 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "row"));

  -[TVSSDebugListViewController configureCell:withEntry:](v12, "configureCell:withEntry:", v9, v8);
  id v7 = v9;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  id v5 = -[TVSSDebugListViewController debugEntries](v9, "debugEntries");
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v7, "row"));

  -[TVSSDebugListViewController didSelectDebugEntry:](v9, "didSelectDebugEntry:", v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)debugEntries
{
  return &__NSArray0__struct;
}

- (Class)cellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UITableViewCell);
}

- (void)configureCell:(id)a3 withEntry:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = [location[0] textLabel];
  id v5 = v7;
  id v6 = [v8 title];
  objc_msgSend(v5, "setText:");

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didSelectDebugEntry:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = (uint64_t (**)(void))[location[0] viewControllerProvider];
  id v4 = (id)v3[2]();

  -[TVSSDebugListViewController showViewController:sender:](v6, "showViewController:sender:", v4, v6);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end