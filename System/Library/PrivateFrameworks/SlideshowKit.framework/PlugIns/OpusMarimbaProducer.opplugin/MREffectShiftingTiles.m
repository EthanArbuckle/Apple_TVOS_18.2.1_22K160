@interface MREffectShiftingTiles
+ (BOOL)hasCustomTiming;
+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3;
- (BOOL)getVerticesCoordinates:(MREffectShiftingTiles *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDynamicExpansion;
- (MREffectShiftingTiles)initWithEffectID:(id)a3;
- (double)_aspectRatioForSlideIndex:(int64_t)a3;
- (double)_calculateMainDuration;
- (double)_durationForAspectRatio:(double)a3 inLayout:(int64_t)a4 withScreenRatio:(double)a5;
- (double)_timeForIteration:(int64_t)a3;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (id)_infoForTime:(double)a3;
- (id)_layoutForIteration:(int64_t)a3;
- (id)_layoutForTime:(double)a3;
- (id)_setupFirstLayout;
- (id)_slideProviderWithAspectRatio:(BOOL)a3 nearest:(int64_t)a4 actual:(int64_t *)a5;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_displaySlideCountForLayout:(int64_t)a3;
- (int64_t)_iterationForTime:(double)a3 startTime:(double *)a4 duration:(double *)a5;
- (int64_t)_lowestDisplayIteration;
- (int64_t)_slideCountForLayout:(int64_t)a3;
- (int64_t)_widthForLayout:(int64_t)a3;
- (int64_t)typicalSlideBatchSize;
- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3;
- (void)_addSlideAspectRatios:(id)a3;
- (void)_applyTimingToSlideProviders;
- (void)_cleanup;
- (void)_setupLayoutsWithSlideInfo:(id)a3 append:(BOOL)a4 aspectRatio:(double)a5;
- (void)_unload;
- (void)_updateSizeScripts;
- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setMultiImageSlideRange:(_NSRange)a3;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
@end

@implementation MREffectShiftingTiles

- (MREffectShiftingTiles)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectShiftingTiles;
  v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3[241] = 1;
    *(void *)(v3 + 249) = 0LL;
    *(void *)(v3 + 257) = 0LL;
    *(void *)(v3 + 225) = 0LL;
    *(void *)(v3 + 233) = 0LL;
    *(void *)(v3 + 217) = 0LL;
    *(void *)(v3 + 273) = 0LL;
  }

  return (MREffectShiftingTiles *)v3;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mTiming + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mFirstLayout + 1) = 0LL;
  *(double *)((char *)&self->mAspectRatio + 1) = 0.0;
}

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  v10 = -[MREffectShiftingTiles initWithEffectID:]( objc_alloc(&OBJC_CLASS___MREffectShiftingTiles),  "initWithEffectID:",  a3);
  -[MREffect setAttributes:](v10, "setAttributes:", a4);
  -[MREffectShiftingTiles _addSlideAspectRatios:](v10, "_addSlideAspectRatios:", a5);
  -[MREffectShiftingTiles _setupLayoutsWithSlideInfo:append:aspectRatio:]( v10,  "_setupLayoutsWithSlideInfo:append:aspectRatio:",  a5,  0LL,  a7);
  -[MREffectShiftingTiles _calculateMainDuration](v10, "_calculateMainDuration");
  -[MREffectShiftingTiles setPhaseInDuration:mainDuration:phaseOutDuration:]( v10,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  0.0,  v11,  0.0);
  return v10;
}

+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3
{
  return 1;
}

+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3
{
  return 20LL;
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
  if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count")
     + *(int64_t *)((char *)&self->mLastSlideIndex + 1) <= 0x13
    && !*(void *)&self->mNeedsToRecalculateIterations)
  {
    return 0LL;
  }

  uint64_t v5 = -[MREffectShiftingTiles _iterationForTime:startTime:duration:]( self,  "_iterationForTime:startTime:duration:",  0LL,  0LL,  a3);
  int64_t v6 = 0LL;
  if (v5 >= 5)
  {
    id v7 = -[MREffectShiftingTiles _layoutForIteration:](self, "_layoutForIteration:", v5 - 5);
    NSUInteger v8 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
    uint64_t v9 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      int64_t v12 = v9 + v8;
      uint64_t v13 = *(void *)v18;
      int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v7);
          }
          int64_t v15 = *(void *)(*(void *)(*((void *)&v17 + 1) + 8LL * (void)i) + 24LL);
          if (v15 >= v12) {
            int64_t v15 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
          }
          if (v15 < v6) {
            int64_t v6 = v15;
          }
        }

        id v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v11);
    }

    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v6;
}

- (int64_t)_lowestDisplayIteration
{
  id obj = -[MREffectShiftingTiles _setupFirstLayout](self, "_setupFirstLayout");
  int64_t v4 = *(void *)&self->mNeedsToRecalculateIterations;
  else {
    uint64_t v5 = *(char **)&self->mNeedsToRecalculateIterations;
  }
  int64_t v22 = (int64_t)v5;
  if (v4 < (uint64_t)v3)
  {
    int64_t v6 = self;
    while (2)
    {
      int64_t v23 = v4;
      id v7 = [*(id *)((char *)&v6->mSprites + 1) objectAtIndex:v4 - *(void *)&v6->mNeedsToRecalculateIterations];
      uint64_t v8 = v7[5];
      [obj removeObjectsAtIndexes:v7[6]];
      int64_t v9 = v7[7];
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v10 = (void *)v7[4];
      id v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)i) integerValue];
            v16 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
            v16->layout = (int64_t)v15;
            v16->slideIndex = v9;
            [obj insertObject:v16 atIndex:(char *)i + v8];

            v9 += -[MREffectShiftingTiles _slideCountForLayout:](v6, "_slideCountForLayout:", v15);
          }

          id v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
          v8 += (uint64_t)i;
        }

        while (v12);
      }

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v17 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v26;
LABEL_15:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(obj);
          }
          if (v18 == (id)++v20)
          {
            id v18 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v18) {
              goto LABEL_15;
            }
            return v23;
          }
        }

        int64_t v4 = v23 + 1;
        if (v23 + 1 != v22) {
          continue;
        }
      }

      else
      {
        return v23;
      }

      break;
    }
  }

  return v22;
}

- (void)setMultiImageSlideRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MREffectShiftingTiles;
  -[MREffect setMultiImageSlideRange:](&v15, "setMultiImageSlideRange:", a3.location, a3.length);
  uint64_t v5 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
  *(int64_t *)((char *)&self->mLastSlideIndex + 1) = location;
  if (location) {
    BYTE2(self->mSlideStartIndex) = 1;
  }
  if (!self->super.mEffectLayer && BYTE2(self->mSlideStartIndex))
  {
    uint64_t v6 = -[MREffectShiftingTiles _lowestDisplayIteration](self, "_lowestDisplayIteration");
    if (v6 >= 3)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)&self->mNeedsToRecalculateIterations;
      uint64_t v9 = v6 - 1;
      if (v8 != v6 - 1)
      {
        double v10 = (double)v5;
        id v11 = -[MREffectShiftingTiles _layoutForIteration:](self, "_layoutForIteration:", v9);
        id v12 = *(NSMutableArray **)((char *)&self->mTiming + 1);
        if (v12)
        {

          *(NSMutableArray **)((char *)&self->mTiming + 1) = 0LL;
        }

        *(NSMutableArray **)((char *)&self->mTiming + 1) = (NSMutableArray *)[v11 mutableCopy];
        -[MREffectShiftingTiles _timeForIteration:](self, "_timeForIteration:", v9);
        *(int64_t *)((char *)&self->mIterationStartIndex + 1) = v13;
        *(void *)&self->mNeedsToRecalculateIterations = v9;
        v14 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  *(void *)&self->mNeedsToRecalculateIterations - v8);
        [*(id *)((char *)&self->mSprites + 1) removeObjectsAtIndexes:v14];

        objc_msgSend( *(id *)((char *)&self->mAspectRatio + 1),  "removeObjectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  0,  (unint64_t)((double)*(uint64_t *)((char *)&self->mLastSlideIndex + 1) - v10)));
      }
    }

    BYTE2(self->mSlideStartIndex) = 0;
  }

- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4
{
}

