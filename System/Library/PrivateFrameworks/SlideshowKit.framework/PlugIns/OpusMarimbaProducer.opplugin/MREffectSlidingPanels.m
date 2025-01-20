@interface MREffectSlidingPanels
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)getVerticesCoordinates:(MREffectSlidingPanels *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (CGSize)_sizeForBreakAspectRatio:(double)a3 size:(CGSize)a4 inContext:(id)a5;
- (MREffectSlidingPanels)init;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_applySizeScripts:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)computeAnimationForTime:(double)a3 direction:(id)a4 rect:(CGRect *)a5 justification:(CGPoint *)a6;
- (void)enterInteractiveModeAtTime:(double)a3;
- (void)exitInteractiveMode;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectSlidingPanels

- (MREffectSlidingPanels)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
  v2 = -[MREffectSlidingPanels init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 185) = 0LL;
    *(void *)(v2 + 201) = 0LL;
    *(void *)(v2 + 193) = 0LL;
    *(void *)(v2 + 209) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 225) = 0LL;
    v3[249] = 0;
    *(void *)(v3 + 257) = 0LL;
    v7[0] = xmmword_1F8E98;
    v7[1] = unk_1F8EA8;
    *(void *)(v3 + 297) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v7);
    v6[0] = xmmword_1F8EB8;
    v6[1] = unk_1F8EC8;
    *(void *)(v3 + 305) = -[MRCAMLBezierData initWithControlPoints:]( objc_alloc(&OBJC_CLASS___MRCAMLBezierData),  "initWithControlPoints:",  v6);
  }

  return (MREffectSlidingPanels *)v3;
}

- (void)_cleanup
{
  BYTE1(self->mMaxTextSize.height) = 0;
  BYTE1(self->mTextSize.height) = 0;

  *(CGContext **)((char *)&self->mCachedRenderedText + 1) = 0LL;
  *(void *)(&self->mIsLoaded + 1) = 0LL;

  *(void *)(&self->mFitMovies + 1) = 0LL;
  *(MRCAMLBezierData **)((char *)&self->mEnterCurve + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
  -[MREffect setPixelSize:](&v4, "setPixelSize:", a3.width, a3.height);
  BYTE1(self->mMaxTextSize.height) = 0;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  return (!v4
       || ![v4 length]
       || *(MRTextRenderer **)((char *)&self->mTextRenderer + 1)
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  v7 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", a4, a5),  "objectEnumerator");
  id v8 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v47,  v52,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * (void)i) setShowTimeScript:0];
      }

      id v9 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v47,  v52,  16LL);
    }

    while (v9);
  }

  self->super.mNeedsToUpdateTexts = 0;
  v12 = *(MRImage **)((char *)&self->mTextImage + 1);
  if (v12)
  {
    CFRelease(v12);
    *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  }

  id v13 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", 201LL),  "objectForKey:",  @"text0");
  v14 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v13)
  {
    if (!v14) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v13 length]) {
      objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "setMaxNumberOfLines:",  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"lineCount"),  "integerValue"));
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v13];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    [*(id *)(&self->super._isInInteractiveMode + 1) setRenderAtDefinedSize:1];
    [*(id *)(&self->super._isInInteractiveMode + 1) setCenterVertically:1];
  }

  else
  {
    if (v14)
    {
      [v14 cleanup];

      *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
    }

    v15 = *(NSDictionary **)((char *)&self->mBreakInformation + 1);
    if (v15)
    {

      *(NSDictionary **)((char *)&self->mBreakInformation + 1) = 0LL;
    }
  }

  mFlattenedAttributes = self->super.mFlattenedAttributes;
  [a4 localAspectRatio];
  if (v17 >= 1.0) {
    v18 = @"slideContainers";
  }
  else {
    v18 = @"portraitSlideContainers";
  }
  id v19 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", v18);
  if (!v19)
  {
    v20 = self->super.mFlattenedAttributes;
    [a4 localAspectRatio];
    if (v21 < 1.0) {
      v22 = @"slideContainers";
    }
    else {
      v22 = @"portraitSlideContainers";
    }
    id v19 = -[NSDictionary objectForKey:](v20, "objectForKey:", v22);
  }

  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v25 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v19);
        }
        v29 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
        if (objc_msgSend(objc_msgSend(v29, "objectForKey:", @"isText"), "BOOLValue"))
        {
          CGRect v53 = CGRectFromString((NSString *)[v29 objectForKey:@"rect"]);
          double v30 = v53.size.width;
          double v31 = v53.size.height;
          CGRect v54 = CGRectFromString((NSString *)objc_msgSend( v29,  "objectForKey:",  @"border",  v53.origin.x,  v53.origin.y));
          double x = v54.origin.x;
          double y = v54.origin.y;
          double v34 = v54.size.width;
          double v35 = v54.size.height;
          [a4 localAspectRatio];
          float v37 = v36;
          if (y != v35) {
            [a4 localAspectRatio];
          }
          double v38 = v31 - (v35 * 0.0120000001 + y * 0.0120000001) * v37;
          double width = (v30 - (v34 * 0.0120000001 + x * 0.0120000001)) * 0.5 * self->super.mPixelSize.width;
          double height = v38 * 0.5 * self->super.mPixelSize.height;
        }
      }

      id v26 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }

    while (v26);
  }

  *(double *)((char *)&self->mTextSprite + 1) = width;
  *(double *)((char *)&self->mMaxTextSize.width + 1) = height;
  v39 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v39)
  {
    objc_msgSend(v39, "setDefinedSize:", width, height);
    [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfText];
    *(void *)(&self->mHasBreak + 1) = v40;
    *(void *)((char *)&self->mTextSize.width + 1) = v41;
    *(Class *)((char *)&self->super.super.isa + v42) = (Class)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
  }

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = *(double *)((char *)&self->mTextSprite + 1);
  double v4 = *(double *)((char *)&self->mMaxTextSize.width + 1);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return (int64_t)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"lineCount"),  "integerValue");
}

