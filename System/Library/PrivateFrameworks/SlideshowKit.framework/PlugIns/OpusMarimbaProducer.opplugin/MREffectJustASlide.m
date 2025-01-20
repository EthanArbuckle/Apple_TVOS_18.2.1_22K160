@interface MREffectJustASlide
- (BOOL)canMoveInDirection:(unsigned __int8)a3 withPZR:(id)a4;
- (BOOL)getVerticesCoordinates:(MREffectJustASlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isAlphaFriendly;
- (BOOL)isFocuser;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectJustASlide)init;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_cleanup;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)resetPZR;
- (void)setIsFocuser:(BOOL)a3;
@end

@implementation MREffectJustASlide

- (MREffectJustASlide)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectJustASlide;
  v2 = -[MREffectJustASlide init](&v4, "init");
  if (v2)
  {
    *(void *)(v2 + 185) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(void *)(v2 + 217) = 0x3FF0000000000000LL;
  }

  return (MREffectJustASlide *)v2;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (BOOL)isNative3D
{
  id v2 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  if (!v2) {
    return 1;
  }
  v3 = v2;
  id v4 = [v2 frame];
  if (v4) {
    return [v4 isNative3D];
  }
  return [v3 hasFilters];
}

- (BOOL)isOpaque
{
  id v3 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 frame];
    if (v5) {
      LOBYTE(v3) = [v5 isOpaque];
    }
    else {
      LOBYTE(v3) = ([v4 isOpaque] & 1) != 0 || BYTE1(self->mSprite) != 0;
    }
  }

  return (char)v3;
}

- (BOOL)isAlphaFriendly
{
  id v2 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  if (v2 && (id v3 = [v2 frame]) != 0) {
    return [v3 isAlphaFriendly];
  }
  else {
    return 1;
  }
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectJustASlide;
  -[MREffect prerenderForTime:inContext:withArguments:](&v8, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  BYTE1(self->mSprite) = *((float *)[a4 backColor] + 3) >= 1.0;
  return BYTE1(self->_y0);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  v10 = v9;
  if (BYTE1(self->_y0))
  {
    BYTE1(self->_y0) = 0;
    objc_msgSend(v9, "setCenter:", *(double *)(&self->mForceIsOpaque + 1), *(double *)((char *)&self->_panX + 1));
    [v10 setScale:*(double *)((char *)&self->_panY + 1)];
    [v10 setRotation:*(double *)((char *)&self->_scale + 1)];
  }

  id v11 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  if (!v11)
  {
    LODWORD(v12) = 0;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v12);
    return;
  }

  v13 = v11;
  if ([v11 shader])
  {
    [*(id *)(&self->super._isInInteractiveMode + 1) setNeedsInSpriteCoordinates:1];
    unsigned int v14 = -[MREffectJustASlide isOpaque](self, "isOpaque");
    float v16 = *((float *)[a4 foreColor] + 3);
    if (v14 && v16 >= 1.0)
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }

    else
    {
      [a4 blend:2];
      if (v16 < 1.0 || (id v27 = objc_msgSend(objc_msgSend(v13, "shader"), "objectForKey:", @".opaqueRect")) == 0)
      {
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:", 0.0, 0.0, 1.0, 1.0);
        LODWORD(v29) = 0;
        objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v29);
        [a4 blend:0];
        goto LABEL_28;
      }

      [v27 CGRectValue];
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:");
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      LODWORD(v28) = 0;
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  y,  2.0,  2.0,  v28);
      [a4 blend:0];
    }

    LODWORD(v15) = 0;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v13,  a4,  x,  y,  2.0,  2.0,  v15);
