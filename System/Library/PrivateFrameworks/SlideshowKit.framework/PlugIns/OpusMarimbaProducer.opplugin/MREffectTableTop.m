@interface MREffectTableTop
+ (void)initialize;
- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7;
- (BOOL)getVerticesCoordinates:(MREffectTableTop *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectTableTop)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectTableTop

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectTableTop;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform highp vec2\t\t\ta, b; \n\t\tuniform highp vec2\t\t\tborderSize, invRadii; \n\t\tuniform highp vec2\t\t\tshadowHardness, invShadowSize, shadowOffset; \n\t\tvarying lowp vec2\t\t\tborderAlphaXY; \n\t\tvarying lowp vec2\t\t\tshadowStrengthXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeInSpriteCoordinates; \n\t\t\thighp vec2 p1 = aInSpriteCoordinates * a + b, relP = abs(p1) - .5 - borderSize; \n\t\t\thighp vec2 p2 = ((p1 - shadowOffset) * invShadowSize), absP2 = abs(p2); \n\t\t\tborderAlphaXY = 1. - relP * invRadii; \n\t\t\tshadowStrengthXY = max((absP2-.5)*shadowHardness+1., 0.); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTableTopOuter");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0High; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform highp vec2\t\t\tinvRadii; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tmediump vec2 relP = .5 - abs(aInSpriteCoordinates); \n\t\t\tmediump vec2 a2 = 1. - .5 * invRadii; \n\t\t\tmediump vec2 borderAlphaXY = 1. - relP * invRadii; \n\t\t\tborderAlpha = max(borderAlphaXY.x, borderAlphaXY.y); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTexture0TableTopMiddle");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform mediump vec2 invRadii; \n\t\tvarying lowp vec2 borderAlphaXY; \n\t\tvarying lowp vec2 shadowStrengthXY; \n\t\tuniform lowp vec4 borderColor, shadowColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp float borderAlpha = min(borderAlphaXY.x, borderAlphaXY.y); \n\t\t\tlowp float shadowStrength = 1. - smoothstep(0., 1., length(shadowStrengthXY)); \n\t\t\tgl_FragColor = mix(vec4(shadowColor.rgb, shadowColor.a * shadowStrength), borderColor, clamp(borderAlpha, 0., 1.));/* * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii);*/ \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTableTopOuter",
    @"TableTopOuter");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0High; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform lowp vec4 borderColor, offsetColor, factorColor; \n\t\tvarying lowp float borderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.a = 1.; \n\t\t\tcolor = color * factorColor + offsetColor; \n\t\t\tgl_FragColor = mix(color, borderColor, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTexture0TableTopMiddle",
    @"TableTopMiddle");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0High; \n\t\tuniform lowp vec4 offsetColor, factorColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.a = 1.; \n\t\t\tgl_FragColor = color * factorColor + offsetColor; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"TableTopInner");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tuniform mediump vec2 invRadii, a, b; \n\t\tuniform mediump vec2 invShadowSize, shadowOffset, shadowHardness; \n\t\tuniform lowp vec4 shadowColor, offsetColor, factorColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tmediump vec2 p1 = vInSpriteCoordinates * a + b, relP = abs(p1) - .5; \n\t\t\tmediump vec2 p2 = ((p1 - shadowOffset) * invShadowSize), absP2 = abs(p2); \n\t\t\tlowp vec2 imageAlphaXY = clamp(1. - relP * invRadii, 0., 1.); \n\t\t\tlowp float imageAlpha = min(imageAlphaXY.x, imageAlphaXY.y); \n\t\t\tlowp vec2 shadowStrengthXY = max((absP2-.5)*shadowHardness+1., 0.); \n\t\t\tlowp float shadowStrength = 1. - smoothstep(0., 1., length(shadowStrengthXY)); \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.a = 1.; \n\t\t\tcolor = color * factorColor + offsetColor; \n\t\t\tgl_FragColor = mix(vec4(shadowColor.rgb, shadowColor.a * shadowStrength), color, imageAlpha) * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
    @"VertexCoordinatesTexture0",
    @"TableTopOuterNoBorder");
}

