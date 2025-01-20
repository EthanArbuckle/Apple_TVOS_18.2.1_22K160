@interface MREffectReflections
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectReflections *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectReflections)initWithEffectID:(id)a3;
- (double)_tXForTime:(double)a3 layout:(id)a4;
- (double)_yOffsetForTime:(double)a3 layout:(id)a4 size:(CGSize)a5 position:(CGPoint)a6 aspectRatio:(double)a7;
- (double)_yRotationForTime:(double)a3 layout:(id)a4;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (void)_applySizeScripts:(double)a3;
- (void)_cleanup;
- (void)_unload;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)endMorphing;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderKey:(id)a3 size:(CGSize)a4 position:(CGPoint)a5 yRot:(double)a6 tX:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10 flipped:(BOOL)a11 shadow:(BOOL)a12;
- (void)renderStuffAtTime:(double)a3 alpha:(double)a4 inContext:(id)a5 withArguments:(id)a6;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectReflections

+ (void)initialize
{
  v49.receiver = a1;
  v49.super_class = (Class)&OBJC_METACLASS___MREffectReflections;
  objc_msgSendSuper2(&v49, "initialize");
  if (!qword_2B0678)
  {
    v2 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "resourcePathForStyleID:",  @"Reflections"),  "stringByAppendingPathComponent:",  @"MREffectReflections.plist"));
    if (v2) {
      id v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  2LL,  0LL,  0LL);
    }
    else {
      id v3 = 0LL;
    }
    v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v38 = [v3 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v38)
    {
      uint64_t v35 = *(void *)v46;
      v36 = v3;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v3);
          }
          uint64_t v39 = *(void *)(*((void *)&v45 + 1) + 8 * v4);
          uint64_t v40 = v4;
          id v5 = [v3 objectForKey:v35];
          id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v7 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v42;
            do
            {
              v10 = 0LL;
              do
              {
                if (*(void *)v42 != v9) {
                  objc_enumerationMutation(v5);
                }
                v11 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v10);
                v12 = objc_alloc_init(&OBJC_CLASS___MRReflectionsLayout);
                v12->rect = CGRectFromString((NSString *)[v11 objectForKey:@"rect"]);
                v12->slideIndex = (int64_t)objc_msgSend( objc_msgSend(v11, "objectForKey:", @"slideIndex"),  "integerValue");
                v12->flipped = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"flipped"),  "BOOLValue");
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"totalHeight"), "floatValue");
                if (v13 == 0.0) {
                  double v14 = 1.60000002;
                }
                else {
                  double v14 = v13;
                }
                v12->totalHeight = v14;
                v12->borderOffset = CGPointFromString((NSString *)[v11 objectForKey:@"borderOffset"]);
                CGPoint v15 = CGPointFromString((NSString *)[v11 objectForKey:@"border"]);
                v12->border.x = v15.x * 0.00499999989;
                v12->border.y = v15.y * 0.00499999989;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pInYRot"), "floatValue");
                v12->pInYRot = v16;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pInYTilt"), "floatValue");
                v12->pInYTilt = v17;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pInSpeedYRight"), "floatValue");
                v12->pInSpeedYRight = v18;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pInSpeedYLeft"), "floatValue");
                v12->pInSpeedYLeft = v19;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutYRot"), "floatValue");
                v12->pOutYRot = v20;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutYTilt"), "floatValue");
                v12->pOutYTilt = v21;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutYNoTilt"), "floatValue");
                v12->pOutYNoTilt = v22;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutSpeedrYRight"), "floatValue");
                v12->pOutSpeedrYRight = v23;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutSpeedrYLeft"), "floatValue");
                v12->pOutSpeedrYLeft = v24;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutTxTilt"), "floatValue");
                v12->pOutTxTilt = v25;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutTxNoTilt"), "floatValue");
                v12->pOutTxNoTilt = v26;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutYFactor"), "floatValue");
                if (v27 == 0.0) {
                  double v28 = 1.0;
                }
                else {
                  double v28 = v27;
                }
                v12->pOutYFactor = v28;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutSpeedYRight"), "floatValue");
                v12->pOutSpeedYRight = v29;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutSpeedYLeft"), "floatValue");
                v12->pOutSpeedYLeft = v30;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutTxFactorRight"), "floatValue");
                if (v31 == 0.0) {
                  double v32 = 1.0;
                }
                else {
                  double v32 = v31;
                }
                v12->pOutTxFactorRight = v32;
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pOutTxFactorLeft"), "floatValue");
                if (v33 == 0.0) {
                  double v34 = 1.0;
                }
                else {
                  double v34 = v33;
                }
                v12->pOutTxFactorLeft = v34;
                v12->isBreak = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"break"),  "BOOLValue");
                [v6 addObject:v12];

                v10 = (char *)v10 + 1;
              }

              while (v8 != v10);
              id v8 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }

            while (v8);
          }

          -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v6, v39);
          uint64_t v4 = v40 + 1;
          id v3 = v36;
        }

        while ((id)(v40 + 1) != v38);
        id v38 = [v36 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }

      while (v38);
    }

    qword_2B0678 = (uint64_t)v37;
  }

