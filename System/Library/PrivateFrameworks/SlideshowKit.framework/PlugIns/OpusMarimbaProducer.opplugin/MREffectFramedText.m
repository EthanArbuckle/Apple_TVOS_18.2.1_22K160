@interface MREffectFramedText
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectFramedText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectFramedText)init;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectFramedText

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectFramedText;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* textImage */ \n\t\tDeclareTexture1; /* frame */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture1; \n\t\t\tlowp vec4 textColor = SampleTexture0; \n\t\t\tcolor.rgb = mix(color.rgb, textColor.rgb, textColor.a); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture01",
    @"FramedText");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* textImage */ \n\t\tDeclareTexture1; /* frame */ \n\t\tDeclareForeColorU; \n\t\tuniform mediump float uFactorX, uFactorY; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture1; \n\t\t\tlowp vec4 textColor = SampleTexture0; \n\t\t\tlowp float selectedColor = abs(mod(vTextureCoordinates1.s * uFactorX + vTextureCoordinates1.t * uFactorY, 16.) - 8.) - 3.5; \n\t\t\tcolor.rgb = mix(color.rgb, textColor.rgb * selectedColor * vec3(1., 1., 0.), textColor.a); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture01",
    @"FramedTextSelected");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* textImage */ \n\t\tDeclareTexture1; /* frame */ \n\t\tDeclareTexture2; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture1; \n\t\t\tlowp vec4 textColor = SampleTexture0; \n\t\t\tcolor.rgb = mix(color.rgb, textColor.rgb, textColor.a * (1.-SampleTexture2.r)); \n\t\t\tcolor.a = 1.; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture012",
    @"FramedTextMask");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* textImage */ \n\t\tDeclareTexture1; /* frame */ \n\t\tDeclareTexture2; /* mask */ \n\t\tDeclareForeColorU; \n\t\tuniform mediump float uFactorX, uFactorY; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture1; \n\t\t\tlowp vec4 textColor = SampleTexture0; \n\t\t\tlowp float selectedColor = abs(mod(vTextureCoordinates1.s * uFactorX + vTextureCoordinates1.t * uFactorY, 16.) - 8.) - 3.5; \n\t\t\tcolor.rgb = mix(color.rgb, textColor.rgb * selectedColor * vec3(1., 1., 0.), textColor.a * (1.-SampleTexture2.r)); \n\t\t\tcolor.a = 1.; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
    @"VertexTexture012",
    @"FramedTextMaskSelected");
}

