@interface TVSSDoNotDisturbRenderer
- (BOOL)isFocused;
- (TVSSDoNotDisturbRenderer)initWithIdentifier:(id)a3 doNotDisturbControllerer:(id)a4;
- (TVSSDoNotDisturbRenderer)initWithIdentifier:(id)a3 doNotDisturbControllerer:(id)a4 overrideStylings:(id)a5;
- (void)_updateForUserInterfaceStyleChange;
- (void)configureContentView:(id)a3;
- (void)dealloc;
- (void)doNotDisturbControllerDidUpdate:(id)a3;
- (void)setFocused:(BOOL)a3;
- (void)updateContentView;
- (void)updatePackageViewStateAnimated:(BOOL)a3;
@end

@implementation TVSSDoNotDisturbRenderer

- (TVSSDoNotDisturbRenderer)initWithIdentifier:(id)a3 doNotDisturbControllerer:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0LL;
  v10 = -[TVSSDoNotDisturbRenderer initWithIdentifier:doNotDisturbControllerer:overrideStylings:]( v4,  "initWithIdentifier:doNotDisturbControllerer:overrideStylings:",  location[0],  v8,  &__NSArray0__struct);
  v7 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (TVSSDoNotDisturbRenderer)initWithIdentifier:(id)a3 doNotDisturbControllerer:(id)a4 overrideStylings:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0LL;
  v11.receiver = v5;
  v11.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbRenderer;
  v10 = -[TVSSDoNotDisturbRenderer initWithIdentifier:format:content:overrideStylings:]( &v11,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  12LL,  v13,  v12);
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_doNotDisturbController, v13);
    [v13 addObserver:v15];
  }

  v7 = v15;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSDoNotDisturbController removeObserver:](self->_doNotDisturbController, "removeObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbRenderer;
  -[TVSSDoNotDisturbRenderer dealloc](&v2, "dealloc");
}

