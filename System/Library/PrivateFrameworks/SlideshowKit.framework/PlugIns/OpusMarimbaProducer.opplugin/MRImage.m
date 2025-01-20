@interface MRImage
- (BOOL)filtersNearest;
- (BOOL)hasKBOrShader;
- (BOOL)hasKenBurns;
- (BOOL)isEmpty;
- (BOOL)isOpaque;
- (BOOL)mipmapFiltersNearest;
- (BOOL)preservesAspectRatio;
- (BOOL)scaleWasFixedForTargetAspectRatio;
- (BOOL)usesBackgroundColorAsBorderColor;
- (BOOL)usesMipmap;
- (CGSize)relativeSizeInContextPixelSize:(CGSize)a3;
- (CGSize)size;
- (EAGLContext)updateGLContext;
- (MRImage)init;
- (MRImage)initWithImage:(id)a3;
- (MRImage)initWithTextureSource:(id)a3 andSize:(CGSize)a4;
- (MRImageManager)imageManager;
- (MRTexture)texture;
- (NSDictionary)shader;
- (NSMutableDictionary)userData;
- (NSString)filterID;
- (NSString)label;
- (double)aspectRatio;
- (double)centerX;
- (double)centerY;
- (double)height;
- (double)renderTime;
- (double)rotationAngle;
- (double)scale;
- (double)sourceTimestamp;
- (double)width;
- (id)insertingInCollection;
- (id)retainByUser;
- (id)retainedByUserImage;
- (id)retainedByUserImageWithShader:(id)a3;
- (int)clampMode;
- (int)retainByUserCount;
- (void)cleanup;
- (void)dealloc;
- (void)getMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4;
- (void)kenburnsMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4;
- (void)releaseByUser;
- (void)removingFromCollection;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClampMode:(int)a3;
- (void)setFilterID:(id)a3;
- (void)setFiltersNearest:(BOOL)a3;
- (void)setHasKenBurns:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMipmapFiltersNearest:(BOOL)a3;
- (void)setOnContext:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6;
- (void)setPreservesAspectRatio:(BOOL)a3;
- (void)setRenderTime:(double)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScaleWasFixedForTargetAspectRatio:(BOOL)a3;
- (void)setShader:(id)a3;
- (void)setSourceTimestamp:(double)a3;
- (void)setUsesBackgroundColorAsBorderColor:(BOOL)a3;
- (void)setUsesMipmap:(BOOL)a3;
- (void)unsetOnContext:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5;
- (void)uploadCGImage:(CGImage *)a3 toTextureRect:(CGRect)a4;
@end

@implementation MRImage

- (MRImage)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRImage;
  result = -[MRImage init](&v3, "init");
  if (result)
  {
    result->_scale = 1.0;
    result->_flags |= 2u;
    result->_clampMode = 2;
  }

  return result;
}

- (MRImage)initWithImage:(id)a3
{
  v4 = -[MRImage init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_imageManager = (MRImageManager *)*((void *)a3 + 5);
    v4->_referenceImage = (MRImage *)[a3 retainByUser];
    v5->_size = *(CGSize *)((char *)a3 + 136);
    v5->_flags = *((_DWORD *)a3 + 6) & 0x4B;
  }

  return v5;
}

