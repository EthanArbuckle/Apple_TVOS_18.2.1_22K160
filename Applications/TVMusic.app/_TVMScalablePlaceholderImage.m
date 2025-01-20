@interface _TVMScalablePlaceholderImage
- (UIColor)backgroundColor;
- (UIColor)imageColor;
- (UIImage)image;
- (_TVMScalablePlaceholderImage)initWithImage:(id)a3 scale:(double)a4 imageColor:(id)a5 backgroundColor:(id)a6;
- (double)imageScale;
- (void)setBackgroundColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageColor:(id)a3;
- (void)setImageScale:(double)a3;
@end

@implementation _TVMScalablePlaceholderImage

- (_TVMScalablePlaceholderImage)initWithImage:(id)a3 scale:(double)a4 imageColor:(id)a5 backgroundColor:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____TVMScalablePlaceholderImage;
  v14 = -[_TVMScalablePlaceholderImage init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    v15->_imageScale = a4;
    objc_storeStrong((id *)&v15->_imageColor, a5);
    objc_storeStrong((id *)&v15->_backgroundColor, a6);
  }

  return v15;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (double)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (void)setImageColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end