- (MREffectReflections)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectReflections;
  id v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3[194] = 0;
    *(void *)(v3 + 289) = 0LL;
    *(void *)(v3 + 297) = 0LL;
    v3[217] = 0;
    *(void *)(v3 + 265) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 265),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowMiddle.png"));
    [*(id *)(v3 + 265) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 265), "setOriginalImageSize:", 200.0, 800.0);
    *(void *)(v3 + 273) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 273),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowCapLeft.png"));
    [*(id *)(v3 + 273) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 273), "setOriginalImageSize:", 200.0, 800.0);
    *(void *)(v3 + 281) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v3 + 281),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  @"ReflectionsBackground",  @"groundShadowCapRight.png"));
    [*(id *)(v3 + 281) setImageSizeScript:@"layerWidth*imageAspectRatio,layerHeight*.1"];
    objc_msgSend(*(id *)(v3 + 281), "setOriginalImageSize:", 200.0, 800.0);
  }

  return (MREffectReflections *)v3;
}

- (void)_cleanup
{
  *(int64_t *)((char *)&self->mAspect + 1) = 0LL;
  [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGroundShadowCenterProvider + 1) = 0LL;
  [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mGroundShadowLeftProvider + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(void *)&self->mIsLoaded = 0LL;
  *(NSMutableDictionary **)((char *)&self->mLayoutInfo + 1) = 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MREffectReflections;
    -[MREffect setPixelSize:](&v7, "setPixelSize:", a3.width, a3.height);
    objc_msgSend(*(id *)((char *)&self->mAspect + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mGroundShadowCenterProvider + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mGroundShadowLeftProvider + 1), "setDefaultSize:", width, height);
    BYTE2(self->mSprites) = 0;
  }

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectReflections;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    id v6 = *(NSMutableDictionary **)((char *)&self->mLayoutInfo + 1);
    if (v6)
    {

      *(NSMutableDictionary **)((char *)&self->mLayoutInfo + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(NSMutableDictionary **)((char *)&self->mLayoutInfo + 1) = (NSMutableDictionary *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (BOOL)isLoadedForTime:(double)a3
{
  if (objc_msgSend(*(id *)((char *)&self->mAspect + 1), "isLoaded", a3)
    && [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) isLoaded])
  {
    return [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) isLoaded];
  }

  else
  {
    return 0;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!BYTE2(self->mSprites))
  {
    id v9 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    *(int64_t *)((char *)&self->mDirection + 1) = (int64_t)objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"layout"),  "integerValue");
    v10 = *(void **)&self->mIsLoaded;
    if (v10)
    {

      *(void *)&self->mIsLoaded = 0LL;
    }

    [a4 localAspectRatio];
    if (v11 >= 1.0) {
      v12 = @"Layout%d";
    }
    else {
      v12 = @"Layout%dPortrait";
    }
    *(void *)&self->mIsLoaded =  [(id)qword_2B0678 objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", v12, *(int64_t *)((char *)&self->mDirection + 1))];
    BOOL v13 = ((unint64_t)[v9 randomInt] & 0x8000000000000001) != 1
       || *(int64_t *)((char *)&self->mDirection + 1) == 4;
    *(void *)&self->mShrink = v13;
    uint64_t v14 = *(int64_t *)((char *)&self->mDirection + 1);
    if (v14 == 5 || v14 == 3)
    {
      [a4 localAspectRatio];
      if (v15 < 3.0) {
        *(void *)&self->mShrink = 1LL;
      }
    }

    [v9 randomFloatInRange:0.0 :5.0];
    uint64_t v16 = *(int64_t *)((char *)&self->mDirection + 1);
    BOOL v20 = (v17 >= 3.0 || v16 == 2) && v16 != 4;
    *(int64_t *)((char *)&self->mTilt + 1) = v20;
    *(int64_t *)((char *)&self->mPhaseOutType + 1) = ((unint64_t)[v9 randomInt] & 0x8000000000000001) != 1;
    BYTE1(self->mSprites) = ((unint64_t)[v9 randomInt] & 0x8000000000000001) == 1;
    [a4 localAspectRatio];
    -[MREffectReflections _applySizeScripts:](self, "_applySizeScripts:", v21);
    BYTE2(self->mSprites) = 1;
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MREffectReflections;
  -[MREffect prerenderForTime:inContext:withArguments:](&v35, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  [*(id *)((char *)&self->mAspect + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGroundShadowCenterProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  [*(id *)((char *)&self->mGroundShadowLeftProvider + 1) prerenderForTime:a4 inContext:a5 withArguments:a3];
  if (!-[MRLayer isActivated](self->super.mEffectLayer, "isActivated")) {
    return 1;
  }
  id v22 = [a5 preloadQueue];
  if ([v22 operationCount]
    && (__int128 v33 = 0u,
        __int128 v34 = 0u,
        __int128 v31 = 0u,
        __int128 v32 = 0u,
        id v23 = [v22 operations],
        (id v24 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16]) != 0))
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
LABEL_28:
    uint64_t v27 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v26) {
        objc_enumerationMutation(v23);
      }
      if ([*(id *)(*((void *)&v31 + 1) + 8 * v27) queuePriority] == &dword_8) {
        break;
      }
      if (v25 == (id)++v27)
      {
        id v25 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v25) {
          goto LABEL_28;
        }
        goto LABEL_34;
      }
    }
  }

  else
  {
LABEL_34:
    [a5 unalteredTime];
    if (v28 >= 1.0)
    {
      BOOL v29 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration + -1.5 <= a3
         || a3 < 1.0;
      if (-[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended") != v29) {
        goto LABEL_41;
      }
      return 1;
    }
  }

  if (-[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended"))
  {
    BOOL v29 = 0LL;
LABEL_41:
    -[MRLayerEffect suspendAsynchronousOperations:](self->super.mEffectLayer, "suspendAsynchronousOperations:", v29);
  }

  return 1;
}

- (void)_applySizeScripts:(double)a3
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  objc_super v5 = *(void **)&self->mIsLoaded;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v25;
    uint64_t v23 = 0x3FE5555560000000LL;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v12 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(*(void *)(v11 + 40)));
        BOOL v13 = v12;
        double v14 = *(double *)(v11 + 24);
        if (v14 == -1.0)
        {
          if (!*(_BYTE *)(v11 + 224)
            || ([v12 imageAspectRatio], v16 = v15 < 1.0, double v14 = *(double *)&v23, !v16))
          {
            objc_msgSend(v13, "imageAspectRatio", v23);
            double v14 = fmin(v17, 1.77777779);
          }
        }

        if (a3 < 1.0
          && ((uint64_t v18 = *(int64_t *)((char *)&self->mDirection + 1), v18 != 13) ? (v19 = v18 == 0) : (v19 = 1), v19))
        {
          double v20 = 1.60000002 / v14 * a3;
          double v21 = 1.60000002;
        }

        else
        {
          double v21 = *(double *)(v11 + 64) * 0.00499999989 + *(double *)(v11 + 56) / a3 * v14;
          double v20 = *(double *)(v11 + 72) * 0.00499999989 * a3 + *(double *)(v11 + 32) * 1.60000002;
        }

        BOOL v22 = a3 > 1.0;
        if (v21 <= 1.89999998) {
          BOOL v22 = 0;
        }
        v8 |= v22;
        objc_msgSend(v13, "setImageSizeScript:", 0, v23);
        objc_msgSend( v13,  "setDefaultSize:",  v21 * 0.5 * self->super.mPixelSize.width,  v20 * 0.5 * self->super.mPixelSize.height);
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v7);
  }

  else
  {
    char v8 = 0;
  }

  BYTE1(self->mBreakInformation) = 0;
  BYTE2(self->mBreakInformation) = v8 & 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = 0LL;
  *(MRReflectionsRenderable **)((char *)&self->mHead + 1) = 0LL;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v10 = 1.0;
  double v11 = 1.0;
  if (mPhaseInDuration > a3)
  {
    float v12 = (a3 / mPhaseInDuration + -0.5) * 3.14159274;
    double v11 = (float)((float)(sinf(v12) + 1.0) * 0.5);
  }

  double v84 = v11;
  if (BYTE1(self->mBreakInformation)) {
    double v10 = self->super.mDefaultMainDuration / self->super.mMainDuration * -0.5 + 1.0;
  }
  [a4 localAspectRatio];
  BOOL v14 = v13 < 1.0;
  float v15 = 0.3;
  if (!v14) {
    float v15 = 0.5;
  }
  double v16 = v15;
  double v17 = 0.779999971 - v15;
  double v18 = self->super.mPhaseInDuration;
  if (v18 <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (v18 + mMainDuration <= a3)
    {
      double v22 = (a3 - v18 - mMainDuration) / self->super.mPhaseOutDuration;
      if (v22 >= 0.5)
      {
        double v24 = v22 * 1.5 + -0.25;
      }

      else
      {
        float v23 = (v22 + -0.5) * 3.14159274;
        double v24 = (float)((float)(sinf(v23) + 1.0) * 0.5);
      }

      double v25 = v24 * 0.779999971 + 0.819999993;
      else {
        double v20 = 0.819999993;
      }
    }

    else
    {
      double v20 = v17 + v16 * v10 + (a3 - v18) / mMainDuration * (0.819999993 - (v17 + v16 * v10));
    }
  }

  else
  {
    float v19 = (a3 / v18 + -0.5) * 3.14159274;
    double v20 = v17 * (float)((float)(sinf(v19) + 1.0) * 0.5) + v16 * v10;
  }

  uint64_t v26 = *(int64_t *)((char *)&self->mDirection + 1);
  if (v26 == 13 || v26 == 0)
  {
    id v28 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    [v28 aspectRatio];
    double v30 = v29;
    [v28 releaseByUser];
    double v86 = v30;
    if (v30 < 1.0) {
      *(int64_t *)((char *)&self->mTilt + 1) = 0LL;
    }
  }

  else
  {
    double v86 = 0.0;
  }

  double v31 = self->super.mPhaseInDuration;
  double v32 = v20 + 0.199999988;
  double v33 = self->super.mMainDuration;
  double v34 = v31 + v33;
  double v82 = v31 + v33;
  if (v31 + v33 <= a3)
  {
    if (!*(int64_t *)((char *)&self->mTilt + 1))
    {
      double v35 = (a3 - v31 - v33) / self->super.mPhaseOutDuration;
      if (v35 >= 0.5)
      {
        double v37 = v35 * 1.5 + -0.25;
      }

      else
      {
        float v36 = (v35 + -0.5) * 3.14159274;
        double v37 = (float)((float)(sinf(v36) + 1.0) * 0.5);
      }

      double v38 = v37 * 1.5;
      double v39 = fmin(v38 + v38, 2.0);
      if (!BYTE1(self->mSprites)) {
        double v39 = -v39;
      }
      float v40 = v39;
      float v41 = fmin(v38 * 5.0, 5.0);
      *(float *)&double v42 = MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v92, v40, -v41, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v92, v93, v42);
    }

    unint64_t v43 = *(int64_t *)((char *)&self->mDirection + 1);
    double v31 = 1.0;
    double v33 = v86;
    if (v86 < 1.0)
    {
      if (v43 > 0xD || ((1LL << v43) & 0x2011) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }

    if (v43 == 4) {
LABEL_35:
    }
      double v32 = 1.01999998;
  }