- (MRImage)initWithTextureSource:(id)a3 andSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v7 = -[MRImage init](self, "init");
  if (v7)
  {
    v7->_imageManager = (MRImageManager *)[a3 imageManager];
    v7->_textureSource = (MRTextureSource *)a3;
    v7->_size.CGFloat width = width;
    v7->_size.CGFloat height = height;
    if (*((_BYTE *)[a3 textureOptions] + 4)) {
      v7->_flags |= 8u;
    }
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRImage;
  -[MRImage dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->_imageManager)
  {
    objc_sync_enter(self);
    referenceImage = self->_referenceImage;
    if (referenceImage)
    {
      -[MRImage releaseByUser](referenceImage, "releaseByUser");
      self->_referenceImage = 0LL;
    }

    textureSource = self->_textureSource;
    if (textureSource)
    {

      self->_textureSource = 0LL;
    }

    texture = self->_texture;
    if (texture)
    {
      if (-[MRTexture isShared](texture, "isShared")) {
        -[MRImageManager recycleTexture:](self->_imageManager, "recycleTexture:", self->_texture);
      }

      self->_texture = 0LL;
    }

    self->_imageManager = 0LL;
    self->_size.CGFloat width = 0.0;
    self->_size.CGFloat height = 0.0;
    userData = self->_userData;
    if (userData)
    {

      self->_userData = 0LL;
    }

    shader = self->_shader;
    if (shader)
    {

      self->_shader = 0LL;
    }

    filterID = self->_filterID;
    if (filterID)
    {

      self->_filterID = 0LL;
    }

    label = self->_label;
    if (label)
    {

      self->_label = 0LL;
    }

    objc_sync_exit(self);
  }

- (id)retainByUser
{
  p_retainByUserCount = &self->_retainByUserCount;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_retainByUserCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_retainByUserCount));
  return self;
}

- (void)releaseByUser
{
  p_retainByUserCount = &self->_retainByUserCount;
  do
  {
    unsigned int v3 = __ldaxr((unsigned int *)p_retainByUserCount);
    unsigned int v4 = v3 - 1;
  }

  while (__stlxr(v4, (unsigned int *)p_retainByUserCount));
  if (!v4)
  {
    v5 = self;
    -[MRImage cleanup](self, "cleanup");
    self = v5;
  }
}

- (id)insertingInCollection
{
  return self;
}

- (void)removingFromCollection
{
}

- (id)retainedByUserImage
{
  v2 = -[MRImage initWithImage:](objc_alloc(&OBJC_CLASS___MRImage), "initWithImage:", self);

  return v2;
}

- (id)retainedByUserImageWithShader:(id)a3
{
  unsigned int v4 = -[MRImage initWithImage:](objc_alloc(&OBJC_CLASS___MRImage), "initWithImage:", self);

  -[MRImage setShader:](v4, "setShader:", a3);
  return v4;
}

- (BOOL)usesBackgroundColorAsBorderColor
{
  return self->_flags & 1;
}

- (void)setUsesBackgroundColorAsBorderColor:(BOOL)a3
{
  unsigned int flags = self->_flags;
  if (a3)
  {
    self->_unsigned int flags = flags | 1;
    self->_clampMode = 1;
  }

  else
  {
    self->_unsigned int flags = flags & 0xFFFFFFFE;
  }

- (BOOL)filtersNearest
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)setFiltersNearest:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFEF | v3;
}

- (BOOL)isOpaque
{
  return -[MRTexture isOpaque](-[MRImage texture](self, "texture"), "isOpaque");
}

- (BOOL)usesMipmap
{
  referenceImage = self->_referenceImage;
  if (referenceImage) {
    LOBYTE(v4) = -[MRImage usesMipmap](referenceImage, "usesMipmap");
  }
  else {
    return (LOBYTE(self->_flags) >> 3) & 1;
  }
  return v4;
}

- (void)setUsesMipmap:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFF7 | v3;
}

- (BOOL)mipmapFiltersNearest
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (void)setMipmapFiltersNearest:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFDF | v3;
}

- (BOOL)preservesAspectRatio
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setPreservesAspectRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFFD | v3;
}

- (BOOL)hasKenBurns
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (void)setHasKenBurns:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFFB | v3;
}

- (BOOL)scaleWasFixedForTargetAspectRatio
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setScaleWasFixedForTargetAspectRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFBF | v3;
}

