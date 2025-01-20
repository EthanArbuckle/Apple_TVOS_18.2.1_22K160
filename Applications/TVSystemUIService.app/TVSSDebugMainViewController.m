@interface TVSSDebugMainViewController
- (TVSSDebugMainViewController)initWithDataSourceControllerOverlord:(id)a3 privacyController:(id)a4;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (TVSSPrivacyController)privacyController;
- (id)debugEntries;
@end

@implementation TVSSDebugMainViewController

- (TVSSDebugMainViewController)initWithDataSourceControllerOverlord:(id)a3 privacyController:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0LL;
  v10 = -[TVSSDebugListViewController initWithNibName:bundle:](v4, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataSourceControllerOverlord, location[0]);
    objc_storeStrong((id *)&v10->_privacyController, v8);
  }

  v6 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (id)debugEntries
{
  v21 = self;
  v20[1] = (id)a2;
  if (!qword_100221978)
  {
    v13 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry),  "initWithEntryTitle:viewControllerClass:",  @"Privacy Views",  objc_opt_class(&OBJC_CLASS___TVSSDebugPrivacyViewController));
    v23[0] = v13;
    v12 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry),  "initWithEntryTitle:viewControllerClass:",  @"Menu Items",  objc_opt_class(&OBJC_CLASS___TVSSMenuItemDebugViewController));
    v23[1] = v12;
    v11 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry),  "initWithEntryTitle:viewControllerClass:",  @"Providers",  objc_opt_class(&OBJC_CLASS___TVSSDebugAllProvidersViewController));
    v23[2] = v11;
    v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL);
    v3 = (void *)qword_100221978;
    qword_100221978 = (uint64_t)v2;

    v20[0] = -[TVSSDebugMainViewController dataSourceControllerOverlord](v21, "dataSourceControllerOverlord");
    if (v20[0])
    {
      id v8 = (void *)qword_100221978;
      v7 = objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry);
      v14 = _NSConcreteStackBlock;
      int v15 = -1073741824;
      int v16 = 0;
      v17 = sub_100031BFC;
      v18 = &unk_1001B6C68;
      id v19 = v20[0];
      v10 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerProvider:]( v7,  "initWithEntryTitle:viewControllerProvider:",  @"Overlord",  &v14);
      v22 = v10;
      v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL);
      id v4 = objc_msgSend(v8, "arrayByAddingObjectsFromArray:");
      v5 = (void *)qword_100221978;
      qword_100221978 = (uint64_t)v4;

      objc_storeStrong(&v19, 0LL);
    }

    objc_storeStrong(v20, 0LL);
  }

  return (id)qword_100221978;
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void).cxx_destruct
{
}

@end