- (MREffectFramedText)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MREffectFramedText;
  result = -[MREffectFramedText init](&v9, "init");
  if (result)
  {
    *(CGFloat *)((char *)&result->mTextRect.size.height + 1) = 0.0;
    *(CGFloat *)((char *)&result->mInnerFrameRect.origin.x + 1) = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    *(_OWORD *)((char *)&result->mInnerFrameRect.origin.y + 1) = _Q0;
    __int128 v8 = *(_OWORD *)((char *)&result->mInnerFrameRect.origin.y + 1);
    *(_OWORD *)((char *)&result->mFrameTextureCoordinates + 1) = *(_OWORD *)((char *)&result->mTextRect.size.height + 1);
    *(_OWORD *)((char *)&result->mTextRect.origin.y + 1) = v8;
  }

  return result;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  *(MRCroppingSprite **)((char *)&self->mSprite + 1) = 0LL;
  [*(id *)((char *)&self->mTextSprite + 1) releaseByUser];
  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
}

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectFramedText;
  -[MREffect setAttributes:](&v8, "setAttributes:", a3);
  v4 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"textRect");
  HIBYTE(self->mHitOffFrameTime) = v4 != 0LL;
  v5 = (CGFloat *)((char *)&self->mFrameTextureCoordinates + 1);
  if (v4)
  {
    CGRect v9 = CGRectFromString(v4);
    CGFloat *v5 = v9.origin.x;
    *(CGFloat *)((char *)&self->mTextRect.origin.x + 1) = v9.origin.y;
    *(CGFloat *)((char *)&self->mTextRect.origin.y + 1) = v9.size.width;
  }

  else
  {
    CGFloat *v5 = 0.0;
    *(CGFloat *)((char *)&self->mTextRect.origin.x + 1) = 0.0;
    *(CGFloat *)((char *)&self->mTextRect.origin.y + 1) = 1.0;
    v9.size.height = 1.0;
  }

  *(CGFloat *)((char *)&self->mTextRect.size.width + 1) = v9.size.height;
  v6 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"innerFrameRect");
  if (v6)
  {
    CGRect v10 = CGRectFromString(v6);
  }

  else
  {
    v10.size.width = 1.0;
    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.height = 1.0;
  }

  *(CGRect *)((char *)&self->mTextRect.size.height + 1) = v10;
  v7 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v7) {
    objc_msgSend(v7, "setInnerRect:");
  }
  LOBYTE(self->mVelocity) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"stretchesHorizontally"),  "BOOLValue");
  BYTE5(self->mHitOffFrameTime) = 1;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)isNative3D
{
  return 1;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  BOOL v5 = BYTE5(self->mHitOffFrameTime)
    || BYTE2(self->mVelocity) != BYTE1(self->mVelocity)
    || *(double *)((char *)&self->mScrollY + 1) != *(double *)((char *)&self->mYPosition + 1);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectFramedText;
  -[MREffect prerenderForTime:inContext:withArguments:](&v7, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return v5;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  int v9 = BYTE5(self->mHitOffFrameTime);
  BYTE5(self->mHitOffFrameTime) = 0;
  id v10 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [v10 setPreservesAspectRatio:0];
  if (v9 && LOBYTE(self->mVelocity))
  {
    [*(id *)((char *)&self->mTextSprite + 1) width];
    double v12 = v11;
    [*(id *)((char *)&self->mTextSprite + 1) height];
    double height = self->super.mPixelSize.height;
    double v15 = *(double *)((char *)&self->mInnerFrameRect.origin.y + 1)
        * (v12
         * (height
          * *(double *)((char *)&self->mTextRect.size.width + 1))
         / v14)
        / *(double *)((char *)&self->mTextRect.origin.y + 1);
    [v10 width];
    double v17 = height * v16;
    [v10 height];
    unint64_t v18 = 0LL;
    double v20 = v17 / v19;
    double v21 = *(double *)((char *)&self->mInnerFrameRect.size.width + 1);
    double v22 = v15 + v17 / v19 * (1.0 - *(double *)((char *)&self->mInnerFrameRect.origin.y + 1));
    double v23 = *(double *)((char *)&self->mTextRect.size.height + 1);
    double v24 = *(double *)((char *)&self->mInnerFrameRect.origin.x + 1);
    double v25 = v22 / self->super.mPixelSize.width;
    *(double *)((char *)&self->mInnerFrameRect.size.height + 1) = v25;
    *(float *)&double v20 = v20 * v23 / v22 * 2.0 + -1.0;
    *(float *)&double v23 = v24 * 2.0 + -1.0;
    float64x2_t v26 = *(float64x2_t *)((char *)&self->mTextRect.size.height + 1);
    float64x2_t v27 = *(float64x2_t *)((char *)&self->mInnerFrameRect.origin.y + 1);
    float v28 = self->super.mPixelSize.height / self->super.mPixelSize.width;
    *(_DWORD *)v110 = LODWORD(v20);
    *(float *)&v110[4] = *(float *)&v23 * v28;
    *(float *)&double v21 = *(float *)&v23 + v21 * 2.0;
    *(_DWORD *)&v110[8] = LODWORD(v20);
    *(float *)&v110[12] = *(float *)&v21 * v28;
    *(float *)&double v22 = *(float *)&v20 + v15 / v22 * 2.0;
    *(_DWORD *)&v110[16] = LODWORD(v22);
    *(float *)&v110[20] = *(float *)&v23 * v28;
    *(_DWORD *)&v110[24] = LODWORD(v22);
    *(float *)&v110[28] = *(float *)&v21 * v28;
    LODWORD(v111) = -1082130432;
    *((float *)&v111 + 1) = -v28;
    DWORD2(v111) = LODWORD(v20);
    *((float *)&v111 + 3) = *(float *)&v23 * v28;
    LODWORD(v112) = -1082130432;
    *((float *)&v112 + 1) = *(float *)&v23 * v28;
    DWORD2(v112) = LODWORD(v20);
    *((float *)&v112 + 3) = *(float *)&v21 * v28;
    LODWORD(v113) = -1082130432;
    *((float *)&v113 + 1) = *(float *)&v21 * v28;
    DWORD2(v113) = -1082130432;
    *((float *)&v113 + 3) = v28;
    LODWORD(v114) = -1082130432;
    *(void *)((char *)&v114 + 4) = __PAIR64__(LODWORD(v20), LODWORD(v28));
    *((float *)&v114 + 3) = *(float *)&v21 * v28;
    *(void *)&__int128 v115 = __PAIR64__(LODWORD(v28), LODWORD(v20));
    DWORD2(v115) = LODWORD(v22);
    *((float *)&v115 + 3) = *(float *)&v21 * v28;
    *(void *)&__int128 v116 = __PAIR64__(LODWORD(v28), LODWORD(v22));
    DWORD2(v116) = 1065353216;
    *((float *)&v116 + 3) = v28;
    LODWORD(v117) = 1065353216;
    *(void *)((char *)&v117 + 4) = __PAIR64__(LODWORD(v22), LODWORD(v28));
    *((float *)&v117 + 3) = *(float *)&v21 * v28;
    LODWORD(v118) = 1065353216;
    *((float *)&v118 + 1) = *(float *)&v21 * v28;
    DWORD2(v118) = LODWORD(v22);
    *((float *)&v118 + 3) = *(float *)&v23 * v28;
    LODWORD(v119) = 1065353216;
    *((float *)&v119 + 1) = *(float *)&v23 * v28;
    float32x2_t v29 = vcvt_f32_f64(v26);
    DWORD2(v119) = 1065353216;
    *((float *)&v119 + 3) = -v28;
    LODWORD(v120) = 1065353216;
    *((float *)&v120 + 1) = -v28;
    DWORD2(v120) = LODWORD(v22);
    *((float *)&v120 + 3) = *(float *)&v23 * v28;
    LODWORD(v121) = LODWORD(v22);
    *((float *)&v121 + 1) = -v28;
    DWORD2(v121) = LODWORD(v20);
    *((float *)&v121 + 3) = *(float *)&v23 * v28;
    LODWORD(v122) = LODWORD(v20);
    *((float *)&v122 + 1) = -v28;
    float64x2_t v30 = vaddq_f64(v27, vcvtq_f64_f32(v29));
    DWORD2(v122) = -1082130432;
    *((float *)&v122 + 3) = -v28;
    do
    {
      float v31 = v25 * *(float *)&v110[4 * v18];
      *(float *)&v110[4 * v18] = v31;
      _CF = v18 >= 0x36;
      v18 += 2LL;
    }

    while (!_CF);
    float32x2_t v33 = vcvt_f32_f64(v30);
    v34 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (!v34)
    {
      float32x2_t v103 = v33;
      float32x2_t v105 = v29;
      v34 = (MRImage *)malloc(0xE0uLL);
      float32x2_t v33 = v103;
      float32x2_t v29 = v105;
      *(MRImage **)((char *)&self->mTextImage + 1) = v34;
    }

    __int128 v35 = *(_OWORD *)&v110[16];
    *(_OWORD *)&v34->super.isa = *(_OWORD *)v110;
    *(_OWORD *)&v34->_referenceImage = v35;
    __int128 v36 = v111;
    __int128 v37 = v112;
    __int128 v38 = v114;
    *(_OWORD *)&v34->_centerY = v113;
    *(_OWORD *)&v34->_rotationAngle = v38;
    *(_OWORD *)&v34->_retainByUserCount = v36;
    *(_OWORD *)&v34->_texture = v37;
    __int128 v39 = v115;
    __int128 v40 = v116;
    __int128 v41 = v118;
    *(_OWORD *)&v34->_userData = v117;
    *(_OWORD *)&v34->_size.double height = v41;
    *(_OWORD *)&v34->_shader = v39;
    *(_OWORD *)&v34->_renderTime = v40;
    __int128 v42 = v119;
    __int128 v43 = v120;
    __int128 v44 = v122;
    *(_OWORD *)&v34[1]._imageManager = v121;
    *(_OWORD *)&v34[1]._centerX = v44;
    *(_OWORD *)&v34[1]._textureSource = v42;
    *(_OWORD *)&v34[1]._flags = v43;
    __int32 v45 = v29.i32[1];
    __int32 v46 = v33.i32[1];
    v47 = *(char **)((char *)&self->mVertices + 1);
    if (!v47)
    {
      float32x2_t v104 = v33;
      __int32 v106 = v29.i32[0];
      v47 = (char *)malloc(0xE0uLL);
      float32x2_t v33 = v104;
      v29.i32[0] = v106;
      *(float **)((char *)&self->mVertices + 1) = (float *)v47;
    }

    *(_DWORD *)v47 = v29.i32[0];
    *((_DWORD *)v47 + 1) = v45;
    *((_DWORD *)v47 + 2) = v29.i32[0];
    *((_DWORD *)v47 + 3) = v46;
    *((_DWORD *)v47 + 4) = v33.i32[0];
    *((_DWORD *)v47 + 5) = v45;
    *((float32x2_t *)v47 + 3) = v33;
    *((void *)v47 + 4) = 0LL;
    *((_DWORD *)v47 + 10) = v29.i32[0];
    *((_DWORD *)v47 + 11) = v45;
    *((_DWORD *)v47 + 12) = 0;
    *((_DWORD *)v47 + 13) = v45;
    *((_DWORD *)v47 + 14) = v29.i32[0];
    *((_DWORD *)v47 + 15) = v46;
    *((_DWORD *)v47 + 16) = 0;
    *((_DWORD *)v47 + 17) = v46;
    *(_OWORD *)(v47 + 72) = xmmword_1F5FA0;
    *((_DWORD *)v47 + 22) = v29.i32[0];
    *((_DWORD *)v47 + 23) = v46;
    *((_DWORD *)v47 + 24) = v29.i32[0];
    *((_DWORD *)v47 + 25) = 1065353216;
    *((float32x2_t *)v47 + 13) = v33;
    *((_DWORD *)v47 + 28) = v33.i32[0];
    __asm { FMOV            V1.4S, #1.0 }

    *(_OWORD *)(v47 + 116) = _Q1;
    *((_DWORD *)v47 + 33) = 1065353216;
    *((float32x2_t *)v47 + 17) = v33;
    *((_DWORD *)v47 + 36) = 1065353216;
    *((_DWORD *)v47 + 37) = v46;
    *((_DWORD *)v47 + 38) = v33.i32[0];
    *((_DWORD *)v47 + 39) = v45;
    *((_DWORD *)v47 + 40) = 1065353216;
    *((_DWORD *)v47 + 41) = v45;
    *(_OWORD *)(v47 + 168) = xmmword_1F6120;
    *((_DWORD *)v47 + 46) = v33.i32[0];
    *((_DWORD *)v47 + 47) = v45;
    *((_DWORD *)v47 + 48) = v33.i32[0];
    *((_DWORD *)v47 + 49) = 0;
    *((_DWORD *)v47 + 50) = v29.i32[0];
    *((_DWORD *)v47 + 51) = v45;
    *((_DWORD *)v47 + 52) = v29.i32[0];
    *(void *)(v47 + 212) = 0LL;
    *((_DWORD *)v47 + 55) = 0;
  }

  double v51 = MRGetCurrentTime();
  if (BYTE2(self->mVelocity))
  {
    double v52 = *(double *)((char *)&self->mScrollY + 1);
    if (BYTE1(self->mVelocity))
    {
      float v53 = (v52 - *(double *)((char *)&self->mYPosition + 1)) / (v51 - *(double *)((char *)&self->mNewScrollY + 1));
      *(float *)((char *)&self->mHitOffFrameTime + 1) = v53;
    }

    else
    {
      *(double *)((char *)&self->mYPosition + 1) = v52;
      *(_DWORD *)((char *)&self->mHitOffFrameTime + 1) = 0;
    }
  }

  else
  {
    double v54 = 1.0;
    double v55 = (*(double *)((char *)&self->mFrameTime + 1) - v51 + 1.0) * 0.5;
    if (v55 < 0.0) {
      double v55 = 0.0;
    }
    double v56 = v55 * (v55 * (v55 * -2.0)) + v55 * 3.0 * v55 + v55 * (v55 * (v55 * -2.0)) + v55 * 3.0 * v55;
    if (v56 <= 1.0)
    {
      double v54 = v56;
      if (v56 < 0.0) {
        double v54 = 0.0;
      }
    }

    *(double *)((char *)&self->mScrollY + 1) = *(double *)((char *)&self->mYPosition + 1)
                                             + v54
  }

  v57 = (float64x2_t *)((char *)&self->mFrameTextureCoordinates + 1);
  double v58 = *(double *)((char *)&self->mTextRect.origin.y + 1);
  double v59 = v58 / *(double *)((char *)&self->mTextRect.size.width + 1);
  [a4 localAspectRatio];
  double v61 = v59 * v60;
  [*(id *)((char *)&self->mTextSprite + 1) aspectRatio];
  if (v61 > v62)
  {
    double v63 = v62 / v61;
    *(double *)((char *)&self->mHalfWidth + 1) = v64;
    double v62 = v62 / v61 + -1.0;
    if (v64 < v62 || (double v62 = 1.0 - v63, v64 > 1.0 - v63)) {
      *(double *)((char *)&self->mHalfWidth + 1) = v62;
    }
  }

  if (*(MRCroppingSprite **)((char *)&self->mTextSprite + 1))
  {
    double v65 = *(double *)((char *)&self->mTextRect.origin.y + 1) / *(double *)((char *)&self->mTextRect.size.width + 1);
    [a4 localAspectRatio];
    double v67 = v65 * v66;
    [*(id *)((char *)&self->mTextSprite + 1) aspectRatio];
    double v68 = v67 / v62;
  }

  else
  {
    double v68 = 1.0;
  }

  uint64_t v69 = 352LL;
  if (!LOBYTE(self->mVelocity))
  {
    [*(id *)((char *)&self->mTextSprite + 1) setScale:v58];
    objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "setCenterX:",  1.0 - (*(double *)((char *)&self->mTextRect.origin.y + 1)
     + *(double *)((char *)&self->mFrameTextureCoordinates + 1) * 2.0));
    objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "setCenterY:",  1.0 - (*(double *)((char *)&self->mTextRect.size.width + 1)
  }

  if (!*(MRTextRenderer **)((char *)&self->mTextRenderer + 1))
  {
    v70 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = (MRTextRenderer *)v70;
    -[MRCroppingSprite setInnerRect:]( v70,  "setInnerRect:",  *(double *)((char *)&self->mTextRect.size.height + 1),  *(double *)((char *)&self->mInnerFrameRect.origin.x + 1),  *(double *)((char *)&self->mInnerFrameRect.origin.y + 1),  *(double *)((char *)&self->mInnerFrameRect.size.width + 1));
  }

  if (v10) {
    _ZF = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) == 0LL;
  }
  else {
    _ZF = 1;
  }
  if (_ZF)
  {
    if (*(MRImage **)((char *)&self->mTextImage + 1))
    {
      LODWORD(v62) = 0;
      [a4 setImage:v10 onTextureUnit:0 withReferenceAspectRatio:v110 state:v62];
      [a4 setTextureCoordinatesPointer:*(float **)((char *)&self->mVertices + 1) onTextureUnit:0];
      [a4 setVertex2DPointer:*(MRImage **)((char *)&self->mTextImage + 1)];
      [a4 setShader:@"PlainTexture"];
      [a4 drawTriangleStripFromOffset:0 count:4];
      [a4 blend:2];
      [a4 drawTriangleStripFromOffset:4 count:24];
      [a4 blend:0];
      [a4 unsetShader];
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a4 unsetVertexPointer];
      [a4 unsetImage:v10 onTextureUnit:0 state:v110];
    }

    else
    {
      [a4 blend:2];
      [a4 setShader:@"PlainTexture"];
      else {
        id v80 = v10;
      }
      LODWORD(v79) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "renderImage:inContext:atPosition:andSize:zRotation:",  v80,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v79);
      [a4 unsetShader];
      [a4 blend:0];
    }

    v81 = &selRef_gestureRecognizerShouldBegin_;
  }

  else
  {
    id v72 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    [v72 setPreservesAspectRatio:0];
    [v72 setScale:v58];
    [v72 setCenterX:*(double *)((char *)&self->mFrameTextureCoordinates + 1) / *(double *)((char *)&self->mTextRect.origin.y + 1)];
    [v72 setCenterY:-*(double *)((char *)&self->mTextRect.origin.x + 1) / *(double *)((char *)&self->mTextRect.size.width + 1)];
    LODWORD(v73) = 0;
    [a4 setImage:v10 onTextureUnit:1 withReferenceAspectRatio:&v109 state:v73];
    if (v72)
    {
      LODWORD(v74) = 0;
      [a4 setImage:v72 onTextureUnit:2 withReferenceAspectRatio:&v108 state:v74];
    }

    if (-[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"))
    {
      if (v72) {
        v75 = @"FramedTextMaskSelected";
      }
      else {
        v75 = @"FramedTextSelected";
      }
      objc_msgSend(a4, "setShader:", v75, 352);
      CGFloat v76 = self->super.mPixelSize.width * 0.2;
      *(float *)&CGFloat v76 = v76;
      [a4 setShaderUniformFloat:@"uFactorX" forKey:v76];
      CGFloat v77 = self->super.mPixelSize.height * 0.2;
      *(float *)&CGFloat v77 = v77;
      [a4 setShaderUniformFloat:@"uFactorY" forKey:v77];
    }

    else
    {
      if (v72) {
        v82 = @"FramedTextMask";
      }
      else {
        v82 = @"FramedText";
      }
      objc_msgSend(a4, "setShader:", v82, 352);
    }

    if (*(MRImage **)((char *)&self->mTextImage + 1))
    {
      v83 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
      [v83 aspectRatio];
      *(float *)&double v84 = v84;
      [a4 setImage:v83 onTextureUnit:0 withReferenceAspectRatio:&v107 state:v84];
      float64x2_t v85 = *(float64x2_t *)((char *)&self->mTextRect.origin.y + 1);
      float64x2_t v86 = *(float64x2_t *)((char *)&self->mInnerFrameRect.origin.y + 1);
      float64x2_t v87 = vsubq_f64(*(float64x2_t *)((char *)&self->mTextRect.size.height + 1), *v57);
      __asm { FMOV            V2.2D, #-1.0 }

      float64x2_t v89 = vaddq_f64(vdivq_f64(vaddq_f64(v87, v87), v85), _Q2);
      *(float32x2_t *)v110 = vcvt_f32_f64(v89);
      *(_DWORD *)&v110[8] = *(_DWORD *)v110;
      *(float32x2_t *)&v85.f64[0] = vcvt_f32_f64(vaddq_f64(v89, vdivq_f64(vaddq_f64(v86, v86), v85)));
      *(int32x2_t *)&v110[12] = vrev64_s32(*(int32x2_t *)&v85.f64[0]);
      *(int8x8_t *)&v110[20] = vext_s8(*(int8x8_t *)v110, *(int8x8_t *)&v85.f64[0], 4uLL);
      *(_DWORD *)&v110[28] = HIDWORD(v85.f64[0]);
      [a4 setTextureCoordinatesPointer:v110 onTextureUnit:0];
      [a4 setVertex2DPointer:*(MRImage **)((char *)&self->mTextImage + 1)];
      [a4 setTextureCoordinatesPointer:*(float **)((char *)&self->mVertices + 1) onTextureUnit:1];
      if (v72)
      {
        [a4 setTextureCoordinatesPointer:*(float **)((char *)&self->mVertices + 1) onTextureUnit:2];
        [a4 drawTriangleStripFromOffset:0 count:4];
        [a4 unsetTextureCoordinatesPointerOnTextureUnit:2];
      }

      else
      {
        [a4 drawTriangleStripFromOffset:0 count:4];
      }

      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a4 unsetImage:*(MRCroppingSprite **)((char *)&self->mTextSprite + 1) onTextureUnit:0 state:&v107];
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      LODWORD(v92) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  CGPointZero.x,  y,  *(double *)((char *)&self->mInnerFrameRect.size.height + 1)
      + *(double *)((char *)&self->mInnerFrameRect.size.height + 1),
        2.0,
        v92);
    }

    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      LODWORD(v78) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1),  a4,  CGPointZero.x,  y,  2.0,  2.0,  v78);
    }

    [a4 unsetShader];
    v81 = &selRef_gestureRecognizerShouldBegin_;
    if (v72) {
      [a4 unsetImage:v72 onTextureUnit:2 state:&v108];
    }
    if (*(MRImage **)((char *)&self->mTextImage + 1))
    {
      uint64_t v69 = v102;
      if (HIBYTE(self->mHitOffFrameTime))
      {
        [a4 blend:2];
        [a4 setShader:@"PlainTexture1"];
        [a4 drawTriangleStripFromOffset:4 count:24];
        [a4 unsetShader];
        [a4 blend:0];
      }

      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
      [a4 unsetVertexPointer];
      [a4 unsetImage:v10 onTextureUnit:1 state:&v109];
    }

    else
    {
      [a4 unsetImage:v10 onTextureUnit:1 state:&v109];
      uint64_t v69 = v102;
      if (HIBYTE(self->mHitOffFrameTime))
      {
        [a4 blend:2];
        [a4 setShader:@"PlainTexture"];
        LODWORD(v93) = 0;
        objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v10,  a4,  x,  y,  2.0,  2.0,  v93);
        [a4 unsetShader];
        [a4 blend:0];
      }
    }

    if (v72) {
      [v72 releaseByUser];
    }
  }

  [v10 releaseByUser];
  char v95 = BYTE2(self->mVelocity);
  if (v95)
  {
    *(double *)((char *)&self->mYPosition + 1) = *(double *)((char *)&self->mScrollY + 1);
    *(double *)((char *)&self->mFrameTime + 1) = v51;
  }

  BYTE1(self->mVelocity) = v95;
  *(double *)((char *)&self->mNewScrollY + 1) = v51;
  if (*((_BYTE *)&self->super.super.isa + *((int *)v81 + 254)))
  {
    double v96 = *(double *)((char *)&self->mTextRect.origin.y + 1);
    double v97 = *(double *)((char *)&self->mTextRect.size.width + 1);
    double v98 = v96 + v96;
    double v99 = v68 * (v97 + v97);
    double v94 = 2.0;
    double v100 = v96 + v57->f64[0] * 2.0 + -1.0;
    double v101 = v97 + *(double *)((char *)&self->mTextRect.origin.x + 1) * 2.0 + -1.0;
  }

  else
  {
    double v100 = CGPointZero.x;
    double v101 = CGPointZero.y;
    double v99 = 2.0;
    double v98 = 2.0;
  }

  if (*((_BYTE *)&self->super.super.isa + v69))
  {
    double v94 = *(double *)((char *)&self->mInnerFrameRect.size.height + 1);
    double v98 = v98 * v94;
  }

  LODWORD(v94) = 0;
  objc_msgSend( *(id *)((char *)&self->mSprite + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  v100,  v101,  v98,  v99,  v94);
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectFramedText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mSprite + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  unsigned int v8 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
  }

  int v9 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    p_mPixelSize = &self->super.mPixelSize;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", CGSizeZero.width, CGSizeZero.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:0];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInset:", 1.0, 1.0);
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    if (-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"))
    {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"),  "integerValue"));
    }

    if (HIBYTE(self->mHitOffFrameTime)) {
      double width = *(double *)((char *)&self->mTextRect.origin.y + 1) * p_mPixelSize->width;
    }
    else {
      double width = p_mPixelSize->width;
    }
    double v12 = 1000000.0;
    if (LOBYTE(self->mVelocity)
      && [*(id *)(&self->super._isInInteractiveMode + 1) maxNumberOfLines] == (char *)&dword_0 + 1)
    {
      double v12 = self->super.mPixelSize.height * *(double *)((char *)&self->mTextRect.size.width + 1);
    }

    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", width, v12);
    if (!LOBYTE(self->mVelocity))
    {
      [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:1];
      [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfText];
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", width, fmin(v13, 2048.0));
    }

    double v14 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v14)
    {
      double v15 = v14;
      double v16 = (MRCroppingSprite *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v14);
      *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = v16;
      -[MRCroppingSprite setLabel:](v16, "setLabel:", @"Marimba FramedText Text");
      CGContextRelease(v15);
    }
  }

  else if (v9)
  {

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  BYTE5(self->mHitOffFrameTime) = 1;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  if ([-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@SizeAsMax", a3)), "BOOLValue"])
  {
    double width = *(double *)((char *)&self->mTextRect.origin.y + 1) * 0.5 * self->super.mPixelSize.width;
    double height = *(double *)((char *)&self->mTextRect.size.width + 1) * 0.5 * self->super.mPixelSize.height;
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  result.double height = height;
  result.double width = width;
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
  v3 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
  }

  id v4 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v4)
  {

    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  BOOL v5 = *(MRCroppingSprite **)((char *)&self->mSprite + 1);
  if (v5)
  {

    *(MRCroppingSprite **)((char *)&self->mSprite + 1) = 0LL;
  }

  v6 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v6)
  {
    [v6 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  id v7 = *(MRImage **)((char *)&self->mTextImage + 1);
  if (v7)
  {
    free(v7);
    *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  }

  unsigned int v8 = *(float **)((char *)&self->mVertices + 1);
  if (v8)
  {
    free(v8);
    *(float **)((char *)&self->mVertices + 1) = 0LL;
  }

- (double)pzrStart:(id)a3
{
  BYTE2(self->mVelocity) = 1;
  *(double *)((char *)&self->mScrollY + 1) = 0.0;
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  BYTE2(self->mVelocity) = 1;
  *(double *)((char *)&self->mScrollY + 1) = *((double *)a3 + 5);
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  BYTE2(self->mVelocity) = 0;
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  BYTE2(self->mVelocity) = 0;
  return 0.0;
}

@end