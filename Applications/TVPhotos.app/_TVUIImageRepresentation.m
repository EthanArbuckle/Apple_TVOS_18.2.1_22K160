@interface _TVUIImageRepresentation
- (CGImage)_originalImage;
- (_TVUIImageRepresentation)initWithImage:(id)a3;
- (id)_originalImageCacheKey;
@end

@implementation _TVUIImageRepresentation

- (_TVUIImageRepresentation)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVUIImageRepresentation;
  v6 = -[_TVUIImageRepresentation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (CGImage)_originalImage
{
  return CGImageRetain(-[UIImage CGImage](self->_image, "CGImage"));
}

- (id)_originalImageCacheKey
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", self->_image);
}

- (void).cxx_destruct
{
}

@end