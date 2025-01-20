@interface TVSSPrivacyVisualContentView
- (TVSSPrivacyController)privacyController;
- (TVSSPrivacyStateAdapterView)privacyAdapterView;
- (TVSSPrivacyVisualContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (void)_updatePrivacyAdapterView;
- (void)dealloc;
- (void)privacyControllerStateDidChange:(id)a3;
- (void)setContent:(id)a3;
- (void)setPrivacyAdapterView:(id)a3;
- (void)setPrivacyController:(id)a3;
@end

@implementation TVSSPrivacyVisualContentView

- (TVSSPrivacyVisualContentView)initWithFrame:(CGRect)a3
{
  CGRect v25 = a3;
  SEL v23 = a2;
  v24 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSSPrivacyVisualContentView;
  v24 = -[TVSSPrivacyVisualContentView initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v24, v24);
  if (v24)
  {
    v3 = -[TVSSPrivacyStateAdapterView initWithDisplayLocation:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyStateAdapterView),  "initWithDisplayLocation:",  1LL);
    privacyAdapterView = v24->_privacyAdapterView;
    v24->_privacyAdapterView = v3;

    -[TVSSPrivacyStateAdapterView setTranslatesAutoresizingMaskIntoConstraints:]( v24->_privacyAdapterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSPrivacyVisualContentView addSubview:](v24, "addSubview:", v24->_privacyAdapterView);
    id v21 = -[TVSSPrivacyStateAdapterView leadingAnchor](v24->_privacyAdapterView, "leadingAnchor");
    id v20 = -[TVSSPrivacyVisualContentView leadingAnchor](v24, "leadingAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v26[0] = v19;
    id v18 = -[TVSSPrivacyStateAdapterView trailingAnchor](v24->_privacyAdapterView, "trailingAnchor");
    id v17 = -[TVSSPrivacyVisualContentView trailingAnchor](v24, "trailingAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v26[1] = v16;
    id v15 = -[TVSSPrivacyStateAdapterView topAnchor](v24->_privacyAdapterView, "topAnchor");
    id v14 = -[TVSSPrivacyVisualContentView topAnchor](v24, "topAnchor");
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v26[2] = v13;
    id v12 = -[TVSSPrivacyStateAdapterView bottomAnchor](v24->_privacyAdapterView, "bottomAnchor");
    id v11 = -[TVSSPrivacyVisualContentView bottomAnchor](v24, "bottomAnchor");
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v26[3] = v10;
    id v9 = -[TVSSPrivacyVisualContentView widthAnchor](v24, "widthAnchor");
    id v8 = [v9 constraintGreaterThanOrEqualToConstant:*(double *)&qword_10021F820];
    v26[4] = v8;
    v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 5LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  v6 = v24;
  objc_storeStrong((id *)&v24, 0LL);
  return v6;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSPrivacyController removeControllerObserver:](self->_privacyController, "removeControllerObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSPrivacyVisualContentView;
  -[TVSSPrivacyVisualContentView dealloc](&v2, "dealloc");
}

- (void)setContent:(id)a3
{
  v39 = self;
  SEL v38 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v36 = location;
  if (!v36)
  {
    SEL v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSPrivacyVisualContent);
    v24 = NSStringFromClass(v3);
    v35 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was unexpectedly nil. Expected %@.",  @"content",  v24);

    id v34 = &_os_log_default;
    char v33 = 16;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v34;
      os_log_type_t type = v33;
      SEL v23 = NSStringFromSelector(v38);
      id v19 = v23;
      v32 = v19;
      v4 = (objc_class *)objc_opt_class(v39);
      objc_super v22 = NSStringFromClass(v4);
      v31 = v22;
      sub_10000583C( (uint64_t)v41,  (uint64_t)v19,  (uint64_t)v31,  (uint64_t)v39,  (uint64_t)@"TVSSPrivacyVisualContentView.m",  57,  (uint64_t)v35);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v41,  0x3Au);

      objc_storeStrong((id *)&v31, 0LL);
      objc_storeStrong((id *)&v32, 0LL);
    }

    objc_storeStrong(&v34, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v35, "UTF8String"));
    __break(0);
    JUMPOUT(0x10006CA14LL);
  }

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSPrivacyVisualContent);
  if (((objc_opt_isKindOfClass(v36, v5) ^ 1) & 1) != 0)
  {
    id v18 = (objc_class *)[v36 classForCoder];
    if (v18)
    {
      v6 = NSStringFromClass(v18);
    }

    else
    {
      aClass = (objc_class *)objc_opt_class(v36);
      v6 = NSStringFromClass(aClass);
    }

    id v16 = v6;
    v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSPrivacyVisualContent);
    id v15 = NSStringFromClass(v7);
    v30 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was of unexpected class %@. Expected %@.",  @"content",  v16,  v15);

    id v29 = &_os_log_default;
    char v28 = 16;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      id v11 = (os_log_s *)v29;
      os_log_type_t v12 = v28;
      id v14 = NSStringFromSelector(v38);
      id v10 = v14;
      v27 = v10;
      id v8 = (objc_class *)objc_opt_class(v39);
      id v13 = NSStringFromClass(v8);
      v26 = v13;
      sub_10000583C( (uint64_t)v40,  (uint64_t)v10,  (uint64_t)v26,  (uint64_t)v39,  (uint64_t)@"TVSSPrivacyVisualContentView.m",  57,  (uint64_t)v30);
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  v12,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v40,  0x3Au);

      objc_storeStrong((id *)&v26, 0LL);
      objc_storeStrong((id *)&v27, 0LL);
    }

    objc_storeStrong(&v29, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v30, "UTF8String"));
    __break(0);
    JUMPOUT(0x10006CC78LL);
  }

  objc_storeStrong(&v36, 0LL);
  id v25 = location;
  if ((BSEqualObjects(v39->_content, v25) & 1) == 0)
  {
    objc_storeStrong((id *)&v39->_content, v25);
    id v9 = [v25 privacyController];
    -[TVSSPrivacyVisualContentView setPrivacyController:](v39, "setPrivacyController:");

    -[TVSSPrivacyVisualContentView _updatePrivacyAdapterView](v39, "_updatePrivacyAdapterView");
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)setPrivacyController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_privacyController != location[0])
  {
    -[TVSSPrivacyController removeControllerObserver:](v4->_privacyController, "removeControllerObserver:", v4);
    objc_storeStrong((id *)&v4->_privacyController, location[0]);
    -[TVSSPrivacyController addControllerObserver:](v4->_privacyController, "addControllerObserver:", v4);
    -[TVSSPrivacyVisualContentView _updatePrivacyAdapterView](v4, "_updatePrivacyAdapterView");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updatePrivacyAdapterView
{
  v4 = -[TVSSPrivacyVisualContentView privacyController](self, "privacyController");
  SEL v3 = -[TVSSPrivacyController privacyState](v4, "privacyState");
  objc_super v2 = -[TVSSPrivacyVisualContentView privacyAdapterView](self, "privacyAdapterView");
  -[TVSSPrivacyStateAdapterView setPrivacyState:](v2, "setPrivacyState:", v3);
}

- (void)privacyControllerStateDidChange:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPrivacyVisualContentView _updatePrivacyAdapterView](v4, "_updatePrivacyAdapterView");
  objc_storeStrong(location, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (TVSSPrivacyStateAdapterView)privacyAdapterView
{
  return self->_privacyAdapterView;
}

- (void)setPrivacyAdapterView:(id)a3
{
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void).cxx_destruct
{
}

@end