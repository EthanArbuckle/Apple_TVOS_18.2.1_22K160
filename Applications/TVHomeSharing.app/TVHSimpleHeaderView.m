@interface TVHSimpleHeaderView
- (BOOL)centersLabel;
- (TVHSimpleHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)layoutSubviews;
- (void)setCentersLabel:(BOOL)a3;
@end

@implementation TVHSimpleHeaderView

- (TVHSimpleHeaderView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHSimpleHeaderView;
  v3 = -[TVHSimpleHeaderView initWithFrame:]( &v12,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel setOpaque:](v3->_label, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", 0LL);
    -[UILabel setMinimumScaleFactor:](v3->_label, "setMinimumScaleFactor:", 0.7);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_label, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 2LL);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1LL);
    v6 = v3->_label;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  3LL,  7LL));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_60PercentWhiteColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v8,  v9));

    -[UILabel setTextColor:](v3->_label, "setTextColor:", v10);
    -[TVHSimpleHeaderView addSubview:](v3, "addSubview:", v3->_label);
  }

  return v3;
}

- (void)setCentersLabel:(BOOL)a3
{
  if (self->_centersLabel != a3)
  {
    self->_centersLabel = a3;
    -[TVHSimpleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v7 = CGRectGetHeight(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v19);
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleHeaderView label](self, "label"));
  [v17 sizeToFit];
  [v17 bounds];
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = -[TVHSimpleHeaderView centersLabel](self, "centersLabel");
  double v14 = 0.0;
  if (v13) {
    sub_10002EE50((v8 - v10) * 0.5);
  }
  if (v12 >= v7) {
    double v15 = v7;
  }
  else {
    double v15 = v12;
  }
  double v16 = 50.0;
  if (v15 + 50.0 > v7) {
    double v16 = v7 - v15;
  }
  objc_msgSend(v17, "setFrame:", v14, v16, v10);
}

- (UILabel)label
{
  return self->_label;
}

- (BOOL)centersLabel
{
  return self->_centersLabel;
}

- (void).cxx_destruct
{
}

@end