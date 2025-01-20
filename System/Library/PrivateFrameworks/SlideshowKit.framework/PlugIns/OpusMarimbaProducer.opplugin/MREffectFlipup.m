@interface MREffectFlipup
+ (BOOL)hasCustomTiming;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (void)initialize;
- (BOOL)_isMovieForSlideAtIndex:(int64_t)a3 slideInformation:(id)a4;
- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7;
- (BOOL)getVerticesCoordinates:(MREffectFlipup *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectFlipup)initWithEffectID:(id)a3;
- (double)_aspectRatioForSlideIndex:(int64_t)a3;
- (double)_durationForEffect:(int64_t)a3;
- (double)_movieDurationForSlideAtIndex:(int64_t)a3 slideInformation:(id)a4;
- (double)_startTimeForIteration:(int64_t)a3;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_iterationForTime:(double)a3;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_applySizeScripts:(double)a3;
- (void)_applyTimingToSlideProviders;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setupForSlideInformation:(id)a3 aspectRatio:(double)a4;
- (void)_unload;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)loadPositions;
- (void)releaseByEffectLayer:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectFlipup

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectFlipup;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tgl_FragColor = vec4(c.rgb * level, 1.); \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"FlipUpFadeToColor");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tlowp float val = max(0., vInSpriteCoordinates.y); \n\t\t\tgl_FragColor = vec4(c.rgb * val * val * val * level, 1.); \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture0",
    @"FlipUpGradientFadeToColor");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tgl_FragColor = vec4(c.rgb * level, c.a); \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"FlipUpFadeToColorBlend");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tlowp float val = max(0., vInSpriteCoordinates.y); \n\t\t\tgl_FragColor = vec4(c.rgb * val * val * val * level, c.a); \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture0",
    @"FlipUpGradientFadeToColorBlend");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0High; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tgl_FragColor = vec4(c.rgb * level, 1.); \n\t\t} \n\t\t",
    @"VertexTexture0High",
    @"FlipUpFadeToColorHigh");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0High; \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tlowp float val = max(0., vInSpriteCoordinates.y); \n\t\t\tgl_FragColor = vec4(c.rgb * val * val * val * level, 1.); \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture0High",
    @"FlipUpGradientFadeToColorHigh");
}

- (MREffectFlipup)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
  v3 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 353) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 353),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  *((void *)v3 + 4),  @"gradient.jpg"));
    [*(id *)(v3 + 353) setImageSizeScript:@"layerWidth,layerHeight * .6f"];
    objc_msgSend(*(id *)(v3 + 353), "setOriginalImageSize:", 3840.0, 1264.0);
    v4 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"zPosition",  1LL);
    *(void *)(v3 + 369) = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v4, 0LL);
  }

  return (MREffectFlipup *)v3;
}

- (void)_cleanup
{
  *(double *)((char *)&self->mTiming[5] + 1) = 0.0;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  BYTE1(self->mXPositions[5]) = 0;
}

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    objc_super v6 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
    if (v6)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mTiming[5] + 1), "setDefaultSize:", width, height);
  -[MREffectFlipup _applySizeScripts:](self, "_applySizeScripts:", width / height);
}

- (void)releaseByEffectLayer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
  -[MREffect releaseByEffectLayer:](&v5, "releaseByEffectLayer:", a3);
}

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  v11 = -[MREffectFlipup initWithEffectID:](objc_alloc(&OBJC_CLASS___MREffectFlipup), "initWithEffectID:", a3);
  -[MREffectFlipup setAttributes:](v11, "setAttributes:", a4);
  -[MREffectFlipup _setupForSlideInformation:aspectRatio:](v11, "_setupForSlideInformation:aspectRatio:", a5, a7);
  else {
    id v12 = [a5 count];
  }
  -[MREffectFlipup _durationForEffect:](v11, "_durationForEffect:", v12);
  double v14 = v13;
  id v15 = [a4 objectForKey:@"previousAttributes"];
  double v16 = 1.0;
  if (!v15) {
    double v16 = 1.5;
  }
  double v17 = 2.0;
  if (!v15) {
    double v17 = 2.5;
  }
  -[MREffectFlipup setPhaseInDuration:mainDuration:phaseOutDuration:]( v11,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v16,  v14 - v17,  1.0);
  return v11;
}

