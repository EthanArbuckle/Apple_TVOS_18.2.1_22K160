@interface TVHMediaImageView
+ (NSDictionary)backgroundImageCaches;
+ (id)_blankImageWithColor:(id)a3 size:(CGSize)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHMediaImageView)initWithFrame:(CGRect)a3;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (UIImage)image;
- (UIImageView)underlyingImageView;
- (UIView)overlayView;
- (double)cornerRadius;
- (id)_backgroundImage;
- (void)_startLoadingImageProxy;
- (void)_stopLoadingImageProxy;
- (void)_updateBackgroundImage;
- (void)_updateImageView;
- (void)_updateImageViewApperance;
- (void)_updateImageViewIfPossible;
- (void)imageProxyLoader:(id)a3 loadHasCompletedWithImage:(id)a4;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVHMediaImageView

- (TVHMediaImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHMediaImageView;
  v7 = -[TVHMediaImageView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___TVHImageProxyLoader);
    imageProxyLoader = v7->_imageProxyLoader;
    v7->_imageProxyLoader = v8;

    -[TVHImageProxyLoader setDelegate:](v7->_imageProxyLoader, "setDelegate:", v7);
    v7->_cornerRadius = 12.0;
    v10 = objc_alloc_init(&OBJC_CLASS___TVHPlaceholderView);
    placeholderView = v7->_placeholderView;
    v7->_placeholderView = v10;

    v12 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", x, y, width, height);
    underlyingImageView = v7->_underlyingImageView;
    v7->_underlyingImageView = v12;

    -[UIImageView setContentMode:](v7->_underlyingImageView, "setContentMode:", 1LL);
    -[UIImageView setClipsToBounds:](v7->_underlyingImageView, "setClipsToBounds:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView overlayContentView](v7->_underlyingImageView, "overlayContentView"));
    [v14 addSubview:v7->_placeholderView];

    -[TVHMediaImageView addSubview:](v7, "addSubview:", v7->_underlyingImageView);
  }

  return v7;
}

- (void)setImage:(id)a3
{
  v4 = (UIImage *)a3;
  -[TVHMediaImageView setImageProxy:](self, "setImageProxy:", 0LL);
  image = self->_image;
  self->_image = v4;

  -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
}

- (UIImage)image
{
  return -[UIImageView image](self->_underlyingImageView, "image");
}

- (void)setImageProxy:(id)a3
{
  v7 = (TVImageProxy *)a3;
  if (self->_imageProxy != v7)
  {
    -[TVHImageProxyLoader stopLoadingAndReset](self->_imageProxyLoader, "stopLoadingAndReset");
    objc_storeStrong((id *)&self->_imageProxy, a3);
    image = self->_image;
    self->_image = 0LL;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView window](self, "window"));
    if (v6)
    {
      -[TVHMediaImageView _updateImageView](self, "_updateImageView");
      -[TVHMediaImageView _startLoadingImageProxy](self, "_startLoadingImageProxy");
    }
  }
}

- (void)setPlaceholder:(id)a3
{
  v5 = (TVHPlaceholder *)a3;
  if (self->_placeholder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholder, a3);
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
    v5 = v6;
  }
}

- (void)setOverlayView:(id)a3
{
}

- (UIView)overlayView
{
  return -[TVHPlaceholderView overlayView](self->_placeholderView, "overlayView");
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
  }

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHMediaImageView;
  id v4 = a3;
  -[TVHMediaImageView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 != v7) {
    -[TVHMediaImageView _updateImageView](self, "_updateImageView");
  }
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaImageView;
  -[TVHMediaImageView setContentMode:](&v5, "setContentMode:");
  -[UIImageView setContentMode:](self->_underlyingImageView, "setContentMode:", a3);
}

- (CGSize)intrinsicContentSize
{
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView imageProxy](self, "imageProxy"));
  [v6 expectedSize];
  double v8 = v7;
  double v10 = v9;

  if (v8 == CGSizeZero.width && v10 == CGSizeZero.height)
  {
    -[UIImageView sizeThatFits:](self->_underlyingImageView, "sizeThatFits:", width, height);
  }

  else
  {
    double v12 = v8;
    double v13 = v10;
  }

  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHMediaImageView;
  -[TVHMediaImageView willMoveToWindow:](&v6, "willMoveToWindow:");
  int64_t v5 = -[TVHImageProxyLoader state](self->_imageProxyLoader, "state");
  if (a3)
  {
    if (!v5) {
      -[TVHMediaImageView _startLoadingImageProxy](self, "_startLoadingImageProxy");
    }
    -[TVHMediaImageView _updateImageView](self, "_updateImageView");
  }

  else if (v5 != 1)
  {
    -[TVHMediaImageView _stopLoadingImageProxy](self, "_stopLoadingImageProxy");
  }

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHMediaImageView;
  -[TVHMediaImageView layoutSubviews](&v7, "layoutSubviews");
  -[TVHMediaImageView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  if (!self->_image) {
    -[TVHMediaImageView _updateBackgroundImage](self, "_updateBackgroundImage");
  }
  -[UIImageView setFrame:](self->_underlyingImageView, "setFrame:", 0.0, 0.0, v4, v6);
  -[TVHPlaceholderView setFrame:](self->_placeholderView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)imageProxyLoader:(id)a3 loadHasCompletedWithImage:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)&self->_image, a4);
    -[TVHMediaImageView _updateImageViewIfPossible](self, "_updateImageViewIfPossible");
    id v6 = v7;
  }
}

