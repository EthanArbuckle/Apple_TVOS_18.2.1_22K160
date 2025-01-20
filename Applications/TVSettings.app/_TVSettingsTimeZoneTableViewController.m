@interface _TVSettingsTimeZoneTableViewController
- (NSArray)cities;
- (NSString)searchString;
- (UITableView)tableView;
- (_TVSettingsTimeZoneTableViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateMatches;
- (void)setDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _TVSettingsTimeZoneTableViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____TVSettingsTimeZoneTableViewController;
  -[_TVSettingsTimeZoneTableViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UITableView);
  tableView = self->_tableView;
  self->_tableView = v3;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView registerClass:forCellReuseIdentifier:]( self->_tableView,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(&OBJC_CLASS____TVSettingsTimeZoneTableViewCell),  @"TVSettingsTimeZoneTableViewCellIdentifier");
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:]( self->_tableView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController view](self, "view"));
  [v5 addSubview:self->_tableView];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  [v8 setActive:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 bottomAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
  [v11 setActive:1];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 leadingAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
  [v14 setActive:1];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 trailingAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v16]);
  [v17 setActive:1];
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____TVSettingsTimeZoneTableViewController;
  -[_TVSettingsTimeZoneTableViewController viewDidLayoutSubviews](&v22, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  -[UITableView _sectionContentInset](self->_tableView, "_sectionContentInset");
  double v13 = v12;
  double v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController view](self, "view"));
  [v16 safeAreaInsets];
  double v18 = v17;
  double v20 = v19;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  CGFloat Width = CGRectGetWidth(v23);
  -[UITableView _setSectionContentInset:]( self->_tableView,  "_setSectionContentInset:",  v13,  (Width + -760.0) * 0.5 - v18,  v15,  (Width + -760.0) * 0.5 - v20);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVSettingsTimeZoneTableViewController;
  -[_TVSettingsTimeZoneTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_acceptsUpdates = 1;
  -[_TVSettingsTimeZoneTableViewController _updateMatches](self, "_updateMatches");
}

- (void)setSearchString:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];
  searchString = self->_searchString;
  self->_searchString = v4;

  -[_TVSettingsTimeZoneTableViewController _updateMatches](self, "_updateMatches");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_cities, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"TVSettingsTimeZoneTableViewCellIdentifier" forIndexPath:v6]);
  cities = self->_cities;
  id v9 = [v6 row];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](cities, "objectAtIndexedSubscript:", v9));
  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayNameIncludingCountry:1]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v12 setText:v11];

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 timeZone]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v13));

  else {
    uint64_t v15 = 0LL;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedName:v15 locale:v16]);

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v7 detailTextLabel]);
  [v18 setText:v17];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 98.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_cities,  "objectAtIndexedSubscript:",  objc_msgSend(a4, "row", a3)));
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController delegate](self, "delegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 classicIdentifier]);
  [v5 timeZoneTableViewController:self didSelectCityWithIdentifier:v6];
}

- (void)_updateMatches
{
  if (self->_acceptsUpdates)
  {
    cities = self->_cities;
    if (!cities) {
      cities = (NSArray *)&__NSArray0__struct;
    }
    objc_super v4 = cities;
    CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](&OBJC_CLASS___ALCityManager, "sharedManager"));
    id v13 = (id)objc_claimAutoreleasedReturnValue([v5 citiesMatchingName:self->_searchString]);

    id v6 = (NSArray *)[v13 copy];
    id v7 = self->_cities;
    self->_cities = v6;

    id v8 = objc_alloc_init(&OBJC_CLASS___TSKCollectionComparator);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 changesFromObjects:v4 toObjects:self->_cities withIdentifierBlock:&stru_10018EEA8]);

    if ([v9 count])
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController tableView](self, "tableView"));
      [v10 beginUpdates];

      CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController tableView](self, "tableView"));
      objc_msgSend(v11, "tsk_updateItemsInSection:withChanges:", 0, v9);

      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController tableView](self, "tableView"));
      [v12 endUpdates];
    }
  }

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (_TVSettingsTimeZoneTableViewControllerDelegate)delegate
{
  return (_TVSettingsTimeZoneTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)cities
{
  return self->_cities;
}

- (void).cxx_destruct
{
}

@end