- (double)_durationForEffect:(int64_t)a3
{
  if (a3 < 1)
  {
    double v4 = 0.0;
  }

  else
  {
    v3 = (double *)(&self->mIsLoaded + 1);
    double v4 = 0.0;
    do
    {
      double v5 = *v3++;
      double v4 = v4 + v5;
      --a3;
    }

    while (a3);
  }

  id v6 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  double result = v4 + 0.5;
  if (v6) {
    return v4;
  }
  return result;
}

- (void)_setupForSlideInformation:(id)a3 aspectRatio:(double)a4
{
  unsigned int v7 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Text");
  BYTE2(self->mSortDescriptors) = v7;
  if (v7
    && ([*(id *)((char *)&self->mTiming[5] + 1) setEffectLayer:self->super.mEffectLayer],
        BYTE2(self->mSortDescriptors)))
  {
    id v8 = &dword_0 + 1;
  }

  else
  {
    if (a3) {
      v9 = (NSDictionary *)a3;
    }
    else {
      v9 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    }
    id v8 = -[NSDictionary count](v9, "count");
    if (!v8) {
      return;
    }
  }

  for (unint64_t i = 0LL; (id)i != v8; ++i)
  {
    if (a3)
    {
      id v11 = [a3 count];
      LODWORD(v12) = -1.0;
      if (i < (unint64_t)v11) {
        objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectAtIndex:", i, v12), "objectForKey:", @"aspectRatio"),  "floatValue");
      }
      double v13 = *(float *)&v12;
    }

    else
    {
      -[MREffectFlipup _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", i);
      double v13 = v14;
    }

    double v15 = 5.0;
    if (!BYTE2(self->mSortDescriptors))
    {
      if (-[MREffectFlipup _isMovieForSlideAtIndex:slideInformation:]( self,  "_isMovieForSlideAtIndex:slideInformation:",  i,  a3))
      {
        -[MREffectFlipup _movieDurationForSlideAtIndex:slideInformation:]( self,  "_movieDurationForSlideAtIndex:slideInformation:",  i,  a3);
        double v15 = v16;
      }

      else if (v13 < 0.5 || v13 > 2.0)
      {
        if (a4 <= 1.0)
        {
          double v17 = fmin(v13, 1.33333333);
          if (v17 < a4) {
            double v17 = a4;
          }
        }

        else
        {
          if (v13 >= a4) {
            double v17 = a4;
          }
          else {
            double v17 = v13;
          }
          if (v17 < 0.75) {
            double v17 = 0.75;
          }
        }

        float v18 = v17;
        double v19 = 1.60000002 / a4 * v18 / 1.60000002 * a4;
        double v20 = v13 / v19;
        double v21 = v19 / v13;
        if (v13 >= 1.0) {
          double v21 = v20;
        }
        double v15 = v21 * 1.29999995 * 5.0;
      }
    }

    *(double *)((char *)&self->mXPositions[i + 6] + 1) = v15;
  }

- (BOOL)_isMovieForSlideAtIndex:(int64_t)a3 slideInformation:(id)a4
{
  if (BYTE2(self->mSortDescriptors)) {
    return 0;
  }
  if (a4) {
    return objc_msgSend( objc_msgSend(objc_msgSend(a4, "objectAtIndex:", a3), "objectForKey:", @"isMovie"),  "BOOLValue");
  }
  return objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3)),  "canPlay");
}

