@interface TVSSMenuBarAnimationProvider
+ (id)animationTransactionForAnimationContext:(id)a3 animated:(BOOL)a4;
@end

@implementation TVSSMenuBarAnimationProvider

+ (id)animationTransactionForAnimationContext:(id)a3 animated:(BOOL)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v37 = a4;
  id v36 = [location[0] menuMode];
  id v35 = [location[0] previousMenuMode];
  v40 = (dispatch_once_t *)&unk_100221960;
  id v39 = 0LL;
  objc_storeStrong(&v39, &stru_1001B6B90);
  if (*v40 != -1) {
    dispatch_once(v40, v39);
  }
  objc_storeStrong(&v39, 0LL);
  v19 = (void *)qword_100221958;
  v33[0] = v35;
  v33[1] = v36;
  v20 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v33,  "{_TVSSMenuModeKey=QQ}");
  Class v34 = (Class)objc_msgSend(v19, "objectForKey:");

  id v32 = MenuBarAnimationLog();
  char v31 = 2;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v32;
    os_log_type_t type = v31;
    id v18 = TVSSMenuModeDescription((unint64_t)v35);
    id v12 = v18;
    id v30 = v12;
    id v17 = TVSSMenuModeDescription((unint64_t)v36);
    id v13 = v17;
    id v29 = v13;
    v16 = NSStringFromClass(v34);
    v28 = v16;
    sub_100028588((uint64_t)v42, (uint64_t)v12, (uint64_t)v13, (uint64_t)v28);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "%@ -> %@: %@", v42, 0x20u);

    objc_storeStrong((id *)&v28, 0LL);
    objc_storeStrong(&v29, 0LL);
    objc_storeStrong(&v30, 0LL);
  }

  objc_storeStrong(&v32, 0LL);
  BOOL v27 = v35 != v36;
  if (!v34 && v27)
  {
    id v26 = MenuBarAnimationLog();
    char v25 = 16;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      v8 = (os_log_s *)v26;
      os_log_type_t v9 = v25;
      id v11 = TVSSMenuModeDescription((unint64_t)v35);
      id v7 = v11;
      id v24 = v7;
      id v10 = TVSSMenuModeDescription((unint64_t)v36);
      id v23 = v10;
      sub_10002F860((uint64_t)v41, (uint64_t)v7, (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "Unhandled transaction animation state, using basic animation as fallback. {previousMode=%{public}@, nextMode=%{public}@}",  v41,  0x16u);

      objc_storeStrong(&v23, 0LL);
      objc_storeStrong(&v24, 0LL);
    }

    objc_storeStrong(&v26, 0LL);
    Class v34 = (Class)objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  }

  id v4 = objc_alloc(v34);
  id v22 = [v4 initWithAnimationContext:location[0] animated:v37];
  id v6 = v22;
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

@end