@interface MRCroppingSprite
+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
+ (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8;
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:;
- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (BOOL)hitIsActive;
- (BOOL)needsInSpriteCoordinates;
- (BOOL)preservesImageAspectRatio;
- (BOOL)usesOwnMatrixForHitTest;
- (CGPoint)position;
- (CGPoint)spriteCoordinatesOffset;
- (CGRect)innerRect;
- (CGRect)outerRect;
- (CGSize)halfSize;
- (CGSize)spriteCoordinatesFactor;
- (MRCroppingSprite)init;
- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6;
- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7;
- (double)rotation;
- (unsigned)meshType;
- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6;
- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4;
- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8;
- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8;
- (void)renderImageInner:(id)a3 inContext:(id)a4;
- (void)renderImageInner:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImageOuter:(id)a3 inContext:(id)a4;
- (void)renderImageOuter:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)reset;
- (void)setHitIsActive:(BOOL)a3;
- (void)setInnerRect:(CGRect)a3;
- (void)setMeshType:(unsigned __int8)a3;
- (void)setNeedsInSpriteCoordinates:(BOOL)a3;
- (void)setOuterRect:(CGRect)a3;
- (void)setPreservesImageAspectRatio:(BOOL)a3;
- (void)setSpriteCoordinatesFactor:(CGSize)a3;
- (void)setSpriteCoordinatesOffset:(CGPoint)a3;
- (void)setUsesOwnMatrixForHitTest:(BOOL)a3;
@end

@implementation MRCroppingSprite

- (MRCroppingSprite)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRCroppingSprite;
  result = -[MRCroppingSprite init](&v8, "init");
  if (result)
  {
    result->mInnerRect.origin.x = 0.0;
    result->mInnerRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    result->mInnerRect.size = _Q0;
    result->mOuterRect.origin.x = 0.0;
    result->mOuterRect.origin.y = 0.0;
    result->mOuterRect.size = _Q0;
    *(_WORD *)&result->mPreservesImageAspectRatio = 257;
    result->mSpriteCoordinatesFactor = _Q0;
  }

  return result;
}

- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  v12 = -[MRCroppingSprite init](self, "init");
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a5;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v12,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a6,  x,  y,  width,  height,  v13);
  }

  return v14;
}

- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v13 = -[MRCroppingSprite init](self, "init");
  v15 = v13;
  if (v13)
  {
    *(float *)&double v14 = a5;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v13,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a7,  x,  y,  width,  height,  v14);
    -[MRCroppingSprite setInnerRect:](v15, "setInnerRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }

  return v15;
}

- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8
{
  id v27 = [a1 init];
  v29 = v27;
  if (v27)
  {
    *(float *)&double v28 = a6;
    objc_msgSend(v27, "fakeRenderInContext:atPosition:andSize:zRotation:", a8, a2, a3, a4, a5, v28);
    objc_msgSend(v29, "setInnerRect:", a12, a13, a14, a15);
    objc_msgSend(v29, "setOuterRect:", a16, a17, a18, a19);
  }

  return v29;
}

- (void)reset
{
  self->mPosition = CGPointZero;
  self->mHalfSize = CGSizeZero;
  self->mRotation = 0.0;
}

- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6
{
  double height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a4.y;
  float x = a4.x;
  [a3 localAspectRatio];
  *(float *)&CGFloat y = y / v13;
  *(float *)&CGFloat width = width * 0.5;
  [a3 localAspectRatio];
  float v15 = height * 0.5 / v14;
  self->mPosition.CGFloat y = *(float *)&y;
  self->mHalfSize.CGFloat width = *(float *)&width;
  self->mHalfSize.double height = v15;
  self->mRotation = a6;
  self->mPosition.float x = x;
  if (self->_usesOwnMatrixForHitTest) {
    MRMatrix_MultiplyWithMatrix( (float *)[a3 modelViewMatrix],  (float *)objc_msgSend(a3, "projectionMatrix"),  self->mModelViewProjectionMatrix);
  }
}

- (void)setInnerRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  self->mInnerRect.origin.double x = x;
  self->mInnerRect.origin.double y = y;
  self->mInnerRect.size.CGFloat width = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  self->mInnerRect.size.double height = fmin(a3.origin.y + a3.size.height, 1.0) - y;
}

- (void)setOuterRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  self->mOuterRect.origin.double x = x;
  self->mOuterRect.origin.double y = y;
  self->mOuterRect.size.CGFloat width = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  self->mOuterRect.size.double height = fmin(a3.origin.y + a3.size.height, 1.0) - y;
}

- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  double v11 = width * (x * 2.0 + -1.0);
  double v12 = width * ((x + self->mOuterRect.size.width) * 2.0 + -1.0);
  double v13 = height * (y * 2.0 + -1.0);
  double v14 = height * ((y + self->mOuterRect.size.height) * 2.0 + -1.0);
  double v15 = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v17 = __sincosf_stret(mRotation);
  a3->double x = v15 + ((v11 + v12) * v17.__cosval - (v13 + v14) * v17.__sinval) * 0.5;
  double v18 = self->mPosition.y;
  float v19 = self->mRotation;
  __float2 v20 = __sincosf_stret(v19);
  a3->double y = v18 + ((v11 + v12) * v20.__sinval + (v13 + v14) * v20.__cosval) * 0.5;
  a4->double width = (v12 - v11) * 0.5;
  a4->double height = (v14 - v13) * 0.5;
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
  LODWORD(v6) = 0;
  -[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( self,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  a3,  a4,  a5.x,  a5.y,  a6.width,  a6.height,  v6);
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( self,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4);
  *(float *)&double v14 = a7;
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  a3,  a4,  x,  y,  width,  height,  v14);
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
  LODWORD(v6) = 0;
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( self,  "renderImage:inContext:atPosition:andSize:zRotation:",  a3,  a4,  a5.x,  a5.y,  a6.width,  a6.height,  v6);
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( self,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4);
  *(float *)&double v14 = a7;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  a3,  a4,  x,  y,  width,  height,  v14);
}

- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8
{
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( self,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a5);
  *(float *)&double v16 = a8;
  +[MRCroppingSprite renderImage:withMask:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:withMask:inContext:atPosition:andSize:zRotation:",  a3,  a4,  a5,  x,  y,  width,  height,  v16);
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.y;
  double v14 = a5.x;
  LODWORD(v17) = 0;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( self,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  a5.x,  a5.y,  a6.width,  a6.height,  v17);
  *(float *)&double v18 = a7;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  a3,  a4,  v14,  v13,  width,  height,  v18,  x,  y);
}

- (void)renderImageInner:(id)a3 inContext:(id)a4
{
  double y = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  double x = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v10 = __sincosf_stret(mRotation);
  double v20 = -1.0;
  CGFloat v11 = self->mInnerRect.origin.x;
  double v12 = self->mInnerRect.origin.y;
  double v13 = v11 * 2.0 + -1.0;
  double v14 = (v11 + self->mInnerRect.size.width) * 2.0 + -1.0;
  double v15 = v12 * 2.0 + -1.0;
  double v16 = (v12 + self->mInnerRect.size.height) * 2.0 + -1.0;
  double v17 = width;
  double v18 = height;
  *(float *)&double v20 = v13;
  float v19 = v15;
  v62[0] = LODWORD(v20);
  *(float *)&v62[1] = v19;
  *(float *)&CGFloat v11 = v16;
  v62[2] = LODWORD(v20);
  v62[3] = LODWORD(v11);
  *(float *)&double v20 = v14;
  v62[4] = LODWORD(v20);
  *(float *)&v62[5] = v19;
  v62[6] = LODWORD(v20);
  v62[7] = LODWORD(v11);
  if (a3)
  {
    if (self->mPreservesImageAspectRatio)
    {
      *(float *)&double v20 = width / height;
    }

    else
    {
      [a3 aspectRatio];
      *(float *)&double v20 = v20;
    }

    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v58 state:v20];
    [a4 setTextureCoordinatesPointer:v62 onTextureUnit:0];
  }

  int v21 = 0;
  *(float *)&unsigned int v22 = x;
  *(float *)&unsigned int v23 = y;
  unint64_t v53 = __PAIR64__(v23, v22);
  double v24 = v13 * v17;
  double v25 = v14 * v17;
  double v26 = v15 * v18;
  double v27 = v16 * v18;
  __asm { FMOV            V1.2D, #1.0 }

  uint64_t v33 = 1LL;
  __asm { FMOV            V0.2D, #0.5 }

  float64x2_t v55 = _Q0;
  float64x2_t v57 = _Q1;
  do
  {
    id v35 = objc_msgSend(a4, "imageSetOnTextureUnit:", v33, v53);
    if (v35)
    {
      if ([v35 preservesAspectRatio])
      {
        v36 = v62;
      }

      else
      {
        for (uint64_t i = 0LL; i != 8; i += 4LL)
        {
          v36 = v61;
          *(float32x4_t *)&v61[i * 4] = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64( vmulq_f64( vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v62[i]), v57),  v55)),  vmulq_f64(vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v62[i]), v57), v55));
        }
      }

      v21 |= 1 << v33;
      [a4 setTextureCoordinatesPointer:v36 onTextureUnit:v33];
    }

    ++v33;
  }

  while (v33 != 4);
  if (self->mNeedsInSpriteCoordinates)
  {
    for (uint64_t j = 0LL; j != 8; ++j)
    {
      if ((j & 1) != 0) {
        uint64_t v39 = 16LL;
      }
      else {
        uint64_t v39 = 15LL;
      }
      Class v40 = (&self->super.isa)[v39];
      if ((j & 1) != 0) {
        uint64_t v41 = 18LL;
      }
      else {
        uint64_t v41 = 17LL;
      }
      float v42 = *(double *)&(&self->super.isa)[v41] + (*(float *)&v62[j] + 1.0) * 0.5 * *(double *)&v40;
      v60[j] = v42;
    }

    objc_msgSend(a4, "setInSpriteCoordinatesPointer:", v60, 1.0, 0.5);
  }

  double v43 = *(float *)&v53 + v24 * v10.__cosval;
  float v44 = v43 - v26 * v10.__sinval;
  double v45 = *((float *)&v53 + 1) + v24 * v10.__sinval;
  float v46 = v45 + v26 * v10.__cosval;
  *(float *)v59 = v44;
  *(float *)&v59[1] = v46;
  *(float *)&double v43 = v43 - v27 * v10.__sinval;
  float v47 = v45 + v27 * v10.__cosval;
  v59[2] = LODWORD(v43);
  *(float *)&v59[3] = v47;
  double v48 = *(float *)&v53 + v25 * v10.__cosval;
  *(float *)&double v43 = v48 - v26 * v10.__sinval;
  double v49 = *((float *)&v53 + 1) + v25 * v10.__sinval;
  float v50 = v49 + v26 * v10.__cosval;
  v59[4] = LODWORD(v43);
  *(float *)&v59[5] = v50;
  *(float *)&double v48 = v48 - v27 * v10.__sinval;
  float v51 = v49 + v27 * v10.__cosval;
  v59[6] = LODWORD(v48);
  *(float *)&v59[7] = v51;
  [a4 setVertex2DPointer:v59];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  uint64_t v52 = -3LL;
  do
  {
    if ((v21 & (1 << (v52 + 4))) != 0) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
    }
  }

  while (!__CFADD__(v52++, 1LL));
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v58];
  }