- (MREffectTableTop)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectTableTop;
  v4 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([*((id *)v4 + 4) hasSuffix:@"Subtitle"])
    {
      *(void *)(v4 + 209) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)(v4 + 209),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"PhotoBack.jpg"));
      objc_msgSend(*(id *)(v4 + 209), "setOriginalImageSize:", 1440.0, 1080.0);
      *(void *)(v4 + 345) = -[MRCAMLBezierData initWithTimingFunction:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithTimingFunction:",  @"easeIn");
    }
  }

  return (MREffectTableTop *)v4;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;

  *(MRCroppingSprite **)((char *)self->mExtraSprites + 1) = 0LL;
  *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;

  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
  [*(id *)((char *)&self->mPhotoBackProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mPhotoBackProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;

  *(void *)&self->mIsLoaded = 0LL;
  *(NSArray **)((char *)&self->mShuffledIndicies + 1) = 0LL;
  BYTE2(self->mMaxTextSize.height) = 0;
  BYTE1(self->mMaxTextSize.height) = 0;
  v3 = *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1);
  if (v3)
  {
    [v3 cleanup];

    *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1) = 0LL;
  }

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MREffectTableTop;
  -[MREffect setPixelSize:](&v9, "setPixelSize:");
  BYTE1(self->mBezierData) = 1;
  objc_super v6 = *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1);
  if (v6)
  {
    if (width <= height) {
      double v7 = height * 0.466667;
    }
    else {
      double v7 = width * 0.7;
    }
    if (width <= height) {
      double v8 = height * 0.7;
    }
    else {
      double v8 = width * 0.466667;
    }
    objc_msgSend(v6, "setDefaultSize:", v7, v8, height * 0.466667, width * 0.466667, height * 0.7);
  }

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  BOOL v5 = !v4 || ![v4 length] || *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) != 0;
  objc_super v6 = *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1);
  if (v6)
  {
  }

  else if (v5)
  {
    return !self->super.mNeedsToUpdateTexts;
  }

  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v5 = a5;
  if (BYTE2(self->mMaxTextSize.height)) {
    goto LABEL_33;
  }
  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break")) {
    unsigned __int8 v9 = 1;
  }
  else {
    unsigned __int8 v9 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"BreakSubtitle");
  }
  BYTE1(self->mMaxTextSize.height) = v9;
  NSUInteger v10 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  if (v10 == 6) {
    uint64_t v11 = -1LL;
  }
  else {
    uint64_t v11 = -2LL;
  }
  if (BYTE1(self->mMaxTextSize.height))
  {
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0)),  "imageAspectRatio");
    double v13 = v12;
    [a4 localAspectRatio];
    if (v13 >= 1.0)
    {
      double v19 = v13 / v14;
      if (v19 >= 2.0)
      {
        float v21 = v19 * 0.5;
        float v18 = ceilf(v21) + 1.0;
        goto LABEL_16;
      }
    }

    else
    {
      double v15 = flt_1F63C0[v14 >= 1.0] / v13;
      [a4 localAspectRatio];
      if (v15 * v16 >= 2.0)
      {
        float v17 = v15 * 0.5;
        float v18 = ceilf(v17) + 1.0;
LABEL_16:
        uint64_t v20 = (uint64_t)v18;
        goto LABEL_17;
      }
    }

    BYTE1(self->mMaxTextSize.height) = 0;
  }

  uint64_t v20 = 1LL;
LABEL_17:
  id v22 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  int64_t v23 = v11 + v10;
  uint64_t v24 = v20 * v23;
  if (v20 * v23 >= 1)
  {
    uint64_t v25 = 0LL;
    do
    {
      objc_msgSend( v22,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v25 % v23));
      ++v25;
    }

    while (v24 != v25);
  }

  id v26 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  int v27 = BYTE1(self->mMaxTextSize.height);
  id v28 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v29 = [v22 count];
  if (v27)
  {
    if (v29)
    {
      uint64_t v30 = 0LL;
      do
      {
        uint64_t v31 = (uint64_t)[v26 randomInt] % (v23 - v30);
        objc_msgSend(v28, "addObject:", objc_msgSend(v22, "objectAtIndex:", v31));
        [v22 removeObjectAtIndex:v31];
        if ((v30 + 1) % v23) {
          ++v30;
        }
        else {
          uint64_t v30 = 0LL;
        }
      }

      while ([v22 count]);
    }
  }

  else
  {
    while (v29)
    {
      unint64_t v32 = (unint64_t)[v26 randomInt];
      unint64_t v33 = v32 % (unint64_t)[v22 count];
      objc_msgSend(v28, "addObject:", objc_msgSend(v22, "objectAtIndex:", v33));
      [v22 removeObjectAtIndex:v33];
      id v29 = [v22 count];
    }
  }

  v34 = *(void **)&self->mIsLoaded;
  if (v34)
  {

    *(void *)&self->mIsLoaded = 0LL;
  }

  *(void *)&self->mIsLoaded = [v28 copy];
  BYTE2(self->mMaxTextSize.height) = 1;
  id v5 = a5;
