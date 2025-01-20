@interface MREffectHangingPictures
+ (BOOL)hasCustomTiming;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectHangingPictures *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectHangingPictures)initWithEffectID:(id)a3;
- (double)_buildScenarioWithCountOfSlides:(unint64_t)a3 aspectRatios:(double *)a4;
- (double)_updateSlideTimings;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_applyTimingToSlideProviders;
- (void)_applyTimingToSmallSlideProviders;
- (void)_cleanup;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectHangingPictures

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectHangingPictures;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform mediump vec2 borderSize, invRadii; \n\t\tuniform BOOL isDoubleBreak, isLandscape; \n\t\tvarying mediump vec2 borderAlphaXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tmediump vec2 inSpriteCoordinates = aInSpriteCoordinates; \n\t\t\tif (isDoubleBreak) { \n\t\t\t\t\tif (isLandscape) { \n\t\t\t\t\t\t\tif (inSpriteCoordinates.x < .1) \n\t\t\t\t\t\t\t\tinSpriteCoordinates.x = inSpriteCoordinates.x * 2.; \n\t\t\t\t\t\t\telse if (inSpriteCoordinates.x > .9) \n\t\t\t\t\t\t\t\tinSpriteCoordinates.x = 1. - (1. - inSpriteCoordinates.x) * 2.; \n\t\t\t\t\t\t} \n\t\t\t\t\telse { \n\t\t\t\t\t\t\tif (inSpriteCoordinates.y < .1) \n\t\t\t\t\t\t\t\tinSpriteCoordinates.y = inSpriteCoordinates.y * 2.; \n\t\t\t\t\t\t\telse if (inSpriteCoordinates.y > .9) \n\t\t\t\t\t\t\t\tinSpriteCoordinates.y = 1. - (1. - inSpriteCoordinates.y) * 2.; \n\t\t\t\t\t\t} \n\t\t\t\t} \n\t\t\tvTextureCoordinates1 = (uTextureMatrix1 * vec4(inSpriteCoordinates, 0., 1.)).st; \n\t\t\tmediump vec2 relP = (abs(aInSpriteCoordinates + aInSpriteCoordinates - 1.) - (1. - 2. * borderSize)); \n\t\t\tborderAlphaXY = relP * invRadii;/*1. - relP * invRadii;*/ \n\t\t} \n\t\t",
    @"VertexHangingPicturesSlideBorder");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1_2D; /* frame */ \n\t\tvarying mediump vec2 borderAlphaXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tlowp float borderAlpha = max(borderAlphaXY.x, borderAlphaXY.y); \n\t\t\tgl_FragColor = mix(color, SampleTexture1_2D, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexHangingPicturesSlideBorder",
    @"HangingPicturesSlideBorder");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = SampleTexture0_2D; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"HangingPicturesRope");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tuniform BOOL isDoubleBreak, isLandscape; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tif (isDoubleBreak) { \n\t\t\t\t\tif (isLandscape) { \n\t\t\t\t\t\t\tif (vTextureCoordinates0.x < .1) \n\t\t\t\t\t\t\t\tvTextureCoordinates0.x = vTextureCoordinates0.x * 2.; \n\t\t\t\t\t\t\telse if (vTextureCoordinates0.x > .9) \n\t\t\t\t\t\t\t\tvTextureCoordinates0.x = 1. - (1. - vTextureCoordinates0.x) * 2.; \n\t\t\t\t\t\t} \n\t\t\t\t\telse { \n\t\t\t\t\t\t\tif (vTextureCoordinates0.y < .1) \n\t\t\t\t\t\t\t\tvTextureCoordinates0.y = vTextureCoordinates0.y * 2.; \n\t\t\t\t\t\t\telse if (vTextureCoordinates0.y > .9) \n\t\t\t\t\t\t\t\tvTextureCoordinates0.y = 1. - (1. - vTextureCoordinates0.y) * 2.; \n\t\t\t\t\t\t} \n\t\t\t\t} \n\t\t} \n\t\t",
    @"VertexTexture0-");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture0-",
    @"PlainTexture2D-");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0_2D; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0_2D; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexTexture0-",
    @"PlainTextureNoColor2D-");
}