LABEL_28:
    [v13 releaseByUser];
    return;
  }

  unsigned __int8 v19 = [v13 isOpaque];
  unsigned int v20 = [v13 hasKenBurns];
  unsigned int v21 = [a4 foreColorIsOpaqueWhite];
  v22 = @"PlainTextureHigh";
  if (v21) {
    v22 = @"PlainTextureHighNoColor";
  }
  v23 = @"PlainTextureNoColor";
  if (!v21) {
    v23 = @"PlainTexture";
  }
  if (v20) {
    v24 = v22;
  }
  else {
    v24 = v23;
  }
  [v13 aspectRatio];
  if (self->super._panoramaPanningOffsets)
  {
    if (v25 < 0.5 || v25 > 2.0)
    {
      if (v25 <= 2.0)
      {
        [a4 localAspectRatio];
        [v13 scale];
        [v13 centerY];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0");
        objc_msgSend(v13, "setCenterY:");
      }

      else
      {
        [v13 scale];
        [v13 centerX];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0");
        objc_msgSend(v13, "setCenterX:");
      }
    }
  }

  [v13 scale];
  double v30 = 1.0;
  if (v31 > 0.0)
  {
    [v13 scale];
    *(float *)&double v32 = v32;
    double v30 = *(float *)&v32;
  }

  p_mPixelSize = &self->super.mPixelSize;
  float v34 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v13 aspectRatio];
  float v36 = v35;
  [v13 centerX];
  float v38 = (1.0 - (v37 + 1.0) * v30) * 0.5;
  [v13 centerX];
  float v40 = (1.0 - (v39 + -1.0) * v30) * 0.5;
  [v13 centerY];
  *((float *)&v74 + 1) = v34;
  double v42 = v34;
  double v43 = v30 * (v41 + 1.0) * v34;
  double v44 = v36;
  float v45 = (1.0 - v43 / v36) * 0.5;
  [v13 centerY];
  float v47 = (1.0 - v30 * (v46 + -1.0) * v42 / v44) * 0.5;
  double v48 = v38;
  BOOL v49 = v38 > 0.00001;
  if (v40 < 0.99999) {
    BOOL v49 = 1;
  }
  double v50 = v45;
  BOOL v51 = v45 > 0.00001;
  if (v47 < 0.99999) {
    BOOL v51 = 1;
  }
  if (v49 || v51)
  {
    *(float *)&uint64_t v74 = v38;
    float v53 = v40 - v38;
    float v54 = v47 - v45;
    if (v49) {
      float v55 = 1.0 / p_mPixelSize->width;
    }
    else {
      float v55 = 0.0;
    }
    if (v51) {
      float v56 = 1.0 / p_mPixelSize->width;
    }
    else {
      float v56 = 0.0;
    }
    double v57 = v56 + v56;
    double v58 = v53;
    double v59 = v54;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setInnerRect:",  v48 + v55 * 2.0,  v50 + v57 * v42,  v53 + v55 * -4.0,  v54 + v56 * -4.0 * v42,  v74);
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setOuterRect:",  (float)(v75 - v55),  (float)(v45 - (float)(v56 * v76)),  v58 + v55 * 2.0,  v59 + v57 * v42);
    LODWORD(v60) = 0;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v60);
    [a4 setShader:v24];
    [*(id *)(&self->super._isInInteractiveMode + 1) renderImageInner:v13 inContext:a4];
    [a4 unsetShader];
    v61 = (float *)[a4 backColor];
    float v62 = v61[3];
    if (v62 < 1.0)
    {
      else {
        uint64_t v69 = 3LL;
      }
      [a4 blend:v69];
      [a4 setShader:@"PlainTextureSoftOpaque"];
      CGFloat v70 = p_mPixelSize->width * v58;
      *(float *)&CGFloat v70 = v70;
      CGFloat v71 = self->super.mPixelSize.height * v59;
      *(float *)&CGFloat v71 = v71;
      [a4 setShaderUniformVec2:@"invRadii" :v70 forKey:v71];
      LODWORD(v65) = 0;
      LODWORD(v66) = 0;
      LODWORD(v67) = 0;
      LODWORD(v68) = 0;
    }

    else
    {
      [a4 setShader:@"PlainTextureSoftOpaque"];
      CGFloat v63 = p_mPixelSize->width * v58;
      *(float *)&CGFloat v63 = v63;
      CGFloat v64 = self->super.mPixelSize.height * v59;
      *(float *)&CGFloat v64 = v64;
      [a4 setShaderUniformVec2:@"invRadii" :v63 forKey:v64];
      *(float *)&double v65 = *v61;
      *(float *)&double v66 = v61[1];
      *(float *)&double v67 = v61[2];
      *(float *)&double v68 = v61[3];
    }

    [a4 setShaderUniformVec4:@"edgeColor" :v65 :v66 :v67 forKey:v68];
    [*(id *)(&self->super._isInInteractiveMode + 1) renderImageMiddle:v13 inContext:a4];
    [a4 unsetShader];
    if (v62 < 1.0)
    {
      [a4 blend:0];
    }

    else
    {
      [a4 composeForeColor:v61 saveTo:v77];
      [a4 setShader:@"PlainColor"];
      [*(id *)(&self->super._isInInteractiveMode + 1) renderImageOuter:0 inContext:a4];
      [a4 unsetShader];
      [a4 restoreForeColor:v77];
    }
  }

  else
  {
    objc_msgSend(a4, "setShader:", v24, v48, v50);
    if ((v19 & 1) != 0)
    {
      LODWORD(v52) = 0;
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImage:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v52);
    }

    else
    {
      else {
        uint64_t v72 = 3LL;
      }
      [a4 blend:v72];
      LODWORD(v73) = 0;
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImage:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v73);
      [a4 blend:0];
    }

    [a4 unsetShader];
  }

  [v13 releaseByUser];
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  v10 = v9;
  if (BYTE1(self->_y0))
  {
    BYTE1(self->_y0) = 0;
    objc_msgSend(v9, "setCenter:", *(double *)(&self->mForceIsOpaque + 1), *(double *)((char *)&self->_panX + 1));
    [v10 setScale:*(double *)((char *)&self->_panY + 1)];
    [v10 setRotation:*(double *)((char *)&self->_scale + 1)];
  }

  id v11 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v11 setUsesBackgroundColorAsBorderColor:1];
  [v11 aspectRatio];
  if (self->super._panoramaPanningOffsets)
  {
    if (v12 < 0.5 || v12 > 2.0)
    {
      if (v12 <= 2.0)
      {
        [a4 localAspectRatio];
        [v11 scale];
        [v11 centerY];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0");
        objc_msgSend(v11, "setCenterY:");
      }

      else
      {
        [v11 scale];
        [v11 centerX];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  @"image0");
        objc_msgSend(v11, "setCenterX:");
      }
    }
  }

  LODWORD(v13) = 0;
  objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v13);
  return v11;
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

