@interface MRTextureSource
- ($34D90DBCE5BAE006D482B7C15EEFCEBA)textureOptions;
- ($85CD2974BE96D4886BB301820D1C36C2)size;
- (BOOL)wantsSharedTexture;
- (MRImageManager)imageManager;
- (MRTexture)texture;
- (MRTextureSource)initWithCGContext:(CGContext *)a3 imageManager:(id)a4;
- (MRTextureSource)initWithCGContext:(CGContext *)a3 size:(id)a4 imageManager:(id)a5;
- (MRTextureSource)initWithCGImage:(CGImage *)a3 textureSize:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithCVPixelBuffer:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithCVTexture:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithSize:(id)a3 andColor:(const float *)a4 imageManager:(id)a5;
- (void)addOverlayForROI:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)generateMipmap;
- (void)setWantsSharedTexture:(BOOL)a3;
@end

@implementation MRTextureSource

- (MRTextureSource)initWithSize:(id)a3 andColor:(const float *)a4 imageManager:(id)a5
{
  result = -[MRTextureSource init](self, "init");
  if (result)
  {
    result->_imageManager = (MRImageManager *)a5;
    result->_size = ($DFC8CE4431498B03249AF47446AA0C66)a3;
    if (a4)
    {
      result->_color[0] = *a4;
      result->_color[1] = a4[1];
      result->_color[2] = a4[2];
      float v9 = a4[3];
    }

    else
    {
      float v9 = -1.0;
    }

    result->_color[3] = v9;
    result->_isOpaque = v9 >= 1.0;
  }

  return result;
}

- (MRTextureSource)initWithCGImage:(CGImage *)a3 textureSize:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  BOOL v7 = a7;
  unsigned __int8 v9 = a5;
  v12 = -[MRTextureSource init](self, "init");
  v13 = v12;
  if (!v12) {
    return v13;
  }
  v12->_imageManager = (MRImageManager *)a6;
  v12->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
  v12->_orientation = v9;
  ColorSpace = CGImageGetColorSpace(a3);
  if (!v7)
  {
    if (ColorSpace)
    {
      CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
      v13->_textureOptions.wantsMonochromatic = Model == kCGColorSpaceModelMonochrome;
      *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
      if (Model == kCGColorSpaceModelMonochrome)
      {
        char v15 = 0;
        goto LABEL_7;
      }
    }

    else
    {
      v13->_textureOptions.wantsMonochromatic = 0;
      *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
    }

    unsigned int var0 = 4 * a4.var0;
    char v15 = 1;
    goto LABEL_10;
  }

  char v15 = 0;
  v13->_textureOptions.wantsMonochromatic = 1;
  *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
LABEL_7:
  unsigned int var0 = a4.var0;
LABEL_10:
  v13->_dataRowBytes = var0;
  size_t v18 = var0 * a4.var1;
  v13->_dataSize = v18;
  v13->_datas[0] = malloc(v18);
  v13->_ownsData = 1;
  if ((v15 & 1) != 0) {
    v19 = (CGColorSpace *)objc_msgSend(objc_msgSend(a6, "baseContext"), "colorSpace");
  }
  else {
    v19 = -[MRContext monochromaticColorSpace]( -[MRImageManager baseContext](v13->_imageManager, "baseContext"),  "monochromaticColorSpace");
  }
  v13->_colorspace = v19;
  CGColorSpaceRetain(v19);
  if (v13->_textureOptions.wantsMonochromatic) {
    uint32_t v20 = 0;
  }
  else {
    uint32_t v20 = 8194;
  }
  v21 = CGBitmapContextCreate( v13->_datas[0],  v13->_dataWidth,  v13->_dataHeight,  8uLL,  v13->_dataRowBytes,  v13->_colorspace,  v20);
  v13->_isPremultiplied = 1;
  CGContextSetBlendMode(v21, kCGBlendModeCopy);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = (double)a4.var0;
  v24.size.height = (double)a4.var1;
  CGContextDrawImage(v21, v24, a3);
  CGContextRelease(v21);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  v13->_isOpaque = (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
  return v13;
}