- (double)_movieDurationForSlideAtIndex:(int64_t)a3 slideInformation:(id)a4
{
  if (BYTE2(self->mSortDescriptors)) {
    return 0.0;
  }
  if (a4) {
    objc_msgSend( objc_msgSend(objc_msgSend(a4, "objectAtIndex:", a3), "objectForKey:", @"duration"),  "doubleValue");
  }
  else {
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3)),  "slideDuration");
  }
  return result;
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v6,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
  -[MREffectFlipup _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
}

- (void)_applyTimingToSlideProviders
{
  mEffectLayer = self->super.mEffectLayer;
  if (mEffectLayer)
  {
    if (!BYTE2(self->mSortDescriptors))
    {
      int64_t v4 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](mEffectLayer, "slideProvidersForElementIDs"),  "count");
      if (v4 >= 1)
      {
        int64_t v5 = v4;
        int64_t v6 = 0LL;
        if (BYTE1(self->mSortDescriptors)) {
          double v7 = 0.5;
        }
        else {
          double v7 = 0.0;
        }
        do
        {
          id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v6));
          [v8 setShowTime:v7];
          [v8 setShowDuration:self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration - v7];
          double v7 = v7 + *(double *)((char *)&self->mXPositions[v6++ + 6] + 1);
        }

        while (v5 != v6);
      }
    }
  }

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  if (a3)
  {
    v3 = (double *)(&self->mIsLoaded + 1);
    double v4 = 0.0;
    do
    {
      double v5 = *v3++;
      double v4 = v4 + v5;
      --a3;
    }

    while (a3);
  }

  else
  {
    double v4 = 0.0;
  }

  id v6 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  double result = v4 + 0.5;
  if (v6) {
    return v4;
  }
  return result;
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  if (a3)
  {
    double v4 = (double *)(&self->mIsLoaded + 1);
    double v5 = 0.0;
    do
    {
      double v6 = *v4++;
      double v5 = v5 + v6;
      --a3;
    }

    while (a3);
  }

  else
  {
    double v5 = 0.0;
  }

  id v7 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  double v8 = v5 + 0.5;
  if (v7) {
    double v8 = v5;
  }
  return self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration - v8;
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  if (a3)
  {
    double v5 = (double *)(&self->mIsLoaded + 1);
    double v6 = 0.0;
    unint64_t v7 = a3;
    do
    {
      double v8 = *v5++;
      double v6 = v6 + v8;
      --v7;
    }

    while (v7);
  }

  else
  {
    double v6 = 0.0;
  }

  id v9 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  double v10 = v6 + 0.5;
  if (v9) {
    double v10 = v6;
  }
  return v10 + *(double *)((char *)&self->mXPositions[a3 + 6] + 1) * 0.5;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  double result = 1.0;
  if (!BYTE2(self->mSortDescriptors)) {
    return 0.0;
  }
  return result;
}

- (double)lowestDisplayTime
{
  return 0.0;
}