- (void)_addSlideAspectRatios:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend( *(id *)((char *)&self->mAspectRatio + 1),  "addObject:",  objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "objectForKey:", @"aspectRatio"));
      }

      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectShiftingTiles;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v6,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
  -[MREffectShiftingTiles _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
}

- (void)_applyTimingToSlideProviders
{
  if (self->super.mEffectLayer)
  {
    double height = self->super.mPixelSize.height;
    if (height > 0.0)
    {
      *(double *)((char *)&self->mIterationStartTime + 1) = self->super.mPixelSize.width / height;
      -[MREffectShiftingTiles _setupLayoutsWithSlideInfo:append:aspectRatio:]( self,  "_setupLayoutsWithSlideInfo:append:aspectRatio:",  0LL,  0LL);
      v86 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      int64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v85 = (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count")
          + *(int64_t *)((char *)&self->mLastSlideIndex + 1);
      id v5 = -[MREffectShiftingTiles _setupFirstLayout](self, "_setupFirstLayout");
      v84 = self;
      uint64_t v6 = *(void *)&self->mNeedsToRecalculateIterations;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      id obj = v5;
      id v7 = [v5 countByEnumeratingWithState:&v107 objects:v116 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v108;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v108 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v107 + 1) + 8LL * (void)i);
            uint64_t v12 = *(void *)(v11 + 24);
            int64_t v13 = -[MREffectShiftingTiles _slideCountForLayout:](v84, "_slideCountForLayout:", *(void *)(v11 + 8));
            if (v13 >= 1)
            {
              int64_t v14 = v13;
              uint64_t v15 = 0LL;
              do
              {
                v16 = ImageKey(v12 + v15);
                if (!-[NSMutableDictionary objectForKey:](v86, "objectForKey:", v16)) {
                  -[NSMutableDictionary setObject:forKey:]( v86,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6),  v16);
                }
                else {
                  ++v15;
                }
                --v14;
              }

              while (v14);
            }
          }

          id v8 = [obj countByEnumeratingWithState:&v107 objects:v116 count:16];
        }

        while (v8);
      }

      if (v6 >= (uint64_t)v70)
      {
        id v17 = v84;
        uint64_t v18 = (uint64_t)v85;
      }

      else
      {
        id v17 = v84;
        uint64_t v18 = (uint64_t)v85;
        do
        {
          uint64_t v19 = [*(id *)((char *)&v17->mSprites + 1) objectAtIndex:v6 - *(void *)&v17->mNeedsToRecalculateIterations];
          uint64_t v82 = v19[5];
          v72 = v19;
          uint64_t v71 = v19[6];
          id v20 = objc_msgSend(obj, "objectsAtIndexes:");
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          id v74 = v20;
          id v80 = [v20 countByEnumeratingWithState:&v103 objects:v115 count:16];
          if (v80)
          {
            uint64_t v76 = *(void *)v104;
            do
            {
              for (j = 0LL; j != v80; j = (char *)j + 1)
              {
                if (*(void *)v104 != v76) {
                  objc_enumerationMutation(v74);
                }
                uint64_t v22 = *(void *)(*((void *)&v103 + 1) + 8LL * (void)j);
                uint64_t v23 = *(void *)(v22 + 24);
                if (v23 >= v18) {
                  uint64_t v23 = v23 % v18 + *(int64_t *)((char *)&v84->mLastSlideIndex + 1);
                }
                v24 = -[MREffectShiftingTiles _slideCountForLayout:](v84, "_slideCountForLayout:", *(void *)(v22 + 8));
                __int128 v25 = v24 - 1;
                if ((uint64_t)v24 >= 1)
                {
                  __int128 v26 = v24;
                  uint64_t v27 = 0LL;
                  for (k = 0LL; k != v26; ++k)
                  {
                    __int128 v29 = ImageKey(v23 + v27);
                    id v30 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v29);
                    if (!v30 || (uint64_t)[v30 integerValue] < v6) {
                      -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6),  v29);
                    }
                    if ((uint64_t)k < (uint64_t)v25)
                    {
                      else {
                        ++v27;
                      }
                    }
                  }
                }

                uint64_t v18 = (uint64_t)v85;
              }

              id v80 = [v74 countByEnumeratingWithState:&v103 objects:v115 count:16];
            }

            while (v80);
          }

          [obj removeObjectsAtIndexes:v71];
          uint64_t v31 = v72[7];
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          id v73 = (id)v72[4];
          id v17 = v84;
          id v77 = [v73 countByEnumeratingWithState:&v99 objects:v114 count:16];
          if (v77)
          {
            id v75 = *(id *)v100;
            do
            {
              for (m = 0LL; m != v77; m = (char *)m + 1)
              {
                if (*(id *)v100 != v75) {
                  objc_enumerationMutation(v73);
                }
                v33 = (char *)[*(id *)(*((void *)&v99 + 1) + 8 * (void)m) integerValue];
                v34 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
                v35 = (double *)v34;
                v34->layout = (int64_t)v33;
                if (v31 >= v18) {
                  uint64_t v31 = v31 % v18 + *(int64_t *)((char *)&v17->mLastSlideIndex + 1);
                }
                v34->slideIndex = v31;
                if ((unint64_t)(v33 - 5) <= 1)
                {
                  -[MREffectShiftingTiles _aspectRatioForSlideIndex:](v17, "_aspectRatioForSlideIndex:", v31);
                  *(float *)&double v36 = v36
                                 / (*(double *)((char *)&v17->mIterationStartTime + 1)
                  double v37 = floorf(*(float *)&v36);
                  if (v37 < 5.0) {
                    double v37 = 5.0;
                  }
                  v35[4] = v37;
                }

                [obj insertObject:v35 atIndex:v82];

                v38 = -[MREffectShiftingTiles _slideCountForLayout:](v17, "_slideCountForLayout:", v33);
                v39 = v38 - 1;
                if ((uint64_t)v38 >= 1)
                {
                  v40 = v38;
                  v41 = 0LL;
                  uint64_t v42 = 0LL;
                  do
                  {
                    v43 = ImageKey(v31 + v42);
                    if (!-[NSMutableDictionary objectForKey:](v86, "objectForKey:", v43)) {
                      -[NSMutableDictionary setObject:forKey:]( v86,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6),  v43);
                    }
                    if ((uint64_t)v41 < (uint64_t)v39)
                    {
                      else {
                        ++v42;
                      }
                    }

                    ++v41;
                  }

                  while (v40 != v41);
                }

                id v17 = v84;
                v31 += -[MREffectShiftingTiles _slideCountForLayout:](v84, "_slideCountForLayout:", v33);
                ++v82;
                uint64_t v18 = (uint64_t)v85;
              }

              id v77 = [v73 countByEnumeratingWithState:&v99 objects:v114 count:16];
            }

            while (v77);
          }

          ++v6;
        }

        while ((char *)v6 != v70);
        uint64_t v6 = (uint64_t)v70;
      }

      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      id v81 = [obj countByEnumeratingWithState:&v95 objects:v113 count:16];
      if (v81)
      {
        uint64_t v78 = *(void *)v96;
        do
        {
          uint64_t v44 = 0LL;
          do
          {
            if (*(void *)v96 != v78) {
              objc_enumerationMutation(obj);
            }
            uint64_t v83 = v44;
            uint64_t v45 = *(void *)(*((void *)&v95 + 1) + 8 * v44);
            uint64_t v46 = *(void *)(v45 + 24);
            if (v46 >= v18) {
              uint64_t v46 = v46 % v18 + *(int64_t *)((char *)&v17->mLastSlideIndex + 1);
            }
            v47 = -[MREffectShiftingTiles _slideCountForLayout:](v17, "_slideCountForLayout:", *(void *)(v45 + 8));
            v48 = v47 - 1;
            if ((uint64_t)v47 >= 1)
            {
              v49 = v47;
              v50 = 0LL;
              uint64_t v51 = 0LL;
              do
              {
                v52 = ImageKey(v51 + v46);
                id v53 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v52);
                if (!v53 || (uint64_t)[v53 integerValue] < v6) {
                  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6),  v52);
                }
                if ((uint64_t)v50 < (uint64_t)v48)
                {
                  else {
                    ++v51;
                  }
                }

                ++v50;
              }

              while (v49 != v50);
            }

            ++v44;
            uint64_t v18 = (uint64_t)v85;
          }

          while ((id)(v83 + 1) != v81);
          id v81 = [obj countByEnumeratingWithState:&v95 objects:v113 count:16];
        }

        while (v81);
      }

      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      id v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v86,  "countByEnumeratingWithState:objects:count:",  &v91,  v112,  16LL);
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v92;
        do
        {
          for (n = 0LL; n != v55; n = (char *)n + 1)
          {
            if (*(void *)v92 != v56) {
              objc_enumerationMutation(v86);
            }
            uint64_t v58 = *(void *)(*((void *)&v91 + 1) + 8LL * (void)n);
            id v59 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v84->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v58);
            -[MREffectShiftingTiles _timeForIteration:]( v84,  "_timeForIteration:",  objc_msgSend(-[NSMutableDictionary objectForKey:](v86, "objectForKey:", v58), "integerValue"));
            [v59 setShowTime:v60 + -2.0];
          }

          id v55 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v86,  "countByEnumeratingWithState:objects:count:",  &v91,  v112,  16LL);
        }

        while (v55);
      }

      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v61 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v87,  v111,  16LL);
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v88;
        do
        {
          for (ii = 0LL; ii != v62; ii = (char *)ii + 1)
          {
            if (*(void *)v88 != v63) {
              objc_enumerationMutation(v4);
            }
            uint64_t v65 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)ii);
            id v66 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v84->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v65);
            -[MREffectShiftingTiles _timeForIteration:]( v84,  "_timeForIteration:",  (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v65), "integerValue") + 1);
            double v68 = v67;
            [v66 showTime];
            [v66 setShowDuration:v68 - v69];
          }

          id v62 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v87,  v111,  16LL);
        }

        while (v62);
      }
    }
  }

