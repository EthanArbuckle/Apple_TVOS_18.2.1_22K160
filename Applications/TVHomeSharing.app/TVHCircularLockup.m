@interface TVHCircularLockup
+ (id)_contentViewWithLockupLayout:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (UIImage)image;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVHCircularLockup

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 titleLabel]);
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 titleLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 subtitleLabel]);
  [v5 setText:v4];
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subtitleLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHCircularLockup;
  -[TVHLockup setFocusedSizeIncrease:](&v6, "setFocusedSizeIncrease:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setFocusedSizeIncrease:a3];
}

+ (id)_contentViewWithLockupLayout:(id)a3
{
  double v4 = v3;
  objc_super v6 = -[TVHLockupImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHLockupImageView),  "initWithFrame:",  0.0,  0.0,  v3,  v5);
  -[TVHMediaImageView setCornerRadius:](v6, "setCornerRadius:", v4 * 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupImageView focusedShadow](v6, "focusedShadow"));
  [v7 setRadius:20.0];
  [v7 setOpacity:0.2];
  -[TVHLockupImageView setFocusedShadow:](v6, "setFocusedShadow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupImageView unfocusedShadow](v6, "unfocusedShadow"));
  [v8 setRadius:20.0];
  [v8 setOpacity:0.1];
  -[TVHLockupImageView setUnfocusedShadow:](v6, "setUnfocusedShadow:", v8);
  -[TVHMediaImageView setContentMode:](v6, "setContentMode:", 2LL);

  return v6;
}

@end