- (void)setLabel:(id)a3
{
  label = self->_label;
  if (label != a3)
  {

    v6 = (NSString *)[a3 copy];
    self->_label = v6;
    texture = self->_texture;
    if (texture) {
      -[MRTexture setLabel:](texture, "setLabel:", v6);
    }
  }

- (NSMutableDictionary)userData
{
  userData = self->_userData;
  if (!userData)
  {
    userData = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_userData = userData;
  }

  BOOL v4 = userData;
  objc_sync_exit(self);
  return v4;
}

- (double)width
{
  return self->_size.width;
}

- (double)height
{
  return self->_size.height;
}

- (double)aspectRatio
{
  return self->_size.width / self->_size.height;
}

- (BOOL)isEmpty
{
  return self->_size.width <= 0.0 || self->_size.height <= 0.0;
}

- (void)kenburnsMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4
{
  *(float *)v4.i32 = a4;
  double scale = self->_scale;
  if (scale > 0.0)
  {
    float v8 = 1.0 / scale;
    float v9 = v8;
  }

  else
  {
    float v9 = 1.0;
  }

  float v10 = self->_size.width / self->_size.height;
  if (self->_rotationAngle == 0.0)
  {
    MRMatrix_SetDiagonal((uint64_t)a3, v9, (float)(v9 * v10) / *(float *)v4.i32, 1.0);
  }

  else
  {
    int32x2_t v13 = v4;
    MRMatrix_SetDiagonal((uint64_t)a3, 1.0, 1.0 / *(float *)v4.i32, 1.0);
    float v11 = self->_rotationAngle * 57.2957764;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)a3, 0.0, 0.0, v11);
    float32x2_t v12 = vdiv_f32(*(float32x2_t *)(a3 + 4), (float32x2_t)vdup_lane_s32(v13, 0));
    *((float32x2_t *)a3 + 2) = v12;
    v12.f32[0] = v9;
    MRMatrix_Scale((float32x2_t *)a3, v12, v9 * v10, 1.0);
  }

  *((float32x2_t *)a3 + 6) = vcvt_f32_f64(vaddq_f64(*(float64x2_t *)&self->_centerX, vcvtq_f64_f32(*(float32x2_t *)(a3 + 12))));
}

