@interface MRTransitionFlatPageFlip
- (BOOL)controlsLayersTime;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRTransitionFlatPageFlip)initWithTransitionID:(id)a3;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRTransitionFlatPageFlip

- (MRTransitionFlatPageFlip)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionFlatPageFlip;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result)
  {
    result->mCurves[0] = 0LL;
    result->mCurves[1] = 0LL;
  }

  return result;
}

- (void)cleanup
{
  mCurves = self->mCurves;

  *mCurves = 0LL;
  mCurves[1] = 0LL;
  -[MRImageProvider cleanup](self->mPortraitShadow, "cleanup");

  self->mPortraitShadow = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionFlatPageFlip;
  -[MRTransition cleanup](&v4, "cleanup");
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionFlatPageFlip;
  -[MRTransition setPixelSize:](&v6, "setPixelSize:");
  -[MRImageProvider setDefaultSize:](self->mPortraitShadow, "setDefaultSize:", width, height);
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)isLoadedForTime:(double)a3
{
  mPortraitShadow = self->mPortraitShadow;
  if (mPortraitShadow) {
    return -[MRImageProvider isLoaded](mPortraitShadow, "isLoaded", a3);
  }
  else {
    return 1;
  }
}

- (void)unload
{
  self->mPortraitShadow = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionFlatPageFlip;
  -[MRTransition unload](&v3, "unload");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (v9 < 1.0 && !self->mPortraitShadow)
  {
    self->mPortraitShadow = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    -[MRImageProvider setAssetPath:]( self->mPortraitShadow,  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PortfolioSlide",  @"pageShadowPortrait.png"));
    -[MRImageProvider setImageSizeScript:]( self->mPortraitShadow,  "setImageSizeScript:",  @"layerWidth, layerHeight");
    -[MRImageProvider setOriginalImageSize:](self->mPortraitShadow, "setOriginalImageSize:", 576.0, 768.0);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRTransitionFlatPageFlip;
  -[MRTransition prerenderForTime:inContext:withArguments:]( &v12,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  mPortraitShadow = self->mPortraitShadow;
  if (mPortraitShadow) {
    -[MRImageProvider prerenderForTime:inContext:withArguments:]( mPortraitShadow,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  }
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = 1.0 / v9;
  if ((float)(1.0 / v9) > 0.0)
  {
    [a4 localAspectRatio];
    float v12 = v11;
    unsigned int v13 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedCharValue");
    unsigned int v14 = v13;
    v15 = &OBJC_IVAR___MRTransition_mSourceLayer;
    if (v13 >= 2) {
      v16 = &OBJC_IVAR___MRTransition_mSourceLayer;
    }
    else {
      v16 = &OBJC_IVAR___MRTransition_mTargetLayer;
    }
    v17 = *(Class *)((char *)&self->super.super.isa + *v16);
    if (v13 >= 2) {
      v15 = &OBJC_IVAR___MRTransition_mTargetLayer;
    }
    v18 = *(Class *)((char *)&self->super.super.isa + *v15);
    mCurves = self->mCurves;
    v20 = self->mCurves[0];
    if (v12 >= 1.0)
    {
      if (!v20 || !self->mCurves[1])
      {
        __int128 v64 = xmmword_1F6FA0;
        __int128 v65 = xmmword_1F7D80;
        *mCurves = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v64);
        __int128 v64 = xmmword_1F7D90;
        __int128 v65 = xmmword_1F7DA0;
        self->mCurves[1] = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v64);
      }

      v22 = (double *)&unk_2AE388;
      v23 = &unk_2AE3A0;
      double v24 = 1.0;
      v25 = self->mCurves;
      double v26 = a3;
      uint64_t v27 = 3LL;
    }

    else
    {
      if (!v20)
      {
        __int128 v64 = xmmword_1FC280;
        __int128 v65 = xmmword_1FC290;
        *mCurves = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  &v64);
      }

      v21 = self->mCurves[1];
      if (v21)
      {

        self->mCurves[1] = 0LL;
      }

      v22 = (double *)&unk_2AE368;
      v23 = &unk_2AE378;
      double v24 = 1.0;
      v25 = self->mCurves;
      double v26 = a3;
      uint64_t v27 = 2LL;
    }

    ValueFromBezierPath((id *)v25, v22, 0.0, v24, v26, (uint64_t)v23, v27);
    double v29 = 3.14159274 - v28;
    p_mPixelSize = &self->super.mPixelSize;
    double height = self->super.mPixelSize.height;
    int width = (int)self->super.mPixelSize.width;
    uint64_t v67 = 0LL;
    v68.i32[0] = width;
    v68.i32[1] = (int)height;
    if (v12 >= 1.0)
    {
      if ((v14 & 1) == 0) {
        int width = (int)height;
      }
      uint64_t v39 = 8LL;
      if ((v14 & 1) == 0) {
        uint64_t v39 = 12LL;
      }
      *(_DWORD *)((char *)&v67 + v39) = width >> 1;
      [a4 setScissorRect:&v67 saveTo:v66];
      objc_msgSend(objc_msgSend(v17, "clock"), "externalTime");
      objc_msgSend(v17, "renderAtTime:inContext:withArguments:", a4, a5);
      if (v29 < 1.57079633 && v18 != 0LL)
      {
        v41 = (float *)[v18 renderingState];
        if (v41)
        {
          v42 = v41;
          if ((v14 & 1) != 0) {
            uint64_t v44 = 8LL;
          }
          else {
            uint64_t v44 = 7LL;
          }
          float v43 = v29 * 57.2957795;
          v41[v44] = v43;
          float v45 = v41[10];
          float v46 = v29;
          v41[10] = (float)((float)(cosf(v46) * 0.35) + 0.65) * v45;
          objc_msgSend(objc_msgSend(v18, "clock"), "externalTime");
          objc_msgSend(v18, "renderAtTime:inContext:withArguments:", a4, a5);
          v42[v44] = 0.0;
          v42[10] = v45;
        }
      }

      if ((v14 & 1) != 0) {
        __int32 v47 = 0;
      }
      else {
        __int32 v47 = v68.i32[1];
      }
      LODWORD(v67) = ((int)(v14 << 31) >> 31) & v68.i32[0];
      HIDWORD(v67) = v47;
      int32x2_t v68 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)p_mPixelSize));
      [a4 setScissorRect:&v67 saveTo:0];
      objc_msgSend(objc_msgSend(v18, "clock"), "externalTime");
      objc_msgSend(v18, "renderAtTime:inContext:withArguments:", a4, a5);
      if (v29 < 1.57079633)
      {
LABEL_53:
        [a4 restoreScissorRect:v66];
        return;
      }
    }

    else
    {
      objc_msgSend(objc_msgSend(v18, "clock"), "externalTime");
      objc_msgSend(v18, "renderAtTime:inContext:withArguments:", a4, a5);
      [a4 setShader:@"PlainTexture"];
      [a4 blend:2];
      id v33 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mPortraitShadow,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
      double v37 = 0.0;
      HIDWORD(v38) = 1072273817;
      if (a3 > 0.8)
      {
        HIDWORD(v34) = -1077306983;
        double v38 = (a3 + -0.800000012) / -0.200000003;
        double v37 = v38 + v38;
      }

      LODWORD(v36) = 1053609165;
      LODWORD(v38) = 1.0;
      LODWORD(v34) = 1.0;
      LODWORD(v35) = 1.0;
      [a4 composeForeColorRed:&v64 green:v38 blue:v34 alpha:v35 saveTo:v36];
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v33,  a4,  v37,  0.0,  2.0,  2.0);
      [a4 restoreForeColor:&v64];
      [a4 blend:0];
      [v33 releaseByUser];
      [a4 unsetShader];
    }

    if (!v17 || (v48 = (float *)[v17 renderingState]) == 0)
    {
      float v55 = v29 + 3.14159265;
      *(float *)&double v56 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)&v64, v55, 0.0, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", &v64, v63, v56);
      [a4 setShader:@"PlainTexture"];
      id v57 = [a4 retainedByUserBlackImage];
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v57,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
      [v57 releaseByUser];
      [a4 unsetShader];
      [a4 restoreModelViewMatrix:v63];
      goto LABEL_52;
    }

    v49 = v48;
    float v50 = v29 * 57.2957795 + 180.0;
    if ((v14 & 1) != 0)
    {
      v48[8] = v50;
      if (v12 < 1.0)
      {
        float v58 = v29;
        __float2 v59 = __sincosf_stret(v58);
        float sinval = v59.__sinval;
        v49[2] = -(float)(v59.__cosval + 1.0);
        goto LABEL_46;
      }
    }

    else
    {
      v48[7] = v50;
      if (v12 < 1.0)
      {
        float v51 = v29;
        __float2 v52 = __sincosf_stret(v51);
        float v53 = (v52.__cosval + 1.0) * (float)-v10;
        v49[3] = v53;
        float sinval = v10 * v52.__sinval;
LABEL_46:
        v49[4] = sinval * 0.75;
        v49[6] = 0.75;
      }
    }

    float v60 = v49[10];
    float v61 = 3.14159265 - v29;
    v49[10] = (float)((float)(cosf(v61) * 0.35) + 0.65) * v60;
    objc_msgSend(objc_msgSend(v17, "clock"), "externalTime");
    objc_msgSend(v17, "renderAtTime:inContext:withArguments:", a4, a5);
    uint64_t v62 = 8LL;
    if ((v14 & 1) == 0) {
      uint64_t v62 = 7LL;
    }
    v49[v62] = 0.0;
    if (v12 < 1.0)
    {
      *((void *)v49 + 1) = 0LL;
      v49[4] = 0.0;
      v49[6] = 1.0;
    }

    v49[10] = v60;
LABEL_52:
    if (v12 < 1.0) {
      return;
    }
    goto LABEL_53;
  }

@end