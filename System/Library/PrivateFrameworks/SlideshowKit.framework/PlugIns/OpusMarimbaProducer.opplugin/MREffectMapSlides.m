@interface MREffectMapSlides
- (BOOL)getVerticesCoordinates:(MREffectMapSlides *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectMapSlides)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_renderBigShadowForRect:(CGRect)a3 scale:(double)a4 rects:(id)a5 atTime:(double)a6 inContext:(id)a7 withArguments:(id)a8;
- (void)_unload;
- (void)render1SlideAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)render2SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)render3SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)render4SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderKey:(id)a3 shadow:(id)a4 shadowRect:(CGRect)a5 size:(CGSize)a6 position:(CGPoint)a7 xRot:(double)a8 tX:(double)a9 isPano:(BOOL)a10 time:(double)a11 inContext:(id)a12 withArguments:(id)a13;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectMapSlides

- (MREffectMapSlides)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectMapSlides;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"bigShadow.png"));
    [*(id *)(v3 + 193) setImageSizeScript:@"layerWidth * .5,layerHeight * .5"];
    objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 700.0, 718.0);
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"bigShadowBottom.png"));
    [*(id *)(v3 + 201) setImageSizeScript:@"layerWidth * .25,layerHeight * .25"];
    objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 700.0, 340.0);
    *(void *)(v3 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 209),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PinMap",  @"bigShadowTop.png"));
    [*(id *)(v3 + 209) setImageSizeScript:@"layerWidth * .25,layerHeight * .25"];
    objc_msgSend(*(id *)(v3 + 209), "setOriginalImageSize:", 700.0, 380.0);
  }

  return (MREffectMapSlides *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mSprites + 1) cleanup];

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->mBoxShadowBig + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBoxShadowBig + 1) = 0LL;
  [*(id *)((char *)&self->mBoxShadowBigBottom + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBoxShadowBigBottom + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectMapSlides;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mBoxShadowBig + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mBoxShadowBigBottom + 1), "setDefaultSize:", width, height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  if (objc_msgSend(*(id *)((char *)&self->mSprites + 1), "isLoaded", a3)
    && [*(id *)((char *)&self->mBoxShadowBig + 1) isLoaded])
  {
    return [*(id *)((char *)&self->mBoxShadowBigBottom + 1) isLoaded];
  }

  else
  {
    return 0;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectMapSlides;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)((char *)&self->mSprites + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mBoxShadowBig + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mBoxShadowBigBottom + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(MRImageProvider **)((char *)&self->mBoxShadowBigTop + 1) = (MRImageProvider *)+[MURandom randomGeneratorWithSeed:]( &OBJC_CLASS___MURandom,  "randomGeneratorWithSeed:",  self->super.mSeed);
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v10 = 1.0;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    BOOL v14 = mPhaseInDuration + mMainDuration > a3 && mPhaseInDuration <= a3 || mPhaseInDuration + mMainDuration > a3;
    double v11 = 1.0;
    if (!v14)
    {
      double v15 = (a3 - mPhaseInDuration - mMainDuration) / self->super.mPhaseOutDuration;
      float v16 = (v15 + -0.5) * 3.14159265;
      double v10 = (sinf(v16) + 1.0) * 0.5 * -0.5 + 1.0;
      float v17 = v15;
      double v18 = powf(v17, 3.0);
      double v11 = 1.0 - v18;
      *(float *)&double v19 = 1.0 - v18;
      LODWORD(v18) = 1.0;
      LODWORD(v20) = 1.0;
      LODWORD(v21) = 1.0;
      [a4 composeForeColorRed:v22 green:v18 blue:v20 alpha:v21 saveTo:v19];
    }
  }

  else
  {
    double v11 = 1.0;
  }

  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"2Slides"))
  {
    -[MREffectMapSlides render2SlidesAtTime:inContext:withArguments:scale:]( self,  "render2SlidesAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v10);
  }

  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"3Slides"))
  {
    -[MREffectMapSlides render3SlidesAtTime:inContext:withArguments:scale:]( self,  "render3SlidesAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v10);
  }

  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"4Slides"))
  {
    -[MREffectMapSlides render4SlidesAtTime:inContext:withArguments:scale:]( self,  "render4SlidesAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v10);
  }

  else
  {
    -[MREffectMapSlides render1SlideAtTime:inContext:withArguments:scale:]( self,  "render1SlideAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v10);
  }

  if (v11 < 1.0) {
    [a4 restoreForeColor:v22];
  }
  [a4 blend:0];
}

- (void)render1SlideAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  id v11 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  [v11 imageAspectRatio];
  BOOL v13 = v12 > 2.0 || v12 < 0.5;
  [v11 imageAspectRatio];
  double v15 = v14;
  if (v13)
  {
    if (v14 < 1.0 || ([v11 imageAspectRatio], v16 < 1.0) || v16 / 3.5999999 < 1.1)
    {
      [v11 imageAspectRatio];
      if (v23 < 1.0
        && ([v11 imageAspectRatio], v24 <= 1.0)
        && (v24 < 1.0 ? (double v25 = 0.649999976 / v24) : (double v25 = v24 / 0.649999976), v25 >= 1.1))
      {
        [a4 localAspectRatio];
        double v18 = 2.0;
        double v19 = 1.3 / v30;
      }

      else
      {
        [v11 imageAspectRatio];
        float v27 = v26;
        double v19 = 2.0;
        double v18 = 2.0;
        if (v27 >= 1.0)
        {
          double v28 = 2.0 / v27;
          [a4 localAspectRatio];
          double v18 = v28 * v29;
        }
      }
    }

    else
    {
      [a4 localAspectRatio];
      double v18 = (float)(v17 * 0.55556);
      double v19 = 2.0;
    }
  }

  else
  {
    [a4 localAspectRatio];
    if (v15 < v20) {
      float v20 = v15;
    }
    double v18 = dbl_1FC300[v20 < 1.0];
    double v21 = v18 * v20;
    [a4 localAspectRatio];
    double v19 = v21 / v22;
  }

  double v31 = v19 * a6;
  [v11 imageAspectRatio];
  double v33 = v32;
  [a4 localAspectRatio];
  char v35 = v33 <= v34 || v13;
  if ((v35 & 1) != 0)
  {
    double v36 = v18 * a6;
  }

  else
  {
    [v11 imageAspectRatio];
    double v38 = v31 / v37;
    [a4 localAspectRatio];
    double v36 = v38 * v39;
  }

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  unint64_t v42 = (unint64_t)[*(id *)((char *)&self->mBoxShadowBigTop + 1) randomInt];
  MRMatrix_Clear((uint64_t)v66);
  MRMatrix_Clear((uint64_t)v65);
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration > a3)
  {
    double v62 = a6;
    double v63 = a3;
    double v61 = self->super.mPhaseInDuration;
    float v44 = (a3 / mPhaseInDuration + -0.5) * 3.14159265;
    double v45 = (sinf(v44) + 1.0) * 0.5;
    if ((v42 & 0x8000000000000001LL) == 1)
    {
      [a4 localAspectRatio];
      double v47 = v46;
      [a4 localAspectRatio];
      double y = y + (v36 * v48 * 0.5 + v47 * 0.5 - y) * (1.0 - v45);
      [a4 localAspectRatio];
      float v50 = y * v49;
      float v51 = 0.0;
      MRMatrix_Translate(v66, 0.0, v50, 0.0);
      float v52 = (1.0 - v45) * -5.0;
      MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v65, 0.0, v52, 0.0);
      objc_msgSend(a4, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v66, v65));
      float v54 = -(y * v53);
    }

    else
    {
      double x = CGPointZero.x + (v31 * 0.5 + 1.0 - CGPointZero.x) * (1.0 - v45);
      double v55 = (1.0 - v45) * 5.0;
      if (x <= 0.0) {
        double v56 = -(v31 * 0.5);
      }
      else {
        double v56 = v31 * 0.5;
      }
      float v57 = v56;
      if (x <= 0.0) {
        double v58 = v31 * 0.5;
      }
      else {
        double v58 = -(v31 * 0.5);
      }
      float v54 = 0.0;
      MRMatrix_Translate(v66, v57, 0.0, 0.0);
      float v59 = v55;
      MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v65, v59, 0.0, 0.0);
      MRMatrix_PostMultiply((uint64_t)v66, v65);
      float v51 = v58;
    }

    *(float *)&double v60 = MRMatrix_Translate(v66, v51, v54, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v66, v64, v60);
    a6 = v62;
    a3 = v63;
    double mPhaseInDuration = v61;
  }

  -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", x, y, v31, v36),  0LL),  a4,  a5,  x,  y,  v31,  v36,  a6,  a3);
  -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  v13,  a4,  a5,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height,  v31,  v36,  x,  y,  0LL,  0LL,  *(void *)&a3);
  if (mPhaseInDuration > a3) {
    [a4 restoreModelViewMatrix:v64];
  }
}