- (double)_yRotationForTime:(double)a3 layout:(id)a4
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (mPhaseInDuration + mMainDuration <= a3
      && ((double v13 = (a3 - mPhaseInDuration - mMainDuration) / self->super.mPhaseOutDuration, v13 >= 0.5)
        ? (double v15 = v13 * 1.5 + -0.25)
        : (float v14 = (v13 + -0.5) * 3.14159274, v15 = (float)((float)(sinf(v14) + 1.0) * 0.5)),
          *(int64_t *)((char *)&self->mTilt + 1) == 1))
    {
      uint64_t v16 = 136LL;
      if (!*(void *)&self->mShrink) {
        uint64_t v16 = 144LL;
      }
      double v17 = v15 * *((double *)a4 + 16) * *(double *)((char *)a4 + v16) + -360.0;
      uint64_t v18 = 152LL;
      if (!BYTE1(self->mSprites)) {
        uint64_t v18 = 160LL;
      }
      return v17 + v15 * *(double *)((char *)a4 + v18);
    }

    else
    {
      return 0.0;
    }
  }

  else
  {
    float v7 = (1.0 - a3 / mPhaseInDuration + -0.5) * 3.14159274;
    double v8 = (float)((float)(sinf(v7) + 1.0) * 0.5);
    double v9 = *((double *)a4 + 13);
    if (!*(void *)&self->mShrink) {
      double v9 = -v9;
    }
    uint64_t v10 = 112LL;
    if (!BYTE1(self->mSprites)) {
      uint64_t v10 = 120LL;
    }
    return *(double *)((char *)a4 + v10) * v8 + *((double *)a4 + 12) * v8 * v9;
  }