- (void)_updateSizeScripts
{
  if (self->super.mEffectLayer)
  {
    v3 = (char *)[*(id *)((char *)&self->mSprites + 1) count];
    uint64_t v45 = *(void *)&self->mNeedsToRecalculateIterations;
    uint64_t v44 = &v3[v45];
    int64_t v4 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count")
       + *(int64_t *)((char *)&self->mLastSlideIndex + 1);
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v50 = self;
    id v6 = [*(id *)((char *)&self->mTiming + 1) mutableCopy];
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id obj = v6;
    id v7 = [v6 countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v60 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
          int64_t v12 = *(void *)(v11 + 24);
          uint64_t v13 = *(void *)(v11 + 8);
          int64_t v14 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13);
          uint64_t v15 = ImageKey(v12);
          if (!-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v15)
            || objc_msgSend(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v15), "integerValue") == (char *)&dword_0 + 2)
          {
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v15);
          }

          if (v13 == 2)
          {
            int64_t v16 = v12 + 1;
            if (v12 + 1 >= v4) {
              int64_t v16 = *(int64_t *)((char *)&v50->mLastSlideIndex + 1);
            }
            id v17 = ImageKey(v16);
            if (!-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v17)
              || objc_msgSend(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v17), "integerValue") == (char *)&dword_0 + 2)
            {
              -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v17);
            }
          }
        }

        id v8 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      }

      while (v8);
    }

    uint64_t v18 = v45;
    uint64_t v19 = v50;
    if (v45 < (uint64_t)v44)
    {
      do
      {
        uint64_t v46 = v18;
        id v20 = [*(id *)((char *)&v19->mSprites + 1) objectAtIndex:v18 - *(void *)&v19->mNeedsToRecalculateIterations];
        uint64_t v21 = v20[5];
        [obj removeObjectsAtIndexes:v20[6]];
        int64_t v22 = v20[7];
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        id v47 = (id)v20[4];
        id v48 = [v47 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v48)
        {
          uint64_t v23 = *(void *)v56;
          do
          {
            for (j = 0LL; j != v48; j = (char *)j + 1)
            {
              if (*(void *)v56 != v23) {
                objc_enumerationMutation(v47);
              }
              __int128 v25 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
              __int128 v26 = (char *)[v25 integerValue];
              uint64_t v27 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
              v27->layout = (int64_t)v26;
              v27->slideIndex = v22;
              if ((unint64_t)(v26 - 5) <= 1)
              {
                -[MREffectShiftingTiles _aspectRatioForSlideIndex:](v50, "_aspectRatioForSlideIndex:", v22);
                *(float *)&double v28 = v28
                               / (*(double *)((char *)&v50->mIterationStartTime + 1)
                double v29 = floorf(*(float *)&v28);
                if (v29 < 5.0) {
                  double v29 = 5.0;
                }
                v27->width = v29;
              }

              [obj insertObject:v27 atIndex:(char *)j + v21];

              id v30 = ImageKey(v22);
              if (!-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v30)
                || objc_msgSend(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v30), "integerValue") == (char *)&dword_0 + 2)
              {
                -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, v30);
              }

              if (v26 == (_BYTE *)&dword_0 + 2)
              {
                int64_t v31 = v22 + 1;
                if (v22 + 1 >= v4) {
                  int64_t v31 = *(int64_t *)((char *)&v50->mLastSlideIndex + 1);
                }
                __int128 v32 = ImageKey(v31);
                if (!-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v32)
                  || objc_msgSend(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v32), "integerValue") == (char *)&dword_0 + 2)
                {
                  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, v32);
                }
              }

              uint64_t v19 = v50;
              v22 += -[MREffectShiftingTiles _slideCountForLayout:](v50, "_slideCountForLayout:", v26);
              if (v22 >= v4) {
                int64_t v22 = v22 % v4 + *(int64_t *)((char *)&v50->mLastSlideIndex + 1);
              }
            }

            v21 += (uint64_t)j;
            id v48 = [v47 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }

          while (v48);
        }

        uint64_t v18 = v46 + 1;
      }

      while ((char *)(v46 + 1) != v44);
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v52;
      do
      {
        for (k = 0LL; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(v5);
          }
          uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)k);
          id v38 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v50->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v37);
          [v38 setImageSizeScript:0];
          switch((unint64_t)objc_msgSend( -[NSMutableDictionary objectForKey:](v5, "objectForKey:", v37),  "integerValue"))
          {
            case 0uLL:
              p_double height = &v50->super.mPixelSize.height;
              double v40 = v50->super.mPixelSize.width * 0.200000003;
              goto LABEL_51;
            case 1uLL:
              p_double height = &v50->super.mPixelSize.height;
              double v40 = v50->super.mPixelSize.width * 0.400000006;
LABEL_51:
              double v41 = 0.5;
              goto LABEL_53;
            case 2uLL:
              p_double height = &v50->super.mPixelSize.height;
              double v40 = v50->super.mPixelSize.width * 0.200000003;
              double v41 = 0.25;
              goto LABEL_53;
            case 6uLL:
              p_double height = &v50->super.mPixelSize.height;
              double v41 = 0.5;
              CGFloat v42 = v50->super.mPixelSize.height * 0.5;
              [v38 imageAspectRatio];
              double v40 = v42 * v43;
LABEL_53:
              objc_msgSend(v38, "setDefaultSize:", v40, *p_height * v41);
              break;
            default:
              continue;
          }
        }

        id v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
      }

      while (v34);
    }
  }

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  int64_t v4 = (char *)[*(id *)((char *)&self->mSprites + 1) count];
  uint64_t v5 = *(void *)&self->mNeedsToRecalculateIterations;
  id v6 = &v4[v5];
  id v7 = -[MREffectShiftingTiles _setupFirstLayout](self, "_setupFirstLayout");
  int64_t v22 = v6;
  if (v5 < (uint64_t)v6)
  {
    id v8 = v7;
    while (1)
    {
      uint64_t v9 = [*(id *)((char *)&self->mSprites + 1) objectAtIndex:v5 - *(void *)&self->mNeedsToRecalculateIterations];
      uint64_t v10 = v9[5];
      [v8 removeObjectsAtIndexes:v9[6]];
      unint64_t v11 = v9[7];
      if (v11 >= a3) {
        break;
      }
      uint64_t v24 = v5;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      int64_t v12 = (void *)v9[4];
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = (char *)[*(id *)(*((void *)&v25 + 1) + 8 * (void)i) integerValue];
            uint64_t v18 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
            v18->layout = (int64_t)v17;
            v18->slideIndex = v11;
            if ((unint64_t)(v17 - 5) <= 1)
            {
              -[MREffectShiftingTiles _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v11);
              *(float *)&double v19 = v19
                             / (*(double *)((char *)&self->mIterationStartTime + 1)
              double v20 = floorf(*(float *)&v19);
              if (v20 < 5.0) {
                double v20 = 5.0;
              }
              v18->width = v20;
            }

            [v8 insertObject:v18 atIndex:(char *)i + v10];

            v11 += -[MREffectShiftingTiles _slideCountForLayout:](self, "_slideCountForLayout:", v17);
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          v10 += (uint64_t)i;
        }

        while (v14);
      }

      uint64_t v5 = v24 + 1;
      if ((char *)(v24 + 1) == v22)
      {
        uint64_t v5 = (uint64_t)v22;
        break;
      }
    }
  }

  -[MREffectShiftingTiles _timeForIteration:](self, "_timeForIteration:", v5);
  return result;
}

