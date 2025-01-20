@interface MREffectCoverCascade
+ (BOOL)hasCustomTiming;
+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDynamicExpansion;
- (double)_buildNumberOfSlideStories:(unint64_t)a3 withSlideRange:(_NSRange)a4;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (int64_t)typicalSlideBatchSize;
- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3;
- (void)_applyTimingToSlideProviders;
- (void)_cleanup;
- (void)_unload;
- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setMultiImageSlideRange:(_NSRange)a3;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
@end

@implementation MREffectCoverCascade

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  v11 = -[MREffect initWithEffectID:](objc_alloc(&OBJC_CLASS___MREffectCoverCascade), "initWithEffectID:", a3);
  -[MREffect setAttributes:](v11, "setAttributes:", a4);
  id v12 = [a5 count];
  id v13 = [a1 typicalSlideBatchSizeForEffectID:a3];
  if (v12 <= v13) {
    id v12 = v13;
  }
  -[MREffectCoverCascade _buildNumberOfSlideStories:withSlideRange:]( v11,  "_buildNumberOfSlideStories:withSlideRange:",  v12,  0,  [a5 count]);
  -[MREffectCoverCascade setPhaseInDuration:mainDuration:phaseOutDuration:]( v11,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v11->super.mDefaultPhaseInDuration,  v11->super.mDefaultMainDuration,  v11->super.mDefaultPhaseOutDuration);
  -[MREffectCoverCascade setMultiImageSlideRange:](v11, "setMultiImageSlideRange:", 0, [a5 count]);
  return v11;
}

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  -[MREffect _computeTimeForPhaseTime:]( self,  "_computeTimeForPhaseTime:",  *((double *)[*(id *)(&self->super._isInInteractiveMode + 1) objectAtIndex:a3 - self->super.mMultiImageSlideRange.location]
    + 1));
  return result;
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  v4 = (double *)[*(id *)(&self->super._isInInteractiveMode + 1) objectAtIndex:a3 - self->super.mMultiImageSlideRange.location];
  -[MREffect _computeTimeForPhaseTime:](self, "_computeTimeForPhaseTime:", v4[3] + v4[4] - v4[1]);
  return result;
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  v4 = (double *)[*(id *)(&self->super._isInInteractiveMode + 1) objectAtIndex:a3 - self->super.mMultiImageSlideRange.location];
  -[MREffect _computeTimeForPhaseTime:](self, "_computeTimeForPhaseTime:", (v4[1] + v4[2] + v4[3]) * 0.5);
  return result;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lowestDisplayTime
{
  return 0.0;
}

- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4
{
  id v6 = [a3 count];
  unint64_t v7 = -[MREffectCoverCascade typicalSlideBatchSize](self, "typicalSlideBatchSize");
  NSUInteger v8 = self->super.mMultiImageSlideRange.length + self->super.mMultiImageSlideRange.location;
  id v9 = [a3 count];
  -[MREffectCoverCascade _buildNumberOfSlideStories:withSlideRange:]( self,  "_buildNumberOfSlideStories:withSlideRange:",  v6,  v8,  v9);
  -[MREffectCoverCascade setPhaseInDuration:mainDuration:phaseOutDuration:]( self,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->super.mDefaultPhaseInDuration,  self->super.mDefaultMainDuration,  self->super.mDefaultPhaseOutDuration);
  self->super.mMultiImageSlideRange.location = v8;
  self->super.mMultiImageSlideRange.length = (NSUInteger)v9;
}

- (void)_applyTimingToSlideProviders
{
  mEffectLayer = self->super.mEffectLayer;
  if (mEffectLayer)
  {
    v4 = -[MRLayerEffect slideProvidersForElementIDs](mEffectLayer, "slideProvidersForElementIDs");
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    v5 = -[NSDictionary objectEnumerator](v4, "objectEnumerator");
    id v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          [v10 setShowTime:1.0e10];
          [v10 setShowDuration:-2.0e10];
        }

        id v7 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      }

      while (v7);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v11 = *(void **)(&self->super._isInInteractiveMode + 1);
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)j);
          id v17 = -[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(v16 + 48));
          if (v17)
          {
            v18 = v17;
            [v17 showTime];
            double v20 = v19;
            [v18 showDuration];
            double v22 = v21;
            double v23 = 0.0;
            if (*(_BYTE *)(v16 + 66) != 8)
            {
              -[MREffect _computeTimeForPhaseTime:](self, "_computeTimeForPhaseTime:", *(double *)(v16 + 8));
              double v23 = v24;
            }

            -[MREffect _computeTimeForPhaseTime:]( self,  "_computeTimeForPhaseTime:",  *(double *)(v16 + 24) + *(double *)(v16 + 32) - *(double *)(v16 + 8));
            double v26 = v25;
            if (v23 < v20) {
              [v18 setShowTime:v23];
            }
            if (v23 + v26 >= v20 + v22) {
              double v27 = v23 + v26;
            }
            else {
              double v27 = v20 + v22;
            }
            [v18 showTime];
            [v18 setShowDuration:v27 - v28];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v13);
    }
  }

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectCoverCascade;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v6,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
  -[MREffectCoverCascade _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
}

