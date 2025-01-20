@interface MREffectWatercolorPanel
- (BOOL)getVerticesCoordinates:(MREffectWatercolorPanel *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectWatercolorPanel)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderBreakAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderEffect2AtTime:(double)a3 isSquare:(BOOL)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)renderEffect3AtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderEffectSubtitleAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderSubtitleBreakAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectWatercolorPanel

- (MREffectWatercolorPanel)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectWatercolorPanel;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3) {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return (MREffectWatercolorPanel *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
}

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectWatercolorPanel;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    v6 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
    if (v6)
    {

      *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = (MRCroppingSprite *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Effect2"))
  {
    v9 = self;
    double v10 = a3;
    uint64_t v11 = 0LL;
LABEL_3:
    -[MREffectWatercolorPanel renderEffect2AtTime:isSquare:inContext:withArguments:]( v9,  "renderEffect2AtTime:isSquare:inContext:withArguments:",  v11,  a4,  v10);
    return;
  }

  if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Effect3"))
  {
    -[MREffectWatercolorPanel renderEffect3AtTime:inContext:withArguments:]( self,  "renderEffect3AtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Subtitle"))
  {
    -[MREffectWatercolorPanel renderEffectSubtitleAtTime:inContext:withArguments:]( self,  "renderEffectSubtitleAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  else if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"SubtitleBreak"))
  {
    -[MREffectWatercolorPanel renderSubtitleBreakAtTime:inContext:withArguments:]( self,  "renderSubtitleBreakAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  else
  {
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Effect4"))
    {
      v9 = self;
      double v10 = a3;
      uint64_t v11 = 1LL;
      goto LABEL_3;
    }

    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Break")) {
      -[MREffectWatercolorPanel renderBreakAtTime:inContext:withArguments:]( self,  "renderBreakAtTime:inContext:withArguments:",  a4,  a5,  a3);
    }
  }

- (void)renderBreakAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [v9 setUsesBackgroundColorAsBorderColor:1];
  [v9 aspectRatio];
  double v11 = v10;
  [a4 localAspectRatio];
  if (v11 >= 1.0)
  {
    double v13 = (float)(v12 * 0.55556);
    double v14 = 2.0;
  }

  else
  {
    double v13 = 2.0;
    double v14 = 1.3 / v12;
  }

  [a4 localAspectRatio];
  float v16 = v15;
  [v9 aspectRatio];
  if (v17 < 0.5 || v17 > 2.0)
  {
    double v19 = v14 / v13 * v16;
    [v9 aspectRatio];
    if ((v19 <= 1.0 || v20 >= 1.0) && (v19 >= 1.0 || v20 <= 1.0))
    {
      double v23 = v20 >= 1.0 ? v20 / v19 : v19 / v20;
      if (v23 >= 1.1)
      {
        [v9 aspectRatio];
        double v25 = v24;
        [v9 centerX];
        double v54 = v26;
        [v9 centerY];
        double v28 = v27;
        double v29 = 0.0;
        double v30 = v25 / v19;
        if (v25 < 0.5) {
          double v29 = 1.0 - v25 / v19;
        }
        if (v25 > 2.0) {
          double v31 = 1.0 - v19 / v25;
        }
        else {
          double v31 = v29;
        }
        id v32 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)((char *)&self->mTextSprite + 1), "objectForKey:", @"image0"),  "objectForKey:",  @"panEndDirection"),  "integerValue");
        float v33 = (a3 / self->super.mMainDuration + -0.5) * 3.14159274;
        double v34 = (sinf(v33) + 1.0) * 0.5;
        double v35 = -(v31 - v34 * (v31 + v31));
        double v36 = -(v34 * (v31 + v31) - v31);
        if (v32 != (id)-1LL) {
          double v36 = v35;
        }
        BOOL v37 = v25 <= 2.0;
        if (v25 <= 2.0) {
          double v38 = v36;
        }
        else {
          double v38 = v28;
        }
        if (v37) {
          double v36 = v54;
        }
        [v9 setCenterX:v36];
        [v9 setCenterY:v38];
        objc_msgSend(v9, "setScale:", fmax(v30, 1.0));
      }
    }
  }

  if (a3 >= 1.5)
  {
    double v40 = self->super.mMainDuration + -1.5;
    double v39 = 1.0;
    if (v40 <= a3) {
      double v39 = (a3 - v40) / -1.5 + 1.0;
    }
  }

  else
  {
    double v39 = a3 / 1.5;
  }

  v41 = *(void **)(&self->super._isInInteractiveMode + 1);
  v42 = (MRCroppingSprite *)[v41 objectForKey:@"image0"];
  if (!v42)
  {
    v42 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v41 setObject:v42 forKey:@"image0"];
  }

  p_mPixelSize = &self->super.mPixelSize;
  -[MRCroppingSprite setInnerRect:]( v42,  "setInnerRect:",  2.0 / (v14 * p_mPixelSize->width * 0.4),  2.0 / (v13 * p_mPixelSize->height * 0.4),  1.0 - 4.0 / (v14 * p_mPixelSize->width * 0.4),  1.0 - 4.0 / (v13 * p_mPixelSize->height * 0.4));
  __asm { FMOV            V0.2S, #1.0 }

  uint64_t v56 = _D0;
  int v57 = 1065353216;
  *(float *)&_D0 = v39;
  int v58 = _D0;
  [a4 composeForeColor:&v56 saveTo:v55];
  [a4 setShader:@"SoftspritePremultiplied"];
  double v48 = v14 * p_mPixelSize->width * 0.4;
  *(float *)&double v48 = v48;
  double v49 = v13 * p_mPixelSize->height * 0.4;
  *(float *)&double v49 = v49;
  [a4 setShaderUniformVec2:@"invRadii" :v48 forKey:v49];
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v42, "setNeedsInSpriteCoordinates:", 1LL);
  double y = CGPointZero.y;
  LODWORD(v51) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v42,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v9,  a4,  CGPointZero.x,  y,  v14,  v13,  v51);
  [a4 unsetShader];
  else {
    v52 = @"PlainTexture";
  }
  [a4 setShader:v52];
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v42, "setNeedsInSpriteCoordinates:", 0LL);
  LODWORD(v53) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v42,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v9,  a4,  CGPointZero.x,  y,  v14,  v13,  v53);
  [a4 unsetShader];
  [a4 restoreForeColor:v55];
  [v9 releaseByUser];
  [a4 blend:0];
}