- (double)_aspectRatioForSlideIndex:(int64_t)a3
{
  if (BYTE2(self->mSortDescriptors)) {
    return 1.33333333;
  }
  double v3 = -1.0;
  if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") > a3)
  {
    id v6 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3));
    if (v6)
    {
      [v6 imageAspectRatio];
      return result;
    }
  }

  return v3;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!BYTE1(self->mXPositions[5]))
  {
    [a4 localAspectRatio];
    -[MREffectFlipup _setupForSlideInformation:aspectRatio:](self, "_setupForSlideInformation:aspectRatio:", 0LL, v9);
    [a4 localAspectRatio];
    -[MREffectFlipup _applySizeScripts:](self, "_applySizeScripts:", v10);
    -[MREffectFlipup _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
    -[MREffectFlipup loadPositions](self, "loadPositions");
    BYTE1(self->mSortDescriptors) = -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"previousAttributes") == 0LL;
    BYTE1(self->mXPositions[5]) = 1;
  }

  if (BYTE1(self->_currentIterationIndex))
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___MREffectFlipup;
    unsigned __int8 v11 = -[MREffect prerenderForTime:inContext:withArguments:]( &v21,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  if (-[MRLayer isActivated](self->super.mEffectLayer, "isActivated"))
  {
    if (BYTE1(self->mSortDescriptors))
    {
      if (a3 >= 0.5) {
        a3 = a3 + -0.5;
      }
      else {
        a3 = 0.0;
      }
    }

    int64_t v12 = -[MREffectFlipup _iterationForTime:](self, "_iterationForTime:", a3);
    double v13 = *(double *)((char *)&self->mXPositions[v12 + 6] + 1);
    -[MREffectFlipup _startTimeForIteration:](self, "_startTimeForIteration:", v12);
    double v15 = a3 - v14;
    BOOL v16 = a3 - v14 < 1.25 || a3 - v14 > v13 + -1.25;
    if (!BYTE2(self->mSortDescriptors))
    {
      if (v16)
      {
        BOOL v16 = 1;
      }

      else
      {
        objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v12)),  "imageAspectRatio");
        BOOL v16 = v17 > 2.0 || v17 < 0.5;
      }

      BOOL v18 = v15 < 1.0 || v15 > v13 + -1.5;
      id v19 = [a5 preloadQueue];
      if (!v18
        && [v19 operationCount]
        && !-[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended")
        && !v16)
      {
        -[MRLayerEffect _stallRenderer](self->super.mEffectLayer, "_stallRenderer");
      }

      if (v18 != -[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended")) {
        -[MRLayerEffect suspendAsynchronousOperations:](self->super.mEffectLayer, "suspendAsynchronousOperations:", v18);
      }
    }

    unsigned __int8 v11 = v16;
  }

  [*(id *)((char *)&self->mTiming[5] + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return v11;
}

- (void)_applySizeScripts:(double)a3
{
  if (!BYTE2(self->mSortDescriptors))
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    double v5 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    id v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i));
          [v10 imageAspectRatio];
          if (v11 >= 0.5 && v11 <= 2.0)
          {
            if (a3 > 1.0)
            {
              if (v11 >= a3) {
                double v11 = a3;
              }
              double v13 = 0.5625;
              goto LABEL_19;
            }

            double v11 = fmin(v11, 1.77777778);
          }

          else
          {
            if (a3 > 1.0)
            {
              if (v11 >= a3) {
                double v11 = a3;
              }
              double v13 = 0.75;
LABEL_19:
              if (v11 < v13) {
                double v11 = v13;
              }
              goto LABEL_26;
            }

            double v11 = fmin(v11, 1.33333333);
          }

          if (v11 < a3) {
            double v11 = a3;
          }
LABEL_26:
          float v14 = v11;
          double v15 = 1.60000002 / a3 * v14;
          [v10 setImageSizeScript:0];
          objc_msgSend( v10,  "setDefaultSize:",  self->super.mPixelSize.width * (v15 * 0.5),  self->super.mPixelSize.height * 0.800000012);
        }

        id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v7);
    }
  }

