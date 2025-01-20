@interface TVSSTextContentView
- (CGSize)intrinsicContentSize;
- (TVSSTextContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (UIColor)currentTintColor;
- (UILabel)label;
- (UIView)backgroundColorView;
- (id)_textContent;
- (unint64_t)visualizedControlState;
- (void)_updateAppearance;
- (void)_updateContent;
- (void)setBackgroundColorView:(id)a3;
- (void)setContent:(id)a3;
- (void)setCurrentTintColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setVisualizedControlState:(unint64_t)a3;
@end

@implementation TVSSTextContentView

- (TVSSTextContentView)initWithFrame:(CGRect)a3
{
  CGRect v41 = a3;
  SEL v39 = a2;
  v40 = 0LL;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___TVSSTextContentView;
  v40 = -[TVSSTextContentView initWithFrame:]( &v38,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v40, v40);
  if (v40)
  {
    v40->_visualizedControlState = 0LL;
    id v10 = -[TVSSTextContentView layer](v40, "layer");
    [v10 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v40->_backgroundColorView;
    v40->_backgroundColorView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v40->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSTextContentView addSubview:](v40, "addSubview:", v40->_backgroundColorView);
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v40->_label;
    v40->_label = v5;

    -[UILabel setTextAlignment:](v40->_label, "setTextAlignment:");
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v40->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSTextContentView addSubview:](v40, "addSubview:", v40->_label);
    id v35 = -[TVSSTextContentView leadingAnchor](v40, "leadingAnchor");
    v34 = -[UIView leadingAnchor](v40->_backgroundColorView, "leadingAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v43[0] = v33;
    id v32 = -[TVSSTextContentView trailingAnchor](v40, "trailingAnchor");
    v31 = -[UIView trailingAnchor](v40->_backgroundColorView, "trailingAnchor");
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v43[1] = v30;
    id v29 = -[TVSSTextContentView topAnchor](v40, "topAnchor");
    v28 = -[UIView topAnchor](v40->_backgroundColorView, "topAnchor");
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
    v43[2] = v27;
    id v26 = -[TVSSTextContentView bottomAnchor](v40, "bottomAnchor");
    v25 = -[UIView bottomAnchor](v40->_backgroundColorView, "bottomAnchor");
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
    v43[3] = v24;
    id v23 = -[TVSSTextContentView leadingAnchor](v40, "leadingAnchor");
    id v22 = -[UILabel leadingAnchor](v40->_label, "leadingAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    v43[4] = v21;
    id v20 = -[TVSSTextContentView trailingAnchor](v40, "trailingAnchor");
    id v19 = -[UILabel trailingAnchor](v40->_label, "trailingAnchor");
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v43[5] = v18;
    id v17 = -[TVSSTextContentView topAnchor](v40, "topAnchor");
    id v16 = -[UILabel topAnchor](v40->_label, "topAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
    v43[6] = v15;
    id v14 = -[TVSSTextContentView bottomAnchor](v40, "bottomAnchor");
    id v13 = -[UILabel bottomAnchor](v40->_label, "bottomAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v43[7] = v12;
    v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 8LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSTextContentView _updateAppearance](v40, "_updateAppearance");
    v36 = v40;
    uint64_t v42 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v37 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL);
    id v7 = -[TVSSTextContentView registerForTraitChanges:withAction:](v36, "registerForTraitChanges:withAction:");
  }

  v9 = v40;
  objc_storeStrong((id *)&v40, 0LL);
  return v9;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

  ;
}

- (void)setVisualizedControlState:(unint64_t)a3
{
  if (self->_visualizedControlState != a3)
  {
    self->_visualizedControlState = a3;
    -[TVSSTextContentView _updateAppearance](self, "_updateAppearance");
  }

- (void)setContent:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_content != location[0])
  {
    objc_storeStrong((id *)&v4->_content, location[0]);
    -[TVSSTextContentView _updateContent](v4, "_updateContent");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_textContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSTextContent);
  return sub_100063A10(content, v2);
}

- (void)_updateContent
{
  id v17 = self;
  v16[1] = (id)a2;
  id v9 = -[TVSSTextContentView _textContent](self, "_textContent");
  v16[0] = [v9 string];

  id v10 = -[TVSSTextContentView _textContent](v17, "_textContent");
  id v15 = [v10 font];

  id v14 = -[TVSSTextContentView currentTintColor](v17, "currentTintColor");
  id v11 = -[TVSSTextContentView _textContent](v17, "_textContent");
  id v13 = [v11 textEncapsulation];

  [v13 setColor:v14];
  if (v13)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    v18[0] = NSFontAttributeName;
    v19[0] = v15;
    v18[1] = NSTextEncapsulationAttributeName;
    v19[1] = v13;
    v18[2] = NSForegroundColorAttributeName;
    v19[2] = v14;
    v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL);
    id v12 = -[NSAttributedString initWithString:attributes:](v5, "initWithString:attributes:", v16[0]);

    id v7 = v12;
    v8 = -[TVSSTextContentView label](v17, "label");
    -[UILabel setAttributedText:](v8, "setAttributedText:", v7);

    objc_storeStrong((id *)&v12, 0LL);
  }

  else
  {
    uint64_t v2 = -[TVSSTextContentView label](v17, "label");
    -[UILabel setText:](v2, "setText:", v16[0]);

    double v3 = -[TVSSTextContentView label](v17, "label");
    -[UILabel setFont:](v3, "setFont:", v15);

    v4 = -[TVSSTextContentView label](v17, "label");
    -[UILabel setTextColor:](v4, "setTextColor:", v14);
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(v16, 0LL);
}

- (void)_updateAppearance
{
  id v20 = self;
  SEL v19 = a2;
  id v11 = -[TVSSTextContentView traitCollection](self, "traitCollection");
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
  uint64_t v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v10);
  id v3 = v17;
  id v17 = v2;

  v4 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  v5 = v16;
  id v16 = v4;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v14, 0LL);
  -[TVSSTextContentView setCurrentTintColor:](v20, "setCurrentTintColor:", v16);
  -[TVSSTextContentView _updateContent](v20, "_updateContent");
  id v7 = -[TVSSTextContentView label](v20, "label");
  id v6 = -[UILabel layer](v7, "layer");
  [v6 setCompositingFilter:v17];

  -[UIView setBackgroundColor:](v20->_backgroundColorView, "setBackgroundColor:", v14);
  id v9 = -[TVSSTextContentView backgroundColorView](v20, "backgroundColorView");
  v8 = -[UIView layer](v9, "layer");
  -[CALayer setCompositingFilter:](v8, "setCompositingFilter:", location);

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (unint64_t)visualizedControlState
{
  return self->_visualizedControlState;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIColor)currentTintColor
{
  return self->_currentTintColor;
}

- (void)setCurrentTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end