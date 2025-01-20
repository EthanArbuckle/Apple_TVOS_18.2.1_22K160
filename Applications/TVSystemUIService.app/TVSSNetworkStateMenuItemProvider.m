@interface TVSSNetworkStateMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (TVSSNetworkStateMenuItemProvider)initWithNetworkController:(id)a3;
- (id)log;
- (id)newMenuItem;
- (void)dealloc;
- (void)networkController:(id)a3 didChangeNetworkState:(id)a4;
@end

@implementation TVSSNetworkStateMenuItemProvider

- (TVSSNetworkStateMenuItemProvider)initWithNetworkController:(id)a3
{
  v34 = self;
  SEL v33 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v31 = location;
  id v30 = 0LL;
  Class v29 = NSClassFromString(@"TVSSNetworkController");
  if (!v31)
  {
    v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v27 = &_os_log_default;
    char v26 = 16;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v27;
      os_log_type_t type = v26;
      v17 = NSStringFromSelector(v33);
      v13 = v17;
      v25 = v13;
      v3 = (objc_class *)objc_opt_class(v34);
      v16 = NSStringFromClass(v3);
      v24 = v16;
      sub_10000583C( (uint64_t)v36,  (uint64_t)v13,  (uint64_t)v24,  (uint64_t)v34,  (uint64_t)@"TVSSNetworkStateMenuItemProvider.m",  35,  (uint64_t)v28);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v36,  0x3Au);

      objc_storeStrong((id *)&v24, 0LL);
      objc_storeStrong((id *)&v25, 0LL);
    }

    objc_storeStrong(&v27, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v28, "UTF8String"));
    __break(0);
    JUMPOUT(0x10002E2F8LL);
  }

  if (((objc_opt_isKindOfClass(v31, v29) ^ 1) & 1) != 0)
  {
    v23 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSNetworkControllerClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v9 = oslog;
      os_log_type_t v10 = v21;
      v12 = NSStringFromSelector(v33);
      v8 = v12;
      v20 = v8;
      v4 = (objc_class *)objc_opt_class(v34);
      v11 = NSStringFromClass(v4);
      v19 = v11;
      sub_10000583C( (uint64_t)v35,  (uint64_t)v8,  (uint64_t)v19,  (uint64_t)v34,  (uint64_t)@"TVSSNetworkStateMenuItemProvider.m",  35,  (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  v10,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v35,  0x3Au);

      objc_storeStrong((id *)&v19, 0LL);
      objc_storeStrong((id *)&v20, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v23, "UTF8String"));
    __break(0);
    JUMPOUT(0x10002E4B0LL);
  }

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  v5 = v34;
  v34 = 0LL;
  v18.receiver = v5;
  v18.super_class = (Class)&OBJC_CLASS___TVSSNetworkStateMenuItemProvider;
  v34 = -[TVSSMenuItemProvider initWithIdentifier:]( &v18,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.networkState.provider");
  objc_storeStrong((id *)&v34, v34);
  if (v34)
  {
    objc_storeStrong((id *)&v34->_networkController, location);
    -[TVSSNetworkController addObserver:](v34->_networkController, "addObserver:", v34);
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v34, "updateMenuItemWithReason:", @"Initial update");
  }

  v7 = v34;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSNetworkController removeObserver:](self->_networkController, "removeObserver:", self);
  -[TVSSNetworkController invalidate](v4->_networkController, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSNetworkStateMenuItemProvider;
  -[TVSSNetworkStateMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)networkController:(id)a3 didChangeNetworkState:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v7,  "updateMenuItemWithReason:",  @"Network state has changed");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSNetworkController networkState](self->_networkController, "networkState");
  char v3 = ([v4[0] isInternetAvailable] ^ 1) & 1;
  objc_storeStrong(v4, 0LL);
  return v3 & 1;
}

- (id)newMenuItem
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.networkState.item");
  char v3 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
  id v4 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"wifi.exclamationmark");
  v6 = -[TVSSImageContent initWithImage:](v3, "initWithImage:");

  [v7[0] setVisualContent:v6];
  id v5 = v7[0];
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(v7, 0LL);
  return v5;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221950;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6B28);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221948;
}

- (void).cxx_destruct
{
}

@end