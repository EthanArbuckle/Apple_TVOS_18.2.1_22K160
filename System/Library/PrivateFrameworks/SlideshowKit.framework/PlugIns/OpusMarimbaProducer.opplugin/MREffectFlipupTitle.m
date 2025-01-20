@interface MREffectFlipupTitle
- (BOOL)getVerticesCoordinates:(MREffectFlipupTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectFlipupTitle)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)cacheRenderedWords;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderTextAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectFlipupTitle

- (MREffectFlipupTitle)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectFlipupTitle;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    *(void *)(v3 + 209) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    *(void *)(v3 + 281) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 281),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"FlipupBackground",  @"mask.png"));
    [*(id *)(v3 + 281) setImageSizeScript:@"layerWidth*.2,layerHeight*.2"];
    objc_msgSend(*(id *)(v3 + 281), "setOriginalImageSize:", 200.0, 200.0);
    [*(id *)(v3 + 281) setWantsMonochromatic:1];
  }

  return (MREffectFlipupTitle *)v3;
}

- (void)_cleanup
{
  *(CGFloat *)((char *)&self->mTextImageSize.height + 1) = 0.0;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)(&self->mFlipped + 1) cleanup];

  *(void *)(&self->mFlipped + 1) = 0LL;
  [*(id *)((char *)&self->mTextRenderer + 1) cleanup];

  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v3)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  *(NSMutableArray **)((char *)&self->mWordImages + 1) = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectFlipupTitle;
  -[MREffect setPixelSize:](&v6, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mTextImageSize.height + 1), "setDefaultSize:", width, height);
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectFlipupTitle;
  -[MREffect prerenderForTime:inContext:withArguments:](&v10, "prerenderForTime:inContext:withArguments:");
  [*(id *)((char *)&self->mTextImageSize.height + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  return 1;
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
  return 1LL;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  if (v4 && [v4 length] && !*(NSMutableArray **)((char *)&self->mWordFrames + 1)
    || self->super.mNeedsToUpdateTexts)
  {
    return 0;
  }

  else
  {
    return [*(id *)((char *)&self->mTextImageSize.height + 1) isLoaded];
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 <= 4.0)
  {
    double mPhaseOutDuration = self->super.mPhaseOutDuration;
    HIDWORD(v11) = 1071225241;
    double v12 = self->super.mPhaseInDuration + self->super.mMainDuration + mPhaseOutDuration * 0.4;
    LODWORD(v9) = 1.0;
    if (v12 < a3)
    {
      double v13 = (a3 - v12) / (mPhaseOutDuration * 0.35);
      double v14 = (1.0 - v13 + -0.5) * 3.14159265;
      BOOL v15 = v13 <= 1.0;
      double v16 = -1.57079633;
      if (v15) {
        double v16 = v14;
      }
      float v17 = v16;
      float v18 = sinf(v17);
      double v12 = 0.5;
      double mPhaseOutDuration = (v18 + 1.0) * 0.5;
      *(float *)&double v9 = mPhaseOutDuration;
    }

    LODWORD(mPhaseOutDuration) = 1.0;
    LODWORD(v12) = 1.0;
    LODWORD(v11) = 1.0;
    [a4 composeForeColorRed:v34 green:mPhaseOutDuration blue:v12 alpha:v11 saveTo:v9];
    double v19 = a3 / (self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration) * 0.04 + 0.96;
    BYTE1(self->mSprites) = 0;
    -[MREffectFlipupTitle renderTextAtTime:inContext:withArguments:scale:]( self,  "renderTextAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v19);
    LODWORD(v20) = 1050253722;
    LODWORD(v21) = 1.0;
    LODWORD(v22) = 1.0;
    LODWORD(v23) = 1.0;
    [a4 composeForeColorRed:0 green:v21 blue:v22 alpha:v23 saveTo:v20];
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v33, 180.0, 0.0, 180.0);
    double v24 = v19
        * (*(double *)((char *)&self->mTextSize.width + 1) / self->super.mPixelSize.height
         + *(double *)((char *)&self->mTextSize.width + 1) / self->super.mPixelSize.height);
    [a4 localAspectRatio];
    double v26 = v24 / v25;
    double v28 = v19 * (v27 + v27);
    [a4 localAspectRatio];
    float v30 = v26 - v28 / v29;
    *(float *)&double v31 = MRMatrix_Translate(v33, 0.0, -v30, 0.0);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v33, v32, v31);
    BYTE1(self->mSprites) = 1;
    -[MREffectFlipupTitle renderTextAtTime:inContext:withArguments:scale:]( self,  "renderTextAtTime:inContext:withArguments:scale:",  a4,  a5,  a3,  v19);
    [a4 restoreModelViewMatrix:v32];
    [a4 restoreForeColor:v34];
  }

  [a4 blend:0];
}