- (double)_calculateMainDuration
{
  double v2 = *(double *)((char *)&self->mIterationStartIndex + 1) + *(double *)((char *)&self->mSlideAspectRatios + 1);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
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
        double v2 = v2 + *(double *)(*(void *)(*((void *)&v9 + 1) + 8LL * (void)i) + 72LL);
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  return v2;
}

- (id)_setupFirstLayout
{
  return [*(id *)((char *)&self->mTiming + 1) mutableCopy];
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  id v4 = (char *)[*(id *)((char *)&self->mSprites + 1) count];
  uint64_t v5 = *(void *)&self->mNeedsToRecalculateIterations;
  uint64_t v6 = &v4[v5];
  id v38 = -[MREffectShiftingTiles _setupFirstLayout](self, "_setupFirstLayout");
  uint64_t v7 = -1LL;
  if (v5 < (uint64_t)v6)
  {
    double v36 = v6;
    do
    {
      id v8 = objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "objectAtIndex:",  v5 - *(void *)&self->mNeedsToRecalculateIterations,  v36);
      uint64_t v10 = v8[5];
      uint64_t v9 = v8[6];
      id v11 = [v38 objectsAtIndexes:v9];
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
      uint64_t v13 = v5;
      if (v12)
      {
        id v14 = v12;
        uint64_t v15 = *(void *)v45;
        while (2)
        {
          int64_t v16 = 0LL;
          unint64_t v17 = a3;
          do
          {
            if (*(void *)v45 != v15)
            {
              objc_enumerationMutation(v11);
              unint64_t v17 = a3;
            }

            uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v16);
            uint64_t v19 = *(void *)(v18 + 24);
            if (v19 == v17 || ((uint64_t v20 = v19 + 1, *(void *)(v18 + 8) == 2LL) ? (v21 = v20 == v17) : (v21 = 0), v21))
            {
              uint64_t v5 = v13;
              goto LABEL_34;
            }

            int64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
          uint64_t v5 = v13;
          if (v14) {
            continue;
          }
          break;
        }
      }

      [v38 removeObjectsAtIndexes:v9];
      unint64_t v22 = v8[7];
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id obj = (id)v8[4];
      id v23 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v41;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v41 != v25) {
              objc_enumerationMutation(obj);
            }
            __int128 v27 = (char *)[*(id *)(*((void *)&v40 + 1) + 8 * (void)i) integerValue];
            __int128 v28 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
            v28->layout = (int64_t)v27;
            v28->slideIndex = v22;
            if ((unint64_t)(v27 - 5) <= 1)
            {
              float v29 = (double)-[MREffectShiftingTiles _slideCountForLayout:](self, "_slideCountForLayout:", v22)
                  / (*(double *)((char *)&self->mIterationStartTime + 1)
              double v30 = floorf(v29);
              if (v30 < 5.0) {
                double v30 = 5.0;
              }
              v28->width = v30;
            }

            [v38 insertObject:v28 atIndex:(char *)i + v10];

            v22 += -[MREffectShiftingTiles _slideCountForLayout:](self, "_slideCountForLayout:", v27);
            if (v7 == -1 && v22 >= a3) {
              uint64_t v7 = v13;
            }
          }

          uint64_t v5 = v13;
          id v24 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
          v10 += (uint64_t)i;
        }

        while (v24);
      }

      ++v5;
    }

    while ((char *)v5 != v36);
    uint64_t v5 = (uint64_t)v36;
  }

- (double)_timeForIteration:(int64_t)a3
{
  int64_t v4 = *(void *)&self->mNeedsToRecalculateIterations;
  if (v4 >= a3) {
    return *(double *)((char *)&self->mIterationStartIndex + 1);
  }
  double v6 = *(double *)((char *)&self->mSlideAspectRatios + 1) + 0.0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v7 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_4:
    id v11 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      double v6 = v6 + *(double *)(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v11) + 72LL);
      id v11 = (char *)v11 + 1;
      if (v9 == v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        v4 += (int64_t)v11;
        if (v9) {
          goto LABEL_4;
        }
        return v6 + *(double *)((char *)&self->mIterationStartIndex + 1);
      }
    }
  }

  return v6 + *(double *)((char *)&self->mIterationStartIndex + 1);
}

- (double)lowestDisplayTime
{
  uint64_t v2 = *(int64_t *)((char *)&self->mLastCol + 1);
  if (v2 <= 21) {
    uint64_t v2 = 21LL;
  }
  -[MREffectShiftingTiles displayTimeForSlideAtIndex:](self, "displayTimeForSlideAtIndex:", v2 - 21);
  return result;
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  return v3 + 1.5;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)_aspectRatioForSlideIndex:(int64_t)a3
{
  uint64_t v5 = *(void **)((char *)&self->mAspectRatio + 1);
  if (v5)
  {
    unint64_t v6 = a3 - *(int64_t *)((char *)&self->mLastSlideIndex + 1);
    id v7 = [v5 count];
    id v8 = *(void **)((char *)&self->mAspectRatio + 1);
    if (v6 >= (unint64_t)v7)
    {
      if (![v8 count]) {
        return -1.0;
      }
      id v8 = *(void **)((char *)&self->mAspectRatio + 1);
      int64_t v9 = 0LL;
    }

    else
    {
      int64_t v9 = a3 - *(int64_t *)((char *)&self->mLastSlideIndex + 1);
    }

    objc_msgSend(objc_msgSend(v8, "objectAtIndex:", v9), "floatValue");
    return v13;
  }

  else
  {
    double v10 = -1.0;
    if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count")
       + *(int64_t *)((char *)&self->mLastSlideIndex + 1) > a3)
    {
      id v11 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3));
      if (v11)
      {
        [v11 imageAspectRatio];
        return result;
      }
    }
  }

  return v10;
}

- (int64_t)_displaySlideCountForLayout:(int64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)_slideCountForLayout:(int64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)_widthForLayout:(int64_t)a3
{
  else {
    return qword_1F98E8[a3 + 1];
  }
}

