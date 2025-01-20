@interface TVSSSimpleMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSMenuItem)menuItem;
- (id)log;
- (id)newMenuItem;
- (void)updateCurrentMenuItemVisualContentWithReason:(id)a3;
- (void)updateMenuItemWithReason:(id)a3;
@end

@implementation TVSSSimpleMenuItemProvider

- (TVSSMenuItem)menuItem
{
  v3 = -[TVSSMenuItemProvider items](self, "items");
  id v4 = -[NSOrderedSet firstObject](v3, "firstObject");

  return (TVSSMenuItem *)v4;
}

- (void)updateMenuItemWithReason:(id)a3
{
  v52 = self;
  SEL aSelector = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v49 = -[TVSSMenuItemProvider items](v52, "items");
  BOOL v19 = 1;
  if ([v49 count]) {
    BOOL v19 = [v49 count] == (id)1;
  }
  if (!v19)
  {
    id v48 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[currentItems count] == 0 || [currentItems count] == 1");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v16 = type;
      v18 = NSStringFromSelector(aSelector);
      v14 = v18;
      v45 = v14;
      v3 = (objc_class *)objc_opt_class(v52);
      v17 = NSStringFromClass(v3);
      v44 = v17;
      sub_10000583C( (uint64_t)v59,  (uint64_t)v14,  (uint64_t)v44,  (uint64_t)v52,  (uint64_t)@"TVSSSimpleMenuItemProvider.m",  29,  (uint64_t)v48);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v16,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v59,  0x3Au);

      objc_storeStrong((id *)&v44, 0LL);
      objc_storeStrong((id *)&v45, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v48 UTF8String]);
    __break(0);
    JUMPOUT(0x1000BA070LL);
  }

  id v43 = [v49 firstObject];
  id v42 = v43;
  os_log_t v41 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    sub_100025B38( (uint64_t)v58,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]",  (uint64_t)location,  (uint64_t)v43);
    _os_log_impl( (void *)&_mh_execute_header,  v41,  v40,  "%s: Starting menu item update for reason: %{public}@. currentItem=%@",  v58,  0x20u);
  }

  objc_storeStrong((id *)&v41, 0LL);
  if (-[TVSSSimpleMenuItemProvider shouldShowMenuItem](v52, "shouldShowMenuItem"))
  {
    if (v43)
    {
      id v38 = [v43 visualContent];
      if (-[TVSSSimpleMenuItemProvider updateVisualContentForMenuItem:](v52, "updateVisualContentForMenuItem:", v43))
      {
        os_log_t v36 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          sub_100047398( (uint64_t)v57,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]",  (uint64_t)v38,  (uint64_t)v43);
          _os_log_impl( (void *)&_mh_execute_header,  v36,  v35,  "%s: Updated visual content for existing menu item. oldVisualContent=%@, currentItem=%@",  v57,  0x20u);
        }

        objc_storeStrong((id *)&v36, 0LL);
      }

      objc_storeStrong(&v38, 0LL);
    }

    else
    {
      id v4 = -[TVSSSimpleMenuItemProvider newMenuItem](v52, "newMenuItem");
      id v5 = v42;
      id v42 = v4;

      os_log_t v34 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        sub_100025AE4((uint64_t)v56, (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]", (uint64_t)v42);
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v33,  "%s: Menu item is required to be shown. Created new menu item. newItem=%@",  v56,  0x16u);
      }

      objc_storeStrong((id *)&v34, 0LL);
    }
  }

  else if (v43)
  {
    objc_storeStrong(&v42, 0LL);
    os_log_t v32 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v55, (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]");
      _os_log_impl( (void *)&_mh_execute_header,  v32,  v31,  "%s: Menu item is not required to be shown. Will remove menu item.",  v55,  0xCu);
    }

    objc_storeStrong((id *)&v32, 0LL);
  }

  char v30 = 0;
  if (v42 != v43)
  {
    char v27 = 0;
    char v25 = 0;
    if (v42)
    {
      id v28 = +[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v42);
      char v27 = 1;
      id v6 = v28;
    }

    else
    {
      id v26 = +[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet");
      char v25 = 1;
      id v6 = v26;
    }

    id v29 = v6;
    if ((v25 & 1) != 0) {

    }
    if ((v27 & 1) != 0) {
    os_log_t v24 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
    }
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v42) {
        v7 = @"Setting new";
      }
      else {
        v7 = @"Removing";
      }
      sub_1000BA704( (uint64_t)v54,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]",  (uint64_t)v7,  (uint64_t)v43,  (uint64_t)v42);
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v23,  "%s: %@ menu item. currentItem=%{public}@, newItem=%@",  v54,  0x2Au);
    }

    objc_storeStrong((id *)&v24, 0LL);
    -[TVSSMenuItemProvider setItems:](v52, "setItems:", v29);
    char v30 = 1;
    objc_storeStrong(&v29, 0LL);
  }

  os_log_t v22 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v52, "log");
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v22;
    os_log_type_t v11 = v21;
    id v8 = location;
    int v9 = v30 & 1;
    v13 = -[TVSSMenuItemProvider items](v52, "items");
    id v12 = -[NSOrderedSet firstObject](v13, "firstObject");
    id v20 = v12;
    sub_1000BA788( (uint64_t)v53,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]",  (uint64_t)v8,  v9,  (uint64_t)v20);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "%s: Finished menu item update for reason: %{public}@. didChangeItem=%{BOOL}d, currentItem=%@",  v53,  0x26u);

    objc_storeStrong(&v20, 0LL);
  }

  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)updateCurrentMenuItemVisualContentWithReason:(id)a3
{
  id v29 = self;
  SEL v28 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v26 = -[TVSSMenuItemProvider items](v29, "items");
  BOOL v13 = 1;
  if ([v26 count]) {
    BOOL v13 = [v26 count] == (id)1;
  }
  if (!v13)
  {
    char v25 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[currentItems count] == 0 || [currentItems count] == 1");
    id v24 = &_os_log_default;
    char v23 = 16;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v24;
      os_log_type_t type = v23;
      id v12 = NSStringFromSelector(v28);
      id v8 = v12;
      os_log_t v22 = v8;
      v3 = (objc_class *)objc_opt_class(v29);
      os_log_type_t v11 = NSStringFromClass(v3);
      os_log_type_t v21 = v11;
      sub_10000583C( (uint64_t)v32,  (uint64_t)v8,  (uint64_t)v21,  (uint64_t)v29,  (uint64_t)@"TVSSSimpleMenuItemProvider.m",  78,  (uint64_t)v25);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v32,  0x3Au);

      objc_storeStrong((id *)&v21, 0LL);
      objc_storeStrong((id *)&v22, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v25, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000BAA4CLL);
  }

  id v20 = [v26 firstObject];
  if (v20)
  {
    os_log_t oslog = (os_log_t)-[TVSSSimpleMenuItemProvider log](v29, "log");
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100016200( (uint64_t)v31,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]",  (uint64_t)location);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v18,  "%s: Starting visual content update for reason: %{public}@",  v31,  0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v17 = -[TVSSSimpleMenuItemProvider updateVisualContentForMenuItem:](v29, "updateVisualContentForMenuItem:", v20);
    os_log_t v16 = (os_log_t)-[TVSSSimpleMenuItemProvider log](v29, "log");
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v16;
      os_log_type_t v6 = v15;
      id v4 = location;
      id v7 = [v20 visualContent];
      id v14 = v7;
      sub_1000BA788( (uint64_t)v30,  (uint64_t)"-[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]",  (uint64_t)v4,  v17 & 1,  (uint64_t)v14);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "%s: Finished visual content update for reason: %{public}@. didUpdateVisualContent=%{BOOL}d, currentVisualContent=%@",  v30,  0x26u);

      objc_storeStrong(&v14, 0LL);
    }

    objc_storeStrong((id *)&v16, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  return 0;
}

- (id)newMenuItem
{
  v3 = objc_alloc(&OBJC_CLASS___TVSSMenuItem);
  id v5 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  id v4 = -[NSUUID UUIDString](v5, "UUIDString");
  os_log_type_t v6 = -[TVSSMenuItem initWithIdentifier:](v3, "initWithIdentifier:");

  return v6;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221D30;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B9E18);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221D28;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0;
}

@end