- (void)_unload
{
  double v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v3)
  {
    [v3 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  }

  double v4 = *(MRImage **)((char *)&self->mTextImage + 1);
  if (v4)
  {
    CFRelease(v4);
    *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
  }

  [*(id *)((char *)&self->mTextRenderer + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = 0LL;
  objc_super v5 = *(NSDictionary **)((char *)&self->mBreakInformation + 1);
  if (v5)
  {

    *(NSDictionary **)((char *)&self->mBreakInformation + 1) = 0LL;
  }

  [*(id *)((char *)&self->mCachedRenderedText + 1) removeAllObjects];

  *(void *)(&self->mIsLoaded + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  BYTE1(self->mMaxTextSize.height) = 0;
  BYTE1(self->mTextSize.height) = 0;
}

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    v6 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
    if (v6)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!BYTE1(self->mMaxTextSize.height))
  {

    *(void *)(&self->mIsLoaded + 1) = 0LL;
    mFlattenedAttributes = self->super.mFlattenedAttributes;
    [a4 localAspectRatio];
    if (v10 >= 1.0) {
      v11 = @"slideContainers";
    }
    else {
      v11 = @"portraitSlideContainers";
    }
    id v12 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", v11);
    *(void *)(&self->mIsLoaded + 1) = v12;
    if (!v12)
    {
      id v13 = self->super.mFlattenedAttributes;
      [a4 localAspectRatio];
      if (v14 < 1.0) {
        v15 = @"slideContainers";
      }
      else {
        v15 = @"portraitSlideContainers";
      }
      *(void *)(&self->mIsLoaded + 1) = -[NSDictionary objectForKey:](v13, "objectForKey:", v15);
    }

    BYTE1(self->mTextSize.height) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"fitMovies"),  "BOOLValue");
    -[MREffectSlidingPanels _applySizeScripts:](self, "_applySizeScripts:", a4);
    BYTE1(self->mCurrentInfo) = 0;
    v16 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    id v17 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v89,  v95,  16LL);
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v90;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v90 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend( -[NSDictionary objectForKey:](v16, "objectForKey:", *(void *)(*((void *)&v89 + 1) + 8 * (void)i)),  "imageAspectRatio");
          if (v21 < 0.5 || v21 > 2.0)
          {
            BYTE1(self->mCurrentInfo) = 1;
            goto LABEL_22;
          }
        }

        id v18 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v89,  v95,  16LL);
      }

      while (v18);
    }

