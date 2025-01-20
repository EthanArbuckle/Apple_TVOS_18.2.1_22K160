@interface MRContext
- ($85CD2974BE96D4886BB301820D1C36C2)clippedSizeWithSize:(CGSize)a3;
- (BOOL)commitShaderChange;
- (BOOL)foreColorIsOpaqueWhite;
- (BOOL)isDoubleBuffered;
- (BOOL)isFlipped;
- (BOOL)shaderIsSet;
- (BOOL)supportsMirroredRepeatForImage:(id)a3;
- (CGColorSpace)colorSpace;
- (CGColorSpace)monochromaticColorSpace;
- (CGPoint)pixelOffset;
- (CGSize)pixelSize;
- (CGSize)size;
- (EAGLContext)glContext;
- (MRContext)baseContext;
- (MRContext)initWithEAGLContext:(id)a3 andAssetManager:(id)a4;
- (MRImageManager)imageManager;
- (MZMediaManagement)assetManager;
- (const)backColor;
- (const)foreColor;
- (const)modelViewMatrix;
- (const)projectionMatrix;
- (float)aspectRatio;
- (float)localAspectRatio;
- (id)beginLocalContextWithSize:(CGSize)a3 backgroundColor:(const float *)a4 state:(id *)a5;
- (id)imageSetOnTextureUnit:(unint64_t)a3;
- (id)initLocalWithContext:(id)a3 glContext:(id)a4 andSize:(CGSize)a5;
- (id)initLocalWithContext:(id)a3 texture:(id)a4 andSize:(CGSize)a5;
- (id)retainedByUserBlackImage;
- (id)retainedByUserImageByEndingLocalContext:(id)a3 andRestoreState:(id *)a4;
- (int)dimensionalMode;
- (int)maxTextureSize;
- (int)orientation;
- (unint64_t)virtualScreen;
- (unint64_t)vram;
- (unsigned)bindBuffer:(unsigned int)a3;
- (unsigned)createVBO;
- (unsigned)maxDimension;
- (void)_commitOuterToInner;
- (void)_computeProjectionMatrixWithOrientationCorrection;
- (void)_updateTextureOnUnit:(unint64_t)a3;
- (void)bindMesh;
- (void)blend:(int)a3;
- (void)cleanup;
- (void)clear:(int)a3;
- (void)composeForeColor:(const float *)a3 saveTo:(float *)a4;
- (void)composeForeColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7;
- (void)composeModelViewMatrix:(float)a3[16] saveTo:(float *)a4;
- (void)cull:(int)a3;
- (void)dealloc;
- (void)deleteVBO:(unsigned int)a3;
- (void)depthTest:(BOOL)a3;
- (void)drawIndexedTriangleStrip:(const unsigned __int16 *)a3 count:(unint64_t)a4;
- (void)drawLinesFromOffset:(unint64_t)a3 count:(unint64_t)a4;
- (void)drawTriangleFanFromOffset:(unint64_t)a3 count:(unint64_t)a4;
- (void)drawTriangleStripFromOffset:(unint64_t)a3 count:(unint64_t)a4;
- (void)drawTrianglesFromOffset:(unint64_t)a3 count:(unint64_t)a4;
- (void)flush;
- (void)purgeResources:(BOOL)a3;
- (void)restoreBackColor:(const float *)a3;
- (void)restoreForeColor:(const float *)a3;
- (void)restoreModelViewMatrix:(float)a3[16];
- (void)restoreScissorRect:(const int *)a3;
- (void)setAssetManager:(id)a3;
- (void)setBackColor:(const float *)a3 saveTo:(float *)a4;
- (void)setBackColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7;
- (void)setColorsPointer:(const float *)a3;
- (void)setDimensionalMode:(int)a3;
- (void)setForeColor:(const float *)a3 saveTo:(float *)a4;
- (void)setForeColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7;
- (void)setImage:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6;
- (void)setInSpriteCoordinatesPointer:(const float *)a3;
- (void)setIsFlipped:(BOOL)a3;
- (void)setLocalAspectRatio:(float)a3;
- (void)setModelViewMatrix:(float)a3[16] saveTo:(float *)a4;
- (void)setNormal:(float)a3 :(float)a4 :(float)a5;
- (void)setNormalsPointer:(const float *)a3;
- (void)setOrientation:(int)a3;
- (void)setPixelOffset:(CGPoint)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setScissorRect:(const int *)a3 saveTo:(int *)a4;
- (void)setShader:(id)a3;
- (void)setShaderUniformFloat:(float)a3 forKey:(id)a4;
- (void)setShaderUniformInt:(int)a3 forKey:(id)a4;
- (void)setShaderUniformMat3:(float)a3[16] forKey:(id)a4;
- (void)setShaderUniformMat4:(float)a3[16] forKey:(id)a4;
- (void)setShaderUniformVec2:(float)a3 :(float)a4 forKey:(id)a5;
- (void)setShaderUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6;
- (void)setShaderUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7;
- (void)setTextureCoordinatesPointer:(const float *)a3 onTextureUnit:(unint64_t)a4;
- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4;
- (void)setVertex2DPointer:(const float *)a3;
- (void)setVertex3DPointer:(const float *)a3;
- (void)setVertexAttributePointer:(const float *)a3 ofSize:(unint64_t)a4 forKey:(id)a5;
- (void)setVertexBuffer2D:(unsigned int)a3 withFeatures:(unint64_t)a4;
- (void)setVertexBuffer2D:(unsigned int)a3 withStride:(unint64_t)a4 inSpriteCoordinatesOffset:(unint64_t)a5 texture0CoordinatesOffset:(unint64_t)a6;
- (void)setVertexPointer:(float *)a3 flags:(unsigned __int16)a4;
- (void)snapshotWithTextureName:(int)a3 offset:(CGPoint)a4 size:(CGSize)a5;
- (void)translateModelViewMatrixByX:(float)a3 Y:(float)a4 Z:(float)a5 saveTo:(float *)a6;
- (void)unbindMesh;
- (void)unsetColorsPointer;
- (void)unsetImage:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5;
- (void)unsetInSpriteCoordinatesPointer;
- (void)unsetNormalsPointer;
- (void)unsetShader;
- (void)unsetTextureCoordinatesPointerOnTextureUnit:(unint64_t)a3;
- (void)unsetVertexAttributePointerForKey:(id)a3;
- (void)unsetVertexPointer;
- (void)updateGeometry;
- (void)uploadBuffer:(void *)a3 withSize:(int)a4 toVertexBuffer2D:(unsigned int)a5 usage:(unsigned int)a6;
@end

@implementation MRContext

- (MRContext)initWithEAGLContext:(id)a3 andAssetManager:(id)a4
{
  v6 = -[MRContext init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->mBaseContext = v6;
    v6->mGLContext = (EAGLContext *)a3;
    v7->mRenderBuffer = -1;
    v7->mAssetManager = (MZMediaManagement *)a4;
    v7->mImageManager = -[MRImageManager initWithBaseContext:]( objc_alloc(&OBJC_CLASS___MRImageManager),  "initWithBaseContext:",  v7);
    v7->mOuterState = objc_alloc_init(&OBJC_CLASS___MRContextState);
    v7->mInnerState = objc_alloc_init(&OBJC_CLASS___MRContextState);
    v8 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    v9 = v8;
    if (v8 != v7->mGLContext) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
    }
    glGetIntegerv(0xD33u, &v7->mMaxTextureSize);
    for (GLuint i = 0; i != 10; ++i)
      glDisableVertexAttribArray(i);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glDisable(0xB71u);
    glDisable(0xBE2u);
    glDisable(0xB44u);
    glCullFace(0x405u);
    for (int j = 0; j != -4; --j)
    {
      glActiveTexture(j + 33987);
      glBindTexture(0xDE1u, 0);
    }

    glUseProgram(0);
    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v8) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v8);
    }

    v12 = -[MRImageManager retainedByUserImageWithSize:andColor:]( v7->mImageManager,  "retainedByUserImageWithSize:andColor:",  v7->mOuterState->backColor,  1.0,  1.0);
    v7->mBlackImage = v12;
    -[MRImage setLabel:](v12, "setLabel:", @"Marimba Context BlackImage");
    -[MRImage setClampMode:](v7->mBlackImage, "setClampMode:", 2LL);
    v7->mOrientation = 0;
    v7->mFieldOfViewFactor = 1.0;
  }

  return v7;
}

