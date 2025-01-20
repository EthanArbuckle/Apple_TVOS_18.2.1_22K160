@interface _TVImageNamedLayerImageRepresentation
- (CGImage)_originalImage;
- (_TVImageNamedLayerImageRepresentation)initWithNamedLayerImage:(id)a3;
- (id)_originalImageCacheKey;
@end

@implementation _TVImageNamedLayerImageRepresentation

- (_TVImageNamedLayerImageRepresentation)initWithNamedLayerImage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVImageNamedLayerImageRepresentation;
  v6 = -[_TVImageNamedLayerImageRepresentation init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    p_namedLayerImage = (id *)&v6->_namedLayerImage;
    objc_storeStrong((id *)&v6->_namedLayerImage, a3);
    if (*p_namedLayerImage)
    {
      [*p_namedLayerImage frame];
      -[TVPImageRepresentation setDestinationRect:](v7, "setDestinationRect:");
    }
  }

  return v7;
}

- (CGImage)_originalImage
{
  char v3 = objc_opt_respondsToSelector(self->_namedLayerImage, "image");
  namedLayerImage = self->_namedLayerImage;
  if ((v3 & 1) != 0)
  {
    id v5 = (CGImage *)-[UINamedLayerImage image](namedLayerImage, "image");
  }

  else if ((objc_opt_respondsToSelector(namedLayerImage, "imageObj") & 1) != 0)
  {
    id v6 = objc_claimAutoreleasedReturnValue(-[UINamedLayerImage imageObj](self->_namedLayerImage, "imageObj"));
    id v5 = (CGImage *)[v6 CGImage];
  }

  else
  {
    id v5 = 0LL;
  }

  return CGImageRetain(v5);
}

- (id)_originalImageCacheKey
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", self->_namedLayerImage);
}

- (void).cxx_destruct
{
}

@end