- (void)_applySizeScripts:(id)a3
{
  objc_super v5 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  int64_t v6 = -[NSDictionary count](v5, "count");
  if (v6 >= 1)
  {
    int64_t v7 = v6;
    unint64_t v8 = 0LL;
    while (1)
    {
      id v9 = objc_msgSend( *(id *)(&self->mIsLoaded + 1),  "objectAtIndex:",  v8 % (unint64_t)objc_msgSend(*(id *)(&self->mIsLoaded + 1), "count"));
      CGRect v22 = CGRectFromString((NSString *)[v9 objectForKey:@"rect"]);
      double width = v22.size.width;
      double height = v22.size.height;
      CGRect v23 = CGRectFromString((NSString *)objc_msgSend(v9, "objectForKey:", @"border", v22.origin.x, v22.origin.y));
      double x = v23.origin.x;
      double y = v23.origin.y;
      double v14 = v23.size.width;
      double v15 = v23.size.height;
      id v16 = -[NSDictionary objectForKey:](v5, "objectForKey:", ImageKey(v8));
      id v17 = v16;
      if (v7 == 1)
      {
        if (BYTE1(self->mTextSize.height)) {
          break;
        }
      }

      if (v7 == 1) {
        goto LABEL_8;
      }
LABEL_9:
      [a3 localAspectRatio];
      double v21 = height - (v15 * 0.0120000001 + y * 0.0120000001) * v20;
      [v17 setImageSizeScript:0];
      objc_msgSend( v17,  "setDefaultSize:",  (width - (v14 * 0.0120000001 + x * 0.0120000001)) * 0.5 * self->super.mPixelSize.width,  v21 * 0.5 * self->super.mPixelSize.height);
      if (v7 == ++v8) {
        return;
      }
    }

    if ([v16 canPlay])
    {
      [v17 imageAspectRatio];
      [v17 imageAspectRatio];
      [a3 localAspectRatio];
    }

- (CGSize)_sizeForBreakAspectRatio:(double)a3 size:(CGSize)a4 inContext:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3 < 0.5 || a3 > 2.0)
  {
    double v10 = self->super.mPixelSize.width * 0.5;
    double v11 = (double)(int)[a5 maxTextureSize];
    if (a3 <= 1.0)
    {
      double v14 = width * v10 / a3;
      if (v14 > v11)
      {
        double v15 = (double)(int)[a5 maxTextureSize] / v14;
        if (v15 < 0.5) {
          double v15 = 0.5;
        }
        double width = width * v15;
      }
    }

    else
    {
      double v12 = height * v10 * a3;
      if (v12 > v11)
      {
        double v13 = (double)(int)[a5 maxTextureSize] / v12;
        if (v13 < 0.5) {
          double v13 = 0.5;
        }
        double height = height * v13;
      }
    }
  }

  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (-[NSDictionary count]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "count")
    && (!*(MRTextRenderer **)((char *)&self->mTextRenderer + 1) || self->super.mNeedsToUpdateAttributes))
  {
    if (*(MRImage **)((char *)&self->mTextImage + 1)
      || (-[MREffect loadForTime:inContext:withArguments:now:]( self,  "loadForTime:inContext:withArguments:now:",  a4,  a5,  1LL,  a3),  *(MRImage **)((char *)&self->mTextImage + 1)))
    {
      unint64_t v8 = (MRTextRenderer *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  *(MRImage **)((char *)&self->mTextImage + 1));
      *(MRTextRenderer **)((char *)&self->mTextRenderer + 1) = v8;
      -[MRTextRenderer setLabel:](v8, "setLabel:", @"Marimba SlidingPanels Label");
      CGContextRelease(*(CGContextRef *)((char *)&self->mTextImage + 1));
      *(MRImage **)((char *)&self->mTextImage + 1) = 0LL;
    }
  }

  id v9 = *(void **)(&self->mIsLoaded + 1);
  __int128 v274 = 0u;
  __int128 v275 = 0u;
  __int128 v276 = 0u;
  __int128 v277 = 0u;
  id obj = v9;
  id v10 = [v9 countByEnumeratingWithState:&v274 objects:v280 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v275;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v275 != v13) {
          objc_enumerationMutation(obj);
        }
        v12 += objc_msgSend( objc_msgSend( *(id *)(*((void *)&v274 + 1) + 8 * (void)i),  "objectForKey:",  @"isText"),  "BOOLValue");
      }

      id v11 = [obj countByEnumeratingWithState:&v274 objects:v280 count:16];
    }

    while (v11);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  double v15 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  v259 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  v254 = -[NSDictionary count](v259, "count");
  uint64_t v232 = (uint64_t)[obj count] - v12;
  [a4 localAspectRatio];
  float v16 = 1.0;
  if (v17 < 1.0)
  {
    [a4 localAspectRatio];
    float v16 = v18;
  }

  double v19 = v15 - (double)v232;
  BOOL v20 = v254 != (_BYTE *)&dword_0 + 1 && v254 == (char *)(2 * v232);
  char v21 = v20;
  char v260 = v21;
  double v258 = v19 / (double)(v232 + 1);
  if (v20)
  {
    float v22 = a3 / (v19 / (double)(v232 + 1) + 1.0);
    uint64_t v249 = vcvtms_s32_f32(v22);
  }

  else
  {
    uint64_t v249 = 0LL;
  }

  __int128 v272 = 0u;
  __int128 v273 = 0u;
  __int128 v270 = 0u;
  __int128 v271 = 0u;
  id v23 = [*(id *)((char *)&self->mCachedRenderedText + 1) objectEnumerator];
  id v24 = [v23 countByEnumeratingWithState:&v270 objects:v279 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v271;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v271 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v270 + 1) + 8 * (void)j) reset];
      }

      id v25 = [v23 countByEnumeratingWithState:&v270 objects:v279 count:16];
    }

    while (v25);
  }

  __int128 v268 = 0u;
  __int128 v269 = 0u;
  __int128 v266 = 0u;
  __int128 v267 = 0u;
  id v255 = [obj countByEnumeratingWithState:&v266 objects:v278 count:16];
  if (v255)
  {
    int64_t v28 = 0LL;
    BOOL v247 = 0;
    char v250 = 0;
    double v29 = (float)(0.012 / v16);
    uint64_t v253 = *(void *)v267;
    double v30 = 1.0;
    double v245 = v15 - v258;
    double v234 = v15 + -0.333;
    double v233 = v15 + -0.1666;
    double v248 = v258 + 1.0;
    double v230 = v15 + -0.333000004;
    CGFloat y = CGPointZero.y;
    CGPoint v257 = CGPointZero;
    double v226 = v15 + -1.0 + -1.0;
    do
    {
      for (k = 0LL; k != v255; k = (char *)k + 1)
      {
        if (*(void *)v267 != v253) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v266 + 1) + 8LL * (void)k);
        CGRect v281 = CGRectFromString((NSString *)objc_msgSend(v32, "objectForKey:", @"rect", *(void *)&v226));
        *(CGFloat *)&__int128 v264 = v281.origin.x;
        *((void *)&v264 + 1) = *(void *)&v281.origin.y;
        *(CGFloat *)&__int128 v265 = v281.size.width;
        *((void *)&v265 + 1) = *(void *)&v281.size.height;
        if (v254 == (_BYTE *)&dword_0 + 1)
        {
          id v33 = -[NSDictionary objectForKey:](v259, "objectForKey:", ImageKey(0LL));
          [v33 imageAspectRatio];
          -[MREffectSlidingPanels _sizeForBreakAspectRatio:size:inContext:]( self,  "_sizeForBreakAspectRatio:size:inContext:",  a4);
          *(void *)&__int128 v265 = v34;
          *((void *)&v265 + 1) = v35;
          if (BYTE1(self->mTextSize.height))
          {
            if ([v33 canPlay])
            {
              [v33 imageAspectRatio];
              double v37 = v36;
              [v33 imageAspectRatio];
              double v39 = v38;
              [a4 localAspectRatio];
              double v41 = v40;
              if (v37 >= v30)
              {
                double v43 = 2.0;
                double v42 = 2.0 / v39 * v41;
              }

              else
              {
                double v42 = 2.0;
                double v43 = (v39 + v39) / v41;
              }

              *(double *)&__int128 v265 = v43;
              *((double *)&v265 + 1) = v42;
            }
          }
        }

        CGRect v282 = CGRectFromString((NSString *)[v32 objectForKey:@"border"]);
        double x = v282.origin.x;
        double v45 = v282.origin.y;
        double width = v282.size.width;
        double height = v282.size.height;
        *(double *)&__int128 v265 = *(double *)&v265 - (v282.size.width * v29 + v282.origin.x * v29);
        CGFloat v48 = v282.size.height * v29 + v282.origin.y * v29;
        [a4 localAspectRatio];
        *((double *)&v265 + 1) = *((double *)&v265 + 1) - v48 * v49;
        if (x != width) {
          *(double *)&__int128 v264 = *(double *)&v264 + (width - x) * -0.5 * v29;
        }
        if (v45 != height)
        {
          [a4 localAspectRatio];
          *((double *)&v264 + 1) = *((double *)&v264 + 1) + (v45 - height) * -0.5 * v29 * v50;
        }

        double v51 = *(double *)&v264;
        double v52 = *(double *)&v265;
        double v53 = 0.5;
        double v54 = *(double *)&v265 * 0.5;
        p_mPixelSize = &self->super.mPixelSize;
        double v56 = self->super.mPixelSize.width;
        double v57 = fabs(v56 * (v30 - (*(double *)&v264 + *(double *)&v265 * 0.5)));
        BOOL v58 = v57 < 2.0;
        if (v57 < 2.0) {
          double v51 = v30 - *(double *)&v265 * 0.5;
        }
        double v59 = fabs(v56 * (v51 - v54 + v30));
        if (v58 || v59 < 2.0)
        {
          double v60 = v54 + -1.0;
          if (v59 >= 2.0) {
            double v60 = v51;
          }
          *(double *)&__int128 v264 = v60;
        }

        double v61 = *((double *)&v264 + 1);
        double v62 = *((double *)&v265 + 1);
        double v63 = *((double *)&v265 + 1) * 0.5;
        double v64 = self->super.mPixelSize.height;
        double v65 = fabs(v64 * (v30 - (*((double *)&v264 + 1) + *((double *)&v265 + 1) * 0.5)));
        BOOL v66 = v65 < 2.0;
        if (v65 < 2.0) {
          double v61 = v30 - *((double *)&v265 + 1) * 0.5;
        }
        double v67 = fabs(v64 * (v61 - v63 + v30));
        if (v66 || v67 < 2.0)
        {
          double v68 = v63 + -1.0;
          if (v67 >= 2.0) {
            double v68 = v61;
          }
          *((double *)&v264 + 1) = v68;
        }

        [a4 localAspectRatio];
        float v70 = v69;
        CGPoint v263 = v257;
        unsigned int v71 = objc_msgSend(objc_msgSend(v32, "objectForKey:", @"isText"), "BOOLValue");
        if (v71)
        {
          objc_msgSend( *(id *)((char *)&self->mTextRenderer + 1),  "relativeSizeInContextPixelSize:",  p_mPixelSize->width,  self->super.mPixelSize.height);
          double v73 = *(double *)&v264 - *(double *)&v265 * 0.5 + v72 * 0.5;
          *(double *)&__int128 v265 = v72;
          *((double *)&v265 + 1) = v74;
          *(double *)&__int128 v264 = v73;
          double v75 = v72 / v74;
          [a4 localAspectRatio];
          double v77 = v75 * v76;
          goto LABEL_92;
        }

        double v77 = v52 / v62 * v70;
        id v78 = -[NSDictionary objectForKey:](v259, "objectForKey:", ImageKey(v28));
        [v78 imageAspectRatio];
        if (v79 >= 0.5 && v79 <= 2.0
          || (([v78 imageAspectRatio], v77 > v30) ? (BOOL v81 = v80 < v30) : (BOOL v81 = 0), v81))
        {
          BOOL v86 = 0;
          char v83 = v250;
          if ((v250 & 1) != 0) {
            goto LABEL_82;
          }
        }

        else
        {
          BOOL v82 = v77 >= v30 || v80 <= v30;
          char v83 = v250;
          if (v82)
          {
            BOOL v58 = v80 < v30;
            double v84 = v80 / v77;
            double v85 = v77 / v80;
            if (!v58) {
              double v85 = v84;
            }
            BOOL v86 = v85 >= 1.1;
            if ((v250 & 1) != 0)
            {
LABEL_82:
              if (((v247 ^ v86) & 1) == 0) {
                goto LABEL_92;
              }
            }
          }

          else
          {
            BOOL v86 = 0;
            if ((v250 & 1) != 0) {
              goto LABEL_82;
            }
          }
        }

        if ((v83 & 1) != 0) {
          [a4 unsetShader];
        }
        if ([a4 foreColorIsOpaqueWhite])
        {
          __int128 v87 = @"PlainTextureNoColor";
          objc_super v88 = @"PlainTextureHighNoColor";
        }

        else
        {
          __int128 v87 = @"PlainTexture";
          objc_super v88 = @"PlainTextureHigh";
        }

        if (v86) {
          __int128 v89 = v88;
        }
        else {
          __int128 v89 = v87;
        }
        [a4 setShader:v89];
        char v250 = 1;
        BOOL v247 = v86;
LABEL_92:
        if (-[MREffect isInInteractiveMode](self, "isInInteractiveMode"))
        {
          double v90 = *(double *)((char *)&self->mExitCurve + 1);
          double v91 = v258 + (double)v28 * v248;
          double v92 = v90 - v91;
          if (a3 < v258) {
            a3 = v258;
          }
          double v93 = 0.0;
          if (v92 >= 0.0)
          {
            double v93 = v90 - v91;
            if (v92 > v30) {
              double v93 = 1.0;
            }
          }

          BOOL v58 = a3 < v90;
          double v94 = v93 + (a3 - v90) * (v30 - v93) / (v245 - v90);
          double v95 = (a3 - v258) * v93 / (v90 - v258);
          if (!v58) {
            double v95 = v94;
          }
          double v96 = v91 + v95;
        }

        else
        {
          double v96 = a3;
        }

        if (v96 < 0.666)
        {
          [*(id *)(&self->mFitMovies + 1) evaluatAtTime:v96 / 0.666];
          double v98 = v97;
          double v99 = 0.0;
          if (v96 >= 0.5)
          {
            float v100 = (v96 + -0.5) / 0.166;
            double v99 = (float)(v100 * v100);
          }

          id v101 = [v32 objectForKey:@"enter"];
          else {
            unsigned int v102 = [v101 isEqualToString:@"ch"];
          }
          unsigned int v108 = [v101 isEqualToString:@"cv"];
          -[MREffectSlidingPanels computeAnimationForTime:direction:rect:justification:]( self,  "computeAnimationForTime:direction:rect:justification:",  v101,  &v264,  &v263,  v98);
          char v109 = v71 ^ 1;
          if (v77 <= v30) {
            char v109 = 1;
          }
          if ((v109 & 1) == 0) {
            *((double *)&v264 + 1) = *((double *)&v264 + 1) + v29 * v98;
          }
          BOOL v103 = 1;
          goto LABEL_127;
        }

        if (((v249 < v28) & v260) == 1
          && !-[MREffect isInInteractiveMode](self, "isInInteractiveMode"))
        {
          unsigned int v108 = 0;
          unsigned int v102 = 0;
          BOOL v103 = 1;
          double v99 = 0.0;
          int64_t v110 = v28;
          goto LABEL_180;
        }

        BOOL v103 = v96 < v234;
        if (v96 >= v234)
        {
          [*(id *)((char *)&self->mEnterCurve + 1) evaluatAtTime:(v96 - v234) / 0.333];
          double v115 = v114;
          double v99 = 1.0;
          if (v96 < v233)
          {
            float v116 = (v96 - v230) / 0.1666;
            double v99 = (float)(v116 * v116);
          }

          id v117 = [v32 objectForKey:@"exit"];
          else {
            unsigned int v102 = [v117 isEqualToString:@"ch"];
          }
          unsigned int v108 = [v117 isEqualToString:@"cv"];
          -[MREffectSlidingPanels computeAnimationForTime:direction:rect:justification:]( self,  "computeAnimationForTime:direction:rect:justification:",  v117,  &v264,  &v263,  v30 - v115);
          char v118 = v71 ^ 1;
          if (v77 <= v30) {
            char v118 = 1;
          }
          if ((v118 & 1) == 0)
          {
            *((double *)&v264 + 1) = *((double *)&v264 + 1) + v29;
            if ((v260 & 1) == 0)
            {
              BOOL v103 = 0;
LABEL_174:
              char v260 = 0;
LABEL_127:
              int64_t v110 = v28;
              if (v71) {
                goto LABEL_128;
              }
              goto LABEL_181;
            }

            goto LABEL_179;
          }

          goto LABEL_173;
        }

        if (((v249 == v28) & v260) == 0
          && !-[MREffect isInInteractiveMode](self, "isInInteractiveMode"))
        {
          if (v77 > v30) {
            unsigned int v122 = v71;
          }
          else {
            unsigned int v122 = 0;
          }
          if (v122 == 1)
          {
            unsigned int v108 = 0;
            *((double *)&v264 + 1) = *((double *)&v264 + 1) + v29;
            double v99 = 0.0;
            if ((v260 & 1) == 0)
            {
LABEL_158:
              BOOL v103 = 1;
              unsigned int v102 = 0;
              int64_t v110 = v28;
              char v260 = 0;
              if (v71) {
                goto LABEL_128;
              }
              goto LABEL_181;
            }

            unsigned int v102 = 0;
            goto LABEL_179;
          }

          unsigned int v108 = 0;
          unsigned int v102 = 0;
          double v99 = 0.0;
LABEL_173:
          if ((v260 & 1) == 0) {
            goto LABEL_174;
          }
          goto LABEL_179;
        }

        unsigned int v104 = -[MREffect isInInteractiveMode](self, "isInInteractiveMode");
        double v105 = v258 + (double)v28 * v248;
        if (!v104) {
          double v105 = v258 + (double)v249 * (v258 + 1.0);
        }
        double v106 = v96 - v105;
        if (v96 - v105 < 0.0 || v106 >= v30)
        {
          unsigned int v108 = 0;
          double v99 = 0.0;
          if (v106 < 0.0) {
            goto LABEL_158;
          }
          unsigned int v102 = 0;
          goto LABEL_173;
        }

        if (v106 <= 0.333000004) {
          double v119 = v106 / 0.333000004;
        }
        else {
          double v119 = v30;
        }
        double v99 = 0.0;
        double v251 = v77;
        if (v106 <= 0.333000004)
        {
          double v120 = 0.0;
        }

        else
        {
          double v120 = (v106 + -0.333000004) / 0.666000009;
          if (v106 >= 0.834000006 && v120 > 0.0)
          {
            float v121 = (v106 + -0.834000006) / 0.165999994;
            double v99 = (float)(v121 * v121);
          }
        }

        [*(id *)((char *)&self->mEnterCurve + 1) evaluatAtTime:v119];
        double v124 = v123;
        [*(id *)(&self->mFitMovies + 1) evaluatAtTime:v120];
        double v126 = v125;
        __int128 v261 = v264;
        __int128 v262 = v265;
        -[MREffectSlidingPanels computeAnimationForTime:direction:rect:justification:]( self,  "computeAnimationForTime:direction:rect:justification:",  [v32 objectForKey:@"exit"],  &v264,  &v263,  v30 - v124);
        BOOL v58 = v124 < v30;
        double v53 = 0.5;
        if (v58)
        {
          v127 = ImageKey(v28);
          id v128 = -[NSDictionary objectForKey:](v259, "objectForKey:", v127);
          unsigned int v129 = -[MREffect isInInteractiveMode](self, "isInInteractiveMode");
          double v130 = v96;
          if (v129) {
            double v130 = *(double *)((char *)&self->mExitCurve + 1);
          }
          id v240 = [v128 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v130];
          v131 = *(CGContext **)((char *)&self->mCachedRenderedText + 1);
          v132 = (MRCroppingSprite *)[v131 objectForKey:v127];
          if (!v132)
          {
            v132 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
            [v131 setObject:v132 forKey:v127];
          }

          *(float *)&double v133 = v251;
          -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v132,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v240,  a4,  v264,  v265,  v133,  v263);
          [v240 releaseByUser];
          BOOL v103 = v96 < v234;
        }

        id v134 = [v32 objectForKey:@"enter"];
        v135 = v134;
        if (v126 <= 0.0)
        {
          unsigned int v108 = 0;
          unsigned int v102 = 0;
        }

        else
        {
          else {
            unsigned int v102 = [v135 isEqualToString:@"ch"];
          }
          unsigned int v108 = [v135 isEqualToString:@"cv"];
        }

        CGPoint v263 = v257;
        __int128 v264 = v261;
        __int128 v265 = v262;
        -[MREffectSlidingPanels computeAnimationForTime:direction:rect:justification:]( self,  "computeAnimationForTime:direction:rect:justification:",  v135,  &v264,  &v263,  v126);
        if ((v260 & 1) != 0)
        {
          double v77 = v251;
LABEL_179:
          int64_t v110 = v28 + v232;
LABEL_180:
          char v260 = 1;
          if (v71) {
            goto LABEL_128;
          }
          goto LABEL_181;
        }

        char v260 = 0;
        BOOL v103 = 1;
        int64_t v110 = v28;
        double v77 = v251;
        if (v71)
        {
LABEL_128:
          [a4 blend:2];
          if (!-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
            || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
          {
            *(float *)&double v111 = v77;
            [*(id *)((char *)&self->mBreakInformation + 1) renderImage:*(MRTextRenderer **)((char *)&self->mTextRenderer + 1) inContext:a4 atPosition:v264 andSize:v265 withReferenceAspectRatio:v111 andJustifications:v263];
          }

          float64x2_t v112 = vdivq_f64(*(float64x2_t *)(&self->mHasBreak + 1), *(float64x2_t *)p_mPixelSize);
          float64x2_t v113 = vaddq_f64(v112, v112);
          LODWORD(v111) = 0;
          objc_msgSend( *(id *)((char *)&self->mBreakInformation + 1),  "fakeRenderInContext:atPosition:andSize:zRotation:",  a4,  vmlad_n_f64(*(double *)&v264 - *(double *)&v265 * v53, v53, v113.f64[0]),  *((double *)&v264 + 1),  *(_OWORD *)&v113,  v111);
          [a4 blend:0];
          goto LABEL_321;
        }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((objc_msgSend( *(id *)((char *)&self->mBreakInformation + 1),  "hitAtPoint:withInverseMatrix:localPoint:") & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = *(CGContext **)((char *)&self->mCachedRenderedText + 1);
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
      float v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = [*(id *)((char *)&self->mCachedRenderedText + 1) objectForKey:v16];
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

- (BOOL)getVerticesCoordinates:(MREffectSlidingPanels *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v9 = [*(id *)((char *)&self->mCachedRenderedText + 1) objectForKey:a5];
  if (v9) {
    goto LABEL_4;
  }
  unsigned int v10 = [a5 isEqualToString:@"text0"];
  if (v10)
  {
    id v9 = *(NSDictionary **)((char *)&self->mBreakInformation + 1);
LABEL_4:
    LOBYTE(v10) = [v9 getVerticesCoordinates:a3 withMatrix:a4];
  }

  return v10;
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  BOOL v6 = a6;
  int64_t v11 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v12 = [*(id *)(&self->mIsLoaded + 1) count];
  unint64_t v13 = (unint64_t)v12;
  double v14 = (double)(uint64_t)v12;
  double v15 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  double v16 = (v15 - (double)(uint64_t)v12) / (double)((uint64_t)v12 + 1);
  signed int v17 = objc_msgSend(objc_msgSend(a5, "substringFromIndex:", 5), "intValue");
  if (!v6)
  {
    if (v13 <= v17)
    {
      double v18 = v16 + 1.0;
      goto LABEL_8;
    }

    return 0;
  }

  if (v13 <= v17) {
    return 0;
  }
  double v18 = v15 - v16;
LABEL_8:
  *a3 = v18;
  *a4 = v16 * (double)(uint64_t)(v13 - 1) + v14;
  return 1;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  int64_t v11 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v12 = [*(id *)(&self->mIsLoaded + 1) count];
  if ((uint64_t)v12 >= v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
    return -[MREffect hasMoreSlidesFromTime:backwards:startTime:duration:]( &v17,  "hasMoreSlidesFromTime:backwards:startTime:duration:",  v8,  a5,  a6,  a3);
  }

  double v13 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  double v14 = (v13 - (double)(uint64_t)v12) / (double)((uint64_t)v12 + 1);
  if (v8)
  {
    if (v14 < a3)
    {
      *a5 = v13 - v14;
      double v15 = -(v13 + v14 * -2.0);
LABEL_8:
      *a6 = v15;
      return 1;
    }
  }

  else if (v13 - v14 > a3)
  {
    *a5 = v14;
    double v15 = v13 + v14 * -2.0;
    goto LABEL_8;
  }

  return 0;
}

- (void)enterInteractiveModeAtTime:(double)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
  -[MREffect enterInteractiveModeAtTime:](&v20, "enterInteractiveModeAtTime:");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  objc_super v5 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", 0LL),  "objectEnumerator");
  id v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        [v10 setShowTimeScript:0];
        [v10 setShowDuration:self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration];
        [v10 setShowTime:0.0];
      }

      id v7 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    }

    while (v7);
  }

  *(double *)((char *)&self->mExitCurve + 1) = a3;
  int64_t v11 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v12 = [*(id *)(&self->mIsLoaded + 1) count];
  if ((uint64_t)v12 < v11)
  {
    double v13 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
    double v14 = (v13 - (double)(uint64_t)v12) / (double)((uint64_t)v12 + 1);
    double v15 = *(double *)((char *)&self->mExitCurve + 1);
    if (v15 < v14 || (double v14 = v13 - v14, v15 > v14)) {
      *(double *)((char *)&self->mExitCurve + 1) = v14;
    }
  }

