@interface TVSettingsImageView
- (BOOL)_edgeAntialiasingOnSelectedRestrictedToLeftRightEdge;
- (BOOL)_enableEdgeAntialiasingOnSelected;
- (BOOL)isImageLoaded;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVImageProxy)imageProxy;
- (TVSettingsImageView)initWithFrame:(CGRect)a3;
- (UIColor)_focusedColor;
- (UIColor)_tintColor;
- (UIImage)image;
- (UIImage)placeholderImage;
- (double)cornerRadius;
- (id)_imageView;
- (id)completion;
- (int64_t)contentMode;
- (void)_loadImage;
- (void)_setEdgeAntialiasingOnSelectedRestrictedToLeftRightEdge:(BOOL)a3;
- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3;
- (void)_setFocusedColor:(id)a3;
- (void)_setImage:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)_updateImageViewWithPlaceholderImageIfNeeded;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCompletion:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageProxy:(id)a3 completion:(id)a4;
- (void)setPlaceholderImage:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVSettingsImageView

- (TVSettingsImageView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsImageView;
  v3 = -[TVSettingsImageView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageContentMode = 1LL;
    v5 = objc_alloc(&OBJC_CLASS___UIImageView);
    -[TVSettingsImageView bounds](v4, "bounds");
    v6 = -[UIImageView initWithFrame:](v5, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", v4->_imageContentMode);
    -[TVSettingsImageView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsImageView;
  -[TVSettingsImageView dealloc](&v3, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentMode
{
  return (int64_t)-[UIImageView contentMode](self->_imageView, "contentMode");
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsImageView;
  -[TVSettingsImageView layoutSubviews](&v4, "layoutSubviews");
  imageView = self->_imageView;
  -[TVSettingsImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void)setContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:");
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsImageView;
  -[TVSettingsImageView setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  imageView = self->_imageView;
  -[TVSettingsImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TVImageProxy expectedSize](self->_imageProxy, "expectedSize");
  double v8 = CGSizeZero.height;
  if (v6 == CGSizeZero.width && v7 == v8)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
    if (v6 == CGSizeZero.width && v7 == v8)
    {
      -[TVSettingsImageView bounds](self, "bounds");
      double v6 = v11;
      double v7 = v12;
    }
  }

  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsImageView;
  -[TVSettingsImageView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3)
  {
    if (!-[TVSettingsImageView isImageLoaded](self, "isImageLoaded")) {
      -[TVSettingsImageView _loadImage](self, "_loadImage");
    }
  }

  else
  {
    -[TVImageProxy cancel](self->_imageProxy, "cancel");
  }

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  -[TVSettingsImageView setImageProxy:](self, "setImageProxy:", 0LL);
  -[TVSettingsImageView _setImage:](self, "_setImage:", v4);
}

- (void)setImageProxy:(id)a3
{
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
  v17 = (TVImageProxy *)a3;
  id v7 = a4;
  if (self->_imageProxy != v17)
  {
    unsigned int v8 = -[TVImageProxy isEqual:](v17, "isEqual:");
    unsigned __int8 v9 = -[TVSettingsImageView isImageLoaded](self, "isImageLoaded");
    if (v8)
    {
      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView completion](self, "completion"));

        if (v10)
        {
          double v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsImageView completion]( self,  "completion"));
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView image](self, "image"));
          ((void (**)(void, void *, void, void))v11)[2](v11, v12, 0LL, 0LL);
        }
      }

      -[TVSettingsImageView setCompletion:](self, "setCompletion:", v7);
      objc_storeStrong((id *)&self->_imageProxy, a3);
      if (-[TVSettingsImageView isImageLoaded](self, "isImageLoaded"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView completion](self, "completion"));

        if (v13)
        {
          v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsImageView completion]( self,  "completion"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView image](self, "image"));
          ((void (**)(void, void *, void, uint64_t))v14)[2](v14, v15, 0LL, 1LL);

          -[TVSettingsImageView setCompletion:](self, "setCompletion:", 0LL);
        }
      }
    }

    else
    {
      if ((v9 & 1) == 0) {
        -[TVImageProxy cancel](self->_imageProxy, "cancel");
      }
      -[TVSettingsImageView _setImage:](self, "_setImage:", 0LL);
      -[TVSettingsImageView _updateImageViewWithPlaceholderImageIfNeeded]( self,  "_updateImageViewWithPlaceholderImageIfNeeded");
      -[TVSettingsImageView setCompletion:](self, "setCompletion:", v7);
      objc_storeStrong((id *)&self->_imageProxy, a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView window](self, "window"));

      if (v16) {
        -[TVSettingsImageView _loadImage](self, "_loadImage");
      }
    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[TVSettingsImageView _updateImageViewWithPlaceholderImageIfNeeded]( self,  "_updateImageViewWithPlaceholderImageIfNeeded");
    objc_super v5 = v6;
  }
}

- (void)setCornerRadius:(double)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v5 setCornerRadius:a3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v6 setMasksToBounds:a3 > 0.0];
}

