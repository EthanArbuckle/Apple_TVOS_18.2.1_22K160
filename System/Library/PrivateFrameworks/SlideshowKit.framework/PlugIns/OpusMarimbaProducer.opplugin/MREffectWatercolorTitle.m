@interface MREffectWatercolorTitle
- (BOOL)getVerticesCoordinates:(MREffectWatercolorTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectWatercolorTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectWatercolorTitle

- (MREffectWatercolorTitle)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectWatercolorTitle;
  result = -[MREffect initWithEffectID:](&v4, "initWithEffectID:", a3);
  if (result)
  {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer + 1) = 0LL;
    *(MRImage **)((char *)&result->mTextImage + 1) = 0LL;
  }

  return result;
}

- (void)_cleanup
{
  *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  [*(id *)(&self->super._isInInteractiveMode + 1) cleanup];

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectWatercolorTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mTextImage + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)setPixelSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectWatercolorTitle;
  -[MREffect setPixelSize:](&v3, "setPixelSize:", a3.width, a3.height);
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectWatercolorTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v6, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v8 = a3 / (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration);
  double v9 = 0.0;
  if (v8 >= 0.2)
  {
    if (v8 >= 0.4)
    {
      double v9 = 1.0;
      if (v8 > 0.8) {
        double v9 = (v8 + -0.8) / -0.2 + 1.0;
      }
    }

    else
    {
      double v9 = (v8 + -0.2) / 0.2;
    }
  }

  __asm { FMOV            V0.2S, #1.0 }

  uint64_t v25 = _D0;
  int v26 = 1065353216;
  *(float *)&_D0 = v9;
  int v27 = _D0;
  [a4 composeForeColor:&v25 saveTo:v24];
  v15 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v15)
  {
    objc_msgSend(v15, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v17 = v16;
    double v19 = v18;
    [a4 localAspectRatio];
    double v21 = -0.475 / v20 - v19 * 0.5;
    if (v9 >= 1.0) {
      v22 = @"PlainTextureNoColor";
    }
    else {
      v22 = @"PlainTexture";
    }
    [a4 setShader:v22];
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v23) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.775 - v17 * 0.5,  v21,  v17,  v19,  v23);
    }

    else
    {
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  0.775 - v17 * 0.5,  v21,  v17,  v19);
    }

    [a4 unsetShader];
  }

  [a4 restoreForeColor:v24];
  [a4 blend:0];
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double height = self->super.mPixelSize.height;
  double v4 = self->super.mPixelSize.width * 0.550000012;
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
  double v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  double v9 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:3];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.550000012,  self->super.mPixelSize.height);
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    v10 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v10)
    {
      v11 = v10;
      v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba WaterColor Title");
      CGContextRelease(v11);
    }
  }

  else
  {
    if (v9)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    v13 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v13)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

@end