- (BOOL)getVerticesCoordinates:(MREffectJustASlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"image0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)(&self->super._isInInteractiveMode + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  if (!BYTE5(self->_y0)) {
    return;
  }
  objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "imageAspectRatio");
  double v7 = *(double *)((char *)&self->_panY + 1) / a3;
  *(double *)((char *)&self->_panY + 1) = v7;
  double v9 = v8 / a3;
  if (BYTE4(self->_y0))
  {
    double v10 = fmax(v9 + v9, 2.0);
    if (v7 <= v10)
    {
      double v10 = 1.0;
      if (v9 <= 1.0) {
        double v10 = v9;
      }
      if (v7 >= v10) {
        goto LABEL_12;
      }
    }
  }

  else if (v9 <= 1.0)
  {
    double v10 = v9;
  }

  else
  {
    double v10 = 1.0;
  }

  *(double *)((char *)&self->_panY + 1) = v10;
LABEL_12:
  *(double *)((char *)&self->_scale + 1) = 0.0;
  double v11 = *(double *)((char *)&self->_panY + 1);
  double v12 = (1.0 - 1.0 / v11) * 0.5;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  double v13 = (1.0 - v9 / v11) * 0.5;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  double v15 = v12 + 0.5;
  double v16 = v14 + 0.5;
  double v17 = *(double *)(&self->mForceIsOpaque + 1);
  if (v17 > v12 + 0.5 || (double v15 = 0.5 - v12, v17 < 0.5 - v12)) {
    *(double *)(&self->mForceIsOpaque + 1) = v15;
  }
  double v18 = *(double *)((char *)&self->_panX + 1);
  if (v18 > v16 || (double v16 = 0.5 - v14, v18 < 0.5 - v14)) {
    *(double *)((char *)&self->_panX + 1) = v16;
  }
  if (!-[MRLayer isActivated](self->super.mEffectLayer, "isActivated")) {
    a4 = 0.0;
  }
  -[MRLayerEffect animateCenterOfSlide:to:withDuration:andInitialSpeed:]( self->super.mEffectLayer,  "animateCenterOfSlide:to:withDuration:andInitialSpeed:",  @"image0",  *(double *)(&self->mForceIsOpaque + 1),  *(double *)((char *)&self->_panX + 1),  a4,  0.0,  0.0);
  -[MRLayerEffect animateScaleOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateScaleOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_panY + 1),  a4);
  -[MRLayerEffect animateRotationOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateRotationOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_scale + 1),  a4);
  BYTE1(self->_y0) = 0;
}

