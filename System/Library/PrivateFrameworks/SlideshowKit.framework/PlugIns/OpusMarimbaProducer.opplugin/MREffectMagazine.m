@interface MREffectMagazine
- (BOOL)getVerticesCoordinates:(MREffectMagazine *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_sizeForBreakAspectRatio:(double)a3 size:(CGSize)a4 inContext:(id)a5;
- (MREffectMagazine)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_applySizeScripts:(id)a3;
- (void)_cleanup;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectMagazine

- (MREffectMagazine)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectMagazine;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3[209] = 0;
  }

  return (MREffectMagazine *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(void *)&self->mFitMovie = 0LL;
  BYTE1(self->mTextImage0) = 0;
  BYTE2(self->mTextImage0) = 0;
}

- (void)setPixelSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectMagazine;
  -[MREffect setPixelSize:](&v4, "setPixelSize:", a3.width, a3.height);
  BYTE1(self->mTextImage0) = 0;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "objectForKey:",  @"text0");
  return !v4 || ![v4 length] || *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) != 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!BYTE1(self->mTextImage0))
  {

    *(void *)&self->mFitMovie = 0LL;
    mFlattenedAttributes = self->super.mFlattenedAttributes;
    [a4 localAspectRatio];
    if (v10 >= 1.0) {
      v11 = @"slideContainers";
    }
    else {
      v11 = @"portraitSlideContainers";
    }
    id v12 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", v11);
    *(void *)&self->mFitMovie = v12;
    if (!v12)
    {
      v13 = self->super.mFlattenedAttributes;
      [a4 localAspectRatio];
      if (v14 < 1.0) {
        v15 = @"slideContainers";
      }
      else {
        v15 = @"portraitSlideContainers";
      }
      *(void *)&self->mFitMovie = -[NSDictionary objectForKey:](v13, "objectForKey:", v15);
    }

    BYTE2(self->mTextImage0) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"fitMovies"),  "BOOLValue");
    -[MREffectMagazine _applySizeScripts:](self, "_applySizeScripts:", a4);
    BYTE1(self->mTextImage0) = 1;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MREffectMagazine;
  -[MREffect prerenderForTime:inContext:withArguments:](&v17, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)_applySizeScripts:(id)a3
{
  NSUInteger v5 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v37 = a3;
  [a3 localAspectRatio];
  float v7 = v6;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = *(id *)&self->mFitMovie;
  id v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    double v11 = v7;
    uint64_t v12 = *(void *)v40;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        float v14 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v13);
        id v15 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v13 + v10));
        v16 = v15;
        if (v5 != 1)
        {
          CGRect v44 = CGRectFromString((NSString *)[v14 objectForKey:@"rect"]);
          double width = v44.size.width;
          double height = v44.size.height;
          CGRect v45 = CGRectFromString((NSString *)objc_msgSend( v14,  "objectForKey:",  @"border",  v44.origin.x,  v44.origin.y));
          double v21 = width - (v45.size.width * 0.003 + v45.origin.x * 0.003);
          double v20 = height - (v45.size.height * 0.003 + v45.origin.y * 0.003) * v11;
          goto LABEL_26;
        }

        if (BYTE2(self->mTextImage0) && [v15 canPlay])
        {
          [v16 imageAspectRatio];
          double v18 = v17;
          [v16 imageAspectRatio];
          if (v18 >= 1.0)
          {
            double v21 = 2.0;
            double v20 = 2.0 / v19 * v11;
          }

          else
          {
            double v20 = 2.0;
            double v21 = (v19 + v19) / v11;
          }
        }

        else
        {
          [v16 imageAspectRatio];
          double v25 = v24;
          [v16 imageAspectRatio];
          if (v7 >= 1.0)
          {
            if (v25 > 2.0)
            {
              v27 = self;
              goto LABEL_25;
            }

            double v21 = 2.0;
            double v20 = 2.0;
            if (v26 >= 1.0) {
              goto LABEL_26;
            }
            [v16 imageAspectRatio];
            double v29 = v28;
            [v16 imageAspectRatio];
            if (v29 < 0.5)
            {
              v27 = self;
              goto LABEL_25;
            }

            double v21 = 2.0 / v7 * v30;
          }

          else
          {
            if (v25 < 0.5)
            {
              v27 = self;
LABEL_25:
              -[MREffectMagazine _sizeForBreakAspectRatio:size:inContext:]( v27,  "_sizeForBreakAspectRatio:size:inContext:",  v37);
              double v21 = v34;
              double v20 = v35;
              goto LABEL_26;
            }

            double v21 = 2.0;
            if (v26 < 1.0)
            {
              double v20 = 2.0;
              goto LABEL_26;
            }

            [v16 imageAspectRatio];
            double v32 = v31;
            [v16 imageAspectRatio];
            if (v32 > 2.0)
            {
              v27 = self;
              goto LABEL_25;
            }

            double v20 = (v11 + v11) / v33;
          }
        }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v8 = 16LL;
  uint64_t v9 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  id v88 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"layout"),  "integerValue");
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  id obj = *(id *)&self->mFitMovie;
  id v100 = [obj countByEnumeratingWithState:&v108 objects:v112 count:16];
  int v10 = 0;
  if (!v100)
  {
    BOOL v101 = 0;
    goto LABEL_69;
  }

  BOOL v101 = 0;
  double v11 = 0LL;
  uint64_t v96 = *(void *)v109;
  CGFloat y = CGRectZero.origin.y;
  CGFloat height = CGRectZero.size.height;
  CGFloat width = CGRectZero.size.width;
  double v91 = ((double)v9 + -1.0) * 0.1 + 0.2;
  uint64_t v97 = v9;
  uint64_t v89 = v9 - 1;
  double v90 = (double)(v9 - 1) * 0.1 + 0.2;
  double v106 = a3;
  double v12 = 1.0;
  do
  {
    v13 = 0LL;
    uint64_t v14 = v89 - (void)v11;
    v99 = v11;
    do
    {
      int v105 = v10;
      if (*(void *)v109 != v96) {
        objc_enumerationMutation(obj);
      }
      int64_t v15 = (int64_t)v13 + (void)v11;
      v16 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)v13);
      double v17 = ImageKey(v15);
      uint64_t v18 = v8;
      id v19 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "slideProvidersForElementIDs"),  "objectForKey:",  v17);
      id v20 = [v19 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
      double v104 = v12;
      if (v97 != 1)
      {
        CGRect v114 = CGRectFromString((NSString *)[v16 objectForKey:@"rect"]);
        double x = v114.origin.x;
        double v29 = v114.origin.y;
        double v107 = v114.size.width;
        double v28 = v114.size.height;
        CGRect v115 = CGRectFromString((NSString *)[v16 objectForKey:@"border"]);
        double v31 = v115.origin.x;
        double v32 = v115.origin.y;
        double v34 = v115.size.width;
        double v33 = v115.size.height;
        goto LABEL_29;
      }

      if (BYTE2(self->mTextImage0) && [v19 canPlay])
      {
        [v19 imageAspectRatio];
        double v22 = v21;
        [v19 imageAspectRatio];
        double v24 = v23;
        [a4 localAspectRatio];
        double v26 = v25;
        if (v22 < 1.0)
        {
          double v27 = v24 + v24;
          double v28 = 2.0;
          double v29 = y;
          double x = CGRectZero.origin.x;
          double v31 = CGRectZero.origin.x;
          double v32 = y;
          double v33 = height;
          double v34 = width;
          double v107 = v27 / v26;
          goto LABEL_29;
        }

        double v107 = 2.0;
        double v29 = y;
        double x = CGRectZero.origin.x;
        double v31 = CGRectZero.origin.x;
        double v32 = y;
        double v28 = 2.0 / v24 * v26;
        goto LABEL_28;
      }

      [a4 localAspectRatio];
      float v36 = v35;
      [v20 aspectRatio];
      BOOL v38 = v37 > 2.0 || v37 < 0.5;
      [v20 aspectRatio];
      if (v36 >= 1.0)
      {
        if (v38)
        {
          if (v39 < 1.0) {
LABEL_17:
          }
            [a4 localAspectRatio];
          [v20 aspectRatio];
          -[MREffectMagazine _sizeForBreakAspectRatio:size:inContext:]( self,  "_sizeForBreakAspectRatio:size:inContext:",  a4);
          double v107 = v43;
          double v28 = v44;
          double x = CGRectZero.origin.x;
          double v31 = CGRectZero.origin.x;
        }

        else
        {
          double v107 = 2.0;
          double v29 = y;
          double x = CGRectZero.origin.x;
          double v31 = CGRectZero.origin.x;
          double v32 = y;
          double v33 = height;
          double v34 = width;
          double v28 = 2.0;
          if (v39 >= 1.0) {
            goto LABEL_29;
          }
          [a4 localAspectRatio];
          double v41 = 2.0 / v40;
          [v19 imageAspectRatio];
          double x = CGRectZero.origin.x;
          double v31 = CGRectZero.origin.x;
          double v107 = v42 * v41;
        }

        double v29 = y;
        double v32 = y;
LABEL_28:
        double v33 = height;
        double v34 = width;
        goto LABEL_29;
      }

      if (v38) {
        goto LABEL_17;
      }
      double v107 = 2.0;
      if (v39 >= 1.0)
      {
        [a4 localAspectRatio];
        double v76 = v75 + v75;
        [v19 imageAspectRatio];
        double v29 = y;
        double x = CGRectZero.origin.x;
        double v31 = CGRectZero.origin.x;
        double v32 = y;
        double v33 = height;
        double v34 = width;
        double v28 = v76 / v77;
      }

      else
      {
        double v29 = y;
        double x = CGRectZero.origin.x;
        double v31 = CGRectZero.origin.x;
        double v32 = y;
        double v33 = height;
        double v34 = width;
        double v28 = 2.0;
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

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v10 = *(void **)(&self->super._isInInteractiveMode + 1);
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
        double v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
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

- (BOOL)getVerticesCoordinates:(MREffectMagazine *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  BYTE1(self->mTextImage0) = 0;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  *a4 = 0.25 / self->super.mMainDuration;
  *a3 = self->super.mMainDuration;
  *a5 = self->super.mPhaseOutDuration;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  uint64_t v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  uint64_t v9 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v7)
  {
    if (!v9) {
      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mSprites + 1) setTruncate:1];
    [*(id *)((char *)&self->mSprites + 1) setMaxNumberOfLines:3];
    id v10 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"layout"),  "integerValue");
    double width = self->super.mPixelSize.width * 0.5;
    if (!v10) {
      double width = self->super.mPixelSize.width;
    }
    double v12 = 0.25;
    if (v10) {
      double v12 = 0.9;
    }
    objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "setDefinedSize:",  width * 0.9,  self->super.mPixelSize.height * v12);
    [*(id *)((char *)&self->mSprites + 1) setText:v7];
    -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
    +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setScale:");
    [*(id *)((char *)&self->mSprites + 1) sizeOfText];
    [*(id *)((char *)&self->mSprites + 1) setRenderAtDefinedSize:1];
    [*(id *)((char *)&self->mSprites + 1) definedSize];
    objc_msgSend(*(id *)((char *)&self->mSprites + 1), "setDefinedSize:");
    double v13 = (CGContext *)[*(id *)((char *)&self->mSprites + 1) retainedContext];
    if (v13)
    {
      uint64_t v14 = v13;
      double v15 = (MRTextRenderer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v13);
      *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = v15;
      -[MRTextRenderer setLabel:](v15, "setLabel:", @"Marimba Magazine Text");
      CGContextRelease(v14);
    }
  }

  else
  {
    if (v9)
    {

      *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
    }

    [*(id *)(&self->super._isInInteractiveMode + 1) removeObjectForKey:@"text0"];
  }

- (void)_unload
{
  v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  id v4 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v4)
  {
    [v4 cleanup];

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  }

  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];

  *(void *)&self->mFitMovie = 0LL;
  BYTE1(self->mTextImage0) = 0;
  BYTE2(self->mTextImage0) = 0;
}

@end