- (void)renderImageMiddle:(id)a3 inContext:(id)a4
{
  double x = self->mInnerRect.origin.x;
  double v8 = self->mOuterRect.origin.x;
  if (x == v8)
  {
    double y = self->mInnerRect.origin.y;
    double v10 = self->mOuterRect.origin.y;
    if (y == v10
      && self->mInnerRect.size.width == self->mOuterRect.size.width
      && self->mInnerRect.size.height == self->mOuterRect.size.height)
    {
      return;
    }
  }

  else
  {
    double v10 = self->mOuterRect.origin.y;
    double y = self->mInnerRect.origin.y;
  }

  CGFloat v11 = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  double v131 = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v17 = __sincosf_stret(mRotation);
  double v18 = v8 * 2.0 + -1.0;
  double v19 = (v8 + self->mOuterRect.size.width) * 2.0 + -1.0;
  double v20 = v10 * 2.0 + -1.0;
  double v21 = (v10 + self->mOuterRect.size.height) * 2.0 + -1.0;
  double v22 = x * 2.0 + -1.0;
  double v23 = (x + self->mInnerRect.size.width) * 2.0 + -1.0;
  double v24 = y * 2.0 + -1.0;
  double v25 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
  int mMeshType = self->mMeshType;
  double v133 = v11;
  if (mMeshType == 3)
  {
    float v30 = v19;
    float v28 = v24;
    float v27 = v23;
    float v32 = v25;
    float v37 = v22;
    float v29 = v28;
    float v33 = v27;
    float v34 = v32;
    float v35 = v27;
    float v36 = v32;
    float v31 = v28;
    float v38 = v37;
    float v39 = v28;
    float v41 = v28;
    float v40 = v18;
    v139[0] = v30;
    float v42 = v37;
    float v43 = v32;
    float v44 = v40;
    float v45 = v32;
  }

  else if (mMeshType == 2)
  {
    float v27 = v22;
    float v28 = v20;
    float v29 = v24;
    float v30 = v23;
    float v31 = v25;
    float v32 = v28;
    float v33 = v30;
    float v34 = v29;
    float v35 = v30;
    float v36 = v29;
    float v37 = v27;
    float v38 = v27;
    float v39 = v31;
    float v40 = v27;
    float v41 = v21;
    v139[0] = v27;
    float v42 = v30;
    float v43 = v31;
    float v44 = v30;
    float v45 = v41;
  }

  else
  {
    float v28 = v20;
    float v27 = v22;
    float v29 = v24;
    float v30 = v19;
    float v33 = v23;
    float v36 = v21;
    float v31 = v25;
    float v32 = v28;
    float v34 = v29;
    float v35 = v30;
    float v37 = v33;
    float v39 = v36;
    float v40 = v27;
    float v41 = v31;
    float v38 = v18;
    v139[0] = v38;
    float v42 = v38;
    float v43 = v28;
    float v44 = v27;
    float v45 = v29;
  }

  double v46 = width;
  double v47 = height;
  v139[1] = v28;
  v139[2] = v27;
  v139[3] = v29;
  v139[4] = v30;
  v139[5] = v32;
  v139[6] = v33;
  v139[7] = v34;
  v139[8] = v35;
  v139[9] = v36;
  v139[10] = v37;
  v139[11] = v31;
  v139[12] = v38;
  v139[13] = v39;
  v139[14] = v40;
  v139[15] = v41;
  v139[16] = v42;
  v139[17] = v43;
  v139[18] = v44;
  v139[19] = v45;
  if (a3)
  {
    *(float *)&double v16 = height;
    *(float *)&double v15 = width;
    double v127 = v19;
    double v129 = v23;
    double v48 = v25;
    double v49 = v24;
    double v50 = v22;
    double v51 = v21;
    double v52 = v20;
    double v53 = v18;
    if (self->mPreservesImageAspectRatio)
    {
      *(float *)&double v15 = *(float *)&v15 / *(float *)&v16;
    }

    else
    {
      objc_msgSend(a3, "aspectRatio", v15, v16);
      *(float *)&double v15 = v15;
    }

    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v135 state:v15];
    [a4 setTextureCoordinatesPointer:v139 onTextureUnit:0];
    double v18 = v53;
    double v20 = v52;
    double v21 = v51;
    double v22 = v50;
    double v24 = v49;
    double v25 = v48;
    double v19 = v127;
    double v23 = v129;
  }

  int v54 = 0;
  float v55 = v131;
  float v56 = v133;
  float v126 = v55;
  float v128 = v56;
  double v125 = v18 * v46;
  double v57 = v19 * v46;
  double v58 = v20 * v47;
  double v59 = v21 * v47;
  double v60 = v22 * v46;
  double v130 = v23 * v46;
  __asm { FMOV            V1.2D, #1.0 }

  uint64_t v66 = 1LL;
  double v67 = v24 * v47;
  double v68 = v25 * v47;
  __asm { FMOV            V0.2D, #0.5 }

  float64x2_t v132 = _Q0;
  float64x2_t v134 = _Q1;
  do
  {
    id v70 = [a4 imageSetOnTextureUnit:v66];
    if (v70)
    {
      if ([v70 preservesAspectRatio])
      {
        v71 = v139;
      }

      else
      {
        for (uint64_t i = 0LL; i != 20; i += 4LL)
        {
          v71 = (float *)v138;
          *(float32x4_t *)&v138[i * 4] = vcvt_hight_f32_f64( (int32x2_t)vcvt_f32_f64( vmulq_f64( vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v139[i]), v134),  v132)),  vmulq_f64( vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v139[i]), v134),  v132));
        }
      }

      v54 |= 1 << v66;
      [a4 setTextureCoordinatesPointer:v71 onTextureUnit:v66];
    }

    ++v66;
  }

  while (v66 != 4);
  if (self->mNeedsInSpriteCoordinates)
  {
    for (uint64_t j = 0LL; j != 20; ++j)
    {
      if ((j & 1) != 0) {
        uint64_t v74 = 16LL;
      }
      else {
        uint64_t v74 = 15LL;
      }
      Class v75 = (&self->super.isa)[v74];
      if ((j & 1) != 0) {
        uint64_t v76 = 18LL;
      }
      else {
        uint64_t v76 = 17LL;
      }
      float v77 = *(double *)&(&self->super.isa)[v76] + (v139[j] + 1.0) * 0.5 * *(double *)&v75;
      v137[j] = v77;
    }

    objc_msgSend(a4, "setInSpriteCoordinatesPointer:", v137, 1.0, 0.5);
  }

  int v78 = self->mMeshType;
  if (v78 == 3)
  {
    double v99 = v126 + v57 * v17.__cosval;
    float v80 = v99 - v67 * v17.__sinval;
    double v100 = v128 + v57 * v17.__sinval;
    float v82 = v100 + v67 * v17.__cosval;
    double v101 = v126 + v130 * v17.__cosval;
    float v83 = v101 - v67 * v17.__sinval;
    double v102 = v128 + v130 * v17.__sinval;
    float v84 = v102 + v67 * v17.__cosval;
    double v86 = v99 - v68 * v17.__sinval;
    double v88 = v100 + v68 * v17.__cosval;
    float v89 = v101 - v68 * v17.__sinval;
    float v90 = v102 + v68 * v17.__cosval;
    double v103 = v126 + v60 * v17.__cosval;
    float v91 = v103 - v67 * v17.__sinval;
    double v104 = v128 + v60 * v17.__sinval;
    float v92 = v104 + v67 * v17.__cosval;
    double v105 = v126 + v125 * v17.__cosval;
    double v93 = v105 - v67 * v17.__sinval;
    double v106 = v128 + v125 * v17.__sinval;
    double v94 = v106 + v67 * v17.__cosval;
    float v95 = v103 - v68 * v17.__sinval;
    float v96 = v104 + v68 * v17.__cosval;
    float v97 = v105 - v68 * v17.__sinval;
    double v98 = v106 + v68 * v17.__cosval;
  }

  else
  {
    if (v78 != 2)
    {
      double v112 = v126 + v125 * v17.__cosval;
      float v95 = v112 - v58 * v17.__sinval;
      double v113 = v128 + v125 * v17.__sinval;
      float v82 = v113 + v58 * v17.__cosval;
      double v114 = v126 + v60 * v17.__cosval;
      float v83 = v114 - v67 * v17.__sinval;
      double v115 = v128 + v60 * v17.__sinval;
      float v84 = v115 + v67 * v17.__cosval;
      double v116 = v126 + v57 * v17.__cosval;
      double v86 = v116 - v58 * v17.__sinval;
      double v117 = v128 + v57 * v17.__sinval;
      double v88 = v117 + v58 * v17.__cosval;
      double v118 = v126 + v130 * v17.__cosval;
      float v89 = v118 - v67 * v17.__sinval;
      double v119 = v128 + v130 * v17.__sinval;
      float v90 = v119 + v67 * v17.__cosval;
      float v108 = v116 - v59 * v17.__sinval;
      float v109 = v117 + v59 * v17.__cosval;
      float v91 = v118 - v68 * v17.__sinval;
      float v92 = v119 + v68 * v17.__cosval;
      float v110 = v112 - v59 * v17.__sinval;
      float v111 = v113 + v59 * v17.__cosval;
      double v93 = v114 - v68 * v17.__sinval;
      double v94 = v115 + v68 * v17.__cosval;
      *(float *)v136 = v95;
      float v96 = v82;
      float v97 = v83;
      float v107 = v84;
      goto LABEL_41;
    }

    double v79 = v126 + v60 * v17.__cosval;
    float v80 = v79 - v58 * v17.__sinval;
    double v81 = v128 + v60 * v17.__sinval;
    float v82 = v81 + v58 * v17.__cosval;
    float v83 = v79 - v67 * v17.__sinval;
    float v84 = v81 + v67 * v17.__cosval;
    double v85 = v126 + v130 * v17.__cosval;
    double v86 = v85 - v58 * v17.__sinval;
    double v87 = v128 + v130 * v17.__sinval;
    double v88 = v87 + v58 * v17.__cosval;
    float v89 = v85 - v67 * v17.__sinval;
    float v90 = v87 + v67 * v17.__cosval;
    float v91 = v79 - v68 * v17.__sinval;
    float v92 = v81 + v68 * v17.__cosval;
    double v93 = v79 - v59 * v17.__sinval;
    double v94 = v81 + v59 * v17.__cosval;
    float v95 = v85 - v68 * v17.__sinval;
    float v96 = v87 + v68 * v17.__cosval;
    float v97 = v85 - v59 * v17.__sinval;
    double v98 = v87 + v59 * v17.__cosval;
  }

  float v107 = v98;
  *(float *)v136 = v80;
  float v108 = v89;
  float v109 = v90;
  float v110 = v91;
  float v111 = v92;
