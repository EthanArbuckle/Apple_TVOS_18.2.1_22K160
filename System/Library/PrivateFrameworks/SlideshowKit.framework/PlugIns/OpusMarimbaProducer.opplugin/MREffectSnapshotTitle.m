@interface MREffectSnapshotTitle
- (BOOL)getVerticesCoordinates:(MREffectSnapshotTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectSnapshotTitle)init;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectSnapshotTitle

- (MREffectSnapshotTitle)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectSnapshotTitle;
  result = -[MREffectSnapshotTitle init](&v3, "init");
  if (result)
  {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer0 + 1) = 0LL;
    *(MRImage **)((char *)&result->mImage0 + 1) = 0LL;
  }

  return result;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend( *(id *)((char *)&self->mImage0 + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  a3.x,  a3.y)) {
    return @"text0";
  }
  else {
    return 0LL;
  }
}

- (BOOL)getVerticesCoordinates:(MREffectSnapshotTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mImage0 + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1))
  {
    -[MREffect _computePhaseTimeForTime:](self, "_computePhaseTimeForTime:", a4, a5, a3);
    double v8 = v7;
    [a4 blend:2];
    double mDefaultPhaseInDuration = self->super.mDefaultPhaseInDuration;
    if (v8 >= mDefaultPhaseInDuration)
    {
      double mDefaultMainDuration = self->super.mDefaultMainDuration;
      double v10 = mDefaultPhaseInDuration + mDefaultMainDuration;
      double v12 = 1.0;
      if (v8 > mDefaultPhaseInDuration + mDefaultMainDuration)
      {
        double mDefaultPhaseInDuration = (v8 - mDefaultPhaseInDuration - mDefaultMainDuration)
                                / self->super.mDefaultPhaseOutDuration;
        double v12 = 1.0 - mDefaultPhaseInDuration;
      }
    }

    else
    {
      double v12 = v8 / mDefaultPhaseInDuration;
    }

    *(float *)&double v10 = v12;
    LODWORD(mDefaultPhaseInDuration) = 1.0;
    LODWORD(v12) = 1.0;
    LODWORD(mDefaultMainDuration) = 1.0;
    [a4 composeForeColorRed:v25 green:mDefaultPhaseInDuration blue:v12 alpha:mDefaultMainDuration saveTo:v10];
    double v13 = self->super.mDefaultPhaseInDuration;
    double v14 = self->super.mDefaultMainDuration;
    double mDefaultPhaseOutDuration = self->super.mDefaultPhaseOutDuration;
    [*(id *)((char *)&self->mTextRenderer0 + 1) width];
    double v17 = v16;
    double width = self->super.mPixelSize.width;
    [*(id *)((char *)&self->mTextRenderer0 + 1) height];
    if (*(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1))
    {
      float v20 = v8 / (v13 + v14 + mDefaultPhaseOutDuration) * 0.08 + 1.0;
      double v21 = v20;
      double v22 = (v17 / width + v17 / width) * v21;
      double v23 = (v19 / self->super.mPixelSize.height + v19 / self->super.mPixelSize.height) * v21;
      if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
        && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
      {
        LODWORD(v24) = 0;
        objc_msgSend( *(id *)((char *)&self->mImage0 + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.0,  0.0,  v22,  v23,  v24);
      }

      else
      {
        [a4 setShader:@"PlainTexture"];
        objc_msgSend( *(id *)((char *)&self->mImage0 + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1),  a4,  0.0,  0.0,  v22,  v23);
        [a4 unsetShader];
      }
    }

    [a4 restoreForeColor:v25];
    [a4 blend:0];
  }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  double v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  v9 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:6];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.9,  self->super.mPixelSize.height * 0.8);
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    double v10 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v10)
    {
      v11 = v10;
      double v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba Snapshot Title");
      CGContextRelease(v11);
    }
  }

  else
  {
    if (v9)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    double v13 = *(MRImage **)((char *)&self->mImage0 + 1);
    if (v13)
    {

      *(MRImage **)((char *)&self->mImage0 + 1) = 0LL;
    }
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.9;
  double v4 = self->super.mPixelSize.height * 0.8;
  result.height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 6LL;
}

- (void)_unload
{
  double v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  double v4 = *(MRImage **)((char *)&self->mImage0 + 1);
  if (v4)
  {

    *(MRImage **)((char *)&self->mImage0 + 1) = 0LL;
  }

  v5 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v5)
  {
    [v5 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

@end