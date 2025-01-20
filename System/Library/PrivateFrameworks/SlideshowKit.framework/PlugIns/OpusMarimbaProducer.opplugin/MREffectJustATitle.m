@interface MREffectJustATitle
- (BOOL)getVerticesCoordinates:(MREffectJustATitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectJustATitle)init;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectJustATitle

- (MREffectJustATitle)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectJustATitle;
  result = -[MREffectJustATitle init](&v3, "init");
  if (result)
  {
    *(MRTextRenderer **)((char *)&result->mTextRenderer0 + 1) = 0LL;
    *(void *)(&result->super._isInInteractiveMode + 1) = 0LL;
    *(MRImage **)((char *)&result->mImage0 + 1) = 0LL;
    *(MRTextRenderer **)((char *)&result->mTextRenderer1 + 1) = 0LL;
    *(MRCroppingSprite **)((char *)&result->mTextSprite0 + 1) = 0LL;
    *(MRImage **)((char *)&result->mImage1 + 1) = 0LL;
  }

  return result;
}

- (void)setAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MREffectJustATitle;
  -[MREffect setAttributes:](&v8, "setAttributes:", a3);
  v4 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"text0Rect");
  v5 = (CGFloat *)((char *)&self->mTextSprite1 + 1);
  if (v4)
  {
    CGRect v9 = CGRectFromString(v4);
    CGFloat *v5 = v9.origin.x;
    *(CGFloat *)((char *)&self->mText0Rect.origin.x + 1) = v9.origin.y;
    *(CGFloat *)((char *)&self->mText0Rect.origin.y + 1) = v9.size.width;
    *(CGFloat *)((char *)&self->mText0Rect.size.width + 1) = v9.size.height;
  }

  else
  {
    *(_OWORD *)v5 = xmmword_1F6780;
    *(CGFloat *)((char *)&self->mText0Rect.origin.y + 1) = 0.0;
    *(CGFloat *)((char *)&self->mText0Rect.size.width + 1) = 0.0;
  }

  v6 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"text1Rect");
  v7 = (char *)&self->mText0Rect.size.height + 1;
  if (v6)
  {
    *(CGRect *)v7 = CGRectFromString(v6);
  }

  else
  {
    *(_OWORD *)v7 = xmmword_1F6790;
    *((void *)v7 + 2) = 0LL;
    *((void *)v7 + 3) = 0LL;
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (objc_msgSend( *(id *)((char *)&self->mTextSprite0 + 1),  "hitAtPoint:withInverseMatrix:localPoint:",  a4,  a5,  x,  y)) {
    return @"text1";
  }
  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectJustATitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  if ([a5 isEqualToString:@"text0"])
  {
    CGRect v9 = &OBJC_IVAR___MREffectJustATitle_mTextSprite0;
LABEL_5:
    LOBYTE(v10) = [*(id *)((char *)&self->super.super.isa + *v9) getVerticesCoordinates:a3 withMatrix:a4];
    return v10;
  }

  unsigned int v10 = [a5 isEqualToString:@"text1"];
  if (v10)
  {
    CGRect v9 = &OBJC_IVAR___MREffectJustATitle_mTextSprite1;
    goto LABEL_5;
  }

  return v10;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text1");
  if (!v4)
  {
LABEL_4:
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }

  if ([v4 length])
  {
    LODWORD(v4) = *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1) == 0LL;
    goto LABEL_4;
  }

  LODWORD(v4) = 0;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_5:
  if ([v5 length])
  {
    BOOL v6 = *(MRImage **)((char *)&self->mImage0 + 1) == 0LL;
    return ((v4 | v6) & 1) == 0 && !self->super.mNeedsToUpdateTexts;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  char v5 = BYTE1(self->mText1Rect.size.height);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectJustATitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v7, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return v5;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  BYTE1(self->mText1Rect.size.height) = 0;
  if (*(_OWORD *)((char *)&self->mTextRenderer1 + 1) != 0LL)
  {
    unsigned int v8 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"dissolve",  a5),  "BOOLValue");
    unsigned int v9 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"dissolveInMain"),  "BOOLValue");
    [a4 blend:2];
    if (v8)
    {
      double mPhaseInDuration = self->super.mPhaseInDuration;
      if (mPhaseInDuration < a3)
      {
        double v10 = mPhaseInDuration + self->super.mMainDuration;
        goto LABEL_5;
      }

      double v14 = a3 / mPhaseInDuration;
    }

    else
    {
      if (!v9) {
        goto LABEL_13;
      }
      double v10 = self->super.mPhaseInDuration;
      double v14 = 0.0;
      if (v10 < a3)
      {
        if (v10 + 0.5 < a3)
        {
          double v10 = v10 + self->super.mMainDuration;
LABEL_5:
          double v14 = 1.0;
          if (v10 <= a3)
          {
            double v15 = (a3 - v10) / self->super.mPhaseOutDuration;
            double v10 = 1.0;
            double v14 = 1.0 - v15;
          }

          goto LABEL_12;
        }

        double v14 = a3 - v10 + a3 - v10;
      }
    }

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text1");
  unsigned int v9 = *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1);
  if (v9)
  {
    [v9 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1) = 0LL;
  }

  double v10 = *(MRImage **)((char *)&self->mImage0 + 1);
  if (v10)
  {
    [v10 releaseByUser];
    *(MRImage **)((char *)&self->mImage0 + 1) = 0LL;
  }

  double v11 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v11) {
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
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    if (-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"))
    {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0MaxNumberOfLines"),  "integerValue"));
    }

    unsigned int v13 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text0SizeAsMax"),  "BOOLValue");
    double v14 = *(double *)((char *)&self->mText0Rect.origin.y + 1);
    if (v14 == 0.0) {
      double width = p_mPixelSize->width;
    }
    else {
      double width = v14 * 0.5 * p_mPixelSize->width;
    }
    double v17 = *(double *)((char *)&self->mText0Rect.size.width + 1);
    if (v17 == 0.0) {
      double height = self->super.mPixelSize.height;
    }
    else {
      double height = v17 * 0.5 * self->super.mPixelSize.height;
    }
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", width, height);
    if (v13)
    {
      [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
      double v20 = v19;
      double v22 = v21;
      [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:1];
      else {
        double v23 = height;
      }
      else {
        double v24 = width;
      }
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", v24, v23);
    }

    double v25 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v25)
    {
      float v26 = v25;
      double v27 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v25);
      *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1) = v27;
      -[MRTextRenderer setLabel:](v27, "setLabel:", @"Marimba JustATitle Text0");
      CGContextRelease(v26);
    }
  }

  else
  {
    if (v11)
    {

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    v16 = *(MRImage **)((char *)&self->mImage1 + 1);
    if (v16)
    {

      *(MRImage **)((char *)&self->mImage1 + 1) = 0LL;
    }
  }

  double v28 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    if (!v28) {
      *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v8 length]) {
      objc_msgSend( *(id *)((char *)&self->mTextRenderer0 + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  1,  0));
    }
    float v29 = &self->super.mPixelSize;
    objc_msgSend( *(id *)((char *)&self->mTextRenderer0 + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mTextRenderer0 + 1) setText:v8];
    [*(id *)((char *)&self->mTextRenderer0 + 1) setTruncate:1];
    objc_msgSend(*(id *)((char *)&self->mTextRenderer0 + 1), "setDefinedSize:", CGSizeZero.width, CGSizeZero.height);
    [*(id *)((char *)&self->mTextRenderer0 + 1) setRenderAtDefinedSize:0];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mTextRenderer0 + 1), "setScale:");
    if (-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text1MaxNumberOfLines"))
    {
      objc_msgSend( *(id *)((char *)&self->mTextRenderer0 + 1),  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text1MaxNumberOfLines"),  "integerValue"));
    }

    unsigned int v30 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"text1SizeAsMax"),  "BOOLValue");
    double v31 = *(double *)((char *)&self->mText1Rect.origin.y + 1);
    if (v31 == 0.0) {
      double v32 = v29->width;
    }
    else {
      double v32 = v31 * 0.5 * v29->width;
    }
    double v34 = *(double *)((char *)&self->mText1Rect.size.width + 1);
    if (v34 == 0.0)
    {
      double v35 = self->super.mPixelSize.height;
      if (v30)
      {
LABEL_50:
        [*(id *)((char *)&self->mTextRenderer0 + 1) setRenderAtDefinedSize:1];
        [*(id *)((char *)&self->mTextRenderer0 + 1) sizeOfContext];
        objc_msgSend(*(id *)((char *)&self->mTextRenderer0 + 1), "setDefinedSize:", v36, v37);
      }
    }

    else
    {
      double v35 = v34 * 0.5 * self->super.mPixelSize.height;
      if (v30) {
        goto LABEL_50;
      }
    }

    double v38 = (CGContext *)[*(id *)((char *)&self->mTextRenderer0 + 1) retainedContext];
    if (v38)
    {
      v39 = v38;
      v40 = (MRImage *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v38);
      *(MRImage **)((char *)&self->mImage0 + 1) = v40;
      -[MRImage setLabel:](v40, "setLabel:", @"Marimba JustATitle Text1");
      CGContextRelease(v39);
    }

    goto LABEL_59;
  }

  if (v28)
  {

    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  v33 = *(MRCroppingSprite **)((char *)&self->mTextSprite0 + 1);
  if (v33)
  {

    *(MRCroppingSprite **)((char *)&self->mTextSprite0 + 1) = 0LL;
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  if ([-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@SizeAsMax", a3)), "BOOLValue"])
  {
    unsigned int v5 = [a3 hasSuffix:@"1"];
    BOOL v6 = &OBJC_IVAR___MREffectJustATitle_mText0Rect;
    if (v5) {
      BOOL v6 = &OBJC_IVAR___MREffectJustATitle_mText1Rect;
    }
    id v7 = (double *)((char *)self + *v6);
    double width = v7[2] * 0.5 * self->super.mPixelSize.width;
    double height = v7[3] * 0.5 * self->super.mPixelSize.height;
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
  objc_super v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer1 + 1) = 0LL;
  }

  id v4 = *(MRImage **)((char *)&self->mImage0 + 1);
  if (v4)
  {
    [v4 releaseByUser];
    *(MRImage **)((char *)&self->mImage0 + 1) = 0LL;
  }

  unsigned int v5 = *(MRImage **)((char *)&self->mImage1 + 1);
  if (v5)
  {

    *(MRImage **)((char *)&self->mImage1 + 1) = 0LL;
  }

  BOOL v6 = *(MRCroppingSprite **)((char *)&self->mTextSprite0 + 1);
  if (v6)
  {

    *(MRCroppingSprite **)((char *)&self->mTextSprite0 + 1) = 0LL;
  }

  id v7 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    [v7 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  id v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 cleanup];

    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

@end