@interface TVUPSGroupRecommendationsPickerViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_userNeedsToConsentWithIdentifier:(id)a3;
- (BOOL)isUpdating;
- (BOOL)userPickerViewController:(id)a3 shouldDeselectUserWithIdentifier:(id)a4;
- (BOOL)userPickerViewController:(id)a3 shouldSelectUserWithIdentifier:(id)a4;
- (TVSUIGroupRecommendationsPickerDataSource)dataSource;
- (UINavigationController)presentationController;
- (id)userPickerViewController:(id)a3 descriptionForUserWithIdentifier:(id)a4;
- (void)_dismiss;
- (void)_menuPressed:(id)a3;
- (void)_showConsentDialogWithUserIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setPresentationController:(id)a3;
- (void)userPickerViewController:(id)a3 didDeselectUserWithIdentifier:(id)a4;
- (void)userPickerViewController:(id)a3 didFinishWithSelectedUserIdentifiers:(id)a4;
- (void)userPickerViewController:(id)a3 didSelectUserWithIdentifier:(id)a4;
- (void)userPickerViewControllerHandleAddNewUserAction:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVUPSGroupRecommendationsPickerViewController

- (void)_menuPressed:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!v7->_isUpdating)
  {
    v4 = -[UINavigationController viewControllers](v7->_presentationController, "viewControllers");
    BOOL v5 = (id)-[NSArray count](v4, "count") != (id)1;

    if (v5) {
      id v3 =  -[UINavigationController popViewControllerAnimated:]( v7->_presentationController,  "popViewControllerAnimated:",  1LL);
    }
    else {
      -[TVUPSGroupRecommendationsPickerViewController _dismiss](v7, "_dismiss");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_dismiss
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] =  -[TVUPSGroupRecommendationsPickerViewController _remoteViewControllerProxy]( self,  "_remoteViewControllerProxy");
  objc_msgSend(v2[0], "dismissWithResult:");
  objc_storeStrong(v2, 0LL);
}

