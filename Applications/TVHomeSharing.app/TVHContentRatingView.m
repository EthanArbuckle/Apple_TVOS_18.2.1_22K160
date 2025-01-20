@interface TVHContentRatingView
- (BOOL)hasDisplayableContentRating;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)contentRatingBadgeText;
- (UIImage)contentRatingBadgeImage;
- (UIImageView)contentRatingBadgeImageView;
- (_TVContentRatingTextBadgeView)contentRatingBadgeTextView;
- (id)_currentSubview;
- (void)layoutSubviews;
- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4;
- (void)setContentRatingBadgeImageView:(id)a3;
- (void)setContentRatingBadgeTextView:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TVHContentRatingView

- (UIImage)contentRatingBadgeImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeImageView](self, "contentRatingBadgeImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (NSString)contentRatingBadgeText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeTextView](self, "contentRatingBadgeTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingText]);

  return (NSString *)v3;
}

- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeImageView](self, "contentRatingBadgeImageView"));
  v8 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeTextView](self, "contentRatingBadgeTextView"));
  v9 = v8;
  if (v17)
  {
    -[UIImageView removeFromSuperview](v8, "removeFromSuperview");
    -[TVHContentRatingView setContentRatingBadgeTextView:](self, "setContentRatingBadgeTextView:", 0LL);
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeImage](self, "contentRatingBadgeImage"));

    id v11 = v17;
    if (v10 != v17)
    {
      if (!v7)
      {
        v7 = objc_alloc_init(&OBJC_CLASS___UIImageView);
        -[TVHContentRatingView setContentRatingBadgeImageView:](self, "setContentRatingBadgeImageView:", v7);
        -[TVHContentRatingView addSubview:](self, "addSubview:", v7);
        id v11 = v17;
      }

      -[UIImageView setImage:](v7, "setImage:", v11);
      v12 = v7;
LABEL_11:
      -[UIImageView sizeToFit](v12, "sizeToFit");
      -[TVHContentRatingView setNeedsLayout](self, "setNeedsLayout");
    }
  }

  else
  {
    if (!v6)
    {
      -[UIImageView removeFromSuperview](v8, "removeFromSuperview");
      -[TVHContentRatingView setContentRatingBadgeTextView:](self, "setContentRatingBadgeTextView:", 0LL);
      -[UIImageView removeFromSuperview](v7, "removeFromSuperview");
      -[TVHContentRatingView setContentRatingBadgeImageView:](self, "setContentRatingBadgeImageView:", 0LL);
      goto LABEL_13;
    }

    -[UIImageView removeFromSuperview](v7, "removeFromSuperview");
    -[TVHContentRatingView setContentRatingBadgeImageView:](self, "setContentRatingBadgeImageView:", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeText](self, "contentRatingBadgeText"));
    unsigned __int8 v14 = [v13 isEqual:v6];

    if ((v14 & 1) == 0)
    {
      if (!v9)
      {
        v9 = objc_alloc_init(&OBJC_CLASS____TVContentRatingTextBadgeView);
        -[TVHContentRatingView setContentRatingBadgeTextView:](self, "setContentRatingBadgeTextView:", v9);
        -[TVHContentRatingView addSubview:](self, "addSubview:", v9);
      }

      -[UIImageView setContentRatingText:](v9, "setContentRatingText:", v6);
      v12 = v9;
      goto LABEL_11;
    }
  }

- (BOOL)hasDisplayableContentRating
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView _currentSubview](self, "_currentSubview"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHContentRatingView;
  id v4 = a3;
  -[TVHContentRatingView setTintColor:](&v6, "setTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView _currentSubview](self, "_currentSubview", v6.receiver, v6.super_class));
  [v5 setTintColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeImageView](self, "contentRatingBadgeImageView"));
  v7 = v6;
  if (v6)
  {
    CGFloat v8 = CGSizeZero.width;
    double v9 = CGSizeZero.height;
    [v6 frame];
    if (v10 != CGSizeZero.width || v11 != v9)
    {
      double v13 = v10;
      double v14 = v11;
      BOOL v15 = v10 > width || v11 > height;
      CGFloat v8 = v10;
      double v9 = v11;
      if (v15)
      {
        v23.origin.x = 0.0;
        v23.origin.y = 0.0;
        v23.size.double width = width;
        v23.size.double height = height;
        CGRect v22 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)&v13, v23);
        CGFloat v8 = v22.size.width;
        double v9 = v22.size.height;
      }
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView contentRatingBadgeTextView](self, "contentRatingBadgeTextView"));
    objc_msgSend(v16, "sizeThatFits:", width, height);
    CGFloat v8 = v17;
    double v9 = v18;
  }

  double v19 = v8;
  double v20 = v9;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHContentRatingView;
  -[TVHContentRatingView layoutSubviews](&v12, "layoutSubviews");
  -[TVHContentRatingView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView _currentSubview](self, "_currentSubview"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (id)_currentSubview
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView subviews](self, "subviews"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

- (_TVContentRatingTextBadgeView)contentRatingBadgeTextView
{
  return self->_contentRatingBadgeTextView;
}

- (void)setContentRatingBadgeTextView:(id)a3
{
}

- (UIImageView)contentRatingBadgeImageView
{
  return self->_contentRatingBadgeImageView;
}

- (void)setContentRatingBadgeImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end