- (void)exitInteractiveMode
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectSlidingPanels;
  -[MREffect exitInteractiveMode](&v3, "exitInteractiveMode");
  *(MRCAMLBezierData **)((char *)&self->mExitCurve + 1) = (MRCAMLBezierData *)0xC1CDCD6500000000LL;
}

- (double)interestingTimeForTime:(double)a3
{
  int64_t v5 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v6 = [*(id *)(&self->mIsLoaded + 1) count];
  double result = self->super.mPhaseInDuration;
  if ((uint64_t)v6 < v5)
  {
    double v8 = result + self->super.mMainDuration + self->super.mPhaseOutDuration;
    double v9 = v8 - (v8 - (double)(uint64_t)v6) / (double)((uint64_t)v6 + 1);
    if (v9 <= a3) {
      return v9;
    }
  }

  return result;
}

- (double)interestingTimeForElement:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "integerValue");
  id v5 = [*(id *)(&self->mIsLoaded + 1) count];
  double result = self->super.mPhaseInDuration;
  if ((uint64_t)v4 >= (uint64_t)v5)
  {
    double v7 = result + self->super.mMainDuration + self->super.mPhaseOutDuration;
    return v7 - (v7 - (double)(uint64_t)v5) / (double)((uint64_t)v5 + 1);
  }

  return result;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  int64_t v11 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v12 = [*(id *)(&self->mIsLoaded + 1) count];
  if ((uint64_t)v12 >= v11)
  {
    *a3 = self->super.mMainDuration;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v18 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", 0LL),  "objectEnumerator");
    id v19 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    if (v19)
    {
      id v20 = v19;
      char v21 = 0;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)i) imageAspectRatio];
          BOOL v25 = v24 > 2.0 || v24 < 0.5;
          v21 |= v25;
        }

        id v20 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      }

      while (v20);
      double v26 = 0.1;
      if ((v21 & 1) == 0) {
        double v26 = 0.0;
      }
    }

    else
    {
      double v26 = 0.0;
    }

    *a4 = v26;
    *a5 = self->super.mPhaseOutDuration;
  }

  else
  {
    double mPhaseInDuration = self->super.mPhaseInDuration;
    double mPhaseOutDuration = self->super.mPhaseOutDuration;
    double v15 = mPhaseInDuration + self->super.mMainDuration + mPhaseOutDuration;
    double v16 = (v15 - (double)(uint64_t)v12) / (double)((uint64_t)v12 + 1);
    if (v15 * 0.5 <= a6)
    {
      *a3 = v16 - mPhaseOutDuration;
      double v17 = self->super.mPhaseOutDuration;
    }

    else
    {
      *a3 = v16 - mPhaseInDuration;
      double v17 = v15 + v16 * -2.0;
    }

    *a5 = v17;
    *a4 = 0.0;
  }

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  BYTE1(self->mMaxTextSize.height) = 0;
}