- (void)getMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4
{
  float v4 = a4;
  referenceImage = self->_referenceImage;
  if (referenceImage)
  {
    a4 = 0.0;
    if (v4 > 0.0)
    {
      -[MRImage aspectRatio](self, "aspectRatio", *(double *)&a4);
      a4 = v8;
    }

    -[MRImage getMatrix:forReferenceAspectRatio:]( referenceImage,  "getMatrix:forReferenceAspectRatio:",  a3,  *(double *)&a4);
    goto LABEL_26;
  }

  unsigned int v10 = -[MRTexture textureTarget](-[MRImage texture](self, "texture"), "textureTarget");
  if (v4 <= 0.0)
  {
    if (v10 == 3553)
    {
      float var1 = 1.0;
      float var0 = 1.0;
      float v14 = -1.0;
    }

    else
    {
      $85CD2974BE96D4886BB301820D1C36C2 v18 = -[MRTexture size](self->_texture, "size");
      float var0 = (float)v18.var0;
      float var1 = (float)v18.var1;
      float v14 = -(float)v18.var1;
    }

    MRMatrix_SetDiagonal((uint64_t)a3, var0, v14, 1.0);
  }

  else
  {
    if (v10 == 3553)
    {
      float var1 = 0.5;
      MRMatrix_SetDiagonal((uint64_t)a3, 0.5, -0.5, 1.0);
      a3[13] = 0.5;
      uint64_t v12 = 12LL;
      goto LABEL_14;
    }

    $85CD2974BE96D4886BB301820D1C36C2 v15 = -[MRTexture size](self->_texture, "size");
    float v16 = (float)v15.var0 * 0.5;
    float v17 = (float)v15.var1;
    MRMatrix_SetDiagonal((uint64_t)a3, v16, (float)v15.var1 * -0.5, 1.0);
    a3[12] = v16;
    float var1 = v17 * 0.5;
  }

  uint64_t v12 = 13LL;
LABEL_14:
  a3[v12] = var1;
  unsigned __int8 v19 = -[MRTexture orientation](-[MRImage texture](self, "texture"), "orientation");
  if ((v19 & 0xFE) != 0)
  {
    unsigned __int8 v20 = v19;
    MRMatrix_Clear((uint64_t)v27);
    switch(v20)
    {
      case 2u:
        goto LABEL_20;
      case 3u:
        HIDWORD(v28) = -1082130432;
LABEL_20:
        v27[0] = -1.0;
        break;
      case 4u:
        HIDWORD(v28) = -1082130432;
        break;
      case 5u:
        uint64_t v21 = 3212836864LL;
        unint64_t v22 = 0xBF80000000000000LL;
        goto LABEL_22;
      case 6u:
        unint64_t v23 = 0x3F80000000000000LL;
        uint64_t v24 = 3212836864LL;
        goto LABEL_24;
      case 7u:
        uint64_t v21 = 1065353216LL;
        unint64_t v22 = 0x3F80000000000000LL;
LABEL_22:
        uint64_t v28 = v21;
        *(void *)v27 = v22;
        break;
      case 8u:
        unint64_t v23 = 0xBF80000000000000LL;
        uint64_t v24 = 1065353216LL;
LABEL_24:
        *(void *)v27 = v23;
        uint64_t v28 = v24;
        break;
      default:
        break;
    }

    double v9 = MRMatrix_PreMultiply(v27, (uint64_t)a3);
  }

- (void)setOnContext:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6
{
}

- (void)unsetOnContext:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5
{
}

- (CGSize)relativeSizeInContextPixelSize:(CGSize)a3
{
  double v3 = (self->_size.width + self->_size.width) / a3.width;
  double v4 = (self->_size.height + self->_size.height) / a3.height;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (NSString)filterID
{
  CGSize result = self->_filterID;
  if (!result)
  {
    CGSize result = (NSString *)&self->_referenceImage->super.isa;
    if (result) {
      return (NSString *)-[NSString filterID](result, "filterID");
    }
  }

  return result;
}

- (BOOL)hasKBOrShader
{
  return self->_shader
      || self->_centerX != 0.0
      || self->_centerY != 0.0
      || self->_scale != 1.0
      || self->_rotationAngle != 0.0;
}

- (MRTexture)texture
{
  referenceImage = self->_referenceImage;
  if (referenceImage) {
    return -[MRImage texture](referenceImage, "texture");
  }
  CGSize result = self->_texture;
  if (!result)
  {
    CGSize result = (MRTexture *)self->_textureSource;
    if (result)
    {
      CGSize result = (MRTexture *)-[MRTexture texture](result, "texture");
      self->_texture = result;
    }
  }

  return result;
}

- (EAGLContext)updateGLContext
{
  return -[MRTexture glContext](-[MRImage texture](self, "texture"), "glContext");
}

- (void)uploadCGImage:(CGImage *)a3 toTextureRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = -[MRImage texture](self, "texture");
  unsigned int v10 = -[MRTexture isMonochromatic](v9, "isMonochromatic");
  double v11 = 4.0;
  if (v10) {
    double v11 = 1.0;
  }
  size_t v12 = (unint64_t)(width * v11);
  if (v10) {
    uint32_t v13 = 0;
  }
  else {
    uint32_t v13 = 8194;
  }
  float v14 = malloc((unint64_t)(height * (double)(unint64_t)(width * v11)));
  ColorSpace = CGImageGetColorSpace(a3);
  float v16 = CGBitmapContextCreate(v14, (unint64_t)width, (unint64_t)height, 8uLL, v12, ColorSpace, v13);
  CGContextSetBlendMode(v16, kCGBlendModeCopy);
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.double width = width;
  v17.size.double height = height;
  CGContextDrawImage(v16, v17, a3);
  CGContextRelease(v16);
  -[MRTexture uploadData:rowBytes:toRect:](v9, "uploadData:rowBytes:toRect:", v14, v12, x, y, width, height);
  free(v14);
}

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void)setFilterID:(id)a3
{
}

- (NSDictionary)shader
{
  return (NSDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setShader:(id)a3
{
}

- (double)sourceTimestamp
{
  return self->_sourceTimestamp;
}

- (void)setSourceTimestamp:(double)a3
{
  self->_sourceTimestamp = a3;
}

- (double)renderTime
{
  return self->_renderTime;
}

- (void)setRenderTime:(double)a3
{
  self->_renderTime = a3;
}

- (int)clampMode
{
  return self->_clampMode;
}

- (void)setClampMode:(int)a3
{
  self->_clampMode = a3;
}

- (int)retainByUserCount
{
  return self->_retainByUserCount;
}

- (NSString)label
{
  return self->_label;
}

@end