- (void)loadPositions
{
  v32 = (char *)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"startDirection"),  "integerValue");
  if (BYTE2(self->mSortDescriptors)) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  }
  id v4 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  id v5 = v4;
  if (v3 == 5)
  {
    uint64_t v6 = (uint64_t)[v4 randomInt];
    uint64_t v7 = v6 & 3;
    if (v6 <= 0) {
      uint64_t v7 = -(-v6 & 3);
    }
    if (v7 >= 2) {
      uint64_t v8 = v7 - 1;
    }
    else {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = 3LL;
  }

  else
  {
    if (v3 == 6)
    {
      uint64_t v10 = (uint64_t)[v4 randomInt];
      if (v10 % 5 >= 2) {
        uint64_t v8 = v10 % 5 - 1;
      }
      else {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    uint64_t v9 = 1LL;
  }

  double v11 = objc_alloc(&OBJC_CLASS___NSMutableIndexSet);
  if (v3 == 6) {
    uint64_t v12 = 4LL;
  }
  else {
    uint64_t v12 = v9;
  }
  v33 = -[NSMutableIndexSet initWithIndexesInRange:](v11, "initWithIndexesInRange:", 0LL, v12);
  if (v3 >= 1)
  {
    for (unint64_t i = v5;
          ;
          uint64_t v8 = (uint64_t)-[NSMutableIndexSet indexAtIndex:]( v33,  "indexAtIndex:",  (unint64_t)[i randomInt]
                        % (unint64_t)-[NSMutableIndexSet count](v33, "count")))
    {
      int64_t v13 = 0LL;
      char v14 = 0;
      double v15 = (int64_t *)((char *)&sixSlidePositions + 240 * v8 + 32);
      __int128 v16 = (char *)&fiveSlidePositions + 200 * v8 + 24;
      do
      {
        switch(v3)
        {
          case 4LL:
            break;
          case 5LL:
            if (*v16) {
              break;
            }
            __int128 v17 = (int64_t *)((char *)&fiveSlidePositions + 200 * v8 + 40 * v13 + 32);
LABEL_29:
            int64_t v18 = *v17;
            objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v13)),  "imageAspectRatio");
            double v20 = fmin(v19, 1.77777779);
            objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v18)),  "imageAspectRatio");
            v14 |= v20 < fmin(v21, 1.77777779);
            break;
          case 6LL:
            __int128 v17 = v15;
            if (!*((_BYTE *)v15 - 8)) {
              goto LABEL_29;
            }
            break;
        }

        ++v13;
        v15 += 5;
        v16 += 40;
      }

      while (v3 != v13);
      if ((v14 & 1) != 0)
      {
        -[NSMutableIndexSet removeIndex:](v33, "removeIndex:", v8);
        if (-[NSMutableIndexSet count](v33, "count")) {
          continue;
        }
      }

      uint64_t v22 = 0LL;
      v23 = (double *)((char *)&self->mZPositions[5] + 1);
      v24 = (NSMutableDictionary **)((char *)&self->mBreakInformation + 1);
      v25 = (char *)&sixSlidePositions + 240 * v8;
      uint64_t v26 = v3;
      while (v3 != 4)
      {
        if (v3 == 5)
        {
          v27 = (double *)((char *)&fiveSlidePositions + 200 * v8 + 40 * v22);
          goto LABEL_39;
        }

        double v29 = 0.0;
        uint64_t v30 = 0LL;
        if (v3 != 6) {
          goto LABEL_41;
        }
        v28 = (uint64_t *)(v25 + 8);
        v27 = (double *)v25;
LABEL_40:
        double v29 = *v27;
        uint64_t v30 = *v28;
LABEL_41:
        if (v32 == (_BYTE *)&dword_0 + 2) {
          double v29 = -v29;
        }
        *v23++ = v29;
        *v24++ = v30;
        ++v22;
        v25 += 40;
        if (!--v26) {
          goto LABEL_47;
        }
      }

      v27 = (double *)((char *)&fourSlidePositions + 40 * v22);
LABEL_39:
      v28 = (uint64_t *)(v27 + 1);
      goto LABEL_40;
    }
  }