- (void)render2SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  double v10 = 1.0;
  double v11 = 1.0;
  if (self->super.mPhaseInDuration + self->super.mMainDuration <= a3)
  {
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
    double v11 = a6 - v12 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
    double v10 = a6 - v13 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
  }

  double v14 = (char *)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"layout"),  "integerValue");
  [a4 localAspectRatio];
  double v16 = v15;
  if (v14 == (_BYTE *)&dword_0 + 1)
  {
    double v17 = 1.8 / v16 * 0.666666667;
    double v18 = v11 * v17;
    double v19 = v11 * 1.8;
    double v20 = -0.005 - v18 * 0.5;
    double v21 = v10 * v17;
    double v22 = v10 * 1.8;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    if (mPhaseInDuration <= a3)
    {
      -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", -0.005 - v18 * 0.5, 0.0, v18, v19),  0LL),  a4,  a5,  -0.005 - v18 * 0.5,  0.0,  v18,  v19,  a6,  a3);
      -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v21 * 0.5 + 0.005, 0.0, v21, v22),  0LL),  a4,  a5,  v21 * 0.5 + 0.005,  0.0,  v21,  v22,  a6,  a3);
      double v99 = v22;
      double y = CGRectZero.origin.y;
      double v65 = v19;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v18,  v65,  v20,  0.0,  0LL,  0LL,  *(void *)&a3);
      double v87 = a3;
      double v32 = @"image1";
      double v33 = 0.0;
      double x = CGRectZero.origin.x;
      double v35 = y;
      double v36 = width;
      double v37 = height;
      double v38 = v21;
      double v40 = v99;
      double v39 = v21 * 0.5 + 0.005;
    }

    else
    {
      float v24 = (a3 / mPhaseInDuration + -0.5) * 3.14159265;
      double v25 = (sinf(v24) + 1.0) * -0.5 + 1.0;
      double v26 = v21 * 0.5 + 0.005 + (v21 + 1.0 - (v21 * 0.5 + 0.005)) * v25;
      double v94 = v20 - (v20 - (-1.0 - v18)) * v25;
      -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v94, 0.0, v18, v19),  0LL),  a4,  a5,  v94,  0.0,  v18,  v19,  a6,  a3);
      -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v26, 0.0, v21, v22),  0LL),  a4,  a5,  v26,  0.0,  v21,  v22,  a6,  a3);
      double v27 = CGRectZero.origin.y;
      double v28 = v22;
      double v29 = v19;
      double v30 = CGRectZero.size.width;
      double v31 = CGRectZero.size.height;
      -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image1",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v27,  v30,  v31,  v21,  v28,  v26,  0.0,  0LL,  0LL,  *(void *)&a3);
      double v87 = a3;
      double v32 = @"image0";
      double v33 = 0.0;
      double x = CGRectZero.origin.x;
      double v35 = v27;
      double v36 = v30;
      double v37 = v31;
      double v39 = v94;
      double v38 = v18;
      double v40 = v29;
    }

    goto LABEL_11;
  }

  double v41 = 0.9 / v16 * 1.5;
  double r1 = v11 * v41;
  [a4 localAspectRatio];
  double v43 = v11 * 0.9;
  double v95 = v10 * v41;
  double v96 = v42 * 0.005 + v43 * 0.5;
  [a4 localAspectRatio];
  double v46 = v10 * 0.9;
  double v44 = v10 * 0.9;
  double v47 = v45 * -0.005 - v10 * 0.9 * 0.5;
  double v48 = self->super.mPhaseInDuration;
  double v92 = v47;
  if (v48 <= a3)
  {
    v102.origin.double x = 0.0;
    uint64_t v68 = 0LL;
    v102.origin.double y = v96;
    v102.size.double width = r1;
    v102.size.double height = v43;
    double v69 = v47;
    double v70 = v95;
    double v71 = v46;
    CGRect v103 = CGRectUnion(v102, *(CGRect *)(&v47 - 1));
    -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, v96, r1, v43),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, v69, v95, v46),  0LL),  a4,  a5,  CGPointZero.x,  CGPointZero.y,  v103.size.width,  v103.size.height,  a6,  a3);
    double v72 = CGRectZero.origin.y;
    double v73 = CGRectZero.size.width;
    double v74 = CGRectZero.size.height;
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v72,  v73,  v74,  r1,  v43,  0.0,  v96,  0LL,  0LL,  *(void *)&a3);
    double v87 = a3;
    double v32 = @"image1";
    double v39 = 0.0;
    double x = CGRectZero.origin.x;
    double v35 = v72;
    double v36 = v73;
    double v37 = v74;
    double v38 = v95;
    double v40 = v46;
    double v33 = v92;