- (void)_setupLayoutsWithSlideInfo:(id)a3 append:(BOOL)a4 aspectRatio:(double)a5
{
  if (BYTE1(self->mSlideStartIndex)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = !a4;
  }
  if (v5) {
    return;
  }
  *(double *)((char *)&self->mIterationStartTime + 1) = a5;
  id v211 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed, a4);
  int64_t v9 = *(NSMutableArray **)((char *)&self->mFirstLayout + 1)
  double v10 = a3
      ? (char *)[a3 count]
      : (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count")
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = 0LL;
  uint64_t v13 = (uint64_t)&v10[*(int64_t *)((char *)&self->mLastCol + 1)];
  LOBYTE(v14) = *(NSMutableDictionary **)((char *)&self->mSprites + 1) == 0LL;
  else {
    uint64_t v15 = (uint64_t)v10;
  }
  uint64_t v16 = 1LL;
  v222 = &v10[*(int64_t *)((char *)&self->mLastCol + 1)];
  v223 = v11;
  id obj = (id)v15;
  do
  {
    else {
      uint64_t v17 = (uint64_t)v9;
    }
    unint64_t v18 = v12;
    if (v12 >= v13) {
      unint64_t v18 = v12 % v13;
    }
    if (a3)
    {
      if (v17 <= 4) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v17 - 5;
      }
      float v20 = -1.0;
      float v21 = -1.0;
      if (v18 < (unint64_t)[a3 count])
      {
        objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v18), "objectForKey:", @"aspectRatio"),  "floatValue");
        float v21 = v22;
      }

      if (v18 + 1 < (unint64_t)[a3 count])
      {
        objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v18 + 1), "objectForKey:", @"aspectRatio"),  "floatValue");
        float v20 = v23;
      }

      double v24 = v21;
      double v25 = v20;
    }

    else
    {
      v18 += *(int64_t *)((char *)&self->mLastCol + 1);
      if (v17 <= 4) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v17 - 5;
      }
      -[MREffectShiftingTiles _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v18);
      double v24 = v26;
      -[MREffectShiftingTiles _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v18 + 1);
    }

    int v14 = ((uint64_t)v9 < 10) & v14;
    if (v24 < 1.0)
    {
      -[NSMutableArray addObject:]( v223,  "addObject:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL, v25));
      ++v12;
LABEL_36:
      int64_t v9 = (NSMutableArray *)(v17 + 1);
LABEL_52:
      uint64_t v13 = (uint64_t)v222;
      goto LABEL_53;
    }

    if (v19 < 2 || v25 == -1.0)
    {
      BOOL v27 = v25 != -1.0 || v19 < 4;
      if (!v27 && ((v14 ^ 1) & 1) == 0)
      {
        -[NSMutableArray addObject:]( v223,  "addObject:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
        v12 += 2LL;
        goto LABEL_36;
      }

- (double)_durationForAspectRatio:(double)a3 inLayout:(int64_t)a4 withScreenRatio:(double)a5
{
  if ((unint64_t)a4 >= 3)
  {
    BOOL v6 = a3 < 1.0;
    double v5 = 0.0;
  }

  else
  {
    double v5 = dbl_1F9928[a4] * a5;
    BOOL v6 = a3 < 1.0;
    double v7 = 5.0;
    if (a3 < 1.0 && v5 > 1.0) {
      return v7;
    }
  }

  double v7 = 5.0;
  if (a3 <= 1.0 || v5 >= 1.0)
  {
    if (v6) {
      double v10 = v5 / a3;
    }
    else {
      double v10 = a3 / v5;
    }
    if (v10 >= 1.1) {
      return v10 * 5.0;
    }
  }

  return v7;
}

- (int64_t)_iterationForTime:(double)a3 startTime:(double *)a4 duration:(double *)a5
{
  double v9 = *(double *)((char *)&self->mIterationStartIndex + 1);
  double v10 = v9 + *(double *)((char *)&self->mSlideAspectRatios + 1);
  if (v10 <= a3)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v12 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      uint64_t v16 = 1LL;
      while (2)
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = (uint64_t)v14 + v16;
        double v19 = v10;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v17);
          double v21 = *(double *)(v20 + 72);
          double v10 = v19 + v21;
          if (v19 + v21 > a3)
          {
            uint64_t v18 = (uint64_t)v17 + v16;
            if (a4) {
              *a4 = v19;
            }
            if (a5) {
              *a5 = *(double *)(v20 + 72);
            }
            goto LABEL_21;
          }

          uint64_t v17 = (char *)v17 + 1;
          double v19 = v19 + v21;
        }

        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v16 = v18;
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v18 = 1LL;
    }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (BYTE1(self->mSlideStartIndex) || self->super.mNeedsToUpdateSlides)
  {
    BOOL v9 = BYTE1(self->mSlideStartIndex) == 0;
    [a4 localAspectRatio];
    -[MREffectShiftingTiles _setupLayoutsWithSlideInfo:append:aspectRatio:]( self,  "_setupLayoutsWithSlideInfo:append:aspectRatio:",  0LL,  v9,  v10);
    -[MREffectShiftingTiles _updateSizeScripts](self, "_updateSizeScripts");
    -[MREffectShiftingTiles _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
    self->super.mNeedsToUpdateSlides = 0;
  }

  if (BYTE2(self->mSlideStartIndex))
  {
    uint64_t v11 = -[MREffectShiftingTiles _lowestDisplayIteration](self, "_lowestDisplayIteration");
    if (v11 >= 3)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)&self->mNeedsToRecalculateIterations;
      uint64_t v14 = v11 - 1;
      id v15 = -[MREffectShiftingTiles _layoutForIteration:](self, "_layoutForIteration:", v11 - 1);
      -[MREffectShiftingTiles _timeForIteration:](self, "_timeForIteration:", v14);
      *(int64_t *)((char *)&self->mIterationStartIndex + 1) = v16;
      *(NSMutableArray **)((char *)&self->mSlideAspectRatios + 1) = (NSMutableArray *)*((void *)[*(id *)((char *)&self->mSprites + 1) objectAtIndex:v12 - *(void *)&self->mNeedsToRecalculateIterations - 2]
                                                                                      + 9);
      uint64_t v17 = *(NSMutableArray **)((char *)&self->mTiming + 1);
      if (v17)
      {

        *(NSMutableArray **)((char *)&self->mTiming + 1) = 0LL;
      }

      *(NSMutableArray **)((char *)&self->mTiming + 1) = (NSMutableArray *)[v15 mutableCopy];
      *(void *)&self->mNeedsToRecalculateIterations = v14;
      uint64_t v18 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  *(void *)&self->mNeedsToRecalculateIterations - v13);
      [*(id *)((char *)&self->mSprites + 1) removeObjectsAtIndexes:v18];
    }

    BYTE2(self->mSlideStartIndex) = 0;
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MREffectShiftingTiles;
  LOBYTE(v6) = -[MREffect prerenderForTime:inContext:withArguments:]( &v39,  "prerenderForTime:inContext:withArguments:",  v6,  a5,  a3);
  if (-[MRLayer isActivated](self->super.mEffectLayer, "isActivated"))
  {
    if (a3 >= 1.25) {
      double v19 = a3 + -1.25;
    }
    else {
      double v19 = a3;
    }
    double v37 = 0.0;
    double v38 = 0.0;
    -[MREffectShiftingTiles _iterationForTime:startTime:duration:]( self,  "_iterationForTime:startTime:duration:",  &v38,  &v37,  v19);
    if (v37 > 5.0
      && (id v20 = -[MREffectShiftingTiles _layoutForTime:](self, "_layoutForTime:", v19),
          __int128 v33 = 0u,
          __int128 v34 = 0u,
          __int128 v35 = 0u,
          __int128 v36 = 0u,
          (id v21 = [v20 countByEnumeratingWithState:&v33 objects:v40 count:16]) != 0))
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v34;
      while (2)
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          -[MREffectShiftingTiles _aspectRatioForSlideIndex:]( self,  "_aspectRatioForSlideIndex:",  *(void *)(*(void *)(*((void *)&v33 + 1) + 8LL * (void)i) + 24LL));
          if (v25 > 0.0 && v25 >= 0.5 && v25 <= 2.0)
          {
            int v28 = 1;
            goto LABEL_32;
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v33 objects:v40 count:16];
        int v28 = 0;
        if (v22) {
          continue;
        }
        break;
      }
    }

    else
    {
      int v28 = 0;
    }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v268 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  *(void *)&double v307 = 152LL;
  double mPhaseOutDuration = self->super.mPhaseOutDuration;
  double v8 = self->super.mPhaseInDuration + self->super.mMainDuration;
  double v325 = a3;
  if (a3 >= 1.25) {
    double v9 = a3 + -1.25;
  }
  else {
    double v9 = a3;
  }
  id obj = -[MREffectShiftingTiles _layoutForTime:](self, "_layoutForTime:", v9);
  float v10 = -[MREffectShiftingTiles _infoForTime:](self, "_infoForTime:", v9);
  uint64_t v328 = v10[2];
  int v319 = *((unsigned __int8 *)v10 + 8);
  int v261 = *((unsigned __int8 *)v10 + 24);
  __int128 v379 = 0u;
  __int128 v377 = 0u;
  __int128 v378 = 0u;
  __int128 v376 = 0u;
  __int128 v252 = (double *)v10;
  uint64_t v11 = (void *)v10[4];
  id v12 = [v11 countByEnumeratingWithState:&v376 objects:v387 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v377;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v377 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 += -[MREffectShiftingTiles _widthForLayout:]( self,  "_widthForLayout:",  [*(id *)(*((void *)&v376 + 1) + 8 * (void)i) integerValue]);
      }

      id v13 = [v11 countByEnumeratingWithState:&v376 objects:v387 count:16];
    }

    while (v13);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  double v17 = v8 + mPhaseOutDuration;
  [a4 localAspectRatio];
  float v19 = v18 * 0.012;
  NSUInteger v20 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  uint64_t v21 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
  double v375 = 0.0;
  double v374 = 0.0;
  -[MREffectShiftingTiles _iterationForTime:startTime:duration:]( self,  "_iterationForTime:startTime:duration:",  &v375,  &v374,  v9);
  id v22 = 0LL;
  double v258 = v374 + -1.25;
  double v259 = v9 - v375;
  if (v9 - v375 > v374 + -1.25) {
    id v22 = (void *)*((void *)v252 + 6);
  }
  v329 = v22;
  double v23 = v17 + -1.25;
  double v250 = v19;
  double v335 = v259 - v258;
  v343 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v327 = v9;
  uint64_t v254 = v14;
  if (a3 < 1.25 || v23 < a3)
  {
    __int128 v364 = 0u;
    __int128 v365 = 0u;
    __int128 v362 = 0u;
    __int128 v363 = 0u;
    id v279 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v362, v384, 16, *(void *)&v250);
    if (!v279) {
      goto LABEL_223;
    }
    uint64_t v38 = 0LL;
    uint64_t v276 = *(void *)v363;
    CGFloat height = CGSizeZero.height;
    CGFloat y = CGPointZero.y;
    double v310 = v9 + 1.25;
    double v298 = v17 + -1.25;
    while (1)
    {
      for (j = 0LL; j != v279; j = (char *)j + 1)
      {
        if (*(void *)v363 != v276) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v362 + 1) + 8LL * (void)j);
        uint64_t v41 = *(void *)(v40 + 8);
        uint64_t v42 = *(void *)(v40 + 24);
        uint64_t v43 = -[MREffectShiftingTiles _displaySlideCountForLayout:](self, "_displaySlideCountForLayout:", v41);
        if (v43 >= 1)
        {
          uint64_t v44 = v43;
          v282 = j;
          uint64_t v285 = v38;
          uint64_t v45 = 0LL;
          uint64_t v46 = v38 - 5;
          double v47 = 0.5 - v251 * 0.25;
          if (v38 >= 5) {
            double v47 = v251 * 0.25 + -0.5;
          }
          double v323 = v47;
          if (v38 <= 4) {
            uint64_t v46 = v38;
          }
          double v48 = (float)((float)(v46 + 1) * 0.012);
          double v302 = (double)v46 * 0.385600001 + -0.8072 + v48;
          double v293 = (double)v46 * 0.385600001 + -0.614399999 + v48 + 0.00600000005;
          double v296 = (double)v46 * 0.385600001 + -0.421599999 + v48 + 0.0120000001;
          double v49 = fmin(v9 + (double)(5 - v46) * -0.0500000007, 1.0);
          if (v49 < 0.0) {
            double v49 = 0.0;
          }
          double v50 = 1.0;
          double v315 = v49;
          double v312 = -(double)v46;
          double v314 = (1.0 - v49) * 0.0600000024;
          while (2)
          {
            id v51 = objc_msgSend( -[MREffectShiftingTiles _slideProviderWithAspectRatio:nearest:actual:]( self,  "_slideProviderWithAspectRatio:nearest:actual:",  v41 != 0,  v42 + v45,  v361),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v9);
            uint64_t v52 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
            double v53 = y;
            double x = CGPointZero.x;
            double v55 = height;
            double width = CGSizeZero.width;
            switch(v41)
            {
              case 0LL:
                double x = v302;
                double v53 = v323;
                double width = 0.385600001;
                goto LABEL_57;
              case 1LL:
                double width = 0.783200001;
                double x = v293;
                goto LABEL_56;
              case 2LL:
                double v57 = v251 * 0.5 + (0.5 - v251 * 1.25) * 0.5;
                if (v45) {
                  double v57 = -(v251 * 0.5 + (0.5 - v251 * 1.25) * 0.5);
                }
                double v53 = v323 + v57;
                double x = v302;
                double width = 0.385600001;
                double v55 = 0.5 - v251 * 1.25;
                break;
              case 3LL:
                double width = 1.1808;
                double x = v296;
                goto LABEL_56;
              case 6LL:
                double width = *(double *)(v40 + 32) * 0.0120000001 + *(double *)(v40 + 32) * 0.385600001;
                double x = v50 + width * -0.5 + -0.0120000001;
LABEL_56:
                double v53 = v323;
LABEL_57:
                double v55 = v251 * -1.5 + 1.0;
                break;
              default:
                break;
            }

            [v51 aspectRatio];
            BOOL v59 = v58 >= 0.5 && v58 <= 2.0;
            [a4 localAspectRatio];
            double v61 = width / v55 * v60;
            [v51 centerX];
            double v63 = v62;
            [v51 centerY];
            double v305 = v64;
            [v51 aspectRatio];
            double v66 = v65;
            [v51 aspectRatio];
            if (v66 <= 2.0)
            {
              if (v67 >= 0.5) {
                goto LABEL_71;
              }
              [v51 aspectRatio];
              double v70 = v50 - v69 / v61;
              double v9 = v327;
              if (v325 >= 1.25) {
                double v71 = v70;
              }
              else {
                double v71 = -v70;
              }
            }

            else
            {
              double v68 = v50 - v61 / v67;
              if (v325 >= 1.25) {
                double v63 = v68;
              }
              else {
                double v63 = -v68;
              }
LABEL_71:
              double v9 = v327;
              double v71 = v305;
            }

            [v51 setCenterX:v63];
            [v51 setCenterY:v71];
            double v23 = v298;
LABEL_73:
            if (v23 >= v325)
            {
              double v78 = x - (v314 + Bounce(v315) * 1.928);
            }

            else
            {
              double v72 = self->super.mPhaseInDuration
                  + self->super.mPhaseOutDuration
                  + self->super.mMainDuration
                  - v310
                  + v312 * 0.0500000007;
              double v73 = 1.0;
              double v74 = 1.0 - v72;
              BOOL v76 = v72 < 1.0;
              double v75 = 0.0;
              if (!v76) {
                double v74 = 0.0;
              }
              BOOL v76 = v74 >= 0.0 && v74 < 0.4375;
              if (v76)
              {
                float v79 = v74 * 3.58999991 + 1.57079637;
                float v80 = sinf(v79);
                double v73 = 1.0;
                double v75 = v80;
                double v77 = (1.0 - v75) * 0.0600000024 + (1.0 - v75) * 1.928;
              }

              else
              {
                double v77 = 1.98800001;
              }

              double v78 = x + v77 + (v73 - v75) * 0.0120000001;
            }

            -[MRCroppingSprite setNeedsInSpriteCoordinates:](v52, "setNeedsInSpriteCoordinates:", 1LL);
            double v50 = 1.0;
            -[MRCroppingSprite setInnerRect:]( v52,  "setInnerRect:",  2.0 / (width * self->super.mPixelSize.width * 0.400000006),  2.0 / (v55 * self->super.mPixelSize.height * 0.400000006),  1.0 - 4.0 / (width * self->super.mPixelSize.width * 0.400000006),  1.0 - 4.0 / (v55 * self->super.mPixelSize.height * 0.400000006));
            id v81 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesRenderable);
            v81->size.double width = width;
            v81->size.CGFloat height = v55;
            v81->position.double x = v78;
            v81->position.CGFloat y = v53;
            -[MRShiftingTilesRenderable setSprite:](v81, "setSprite:", v52);
            -[MRShiftingTilesRenderable setSlide:](v81, "setSlide:", v51);
            v81->isBreak = 0;
            -[NSMutableArray addObject:](v343, "addObject:", v81);

            [v51 releaseByUser];
            if (v44 == ++v45)
            {
              uint64_t v254 = 5LL;
              j = v282;
              uint64_t v38 = v285;
              break;
            }

            continue;
          }
        }

        v38 += -[MREffectShiftingTiles _displayWidthForLayout:](self, "_displayWidthForLayout:", v41);
      }

      id v279 = [obj countByEnumeratingWithState:&v362 objects:v384 count:16];
      if (!v279) {
        goto LABEL_223;
      }
    }
  }

  __int128 v372 = 0u;
  __int128 v373 = 0u;
  __int128 v370 = 0u;
  __int128 v371 = 0u;
  id v24 = [obj countByEnumeratingWithState:&v370 objects:v386 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v339 = v21;
    uint64_t v26 = 0LL;
    uint64_t v304 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = *(void *)v371;
    double v30 = 0.0;
    double v31 = 0.0;
    do
    {
      for (k = 0LL; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v371 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*(void *)(*((void *)&v370 + 1) + 8LL * (void)k) + 8LL);
        double v34 = v259;
        if (v259 > v258)
        {
          if (v329 && objc_msgSend(v329, "containsIndex:", (char *)k + v27, v259))
          {
            double v30 = dbl_1F9950[v33 == 1];
            double v31 = v31 + v30;
            ++v26;
          }

          if (v33 == 1) {
            uint64_t v35 = 2LL;
          }
          else {
            uint64_t v35 = 1LL;
          }
          uint64_t v36 = v304;
          uint64_t v37 = v35 + v304;
          if ((v261 != 0) == v28 < 5) {
            uint64_t v36 = v37;
          }
          uint64_t v304 = v36;
        }

        v28 += -[MREffectShiftingTiles _widthForLayout:](self, "_widthForLayout:", v33, v34, *(void *)&v250);
      }

      id v25 = [obj countByEnumeratingWithState:&v370 objects:v386 count:16];
      v27 += (uint64_t)k;
    }

    while (v25);
    double v253 = v31 - v30;
    uint64_t v21 = v339;
  }

  else
  {
    uint64_t v26 = 0LL;
    uint64_t v304 = 0LL;
    double v253 = 0.0;
  }

  if (v319) {
    id v82 = 0LL;
  }
  else {
    id v82 = (char *)[v329 count] - 1;
  }
  __int128 v368 = 0u;
  __int128 v369 = 0u;
  __int128 v366 = 0u;
  __int128 v367 = 0u;
  id v260 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v366, v385, 16, *(void *)&v250);
  if (v260)
  {
    uint64_t v83 = v21 + v20;
    uint64_t v257 = *(void *)v367;
    CGFloat v84 = CGSizeZero.width;
    CGFloat v85 = CGSizeZero.height;
    CGFloat v86 = CGPointZero.x;
    CGFloat v333 = CGPointZero.y;
    double v87 = v251 * -1.25 + 0.5;
    double v283 = v251 * 0.5 + v87 * 0.5;
    BOOL v89 = v259 > v258 && v329 != 0LL;
    BOOL v326 = v89;
    float v90 = v335 * 3.58999991 + 1.57079637;
    float v91 = sinf(v90);
    unint64_t v317 = 0LL;
    uint64_t v92 = 0LL;
    double v93 = v91;
    if (v91 >= 0.0) {
      double v94 = v91;
    }
    else {
      double v94 = 0.0;
    }
    double v271 = v94;
    BOOL v96 = v328 == 2 || v26 == 1;
    BOOL v270 = v96;
    double v255 = (float)((float)v254 * 0.012);
    double v256 = (double)v254 * 0.385600001;
    double v280 = -(v251 * 0.5 + v87 * 0.5);
    double v97 = 1.0;
    double v273 = v93;
    if (v335 >= 0.4375) {
      double v98 = 0.0;
    }
    else {
      double v98 = v93;
    }
    if (v98 >= 0.0) {
      double v99 = 1.0 - v98;
    }
    else {
      double v99 = 1.0;
    }
    double v269 = v87 * v99;
    double v100 = 2.0;
    double v299 = 0.0;
    double v301 = v85;
    do
    {
      for (m = 0LL; m != v260; m = (char *)m + 1)
      {
        if (*(void *)v367 != v257) {
          objc_enumerationMutation(obj);
        }
        uint64_t v102 = *(void *)(*((void *)&v366 + 1) + 8LL * (void)m);
        uint64_t v103 = *(void *)(v102 + 8);
        v320 = (double *)v102;
        uint64_t v331 = *(void *)(v102 + 24);
        uint64_t v104 = -[MREffectShiftingTiles _displaySlideCountForLayout:](self, "_displaySlideCountForLayout:", v103);
        uint64_t v105 = (uint64_t)[v268 randomInt];
        uint64_t v106 = v105 & 1;
        if (v105 < 0) {
          uint64_t v106 = -v106;
        }
        v287 = (char *)v106;
        if (v104 >= 1)
        {
          __int128 v263 = m;
          uint64_t v264 = v92;
          id v107 = 0LL;
          char v289 = 0;
          char v108 = 0;
          uint64_t v109 = v92 - 5;
          if (v92 < 5) {
            uint64_t v109 = v92;
          }
          double v110 = (double)v109;
          char v313 = (v261 != 0) ^ (v92 < 5);
          double v111 = (float)((float)(v109 + 1) * 0.012);
          double v308 = (double)v109 * 0.385600001 + -0.8072 + v111;
          double v112 = 0.5 - v251 * 0.25;
          if (v92 >= 5) {
            double v112 = v251 * 0.25 + -0.5;
          }
          double v322 = v112;
          double v294 = v110 * 0.385600001 + -0.421599999 + v111 + 0.0120000001;
          double v291 = v110 * 0.385600001 + -0.614399999 + v111 + 0.00600000005;
          double v113 = 1.0;
          double v277 = (double)(uint64_t)v82 + v97;
          double v267 = v97 + v277 * 0.05;
          __int128 v265 = v82;
          float v262 = (float)(uint64_t)v82 + 1.0;
          while (1)
          {
            int64_t v114 = (int64_t)&v107[v331];
            id v115 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(v114)),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v9);
            int64_t v116 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
            double v117 = v86;
            double v118 = v333;
            double v119 = v84;
            double v120 = v85;
            switch(v103)
            {
              case 0LL:
                double v117 = v308;
                double v118 = v322;
                double v119 = 0.385600001;
                double v120 = v251 * -1.5 + 1.0;
                break;
              case 1LL:
                double v119 = 0.783200001;
                double v117 = v291;
                goto LABEL_137;
              case 2LL:
                double v121 = v283;
                if (v107) {
                  double v121 = v280;
                }
                double v118 = v322 + v121;
                double v117 = v308;
                double v119 = 0.385600001;
                double v120 = v251 * -1.25 + 0.5;
                break;
              case 3LL:
                double v119 = 1.1808;
                double v117 = v294;
                goto LABEL_137;
              case 6LL:
                double v119 = v320[4] * 0.0120000001 + v320[4] * 0.385600001;
                double v117 = v113 + v119 * -0.5 + -0.0120000001;
LABEL_137:
                double v118 = v322;
                double v120 = v251 * -1.5 + 1.0;
                break;
              default:
                break;
            }

            double v337 = v117;
            double v340 = v118;
            [v115 aspectRatio];
            BOOL v123 = v122 > v100 || v122 < 0.5;
            if (v123)
            {
              double v124 = v320[6];
              if (v124 > 5.0)
              {
                double v125 = v320[5];
                double v126 = 0.0;
                if (v9 >= v125)
                {
                  double v127 = v124 + -1.25;
                  double v126 = 1.0;
                  if (v9 <= v127 + v125) {
                    double v126 = (v9 - v125) / v127;
                  }
                }

                [a4 localAspectRatio];
                double v129 = v119 / v120 * v128;
                float v130 = (v126 + -0.5) * 3.14159274;
                double v131 = (sinf(v130) + 1.0) * 0.5;
                [v115 centerX];
                double v133 = v132;
                [v115 centerY];
                double v135 = v134;
                [v115 aspectRatio];
                double v137 = v136;
                if (v136 <= v100)
                {
                  double v140 = v129;
                  double v113 = 1.0;
                  if (v137 >= 0.5)
                  {
                    double v139 = v135;
                  }

                  else
                  {
                    double v307 = 1.0 - v137 / v140;
                    double v139 = -(v307 - v131 * (v307 + v307));
                    double v135 = v139;
                  }
                }

                else
                {
                  double v138 = v129 / v136;
                  double v113 = 1.0;
                  double v307 = 1.0 - v138;
                  double v139 = -(v307 - v131 * (v307 + v307));
                  double v133 = v139;
                }

                if (self->super._panoramaPanningOffsets)
                {
                  -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  ImageKey(v114),  v139,  -v307);
                  if (v137 > v100) {
                    double v133 = v141;
                  }
                  else {
                    double v135 = v141;
                  }
                }

                double v9 = v327;
                CGFloat v85 = v301;
                [v115 setCenterX:v133];
                [v115 setCenterY:v135];
                CGFloat v84 = CGSizeZero.width;
                CGFloat v86 = CGPointZero.x;
              }
            }

            if (!v326) {
              goto LABEL_213;
            }
            if (![v329 containsIndex:v317])
            {
              uint64_t v142 = v328;
              double v143 = v340;
              goto LABEL_196;
            }

            uint64_t v142 = v328;
            double v143 = v340;
            if (v328 == 2)
            {
              double v144 = -0.5;
            }

            else
            {
              if (v103 == 2)
              {
                double v145 = v340 - v120 * 0.5;
                if (v107) {
                  double v145 = v340 + v120 * 0.5;
                }
                goto LABEL_167;
              }

              double v144 = 0.5;
            }

            double v145 = v340 + v120 * v144;
LABEL_167:
            if (v335 >= 0.4375)
            {
              double v147 = 0.0;
              double v146 = v119 * 0.0;
              double v120 = v120 * 0.0;
              if (v304 > 2)
              {
                double v146 = v146 * 0.0;
                double v120 = v120 * 0.0;
              }
            }

            else
            {
              double v146 = v271 * v119;
              double v120 = v271 * v120;
              if (v304 > 2)
              {
                double v146 = v271 * v146;
                double v120 = v120 * v271;
              }

              double v147 = v273;
            }

            if (v319)
            {
              double v113 = 1.0;
              if (v147 >= 0.0) {
                double v148 = 1.0 - v147;
              }
              else {
                double v148 = 1.0;
              }
              double v149 = v337 - v119 * 0.5 + v146 * 0.5 - v299 * v148;
            }

            else
            {
              double v113 = 1.0;
              if (v147 >= 0.0) {
                double v150 = 1.0 - v147;
              }
              else {
                double v150 = 1.0;
              }
              double v149 = v337 + v119 * 0.5 + v146 * -0.5 + (v253 - v299) * v150;
            }

            double v337 = v149;
            double v119 = v146;
            if (v103 == 2)
            {
              double v151 = v145 + v120 * 0.5;
              double v152 = v145 - v120 * 0.5;
              if (!v107) {
                double v152 = v145 + v120 * 0.5;
              }
              double v153 = v145 - v269 + v120 * 0.5;
              if (v107) {
                double v153 = v151;
              }
              if (v328 == 2) {
                double v143 = v153;
              }
              else {
                double v143 = v152;
              }
              char v108 = 1;
            }

            else
            {
              if (v270)
              {
                double v154 = v145 + v120 * 0.5;
                double v155 = v145 - v120 * 0.5;
                if (v328 == 2) {
                  double v143 = v154;
                }
                else {
                  double v143 = v155;
                }
              }

              char v108 = 1;
            }

- (id)_slideProviderWithAspectRatio:(BOOL)a3 nearest:(int64_t)a4 actual:(int64_t *)a5
{
  NSUInteger v8 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs", a3),  "count");
  uint64_t v9 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
  *a5 = a4;
  return -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a4));
}

