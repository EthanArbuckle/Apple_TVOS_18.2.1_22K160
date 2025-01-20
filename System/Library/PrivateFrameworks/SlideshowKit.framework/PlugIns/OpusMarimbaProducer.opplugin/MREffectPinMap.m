@interface MREffectPinMap
- (BOOL)getVerticesCoordinates:(MREffectPinMap *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectPinMap)initWithEffectID:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_drawArrowInContext:(id)a3 atTime:(double)a4 withArguments:(id)a5 atPoint:(CGPoint)a6 scale:(double)a7 withTextAtIndex:(int64_t)a8 t:(CGPoint)a9 pointDown:(BOOL)a10 m:(float)a11[16];
- (void)_drawTitleInContext:(id)a3 atTime:(double)a4 withArguments:(id)a5 atPoint:(CGPoint)a6 scale:(double)a7 withTextAtIndex:(int64_t)a8;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectPinMap

- (MREffectPinMap)initWithEffectID:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MREffectPinMap;
  v4 = -[MREffect initWithEffectID:](&v9, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 433) = 0LL;
    *(void *)(v4 + 257) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 257),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"shadow.png"));
    [*(id *)(v4 + 257) setImageSizeScript:@"layerWidth,layerHeight"];
    objc_msgSend(*(id *)(v4 + 257), "setOriginalImageSize:", 3360.0, 2100.0);
    v5 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    *(void *)(v4 + 265) = v5;
    -[MRImageProvider setWantsMipmap:](v5, "setWantsMipmap:", 1LL);
    objc_msgSend( *(id *)(v4 + 265),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"pinShaftAndShadow.png"));
    [*(id *)(v4 + 265) setImageSizeScript:@"layerHeight*imageAspectRatio*.14,layerHeight * .14"];
    objc_msgSend(*(id *)(v4 + 265), "setOriginalImageSize:", 438.0, 390.0);
    v6 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    *(void *)(v4 + 273) = v6;
    -[MRImageProvider setWantsMipmap:](v6, "setWantsMipmap:", 1LL);
    objc_msgSend( *(id *)(v4 + 273),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"pinHead-Yellow.png"));
    [*(id *)(v4 + 273) setImageSizeScript:@"layerHeight*imageAspectRatio*.14,layerHeight * .14"];
    objc_msgSend(*(id *)(v4 + 273), "setOriginalImageSize:", 240.0, 240.0);
    v7 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    *(void *)(v4 + 281) = v7;
    -[MRImageProvider setWantsMipmap:](v7, "setWantsMipmap:", 1LL);
    objc_msgSend( *(id *)(v4 + 281),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"pinHead-Red.png"));
    [*(id *)(v4 + 281) setImageSizeScript:@"layerHeight*imageAspectRatio*.14,layerHeight * .14"];
    objc_msgSend(*(id *)(v4 + 281), "setOriginalImageSize:", 240.0, 240.0);
    *(void *)(v4 + 409) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 409),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"smallShadow.png"));
    [*(id *)(v4 + 409) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight * .2"];
    objc_msgSend(*(id *)(v4 + 409), "setOriginalImageSize:", 800.0, 800.0);
    *(void *)(v4 + 417) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 417),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"bigShadow.png"));
    [*(id *)(v4 + 417) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight * .2"];
    objc_msgSend(*(id *)(v4 + 417), "setOriginalImageSize:", 700.0, 718.0);
  }

  return (MREffectPinMap *)v4;
}

