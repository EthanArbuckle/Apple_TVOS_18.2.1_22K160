@interface MREffectSnapshot
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectSnapshot *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectSnapshot)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectSnapshot

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectSnapshot;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform highp vec2\t\t\ta1, b1; \n\t\tuniform highp vec2\t\t\tborderSize, invRadii; \n\t\tuniform highp vec2\t\t\tshadowHardness, invShadowSize; \n\t\tvarying lowp vec2\t\t\tborderAlphaXY; \n\t\tvarying lowp vec2\t\t\tshadowStrengthXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\thighp vec2 absP1 = abs(a1 * aInSpriteCoordinates + b1); \n\t\t\thighp vec2 absP2 = absP1 * invShadowSize; \n\t\t\thighp vec2 a2 = 1. + (.5 + borderSize) * invRadii; \n\t\t\tborderAlphaXY = a2 - absP1 * invRadii; \n\t\t\tshadowStrengthXY = 1. + (absP2 - .5) * shadowHardness; \n\t\t} \n\t\t",
    @"VertexCoordinatesHigh");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform highp vec2\t\t\ta1, b1; \n\t\tuniform highp vec2\t\t\tinvRadii; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tmediump vec2 absP1 = abs(a1 * aInSpriteCoordinates + b1); \n\t\t\tmediump vec2 a2 = 1. - .5 * invRadii; \n\t\t\tmediump vec2 borderAlphaXY = a2 + absP1 * invRadii; \n\t\t\tborderAlpha = max(borderAlphaXY.x, borderAlphaXY.y); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTexture0");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\texposureExp, brightness; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.rgb = color.rgb * exposureExp + brightness; \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"PhotoprintInner");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform lowp vec4\t\t\tborderColor; \n\t\tuniform lowp float\t\t\texposureExp, brightness; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.rgb = color.rgb * exposureExp + brightness; \n\t\t\tgl_FragColor = mix(color, borderColor, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTexture0",
    @"PhotoprintMiddle");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform lowp vec4\t\t\tborderColor; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tgl_FragColor = mix(color, borderColor, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexCoordinatesHighTexture0",
    @"PhotoprintMiddleNoExposureBrightness");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform lowp vec4\t\t\tborderColor, shadowColor; \n\t\tvarying lowp vec2\t\t\tborderAlphaXY; \n\t\tvarying lowp vec2\t\t\tshadowStrengthXY; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp float borderAlpha = min(borderAlphaXY.x, borderAlphaXY.y); \n\t\t\tlowp float shadowStrength = 1. - smoothstep(0., 1., length(max(shadowStrengthXY, 0.))); \n\t\t\tgl_FragColor = mix(vec4(shadowColor.rgb * shadowStrength, shadowColor.a * shadowStrength), borderColor, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
    @"VertexCoordinatesHigh",
    @"PhotoprintOuterForNullShadowOffset");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp float\t\t\tsaturation; \n\t\tuniform lowp vec3\t\t\tdesaturatedIntensities; \n\t/*\tconst lowp vec3\t\t\t\tintensities = vec3(.2125, .7154, .0721);*/ \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp float bwColor = dot(color.rgb, desaturatedIntensities); \n\t\t\tcolor.rgb = color.rgb * saturation + bwColor; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"PhotoprintSaturation");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\tsaturation; \n\t\tuniform lowp vec3\t\t\tdesaturatedIntensities; \n\t/*\tconst lowp vec3\t\t\t\tintensities = vec3(.2125, .7154, .0721);*/ \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp float bwColor = dot(color.rgb, desaturatedIntensities); \n\t\t\tcolor.rgb = color.rgb * saturation + bwColor; \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
    @"VertexTexture0",
    @"PhotoprintSaturationNoColor");
}

