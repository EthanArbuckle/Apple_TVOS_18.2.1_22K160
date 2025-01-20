@interface MREffectJustAText
- (BOOL)getVerticesCoordinates:(MREffectJustAText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectJustAText)init;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectJustAText

- (MREffectJustAText)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectJustAText;
  result = -[MREffectJustAText init](&v3, "init");
  if (result)
  {
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer + 1) = 0LL;
    *(MRImage **)((char *)&result->mTextImage + 1) = 0LL;
  }

  return result;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  return @"text0";
}

- (BOOL)getVerticesCoordinates:(MREffectJustAText *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  return objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "getVerticesCoordinates:withMatrix:",  a3,  a4,  a5);
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  char v5 = BYTE1(self->mTextSprite);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectJustAText;
  -[MREffect prerenderForTime:inContext:withArguments:](&v7, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return v5;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  BYTE1(self->mTextSprite) = 0;
  v6 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (!v6) {
    return;
  }
  objc_msgSend(v6, "width", a4, a5, a3);
  double v9 = v8 / self->super.mPixelSize.width;
  [*(id *)((char *)&self->mTextRenderer + 1) height];
  double v11 = v10 / self->super.mPixelSize.height + v10 / self->super.mPixelSize.height;
  double y = CGPointZero.y;
  id v13 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"verticalAlignment");
  if (v13)
  {
    v14 = v13;
    if ([v13 isEqualToString:@"Top"])
    {
      [a4 localAspectRatio];
      double v16 = 2.0 / v15;
      double v17 = -0.5;
LABEL_8:
      double y = v16 + v11 * v17;
      goto LABEL_9;
    }

    if ([v14 isEqualToString:@"Bottom"])
    {
      [a4 localAspectRatio];
      double v16 = -2.0 / v18;
      double v17 = 0.5;
      goto LABEL_8;
    }
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

  double v9 = *(MRTextRenderer **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9)
    {
      double v9 = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
      *(void *)(&self->super._isInInteractiveMode + 1) = v9;
    }

    p_mPixelSize = &self->super.mPixelSize;
    -[MRTextRenderer setResolution:](v9, "setResolution:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", CGSizeZero.width, CGSizeZero.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:0];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"maxNumberOfLines")) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"maxNumberOfLines"),  "integerValue"));
    }
    double width = p_mPixelSize->width;
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  p_mPixelSize->width,  self->super.mPixelSize.height);
    id v12 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"countOfColumns");
    if (v12) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setColumnCount:",  (int)objc_msgSend(v12, "intValue"));
    }
    id v13 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"columnMargin");
    if (v13)
    {
      [v13 floatValue];
      [*(id *)(&self->super._isInInteractiveMode + 1) setColumnMargin:p_mPixelSize->width * v14 * 0.5];
    }

    id v15 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"excludedRects");
    if (v15)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1C0CA4;
      v24[3] = &unk_258F40;
      v24[4] = self;
      [v15 enumerateKeysAndObjectsUsingBlock:v24];
    }

    [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
    double v17 = v16;
    [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:1];
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", width, v17);
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
      *(double *)(&self->mTextWasUpdatedSinceLastRendering + 1) = v18;
      *(double *)((char *)&self->mSizeOfText.width + 1) = v19;
      *(double *)(&self->mTextWasUpdatedSinceLastRendering + 1) = v18 / p_mPixelSize->width + v18 / p_mPixelSize->width;
      *(double *)((char *)&self->mSizeOfText.width + 1) = v19 / p_mPixelSize->width + v19 / p_mPixelSize->width;
    }

    else
    {
      double v20 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
      if (v20)
      {
        v21 = v20;
        v22 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v20);
        *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v22;
        -[MRTextRenderer setLabel:](v22, "setLabel:", @"Marimba JustAText Text");
        CGContextRelease(v21);
      }
    }
  }

  else
  {
    if (v9)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    v23 = *(MRImage **)((char *)&self->mTextImage + 1);
    if (v23)
    {

      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

  BYTE1(self->mTextSprite) = 1;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double width = self->super.mPixelSize.width;
  double v4 = 0.0;
  result.height = v4;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return (int64_t)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"maxNumOfLines"),  "integerValue");
}

- (void)_unload
{
  objc_super v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  double v4 = *(MRImage **)((char *)&self->mTextImage + 1);
  if (v4)
  {

    *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  }

  char v5 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v5)
  {
    [v5 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

@end