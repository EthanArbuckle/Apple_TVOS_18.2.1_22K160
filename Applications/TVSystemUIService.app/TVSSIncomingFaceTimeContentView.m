@interface TVSSIncomingFaceTimeContentView
- (CGSize)intrinsicContentSize;
- (TVSSIncomingFaceTimeContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (unint64_t)visualizedControlState;
- (void)_startAnimating;
- (void)_updateAppearance;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContent:(id)a3;
- (void)setVisualizedControlState:(unint64_t)a3;
@end

@implementation TVSSIncomingFaceTimeContentView

- (TVSSIncomingFaceTimeContentView)initWithFrame:(CGRect)a3
{
  CGRect v27 = a3;
  SEL v25 = a2;
  v26 = 0LL;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSSIncomingFaceTimeContentView;
  v26 = -[TVSSIncomingFaceTimeContentView initWithFrame:]( &v24,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    id v8 = -[TVSSIncomingFaceTimeContentView layer](v26, "layer");
    [v8 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v26->_backgroundColorView;
    v26->_backgroundColorView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v26->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSIncomingFaceTimeContentView addSubview:](v26, "addSubview:", v26->_backgroundColorView);
    id v21 = -[TVSSIncomingFaceTimeContentView leadingAnchor](v26, "leadingAnchor");
    v20 = -[UIView leadingAnchor](v26->_backgroundColorView, "leadingAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v29[0] = v19;
    id v18 = -[TVSSIncomingFaceTimeContentView trailingAnchor](v26, "trailingAnchor");
    v17 = -[UIView trailingAnchor](v26->_backgroundColorView, "trailingAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v29[1] = v16;
    id v15 = -[TVSSIncomingFaceTimeContentView topAnchor](v26, "topAnchor");
    v14 = -[UIView topAnchor](v26->_backgroundColorView, "topAnchor");
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v29[2] = v13;
    id v12 = -[TVSSIncomingFaceTimeContentView bottomAnchor](v26, "bottomAnchor");
    v11 = -[UIView bottomAnchor](v26->_backgroundColorView, "bottomAnchor");
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v29[3] = v10;
    v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v22 = v26;
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL);
    id v5 =  -[TVSSIncomingFaceTimeContentView registerForTraitChanges:withAction:]( v22,  "registerForTraitChanges:withAction:");
  }

  v7 = v26;
  objc_storeStrong((id *)&v26, 0LL);
  return v7;
}

- (void)didMoveToWindow
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSIncomingFaceTimeContentView;
  -[TVSSIncomingFaceTimeContentView didMoveToWindow](&v3, "didMoveToWindow");
  id v2 = -[TVSSIncomingFaceTimeContentView window](v5, "window");

  if (v2) {
    -[TVSSIncomingFaceTimeContentView _startAnimating](v5, "_startAnimating");
  }
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  id v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSSIncomingFaceTimeContentView;
  -[TVSSIncomingFaceTimeContentView layoutSubviews](&v11, "layoutSubviews");
  -[TVSSIncomingFaceTimeContentView bounds](v13, "bounds");
  v10.origin.x = v2;
  v10.origin.y = v3;
  v10.size.width = v4;
  v10.size.height = v5;
  -[UIView setFrame:](v13->_vibrantView, "setFrame:", v2, v3, v4, v5);
  CGRectGetWidth(v10);
  -[TVSSIncomingFaceTimeVisualContent size](v13->_content, "size");
  CGRectGetHeight(v10);
  -[TVSSIncomingFaceTimeVisualContent size](v13->_content, "size");
  -[TVSSIncomingFaceTimeVisualContent size](v13->_content, "size");
  -[TVSSIncomingFaceTimeVisualContent size](v13->_content, "size");
  sub_1000B6028();
  -[BSUICAPackageView setFrame:](v13->_packageView, "setFrame:", v6, v7, v8, v9);
}

  ;
}

- (void)setContent:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17->_content != location[0])
  {
    id v15 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSIncomingFaceTimeVisualContent);
    if ((objc_opt_isKindOfClass(v15, v3) & 1) != 0)
    {
      objc_storeStrong((id *)&v17->_content, location[0]);
      id v13 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
      id v14 = [location[0] packageURL];
      double v4 = -[BSUICAPackageView initWithURL:](v13, "initWithURL:");
      packageView = v17->_packageView;
      v17->_packageView = v4;

      -[BSUICAPackageView setContentMode:](v17->_packageView, "setContentMode:", 4LL);
      if (!v17->_vibrantView)
      {
        SEL v12 = objc_alloc(&OBJC_CLASS___UIView);
        -[TVSSIncomingFaceTimeContentView bounds](v17, "bounds");
        CGRect v10 = -[UIView initWithFrame:](v12, "initWithFrame:", v6, v7, v8, v9);
        vibrantView = v17->_vibrantView;
        v17->_vibrantView = v10;

        -[TVSSIncomingFaceTimeContentView addSubview:](v17, "addSubview:", v17->_vibrantView);
      }

      -[UIView setMaskView:](v17->_vibrantView, "setMaskView:", v17->_packageView);
      -[TVSSIncomingFaceTimeContentView _updateAppearance](v17, "_updateAppearance");
      -[TVSSIncomingFaceTimeContentView setNeedsLayout](v17, "setNeedsLayout");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setVisualizedControlState:(unint64_t)a3
{
  if (self->_visualizedControlState != a3)
  {
    self->_visualizedControlState = a3;
    -[TVSSIncomingFaceTimeContentView _updateAppearance](self, "_updateAppearance");
    if (self->_visualizedControlState == 4) {
      -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", @"Selected", 1LL);
    }
    else {
      -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", @"Focused", 1LL);
    }
  }

- (void)_startAnimating
{
  double v2 = CACurrentMediaTime();
  id v3 = -[BSUICAPackageView layer](self->_packageView, "layer");
  [v3 setBeginTime:v2];
}

- (void)_updateAppearance
{
  v20 = self;
  SEL v19 = a2;
  id v11 = -[TVSSIncomingFaceTimeContentView traitCollection](self, "traitCollection");
  BOOL v12 = [v11 userInterfaceStyle] == (id)2;

  BOOL v18 = v12;
  id v17 = 0LL;
  id v16 = 0LL;
  id location = 0LL;
  id v14 = 0LL;
  unint64_t visualizedControlState = v20->_visualizedControlState;
  if (visualizedControlState <= 8) {
    __asm { BR              X8 }
  }

  if (v18) {
    uint64_t v10 = kCAFilterPlusL;
  }
  else {
    uint64_t v10 = kCAFilterPlusD;
  }
  double v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v10);
  id v3 = v17;
  id v17 = v2;

  double v4 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  double v5 = v16;
  id v16 = v4;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v14, 0LL);
  id v6 = v17;
  double v7 = -[UIView layer](v20->_vibrantView, "layer");
  -[CALayer setCompositingFilter:](v7, "setCompositingFilter:", v6);

  -[UIView setBackgroundColor:](v20->_vibrantView, "setBackgroundColor:", v16);
  id v8 = location;
  double v9 = -[UIView layer](v20->_backgroundColorView, "layer");
  -[CALayer setCompositingFilter:](v9, "setCompositingFilter:", v8);

  -[UIView setBackgroundColor:](v20->_backgroundColorView, "setBackgroundColor:", v14);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
}

- (TVSSVisualContent)content
{
  return (TVSSVisualContent *)self->_content;
}

- (unint64_t)visualizedControlState
{
  return self->_visualizedControlState;
}

- (void).cxx_destruct
{
}

@end