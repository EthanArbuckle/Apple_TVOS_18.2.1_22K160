@interface TVUPSGroupRecommendationsConsentViewController
- (NSString)userProfileIdentifier;
- (TVUPSGroupRecommendationsConsentViewController)initWithUserProfileIdentifier:(id)a3;
- (id)onConsentAuthorization;
- (id)onConsentDeclined;
- (void)_dimissWithConsentGiven:(BOOL)a3;
- (void)groupRecommendationsConsentViewController:(id)a3 didUpdateConsentWithAuthorized:(BOOL)a4;
- (void)groupRecommendationsConsentViewControllerDidCancel:(id)a3;
- (void)setOnConsentAuthorization:(id)a3;
- (void)setOnConsentDeclined:(id)a3;
- (void)setUserProfileIdentifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVUPSGroupRecommendationsConsentViewController

- (TVUPSGroupRecommendationsConsentViewController)initWithUserProfileIdentifier:(id)a3
{
  v20 = self;
  SEL v19 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v17 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfileIdentifier != nil");
    id v16 = &_os_log_default;
    char v15 = 16;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v16;
      os_log_type_t type = v15;
      v11 = NSStringFromSelector(v19);
      v7 = v11;
      v14 = v7;
      v3 = (objc_class *)objc_opt_class(v20);
      v10 = NSStringFromClass(v3);
      v13 = v10;
      sub_100005228( (uint64_t)v21,  (uint64_t)v7,  (uint64_t)v13,  (uint64_t)v20,  (uint64_t)@"TVUPSGroupRecommendationsConsentViewController.m",  24,  (uint64_t)v17);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v21,  0x3Au);

      objc_storeStrong((id *)&v13, 0LL);
      objc_storeStrong((id *)&v14, 0LL);
    }

    objc_storeStrong(&v16, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v17, "UTF8String"));
    __break(0);
    JUMPOUT(0x100005128LL);
  }

  v4 = v20;
  v20 = 0LL;
  v12.receiver = v4;
  v12.super_class = (Class)&OBJC_CLASS___TVUPSGroupRecommendationsConsentViewController;
  v20 = -[TVUPSGroupRecommendationsConsentViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v20, v20);
  if (v20) {
    objc_storeStrong((id *)&v20->_userProfileIdentifier, location);
  }
  v6 = v20;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v6;
}

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVUPSGroupRecommendationsConsentViewController;
  -[TVUPSGroupRecommendationsConsentViewController viewDidLoad](&v5, "viewDidLoad");
  id v4 =  +[TVSUIGroupRecommendationsConsentViewControllerConfiguration defaultConfiguration]( &OBJC_CLASS___TVSUIGroupRecommendationsConsentViewControllerConfiguration,  "defaultConfiguration");
  [v4 setAutomaticallyDismiss:0];
  id v2 = objc_alloc(&OBJC_CLASS___TVSUIGroupRecommendationsConsentViewController);
  id v3 = [v2 initWithUserProfileIdentifier:v7->_userProfileIdentifier configuration:v4];
  [v3 setDelegate:v7];
  -[TVUPSGroupRecommendationsConsentViewController bs_addChildViewController:](v7, "bs_addChildViewController:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(&v4, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVUPSGroupRecommendationsConsentViewController;
  -[TVUPSGroupRecommendationsConsentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  os_log_t oslog = (os_log_t)sub_10000473C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000054D0((uint64_t)v8, (uint64_t)v7->_userProfileIdentifier);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Showing group recommendations consent dialog. {identifier=%{public}@}",  v8,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
}

- (void)_dimissWithConsentGiven:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  os_log_t oslog = (os_log_t)sub_10000473C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000056CC((uint64_t)v9, (uint64_t)v8->_userProfileIdentifier, v6);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Dismissing group recommendations consent. {identifier=%{public}@, consentGiven=%{BOOL}d}",  v9,  0x12u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  if (v6 && v8->_onConsentAuthorization)
  {
    (*((void (**)(void))v8->_onConsentAuthorization + 2))();
  }

  else if (!v6 && v8->_onConsentDeclined)
  {
    (*((void (**)(void))v8->_onConsentDeclined + 2))();
  }

  id v4 = -[TVUPSGroupRecommendationsConsentViewController navigationController](v8, "navigationController");
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)groupRecommendationsConsentViewController:(id)a3 didUpdateConsentWithAuthorized:(BOOL)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v19 = a4;
  id v18 = sub_10000473C();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000056CC((uint64_t)v22, (uint64_t)v21->_userProfileIdentifier, v19);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  v17,  "User picked a group recommendations consent option. {identifier=%{public}@, opted-in=%{BOOL}d}",  v22,  0x12u);
  }

  objc_storeStrong(&v18, 0LL);
  uint64_t v4 = 2LL;
  if (v19) {
    uint64_t v4 = 1LL;
  }
  uint64_t v16 = v4;
  SEL v7 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  uint64_t v5 = v16;
  userProfileIdentifier = v21->_userProfileIdentifier;
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  objc_super v12 = sub_10000592C;
  v13 = &unk_10000C540;
  v14 = v21;
  BOOL v15 = v19;
  -[PBSUserProfileManager updateGroupRecommendationsConsent:forUserProfileWithIdentifier:completionHandler:]( v7,  "updateGroupRecommendationsConsent:forUserProfileWithIdentifier:completionHandler:",  v5,  userProfileIdentifier,  &v9);

  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)groupRecommendationsConsentViewControllerDidCancel:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)sub_10000473C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000054D0((uint64_t)v6, (uint64_t)v5->_userProfileIdentifier);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "User cancelled the group recommendations consent dialog. {identifier=%{public}@}",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVUPSGroupRecommendationsConsentViewController _dimissWithConsentGiven:](v5, "_dimissWithConsentGiven:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)onConsentAuthorization
{
  return self->_onConsentAuthorization;
}

- (void)setOnConsentAuthorization:(id)a3
{
}

- (id)onConsentDeclined
{
  return self->_onConsentDeclined;
}

- (void)setOnConsentDeclined:(id)a3
{
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (void)setUserProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end