- (double)cornerRadius
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  self->_selected = a3;
  imageView = self->_imageView;
  if (!a3 || (flatImage = self->_flatHighlightImage) == 0LL) {
    flatImage = self->_flatImage;
  }
  -[UIImageView setImage:](imageView, "setImage:", flatImage, a4);
  if (-[TVSettingsImageView _enableEdgeAntialiasingOnSelected](self, "_enableEdgeAntialiasingOnSelected"))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v8 setAllowsEdgeAntialiasing:v4];

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView layer](self, "layer"));
    [v9 setAllowsEdgeAntialiasing:v4];

    if (-[TVSettingsImageView _edgeAntialiasingOnSelectedRestrictedToLeftRightEdge]( self,  "_edgeAntialiasingOnSelectedRestrictedToLeftRightEdge"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
      [v10 setEdgeAntialiasingMask:3];

      id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView layer](self, "layer"));
      [v11 setEdgeAntialiasingMask:3];
    }
  }

- (void)_loadImage
{
  imageProxy = self->_imageProxy;
  id v4 = objc_initWeak(&location, imageProxy);

  if (imageProxy)
  {
    -[TVImageProxy setCacheOnLoad:](self->_imageProxy, "setCacheOnLoad:", 1LL);
    objc_initWeak(&from, self);
    objc_super v5 = self->_imageProxy;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C4AC4;
    v11[3] = &unk_10018E968;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    -[TVImageProxy setCompletionHandler:](v5, "setCompletionHandler:", v11);
    -[TVImageProxy load](self->_imageProxy, "load");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    p_id from = &from;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsImageView completion](self, "completion"));

    if (!v7) {
      goto LABEL_4;
    }
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      unsigned int v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(-[TVSettingsImageView completion](self, "completion"));
      v8[2](v8, 0LL, 0LL, 1LL);

      -[TVSettingsImageView setCompletion:](self, "setCompletion:", 0LL);
      -[TVSettingsImageView setImageLoaded:](self, "setImageLoaded:", 0LL);
      goto LABEL_4;
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000C4D24;
    v9[3] = &unk_10018E568;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    dispatch_async(&_dispatch_main_q, v9);
    p_id from = &v10;
  }

  objc_destroyWeak(p_from);
LABEL_4:
  objc_destroyWeak(&location);
}

- (id)_imageView
{
  return self->_imageView;
}

- (void)_setTintColor:(id)a3
{
  id v8 = a3;
  -[TVSettingsImageView setTintColor:](self, "setTintColor:", v8);
  id v4 = v8;
  self->_rendersImageAsTemplates = v8 != 0LL;
  image = self->_image;
  if (image)
  {
    imageView = self->_imageView;
    if (v8)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithRenderingMode:](image, "imageWithRenderingMode:", 2LL));
      -[UIImageView setImage:](imageView, "setImage:", v7);
    }

    else
    {
      -[UIImageView setImage:](imageView, "setImage:");
    }

    id v4 = v8;
  }
}

- (void)_setFocusedColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->__focusedColor, a3);
  imageView = self->_imageView;
  if (self->__focusedColor)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _flatImageWithColor:](self->_image, "_flatImageWithColor:"));
    -[UIImageView setHighlightedImage:](imageView, "setHighlightedImage:", v6);
  }

  else
  {
    -[UIImageView setHighlightedImage:](self->_imageView, "setHighlightedImage:");
  }
}

- (void)_setImage:(id)a3
{
  id v10 = a3;
  p_image = &self->_image;
  objc_storeStrong((id *)&self->_image, a3);
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", self->_imageContentMode);
  BOOL rendersImageAsTemplates = self->_rendersImageAsTemplates;
  image = self->_image;
  if (self->_rendersImageAsTemplates) {
    image = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithRenderingMode:](*p_image, "imageWithRenderingMode:", 2LL));
  }
  objc_storeStrong((id *)&self->_flatImage, image);
  if (rendersImageAsTemplates) {

  }
  focusedColor = self->__focusedColor;
  if (focusedColor) {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _flatImageWithColor:](*p_image, "_flatImageWithColor:", self->__focusedColor));
  }
  else {
    unsigned __int8 v9 = 0LL;
  }
  objc_storeStrong((id *)&self->_flatHighlightImage, v9);
  if (focusedColor) {

  }
  -[UIImageView setImage:](self->_imageView, "setImage:");
}

- (void)_updateImageViewWithPlaceholderImageIfNeeded
{
  if (!self->_image && self->_placeholderImage)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:");
    int64_t imageContentMode = self->_imageContentMode;
    -[UIImage size](self->_placeholderImage, "size");
    if (v5 == 1.0 && v4 == 1.0) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = imageContentMode;
    }
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v7);
  }

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
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

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (UIColor)_focusedColor
{
  return self->__focusedColor;
}

- (BOOL)_enableEdgeAntialiasingOnSelected
{
  return self->__enableEdgeAntialiasingOnSelected;
}

- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3
{
  self->__enableEdgeAntialiasingOnSelected = a3;
}

- (BOOL)_edgeAntialiasingOnSelectedRestrictedToLeftRightEdge
{
  return self->__edgeAntialiasingOnSelectedRestrictedToLeftRightEdge;
}

- (void)_setEdgeAntialiasingOnSelectedRestrictedToLeftRightEdge:(BOOL)a3
{
  self->__edgeAntialiasingOnSelectedRestrictedToLeftRightEdge = a3;
}

- (void).cxx_destruct
{
}

@end