@interface MREffectReflectionsSubtitle
- (BOOL)getVerticesCoordinates:(MREffectReflectionsSubtitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectReflectionsSubtitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectReflectionsSubtitle

- (MREffectReflectionsSubtitle)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectReflectionsSubtitle;
  result = -[MREffect initWithEffectID:](&v4, "initWithEffectID:", a3);
  if (result)
  {
    *(MRCroppingSprite **)((char *)&result->mTextSprite + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer + 1) = 0LL;
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
  }

  return result;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mTextSprite + 1) cleanup];

  *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectReflectionsSubtitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)(&self->super._isInInteractiveMode + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (mPhaseInDuration + mMainDuration <= a3)
    {
      double v16 = (a3 - mPhaseInDuration - mMainDuration) / self->super.mPhaseOutDuration;
      if (v16 >= 0.5)
      {
        double v18 = -0.25;
        double v19 = 1.5;
        double v20 = v16 * 1.5 + -0.25;
      }

      else
      {
        float v17 = (v16 + -0.5) * 3.14159274;
        double v20 = (float)((float)(sinf(v17) + 1.0) * 0.5);
      }

      double v21 = 1.0;
      double v11 = 1.0 - v20;
      *(float *)&double v8 = 1.0 - v20;
      LODWORD(v21) = 1.0;
      LODWORD(v18) = 1.0;
      LODWORD(v19) = 1.0;
      [a4 composeForeColorRed:v32 green:v21 blue:v18 alpha:v19 saveTo:v8];
      double v12 = v20 * 0.1 + 1.02;
    }

    else
    {
      double v12 = (a3 - mPhaseInDuration) / mMainDuration * 0.04 + 0.98;
      double v11 = 1.0;
    }
  }

  else
  {
    float v10 = (a3 / mPhaseInDuration + -0.5) * 3.14159265;
    double v11 = (sinf(v10) + 1.0) * 0.5;
    double v12 = v11 * 0.28 + 0.7;
    *(float *)&double v13 = v11;
    LODWORD(v14) = 1.0;
    [a4 composeForeColorRed:v32 green:COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x3FE6666600000000) blue:COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x3FD1EB8500000000) alpha:v14 saveTo:v13];
  }

  double v22 = MRMatrix_Clear((uint64_t)v31);
  *(float *)&double v22 = v12;
  *(float *)&double v23 = MRMatrix_Scale(v31, *(float32x2_t *)&v22, *(float32_t *)&v22, 1.0);
  objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v31, v30, v23);
  v24 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v24)
  {
    objc_msgSend(v24, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v26 = v25;
    double v28 = v27;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v29) = 0;
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.0,  0.0,  v26,  v28,  v29);
    }

    else
    {
      [a4 setShader:@"PlainTexture"];
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  0.0,  0.0,  v26,  v28);
      [a4 unsetShader];
    }
  }

  [a4 restoreModelViewMatrix:v30];
  if (v11 != 1.0) {
    [a4 restoreForeColor:v32];
  }
  [a4 blend:0];
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  v7 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v7)
  {
    objc_msgSend(v7, "releaseByUser", a4, a5, a3);
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  v9 = *(MRCroppingSprite **)((char *)&self->mTextSprite + 1);
  if (v8)
  {
    float v10 = v8;
    if (!v9) {
      *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = (MRCroppingSprite *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v10 length]) {
      objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    [*(id *)((char *)&self->mTextSprite + 1) setMaxNumberOfLines:3];
    objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mTextSprite + 1) setText:v10];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mTextSprite + 1), "setScale:");
    objc_msgSend( *(id *)((char *)&self->mTextSprite + 1),  "setDefinedSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height * 0.5);
    double v11 = (CGContext *)[*(id *)((char *)&self->mTextSprite + 1) retainedContext];
    if (v11)
    {
      double v12 = v11;
      double v13 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v11);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v13;
      -[MRTextRenderer setLabel:](v13, "setLabel:", @"Marimba Reflections Subtitle");
      CGContextRelease(v12);
    }

    if (!*(void *)(&self->super._isInInteractiveMode + 1)) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    }
  }

  else
  {
    if (v9)
    {

      *(MRCroppingSprite **)((char *)&self->mTextSprite + 1) = 0LL;
    }

    double v14 = *(void **)(&self->super._isInInteractiveMode + 1);
    if (v14)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }
  }

@end