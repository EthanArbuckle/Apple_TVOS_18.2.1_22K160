@interface TVUINamedLayerStack
- (BOOL)flatImageContainsCornerRadius;
- (CGImage)flattenedImage;
- (CGSize)radiosityImageScale;
- (CGSize)size;
- (NSArray)layers;
- (NSString)name;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)radiosityImage;
- (void)dealloc;
- (void)setFlatImageContainsCornerRadius:(BOOL)a3;
- (void)setFlattenedImage:(CGImage *)a3;
- (void)setLayers:(id)a3;
- (void)setName:(id)a3;
- (void)setRadiosityImage:(id)a3;
- (void)setRadiosityImageScale:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TVUINamedLayerStack

- (void)dealloc
{
  flattenedImage = self->_flattenedImage;
  if (flattenedImage) {
    CFRelease(flattenedImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVUINamedLayerStack;
  -[TVUINamedLayerStack dealloc](&v4, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = -[NSString copy](self->_name, "copy");
    v6 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v5;

    id v7 = -[NSArray copy](self->_layers, "copy");
    v8 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v7;

    *(CGSize *)(v4 + 56) = self->_size;
    *((void *)v4 + 5) = *(void *)&self->_scale;
    *((void *)v4 + 1) = self->_flattenedImage;
    id v9 = [self->_radiosityImage copy];
    v10 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v9;

    *(CGSize *)(v4 + 72) = self->_radiosityImageScale;
    v4[16] = self->_flatImageContainsCornerRadius;
  }

  return v4;
}

- (CGImage)flattenedImage
{
  return self->_flattenedImage;
}

- (void)setFlattenedImage:(CGImage *)a3
{
  flattenedImage = self->_flattenedImage;
  if (flattenedImage != a3)
  {
    if (flattenedImage)
    {
      CFRelease(flattenedImage);
      self->_flattenedImage = 0LL;
    }

    if (a3) {
      self->_flattenedImage = CGImageRetain(a3);
    }
  }

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (id)radiosityImage
{
  return self->_radiosityImage;
}

- (void)setRadiosityImage:(id)a3
{
}

- (CGSize)radiosityImageScale
{
  double width = self->_radiosityImageScale.width;
  double height = self->_radiosityImageScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRadiosityImageScale:(CGSize)a3
{
  self->_radiosityImageScale = a3;
}

- (BOOL)flatImageContainsCornerRadius
{
  return self->_flatImageContainsCornerRadius;
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
  self->_flatImageContainsCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end