- (void)renderSubtitleBreakAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [v9 setUsesBackgroundColorAsBorderColor:1];
  [v9 aspectRatio];
  double v11 = v10;
  [a4 localAspectRatio];
  if (v11 < 1.0)
  {
    double v13 = 2.0;
    double v14 = 1.3 / v12;
  }

  else
  {
    double v13 = (float)(v12 * 0.55556);
    double v14 = 2.0;
  }

  [a4 localAspectRatio];
  float v16 = v15;
  [v9 aspectRatio];
  if (v17 >= 0.5 && v17 <= 2.0) {
    goto LABEL_31;
  }
  double v19 = v14 / v13 * v16;
  [v9 aspectRatio];
  if (v19 > 1.0 && v20 < 1.0) {
    goto LABEL_31;
  }
  if (v19 < 1.0 && v20 > 1.0) {
    goto LABEL_31;
  }
  double v23 = v20 >= 1.0 ? v20 / v19 : v19 / v20;
  if (v23 < 1.1) {
    goto LABEL_31;
  }
  [v9 aspectRatio];
  double v25 = v24;
  [v9 centerX];
  [v9 centerY];
  double v27 = v26;
  if (v25 > 2.0)
  {
    double v28 = v19 / v25;
LABEL_25:
    double v29 = 1.0 - v28;
    goto LABEL_26;
  }

  double v29 = 0.0;
  if (v25 < 0.5)
  {
    double v28 = v25 / v19;
    goto LABEL_25;
  }

