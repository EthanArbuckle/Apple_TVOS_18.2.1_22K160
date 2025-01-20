@interface TVHSimpleListViewCell
- (TVHSimpleListViewCell)initWithFrame:(CGRect)a3;
- (UIColor)titleLabelFocusedDynamicColor;
- (UIColor)titleLabelUnfocusedDynamicColor;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (void)_updateColors;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setImageView:(id)a3;
@end

@implementation TVHSimpleListViewCell

- (TVHSimpleListViewCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHSimpleListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](v3, "floatingContentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);

    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    v9 = v4->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4LL);
    v11 = v4->_titleLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setMinimumScaleFactor:](v4->_titleLabel, "setMinimumScaleFactor:", 0.9);
    [v6 addSubview:v4->_titleLabel];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v13,  v14));
    titleLabelUnfocusedDynamicColor = v4->_titleLabelUnfocusedDynamicColor;
    v4->_titleLabelUnfocusedDynamicColor = (UIColor *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v17,  v18));
    titleLabelFocusedDynamicColor = v4->_titleLabelFocusedDynamicColor;
    v4->_titleLabelFocusedDynamicColor = (UIColor *)v19;

    -[TVHSimpleListViewCell _updateColors](v4, "_updateColors");
  }

  return v4;
}

- (void)setImageView:(id)a3
{
  v5 = (UIImageView *)a3;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v7 = v5;
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    if (v7) {
      -[TVHSimpleListViewCell addSubview:](self, "addSubview:", v7);
    }
    -[TVHSimpleListViewCell _updateColors](self, "_updateColors");
    -[TVHSimpleListViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHSimpleListViewCell;
  -[TVHListViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell titleLabel](self, "titleLabel"));
  [v3 setText:0];

  -[TVHSimpleListViewCell setImageView:](self, "setImageView:", 0LL);
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHSimpleListViewCell;
  -[TVHListViewCell layoutSubviews](&v22, "layoutSubviews");
  -[TVHSimpleListViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell imageView](self, "imageView"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sizeThatFits:", v4, v6);
    double v10 = v9;
    double v12 = v11;
    double v13 = 20.0;
    double v14 = v9 + 20.0;
    double v15 = v4 - (v9 + 20.0);
    id v16 = -[TVHSimpleListViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v16) {
      double v17 = 20.0;
    }
    else {
      double v17 = v4 + -20.0 - v10;
    }
    if (v16) {
      double v13 = v14 + 20.0;
    }
    sub_10002EE50((v6 - v12) * 0.5);
    objc_msgSend(v8, "setFrame:", v17, v18, v10, v12);
    double v4 = v15;
  }

  else
  {
    -[TVHSimpleListViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    double v13 = 20.0;
  }

  sub_10002EE50((v6 + -46.0) * 0.5);
  double v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v21, "setFrame:", v13, v20, v4 + -40.0, 46.0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHSimpleListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100083EF8;
  v8[3] = &unk_1000FCEA8;
  v8[4] = self;
  [v6 addCoordinatedAnimations:v8 completion:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHSimpleListViewCell isFocused](self, "isFocused"));
}

- (void)_updateColors
{
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell titleLabelUnfocusedDynamicColor](self, "titleLabelUnfocusedDynamicColor"));
  }
  id v6 = (id)v3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell titleLabel](self, "titleLabel"));
  [v4 setTextColor:v6];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleListViewCell imageView](self, "imageView"));
  [v5 setTintColor:v6];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIColor)titleLabelFocusedDynamicColor
{
  return self->_titleLabelFocusedDynamicColor;
}

- (UIColor)titleLabelUnfocusedDynamicColor
{
  return self->_titleLabelUnfocusedDynamicColor;
}

- (void).cxx_destruct
{
}

@end