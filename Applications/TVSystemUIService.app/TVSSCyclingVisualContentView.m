@interface TVSSCyclingVisualContentView
- (TVSSCyclingVisualContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (id)_currentCyclingVisualContent;
- (void)_cycleTimerDidFire;
- (void)_didUpdateVisualContent:(id)a3 oldVisualContent:(id)a4;
- (void)_startCyclingTimer;
- (void)_startDisplayingMenuItems;
- (void)_stopCyclingTimer;
- (void)_stopDisplayingMenuItems;
- (void)setContent:(id)a3;
@end

@implementation TVSSCyclingVisualContentView

- (TVSSCyclingVisualContentView)initWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSSCyclingVisualContentView;
  v9 = -[TVSSCyclingVisualContentView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSSCyclingMenuItemsDataSource);
    dataSource = v9->_dataSource;
    v9->_dataSource = v3;
  }

  v6 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v6;
}

- (void)setContent:(id)a3
{
  v34 = self;
  SEL v33 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v31 = location;
  id v30 = 0LL;
  Class v29 = NSClassFromString(@"TVSSCyclingVisualContent");
  if (!v31)
  {
    v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v27 = &_os_log_default;
    char v26 = 16;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v27;
      os_log_type_t type = v26;
      v16 = NSStringFromSelector(v33);
      v12 = v16;
      v25 = v12;
      v3 = (objc_class *)objc_opt_class(v34);
      v15 = NSStringFromClass(v3);
      v24 = v15;
      sub_10000583C( (uint64_t)v36,  (uint64_t)v12,  (uint64_t)v24,  (uint64_t)v34,  (uint64_t)@"TVSSCyclingVisualContentView.m",  52,  (uint64_t)v28);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v36,  0x3Au);

      objc_storeStrong((id *)&v24, 0LL);
      objc_storeStrong((id *)&v25, 0LL);
    }

    objc_storeStrong(&v27, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v28, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F9810LL);
  }

  if (((objc_opt_isKindOfClass(v31, v29) ^ 1) & 1) != 0)
  {
    v23 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSCyclingVisualContentClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      SEL v8 = oslog;
      os_log_type_t v9 = v21;
      v11 = NSStringFromSelector(v33);
      objc_super v7 = v11;
      v20 = v7;
      v4 = (objc_class *)objc_opt_class(v34);
      CGRect v10 = NSStringFromClass(v4);
      v19 = v10;
      sub_10000583C( (uint64_t)v35,  (uint64_t)v7,  (uint64_t)v19,  (uint64_t)v34,  (uint64_t)@"TVSSCyclingVisualContentView.m",  52,  (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v35,  0x3Au);

      objc_storeStrong((id *)&v19, 0LL);
      objc_storeStrong((id *)&v20, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v23, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F99C8LL);
  }

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  id v18 = -[TVSSCyclingVisualContentView _currentCyclingVisualContent](v34, "_currentCyclingVisualContent");
  id v6 = location;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSCyclingVisualContent);
  id v17 = sub_1000F9AF4(v6, v5);
  objc_storeStrong((id *)&v34->_content, v17);
  -[TVSSCyclingVisualContentView _didUpdateVisualContent:oldVisualContent:]( v34,  "_didUpdateVisualContent:oldVisualContent:",  v17,  v18);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (id)_currentCyclingVisualContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSCyclingVisualContent);
  return sub_1000F9AF4(content, v2);
}

