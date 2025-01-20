@interface TVSSMenuItemHostView
- (BOOL)_hasSelectInPresses:(id)a3;
- (BOOL)canBecomeFocused;
- (NSString)description;
- (TVSSMenuItem)item;
- (TVSSMenuItemHostView)initWithItem:(id)a3;
- (TVSSVisualContentVisualizer)contentView;
- (_UIFloatingContentView)floatingContentView;
- (id)accessibilityIdentifier;
- (id)viewIdentifier;
- (void)_updateContentViewAppearance;
- (void)_updateControlStateWithAnimationCoordinator:(id)a3;
- (void)_updateOrRefreshContentView;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)menuItemVisualContentDidChange:(id)a3;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setContentView:(id)a3;
@end

@implementation TVSSMenuItemHostView

- (id)viewIdentifier
{
  v3 = -[TVSSMenuItemHostView item](self, "item");
  v4 = -[TVSSMenuItem identifier](v3, "identifier");

  return v4;
}

- (TVSSMenuItemHostView)initWithItem:(id)a3
{
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v56;
  v56 = 0LL;
  v54.receiver = v3;
  v54.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostView;
  v56 = -[TVSSMenuItemHostView initWithFrame:]( &v54,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong((id *)&v56, v56);
  if (v56)
  {
    if ([location[0] hasFocusableContent])
    {
      v18 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
      -[TVSSMenuItemHostView bounds](v56, "bounds");
      v8 = -[_UIFloatingContentView initWithFrame:](v18, "initWithFrame:", v4, v5, v6, v7);
      floatingContentView = v56->_floatingContentView;
      v56->_floatingContentView = v8;

      v19 = v56->_floatingContentView;
      sub_1000BE084();
      -[_UIFloatingContentView setContentMotionRotation:translation:]( v19,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  v10,  v11);
      v20 = v56->_floatingContentView;
      v21 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  0LL);
      -[_UIFloatingContentView setFocusAnimationConfiguration:](v20, "setFocusAnimationConfiguration:");

      v22 = v56->_floatingContentView;
      +[TVSSConstants itemFocusedSizeIncrease](&OBJC_CLASS___TVSSConstants, "itemFocusedSizeIncrease");
      -[_UIFloatingContentView setFocusedSizeIncrease:](v22, "setFocusedSizeIncrease:");
      -[_UIFloatingContentView setShadowVerticalOffset:](v56->_floatingContentView, "setShadowVerticalOffset:");
      -[_UIFloatingContentView setShadowRadius:](v56->_floatingContentView, "setShadowRadius:", 10.0);
      -[_UIFloatingContentView setShadowOpacity:](v56->_floatingContentView, "setShadowOpacity:", 0.3);
      v23 = v56->_floatingContentView;
      +[TVSSConstants itemDiameter](&OBJC_CLASS___TVSSConstants, "itemDiameter");
      -[_UIFloatingContentView setCornerRadius:](v23, "setCornerRadius:", v12 / 2.0);
      -[_UIFloatingContentView setUseShadowImage:](v56->_floatingContentView, "setUseShadowImage:", 0LL);
      -[_UIFloatingContentView setContinuousCornerEnabled:]( v56->_floatingContentView,  "setContinuousCornerEnabled:",  0LL);
      -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v56->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      id v24 = -[_UIFloatingContentView contentView](v56->_floatingContentView, "contentView");
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

      -[TVSSMenuItemHostView addSubview:](v56, "addSubview:", v56->_floatingContentView);
      id v53 = -[_UIFloatingContentView leadingAnchor](v56->_floatingContentView, "leadingAnchor");
      id v52 = -[TVSSMenuItemHostView leadingAnchor](v56, "leadingAnchor");
      id v51 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", 4.0);
      v58[0] = v51;
      id v50 = -[_UIFloatingContentView trailingAnchor](v56->_floatingContentView, "trailingAnchor");
      id v49 = -[TVSSMenuItemHostView trailingAnchor](v56, "trailingAnchor");
      id v48 = objc_msgSend(v50, "constraintEqualToAnchor:constant:");
      v58[1] = v48;
      id v47 = -[_UIFloatingContentView topAnchor](v56->_floatingContentView, "topAnchor");
      id v46 = -[TVSSMenuItemHostView topAnchor](v56, "topAnchor");
      id v45 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", 4.0);
      v58[2] = v45;
      id v44 = -[_UIFloatingContentView bottomAnchor](v56->_floatingContentView, "bottomAnchor");
      id v43 = -[TVSSMenuItemHostView bottomAnchor](v56, "bottomAnchor");
      id v42 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", -4.0);
      v58[3] = v42;
      id v41 = -[_UIFloatingContentView leadingAnchor](v56->_floatingContentView, "leadingAnchor");
      id v40 = -[_UIFloatingContentView contentView](v56->_floatingContentView, "contentView");
      id v39 = [v40 leadingAnchor];
      id v38 = objc_msgSend(v41, "constraintEqualToAnchor:");
      v58[4] = v38;
      id v37 = -[_UIFloatingContentView trailingAnchor](v56->_floatingContentView, "trailingAnchor");
      id v36 = -[_UIFloatingContentView contentView](v56->_floatingContentView, "contentView");
      id v35 = [v36 trailingAnchor];
      id v34 = objc_msgSend(v37, "constraintEqualToAnchor:");
      v58[5] = v34;
      id v33 = -[_UIFloatingContentView topAnchor](v56->_floatingContentView, "topAnchor");
      id v32 = -[_UIFloatingContentView contentView](v56->_floatingContentView, "contentView");
      id v31 = [v32 topAnchor];
      id v30 = objc_msgSend(v33, "constraintEqualToAnchor:");
      v58[6] = v30;
      id v29 = -[_UIFloatingContentView bottomAnchor](v56->_floatingContentView, "bottomAnchor");
      id v28 = -[_UIFloatingContentView contentView](v56->_floatingContentView, "contentView");
      id v27 = [v28 bottomAnchor];
      id v26 = objc_msgSend(v29, "constraintEqualToAnchor:");
      v58[7] = v26;
      v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 8LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
    }

    objc_storeStrong((id *)&v56->_item, location[0]);
    -[TVSSMenuItem addMenuItemObserver:](v56->_item, "addMenuItemObserver:", v56);
    v16 = v56;
    uint64_t v57 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL);
    id v13 = -[TVSSMenuItemHostView registerForTraitChanges:withAction:](v16, "registerForTraitChanges:withAction:");

    -[TVSSMenuItemHostView _updateOrRefreshContentView](v56, "_updateOrRefreshContentView");
  }

  v15 = v56;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v56, 0LL);
  return v15;
}

  ;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostView;
  -[TVSSMenuItemHostView pressesEnded:withEvent:](&v6, "pressesEnded:withEvent:", location[0], v7);
  if (-[TVSSMenuItemHostView _hasSelectInPresses:](v9, "_hasSelectInPresses:", location[0]))
  {
    id v5 =  -[TVSSMenuItemHostView targetForAction:withSender:]( v9,  "targetForAction:withSender:",  "didPerformPrimaryActionWithHostView:",  v9);
    [v5 didPerformPrimaryActionWithHostView:v9];
    objc_storeStrong(&v5, 0LL);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;
  -[TVSSMenuItem removeMenuItemObserver:](self->_item, "removeMenuItemObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostView;
  -[TVSSMenuItemHostView dealloc](&v2, "dealloc");
}

- (BOOL)canBecomeFocused
{
  double v11 = self;
  SEL v10 = a2;
  id v5 = -[TVSSMenuItemHostView item](self, "item");
  unsigned __int8 v6 = -[TVSSMenuItem hasFocusableContent](v5, "hasFocusableContent");

  char v9 = v6 & 1;
  id location =  -[TVSSMenuItemHostView targetForAction:withSender:]( v11,  "targetForAction:withSender:",  "environmentAllowsFocus",  v11);
  if (location)
  {
    char v7 = [location environmentAllowsFocus] & 1;
    char v4 = 0;
    if ((v9 & 1) != 0) {
      char v4 = v7;
    }
    char v9 = v4;
  }

  char v3 = v9;
  objc_storeStrong(&location, 0LL);
  return v3 & 1;
}

- (id)accessibilityIdentifier
{
  char v3 = -[TVSSMenuItemHostView item](self, "item");
  char v4 = -[TVSSMenuItem identifier](v3, "identifier");

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostView;
  -[TVSSMenuItemHostView didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v6);
  -[TVSSMenuItemHostView _updateControlStateWithAnimationCoordinator:]( v8,  "_updateControlStateWithAnimationCoordinator:",  v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateControlStateWithAnimationCoordinator:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[TVSSMenuItemHostView isFocused](v18, "isFocused") & 1) != 0)
  {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v18->_floatingContentView,  "setControlState:withAnimationCoordinator:",  8LL,  location[0]);
    id v4 = location[0];
    double v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_1000BE5A4;
    v15 = &unk_1001B5A60;
    v16 = v18;
    objc_msgSend(v4, "addCoordinatedAnimations:completion:", &v11);
    objc_storeStrong((id *)&v16, 0LL);
  }

  else
  {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v18->_floatingContentView,  "setControlState:withAnimationCoordinator:",  0LL,  location[0]);
    id v3 = location[0];
    objc_super v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_1000BE5D4;
    char v9 = &unk_1001B5A60;
    SEL v10 = v18;
    objc_msgSend(v3, "addCoordinatedAnimations:completion:", &v5);
    objc_storeStrong((id *)&v10, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (NSString)description
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostView;
  id v4 = -[TVSSMenuItemHostView description](&v6, "description");
  id v3 = -[TVSSMenuItem description](v8->_item, "description");
  objc_super v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v4, v3);

  return v5;
}