- (BOOL)isFocuser
{
  return BYTE5(self->_y0);
}

- (void)setIsFocuser:(BOOL)a3
{
  BYTE5(self->_y0) = a3;
}

- (double)pzrStart:(id)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", a3),  "objectForKey:",  @"image0");
  [v4 center];
  *(void *)((char *)&self->_rotation + 1) = v5;
  *(void *)((char *)&self->_startSlideCenter.x + 1) = v6;
  [v4 scale];
  *(void *)((char *)&self->_startSlideCenter.y + 1) = v7;
  [v4 rotation];
  *(void *)((char *)&self->_startSlideScale + 1) = v8;
  BYTE3(self->_y0) = 0;
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  if (BYTE5(self->_y0)) {
    BYTE4(self->_y0) = *((_BYTE *)a3 + 100);
  }
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  CGFloat v6 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v5 imageAspectRatio];
  double v8 = v7;
  double v9 = v7 / v6;
  double v10 = *(double *)((char *)&self->_startSlideCenter.y + 1) * *((double *)a3 + 6);
  *(double *)((char *)&self->_panY + 1) = v10;
  if (BYTE4(self->_y0))
  {
    double v11 = fmax(v9 + v9, 2.0);
  }

  else
  {
    double v12 = 1.0;
    if (v9 <= 1.0) {
      double v12 = v9;
    }
    if (BYTE5(self->_y0)) {
      double v11 = v12;
    }
    else {
      double v11 = 1.0e10;
    }
  }

  if (v10 > v11)
  {
    double v10 = v11 * (log10(v10 / v11) + 1.0);
    *(double *)((char *)&self->_panY + 1) = v10;
  }

  if (!BYTE3(self->_y0))
  {
    double v13 = 0.5 / *(double *)((char *)&self->_startSlideCenter.y + 1);
    __double2 v14 = __sincos_stret(*(double *)((char *)&self->_startSlideScale + 1));
    *(double *)((char *)&self->_startSlideRotation + 1) = *(double *)((char *)&self->_rotation + 1)
                                                        + v13
    *(double *)((char *)&self->_x0 + 1) = *(double *)((char *)&self->_startSlideCenter.x + 1)
                                        - v13
    double v10 = *(double *)((char *)&self->_panY + 1);
    BOOL v15 = v10 <= v9 && *((double *)a3 + 10) < 1.0 || *((_BYTE *)a3 + 96) == 16;
    BYTE2(self->_y0) = v15;
    BYTE3(self->_y0) = 1;
  }

  int v16 = BYTE2(self->_y0);
  if (BYTE2(self->_y0))
  {
    double v17 = *(double *)((char *)&self->_startSlideScale + 1) + *((double *)a3 + 7);
    *(double *)((char *)&self->_scale + 1) = v17;
    double v10 = *(double *)((char *)&self->_panY + 1);
  }

  else
  {
    double v17 = *(double *)((char *)&self->_scale + 1);
  }

  double v18 = 0.5 / v10;
  __double2 v19 = __sincos_stret(v17);
  *(double *)(&self->mForceIsOpaque + 1) = *(double *)((char *)&self->_startSlideRotation + 1)
                                         - v18
  *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_x0 + 1)
                                        + v18
  if (v16) {
    goto LABEL_38;
  }
  double v20 = *(double *)((char *)&self->_panY + 1);
  if ((1.0 - 1.0 / v20) * 0.5 >= 0.0) {
    double v21 = (1.0 - 1.0 / v20) * 0.5;
  }
  else {
    double v21 = 0.0;
  }
  double v22 = (1.0 - v9 / v20) * 0.5;
  if (v22 >= 0.0) {
    double v23 = v22;
  }
  else {
    double v23 = 0.0;
  }
  double v24 = v23 + 0.5;
  double v25 = *(double *)(&self->mForceIsOpaque + 1);
  if (v25 > v21 + 0.5)
  {
    double v26 = v21 + 0.5 + sqrt(v25 - (v21 + 0.5) + 1.0) + -1.0;
LABEL_32:
    *(double *)(&self->mForceIsOpaque + 1) = v26;
    goto LABEL_33;
  }

  if (v25 < 0.5 - v21)
  {
    double v26 = 0.5 - v21 - sqrt(0.5 - v21 - v25 + 1.0) + 1.0;
    goto LABEL_32;
  }

