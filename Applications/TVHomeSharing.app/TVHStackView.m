@interface TVHStackView
- (TVHCollectionView)collectionView;
- (TVHStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
@end

@implementation TVHStackView

- (TVHStackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHStackView;
  v3 = -[TVHStackView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVHStackView setBackgroundColor:](v3, "setBackgroundColor:", v4);
  }

  return v3;
}

- (void)setCollectionView:(id)a3
{
  v5 = (TVHCollectionView *)a3;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    v7 = v5;
    -[TVHCollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView) {
      -[TVHStackView addSubview:](self, "addSubview:");
    }
    -[TVHStackView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHStackView collectionView](self, "collectionView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (TVHCollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
}

@end