- (MREffectHangingPictures)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectHangingPictures;
  v3 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:", a3);
  if (v3)
  {
    id v4 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 185),  "setAssetPath:",  objc_msgSend(v4, "resourcePathForEffectID:andResource:", *((void *)v3 + 4), @"rope.jpg"));
    objc_msgSend(*(id *)(v3 + 185), "setOriginalImageSize:", 300.0, 1440.0);
    objc_msgSend(*(id *)(v3 + 185), "setDefaultSize:", 300.0, 1440.0);
    [*(id *)(v3 + 185) setWantsMipmap:1];
    [*(id *)(v3 + 185) setWantsPowerOfTwo:1];
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 193),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"photoPaperHiDPI-DogEarLeft.png"));
    objc_msgSend(*(id *)(v3 + 193), "setOriginalImageSize:", 2045.0, 2045.0);
    [*(id *)(v3 + 193) setWantsMipmap:1];
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 201),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"photoPaperHiDPI-DogEarRight.png"));
    objc_msgSend(*(id *)(v3 + 201), "setOriginalImageSize:", 2045.0, 2045.0);
    [*(id *)(v3 + 201) setWantsMipmap:1];
    *(void *)(v3 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 209),  "setAssetPath:",  objc_msgSend( v4,  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"photoPaperHiDPI-NoDogEar.png"));
    objc_msgSend(*(id *)(v3 + 209), "setOriginalImageSize:", 2045.0, 2045.0);
    [*(id *)(v3 + 209) setWantsMipmap:1];
    *(void *)(v3 + 217) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 217),  "setAssetPath:",  objc_msgSend(v4, "resourcePathForEffectID:andResource:", *((void *)v3 + 4), @"photoPaperHiDPI-Break.png"));
    objc_msgSend(*(id *)(v3 + 217), "setOriginalImageSize:", 2045.0, 2045.0);
    [*(id *)(v3 + 217) setWantsMipmap:1];
    *(void *)(v3 + 265) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v3 + 225) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 233) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return (MREffectHangingPictures *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mRopeImageProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mRopeImageProvider + 1) = 0LL;
  [*(id *)((char *)self->mPhotoFrameImageProviders + 1) cleanup];

  *(MRImageProvider **)((char *)self->mPhotoFrameImageProviders + 1) = 0LL;
  [*(id *)((char *)&self->mPhotoFrameImageProviders[1] + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mPhotoFrameImageProviders[1] + 1) = 0LL;
  [*(id *)((char *)&self->mPhotoFrameImageProviders[2] + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mPhotoFrameImageProviders[2] + 1) = 0LL;
  *(double *)((char *)&self->mBaseStillDuration + 1) = 0.0;

  *(MRImageProvider **)((char *)&self->mPhotoFrameImageProviders[3] + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
}

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  v9 = -[MREffectHangingPictures initWithEffectID:]( objc_alloc(&OBJC_CLASS___MREffectHangingPictures),  "initWithEffectID:",  a3);
  -[MREffect setAttributes:](v9, "setAttributes:", a4);
  -[MREffectHangingPictures setPhaseInDuration:mainDuration:phaseOutDuration:]( v9,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v9->super.mDefaultPhaseInDuration,  v9->super.mDefaultMainDuration,  v9->super.mDefaultPhaseOutDuration);
  id v10 = [a5 count];
  else {
    uint64_t v11 = (uint64_t)v10;
  }
  if (v11)
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      objc_msgSend( objc_msgSend(objc_msgSend(a5, "objectAtIndex:", i), "objectForKey:", @"aspectRatio"),  "floatValue");
      v15[i] = v13;
    }
  }

  -[MREffectHangingPictures _buildScenarioWithCountOfSlides:aspectRatios:]( v9,  "_buildScenarioWithCountOfSlides:aspectRatios:",  v11,  v15);
  return v9;
}

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  return *(double *)((char *)&(&self->mSmallSlideProviders)[6 * a3] + 1);
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  return *(double *)((char *)&(&self->mSmallSlideProviders)[6 * a3 + 2] + 1);
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lowestDisplayTime
{
  return 0.0;
}

- (void)_applyTimingToSlideProviders
{
  objc_super v2 = self;
  v3 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  if (-[NSDictionary count](v3, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      id v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", ImageKey(v4));
      [v5 setShowTime:*(double *)((char *)&v2->mSlideTimings[0].startTime + 1)];
      objc_msgSend( v5,  "setShowDuration:",  *(double *)((char *)&v2->mSlideTimings[0].displayTime + 1)
      + 2.0
      - *(double *)((char *)&v2->mSlideTimings[0].startTime + 1));
      ++v4;
      objc_super v2 = (MREffectHangingPictures *)((char *)v2 + 48);
    }

    while (v4 < -[NSDictionary count](v3, "count"));
  }

- (void)_applyTimingToSmallSlideProviders
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = *(void **)((char *)&self->mBaseStillDuration + 1);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      v9 = (char *)self + 48 * v6;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v8);
        [v10 setShowTime:*(double *)(v9 + 273)];
        [v10 setShowDuration:*(double *)(v9 + 305) - *(double *)(v9 + 273)];
        v8 = (char *)v8 + 1;
        v9 += 48;
      }

      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v6 += (uint64_t)v8;
    }

    while (v5);
  }

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectHangingPictures;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v6,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
  if (*(NSString **)((char *)&self->mCurrentMainSlideKey + 1))
  {
    -[MREffectHangingPictures _updateSlideTimings](self, "_updateSlideTimings");
    -[MREffectHangingPictures _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
    -[MREffectHangingPictures _applyTimingToSmallSlideProviders](self, "_applyTimingToSmallSlideProviders");
  }

- (void)setPixelSize:(CGSize)a3
{
  double width = a3.width;
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___MREffectHangingPictures;
    -[MREffect setPixelSize:](&v22, "setPixelSize:", a3.width, a3.height);
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.0199999996,  p_mPixelSize->width * 0.0199999996 * 4.80000019);
    objc_msgSend(*(id *)((char *)&self->mRopeImageProvider + 1), "setDefaultSize:", width * 0.75, width * 0.5);
    objc_msgSend(*(id *)((char *)self->mPhotoFrameImageProviders + 1), "setDefaultSize:", width * 0.75, width * 0.5);
    objc_msgSend(*(id *)((char *)&self->mPhotoFrameImageProviders[1] + 1), "setDefaultSize:", width * 0.75, width * 0.5);
    objc_msgSend(*(id *)((char *)&self->mPhotoFrameImageProviders[2] + 1), "setDefaultSize:", width * 0.75, width * 0.5);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v7 = *(void **)((char *)&self->mBaseStillDuration + 1);
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          __int128 v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          [v12 imageAspectRatio];
          BOOL v14 = v13 < 1.0;
          if (v13 >= 1.0) {
            double v15 = 0.15;
          }
          else {
            double v15 = 0.1;
          }
          double v16 = width * v15;
          if (v14) {
            double v17 = 0.15;
          }
          else {
            double v17 = 0.1;
          }
          objc_msgSend(v12, "setDefaultSize:", v16, width * v17);
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v9);
    }
  }