- (double)pzrEnd:(id)a3
{
  if (BYTE5(self->_y0)) {
    BYTE4(self->_y0) = *((_BYTE *)a3 + 100);
  }
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  double v6 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v5 imageAspectRatio];
  double v8 = v7 / v6;
  double v9 = *(double *)((char *)&self->_startSlideCenter.y + 1) * *((double *)a3 + 6);
  *(double *)((char *)&self->_panY + 1) = v9;
  if (!BYTE4(self->_y0))
  {
    if (!BYTE5(self->_y0)) {
      goto LABEL_14;
    }
    if (v8 <= 1.0) {
      double v10 = v7 / v6;
    }
    else {
      double v10 = 1.0;
    }
    goto LABEL_13;
  }

  double v10 = fmax(v8 + v8, 2.0);
  if (v9 > v10) {
    goto LABEL_13;
  }
  double v10 = 1.0;
  if (v8 <= 1.0) {
    double v10 = v7 / v6;
  }
  if (v9 < v10) {
LABEL_13:
  }
    *(double *)((char *)&self->_panY + 1) = v10;
LABEL_14:
  *(double *)((char *)&self->_scale + 1) = 0.0;
  double v11 = 0.5 / *(double *)((char *)&self->_panY + 1);
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  if (*((_BYTE *)a3 + 98))
  {
    double v13 = *((double *)a3 + 8) * 0.125;
    double v14 = *((double *)a3 + 9) * 0.125;
  }

  double v15 = *((double *)a3 + 2) + v13;
  double v16 = v14 + *((double *)a3 + 3);
  *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_x0 + 1) + v11 * (v7 * v15 * 0.0 - v8 * v16);
  double v17 = *(double *)((char *)&self->_panY + 1);
  double v18 = (1.0 - 1.0 / v17) * 0.5;
  if (v18 < 0.0) {
    double v18 = 0.0;
  }
  double v19 = (1.0 - v8 / v17) * 0.5;
  if (v19 >= 0.0) {
    double v12 = v19;
  }
  double v20 = v18 + 0.5;
  double v21 = v12 + 0.5;
  double v22 = *(double *)(&self->mForceIsOpaque + 1);
  if (v22 > v18 + 0.5 || (double v20 = 0.5 - v18, v22 < 0.5 - v18)) {
    *(double *)(&self->mForceIsOpaque + 1) = v20;
  }
  double v23 = *(double *)((char *)&self->_panX + 1);
  if (v23 > v21 || (double v21 = 0.5 - v12, v23 < 0.5 - v12))
  {
    *(double *)((char *)&self->_panX + 1) = v21;
    double v23 = v21;
  }

  if (!*((_BYTE *)a3 + 98)) {
    return 0.0;
  }
  double v24 = 0.25;
  -[MRLayerEffect animateCenterOfSlide:to:withDuration:andInitialSpeed:]( self->super.mEffectLayer,  "animateCenterOfSlide:to:withDuration:andInitialSpeed:",  @"image0",  *(double *)(&self->mForceIsOpaque + 1),  v23,  0.25,  *((double *)a3 + 8),  *((double *)a3 + 9));
  -[MRLayerEffect animateScaleOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateScaleOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_panY + 1),  0.25);
  -[MRLayerEffect animateRotationOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateRotationOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_scale + 1),  0.25);
  BYTE1(self->_y0) = 0;
  return v24;
}