- (void)menuItemVisualContentDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuItemHostView _updateOrRefreshContentView](v4, "_updateOrRefreshContentView");
  objc_storeStrong(location, 0LL);
}

- (void)setContentView:(id)a3
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v35->_contentView != location[0])
  {
    -[TVSSVisualContentVisualizer removeFromSuperview](v35->_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&v35->_contentView, location[0]);
    if (v35->_contentView)
    {
      -[TVSSVisualContentVisualizer setTranslatesAutoresizingMaskIntoConstraints:]( v35->_contentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      if (v35->_floatingContentView)
      {
        id v16 = -[_UIFloatingContentView contentView](v35->_floatingContentView, "contentView");
        [v16 addSubview:v35->_contentView];

        id v33 = -[TVSSVisualContentVisualizer leadingAnchor](v35->_contentView, "leadingAnchor");
        id v32 = -[_UIFloatingContentView contentView](v35->_floatingContentView, "contentView");
        id v31 = [v32 leadingAnchor];
        id v30 = objc_msgSend(v33, "constraintEqualToAnchor:");
        v37[0] = v30;
        id v29 = -[TVSSVisualContentVisualizer trailingAnchor](v35->_contentView, "trailingAnchor");
        id v28 = -[_UIFloatingContentView contentView](v35->_floatingContentView, "contentView");
        id v27 = [v28 trailingAnchor];
        id v26 = objc_msgSend(v29, "constraintEqualToAnchor:");
        v37[1] = v26;
        id v25 = -[TVSSVisualContentVisualizer topAnchor](v35->_contentView, "topAnchor");
        id v24 = -[_UIFloatingContentView contentView](v35->_floatingContentView, "contentView");
        id v23 = [v24 topAnchor];
        id v22 = objc_msgSend(v25, "constraintEqualToAnchor:");
        v37[2] = v22;
        id v21 = -[TVSSVisualContentVisualizer bottomAnchor](v35->_contentView, "bottomAnchor");
        id v20 = -[_UIFloatingContentView contentView](v35->_floatingContentView, "contentView");
        id v19 = [v20 bottomAnchor];
        id v18 = objc_msgSend(v21, "constraintEqualToAnchor:");
        v37[3] = v18;
        v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 4LL);
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
      }

      else
      {
        -[TVSSMenuItemHostView addSubview:](v35, "addSubview:", v35->_contentView);
        id v15 = -[TVSSVisualContentVisualizer leadingAnchor](v35->_contentView, "leadingAnchor");
        id v14 = -[TVSSMenuItemHostView leadingAnchor](v35, "leadingAnchor");
        id v13 = objc_msgSend(v15, "constraintEqualToAnchor:constant:");
        v36[0] = v13;
        id v12 = -[TVSSVisualContentVisualizer trailingAnchor](v35->_contentView, "trailingAnchor");
        id v11 = -[TVSSMenuItemHostView trailingAnchor](v35, "trailingAnchor");
        id v10 = objc_msgSend(v12, "constraintEqualToAnchor:constant:");
        v36[1] = v10;
        id v9 = -[TVSSVisualContentVisualizer topAnchor](v35->_contentView, "topAnchor");
        id v8 = -[TVSSMenuItemHostView topAnchor](v35, "topAnchor");
        id v7 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", 4.0);
        v36[2] = v7;
        id v6 = -[TVSSVisualContentVisualizer bottomAnchor](v35->_contentView, "bottomAnchor");
        id v5 = -[TVSSMenuItemHostView bottomAnchor](v35, "bottomAnchor");
        id v4 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", -4.0);
        v36[3] = v4;
        id v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 4LL);
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
      }
    }

    -[TVSSMenuItemHostView _updateContentViewAppearance](v35, "_updateContentViewAppearance");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateContentViewAppearance
{
  id v12 = self;
  SEL v11 = a2;
  uint64_t v10 = 0LL;
  if ((-[TVSSMenuItemHostView isFocused](self, "isFocused") & 1) != 0)
  {
    uint64_t v10 = 8LL;
  }

  else
  {
    id v5 = -[TVSSMenuItemHostView traitCollection](v12, "traitCollection");
    id location = [v5 objectForTrait:objc_opt_class(TVSSMenuBarActiveItemIdentifierTrait)];

    id v7 = -[TVSSMenuItemHostView item](v12, "item");
    id v6 = -[TVSSMenuItem identifier](v7, "identifier");
    unsigned __int8 v8 = objc_msgSend(location, "isEqual:");

    if ((v8 & 1) != 0) {
      uint64_t v10 = 4LL;
    }
    objc_storeStrong(&location, 0LL);
  }

  id v3 = -[TVSSMenuItemHostView contentView](v12, "contentView");
  char v4 = objc_opt_respondsToSelector(v3, "setVisualizedControlState:");

  if ((v4 & 1) != 0)
  {
    objc_super v2 = -[TVSSMenuItemHostView contentView](v12, "contentView");
    -[TVSSVisualContentVisualizer setVisualizedControlState:](v2, "setVisualizedControlState:", v10);
  }

- (void)_updateOrRefreshContentView
{
  id v21 = self;
  SEL v20 = a2;
  uint64_t v10 = -[TVSSMenuItemHostView item](self, "item");
  id v19 = -[TVSSMenuItem visualContent](v10, "visualContent");

  if (v19)
  {
    Class v18 = (Class)[v19 preferredVisualizerViewClass];
    id v17 = -[TVSSMenuItemHostView contentView](v21, "contentView");
    if (!v17 || (objc_opt_isKindOfClass(v17, v18) & 1) == 0)
    {
      id v16 = objc_alloc_init(v18);
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___UIView);
      if (((objc_opt_isKindOfClass(v16, v2) ^ 1) & 1) != 0)
      {
        id v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expect a UIView class that TVSSMenuItemHostView can host");
        os_log_t oslog = &_os_log_default;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v7 = type;
          id v9 = NSStringFromSelector(v20);
          id v5 = v9;
          id v12 = v5;
          id v3 = (objc_class *)objc_opt_class(v21);
          unsigned __int8 v8 = NSStringFromClass(v3);
          SEL v11 = v8;
          sub_10000583C( (uint64_t)v22,  (uint64_t)v5,  (uint64_t)v11,  (uint64_t)v21,  (uint64_t)@"TVSSMenuItemHostView.m",  218,  (uint64_t)v15);
          _os_log_error_impl( (void *)&_mh_execute_header,  log,  v7,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v22,  0x3Au);

          objc_storeStrong((id *)&v11, 0LL);
          objc_storeStrong((id *)&v12, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        _bs_set_crash_log_message(-[NSString UTF8String](v15, "UTF8String"));
        __break(0);
        JUMPOUT(0x1000BF1DCLL);
      }

      -[TVSSMenuItemHostView setContentView:](v21, "setContentView:", v16);
      objc_storeStrong(&v16, 0LL);
    }

    char v4 = -[TVSSMenuItemHostView contentView](v21, "contentView");
    -[TVSSVisualContentVisualizer setContent:](v4, "setContent:", v19);

    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    -[TVSSMenuItemHostView setContentView:](v21, "setContentView:", 0LL);
  }

  objc_storeStrong(&v19, 0LL);
}

- (BOOL)_hasSelectInPresses:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = objc_msgSend(location[0], "bs_containsObjectPassingTest:", &stru_1001B9EF8);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (TVSSMenuItem)item
{
  return self->_item;
}

- (TVSSVisualContentVisualizer)contentView
{
  return self->_contentView;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void).cxx_destruct
{
}

@end