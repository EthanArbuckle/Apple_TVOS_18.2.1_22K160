@interface MREffectModern
- (BOOL)getVerticesCoordinates:(MREffectModern *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isAlphaFriendly;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectModern)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectModern

- (MREffectModern)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectModern;
  v4 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(void *)(v4 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 193),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"gradient-in-mask.png"));
    [*(id *)(v4 + 193) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v4 + 193), "setOriginalImageSize:", 800.0, 60.0);
  }

  return (MREffectModern *)v4;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(MRCroppingSprite **)((char *)&self->mSprite + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectModern;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mSprite + 1), "setDefaultSize:", width, height);
}

- (BOOL)isNative3D
{
  return 1;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isAlphaFriendly
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MREffectModern;
  -[MREffect prerenderForTime:inContext:withArguments:](&v12, "prerenderForTime:inContext:withArguments:");
  [*(id *)((char *)&self->mSprite + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  id v9 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"effectDuration");
  if (v9) {
    [v9 doubleValue];
  }
  else {
    double v10 = 10.0;
  }
  return v10 + self->super.mPhaseInDuration > a3 || self->super.mMainDuration <= a3;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v8 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"effectDuration");
  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }

  else
  {
    double v10 = 10.0;
  }

  uint64_t v11 = 136LL;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  id v13 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"useGradient");
  if (v13) {
    uint64_t v14 = [v13 BOOLValue] ^ 1;
  }
  else {
    uint64_t v14 = 1LL;
  }
  id v15 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"repeatPhaseInPan");
  if (v15) {
    unsigned int v16 = [v15 BOOLValue] ^ 1;
  }
  else {
    unsigned int v16 = 1;
  }
  double v17 = v10 + mPhaseInDuration;
  id v18 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"splitRows");
  if (!v18)
  {
    -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"rowHeightProportion");
    goto LABEL_15;
  }

  unsigned int v19 = [v18 BOOLValue];
  id v20 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"rowHeightProportion");
  if (!v19)
  {
LABEL_15:
    double v23 = 2.0;
    int v21 = 1;
    uint64_t v24 = 1LL;
    goto LABEL_16;
  }

  if (v20)
  {
    [v20 doubleValue];
    int v21 = 0;
    double v23 = v22 + v22;
    uint64_t v24 = 2LL;
  }

  else
  {
    int v21 = 0;
    uint64_t v24 = 2LL;
    double v23 = 0.9;
  }

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  a3);
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"image0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectModern *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  return objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "getVerticesCoordinates:withMatrix:",  a3,  a4,  a5);
}

- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8
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
  __float2 v23 = __sincosf_stret(a8);
  float cosval = v23.__cosval;
  LODWORD(v21) = *(void *)&v23;
  [a5 setShader:@"Mask"];
  __int128 v24 = xmmword_1F6900;
  __int128 v25 = unk_1F6910;
  v36[0] = xmmword_1F6900;
  v36[1] = unk_1F6910;
  if (a3)
  {
    *(float *)&__int128 v24 = v17 / v20;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v33 state:*(double *)&v24];
    [a5 setTextureCoordinatesPointer:v36 onTextureUnit:0];
    __int128 v25 = unk_1F6910;
    __int128 v24 = xmmword_1F6900;
  }

  float v26 = x;
  float v27 = v18;
  float v28 = cosval * v17;
  v35[0] = v24;
  v35[1] = v25;
  float v29 = v21 * v17;
  float v30 = cosval * v20;
  float v31 = v21 * v20;
  if (a4)
  {
    *(float *)&__int128 v24 = v17 / v20;
    [a4 setOnContext:a5 onTextureUnit:1 withReferenceAspectRatio:&v32 state:*(double *)&v24];
    [a5 setTextureCoordinatesPointer:v35 onTextureUnit:1];
  }

  v34[0] = (float)(v26 - v28) + v31;
  v34[1] = (float)(v27 - v30) - v29;
  v34[2] = (float)(v26 - v28) - v31;
  v34[3] = (float)(v30 + v27) - v29;
  v34[4] = (float)(v28 + v26) + v31;
  v34[5] = v29 + (float)(v27 - v30);
  v34[6] = (float)(v28 + v26) - v31;
  v34[7] = v29 + (float)(v30 + v27);
  [a5 setVertex2DPointer:v34];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetVertexPointer];
  if (a4)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:1];
    [a4 unsetOnContext:a5 onTextureUnit:1 state:&v32];
  }

  if (a3)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:&v33];
  }

  [a5 unsetShader];
}

@end