- (MRTextureSource)initWithCVPixelBuffer:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  unsigned __int8 v9 = a5;
  v12 = -[MRTextureSource init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_imageManager = (MRImageManager *)a6;
    v12->_cvPixelBuffer = CVPixelBufferRetain(a3);
    v13->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v13->_orientation = v9;
    v13->_textureOptions.wantsMonochromatic = a7;
    v13->_isOpaque = 1;
  }

  return v13;
}

- (MRTextureSource)initWithCVTexture:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  unsigned __int8 v9 = a5;
  v12 = -[MRTextureSource init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_imageManager = (MRImageManager *)a6;
    v12->_cvTexture = CVBufferRetain(a3);
    v13->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v13->_orientation = v9;
    v13->_textureOptions.wantsMonochromatic = a7;
    v13->_isOpaque = 1;
  }

  return v13;
}

- (MRTextureSource)initWithCGContext:(CGContext *)a3 size:(id)a4 imageManager:(id)a5
{
  v8 = -[MRTextureSource init](self, "init");
  unsigned __int8 v9 = v8;
  if (v8)
  {
    v8->_imageManager = (MRImageManager *)a5;
    v8->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v8->_textureOptions.wantsMonochromatic = CGBitmapContextGetBitsPerPixel(a3) < 9;
    v9->_cgContext = CGContextRetain(a3);
    v9->_dataWidth = CGBitmapContextGetWidth(a3);
    v9->_dataHeight = CGBitmapContextGetHeight(a3);
    unsigned int BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v9->_dataRowBytes = BytesPerRow;
    v9->_dataSize = v9->_size.height * BytesPerRow;
    v9->_datas[0] = CGBitmapContextGetData(a3);
    CGImageAlphaInfo AlphaInfo = CGBitmapContextGetAlphaInfo(a3);
    v9->_isPremultiplied = AlphaInfo - 1 < 2;
    v9->_isOpaque = (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
  }

  return v9;
}

- (MRTextureSource)initWithCGContext:(CGContext *)a3 imageManager:(id)a4
{
  unsigned int Width = CGBitmapContextGetWidth(a3);
  unint64_t v8 = Width | ((unint64_t)CGBitmapContextGetHeight(a3) << 32);
  return -[MRTextureSource initWithCGContext:size:imageManager:]( self,  "initWithCGContext:size:imageManager:",  a3,  v8,  a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTextureSource;
  -[MRTextureSource dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  p_imageManager = &self->_imageManager;
  if (self->_imageManager)
  {
    objc_sync_enter(self);
    cgContext = self->_cgContext;
    if (cgContext)
    {
      CGContextRelease(cgContext);
      self->_cgContext = 0LL;
    }

    colorspace = self->_colorspace;
    if (colorspace)
    {
      CGColorSpaceRelease(colorspace);
      self->_colorspace = 0LL;
    }

    cgImage = self->_cgImage;
    if (cgImage)
    {
      CGImageRelease(cgImage);
      self->_cgImage = 0LL;
    }

    cvTexture = self->_cvTexture;
    if (cvTexture)
    {
      CVBufferRelease(cvTexture);
      self->_cvTexture = 0LL;
    }

    for (uint64_t i = 10LL; i != 13; ++i)
    {
      Class v9 = (&self->super.isa)[i];
      if (v9)
      {
        if (i != 10 || self->_ownsData) {
          free(v9);
        }
        (&self->super.isa)[i] = 0LL;
      }
    }

    self->_dataSize = 0LL;
    *(void *)&self->_dataRowBytes = 0LL;
    self->_dataHeight = 0;
    cvPixelBuffer = self->_cvPixelBuffer;
    if (cvPixelBuffer)
    {
      CVPixelBufferRelease(cvPixelBuffer);
      self->_cvPixelBuffer = 0LL;
    }

    texture = self->_texture;
    if (texture)
    {

      self->_texture = 0LL;
    }

    self->_pixelFormat = 0;
    *p_imageManager = 0LL;
    p_imageManager[1] = 0LL;
    objc_sync_exit(self);
  }

- (void)generateMipmap
{
  self->_textureOptions.wantsMipmap = 1;
  if (self->_datas[0])
  {
    uint64_t v3 = 0LL;
    dataunsigned int Width = self->_dataWidth;
    size_t dataHeight = self->_dataHeight;
    size_t dataRowBytes = self->_dataRowBytes;
    size_t dataSize = self->_dataSize;
    do
    {
      if (self->_textureOptions.wantsMonochromatic) {
        CGBitmapInfo v8 = 0;
      }
      else {
        CGBitmapInfo v8 = 8194;
      }
      CGImageRef v9 = CGImageRetain(self->_cgImage);
      if (v9)
      {
        v10 = v9;
        v11 = 0LL;
      }

      else
      {
        v11 = CGDataProviderCreateWithData(0LL, self->_datas[v3], dataSize, 0LL);
        if (v11)
        {
          if (self->_textureOptions.wantsMonochromatic) {
            size_t v13 = 8LL;
          }
          else {
            size_t v13 = 32LL;
          }
          v10 = CGImageCreate( dataWidth,  dataHeight,  8uLL,  v13,  dataRowBytes,  self->_colorspace,  v8,  v11,  0LL,  1,  kCGRenderingIntentDefault);
          char v12 = 0;
          goto LABEL_14;
        }

        v10 = 0LL;
      }

      char v12 = 1;
LABEL_14:
      dataWidth >>= 1;
      dataHeight >>= 1;
      if (self->_textureOptions.wantsMonochromatic) {
        size_t dataRowBytes = dataWidth;
      }
      else {
        size_t dataRowBytes = 4 * dataWidth;
      }
      size_t dataSize = dataRowBytes * dataHeight;
      v14 = malloc(dataRowBytes * dataHeight);
      self->_datas[v3 + 1] = v14;
      char v15 = CGBitmapContextCreate(v14, dataWidth, dataHeight, 8uLL, dataRowBytes, self->_colorspace, v8);
      CGContextSetBlendMode(v15, kCGBlendModeCopy);
      v17.origin.x = 0.0;
      v17.origin.y = 0.0;
      v17.size.width = (double)dataWidth;
      v17.size.height = (double)dataHeight;
      CGContextDrawImage(v15, v17, v10);
      CGContextRelease(v15);
      if ((v12 & 1) == 0) {
        CGDataProviderRelease(v11);
      }
      CGImageRelease(v10);
      ++v3;
    }

    while (v3 != 2);
  }

  cgImage = self->_cgImage;
  if (cgImage)
  {
    CGImageRelease(cgImage);
    self->_cgImage = 0LL;
  }

- ($34D90DBCE5BAE006D482B7C15EEFCEBA)textureOptions
{
  return ($34D90DBCE5BAE006D482B7C15EEFCEBA *)&self->_textureOptions;
}

- (MRTexture)texture
{
  if (!self->_size.width || !self->_size.height) {
    return 0LL;
  }
  texture = self->_texture;
  if (!texture)
  {
    objc_sync_enter(self);
    imageManager = self->_imageManager;
    if (imageManager)
    {
      texture = self->_texture;
      if (!texture)
      {
        self->_textureOptions.textureTarget = 3553;
        if (self->_cvTexture)
        {
          v5 = objc_alloc(&OBJC_CLASS___MRTexture);
          uint64_t Name = CVOpenGLESTextureGetName(self->_cvTexture);
          BOOL v7 = -[MRTexture initWithTextureName:textureTarget:size:inGLContext:options:]( v5,  "initWithTextureName:textureTarget:size:inGLContext:options:",  Name,  CVOpenGLESTextureGetTarget(self->_cvTexture),  *(void *)&self->_size,  -[MRImageManager imageGLContext](self->_imageManager, "imageGLContext"),  &self->_textureOptions);
LABEL_8:
          self->_texture = v7;
LABEL_9:
          -[MRTexture setOrientation:](self->_texture, "setOrientation:", self->_orientation);
          -[MRTexture setIsPremultiplied:](self->_texture, "setIsPremultiplied:", self->_isPremultiplied);
          -[MRTexture setIsOpaque:](self->_texture, "setIsOpaque:", self->_isOpaque);
          objc_sync_exit(self);
          return self->_texture;
        }

        if (self->_cvPixelBuffer)
        {
          self->_textureOptions.wantsYUV = CVPixelBufferGetPixelFormatType(self->_cvPixelBuffer) == 846624121;
          if (!CVPixelBufferLockBaseAddress(self->_cvPixelBuffer, 0LL))
          {
            BaseAddress = CVPixelBufferGetBaseAddress(self->_cvPixelBuffer);
            if (BaseAddress)
            {
              v10 = objc_alloc(&OBJC_CLASS___MRTexture);
              size_t Width = CVPixelBufferGetWidth(self->_cvPixelBuffer);
              size_t Height = CVPixelBufferGetHeight(self->_cvPixelBuffer);
              self->_texture = -[MRTexture initWithData:width:height:rowBytes:inGLContext:options:]( v10,  "initWithData:width:height:rowBytes:inGLContext:options:",  BaseAddress,  Width,  Height,  CVPixelBufferGetBytesPerRow(self->_cvPixelBuffer),  -[MRImageManager imageGLContext](self->_imageManager, "imageGLContext"),  &self->_textureOptions);
            }

            CVPixelBufferUnlockBaseAddress(self->_cvPixelBuffer, 0LL);
          }

          goto LABEL_9;
        }

        datas = self->_datas;
        if (!self->_datas[0])
        {
          if (!self->_textureOptions.wantsFloatTexture)
          {
            self->_texture = (MRTexture *) -[MRImageManager fboTextureWithSize:]( imageManager,  "fboTextureWithSize:",  *(void *)&self->_size);
            if (self->_color[3] >= 0.0)
            {
              v29 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
              v30 = v29;
              if (v29 != -[MRTexture glContext](self->_texture, "glContext")) {
                +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRTexture glContext](self->_texture, "glContext"));
              }
              glClearColor(self->_color[0], self->_color[1], self->_color[2], self->_color[3]);
              glClear(0x4000u);
              glFlush();
              if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v29) {
                +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v29);
              }
            }

            goto LABEL_9;
          }

          BOOL v7 = -[MRTexture initWithSize:inGLContext:options:]( objc_alloc(&OBJC_CLASS___MRTexture),  "initWithSize:inGLContext:options:",  *(void *)&self->_size,  -[MRImageManager imageGLContext](self->_imageManager, "imageGLContext"),  &self->_textureOptions);
          goto LABEL_8;
        }

        if (self->_datas[1])
        {
          v14 = objc_alloc(&OBJC_CLASS___MRTexture);
          char v15 = self->_datas[2];
          datasize_t Width = self->_dataWidth;
          uint64_t dataHeight = self->_dataHeight;
          uint64_t dataRowBytes = self->_dataRowBytes;
          v19 = -[MRImageManager imageGLContext](self->_imageManager, "imageGLContext");
          if (v15) {
            uint64_t v20 = 3LL;
          }
          else {
            uint64_t v20 = 2LL;
          }
          v21 = -[MRTexture initWithDatas:dataCount:width:height:rowBytes:inGLContext:options:]( v14,  "initWithDatas:dataCount:width:height:rowBytes:inGLContext:options:",  self->_datas,  v20,  dataWidth,  dataHeight,  dataRowBytes,  v19,  &self->_textureOptions);
        }

        else
        {
          if (self->_wantsSharedTexture)
          {
            self->_textureOptions.wantsFloatTexture = 0;
            self->_textureOptions.wantsMipmap = 0;
            v22 = (MRTexture *) -[MRImageManager textureWithSize:options:]( imageManager,  "textureWithSize:options:",  *(void *)&self->_size,  &self->_textureOptions);
            self->_texture = v22;
            LODWORD(v23) = self->_size.width;
            LODWORD(v24) = self->_size.height;
            -[MRTexture uploadData:rowBytes:toRect:]( v22,  "uploadData:rowBytes:toRect:",  self->_datas[0],  self->_dataRowBytes,  0.0,  0.0,  (double)v23,  (double)v24);
            goto LABEL_30;
          }

          v21 = -[MRTexture initWithData:width:height:rowBytes:inGLContext:options:]( objc_alloc(&OBJC_CLASS___MRTexture),  "initWithData:width:height:rowBytes:inGLContext:options:",  self->_datas[0],  self->_dataWidth,  self->_dataHeight,  self->_dataRowBytes,  -[MRImageManager imageGLContext](self->_imageManager, "imageGLContext"),  &self->_textureOptions);
        }

        self->_texture = v21;
LABEL_30:
        cgContext = self->_cgContext;
        if (cgContext)
        {
          CGContextRelease(cgContext);
          self->_cgContext = 0LL;
        }

        for (uint64_t i = 0LL; i != 3; ++i)
        {
          v27 = datas[i];
          if (v27)
          {
            if (i * 8 || self->_ownsData) {
              free(v27);
            }
            datas[i] = 0LL;
          }
        }

        self->_size_t dataSize = 0LL;
        *(void *)&self->_uint64_t dataRowBytes = 0LL;
        *(void *)((char *)&self->_dataWidth + 1) = 0LL;
        cgImage = self->_cgImage;
        if (cgImage)
        {
          CGImageRelease(cgImage);
          self->_cgImage = 0LL;
        }

        goto LABEL_9;
      }
    }

    else
    {
      texture = 0LL;
    }

    objc_sync_exit(self);
  }

  return texture;
}

- (void)addOverlayForROI:(id)a3
{
  v4 = self->_datas[0];
  if (v4)
  {
    if (self->_textureOptions.wantsMonochromatic) {
      uint32_t v6 = 0;
    }
    else {
      uint32_t v6 = 8194;
    }
    BOOL v7 = CGBitmapContextCreate( v4,  self->_dataWidth,  self->_dataHeight,  8uLL,  self->_dataRowBytes,  self->_colorspace,  v6);
    v12[0] = xmmword_1F8E10;
    v12[1] = unk_1F8E20;
    CGContextSetStrokeColorSpace(v7, self->_colorspace);
    CGContextSetStrokeColor(v7, (const CGFloat *)v12);
    CGContextSetBlendMode(v7, kCGBlendModeNormal);
    CGContextSetLineWidth(v7, 3.0);
    CGRect v13 = CGRectFromString((NSString *)a3);
    LODWORD(v8) = self->_dataWidth;
    LODWORD(v9) = self->_dataHeight;
    double v10 = (double)v8;
    v13.origin.x = v13.origin.x * v10;
    double v11 = (double)v9;
    v13.origin.y = v13.origin.y * v11;
    v13.size.width = v13.size.width * v10;
    v13.size.height = v13.size.height * v11;
    CGContextStrokeRect(v7, v13);
    CGContextRelease(v7);
  }

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- ($85CD2974BE96D4886BB301820D1C36C2)size
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_size;
}

- (BOOL)wantsSharedTexture
{
  return self->_wantsSharedTexture;
}

- (void)setWantsSharedTexture:(BOOL)a3
{
  self->_wantsSharedTexture = a3;
}

@end