- (MREffectSnapshot)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectSnapshot;
  result = -[MREffect initWithEffectID:](&v4, "initWithEffectID:", a3);
  if (result)
  {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRCroppingSprite **)((char *)&result->mSprite + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer + 1) = 0LL;
    *(MRImage **)((char *)&result->mTextImage + 1) = 0LL;
    *(int64_t *)((char *)&result->mNumberOfLines + 1) = 0LL;
  }

  return result;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mSprite + 1) cleanup];

  *(MRCroppingSprite **)((char *)&self->mSprite + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;

  *(int64_t *)((char *)&self->mNumberOfLines + 1) = 0LL;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if ((byte_2B0610 & 1) == 0)
  {
    [a4 pixelSize];
    if (v8 == 1920.0)
    {
      objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\texposureExp, brightness; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.rgb *= exposureExp; \n\t\t\tgl_FragColor = color + vec4(vec3(brightness), 1.); \n\t\t} \n\t\t",
        @"VertexTexture0",
        @"PhotoprintInner");
      objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tuniform lowp vec4\t\t\tborderColor; \n\t\tuniform lowp float\t\t\texposureExp, brightness; \n\t\tvarying lowp float\t\t\tborderAlpha; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n            DoFilter0(color); \n\t\t\tcolor.rgb *= exposureExp; \n\t\t\tcolor += vec4(vec3(brightness), 1.); \n\t\t\tgl_FragColor = mix(color, borderColor, clamp(borderAlpha, 0., 1.)); \n\t\t} \n\t\t",
        @"VertexCoordinatesHighTexture0",
        @"PhotoprintMiddle");
      objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp float\t\t\tsaturation; \n\t\tuniform lowp vec3\t\t\tdesaturatedIntensities; \n\t/*\tconst lowp vec3\t\t\t\tintensities = vec3(.2125, .7154, .0721);*/ \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp float bwColor = dot(color.rgb, desaturatedIntensities); \n\t\t\tcolor.rgb *= saturation; \n\t\t\tgl_FragColor = uColor * (color + vec4(vec3(bwColor), 1.)); \n\t\t} \n\t\t",
        @"VertexTexture0",
        @"PhotoprintSaturation");
      objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\tsaturation; \n\t\tuniform lowp vec3\t\t\tdesaturatedIntensities; \n\t/*\tconst lowp vec3\t\t\t\tintensities = vec3(.2125, .7154, .0721);*/ \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp float bwColor = dot(color.rgb, desaturatedIntensities); \n\t\t\tcolor.rgb *= saturation; \n\t\t\tgl_FragColor = color + vec4(vec3(bwColor), 1.); \n\t\t} \n\t\t",
        @"VertexTexture0",
        @"PhotoprintSaturationNoColor");
    }

    byte_2B0610 = 1;
  }

  double mDefaultMainDuration = self->super.mDefaultMainDuration;
  double mMainDuration = self->super.mMainDuration;
  id v212 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  id v11 = [v212 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [a4 localAspectRatio];
  double v13 = v12;
  [v11 aspectRatio];
  double v15 = v14;
  unsigned int v16 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle");
  unsigned int v17 = v16;
  BOOL v18 = v15 > 2.0 || v15 < 0.5;
  double v19 = dbl_1FA1B0[v15 < 1.0];
  int v208 = v16 ^ 1;
  int v20 = v16 ^ 1 | v18;
  double v21 = 0.800000012;
  if (v15 < 1.0) {
    double v21 = 1.0;
  }
  double v22 = v21 * v13;
  double v23 = mDefaultMainDuration / mMainDuration;
  id v204 = v11;
  if (v15 >= 1.0)
  {
    objc_msgSend(a4, "localAspectRatio", CGSizeZero.width);
    double v25 = 1.25;
    if (v18) {
      double v25 = 1.0;
    }
    double v26 = v24;
    double v27 = 1.10000002;
    if (v18) {
      double v27 = 0.85;
    }
    BOOL v28 = v26 <= 1.55;
    if (v26 <= 1.55) {
      double v25 = v27;
    }
    double v29 = v15 * (v25 / v13);
    double v32 = v13;
    goto LABEL_20;
  }

  objc_msgSend(a4, "localAspectRatio", CGSizeZero.width);
  double v31 = v30;
  double v32 = v13;
  if (v18)
  {
    BOOL v28 = 0;
    double v29 = 0.449999988;
    double v25 = 0.449999988 / v15 * v31;
LABEL_20:
    double v33 = a3;
    goto LABEL_21;
  }

  double v33 = a3;
  BOOL v28 = 0;
  if (v15 >= 0.6) {
    double v29 = 0.649999976;
  }
  else {
    double v29 = 0.600000024;
  }
  double v25 = v29 / v15 * v31;
LABEL_21:
  double v34 = v23 * 0.0455400012;
  int v35 = v29 >= 2.0 && v15 >= 1.0;
  int v36 = (v25 >= 2.0) & ~v35;
  if (v15 < 1.0) {
    int v37 = (v25 >= 2.0) & ~v35;
  }
  else {
    int v37 = 0;
  }
  if (v18 || !(v35 | v37))
  {
    if (v20) {
      double v39 = v29;
    }
    else {
      double v39 = v19;
    }
    if (v20) {
      double v38 = v25;
    }
    else {
      double v38 = v22;
    }
  }

  else
  {
    double v38 = 1.0;
    if (v15 < 1.0)
    {
      double v39 = 0.649999976;
      [a4 localAspectRatio];
      double v33 = a3;
      double v42 = 0.649999976 / v15 * v44;
      BOOL v18 = 1;
      uint64_t v40 = 12LL;
      goto LABEL_46;
    }

    double v39 = 1.0 / v32 * v15;
  }

  uint64_t v40 = 21LL;
  BOOL v41 = v15 < 1.0 || v39 < 2.0;
  if (!v41)
  {
    int v43 = !v18;
    int v35 = 1;
    goto LABEL_53;
  }

  double v42 = v38;
LABEL_46:
  if (v42 >= 2.0) {
    int v45 = 1;
  }
  else {
    int v45 = v36;
  }
  if (v15 < 1.0) {
    int v37 = v45;
  }
  else {
    int v37 = 0;
  }
  int v43 = !v18;
  double v38 = v42;
LABEL_53:
  BOOL v46 = v15 >= 1.0;
  if (v39 < 1.89999998) {
    int v47 = 1;
  }
  else {
    int v47 = v43;
  }
  int v48 = v47 | v35;
  if (v48) {
    double v49 = v39;
  }
  else {
    double v49 = v39 * 0.925000012;
  }
  if (v48) {
    double v50 = v38;
  }
  else {
    double v50 = v38 * 0.925000012;
  }
  uint64_t v51 = 12LL;
  if (v49 >= 1.79999995) {
    uint64_t v51 = 5LL;
  }
  BOOL v52 = v18;
  BOOL v53 = v46 && v18;
  if (v46 && v18) {
    uint64_t v54 = v51;
  }
  else {
    uint64_t v54 = v40;
  }
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v56 = (v33 - mPhaseInDuration) * ((v33 - mPhaseInDuration) * ((v33 - mPhaseInDuration) * 3.0));
  if (v33 - mPhaseInDuration >= 0.0) {
    double v56 = 0.0;
  }
  double v57 = v56 + v34 * (v33 - mPhaseInDuration);
  double v58 = v57 + -0.100000001;
  if (v37)
  {
    int v205 = v37;
    unsigned int v59 = v17;
    BOOL v60 = v53;
    v61 = *(MRCAMLBezierData **)((char *)&self->mNumberOfLines + 1);
    if (!v61)
    {
      v218[0] = xmmword_1FA230;
      v218[1] = unk_1FA240;
      v61 = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v218);
      double v33 = a3;
      *(int64_t *)((char *)&self->mNumberOfLines + 1) = (int64_t)v61;
      double mPhaseInDuration = self->super.mPhaseInDuration;
    }

    -[MRCAMLBezierData evaluatAtTime:]( v61,  "evaluatAtTime:",  v33 / (self->super.mMainDuration + self->super.mPhaseOutDuration + mPhaseInDuration));
    double v33 = a3;
    double v63 = v50 * -0.5 + -1.0 + (v50 + -2.0 + 0.100000001 + 2.0999999) * v62;
    BOOL v53 = v60;
    unsigned int v17 = v59;
    int v37 = v205;
  }

  else
  {
    double v63 = v57 + -0.100000001;
    if (v15 > 2.0)
    {
      if (v17) {
        double v63 = v58 + 0.150000006;
      }
      else {
        double v63 = v57 + -0.100000001;
      }
    }
  }

  if ((v17 & 1) != 0) {
    double v64 = 0.0872664601;
  }
  else {
    double v64 = ((float)((float)v54 * -0.5) + (double)(self->super.mSeed % v54)) * 0.0174532924;
  }
  double x = CGPointZero.x;
  double v192 = v58;
  double v193 = v15;
  if ((v35 & 1) != 0 || ((v208 | v43) & 1) == 0 && v15 >= 1.0)
  {
    if ((v17 & 1) == 0)
    {
      double v64 = (double)(self->super.mSeed % 3) * -0.0174532924;
      if (!v212)
      {
LABEL_87:
        v66 = v204;
        CGFloat y = CGPointZero.y;
        goto LABEL_111;
      }

      goto LABEL_95;
    }

    double v64 = -0.0174532924;
    if (!v212) {
      goto LABEL_87;
    }
LABEL_92:
    int v68 = v35 ^ 1;
    if (v15 < 1.0) {
      int v68 = 0;
    }
    if ((v52 & v68) != 1)
    {
      double v69 = -0.449999988;
LABEL_100:
      double v71 = -0.300000012;
      if (!v17) {
        double v71 = 0.0;
      }
      if (v37) {
        double v69 = v71;
      }
      if (v35) {
        double x = v49 * 0.5 + -0.8;
      }
      else {
        double x = v69;
      }
      double v49 = v49 + 0.0500000007;
      double v50 = v50 + v32 * 0.0500000007;
      if (*(void *)(&self->super._isInInteractiveMode + 1))
      {
        CGFloat y = v63;
      }

      else
      {
        double v72 = v32;
        double v73 = v64;
        double v213 = x;
        double v74 = v50;
        double v75 = v63;
        v76 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
        *(void *)(&self->super._isInInteractiveMode + 1) = v76;
        -[MRCroppingSprite setNeedsInSpriteCoordinates:](v76, "setNeedsInSpriteCoordinates:", 1LL);
        double v64 = v73;
        double v32 = v72;
        CGFloat y = v75;
        double v50 = v74;
        double x = v213;
        double v33 = a3;
      }

      v66 = v204;
LABEL_111:
      double v214 = x;
      if (!v35 || (double v77 = self->super.mPhaseInDuration, v77 >= v33))
      {
        int v82 = 0;
        goto LABEL_122;
      }

      double v206 = y;
      double v209 = v64;
      double v78 = (v33 - v77) / self->super.mMainDuration;
      double v79 = 0.0;
      if (v17)
      {
        if (v78 >= 0.100000001)
        {
          double v80 = v78 + -0.100000001;
          double v81 = 0.899999976;
LABEL_119:
          float v83 = (v80 / v81 + -0.5) * 3.14159274;
          double v79 = (v49 + -1.60000002) * ((sinf(v83) + 1.0) * -0.5);
        }
      }

      else if (v78 >= 0.0199999996)
      {
        double v80 = v78 + -0.0199999996;
        double v81 = 0.980000019;
        goto LABEL_119;
      }

      MRMatrix_Clear((uint64_t)v218);
      float v84 = v79;
      *(float *)&double v85 = MRMatrix_Translate((float *)v218, v84, 0.0, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v218, v217, v85);
      int v82 = 1;
      CGFloat y = v206;
      double v64 = v209;
      goto LABEL_122;
    }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (!objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  x,  y)) {
    return 0LL;
  }
  id v11 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  v10 = @"image0";
  objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", @"image0"), "imageAspectRatio");
  if (v12 < 0.5 || v12 > 2.0) {
    return 0LL;
  }
  return (id)v10;
}