LABEL_41:
  float v120 = v94;
  float v121 = v93;
  float v122 = v88;
  *(float *)&v136[1] = v82;
  *(float *)&v136[2] = v83;
  float v123 = v86;
  *(float *)&v136[3] = v84;
  *(float *)&v136[4] = v123;
  *(float *)&v136[5] = v122;
  *(float *)&v136[6] = v89;
  *(float *)&v136[7] = v90;
  *(float *)&v136[8] = v108;
  *(float *)&v136[9] = v109;
  *(float *)&v136[10] = v91;
  *(float *)&v136[11] = v92;
  *(float *)&v136[12] = v110;
  *(float *)&v136[13] = v111;
  *(float *)&v136[14] = v121;
  *(float *)&v136[15] = v120;
  *(float *)&v136[16] = v95;
  *(float *)&v136[17] = v96;
  *(float *)&v136[18] = v97;
  *(float *)&v136[19] = v107;
  [a4 setVertex2DPointer:v136];
  [a4 drawTriangleStripFromOffset:0 count:10];
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  uint64_t v124 = -3LL;
  do
  {
    if ((v54 & (1 << (v124 + 4))) != 0) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
    }
  }

  while (!__CFADD__(v124++, 1LL));
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v135];
  }

- (void)renderImageOuter:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x == 0.0
    && self->mInnerRect.origin.y == 0.0
    && self->mInnerRect.size.width == 1.0
    && self->mInnerRect.size.height == 1.0)
  {
    return;
  }

  double x = self->mOuterRect.origin.x;
  if (x == 0.0
    && self->mOuterRect.origin.y == 0.0
    && self->mOuterRect.size.width == 1.0
    && self->mOuterRect.size.height == 1.0)
  {
    int v8 = 1;
    uint64_t v9 = 22LL;
    uint64_t v10 = 21LL;
    uint64_t v11 = 20LL;
    double x = self->mInnerRect.origin.x;
  }

  else
  {
    int v8 = 0;
    uint64_t v9 = 26LL;
    uint64_t v10 = 25LL;
    uint64_t v11 = 24LL;
  }

  Class v12 = (&self->super.isa)[v9];
  Class v13 = (&self->super.isa)[v10];
  Class v14 = (&self->super.isa)[v11];
  v191.f64[0] = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  v190.f64[0] = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v18 = __sincosf_stret(mRotation);
  float cosval = v18.__cosval;
  float sinval = v18.__sinval;
  v186 = &v177;
  double v19 = -1.0;
  double v20 = x * 2.0 + -1.0;
  double v21 = (*(double *)&v13 + x) * 2.0 + -1.0;
  double v22 = *(double *)&v14 * 2.0 + -1.0;
  double v23 = (*(double *)&v12 + *(double *)&v14) * 2.0 + -1.0;
  if (self->mMeshType == 1) {
    unint64_t v24 = 48LL;
  }
  else {
    unint64_t v24 = 20LL;
  }
  double v25 = (char *)&v177 - (4 * v24);
  int mMeshType = self->mMeshType;
  if (mMeshType == 3)
  {
    double v38 = v22;
    double v19 = v23;
    if ((v8 & 1) == 0)
    {
      double y = self->mInnerRect.origin.y;
      double v38 = y * 2.0 + -1.0;
      double v19 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
    }

    *(_DWORD *)double v25 = -1082130432;
    double v179 = v38;
    float v40 = v38;
    double v177 = v19;
    *(float *)&double v19 = v19;
    *((float *)v25 + 1) = v40;
    float v41 = v20;
    float v42 = v21;
    *((_DWORD *)v25 + 2) = -1082130432;
    *((_DWORD *)v25 + 3) = LODWORD(v19);
    *((float *)v25 + 4) = v41;
    *((float *)v25 + 5) = v40;
    *((float *)v25 + 6) = v41;
    *((_DWORD *)v25 + 7) = LODWORD(v19);
    *((float *)v25 + 8) = v41;
    *((_DWORD *)v25 + 9) = LODWORD(v19);
    *((float *)v25 + 10) = v42;
    *((float *)v25 + 11) = v40;
    *((float *)v25 + 12) = v42;
    *((float *)v25 + 13) = v40;
    *((float *)v25 + 14) = v42;
    *((_DWORD *)v25 + 15) = LODWORD(v19);
    *((_DWORD *)v25 + 16) = 1065353216;
    *((_DWORD *)v25 + 18) = 1065353216;
    uint64_t v37 = 76LL;
    double v180 = v21;
    double v178 = x * 2.0 + -1.0;
    *((float *)v25 + 17) = v40;
  }

  else
  {
    if (mMeshType == 2)
    {
      double v43 = v21;
      double v44 = x * 2.0 + -1.0;
      if ((v8 & 1) == 0)
      {
        double v45 = self->mInnerRect.origin.x;
        double v44 = v45 * 2.0 + -1.0;
        double v19 = v45 + self->mInnerRect.size.width;
        double v43 = v19 * 2.0 + -1.0;
      }

      double v178 = v44;
      float v46 = v44;
      *(float *)double v25 = v46;
      float v47 = v22;
      *((_DWORD *)v25 + 1) = -1082130432;
      double v180 = v43;
      float v48 = v43;
      float v49 = v23;
      *((float *)v25 + 2) = v46;
      *((float *)v25 + 3) = v47;
      *((float *)v25 + 4) = v48;
      *((_DWORD *)v25 + 5) = -1082130432;
      *((float *)v25 + 6) = v48;
      *((float *)v25 + 7) = v47;
      *((float *)v25 + 8) = v48;
      *((float *)v25 + 9) = v47;
      *((float *)v25 + 10) = v46;
      *((float *)v25 + 11) = v49;
      *((float *)v25 + 12) = v46;
      *((float *)v25 + 13) = v49;
      *((float *)v25 + 14) = v46;
      *((_DWORD *)v25 + 15) = 1065353216;
      LODWORD(v19) = 1.0;
      *((float *)v25 + 16) = v48;
      *((float *)v25 + 17) = v49;
      uint64_t v37 = 76LL;
      double v179 = v22;
      double v177 = v23;
    }

    else
    {
      __asm { FMOV            V1.2S, #-1.0 }

      if (mMeshType == 1)
      {
        *(void *)double v25 = _D1;
        float v32 = v20;
        float v33 = v22;
        float v34 = v23;
        *((float *)v25 + 2) = v32;
        *((float *)v25 + 3) = v33;
        float v35 = v21;
        *((_DWORD *)v25 + 4) = -1082130432;
        *((float *)v25 + 5) = v33;
        *((float *)v25 + 6) = v32;
        *((float *)v25 + 7) = v34;
        *((_DWORD *)v25 + 8) = -1082130432;
        *((float *)v25 + 9) = v34;
        *(_OWORD *)(v25 + 40) = xmmword_1FBBE0;
        *((float *)v25 + 14) = v32;
        *((float *)v25 + 15) = v34;
        *((float *)v25 + 16) = v32;
        *((_DWORD *)v25 + 17) = 1065353216;
        *((float *)v25 + 18) = v35;
        *((float *)v25 + 19) = v34;
        *((float *)v25 + 20) = v35;
        __asm { FMOV            V5.4S, #1.0 }

        *(_OWORD *)(v25 + 84) = _Q5;
        *((_DWORD *)v25 + 25) = 1065353216;
        *((float *)v25 + 26) = v35;
        *((float *)v25 + 27) = v34;
        *((_DWORD *)v25 + 28) = 1065353216;
        *((float *)v25 + 29) = v34;
        *((float *)v25 + 30) = v35;
        *((float *)v25 + 31) = v33;
        *((_DWORD *)v25 + 32) = 1065353216;
        *((float *)v25 + 33) = v33;
        *(_OWORD *)(v25 + 136) = xmmword_1FBBF0;
        *((float *)v25 + 38) = v35;
        *((float *)v25 + 39) = v33;
        *((float *)v25 + 40) = v35;
        *((_DWORD *)v25 + 41) = -1082130432;
        *(void *)&double v19 = COERCE_UNSIGNED_INT(-1.0) | 0xBF80000000000000LL;
        *((float *)v25 + 42) = v32;
        *((float *)v25 + 43) = v33;
        uint64_t v37 = 188LL;
        double v179 = v22;
        double v180 = v21;
        *((float *)v25 + 44) = v32;
        double v177 = v23;
        double v178 = x * 2.0 + -1.0;
        *(void *)(v25 + 180) = _D1;
        goto LABEL_26;
      }

      *(void *)double v25 = _D1;
      float v48 = v20;
      *(float *)&double v19 = v22;
      float v50 = v21;
      *((float *)v25 + 2) = v48;
      *((_DWORD *)v25 + 3) = LODWORD(v19);
      float v51 = v23;
      *((void *)v25 + 2) = 0xBF8000003F800000LL;
      *((float *)v25 + 6) = v50;
      *((_DWORD *)v25 + 7) = LODWORD(v19);
      __asm { FMOV            V5.2S, #1.0 }

      *((void *)v25 + 4) = _D5;
      *((float *)v25 + 10) = v50;
      *((float *)v25 + 11) = v51;
      *((void *)v25 + 6) = 0x3F800000BF800000LL;
      *((float *)v25 + 14) = v48;
      *((float *)v25 + 15) = v51;
      uint64_t v37 = 76LL;
      double v179 = v22;
      double v180 = v21;
      *((void *)v25 + 8) = _D1;
      double v177 = v23;
      double v178 = x * 2.0 + -1.0;
    }

    *((float *)v25 + 18) = v48;
  }

- (void)renderImageInner:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
}

- (void)renderImageOuter:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
}

- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (!self->mHitIsActive) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  if (self->_usesOwnMatrixForHitTest)
  {
    MRMatrix_Invert(self->mModelViewProjectionMatrix, v19);
    if (self->_usesOwnMatrixForHitTest) {
      a4 = v19;
    }
  }

  double v10 = MRMatrix_UnprojectPoint(a4, x, y) - self->mPosition.x;
  double v12 = v11 - self->mPosition.y;
  float mRotation = self->mRotation;
  __float2 v14 = __sincosf_stret(mRotation);
  double v15 = ((v12 * v14.__sinval + v10 * v14.__cosval) / self->mHalfSize.width + 1.0) * 0.5;
  double v16 = ((v12 * v14.__cosval - v10 * v14.__sinval) / self->mHalfSize.height + 1.0) * 0.5;
  if (a5)
  {
    a5->double x = v15;
    a5->double y = v16;
  }

  BOOL v17 = v15 >= 0.0;
  if (v15 > 1.0) {
    BOOL v17 = 0;
  }
  if (v16 < 0.0) {
    BOOL v17 = 0;
  }
  return v16 <= 1.0 && v17;
}

- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:
{
  double width = self->mHalfSize.width;
  float mRotation = self->mRotation;
  __float2 v9 = __sincosf_stret(mRotation);
  float v10 = width * v9.__cosval;
  double height = self->mHalfSize.height;
  float v12 = height * v9.__sinval;
  float v13 = width * v9.__sinval;
  float v14 = height * v9.__cosval;
  if (self->_usesOwnMatrixForHitTest) {
    mModelViewProjectionMatridouble x = self->mModelViewProjectionMatrix;
  }
  else {
    mModelViewProjectionMatridouble x = a4;
  }
  double v16 = v10;
  double v17 = v12;
  double v18 = v13;
  double v19 = v14;
  (*a3)[0].double x = MRMatrix_ProjectPoint( mModelViewProjectionMatrix,  self->mPosition.x - v10 + v12,  self->mPosition.y - v13 - v14);
  (*a3)[0].double y = v20;
  if (self->_usesOwnMatrixForHitTest) {
    double v21 = self->mModelViewProjectionMatrix;
  }
  else {
    double v21 = a4;
  }
  (*a3)[1].double x = MRMatrix_ProjectPoint(v21, self->mPosition.x + v16 + v17, self->mPosition.y + v18 - v19);
  (*a3)[1].double y = v22;
  if (self->_usesOwnMatrixForHitTest) {
    double v23 = self->mModelViewProjectionMatrix;
  }
  else {
    double v23 = a4;
  }
  (*a3)[2].double x = MRMatrix_ProjectPoint(v23, self->mPosition.x + v16 - v17, self->mPosition.y + v18 + v19);
  (*a3)[2].double y = v24;
  if (self->_usesOwnMatrixForHitTest) {
    double v25 = self->mModelViewProjectionMatrix;
  }
  else {
    double v25 = a4;
  }
  (*a3)[3].double x = MRMatrix_ProjectPoint(v25, self->mPosition.x - v16 - v17, self->mPosition.y - v18 + v19);
  (*a3)[3].double y = v26;
  return 1;
}