LABEL_11:
    v75 = self;
    uint64_t v76 = 0LL;
    goto LABEL_14;
  }

  double v98 = a3;
  float v49 = (a3 / v48 + -0.5) * 3.14159265;
  CGFloat v50 = v47;
  double v88 = (sinf(v49) + 1.0) * 0.5;
  v100.origin.double x = 0.0;
  v104.origin.double x = 0.0;
  v104.size.double width = v95;
  v100.origin.double y = v96;
  v100.size.double width = r1;
  v100.size.double height = v43;
  v104.origin.double y = v50;
  v104.size.double height = v10 * 0.9;
  CGRect v101 = CGRectUnion(v100, v104);
  double v91 = v101.size.width;
  double v89 = v101.size.height;
  double v90 = CGPointZero.y;
  [a4 localAspectRatio];
  LODWORD(v50) = v51;
  [a4 localAspectRatio];
  double v53 = v52;
  [a4 localAspectRatio];
  double v55 = v43 * v54;
  double v56 = v43;
  if (*(float *)&v50 >= 1.5)
  {
    double v77 = v55 * 0.5 + v53 * 0.5 - v96;
    double v58 = 1.0 - v88;
    double v59 = v96 + v77 * (1.0 - v88);
    [a4 localAspectRatio];
    double v79 = v78;
    [a4 localAspectRatio];
    double v63 = v46 * v80 * -0.5 + v79 * -0.5;
  }

  else
  {
    double v57 = v55 + v53 * 0.5 - v96;
    double v58 = 1.0 - v88;
    double v59 = v96 + v57 * (1.0 - v88);
    [a4 localAspectRatio];
    double v61 = v60;
    [a4 localAspectRatio];
    double v63 = -(v10 * 0.9) * v62 - v61 * 0.5;
  }

  double v81 = v44;
  double v82 = v92 - (v92 - v63) * v58;
  double v83 = v91 + v91 * 0.425;
  [a4 localAspectRatio];
  double v85 = v90 + v84 * -0.01 + (2.0 - v89) * 0.5;
  double v86 = v82 + v85 + -0.06;
  -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  *(MRImageProvider **)((char *)&self->mBoxShadowBigBottom + 1),  0LL,  a4,  a5,  CGPointZero.x + (v83 - v91) * 0.5 + -0.0250000004,  v59 + v85 + -0.14 + 0.09,  v83 + v83 * 0.03,  1.14,  r1,  v56,  0.0,  v59,  0LL,  0LL,  *(void *)&v98);
  uint64_t v76 = *(uint64_t *)((char *)&self->mBoxShadowBig + 1);
  double v87 = v98;
  double v32 = @"image1";
  double v37 = 0.94;
  double v39 = 0.0;
  double x = CGPointZero.x + (v83 - v91) * 0.5;
  double v35 = v86;
  double v36 = v83;
  double v38 = v95;
  double v40 = v81;
  double v33 = v82;
  v75 = self;