- (void)configureContentView:(id)a3
{
  v57 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v46 = location[0];
  id v3 = -[TVSSDoNotDisturbRenderer contentView](v57, "contentView");
  BOOL v47 = v46 != v3;

  BOOL v55 = v47;
  if (v47)
  {
    BOOL v4 = v57->_traitChangeRegistration == 0LL;
    char v53 = 0;
    BOOL v45 = 0;
    if (!v4)
    {
      id v54 = -[TVSSDoNotDisturbRenderer contentView](v57, "contentView");
      char v53 = 1;
      BOOL v45 = v54 != 0LL;
    }

    if ((v53 & 1) != 0) {

    }
    if (v45)
    {
      id v44 = -[TVSSDoNotDisturbRenderer contentView](v57, "contentView");
      [v44 unregisterForTraitChanges:v57->_traitChangeRegistration];
    }

    id v42 = location[0];
    uint64_t v59 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v43 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL);
    v5 = (UITraitChangeRegistration *)objc_msgSend(v42, "registerForTraitChanges:withTarget:action:");
    traitChangeRegistration = v57->_traitChangeRegistration;
    v57->_traitChangeRegistration = v5;
  }

  v52.receiver = v57;
  v52.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbRenderer;
  -[TVSSDoNotDisturbRenderer configureContentView:](&v52, "configureContentView:", location[0]);
  id v14 = [location[0] traitCollection];
  if ([v14 userInterfaceStyle] == (id)2) {
    v7 = @"DoNotDisturb-Dark";
  }
  else {
    v7 = @"DoNotDisturb-Light";
  }
  v51 = v7;

  v16 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  v15 = v51;
  v17 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v8 = -[BSUICAPackageView initWithPackageName:inBundle:](v16, "initWithPackageName:inBundle:", v15);
  packageView = v57->_packageView;
  v57->_packageView = v8;

  [location[0] addSubview:v57->_packageView];
  v18 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  v19 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 = -[BSUICAPackageView initWithPackageName:inBundle:]( v18,  "initWithPackageName:inBundle:",  @"DoNotDisturb-Light");
  focusedPackageView = v57->_focusedPackageView;
  v57->_focusedPackageView = v10;

  [location[0] addSubview:v57->_focusedPackageView];
  -[TVSSDoNotDisturbRenderer updatePackageViewStateAnimated:](v57, "updatePackageViewStateAnimated:", 0LL);
  +[TVSPConstants controlCenterGlyphPointSize](&OBJC_CLASS___TVSPConstants, "controlCenterGlyphPointSize");
  +[TVSPConstants controlCenterGlyphPointSize](&OBJC_CLASS___TVSPConstants, "controlCenterGlyphPointSize");
  sub_100020BAC();
  double v49 = v12;
  double v50 = v13;
  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v57->_packageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v57->_focusedPackageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v20 = -[TVSSDoNotDisturbRenderer subviews](v57, "subviews");
  id v48 = [v20 imageView];

  [v48 setHidden:1];
  id v41 = -[BSUICAPackageView centerXAnchor](v57->_packageView, "centerXAnchor");
  id v40 = [v48 centerXAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v58[0] = v39;
  id v38 = -[BSUICAPackageView centerYAnchor](v57->_packageView, "centerYAnchor");
  id v37 = [v48 centerYAnchor];
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v58[1] = v36;
  id v35 = -[BSUICAPackageView widthAnchor](v57->_packageView, "widthAnchor");
  id v34 = [v35 constraintEqualToConstant:v49];
  v58[2] = v34;
  id v33 = -[BSUICAPackageView heightAnchor](v57->_packageView, "heightAnchor");
  id v32 = [v33 constraintEqualToConstant:v50];
  v58[3] = v32;
  id v31 = -[BSUICAPackageView centerXAnchor](v57->_focusedPackageView, "centerXAnchor");
  id v30 = [v48 centerXAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v58[4] = v29;
  id v28 = -[BSUICAPackageView centerYAnchor](v57->_focusedPackageView, "centerYAnchor");
  id v27 = [v48 centerYAnchor];
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v58[5] = v26;
  id v25 = -[BSUICAPackageView widthAnchor](v57->_focusedPackageView, "widthAnchor");
  id v24 = [v25 constraintEqualToConstant:v49];
  v58[6] = v24;
  id v23 = -[BSUICAPackageView heightAnchor](v57->_focusedPackageView, "heightAnchor");
  id v22 = [v23 constraintEqualToConstant:v50];
  v58[7] = v22;
  v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 8LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSDoNotDisturbRenderer updateContentView](v57, "updateContentView");
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)updateContentView
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbRenderer;
  -[TVSSDoNotDisturbRenderer updateContentView](&v4, "updateContentView");
  unsigned __int8 v2 = -[TVSSDoNotDisturbRenderer isFocused](v6, "isFocused");
  -[BSUICAPackageView setHidden:](v6->_packageView, "setHidden:", v2 & 1);
  unsigned __int8 v3 = -[TVSSDoNotDisturbRenderer isFocused](v6, "isFocused");
  -[BSUICAPackageView setHidden:](v6->_focusedPackageView, "setHidden:", (v3 ^ 1) & 1);
}

- (void)setFocused:(BOOL)a3
{
  self->_focused = a3;
  -[TVSSDoNotDisturbRenderer reloadContent](self, "reloadContent");
}

- (void)updatePackageViewStateAnimated:(BOOL)a3
{
  BOOL v7 = a3;
  packageView = self->_packageView;
  if (-[TVSSDoNotDisturbController isEnabled](self->_doNotDisturbController, "isEnabled")) {
    unsigned __int8 v3 = @"ON";
  }
  else {
    unsigned __int8 v3 = @"OFF";
  }
  -[BSUICAPackageView setState:animated:](packageView, "setState:animated:", v3, v7);
  focusedPackageView = self->_focusedPackageView;
  if (-[TVSSDoNotDisturbController isEnabled](self->_doNotDisturbController, "isEnabled")) {
    objc_super v4 = @"ON";
  }
  else {
    objc_super v4 = @"OFF";
  }
  -[BSUICAPackageView setState:animated:](focusedPackageView, "setState:animated:", v4, v7);
}

- (void)_updateForUserInterfaceStyleChange
{
  id v2 = -[TVSSDoNotDisturbRenderer contentView](self, "contentView");
  BOOL v4 = v2 != 0LL;

  if (v4)
  {
    -[BSUICAPackageView removeFromSuperview](self->_packageView, "removeFromSuperview");
    -[BSUICAPackageView removeFromSuperview](self->_focusedPackageView, "removeFromSuperview");
    id v3 = -[TVSSDoNotDisturbRenderer contentView](self, "contentView");
    -[TVSSDoNotDisturbRenderer configureContentView:](self, "configureContentView:");
  }

- (void)doNotDisturbControllerDidUpdate:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSDoNotDisturbRenderer updatePackageViewStateAnimated:](v4, "updatePackageViewStateAnimated:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void).cxx_destruct
{
}

@end