- (void)_updateImageViewIfPossible
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView window](self, "window"));

  if (v3) {
    -[TVHMediaImageView _updateImageView](self, "_updateImageView");
  }
}

- (void)_updateImageViewApperance
{
  underlyingImageView = self->_underlyingImageView;
  -[TVHMediaImageView cornerRadius](self, "cornerRadius");
  -[UIImageView _setContinuousCornerRadius:](underlyingImageView, "_setContinuousCornerRadius:");
}

+ (NSDictionary)backgroundImageCaches
{
  if (qword_100157618 != -1) {
    dispatch_once(&qword_100157618, &stru_1000FF668);
  }
  return (NSDictionary *)(id)qword_100157610;
}

- (void)_updateImageView
{
  double v3 = self->_image;
  double v5 = v3;
  if (v3)
  {
    -[UIImageView setImage:](self->_underlyingImageView, "setImage:", v3);
    placeholder = 0LL;
LABEL_5:
    -[TVHPlaceholderView setPlaceholder:](self->_placeholderView, "setPlaceholder:", placeholder);
    goto LABEL_6;
  }

  if (self->_placeholder)
  {
    -[TVHMediaImageView _updateBackgroundImage](self, "_updateBackgroundImage");
    placeholder = self->_placeholder;
    goto LABEL_5;
  }

- (void)_updateBackgroundImage
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView _backgroundImage](self, "_backgroundImage"));
  -[UIImageView setImage:](self->_underlyingImageView, "setImage:", v3);
}

- (void)_startLoadingImageProxy
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView imageProxy](self, "imageProxy"));
  if (v3) {
    -[TVHImageProxyLoader startLoadingImageProxy:userInterfaceLayoutDirection:]( self->_imageProxyLoader,  "startLoadingImageProxy:userInterfaceLayoutDirection:",  v3,  -[TVHMediaImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"));
  }
}

- (void)_stopLoadingImageProxy
{
}

- (id)_backgroundImage
{
  if (v3 == CGSizeZero.width && v4 == CGSizeZero.height)
  {
    v14 = 0LL;
    return v14;
  }

  double v6 = v3;
  double v7 = v4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView traitCollection](self, "traitCollection"));
  id v9 = [v8 userInterfaceStyle];

  id v10 = [(id)((uint64_t (*)(TVHMediaImageView *))objc_opt_class)(self) backgroundImageCaches];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((unint64_t)v9 >= 2)
  {
    if (v9 != (id)2)
    {
      v15 = 0LL;
      double v12 = 0LL;
      goto LABEL_12;
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_placeholderBackgroundDarkStyleColor]( &OBJC_CLASS___UIColor,  "tvh_placeholderBackgroundDarkStyleColor"));
    double v13 = &off_1001064B0;
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_placeholderBackgroundLightStyleColor]( &OBJC_CLASS___UIColor,  "tvh_placeholderBackgroundLightStyleColor"));
    double v13 = &off_100106498;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v13]);
LABEL_12:
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v6, v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v16]);

  if (!v14)
  {
    objc_opt_class(self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_blankImageWithColor:size:", v12, v6, v7));
    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v6, v7));
      [v15 setObject:v14 forKey:v18];
    }
  }

  return v14;
}

+ (id)_blankImageWithColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  double v7 = objc_alloc_init(&OBJC_CLASS___UIGraphicsImageRendererFormat);
  -[UIGraphicsImageRendererFormat setOpaque:](v7, "setOpaque:", 1LL);
  double v8 = -[UIGraphicsImageRenderer initWithSize:format:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithSize:format:",  v7,  width,  height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100080564;
  v12[3] = &unk_1000FF690;
  id v13 = v6;
  id v9 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v8, "imageWithActions:", v12));

  return v10;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (TVHPlaceholder)placeholder
{
  return self->_placeholder;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIImageView)underlyingImageView
{
  return self->_underlyingImageView;
}

- (void).cxx_destruct
{
}

@end