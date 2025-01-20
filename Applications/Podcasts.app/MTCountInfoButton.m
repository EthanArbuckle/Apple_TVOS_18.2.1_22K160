@interface MTCountInfoButton
- (CGSize)buttonSize;
- (CGSize)labelSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTCountInfoButton)initWithFrame:(CGRect)a3;
- (MTTouchInsetsButton)button;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)label;
- (id)_createLabelTextForCurrentState;
- (unint64_t)count;
- (unint64_t)index;
- (void)_updateLabelText;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setFont:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIndex:(unint64_t)a3 forCount:(unint64_t)a4;
- (void)setLabel:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MTCountInfoButton

- (MTCountInfoButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCountInfoButton;
  v3 = -[MTCountInfoButton initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](v3, "button"));
    -[MTCountInfoButton addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](v4, "label"));
    -[MTCountInfoButton addSubview:](v4, "addSubview:", v6);
  }

  return v4;
}

- (void)setIndex:(unint64_t)a3 forCount:(unint64_t)a4
{
  if (self->_index != a3)
  {
    self->_index = a3;
    p_count = &self->_count;
    if (self->_count == a4)
    {
_objc_msgSend$_updateLabelText:
      -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
      return;
    }

- (void)setIndex:(unint64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
  }

- (void)setCount:(unint64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
  }

- (UIFont)font
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 font]);

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v5 setFont:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v6 sizeToFit];

  -[MTCountInfoButton setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)textColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 textColor]);

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v5 setTextColor:v4];
}

- (void)_updateLabelText
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton _createLabelTextForCurrentState](self, "_createLabelTextForCurrentState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v4 setText:v3];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v5 sizeToFit];

  -[MTCountInfoButton setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createLabelTextForCurrentState
{
  if (-[MTCountInfoButton index](self, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"%@ of %@" value:&stru_100248948 table:0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (char *)-[MTCountInfoButton index](self, "index") + 1));
    uint64_t v7 = IMAccessibilityLocalizedNumber();
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unint64_t v9 = -[MTCountInfoButton count](self, "count");
    if (v9 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    uint64_t v12 = IMAccessibilityLocalizedNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v8, v13));
  }

  return v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTCountInfoButton;
  -[MTCountInfoButton layoutSubviews](&v18, "layoutSubviews");
  -[MTCountInfoButton bounds](self, "bounds");
  double v4 = v3;
  -[MTCountInfoButton buttonSize](self, "buttonSize");
  double v6 = v5;
  double v8 = v7;
  double v9 = IMRoundToPixel((v4 - v5) * 0.5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](self, "button"));
  objc_msgSend(v10, "setFrame:", v9, 0.0, v6, v8);

  -[MTCountInfoButton labelSize](self, "labelSize");
  double v12 = v11;
  double v14 = v13;
  double v15 = IMRoundToPixel((v4 - v11) * 0.5);
  v19.origin.y = 0.0;
  v19.origin.x = v9;
  v19.size.width = v6;
  v19.size.height = v8;
  CGFloat v16 = CGRectGetMaxY(v19) + 5.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v17, "setFrame:", v15, v16, v12, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v5 = v4;
  double v7 = v6;
  -[MTCountInfoButton labelSize](self, "labelSize");
  if (v5 >= v8) {
    double v8 = v5;
  }
  double v10 = v7 + 5.0 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)buttonSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](self, "button"));
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)labelSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)buttonTapped:(id)a3
{
}

- (MTTouchInsetsButton)button
{
  button = self->_button;
  if (!button)
  {
    double v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue( +[MTTouchInsetsButton buttonWithType:]( &OBJC_CLASS___MTTouchInsetsButton,  "buttonWithType:",  1LL));
    double v5 = self->_button;
    self->_button = v4;

    double v6 = self->_button;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage infoIcon](&OBJC_CLASS___UIImage, "infoIcon"));
    -[MTTouchInsetsButton setImage:forState:](v6, "setImage:forState:", v7, 0LL);

    -[MTTouchInsetsButton setTouchInsets:](self->_button, "setTouchInsets:", -15.0, -8.0, -15.0, -15.0);
    -[MTTouchInsetsButton addTarget:action:forControlEvents:]( self->_button,  "addTarget:action:forControlEvents:",  self,  "buttonTapped:",  64LL);
    -[MTTouchInsetsButton sizeToFit](self->_button, "sizeToFit");
    button = self->_button;
  }

  return button;
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    double v5 = self->_label;
    self->_label = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton font](self, "font"));
    -[UILabel setFont:](self->_label, "setFont:", v6);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton textColor](self, "textColor"));
    -[UILabel setTextColor:](self->_label, "setTextColor:", v7);

    label = self->_label;
  }

  return label;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setButton:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end