- (void)_cleanup
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = *(MRImageProvider **)((char *)&self->mWaterProvider + 1);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(NSNull **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (v8 != +[NSNull null](&OBJC_CLASS___NSNull, "null")) {
          -[NSNull removingFromCollection](v8, "removingFromCollection");
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  *(MRImageProvider **)((char *)&self->mWaterProvider + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mTextImages + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mTextLineCounts + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  [*(id *)((char *)&self->mLocalMatrix[14] + 1) cleanup];

  *(void *)((char *)&self->mLocalMatrix[14] + 1) = 0LL;
  [*(id *)((char *)&self->mGradientProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
  [*(id *)((char *)&self->mPinProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mPinProvider + 1) = 0LL;
  [*(id *)((char *)&self->mYellowPinProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mYellowPinProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTitleBoxRightProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTitleBoxRightProvider + 1) = 0LL;
  [*(id *)((char *)&self->mBoxShadowSmall + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBoxShadowSmall + 1) = 0LL;
  [*(id *)((char *)&self->mRedPinProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mRedPinProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxArrowProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxArrowProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxMiddleProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxMiddleProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxCapProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxCapProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxArrowFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxMiddleFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBoxCapFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBoxCapFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2ArrowProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2ArrowProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2MiddleProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2MiddleProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2CapProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2CapProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2ArrowFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2MiddleFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBox2CapFlippedProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTitleBoxLeftProvider + 1) = 0LL;
  [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTitleBoxMiddleProvider + 1) = 0LL;
  [*(id *)((char *)&self->mBoxShadowBigScaled + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mBoxShadowBigScaled + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mTextYOffsets + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MREffectPinMap;
  -[MREffect setPixelSize:](&v10, "setPixelSize:");
  objc_msgSend(*(id *)((char *)&self->mLocalMatrix[14] + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mPinProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mYellowPinProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mTitleBoxRightProvider + 1), "setDefaultSize:", width, height);
  objc_msgSend(*(id *)((char *)&self->mBoxShadowSmall + 1), "setDefaultSize:", width, height);
  uint64_t v6 = *(MRImageProvider **)((char *)&self->mRedPinProvider + 1);
  if (v6)
  {
    objc_msgSend(v6, "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBoxArrowProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBoxMiddleProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBoxCapProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1), "setDefaultSize:", width, height);
  }

  v7 = *(MRImageProvider **)((char *)&self->mTextBoxCapFlippedProvider + 1);
  if (v7)
  {
    objc_msgSend(v7, "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBox2ArrowProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBox2MiddleProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBox2CapProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1), "setDefaultSize:", width, height);
  }

  v8 = *(MRImageProvider **)((char *)&self->mTextBox2CapFlippedProvider + 1);
  if (v8)
  {
    objc_msgSend(v8, "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTitleBoxLeftProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTitleBoxMiddleProvider + 1), "setDefaultSize:", width, height);
  }

  __int128 v9 = *(MRImageProvider **)((char *)&self->mBoxShadowBigScaled + 1);
  if (v9) {
    objc_msgSend(v9, "setDefaultSize:", width, height);
  }
}

- (void)setAttributes:(id)a3
{
  v93.receiver = self;
  v93.super_class = (Class)&OBJC_CLASS___MREffectPinMap;
  -[MREffect setAttributes:](&v93, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    v60 = self;
    id v6 = -[NSDictionary objectForKey:](mFlattenedAttributes, "objectForKey:", @"pinInformation");
    id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v89 objects:v101 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v90;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v90 != v10) {
            objc_enumerationMutation(v6);
          }
          __int128 v12 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
          id v13 = [v12 mutableCopy];
          CGPoint v14 = CGPointFromString((NSString *)[v12 objectForKey:@"location"]);
          objc_msgSend( v13,  "setObject:forKey:",  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v14.x, v14.y),  @"location");
          [v7 addObject:v13];
        }

        id v9 = [v6 countByEnumeratingWithState:&v89 objects:v101 count:16];
      }

      while (v9);
    }

    id v15 = -[NSDictionary objectForKey:](v60->super.mFlattenedAttributes, "objectForKey:", @"extraPinLocations");
    id v16 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id v17 = [v15 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v86;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v86 != v19) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(v16, "addIndex:", objc_msgSend(*(id *)(*((void *)&v85 + 1) + 8 * (void)j), "integerValue"));
        }

        id v18 = [v15 countByEnumeratingWithState:&v85 objects:v100 count:16];
      }

      while (v18);
    }

    id v59 = v16;
    id v21 = -[NSDictionary objectForKey:]( v60->super.mFlattenedAttributes,  "objectForKey:",  @"lastExtraPinLocations");
    id v22 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    id v23 = [v21 countByEnumeratingWithState:&v81 objects:v99 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v82;
      do
      {
        for (k = 0LL; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v82 != v25) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v22, "addIndex:", objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * (void)k), "integerValue"));
        }

        id v24 = [v21 countByEnumeratingWithState:&v81 objects:v99 count:16];
      }

      while (v24);
    }

    id v27 = -[NSDictionary objectForKey:]( v60->super.mFlattenedAttributes,  "objectForKey:",  @"nextExtraPinLocations");
    id v28 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v29 = [v27 countByEnumeratingWithState:&v77 objects:v98 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v78;
      do
      {
        for (m = 0LL; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v78 != v31) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(v28, "addIndex:", objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * (void)m), "integerValue"));
        }

        id v30 = [v27 countByEnumeratingWithState:&v77 objects:v98 count:16];
      }

      while (v30);
    }

    id v33 = -[NSDictionary objectForKey:](v60->super.mFlattenedAttributes, "objectForKey:", @"flippedBoxes");
    id v34 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v35 = [v33 countByEnumeratingWithState:&v73 objects:v97 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v74;
      do
      {
        for (n = 0LL; n != v36; n = (char *)n + 1)
        {
          if (*(void *)v74 != v37) {
            objc_enumerationMutation(v33);
          }
          objc_msgSend(v34, "addIndex:", objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * (void)n), "integerValue"));
        }

        id v36 = [v33 countByEnumeratingWithState:&v73 objects:v97 count:16];
      }

      while (v36);
    }

    id v39 = -[NSDictionary objectForKey:](v60->super.mFlattenedAttributes, "objectForKey:", @"lastFlippedBoxes");
    id v40 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v41 = [v39 countByEnumeratingWithState:&v69 objects:v96 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v70;
      do
      {
        for (ii = 0LL; ii != v42; ii = (char *)ii + 1)
        {
          if (*(void *)v70 != v43) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend( v40,  "addIndex:",  objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * (void)ii), "integerValue"));
        }

        id v42 = [v39 countByEnumeratingWithState:&v69 objects:v96 count:16];
      }

      while (v42);
    }

    id v45 = -[NSDictionary objectForKey:](v60->super.mFlattenedAttributes, "objectForKey:", @"nextFlippedBoxes");
    id v46 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v47 = [v45 countByEnumeratingWithState:&v65 objects:v95 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v66;
      do
      {
        for (jj = 0LL; jj != v48; jj = (char *)jj + 1)
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v45);
          }
          objc_msgSend( v46,  "addIndex:",  objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * (void)jj), "integerValue"));
        }

        id v48 = [v45 countByEnumeratingWithState:&v65 objects:v95 count:16];
      }

      while (v48);
    }

    v51 = (NSDictionary *)-[NSDictionary mutableCopy](v60->super.mFlattenedAttributes, "mutableCopy");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v7, @"pinInformation");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v59, @"extraPinLocations");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v22, @"lastExtraPinLocations");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v28, @"nextExtraPinLocations");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v34, @"flippedBoxes");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v40, @"lastFlippedBoxes");
    -[NSDictionary setObject:forKey:](v51, "setObject:forKey:", v46, @"nextFlippedBoxes");

    v60->super.mFlattenedAttributes = v51;
    v52 = *(NSMutableArray **)((char *)&v60->mTextYOffsets + 1);
    if (v52)
    {

      *(NSMutableArray **)((char *)&v60->mTextYOffsets + 1) = 0LL;
    }

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v53 = [v7 countByEnumeratingWithState:&v61 objects:v94 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = 0LL;
      uint64_t v56 = *(void *)v62;
      do
      {
        for (kk = 0LL; kk != v54; kk = (char *)kk + 1)
        {
          if (*(void *)v62 != v56) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend( *(id *)(*((void *)&v61 + 1) + 8 * (void)kk),  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)kk + v55),  @"index");
        }

        id v54 = [v7 countByEnumeratingWithState:&v61 objects:v94 count:16];
        v55 += (uint64_t)kk;
      }

      while (v54);
    }

    *(NSMutableArray **)((char *)&v60->mTextYOffsets + 1) = (NSMutableArray *) [v7 sortedArrayUsingFunction:pinFrontToBackSort context:0];
    if (objc_msgSend( -[NSDictionary objectForKey:]( v60->super.mFlattenedAttributes,  "objectForKey:",  @"phaseInWater"),  "BOOLValue")) {
      unsigned __int8 v58 = 1;
    }
    else {
      unsigned __int8 v58 = objc_msgSend( -[NSDictionary objectForKey:]( v60->super.mFlattenedAttributes,  "objectForKey:",  @"phaseOutWater"),  "BOOLValue");
    }
    BYTE1(v60->mSortedPins) = v58;
    BYTE4(v60->mSortedPins) = NSRangeFromString((NSString *)-[NSDictionary objectForKey:]( v60->super.mFlattenedAttributes,  "objectForKey:",  @"pinRange")).location == 0;
  }