- (double)pzrCancel:(id)a3
{
  if (*((_BYTE *)a3 + 98))
  {
    double v4 = 0.25;
    -[MRLayerEffect animateCenterOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateCenterOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_rotation + 1),  *(double *)((char *)&self->_startSlideCenter.x + 1),  0.25);
    -[MRLayerEffect animateScaleOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateScaleOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_startSlideCenter.y + 1),  0.25);
    -[MRLayerEffect animateRotationOfSlide:to:withDuration:]( self->super.mEffectLayer,  "animateRotationOfSlide:to:withDuration:",  @"image0",  *(double *)((char *)&self->_startSlideScale + 1),  0.25);
    BYTE1(self->_y0) = 0;
  }

  else
  {
    *(double *)(&self->mForceIsOpaque + 1) = *(double *)((char *)&self->_rotation + 1);
    *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_startSlideCenter.x + 1);
    *(double *)((char *)&self->_panY + 1) = *(double *)((char *)&self->_startSlideCenter.y + 1);
    *(double *)((char *)&self->_scale + 1) = *(double *)((char *)&self->_startSlideScale + 1);
    return 0.0;
  }

  return v4;
}

- (void)resetPZR
{
  *(double *)((char *)&self->_scale + 1) = 0.0;
  *(double *)((char *)&self->_panX + 1) = 0.0;
  *(void *)(&self->mForceIsOpaque + 1) = 0LL;
  *(double *)((char *)&self->_panY + 1) = 1.0;
  BYTE1(self->_y0) = 0;
  BYTE4(self->_y0) = 0;
}

- (BOOL)canMoveInDirection:(unsigned __int8)a3 withPZR:(id)a4
{
  if (!BYTE4(self->_y0)) {
    return 1;
  }
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0");
  double v8 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v7 imageAspectRatio];
  double v10 = *(double *)((char *)&self->_panY + 1);
  double v11 = (1.0 - 1.0 / v10) * 0.5;
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  double v12 = (1.0 - v9 / v8 / v10) * 0.5;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  return ((a3 & 1) == 0 || *((double *)a4 + 8) >= 0.0 || *(double *)(&self->mForceIsOpaque + 1) < v11 + 0.5)
      && ((a3 & 2) == 0 || *((double *)a4 + 8) <= 0.0 || *(double *)(&self->mForceIsOpaque + 1) > 0.5 - v11)
}

@end