+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
  LODWORD(v6) = 0;
  objc_msgSend( a1,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  a3,  a4,  a5.x,  a5.y,  a6.width,  a6.height,  v6);
}

+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  if (a3 || [a4 shaderIsSet])
  {
    float v14 = x;
    [a4 localAspectRatio];
    float v16 = y / v15;
    float v17 = width * 0.5;
    [a4 localAspectRatio];
    float v19 = height * 0.5 / v18;
    __float2 v21 = __sincosf_stret(a7);
    float v22 = v21.__cosval * v17;
    float v23 = v21.__sinval * v17;
    float v24 = v21.__cosval * v19;
    float v25 = v21.__sinval * v19;
    v28[0] = xmmword_1FBC20;
    v28[1] = unk_1FBC30;
    if (a3)
    {
      LODWORD(v20) = 0;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v26 state:v20];
      [a4 setTextureCoordinatesPointer:v28 onTextureUnit:0];
    }

    v27[0] = (float)(v14 - v22) + v25;
    v27[1] = (float)(v16 - v24) - v23;
    v27[2] = (float)(v14 - v22) - v25;
    v27[3] = (float)(v24 + v16) - v23;
    v27[4] = (float)(v22 + v14) + v25;
    v27[5] = v23 + (float)(v16 - v24);
    v27[6] = (float)(v22 + v14) - v25;
    v27[7] = v23 + (float)(v24 + v16);
    [a4 setVertex2DPointer:v27];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    if (a3)
    {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v26];
    }
  }

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
  LODWORD(v6) = 0;
  objc_msgSend(a1, "renderImage:inContext:atPosition:andSize:zRotation:", a3, a4, a5.x, a5.y, a6.width, a6.height, v6);
}

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  if (a3 || [a4 shaderIsSet])
  {
    float v14 = x;
    [a4 localAspectRatio];
    float v16 = y / v15;
    float v17 = width * 0.5;
    [a4 localAspectRatio];
    float v19 = height * 0.5 / v18;
    __float2 v21 = __sincosf_stret(a7);
    float v22 = v21.__cosval * v17;
    float v23 = v21.__sinval * v17;
    float v24 = v21.__cosval * v19;
    float v25 = v21.__sinval * v19;
    v28[0] = xmmword_1FBC00;
    v28[1] = unk_1FBC10;
    if (a3)
    {
      *(float *)&double v20 = v17 / v19;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v26 state:v20];
      [a4 setTextureCoordinatesPointer:v28 onTextureUnit:0];
    }

    v27[0] = (float)(v14 - v22) + v25;
    v27[1] = (float)(v16 - v24) - v23;
    v27[2] = (float)(v14 - v22) - v25;
    v27[3] = (float)(v24 + v16) - v23;
    v27[4] = (float)(v22 + v14) + v25;
    v27[5] = v23 + (float)(v16 - v24);
    v27[6] = (float)(v22 + v14) - v25;
    v27[7] = v23 + (float)(v24 + v16);
    [a4 setVertex2DPointer:v27];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    if (a3)
    {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v26];
    }
  }

