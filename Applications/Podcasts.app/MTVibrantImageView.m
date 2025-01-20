@interface MTVibrantImageView
- (MTVibrantImageView)initWithFrame:(CGRect)a3;
- (UIColor)vibrancyColor;
- (UIImage)image;
- (UIImageView)imageView;
- (UIView)vibrancyView;
- (id)compositingFilter;
- (void)setCompositingFilter:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVibrancyColor:(id)a3;
- (void)setVibrancyView:(id)a3;
@end

@implementation MTVibrantImageView

- (MTVibrantImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTVibrantImageView;
  v7 = -[MTVibrantImageView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = v8;

    -[UIImageView setAutoresizingMask:](v7->_imageView, "setAutoresizingMask:", 18LL);
    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 2LL);
    -[MTVibrantImageView addSubview:](v7, "addSubview:", v7->_imageView);
    v10 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", x, y, width, height);
    vibrancyView = v7->_vibrancyView;
    v7->_vibrancyView = v10;

    uint64_t v12 = kCAFilterPlusL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7->_vibrancyView, "layer"));
    [v13 setCompositingFilter:v12];

    -[UIView setAutoresizingMask:](v7->_vibrancyView, "setAutoresizingMask:", 18LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[UIView setBackgroundColor:](v7->_vibrancyView, "setBackgroundColor:", v14);

    -[MTVibrantImageView addSubview:](v7, "addSubview:", v7->_vibrancyView);
  }

  return v7;
}

- (void)setImage:(id)a3
{
}

- (id)compositingFilter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_vibrancyView, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 compositingFilter]);

  return v3;
}

- (void)setCompositingFilter:(id)a3
{
  vibrancyView = self->_vibrancyView;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](vibrancyView, "layer"));
  [v5 setCompositingFilter:v4];
}

- (UIColor)vibrancyColor
{
  return -[UIView backgroundColor](self->_vibrancyView, "backgroundColor");
}

- (void)setVibrancyColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end