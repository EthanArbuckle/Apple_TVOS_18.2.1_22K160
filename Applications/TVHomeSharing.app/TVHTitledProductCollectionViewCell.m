@interface TVHTitledProductCollectionViewCell
+ (double)titleLabelMaxHeight;
- (BOOL)canBecomeFocused;
- (BOOL)isShowingTitleLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHTitledProductCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)productContentViewMargin;
- (UIEdgeInsets)titleLabelMargin;
- (UILabel)titleLabel;
- (UIView)productContentView;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setProductContentView:(id)a3;
- (void)setProductContentViewMargin:(UIEdgeInsets)a3;
- (void)setShowingTitleLabel:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelMargin:(UIEdgeInsets)a3;
@end

@implementation TVHTitledProductCollectionViewCell

- (TVHTitledProductCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHTitledProductCollectionViewCell;
  result = -[TVHTitledProductCollectionViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result)
  {
    __int128 v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
    __int128 v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_titleLabelMargin.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_titleLabelMargin.bottom = v5;
    *(_OWORD *)&result->_productContentViewMargin.top = v4;
    *(_OWORD *)&result->_productContentViewMargin.bottom = v5;
  }

  return result;
}

- (void)setTitleLabel:(id)a3
{
  __int128 v5 = (UILabel *)a3;
  titleLabel = self->_titleLabel;
  v7 = v5;
  if (titleLabel != v5)
  {
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleLabel, a3);
    -[TVHTitledProductCollectionViewCell addSubview:](self, "addSubview:", v7);
    -[TVHTitledProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    __int128 v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[TVHTitledProductCollectionViewCell setTitleLabel:](self, "setTitleLabel:", v4);

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (void)setTitleLabelMargin:(UIEdgeInsets)a3
{
  if (self->_titleLabelMargin.left != a3.left
    || self->_titleLabelMargin.top != a3.top
    || self->_titleLabelMargin.right != a3.right
    || self->_titleLabelMargin.bottom != a3.bottom)
  {
    self->_titleLabelMargin = a3;
    -[TVHTitledProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setShowingTitleLabel:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell titleLabel](self, "titleLabel"));
  [v5 alpha];
  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  if (v6 != v7)
  {
    if (v3) {
      double v8 = 0.3;
    }
    else {
      double v8 = 0.2;
    }
    if (v3) {
      double v9 = 0.12;
    }
    else {
      double v9 = 0.0;
    }
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_100093D28;
    v13 = &unk_1000FD818;
    id v14 = v5;
    double v15 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  2084LL,  &v10,  0LL,  v8,  v9);
    -[TVHTitledProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v10, v11, v12, v13);
  }
}

- (BOOL)isShowingTitleLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell titleLabel](self, "titleLabel"));
  [v2 alpha];
  char v4 = BSFloatGreaterThanFloat(v3, 0.0);

  return v4;
}

+ (double)titleLabelMaxHeight
{
  return 70.0;
}

- (void)setProductContentView:(id)a3
{
  __int128 v5 = (UIView *)a3;
  productContentView = self->_productContentView;
  if (productContentView != v5)
  {
    double v8 = v5;
    -[UIView removeFromSuperview](productContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_productContentView, a3);
    if (v8)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell contentView](self, "contentView"));
      [v7 addSubview:v8];
    }

    -[TVHTitledProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    __int128 v5 = v8;
  }
}