- (double)_tXForTime:(double)a3 layout:(id)a4
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double mMainDuration = self->super.mMainDuration;
  double v6 = 0.0;
  if (mPhaseInDuration + mMainDuration <= a3 && *(int64_t *)((char *)&self->mTilt + 1) == 1)
  {
    double v9 = (a3 - mPhaseInDuration - mMainDuration) / self->super.mPhaseOutDuration;
    if (v9 >= 0.5)
    {
      double v11 = v9 * 1.5 + -0.25;
    }

    else
    {
      float v10 = (v9 + -0.5) * 3.14159274;
      double v11 = (float)((float)(sinf(v10) + 1.0) * 0.5);
    }

    uint64_t v12 = 208LL;
    double v13 = v11 * *(double *)((char *)a4 + v12);
    uint64_t v14 = 168LL;
    if (!*(void *)&self->mShrink) {
      uint64_t v14 = 176LL;
    }
    return v13 * *(double *)((char *)a4 + v14);
  }

  return v6;
}

- (double)_yOffsetForTime:(double)a3 layout:(id)a4 size:(CGSize)a5 position:(CGPoint)a6 aspectRatio:(double)a7
{
  double y = a6.y;
  double height = a5.height;
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double mMainDuration = self->super.mMainDuration;
  if (mPhaseInDuration + mMainDuration <= a3 && !*(int64_t *)((char *)&self->mTilt + 1))
  {
    double v14 = (a3 - mPhaseInDuration - mMainDuration) / self->super.mPhaseOutDuration;
    if (v14 >= 0.5)
    {
      double v16 = v14 * 1.5 + -0.25;
    }

    else
    {
      float v15 = (v14 + -0.5) * 3.14159274;
      double v16 = (float)((float)(sinf(v15) + 1.0) * 0.5);
    }

    uint64_t v17 = 192LL;
    if (!BYTE1(self->mSprites)) {
      uint64_t v17 = 200LL;
    }
    double v18 = y
    double v19 = v16 * 0.0500000007 + 1.0;
    if (a7 >= 1.0) {
      double v19 = 1.0;
    }
    return v19 * v18;
  }

  return y;
}

