@interface TVSettingsTimeZoneEditingViewController
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (UISearchController)searchController;
- (UIViewController)containerViewController;
- (_TVSettingsTimeZoneTableViewController)tableViewController;
- (id)_gradientMask;
- (void)didDismissSearchController:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)timeZoneTableViewController:(id)a3 didSelectCityWithIdentifier:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willDismissSearchController:(id)a3;
@end

@implementation TVSettingsTimeZoneEditingViewController

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVSettingsTimeZoneEditingViewController;
  -[TVSettingsTimeZoneEditingViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController _gradientMask](self, "_gradientMask"));
  [v4 setMask:v5];

  v6 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  containerViewController = self->_containerViewController;
  self->_containerViewController = v6;

  -[TVSettingsTimeZoneEditingViewController addChildViewController:]( self,  "addChildViewController:",  self->_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController view](self, "view"));
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v8, "setFrame:", v11, 130.0, v13, v15 + -130.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController view](self, "view"));
  [v16 addSubview:v8];

  -[UIViewController didMoveToParentViewController:]( self->_containerViewController,  "didMoveToParentViewController:",  self);
  v17 = objc_alloc_init(&OBJC_CLASS____TVSettingsTimeZoneTableViewController);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v17;

  -[_TVSettingsTimeZoneTableViewController setDelegate:](self->_tableViewController, "setDelegate:", self);
  -[UIViewController addChildViewController:]( self->_containerViewController,  "addChildViewController:",  self->_tableViewController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController view](self->_tableViewController, "view"));
  [v19 addSubview:v20];

  -[_TVSettingsTimeZoneTableViewController didMoveToParentViewController:]( self->_tableViewController,  "didMoveToParentViewController:",  self->_containerViewController);
  v21 = -[UISearchController initWithSearchResultsController:]( objc_alloc(&OBJC_CLASS___UISearchController),  "initWithSearchResultsController:",  self->_tableViewController);
  searchController = self->_searchController;
  self->_searchController = v21;

  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
  -[UISearchController setDimsBackgroundDuringPresentation:]( self->_searchController,  "setDimsBackgroundDuringPresentation:",  0LL);
  -[UISearchController setHidesNavigationBarDuringPresentation:]( self->_searchController,  "setHidesNavigationBarDuringPresentation:",  0LL);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  v23 = self->_searchController;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewController tableView](self->_tableViewController, "tableView"));
  -[UISearchController setTabBarObservedScrollView:](v23, "setTabBarObservedScrollView:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedValue](self->_editingItem, "localizedValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
  [v26 setText:v25];

  -[_TVSettingsTimeZoneTableViewController setSearchString:](self->_tableViewController, "setSearchString:", v25);
  -[UIViewController setDefinesPresentationContext:]( self->_containerViewController,  "setDefinesPresentationContext:",  1LL);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsTimeZoneEditingViewController;
  -[TVSettingsTimeZoneEditingViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if (!self->_searchControllerPresented)
  {
    -[UISearchController setActive:](self->_searchController, "setActive:", 1LL);
    -[UIViewController presentViewController:animated:completion:]( self->_containerViewController,  "presentViewController:animated:completion:",  self->_searchController,  0LL,  0LL);
    self->_searchControllerPresented = 1;
  }

- (void)willDismissSearchController:(id)a3
{
}

- (void)didDismissSearchController:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController navigationController](self, "navigationController"));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  tableViewController = self->_tableViewController;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 searchBar]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
  -[_TVSettingsTimeZoneTableViewController setSearchString:](tableViewController, "setSearchString:", v4);
}

- (void)timeZoneTableViewController:(id)a3 didSelectCityWithIdentifier:(id)a4
{
  p_editingDelegate = &self->_editingDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_editingDelegate);
  [WeakRetained editingController:self didProvideValue:v6 forSettingItem:self->_editingItem];
}

- (id)_gradientMask
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTimeZoneEditingViewController view](self, "view"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  id v12 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
  v24[0] = [v12 CGColor];
  id v13 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
  v24[1] = [v13 CGColor];
  id v14 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  v24[2] = [v14 CGColor];
  id v15 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  v24[3] = [v15 CGColor];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
  [v11 setColors:v16];

  v23[0] = &off_1001AF730;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v17 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 105.0 / CGRectGetHeight(v25));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v23[1] = v18;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v19 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 155.0 / CGRectGetHeight(v26));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v23[2] = v20;
  v23[3] = &off_1001AF740;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL));
  [v11 setLocations:v21];

  return v11;
}

- (TSKSettingItem)editingItem
{
  return self->_editingItem;
}

- (void)setEditingItem:(id)a3
{
}

- (TSKSettingItemEditingControllerDelegate)editingDelegate
{
  return (TSKSettingItemEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (_TVSettingsTimeZoneTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end