- (id)initLocalWithContext:(id)a3 glContext:(id)a4 andSize:(CGSize)a5
{
  CGFloat height = a5.height;
  double width = a5.width;
  v9 = -[MRContext init](self, "init");
  if (v9)
  {
    v9->mBaseContext = (MRContext *)[a3 baseContext];
    v9->mGLContext = (EAGLContext *)a4;
    v9->mAssetManager = (MZMediaManagement *)*((id *)a3 + 26);
    v9->mImageManager = (MRImageManager *)*((id *)a3 + 27);
    v9->mVRAM = -[MRContext vram](v9->mBaseContext, "vram");
    v9->mMaxTextureSize = v9->mBaseContext->mMaxTextureSize;
    *(_WORD *)&v9->mIsLocalContext = 257;
    double v10 = width * *((float *)a3 + 17);
    [a3 pixelSize];
    *(float *)&double v11 = v10 / v11;
    v9->mFieldOfViewFactor = *(float *)&v11;
    v9->mPixelSize.double width = width;
    v9->mPixelSize.CGFloat height = height;
    v9->mOrientation = 4;
    v9->mOuterState = objc_alloc_init(&OBJC_CLASS___MRContextState);
    v9->mInnerState = objc_alloc_init(&OBJC_CLASS___MRContextState);
    -[MRContext updateGeometry](v9, "updateGeometry");
    v9->mBlackImage = (MRImage *)[a3 retainedByUserBlackImage];
    v9->mActiveTextureUnit = -1;
  }

  return v9;
}

- (id)initLocalWithContext:(id)a3 texture:(id)a4 andSize:(CGSize)a5
{
  CGFloat height = a5.height;
  double width = a5.width;
  v9 = -[MRContext init](self, "init");
  if (v9)
  {
    v9->mBaseContext = (MRContext *)[a3 baseContext];
    v9->mGLContext = (EAGLContext *)[a4 glContext];
    v9->mAssetManager = (MZMediaManagement *)*((id *)a3 + 26);
    v9->mImageManager = (MRImageManager *)*((id *)a3 + 27);
    v9->mVRAM = -[MRContext vram](v9->mBaseContext, "vram");
    v9->mMaxTextureSize = v9->mBaseContext->mMaxTextureSize;
    *(_WORD *)&v9->mIsLocalContext = 257;
    double v10 = width * *((float *)a3 + 17);
    [a3 pixelSize];
    *(float *)&double v11 = v10 / v11;
    v9->mFieldOfViewFactor = *(float *)&v11;
    v9->mPixelSize.double width = width;
    v9->mPixelSize.CGFloat height = height;
    v9->mOrientation = 4;
    v9->mOuterState = objc_alloc_init(&OBJC_CLASS___MRContextState);
    v9->mInnerState = (MRContextState *)[a4 innerState];
    -[MRContext updateGeometry](v9, "updateGeometry");
    v9->mBlackImage = (MRImage *)[a3 retainedByUserBlackImage];
    v9->mActiveTextureUnit = -1;
  }

  return v9;
}

- (void)dealloc
{
  self->mOuterState = 0LL;
  self->mInnerState = 0LL;
  -[MRContext cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRContext;
  -[MRContext dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mImageManager)
  {
    mCurrentShader = self->mCurrentShader;
    if (mCurrentShader)
    {

      self->mCurrentShader = 0LL;
    }

    if (!self->mIsLocalContext) {
      -[MRContext purgeResources:](self, "purgeResources:", 1LL);
    }
    -[MRImage releaseByUser](self->mBlackImage, "releaseByUser");
    self->mBlackImage = 0LL;

    self->mGLContext = 0LL;
    mVertexAttributes = self->mVertexAttributes;
    if (mVertexAttributes)
    {

      self->mVertexAttributes = 0LL;
    }

    self->mBaseContext = 0LL;

    self->mAssetManager = 0LL;
    self->mImageManager = 0LL;
  }

- (void)updateGeometry
{
  objc_super v3 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  v4 = v3;
  if (v3 != self->mGLContext) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
  }
  if (!self->mIsLocalContext) {
    -[MRContext purgeResources:](self, "purgeResources:", 1LL);
  }
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  p_mPixelOffset = &self->mPixelOffset;
  if ((self->mOrientation - 3) > 1)
  {
    p_y = (CGPoint *)&self->mPixelOffset.y;
    GLsizei v8 = (int)height;
    GLsizei v9 = (int)width;
    glViewport((int)self->mPixelOffset.y, (int)self->mPixelOffset.x, (int)height, (int)width);
    glScissor((int)self->mPixelOffset.y, (int)self->mPixelOffset.x, v8, v9);
  }

  else
  {
    GLsizei v8 = (int)width;
    GLsizei v9 = (int)height;
    glViewport((int)self->mPixelOffset.x, (int)self->mPixelOffset.y, (int)width, (int)height);
    glScissor((int)self->mPixelOffset.x, (int)self->mPixelOffset.y, v8, v9);
    p_y = &self->mPixelOffset;
    p_mPixelOffset = (CGPoint *)&self->mPixelOffset.y;
  }

  int x = (int)p_mPixelOffset->x;
  self->mScissorRect[0] = (int)p_y->x;
  self->mScissorRect[1] = x;
  self->mScissorRect[2] = v8;
  self->mScissorRect[3] = v9;
  float v12 = self->mFieldOfViewFactor * 0.577350289;
  float v13 = self->mPixelSize.width;
  float v14 = self->mPixelSize.height;
  float v15 = v13 / v14;
  if (self->mIsFlipped) {
    float v16 = v12 * 0.1;
  }
  else {
    float v16 = -(float)(v12 * 0.1);
  }
  if (self->mIsFlipped) {
    float v17 = -(float)(v12 * 0.1);
  }
  else {
    float v17 = v12 * 0.1;
  }
  MRMatrix_Frustum((uint64_t)self->mProjectionMatrix, -(float)(v12 * 0.1), v12 * 0.1, v16 / v15, v17 / v15, 0.1, 100.0);
  *(float32x2_t *)&self->mProjectionMatrix[14] = vcvt_f32_f64( vaddq_f64( (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / v12), 0),  vcvtq_f64_f32(*(float32x2_t *)&self->mProjectionMatrix[14])));
  if (self->mIsFlipped) {
    GLenum v18 = 2304;
  }
  else {
    GLenum v18 = 2305;
  }
  glFrontFace(v18);
  -[MRContext _computeProjectionMatrixWithOrientationCorrection]( self,  "_computeProjectionMatrixWithOrientationCorrection");
  MRMatrix_Clear((uint64_t)self->mOuterState->modelViewMatrix);
  mInnerState = self->mInnerState;
  *(_OWORD *)&mInnerState->modelViewMatrix[12] = 0u;
  *(_OWORD *)&mInnerState->modelViewMatrix[8] = 0u;
  *(_OWORD *)&mInnerState->modelViewMatrix[4] = 0u;
  *(_OWORD *)mInnerState->modelViewMatriint x = 0u;
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v3) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v3);
  }

  float v20 = self->mPixelSize.width / self->mPixelSize.height;
  self->mLocalAspectRatio = v20;
}

- (void)_computeProjectionMatrixWithOrientationCorrection
{
  uint64_t v6 = 0LL;
  __int128 v7 = xmmword_1F6860;
  uint64_t v8 = 0x4066800000000000LL;
  uint64_t v9 = 0LL;
  double v3 = *((double *)&v6 + self->mOrientation);
  if (v3 == 0.0)
  {
    *(_OWORD *)self->mProjectionMatrixWithOrientationCorrection = *(_OWORD *)self->mProjectionMatrix;
    *(_OWORD *)&self->mProjectionMatrixWithOrientationCorrection[4] = *(_OWORD *)&self->mProjectionMatrix[4];
    *(_OWORD *)&self->mProjectionMatrixWithOrientationCorrection[8] = *(_OWORD *)&self->mProjectionMatrix[8];
    *(_OWORD *)&self->mProjectionMatrixWithOrientationCorrection[12] = *(_OWORD *)&self->mProjectionMatrix[12];
  }

  else
  {
    float v4 = v3;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v5, 0.0, 0.0, v4);
    MRMatrix_MultiplyWithMatrix(self->mProjectionMatrix, v5, self->mProjectionMatrixWithOrientationCorrection);
  }

