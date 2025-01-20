@interface TVSBVideoBulletinChinButton
- (TVSBVideoBulletinChinButton)init;
- (_UIFloatingContentView)floatingContentView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVSBVideoBulletinChinButton

- (TVSBVideoBulletinChinButton)init
{
  SEL v28 = a2;
  v29 = 0LL;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  v26 = -[TVSBVideoBulletinChinButton initWithFrame:]( &v27,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v29 = v26;
  objc_storeStrong((id *)&v29, v26);
  if (v26)
  {
    v2 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v29->_floatingContentView;
    v29->_floatingContentView = v2;

    -[TVSBVideoBulletinChinButton insertSubview:atIndex:](v29, "insertSubview:atIndex:", v29->_floatingContentView, 0LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v29->_floatingContentView, "setFocusedSizeIncrease:", 10.0);
    v8 = v29->_floatingContentView;
    sub_100014D14();
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v8,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  v4,  v5);
    v9 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL);
    -[_UIFloatingContentView setFocusAnimationConfiguration:]( v29->_floatingContentView,  "setFocusAnimationConfiguration:");

    -[_UIFloatingContentView setShadowRadius:](v29->_floatingContentView, "setShadowRadius:", 16.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v29->_floatingContentView, "setShadowVerticalOffset:", 25.0);
    -[_UIFloatingContentView setShadowOpacity:](v29->_floatingContentView, "setShadowOpacity:", 0.2);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v29->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    v11 =  +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  28.0,  UIFontWeightMedium);
    id v10 = -[TVSBVideoBulletinChinButton titleLabel](v29, "titleLabel");
    [v10 setFont:v11];

    id v13 = -[_UIFloatingContentView contentView](v29->_floatingContentView, "contentView");
    id v12 = -[TVSBVideoBulletinChinButton titleLabel](v29, "titleLabel");
    objc_msgSend(v13, "addSubview:");

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v29->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v16 = -[_UIFloatingContentView leadingAnchor](v29->_floatingContentView, "leadingAnchor");
    id v15 = -[TVSBVideoBulletinChinButton leadingAnchor](v29, "leadingAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    [v14 setActive:1];

    id v19 = -[_UIFloatingContentView trailingAnchor](v29->_floatingContentView, "trailingAnchor");
    id v18 = -[TVSBVideoBulletinChinButton trailingAnchor](v29, "trailingAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    [v17 setActive:1];

    id v22 = -[_UIFloatingContentView topAnchor](v29->_floatingContentView, "topAnchor");
    id v21 = -[TVSBVideoBulletinChinButton topAnchor](v29, "topAnchor");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
    [v20 setActive:1];

    id v25 = -[_UIFloatingContentView bottomAnchor](v29->_floatingContentView, "bottomAnchor");
    id v24 = -[TVSBVideoBulletinChinButton bottomAnchor](v29, "bottomAnchor");
    id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
    [v23 setActive:1];
  }

  v7 = v29;
  objc_storeStrong((id *)&v29, 0LL);
  return v7;
}

  ;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  -[TVSBVideoBulletinChinButton didUpdateFocusInContext:withAnimationCoordinator:]( &v6,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v7);
  -[TVSBVideoBulletinChinButton sendSubviewToBack:](v9, "sendSubviewToBack:", v9->_floatingContentView);
  id v4 = -[TVSBVideoBulletinChinButton state](v9, "state");
  -[_UIFloatingContentView setControlState:](v9->_floatingContentView, "setControlState:", v4);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  -[TVSBVideoBulletinChinButton pressesBegan:withEvent:](&v6, "pressesBegan:withEvent:", location[0], v7);
  -[TVSBVideoBulletinChinButton sendSubviewToBack:](v9, "sendSubviewToBack:", v9->_floatingContentView);
  id v4 = -[TVSBVideoBulletinChinButton state](v9, "state");
  -[_UIFloatingContentView setControlState:](v9->_floatingContentView, "setControlState:", v4);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  -[TVSBVideoBulletinChinButton pressesChanged:withEvent:](&v6, "pressesChanged:withEvent:", location[0], v7);
  -[TVSBVideoBulletinChinButton sendSubviewToBack:](v9, "sendSubviewToBack:", v9->_floatingContentView);
  id v4 = -[TVSBVideoBulletinChinButton state](v9, "state");
  -[_UIFloatingContentView setControlState:](v9->_floatingContentView, "setControlState:", v4);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
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
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  -[TVSBVideoBulletinChinButton pressesEnded:withEvent:](&v6, "pressesEnded:withEvent:", location[0], v7);
  -[TVSBVideoBulletinChinButton sendSubviewToBack:](v9, "sendSubviewToBack:", v9->_floatingContentView);
  id v4 = -[TVSBVideoBulletinChinButton state](v9, "state");
  -[_UIFloatingContentView setControlState:](v9->_floatingContentView, "setControlState:", v4);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinChinButton;
  -[TVSBVideoBulletinChinButton pressesCancelled:withEvent:](&v6, "pressesCancelled:withEvent:", location[0], v7);
  -[TVSBVideoBulletinChinButton sendSubviewToBack:](v9, "sendSubviewToBack:", v9->_floatingContentView);
  id v4 = -[TVSBVideoBulletinChinButton state](v9, "state");
  -[_UIFloatingContentView setControlState:](v9->_floatingContentView, "setControlState:", v4);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void).cxx_destruct
{
}

@end