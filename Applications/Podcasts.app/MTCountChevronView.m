@interface MTCountChevronView
- (CGRect)_chevronFrameForViewSize:(CGSize)a3;
- (CGRect)_countFrameForViewSize:(CGSize)a3;
- (CGSize)_chevronSize;
- (CGSize)_countSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTChevronView)chevronView;
- (MTCountChevronView)initWithFrame:(CGRect)a3;
- (NSNumber)count;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)countLabel;
- (void)_updateCurrentTextColor;
- (void)layoutSubviews;
- (void)setChevronView:(id)a3;
- (void)setCount:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MTCountChevronView

- (MTCountChevronView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCountChevronView;
  v3 = -[MTCountChevronView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](v3, "countLabel"));
    -[MTCountChevronView addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](v4, "chevronView"));
    -[MTCountChevronView addSubview:](v4, "addSubview:", v6);
  }

  return v4;
}

- (void)setCount:(id)a3
{
  v5 = (NSNumber *)a3;
  count = self->_count;
  if (count != v5)
  {
    v10 = v5;
    if (!v5 || (unsigned __int8 v7 = -[NSNumber isEqualToNumber:](count, "isEqualToNumber:", v5), v5 = v10, (v7 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_count, a3);
      if (-[NSNumber longLongValue](v10, "longLongValue") < 0)
      {
        objc_super v8 = @"!";
      }

      else if (-[NSNumber unsignedLongLongValue](v10, "unsignedLongLongValue"))
      {
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%lu",  -[NSNumber unsignedIntegerValue](v10, "unsignedIntegerValue")));
      }

      else
      {
        objc_super v8 = 0LL;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
      [v9 setText:v8];

      -[MTCountChevronView _updateCurrentTextColor](self, "_updateCurrentTextColor");
      -[MTCountChevronView setNeedsLayout](self, "setNeedsLayout");

      v5 = v10;
    }
  }
}

- (UIFont)font
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 font]);

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  [v5 setFont:v4];

  -[MTCountChevronView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MTCountChevronView;
  -[MTCountChevronView layoutSubviews](&v25, "layoutSubviews");
  -[MTCountChevronView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  -[MTCountChevronView _countFrameForViewSize:](self, "_countFrameForViewSize:", v3, v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[MTCountChevronView _chevronFrameForViewSize:](self, "_chevronFrameForViewSize:", v4, v6);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](self, "chevronView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v5 = v4;
  double v7 = v6;
  -[MTCountChevronView _chevronSize](self, "_chevronSize");
  double v10 = v5 + 14.0 + v9;
  if (v7 >= v8) {
    double v8 = v7;
  }
  result.height = v8;
  result.width = v10;
  return result;
}

- (void)_updateCurrentTextColor
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCountChevronView count](self, "count"));
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTCountChevronView textColor](self, "textColor"));
  }
  double v4 = (void *)v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  [v5 setTextColor:v4];
}

- (CGRect)_chevronFrameForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MTCountChevronView _chevronSize](self, "_chevronSize");
  double v7 = v6;
  double v9 = v8;
  double v10 = IMRoundToPixel((height - v8) * 0.5);
  unsigned int v11 = -[MTCountChevronView mt_isRTL](self, "mt_isRTL");
  double v12 = width - v7;
  if (v11) {
    double v12 = 0.0;
  }
  double v13 = v10;
  double v14 = v7;
  double v15 = v9;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_chevronSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](self, "chevronView"));
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_countSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v2, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGRect)_countFrameForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MTCountChevronView _countSize](self, "_countSize");
  double v7 = v6;
  double v9 = v8;
  double v10 = IMRoundToPixel((height - v8) * 0.5);
  unsigned int v11 = -[MTCountChevronView mt_isRTL](self, "mt_isRTL");
  double v12 = width - v7;
  if (!v11) {
    double v12 = 0.0;
  }
  double v13 = v10;
  double v14 = v7;
  double v15 = v9;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UILabel)countLabel
{
  countLabel = self->_countLabel;
  if (!countLabel)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    double v5 = self->_countLabel;
    self->_countLabel = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView font](self, "font"));
    -[UILabel setFont:](self->_countLabel, "setFont:", v6);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView textColor](self, "textColor"));
    -[UILabel setTextColor:](self->_countLabel, "setTextColor:", v7);

    countLabel = self->_countLabel;
  }

  return countLabel;
}

- (MTChevronView)chevronView
{
  chevronView = self->_chevronView;
  if (!chevronView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___MTChevronView);
    double v5 = self->_chevronView;
    self->_chevronView = v4;

    -[MTChevronView sizeToFit](self->_chevronView, "sizeToFit");
    chevronView = self->_chevronView;
  }

  return chevronView;
}

- (NSNumber)count
{
  return self->_count;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setCountLabel:(id)a3
{
}

- (void)setChevronView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end