@interface TVHPosterLockupBadgeOverlayView
- (TVHPosterLockupBadgeOverlayView)initWithFrame:(CGRect)a3;
- (UIImage)badgeImage;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setBadgeImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation TVHPosterLockupBadgeOverlayView

- (TVHPosterLockupBadgeOverlayView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHPosterLockupBadgeOverlayView;
  v3 = -[TVHPosterLockupBadgeOverlayView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[TVHPosterLockupBadgeOverlayView addSubview:](v3, "addSubview:", v3->_imageView);
  }

  return v3;
}

- (void)setBadgeImage:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupBadgeOverlayView badgeImage](self, "badgeImage"));

  if (v4 != v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupBadgeOverlayView imageView](self, "imageView"));
    [v5 setImage:v6];

    -[TVHPosterLockupBadgeOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)badgeImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupBadgeOverlayView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHPosterLockupBadgeOverlayView;
  -[TVHPosterLockupBadgeOverlayView layoutSubviews](&v10, "layoutSubviews");
  -[TVHPosterLockupBadgeOverlayView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupBadgeOverlayView imageView](self, "imageView"));
  objc_msgSend(v7, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(v7, "setFrame:", v4 - v8 + -10.0, v6 - v9 + -18.0, v8);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end