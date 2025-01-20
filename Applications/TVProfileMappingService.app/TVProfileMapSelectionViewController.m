@interface TVProfileMapSelectionViewController
- (NSArray)profiles;
- (NSString)app;
- (NSString)user;
- (TVProfileMapSelectionViewController)initWithProfiles:(id)a3 user:(id)a4 app:(id)a5;
- (TVSUITextAlertController)alertController;
- (id)preferredFocusEnvironments;
- (id)selectedProfileIndex;
- (void)setAlertController:(id)a3;
- (void)setApp:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setSelectedProfileIndex:(id)a3;
- (void)setUser:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVProfileMapSelectionViewController

- (TVProfileMapSelectionViewController)initWithProfiles:(id)a3 user:(id)a4 app:(id)a5
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v5 = v14;
  v14 = 0LL;
  v10.receiver = v5;
  v10.super_class = (Class)&OBJC_CLASS___TVProfileMapSelectionViewController;
  v14 = -[TVProfileMapSelectionViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)&v14->_profiles, location[0]);
    objc_storeStrong((id *)&v14->_user, v12);
    objc_storeStrong((id *)&v14->_app, v11);
  }

  v7 = v14;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v7;
}

- (void)viewDidLoad
{
  v40 = self;
  SEL v39 = a2;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___TVProfileMapSelectionViewController;
  -[TVProfileMapSelectionViewController viewDidLoad](&v38, "viewDidLoad");
  v15 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v14 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"MappingSelectionDialogTitle");
  id v37 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40->_user);

  v17 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v16 =  -[NSBundle localizedStringForKey:value:table:]( v17,  "localizedStringForKey:value:table:",  @"MappingSelectionDialogSubtitle",  &stru_1000084D0,  0LL);
  id v36 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40->_app);

  v35 = -[TVSUITextAlertController initWithTitle:text:]( objc_alloc(&OBJC_CLASS___TVSUITextAlertController),  "initWithTitle:text:",  v37,  v36);
  -[TVSUITextAlertController setShouldDismissAutomatically:](v35, "setShouldDismissAutomatically:", 0LL);
  id v34 = -[TVProfileMapSelectionViewController selectedProfileIndex](v40, "selectedProfileIndex");
  for (i = 0LL; ; ++i)
  {
    unint64_t v13 = (unint64_t)i;
    if (v13 >= -[NSArray count](v40->_profiles, "count")) {
      break;
    }
    id v32 = -[NSArray objectAtIndexedSubscript:](v40->_profiles, "objectAtIndexedSubscript:", i);
    id v12 = [v32 name];
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_100001FB0;
    v29 = &unk_100008148;
    v30[0] = v34;
    v30[1] = i;
    v31 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v12,  0LL,  &v25);

    -[TVSUITextAlertController addButton:](v35, "addButton:", v31);
    objc_storeStrong((id *)&v31, 0LL);
    objc_storeStrong(v30, 0LL);
    objc_storeStrong(&v32, 0LL);
  }

  -[TVSUITextAlertController addSectionWithTitle:](v35, "addSectionWithTitle:");
  v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"MappingSelectionDialogNoProfileOption",  &stru_1000084D0,  0LL);
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_100002018;
  v22 = &unk_100008170;
  id v23 = v34;
  v24 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v6,  0LL,  &v18);

  -[TVSUITextAlertController addButton:](v35, "addButton:", v24);
  -[TVProfileMapSelectionViewController addChildViewController:](v40, "addChildViewController:", v35);
  id v9 = -[TVSUITextAlertController view](v35, "view");
  id v8 = -[TVProfileMapSelectionViewController view](v40, "view");
  [v8 bounds];
  objc_msgSend(v9, "setFrame:", v2, v3, v4, v5);

  id v11 = -[TVProfileMapSelectionViewController view](v40, "view");
  id v10 = -[TVSUITextAlertController view](v35, "view");
  objc_msgSend(v11, "addSubview:");

  -[TVSUITextAlertController didMoveToParentViewController:](v35, "didMoveToParentViewController:", v40);
  objc_storeStrong((id *)&v40->_alertController, v35);
  objc_storeStrong((id *)&v24, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong((id *)&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
}

- (id)preferredFocusEnvironments
{
  alertController = self->_alertController;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &alertController, 1LL);
}

- (id)selectedProfileIndex
{
  return self->_selectedProfileIndex;
}

- (void)setSelectedProfileIndex:(id)a3
{
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSString)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (TVSUITextAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end