- (void)setProductContentViewMargin:(UIEdgeInsets)a3
{
  if (self->_productContentViewMargin.left != a3.left
    || self->_productContentViewMargin.top != a3.top
    || self->_productContentViewMargin.right != a3.right
    || self->_productContentViewMargin.bottom != a3.bottom)
  {
    self->_productContentViewMargin = a3;
    -[TVHTitledProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double height = CGSizeZero.height;
  -[TVHTitledProductCollectionViewCell titleLabelMargin](self, "titleLabelMargin", a3.width, a3.height);
  double v8 = height + v6 + v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell titleLabel](self, "titleLabel"));
  *(void *)&double v10 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v11, "titleLabelMaxHeight", v10);
  objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, v12);
  double v14 = v13;

  -[TVHTitledProductCollectionViewCell productContentViewMargin](self, "productContentViewMargin");
  double v17 = v8 + v14 + v15 + v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell productContentView](self, "productContentView"));
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v17 = v17 + v20;
  }

  double v21 = width;
  double v22 = v17;
  result.double height = v22;
  result.CGFloat width = v21;
  return result;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TVHTitledProductCollectionViewCell;
  -[TVHTitledProductCollectionViewCell layoutSubviews](&v44, "layoutSubviews");
  -[TVHTitledProductCollectionViewCell bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell titleLabel](self, "titleLabel"));
  -[TVHTitledProductCollectionViewCell titleLabelMargin](self, "titleLabelMargin");
  double v13 = v12;
  double v15 = v14;
  double v43 = v16;
  double v18 = v17;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.CGFloat width = v8;
  v45.size.double height = v10;
  double v19 = CGRectGetWidth(v45) - v15 - v18;
  *(void *)&double v20 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v21, "titleLabelMaxHeight", v20);
  double v23 = v22;
  objc_msgSend(v11, "sizeThatFits:", v19, v22);
  double v26 = v25;
  if (v19 >= v24) {
    double v27 = v24;
  }
  else {
    double v27 = v19;
  }
  sub_10002EE50((v8 - v27) * 0.5);
  CGFloat v29 = v28;
  double v30 = v13 + v23 - v26;
  objc_msgSend(v11, "setFrame:", v28, v30, v27, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell productContentView](self, "productContentView"));
  if (v31)
  {
    double v42 = v10;
    -[TVHTitledProductCollectionViewCell productContentViewMargin](self, "productContentViewMargin");
    double v40 = v32;
    double v41 = v33;
    double v35 = v34;
    double v37 = v36;
    [v11 alpha];
    double v38 = 0.0;
    if (BSFloatGreaterThanFloat(v39, 0.0))
    {
      v46.origin.x = v29;
      v46.origin.y = v30;
      v46.size.CGFloat width = v27;
      v46.size.double height = v26;
      double v38 = v43 + CGRectGetMaxY(v46);
    }

    objc_msgSend(v31, "setFrame:", v35, v40 + v38, v8 - v35 - v41, v42 - (v40 + v38) - v37);
  }
}

- (BOOL)canBecomeFocused
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedView]);

  if ((-[TVHTitledProductCollectionViewCell containsView:](self, "containsView:", v4) & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell productContentView](self, "productContentView"));
    unsigned __int8 v5 = [v6 canBecomeFocused];
  }

  return v5;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHTitledProductCollectionViewCell;
  -[TVHTitledProductCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  -[TVHTitledProductCollectionViewCell setProductContentView:](self, "setProductContentView:", 0LL);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[TVHTitledProductCollectionViewCell setTitleLabelMargin:]( self,  "setTitleLabelMargin:",  UIEdgeInsetsZero.top,  left,  bottom,  right);
  -[TVHTitledProductCollectionViewCell setProductContentViewMargin:]( self,  "setProductContentViewMargin:",  UIEdgeInsetsZero.top,  left,  bottom,  right);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHTitledProductCollectionViewCell productContentView](self, "productContentView"));
  double v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    CGFloat v4 = &__NSArray0__struct;
  }

  return v4;
}

- (UIEdgeInsets)titleLabelMargin
{
  double top = self->_titleLabelMargin.top;
  double left = self->_titleLabelMargin.left;
  double bottom = self->_titleLabelMargin.bottom;
  double right = self->_titleLabelMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)productContentView
{
  return self->_productContentView;
}

- (UIEdgeInsets)productContentViewMargin
{
  double top = self->_productContentViewMargin.top;
  double left = self->_productContentViewMargin.left;
  double bottom = self->_productContentViewMargin.bottom;
  double right = self->_productContentViewMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end