- (void)_didUpdateVisualContent:(id)a3 oldVisualContent:(id)a4
{
  CGRect v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  dataSource = v10->_dataSource;
  id v6 = [location[0] menuItems];
  id v7 = -[TVSSCyclingMenuItemsDataSource updateWithMenuItems:](dataSource, "updateWithMenuItems:");

  if (v7)
  {
    if (v7 == (id)1)
    {
      -[TVSSCyclingVisualContentView _startDisplayingMenuItems](v10, "_startDisplayingMenuItems");
    }

    else if (v7 == (id)2)
    {
      -[TVSSCyclingVisualContentView _stopDisplayingMenuItems](v10, "_stopDisplayingMenuItems");
    }
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_startDisplayingMenuItems
{
  v43 = self;
  SEL v42 = a2;
  -[TVSSCyclingVisualContentView _stopDisplayingMenuItems](self, "_stopDisplayingMenuItems");
  if (v43->_menuItemHostView)
  {
    v41 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"!_menuItemHostView");
    id v40 = &_os_log_default;
    char v39 = 16;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v40;
      os_log_type_t type = v39;
      v28 = NSStringFromSelector(v42);
      v24 = v28;
      v38 = v24;
      uint64_t v2 = (objc_class *)objc_opt_class(v43);
      id v27 = NSStringFromClass(v2);
      v37 = v27;
      sub_10000583C( (uint64_t)v46,  (uint64_t)v24,  (uint64_t)v37,  (uint64_t)v43,  (uint64_t)@"TVSSCyclingVisualContentView.m",  90,  (uint64_t)v41);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v46,  0x3Au);

      objc_storeStrong((id *)&v37, 0LL);
      objc_storeStrong((id *)&v38, 0LL);
    }

    objc_storeStrong(&v40, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v41, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F9F10LL);
  }

  if (v43->_nextMenuItemHostView)
  {
    v36 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"!_nextMenuItemHostView");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v34 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v20 = oslog;
      os_log_type_t v21 = v34;
      v23 = NSStringFromSelector(v42);
      v19 = v23;
      SEL v33 = v19;
      v3 = (objc_class *)objc_opt_class(v43);
      v22 = NSStringFromClass(v3);
      v32 = v22;
      sub_10000583C( (uint64_t)v45,  (uint64_t)v19,  (uint64_t)v32,  (uint64_t)v43,  (uint64_t)@"TVSSCyclingVisualContentView.m",  91,  (uint64_t)v36);
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  v21,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v45,  0x3Au);

      objc_storeStrong((id *)&v32, 0LL);
      objc_storeStrong((id *)&v33, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v36, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000FA0C8LL);
  }

  id v31 = -[TVSSCyclingMenuItemsDataSource currentMenuItem](v43->_dataSource, "currentMenuItem");
  if (v31)
  {
    v4 = -[TVSSMenuItemHostView initWithItem:](objc_alloc(&OBJC_CLASS___TVSSMenuItemHostView), "initWithItem:", v31);
    menuItemHostView = v43->_menuItemHostView;
    v43->_menuItemHostView = v4;

    -[TVSSMenuItemHostView setTranslatesAutoresizingMaskIntoConstraints:]( v43->_menuItemHostView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSCyclingVisualContentView addSubview:](v43, "addSubview:", v43->_menuItemHostView);
    id v18 = -[TVSSMenuItemHostView leadingAnchor](v43->_menuItemHostView, "leadingAnchor");
    id v17 = -[TVSSCyclingVisualContentView leadingAnchor](v43, "leadingAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v44[0] = v16;
    id v15 = -[TVSSMenuItemHostView trailingAnchor](v43->_menuItemHostView, "trailingAnchor");
    id v14 = -[TVSSCyclingVisualContentView trailingAnchor](v43, "trailingAnchor");
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v44[1] = v13;
    id v12 = -[TVSSMenuItemHostView topAnchor](v43->_menuItemHostView, "topAnchor");
    id v11 = -[TVSSCyclingVisualContentView topAnchor](v43, "topAnchor");
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v44[2] = v10;
    id v9 = -[TVSSMenuItemHostView heightAnchor](v43->_menuItemHostView, "heightAnchor");
    id v8 = -[TVSSCyclingVisualContentView heightAnchor](v43, "heightAnchor");
    id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
    v44[3] = v7;
    id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    id v29 = -[TVSSCyclingMenuItemsDataSource nextMenuItem](v43->_dataSource, "nextMenuItem");
    if (v29) {
      -[TVSSCyclingVisualContentView _startCyclingTimer](v43, "_startCyclingTimer");
    }
    objc_storeStrong(&v29, 0LL);
    int v30 = 0;
  }

  else
  {
    int v30 = 1;
  }

  objc_storeStrong(&v31, 0LL);
}

- (void)_stopDisplayingMenuItems
{
}

- (void)_startCyclingTimer
{
  id v18 = self;
  id location[2] = (id)a2;
  -[TVSSCyclingVisualContentView _stopCyclingTimer](self, "_stopCyclingTimer");
  id v6 = &_dispatch_main_q;
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);
  timer = v18->_timer;
  v18->_timer = (OS_dispatch_source *)v2;

  id v7 = -[TVSSCyclingVisualContentView _currentCyclingVisualContent](v18, "_currentCyclingVisualContent");
  [v7 displayTime];
  id v8 = (void *)(uint64_t)(1000000000.0 * v4);

  location[1] = v8;
  source = (dispatch_source_s *)v18->_timer;
  dispatch_time_t v5 = dispatch_time(0LL, (int64_t)v8);
  dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(location, v18);
  id v10 = (dispatch_source_s *)v18->_timer;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1000FA6D0;
  id v15 = &unk_1001B75D0;
  objc_copyWeak(&v16, location);
  dispatch_source_set_event_handler(v10, &v11);
  dispatch_resume((dispatch_object_t)v18->_timer);
  objc_destroyWeak(&v16);
  objc_destroyWeak(location);
}