LABEL_14:
  -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( v75,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  v32,  v76,  0LL,  a4,  a5,  x,  v35,  v36,  v37,  v38,  v40,  v39,  v33,  0LL,  0LL,  *(void *)&v87);
}

- (void)render3SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration <= a3)
  {
    double v19 = 1.0;
    double v17 = 1.0;
    double v15 = 1.0;
    if (mPhaseInDuration + self->super.mMainDuration <= a3)
    {
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v15 = a6 - v20 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v17 = a6 - v21 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v19 = a6 - v22 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
    }
  }

  else
  {
    float v12 = (1.0 - a3 / mPhaseInDuration + -0.5) * 3.14159265;
    double v13 = (sinf(v12) + 1.0) * 0.5;
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:4.0 :6.0];
    double v15 = v14 * v13 + 1.0;
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:2.0 :4.0];
    double v17 = v16 * v13 + 1.0;
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:2.0 :6.0];
    double v19 = v18 * v13 + 1.0;
  }

  [a4 localAspectRatio];
  double v24 = 1.82 / v23 * 0.666666667;
  [a4 localAspectRatio];
  double v60 = v24;
  double v75 = v15 * (v25 * 0.01 + 1.8);
  double v74 = v15 * v24;
  double v70 = -0.005 - v15 * v24 * 0.5;
  [a4 localAspectRatio];
  double v27 = 0.9 / v26 * 1.5;
  double v76 = v17 * v27;
  double v72 = v17 * v27 * 0.5 + 0.005;
  [a4 localAspectRatio];
  double v77 = v17 * 0.9;
  double v29 = v28 * 0.005 + v17 * 0.9 * 0.5;
  double v78 = v19 * v27;
  double v65 = v19 * v27 * 0.5 + 0.005;
  [a4 localAspectRatio];
  double v67 = v19 * 0.9;
  double v68 = v30 * -0.005 - v19 * 0.9 * 0.5;
  double v31 = self->super.mPhaseInDuration;
  if (v31 <= a3)
  {
    v82.origin.double y = 0.0;
    v82.origin.double x = v70;
    v82.size.double width = v74;
    v82.size.double height = v75;
    v85.origin.double x = v17 * v27 * 0.5 + 0.005;
    v85.origin.double y = v29;
    double v58 = v29;
    v85.size.double width = v17 * v27;
    v85.size.double height = v17 * 0.9;
    CGRect v83 = CGRectUnion(v82, v85);
    -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v70, 0.0, v74, v75),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v72, v29, v76, v77),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v65, v68, v78, v67),  0LL),  a4,  a5,  CGPointZero.x,  CGPointZero.y,  v83.size.width,  v83.size.height,  a6,  a3);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v74,  v75,  v70,  0.0,  0LL,  0LL,  *(void *)&a3);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image1",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v76,  v77,  v72,  v58,  0LL,  0LL,  *(void *)&a3);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image2",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v78,  v67,  v65,  v68,  0LL,  0LL,  *(void *)&a3);
  }

  else
  {
    double v63 = -(v15 * v60);
    double v32 = 1.0 - a3 / v31;
    float v33 = v32;
    double v34 = v32;
    double v59 = v32;
    double v35 = powf(v33, 3.0) + -1.0 + 1.0;
    double v62 = a3;
    double v36 = powf(v33, 4.0) + -1.0 + 1.0;
    v80.origin.double y = 0.0;
    v80.origin.double x = v70;
    v80.size.double width = v74;
    v80.size.double height = v75;
    v84.origin.double x = v72;
    v84.origin.double y = v29;
    v84.size.double width = v76;
    v84.size.double height = v17 * 0.9;
    CGRect v81 = CGRectUnion(v80, v84);
    double v55 = v81.size.width;
    double v56 = v81.size.height;
    double v57 = CGPointZero.y;
    double v64 = v70 + (v63 * 0.5 + -1.0) * v35;
    double v37 = 1.0 - (1.0 - v34 * v34);
    double v73 = v72 + (v76 * 0.5 + 1.0) * v37;
    double v61 = v65 + (v78 + 1.0) * v36;
    double v66 = v36 * -3.0 + 0.0;
    [a4 localAspectRatio];
    double v39 = v38;
    [a4 localAspectRatio];
    double v71 = v29 + (v77 * v40 * 0.5 + v39 * 0.5) * v37;
    [a4 localAspectRatio];
    double v42 = v41;
    [a4 localAspectRatio];
    double v69 = v68 + (v67 * v43 * -0.7 - v42 * 0.5) * v35;
    [a4 localAspectRatio];
    double v45 = v57 + v44 * -0.01 + (2.0 - v56) * 0.5;
    double v46 = 1.0 - v59;
    *(float *)&double v47 = 1.0 - v59;
    LODWORD(v46) = 1.0;
    LODWORD(v48) = 1.0;
    objc_msgSend( a4,  "composeForeColorRed:green:blue:alpha:saveTo:",  v79,  v46,  COERCE_DOUBLE(__PAIR64__(HIDWORD(CGPointZero.x), 1.0)),  v48,  v47);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  0LL,  *(NSMutableDictionary **)((char *)&self->mSprites + 1),  0LL,  a4,  a5,  CGPointZero.x + (v55 + v55 * 0.425 - v55) * 0.5,  v45,  v55 + v55 * 0.425,  2.0,  v78,  v67,  v61,  v69,  0LL,  0LL,  *(void *)&v62);
    [a4 restoreForeColor:v79];
    double v49 = CGRectZero.origin.y;
    double v51 = CGRectZero.size.width;
    double v50 = CGRectZero.size.height;
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v49,  v51,  v50,  v74,  v75,  v64,  v66,  0LL,  0LL,  *(void *)&v62);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image1",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v49,  v51,  v50,  v76,  v77,  v73,  v71,  0LL,  0LL,  *(void *)&v62);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image2",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v49,  v51,  v50,  v78,  v67,  v61,  v69,  0LL,  0LL,  *(void *)&v62);
  }

