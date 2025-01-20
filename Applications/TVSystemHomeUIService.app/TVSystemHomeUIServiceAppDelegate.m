@interface TVSystemHomeUIServiceAppDelegate
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation TVSystemHomeUIServiceAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  v27 = self;
  SEL v26 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  id v23 = 0LL;
  objc_storeStrong(&v23, a5);
  id v13 = [v24 role];
  unsigned int v14 = [v13 isEqualToString:PBUISystemHomeServiceSceneSessionRoleCamera] ^ 1;

  if ((v14 & 1) != 0)
  {
    v22 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"only Camera SceneSessionRole is supported");
    id v21 = &_os_log_default;
    char v20 = 16;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v21;
      os_log_type_t type = v20;
      v12 = NSStringFromSelector(v26);
      v8 = v12;
      v19 = v8;
      v5 = (objc_class *)objc_opt_class(v27);
      v11 = NSStringFromClass(v5);
      v18 = v11;
      sub_1000056C8( (uint64_t)v28,  (uint64_t)v8,  (uint64_t)v18,  (uint64_t)v27,  (uint64_t)@"TVSystemHomeUIServiceAppDelegate.m",  20,  (uint64_t)v22);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v28,  0x3Au);

      objc_storeStrong((id *)&v18, 0LL);
      objc_storeStrong((id *)&v19, 0LL);
    }

    objc_storeStrong(&v21, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v22, "UTF8String"));
    __break(0);
    JUMPOUT(0x10000CBE0LL);
  }

  id v17 =  +[UISceneConfiguration configurationWithName:sessionRole:]( &OBJC_CLASS___UISceneConfiguration,  "configurationWithName:sessionRole:");
  [v17 setDelegateClass:objc_opt_class(TVSHUICameraWindowSceneDelegate)];
  id v7 = v17;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7;
}

@end