LABEL_33:
  if (BYTE1(self->mBezierData))
  {
    BYTE1(self->mBezierData) = 0;
    if ((char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") == (char *)&dword_4 + 2) {
      uint64_t v35 = 1LL;
    }
    else {
      uint64_t v35 = 2LL;
    }
    CGFloat v36 = self->super.mPixelSize.width / self->super.mPixelSize.height;
    v37 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_2F0C0;
    v42[3] = &unk_24D920;
    *(CGFloat *)&v42[6] = v36;
    v42[7] = v35;
    v42[4] = self;
    v42[5] = a4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v37, "enumerateKeysAndObjectsUsingBlock:", v42);
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___MREffectTableTop;
  -[MREffect prerenderForTime:inContext:withArguments:](&v41, "prerenderForTime:inContext:withArguments:", a4, v5, a3);
  v38 = *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1);
  if (v38) {
    [v38 prerenderForTime:a4 inContext:v5 withArguments:a3];
  }
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  objc_super v6 = self;
  double v7 = a3 / self->super.mMainDuration;
  id v8 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  double v9 = 0.0;
  [v8 randomFloatInRange:0.0 :4.0];
  double v11 = v10;
  unint64_t v12 = (unint64_t)[v8 randomInt];
  double v13 = -1.0;
  if ((v12 & 0x8000000000000001LL) == 1) {
    double v13 = 1.0;
  }
  double obj = v13;
  if (v11 >= 1.0)
  {
    double v14 = v13 + v13;
    double v15 = 6.0;
    [v8 randomFloatInRange:v14 :obj * v15];
    double v9 = v16;
  }

  double v17 = v7 * v9;
  float v18 = v7 * v9;
  *(float *)&double v19 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)&v6->mPhotoBackSprite + 1, 0.0, 0.0, v18);
  unint64_t v20 = (unint64_t)objc_msgSend(v8, "randomInt", v19);
  unint64_t v21 = (unint64_t)[v8 randomInt];
  unint64_t v22 = (unint64_t)[v8 randomInt];
  v528 = v6;
  if (BYTE1(v6->mMaxTextSize.height))
  {
    id v23 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v6->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
    double v24 = a3 / v6->super.mMainDuration;
    if (*(MRCroppingSprite **)((char *)&v6->mExtraSprites[1] + 1))
    {
      double v25 = 0.0;
      if (v24 < 0.150000006)
      {
LABEL_12:
        [v23 imageAspectRatio];
        double v27 = v26;
        [a4 localAspectRatio];
        BOOL v461 = v27 >= 1.0;
        double v441 = v27;
        if (v27 < 1.0)
        {
          double v29 = flt_1F63C0[v28 >= 1.0] / v27;
          double v30 = v29 * 0.5 + -0.400000006;
          double v31 = (v25 * 2.0 + -1.0) * v30;
          double v33 = 0.0;
          double v32 = v31;
        }

        else
        {
          double v29 = v27 / v28;
          double v30 = v29 * 0.5 + -0.5;
          double v31 = (v25 * -2.0 + 1.0) * v30;
          double v32 = 0.0;
          double v33 = v31;
        }

        float v38 = v29 * 0.5;
        uint64_t v468 = (uint64_t)(float)(ceilf(v38) + 1.0);
        double v478 = -((double)v468 + -1.0);
        if (v6->super._panoramaPanningOffsets)
        {
          -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( v6,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  ImageKey(0LL),  -v31,  -v30,  v30);
          double v40 = -v39;
          if (v441 >= 1.0)
          {
            double v36 = v40;
          }

          else
          {
            double v32 = v40;
            double v36 = v33;
          }

          uint64_t v459 = 3LL;
        }

        else
        {
          uint64_t v459 = 3LL;
          double v36 = v33;
        }

        goto LABEL_29;
      }

      [*(id *)((char *)&v6->mShuffledIndicies + 1) evaluatAtTime:(v24 + -0.150000006) / 0.850000024];
    }

    double v25 = v24;
    goto LABEL_12;
  }

  if ((v22 & 0x8000000000000001LL) == 1) {
    double v34 = v7;
  }
  else {
    double v34 = 1.0 - v7;
  }
  uint64_t v459 = (uint64_t)[v8 randomInt] % 3;
  double v441 = 0.0;
  objc_msgSend(v8, "randomFloatInRange::");
  if ((v20 & 0x8000000000000001LL) != 1) {
    double v35 = -v35;
  }
  double v36 = v34 * v35;
  [v8 randomFloatInRange:0.0 :0.100000001];
  BOOL v461 = 0;
  if ((v21 & 0x8000000000000001LL) != 1) {
    double v37 = -v37;
  }
  double v32 = v34 * v37;
  uint64_t v468 = 1LL;
  double v478 = 0.0;