+ (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8
{
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  [a5 localAspectRatio];
  float v17 = width * 0.5;
  double v18 = y / v16;
  [a5 localAspectRatio];
  float v20 = height * 0.5 / v19;
  __float2 v21 = __sincosf_stret(a8);
  [a5 setShader:@"Mask"];
  HIDWORD(v22) = -1082130432;
  v33[0] = xmmword_1FBC00;
  v33[1] = unk_1FBC10;
  if (a3)
  {
    *(float *)&double v22 = v17 / v20;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v30 state:v22];
    [a5 setTextureCoordinatesPointer:v33 onTextureUnit:0];
  }

  float v23 = x;
  float v24 = v18;
  float v25 = v21.__cosval * v17;
  float v26 = v21.__sinval * v17;
  float v27 = v21.__cosval * v20;
  float v28 = v21.__sinval * v20;
  v32[0] = xmmword_1FBC20;
  v32[1] = unk_1FBC30;
  if (a4)
  {
    [a4 setOnContext:a5 onTextureUnit:1 withReferenceAspectRatio:&v29 state:0.0];
    [a5 setTextureCoordinatesPointer:v32 onTextureUnit:1];
  }

  v31[0] = (float)(v23 - v25) + v28;
  v31[1] = (float)(v24 - v27) - v26;
  v31[2] = (float)(v23 - v25) - v28;
  v31[3] = (float)(v27 + v24) - v26;
  v31[4] = (float)(v25 + v23) + v28;
  v31[5] = v26 + (float)(v24 - v27);
  v31[6] = (float)(v25 + v23) - v28;
  v31[7] = v26 + (float)(v27 + v24);
  [a5 setVertex2DPointer:v31];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetVertexPointer];
  if (a4)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:1];
    [a4 unsetOnContext:a5 onTextureUnit:1 state:&v29];
  }

  if (a3)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:&v30];
  }

  [a5 unsetShader];
}

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.y;
  double v14 = a5.x;
  [a4 localAspectRatio];
  float v18 = width * 0.5;
  double v19 = v13 / v17;
  [a4 localAspectRatio];
  float v23 = height * 0.5 / v22;
  float v24 = v18 / v23;
  if (a7 > 0.0) {
    float v24 = a7;
  }
  double v25 = 0.0;
  if (y <= 0.0 || x <= 0.0) {
    double v25 = x;
  }
  if (v25 == 0.0)
  {
    int v27 = (int)y;
    float v21 = 1.0;
    float v20 = -1.0;
    double v28 = (v23 + v23) * v24 / v18;
    float v29 = v28 + -1.0;
    float v30 = (float)(v24 * v23) / v18;
    float v31 = (float)-(float)(v23 * v24) / v18;
    float v32 = 1.0 - v28;
    if (v27 != 2)
    {
      float v30 = 1.0;
      float v31 = v32;
    }

    if (v27 == 3) {
      float v33 = v29;
    }
    else {
      float v33 = v30;
    }
    if (v27 == 3) {
      float v34 = -1.0;
    }
    else {
      float v34 = v31;
    }
  }

  else
  {
    unsigned int v37 = (int)v25;
    float v33 = 1.0;
    if (v37 < 2)
    {
      float v21 = (v18 + v18) / (float)(v24 * v23) + -1.0;
      float v20 = -1.0;
      float v34 = -1.0;
    }

    else
    {
      float v34 = -1.0;
      if (v37 == 2)
      {
        float v20 = (float)-v18 / (float)(v24 * v23);
        float v21 = v18 / (float)(v24 * v23);
      }

      else if (v37 == 3)
      {
        float v20 = 1.0 - (v18 + v18) / (float)(v24 * v23);
        float v33 = 1.0;
        float v21 = 1.0;
      }
    }
  }

  float v35 = v14;
  float v36 = v19;
  *(float *)float v40 = v20;
  *(float *)&v40[1] = v34;
  *(float *)&v40[2] = v20;
  *(float *)&v40[3] = v33;
  *(float *)&v40[4] = v21;
  *(float *)&v40[5] = v34;
  *(float *)&v40[6] = v21;
  *(float *)&v40[7] = v33;
  if (a3)
  {
    objc_msgSend(a3, "setOnContext:onTextureUnit:withReferenceAspectRatio:state:", a4, 0, &v38);
    [a4 setTextureCoordinatesPointer:v40 onTextureUnit:0];
  }

  v39[0] = v35 - v18;
  v39[1] = v36 - v23;
  v39[2] = v35 - v18;
  v39[3] = v36 + v23;
  v39[4] = v35 + v18;
  v39[5] = v36 - v23;
  v39[6] = v35 + v18;
  v39[7] = v36 + v23;
  [a4 setVertex2DPointer:v39];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetVertexPointer];
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v38];
  }

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)halfSize
{
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)rotation
{
  return self->mRotation;
}

