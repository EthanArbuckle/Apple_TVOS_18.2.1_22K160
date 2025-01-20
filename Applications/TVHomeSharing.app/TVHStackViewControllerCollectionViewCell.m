@interface TVHStackViewControllerCollectionViewCell
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)childView;
- (id)identifier;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setChildView:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TVHStackViewControllerCollectionViewCell

- (void)setChildView:(id)a3
{
  id v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewControllerCollectionViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subviews]);
  [v6 makeObjectsPerformSelector:"removeFromSuperview"];

  objc_storeStrong((id *)&self->_childView, a3);
  if (v7) {
    [v5 addSubview:v7];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewControllerCollectionViewCell childView](self, "childView"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sizeThatFits:", width, height);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
  }

  else
  {
    CGFloat v8 = CGSizeZero.width;
    CGFloat v10 = CGSizeZero.height;
  }

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHStackViewControllerCollectionViewCell;
  -[TVHStackViewControllerCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewControllerCollectionViewCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewControllerCollectionViewCell childView](self, "childView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHStackViewControllerCollectionViewCell;
  -[TVHStackViewControllerCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHStackViewControllerCollectionViewCell setIdentifier:](self, "setIdentifier:", 0LL);
  -[TVHStackViewControllerCollectionViewCell setChildView:](self, "setChildView:", 0LL);
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIView)childView
{
  return self->_childView;
}

- (void).cxx_destruct
{
}

@end