- (void)render4SlidesAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  double v12 = dbl_1FC310[v11 < 1.5];
  [a4 localAspectRatio];
  double v14 = v12 / v13;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v71 = 1.0;
  double v72 = v12;
  if (mPhaseInDuration <= a3)
  {
    double v16 = 1.0;
    double v17 = 1.0;
    double v18 = 1.0;
    if (mPhaseInDuration + self->super.mMainDuration <= a3)
    {
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v18 = a6 - v19 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v17 = a6 - v20 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v16 = a6 - v21 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
      [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:0.0 :0.3];
      double v71 = a6 - v22 * ((a3 - self->super.mPhaseInDuration - self->super.mMainDuration) / self->super.mPhaseOutDuration);
    }
  }

  else
  {
    double v16 = 1.0;
    double v17 = 1.0;
    double v18 = 1.0;
  }

  double v80 = a3;
  double r2 = a6;
  double v88 = v14 * 1.5 * v18;
  double r1 = -0.005 - v88 * 0.5;
  [a4 localAspectRatio];
  double v86 = v12 * v18;
  double v87 = v23 * 0.005 + v12 * v18 * 0.5;
  double v75 = v14 * 1.5 * v17;
  double v68 = -0.005 - v75 * 0.5;
  [a4 localAspectRatio];
  double v76 = v12 * v17;
  double v25 = v24 * -0.005 - v12 * v17 * 0.5;
  double v77 = v14 * 1.5 * v16;
  double v78 = v77 * 0.5 + 0.005;
  [a4 localAspectRatio];
  double v79 = v12 * v16;
  double r1_8 = v26 * 0.005 + v12 * v16 * 0.5;
  double v27 = v14 * 1.5 * v71;
  double v28 = v12 * v71;
  [a4 localAspectRatio];
  double v30 = v29 * -0.005 - v72 * v71 * 0.5;
  double v31 = self->super.mPhaseInDuration;
  double v85 = v27;
  double r1_16 = v30;
  double r1_24 = v27 * 0.5 + 0.005;
  double v74 = v25;
  if (v31 <= a3)
  {
    v90.origin.double x = -0.005 - v88 * 0.5;
    v90.origin.double y = v87;
    v90.size.double width = v14 * 1.5 * v18;
    v90.size.double height = v72 * v18;
    double v44 = v27 * 0.5 + 0.005;
    double v45 = v14 * 1.5 * v71;
    double v46 = v72 * v71;
    CGRect v91 = CGRectUnion(v90, *(CGRect *)(&v30 - 1));
    -[MREffectMapSlides _renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:]( self,  "_renderBigShadowForRect:scale:rects:atTime:inContext:withArguments:",  +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", r1, v87, v88, v86),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v68, v25, v75, v76),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v78, r1_8, v77, v79),  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v27 * 0.5 + 0.005, r1_16, v27, v28),  0LL),  a4,  a5,  CGPointZero.x,  CGPointZero.y,  v91.size.width,  v91.size.height,  r2,  a3);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v88,  v86,  r1,  v87,  0LL,  0LL,  *(void *)&a3);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image1",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v75,  v76,  v68,  v25,  0LL,  0LL,  *(void *)&a3);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image2",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v77,  v79,  v78,  r1_8,  0LL,  0LL,  *(void *)&a3);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image3",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  y,  width,  height,  v85,  v28,  r1_24,  r1_16,  0LL,  0LL,  *(void *)&a3);
  }

  else
  {
    double r2a = v72 * v71;
    float v32 = (a3 / v31 + -0.5) * 3.14159265;
    double v33 = (sinf(v32) + 1.0) * -0.5;
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:70.0 :110.0];
    double v66 = v34;
    double v35 = v33 + 1.0;
    [*(id *)((char *)&self->mBoxShadowBigTop + 1) randomFloatInRange:70.0 :110.0];
    double v67 = (v33 + 1.0) * v36;
    [a4 localAspectRatio];
    double v65 = v33 + 1.0;
    if (v37 >= 1.5)
    {
      double v43 = r1_16;
      double v39 = v87;
    }

    else
    {
      [a4 localAspectRatio];
      double v39 = v87 + (v86 + v38 * 0.5 - v87) * v35;
      [a4 localAspectRatio];
      double v74 = v74 - (v74 - (-(v72 * v17) - v40 * 0.5)) * v35;
      [a4 localAspectRatio];
      double r1_8 = r1_8 + (v79 + v41 * 0.5 - r1_8) * v35;
      [a4 localAspectRatio];
      double v43 = r1_16 - (r1_16 - (-(v72 * v71) - v42 * 0.5)) * v35;
    }

    v89.size.double width = v88;
    v89.origin.double x = -0.005 - v88 * 0.5;
    v89.origin.double y = v39;
    v89.size.double height = v86;
    v93.origin.double x = v27 * 0.5 + 0.005;
    v93.origin.double y = v43;
    v93.size.double width = v14 * 1.5 * v71;
    v93.size.double height = v72 * v71;
    CGRect v92 = CGRectUnion(v89, v93);
    double v50 = v92.size.width;
    double v51 = CGPointZero.y;
    double v52 = v92.size.width + v92.size.width * 0.425;
    double v53 = 2.0 - v92.size.height;
    [a4 localAspectRatio];
    double v55 = v51 + v54 * -0.01 + v53 * 0.5;
    double v56 = CGPointZero.x + (v52 - v50) * 0.5;
    double v57 = v39 + v55 + -0.13 + 0.096;
    double v58 = v43 + v55 + -0.06;
    [a4 localAspectRatio];
    if (v59 >= 1.5) {
      double v60 = v58;
    }
    else {
      double v60 = v58 + -0.066;
    }
    double v73 = v60;
    double v61 = -(v66 * v65);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  0LL,  *(MRImageProvider **)((char *)&self->mBoxShadowBigBottom + 1),  0LL,  a4,  a5,  v56 + -0.0149999997,  v57,  v52,  1.13,  v88,  v86,  r1,  v39,  *(void *)&v61,  0LL,  *(void *)&v80);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  0LL,  *(MRImageProvider **)((char *)&self->mBoxShadowBig + 1),  0LL,  a4,  a5,  v56,  v73,  v52,  0.94,  v85,  r2a,  r1_24,  v43,  *(void *)&v67,  0LL,  *(void *)&v80);
    double v62 = CGRectZero.origin.y;
    double v63 = CGRectZero.size.width;
    double v64 = CGRectZero.size.height;
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image0",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v62,  v63,  v64,  v88,  v86,  r1,  v39,  *(void *)&v61,  0LL,  *(void *)&v80);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image1",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v62,  v63,  v64,  v75,  v76,  v68,  v74,  *(void *)&v67,  0LL,  *(void *)&v80);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image2",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v62,  v63,  v64,  v77,  v79,  v78,  r1_8,  *(void *)&v61,  0LL,  *(void *)&v80);
    -[MREffectMapSlides renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:]( self,  "renderKey:shadow:shadowRect:size:position:xRot:tX:isPano:time:inContext:withArguments:",  @"image3",  0LL,  0LL,  a4,  a5,  CGRectZero.origin.x,  v62,  v63,  v64,  v85,  r2a,  r1_24,  v43,  *(void *)&v67,  0LL,  *(void *)&v80);
  }