- (double)_buildNumberOfSlideStories:(unint64_t)a3 withSlideRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_super v6 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v7 = &OBJC_IVAR___MPFilter__internal;
  if (v6)
  {
    id v78 = +[MURandom randomGeneratorWithSeed:]( MURandom,  "randomGeneratorWithSeed:",  (char *)[v6 count]
    double mDefaultMainDuration = self->super.mDefaultMainDuration;
  }

  else
  {
    BYTE3(self->_previousStartTime) = 0;
    id v78 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(NSUInteger *)((char *)&self->_previousNewSlideRange.length + 1) = 0LL;
    BYTE2(self->_previousStartTime) = -1;
    BYTE1(self->_previousStartTime) = -1;
    double mDefaultMainDuration = 0.0;
  }

  id v9 = self;
  if (!a3)
  {
    double v33 = mDefaultMainDuration;
    goto LABEL_103;
  }

  p_cache = (objc_class *)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
  NSUInteger v11 = location;
  v79 = self;
  do
  {
    unint64_t v87 = v11;
    int v12 = BYTE1(v9->_previousStartTime);
    if (BYTE1(v9->_previousStartTime)) {
      goto LABEL_15;
    }
    uint64_t v13 = (uint64_t)[v78 randomInt] % 20;
    uint64_t v14 = v7[682];
    if (v13 >= *((unsigned __int8 *)&v9->super.super.isa + v14))
    {
      int v12 = BYTE1(v9->_previousStartTime);
      p_cache = (objc_class *)&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
LABEL_15:
      if (v12 == 255)
      {
        char v21 = 5;
      }

      else if (a3 >= 0x1C && *((_BYTE *)&v9->super.super.isa + v7[682]) == 15)
      {
        uint64_t v23 = (uint64_t)[v78 randomInt];
        uint64_t v24 = v23 & 1;
        if (v23 < 0) {
          uint64_t v24 = -v24;
        }
        char v21 = v24 + 1;
      }

      else if (v12)
      {
        char v21 = 0;
      }

      else
      {
        unint64_t v25 = (uint64_t)[v78 randomInt] % 100;
        if (v25 < 0x5A) {
          char v26 = 3;
        }
        else {
          char v26 = 4;
        }
        if (v25 >= 0x50) {
          char v21 = v26;
        }
        else {
          char v21 = 0;
        }
      }

      if (mDefaultMainDuration <= 0.0)
      {
        char v77 = 0;
        LOBYTE(v19) = 0;
      }

      else
      {
        char v27 = v21;
        int v19 = (int)[v78 randomInt] % 7;
        p_cache = (objc_class *)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
        uint64_t v28 = (uint64_t)[v78 randomInt];
        char v21 = v27;
        char v77 = 0;
        double mDefaultMainDuration = mDefaultMainDuration + ((double)(v28 % 4000) * 0.001 + 1.0) * 0.7;
      }

      goto LABEL_33;
    }

    v15 = v9;
    if (0xAAAAAAAAAAAAAAABLL * (unint64_t)[v78 randomInt] + 0x2AAAAAAAAAAAAAAALL <= 0x5555555555555554)
    {
      unsigned int v16 = BYTE2(v9->_previousStartTime);
      if (v16 != 3 && !BYTE4(v15->_previousStartTime))
      {
        uint64_t v72 = (uint64_t)[v78 randomInt];
        uint64_t v73 = v72 & 1;
        if (v72 < 0) {
          uint64_t v73 = -v73;
        }
        if (v16 >= 3) {
          LOBYTE(v19) = v73 + 1;
        }
        else {
          LOBYTE(v19) = v73 + 4;
        }
        [v78 randomFloatInRange:*(double *)((char *)&v15->_numberOfStoriesRemoved + 1) + 0.1 :*(double *)((char *)&v15->_numberOfStoriesRemoved + 1) + 1.0];
        __int128 v29 = v78;
        double mDefaultMainDuration = v74;
        char v77 = 1;
        id v9 = v15;
LABEL_35:
        id Scenario0 = GenerateScenario0(0LL, v29, *((unsigned __int8 *)&v9->super.super.isa + v14));
        char v76 = 0;
        p_cache = (objc_class *)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
        goto LABEL_43;
      }
    }

    uint64_t v17 = (uint64_t)[v78 randomInt];
    uint64_t v18 = v17 & 1;
    if (v17 < 0) {
      uint64_t v18 = -v18;
    }
    LOBYTE(v19) = BYTE2(v15->_previousStartTime);
    char v20 = v18 + 3;
    [v78 randomFloatInRange:*(double *)((char *)&v15->_numberOfStoriesRemoved + 1) + 1.0 :*(double *)((char *)&v15->_numberOfStoriesRemoved + 1) + 1.5];
    char v21 = v20;
    double mDefaultMainDuration = v22;
    char v77 = 1;
    id v9 = v15;
    p_cache = (objc_class *)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
LABEL_33:
    switch(v21)
    {
      case 0:
        uint64_t v14 = v7[682];
        __int128 v29 = v78;
        goto LABEL_35;
      case 1:
        id Scenario0 = GenerateScenario1(v78);
        LOBYTE(v19) = 0;
        char v31 = 1;
        goto LABEL_42;
      case 2:
        id Scenario0 = GenerateScenario2(v78);
        LOBYTE(v19) = 0;
        char v31 = 2;
        goto LABEL_42;
      case 3:
        id Scenario0 = GenerateScenario3(0LL, v78);
        char v31 = 3;
        goto LABEL_42;
      case 4:
        id Scenario0 = GenerateScenario4(0LL, v78);
        char v31 = 4;
        goto LABEL_42;
      case 5:
        id Scenario0 = GenerateScenario5(v78);
        char v31 = 5;
LABEL_42:
        char v76 = v31;
        break;
      default:
        char v76 = v21;
        id Scenario0 = 0LL;
        break;
    }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MREffectCoverCascade;
  -[MREffect prerenderForTime:inContext:withArguments:](&v14, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  if (!*(void *)(&self->super._isInInteractiveMode + 1) || self->super.mNeedsToUpdateSlides)
  {
    self->super.mNeedsToUpdateSlides = 0;
    NSUInteger location = (MREffectCoverCascadeSlideStory *)self->super.mMultiImageSlideRange.location;
    NSUInteger length = self->super.mMultiImageSlideRange.length;
    if (*(void *)(&self->super._isInInteractiveMode + 1))
    {
      NSUInteger v9 = (char *)location + length - (char *)v8;
      else {
      if (location < v8)
      {
        NSUInteger location = v10;
        NSUInteger length = v9;
      }
    }

    unint64_t v11 = -[MREffectCoverCascade typicalSlideBatchSize](self, "typicalSlideBatchSize");
    if (length <= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = length;
    }
    -[MREffectCoverCascade _buildNumberOfSlideStories:withSlideRange:]( self,  "_buildNumberOfSlideStories:withSlideRange:",  v12,  location,  length);
    *(MREffectCoverCascadeSlideStory **)((char *)&self->_grid[6][3] + 1) = location;
    *(NSUInteger *)((char *)&self->_previousNewSlideRange.location + 1) = length;
  }

  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v10 = v9;
  unint64_t v11 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  char v27 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  for (uint64_t i = 0LL; i != 4; ++i)
    v40[i] = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  *(void *)&__int128 v13 = -1LL;
  *((void *)&v13 + 1) = -1LL;
  v39[5] = v13;
  v39[6] = v13;
  v39[3] = v13;
  v39[4] = v13;
  v39[1] = v13;
  v39[2] = v13;
  v39[0] = v13;
  objc_super v14 = (char *)[*(id *)(&self->super._isInInteractiveMode + 1) count];
  v15 = (void *)v40[0];
  if (v14)
  {
    unsigned int v16 = v14;
    for (j = 0LL; v16 != j; ++j)
    {
      uint64_t v18 = (double *)[*(id *)(&self->super._isInInteractiveMode + 1) objectAtIndex:j];
      int v19 = v18;
      double v20 = v18[1];
      if (v10 < v20)
      {
        if (*((_BYTE *)v18 + 66) == 8) {
          objc_msgSend( objc_msgSend( -[NSDictionary objectForKey:](v11, "objectForKey:", *((void *)v18 + 6)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3),  "releaseByUser");
        }
        continue;
      }

      double v21 = v18[3];
      if (v10 < v21 + v18[4])
      {
        if (v10 >= v20 + v18[2])
        {
          if (v10 < v21)
          {
            if (*((unsigned __int8 *)v18 + 66) <= 7u)
            {
              -[NSMutableIndexSet addIndex:](v28, "addIndex:", j);
              double v22 = (_DWORD *)&v39[*((unsigned __int8 *)v19 + 64)] + *((unsigned __int8 *)v19 + 65);
              if ((*v22 & 0x80000000) != 0) {
                *double v22 = (_DWORD)j;
              }
            }

            continue;
          }

          if (*((unsigned __int8 *)v18 + 67) >= 5u)
          {
LABEL_17:
            -[NSMutableIndexSet addIndex:](v27, "addIndex:", j);
            continue;
          }
        }

        else if (*((unsigned __int8 *)v18 + 66) > 7u)
        {
          goto LABEL_17;
        }

        [v15 addIndex:j];
        *((_DWORD *)&v39[*((unsigned __int8 *)v19 + 64)] + *((unsigned __int8 *)v19 + 65)) = (_DWORD)j;
      }
    }
  }

  id v23 = [v15 copy];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1193E8;
  v38[3] = &unk_24E6A8;
  *(double *)&v38[7] = v10;
  v38[8] = v39;
  v38[9] = v40;
  v38[4] = self;
  v38[5] = v28;
  v38[6] = v29;
  [v23 enumerateIndexesUsingBlock:v38];

  [a4 setShader:@"PlainTexture"];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_119578;
  v35[3] = &unk_24E6D0;
  v35[4] = self;
  v35[5] = v11;
  v35[6] = a4;
  v35[7] = a5;
  __int128 v36 = xmmword_1FA340;
  *(double *)&v35[8] = a3;
  double v37 = v10;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](v28, "enumerateIndexesUsingBlock:", v35);
  for (uint64_t k = 0LL; k != 4; ++k)
  {
    unint64_t v25 = (void *)v40[k];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1196E8;
    v34[3] = &unk_24E6F8;
    v34[4] = self;
    v34[5] = v11;
    v34[6] = a4;
    v34[7] = a5;
    *(double *)&v34[8] = a3;
    *(double *)&v34[9] = v10;
    [v25 enumerateIndexesUsingBlock:v34];
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_119BA4;
  v31[3] = &unk_24E6D0;
  v31[4] = self;
  v31[5] = v11;
  v31[6] = a4;
  v31[7] = a5;
  __int128 v32 = xmmword_1FA340;
  *(double *)&v31[8] = a3;
  double v33 = v10;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](v29, "enumerateIndexesUsingBlock:", v31);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_119D14;
  v30[3] = &unk_24E6F8;
  v30[4] = self;
  v30[5] = v11;
  v30[6] = a4;
  v30[7] = a5;
  *(double *)&v30[8] = a3;
  *(double *)&v30[9] = v10;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](v27, "enumerateIndexesUsingBlock:", v30);
  [a4 unsetShader];
  for (uint64_t m = 0LL; m != 4; ++m)
}

- (void)_unload
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
}

+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3
{
  return 1;
}

+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3
{
  return 56LL;
}

- (BOOL)supportsDynamicExpansion
{
  return 1;
}

- (int64_t)typicalSlideBatchSize
{
  return (int64_t)objc_msgSend( (id)objc_opt_class(self, a2),  "typicalSlideBatchSizeForEffectID:",  self->super.mEffectID);
}

- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_super v6 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = a3 + -12.0;
    do
    {
      unint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        unint64_t v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  id v13 = -[NSMutableIndexSet firstIndex](v5, "firstIndex");

  return (unint64_t)v13;
}

- (void)setMultiImageSlideRange:(_NSRange)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MREffectCoverCascade;
  -[MREffect setMultiImageSlideRange:](&v20, "setMultiImageSlideRange:", a3.location, a3.length);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v4 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        NSUInteger v11 = *(void *)(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i) + 56LL);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          ++v7;
        }

        else
        {
          NSUInteger location = self->super.mMultiImageSlideRange.location;
          BOOL v14 = v11 >= location;
          NSUInteger v13 = v11 - location;
          BOOL v14 = !v14 || v13 >= self->super.mMultiImageSlideRange.length;
          if (!v14) {
            goto LABEL_16;
          }
          uint64_t v15 = v7 + v8;
          uint64_t v7 = 0LL;
          uint64_t v8 = v15 + 1;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v6);
LABEL_16:
    if (v8)
    {
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "removeObjectsInRange:", 0, v8);
      *(NSUInteger *)((char *)&self->_previousNewSlideRange.length + 1) += v8;
    }
  }

@end