- (void)_stopCyclingTimer
{
  if (self->_timer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    objc_storeStrong((id *)&self->_timer, 0LL);
  }

- (void)_cycleTimerDidFire
{
  v53 = self;
  SEL v52 = a2;
  if (!self->_menuItemHostView)
  {
    id v51 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_menuItemHostView != nil");
    id v50 = &_os_log_default;
    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(v52);
      id v48 = v25;
      aClass = (objc_class *)objc_opt_class(v53);
      v24 = NSStringFromClass(aClass);
      id location = v24;
      sub_10000583C( (uint64_t)v56,  (uint64_t)v48,  (uint64_t)location,  (uint64_t)v53,  (uint64_t)@"TVSSCyclingVisualContentView.m",  158,  (uint64_t)v51);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v50,  v49,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v56,  0x3Au);

      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v48, 0LL);
    }

    objc_storeStrong(&v50, 0LL);
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FA99CLL);
  }

  if (v53->_nextMenuItemHostView)
  {
    id v46 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_nextMenuItemHostView == nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v44 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v22 = NSStringFromSelector(v52);
      id v43 = v22;
      v23 = (objc_class *)objc_opt_class(v53);
      os_log_type_t v21 = NSStringFromClass(v23);
      id v42 = v21;
      sub_10000583C( (uint64_t)v55,  (uint64_t)v43,  (uint64_t)v42,  (uint64_t)v53,  (uint64_t)@"TVSSCyclingVisualContentView.m",  159,  (uint64_t)v46);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v44,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v55,  0x3Au);

      objc_storeStrong(&v42, 0LL);
      objc_storeStrong(&v43, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v46 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FABA4LL);
  }

  id v41 = -[TVSSCyclingMenuItemsDataSource nextMenuItem](v53->_dataSource, "nextMenuItem");
  if (v41)
  {
    v20 = -[TVSSMenuItemHostView initWithItem:](objc_alloc(&OBJC_CLASS___TVSSMenuItemHostView), "initWithItem:", v41);
    nextMenuItemHostView = v53->_nextMenuItemHostView;
    v53->_nextMenuItemHostView = v20;

    -[TVSSMenuItemHostView setAlpha:](v53->_nextMenuItemHostView, "setAlpha:", 0.0);
    -[TVSSMenuItemHostView setTranslatesAutoresizingMaskIntoConstraints:]( v53->_nextMenuItemHostView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSCyclingVisualContentView addSubview:](v53, "addSubview:", v53->_nextMenuItemHostView);
    id v19 = -[TVSSMenuItemHostView leadingAnchor](v53->_nextMenuItemHostView, "leadingAnchor");
    id v18 = -[TVSSCyclingVisualContentView leadingAnchor](v53, "leadingAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v54[0] = v17;
    id v16 = -[TVSSMenuItemHostView trailingAnchor](v53->_nextMenuItemHostView, "trailingAnchor");
    id v15 = -[TVSSCyclingVisualContentView trailingAnchor](v53, "trailingAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v54[1] = v14;
    id v13 = -[TVSSMenuItemHostView topAnchor](v53->_nextMenuItemHostView, "topAnchor");
    id v12 = -[TVSSCyclingVisualContentView topAnchor](v53, "topAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v54[2] = v11;
    id v10 = -[TVSSMenuItemHostView heightAnchor](v53->_nextMenuItemHostView, "heightAnchor");
    id v9 = -[TVSSCyclingVisualContentView heightAnchor](v53, "heightAnchor");
    id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v54[3] = v8;
    id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_initWeak(&from, v53);
    id v6 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    SEL v33 = _NSConcreteStackBlock;
    int v34 = -1073741824;
    int v35 = 0;
    v36 = sub_1000FB250;
    v37 = &unk_1001B75D0;
    objc_copyWeak(v38, &from);
    dispatch_time_t v5 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v6,  "initWithDuration:curve:animations:",  0LL,  &v33,  0.2);
    animator = v53->_animator;
    v53->_animator = v5;

    double v4 = v53->_animator;
    id v27 = _NSConcreteStackBlock;
    int v28 = -1073741824;
    int v29 = 0;
    int v30 = sub_1000FB2E8;
    id v31 = &unk_1001B5A88;
    objc_copyWeak(&v32, &from);
    -[UIViewPropertyAnimator addCompletion:](v4, "addCompletion:", &v27);
    -[UIViewPropertyAnimator startAnimation](v53->_animator, "startAnimation");
    objc_destroyWeak(&v32);
    objc_destroyWeak(v38);
    objc_destroyWeak(&from);
    int v40 = 0;
  }

  else
  {
    int v40 = 1;
  }

  objc_storeStrong(&v41, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
}

@end