- (void)renderKey:(id)a3 shadow:(id)a4 shadowRect:(CGRect)a5 size:(CGSize)a6 position:(CGPoint)a7 xRot:(double)a8 tX:(double)a9 isPano:(BOOL)a10 time:(double)a11 inContext:(id)a12 withArguments:(id)a13
{
  BOOL v15 = a10;
  double y = a7.y;
  double x = a7.x;
  double height = a6.height;
  double width = a6.width;
  double v19 = a5.size.height;
  double v20 = a5.size.width;
  double v21 = a5.origin.y;
  double v22 = a5.origin.x;
  if (a3)
  {
    id v25 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a12,  a13,  a11);
    [v25 setUsesBackgroundColorAsBorderColor:1];
    float v26 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v27 = (MRCroppingSprite *)[v26 objectForKey:a3];
    if (v27)
    {
      double v28 = v27;
    }

    else
    {
      double v28 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v26 setObject:v28 forKey:a3];
    }
  }

  else
  {
    double v28 = 0LL;
    id v25 = 0LL;
  }

  MRMatrix_Clear((uint64_t)v65);
  objc_msgSend(a12, "localAspectRatio", MRMatrix_Clear((uint64_t)v64));
  float v30 = -(y * v29);
  MRMatrix_Translate(v65, 0.0, v30, 0.0);
  float v31 = a8;
  MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v64, v31, 0.0, 0.0);
  objc_msgSend(a12, "localAspectRatio", MRMatrix_PostMultiply((uint64_t)v65, v64));
  float v33 = y * v32;
  *(float *)&double v34 = MRMatrix_Translate(v65, 0.0, v33, 0.0);
  objc_msgSend(a12, "composeModelViewMatrix:saveTo:", v65, v63, v34);
  [a12 setShader:@"PlainTexture"];
  if (a4)
  {
    id v35 = [a4 retainedByUserRenderedImageAtTime:a12 inContext:a13 withArguments:a11];
    double v36 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v37) = 0;
    float v38 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v36,  "initWithPosition:size:zRotation:innerRect:context:",  a12,  v22,  v21,  v20,  v19,  v37,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    double v39 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v40) = 0;
    float v41 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v39,  "initWithPosition:size:zRotation:innerRect:context:",  a12,  x,  y,  width,  height,  v40,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    -[MRTiledSprite subtractSprite:](v38, "subtractSprite:", v41);

    -[MRTiledSprite renderDumbImage:inContext:](v38, "renderDumbImage:inContext:", v35, a12);
    [v35 releaseByUser];
  }

  if (!a3)
  {
    [a12 unsetShader];
    [a12 restoreModelViewMatrix:v63];
    return;
  }

  [v25 aspectRatio];
  double v43 = v42;
  [a12 localAspectRatio];
  if (v15)
  {
    double v45 = width / (height / v44);
    if ((v43 >= 1.0 || v45 <= 1.0) && (v43 <= 1.0 || v45 >= 1.0))
    {
      double v46 = v43 / v45;
      double v47 = v45 / v43;
      double v48 = v43 < 1.0 ? v45 / v43 : v43 / v45;
      if (v48 >= 1.1)
      {
        [v25 centerX];
        double v60 = v49;
        [v25 centerY];
        double v51 = v50;
        if (v43 <= 2.0)
        {
          if (v43 < 0.5) {
            double v55 = 1.0 - v46;
          }
          else {
            double v55 = 0.0;
          }
          double mPhaseInDuration = self->super.mPhaseInDuration;
          double v54 = mPhaseInDuration + 0.25;
          if (mPhaseInDuration + 0.25 > a11)
          {
            double v55 = -v55;
            double v52 = v60;
            goto LABEL_35;
          }

          double v52 = v60;
          double v56 = v55;
        }

        else
        {
          double v52 = 1.0 - v47;
          double mPhaseInDuration = self->super.mPhaseInDuration;
          double v54 = mPhaseInDuration + 0.25;
          if (mPhaseInDuration + 0.25 > a11)
          {
            double v52 = -v52;
            double v55 = v51;
LABEL_35:
            objc_msgSend(v25, "setCenterX:", v52, v54);
            [v25 setCenterY:v55];
            double v59 = 1.0;
            if (v46 >= 1.0) {
              double v59 = v46;
            }
            [v25 setScale:v59];
            goto LABEL_38;
          }

          double v55 = v51;
          double v56 = 1.0 - v47;
        }

        double mMainDuration = self->super.mMainDuration;
        if (mPhaseInDuration + mMainDuration + -0.25 > a11)
        {
          float v58 = ((a11 - v54) / (mMainDuration + -0.5) + -0.5) * 3.14159274;
          double v52 = -(v56 - (sinf(v58) + 1.0) * 0.5 * (v56 + v56));
          double v55 = v43 <= 2.0 ? v52 : v51;
          double v54 = v60;
          if (v43 <= 2.0) {
            double v52 = v60;
          }
        }

        goto LABEL_35;
      }
    }
  }

