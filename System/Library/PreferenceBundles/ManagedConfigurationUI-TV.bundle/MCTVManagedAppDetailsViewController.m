@interface MCTVManagedAppDetailsViewController
- (DMCProfileViewModel)profileViewModel;
- (LSApplicationProxy)managedAppProxy;
- (MCTVManagedAppDetailsViewController)initWithProfileViewModel:(id)a3 managedAppID:(id)a4;
- (UIViewController)appIconPreviewViewController;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_profileChanged:(id)a3;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation MCTVManagedAppDetailsViewController

- (MCTVManagedAppDetailsViewController)initWithProfileViewModel:(id)a3 managedAppID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCTVManagedAppDetailsViewController;
  v9 = -[MCTVManagedAppDetailsViewController initWithStyle:](&v16, "initWithStyle:", 1LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profileViewModel, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v8));
    managedAppProxy = v10->_managedAppProxy;
    v10->_managedAppProxy = (LSApplicationProxy *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationProxy localizedName](v10->_managedAppProxy, "localizedName"));
    -[MCTVManagedAppDetailsViewController setTitle:](v10, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v10 selector:"_profileChanged:" name:@"kMCUIProfileDidChangeNotification" object:0];
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"kMCUIProfileDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVManagedAppDetailsViewController;
  -[MCTVManagedAppDetailsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCTVManagedAppDetailsViewController;
  -[MCTVManagedAppDetailsViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVManagedAppDetailsViewController tableView](self, "tableView"));
  [v3 setRowHeight:UITableViewAutomaticDimension];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVManagedAppDetailsViewController tableView](self, "tableView"));
  [v4 setEstimatedRowHeight:200.0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVManagedAppDetailsViewController tableView](self, "tableView"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
  id v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
  id v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 registerClass:v6 forCellReuseIdentifier:v9];
}

- (void)_profileChanged:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"kMCUIManagedAppsDidChange"]);
    unsigned __int8 v8 = [v7 BOOLValue];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_B208;
  block[3] = &unk_289B8;
  objc_copyWeak(&v10, &location);
  unsigned __int8 v11 = v8;
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  0LL,  0LL,  self->_managedAppProxy,  0LL));
  [v2 setCanFocus:0];
  id v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v3));
  unsigned __int8 v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v5;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  appIconPreviewViewController = self->_appIconPreviewViewController;
  if (!appIconPreviewViewController)
  {
    v5 = objc_alloc(&OBJC_CLASS___UIImageView);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationProxy tv_applicationFlatIcon](self->_managedAppProxy, "tv_applicationFlatIcon"));
    id v7 = -[UIImageView initWithImage:](v5, "initWithImage:", v6);

    -[UIImageView setBounds:](v7, "setBounds:", 0.0, 0.0, 370.0, 222.0);
    unsigned __int8 v8 = (UIViewController *)objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    -[UIViewController setContentView:](v8, "setContentView:", v7);
    v9 = self->_appIconPreviewViewController;
    self->_appIconPreviewViewController = v8;

    appIconPreviewViewController = self->_appIconPreviewViewController;
  }

  return appIconPreviewViewController;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVManagedAppDetailsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v25 representedObject]);
  id v8 = [[DMCApplicationProxy alloc] initWithLSApplicationProxy:v24 dataSource:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMCManagedMediaDetailsCell localizedManagedAppRestrictionsTitle]( &OBJC_CLASS___DMCManagedMediaDetailsCell,  "localizedManagedAppRestrictionsTitle"));
  id v10 = objc_alloc(&OBJC_CLASS___MCKeyValue);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 managedAppConfigurationInfo]);
  v12 = -[MCKeyValue initWithValue:localizedKey:](v10, "initWithValue:localizedKey:", v11, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue key](v12, "key"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue key](v12, "key"));
    v27 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  }

  else
  {
    v15 = 0LL;
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue value](v12, "value"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCKeyValue value](v12, "value"));
    v26 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  }

  else
  {
    v18 = 0LL;
  }

  v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVTitleValueSummaryCell);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v21 forIndexPath:v6]);

  [v22 setSummaryTitles:v15 withValues:v18];
  return v22;
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (UIViewController)appIconPreviewViewController
{
  return self->_appIconPreviewViewController;
}

- (LSApplicationProxy)managedAppProxy
{
  return self->_managedAppProxy;
}

- (void).cxx_destruct
{
}

@end