@interface TVHCircularLockupContentView
+ (void)_configureFloatingContentViewAppearance;
- (TVHCircularLockupContentView)initWithFrame:(CGRect)a3;
- (TVHCircularLockupContentView)initWithFrame:(CGRect)a3 focusedShadow:(id)a4 unfocusedShadow:(id)a5;
- (TVHLockupShadow)focusedShadow;
- (TVHLockupShadow)unfocusedShadow;
- (TVHMediaImageView)contentImageView;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (TVSUIOuterShadowView)focusedShadowView;
- (TVSUIOuterShadowView)unfocusedShadowView;
- (UIImage)image;
- (_UIFloatingContentView)floatingContentView;
- (double)focusedSizeIncrease;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)updateAppearanceForLockupState:(unint64_t)a3;
@end

@implementation TVHCircularLockupContentView

- (TVHCircularLockupContentView)initWithFrame:(CGRect)a3 focusedShadow:(id)a4 unfocusedShadow:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHCircularLockupContentView;
  v13 = -[TVHCircularLockupContentView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13) {
    sub_10006A680(v13, v11, v12, x, y, width, height);
  }

  return v14;
}

- (TVHCircularLockupContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHCircularLockupContentView;
  v7 = -[TVHCircularLockupContentView initWithFrame:](&v10, "initWithFrame:");
  v8 = v7;
  if (v7) {
    sub_10006A680(v7, 0LL, 0LL, x, y, width, height);
  }
  return v8;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView contentImageView](self, "contentImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  if (v5 != a3)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView floatingContentView](self, "floatingContentView"));
    [v6 setFocusedSizeIncrease:a3];
  }

- (double)focusedSizeIncrease
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView floatingContentView](self, "floatingContentView"));
  [v2 focusedSizeIncrease];
  double v4 = v3;

  return v4;
}

- (void)updateAppearanceForLockupState:(unint64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView floatingContentView](self, "floatingContentView"));
  [v5 setControlState:a3 animated:1];

  unint64_t v6 = a3 & 9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView focusedShadowView](self, "focusedShadowView"));
  v8 = v7;
  if (v6 == 8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView focusedShadow](self, "focusedShadow"));
    [v9 opacity];
    objc_msgSend(v8, "setAlpha:");
  }

  else
  {
    [v7 setAlpha:0.0];
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView unfocusedShadowView](self, "unfocusedShadowView"));
  if (v6 == 8)
  {
    [v11 setAlpha:0.0];
  }

  else
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCircularLockupContentView unfocusedShadow](self, "unfocusedShadow"));
    [v10 opacity];
    objc_msgSend(v11, "setAlpha:");
  }
}

+ (void)_configureFloatingContentViewAppearance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B4DC;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001573B8 != -1) {
    dispatch_once(&qword_1001573B8, block);
  }
}

- (TVHLockupShadow)focusedShadow
{
  return self->_focusedShadow;
}

- (TVHLockupShadow)unfocusedShadow
{
  return self->_unfocusedShadow;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (TVHMediaImageView)contentImageView
{
  return self->_contentImageView;
}

- (TVSUIOuterShadowView)focusedShadowView
{
  return self->_focusedShadowView;
}

- (TVSUIOuterShadowView)unfocusedShadowView
{
  return self->_unfocusedShadowView;
}

- (void).cxx_destruct
{
}

@end