- (void)_renderBigShadowForRect:(CGRect)a3 scale:(double)a4 rects:(id)a5 atTime:(double)a6 inContext:(id)a7 withArguments:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = [*(id *)((char *)&self->mSprites + 1) retainedByUserRenderedImageAtTime:a7 inContext:a8 withArguments:a6];
  double v16 = a4 + a4;
  [a7 localAspectRatio];
  double v18 = y + v17 * -0.01 + (v16 - height) * 0.5;
  double v19 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
  LODWORD(v20) = 0;
  double v21 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v19,  "initWithPosition:size:zRotation:innerRect:context:",  a7,  x + (width + width * 0.425 - width) * 0.5,  v18,  width + width * 0.425,  v16,  v20,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v22 = [a5 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      id v25 = 0LL;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(a5);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * (void)v25) CGRectValue];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        double v34 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
        LODWORD(v35) = 0;
        double v36 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v34,  "initWithPosition:size:zRotation:innerRect:context:",  a7,  v27,  v29,  v31,  v33,  v35,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
        -[MRTiledSprite subtractSprite:](v21, "subtractSprite:", v36);

        id v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [a5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v23);
  }

  [a7 setShader:@"PlainTexture"];
  -[MRTiledSprite renderDumbImage:inContext:](v21, "renderDumbImage:inContext:", v15, a7);
  [a7 unsetShader];

  [v15 releaseByUser];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    float v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            float v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (id)-1)
          {
            float v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectMapSlides *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
}

@end