- (void)renderEffect2AtTime:(double)a3 isSquare:(BOOL)a4 inContext:(id)a5 withArguments:(id)a6
{
  BOOL v8 = a4;
  [a5 blend:2];
  id v11 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  id v12 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image1");
  id v13 = [v11 retainedByUserRenderedImageAtTime:a5 inContext:a6 withArguments:a3];
  [v13 setUsesBackgroundColorAsBorderColor:1];
  id v14 = [v12 retainedByUserRenderedImageAtTime:a5 inContext:a6 withArguments:a3];
  [v14 setUsesBackgroundColorAsBorderColor:1];
  [a5 localAspectRatio];
  double v16 = 1.9;
  if (v8) {
    double v16 = 1.6;
  }
  double v17 = v16 / v15;
  double mMainDuration = self->super.mMainDuration;
  if (!v8) {
    double v17 = v17 * 0.666666667;
  }
  double v19 = a3 / mMainDuration * 0.1 + 0.9;
  double v20 = v17 * v19;
  double v21 = v16 * v19;
  if (a3 >= 1.5)
  {
    if (a3 + -1.5 >= 1.5)
    {
      double v23 = mMainDuration + -1.5;
      double v24 = 0.0;
      if (v23 > a3)
      {
        double v24 = 1.0;
        if (v23 + -1.5 <= a3) {
          double v24 = (a3 - (v23 + -1.5)) / -1.5 + 1.0;
        }
      }
    }

    else
    {
      double v23 = mMainDuration + -1.5;
      double v24 = (a3 + -1.5) / 1.5;
    }

    double v22 = 1.0;
    if (v23 <= a3) {
      double v22 = (a3 - v23) / -1.5 + 1.0;
    }
    if (v24 > 0.0)
    {
      double v25 = *(void **)(&self->super._isInInteractiveMode + 1);
      double v26 = (MRCroppingSprite *)[v25 objectForKey:@"image0"];
      if (!v26)
      {
        double v26 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
        [v25 setObject:v26 forKey:@"image0"];
      }

      -[MRCroppingSprite setInnerRect:]( v26,  "setInnerRect:",  2.0 / (v20 * self->super.mPixelSize.width * 0.4),  2.0 / (v21 * self->super.mPixelSize.height * 0.4),  1.0 - 4.0 / (v20 * self->super.mPixelSize.width * 0.4),  1.0 - 4.0 / (v21 * self->super.mPixelSize.height * 0.4));
      __asm { FMOV            V0.2S, #1.0 }

      uint64_t v47 = _D0;
      int v48 = 1065353216;
      *(float *)&_D0 = v24;
      int v49 = _D0;
      [a5 composeForeColor:&v47 saveTo:v46];
      [a5 setShader:@"SoftspritePremultiplied"];
      double v32 = v20 * self->super.mPixelSize.width * 0.4;
      *(float *)&double v32 = v32;
      double v33 = v21 * self->super.mPixelSize.height * 0.4;
      *(float *)&double v33 = v33;
      [a5 setShaderUniformVec2:@"invRadii" :v32 forKey:v33];
      -[MRCroppingSprite setNeedsInSpriteCoordinates:](v26, "setNeedsInSpriteCoordinates:", 1LL);
      LODWORD(v34) = 0;
      -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v26,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v13,  a5,  v20 * 0.5 + 0.05,  0.0,  v20,  v21,  v34);
      [a5 unsetShader];
      else {
        double v35 = @"PlainTexture";
      }
      [a5 setShader:v35];
      -[MRCroppingSprite setNeedsInSpriteCoordinates:](v26, "setNeedsInSpriteCoordinates:", 0LL);
      LODWORD(v36) = 0;
      -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v26,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v13,  a5,  v20 * 0.5 + 0.05,  0.0,  v20,  v21,  v36);
      [a5 unsetShader];
      [a5 restoreForeColor:v46];
    }
  }

  else
  {
    double v22 = a3 / 1.5;
  }

  if (v22 > 0.0)
  {
    BOOL v37 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v38 = (MRCroppingSprite *)[v37 objectForKey:@"image1"];
    if (!v38)
    {
      double v38 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v37 setObject:v38 forKey:@"image1"];
    }

    p_mPixelSize = &self->super.mPixelSize;
    -[MRCroppingSprite setInnerRect:]( v38,  "setInnerRect:",  2.0 / (v20 * p_mPixelSize->width * 0.4),  2.0 / (v21 * p_mPixelSize->height * 0.4),  1.0 - 4.0 / (v20 * p_mPixelSize->width * 0.4),  1.0 - 4.0 / (v21 * p_mPixelSize->height * 0.4));
    __asm { FMOV            V0.2S, #1.0 }

    uint64_t v47 = _D0;
    int v48 = 1065353216;
    *(float *)&_D0 = v22;
    int v49 = _D0;
    [a5 composeForeColor:&v47 saveTo:v46];
    [a5 setShader:@"SoftspritePremultiplied"];
    double v41 = v20 * p_mPixelSize->width * 0.4;
    *(float *)&double v41 = v41;
    double v42 = v21 * p_mPixelSize->height * 0.4;
    *(float *)&double v42 = v42;
    [a5 setShaderUniformVec2:@"invRadii" :v41 forKey:v42];
    -[MRCroppingSprite setNeedsInSpriteCoordinates:](v38, "setNeedsInSpriteCoordinates:", 1LL);
    LODWORD(v43) = 0;
    -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v38,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v14,  a5,  -0.05 - v20 * 0.5,  0.0,  v20,  v21,  v43);
    [a5 unsetShader];
    else {
      double v44 = @"PlainTexture";
    }
    [a5 setShader:v44];
    -[MRCroppingSprite setNeedsInSpriteCoordinates:](v38, "setNeedsInSpriteCoordinates:", 0LL);
    LODWORD(v45) = 0;
    -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v38,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v14,  a5,  -0.05 - v20 * 0.5,  0.0,  v20,  v21,  v45);
    [a5 unsetShader];
    [a5 restoreForeColor:v46];
  }

  [v13 releaseByUser];
  [v14 releaseByUser];
  [a5 blend:0];
}

