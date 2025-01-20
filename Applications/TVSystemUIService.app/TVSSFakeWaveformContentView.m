@interface TVSSFakeWaveformContentView
- (CGSize)intrinsicContentSize;
- (TVSSFakeWaveformContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (unint64_t)visualizedControlState;
- (void)_startAnimating;
- (void)_updateAppearance;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContent:(id)a3;
- (void)setVisualizedControlState:(unint64_t)a3;
@end

@implementation TVSSFakeWaveformContentView

- (TVSSFakeWaveformContentView)initWithFrame:(CGRect)a3
{
  CGRect v28 = a3;
  SEL v26 = a2;
  p_isa = 0LL;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVSSFakeWaveformContentView;
  v24 = -[TVSSFakeWaveformContentView initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  p_isa = (id *)&v24->super.super.super.isa;
  objc_storeStrong((id *)&p_isa, v24);
  if (v24)
  {
    id v8 = [p_isa layer];
    [v8 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    id v4 = p_isa[1];
    p_isa[1] = v3;

    [p_isa[1] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[1]];
    id v21 = [p_isa leadingAnchor];
    id v20 = [p_isa[1] leadingAnchor];
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v30[0] = v19;
    id v18 = [p_isa trailingAnchor];
    id v17 = [p_isa[1] trailingAnchor];
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v30[1] = v16;
    id v15 = [p_isa topAnchor];
    id v14 = [p_isa[1] topAnchor];
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v30[2] = v13;
    id v12 = [p_isa bottomAnchor];
    id v11 = [p_isa[1] bottomAnchor];
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v30[3] = v10;
    v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v22 = p_isa;
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL);
    id v5 = objc_msgSend(v22, "registerForTraitChanges:withAction:");
  }

  v7 = p_isa;
  objc_storeStrong((id *)&p_isa, 0LL);
  return v7;
}

- (void)didMoveToWindow
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSFakeWaveformContentView;
  -[TVSSFakeWaveformContentView didMoveToWindow](&v3, "didMoveToWindow");
  id v2 = -[TVSSFakeWaveformContentView window](v5, "window");

  if (v2) {
    -[TVSSFakeWaveformContentView _startAnimating](v5, "_startAnimating");
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
  v11.super_class = (Class)&OBJC_CLASS___TVSSFakeWaveformContentView;
  -[TVSSFakeWaveformContentView layoutSubviews](&v11, "layoutSubviews");
  -[TVSSFakeWaveformContentView bounds](v13, "bounds");
  v10.origin.x = v2;
  v10.origin.y = v3;
  v10.size.width = v4;
  v10.size.height = v5;
  -[UIView setFrame:](v13->_vibrantView, "setFrame:", v2, v3, v4, v5);
  CGRectGetWidth(v10);
  -[TVSSFakeWaveformContent size](v13->_content, "size");
  CGRectGetHeight(v10);
  -[TVSSFakeWaveformContent size](v13->_content, "size");
  -[TVSSFakeWaveformContent size](v13->_content, "size");
  -[TVSSFakeWaveformContent size](v13->_content, "size");
  sub_1001186EC();
  -[BSUICAPackageView setFrame:](v13->_packageView, "setFrame:", v6, v7, v8, v9);
}

  ;
}

- (void)setContent:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17->_content != location[0])
  {
    id v15 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSFakeWaveformContent);
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
        -[TVSSFakeWaveformContentView bounds](v17, "bounds");
        CGRect v10 = -[UIView initWithFrame:](v12, "initWithFrame:", v6, v7, v8, v9);
        vibrantView = v17->_vibrantView;
        v17->_vibrantView = v10;

        -[TVSSFakeWaveformContentView addSubview:](v17, "addSubview:", v17->_vibrantView);
      }

      -[UIView setMaskView:](v17->_vibrantView, "setMaskView:", v17->_packageView);
      -[TVSSFakeWaveformContentView _updateAppearance](v17, "_updateAppearance");
      -[TVSSFakeWaveformContentView setNeedsLayout](v17, "setNeedsLayout");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setVisualizedControlState:(unint64_t)a3
{
  if (self->_visualizedControlState != a3)
  {
    self->_visualizedControlState = a3;
    -[TVSSFakeWaveformContentView _updateAppearance](self, "_updateAppearance");
  }

- (void)_startAnimating
{
  double v2 = CACurrentMediaTime();
  id v3 = -[BSUICAPackageView layer](self->_packageView, "layer");
  [v3 setBeginTime:v2];
}

- (void)_updateAppearance
{
  id v19 = self;
  SEL v18 = a2;
  id v10 = -[TVSSFakeWaveformContentView traitCollection](self, "traitCollection");
  BOOL v11 = [v10 userInterfaceStyle] == (id)2;

  BOOL v17 = v11;
  id v16 = 0LL;
  id v15 = 0LL;
  id location = 0LL;
  id v13 = 0LL;
  unint64_t visualizedControlState = v19->_visualizedControlState;
  if (visualizedControlState <= 8) {
    __asm { BR              X8 }
  }

  if (v17) {
    uint64_t v9 = kCAFilterPlusL;
  }
  else {
    uint64_t v9 = kCAFilterPlusD;
  }
  double v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v9);
  id v3 = v16;
  id v16 = v2;

  double v4 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  double v5 = v15;
  id v15 = v4;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v13, 0LL);
  -[UIView setBackgroundColor:](v19->_vibrantView, "setBackgroundColor:", v15);
  id v6 = v16;
  double v7 = -[UIView layer](v19->_vibrantView, "layer");
  -[CALayer setCompositingFilter:](v7, "setCompositingFilter:", v6);

  -[UIView setBackgroundColor:](v19->_backgroundColorView, "setBackgroundColor:", v13);
  double v8 = -[UIView layer](v19->_backgroundColorView, "layer");
  -[CALayer setCompositingFilter:](v8, "setCompositingFilter:", location);

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
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