- (void)computeAnimationForTime:(double)a3 direction:(id)a4 rect:(CGRect *)a5 justification:(CGPoint *)a6
{
  double x = a6->x;
  double y = a6->y;
  double v12 = a5->origin.x;
  double v20 = a5->origin.y;
  double width = a5->size.width;
  double height = a5->size.height;
  double v15 = width * 0.5;
  if ([a4 characterAtIndex:0] == 108)
  {
    double v12 = v12 - v15 + v15 * a3;
    double width = width * a3;
    double x = 3.0;
  }

  else if ([a4 characterAtIndex:0] == 114)
  {
    double v12 = v12 + v15 - v15 * a3;
    double width = width * a3;
    double x = 1.0;
  }

  else
  {
    double v17 = height * 0.5;
    if ([a4 characterAtIndex:0] == 117)
    {
      double v16 = v20 + v17 - v17 * a3;
      double height = height * a3;
      double y = 3.0;
      goto LABEL_6;
    }

    if ([a4 characterAtIndex:0] == 100)
    {
      double v16 = v20 - v17 + v17 * a3;
      double height = height * a3;
      double y = 1.0;
      goto LABEL_6;
    }

    if ([a4 isEqualToString:@"c"]
      || [a4 isEqualToString:@"cv"])
    {
      double height = height * a3;
      double y = 2.0;
    }

    else
    {
      unsigned int v18 = [a4 isEqualToString:@"ch"];
      double v19 = 1.0;
      if (v18) {
        double v19 = a3;
      }
      double width = width * v19;
      if (v18) {
        double y = 2.0;
      }
    }
  }

  double v16 = v20;
LABEL_6:
  a5->origin.double x = v12;
  a5->origin.double y = v16;
  a5->size.double width = width;
  a5->size.double height = height;
  a6->double x = x;
  a6->double y = y;
}

@end