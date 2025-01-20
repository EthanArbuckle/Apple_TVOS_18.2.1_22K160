@interface TVProfileMappingViewController
- (NSArray)profiles;
- (NSArray)users;
- (NSMutableDictionary)map;
- (NSString)appName;
- (TVProfileMappingViewController)initWithMap:(id)a3 allProfiles:(id)a4 allUsers:(id)a5 appName:(id)a6;
- (TVProfileMappingViewControllerDelegate)delegate;
- (TVSUITextAlertController)alertController;
- (id)preferredFocusEnvironments;
- (void)setAlertController:(id)a3;
- (void)setAppName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMap:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setUsers:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVProfileMappingViewController

- (TVProfileMappingViewController)initWithMap:(id)a3 allProfiles:(id)a4 allUsers:(id)a5 appName:(id)a6
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = 0LL;
  objc_storeStrong(&v28, a4);
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  id v26 = 0LL;
  objc_storeStrong(&v26, a6);
  v6 = v30;
  v30 = 0LL;
  v25.receiver = v6;
  v25.super_class = (Class)&OBJC_CLASS___TVProfileMappingViewController;
  v30 = -[TVProfileMappingViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v30, v30);
  if (v30)
  {
    objc_storeStrong((id *)&v30->_profiles, v28);
    v7 = (NSMutableDictionary *)[location[0] mutableCopy];
    map = v30->_map;
    v30->_map = v7;

    objc_storeStrong((id *)&v30->_appName, v26);
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v13 = v27;
    v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    v20 = sub_100003658;
    v21 = &unk_100008440;
    v22 = v30;
    v23 = v24;
    [v13 enumerateKeysAndObjectsUsingBlock:&v17];
    v9 = (NSArray *)-[NSMutableArray copy](v24, "copy");
    users = v30->_users;
    v30->_users = v9;

    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
    objc_storeStrong((id *)&v24, 0LL);
  }

  v12 = v30;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  return v12;
}

- (void)viewDidLoad
{
  v58 = self;
  SEL v57 = a2;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___TVProfileMappingViewController;
  -[TVProfileMappingViewController viewDidLoad](&v56, "viewDidLoad");
  v29 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v28 =  -[NSBundle localizedStringForKey:value:table:]( v29,  "localizedStringForKey:value:table:",  @"MappingDialogTitle");
  id v55 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v58->_appName);

  v31 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v30 =  -[NSBundle localizedStringForKey:value:table:]( v31,  "localizedStringForKey:value:table:",  @"MappingDialogSubtitle",  &stru_1000084D0,  0LL);
  id v54 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v58->_appName);

  v53 = -[TVSUITextAlertController initWithTitle:text:]( objc_alloc(&OBJC_CLASS___TVSUITextAlertController),  "initWithTitle:text:",  v55,  v54);
  -[TVSUITextAlertController setShouldDismissAutomatically:](v53, "setShouldDismissAutomatically:", 0LL);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v27 = i;
    if (v27 >= -[NSArray count](v58->_users, "count")) {
      break;
    }
    id v51 = [[TVSUITextAlertButton alloc] initWithType:4];
    id v50 = -[NSArray objectAtIndexedSubscript:](v58->_users, "objectAtIndexedSubscript:", i);
    objc_super v25 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    id v49 =  -[NSBundle localizedStringForKey:value:table:]( v25,  "localizedStringForKey:value:table:",  @"MappingDialogNoProfileTitle",  &stru_1000084D0,  0LL);

    id v2 = [v50 assignedProfileIndex];
    BOOL v26 = v2 == 0LL;

    if (!v26)
    {
      id v20 = [v50 assignedProfileIndex];
      id v21 = [v20 integerValue];

      v48[1] = v21;
      v48[0] = -[NSArray objectAtIndexedSubscript:](v58->_profiles, "objectAtIndexedSubscript:", v21);
      v24 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v23 =  -[NSBundle localizedStringForKey:value:table:]( v24,  "localizedStringForKey:value:table:",  @"ProfileNameTitle",  &stru_1000084D0);
      id v22 = [v48[0] name];
      v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v22);
      id v4 = v49;
      id v49 = v3;

      objc_storeStrong(v48, 0LL);
    }

    id v17 = v51;
    id v18 = [v50 name];
    objc_msgSend(v17, "setTitle:");

    [v51 setDetailText:v49];
    objc_initWeak(&v47, v51);
    id v19 = v51;
    v39 = _NSConcreteStackBlock;
    int v40 = -1073741824;
    int v41 = 0;
    v42 = sub_100003F88;
    v43 = &unk_100008490;
    objc_copyWeak(&v46, &v47);
    v44 = v58;
    id v45 = v50;
    [v19 setSelectHandler:&v39];
    -[TVSUITextAlertController addButton:](v53, "addButton:", v51);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong((id *)&v44, 0LL);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v47);
    objc_storeStrong(&v49, 0LL);
    objc_storeStrong(&v50, 0LL);
    objc_storeStrong(&v51, 0LL);
  }

  -[TVSUITextAlertController addSectionWithTitle:](v53, "addSectionWithTitle:");
  id v38 = [[TVSUITextAlertButton alloc] initWithType:2];
  id v9 = v38;
  v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"MappingDialogSaveButton",  &stru_1000084D0,  0LL);
  objc_msgSend(v9, "setTitle:animated:");

  id v12 = v38;
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_1000044D8;
  v36 = &unk_100008418;
  v37 = v58;
  [v12 setSelectHandler:&v32];
  -[TVSUITextAlertController addButton:](v53, "addButton:", v38);
  -[TVProfileMappingViewController addChildViewController:](v58, "addChildViewController:", v53);
  id v14 = -[TVSUITextAlertController view](v53, "view");
  id v13 = -[TVProfileMappingViewController view](v58, "view");
  [v13 bounds];
  objc_msgSend(v14, "setFrame:", v5, v6, v7, v8);

  id v16 = -[TVProfileMappingViewController view](v58, "view");
  id v15 = -[TVSUITextAlertController view](v53, "view");
  objc_msgSend(v16, "addSubview:");

  -[TVSUITextAlertController didMoveToParentViewController:](v53, "didMoveToParentViewController:", v58);
  objc_storeStrong((id *)&v58->_alertController, v53);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong((id *)&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(&v55, 0LL);
}

- (id)preferredFocusEnvironments
{
  alertController = self->_alertController;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &alertController, 1LL);
}

- (TVProfileMappingViewControllerDelegate)delegate
{
  return (TVProfileMappingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
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