- (CGRect)innerRect
{
  double x = self->mInnerRect.origin.x;
  double y = self->mInnerRect.origin.y;
  double width = self->mInnerRect.size.width;
  double height = self->mInnerRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)outerRect
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mOuterRect.size.width;
  double height = self->mOuterRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)preservesImageAspectRatio
{
  return self->mPreservesImageAspectRatio;
}

- (void)setPreservesImageAspectRatio:(BOOL)a3
{
  self->mPreservesImageAspectRatio = a3;
}

- (BOOL)hitIsActive
{
  return self->mHitIsActive;
}

- (void)setHitIsActive:(BOOL)a3
{
  self->mHitIsActive = a3;
}

- (BOOL)needsInSpriteCoordinates
{
  return self->mNeedsInSpriteCoordinates;
}

- (void)setNeedsInSpriteCoordinates:(BOOL)a3
{
  self->mNeedsInSpriteCoordinates = a3;
}

- (BOOL)usesOwnMatrixForHitTest
{
  return self->_usesOwnMatrixForHitTest;
}

- (void)setUsesOwnMatrixForHitTest:(BOOL)a3
{
  self->_usesOwnMatrixForHitTest = a3;
}

- (CGSize)spriteCoordinatesFactor
{
  double width = self->mSpriteCoordinatesFactor.width;
  double height = self->mSpriteCoordinatesFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSpriteCoordinatesFactor:(CGSize)a3
{
  self->mSpriteCoordinatesFactor = a3;
}

- (CGPoint)spriteCoordinatesOffset
{
  double x = self->mSpriteCoordinatesOffset.x;
  double y = self->mSpriteCoordinatesOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSpriteCoordinatesOffset:(CGPoint)a3
{
  self->mSpriteCoordinatesOffset = a3;
}

- (unsigned)meshType
{
  return self->mMeshType;
}

- (void)setMeshType:(unsigned __int8)a3
{
  self->int mMeshType = a3;
}

@end