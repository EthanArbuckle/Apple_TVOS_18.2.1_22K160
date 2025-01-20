@interface TVHProductCollectionViewCell
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHProductCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)productContentViewMargin;
- (UIView)productContentView;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setProductContentView:(id)a3;
- (void)setProductContentViewMargin:(UIEdgeInsets)a3;
@end

@implementation TVHProductCollectionViewCell

- (TVHProductCollectionViewCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHProductCollectionViewCell;
  result = -[TVHProductCollectionViewCell initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result)
  {
    __int128 v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&result->_productContentViewMargin.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_productContentViewMargin.bottom = v4;
  }

  return result;
}

- (void)setProductContentView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  productContentView = self->_productContentView;
  if (productContentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](productContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_productContentView, a3);
    if (v8)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCollectionViewCell contentView](self, "contentView"));
      [v7 addSubview:v8];
    }

    -[TVHProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    objc_super v5 = v8;
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
    -[TVHProductCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double height = CGSizeZero.height;
  -[TVHProductCollectionViewCell productContentViewMargin](self, "productContentViewMargin", a3.width, a3.height);
  double v8 = height + v6 + v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCollectionViewCell productContentView](self, "productContentView"));
  objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v11 = v10;

  double v12 = v8 + v11;
  double v13 = width;
  result.double height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHProductCollectionViewCell;
  -[TVHProductCollectionViewCell layoutSubviews](&v16, "layoutSubviews");
  -[TVHProductCollectionViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  -[TVHProductCollectionViewCell productContentViewMargin](self, "productContentViewMargin");
  double v8 = v7;
  double v10 = v9;
  double v12 = v4 - v9 - v11;
  double v14 = v6 - v7 - v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCollectionViewCell productContentView](self, "productContentView"));
  objc_msgSend(v15, "setFrame:", v10, v8, v12, v14);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHProductCollectionViewCell;
  -[TVHProductCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHProductCollectionViewCell setProductContentView:](self, "setProductContentView:", 0LL);
  -[TVHProductCollectionViewCell setProductContentViewMargin:]( self,  "setProductContentViewMargin:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
}

- (BOOL)canBecomeFocused
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedView]);

  if ((-[TVHProductCollectionViewCell containsView:](self, "containsView:", v4) & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCollectionViewCell productContentView](self, "productContentView"));
    unsigned __int8 v5 = [v6 canBecomeFocused];
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHProductCollectionViewCell productContentView](self, "productContentView"));
  objc_super v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
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