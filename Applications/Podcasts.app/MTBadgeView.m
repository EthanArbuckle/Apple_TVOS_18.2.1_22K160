@interface MTBadgeView
- (BOOL)isDark;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTBadgeView)init;
- (UILabel)badgeLabel;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeLabel:(id)a3;
- (void)setBadgeValue:(id)a3;
- (void)setDark:(BOOL)a3;
@end

@implementation MTBadgeView

- (MTBadgeView)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTBadgeView;
  v2 = -[MTBadgeView init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MTBadgeView setDark:](v2, "setDark:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](v3, "badgeLabel"));
    -[MTBadgeView addSubview:](v3, "addSubview:", v4);
  }

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 + 6.0;
  if (v7 + 6.0 < v9) {
    double v10 = v9;
  }
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTBadgeView;
  -[MTBadgeView layoutSubviews](&v23, "layoutSubviews");
  -[MTBadgeView bounds](self, "bounds");
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double v7 = CGRectGetWidth(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v25);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * 0.5;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView layer](self, "layer"));
  [v10 setCornerRadius:v9];

  -[MTBadgeView bounds](self, "bounds");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 text]);
  id v21 = [v20 length];

  if (v21 == (id)1) {
    double v12 = v12 + 0.3;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  objc_msgSend(v22, "setFrame:", v12, v14, v16, v18);
}

- (UILabel)badgeLabel
{
  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = self->_badgeLabel;
    self->_badgeLabel = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 10.0));
    -[UILabel setFont:](self->_badgeLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_badgeLabel, "setNumberOfLines:", 1LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1LL);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_badgeLabel, "setBackgroundColor:", v8);

    badgeLabel = self->_badgeLabel;
  }

  return badgeLabel;
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBadgeView badgeLabel](self, "badgeLabel"));
  [v5 setText:v4];

  -[MTBadgeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDark:(BOOL)a3
{
  if (self->_dark != a3) {
    self->_dark = a3;
  }
  -[MTBadgeView setBackgroundColor:](self, "setBackgroundColor:", 0LL);
}

- (void)setBackgroundColor:(id)a3
{
  if (self->_dark) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIColor goneDarkColor](&OBJC_CLASS___UIColor, "goneDarkColor", a3));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor", a3));
  }
  v5 = (void *)v4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTBadgeView;
  -[MTBadgeView setBackgroundColor:](&v6, "setBackgroundColor:", v4);
}

- (void)setBadgeLabel:(id)a3
{
}

- (BOOL)isDark
{
  return self->_dark;
}

- (void).cxx_destruct
{
}

@end