- (BOOL)isLoadedForTime:(double)a3
{
  if (-[NSDictionary count]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a3),  "count"))
  {
    BOOL v4 = *(MRImageProvider **)((char *)&self->mWaterProvider + 1) != 0LL;
  }

  else
  {
    BOOL v4 = 1;
  }

  unsigned int v5 = [*(id *)((char *)&self->mLocalMatrix[14] + 1) isLoaded];
  if (v5)
  {
    unsigned int v5 = [*(id *)((char *)&self->mGradientProvider + 1) isLoaded];
    if (v5)
    {
      unsigned int v5 = [*(id *)((char *)&self->mPinProvider + 1) isLoaded];
      if (v5)
      {
        unsigned int v5 = [*(id *)((char *)&self->mYellowPinProvider + 1) isLoaded];
        if (v5)
        {
          unsigned int v5 = [*(id *)((char *)&self->mTitleBoxRightProvider + 1) isLoaded];
          if (v5) {
            unsigned int v5 = ([*(id *)((char *)&self->mBoxShadowSmall + 1) isLoaded] & v4) == 1
          }
              && !self->super.mNeedsToUpdateTexts;
        }
      }
    }
  }

  if (BYTE2(self->mSortedPins))
  {
    char v6 = v5 ^ 1;
    if ((v6 & 1) != 0)
    {
      unsigned int v5 = 0;
    }

    else
    {
      unsigned int v5 = [*(id *)((char *)&self->mTextBoxCapFlippedProvider + 1) isLoaded];
      if (v5)
      {
        unsigned int v5 = [*(id *)((char *)&self->mTextBox2ArrowProvider + 1) isLoaded];
        if (v5)
        {
          unsigned int v5 = [*(id *)((char *)&self->mTextBox2MiddleProvider + 1) isLoaded];
          if (v5)
          {
            unsigned int v5 = [*(id *)((char *)&self->mTextBox2CapProvider + 1) isLoaded];
            if (v5)
            {
              unsigned int v5 = [*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1) isLoaded];
              if (v5) {
                unsigned int v5 = [*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1) isLoaded];
              }
            }
          }
        }
      }
    }
  }

  if (BYTE3(self->mSortedPins))
  {
    else {
      unsigned int v7 = 0;
    }
    if (v7 == 1)
    {
      unsigned int v5 = [*(id *)((char *)&self->mRedPinProvider + 1) isLoaded];
      if (v5)
      {
        unsigned int v5 = [*(id *)((char *)&self->mTextBoxArrowProvider + 1) isLoaded];
        if (v5)
        {
          unsigned int v5 = [*(id *)((char *)&self->mTextBoxMiddleProvider + 1) isLoaded];
          if (v5)
          {
            unsigned int v5 = [*(id *)((char *)&self->mTextBoxCapProvider + 1) isLoaded];
            if (v5)
            {
              unsigned int v5 = [*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1) isLoaded];
              if (v5) {
                unsigned int v5 = [*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1) isLoaded];
              }
            }
          }
        }
      }
    }

    else
    {
      unsigned int v5 = 0;
    }
  }

  if (BYTE4(self->mSortedPins))
  {
    else {
      unsigned int v8 = 0;
    }
    if (v8 == 1)
    {
      unsigned int v5 = [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) isLoaded];
      if (v5)
      {
        unsigned int v5 = [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) isLoaded];
        if (v5) {
          unsigned int v5 = [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) isLoaded];
        }
      }
    }

    else
    {
      unsigned int v5 = 0;
    }
  }

  if (BYTE1(self->mSortedPins))
  {
    else {
      unsigned int v9 = 0;
    }
    if (v9 == 1) {
      LOBYTE(v5) = [*(id *)((char *)&self->mBoxShadowBigScaled + 1) isLoaded];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MREffectPinMap;
  -[MREffect prerenderForTime:inContext:withArguments:](&v21, "prerenderForTime:inContext:withArguments:");
  [*(id *)((char *)&self->mBoxShadowSmall + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mLocalMatrix[14] + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGradientProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mPinProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mYellowPinProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mTitleBoxRightProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  if (BYTE4(self->mSortedPins))
  {
    unsigned int v9 = *(MRImageProvider **)((char *)&self->mTextBox2CapFlippedProvider + 1);
    uint64_t v10 = &OBJC_IVAR___MPFilter__internal;
    if (!v9)
    {
      *(MRImageProvider **)((char *)&self->mTextBox2CapFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2CapFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"titleCapLeft.png"));
      [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1), "setOriginalImageSize:", 230.0, 540.0);
      [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTitleBoxLeftProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTitleBoxLeftProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"titleMiddle.png"));
      [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTitleBoxLeftProvider + 1), "setOriginalImageSize:", 2480.0, 540.0);
      [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTitleBoxMiddleProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTitleBoxMiddleProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"titleCapRight.png"));
      [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTitleBoxMiddleProvider + 1), "setOriginalImageSize:", 356.0, 540.0);
      [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) setWantsMipmap:0];
      objc_msgSend( *(id *)((char *)&self->mTextBox2CapFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTitleBoxLeftProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      uint64_t v10 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTitleBoxMiddleProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      unsigned int v9 = *(MRImageProvider **)((char *)&self->mTextBox2CapFlippedProvider + 1);
    }

    [v9 prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v10[414]) prerenderForTime:a4 inContext:a5 withArguments:a3];
  }

  if (BYTE2(self->mSortedPins))
  {
    __int128 v11 = *(MRImageProvider **)((char *)&self->mTextBoxCapFlippedProvider + 1);
    __int128 v12 = &OBJC_IVAR___MPFilter__internal;
    id v13 = &OBJC_IVAR___MPFilter__internal;
    CGPoint v14 = &OBJC_IVAR___MPFilter__internal;
    if (!v11)
    {
      *(MRImageProvider **)((char *)&self->mTextBoxCapFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxCapFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2Arrow.png"));
      [*(id *)((char *)&self->mTextBoxCapFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxCapFlippedProvider + 1), "setOriginalImageSize:", 380.0, 488.0);
      [*(id *)((char *)&self->mTextBoxCapFlippedProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBox2ArrowProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2ArrowProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2Middle.png"));
      [*(id *)((char *)&self->mTextBox2ArrowProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2ArrowProvider + 1), "setOriginalImageSize:", 970.0, 488.0);
      [*(id *)((char *)&self->mTextBox2ArrowProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBox2MiddleProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2MiddleProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2Cap.png"));
      [*(id *)((char *)&self->mTextBox2MiddleProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2MiddleProvider + 1), "setOriginalImageSize:", 188.0, 488.0);
      [*(id *)((char *)&self->mTextBox2MiddleProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBox2CapProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2CapProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2ArrowFlipped.png"));
      [*(id *)((char *)&self->mTextBox2CapProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2CapProvider + 1), "setOriginalImageSize:", 280.0, 488.0);
      [*(id *)((char *)&self->mTextBox2CapProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBox2ArrowFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2MiddleFlipped.png"));
      [*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1), "setOriginalImageSize:", 972.0, 488.0);
      [*(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBox2MiddleFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBox2CapFlipped.png"));
      [*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.2,layerHeight*.2"];
      objc_msgSend(*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1), "setOriginalImageSize:", 286.0, 488.0);
      [*(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1) setWantsMipmap:0];
      objc_msgSend( *(id *)((char *)&self->mTextBoxCapFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTextBox2ArrowProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTextBox2MiddleProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      __int128 v12 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBox2CapProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      id v13 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBox2ArrowFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      CGPoint v14 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBox2MiddleFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      __int128 v11 = *(MRImageProvider **)((char *)&self->mTextBoxCapFlippedProvider + 1);
    }

    [v11 prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->mTextBox2ArrowProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->mTextBox2MiddleProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v12[409]) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v13[410]) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v14[411]) prerenderForTime:a4 inContext:a5 withArguments:a3];
  }

  if (BYTE3(self->mSortedPins))
  {
    id v15 = *(MRImageProvider **)((char *)&self->mRedPinProvider + 1);
    id v16 = &OBJC_IVAR___MPFilter__internal;
    id v17 = &OBJC_IVAR___MPFilter__internal;
    id v18 = &OBJC_IVAR___MPFilter__internal;
    if (!v15)
    {
      *(MRImageProvider **)((char *)&self->mRedPinProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mRedPinProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxArrow.png"));
      [*(id *)((char *)&self->mRedPinProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mRedPinProvider + 1), "setOriginalImageSize:", 280.0, 330.0);
      [*(id *)((char *)&self->mRedPinProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBoxArrowProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxArrowProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxMiddle.png"));
      [*(id *)((char *)&self->mTextBoxArrowProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxArrowProvider + 1), "setOriginalImageSize:", 994.0, 330.0);
      [*(id *)((char *)&self->mTextBoxArrowProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBoxMiddleProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxMiddleProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxCap.png"));
      [*(id *)((char *)&self->mTextBoxMiddleProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxMiddleProvider + 1), "setOriginalImageSize:", 110.0, 330.0);
      [*(id *)((char *)&self->mTextBoxMiddleProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBoxCapProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxCapProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxArrowFlipped.png"));
      [*(id *)((char *)&self->mTextBoxCapProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxCapProvider + 1), "setOriginalImageSize:", 200.0, 330.0);
      [*(id *)((char *)&self->mTextBoxCapProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBoxArrowFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxMiddleFlipped.png"));
      [*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1), "setOriginalImageSize:", 1002.0, 330.0);
      [*(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1) setWantsMipmap:0];
      *(MRImageProvider **)((char *)&self->mTextBoxMiddleFlippedProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  self->super.mEffectID,  @"textBoxCapFlipped.png"));
      [*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.1,layerHeight*.1"];
      objc_msgSend(*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1), "setOriginalImageSize:", 182.0, 330.0);
      [*(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1) setWantsMipmap:0];
      objc_msgSend( *(id *)((char *)&self->mRedPinProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTextBoxArrowProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      objc_msgSend( *(id *)((char *)&self->mTextBoxMiddleProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      id v16 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBoxCapProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      id v17 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBoxArrowFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      id v18 = &OBJC_IVAR___MPFilter__internal;
      objc_msgSend( *(id *)((char *)&self->mTextBoxMiddleFlippedProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      id v15 = *(MRImageProvider **)((char *)&self->mRedPinProvider + 1);
    }

    [v15 prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->mTextBoxArrowProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->mTextBoxMiddleProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v16[403]) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v17[404]) prerenderForTime:a4 inContext:a5 withArguments:a3];
    [*(id *)((char *)&self->super.super.isa + v18[405]) prerenderForTime:a4 inContext:a5 withArguments:a3];
  }

  if (BYTE1(self->mSortedPins))
  {
    uint64_t v19 = *(MRImageProvider **)((char *)&self->mBoxShadowBigScaled + 1);
    if (!v19)
    {
      *(MRImageProvider **)((char *)&self->mBoxShadowBigScaled + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mBoxShadowBigScaled + 1),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"PlacesZoom",  @"water.jpg"));
      [*(id *)((char *)&self->mBoxShadowBigScaled + 1) setImageSizeScript:@"layerHeight*imageAspectRatio*.5,layerHeight*.5"];
      objc_msgSend(*(id *)((char *)&self->mBoxShadowBigScaled + 1), "setOriginalImageSize:", 1000.0, 1000.0);
      objc_msgSend( *(id *)((char *)&self->mBoxShadowBigScaled + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      uint64_t v19 = *(MRImageProvider **)((char *)&self->mBoxShadowBigScaled + 1);
    }

    [v19 prerenderForTime:a4 inContext:a5 withArguments:a3];
  }

  if ((unint64_t)[a4 vram] <= 0xF423FFF && self->super.mPixelSize.width * 1.8 > 1536.0)
  {
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image12"),  "setImageSizeScript:",  @"1536,1536");
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image13"),  "setImageSizeScript:",  @"1536,1536");
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image14"),  "setImageSizeScript:",  @"1536,1536");
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image15"),  "setImageSizeScript:",  @"1536,1536");
  }

  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v8 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"pinInformation");
  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"transitionDuration"),  "doubleValue");
  double v10 = v9;
  NSRange v11 = NSRangeFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"pinRange"));
  NSRange v12 = NSRangeFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"lastPinRange"));
  NSRange v13 = NSRangeFromString((NSString *)-[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"nextPinRange"));
  [a4 localAspectRatio];
  BOOL v31 = v14 > 1.51;
  float v15 = 35.0;
  if (!v31) {
    float v15 = 28.0;
  }
  float v618 = v15;
  id v554 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v579 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  *(float *)&double v16 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v653, 0.0, 0.0, 0.0);
  objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "imageAspectRatio", v16);
  double v18 = v17;
  [a4 localAspectRatio];
  float v20 = v19;
  id v21 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"extraPinLocations");
  v611 = v21;
  if (v21) {
    id v22 = (char *)[v21 count];
  }
  else {
    id v22 = 0LL;
  }
  id v23 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"lastExtraPinLocations");
  id v24 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"nextExtraPinLocations");
  id v573 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"flippedBoxes");
  id v25 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"lastFlippedBoxes");
  id v26 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"nextFlippedBoxes");
  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"startTime"),  "doubleValue");
  double v28 = v27;
  unsigned int v582 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"skipPopIn"),  "BOOLValue");
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (mPhaseInDuration + mMainDuration < a3) {
      double v28 = v28 + mMainDuration + -0.00001;
    }
    else {
      double v28 = v28 + a3 - mPhaseInDuration;
    }
  }

  double v553 = v28;
  BOOL v31 = v28 >= (double)(uint64_t)&v22[v11.length] * 0.3 + 0.25 + 0.5 || v28 < 0.25;
  double v552 = a3;
  v606 = self;
  id obj = v8;
  double v590 = v18;
  float v593 = v20;
  if (!v31)
  {
    __int128 v639 = 0u;
    __int128 v640 = 0u;
    __int128 v637 = 0u;
    __int128 v638 = 0u;
    id v47 = *(NSMutableArray **)((char *)&self->mTextYOffsets + 1);
    id v48 = [v47 countByEnumeratingWithState:&v637 objects:v649 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v638;
      double v51 = v28 + -0.25;
      double v52 = 0.0;
      do
      {
        for (i = 0LL; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v638 != v50) {
            objc_enumerationMutation(v47);
          }
          id v54 = (char *)objc_msgSend( objc_msgSend( *(id *)(*((void *)&v637 + 1) + 8 * (void)i),  "objectForKey:",  @"index"),  "integerValue");
          BOOL v56 = (unint64_t)v54 >= v11.location && (unint64_t)&v54[-v11.location] < v11.length;
          unsigned int v57 = [v611 containsIndex:v54];
          if (v56 || v57)
          {
            double v58 = v52 * 0.3;
            double v59 = 0.0;
            if (v51 >= v52 * 0.3)
            {
              if (v51 < v58 + 0.5)
              {
                float v60 = (v51 - v58 + v51 - v58 + -0.5) * 3.14159265;
                double v59 = (sinf(v60) + 1.0) * 0.5;
              }

              else
              {
                double v59 = 1.0;
              }
            }

            __int128 v61 = +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  v59 * 0.0949999988,  v59 * 0.0949999988);
            if (v56) {
              __int128 v62 = v554;
            }
            else {
              __int128 v62 = v579;
            }
            [v62 addObject:v61];
            double v52 = v52 + 1.0;
          }
        }

        id v49 = [v47 countByEnumeratingWithState:&v637 objects:v649 count:16];
      }

      while (v49);
    }

    goto LABEL_57;
  }

  if (a3 < 0.4 && v11.location)
  {
    float v32 = (a3 / 0.4 + -0.5) * 3.14159265;
    double v33 = (sinf(v32) + 1.0) * 0.5;
    if ((uint64_t)v11.length >= 1)
    {
      NSUInteger location = v11.location;
      NSUInteger length = v11.length;
      do
      {
        unsigned int v36 = [v573 containsIndex:location];
        unsigned int v37 = [v25 containsIndex:location];
        else {
          double v38 = 0.0949999988;
        }
        objc_msgSend( v554,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v38, v38));
        ++location;
        --length;
      }

      while (length);
    }

    if ((uint64_t)v22 >= 1)
    {
      uint64_t v39 = 0LL;
      double v40 = v33 * 0.0949999988;
      while (1)
      {
        id v41 = (char *)[v611 indexAtIndex:v39];
        unsigned int v42 = [v573 containsIndex:v41];
        unsigned int v43 = [v25 containsIndex:v41];
        unsigned __int8 v44 = [v23 containsIndex:v41];
        double v45 = v40;
        double v46 = v40;
        if ((v44 & 1) != 0)
        {
          if (v42 != v43) {
            goto LABEL_32;
          }
        }

        else
        {
          double v45 = v40;
          double v46 = v40;
          double v45 = v40;
          double v46 = v40;
          if (((v42 ^ v43) & 1) != 0) {
            goto LABEL_32;
          }
        }

        double v45 = 0.0949999988;
        double v46 = 0.0949999988;
LABEL_32:
        objc_msgSend( v579,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v45, v46));
      }
    }

    goto LABEL_57;
  }

  id v83 = [v8 count];
  double v84 = self->super.mPhaseInDuration;
  if ((id)(v11.location + v11.length) == v83
    || (double v85 = v84 + self->super.mMainDuration + self->super.mPhaseOutDuration + -0.4, v85 > a3))
  {
    if (v84 + 0.25 <= a3)
    {
      if ((uint64_t)v11.length >= 1)
      {
        NSUInteger v108 = v11.length;
        do
        {
          objc_msgSend( v554,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 0.0949999988, 0.0949999988));
          --v108;
        }

        while (v108);
      }

      if ((uint64_t)v22 >= 1)
      {
        do
        {
          objc_msgSend( v579,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 0.0949999988, 0.0949999988));
          --v22;
        }

        while (v22);
      }
    }

    else
    {
      if ((uint64_t)v11.length >= 1)
      {
        double height = CGSizeZero.height;
        NSUInteger v87 = v11.length;
        do
        {
          objc_msgSend( v554,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, height));
          --v87;
        }

        while (v87);
      }

      if ((uint64_t)v22 >= 1)
      {
        double v88 = CGSizeZero.height;
        do
        {
          objc_msgSend( v579,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, v88));
          --v22;
        }

        while (v22);
      }
    }

    goto LABEL_57;
  }

  float v136 = ((a3 - v85) / 0.4 + -0.5) * 3.14159265;
  double v137 = (sinf(v136) + 1.0) * 0.5;
  if ((uint64_t)v11.length >= 1)
  {
    NSUInteger v138 = v11.location;
    NSUInteger v139 = v11.length;
    do
    {
      unsigned int v140 = [v573 containsIndex:v138];
      unsigned int v141 = [v26 containsIndex:v138];
      else {
        double v142 = 0.0949999988;
      }
      objc_msgSend( v554,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v142, v142));
      ++v138;
      --v139;
    }

    while (v139);
  }

  if ((uint64_t)v22 >= 1)
  {
    for (j = 0LL; v22 != j; ++j)
    {
      v144 = (char *)[v611 indexAtIndex:j];
      unsigned int v145 = [v573 containsIndex:v144];
      unsigned int v146 = [v26 containsIndex:v144];
      unsigned __int8 v147 = [v24 containsIndex:v144];
      double v148 = (1.0 - v137) * 0.0949999988;
      double v149 = v148;
      if ((v147 & 1) != 0)
      {
        if (v145 != v146) {
          goto LABEL_155;
        }
      }

      else
      {
        double v148 = (1.0 - v137) * 0.0949999988;
        double v149 = v148;
        double v148 = (1.0 - v137) * 0.0949999988;
        double v149 = v148;
        if (((v145 ^ v146) & 1) != 0) {
          goto LABEL_155;
        }
      }

      double v148 = 0.0949999988;
      double v149 = 0.0949999988;
LABEL_155:
      objc_msgSend( v579,  "addObject:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v148, v149));
    }
  }

- (void)_drawArrowInContext:(id)a3 atTime:(double)a4 withArguments:(id)a5 atPoint:(CGPoint)a6 scale:(double)a7 withTextAtIndex:(int64_t)a8 t:(CGPoint)a9 pointDown:(BOOL)a10 m:(float)a11[16]
{
  BOOL v12 = a10;
  double x = a9.x;
  double y = a6.y;
  double v18 = a6.x;
  if ((unint64_t)objc_msgSend( *(id *)((char *)&self->mWaterProvider + 1),  "count",  a4,  a6.x,  a6.y,  a7,  a9.x,  a9.y) <= a8) {
    return;
  }
  id v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"text%d", a8);
  unsigned int v119 = -[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  v22);
  id v23 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v24 = (MRCroppingSprite *)[v23 objectForKey:v22];
  if (!v24)
  {
    id v24 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v23 setObject:v24 forKey:v22];
  }

  id v25 = (NSNull *)[*(id *)((char *)&self->mWaterProvider + 1) objectAtIndex:a8];
  if (v25 != +[NSNull null](&OBJC_CLASS___NSNull, "null"))
  {
    float v118 = v24;
    v106 = v25;
    -[NSNull relativeSizeInContextPixelSize:]( v25,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    double v114 = v26;
    BOOL v76 = v27 < 0.800000012;
    double v113 = v27;
    double v28 = 0.75 / v27 * a7;
    if (v76) {
      double v29 = a7;
    }
    else {
      double v29 = v28;
    }
    BOOL v30 = x - v18 > 1.3 || v18 < -1.0;
    BOOL v31 = (char *)objc_msgSend( objc_msgSend(*(id *)((char *)&self->mTextImages + 1), "objectAtIndex:", a8),  "integerValue");
    double v115 = v31;
    double v32 = dbl_1FA060[v31 == (_BYTE *)&dword_0 + 1];
    double v33 = &OBJC_IVAR___MREffectPinMap_mTextBox2ArrowFlippedProvider;
    if (v31 == (_BYTE *)&dword_0 + 1) {
      double v34 = 1.0;
    }
    else {
      double v34 = 0.980000019;
    }
    if (v31 == (_BYTE *)&dword_0 + 1) {
      double v33 = &OBJC_IVAR___MREffectPinMap_mTextBoxArrowFlippedProvider;
    }
    id v35 = &OBJC_IVAR___MREffectPinMap_mTextBox2ArrowProvider;
    if (v31 == (_BYTE *)&dword_0 + 1)
    {
      id v35 = &OBJC_IVAR___MREffectPinMap_mTextBoxArrowProvider;
      unsigned int v36 = &OBJC_IVAR___MREffectPinMap_mTextBoxMiddleFlippedProvider;
    }

    else
    {
      unsigned int v36 = &OBJC_IVAR___MREffectPinMap_mTextBox2MiddleFlippedProvider;
    }

    unsigned int v37 = &OBJC_IVAR___MREffectPinMap_mTextBox2MiddleProvider;
    if (v31 == (_BYTE *)&dword_0 + 1) {
      unsigned int v37 = &OBJC_IVAR___MREffectPinMap_mTextBoxMiddleProvider;
    }
    double v38 = &OBJC_IVAR___MREffectPinMap_mTextBox2CapFlippedProvider;
    if (v31 == (_BYTE *)&dword_0 + 1) {
      double v38 = &OBJC_IVAR___MREffectPinMap_mTextBoxCapFlippedProvider;
    }
    uint64_t v39 = &OBJC_IVAR___MREffectPinMap_mTextBox2CapProvider;
    if (v31 == (_BYTE *)&dword_0 + 1) {
      uint64_t v39 = &OBJC_IVAR___MREffectPinMap_mTextBoxCapProvider;
    }
    if (!v30) {
      double v33 = v35;
    }
    double v110 = a11;
    double v40 = *(Class *)((char *)&self->super.super.isa + *v33);
    if (v30) {
      id v41 = v36;
    }
    else {
      id v41 = v37;
    }
    unsigned int v42 = *(Class *)((char *)&self->super.super.isa + *v41);
    if (v30) {
      unsigned int v43 = v38;
    }
    else {
      unsigned int v43 = v39;
    }
    unsigned __int8 v44 = *(Class *)((char *)&self->super.super.isa + *v43);
    id v111 = [v40 retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
    [v111 setClampMode:2];
    [v40 imageAspectRatio];
    double v46 = v32 * v45;
    [a3 localAspectRatio];
    double v107 = v34 * (v29 * (v46 / v47));
    double v108 = v34;
    double v48 = v34 * (v29 * v32);
    id v112 = [v44 retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
    [v112 setClampMode:2];
    [v44 imageAspectRatio];
    double v50 = v32 * v49;
    [a3 localAspectRatio];
    double v109 = v50 / v51;
    id v52 = [v42 retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
    [v52 setClampMode:2];
    double v116 = y;
    double v53 = y + v48 * 0.100000001;
    id v54 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    MRMatrix_Clear((uint64_t)v122);
    *(float *)&double v50 = v18;
    float v55 = v53;
    MRMatrix_Translate(v122, -*(float *)&v50, -v55, 0.0);
    int v56 = !v30;
    if (v12) {
      double v57 = 0.0149999997;
    }
    else {
      double v57 = 0.0299999993;
    }
    BOOL v58 = v12;
    if (v12) {
      int v59 = !v30;
    }
    else {
      int v59 = v30;
    }
    [v54 randomFloatInRange:11.0 :15.0];
    if (v59) {
      double v60 = -v60;
    }
    float v61 = v60;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v121, 0.0, 0.0, v61);
    MRMatrix_PostMultiply((uint64_t)v122, v121);
    float v62 = v18;
    float v63 = v53;
    *(float *)&double v64 = MRMatrix_Translate(v122, v62, v63, 0.0);
    objc_msgSend(a3, "composeModelViewMatrix:saveTo:", v122, v120, v64);
    [a3 localAspectRatio];
    double v117 = v18;
    double v66 = MRMatrix_ProjectPoint(v110, v18, v53 * v65);
    double v68 = v67 + v57 * (1.0 - v29 * v108);
    if ((v56 & 1) != 0)
    {
      double v79 = 0.00999999978;
      if (v58) {
        double v79 = 0.0299999993;
      }
      double v69 = v66 - v79 * (1.0 - v29);
      double v80 = 0.015;
      if ((v58 & v56) != 0) {
        double v80 = 0.01;
      }
      double v70 = v80 + v68;
      double v71 = -0.5;
    }

    else
    {
      double v69 = v66 + (1.0 - v29) * 0.00999999978;
      double v70 = v68 + 0.015;
      double v71 = 0.5;
    }

    double v81 = v69 + v107 * v71;
    double v82 = v113 * v29;
    if (!v119 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v111,  a3,  v81,  v70,  v107,  v48);
    }
    double v83 = v108 * (v29 * v109);
    [v111 releaseByUser];
    double v84 = -(v82 * 0.5 + v107 * 0.5);
    if (v30) {
      double v84 = v82 * 0.5 + v107 * 0.5;
    }
    double v85 = v81 + v84;
    if (!v119 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v52,  a3,  v85,  v70,  v82,  v48);
    }
    double v86 = v114 * v29;
    [v52 releaseByUser];
    if (v30) {
      double v87 = v83 * 0.5 + v82 * 0.5;
    }
    else {
      double v87 = -(v83 * 0.5 + v82 * 0.5);
    }
    if (!v119 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v112,  a3,  v85 + v87,  v70,  v83,  v48);
    }
    [v112 releaseByUser];
    double v88 = v70 - v48 * 0.5 + v48 * 0.09 + v86 * 0.5 + -(v86 - v48 * 0.606) * 0.5;
    objc_msgSend(objc_msgSend(*(id *)((char *)&self->mTextLineCounts + 1), "objectAtIndex:", a8), "floatValue");
    if (v115 == (_BYTE *)&dword_0 + 2 && (double v90 = (float)(v89 + v89) / self->super.mPixelSize.height, v90 > 0.0500000007))
    {
      double v91 = v90 * -0.5;
      [a3 localAspectRatio];
      double v88 = v88 + v91 / v92;
    }

    else if (v115 != (_BYTE *)&dword_0 + 2)
    {
      [a3 localAspectRatio];
      double v96 = v117;
      if (v104 > 1.7)
      {
        [a3 localAspectRatio];
        double v88 = v88 + v105 * 0.00175;
      }

      goto LABEL_75;
    }

    [a3 localAspectRatio];
    double v94 = dbl_1FA070[v93 > 1.7];
    [a3 localAspectRatio];
    double v88 = v88 + v94 * v95;
    double v96 = v117;
LABEL_75:
    if (!v119 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v106,  a3,  v85,  v88,  v82,  v86);
    }
    [a3 localAspectRatio];
    double v98 = MRMatrix_ProjectPoint(v110, v96, v116 * v97);
    double v101 = -0.2;
    if (v58) {
      double v101 = 0.2;
    }
    double v102 = v101 + v99;
    double v103 = -0.435;
    if (v30) {
      double v103 = 0.435;
    }
    LODWORD(v100) = 0;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v118,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a3,  v103 + v98,  v102,  0.7,  0.5,  v100);
    [a3 restoreModelViewMatrix:v120];
    return;
  }

  [a3 localAspectRatio];
  double v73 = MRMatrix_ProjectPoint(a11, v18, y * v72);
  double v75 = -0.2;
  if (v12) {
    double v75 = 0.2;
  }
  BOOL v76 = x - v73 > 1.3 || v73 < -1.0;
  double v77 = -0.435;
  HIDWORD(v78) = 1071372042;
  if (v76) {
    double v77 = 0.435;
  }
  LODWORD(v78) = 0;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v24,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a3,  v73 + v77,  v75 + v74,  0.7,  0.5,  v78);
}