- (BOOL)getVerticesCoordinates:(MREffectSnapshot *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  v9 = &OBJC_IVAR___MREffectSnapshot_mSprite;
  if (v8) {
    v9 = &OBJC_IVAR___MREffectSnapshot_mTextSprite;
  }
  return [*(id *)((char *)&self->super.super.isa + *v9) getVerticesCoordinates:a3 withMatrix:a4];
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v4 = self->super.mPixelSize.width
     / dbl_1FA1E0[objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"layoutStyle"),  "integerValue") == (char *)&dword_0 + 1];
  double v5 = self->super.mPixelSize.height * 0.5;
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  if (v3 <= 2.0) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  unsigned int v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  v9 = *(MRCroppingSprite **)((char *)&self->mSprite + 1);
  if (v7)
  {
    if (!v9) {
      *(MRCroppingSprite **)((char *)&self->mSprite + 1) = (MRCroppingSprite *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)((char *)&self->mSprite + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mSprite + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mSprite + 1) setTruncate:1];
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "imageAspectRatio");
    if (v10 <= 2.0) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    [*(id *)((char *)&self->mSprite + 1) setMaxNumberOfLines:v11];
    objc_msgSend( *(id *)((char *)&self->mSprite + 1),  "setDefinedSize:",  self->super.mPixelSize.width / dbl_1FA1E0[objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"layoutStyle"),  "integerValue") == (char *)&dword_0 + 1],  self->super.mPixelSize.height * 0.5);
    [*(id *)((char *)&self->mSprite + 1) setText:v7];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mSprite + 1), "setScale:");
    double v12 = (CGContext *)[*(id *)((char *)&self->mSprite + 1) retainedContext];
    if (v12)
    {
      double v13 = v12;
      double v14 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v12);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v14;
      -[MRTextRenderer setLabel:](v14, "setLabel:", @"Marimba Snapshot Label");
      CGContextRelease(v13);
    }

    *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = (MRCroppingSprite *)[*(id *)((char *)&self->mSprite + 1) numberOfLines];
  }

  else
  {
    if (v9)
    {

      *(MRCroppingSprite **)((char *)&self->mSprite + 1) = 0LL;
    }

    double v15 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v15)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

@end