- (void)setDimensionalMode:(int)a3
{
  if (self->_dimensionalMode != a3)
  {
    v5 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    uint64_t v6 = v5;
    if (v5 != self->mGLContext) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
    }
    switch(a3)
    {
      case 0:
        -[MRContext setPixelSize:](self, "setPixelSize:", self->mPixelSize.width, self->mPixelSize.height);
        glViewport(0, 0, (int)self->mPixelSize.width, (int)self->mPixelSize.height);
        double width = self->mPixelSize.width;
        double height = self->mPixelSize.height;
        goto LABEL_10;
      case 1:
        -[MRContext setPixelSize:](self, "setPixelSize:", self->mPixelSize.width, self->mPixelSize.height);
        glViewport(0, 0, (int)(self->mPixelSize.width * 0.5), (int)self->mPixelSize.height);
        glScissor(0, 0, (int)(self->mPixelSize.width * 0.5), (int)self->mPixelSize.height);
        MRMatrix_Clear((uint64_t)v14);
        MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v14, 3.0, 0.0, 0.0);
        float v9 = v15;
        float v10 = -0.08;
        goto LABEL_8;
      case 2:
        -[MRContext setPixelSize:](self, "setPixelSize:", self->mPixelSize.width, self->mPixelSize.height);
        glViewport( (int)(self->mPixelSize.width * 0.5),  0,  (int)(self->mPixelSize.width * 0.5),  (int)self->mPixelSize.height);
        glScissor( (int)(self->mPixelSize.width * 0.5),  0,  (int)(self->mPixelSize.width * 0.5),  (int)self->mPixelSize.height);
        MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v14, -3.0, 0.0, 0.0);
        float v9 = v15;
        float v10 = 0.08;
LABEL_8:
        float v15 = v9 + v10;
        -[MRContext _computeProjectionMatrixWithOrientationCorrection]( self,  "_computeProjectionMatrixWithOrientationCorrection",  MRMatrix_PreMultiply(v14, (uint64_t)self->mProjectionMatrix));
        break;
      case 3:
        -[MRContext setPixelSize:](self, "setPixelSize:", self->mPixelSize.width, self->mPixelSize.height);
        glViewport(0, 0, (int)(self->mPixelSize.width * 0.5), (int)self->mPixelSize.height);
        double height = self->mPixelSize.height;
        double width = self->mPixelSize.width * 0.5;
LABEL_10:
        GLsizei v11 = (int)width;
        GLsizei v12 = (int)height;
        GLint v13 = 0;
        goto LABEL_12;
      case 4:
        -[MRContext setPixelSize:](self, "setPixelSize:", self->mPixelSize.width, self->mPixelSize.height);
        glViewport( (int)(self->mPixelSize.width * 0.5),  0,  (int)(self->mPixelSize.width * 0.5),  (int)self->mPixelSize.height);
        GLint v13 = (int)(self->mPixelSize.width * 0.5);
        GLsizei v12 = (int)self->mPixelSize.height;
        GLsizei v11 = v13;
LABEL_12:
        glScissor(v13, 0, v11, v12);
        break;
      default:
        break;
    }

    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v5) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v5);
    }
  }

- (CGSize)size
{
  double width = self->mPixelSize.width;
  if (width <= 0.0)
  {
    double v4 = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  else
  {
    double height = (self->mPixelSize.height + self->mPixelSize.height) / width;
    double v4 = 2.0;
  }

  result.double height = height;
  result.double width = v4;
  return result;
}

- (float)aspectRatio
{
  float width = self->mPixelSize.width;
  float height = self->mPixelSize.height;
  return width / height;
}

- (CGColorSpace)colorSpace
{
  CGSize result = (CGColorSpace *)qword_2B06A0;
  if (!qword_2B06A0)
  {
    CGSize result = CGColorSpaceCreateDeviceRGB();
    qword_2B06A0 = (uint64_t)result;
  }

  return result;
}

- (CGColorSpace)monochromaticColorSpace
{
  CGSize result = (CGColorSpace *)qword_2B06A8;
  if (!qword_2B06A8)
  {
    CGSize result = CGColorSpaceCreateDeviceGray();
    qword_2B06A8 = (uint64_t)result;
  }

  return result;
}

- (BOOL)isDoubleBuffered
{
  return 1;
}

- (unint64_t)virtualScreen
{
  return 0LL;
}

- (unsigned)maxDimension
{
  double width = self->mPixelSize.width;
  if (width < self->mPixelSize.height) {
    double width = self->mPixelSize.height;
  }
  if (width < 1536.0) {
    return 1024;
  }
  else {
    return 2048;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)clippedSizeWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v6 = a3.width;
  uint64_t v7 = a3.height;
  unsigned int v8 = -[MRContext maxDimension](self, "maxDimension");
  if (v6) {
    BOOL v9 = (_DWORD)v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unsigned int mMaxTextureSize = self->mMaxTextureSize;
    if (width / height >= 2.0)
    {
      if (mMaxTextureSize < v6) {
        unsigned int v6 = self->mMaxTextureSize;
      }
    }

    else
    {
      if (v8 < v6) {
        unsigned int v6 = v8;
      }
      if (width / height <= 0.5)
      {
        else {
          uint64_t v7 = mMaxTextureSize;
        }
        return ($85CD2974BE96D4886BB301820D1C36C2)(v6 | (unint64_t)(v7 << 32));
      }
    }

    else {
      uint64_t v7 = v8;
    }
  }

  return ($85CD2974BE96D4886BB301820D1C36C2)(v6 | (unint64_t)(v7 << 32));
}

- (void)flush
{
  uint64_t v7 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  double v3 = v7;
  if (v7 != self->mGLContext) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
  }
  int mRenderBuffer = self->mRenderBuffer;
  if (mRenderBuffer < 0)
  {
    glGetIntegerv(0x8CA7u, &self->mRenderBuffer);
    int mRenderBuffer = self->mRenderBuffer;
  }

  if (mRenderBuffer <= 0) {
    glFlush();
  }
  else {
    -[EAGLContext presentRenderbuffer:](self->mGLContext, "presentRenderbuffer:", 36161LL);
  }
  v5 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  unsigned int v6 = v7;
  if (v5 != v7)
  {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v7);
    unsigned int v6 = v7;
  }
}

- (void)purgeResources:(BOOL)a3
{
}

- (id)beginLocalContextWithSize:(CGSize)a3 backgroundColor:(const float *)a4 state:(id *)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = -[MRImageManager retainedByUserImageWithSize:andColor:]( self->mImageManager,  "retainedByUserImageWithSize:andColor:",  0LL);
  a5->var0 = v10;
  [v10 setLabel:@"Marimba Local Context"];
  id v11 = -[MRContext initLocalWithContext:texture:andSize:]( [MRContext alloc],  "initLocalWithContext:texture:andSize:",  self,  [a5->var0 texture],  width,  height);
  GLsizei v12 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  GLint v13 = v12;
  if (v12 != [v11 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v11 glContext]);
  }
  if (a4)
  {
    [v11 setBackColor:a4 saveTo:0];
    [v11 clear:1];
  }

  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v12) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v12);
  }

  return v11;
}

- (id)retainedByUserImageByEndingLocalContext:(id)a3 andRestoreState:(id *)a4
{
  unsigned int v6 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  uint64_t v7 = v6;
  if (v6 != [a3 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [a3 glContext]);
  }
  glFlush();
  [a3 cleanup];
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v6) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v6);
  }

  objc_msgSend(objc_msgSend(a4->var0, "texture"), "setTimestamp:", MRGetCurrentTime());
  return a4->var0;
}

- (id)retainedByUserBlackImage
{
  return -[MRImage retainByUser](self->mBlackImage, "retainByUser");
}

