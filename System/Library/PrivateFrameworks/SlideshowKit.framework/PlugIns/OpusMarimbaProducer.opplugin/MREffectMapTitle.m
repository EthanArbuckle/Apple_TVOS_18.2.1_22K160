@interface MREffectMapTitle
- (BOOL)getVerticesCoordinates:(MREffectMapTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectMapTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectMapTitle

- (MREffectMapTitle)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectMapTitle;
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

- (BOOL)getVerticesCoordinates:(MREffectMapTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"text0"];
  if (v8) {
    LOBYTE(v8) = [*(id *)((char *)&self->mTextImage + 1) getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)setAttributes:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MREffectMapTitle;
  -[MREffect setAttributes:](&v18, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    id v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"locations");
    id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          CGPoint v12 = CGPointFromString((NSString *)*(void *)(*((void *)&v14 + 1) + 8LL * (void)v11));
          objc_msgSend( v7,  "addObject:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v12.x, v12.y));
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v9);
    }

    v13 = (NSDictionary *)-[NSDictionary mutableCopy](self->super.mFlattenedAttributes, "mutableCopy");
    -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v7, @"locations");

    self->super.mFlattenedAttributes = v13;
  }

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectMapTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v6, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(MRTextRenderer **)((char *)&self->mTextRenderer + 1))
  {
    else {
      id v7 = @"PlainTexture";
    }
    [a4 setShader:v7];
    objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    double v9 = v8;
    double v11 = v10;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      LODWORD(v12) = 0;
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  CGPointZero.x,  CGPointZero.y,  v9,  v11,  v12);
    }

    else
    {
      objc_msgSend( *(id *)((char *)&self->mTextImage + 1),  "renderImage:inContext:atPosition:andSize:",  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1),  a4,  CGPointZero.x,  CGPointZero.y,  v9,  v11);
    }
  }

  [a4 unsetShader];
  [a4 blend:0];
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
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v7];
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setDefinedSize:",  self->super.mPixelSize.width * 0.949999988,  self->super.mPixelSize.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:8];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    double v10 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v10)
    {
      double v11 = v10;
      double v12 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v10);
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v12;
      -[MRTextRenderer setLabel:](v12, "setLabel:", @"Marimba Map Title");
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