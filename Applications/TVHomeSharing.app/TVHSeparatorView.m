@interface TVHSeparatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHSeparatorView)initWithFrame:(CGRect)a3;
- (UIColor)tintColor;
- (UIView)line;
- (double)lineHeight;
- (void)layoutSubviews;
- (void)setLine:(id)a3;
- (void)setLineHeight:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TVHSeparatorView

- (TVHSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHSeparatorView;
  v3 = -[TVHSeparatorView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_10PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_10PercentBlackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_7PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_7PercentWhiteColor"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));
    tintColor = v3->_tintColor;
    v3->_tintColor = (UIColor *)v6;

    v3->_lineHeight = 2.0;
    v8 = objc_alloc_init(&OBJC_CLASS___UIView);
    line = v3->_line;
    v3->_line = v8;

    -[UIView setBackgroundColor:](v3->_line, "setBackgroundColor:", v3->_tintColor);
    -[TVHSeparatorView addSubview:](v3, "addSubview:", v3->_line);
  }

  return v3;
}

- (void)setTintColor:(id)a3
{
  p_tintColor = &self->_tintColor;
  id v7 = a3;
  if ((-[UIColor isEqual:](*p_tintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeparatorView line](self, "line"));
    [v6 setBackgroundColor:*p_tintColor];
  }
}

- (void)setLineHeight:(double)a3
{
  if (BSFloatEqualToFloat(self->_lineHeight, a3))
  {
    self->_lineHeight = a3;
    -[TVHSeparatorView setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[TVHSeparatorView lineHeight](self, "lineHeight", a3.width, a3.height);
  sub_10002EE78(v4);
  double v6 = v5 + 14.0;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v3 = CGRectGetWidth(v7) + -90.0 + -90.0;
  -[TVHSeparatorView lineHeight](self, "lineHeight");
  double v5 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeparatorView line](self, "line"));
  objc_msgSend(v6, "setFrame:", 90.0, 9.0, v3, v5);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (UIView)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end