- (void)renderKey:(id)a3 size:(CGSize)a4 position:(CGPoint)a5 yRot:(double)a6 tX:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10 flipped:(BOOL)a11 shadow:(BOOL)a12
{
  BOOL v12 = a12;
  BOOL v13 = a11;
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  id v24 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
  if (!v24) {
    return;
  }
  double v25 = v24;
  [v24 setUsesBackgroundColorAsBorderColor:1];
  uint64_t v26 = *(void **)(&self->super._isInInteractiveMode + 1);
  __int128 v27 = (MRCroppingSprite *)[v26 objectForKey:a3];
  if (!v27)
  {
    __int128 v27 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v26 setObject:v27 forKey:a3];

    if (!v27)
    {
      [v25 releaseByUser];
      return;
    }
  }

  -[MRCroppingSprite setInnerRect:]( v27,  "setInnerRect:",  2.0 / (width * self->super.mPixelSize.width * 0.25),  2.0 / (height * self->super.mPixelSize.height * 0.25),  1.0 - 4.0 / (width * self->super.mPixelSize.width * 0.25),  1.0 - 4.0 / (height * self->super.mPixelSize.height * 0.25));
  objc_msgSend(a9, "localAspectRatio", MRMatrix_Clear((uint64_t)v68));
  if (v28 >= 1.0)
  {
    double v30 = -(width * 0.5);
    if (x <= 0.0) {
      double v30 = width * 0.5;
    }
    float v31 = v30;
    MRMatrix_Translate(v68, v31, 0.0, 0.0);
    float v32 = a6;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v67, v32, 0.0, 0.0);
    MRMatrix_PostMultiply((uint64_t)v68, v67);
    a7 = a7 - v31;
  }

  else
  {
    float v29 = a6;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v68, v29, 0.0, 0.0);
  }

  float v33 = a7;
  *(float *)&double v34 = MRMatrix_Translate(v68, v33, 0.0, 0.0);
  objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v68, v66, v34);
  [a9 localAspectRatio];
  float v36 = v35;
  [v25 aspectRatio];
  double v38 = v37;
  if (v37 < 0.5 || v37 > 2.0)
  {
    double v39 = width / height * v36;
    if ((v37 >= 1.0 || v39 <= 1.0) && (v37 <= 1.0 || v39 >= 1.0))
    {
      double v40 = v37 >= 1.0 ? v37 / v39 : v39 / v37;
      if (v40 >= 1.1)
      {
        [v25 centerX];
        double v64 = v44;
        [v25 centerY];
        double v65 = v45;
        if (objc_msgSend( objc_msgSend( objc_msgSend(*(id *)((char *)&self->mLayoutInfo + 1), "objectForKey:", a3),  "objectForKey:",  @"panEndDirection"),  "integerValue") == (id)-1) {
          double v46 = -1.0;
        }
        else {
          double v46 = 1.0;
        }
        double mPhaseInDuration = self->super.mPhaseInDuration;
        double mMainDuration = self->super.mMainDuration;
        double mPhaseOutDuration = self->super.mPhaseOutDuration;
        double v50 = mPhaseInDuration + mMainDuration + mPhaseOutDuration;
        if (v38 > 2.0)
        {
          double v51 = 1.0 - v39 / v38;
          double v52 = mPhaseInDuration + 0.5;
          if (v52 > a8)
          {
            double v53 = -(v51 * v46);
LABEL_38:
            double v54 = v65;
LABEL_45:
            if (self->super._panoramaPanningOffsets)
            {
              if (v38 <= 2.0) {
                double v60 = v54;
              }
              else {
                double v60 = v53;
              }
              -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  a3,  v60,  -v51,  *(void *)&v63);
              if (v38 > 2.0) {
                double v53 = v61;
              }
              else {
                double v54 = v61;
              }
            }

            objc_msgSend(v25, "setCenterX:", v53, *(void *)&v63);
            [v25 setCenterY:v54];
            double v62 = v38 / v39;
            if (v38 / v39 < 1.0) {
              double v62 = 1.0;
            }
            [v25 setScale:v62];
            uint64_t v41 = 1LL;
            goto LABEL_21;
          }

          if (v50 - mPhaseOutDuration + -0.5 < a8)
          {
            double v53 = v46 * v51;
            goto LABEL_38;
          }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  float v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    BOOL v13 = 0LL;
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
            BOOL v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            BOOL v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectReflections *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)renderStuffAtTime:(double)a3 alpha:(double)a4 inContext:(id)a5 withArguments:(id)a6
{
  uint64_t v11 = *(uint64_t *)((char *)&self->mGroundShadowRightProvider + 1);
  if (v11)
  {
    double v107 = a3;
    id v108 = a6;
    double v109 = a4;
    if (a4 >= 1.0)
    {
      int v21 = *(unsigned __int8 *)(v11 + 145);
      unsigned int v22 = [a5 foreColorIsOpaqueWhite];
      __int128 v23 = @"PlainTextureHigh";
      if (v22)
      {
        __int128 v23 = @"PlainTextureHighNoColor";
        __int128 v24 = @"PlainTextureNoColor";
      }

      else
      {
        __int128 v24 = @"PlainTexture";
      }

      if (v21) {
        double v25 = v23;
      }
      else {
        double v25 = v24;
      }
      [a5 setShader:v25];
    }

    else
    {
      [a5 setShader:@"FadeToColor"];
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 1.0;
      LODWORD(v14) = 1.0;
      LODWORD(v15) = 1.0;
      [a5 composeForeColorRed:v115 green:v12 blue:v13 alpha:v14 saveTo:v15];
      LODWORD(v16) = *(_DWORD *)"33s?";
      LODWORD(v17) = 1.0;
      LODWORD(v18) = *(_DWORD *)"33s?";
      LODWORD(v19) = *(_DWORD *)"33s?";
      [a5 setShaderUniformVec4:@"color" :v16 :v18 :v19 forKey:v17];
      double v20 = 1.0 - a4;
      *(float *)&double v20 = 1.0 - a4;
      [a5 setShaderUniformFloat:@"level" forKey:v20];
    }

    double v26 = -1000.0;
    double v27 = 1000.0;
    do
    {
      [a5 setModelViewMatrix:v11 + 32 saveTo:0];
      float v28 = *(void **)(v11 + 24);
      [v28 setNeedsInSpriteCoordinates:0];
      LODWORD(v29) = 0;
      objc_msgSend( v28,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  *(void *)(v11 + 16),  a5,  *(double *)(v11 + 96),  *(double *)(v11 + 104),  *(double *)(v11 + 112),  *(double *)(v11 + 120),  v29);
      double v30 = *(double *)(v11 + 104);
      double v31 = *(double *)(v11 + 120);
      if (v27 >= v30 - v31 * 0.5) {
        double v27 = v30 - v31 * 0.5;
      }
      double v32 = v30 + v31 * 0.5;
      if (v26 < v32) {
        double v26 = v32;
      }
      uint64_t v11 = *(void *)(v11 + 136);
    }

    while (v11);
    if (v109 >= 1.0)
    {
      objc_msgSend(a5, "unsetShader", v109);
      [a5 setShader:@"FadeToColor"];
      LODWORD(v33) = *(_DWORD *)"33s?";
      LODWORD(v34) = 1.0;
      LODWORD(v35) = *(_DWORD *)"33s?";
      LODWORD(v36) = *(_DWORD *)"33s?";
      [a5 setShaderUniformVec4:@"color" :v33 :v35 :v36 forKey:v34];
    }

    double v110 = v26 - v27;
    double v37 = v109 * -0.300000012 + 1.0;
    *(float *)&double v37 = v37;
    [a5 setShaderUniformFloat:@"level" forKey:v37];
    uint64_t v38 = *(uint64_t *)((char *)&self->mGroundShadowRightProvider + 1);
    char v39 = 0;
    if (v38)
    {
      double v40 = 0.5;
      do
      {
        if (*(_BYTE *)(v38 + 144))
        {
          MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v114, 180.0, 0.0, 180.0);
          double v41 = 2.0 / self->super.mPixelSize.height;
          [a5 localAspectRatio];
          float v43 = v41 - v110 / v42;
          MRMatrix_Translate(v114, 0.0, v43, 0.0);
          MRMatrix_MultiplyWithMatrix(v114, (float *)(v38 + 32), v113);
          double v44 = *(double *)(v38 + 96);
          double v45 = *(double *)(v38 + 104);
          double v46 = *(double *)(v38 + 112);
          double v47 = *(double *)(v38 + 120);
          float v48 = v46 * 0.5;
          double v40 = 0.5;
          [a5 localAspectRatio];
          float v50 = v47 * 0.5 / v49;
          MRMatrix_MultiplyWithMatrix(v113, (float *)[a5 projectionMatrix], v112);
          double v51 = v48;
          double v52 = v50;
          MRMatrix_ProjectPoint(v112, v44 - v48, v45 - v52);
          double v54 = v53;
          MRMatrix_ProjectPoint(v112, v44 + v51, v45 + v52);
          if ((v54 > 1.5 || v54 < -1.5) && (v55 > 1.5 || v55 < -1.5)) {
            goto LABEL_32;
          }
          [a5 setModelViewMatrix:v113 saveTo:0];
          LODWORD(v58) = 0;
          objc_msgSend( *(id *)(v38 + 24),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  *(void *)(v38 + 16),  a5,  v44,  v45,  v46,  v47,  v58);
        }

        v39 |= *(double *)(v38 + 112) * v40 * self->super.mPixelSize.width > 512.0;
LABEL_32:
        uint64_t v38 = *(void *)(v38 + 136);
      }

      while (v38);
    }

    [a5 unsetShader];
    [a5 blend:2];
    double v62 = 1.0;
    if (v109 < 1.0) {
      [a5 restoreForeColor:v115];
    }
    *(float *)&double v61 = v109;
    LODWORD(v62) = 1.0;
    LODWORD(v59) = 1.0;
    LODWORD(v60) = 1.0;
    [a5 composeForeColorRed:v115 green:v62 blue:v59 alpha:v60 saveTo:v61];
    if ((v39 & 1) != 0) {
      double v63 = @"SoftspritePremultipliedHigh";
    }
    else {
      double v63 = @"SoftspritePremultiplied";
    }
    [a5 setShader:v63];
    uint64_t v64 = *(uint64_t *)((char *)&self->mGroundShadowRightProvider + 1);
    double v65 = &OBJC_IVAR___MPFilter__internal;
    if (v64)
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      while (1)
      {
        [a5 setModelViewMatrix:v64 + 32 saveTo:0];
        double v70 = *(double *)(v64 + 112);
        double v69 = *(double *)(v64 + 120);
        if (v70 != width || v69 != height)
        {
          double v72 = v70 * self->super.mPixelSize.width * 0.25;
          *(float *)&double v72 = v72;
          double v73 = v69 * self->super.mPixelSize.height * 0.25;
          *(float *)&double v73 = v73;
          [a5 setShaderUniformVec2:@"invRadii" :v72 forKey:v73];
          double v70 = *(double *)(v64 + 112);
        }

        double v74 = *(double *)(v64 + 120);
        double v75 = *(double *)(v64 + 96);
        double v76 = *(double *)(v64 + 104);
        float v77 = *(void **)(v64 + 24);
        [v77 setNeedsInSpriteCoordinates:1];
        LODWORD(v78) = 0;
        objc_msgSend( v77,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  *(void *)(v64 + 16),  a5,  v75,  v76,  v70,  v74,  v78);
        if (!*(_BYTE *)(v64 + 144)) {
          goto LABEL_61;
        }
        MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v114, 180.0, 0.0, 180.0);
        double v79 = 2.0 / self->super.mPixelSize.height;
        [a5 localAspectRatio];
        float v81 = v79 - v110 / v80;
        *(float *)&double v82 = MRMatrix_Translate(v114, 0.0, v81, 0.0);
        objc_msgSend(a5, "composeModelViewMatrix:saveTo:", v114, 0, v82);
        float v83 = v70 * 0.5;
        [a5 localAspectRatio];
        float v85 = v74 * 0.5 / v84;
        MRMatrix_MultiplyWithMatrix( (float *)[a5 modelViewMatrix],  (float *)objc_msgSend(a5, "projectionMatrix"),  v113);
        double v86 = v83;
        double v87 = v76 - v85;
        MRMatrix_ProjectPoint(v113, v75 - v83, v87);
        double v89 = v88;
        MRMatrix_ProjectPoint(v113, v75 + v86, v87);
        double v93 = -1.5;
        if (v89 <= 1.5 && v89 >= -1.5) {
          break;
        }
        double v93 = -1.5;
        if (v90 <= 1.5 && v90 >= -1.5) {
          break;
        }
        double width = *(double *)(v64 + 112);
        double height = *(double *)(v64 + 120);
        double v65 = &OBJC_IVAR___MPFilter__internal;
LABEL_62:
        uint64_t v64 = *(void *)(v64 + v65[997]);
        if (!v64) {
          goto LABEL_63;
        }
      }

      LODWORD(v93) = 1.0;
      LODWORD(v90) = 1.0;
      LODWORD(v91) = 1.0;
      float v68 = v109 * 0.300000012;
      *(float *)&double v92 = v68;
      [a5 composeForeColorRed:v112 green:v93 blue:v90 alpha:v91 saveTo:v92];
      LODWORD(v96) = 0;
      objc_msgSend( v77,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  *(void *)(v64 + 16),  a5,  *(double *)(v64 + 96),  *(double *)(v64 + 104),  *(double *)(v64 + 112),  *(double *)(v64 + 120),  v96);
      [a5 restoreForeColor:v112];
      double v65 = &OBJC_IVAR___MPFilter__internal;
LABEL_61:
      double width = *(double *)(v64 + 112);
      double height = *(double *)(v64 + 120);
      goto LABEL_62;
    }

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  BYTE2(self->mSprites) = 0;
}

- (void)endMorphing
{
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  *a4 = 0.25 / self->super.mMainDuration;
  *a3 = self->super.mMainDuration;
  *a5 = self->super.mPhaseOutDuration;
}

- (void)_unload
{
  *(MRImageProvider **)((char *)&self->mGroundShadowRightProvider + 1) = 0LL;
  *(MRReflectionsRenderable **)((char *)&self->mHead + 1) = 0LL;
  BYTE2(self->mSprites) = 0;
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];

  *(void *)&self->mIsLoaded = 0LL;
  *(NSMutableDictionary **)((char *)&self->mLayoutInfo + 1) = 0LL;
}

@end