- (BOOL)isLoadedForTime:(double)a3
{
  if (BYTE2(self->mSortDescriptors)
    && ((id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0"),  BYTE2(self->mSortDescriptors))
      ? (BOOL v5 = v4 == 0LL)
      : (BOOL v5 = 1),
        !v5
     && [v4 length]
     && (!*(MRImageProvider **)((char *)&self->mGradientProvider + 1) || self->super.mNeedsToUpdateTexts)))
  {
    return 0;
  }

  else
  {
    return objc_msgSend(*(id *)((char *)&self->mTiming[5] + 1), "isLoaded", a3);
  }

- (double)_startTimeForIteration:(int64_t)a3
{
  if (a3 < 1) {
    return 0.0;
  }
  uint64_t v3 = (double *)(&self->mIsLoaded + 1);
  double result = 0.0;
  do
  {
    double v5 = *v3++;
    double result = result + v5;
    --a3;
  }

  while (a3);
  return result;
}

- (int64_t)_iterationForTime:(double)a3
{
  if (BYTE2(self->mSortDescriptors)) {
    unint64_t v5 = 1LL;
  }
  else {
    unint64_t v5 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  }
  if (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration > a3)
  {
    uint64_t v6 = 0LL;
    if (v5 && a3 > 0.0)
    {
      uint64_t v7 = 0LL;
      double v8 = 0.0;
      do
      {
        uint64_t v6 = v7 + 1;
        double v8 = v8 + *(double *)((char *)&self->mXPositions[v7 + 6] + 1);
      }

      while (++v7 < v5 && v8 < a3);
    }

    if (v6 <= 1) {
      unint64_t v5 = 1LL;
    }
    else {
      unint64_t v5 = v6;
    }
  }

  return v5 - 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v6 = self;
  BYTE1(self->_currentIterationIndex) = 0;
  double v7 = a3;
  if (BYTE1(self->mSortDescriptors))
  {
    double v7 = 0.0;
    if (a3 >= 0.5) {
      double v7 = a3 + -0.5;
    }
  }

  if (BYTE2(self->mSortDescriptors)) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  }
  int64_t v9 = -[MREffectFlipup _iterationForTime:](v6, "_iterationForTime:", v7);
  *(void *)&v6->mIsText = v9;
  double v10 = *(double *)((char *)&v6->mXPositions[v9 + 6] + 1);
  uint64_t v181 = v9;
  if (v9) {
    unint64_t v11 = 0LL;
  }
  else {
    unint64_t v11 = (unint64_t)objc_msgSend( -[NSDictionary objectForKey:]( v6->super.mFlattenedAttributes,  "objectForKey:",  @"startDirection"),  "integerValue");
  }
  uint64_t v12 = (char *)objc_msgSend( -[NSDictionary objectForKey:]( v6->super.mFlattenedAttributes,  "objectForKey:",  @"startDirection"),  "integerValue");
  -[MREffectFlipup _startTimeForIteration:](v6, "_startTimeForIteration:", v181, MRMatrix_Clear((uint64_t)v219));
  double v14 = v7 - v13;
  v187 = (char *)&v6->mBreakInformation + 1;
  double v15 = *(double *)((char *)&(&v6->mBreakInformation)[v181] + 1);
  double v16 = -v15;
  v186 = (char *)&v6->mZPositions[5] + 1;
  double v17 = *(double *)((char *)&v6->mZPositions[v181 + 5] + 1);
  double v18 = v10 + -1.0;
  if (v7 - v13 >= v10 + -1.0)
  {
    double v23 = Spline1((v14 - v18) * 0.5, 0.0, 0.5, 0.5, 1.0, 0.0, 0.0, 1.0, 1.0);
    int64_t v24 = v181;
    if (v181 >= v8 - 1)
    {
      double v16 = v23 - v15;
      double v27 = 3.0;
      if (v12 == (_BYTE *)&dword_0 + 1) {
        double v27 = -3.0;
      }
      double v26 = v27 + v17;
    }

    else
    {
      uint64_t v25 = 8 * v181 + 8;
      double v16 = (v15 - *(double *)&v187[v25]) * v23 - v15;
      double v26 = *(double *)&v186[v25];
    }

    double v17 = v17 + (v26 - v17) * v23;
  }

  else
  {
    if (v11 | v181 && v14 < 1.0)
    {
      double v19 = Spline1(v14 * 0.5 + 0.5, 0.0, 0.5, 0.5, 1.0, 0.0, 0.0, 1.0, 1.0) + -0.5;
      if (v11 - 1 >= 2) {
        double v20 = 0.0;
      }
      else {
        double v20 = -0.5;
      }
      if (v181 && v11 - 1 >= 2) {
        double v20 = -*(double *)&v187[8 * v181 - 8];
      }
      double v21 = v19 + 0.5;
      if (v11 == 1)
      {
        double v22 = -1.0;
      }

      else
      {
        if (v11 != 2)
        {
          int64_t v24 = v181;
          double v22 = *(double *)&v186[8 * v181 - 8];
          goto LABEL_32;
        }

        double v22 = 1.0;
      }

      int64_t v24 = v181;
LABEL_32:
      double v16 = v20 + (v16 - v20) * v21;
      double v17 = v22 + (v17 - v22) * v21;
      goto LABEL_33;
    }

    int64_t v24 = v181;
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
    double v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (unint64_t i = 0LL; i != v12; unint64_t i = (char *)i + 1)
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
            double v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            double v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectFlipup *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7
{
  id v13 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a7];
  uint64_t v14 = v13;
  if (v13)
  {
    if (a3)
    {
      [v13 position];
      a3->double x = v15;
      a3->double y = v16;
    }

    if (a4)
    {
      [v14 halfSize];
      *(void *)a4 = v17;
    }

    if (a5)
    {
      [v14 rotation];
      *(void *)a5 = v18;
    }

    if (a6) {
      *a6 = objc_msgSend(objc_msgSend(a7, "substringFromIndex:", 5), "integerValue") == *(id *)&self->mIsText;
    }
  }

  return v14 != 0LL;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  if (BYTE2(self->mSortDescriptors)) {
    id v11 = 0LL;
  }
  else {
    id v11 = (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count")
  }
        - 1;
  double v12 = a3 + -0.5;
  if (a3 <= 0.5) {
    double v12 = 0.0;
  }
  if (!BYTE1(self->mSortDescriptors)) {
    double v12 = a3;
  }
  int64_t v13 = -[MREffectFlipup _iterationForTime:](self, "_iterationForTime:", v12 + -1.0 + 0.0001);
  if (!v8 || v13)
  {
    if (v8)
    {
      uint64_t v14 = -1LL;
    }

    else
    {
      if ((char *)v13 == v11)
      {
        LOBYTE(v13) = 0;
        return v13;
      }

      uint64_t v14 = 1LL;
    }

    uint64_t v15 = v14 + v13;
    if (a5)
    {
      -[MREffectFlipup _startTimeForIteration:](self, "_startTimeForIteration:", v15);
      double v17 = v16 + 1.0;
      double v18 = 0.5;
      if (!BYTE1(self->mSortDescriptors)) {
        double v18 = 0.0;
      }
      double v19 = v17 + v18;
      *a5 = v19;
      if (v19 < 0.0) {
        *a5 = 0.0;
      }
    }

    if (a6) {
      *a6 = *(double *)((char *)&self->mXPositions[v15 + 6] + 1) + -2.0;
    }
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (double)interestingTimeForTime:(double)a3
{
  double v4 = a3 + -0.5;
  if (a3 <= 0.5) {
    double v4 = 0.0;
  }
  if (BYTE1(self->mSortDescriptors)) {
    a3 = v4;
  }
  -[MREffectFlipup _startTimeForIteration:]( self,  "_startTimeForIteration:",  -[MREffectFlipup _iterationForTime:](self, "_iterationForTime:", a3 + -1.0 + 0.0001));
  double v6 = v5 + 1.0;
  if (BYTE1(self->mSortDescriptors)) {
    double v7 = 0.5;
  }
  else {
    double v7 = 0.0;
  }
  double result = v6 + v7;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)interestingTimeForElement:(id)a3
{
  if (BYTE2(self->mSortDescriptors)) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (int)objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "intValue");
  }
  -[MREffectFlipup _startTimeForIteration:](self, "_startTimeForIteration:", v4);
  double v6 = v5 + 1.0;
  double v7 = 0.5;
  if (!BYTE1(self->mSortDescriptors)) {
    double v7 = 0.0;
  }
  return v6 + v7;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  if (BYTE2(self->mSortDescriptors)) {
    id v11 = 0LL;
  }
  else {
    id v11 = (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count")
  }
        - 1;
  double v12 = a6 + -0.5;
  if (a6 <= 0.5) {
    double v12 = 0.0;
  }
  if (BYTE1(self->mSortDescriptors)) {
    a6 = v12;
  }
  unint64_t v13 = -[MREffectFlipup _iterationForTime:](self, "_iterationForTime:", a6 + -1.0 + 0.0001);
  unint64_t v14 = v13;
  if (v13 < (unint64_t)v11)
  {
    -[MREffectFlipup _startTimeForIteration:](self, "_startTimeForIteration:", v13 + 1);
    double v16 = v15 + -1.0;
    if (!a3) {
      goto LABEL_16;
    }
LABEL_15:
    *a3 = v16 - a6;
    goto LABEL_16;
  }

  if (BYTE1(self->mSortDescriptors)) {
    double v17 = 0.5;
  }
  else {
    double v17 = 0.0;
  }
  double v16 = self->super.mPhaseInDuration + self->super.mMainDuration - v17;
  if (a3) {
    goto LABEL_15;
  }
LABEL_16:
  if (a4)
  {
    double v18 = 0.0;
    if (!BYTE2(self->mSortDescriptors))
    {
      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", 0.0),  "objectForKey:",  ImageKey(v14)),  "imageAspectRatio");
      BOOL v20 = v19 > 2.0 || v19 < 0.5;
      double v18 = 0.1;
      if (!v20) {
        double v18 = 0.0;
      }
    }

    *a4 = v18;
  }

  if (a5)
  {
    double mPhaseOutDuration = 2.0;
    *a5 = mPhaseOutDuration;
  }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (BYTE2(self->mSortDescriptors))
  {
    self->super.mNeedsToUpdateTexts = 0;
    id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
    BOOL v8 = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
    if (v8)
    {
      [v8 releaseByUser];
      *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
    }

    if (v7)
    {
      int64_t v9 = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
      if (![v7 length]) {
        -[MRTextRenderer setPlaceholderText:]( v9,  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
      }
      -[MRTextRenderer setResolution:]( v9,  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      -[MRTextRenderer setDefinedSize:]( v9,  "setDefinedSize:",  self->super.mPixelSize.width * 0.6,  self->super.mPixelSize.height * 0.6);
      -[MRTextRenderer setRenderAtDefinedSize:](v9, "setRenderAtDefinedSize:", 0LL);
      -[MRTextRenderer setText:](v9, "setText:", v7);
      -[MRTextRenderer setTruncate:](v9, "setTruncate:", 1LL);
      -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
      +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
      -[MRTextRenderer setScale:](v9, "setScale:");
      -[MRTextRenderer setCenterVertically:](v9, "setCenterVertically:", 1LL);
      if (-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"))
      {
        -[MRTextRenderer setMaxNumberOfLines:]( v9,  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"),  "integerValue"));
      }

      -[MRTextRenderer sizeOfContext](v9, "sizeOfContext");
      double v11 = v10;
      double v13 = v12;
      -[MRTextRenderer setRenderAtDefinedSize:](v9, "setRenderAtDefinedSize:", 1LL);
      -[MRTextRenderer setDefinedSize:](v9, "setDefinedSize:", v11, v13);
      unint64_t v14 = -[MRTextRenderer retainedContext](v9, "retainedContext");
      if (v14)
      {
        double v15 = v14;
        double v16 = (MRImageProvider *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  v14);
        *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = v16;
        -[MRImageProvider setLabel:](v16, "setLabel:", @"Marimba FlipupText Text0");
        CGContextRelease(v15);
      }
    }

    BYTE1(self->_currentIterationIndex) = 1;
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.6;
  double v4 = v3;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  int64_t result = -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@MaxNumOfLines", a3));
  if (result) {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (void)_unload
{
  double v3 = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
  }

  [*(id *)((char *)&self->mTiming[5] + 1) unload];
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  BYTE1(self->mXPositions[5]) = 0;
}

@end