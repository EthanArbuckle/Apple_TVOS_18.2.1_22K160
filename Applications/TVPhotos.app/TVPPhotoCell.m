@interface TVPPhotoCell
- (BOOL)canBecomeFocused;
- (BOOL)isImageLoaded;
- (TVImageProxy)imageProxy;
- (TVPPhotoCell)initWithFrame:(CGRect)a3;
- (UIImage)photoImage;
- (UIImage)placeholderImage;
- (UIImageView)imageView;
- (UIView)overlayView;
- (double)cellCornerRadius;
- (int64_t)placeholderAssetType;
- (void)_setPlaceholderImageFromPlaceholderAssetTypeImage;
- (void)_updateImageView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setImage:(id)a3;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPhotoImage:(id)a3;
- (void)setPlaceholderAssetType:(int64_t)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVPPhotoCell

- (TVPPhotoCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPPhotoCell;
  v3 = -[TVPPhotoCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___UIImageView);
    -[TVPPhotoCell bounds](v3, "bounds");
    v5 = -[UIImageView initWithFrame:](v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v5;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2LL);
    -[UIImageView setAdjustsImageWhenAncestorFocused:](v3->_imageView, "setAdjustsImageWhenAncestorFocused:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell contentView](v3, "contentView"));
    [v7 addSubview:v3->_imageView];
  }

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPPhotoCell;
  -[TVPPhotoCell prepareForReuse](&v3, "prepareForReuse");
  -[TVPPhotoCell setPhotoImage:](self, "setPhotoImage:", 0LL);
  -[TVPPhotoCell _updateImageView](self, "_updateImageView");
}

- (void)setImageProxy:(id)a3
{
  id v5 = a3;
  p_imageProxy = &self->_imageProxy;
  -[TVImageProxy cancel](self->_imageProxy, "cancel");
  objc_storeStrong((id *)&self->_imageProxy, a3);
  -[TVPPhotoCell setImageLoaded:](self, "setImageLoaded:", 0LL);
  -[TVPPhotoCell _updateImageView](self, "_updateImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageProxy decorator](self->_imageProxy, "decorator"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVImageScaleDecorator, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageProxy decorator](*p_imageProxy, "decorator"));
    [v11 setFocusedSizeIncrease:70.0];
  }

  objc_initWeak(&location, self);
  v12 = *p_imageProxy;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_100074410;
  v17 = &unk_1000CC578;
  objc_copyWeak(&v18, &location);
  -[TVImageProxy setCompletionHandler:](v12, "setCompletionHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell window](self, "window", v14, v15, v16, v17));

  if (v13) {
    -[TVImageProxy load](*p_imageProxy, "load");
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setPhotoImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_photoImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_photoImage, a3);
    -[TVPPhotoCell _updateImageView](self, "_updateImageView");
    id v5 = v6;
  }
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = a3;
  if (*(_OWORD *)&self->_placeholderImage != (unint64_t)v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    self->_placeholderAssetType = 0LL;
    -[TVPPhotoCell _updateImageView](self, "_updateImageView");
    id v5 = v6;
  }
}

- (void)setPlaceholderAssetType:(int64_t)a3
{
  if (self->_placeholderAssetType != a3)
  {
    self->_placeholderAssetType = a3;
    -[TVPPhotoCell _setPlaceholderImageFromPlaceholderAssetTypeImage]( self,  "_setPlaceholderImageFromPlaceholderAssetTypeImage");
    -[TVPPhotoCell _updateImageView](self, "_updateImageView");
  }

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  [v5 setImage:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  -[TVPPhotoCell cellCornerRadius](self, "cellCornerRadius");
  objc_msgSend(v6, "_setLayeredImageCornerRadius:");
}

- (void)setOverlay:(id)a3
{
  p_overlayView = &self->_overlayView;
  objc_storeStrong((id *)&self->_overlayView, a3);
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _layeredImageContainer]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 layer]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](*p_overlayView, "layer"));
  [v10 _setOverlayLayer:v9];
}

- (double)cellCornerRadius
{
  return 0.0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPPhotoCell;
  id v6 = a3;
  -[TVPPhotoCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (TVPPhotoCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView", v9.receiver, v9.super_class));

  if (v7 == self)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell superview](self, "superview"));
    [v8 bringSubviewToFront:self];
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    if (-[TVPPhotoCell placeholderAssetType](self, "placeholderAssetType"))
    {
      -[TVPPhotoCell _setPlaceholderImageFromPlaceholderAssetTypeImage]( self,  "_setPlaceholderImageFromPlaceholderAssetTypeImage");
      -[TVPPhotoCell _updateImageView](self, "_updateImageView");
    }
  }

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPPhotoCell;
  -[TVPPhotoCell willMoveToWindow:](&v6, "willMoveToWindow:");
  if (a3)
  {
    if (!-[TVPPhotoCell isImageLoaded](self, "isImageLoaded"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageProxy](self, "imageProxy"));
      [v5 load];
    }
  }

- (void)_setPlaceholderImageFromPlaceholderAssetTypeImage
{
  id v3 = sub_10000DAA4(-[TVPPhotoCell placeholderAssetType](self, "placeholderAssetType"));
  id v4 = (UIImage *)objc_claimAutoreleasedReturnValue(v3);
  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = v4;
}

- (void)_updateImageView
{
  if ((-[TVImageProxy isImageAvailable](self->_imageProxy, "isImageAvailable") & 1) == 0)
  {
    photoImage = self->_photoImage;
    if (!photoImage) {
      photoImage = self->_placeholderImage;
    }
    -[TVPPhotoCell setImage:](self, "setImage:", photoImage);
  }

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (int64_t)placeholderAssetType
{
  return self->_placeholderAssetType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (void).cxx_destruct
{
}

@end