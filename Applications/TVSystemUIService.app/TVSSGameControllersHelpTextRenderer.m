@interface TVSSGameControllersHelpTextRenderer
+ (id)rendererWithIdentifier:(id)a3 text:(id)a4;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
@end

@implementation TVSSGameControllersHelpTextRenderer

+ (id)rendererWithIdentifier:(id)a3 text:(id)a4
{
  Class v65 = (Class)a1;
  SEL aSelector = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v62 = 0LL;
  objc_storeStrong(&v62, a4);
  id v61 = location;
  id v60 = 0LL;
  Class v59 = NSClassFromString(@"NSString");
  if (!v61)
  {
    id v58 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v32 = type;
      v34 = NSStringFromSelector(aSelector);
      v30 = v34;
      v55 = v30;
      v4 = (objc_class *)objc_opt_class(v65);
      v33 = NSStringFromClass(v4);
      v54 = v33;
      sub_10000583C( (uint64_t)v71,  (uint64_t)v30,  (uint64_t)v54,  (uint64_t)v65,  (uint64_t)@"TVSSGameControllersHelpTextRenderer.m",  19,  (uint64_t)v58);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v32,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v71,  0x3Au);

      objc_storeStrong((id *)&v54, 0LL);
      objc_storeStrong((id *)&v55, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v58 UTF8String]);
    __break(0);
    JUMPOUT(0x100056248LL);
  }

  if (((objc_opt_isKindOfClass(v61, v59) ^ 1) & 1) != 0)
  {
    id v53 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t v52 = &_os_log_default;
    os_log_type_t v51 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v26 = v52;
      os_log_type_t v27 = v51;
      v29 = NSStringFromSelector(aSelector);
      v25 = v29;
      v50 = v25;
      v5 = (objc_class *)objc_opt_class(v65);
      v28 = NSStringFromClass(v5);
      v49 = v28;
      sub_10000583C( (uint64_t)v70,  (uint64_t)v25,  (uint64_t)v49,  (uint64_t)v65,  (uint64_t)@"TVSSGameControllersHelpTextRenderer.m",  19,  (uint64_t)v53);
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  v27,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v70,  0x3Au);

      objc_storeStrong((id *)&v49, 0LL);
      objc_storeStrong((id *)&v50, 0LL);
    }

    objc_storeStrong((id *)&v52, 0LL);
    _bs_set_crash_log_message([v53 UTF8String]);
    __break(0);
    JUMPOUT(0x100056400LL);
  }

  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  id v48 = v62;
  id v47 = 0LL;
  Class v46 = NSClassFromString(@"NSString");
  if (!v48)
  {
    id v45 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t v44 = &_os_log_default;
    os_log_type_t v43 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v21 = v44;
      os_log_type_t v22 = v43;
      v24 = NSStringFromSelector(aSelector);
      v20 = v24;
      v42 = v20;
      v6 = (objc_class *)objc_opt_class(v65);
      v23 = NSStringFromClass(v6);
      v41 = v23;
      sub_10000583C( (uint64_t)v69,  (uint64_t)v20,  (uint64_t)v41,  (uint64_t)v65,  (uint64_t)@"TVSSGameControllersHelpTextRenderer.m",  20,  (uint64_t)v45);
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  v22,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v69,  0x3Au);

      objc_storeStrong((id *)&v41, 0LL);
      objc_storeStrong((id *)&v42, 0LL);
    }

    objc_storeStrong((id *)&v44, 0LL);
    _bs_set_crash_log_message([v45 UTF8String]);
    __break(0);
    JUMPOUT(0x1000565FCLL);
  }

  if (((objc_opt_isKindOfClass(v48, v46) ^ 1) & 1) != 0)
  {
    id v40 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t v39 = &_os_log_default;
    os_log_type_t v38 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v16 = v39;
      os_log_type_t v17 = v38;
      v19 = NSStringFromSelector(aSelector);
      v15 = v19;
      v37 = v15;
      v7 = (objc_class *)objc_opt_class(v65);
      v18 = NSStringFromClass(v7);
      v36 = v18;
      sub_10000583C( (uint64_t)v68,  (uint64_t)v15,  (uint64_t)v36,  (uint64_t)v65,  (uint64_t)@"TVSSGameControllersHelpTextRenderer.m",  20,  (uint64_t)v40);
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  v17,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v68,  0x3Au);

      objc_storeStrong((id *)&v36, 0LL);
      objc_storeStrong((id *)&v37, 0LL);
    }

    objc_storeStrong((id *)&v39, 0LL);
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x1000567B4LL);
  }

  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  id v10 = objc_alloc(v65);
  id v9 = location;
  id v14 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v66 = v14;
  id v67 = v62;
  v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL);
  v11 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
  id v12 = objc_msgSend(v10, "initWithIdentifier:format:content:overrideStylings:", v9, 2);

  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&location, 0LL);
  return v12;
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  os_log_type_t v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v8 = location;
  id v9 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  unsigned __int8 v10 = objc_msgSend(v8, "isEqualToString:");

  if ((v10 & 1) != 0)
  {
    v5 = v17;
    unint64_t v6 = v15;
    id v7 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    v13.receiver = v5;
    v13.super_class = (Class)&OBJC_CLASS___TVSSGameControllersHelpTextRenderer;
    id v18 = -[TVSSGameControllersHelpTextRenderer stylingForState:identifier:](&v13, "stylingForState:identifier:", v6);
  }

  else
  {
    v11.receiver = v17;
    v11.super_class = (Class)&OBJC_CLASS___TVSSGameControllersHelpTextRenderer;
    id v18 =  -[TVSSGameControllersHelpTextRenderer stylingForState:identifier:]( &v11,  "stylingForState:identifier:",  v15,  location);
  }

  int v12 = 1;
  objc_storeStrong(&location, 0LL);
  return v18;
}

@end