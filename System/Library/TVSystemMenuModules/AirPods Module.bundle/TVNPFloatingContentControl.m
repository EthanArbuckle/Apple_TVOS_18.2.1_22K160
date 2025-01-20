@interface TVNPFloatingContentControl
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)canBecomeFocused;
- (TVNPFloatingContentControl)init;
- (UIView)contentView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_currentControlState;
- (void)_setupConstraints;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TVNPFloatingContentControl

- (TVNPFloatingContentControl)init
{
  SEL v13 = a2;
  v14 = 0LL;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVNPFloatingContentControl;
  v14 = -[TVNPFloatingContentControl init](&v12, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v2 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v14->_floatingContentView;
    v14->_floatingContentView = v2;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v14->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v8 = v14->_floatingContentView;
    sub_1B9B8();
    v11[1] = v4;
    v11[2] = v5;
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v8,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  *(double *)&v4,  *(double *)&v5);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v14->_floatingContentView, "setFocusedSizeIncrease:", 15.0);
    v9 = v14->_floatingContentView;
    v10 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[_UIFloatingContentView setBackgroundColor:forState:](v9, "setBackgroundColor:forState:");

    -[TVNPFloatingContentControl addSubview:](v14, "addSubview:", v14->_floatingContentView);
    v11[0] = -[_UIFloatingContentView contentView](v14->_floatingContentView, "contentView");
    [v11[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    -[TVNPFloatingContentControl _setupConstraints](v14, "_setupConstraints");
    objc_storeStrong(v11, 0LL);
  }

  v7 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  return v7;
}

  ;
}

- (UIView)contentView
{
  return (UIView *)-[_UIFloatingContentView contentView](self->_floatingContentView, "contentView", a2, self);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( v7->_floatingContentView,  "setControlState:withAnimationCoordinator:",  v5,  location);
  objc_storeStrong(&location, 0LL);
}

- (void)setHighlighted:(BOOL)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPFloatingContentControl;
  -[TVNPFloatingContentControl setHighlighted:](&v3, "setHighlighted:", a3);
  -[_UIFloatingContentView setControlState:animated:]( v6->_floatingContentView,  "setControlState:animated:",  -[TVNPFloatingContentControl _currentControlState](v6, "_currentControlState"),  1LL);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVNPFloatingContentControl _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVNPFloatingContentControl setHighlighted:](v8, "setHighlighted:", 1LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVNPFloatingContentControl;
    -[TVNPFloatingContentControl pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVNPFloatingContentControl _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVNPFloatingContentControl setHighlighted:](v8, "setHighlighted:", 0LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVNPFloatingContentControl;
    -[TVNPFloatingContentControl pressesCancelled:withEvent:](&v5, "pressesCancelled:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if (-[TVNPFloatingContentControl _canHandlePresses:](v8, "_canHandlePresses:", location[0]))
  {
    -[TVNPFloatingContentControl setHighlighted:](v8, "setHighlighted:", 0LL);
    -[TVNPFloatingContentControl sendActionsForControlEvents:](v8, "sendActionsForControlEvents:", 0x2000LL);
  }

  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)&OBJC_CLASS___TVNPFloatingContentControl;
    -[TVNPFloatingContentControl pressesEnded:withEvent:](&v5, "pressesEnded:withEvent:", location[0], v6);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_setupConstraints
{
  v36 = self;
  v35[1] = (id)a2;
  v35[0] = -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v2 = v34;
  id v5 = -[_UIFloatingContentView leadingAnchor](v36->_floatingContentView, "leadingAnchor");
  id v4 = -[TVNPFloatingContentControl leadingAnchor](v36, "leadingAnchor");
  id v3 = objc_msgSend(v5, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v2, "addObject:");

  id v6 = v34;
  id v9 = -[_UIFloatingContentView trailingAnchor](v36->_floatingContentView, "trailingAnchor");
  id v8 = -[TVNPFloatingContentControl trailingAnchor](v36, "trailingAnchor");
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v6, "addObject:");

  v10 = v34;
  id v13 = -[_UIFloatingContentView topAnchor](v36->_floatingContentView, "topAnchor");
  id v12 = -[TVNPFloatingContentControl topAnchor](v36, "topAnchor");
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v10, "addObject:");

  v14 = v34;
  id v17 = -[_UIFloatingContentView bottomAnchor](v36->_floatingContentView, "bottomAnchor");
  id v16 = -[TVNPFloatingContentControl bottomAnchor](v36, "bottomAnchor");
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v14, "addObject:");

  v18 = v34;
  id v21 = -[_UIFloatingContentView leadingAnchor](v36->_floatingContentView, "leadingAnchor");
  id v20 = [v35[0] leadingAnchor];
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v18, "addObject:");

  v22 = v34;
  id v25 = -[_UIFloatingContentView trailingAnchor](v36->_floatingContentView, "trailingAnchor");
  id v24 = [v35[0] trailingAnchor];
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v22, "addObject:");

  v26 = v34;
  id v29 = -[_UIFloatingContentView topAnchor](v36->_floatingContentView, "topAnchor");
  id v28 = [v35[0] topAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v26, "addObject:");

  v30 = v34;
  id v33 = -[_UIFloatingContentView bottomAnchor](v36->_floatingContentView, "bottomAnchor");
  id v32 = [v35[0] bottomAnchor];
  id v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v30, "addObject:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v34);
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong(v35, 0LL);
}

- (BOOL)_canHandlePresses:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = 0;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (unint64_t)_currentControlState
{
  unint64_t v3 = 0LL;
  return v3;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void).cxx_destruct
{
}

@end