- (void)setIsFlipped:(BOOL)a3
{
  if (self->mIsFlipped != a3)
  {
    self->mIsFlipped = a3;
    self->mProjectionMatrix[5] = -self->mProjectionMatrix[5];
    -[MRContext _computeProjectionMatrixWithOrientationCorrection]( self,  "_computeProjectionMatrixWithOrientationCorrection");
  }

- (void)blend:(int)a3
{
  mOuterState = self->mOuterState;
  if (a3)
  {
    mOuterState->blendingIsEnabled = 1;
    if (a3 != 1) {
      self->mOuterState->blendingType = a3;
    }
  }

  else
  {
    mOuterState->blendingIsEnabled = 0;
  }

- (void)cull:(int)a3
{
  mOuterState = self->mOuterState;
  if (a3)
  {
    mOuterState->cullingIsEnabled = 1;
    self->mOuterState->cullFrontfacing = a3 == 2;
  }

  else
  {
    mOuterState->cullingIsEnabled = 0;
  }

- (void)depthTest:(BOOL)a3
{
  self->mOuterState->depthTestIsEnabled = a3;
}

- (void)clear:(int)a3
{
  char v3 = a3;
  mOuterState = self->mOuterState;
  mInnerState = self->mInnerState;
  float v7 = mOuterState->backColor[0];
  float v8 = mOuterState->backColor[1];
  if (v7 != mInnerState->backColor[0]
    || v8 != mInnerState->backColor[1]
    || mOuterState->backColor[2] != mInnerState->backColor[2]
    || mOuterState->backColor[3] != mInnerState->backColor[3])
  {
    glClearColor(v7, v8, mOuterState->backColor[2], mOuterState->backColor[3]);
    *(_OWORD *)self->mInnerState->backColor = *(_OWORD *)self->mOuterState->backColor;
  }

  if ((v3 & 2) != 0)
  {
    if (!self->mInnerState->depthTestIsEnabled) {
      glDepthMask(1u);
    }
    glClear(((v3 & 2) << 7) & 0xBFFF | ((v3 & 1) << 14));
    if (!self->mInnerState->depthTestIsEnabled) {
      glDepthMask(0);
    }
  }

  else
  {
    glClear((v3 & 1) << 14);
  }

- (void)setScissorRect:(const int *)a3 saveTo:(int *)a4
{
  if (a4)
  {
    double x = self->mPixelOffset.x;
    double y = self->mPixelOffset.y;
    *a4 = (int)((double)self->mScissorRect[0] - x);
    a4[1] = (int)((double)self->mScissorRect[1] - y);
    a4[2] = self->mScissorRect[2];
    a4[3] = self->mScissorRect[3];
  }

  else
  {
    double x = self->mPixelOffset.x;
  }

  double v7 = x + (double)*a3;
  if (v7 == (double)self->mScissorRect[0])
  {
    double v8 = self->mPixelOffset.y;
    if (v8 + (double)a3[1] == (double)self->mScissorRect[1]
      && self->mScissorRect[2] == a3[2]
      && self->mScissorRect[3] == a3[3])
    {
      return;
    }
  }

  else
  {
    double v8 = self->mPixelOffset.y;
  }

  self->mScissorRect[0] = (int)v7;
  int v9 = (int)(v8 + (double)a3[1]);
  self->mScissorRect[1] = v9;
  int v10 = a3[2];
  self->mScissorRect[2] = v10;
  int v11 = a3[3];
  self->mScissorRect[3] = v11;
  BOOL v12 = (int)v7 <= 0 && v9 <= 0;
  if (v12 && self->mPixelSize.width <= (double)(v10 + (int)v7) && self->mPixelSize.height <= (double)(v11 + v9))
  {
    glDisable(0xC11u);
  }

  else
  {
    glEnable(0xC11u);
    if (self->mOrientation == 3)
    {
      GLsizei v13 = self->mScissorRect[2];
      GLint v14 = (int)(self->mPixelSize.width - (double)self->mScissorRect[0] - (double)v13);
      GLsizei v15 = self->mScissorRect[3];
      GLint v16 = (int)(self->mPixelSize.height - (double)self->mScissorRect[1] - (double)v15);
    }

    else
    {
      GLint v14 = self->mScissorRect[0];
      GLint v16 = self->mScissorRect[1];
      GLsizei v13 = self->mScissorRect[2];
      GLsizei v15 = self->mScissorRect[3];
    }

    glScissor(v14, v16, v13, v15);
  }

- (void)restoreScissorRect:(const int *)a3
{
}

- (const)foreColor
{
  return self->mOuterState->foreColor;
}

- (BOOL)foreColorIsOpaqueWhite
{
  mOuterState = self->mOuterState;
  return mOuterState->foreColor[0] >= 1.0
      && mOuterState->foreColor[1] >= 1.0
      && mOuterState->foreColor[2] >= 1.0
      && mOuterState->foreColor[3] >= 1.0;
}

- (void)setForeColor:(const float *)a3 saveTo:(float *)a4
{
  if (a4) {
    *(_OWORD *)a4 = *(_OWORD *)self->mOuterState->foreColor;
  }
  *(_OWORD *)self->mOuterState->foreColor = *(_OWORD *)a3;
}

- (void)setForeColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7
{
  if (a7) {
    *(_OWORD *)a7 = *(_OWORD *)self->mOuterState->foreColor;
  }
  self->mOuterState->foreColor[0] = a3;
  self->mOuterState->foreColor[1] = a4;
  self->mOuterState->foreColor[2] = a5;
  self->mOuterState->foreColor[3] = a6;
}

- (void)composeForeColor:(const float *)a3 saveTo:(float *)a4
{
  if (a4) {
    *(_OWORD *)a4 = *(_OWORD *)self->mOuterState->foreColor;
  }
  self->mOuterState->foreColor[0] = *a3 * self->mOuterState->foreColor[0];
  self->mOuterState->foreColor[1] = a3[1] * self->mOuterState->foreColor[1];
  self->mOuterState->foreColor[2] = a3[2] * self->mOuterState->foreColor[2];
  self->mOuterState->foreColor[3] = a3[3] * self->mOuterState->foreColor[3];
}

- (void)composeForeColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7
{
  if (a7) {
    *(_OWORD *)a7 = *(_OWORD *)self->mOuterState->foreColor;
  }
  self->mOuterState->foreColor[0] = self->mOuterState->foreColor[0] * a3;
  self->mOuterState->foreColor[1] = self->mOuterState->foreColor[1] * a4;
  self->mOuterState->foreColor[2] = self->mOuterState->foreColor[2] * a5;
  self->mOuterState->foreColor[3] = self->mOuterState->foreColor[3] * a6;
}

- (void)restoreForeColor:(const float *)a3
{
}

- (const)backColor
{
  return self->mOuterState->backColor;
}

- (void)setBackColor:(const float *)a3 saveTo:(float *)a4
{
  if (a4) {
    *(_OWORD *)a4 = *(_OWORD *)self->mOuterState->backColor;
  }
  *(_OWORD *)self->mOuterState->backColor = *(_OWORD *)a3;
}

- (void)setBackColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6 saveTo:(float *)a7
{
  if (a7) {
    *(_OWORD *)a7 = *(_OWORD *)self->mOuterState->backColor;
  }
  self->mOuterState->backColor[0] = a3;
  self->mOuterState->backColor[1] = a4;
  self->mOuterState->backColor[2] = a5;
  self->mOuterState->backColor[3] = a6;
}

- (void)restoreBackColor:(const float *)a3
{
}

- (void)setImage:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6
{
  id v10 = [a3 texture];
  unsigned int v11 = [v10 textureName];
  unsigned int v12 = [v10 textureTarget];
  if (v10 && v11 && v12)
  {
    self->mOuterState->textureTargetOnUnit[a4] = v12;
    self->mOuterState->textureNameOnUnit[a4] = v11;
    [v10 timestamp];
    self->mOuterState->textureTimestampOnUnit[a4] = v13;
    *(float *)&double v13 = a5;
    [a3 getMatrix:v15 forReferenceAspectRatio:v13];
    -[MRContext setTextureMatrix:onTextureUnit:](self, "setTextureMatrix:onTextureUnit:", v15, a4);
    GLint v14 = (NSString *)[a3 filterID];
    if (v14 != -[MRImage filterID](self->mTextureUnitImages[a4], "filterID")) {
      self->mForceShaderUpdate = 1;
    }
    self->mTextureUnitImages[a4] = (MRImage *)[a3 retainByUser];
  }

- (void)unsetImage:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5
{
  double v7 = (id *)&(&self->super.isa)[a4];
  objc_msgSend(v7[36], "releaseByUser", a3);
  v7[36] = 0LL;
  self->mOuterState->textureNameOnUnit[a4] = 0;
}

- (id)imageSetOnTextureUnit:(unint64_t)a3
{
  if (a3 > 3) {
    return 0LL;
  }
  char v3 = self->mTextureUnitImages[a3];
  if (v3) {
    double v4 = v3;
  }
  return v3;
}

- (void)_updateTextureOnUnit:(unint64_t)a3
{
  char v3 = &(&self->super.isa)[a3];
  Class v4 = v3[36];
  if (!v4) {
    return;
  }
  id v7 = -[objc_class texture](v3[36], "texture");
  if (!v7) {
    return;
  }
  double v8 = v7;
  unint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  if (-[objc_class clampMode](v4, "clampMode") == 1)
  {
    float v9 = 0.0;
    float v10 = 0.0;
    float v11 = 0.0;
    float v12 = 0.0;
    if (-[objc_class usesBackgroundColorAsBorderColor](v4, "usesBackgroundColorAsBorderColor"))
    {
      unsigned int v13 = [v8 isPremultiplied];
      mOuterState = self->mOuterState;
      float v12 = mOuterState->backColor[0];
      if (v13)
      {
        float v9 = mOuterState->backColor[3];
        float v12 = v12 * v9;
        float v11 = v9 * mOuterState->backColor[1];
        unint64_t v38 = __PAIR64__(LODWORD(v11), LODWORD(v12));
        float v10 = v9 * mOuterState->backColor[2];
        *(float *)&uint64_t v39 = v10;
      }

      else
      {
        float v11 = mOuterState->backColor[1];
        *(float *)&unint64_t v38 = mOuterState->backColor[0];
        *((float *)&v38 + 1) = v11;
        float v10 = mOuterState->backColor[2];
        *(float *)&uint64_t v39 = v10;
        float v9 = mOuterState->backColor[3];
      }

      *((float *)&v39 + 1) = v9;
    }

    GLint v16 = [v8 borderColor];
    *(float *)&double v17 = v12;
    *(float *)&double v18 = v11;
    *(float *)&double v19 = v10;
    *(float *)&double v20 = v9;
    -[MRShader setUniformVec4::::forKey:]( self->mCurrentShader,  "setUniformVec4::::forKey:",  @"uTexture0BorderColor",  v17,  v18,  v19,  v20);
    LODWORD(v21) = *v16;
    if (*(float *)v16 != v12
      || (LODWORD(v21) = v16[1], *(float *)&v21 != v11)
      || (LODWORD(v21) = v16[2], *(float *)&v21 != v10)
      || (LODWORD(v21) = v16[3], *(float *)&v21 != v9))
    {
      objc_msgSend(v8, "setBorderColor:", &v38, v21);
    }
  }

  else
  {
    if (-[objc_class clampMode](v4, "clampMode") == 3)
    {
      if ([v8 textureTarget] == 3553
        && ([v8 isPowerOfTwo] & 1) == 0)
      {
        NSLog(@"Using REPEAT clamp mode with NPOT texture is not supported");
      }

      uint64_t v15 = 10497LL;
      goto LABEL_25;
    }

    if (-[objc_class clampMode](v4, "clampMode") == 4)
    {
      if ([v8 textureTarget] == 3553
        && ([v8 isPowerOfTwo] & 1) == 0)
      {
        NSLog(@"Using MIRRORED_REPEAT clamp mode with NPOT texture is not supported");
      }

      uint64_t v15 = 33648LL;
      goto LABEL_25;
    }
  }

  uint64_t v15 = 33071LL;
LABEL_25:
  unsigned int v22 = -[objc_class filtersNearest](v4, "filtersNearest");
  unsigned int v23 = -[objc_class usesMipmap](v4, "usesMipmap");
  unsigned int v24 = -[objc_class mipmapFiltersNearest](v4, "mipmapFiltersNearest");
  if (v23)
  {
    unsigned int v25 = v24;
    BOOL v26 = v22 == 0;
    if (v25) {
      unsigned int v27 = 9984;
    }
    else {
      unsigned int v27 = 9986;
    }
  }

  else
  {
    BOOL v26 = v22 == 0;
    unsigned int v27 = 9728;
  }

  if (v26) {
    uint64_t v28 = v27 + 1;
  }
  else {
    uint64_t v28 = v27;
  }
  if (v22) {
    uint64_t v29 = 9728LL;
  }
  else {
    uint64_t v29 = 9729LL;
  }
  unsigned int v30 = [v8 wrapS];
  unsigned int v31 = [v8 wrapT];
  unsigned int v32 = [v8 minFilter];
  unsigned int v33 = [v8 magFilter];
  unsigned int v34 = v33;
  if ((_DWORD)v15 != v30 || (_DWORD)v15 != v31 || (_DWORD)v28 != v32 || (_DWORD)v29 != v33)
  {
    unsigned int v35 = [v8 textureTarget];
    unint64_t v36 = a3;
    GLenum v37 = v35;
    if (self->mActiveTextureUnit != v36)
    {
      self->mActiveTextureUnit = v36;
      glActiveTexture(v36 + 33984);
    }

    if ((_DWORD)v15 != v30)
    {
      glTexParameteri(v37, 0x2802u, v15);
      [v8 setWrapS:v15];
    }

    if ((_DWORD)v15 != v31)
    {
      glTexParameteri(v37, 0x2803u, v15);
      [v8 setWrapT:v15];
    }

    if ((_DWORD)v28 != v32)
    {
      glTexParameteri(v37, 0x2801u, v28);
      [v8 setMinFilter:v28];
    }

    if ((_DWORD)v29 != v34)
    {
      glTexParameteri(v37, 0x2800u, v29);
      [v8 setMagFilter:v29];
    }
  }

- (void)snapshotWithTextureName:(int)a3 offset:(CGPoint)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  if (self->mActiveTextureUnit)
  {
    self->mActiveTextureUnit = 0;
    glActiveTexture(0x84C0u);
  }

  self->mInnerState->textureNameOnUnit[0] = a3;
  glBindTexture(0xDE1u, a3);
  glCopyTexSubImage2D(0xDE1u, 0, 0, 0, (int)x, (int)y, (int)width, (int)height);
}

- (BOOL)commitShaderChange
{
  if (-[MRContextState shaderID](self->mOuterState, "shaderID")) {
    goto LABEL_2;
  }
  Class v4 = -[MRImage filterID](self->mTextureUnitImages[0], "filterID");
  v5 = -[MRImage shader](self->mTextureUnitImages[0], "shader");
  unsigned int v6 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"id");
  if (v4) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    double v8 = @"FittingFilter";
  }
  else {
    double v8 = v6;
  }
  if (!v8)
  {
    NSLog(@"Shader required");
LABEL_2:
    -[MRContext _commitOuterToInner](self, "_commitOuterToInner");
    return 0;
  }

  -[MRContext setShader:](self, "setShader:");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  NSUInteger v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (!v9) {
    goto LABEL_33;
  }
  NSUInteger v10 = v9;
  uint64_t v11 = *(void *)v25;
  do
  {
    uint64_t v12 = 0LL;
    do
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v5);
      }
      unsigned int v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
      if (!NSStringIsEqual(v13, "id") && !NSStringHasPrefix(v13, "."))
      {
        if ([v13 characterAtIndex:0] == 95)
        {
          -[MRContext setShaderUniformInt:forKey:]( self,  "setShaderUniformInt:forKey:",  objc_msgSend(-[NSDictionary objectForKey:](v5, "objectForKey:", v13), "intValue"),  v13);
          goto LABEL_26;
        }

        if (NSStringHasSuffix(v13, "enter") || NSStringHasSuffix(v13, "oint"))
        {
          objc_msgSend(-[NSDictionary objectForKey:](v5, "objectForKey:", v13), "CGPointValue");
LABEL_25:
          *(float *)&double v14 = v14;
          *(float *)&double v15 = v15;
          -[MRContext setShaderUniformVec2::forKey:](self, "setShaderUniformVec2::forKey:", v13, v14, v15);
          goto LABEL_26;
        }

        if (NSStringHasSuffix(v13, "ize") || NSStringHasSuffix(v13, "invRadii"))
        {
          objc_msgSend(-[NSDictionary objectForKey:](v5, "objectForKey:", v13), "CGSizeValue");
          goto LABEL_25;
        }

        HasSuffidouble x = NSStringHasSuffix(v13, "olor");
        double v17 = -[NSDictionary objectForKey:](v5, "objectForKey:", v13);
        if (HasSuffix)
        {
          Components = CGColorGetComponents(v17);
          double v19 = Components[3];
          CGFloat v20 = *Components * v19;
          *(float *)&CGFloat v20 = v20;
          double v21 = v19 * Components[1];
          *(float *)&double v21 = v21;
          double v22 = v19 * Components[2];
          *(float *)&double v22 = v22;
          *(float *)&double v19 = v19;
          -[MRContext setShaderUniformVec4::::forKey:](self, "setShaderUniformVec4::::forKey:", v13, v20, v21, v22, v19);
        }

        else
        {
          -[CGColor floatValue](v17, "floatValue");
          -[MRContext setShaderUniformFloat:forKey:](self, "setShaderUniformFloat:forKey:", v13);
        }
      }

- (void)_commitOuterToInner
{
  char v3 = -[MRContextState shaderArguments](self->mInnerState, "shaderArguments");
  Class v4 = -[MRShaderArguments filter0](v3, "filter0");
  if (v4 == -[MRImage filterID](self->mTextureUnitImages[0], "filterID")
    && (v5 = -[MRShaderArguments filter1](v3, "filter1"),
        v5 == -[MRImage filterID](self->mTextureUnitImages[1], "filterID"))
    && (unsigned int v6 = -[MRShaderArguments filter2](v3, "filter2"),
        v6 == -[MRImage filterID](self->mTextureUnitImages[2], "filterID")))
  {
    BOOL v7 = (id *)&self->mTextureUnitImages[1];
    v127 = -[MRShaderArguments filter3](v3, "filter3");
    v128 = -[MRImage filterID](self->mTextureUnitImages[3], "filterID");
    v129 = self->mTextureUnitImages[0];
    if (v129) {
      BOOL v130 = 0;
    }
    else {
      BOOL v130 = v127 == v128;
    }
    unsigned int v131 = !v130;
    if (v129 && v127 == v128)
    {
      BOOL v132 = -[MRImage clampMode](v129, "clampMode") == 1;
      unsigned int v131 = v132 ^ -[MRShaderArguments texture0ClampsToBorder](v3, "texture0ClampsToBorder");
    }

    id v133 = *v7;
    if (*v7) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v131;
    }
    if (v133 && (v131 & 1) == 0)
    {
      BOOL v134 = [v133 clampMode] == 1;
      unsigned int v8 = v134 ^ -[MRShaderArguments texture1ClampsToBorder](v3, "texture1ClampsToBorder");
    }
  }

  else
  {
    BOOL v7 = (id *)&self->mTextureUnitImages[1];
    unsigned int v8 = 1;
  }

  id v9 = +[MRShaderManager sharedManager](&OBJC_CLASS___MRShaderManager, "sharedManager");
  NSUInteger v10 = -[MRContextState shaderID](self->mOuterState, "shaderID");
  uint64_t v11 = -[MRContextState shaderID](self->mInnerState, "shaderID");
  if (!self->mForceShaderUpdate)
  {
    double v14 = v11;
    mCurrentShader = self->mCurrentShader;
    if (mCurrentShader)
    {
      if (v10 == v14)
      {
        if (!v8)
        {
LABEL_28:
          if (-[MRShader useContext](mCurrentShader, "useContext") != self)
          {
            -[MRShader setUseContext:](self->mCurrentShader, "setUseContext:", self);
            goto LABEL_30;
          }

          goto LABEL_31;
        }
      }

      else if (((!-[NSString isEqualToString:](v10, "isEqualToString:") | v8) & 1) == 0)
      {
        mCurrentShader = self->mCurrentShader;
        goto LABEL_28;
      }
    }
  }

  self->mForceShaderUpdate = 0;
  -[MRContextState setShaderID:](self->mInnerState, "setShaderID:", v10);
  if (!v3)
  {
    char v3 = objc_alloc_init(&OBJC_CLASS___MRShaderArguments);
    -[MRContextState setShaderArguments:](self->mInnerState, "setShaderArguments:", v3);
  }

  -[MRShaderArguments setFilter0:](v3, "setFilter0:", -[MRImage filterID](self->mTextureUnitImages[0], "filterID"));
  -[MRShaderArguments setFilter1:](v3, "setFilter1:", -[MRImage filterID](self->mTextureUnitImages[1], "filterID"));
  -[MRShaderArguments setFilter2:](v3, "setFilter2:", -[MRImage filterID](self->mTextureUnitImages[2], "filterID"));
  -[MRShaderArguments setFilter3:](v3, "setFilter3:", -[MRImage filterID](self->mTextureUnitImages[3], "filterID"));
  uint64_t v12 = self->mTextureUnitImages[0];
  if (v12) {
    BOOL v13 = -[MRImage clampMode](v12, "clampMode") == 1;
  }
  else {
    BOOL v13 = 0LL;
  }
  -[MRShaderArguments setTexture0ClampsToBorder:](v3, "setTexture0ClampsToBorder:", v13);
  if (*v7) {
    BOOL v16 = [*v7 clampMode] == 1;
  }
  else {
    BOOL v16 = 0LL;
  }
  -[MRShaderArguments setTexture1ClampsToBorder:](v3, "setTexture1ClampsToBorder:", v16);
  double v17 = self->mCurrentShader;
  if (v17) {

  }
  double v18 = (MRShader *)[v9 shaderForShaderID:v10 inContext:self withArguments:v3];
  self->mCurrentShader = v18;
  if (!v18)
  {
LABEL_31:
    int v22 = 0;
    goto LABEL_32;
  }

  GLuint v19 = -[MRShader program](v18, "program");
  glUseProgram(v19);
  if (-[MRShader textureUnitsAreBound](self->mCurrentShader, "textureUnitsAreBound"))
  {
LABEL_30:
    int v22 = 1;
    goto LABEL_32;
  }

  for (uint64_t i = 0LL; i != 4; ++i)
  {
    GLint UniformLocation = glGetUniformLocation(v19, off_258B60[i]);
    if ((UniformLocation & 0x80000000) == 0) {
      glUniform1i(UniformLocation, i);
    }
  }

  int v22 = 1;
  -[MRShader setTextureUnitsAreBound:](self->mCurrentShader, "setTextureUnitsAreBound:", 1LL);
LABEL_32:
  mOuterState = self->mOuterState;
  mInnerState = self->mInnerState;
  BOOL depthTestIsEnabled = mOuterState->depthTestIsEnabled;
  if (depthTestIsEnabled != mInnerState->depthTestIsEnabled)
  {
    mInnerState->BOOL depthTestIsEnabled = depthTestIsEnabled;
    if (self->mOuterState->depthTestIsEnabled) {
      glEnable(0xB71u);
    }
    else {
      glDisable(0xB71u);
    }
    glDepthMask(self->mOuterState->depthTestIsEnabled);
    mOuterState = self->mOuterState;
    mInnerState = self->mInnerState;
  }

  if (mOuterState->blendingIsEnabled == mInnerState->blendingIsEnabled)
  {
    int v26 = 0;
    if (!mOuterState->blendingIsEnabled) {
      goto LABEL_71;
    }
  }

  else
  {
    if (mOuterState->blendingIsEnabled) {
      glEnable(0xBE2u);
    }
    else {
      glDisable(0xBE2u);
    }
    self->mInnerState->blendingIsEnabled = self->mOuterState->blendingIsEnabled;
    mOuterState = self->mOuterState;
    mInnerState = self->mInnerState;
    int blendingType = mOuterState->blendingType;
    int v26 = blendingType == 2 || blendingType == 4;
    if (!mOuterState->blendingIsEnabled) {
      goto LABEL_71;
    }
  }

  int v29 = mOuterState->blendingType;
  int v30 = mInnerState->blendingType;
  if (v29 != v30)
  {
    BOOL v32 = v29 == 2 || v29 == 4;
    BOOL v34 = v30 == 2 || v30 == 4;
    v26 |= v32 ^ v34;
    switch(v29)
    {
      case 2:
        GLenum v35 = 1;
        goto LABEL_66;
      case 3:
        GLenum v35 = 770;
LABEL_66:
        glBlendFunc(v35, 0x303u);
        break;
      case 4:
        GLenum v36 = 1;
        goto LABEL_69;
      case 5:
        GLenum v36 = 770;
LABEL_69:
        glBlendFuncSeparate(v36, 0x303u, 0, 1u);
        break;
      default:
        break;
    }

    self->mInnerState->int blendingType = self->mOuterState->blendingType;
    mOuterState = self->mOuterState;
    mInnerState = self->mInnerState;
  }

- (BOOL)shaderIsSet
{
  return -[MRContextState shaderID](self->mOuterState, "shaderID") != 0LL;
}

- (void)setShader:(id)a3
{
  if (-[MRContextState shaderID](self->mOuterState, "shaderID"))
  {
    if (NSStringIsEqual(-[MRContextState shaderID](self->mOuterState, "shaderID"), "ColoredTexture")
      || -[MRContextState shaderID](self->mOuterState, "shaderID") == (NSString *)@"FittingFilter")
    {
      -[MRContext unsetShader](self, "unsetShader");
    }

    else
    {
      NSLog( @"Trying to set shader %@ on context but shader %@ is already set",  a3,  -[MRContextState shaderID](self->mOuterState, "shaderID"));
    }
  }

  -[MRContextState setShaderID:](self->mOuterState, "setShaderID:", a3);
}

- (void)unsetShader
{
}

- (void)setShaderUniformInt:(int)a3 forKey:(id)a4
{
  unsigned int v6 = -[MRUniform initWithI:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithI:", a3);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v6,  a4);
}

- (void)setShaderUniformFloat:(float)a3 forKey:(id)a4
{
  unsigned int v6 = -[MRUniform initWithFloat:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithFloat:", a3);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v6,  a4);
}

- (void)setShaderUniformVec2:(float)a3 :(float)a4 forKey:(id)a5
{
  BOOL v7 = -[MRUniform initWithVec2::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec2::", a3, a4);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v7,  a5);
}

- (void)setShaderUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6
{
  unsigned int v8 = -[MRUniform initWithVec3:::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec3:::", a3, a4, a5);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v8,  a6);
}

- (void)setShaderUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7
{
  id v9 = -[MRUniform initWithVec4::::](objc_alloc(&OBJC_CLASS___MRUniform), "initWithVec4::::", a3, a4, a5, a6);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v9,  a7);
}

- (void)setShaderUniformMat3:(float)a3[16] forKey:(id)a4
{
  unsigned int v6 = -[MRUniform initWithMat4ForMat3:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithMat4ForMat3:", a3);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v6,  a4);
}

- (void)setShaderUniformMat4:(float)a3[16] forKey:(id)a4
{
  unsigned int v6 = -[MRUniform initWithMat4:](objc_alloc(&OBJC_CLASS___MRUniform), "initWithMat4:", a3);
  -[NSMutableDictionary setObject:forKey:]( -[MRContextState temporaryUniforms](self->mOuterState, "temporaryUniforms"),  "setObject:forKey:",  v6,  a4);
}

- (const)projectionMatrix
{
  return self->mProjectionMatrix;
}

- (const)modelViewMatrix
{
  return self->mOuterState->modelViewMatrix;
}

- (void)setModelViewMatrix:(float)a3[16] saveTo:(float *)a4
{
  if (a4)
  {
    mOuterState = self->mOuterState;
    __int128 v5 = *(_OWORD *)mOuterState->modelViewMatrix;
    __int128 v6 = *(_OWORD *)&mOuterState->modelViewMatrix[4];
    __int128 v7 = *(_OWORD *)&mOuterState->modelViewMatrix[12];
    *((_OWORD *)a4 + 2) = *(_OWORD *)&mOuterState->modelViewMatrix[8];
    *((_OWORD *)a4 + 3) = v7;
    *(_OWORD *)a4 = v5;
    *((_OWORD *)a4 + 1) = v6;
  }

  modelViewMatridouble x = self->mOuterState->modelViewMatrix;
  if (modelViewMatrix != a3)
  {
    __int128 v9 = *(_OWORD *)a3;
    __int128 v10 = *((_OWORD *)a3 + 1);
    __int128 v11 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&self->mOuterState->modelViewMatrix[8] = *((_OWORD *)a3 + 2);
    *((_OWORD *)modelViewMatrix + 3) = v11;
    *(_OWORD *)modelViewMatridouble x = v9;
    *((_OWORD *)modelViewMatrix + 1) = v10;
  }

- (void)composeModelViewMatrix:(float)a3[16] saveTo:(float *)a4
{
  *(float *)&double v6 = MRMatrix_MultiplyWithMatrix(a3, self->mOuterState->modelViewMatrix, v7);
  -[MRContext setModelViewMatrix:saveTo:](self, "setModelViewMatrix:saveTo:", v7, a4, v6);
}

- (void)translateModelViewMatrixByX:(float)a3 Y:(float)a4 Z:(float)a5 saveTo:(float *)a6
{
  if (a6)
  {
    mOuterState = self->mOuterState;
    __int128 v7 = *(_OWORD *)mOuterState->modelViewMatrix;
    __int128 v8 = *(_OWORD *)&mOuterState->modelViewMatrix[4];
    __int128 v9 = *(_OWORD *)&mOuterState->modelViewMatrix[12];
    *((_OWORD *)a6 + 2) = *(_OWORD *)&mOuterState->modelViewMatrix[8];
    *((_OWORD *)a6 + 3) = v9;
    *(_OWORD *)a6 = v7;
    *((_OWORD *)a6 + 1) = v8;
  }

  self->mOuterState->modelViewMatrix[12] = self->mOuterState->modelViewMatrix[12] + a3;
  self->mOuterState->modelViewMatrix[13] = self->mOuterState->modelViewMatrix[13] + a4;
  self->mOuterState->modelViewMatrix[14] = self->mOuterState->modelViewMatrix[14] + a5;
}

- (void)restoreModelViewMatrix:(float)a3[16]
{
}

- (void)setNormal:(float)a3 :(float)a4 :(float)a5
{
  self->mOuterState->normal[0] = a3;
  self->mOuterState->normal[1] = a4;
  self->mOuterState->normal[2] = a5;
}

- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4
{
  Class v4 = self->mOuterState->textureMatrix[a4];
  if (v4 != a3)
  {
    __int128 v5 = *(_OWORD *)a3;
    __int128 v6 = *((_OWORD *)a3 + 1);
    __int128 v7 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&self->mOuterState->textureMatrix[a4][8] = *((_OWORD *)a3 + 2);
    *((_OWORD *)v4 + 3) = v7;
    *(_OWORD *)Class v4 = v5;
    *((_OWORD *)v4 + 1) = v6;
  }

- (void)setVertexBuffer2D:(unsigned int)a3 withStride:(unint64_t)a4 inSpriteCoordinatesOffset:(unint64_t)a5 texture0CoordinatesOffset:(unint64_t)a6
{
  self->mOuterState->unsigned int vbo = a3;
  self->mOuterState->int vertexFlags = 0;
  self->mOuterState->GLsizei vertexStride = 4 * a4;
  self->mOuterState->vertexPointer = 0LL;
  self->mOuterState->BOOL vertexArrayIsEnabled = 1;
  self->mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = a5 != 0x7FFFFFFFFFFFFFFFLL;
  mOuterState = self->mOuterState;
  if (mOuterState->inSpriteCoordinatesArrayIsEnabled)
  {
    mOuterState->inSpriteCoordinatesPointer = (const float *)(4 * a5);
    self->mOuterState->vertexFlags |= 0x40u;
    mOuterState = self->mOuterState;
  }

  mOuterState->textureCoordinatesArrayIsEnabled[0] = a6 != 0x7FFFFFFFFFFFFFFFLL;
  __int128 v7 = self->mOuterState;
  if (v7->textureCoordinatesArrayIsEnabled[0])
  {
    v7->textureCoordinatesPointer[0] = (float *)(4 * a6);
    self->mOuterState->vertexFlags |= 4u;
    __int128 v7 = self->mOuterState;
  }

  v7->textureCoordinatesArrayIsEnabled[1] = 0;
  self->mOuterState->textureCoordinatesArrayIsEnabled[2] = 0;
  self->mOuterState->textureCoordinatesArrayIsEnabled[3] = 0;
}

- (void)setVertexBuffer2D:(unsigned int)a3 withFeatures:(unint64_t)a4
{
  self->mOuterState->unsigned int vbo = a3;
  self->mOuterState->int vertexFlags = 0;
  self->mOuterState->GLsizei vertexStride = 32;
  self->mOuterState->vertexPointer = 0LL;
  self->mOuterState->BOOL vertexArrayIsEnabled = 1;
  self->mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = a4 & 1;
  mOuterState = self->mOuterState;
  if (mOuterState->inSpriteCoordinatesArrayIsEnabled)
  {
    mOuterState->inSpriteCoordinatesPointer = (const float *)&dword_8;
    self->mOuterState->vertexFlags |= 0x40u;
  }

  for (uint64_t i = 0LL; i != 4; ++i)
  {
    self->mOuterState->textureCoordinatesArrayIsEnabled[i] = ((1 << (i + 1)) & a4) != 0LL;
    self->mOuterState->textureCoordinatesPointer[i] = 0LL;
  }

- (void)setVertexPointer:(float *)a3 flags:(unsigned __int16)a4
{
  self->mOuterState->vertexPointer = a3;
  self->mOuterState->unsigned int vbo = 0;
  self->mOuterState->int vertexFlags = a4;
  self->mOuterState->BOOL vertexArrayIsEnabled = 1;
  uint64_t v4 = 2LL;
  if ((a4 & 1) != 0) {
    uint64_t v4 = 3LL;
  }
  if ((a4 & 2) != 0)
  {
    self->mOuterState->normalsPointer = &a3[v4];
    self->mOuterState->BOOL normalArrayIsEnabled = 1;
    v4 += 3LL;
  }

  for (uint64_t i = 0LL; i != 4; ++i)
  {
    if (((a4 >> i) & 4) != 0)
    {
      self->mOuterState->textureCoordinatesPointer[i] = &a3[v4];
      self->mOuterState->textureCoordinatesArrayIsEnabled[i] = 1;
      v4 += 2LL;
    }
  }

  if ((a4 & 0x40) != 0)
  {
    self->mOuterState->inSpriteCoordinatesPointer = &a3[v4];
    self->mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = 1;
    v4 += 2LL;
  }

  if ((a4 & 0x80) != 0)
  {
    self->mOuterState->colorsPointer = &a3[v4];
    self->mOuterState->BOOL foreColorArrayIsEnabled = 1;
    LODWORD(v4) = v4 + 4;
  }

  self->mOuterState->GLsizei vertexStride = 4 * v4;
}

- (void)setVertex2DPointer:(const float *)a3
{
  self->mOuterState->vertexPointer = a3;
  self->mOuterState->unsigned int vbo = 0;
  self->mOuterState->int vertexFlags = 0;
  self->mOuterState->GLsizei vertexStride = 0;
  self->mOuterState->BOOL vertexArrayIsEnabled = 1;
}

- (void)setVertex3DPointer:(const float *)a3
{
  self->mOuterState->vertexPointer = a3;
  self->mOuterState->unsigned int vbo = 0;
  self->mOuterState->int vertexFlags = 1;
  self->mOuterState->GLsizei vertexStride = 0;
  self->mOuterState->BOOL vertexArrayIsEnabled = 1;
}

- (void)setNormalsPointer:(const float *)a3
{
  self->mOuterState->normalsPointer = a3;
  self->mOuterState->BOOL normalArrayIsEnabled = 1;
}

- (void)setColorsPointer:(const float *)a3
{
  self->mOuterState->colorsPointer = a3;
  self->mOuterState->BOOL foreColorArrayIsEnabled = 1;
}

- (void)setTextureCoordinatesPointer:(const float *)a3 onTextureUnit:(unint64_t)a4
{
  self->mOuterState->textureCoordinatesPointer[a4] = (float *)a3;
  self->mOuterState->textureCoordinatesArrayIsEnabled[a4] = 1;
}

- (void)setInSpriteCoordinatesPointer:(const float *)a3
{
  self->mOuterState->inSpriteCoordinatesPointer = a3;
  self->mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = 1;
}

- (void)setVertexAttributePointer:(const float *)a3 ofSize:(unint64_t)a4 forKey:(id)a5
{
  mVertexAttributes = self->mVertexAttributes;
  if (!mVertexAttributes)
  {
    self->mVertexAttributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_5:
    __int128 v10 = objc_alloc_init(&OBJC_CLASS___MRContextVertexAttributes);
    -[NSMutableDictionary setObject:forKey:](self->mVertexAttributes, "setObject:forKey:", v10, a5);

    goto LABEL_6;
  }

  __int128 v10 = (MRContextVertexAttributes *)-[NSMutableDictionary objectForKey:](mVertexAttributes, "objectForKey:", a5);
  if (!v10) {
    goto LABEL_5;
  }
LABEL_6:
  v10->pointer = a3;
  v10->size = a4;
}

- (void)unsetVertexPointer
{
  self->mOuterState->BOOL vertexArrayIsEnabled = 0;
  mOuterState = self->mOuterState;
  unsigned __int16 vertexFlags = mOuterState->vertexFlags;
  if ((vertexFlags & 2) != 0)
  {
    mOuterState->BOOL normalArrayIsEnabled = 0;
    mOuterState = self->mOuterState;
    unsigned __int16 vertexFlags = mOuterState->vertexFlags;
  }

  if ((vertexFlags & 0x40) != 0) {
    mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = 0;
  }
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    __int128 v5 = self->mOuterState;
    if (((v5->vertexFlags >> i) & 4) != 0) {
      v5->textureCoordinatesArrayIsEnabled[i] = 0;
    }
  }

  __int128 v6 = self->mOuterState;
  if ((v6->vertexFlags & 0x80) != 0) {
    v6->BOOL foreColorArrayIsEnabled = 0;
  }
}

- (void)unsetNormalsPointer
{
  self->mOuterState->BOOL normalArrayIsEnabled = 0;
}

- (void)unsetColorsPointer
{
  self->mOuterState->BOOL foreColorArrayIsEnabled = 0;
}

- (void)unsetTextureCoordinatesPointerOnTextureUnit:(unint64_t)a3
{
  self->mOuterState->textureCoordinatesArrayIsEnabled[a3] = 0;
}

- (void)unsetInSpriteCoordinatesPointer
{
  self->mOuterState->BOOL inSpriteCoordinatesArrayIsEnabled = 0;
}

- (void)unsetVertexAttributePointerForKey:(id)a3
{
}

- (unsigned)createVBO
{
  GLuint buffers = 0;
  glGenBuffers(1, &buffers);
  glLabelObjectEXT(0x9151u, buffers, 0, "Marimba Context VBO");
  return buffers;
}

- (void)deleteVBO:(unsigned int)a3
{
  GLuint buffers = a3;
  glDeleteBuffers(1, &buffers);
  if (self->mInnerState->vbo == buffers)
  {
    glBindBuffer(0x8892u, 0);
    self->mInnerState->unsigned int vbo = 0;
  }

- (void)uploadBuffer:(void *)a3 withSize:(int)a4 toVertexBuffer2D:(unsigned int)a5 usage:(unsigned int)a6
{
  if (self->mInnerState->vbo != a5) {
    glBindBuffer(0x8892u, a5);
  }
  glBufferData(0x8892u, a4, a3, a6);
  GLuint vbo = self->mInnerState->vbo;
  if (vbo != a5) {
    glBindBuffer(0x8892u, vbo);
  }
  self->mCurrentVBOWasUpdated = 1;
}

- (unsigned)bindBuffer:(unsigned int)a3
{
  unsigned int vbo = self->mInnerState->vbo;
  if (vbo != a3)
  {
    glBindBuffer(0x8892u, a3);
    self->mInnerState->unsigned int vbo = a3;
  }

  return vbo;
}

- (void)bindMesh
{
  self->_meshIsBound = 1;
}

- (void)unbindMesh
{
  self->_meshIsBound = 0;
}

- (void)drawTriangleStripFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  GLsizei v4 = a4;
  GLint v5 = a3;
  unsigned int v7 = -[MRContext commitShaderChange](self, "commitShaderChange");
  glDrawArrays(5u, v5, v4);
  if (v7) {
    -[MRContext unsetShader](self, "unsetShader");
  }
}

- (void)drawIndexedTriangleStrip:(const unsigned __int16 *)a3 count:(unint64_t)a4
{
  GLsizei v4 = a4;
  unsigned int v7 = -[MRContext commitShaderChange](self, "commitShaderChange");
  glDrawElements(5u, v4, 0x1403u, a3);
  if (v7) {
    -[MRContext unsetShader](self, "unsetShader");
  }
}

- (void)drawTriangleFanFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  GLsizei v4 = a4;
  GLint v5 = a3;
  unsigned int v7 = -[MRContext commitShaderChange](self, "commitShaderChange");
  glDrawArrays(6u, v5, v4);
  if (v7) {
    -[MRContext unsetShader](self, "unsetShader");
  }
}

- (void)drawTrianglesFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  GLsizei v4 = a4;
  GLint v5 = a3;
  unsigned int v7 = -[MRContext commitShaderChange](self, "commitShaderChange");
  glDrawArrays(4u, v5, v4);
  if (v7) {
    -[MRContext unsetShader](self, "unsetShader");
  }
}

- (void)drawLinesFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  GLsizei v4 = a4;
  GLint v5 = a3;
  unsigned int v7 = -[MRContext commitShaderChange](self, "commitShaderChange");
  glDrawArrays(2u, v5, v4);
  if (v7) {
    -[MRContext unsetShader](self, "unsetShader");
  }
}

- (BOOL)supportsMirroredRepeatForImage:(id)a3
{
  return objc_msgSend(objc_msgSend(a3, "texture"), "textureTarget") == 3553;
}

- (MRContext)baseContext
{
  return self->mBaseContext;
}

- (MZMediaManagement)assetManager
{
  return (MZMediaManagement *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setAssetManager:(id)a3
{
}

- (MRImageManager)imageManager
{
  return self->mImageManager;
}

- (CGPoint)pixelOffset
{
  double x = self->mPixelOffset.x;
  double y = self->mPixelOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPixelOffset:(CGPoint)a3
{
  self->mPixelOffset = a3;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  self->mPixelSize = a3;
}

- (float)localAspectRatio
{
  return self->mLocalAspectRatio;
}

- (void)setLocalAspectRatio:(float)a3
{
  self->mLocalAspectRatio = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (BOOL)isFlipped
{
  return self->mIsFlipped;
}

- (EAGLContext)glContext
{
  return self->mGLContext;
}

- (unint64_t)vram
{
  return self->mVRAM;
}

- (int)maxTextureSize
{
  return self->mMaxTextureSize;
}

- (int)dimensionalMode
{
  return self->_dimensionalMode;
}

@end