- (void)renderEffect3AtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
  id v10 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  [v10 imageAspectRatio];
  if (v11 >= 0.5 && v11 <= 2.0)
  {
    id v13 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    [v13 setUsesBackgroundColorAsBorderColor:1];
    double v14 = dbl_1F69D0[v9 == 0LL];
    [a4 localAspectRatio];
    double v16 = v14 / v15;
    if (v9)
    {
      double v17 = a3 / self->super.mMainDuration * 0.1 + 0.9;
      double v18 = v16 * 0.666666667 * v17;
      double v19 = v17 * 1.95;
    }

    else
    {
      double v18 = v16 * 1.5;
      double v19 = 1.6;
    }

    if (a3 >= 1.5)
    {
      double v21 = self->super.mMainDuration + -1.5;
      double v20 = 1.0;
      if (v21 <= a3) {
        double v20 = (a3 - v21) / -1.5 + 1.0;
      }
    }

    else
    {
      double v20 = a3 / 1.5;
    }

    double v22 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v23 = (MRCroppingSprite *)[v22 objectForKey:@"image0"];
    if (!v23)
    {
      double v23 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v22 setObject:v23 forKey:@"image0"];
    }

    p_mPixelSize = &self->super.mPixelSize;
    -[MRCroppingSprite setInnerRect:]( v23,  "setInnerRect:",  2.0 / (v18 * p_mPixelSize->width * 0.4),  2.0 / (v19 * p_mPixelSize->height * 0.4),  1.0 - 4.0 / (v18 * p_mPixelSize->width * 0.4),  1.0 - 4.0 / (v19 * p_mPixelSize->height * 0.4));
    __asm { FMOV            V0.2S, #1.0 }

    uint64_t v37 = _D0;
    int v38 = 1065353216;
    *(float *)&_D0 = v20;
    int v39 = _D0;
    [a4 composeForeColor:&v37 saveTo:v36];
    [a4 setShader:@"SoftspritePremultiplied"];
    double v30 = v18 * p_mPixelSize->width * 0.4;
    *(float *)&double v30 = v30;
    double v31 = v19 * p_mPixelSize->height * 0.4;
    *(float *)&double v31 = v31;
    [a4 setShaderUniformVec2:@"invRadii" :v30 forKey:v31];
    -[MRCroppingSprite setNeedsInSpriteCoordinates:](v23, "setNeedsInSpriteCoordinates:", 1LL);
    double y = CGPointZero.y;
    LODWORD(v33) = 0;
    -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v23,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  y,  v18,  v19,  v33);
    [a4 unsetShader];
    else {
      double v34 = @"PlainTexture";
    }
    [a4 setShader:v34];
    -[MRCroppingSprite setNeedsInSpriteCoordinates:](v23, "setNeedsInSpriteCoordinates:", 0LL);
    LODWORD(v35) = 0;
    -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v23,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  y,  v18,  v19,  v35);
    [a4 unsetShader];
    [a4 restoreForeColor:v36];
    [v13 releaseByUser];
    [a4 blend:0];
  }

  else
  {
    -[MREffectWatercolorPanel renderBreakAtTime:inContext:withArguments:]( self,  "renderBreakAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

- (void)renderEffectSubtitleAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
  id v10 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [v10 setUsesBackgroundColorAsBorderColor:1];
  [a4 localAspectRatio];
  float v12 = v11;
  [a4 localAspectRatio];
  float v14 = v13;
  [a4 localAspectRatio];
  double v16 = dbl_1F69E0[v9 == 0LL] / v12 * (v14 / 1.77777778);
  double v17 = 0.666666667;
  if (!v9) {
    double v17 = 1.5;
  }
  double v18 = v15;
  if (a3 >= 1.5)
  {
    double v20 = self->super.mMainDuration + -1.5;
    double v19 = 1.0;
    if (v20 <= a3) {
      double v19 = (a3 - v20) / -1.5 + 1.0;
    }
  }

  else
  {
    double v19 = a3 / 1.5;
  }

  double v21 = v16 * v17;
  double v22 = v16 * v18;
  double v23 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v24 = (MRCroppingSprite *)[v23 objectForKey:@"image0"];
  if (!v24)
  {
    double v24 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v23 setObject:v24 forKey:@"image0"];
  }

  -[MRCroppingSprite setInnerRect:]( v24,  "setInnerRect:",  2.0 / (v21 * self->super.mPixelSize.width * 0.4),  2.0 / (v22 * self->super.mPixelSize.height * 0.4),  1.0 - 4.0 / (v21 * self->super.mPixelSize.width * 0.4),  1.0 - 4.0 / (v22 * self->super.mPixelSize.height * 0.4));
  __asm { FMOV            V0.2S, #1.0 }

  uint64_t v46 = _D0;
  int v47 = 1065353216;
  *(float *)&_D0 = v19;
  int v48 = _D0;
  [a4 composeForeColor:&v46 saveTo:v45];
  double v30 = v21 * -0.5 + 1.0 - dbl_1F69F0[v9 == 0LL];
  [a4 setShader:@"SoftspritePremultiplied"];
  double v31 = v21 * self->super.mPixelSize.width * 0.4;
  *(float *)&double v31 = v31;
  double v32 = v22 * self->super.mPixelSize.height * 0.4;
  *(float *)&double v32 = v32;
  [a4 setShaderUniformVec2:@"invRadii" :v31 forKey:v32];
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v24, "setNeedsInSpriteCoordinates:", 1LL);
  LODWORD(v33) = 0;
  -[MRCroppingSprite renderImageOuter:inContext:atPosition:andSize:zRotation:]( v24,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v10,  a4,  v30,  0.0,  v21,  v22,  v33);
  [a4 unsetShader];
  else {
    double v34 = @"PlainTexture";
  }
  [a4 setShader:v34];
  -[MRCroppingSprite setNeedsInSpriteCoordinates:](v24, "setNeedsInSpriteCoordinates:", 0LL);
  LODWORD(v35) = 0;
  -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v24,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v10,  a4,  v30,  0.0,  v21,  v22,  v35);
  double v36 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v36)
  {
    objc_msgSend(v36, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v38 = v37;
    double v40 = v39;
    double v41 = 0.150000006;
    if (v9) {
      double v41 = 0.25;
    }
    double v42 = 1.0 - v21 - v41 - v37 * 0.5;
    double v43 = v40 * 0.5 - v22 * 0.5;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v44) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  v42,  v43,  v38,  v40,  v44);
    }

    else
    {
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  v42,  v43,  v38,  v40);
    }
  }

  [a4 unsetShader];
  [a4 restoreForeColor:v45];
  [v10 releaseByUser];
  [a4 blend:0];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((objc_msgSend(*(id *)((char *)&self->mTextImage + 1), "hitAtPoint:withInverseMatrix:localPoint:") & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    float v11 = *(void **)(&self->super._isInInteractiveMode + 1);
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v12) {
      return 0LL;
    }
    id v13 = v12;
    id v10 = 0LL;
    uint64_t v14 = *(void *)v22;
LABEL_5:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      double v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
      if (v10) {
        break;
      }
      if (a5) {
        goto LABEL_18;
      }
LABEL_19:
      id v10 = v16;
LABEL_20:
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v13) {
          return v10;
        }
        goto LABEL_5;
      }
    }

    if ([v16 compare:v10] == (char *)&dword_0 + 1)
    {
      id v10 = v16;
      BOOL v18 = a5 == 0LL;
    }

    else
    {
      BOOL v18 = 1;
    }

    if (v18) {
      goto LABEL_20;
    }
