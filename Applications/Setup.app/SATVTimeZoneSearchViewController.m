@interface SATVTimeZoneSearchViewController
- (NSArray)cities;
- (NSString)searchString;
- (SATVTimeZoneSearchViewControllerDelegate)searchDelegate;
- (UIFocusGuide)focusGuide;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateMatches;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setCities:(id)a3;
- (void)setFocusGuide:(id)a3;
- (void)setSearchDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SATVTimeZoneSearchViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SATVTimeZoneSearchViewController;
  -[SATVTimeZoneSearchViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController tableView](self, "tableView"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS____SATVTimeZoneTableViewCell, v4);
  v7 = (objc_class *)objc_opt_class(&OBJC_CLASS____SATVTimeZoneTableViewCell, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 registerClass:v5 forCellReuseIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setContentInset:", 12.0, 0.0, 0.0, 0.0);

  v11 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  -[SATVTimeZoneSearchViewController setFocusGuide:](self, "setFocusGuide:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController focusGuide](self, "focusGuide"));
  v14 = v13;
  if (v12)
  {
    v19 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    [v14 setPreferredFocusEnvironments:v15];
  }

  else
  {
    [v13 setPreferredFocusEnvironments:&__NSArray0__struct];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController focusGuide](self, "focusGuide"));
  [v16 addLayoutGuide:v17];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVTimeZoneSearchViewController;
  -[SATVTimeZoneSearchViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController focusGuide](self, "focusGuide"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController view](self, "view"));
  [v4 bounds];
  objc_msgSend(v3, "_setManualLayoutFrame:");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVTimeZoneSearchViewController;
  -[SATVTimeZoneSearchViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedView]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController view](self, "view"));
  unsigned int v8 = [v6 isDescendantOfView:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController focusGuide](self, "focusGuide"));
  if (v8) {
    [v9 removeLayoutGuide:v10];
  }
  else {
    [v9 addLayoutGuide:v10];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController cities](self, "cities", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (objc_class *)objc_opt_class(&OBJC_CLASS____SATVTimeZoneTableViewCell, v8);
  v10 = NSStringFromClass(v9);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController cities](self, "cities"));
  id v14 = [v6 row];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v14]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 displayNameIncludingCountry:1]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 textLabel]);
  [v17 setText:v16];

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v12 textLabel]);
  [v18 setTextAlignment:1];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 timeZone]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v19));

  else {
    uint64_t v21 = 0LL;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedName:v21 locale:v22]);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v12 detailTextLabel]);
  [v24 setText:v23];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v12 detailTextLabel]);
  [v25 setTextAlignment:1];

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 98.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_cities,  "objectAtIndexedSubscript:",  objc_msgSend(a4, "row", a3)));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController searchDelegate](self, "searchDelegate"));
  [v5 viewController:self didSelectCity:v6];
}

- (void)setSearchString:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  searchString = self->_searchString;
  self->_searchString = v4;

  -[SATVTimeZoneSearchViewController _updateMatches](self, "_updateMatches");
}

- (void)_updateMatches
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](&OBJC_CLASS___ALCityManager, "sharedManager"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 citiesMatchingName:self->_searchString localized:1]);

  -[SATVTimeZoneSearchViewController setCities:](self, "setCities:", v5);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneSearchViewController tableView](self, "tableView"));
  [v4 reloadData];
}

- (NSString)searchString
{
  return self->_searchString;
}

- (SATVTimeZoneSearchViewControllerDelegate)searchDelegate
{
  return (SATVTimeZoneSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_searchDelegate);
}

- (void)setSearchDelegate:(id)a3
{
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end