LABEL_29:
  v444 = v8;
  [v8 randomFloatInRange:0.0 :dbl_1F6510[*(MRCroppingSprite **)((char *)&v6->mExtraSprites[1] + 1) == 0]];
  double v42 = v7 * v41;
  *(float *)&double v41 = v17 * 0.0174532924;
  __float2 v43 = __sincosf_stret(*(float *)&v41);
  float v44 = v36 * v43.__cosval - v32 * v43.__sinval;
  double v447 = v36;
  float v45 = v32 * v43.__cosval + v36 * v43.__sinval;
  *(float *)((char *)&v6->mLocalMatrix[10] + 1) = v44;
  *(float *)((char *)&v6->mLocalMatrix[11] + 1) = v45;
  float v46 = v42;
  *(float *)((char *)&v6->mLocalMatrix[12] + 1) = v46;
  [a4 composeModelViewMatrix:(char *)&v6->mPhotoBackSprite + 1 saveTo:v571];
  v47 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](v6->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  uint64_t v48 = 1LL;
  if (v47 != (_BYTE *)&dword_4 + 2) {
    uint64_t v48 = 2LL;
  }
  uint64_t v480 = v48;
  [a4 localAspectRatio];
  float v451 = v49;
  double v472 = v49;
  if (v6->super.mNeedsToUpdateSlides)
  {
    v6->super.mNeedsToUpdateSlides = 0;
    [*(id *)(&v6->super._isInInteractiveMode + 1) removeAllObjects];

    *(NSMutableDictionary **)((char *)&v6->mSprites + 1) = 0LL;
    *(MRCroppingSprite **)((char *)v6->mExtraSprites + 1) = 0LL;
  }

  double height = v6->super.mPixelSize.height;
  p_double width = &v6->super.mPixelSize.width;
  double width = v6->super.mPixelSize.width;
  double v481 = 0.035 / sqrt(v472);
  if (![*(id *)(&v6->super._isInInteractiveMode + 1) count])
  {
    int64_t v50 = 0LL;
    uint64_t v457 = (uint64_t)&v47[-v480];
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    double v445 = y + 0.150000006;
    float v53 = 1.0;
    double v463 = y;
    do
    {
      id v54 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v6->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v50));
      double v55 = 0.0;
      if (!BYTE1(v6->mMaxTextSize.height))
      {
        [v8 randomFloatInRange:5.0 :15.0];
        if (v50) {
          double v55 = obj * v56 * 0.0174532924;
        }
        else {
          double v55 = -(obj * v56 * 0.0174532924);
        }
      }

      [v54 imageAspectRatio];
      float v58 = v57;
      if (BYTE1(v6->mMaxTextSize.height))
      {
        [a4 localAspectRatio];
        if (v58 >= v53)
        {
          double v60 = (float)(v58 / v59);
          double v61 = v58;
          double v63 = 1.0;
        }

        else
        {
          double v60 = flt_1F63C0[v59 >= v53];
          double v61 = v58;
          [a4 localAspectRatio];
          double v63 = v60 / v58 * v62;
        }
      }

      else
      {
        double v64 = 1.60000002;
        double v63 = 1.20000005;
        if (height > width != v58 < v53)
        {
          double v63 = 1.60000002;
          double v64 = 1.70000005;
        }

        if (v47 == (_BYTE *)&dword_4 + 2) {
          double v63 = v64;
        }
        double v61 = v58;
        if (v451 <= v58) {
          double v60 = v63;
        }
        else {
          double v60 = v58 / v472 * v63;
        }
        if (v451 <= v58) {
          double v63 = v472 / v58 * v63;
        }
      }

      double v519 = v63;
      BOOL v65 = v58 >= 0.5 && v58 <= 2.0;
      double v66 = x;
      double v67 = y;
      if (!v65)
      {
        double v66 = x;
        double v67 = y;
        if (*(MRCroppingSprite **)((char *)&v6->mExtraSprites[1] + 1))
        {
          double v66 = v58 >= v53 ? x : CGPointZero.x + -0.100000001;
          double v67 = v445;
          if (v58 < v53) {
            double v67 = y;
          }
        }
      }

      double v500 = *p_width;
      float v496 = v58;
      if (v47 == (_BYTE *)&dword_4 + 2)
      {
        double v506 = v67;
        double v511 = v66;
        float v68 = v55;
        float v515 = v68;
      }

      else
      {
        if (v50) {
          float v69 = 0.5;
        }
        else {
          float v69 = -0.5;
        }
        float v70 = v55;
        float v515 = v70;
        if (v6->super.mPixelSize.height <= v6->super.mPixelSize.width)
        {
          __float2 v73 = __sincosf_stret(v70);
          double v511 = (float)(v69 * v73.__cosval);
          float v72 = v69 * v73.__sinval;
        }

        else
        {
          __float2 v71 = __sincosf_stret(v70);
          double v511 = (float)(v69 * v71.__sinval);
          float v72 = v69 * v71.__cosval;
        }

        double v506 = v72;
      }

      double v74 = v481 / v60;
      double v75 = v481 / v60 * v61;
      double v76 = v481 / v60 * 0.200000003;
      float v77 = v55 + -0.785398185;
      __float2 v78 = __sincosf_stret(v77);
      double v79 = v76 * v78.__cosval;
      double v80 = v76 * v61 * v78.__sinval;
      double v81 = (v74 + v74) * 1.5 + 1.0;
      double v82 = v75 * 2.0 + 1.0;
      double v83 = v82 + (v74 + v74) * 0.5 * v61;
      if (v79 + v81 * -0.5 >= -0.5 - v481 / v60) {
        double v84 = -0.5 - v74;
      }
      else {
        double v84 = v79 + v81 * -0.5;
      }
      double v85 = v80 + v83 * -0.5;
      double v86 = -0.5 - v75;
      if (v85 >= -0.5 - v75) {
        double v85 = -0.5 - v75;
      }
      double v487 = v85;
      double v491 = v84;
      double v87 = v79 + v81 * 0.5;
      if (v87 < v74 + 0.5) {
        double v87 = v74 + 0.5;
      }
      double v88 = v87 - v84;
      double v89 = v80 + v83 * 0.5;
      if (v89 < v75 + 0.5) {
        double v89 = v75 + 0.5;
      }
      double v90 = v89 - v85;
      double v91 = v60 * v88;
      double v475 = v519 * (v89 - v85);
      float v92 = 4.0 / (v60 * v88 * v500 * 0.5);
      double v483 = v92;
      double v93 = (-0.5 - v74 - v84) / v88 + v92;
      double v520 = (float)(v58 * v92);
      double v94 = (v86 - v85) / v90 + v520;
      double v95 = (v74 * 2.0 + 1.0) / v88 + v92 * -2.0;
      float v96 = v92 + v92;
      double v501 = (float)((float)(v92 + v92) * v496);
      double v97 = v82 / v90 - v501;
      v98 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
      *(float *)&double v99 = v515;
      v100 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v98,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v511,  v506,  v91,  v475,  v99,  *(void *)&v93,  *(void *)&v94,  *(void *)&v95,  *(void *)&v97);
      [*(id *)(&v6->super._isInInteractiveMode + 1) setObject:v100 forKey:ImageKey(v50)];

      v101 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      *(NSMutableDictionary **)((char *)&(&v6->mSprites)[v50] + 1) = (NSMutableDictionary *)v101;
      -[MRCroppingSprite setInnerRect:]( v101,  "setInnerRect:",  (-0.5 - v491) / v88 + v483,  (-0.5 - v487) / v90 + v520,  1.0 / v88 - v96,  1.0 / v90 - v501);
      objc_msgSend(*(id *)((char *)&(&v6->mSprites)[v50] + 1), "setOuterRect:", v93, v94, v95, v97);
      [*(id *)((char *)&(&v6->mSprites)[v50++] + 1) setMeshType:1];
      double x = CGPointZero.x;
      double y = v463;
      float v53 = 1.0;
    }

    while (v480 != v50);
    v102 = (char *)[*(id *)&v6->mIsLoaded count];
    __int128 v546 = 0u;
    __int128 v547 = 0u;
    __int128 v548 = 0u;
    __int128 v549 = 0u;
    id obja = [*(id *)&v6->mIsLoaded reverseObjectEnumerator];
    id v476 = [obja countByEnumeratingWithState:&v546 objects:v570 count:16];
    if (v476)
    {
      unsigned __int8 v103 = 0;
      uint64_t v104 = 0LL;
      uint64_t v466 = *(void *)v547;
      double v105 = 1.5;
      double v106 = 1.0;
      do
      {
        v107 = 0LL;
        uint64_t v442 = v104;
        do
        {
          if (*(void *)v547 != v466) {
            objc_enumerationMutation(obja);
          }
          id v108 = [*(id *)(*((void *)&v546 + 1) + 8 * (void)v107) integerValue];
          id v109 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v6->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v108 + v480));
          [a4 localAspectRatio];
          double v111 = v110;
          if (height <= width)
          {
            double v112 = v105 / v111 * 1.60000002;
            double v113 = 1.60000002;
          }

          else
          {
            double v112 = 2.4;
            double v113 = v111 / v105 * 2.4000001;
          }

          v114 = (double *)((char *)&backgroundPositions + 80 * v459 + 16 * (void)v108);
          double v116 = *v114;
          double v115 = v114[1];
          if ((v103 & (v468 > 1)) == 1)
          {
            if (v461)
            {
              double v115 = -v115;
              if (!BYTE1(v6->mMaxTextSize.height)) {
                goto LABEL_101;
              }
LABEL_96:
              double v116 = v478 + v116;
              goto LABEL_99;
            }

            double v116 = -v116;
            if (!BYTE1(v6->mMaxTextSize.height))
            {
LABEL_101:
              double v120 = backgroundRotations[5 * v459 + (void)v108] * 0.0174532924;
              goto LABEL_103;
            }
          }

          else
          {
            if (!BYTE1(v6->mMaxTextSize.height)) {
              goto LABEL_101;
            }
            if (v461) {
              goto LABEL_96;
            }
          }

          double v115 = v115 - v478;
LABEL_99:
          double v117 = backgroundRotations[5 * v459 + (void)v108];
          double v118 = v117 * 0.0174532924;
          if ((v103 & 1) != 0)
          {
            [v444 randomFloatInRange:-5.0 :5.0];
            double v120 = v118 + v119 * 0.0174532924;
          }

          else
          {
            double v120 = v117 * 0.0174532924;
          }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  MRMatrix_Invert((float *)((char *)&self->mPhotoBackSprite + 1), v26);
  MRMatrix_PreMultiply(a4, (uint64_t)v26);
  if ((objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  v26,  a5,  x,  y) & 1) == 0 && (objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  v26,  a5,  x,  y) & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    unint64_t v12 = *(void **)(&self->super._isInInteractiveMode + 1);
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v13) {
      return 0LL;
    }
    id v14 = v13;
    double v10 = 0LL;
    uint64_t v15 = *(void *)v22;