- (void)_drawTitleInContext:(id)a3 atTime:(double)a4 withArguments:(id)a5 atPoint:(CGPoint)a6 scale:(double)a7 withTextAtIndex:(int64_t)a8
{
  double y = a6.y;
  double x = a6.x;
  if ((unint64_t)[*(id *)((char *)&self->mWaterProvider + 1) count] > a8)
  {
    double v16 = (NSNull *)[*(id *)((char *)&self->mWaterProvider + 1) objectAtIndex:a8];
    double v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"text%d", a8);
    unsigned int v18 = -[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  v17);
    float v19 = *(void **)(&self->super._isInInteractiveMode + 1);
    float v20 = (MRCroppingSprite *)[v19 objectForKey:v17];
    if (!v20)
    {
      float v20 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v19 setObject:v20 forKey:v17];
    }

    if (v16 == +[NSNull null](&OBJC_CLASS___NSNull, "null"))
    {
      double v44 = 1.2;
      double v46 = 0.2;
    }

    else
    {
      double v48 = y;
      [a3 localAspectRatio];
      double v23 = dbl_1FA080[v22 < 1.4] * a7;
      -[NSNull relativeSizeInContextPixelSize:]( v16,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      double v47 = v24;
      double v26 = v25 * (v23 / 1.5);
      [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) imageAspectRatio];
      double v28 = v27 * 0.200000003;
      [a3 localAspectRatio];
      double v30 = v23 * (v28 / v29);
      double v31 = v23 * 0.200000003;
      [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) imageAspectRatio];
      double v33 = v32 * 0.200000003;
      [a3 localAspectRatio];
      double v35 = v23 * (v33 / v34);
      id v36 = [*(id *)((char *)&self->mTitleBoxLeftProvider + 1) retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
      [v36 setClampMode:2];
      double v37 = x + (v26 + v30 + v35) * 0.5 - v30 * 0.5;
      id v38 = [*(id *)((char *)&self->mTitleBoxMiddleProvider + 1) retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
      [v38 setClampMode:2];
      if (!v18 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v38,  a3,  v37,  v48,  v30,  v31);
      }
      [v38 releaseByUser];
      double v39 = v37 - (v26 * 0.5 + v30 * 0.5);
      if (!v18 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v36,  a3,  v39,  v48,  v26,  v31);
      }
      double v40 = v47 * (v23 / 1.5);
      [v36 releaseByUser];
      id v41 = [*(id *)((char *)&self->mTextBox2CapFlippedProvider + 1) retainedByUserRenderedImageAtTime:a3 inContext:a5 withArguments:a4];
      [v41 setClampMode:2];
      if (!v18 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v41,  a3,  v39 - (v35 * 0.5 + v26 * 0.5),  v48,  v35,  v31);
      }
      [v41 releaseByUser];
      double x = x + v23 * -0.01;
      double v42 = v48 - v31 * 0.5 + v31 * 0.075 + v40 * 0.5 + -(v40 - v31 * 0.78) * 0.5 + v23 * -0.005;
      if (!v18 || !-[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing")) {
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v16,  a3,  x,  v42,  v26,  v40);
      }
      double y = v42 + v40 * 0.5;
      -[NSNull relativeSizeInContextPixelSize:]( v16,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      double v44 = v43;
      double v46 = v45;
    }

    LODWORD(v21) = 0;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v20,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a3,  x,  y,  v44,  v46,  v21);
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  MRMatrix_Invert((float *)((char *)&self->mSprites + 1), v26);
  MRMatrix_PreMultiply(a4, (uint64_t)v26);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  double v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    NSRange v13 = 0LL;
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
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", v26, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            NSRange v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (id)-1)
          {
            NSRange v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectPinMap *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  *(float *)&double v8 = MRMatrix_MultiplyWithMatrix((float *)((char *)&self->mSprites + 1), a4, v11);
  id v9 = objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", a5, v8);
  if (v9) {
    LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:v11];
  }
  return (char)v9;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  unsigned int v4 = [a3 isEqualToString:@"text0"];
  double v5 = 0.699999988;
  double v6 = 0.5;
  if (!v4)
  {
    double v5 = 0.5;
    double v6 = 0.15;
  }

  double v7 = self->super.mPixelSize.width * v5;
  double v8 = self->super.mPixelSize.height * v6;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  else {
    return 2LL;
  }
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image12"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  id v11 = v10;
  if (v10) {
    id v12 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v10 insertingInCollection],  @"image");
  }
  else {
    id v12 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  -[NSMutableArray addObject:](v9, "addObject:", v12);
  [v11 releaseByUser];
  id v13 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image13"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  uint64_t v14 = v13;
  if (v13) {
    float v15 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v13 insertingInCollection],  @"image");
  }
  else {
    float v15 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  -[NSMutableArray addObject:](v9, "addObject:", v15);
  [v14 releaseByUser];
  id v16 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image14"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  id v17 = v16;
  if (v16) {
    BOOL v18 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v16 insertingInCollection],  @"image");
  }
  else {
    BOOL v18 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  -[NSMutableArray addObject:](v9, "addObject:", v18);
  [v17 releaseByUser];
  id v19 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image15"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  CGPoint v20 = v19;
  if (v19) {
    __int128 v21 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v19 insertingInCollection],  @"image");
  }
  else {
    __int128 v21 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  -[NSMutableArray addObject:](v9, "addObject:", v21);
  [v20 releaseByUser];
  if (self->super.mPhaseInDuration + self->super.mMainDuration <= a3)
  {
    id v22 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image16"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    __int128 v23 = v22;
    if (v22) {
      __int128 v24 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v22 insertingInCollection],  @"image");
    }
    else {
      __int128 v24 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
    }
    -[NSMutableArray addObject:](v9, "addObject:", v24);
    [v23 releaseByUser];
    id v25 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image17"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    double v26 = v25;
    if (v25) {
      double v27 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v25 insertingInCollection],  @"image");
    }
    else {
      double v27 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
    }
    -[NSMutableArray addObject:](v9, "addObject:", v27);
    [v26 releaseByUser];
    id v28 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image18"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    float v29 = v28;
    if (v28) {
      double v30 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v28 insertingInCollection],  @"image");
    }
    else {
      double v30 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
    }
    -[NSMutableArray addObject:](v9, "addObject:", v30);
    [v29 releaseByUser];
    id v31 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image19"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    double v32 = v31;
    if (v31) {
      double v33 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [v31 insertingInCollection],  @"image");
    }
    else {
      double v33 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
    }
    -[NSMutableArray addObject:](v9, "addObject:", v33);
    [v32 releaseByUser];
  }

  else
  {
    -[NSMutableArray addObject:](v9, "addObject:", +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[NSMutableArray addObject:](v9, "addObject:", +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[NSMutableArray addObject:](v9, "addObject:", +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[NSMutableArray addObject:](v9, "addObject:", +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }

  -[NSMutableArray addObject:](v9, "addObject:", self->super.mFlattenedAttributes);
  -[NSMutableArray addObject:](v9, "addObject:", *(NSMutableArray **)((char *)&self->mTextYOffsets + 1));
  -[NSMutableArray addObject:]( v9,  "addObject:",  -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"));
  return v9;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  double v6 = *(MRImageProvider **)((char *)&self->mWaterProvider + 1);
  id v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(NSNull **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if (v11 != +[NSNull null](&OBJC_CLASS___NSNull, "null")) {
          -[NSNull removingFromCollection](v11, "removingFromCollection");
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v8);
  }

  *(MRImageProvider **)((char *)&self->mWaterProvider + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mTextImages + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mTextLineCounts + 1) = 0LL;
  BYTE2(self->mSortedPins) = 0;
  BYTE3(self->mSortedPins) = 0;
  id v33 = -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID");
  uint64_t v35 = -[NSDictionary count]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "count");
  if (v35 >= 1)
  {
    *(MRImageProvider **)((char *)&self->mWaterProvider + 1) = (MRImageProvider *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(NSMutableArray **)((char *)&self->mTextImages + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v12 = 0LL;
    *(NSMutableArray **)((char *)&self->mTextLineCounts + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    do
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
      uint64_t v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"text%d", v12);
      p_mPixelSize = &self->super.mPixelSize;
      if (v12) {
        uint64_t v16 = 2LL;
      }
      else {
        uint64_t v16 = 1LL;
      }
      -[MRTextRenderer setResolution:](v13, "setResolution:", p_mPixelSize->width, self->super.mPixelSize.height);
      -[MRTextRenderer setTruncate:](v13, "setTruncate:", 1LL);
      -[MRTextRenderer setMaxNumberOfLines:](v13, "setMaxNumberOfLines:", v16);
      if (v12)
      {
        objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "lineSpacingFactorForTextInEffectID:presetID:atIndex:",  self->super.mEffectID,  v33,  v12);
        -[MRTextRenderer setLineSpacingFactor:](v13, "setLineSpacingFactor:");
        double v17 = 0.5;
        double width = p_mPixelSize->width * 0.5;
      }

      else
      {
        double width = p_mPixelSize->width;
        double v17 = 0.15;
      }

      -[MRTextRenderer setDefinedSize:](v13, "setDefinedSize:", width, self->super.mPixelSize.height * v17);
      -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
      +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
      -[MRTextRenderer setScale:](v13, "setScale:");
      -[MRTextRenderer setText:]( v13,  "setText:",  -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs"),  "objectForKey:",  v14));
      -[MRTextRenderer trimWhitespace](v13, "trimWhitespace");
      id v19 = -[MRTextRenderer numberOfLines](v13, "numberOfLines");
      CGPoint v20 = v19;
      __int128 v21 = (char *)&self->mSortedPins + 2;
      -[MRTextRenderer tightFrameOfLineAtIndex:](v13, "tightFrameOfLineAtIndex:", v19 - 1);
      *(float *)&double v23 = v22;
      objc_msgSend( *(id *)((char *)&self->mTextLineCounts + 1),  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
      objc_msgSend( *(id *)((char *)&self->mTextImages + 1),  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
      __int128 v24 = -[MRTextRenderer retainedContext](v13, "retainedContext");
      if (v24)
      {
        id v25 = v24;
        id v26 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v24);
        [v26 setLabel:@"Marimba PinMap Text"];
        objc_msgSend( *(id *)((char *)&self->mWaterProvider + 1),  "addObject:",  objc_msgSend(v26, "insertingInCollection"));
        [v26 releaseByUser];
        CGContextRelease(v25);
      }

      else
      {
        objc_msgSend( *(id *)((char *)&self->mWaterProvider + 1),  "addObject:",  +[NSNull null](NSNull, "null"));
      }

      ++v12;
    }

    while (v35 != v12);
  }

  if (!*(NSMutableArray **)((char *)&self->mTextYOffsets + 1))
  {
    id v27 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"pinInformation");
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v28 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = 0LL;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend( *(id *)(*((void *)&v36 + 1) + 8 * (void)j),  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)j + v30),  @"index");
        }

        id v29 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
        v30 += (uint64_t)j;
      }

      while (v29);
    }

    *(NSMutableArray **)((char *)&self->mTextYOffsets + 1) = (NSMutableArray *) [v27 sortedArrayUsingFunction:pinFrontToBackSort context:0];
  }

- (void)_unload
{
}

@end