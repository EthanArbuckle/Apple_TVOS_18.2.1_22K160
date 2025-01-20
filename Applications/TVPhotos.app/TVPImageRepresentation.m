@interface TVPImageRepresentation
+ (id)_loadingQueue;
+ (id)imageRepresentationWithImage:(id)a3;
+ (id)imageRepresentationWithImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)imageRepresentationWithImageProxy:(id)a3;
+ (id)imageRepresentationWithNamedLayerImage:(id)a3;
+ (id)imageRepresentationWithURL:(id)a3;
- (BOOL)isFixedFrame;
- (CGImage)_imageForOriginalImage:(CGImage *)a3;
- (CGImage)_originalImage;
- (CGImage)newImage;
- (CGRect)destinationRect;
- (CGRect)sourceRect;
- (NSString)cacheKey;
- (id)_originalImageCacheKey;
- (void)loadImageWithCompletion:(id)a3;
- (void)setDestinationRect:(CGRect)a3;
- (void)setFixedFrame:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
@end

@implementation TVPImageRepresentation

+ (id)imageRepresentationWithImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[_TVNamedImageRepresentation initWithImageNamed:inBundle:compatibleWithTraitCollection:]( objc_alloc(&OBJC_CLASS____TVNamedImageRepresentation),  "initWithImageNamed:inBundle:compatibleWithTraitCollection:",  v9,  v8,  v7);

  return v10;
}

+ (id)imageRepresentationWithURL:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___TVImageProxy);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
  id v7 = -[TVImageProxy initWithObject:imageLoader:groupType:](v5, "initWithObject:imageLoader:groupType:", v4, v6, 0LL);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 imageRepresentationWithImageProxy:v7]);
  return v8;
}

+ (id)imageRepresentationWithImage:(id)a3
{
  id v3 = a3;
  id v4 = -[_TVUIImageRepresentation initWithImage:]( objc_alloc(&OBJC_CLASS____TVUIImageRepresentation),  "initWithImage:",  v3);

  return v4;
}

+ (id)imageRepresentationWithImageProxy:(id)a3
{
  id v3 = a3;
  id v4 = -[_TVImageProxyRepresentation initWithImageProxy:]( objc_alloc(&OBJC_CLASS____TVImageProxyRepresentation),  "initWithImageProxy:",  v3);

  return v4;
}

+ (id)imageRepresentationWithNamedLayerImage:(id)a3
{
  id v3 = a3;
  id v4 = -[_TVImageNamedLayerImageRepresentation initWithNamedLayerImage:]( objc_alloc(&OBJC_CLASS____TVImageNamedLayerImageRepresentation),  "initWithNamedLayerImage:",  v3);

  return v4;
}

- (NSString)cacheKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageRepresentation _originalImageCacheKey](self, "_originalImageCacheKey"));
  if (v3)
  {
    v7.origin.x = CGRectZero.origin.x;
    v7.origin.y = CGRectZero.origin.y;
    v7.size.width = CGRectZero.size.width;
    v7.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(self->_sourceRect, v7))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{{%.*g, %.*g}, {%.*g, %.*g}}",  17LL,  *(void *)&self->_sourceRect.origin.x,  17LL,  *(void *)&self->_sourceRect.origin.y,  17LL,  *(void *)&self->_sourceRect.size.width,  17LL,  *(void *)&self->_sourceRect.size.height));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:v4]);

      id v3 = (void *)v5;
    }
  }

  return (NSString *)v3;
}

- (CGImage)newImage
{
  result = -[TVPImageRepresentation _originalImage](self, "_originalImage");
  if (result)
  {
    id v4 = result;
    uint64_t v5 = -[TVPImageRepresentation _imageForOriginalImage:](self, "_imageForOriginalImage:", result);
    CFRelease(v4);
    return v5;
  }

  return result;
}

- (void)loadImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_loadingQueue");
  CGRect v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000EAD4;
  v9[3] = &unk_1000C95C8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (CGImage)_imageForOriginalImage:(CGImage *)a3
{
  if (!a3) {
    return 0LL;
  }
  id v4 = CGImageRetain(a3);
  -[TVPImageRepresentation sourceRect](self, "sourceRect");
  v10.origin.x = CGRectZero.origin.x;
  v10.origin.y = CGRectZero.origin.y;
  v10.size.width = CGRectZero.size.width;
  v10.size.height = CGRectZero.size.height;
  if (!CGRectEqualToRect(v8, v10))
  {
    -[TVPImageRepresentation sourceRect](self, "sourceRect");
    CGImageRef v5 = CGImageCreateWithImageInRect(v4, v9);
    if (v5)
    {
      id v6 = v5;
      CGImageRelease(v4);
      return v6;
    }
  }

  return v4;
}

- (CGImage)_originalImage
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"TVPImageRepresentation.m" lineNumber:145 description:@"subclass must implement"];

  return 0LL;
}

- (id)_originalImageCacheKey
{
  return 0LL;
}

+ (id)_loadingQueue
{
  if (qword_100102EC8 != -1) {
    dispatch_once(&qword_100102EC8, &stru_1000C9C50);
  }
  return (id)qword_100102EC0;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)destinationRect
{
  double x = self->_destinationRect.origin.x;
  double y = self->_destinationRect.origin.y;
  double width = self->_destinationRect.size.width;
  double height = self->_destinationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDestinationRect:(CGRect)a3
{
  self->_destinationRect = a3;
}

- (BOOL)isFixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

@end