@interface TVHLockupImageView
- (TVHLockupImageView)initWithFrame:(CGRect)a3;
- (TVHLockupShadow)focusedShadow;
- (TVHLockupShadow)unfocusedShadow;
- (double)focusedSizeIncrease;
- (id)_stackedImageConfiguration;
- (void)_updateImageViewApperance;
- (void)setFocusedShadow:(id)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setUnfocusedShadow:(id)a3;
- (void)updateAppearanceForLockupState:(unint64_t)a3;
@end

@implementation TVHLockupImageView

- (TVHLockupImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHLockupImageView;
  v3 = -[TVHMediaImageView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_focusedSizeIncrease = 60.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView underlyingImageView](v3, "underlyingImageView"));
    [v5 setClipsToBounds:0];
    [v5 setAdjustsImageWhenAncestorFocused:1];
  }

  return v4;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  if (self->_focusedSizeIncrease != a3)
  {
    self->_focusedSizeIncrease = a3;
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
  }

- (void)setFocusedShadow:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects(self->_focusedShadow) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_focusedShadow, a3);
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
  }
}

- (void)setUnfocusedShadow:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects(self->_unfocusedShadow) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_unfocusedShadow, a3);
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
  }
}

- (void)updateAppearanceForLockupState:(unint64_t)a3
{
  unint64_t v3 = a3 & 1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView underlyingImageView](self, "underlyingImageView"));
  [v4 setHighlighted:v3];
}

- (void)_updateImageViewApperance
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView underlyingImageView](self, "underlyingImageView"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupImageView _stackedImageConfiguration](self, "_stackedImageConfiguration"));
  -[TVHLockupImageView focusedSizeIncrease](self, "focusedSizeIncrease");
  objc_msgSend(v3, "setScaleSizeIncrease:");
  focusedShadow = self->_focusedShadow;
  if (focusedShadow)
  {
    -[TVHLockupShadow opacity](focusedShadow, "opacity");
    objc_msgSend(v3, "setDefaultFocusedShadowOpacity:");
    -[TVHLockupShadow radius](self->_focusedShadow, "radius");
    objc_msgSend(v3, "setDefaultFocusedShadowRadius:");
    -[TVHLockupShadow verticalOffset](self->_focusedShadow, "verticalOffset");
    objc_msgSend(v3, "setDefaultFocusedShadowVerticalOffset:");
  }

  unfocusedShadow = self->_unfocusedShadow;
  if (unfocusedShadow)
  {
    -[TVHLockupShadow opacity](unfocusedShadow, "opacity");
    objc_msgSend(v3, "setDefaultUnfocusedShadowOpacity:");
    -[TVHLockupShadow radius](self->_unfocusedShadow, "radius");
    objc_msgSend(v3, "setDefaultUnfocusedShadowRadius:");
    -[TVHLockupShadow verticalOffset](self->_unfocusedShadow, "verticalOffset");
    objc_msgSend(v3, "setDefaultUnfocusedShadowVerticalOffset:");
  }

  -[TVHMediaImageView cornerRadius](self, "cornerRadius");
  objc_msgSend(v7, "_setLayeredImageCornerRadius:");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v7 _layeredImageContainer]);
  [v6 setConfig:v3];
}

- (id)_stackedImageConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView underlyingImageView](self, "underlyingImageView"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _layeredImageContainer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 config]);

  return v4;
}

- (TVHLockupShadow)focusedShadow
{
  return self->_focusedShadow;
}

- (TVHLockupShadow)unfocusedShadow
{
  return self->_unfocusedShadow;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void).cxx_destruct
{
}

@end