- (id)_infoForTime:(double)a3
{
  int64_t v6 = -[MREffectShiftingTiles _iterationForTime:startTime:duration:]( self,  "_iterationForTime:startTime:duration:",  0LL,  0LL,  a3);
  double v7 = *(char **)&self->mNeedsToRecalculateIterations;
  if ((uint64_t)v7 <= v6 && (uint64_t)v7 < (uint64_t)v5)
  {
    int64_t v10 = v6;
    while (v5 - 1 != v7)
    {
      id result = [*(id *)((char *)&self->mSprites + 1) objectAtIndex:&v7[-*(void *)&self->mNeedsToRecalculateIterations]];
      if (!result) {
        return [*(id *)((char *)&self->mSprites + 1) lastObject];
      }
      return result;
    }
  }

  return [*(id *)((char *)&self->mSprites + 1) lastObject];
}

- (id)_layoutForTime:(double)a3
{
  return -[MREffectShiftingTiles _layoutForIteration:]( self,  "_layoutForIteration:",  -[MREffectShiftingTiles _iterationForTime:startTime:duration:]( self,  "_iterationForTime:startTime:duration:",  0LL,  0LL,  a3));
}

- (id)_layoutForIteration:(int64_t)a3
{
  NSUInteger v4 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  if (self->super.mEffectLayer) {
    NSUInteger v5 = *(int64_t *)((char *)&self->mLastSlideIndex + 1) + v4;
  }
  else {
    NSUInteger v5 = self->super.mMultiImageSlideRange.length + self->super.mMultiImageSlideRange.location;
  }
  int64_t v26 = v5;
  int64_t v6 = *(void *)&self->mNeedsToRecalculateIterations;
  double v7 = *(double *)((char *)&self->mIterationStartIndex + 1);
  id v8 = [*(id *)((char *)&self->mTiming + 1) mutableCopy];
  if (v6 < a3)
  {
    double v9 = v7 + *(double *)((char *)&self->mSlideAspectRatios + 1);
    do
    {
      unint64_t v10 = v6 - *(void *)&self->mNeedsToRecalculateIterations;
      int64_t v24 = v6;
      uint64_t v11 = (double *)[*(id *)((char *)&self->mSprites + 1) objectAtIndex:v6 - *(void *)&self->mNeedsToRecalculateIterations];
      uint64_t v12 = *((void *)v11 + 5);
      [v8 removeObjectsAtIndexes:*((void *)v11 + 6)];
      uint64_t v13 = *((void *)v11 + 7);
      if (v13 >= v26) {
        uint64_t v13 = v13 % v26 + *(int64_t *)((char *)&self->mLastSlideIndex + 1);
      }
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id obj = (id)*((void *)v11 + 4);
      id v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(obj);
            }
            float v18 = (char *)[*(id *)(*((void *)&v27 + 1) + 8 * (void)i) integerValue];
            float v19 = objc_alloc_init(&OBJC_CLASS___MRShiftingTilesIteration);
            v19->age = 0LL;
            v19->slideIndedouble x = v13;
            v19->layout = (int64_t)v18;
            v19->startTime = v9;
            v19->duration = v11[9];
            if ((unint64_t)(v18 - 5) <= 1)
            {
              -[MREffectShiftingTiles _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v13);
              *(float *)&double v20 = v20
                             / (*(double *)((char *)&self->mIterationStartTime + 1)
              double v21 = floorf(*(float *)&v20);
              if (v21 < 5.0) {
                double v21 = 5.0;
              }
              v19->double width = v21;
            }

            [v8 insertObject:v19 atIndex:(char *)i + v12];

            if (v13 + 1 >= v26) {
              uint64_t v13 = *(int64_t *)((char *)&self->mLastSlideIndex + 1);
            }
            else {
              v13 += -[MREffectShiftingTiles _slideCountForLayout:](self, "_slideCountForLayout:", v18);
            }
          }

          id v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          v12 += (uint64_t)i;
        }

        while (v15);
      }

      double v9 = v9 + v11[9];
      int64_t v6 = v24 + 1;
    }

    while (v24 + 1 != a3);
  }

  return v8;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  unint64_t v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0LL;
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
            uint64_t v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            uint64_t v13 = v16;
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

- (BOOL)getVerticesCoordinates:(MREffectShiftingTiles *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mTiming + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mFirstLayout + 1) = 0LL;
  *(double *)((char *)&self->mAspectRatio + 1) = 0.0;
  BYTE1(self->mSlideStartIndex) = 1;
  BYTE2(self->mSlideStartIndex) = 0;
  *(NSMutableArray **)((char *)&self->mLastLayout + 1) = 0LL;
  *(int64_t *)((char *)&self->mLastCol + 1) = 0LL;
  *(int64_t *)((char *)&self->mLastSlideIndex + 1) = 0LL;
  *(void *)&self->mNeedsToRecalculateIterations = 0LL;
  *(int64_t *)((char *)&self->mIterationStartIndex + 1) = 0LL;
}

@end