- (BOOL)_userNeedsToConsentWithIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v5 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v4 = -[PBSUserProfileManager userProfilesSnapshot](v5, "userProfilesSnapshot");
  id v7 = [v4 userProfileWithIdentifier:location[0]];

  BOOL v6 = [v7 groupRecommendationsConsent] != (id)1;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)_showConsentDialogWithUserIdentifier:(id)a3 animated:(BOOL)a4
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v29 = a4;
  v8 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v7 = -[PBSUserProfileManager userProfilesSnapshot](v8, "userProfilesSnapshot");
  id v28 = [v7 selectedUserProfileIdentifier];

  char v27 = [location[0] isEqual:v28] & 1;
  id v4 = objc_alloc(&OBJC_CLASS___TVUPSGroupRecommendationsConsentViewController);
  id v26 = -[TVUPSGroupRecommendationsConsentViewController initWithUserProfileIdentifier:]( v4,  "initWithUserProfileIdentifier:",  location[0]);
  objc_initWeak(&v25, v31);
  id v9 = v26;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_1000066B8;
  v22 = &unk_10000C6A8;
  objc_copyWeak(&v24, &v25);
  id v23 = location[0];
  [v9 setOnConsentAuthorization:&v18];
  id v5 = v26;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_100006724;
  v14 = &unk_10000C6D0;
  char v17 = v27 & 1;
  id v15 = location[0];
  objc_copyWeak(&v16, &v25);
  [v5 setOnConsentDeclined:&v10];
  -[UINavigationController pushViewController:animated:]( v31->_presentationController,  "pushViewController:animated:",  v26,  v29);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v25);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = -[TVUPSGroupRecommendationsPickerViewController view](v30, "view");
  id v20 = [v21 window];
  [v20 makeKeyWindow];

  id v28 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  unsigned __int8 v22 = 1;
  char v27 = v22 & 1;
  id v26 =  +[TVSUIUserPickerViewControllerConfiguration defaultConfiguration]( &OBJC_CLASS___TVSUIUserPickerViewControllerConfiguration,  "defaultConfiguration");
  [v26 setAllowsMultipleSelection:1];
  [v26 setAutomaticallyDismissWhenFinished:0];
  int v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"GroupRecommendationsPickerTitle");
  objc_msgSend(v26, "setTitle:");

  v13 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  int v12 =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"GroupRecommendationsPickerSubtitle",  &stru_10000CD18,  @"Localizable");
  objc_msgSend(v26, "setSubtitle:");

  id v15 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v14 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"GroupRecommendationsDoneButtonTitle",  &stru_10000CD18,  @"Localizable");
  objc_msgSend(v26, "setDoneButtonTitle:");

  [v26 setShowAddUserAction:v22 & 1];
  char v17 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v16 =  -[NSBundle localizedStringForKey:value:table:]( v17,  "localizedStringForKey:value:table:",  @"GroupRecommendationsAddUserActionTitle",  &stru_10000CD18,  @"Localizable");
  objc_msgSend(v26, "setAddUserActionTitle:");

  id v3 = objc_alloc_init(&OBJC_CLASS___TVSUIGroupRecommendationsPickerDataSource);
  dataSource = v30->_dataSource;
  v30->_dataSource = v3;

  id v5 = objc_alloc(&OBJC_CLASS___TVSUIUserPickerViewController);
  id v25 = [v5 initWithConfiguration:v26 dataSource:v30->_dataSource];
  [v25 setDelegate:v30];
  BOOL v6 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v25);
  presentationController = v30->_presentationController;
  v30->_presentationController = v6;

  -[UINavigationController setModalPresentationStyle:](v30->_presentationController, "setModalPresentationStyle:", 8LL);
  v8 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  id v24 = -[UITapGestureRecognizer initWithTarget:action:](v8, "initWithTarget:action:", v30, "_menuPressed:");
  [v24 setAllowedPressTypes:&off_10000CEA8];
  id v18 = -[UINavigationController view](v30->_presentationController, "view");
  [v18 addGestureRecognizer:v24];

  id v19 = [v28 userProfilesSnapshot];
  id v23 = [v19 selectedUserProfileIdentifier];

  if (-[TVUPSGroupRecommendationsPickerViewController _userNeedsToConsentWithIdentifier:]( v30,  "_userNeedsToConsentWithIdentifier:",  v23))
  {
    -[TVUPSGroupRecommendationsPickerViewController _showConsentDialogWithUserIdentifier:animated:]( v30,  "_showConsentDialogWithUserIdentifier:animated:",  v23,  0LL);
  }

  -[TVUPSGroupRecommendationsPickerViewController presentViewController:animated:completion:]( v30,  "presentViewController:animated:completion:",  v30->_presentationController,  1LL,  0LL);
  objc_storeStrong(&v23, obj);
  objc_storeStrong(&v24, obj);
  objc_storeStrong(&v25, obj);
  objc_storeStrong(&v26, obj);
  objc_storeStrong(&v28, obj);
  objc_storeStrong(location, obj);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v5 = v14;
  BOOL v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_100006E2C;
  v10 = &unk_10000C388;
  id v11 = v12;
  -[TVUPSGroupRecommendationsPickerViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v17[2] = a1;
  v17[1] = (id)a2;
  id v11 = v17;
  v17[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v7 = &OBJC_CLASS___NSSet;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v12 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v10 = (id *)&v16;
  id v16 = v2;
  id v15 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v8 = 0LL;
  int v9 = 0;
  objc_msgSend(v17[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  v14 = "viewServiceEndPresentationWithOptions:completion:";
  [v17[0] setClasses:v16 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v8 ofReply:v9 & 1];
  id v13 = v17[0];
  objc_storeStrong(v10, v12);
  objc_storeStrong(v11, v12);
  return v13;
}

+ (id)_remoteViewControllerInterface
{
  v11[2] = a1;
  v11[1] = (id)a2;
  uint64_t v6 = v11;
  v11[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  location = (id *)&v10;
  v10 = v2;
  int v9 = "dismissWithResult:";
  [v11[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v11[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (BOOL)userPickerViewController:(id)a3 shouldSelectUserWithIdentifier:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVUPSGroupRecommendationsPickerViewController _userNeedsToConsentWithIdentifier:]( v8,  "_userNeedsToConsentWithIdentifier:",  v6))
  {
    -[TVUPSGroupRecommendationsPickerViewController _showConsentDialogWithUserIdentifier:animated:]( v8,  "_showConsentDialogWithUserIdentifier:animated:",  v6,  1LL);
    char v9 = 0;
  }

  else
  {
    char v9 = 1;
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v9 & 1;
}

- (void)userPickerViewController:(id)a3 didSelectUserWithIdentifier:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSUIGroupRecommendationsPickerDataSource addUserToSelectionWithIdentifier:]( v7->_dataSource,  "addUserToSelectionWithIdentifier:",  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)userPickerViewController:(id)a3 shouldDeselectUserWithIdentifier:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  int v7 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v6 = -[PBSUserProfileManager userProfilesSnapshot](v7, "userProfilesSnapshot");
  id v9 = [v6 selectedUserProfileIdentifier];

  BOOL v8 = !([v10 isEqual:v9] & 1);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)userPickerViewController:(id)a3 didDeselectUserWithIdentifier:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSUIGroupRecommendationsPickerDataSource removeUserFromSelectionWithIdentifier:]( v7->_dataSource,  "removeUserFromSelectionWithIdentifier:",  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)userPickerViewController:(id)a3 didFinishWithSelectedUserIdentifiers:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  if (v18->_isUpdating)
  {
    int v15 = 1;
  }

  else
  {
    id v14 = sub_100004678();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000054D0((uint64_t)v19, (uint64_t)v16);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  v13,  "Updating group recommendations session. {selectedUserIdentifiers=%{public}@}",  v19,  0xCu);
    }

    objc_storeStrong(&v14, 0LL);
    v18->_isUpdating = 1;
    id v5 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
    id v4 = v16;
    int v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_1000075D8;
    id v11 = &unk_10000C6F8;
    id v12 = v18;
    -[PBSUserProfileManager updateGroupRecommendationsSessionWithUserIdentifiers:completionHandler:]( v5,  "updateGroupRecommendationsSessionWithUserIdentifiers:completionHandler:",  v4,  &v7);

    objc_storeStrong((id *)&v12, 0LL);
    int v15 = 0;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)userPickerViewControllerHandleAddNewUserAction:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=NEW_USER");
  id v3 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  [v3 openSensitiveURL:v4 withOptions:0];

  -[TVUPSGroupRecommendationsPickerViewController _dismiss](v6, "_dismiss");
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)userPickerViewController:(id)a3 descriptionForUserWithIdentifier:(id)a4
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  id v14 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v13 = -[PBSUserProfileManager userProfilesSnapshot](v14, "userProfilesSnapshot");
  id v18 = [v13 selectedUserProfileIdentifier];

  if ([v19 isEqual:v18] & 1)
  {
    id v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    unsigned __int8 v22 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"GroupRecommendationsCurrentUserTooltip",  &stru_10000CD18,  @"Localizable");

    int v16 = 1;
  }

  else
  {
    id v15 =  -[TVSUIGroupRecommendationsPickerDataSource shortNameForUserWithIdentifier:]( v21->_dataSource,  "shortNameForUserWithIdentifier:",  v19);
    id v9 =  -[TVSUIGroupRecommendationsPickerDataSource userPickerSelectedUserIdentifiers]( v21->_dataSource,  "userPickerSelectedUserIdentifiers");
    unsigned __int8 v10 = [v9 containsObject:v19];

    if ((v10 & 1) != 0)
    {
      int v8 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      int v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"GroupRecommendationsUserIncludedTooltip",  &stru_10000CD18,  @"Localizable");
      unsigned __int8 v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15);
    }

    else
    {
      id v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"GroupRecommendationsUserNotIncludedTooltip",  &stru_10000CD18,  @"Localizable");
      unsigned __int8 v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15);
    }

    int v16 = 1;
    objc_storeStrong(&v15, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v22;
}

- (UINavigationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (TVSUIGroupRecommendationsPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (void).cxx_destruct
{
}

@end