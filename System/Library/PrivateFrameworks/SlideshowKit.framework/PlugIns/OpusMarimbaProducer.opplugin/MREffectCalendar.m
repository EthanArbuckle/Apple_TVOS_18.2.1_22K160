@interface MREffectCalendar
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectCalendar)init;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectCalendar

- (MREffectCalendar)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectCalendar;
  return -[MREffectCalendar init](&v3, "init");
}

- (void)setAttributes:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MREffectCalendar;
  -[MREffect setAttributes:](&v12, "setAttributes:", a3);
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setYear:]( v4,  "setYear:",  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"year"),  "unsignedIntegerValue"));
  -[NSDateComponents setMonth:]( v4,  "setMonth:",  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"month"),  "unsignedIntegerValue"));
  -[NSDateComponents setDay:](v4, "setDay:", 1LL);
  v5 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  v6 = -[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v4);

  -[NSCalendar rangeOfUnit:inUnit:forDate:](v5, "rangeOfUnit:inUnit:forDate:", 16LL, 8LL, v6);
  LOBYTE(v4) = v7;
  v8 = -[NSCalendar components:fromDate:](v5, "components:fromDate:", 512LL, v6);

  BYTE1(self->mBaseTextPosition.y) = -[NSDateComponents weekday](v8, "weekday") - 1;
  BYTE2(self->mBaseTextPosition.y) = (_BYTE)v4;
  CGPoint v9 = CGPointFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"dayOffset"));
  CGSize v10 = CGSizeFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"daySize"));
  CGSize v11 = CGSizeFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"dayStride"));
  *(MRImage **)((char *)&self->mTextImage + 1) = *(MRImage **)&v11.width;
  *(CGFloat *)((char *)&self->mStride.width + 1) = v11.height;
  CGRect v13 = CGRectFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"imageRect"));
  *(double *)((char *)&self->mTextSize.height + 1) = v9.x + v10.width * 0.5 * v13.origin.x;
  *(double *)((char *)&self->mBaseImagePosition.x + 1) = v9.y + v10.height * 0.5 * v13.origin.y;
  *(double *)((char *)&self->mStride.height + 1) = v10.width * 0.5 * v13.size.width;
  *(double *)((char *)&self->mImageSize.width + 1) = v10.height * 0.5 * v13.size.height;
  CGRect v14 = CGRectFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"textRect"));
  *(double *)((char *)&self->mBaseImagePosition.y + 1) = v9.x + v10.width * 0.5 * v14.origin.x;
  *(double *)((char *)&self->mBaseTextPosition.x + 1) = v9.y + v10.height * 0.5 * v14.origin.y;
  *(double *)((char *)&self->mImageSize.height + 1) = v10.width * 0.5 * v14.size.width;
  *(double *)((char *)&self->mTextSize.width + 1) = v10.height * 0.5 * v14.size.height;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  char v5 = BYTE3(self->mBaseTextPosition.y);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectCalendar;
  -[MREffect prerenderForTime:inContext:withArguments:](&v7, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return v5;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  BYTE3(self->mBaseTextPosition.y) = 0;
  id v7 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [a4 blend:2];
  [a4 setShader:@"PlainTexture"];
  if (BYTE2(self->mBaseTextPosition.y))
  {
    unint64_t v8 = 0LL;
    do
    {
      unint64_t v9 = v8 + BYTE1(self->mBaseTextPosition.y);
      unint64_t v10 = v9 / 7;
      unint64_t v11 = v9 % 7;
      if (v7)
      {
        double v12 = *(double *)((char *)&self->mStride.width + 1);
        double v13 = *(double *)((char *)&self->mBaseImagePosition.x + 1) + (double)v10 * v12;
        LODWORD(v12) = 0;
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v7,  a4,  *(double *)((char *)&self->mTextSize.height + 1) + (double)v11 * *(double *)((char *)&self->mTextImage + 1),  v13,  *(double *)((char *)&self->mStride.height + 1),  *(double *)((char *)&self->mImageSize.width + 1),  v12);
      }

      CGRect v14 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
      if (v14)
      {
        [v14 setCenterY:(15.0 - (double)v8 + 15.0 - (double)v8) / 31.0];
        LODWORD(v17) = 0;
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  v15,  v16,  *(double *)((char *)&self->mImageSize.height + 1),  *(double *)((char *)&self->mTextSize.width + 1),  v17);
      }

      ++v8;
    }

    while (v8 < BYTE2(self->mBaseTextPosition.y));
  }

  [a4 unsetShader];
  [a4 blend:0];
  [v7 releaseByUser];
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  unint64_t v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  unint64_t v9 = *(MRTextRenderer **)(&self->super._isInInteractiveMode + 1);
  if (v7)
  {
    if (!v9)
    {
      unint64_t v9 = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
      *(void *)(&self->super._isInInteractiveMode + 1) = v9;
    }

    -[MRTextRenderer setResolution:](v9, "setResolution:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", CGSizeZero.width, CGSizeZero.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:0];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    unint64_t v10 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v10)
    {
      unint64_t v11 = v10;
      double v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba Calendar Text");
      CGContextRelease(v11);
    }
  }

  else if (v9)
  {

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  BYTE3(self->mBaseTextPosition.y) = 1;
}

- (void)_unload
{
  objc_super v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  }

  id v4 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v4)
  {
    [v4 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

@end