- (double)_buildScenarioWithCountOfSlides:(unint64_t)a3 aspectRatios:(double *)a4
{
  id v4 = (NSString *)(&dword_8 + 2);
  if (a3 < 0xA) {
    id v4 = (NSString *)a3;
  }
  *(NSString **)((char *)&self->mCurrentMainSlideKey + 1) = v4;
  if (!v4) {
    return 0.0;
  }
  id v7 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  self->mScenario[2] = 1;
  if (*(NSString **)((char *)&self->mCurrentMainSlideKey + 1) != (NSString *)((char *)&dword_0 + 1))
  {
    uint64_t v9 = 0LL;
    id v8 = 0LL;
    double v15 = a4 + 1;
    uint64_t v16 = 313LL;
    while (1)
    {
      double v17 = *(v15 - 1);
      if (v17 >= 3.0)
      {
        float v20 = v17 / 1.5;
        __int128 v19 = (objc_class *)vcvtps_u32_f32(v20);
      }

      else
      {
        float v18 = 1.0 / v17;
        __int128 v19 = (objc_class *)vcvtps_u32_f32(v18);
        if (v17 > 0.454545455) {
          __int128 v19 = (objc_class *)(&dword_0 + 1);
        }
      }

      *(Class *)((char *)&self->super.super.isa + v16) = v19;
      if (v17 >= 2.0 || v17 <= 0.5 || (double v21 = *v15, *v15 >= 2.0) || v21 <= 0.5 || v17 >= 1.0 == v21 < 1.0)
      {
        *((_BYTE *)v8 + (void)&self->mSlideTimings[9].countOfSegments + 1) = 0;
      }

      else
      {
        if (!v8)
        {
          BYTE1(self->mSlideTimings[9].countOfSegments) = 1;
LABEL_30:
          v9 += 1 << (char)v8;
          goto LABEL_27;
        }

        objc_super v22 = (char *)v8 + (void)self + 753;
        int v23 = *(v22 - 1);
        *objc_super v22 = v23 ^ 1;
        if (!v23) {
          goto LABEL_30;
        }
      }

      ++self->mScenario[2];
LABEL_27:
      id v8 = (NSString *)((char *)v8 + 1);
      ++v15;
      v16 += 48LL;
    }
  }

  id v8 = 0LL;
  uint64_t v9 = 0LL;
LABEL_6:
  double v10 = a4[(void)v8];
  if (v10 >= 3.0)
  {
    float v24 = v10 / 1.5;
    double v13 = (NSMutableArray *)vcvtps_u32_f32(v24);
  }

  else
  {
    BOOL v11 = v10 > 0.454545455;
    float v12 = 1.0 / v10;
    double v13 = (NSMutableArray *)vcvtps_u32_f32(v12);
    if (v11) {
      double v13 = (NSMutableArray *)(&dword_0 + 1);
    }
  }

  *(NSMutableArray **)((char *)&(&self->mSmallSlideProviders)[6 * (void)v8 + 5] + 1) = v13;
  unsigned int v25 = self->mScenario[2];
  BOOL v26 = v25 > 6;
  if (v25 >= 7 && v9 != 146)
  {
    while (1)
    {
      do
      {
        unint64_t v27 = (unint64_t)[v7 randomInt];
        uint64_t v28 = *(uint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
        unint64_t v29 = v27 % (v28 - 1);
        v30 = (char *)&self->mSlideTimings[9].countOfSegments + 1;
      }

      while (*((_BYTE *)&self->mSlideTimings[9].countOfSegments + v29 + 1));
      if ((!v29 || !v30[v29 - 1]) && (v29 >= v28 - 2 || !v30[v29 + 1]))
      {
        v30[v29] = 1;
        BOOL v31 = self->mScenario[2];
        unsigned int v32 = v31 - 1;
        self->mScenario[2] = v31 - 1;
        BOOL v26 = (v31 - 1) > 6;
        if (v32 < 7) {
          break;
        }
        v9 += 1 << v29;
        if (v9 == 146) {
          break;
        }
      }
    }
  }

  if (v26)
  {
    BYTE6(self->mSlideTimings[9].countOfSegments) = 1;
    WORD2(self->mSlideTimings[9].countOfSegments) = 1;
    self->mScenario[2] = 6;
  }

  if (self->super.mMainDuration == 0.0)
  {
    self->super.mPhaseInDuration = self->super.mDefaultPhaseInDuration;
    self->super.mMainDuration = self->super.mDefaultMainDuration;
    self->super.mPhaseOutDuration = self->super.mDefaultPhaseOutDuration;
  }

  *(_WORD *)&self->mScenario[3] = 0;
  if (self->mScenario[2])
  {
    int v33 = 0;
    __int16 v34 = 0;
    uint64_t v35 = 0LL;
    unint64_t v36 = 0LL;
    do
    {
      if (*(NSMutableArray **)((char *)&(&self->mSmallSlideProviders)[6 * v35 + 5] + 1) <= (NSMutableArray *)((char *)&dword_0 + 2))
      {
        uint64_t v37 = (uint64_t)[v7 randomInt] % 3;
        __int16 v34 = *(_WORD *)&self->mScenario[3];
      }

      else
      {
        LOBYTE(v37) = 3;
      }

      v34 |= (v37 << v33) | (unsigned __int16)(1 << (15 - v37));
      *(_WORD *)&self->mScenario[3] = v34;
      ++v36;
      v35 += *((unsigned __int8 *)&self->mSlideTimings[9].countOfSegments + v35 + 1) + 1LL;
      v33 += 2;
    }

    while (v36 < self->mScenario[2]);
  }

  -[MREffectHangingPictures _updateSlideTimings](self, "_updateSlideTimings");
  double v39 = v38;
  -[MREffectHangingPictures _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
  -[MREffectHangingPictures _applyTimingToSmallSlideProviders](self, "_applyTimingToSmallSlideProviders");
  return v39;
}

- (double)_updateSlideTimings
{
  uint64_t v2 = *(uint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
  if (v2)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    id v5 = (double *)((char *)&self->mSlideTimings[0].endTime + 1);
    double v6 = 0.0;
    uint64_t v7 = *(uint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
    do
    {
      double v6 = v6 + 2.0;
      *(v5 - 5) = 0.0;
      *(v5 - 1) = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
      double v8 = *v5;
      if (*(void *)v5 < 3uLL)
      {
        ++v3;
      }

      else
      {
        double v6 = v6 + (double)(unint64_t)(*(void *)&v8 - 2LL) * 2.0;
        uint64_t v4 = v4 + *(void *)&v8 - 1;
      }

      v5 += 6;
      --v7;
    }

    while (v7);
  }

  else
  {
    uint64_t v4 = 0LL;
    unint64_t v3 = 0LL;
    double v6 = 0.0;
  }

  double v9 = (self->super.mPhaseInDuration + self->super.mMainDuration - v6)
     / ((double)v3 + (double)(unint64_t)v4 * 0.6);
  *(double *)((char *)&self->mCountOfSlides + 1) = v9;
  if (!v2) {
    return self->super.mPhaseOutDuration + 0.0;
  }
  unint64_t v10 = 0LL;
  BOOL v11 = 0LL;
  float v12 = (char *)&self->mSmallSlideProviders + 1;
  double v13 = 0.0;
  do
  {
    BOOL v14 = v11;
    BOOL v11 = (double *)v12;
    *((double *)v12 + 1) = v13;
    if (v14) {
      v14[3] = v13;
    }
    double v15 = v13 + 2.0;
    *((double *)v12 + 2) = v15 + 0.5;
    unint64_t v16 = *((void *)v12 + 5);
    if (v16 < 3) {
      double v17 = *(double *)((char *)&self->mCountOfSlides + 1);
    }
    else {
      double v17 = (double)(v16 - 2) + (double)(v16 - 2) + v9 * 0.6 * (double)(v16 - 1);
    }
    double v13 = v15 + v17;
    if (*((_BYTE *)&self->mSlideTimings[9].countOfSegments + v10 + 1))
    {
      v11[4] = v13 + 2.0;
      if (v10 < v2 - 1) {
        v11[6] = v13;
      }
    }

    ++v10;
    float v12 = (char *)(v11 + 6);
  }

  while (v2 != v10);
  double result = v13 + self->super.mPhaseOutDuration;
  v11[3] = result;
  return result;
}

- (BOOL)isLoadedForTime:(double)a3
{
  unsigned int v5 = [*(id *)(&self->super._isInInteractiveMode + 1) isLoaded];
  __int16 v6 = *(_WORD *)&self->mScenario[3];
  if (v6 < 0)
  {
    v5 &= [*(id *)((char *)&self->mRopeImageProvider + 1) isLoaded];
    __int16 v6 = *(_WORD *)&self->mScenario[3];
    if ((v6 & 0x4000) == 0)
    {
LABEL_3:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->mScenario[3] & 0x4000) == 0)
  {
    goto LABEL_3;
  }

  v5 &= [*(id *)((char *)self->mPhotoFrameImageProviders + 1) isLoaded];
  __int16 v6 = *(_WORD *)&self->mScenario[3];
  if ((v6 & 0x2000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mNeedsToUpdateSlides)
  {
    self->super.mNeedsToUpdateSlides = 0;
    id v9 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    unint64_t v10 = -[NSDictionary count](v9, "count");
    if (v10 >= 0xA) {
      uint64_t v11 = 10LL;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v11)
    {
      for (int64_t i = 0LL; i != v11; ++i)
      {
        objc_msgSend(-[NSDictionary objectForKey:](v9, "objectForKey:", ImageKey(i)), "imageAspectRatio");
        v66[i] = v13;
      }
    }

    -[MREffectHangingPictures _buildScenarioWithCountOfSlides:aspectRatios:]( self,  "_buildScenarioWithCountOfSlides:aspectRatios:",  v11,  v66);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    double v14 = *(void **)((char *)&self->mBaseStillDuration + 1);
    id v15 = [v14 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v61;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v60 + 1) + 8 * (void)j) cleanup];
        }

        id v16 = [v14 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }

      while (v16);
    }

    [*(id *)((char *)&self->mBaseStillDuration + 1) removeAllObjects];
    if (v11)
    {
      int64_t v19 = 0LL;
      uint64_t v54 = 12LL;
      double width = self->super.mPixelSize.width;
      double v21 = width * 0.15;
      double v22 = width * 0.1;
      do
      {
        id v23 = -[NSDictionary objectForKey:](v9, "objectForKey:", ImageKey(v19));
        float v24 = -[MRSlideProvider initWithEffectLayer:]( objc_alloc(&OBJC_CLASS___MRSlideProvider),  "initWithEffectLayer:",  self->super.mEffectLayer);
        [v23 imageAspectRatio];
        BOOL v26 = v25 < 1.0;
        double v27 = v21;
        double v28 = v22;
        if (v26)
        {
          Class v29 = (&self->super.super.isa)[v54];
          double v27 = *(double *)&v29 * 0.1;
          double v28 = *(double *)&v29 * 0.15;
        }

        -[MRSlideProvider setDefaultSize:](v24, "setDefaultSize:", v27, v28, v54 * 8);
        -[MRSlideProvider setSlide:](v24, "setSlide:", [v23 slide]);
        [*(id *)((char *)&self->mBaseStillDuration + 1) addObject:v24];

        ++v19;
      }

      while (v11 != v19);
    }

    -[MREffectHangingPictures _applyTimingToSmallSlideProviders](self, "_applyTimingToSmallSlideProviders");
  }

  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___MREffectHangingPictures;
  -[MREffect prerenderForTime:inContext:withArguments:](&v59, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  [*(id *)(&self->super._isInInteractiveMode + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mRopeImageProvider + 1) setJustHoldIt:(*(unsigned __int16 *)&self->mScenario[3] >> 15) ^ 1u];
  [*(id *)((char *)&self->mRopeImageProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)self->mPhotoFrameImageProviders + 1) setJustHoldIt:(*(_WORD *)&self->mScenario[3] & 0x4000) == 0];
  [*(id *)((char *)self->mPhotoFrameImageProviders + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mPhotoFrameImageProviders[1] + 1) setJustHoldIt:(*(_WORD *)&self->mScenario[3] & 0x2000) == 0];
  [*(id *)((char *)&self->mPhotoFrameImageProviders[1] + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mPhotoFrameImageProviders[2] + 1) setJustHoldIt:(*(_WORD *)&self->mScenario[3] & 0x1000) == 0];
  [*(id *)((char *)&self->mPhotoFrameImageProviders[2] + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  v30 = *(void **)((char *)&self->mBaseStillDuration + 1);
  id v31 = [v30 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v56;
    do
    {
      for (k = 0LL; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)k);
        objc_msgSend(v35, "updateStuffWithAssetManager:", objc_msgSend(a4, "assetManager"));
        [v35 prerenderForTime:a4 inContext:a5 withArguments:a3];
      }

      id v32 = [v30 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }

    while (v32);
  }

  if (!-[MRLayer isActivated](self->super.mEffectLayer, "isActivated")
    || self->super.mPhaseInDuration + self->super.mMainDuration <= a3)
  {
    return 1;
  }

  unint64_t v36 = *(unint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
  if (v36)
  {
    if (*(double *)((char *)&self->mSlideTimings[0].displayTime + 1) >= a3)
    {
      uint64_t v41 = 0LL;
      BOOL v43 = 1;
    }

    else
    {
      uint64_t v37 = (double *)((char *)&self->mSlideTimings[1].displayTime + 1);
      uint64_t v38 = 1LL;
      while (1)
      {
        unint64_t v39 = v38;
        if (v36 == v38) {
          break;
        }
        double v40 = *v37;
        v37 += 6;
        ++v38;
        if (v40 >= a3)
        {
          uint64_t v41 = v39;
          goto LABEL_40;
        }
      }

      uint64_t v41 = *(uint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
LABEL_40:
      BOOL v43 = v39 < v36;
    }

    uint64_t v42 = v36 - 1;
    if (!v43) {
      uint64_t v41 = v42;
    }
  }

  else
  {
    uint64_t v42 = -1LL;
    uint64_t v41 = -1LL;
  }

  v44 = (double *)((char *)&(&self->mSmallSlideProviders)[6 * v41] + 1);
  double v45 = v44[1] + 2.0;
  double v46 = v45 + 1.0;
  double v47 = 0.0;
  if (v45 + 1.0 <= a3)
  {
    double v45 = v44[3];
    if (*(NSMutableArray **)((char *)&(&self->mSmallSlideProviders)[6 * v41 + 5] + 1) < (NSMutableArray *)((char *)&dword_0 + 3))
    {
LABEL_51:
      if (v45 >= a3) {
        double v47 = v45 - a3;
      }
      goto LABEL_53;
    }

    double v48 = *(double *)((char *)&self->mCountOfSlides + 1);
    double v46 = v46 + v48 * 0.6 + -1.0;
    if (v46 > a3)
    {
      double v47 = v46 - a3;
      goto LABEL_53;
    }

    double v46 = v45 + v48 * -0.6;
    if (v46 < a3)
    {
      double v46 = 0.5;
      if (v41 == v42) {
        double v46 = 1.0;
      }
      double v45 = v45 - v46;
      goto LABEL_51;
    }
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v169 = v8;
  if (v8 < 0.06) {
    return;
  }
  [a4 depthTest:1];
  [a4 clear:2];
  [a4 cull:2];
  if ((byte_2B0480 & 1) == 0)
  {
    unsigned int v11 = 0;
    float v12 = (char *)&unk_2AE680;
    __asm { FMOV            V2.4S, #15.0 }

    v17.i64[0] = 0x400000004LL;
    v17.i64[1] = 0x400000004LL;
    do
    {
      uint64_t v18 = 0LL;
      v9.f32[0] = (float)v11 * 0.54412;
      *(float *)v10.i32 = v9.f32[0] + 0.54412;
      int32x4_t v19 = vdupq_lane_s32(*(int32x2_t *)v9.f32, 0);
      int32x4_t v20 = vdupq_lane_s32(*(int32x2_t *)v10.i8, 0);
      int32x4_t v10 = (int32x4_t)xmmword_1F6D30;
      do
      {
        double v21 = (float *)&v12[v18];
        float32x4_t v9 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)v10), _Q2);
        float32x4_t v22 = v9;
        vst4q_f32(v21, *(float32x4x4_t *)v9.f32);
        int32x4_t v10 = vaddq_s32(v10, v17);
        v18 += 64LL;
      }

      while (v18 != 256);
      ++v11;
      v12 += 256;
    }

    while (v11 != 30);
    byte_2B0480 = 1;
  }

  bzero(v189, 0x300uLL);
  unint64_t v23 = *(unint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
  float v24 = (char *)&self->mSmallSlideProviders + 1;
  id v180 = a4;
  v162 = (char *)&self->mSmallSlideProviders + 1;
  if (v23 < 2)
  {
    unsigned int v181 = 0;
    int v179 = 0;
    int v171 = 0;
    double v31 = *(double *)((char *)&self->mSlideTimings[0].startTime + 1);
LABEL_21:
    double v32 = 0.0;
    goto LABEL_22;
  }

  uint64_t v25 = 0LL;
  unsigned int v26 = 0;
  int v179 = 0;
  int v27 = 0;
  uint64_t v28 = 297LL;
  while (*(double *)((char *)&self->super.super.isa + v28) < a3)
  {
    _ZF = *((_BYTE *)&self->mSlideTimings[9].countOfSegments + ++v25) == 0;
    int v30 = v179;
    if (_ZF)
    {
      int v27 = v179;
      int v30 = v25;
    }

    int v179 = v30;
    if (_ZF) {
      ++v26;
    }
    v28 += 48LL;
    if (v23 == v25)
    {
      uint64_t v25 = *(uint64_t *)((char *)&self->mCurrentMainSlideKey + 1);
      break;
    }
  }

  double v31 = *(double *)&v24[48 * v179 + 8];
  unsigned int v181 = v26;
  if (!(_DWORD)v25)
  {
    int v171 = 0;
    goto LABEL_21;
  }

  int v171 = v25;
  double v32 = a3 - *(double *)&v24[48 * v27 + 8];
LABEL_22:
  double v168 = v32;
  double v33 = a3 - self->super.mPhaseInDuration - self->super.mMainDuration;
  uint64_t v34 = self->mScenario[2];
  if (self->mScenario[2])
  {
    unint64_t v35 = 0LL;
    unsigned int v36 = 0;
    char v37 = v23 - 1;
    do
    {
      char v38 = v36;
      if (v35 == v181)
      {
        char v40 = v37;
        if (v33 < 0.0)
        {
          char v40 = v38;
          if (v171 > v179)
          {
            float v41 = a3 - *(double *)&v162[48 * v171 + 8];
            float v42 = v41 * 9.42477796;
          }
        }
      }

      else if (v35 >= v181)
      {
        char v40 = v38;
      }

      else
      {
        char v40 = v36 - 1;
      }

      v184[++v35] = v40;
    }

    while (v35 != v34);
  }

  if (v33 >= 0.0)
  {
    MRMatrix_Clear((uint64_t)v187);
    float v43 = v33 * v33 * 17.0;
    *(float *)&double v44 = MRMatrix_Translate(v187, 0.0, v43, 0.0);
    objc_msgSend(v180, "composeModelViewMatrix:saveTo:", v187, v188, v44);
  }

  double v173 = a3 - v31;
  id v45 = [*(id *)(&self->super._isInInteractiveMode + 1) retainedByUserRenderedImageAtTime:v180 inContext:a5 withArguments:a3];
  [v45 setClampMode:3];
  [v180 setShader:@"HangingPicturesRope"];
  LODWORD(v46) = 0;
  v160 = v45;
  [v45 setOnContext:v180 onTextureUnit:0 withReferenceAspectRatio:v184 state:v46];
  id v167 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"breakInformation");
  unsigned int v47 = v181;
  if (self->mScenario[2])
  {
    unint64_t v48 = 0LL;
    unint64_t v49 = 0LL;
    uint64_t v50 = 28LL * v181;
    uint64_t v161 = 28LL * (v181 - 1);
    v164 = &flt_1F6D40[v181 + 1];
    id v51 = &v190;
    double v52 = 1.0;
    double v165 = v33;
    double v166 = a3;
    uint64_t v178 = v50;
    while (1)
    {
      BOOL v176 = v50 == v48;
      int64_t v53 = v184[v49 + 1];
      uint64_t v54 = ImageKey(v53);
      float v55 = flt_1F6E90[(int)(v181 + 1) + v48 / 4];
      if (v55 > -1.0 && (v169 <= self->super.mPhaseInDuration ? (BOOL v56 = v50 == v48) : (BOOL v56 = 1), v56)) {
        id v57 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v54);
      }
      else {
        id v57 = [*(id *)((char *)&self->mBaseStillDuration + 1) objectAtIndex:v53];
      }
      __int128 v58 = v57;
      id v59 = [v57 retainedByUserRenderedImageAtTime:v180 inContext:a5 withArguments:a3];
      unsigned __int8 v60 = [v59 scaleWasFixedForTargetAspectRatio];
      if ((v60 & 1) != 0) {
        [v59 aspectRatio];
      }
      else {
        [v58 imageAspectRatio];
      }
      double v62 = v61;
      [v59 releaseByUser];
      BOOL v175 = v62 >= v52;
      double v63 = flt_1F6F50[v49];
      double v64 = v173 - v63;
      if (v173 - v63 < 0.0) {
        double v64 = 0.0;
      }
      double v183 = v64;
      id v65 = [v167 objectForKey:v54];
      double v177 = v63;
      if ((v60 & 1) != 0)
      {
        *((_BYTE *)v51 + 30) = 0;
        unint64_t v66 = 1LL;
        uint64_t v67 = 28LL * v181;
      }

      else
      {
        BOOL v68 = v62 < 2.0 && v62 > 0.5;
        uint64_t v67 = 28LL * v181;
        BOOL v69 = !v68
           && objc_msgSend(objc_msgSend(v65, "objectForKey:", @"panEndDirection"), "intValue") == -1;
        *((_BYTE *)v51 + 30) = v69;
        unint64_t v66 = *(void *)&v162[48 * v53 + 40];
      }

      BOOL v70 = v62 >= v52;
      BOOL v71 = v66 > 2;
      if (v70 && v71) {
        double v72 = 0.007;
      }
      else {
        double v72 = 0.011;
      }
      if (v70 && v71) {
        double v73 = 0.0035;
      }
      else {
        double v73 = 0.007;
      }
      double v170 = v72;
      if (v67 == v48) {
        double v74 = v72;
      }
      else {
        double v74 = v73;
      }
      double v75 = ComputeSpriteSize(v70, v67 == v48, v62);
      double v77 = v76;
      double v172 = v75;
      *(double *)(v51 - 23) = v75;
      *(double *)(v51 - 21) = v76;
      float v78 = v164[v48 / 4];
      else {
        float v79 = v164[v48 / 4];
      }
      *((float *)v51 - 19) = v79;
      float v174 = flt_1F6DE8[(int)(v181 + 1) + v48 / 4];
      *((float *)v51 - 17) = v55;
      float v80 = flt_1F6E90[(int)v181 + v48 / 4];
      float v81 = flt_1F6D40[(int)v181 + v48 / 4];
      float v82 = atan2f(v55 - v80, v78 - v81);
      float v83 = v55;
      float v84 = v82;
      *((float *)v51 - 11) = v82;
      float v85 = v74;
      double v52 = 1.0;
      *((float *)v51 - 16) = v85;
      double v86 = (v77 + 1.0) * 0.5;
      if (v86 > 1.0) {
        double v86 = 1.0;
      }
      if (v67 != v48 || !v70) {
        double v86 = 1.0;
      }
      double v87 = v183;
      if (v183 >= 1.0)
      {
        a3 = v166;
        int v91 = v171;
        BOOL v96 = v176;
        BOOL v97 = v175;
        float v98 = v174;
        goto LABEL_98;
      }

      double v163 = v86;
      float v88 = -((v183 * -2.0 + 3.0) * v183) * v183 + 1.0;
      float v89 = flt_1F6DE8[(int)v181 + v48 / 4];
      *((float *)v51 - 19) = v79 + (float)(v88 * (float)(v81 - v79));
      *((float *)v51 - 17) = v83 + (float)(v88 * (float)(v80 - v83));
      double v90 = v88;
      int v91 = v171;
      if ((v161 == v48) != (v67 == v48))
      {
        double v92 = v170;
        if (v161 != v48) {
          double v92 = v73;
        }
        float v93 = v85 + v90 * (v92 - v85);
        *((float *)v51 - 16) = v93;
      }

      if ((int)v181 < 1)
      {
        float v95 = 0.0;
      }

      else
      {
        float v94 = v89;
        float v95 = atan2f(v80 - flt_1F6E90[v181 - 1 + v48 / 4], v81 - flt_1F6D40[v181 - 1 + v48 / 4]);
        float v89 = v94;
        double v87 = v183;
      }

      a3 = v166;
      BOOL v96 = v176;
      float v99 = v95 - v84;
      double v100 = v99;
      if (v99 > 3.14159265) {
        break;
      }
      if (v100 < -3.14159265)
      {
        double v101 = 6.28318531;
        goto LABEL_91;
      }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = *(MRImageProvider **)((char *)&self->mPhotoFrameImageProviders[3] + 1);
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    unsigned int v11 = 0LL;
    uint64_t v12 = *(void *)v23;
    while (1)
    {
      for (int64_t i = 0LL; i != v10; int64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v15 = [*(id *)((char *)&self->mPhotoFrameImageProviders[3] + 1) objectForKey:v14];
        id v16 = [*(id *)((char *)&self->mSprites + 1) objectForKey:v14];
        if (v16)
        {
          MRMatrix_Invert((float *)[v16 bytes], v27);
          MRMatrix_MultiplyWithMatrix(a4, v27, v26);
          if (v15)
          {
            if (objc_msgSend(v15, "hitAtPoint:withInverseMatrix:localPoint:", v26, &v21, x, y))
            {
              if (!v11)
              {
                if (a5) {
LABEL_16:
                }
                  *a5 = v21;
                unsigned int v11 = v14;
                continue;
              }

              unsigned int v17 = [v14 isEqualToString:*(NSMutableDictionary **)((char *)&self->mMatrices + 1)];
              if (v17) {
                unsigned int v11 = v14;
              }
              if (a5 && (v17 & 1) != 0) {
                goto LABEL_16;
              }
            }
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (!v10) {
        return v11;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectHangingPictures *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v9 = [*(id *)((char *)&self->mPhotoFrameImageProviders[3] + 1) objectForKey:a5];
  if (v9)
  {
    id v10 = v9;
    id v9 = [*(id *)((char *)&self->mSprites + 1) objectForKey:a5];
    if (v9)
    {
      *(float *)&double v11 = MRMatrix_MultiplyWithMatrix((float *)[v9 bytes], a4, v13);
      LOBYTE(v9) = objc_msgSend(v10, "getVerticesCoordinates:withMatrix:", a3, v13, v11);
    }
  }

  return (char)v9;
}

- (void)_unload
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  unint64_t v3 = *(void **)((char *)&self->mBaseStillDuration + 1);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (int64_t i = 0LL; i != v5; int64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) cleanup];
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  [*(id *)((char *)&self->mBaseStillDuration + 1) removeAllObjects];
  [*(id *)((char *)&self->mPhotoFrameImageProviders[3] + 1) removeAllObjects];
  [*(id *)((char *)&self->mSprites + 1) removeAllObjects];

  *(NSMutableDictionary **)((char *)&self->mMatrices + 1) = 0LL;
}

@end