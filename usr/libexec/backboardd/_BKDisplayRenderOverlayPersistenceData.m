@interface _BKDisplayRenderOverlayPersistenceData
+ (BOOL)supportsSecureCoding;
+ (id)classesRequiredToDecode;
- (BKSDisplayRenderOverlayDescriptor)descriptor;
- (BOOL)isFrozen;
- (CGImage)image;
- (_BKDisplayRenderOverlayPersistenceData)initWithCoder:(id)a3;
- (float)level;
- (id)_initWithDescriptor:(id)a3 overlayType:(int64_t)a4 imageData:(id)a5 level:(float)a6 frozen:(BOOL)a7;
- (int64_t)overlayType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setImage:(CGImage *)a3;
- (void)setLevel:(float)a3;
- (void)setOverlayType:(int64_t)a3;
@end

@implementation _BKDisplayRenderOverlayPersistenceData

- (id)_initWithDescriptor:(id)a3 overlayType:(int64_t)a4 imageData:(id)a5 level:(float)a6 frozen:(BOOL)a7
{
  id v13 = a3;
  v14 = (const __CFData *)a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____BKDisplayRenderOverlayPersistenceData;
  v15 = -[_BKDisplayRenderOverlayPersistenceData init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    v15->_level = a6;
    v15->_overlayType = a4;
    objc_storeStrong((id *)&v15->_descriptor, a3);
    v17 = CGDataProviderCreateWithCFData(v14);
    CGImageRef v18 = CGImageCreateWithPNGDataProvider(v17, 0LL, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v17);
    CFAutorelease(v18);
    v16->_image = v18;
    CFRetain(v18);
    objc_storeStrong((id *)&v16->_imageData, a5);
    v16->_frozen = a7;
  }

  return v16;
}

- (void)dealloc
{
  self->_overlayType = 0LL;
  image = self->_image;
  if (image) {
    CGImageRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____BKDisplayRenderOverlayPersistenceData;
  -[_BKDisplayRenderOverlayPersistenceData dealloc](&v4, "dealloc");
}

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image != a3)
  {
    if (image)
    {
      CGImageRelease(image);
      imageData = self->_imageData;
      self->_imageData = 0LL;
    }

    self->_image = CGImageRetain(a3);
  }

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  *(float *)&double v4 = self->_level;
  [v11 encodeFloat:@"level" forKey:v4];
  [v11 encodeInteger:self->_overlayType forKey:@"overlayType"];
  [v11 encodeBool:self->_frozen forKey:@"frozen"];
  [v11 encodeObject:self->_descriptor forKey:@"descriptor"];
  v5 = v11;
  imageData = self->_imageData;
  if (imageData) {
    goto LABEL_2;
  }
  image = self->_image;
  if (image)
  {
    v8 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    v9 = CGImageDestinationCreateWithData(v8, @"public.png", 1uLL, 0LL);
    CGImageDestinationAddImage(v9, image, 0LL);
    if (!CGImageDestinationFinalize(v9))
    {

      v8 = 0LL;
    }

    CFRelease(v9);
    v10 = self->_imageData;
    self->_imageData = (NSData *)v8;

    imageData = self->_imageData;
    v5 = v11;
    if (imageData)
    {
LABEL_2:
      [v11 encodeObject:imageData forKey:@"imageData2"];
      v5 = v11;
    }
  }
}

- (_BKDisplayRenderOverlayPersistenceData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"overlayType"];
  id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BKSDisplayRenderOverlayDescriptor, v6),  @"descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 decodeFloatForKey:@"level"];
  int v10 = v9;
  id v11 = [v4 decodeBoolForKey:@"frozen"];
  id v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v12), @"imageData2");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v8) {
    BOOL v16 = v14 == 0LL;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    v17 = 0LL;
  }

  else
  {
    LODWORD(v15) = v10;
    self = (_BKDisplayRenderOverlayPersistenceData *) -[_BKDisplayRenderOverlayPersistenceData _initWithDescriptor:overlayType:imageData:level:frozen:]( self,  "_initWithDescriptor:overlayType:imageData:level:frozen:",  v8,  v5,  v14,  v11,  v15);
    v17 = self;
  }

  return v17;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (CGImage)image
{
  return self->_image;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
}

+ (id)classesRequiredToDecode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode]( &OBJC_CLASS___BKSDisplayRenderOverlayDescriptor,  "_classesRequiredToDecode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v2));

  objc_msgSend(v3, "addObject:", objc_opt_class(NSMutableData, v4));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end