@interface TVHOneUpImageView
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHOneUpImageView)initWithFrame:(CGRect)a3;
- (void)setImageSize:(CGSize)a3;
@end

@implementation TVHOneUpImageView

- (TVHOneUpImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHOneUpImageView;
  v3 = -[TVHMediaImageView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVHOneUpImageView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[TVHOneUpImageView setAutoresizingMask:](v3, "setAutoresizingMask:", 18LL);
  }

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

@end