LABEL_18:
    *a5 = v20;
    goto LABEL_19;
  }

  return @"text0";
}

- (BOOL)getVerticesCoordinates:(MREffectWatercolorPanel *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  if ([a5 isEqualToString:@"text0"])
  {
    id v9 = *(MRImage **)((char *)&self->mTextImage + 1);
LABEL_4:
    LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:a4];
    return (char)v9;
  }

  id v9 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v9) {
    goto LABEL_4;
  }
  return (char)v9;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double height = self->super.mPixelSize.height;
  double v4 = self->super.mPixelSize.width * 0.300000012;
  result.double height = height;
  result.width = v4;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  BOOL v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  id v9 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v7)
  {
    if (!v9) {
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mSprites + 1) setMaxNumberOfLines:3];
    [*(id *)((char *)&self->mSprites + 1) setText:v7];
    [*(id *)((char *)&self->mSprites + 1) setTruncate:1];
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.300000012,  self->super.mPixelSize.height);
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setScale:");
    id v10 = (CGContext *)[*(id *)((char *)&self->mSprites + 1) retainedContext];
    if (v10)
    {
      float v11 = v10;
      id v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba WaterColor Label");
      CGContextRelease(v11);
    }
  }

  else
  {
    if (v9)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
    }

    id v13 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v13)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

- (void)_unload
{
  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
}

@end