LABEL_7:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v12);
      }
      double v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
      id v18 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v17];
      if (v10) {
        break;
      }
      if (a5) {
        goto LABEL_20;
      }
LABEL_21:
      double v10 = v17;
LABEL_22:
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v14) {
          return v10;
        }
        goto LABEL_7;
      }
    }

    if ([v17 compare:v10] == (char *)&dword_0 + 1)
    {
      double v10 = v17;
      BOOL v19 = a5 == 0LL;
    }

    else
    {
      BOOL v19 = 1;
    }

    if (v19) {
      goto LABEL_22;
    }
LABEL_20:
    *a5 = v20;
    goto LABEL_21;
  }

  return @"text0";
}

- (BOOL)getVerticesCoordinates:(MREffectTableTop *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  *(float *)&double v8 = MRMatrix_MultiplyWithMatrix((float *)((char *)&self->mPhotoBackSprite + 1), a4, v11);
  if (objc_msgSend(a5, "isEqualToString:", @"text0", v8))
  {
    id v9 = *(MRImage **)((char *)&self->mTextImage + 1);
LABEL_4:
    LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:v11];
    return (char)v9;
  }

  id v9 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v9) {
    goto LABEL_4;
  }
  return (char)v9;
}

- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7
{
  id v13 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a7];
  id v14 = v13;
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

    if (a6)
    {
      if ((char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count") == (char *)&dword_4 + 2 || ([a7 isEqualToString:@"image1"] & 1) == 0)
      {
        unsigned __int8 v19 = [a7 isEqualToString:@"image0"];
      }

      else
      {
        unsigned __int8 v19 = 1;
      }

      *a6 = v19;
    }
  }

  return v14 != 0LL;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = *(double *)((char *)&self->mLocalMatrix[14] + 1);
  double v4 = *(double *)((char *)&self->mMaxTextSize.width + 1);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 2LL;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  double v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  id v9 = *(MRImageProvider **)((char *)&self->mPhotoBackProvider + 1);
  if (v7)
  {
    if (!v9) {
      *(MRImageProvider **)((char *)&self->mPhotoBackProvider + 1) = (MRImageProvider *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (!objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0"),  "length")) {
      objc_msgSend( *(id *)((char *)&self->mPhotoBackProvider + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
    objc_msgSend( *(id *)((char *)&self->mPhotoBackProvider + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mPhotoBackProvider + 1) setTruncate:1];
    [*(id *)((char *)&self->mPhotoBackProvider + 1) setMaxNumberOfLines:2];
    if (BYTE1(self->mMaxTextSize.height) && ([v10 imageAspectRatio], v11 < 1.0)) {
      double v12 = 0.600000024;
    }
    else {
      double v12 = 0.899999976;
    }
    CGFloat v13 = self->super.mPixelSize.height * 0.75 * 0.349999994 * 0.899999976;
    *(double *)((char *)&self->mLocalMatrix[14] + 1) = self->super.mPixelSize.width * 0.550000012 * v12;
    *(CGFloat *)((char *)&self->mMaxTextSize.width + 1) = v13;
    objc_msgSend(*(id *)((char *)&self->mPhotoBackProvider + 1), "setDefinedSize:");
    [*(id *)((char *)&self->mPhotoBackProvider + 1) setText:v7];
    [*(id *)((char *)&self->mPhotoBackProvider + 1) setRenderAtDefinedSize:1];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mPhotoBackProvider + 1), "setScale:");
    id v14 = (CGContext *)[*(id *)((char *)&self->mPhotoBackProvider + 1) retainedContext];
    if (v14)
    {
      CGFloat v15 = v14;
      CGFloat v16 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v14);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v16;
      -[MRTextRenderer setLabel:](v16, "setLabel:", @"Marimba TableTop Label");
      CGContextRelease(v15);
    }
  }

  else
  {
    if (v9)
    {

      *(MRImageProvider **)((char *)&self->mPhotoBackProvider + 1) = 0LL;
    }

    uint64_t v17 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v17)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }

    uint64_t v18 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
    if (v18)
    {

      *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
    }
  }

- (void)_unload
{
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  *(MRCroppingSprite **)((char *)self->mExtraSprites + 1) = 0LL;
  double v3 = *(MRCroppingSprite **)((char *)&self->mExtraSprites[1] + 1);
  if (v3) {
    [v3 unload];
  }

  *(void *)&self->mIsLoaded = 0LL;
  BYTE2(self->mMaxTextSize.height) = 0;
  BYTE1(self->mMaxTextSize.height) = 0;
}

@end