- (void)renderTextAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 scale:(double)a6
{
  objc_super v10 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  if (v10) {
    goto LABEL_6;
  }
  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = (MRTextRenderer *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v11 = (char *)[*(id *)((char *)&self->mWordFrames + 1) count];
  if ((uint64_t)v11 >= 1)
  {
    double v12 = v11;
    for (i = 0LL; i != v12; ++i)
    {
      id v14 = objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  objc_msgSend(*(id *)((char *)&self->mWordFrames + 1), "objectAtIndex:", i));
      [v14 setLabel:@"Marimba Flipup Title Word"];
      objc_msgSend(*(id *)((char *)&self->mWordRenderer + 1), "addObject:", objc_msgSend(v14, "insertingInCollection"));
      [v14 releaseByUser];
    }
  }

  *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  objc_super v10 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  if (v10)
  {
LABEL_6:
    id v15 = [v10 count];
    uint64_t v16 = (uint64_t)v15;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    double v18 = mPhaseInDuration;
    if (v18 >= 5.0) {
      double v18 = mPhaseInDuration / ((double)(uint64_t)v15 + -1.15);
    }
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0"))
    {
      unsigned __int8 v20 = -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing");
      if (v16 < 1 || (v20 & 1) != 0)
      {
LABEL_30:
        if (!BYTE1(self->mSprites))
        {
          float64x2_t v48 = vdivq_f64(*(float64x2_t *)((char *)&self->mTextSize.height + 1), (float64x2_t)self->super.mPixelSize);
          float64x2_t v58 = vaddq_f64(v48, v48);
          v49 = *(void **)(&self->super._isInInteractiveMode + 1);
          v50 = (MRCroppingSprite *)[v49 objectForKey:@"text0"];
          if (!v50)
          {
            v50 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
            [v49 setObject:v50 forKey:@"text0"];
          }

          double height = self->super.mPixelSize.height;
          double v54 = *(double *)((char *)&self->mTextImageSize.width + 1) / 1.2 * 0.1 / height;
          LODWORD(v51) = 0;
          -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v50,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  0.0,  v54 + v54 + v53 * 0.5,  *(_OWORD *)&v58,  v51);
        }

        return;
      }
    }

    else if (v16 < 1)
    {
      goto LABEL_30;
    }

    uint64_t v21 = 0LL;
    double v57 = v18 * 0.25;
    double v22 = 1.0;
    double v55 = 3.14159265;
    do
    {
      double v23 = v57 * (double)v21;
      double v24 = v18;
      double v25 = v18 + v23;
      HIDWORD(v26) = 0;
      if (v23 <= a3) {
        double v27 = v22;
      }
      else {
        double v27 = 0.0;
      }
      if (v23 <= a3 && v25 > a3)
      {
        float v29 = ((a3 - v23) / (v25 - v23) + -0.5) * v55;
        double v23 = sinf(v29) + v22;
        double v27 = v23 * 0.5;
      }

      *(float *)&double v19 = v27;
      LODWORD(v23) = 1.0;
      LODWORD(v25) = 1.0;
      LODWORD(v26) = 1.0;
      objc_msgSend(a4, "composeForeColorRed:green:blue:alpha:saveTo:", v60, v23, v25, v26, v19, *(void *)&v55);
      id v30 = [*(id *)((char *)&self->mWordRenderer + 1) objectAtIndex:v21];
      objc_msgSend(objc_msgSend(*(id *)((char *)&self->mWordImages + 1), "objectAtIndex:", v21), "CGRectValue");
      p_mPixelSize = &self->super.mPixelSize;
      double v35 = *(double *)((char *)&self->mTextSize.width + 1);
      double v36 = v35 + *(double *)((char *)&self->mCachedRenderedWords + 1);
      if (BYTE1(self->mSprites)) {
        double v36 = -v36;
      }
      double v37 = self->super.mPixelSize.height;
      double v38 = v32 / p_mPixelSize->width + v32 / p_mPixelSize->width;
      double v39 = v36 / v37 * 0.5 + v35 / v37 * 1.5 * (v22 - v27);
      double v40 = v38 * a6;
      double v41 = (v33 / v37 + v33 / v37) * a6;
      double v42 = (-*(double *)((char *)&self->mTextYOffset + 1) / p_mPixelSize->width
           + v31 / p_mPixelSize->width * 2.0
           + v38 * 0.5)
          * a6;
      double v43 = v39 * a6;
      if (BYTE1(self->mSprites))
      {
        [a4 setShader:@"AlphaMaskPremultiplied"];
        id v44 = [*(id *)((char *)&self->mTextImageSize.height + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
        [v44 setClampMode:2];
        [v44 setPreservesAspectRatio:0];
        LODWORD(v45) = 0;
        [v44 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v59 state:v45];
        v46 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
        LODWORD(v47) = 0;
        -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v46,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v30,  a4,  v42,  v43,  v40,  v41,  v47);

        [v44 unsetOnContext:a4 onTextureUnit:1 state:&v59];
        [v44 releaseByUser];
      }

      else
      {
        [a4 setShader:@"PlainTexture"];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v30,  a4,  v42,  v43,  v40,  v41);
      }

      [a4 unsetShader];
      [a4 restoreForeColor:v60];
      ++v21;
      double v18 = v24;
      double v22 = 1.0;
    }

    while (v16 != v21);
    goto LABEL_30;
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  objc_super v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    double v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            double v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            double v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectFlipupTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  objc_super v6 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v6)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v9);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
  id v12 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0");
  if (![v12 length]) {
    objc_msgSend( *(id *)(&self->mFlipped + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
  }
  [*(id *)(&self->mFlipped + 1) setMaxNumberOfLines:1];
  objc_msgSend( *(id *)(&self->mFlipped + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  [*(id *)(&self->mFlipped + 1) setText:v12];
  double width = self->super.mPixelSize.width;
  CGFloat v14 = self->super.mPixelSize.height * 0.5;
  objc_msgSend(*(id *)(&self->mFlipped + 1), "setDefinedSize:", width, v14);
  [*(id *)(&self->mFlipped + 1) tightFrameOfLineAtIndex:0];
  *(NSMutableArray **)((char *)&self->mCachedRenderedWords + 1) = v15;
  [*(id *)((char *)&self->mTextRenderer + 1) setMaxNumberOfLines:1];
  objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
  objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "setText:",  -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  @"text0"));
  objc_msgSend(*(id *)((char *)&self->mTextRenderer + 1), "setDefinedSize:", width, v14);
  -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
  +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
  objc_msgSend(*(id *)((char *)&self->mTextRenderer + 1), "setScale:");
  [*(id *)(&self->mFlipped + 1) sizeOfContext];
  *(void *)((char *)&self->mTextSize.height + 1) = v16;
  *(void *)((char *)&self->mTextImageSize.width + 1) = v17;
  [*(id *)(&self->mFlipped + 1) sizeOfContext];
  *(void *)((char *)&self->mTextYOffset + 1) = v18;
  *(void *)((char *)&self->mTextSize.width + 1) = v19;
  -[MREffectFlipupTitle cacheRenderedWords](self, "cacheRenderedWords");
}

- (void)cacheRenderedWords
{
  v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v3) {

  }
  *(NSMutableArray **)((char *)&self->mWordFrames + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = *(NSMutableArray **)((char *)&self->mWordImages + 1);
  if (v4) {

  }
  *(NSMutableArray **)((char *)&self->mWordImages + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (char *)[*(id *)(&self->mFlipped + 1) countOfWords];
  if ((uint64_t)v5 >= 1)
  {
    objc_super v6 = v5;
    for (i = 0LL; i != v6; ++i)
    {
      id v8 = (CGContext *)objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "retainedContextOfWordsInRange:",  i,  1);
      if (v8)
      {
        id v9 = v8;
        [*(id *)((char *)&self->mWordFrames + 1) addObject:v8];
        CGContextRelease(v9);
        CGBitmapContextGetWidth(v9);
        CGBitmapContextGetHeight(v9);
        [*(id *)(&self->mFlipped + 1) originOfWordAtIndex:i];
        objc_msgSend( *(id *)((char *)&self->mWordImages + 1),  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
      }
    }
  }

- (void)_unload
{
  v3 = *(NSMutableArray **)((char *)&self->mWordFrames + 1);
  if (v3)
  {

    *(NSMutableArray **)((char *)&self->mWordFrames + 1) = 0LL;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = *(MRTextRenderer **)((char *)&self->mWordRenderer + 1);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) removingFromCollection];
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  *(MRTextRenderer **)((char *)&self->mWordRenderer + 1) = 0LL;
  id v9 = *(NSMutableArray **)((char *)&self->mWordImages + 1);
  if (v9)
  {

    *(NSMutableArray **)((char *)&self->mWordImages + 1) = 0LL;
  }

@end