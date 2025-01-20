@interface MREffectFloating
+ (BOOL)hasCustomTiming;
+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3;
- (BOOL)isOpaque;
- (BOOL)needsMoreSlidesAtTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDynamicExpansion;
- (MREffectFloating)initWithEffectID:(id)a3;
- (double)_mainDurationForImageCount:(int64_t)a3;
- (double)_rotationForRelative:(double)a3 directionFactor:(double)a4;
- (double)_zTranslationForRelativeTime:(double)a3;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (int64_t)totalImages;
- (int64_t)typicalSlideBatchSize;
- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3;
- (void)_applySizeScript;
- (void)_applyTimingToSlideProviders;
- (void)_bestTimeInfoFor:(id)a3 time:(double)a4 start:(double *)a5 end:(double *)a6;
- (void)_cleanup;
- (void)_orderImages;
- (void)_unload;
- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setMultiImageSlideRange:(_NSRange)a3;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)setTotalImages:(int64_t)a3;
@end

@implementation MREffectFloating

- (MREffectFloating)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectFloating;
  v3 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:", a3);
  v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 185) = 0LL;
    *(void *)(v3 + 225) = 0LL;
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 201) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 209) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 233) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4[217] = 0;
  }

  return (MREffectFloating *)v4;
}

- (void)_cleanup
{
  *(int64_t *)((char *)&self->mTotalImages + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mFrontSlideOrder + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mMiddleSlideOrder + 1) = 0LL;

  *(int64_t *)((char *)&self->mIterationOffset + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  *(void *)&self->mNeedsMoreSlides = 0LL;
  BYTE1(self->mBackSlideOrder) = 0;
}

+ (BOOL)hasCustomTiming
{
  return 1;
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
  uint64_t v5 = *(void *)&self->mNeedsMoreSlides;
  id v6 = [*(id *)((char *)&self->mTotalImages + 1) count];
  uint64_t v7 = (uint64_t)((a3 + 3.5) / 160.0);
  if (v7 <= 1) {
    uint64_t v7 = 1LL;
  }
  unint64_t v8 = v7 + ~v5;
  else {
    unint64_t v9 = v8;
  }
  id v10 = [*(id *)((char *)&self->mTotalImages + 1) objectAtIndex:v9];
  id v11 = [*(id *)((char *)&self->mFrontSlideOrder + 1) objectAtIndex:v9];
  id v12 = [*(id *)((char *)&self->mMiddleSlideOrder + 1) objectAtIndex:v9];
  uint64_t v13 = *(void *)(&self->super._isInInteractiveMode + 1);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v14 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v10);
        }
        v18 = NSIntegerFromString(*(void **)(*((void *)&v38 + 1) + 8LL * (void)i), 5uLL);
      }

      id v15 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v15);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v19 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v11);
        }
        v23 = NSIntegerFromString(*(void **)(*((void *)&v34 + 1) + 8LL * (void)j), 5uLL);
      }

      id v20 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }

    while (v20);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v24 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (k = 0LL; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v12);
        }
        v28 = NSIntegerFromString(*(void **)(*((void *)&v30 + 1) + 8LL * (void)k), 5uLL);
      }

      id v25 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }

    while (v25);
  }

  return v13 & ~(v13 >> 63);
}

- (BOOL)isOpaque
{
  return 1;
}

- (void)setPixelSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectFloating;
  -[MREffect setPixelSize:](&v4, "setPixelSize:", a3.width, a3.height);
  -[MREffectFloating _applySizeScript](self, "_applySizeScript");
}

- (double)_mainDurationForImageCount:(int64_t)a3
{
  int64_t v3 = (a3 + 19) / 20;
  if (v3 <= 1) {
    int64_t v3 = 1LL;
  }
  return ((double)v3 + -1.0) * 160.0 + 153.333344 + 66.0;
}

- (void)setMultiImageSlideRange:(_NSRange)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_11F2D4;
  block[3] = &unk_24DA58;
  block[4] = self;
  _NSRange v5 = a3;
  id v3 = -[NSDictionary objectForKey:]( -[MRLayer parameters](self->super.mEffectLayer, "parameters"),  "objectForKey:",  @"renderer");
  if (v3) {
    dispatch_async((dispatch_queue_t)[v3 renderDispatchQueue], block);
  }
  else {
    sub_11F2D4(block);
  }
}

- (BOOL)needsMoreSlidesAtTime:(double)a3
{
  return BYTE2(self->mBackSlideOrder);
}

- (void)appendSlideInformation:(id)a3 andTextInformation:(id)a4
{
  *(void *)(&self->super._isInInteractiveMode + 1) += [a3 count];
  -[MREffectFloating _mainDurationForImageCount:](self, "_mainDurationForImageCount:");
  -[MREffectFloating setPhaseInDuration:mainDuration:phaseOutDuration:]( self,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  0.0,  v5,  0.0);
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectFloating;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v5,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
}

- (void)_applySizeScript
{
  if (self->super.mEffectLayer)
  {
    id v3 = (void **)((char *)&self->mTotalImages + 1);
    if ([*(id *)((char *)&self->mTotalImages + 1) count])
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      obj = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
      id v41 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
      if (v41)
      {
        uint64_t v40 = *(void *)v44;
        double height = CGSizeZero.height;
        do
        {
          for (i = 0LL; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v44 != v40) {
              objc_enumerationMutation(obj);
            }
            id v6 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
            id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v6);
            [v7 defaultSize];
            if (v9 != CGSizeZero.width || v8 != height)
            {
              [v7 defaultSize];
              if (v12 != self->super.mPixelSize.width || v11 != self->super.mPixelSize.height) {
                continue;
              }
            }

            v42 = v7;
            uint64_t v14 = 0LL;
            int v15 = 0;
            uint64_t v16 = 0LL;
            uint64_t v17 = (uint64_t)NSIntegerFromString(v6, 5uLL) / 20;
            uint64_t v18 = 10000LL;
            do
            {
              id v19 = v3;
              if (v14)
              {
                if (v14 == 1)
                {
                  id v20 = &OBJC_IVAR___MREffectFloating_mMiddleSlideOrder;
                }

                else
                {
                  if (v14 != 2) {
                    goto LABEL_25;
                  }
                  id v20 = &OBJC_IVAR___MREffectFloating_mBackSlideOrder;
                }

                id v19 = (void **)((char *)&self->super.super.isa + *v20);
              }

              uint64_t v16 = *v19;
LABEL_25:
              unint64_t v21 = v17 - *(void *)&self->mNeedsMoreSlides;
              else {
                unint64_t v22 = v21;
              }
              id v23 = objc_msgSend(objc_msgSend(v16, "objectAtIndex:", v22), "indexOfObject:", v6);
              BOOL v24 = v18 < 10000;
              if (v14 == v18) {
                BOOL v24 = 0;
              }
              int v25 = v15 | v24;
              if (v14 >= v18) {
                uint64_t v26 = v18;
              }
              else {
                uint64_t v26 = v14;
              }
              if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                int v15 = v25;
                uint64_t v18 = v26;
              }

              ++v14;
            }

            while (v14 != 3);
            [v42 setWantsMipmap:v15 & 1];
            [v42 imageAspectRatio];
            double width = self->super.mPixelSize.width;
            double v29 = self->super.mPixelSize.height;
            double v30 = width / v29;
            double v31 = width / v29;
            if (v27 <= width / v29)
            {
              double v31 = v27;
              if (v27 < 1.0 / v30) {
                double v31 = 1.0 / v30;
              }
            }

            double v32 = v30 * 0.5;
            switch(v18)
            {
              case 2LL:
                BOOL v33 = v31 < 1.0;
                double v34 = v29 * v32 * 0.25;
                double v35 = v34 * v31;
                double v36 = width * 0.5 * 0.25;
LABEL_46:
                double v37 = v36 / v31;
                if (v33)
                {
                  double v38 = v34;
                }

                else
                {
                  double v35 = v36;
                  double v38 = v37;
                }

                objc_msgSend(v42, "setDefaultSize:", v35, v38, v37);
                continue;
              case 1LL:
                BOOL v33 = v31 < 1.0;
                double v34 = v29 * v32 * 0.5;
                double v35 = v34 * v31;
                double width = width * 0.5;
LABEL_44:
                double v36 = width * 0.5;
                goto LABEL_46;
              case 0LL:
                BOOL v33 = v31 < 1.0;
                double v34 = v29 * v32;
                double v35 = v34 * v31;
                goto LABEL_44;
            }
          }

          id v41 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
        }

        while (v41);
      }
    }
  }

- (void)_applyTimingToSlideProviders
{
  mEffectLayer = self->super.mEffectLayer;
  if (mEffectLayer)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    obj = -[MRLayerEffect slideProvidersForElementIDs](mEffectLayer, "slideProvidersForElementIDs");
    id v3 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v44;
      uint64_t v29 = *(void *)v44;
      do
      {
        id v6 = 0LL;
        id v30 = v4;
        do
        {
          if (*(void *)v44 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v6);
          id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v7);
          [v8 showDuration];
          if (v9 == 0.0)
          {
            BOOL v33 = v8;
            double v34 = v7;
            double v35 = v6;
            uint64_t v10 = (uint64_t)NSIntegerFromString(v7, 5uLL);
            id v32 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            unint64_t v11 = 0LL;
            double v37 = 0LL;
            double v12 = (double)(v10 / 20);
            double v13 = 0.0;
            double v14 = 10000.0;
            double v15 = 0.0;
            double v16 = 0.0;
            do
            {
              if (v11 <= 2)
              {
                double v13 = dbl_1FAAA0[v11];
                uint64_t v36 = (uint64_t)*(&off_24E730 + v11);
                double v37 = *(Class *)((char *)&self->super.super.isa + *off_24E718[v11]);
              }

              unint64_t v17 = v10 / 20 - *(void *)&self->mNeedsMoreSlides;
              else {
                unint64_t v18 = v17;
              }
              id v19 = [v37 objectAtIndex:v18];
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              __int128 v41 = 0u;
              __int128 v42 = 0u;
              id v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = 0LL;
                uint64_t v23 = *(void *)v40;
                do
                {
                  BOOL v24 = 0LL;
                  int v25 = (double *)(v36 + 24 + 32 * v22);
                  do
                  {
                    if (*(void *)v40 != v23) {
                      objc_enumerationMutation(v19);
                    }
                    if (NSIntegerFromString(*(void **)(*((void *)&v39 + 1) + 8LL * (void)v24), 5uLL) == (void *)v10)
                    {
                      double v26 = *((float *)v25 - 4) + v12 * 160.0;
                      if (v26 < v14)
                      {
                        double v16 = *v25;
                        double v14 = *((float *)v25 - 4) + v12 * 160.0;
                      }

                      double v27 = v26 + 30.0 + v13 * 30.0;
                      if (v27 >= v15) {
                        double v15 = v27;
                      }
                    }

                    BOOL v24 = (char *)v24 + 1;
                    v25 += 4;
                  }

                  while (v21 != v24);
                  v22 += (uint64_t)v21;
                  id v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
                }

                while (v21);
              }

              ++v11;
            }

            while (v11 != 3);
            [*(id *)((char *)&self->mIterationOffset + 1) setObject:v32 forKey:v34];
            double v28 = fmax(v14 - v16, 0.0);
            [v33 setShowTime:v28];
            [v33 setShowDuration:v15 - v28];
            uint64_t v5 = v29;
            id v4 = v30;
            id v6 = v35;
          }

          id v6 = (char *)v6 + 1;
        }

        while (v6 != v4);
        id v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
      }

      while (v4);
    }
  }

- (void)_bestTimeInfoFor:(id)a3 time:(double)a4 start:(double *)a5 end:(double *)a6
{
  id v9 = [*(id *)((char *)&self->mIterationOffset + 1) objectForKey:a3];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        double v16 = *(double *)(v15 + 16);
        if (v16 >= a4)
        {
        }

        else if (v16 <= a4 && *(double *)(v15 + 24) > a4)
        {
          goto LABEL_17;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    if (v12)
    {
      double v16 = *(double *)(v12 + 16);
      uint64_t v15 = v12;
LABEL_17:
      *a5 = v16;
      *a6 = *(double *)(v15 + 24);
    }
  }

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  id v9 = -[MREffectFloating initWithEffectID:](objc_alloc(&OBJC_CLASS___MREffectFloating), "initWithEffectID:", a3);
  -[MREffect setAttributes:](v9, "setAttributes:", a4);
  -[MREffectFloating setTotalImages:](v9, "setTotalImages:", [a5 count]);
  -[MREffectFloating _orderImages](v9, "_orderImages");
  -[MREffectFloating _mainDurationForImageCount:](v9, "_mainDurationForImageCount:", [a5 count]);
  -[MREffectFloating setPhaseInDuration:mainDuration:phaseOutDuration:]( v9,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  0.0,  v10,  0.0);
  return v9;
}

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  __int128 v19 = 0LL;
  unint64_t v4 = 0LL;
  unint64_t v17 = a3 / 0x14;
  double v5 = (double)(a3 / 0x14);
  double v6 = 1000000.0;
  do
  {
    if (v4 <= 2)
    {
      uint64_t v18 = (uint64_t)*(&off_24E730 + v4);
      __int128 v19 = *(Class *)((char *)&self->super.super.isa + *off_24E718[v4]);
    }

    unint64_t v7 = v17 - *(void *)&self->mNeedsMoreSlides;
    else {
      unint64_t v8 = v7;
    }
    id v9 = [v19 objectAtIndex:v8];
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v22;
      do
      {
        double v14 = 0LL;
        uint64_t v15 = (float *)(v18 + 8 + 32 * v12);
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          if (NSIntegerFromString(*(void **)(*((void *)&v21 + 1) + 8LL * (void)v14), 5uLL) == (void *)a3
            && *v15 + v5 * 160.0 < v6)
          {
            double v6 = *v15 + v5 * 160.0;
          }

          double v14 = (char *)v14 + 1;
          v15 += 8;
        }

        while (v11 != v14);
        v12 += (uint64_t)v11;
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v11);
    }

    ++v4;
  }

  while (v4 != 3);
  return v6 + -3.5;
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  __int128 v23 = 0LL;
  unint64_t v4 = 0LL;
  unint64_t v21 = a3 / 0x14;
  float v5 = (float)(a3 / 0x14);
  double v6 = 0.0;
  double v7 = 100000.0;
  double v8 = 0.0;
  do
  {
    if (v4 <= 2)
    {
      double v8 = dbl_1FAAA0[v4];
      uint64_t v22 = (uint64_t)*(&off_24E730 + v4);
      __int128 v23 = *(Class *)((char *)&self->super.super.isa + *off_24E718[v4]);
    }

    unint64_t v9 = v21 - *(void *)&self->mNeedsMoreSlides;
    else {
      unint64_t v10 = v9;
    }
    id v11 = [v23 objectAtIndex:v10];
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v26;
      do
      {
        double v16 = 0LL;
        unint64_t v17 = (float *)(v22 + 8 + 32 * v14);
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v11);
          }
          if (NSIntegerFromString(*(void **)(*((void *)&v25 + 1) + 8LL * (void)v16), 5uLL) == (void *)a3)
          {
            double v18 = (float)(*v17 + (float)(v5 * 160.0));
            if (v7 > v18) {
              double v7 = (float)(*v17 + (float)(v5 * 160.0));
            }
            double v19 = v18 + 30.0 + v8 * 30.0;
            if (v19 > v6) {
              double v6 = v19;
            }
          }

          double v16 = (char *)v16 + 1;
          v17 += 8;
        }

        while (v13 != v16);
        v14 += (uint64_t)v13;
        id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v13);
    }

    ++v4;
  }

  while (v4 != 3);
  return v6 - v7 + -3.5;
}

- (double)lowestDisplayTime
{
  return (float)((float)*(uint64_t *)&self->mNeedsMoreSlides * 160.0);
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  double v6 = v5;
  -[MREffectFloating showDurationForSlideAtIndex:](self, "showDurationForSlideAtIndex:", a3);
  return v6 + v7 * 0.5;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (void)_orderImages
{
  uint64_t v4 = (*(void *)(&self->super._isInInteractiveMode + 1) + 19LL) / 20;
  __int128 v23 = (void **)((char *)&self->mTotalImages + 1);
  uint64_t v5 = (uint64_t)[*(id *)((char *)&self->mTotalImages + 1) count] + *(void *)&self->mNeedsMoreSlides;
  uint64_t v6 = (uint64_t)objc_msgSend( +[MURandom randomGeneratorWithSeed:]( MURandom,  "randomGeneratorWithSeed:",  self->super.mSeed),  "randomInt");
  __int128 v24 = self;
  else {
    uint64_t v7 = *(void *)(&self->super._isInInteractiveMode + 1);
  }
  uint64_t v21 = v4;
  if (v5 < v4)
  {
    uint64_t v8 = v6 % 15;
    do
    {
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v22 = v5;
      uint64_t v12 = 20 * v5;
      do
      {
        if (v9)
        {
          if (v9 == 1)
          {
            id v13 = &OBJC_IVAR___MREffectFloating_mMiddleSlideOrder;
            v2 = (char *)&unk_1FA5E0;
            uint64_t v11 = 18LL;
          }

          else
          {
            if (v9 != 2)
            {
              id v15 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
              if (v11 < 1) {
                goto LABEL_19;
              }
              goto LABEL_15;
            }

            id v13 = &OBJC_IVAR___MREffectFloating_mBackSlideOrder;
            v2 = (char *)&unk_1FA820;
            uint64_t v11 = 20LL;
          }

          uint64_t v14 = (void **)((char *)&v24->super.super.isa + *v13);
        }

        else
        {
          uint64_t v14 = v23;
          v2 = (char *)&unk_1FA460;
          uint64_t v11 = 12LL;
        }

        unint64_t v10 = *v14;
        id v15 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v21);
LABEL_15:
        uint64_t v16 = 16LL;
        uint64_t v17 = v11;
        do
        {
          uint64_t v18 = *(void *)&v2[v16];
          BOOL v19 = v18 < v8;
          uint64_t v20 = v18 - v8;
          if (v19) {
            v20 += 20LL;
          }
          [v15 addObject:ImageKey(v20 % v7 + v12)];
          v16 += 32LL;
          --v17;
        }

        while (v17);
LABEL_19:
        objc_msgSend(v10, "addObject:", v15, v21);
        ++v9;
      }

      while (v9 != 3);
      uint64_t v5 = v22 + 1;
    }

    while (v22 + 1 < v21);
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!*(void *)((char *)&self->mVBO + 1))
  {
    for (id i = a4; ; id i = *(id *)((char *)&self->mVBO + 1))
    {
      id v10 = [i baseContext];
      *(void *)((char *)&self->mVBO + 1) = v10;
      if (v10 == [v10 baseContext]) {
        break;
      }
    }

    id v11 = *(id *)((char *)&self->mVBO + 1);
  }

  if (BYTE1(self->mBackSlideOrder))
  {
    -[MREffectFloating _applySizeScript](self, "_applySizeScript");
    -[MREffectFloating _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
    BYTE1(self->mBackSlideOrder) = 0;
  }

  double v12 = a3 + 3.5;
  if (!BYTE2(self->mBackSlideOrder))
  {
    float v13 = v12 / 160.0;
    float v14 = floorf(v13);
    uint64_t v15 = *(void *)&self->mNeedsMoreSlides;
    if ((unint64_t)[*(id *)((char *)&self->mTotalImages + 1) count] + v15 - 1 <= vcvtms_s32_f32(v13)
      && v12 + v14 * -160.0 > 80.0)
    {
      BYTE2(self->mBackSlideOrder) = 1;
    }
  }

  if (-[MRLayer isActivated](self->super.mEffectLayer, "isActivated"))
  {
    double v17 = fmod(v12, 63.0);
    if (v17 >= 59.5 != -[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended")) {
      -[MRLayerEffect suspendAsynchronousOperations:]( self->super.mEffectLayer,  "suspendAsynchronousOperations:",  v17 >= 59.5);
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MREffectFloating;
  -[MREffect prerenderForTime:inContext:withArguments:](&v19, "prerenderForTime:inContext:withArguments:", a4, a5, a3);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v202 = a5;
  id v5 = a4;
  [a4 depthTest:1];
  double v8 = a3 + 3.5;
  [v5 localAspectRatio];
  float v10 = v9;
  float v11 = a3 + 3.5;
  float v13 = fmodf(v11, 63.0);
  if (v13 >= 60.0)
  {
    double v15 = (v13 + -60.0) / 3.0;
    -[MREffectFloating _rotationForRelative:directionFactor:](self, "_rotationForRelative:directionFactor:", v15, 1.0);
    double v14 = v16;
    id v12 = -[MREffectFloating _zTranslationForRelativeTime:](self, "_zTranslationForRelativeTime:", v15);
    double v176 = v17;
    if (v14 < 90.0 || v14 > 270.0)
    {
      BOOL v18 = v14 >= 450.0;
      if (v14 > 630.0) {
        BOOL v18 = 0;
      }
    }

    else
    {
      BOOL v18 = 1;
    }

    BOOL v193 = v18;
  }

  else
  {
    BOOL v193 = 0;
    double v176 = 0.0;
    double v14 = 0.0;
  }

  double v175 = v14;
  double v186 = a3;
  double v19 = v10;
  uint64_t v185 = 241LL;
  if (!*(NSMutableDictionary **)((char *)&self->mSlideTimes + 1))
  {
    *(Class *)((char *)&self->super.super.isa + v185) = (Class)calloc(0x8980uLL, 1uLL);
    id v20 = [v5 createVBO];
    *(_DWORD *)((char *)&self->mVBOData + 1) = (_DWORD)v20;
    id v12 = [v5 uploadBuffer:0 withSize:35200 toVertexBuffer2D:v20 usage:35044];
  }

  v177 = &v175;
  __chkstk_darwin(v12);
  v199 = &v174;
  uint64_t v207 = (uint64_t)(v8 / 160.0);
  float v21 = v8;
  float v22 = fmodf(v21, 160.0);
  uint64_t v23 = 0LL;
  uint64_t v188 = 0LL;
  CGFloat width = 0.0;
  int v181 = 0;
  v197 = 0LL;
  v198 = 0LL;
  v196 = 0LL;
  double v24 = v22;
  double v25 = v8 - ((double)(uint64_t)(v8 / 160.0) + -1.0) * 160.0;
  uint64_t v26 = 2LL;
  double v180 = 1.0 / v19;
  double v190 = 0.0;
  *(double *)&uint64_t v179 = 1.01999998;
  *(double *)&uint64_t v178 = 0.959999979;
  double v184 = 0.00999999978;
  double v27 = 1.0;
  __int128 v28 = &qword_1FA000;
  v208 = self;
  double v200 = v10;
  do
  {
    unint64_t v29 = v26;
    if (!v26)
    {
      uint64_t v188 = 0LL;
      double v34 = &OBJC_IVAR___MREffectFloating_mFrontSlideOrder;
      double v33 = *(double *)&v178;
      uint64_t v30 = v179;
      double v35 = (float *)&unk_1FA460;
      double v190 = 2.0;
      uint64_t v205 = 12LL;
      double v31 = v186;
LABEL_19:
      double v32 = *(double *)((char *)&self->super.super.isa + *v34);
      double v27 = *(double *)&v30;
      goto LABEL_21;
    }

    *(double *)&uint64_t v30 = 1.20000005;
    double v31 = v186;
    if (v26 == 1)
    {
      double v190 = 1.60000002;
      double v33 = 0.816000005;
      double v34 = &OBJC_IVAR___MREffectFloating_mMiddleSlideOrder;
      double v35 = (float *)&unk_1FA5E0;
      uint64_t v188 = 456LL;
      uint64_t v36 = 18LL;
      goto LABEL_18;
    }

    double v32 = width;
    if (v26 == 2)
    {
      double v190 = 1.5;
      double v33 = 0.671999974;
      double v34 = &OBJC_IVAR___MREffectFloating_mBackSlideOrder;
      double v35 = (float *)&unk_1FA820;
      uint64_t v188 = 1140LL;
      uint64_t v36 = 20LL;
LABEL_18:
      uint64_t v205 = v36;
      goto LABEL_19;
    }

    uint64_t v205 = v23;
    double v33 = 0.959999979;
    double v35 = v187;
LABEL_21:
    CGFloat width = v32;
    double v37 = v27 * 30.0 + 30.0;
    double v195 = v33 * v19;
    double v191 = (v33 * v19 + 2.0 + 2.0 - (-2.0 - v33 * v19)) / v37;
    double v192 = -2.0 - v33 * v19;
    double v38 = v191 * v31;
    [v5 localAspectRatio];
    *(double *)&v199[v29] = v38 / v39;
    *(void *)&CGFloat height = 225LL;
    uint64_t v40 = *(void *)&self->mNeedsMoreSlides;
    __int128 v41 = (char *)[*(id *)&v32 count] + v40;
    unint64_t v194 = v29;
    v187 = v35;
    if ((uint64_t)v41 < v207)
    {
      uint64_t v23 = v205;
    }

    else
    {
      uint64_t v23 = v205;
      if (v205 >= 1)
      {
        unint64_t v42 = 0LL;
        __int128 v43 = 0LL;
        __int128 v44 = v35 + 1;
        unint64_t v209 = v188 + 14 * v205;
        double v45 = 0.0;
        unint64_t v46 = v188;
        unint64_t v47 = v188 + 4 * v205;
        double v182 = v195 / v19;
        double v183 = v33;
        double v189 = v27;
        v201 = v41;
        do
        {
          _NF = v37 <= v24 || v25 < v45;
          double v49 = v24;
          uint64_t v50 = v207;
          if (!_NF)
          {
            if (v25 < v37 + v45 && v207 > 0) {
              double v49 = v25;
            }
            else {
              double v49 = v24;
            }
            uint64_t v50 = v207 - ((v25 < v37 + v45) & (v207 > 0));
          }

          if (v50 >= (uint64_t)v41)
          {
            if ((uint64_t)v41 < 1)
            {
              v71 = v43;
            }

            else
            {
              uint64_t v64 = *(uint64_t *)((char *)&v208->super.super.isa + *(void *)&height);
              unint64_t v206 = v42;
              v65 = v41;
              id v66 = v5;
              v67 = v28;
              v68 = v44;
              v69 = v43;
              id v70 = [*(id *)&width count];
              uint64_t v173 = v64;
              self = v208;
              NSLog(@"Floating Exception trying to get slide order!!!, %d %d %d", v50, v173, v70);
              __int128 v44 = v68;
              __int128 v28 = v67;
              id v5 = v66;
              __int128 v41 = v65;
              uint64_t v23 = v205;
              unint64_t v42 = v206;
              v71 = v69;
            }

            goto LABEL_48;
          }

          v51 = v43;
          unint64_t v206 = (unint64_t)v44;
          v52 = v28;
          id v53 = v5;
          CGFloat v54 = width;
          unint64_t v55 = v50 - *(unint64_t *)((char *)&self->super.super.isa + *(void *)&height);
          if (v55 >= (unint64_t)[*(id *)&width count]
            || (id v56 = [*(id *)&v54 objectAtIndex:v55], v49 < v45))
          {
            v71 = v51;
            self = v208;
            uint64_t v23 = v205;
            id v5 = v53;
          }

          else
          {
            id v5 = v53;
            if (v49 < v37 + v45)
            {
              v57 = v56;
              __int128 v28 = v52;
              if (v42 < (unint64_t)[v56 count])
              {
                id v58 = [v57 objectAtIndex:v42];
                v59 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( v208->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  v58);
                -[MRSlideProvider imageAspectRatio](v59, "imageAspectRatio");
                double v61 = v19;
                __int128 v41 = v201;
                if (v60 <= v19)
                {
                  double v61 = v60;
                  if (v60 < v180) {
                    double v61 = v180;
                  }
                }

                if (v61 >= 1.0)
                {
                  double v62 = v183;
                  double v63 = v195 / v61;
                }

                else
                {
                  double v62 = v182 * v61;
                  double v63 = v195;
                }

                double v73 = v184 + *(float *)(v206 - 4) * v190;
                double v74 = v192 - v45 * v191 + (float)((float)v50 * -160.0) * v191;
                v71 = objc_alloc_init(&OBJC_CLASS___MRFloatingRenderable);
                v71->provider = v59;
                v71->size.CGFloat width = v62;
                v71->size.CGFloat height = v63;
                double v75 = v200;
                v71->double aspectRatio = v62 / v63 * v200;
                float v76 = 0.0199999996 / v71->size.width;
                v71->double shadowWidth = (float)((float)(v76 * 2.0) + 1.0);
                double v77 = (float)(v76 + v76) * v71->aspectRatio + 1.0;
                v71->double shadowHeight = v77;
                double shadowWidth = v71->shadowWidth;
                self = v208;
                double v79 = 1.0 / (v62 * shadowWidth * v208->super.mPixelSize.width);
                double v80 = 1.0 / (v63 * v77 * v208->super.mPixelSize.height);
                double v81 = 1.0 / shadowWidth;
                double v82 = v79 + (1.0 - 1.0 / shadowWidth) * 0.5;
                double v83 = 1.0 / v77;
                double v84 = v80 + (1.0 - 1.0 / v77) * 0.5;
                float v85 = v82 * 2.0 + -1.0;
                float v86 = v84 * 2.0 + -1.0;
                float v87 = v73;
                double v88 = v74 / v75;
                double v19 = v75;
                float v89 = v88;
                float v90 = v62 * 0.5;
                float v91 = v63 * 0.5 / v75;
                float v92 = v87 - v90;
                float v93 = v87 + v90;
                float v94 = v89 - v91;
                float v95 = v89 + v91;
                v71->bottomLeft.x = (float)(v87 - v90);
                v71->bottomLeft.y = (float)(v89 - v91);
                v71->topRight.x = (float)(v87 + v90);
                v71->topRight.y = (float)(v89 + v91);
                v71->vboOffsetPlain = v46;
                v71->vboOffsetSoft = v47;
                float v96 = v87 + (float)(v90 * v85);
                v71->vboOffsetShadow = v209;
                uint64_t v97 = *(uint64_t *)((char *)&self->super.super.isa + v185);
                float v98 = v89 + (float)(v91 * v86);
                v99 = (float *)(v97 + 16 * v71->vboOffsetPlain);
                if (*v99 != v96 || v99[1] != v98)
                {
                  float *v99 = v96;
                  v99[1] = v98;
                  float v100 = (v82 + v81 + v79 * -2.0) * 2.0 + -1.0;
                  v99[2] = v85;
                  v99[3] = v86;
                  float v101 = (v84 + v83 + v80 * -2.0) * 2.0 + -1.0;
                  float v102 = v89 + (float)(v91 * v101);
                  v99[4] = v96;
                  v99[5] = v102;
                  float v103 = v87 + (float)(v90 * v100);
                  v99[6] = v85;
                  v99[7] = v101;
                  v99[8] = v103;
                  v99[9] = v98;
                  v99[10] = v100;
                  v99[11] = v86;
                  v99[12] = v103;
                  v99[13] = v102;
                  v99[14] = v100;
                  v99[15] = v101;
                  uint64_t v104 = v97 + 16 * v71->vboOffsetSoft;
                  *(float *)uint64_t v104 = v92;
                  *(float *)(v104 + 4) = v94;
                  __asm { FMOV            V17.2S, #-1.0 }

                  *(void *)(v104 + 8) = _D17;
                  *(float *)(v104 + 16) = v96;
                  *(float *)(v104 + 20) = v98;
                  *(float *)(v104 + 24) = v85;
                  *(float *)(v104 + 28) = v86;
                  *(float *)(v104 + 32) = v93;
                  *(float *)(v104 + 36) = v94;
                  *(void *)(v104 + 40) = 0xBF8000003F800000LL;
                  *(float *)(v104 + 48) = v103;
                  *(float *)(v104 + 52) = v98;
                  *(float *)(v104 + 56) = v100;
                  *(float *)(v104 + 60) = v86;
                  *(float *)(v104 + 64) = v93;
                  *(float *)(v104 + 68) = v95;
                  __asm { FMOV            V22.2S, #1.0 }

                  *(void *)(v104 + 72) = _D22;
                  *(float *)(v104 + 80) = v103;
                  *(float *)(v104 + 84) = v102;
                  *(float *)(v104 + 88) = v100;
                  *(float *)(v104 + 92) = v101;
                  *(float *)(v104 + 96) = v92;
                  *(float *)(v104 + 100) = v95;
                  *(void *)(v104 + 104) = 0x3F800000BF800000LL;
                  *(float *)(v104 + 112) = v96;
                  *(float *)(v104 + 116) = v102;
                  *(float *)(v104 + 120) = v85;
                  *(float *)(v104 + 124) = v101;
                  *(float *)(v104 + 128) = v92;
                  *(float *)(v104 + 132) = v94;
                  *(void *)(v104 + 136) = _D17;
                  *(float *)(v104 + 144) = v96;
                  *(float *)(v104 + 148) = v98;
                  *(float *)(v104 + 152) = v85;
                  *(float *)(v104 + 156) = v86;
                  uint64_t v109 = v97 + 16 * v71->vboOffsetShadow;
                  *(float *)uint64_t v109 = v92;
                  *(float *)(v109 + 4) = v94;
                  *(void *)(v109 + 8) = _D17;
                  *(float *)(v109 + 16) = v96;
                  *(float *)(v109 + 20) = v98;
                  *(float *)(v109 + 24) = v85;
                  *(float *)(v109 + 28) = v86;
                  *(float *)(v109 + 32) = v92;
                  *(float *)(v109 + 36) = v98;
                  *(_DWORD *)(v109 + 40) = -1082130432;
                  *(float *)(v109 + 44) = v86;
                  *(float *)(v109 + 48) = v96;
                  *(float *)(v109 + 52) = v102;
                  *(float *)(v109 + 56) = v85;
                  *(float *)(v109 + 60) = v101;
                  *(float *)(v109 + 64) = v92;
                  *(float *)(v109 + 68) = v102;
                  *(_DWORD *)(v109 + 72) = -1082130432;
                  *(float *)(v109 + 76) = v101;
                  *(float *)(v109 + 80) = v92;
                  *(float *)(v109 + 84) = v95;
                  *(void *)(v109 + 88) = 0x3F800000BF800000LL;
                  *(float *)(v109 + 96) = v92;
                  *(float *)(v109 + 100) = v95;
                  *(void *)(v109 + 104) = 0x3F800000BF800000LL;
                  *(float *)(v109 + 112) = v96;
                  *(float *)(v109 + 116) = v102;
                  *(float *)(v109 + 120) = v85;
                  *(float *)(v109 + 124) = v101;
                  *(float *)(v109 + 128) = v96;
                  *(float *)(v109 + 132) = v95;
                  *(float *)(v109 + 136) = v85;
                  *(_DWORD *)(v109 + 140) = 1065353216;
                  *(float *)(v109 + 144) = v103;
                  *(float *)(v109 + 148) = v102;
                  *(float *)(v109 + 152) = v100;
                  *(float *)(v109 + 156) = v101;
                  *(float *)(v109 + 160) = v103;
                  *(float *)(v109 + 164) = v95;
                  *(float *)(v109 + 168) = v100;
                  *(_DWORD *)(v109 + 172) = 1065353216;
                  *(float *)(v109 + 176) = v93;
                  *(float *)(v109 + 180) = v95;
                  *(void *)(v109 + 184) = _D22;
                  *(float *)(v109 + 192) = v93;
                  *(float *)(v109 + 196) = v95;
                  *(void *)(v109 + 200) = _D22;
                  *(float *)(v109 + 208) = v103;
                  *(float *)(v109 + 212) = v102;
                  *(float *)(v109 + 216) = v100;
                  *(float *)(v109 + 220) = v101;
                  *(float *)(v109 + 224) = v93;
                  *(float *)(v109 + 228) = v102;
                  *(_DWORD *)(v109 + 232) = 1065353216;
                  *(float *)(v109 + 236) = v101;
                  *(float *)(v109 + 240) = v103;
                  *(float *)(v109 + 244) = v98;
                  *(float *)(v109 + 248) = v100;
                  *(float *)(v109 + 252) = v86;
                  *(float *)(v109 + 256) = v93;
                  *(float *)(v109 + 260) = v98;
                  *(_DWORD *)(v109 + 264) = 1065353216;
                  *(float *)(v109 + 268) = v86;
                  *(float *)(v109 + 272) = v93;
                  *(float *)(v109 + 276) = v94;
                  *(void *)(v109 + 280) = 0xBF8000003F800000LL;
                  *(float *)(v109 + 288) = v93;
                  *(float *)(v109 + 292) = v94;
                  *(void *)(v109 + 296) = 0xBF8000003F800000LL;
                  *(float *)(v109 + 304) = v103;
                  *(float *)(v109 + 308) = v98;
                  *(float *)(v109 + 312) = v100;
                  *(float *)(v109 + 316) = v86;
                  *(float *)(v109 + 320) = v103;
                  *(float *)(v109 + 324) = v94;
                  *(float *)(v109 + 328) = v100;
                  *(_DWORD *)(v109 + 332) = -1082130432;
                  *(float *)(v109 + 336) = v96;
                  *(float *)(v109 + 340) = v98;
                  *(float *)(v109 + 344) = v85;
                  *(float *)(v109 + 348) = v86;
                  *(float *)(v109 + 352) = v96;
                  *(float *)(v109 + 356) = v94;
                  *(float *)(v109 + 360) = v85;
                  *(_DWORD *)(v109 + 364) = -1082130432;
                  *(float *)(v109 + 368) = v92;
                  *(float *)(v109 + 372) = v94;
                  int v181 = 1;
                  *(void *)(v109 + 376) = _D17;
                }

                uint64_t v23 = v205;
                __int128 v44 = (float *)v206;
                double v27 = v189;
                if (v51)
                {
                  v51->next = v71;
                  v71->next = 0LL;
                }

                else
                {
                  v111 = v196;
                  v110 = v197;
                  if (v194 == 1) {
                    v112 = v71;
                  }
                  else {
                    v112 = v197;
                  }
                  if (v194 >= 2) {
                    v111 = v71;
                  }
                  if (v194) {
                    v110 = v112;
                  }
                  v196 = v111;
                  v197 = v110;
                  v113 = v198;
                  if (!v194) {
                    v113 = v71;
                  }
                  v198 = v113;
                }

                goto LABEL_48;
              }

              v71 = v51;
              self = v208;
              uint64_t v23 = v205;
              goto LABEL_46;
            }

            v71 = v51;
            self = v208;
            uint64_t v23 = v205;
          }

          __int128 v28 = v52;
LABEL_46:
          __int128 v41 = v201;
          __int128 v44 = (float *)v206;
LABEL_48:
          float v72 = *v44;
          v44 += 8;
          ++v42;
          v46 += 4LL;
          double v45 = v45 + (float)(v72 / *((float *)v28 + 278));
          v209 += 24LL;
          v47 += 10LL;
          __int128 v43 = v71;
        }

        while (v23 != v42);
      }
    }

    uint64_t v26 = v194 - 1;
  }

  while (v194);
  if ((v181 & 1) != 0) {
    [v5 uploadBuffer:*(Class *)((char *)&self->super.super.isa + v185) withSize:35200 toVertexBuffer2D:*(unsigned int *)((char *)&self->mVBOData + 1) usage:35048];
  }
  MRMatrix_Clear((uint64_t)v213);
  if (v175 != 0.0)
  {
    float v114 = v175;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)v213, v114, 0.0, 0.0);
  }

  float v115 = v176 + -1.39999998;
  *(float *)&double v116 = MRMatrix_Translate(v213, 0.0, 0.0, v115);
  objc_msgSend(v5, "composeModelViewMatrix:saveTo:", v213, v212, v116);
  [v5 setShader:@"PlainTextureNoColor"];
  uint64_t v117 = 2LL;
  [v5 setVertexBuffer2D:*(unsigned int *)((char *)&self->mVBOData + 1) withStride:4 inSpriteCoordinatesOffset:0x7FFFFFFFFFFFFFFFLL texture0CoordinatesOffset:2];
  BOOL v118 = v193;
  if (v193) {
    uint64_t v117 = 0LL;
  }
  LODWORD(v207) = !v193;
  if (v193) {
    uint64_t v119 = 1LL;
  }
  else {
    uint64_t v119 = -1LL;
  }
  unint64_t v206 = v119;
  LODWORD(v205) = 1068708659;
  uint64_t v120 = v117;
  double v121 = v186;
  do
  {
    if (v120) {
      BOOL v122 = 0;
    }
    else {
      BOOL v122 = v118;
    }
    char v123 = v207;
    if (v120 != 2) {
      char v123 = 0;
    }
    if (v122) {
      char v124 = 1;
    }
    else {
      char v124 = v123;
    }
    v125 = v197;
    if (v120 != 1) {
      v125 = v196;
    }
    if (v120) {
      float v126 = flt_1FA440[v120 == 1];
    }
    else {
      float v126 = *(float *)&v205;
    }
    if (v120) {
      v127 = v125;
    }
    else {
      v127 = v198;
    }
    MRMatrix_Clear((uint64_t)v215);
    float v128 = *(double *)&v199[v120];
    *(float *)&double v129 = MRMatrix_Translate(v215, 0.0, v128, v126);
    objc_msgSend(v5, "composeModelViewMatrix:saveTo:", v215, v214, v129);
    for (*(float *)&double v130 = MRMatrix_MultiplyWithMatrix( (float *)[v5 modelViewMatrix],  (float *)objc_msgSend(v5, "projectionMatrix"),  v211); v127; v127 = v127->next)
    {
      MRMatrix_ProjectPoint(v211, v127->bottomLeft.x, v127->bottomLeft.y);
      double v132 = v131;
      double v130 = MRMatrix_ProjectPoint(v211, v127->topRight.x, v127->topRight.y);
      if (v132 < 1.0 && v133 > -1.0)
      {
        id v135 = -[MRSlideProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( v127->provider,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  v5,  v202,  v121);
        if (v135)
        {
          v136 = v135;
          [v135 setMipmapFiltersNearest:1];
          [v136 scale];
          double v138 = v137;
          if ((v124 & 1) == 0)
          {
            double shadowHeight = v127->shadowWidth;
            if (shadowHeight >= v127->shadowHeight) {
              double shadowHeight = v127->shadowHeight;
            }
            [v136 setScale:v138 / shadowHeight];
          }

          [v136 scale];
          v127->scale = v140;
          -[MRFloatingRenderable setSlide:](v127, "setSlide:", v136);
          [v136 releaseByUser];
          double aspectRatio = v127->aspectRatio;
          *(float *)&double aspectRatio = aspectRatio;
          [v5 setImage:v136 onTextureUnit:0 withReferenceAspectRatio:&v210 state:aspectRatio];
          [v5 drawTriangleStripFromOffset:v127->vboOffsetPlain count:4];
          [v5 unsetImage:v136 onTextureUnit:0 state:&v210];
          [v136 setScale:v138];
        }
      }
    }

    objc_msgSend(v5, "restoreModelViewMatrix:", v214, v130);
    v120 += v206;
    BOOL v142 = v120 < 3;
    BOOL v118 = v193;
    if (!v193) {
      BOOL v142 = v120 >= 0;
    }
  }

  while (v142);
  [v5 unsetShader];
  [v5 setShader:@"FragmentFloatingSoft"];
  CGFloat height = CGSizeZero.height;
  CGFloat width = CGSizeZero.width;
  *(double *)&unint64_t v209 = 0.0199999996;
  while (2)
  {
    if (v117) {
      BOOL v143 = 0;
    }
    else {
      BOOL v143 = v118;
    }
    int v144 = v207;
    if (v117 != 2) {
      int v144 = 0;
    }
    if (v143) {
      int v145 = 1;
    }
    else {
      int v145 = v144;
    }
    v146 = v197;
    if (v117 != 1) {
      v146 = v196;
    }
    if (v117) {
      float v147 = flt_1FA440[v117 == 1];
    }
    else {
      float v147 = *(float *)&v205;
    }
    if (v117) {
      v148 = v146;
    }
    else {
      v148 = v198;
    }
    MRMatrix_Clear((uint64_t)v215);
    float v149 = *(double *)&v199[v117];
    *(float *)&double v150 = MRMatrix_Translate(v215, 0.0, v149, v147);
    objc_msgSend(v5, "composeModelViewMatrix:saveTo:", v215, v214, v150);
    if (v148)
    {
      double v151 = height;
      double v152 = width;
      while (1)
      {
        v153 = -[MRFloatingRenderable slide](v148, "slide");
        if (v153) {
          break;
        }
LABEL_146:
        next = v148->next;

        v148 = next;
        if (!next) {
          goto LABEL_147;
        }
      }

      v154 = v153;
      double v155 = v148->size.width;
      double v156 = v148->size.height;
      if (v145)
      {
        double v157 = 0.150000006;
        _ZF = v152 == v155 && v151 == v156;
        double v159 = 0.150000006;
        v160 = &OBJC_IVAR___MRFloatingRenderable_vboOffsetSoft;
        uint64_t v161 = 10LL;
        uint64_t v162 = 10LL;
        if (!_ZF)
        {
LABEL_143:
          double v166 = v155 * v208->super.mPixelSize.width * v157;
          *(float *)&double v166 = v166;
          double v167 = v156 * v208->super.mPixelSize.height * v159;
          *(float *)&double v167 = v167;
          [v5 setShaderUniformVec2:@"invRadii" :v166 forKey:v167];
          uint64_t v162 = v161;
        }
      }

      else
      {
        double v157 = v148->shadowWidth;
        double v155 = v155 * v157;
        double v159 = v148->shadowHeight;
        double v156 = v156 * v159;
        if (v152 != v155 || v151 != v156)
        {
          double v164 = *(double *)&v209 / v155;
          *(float *)&double v164 = *(double *)&v209 / v155;
          *(float *)&double v164 = *(float *)&v164 * 1.2;
          double v165 = v155 * v200 / v156 * *(float *)&v164;
          *(float *)&double v165 = v165;
          *(float *)&double v164 = 1.0 / *(float *)&v164;
          *(float *)&double v165 = 1.0 / *(float *)&v165;
          *(float *)&double v157 = v157;
          *(float *)&double v159 = v159;
          [v5 setShaderUniformVec4:@"shadow" :v157 :v159 :v164 forKey:v165];
          double v157 = 0.300000012;
          double v159 = 0.224999994;
          v160 = &OBJC_IVAR___MRFloatingRenderable_vboOffsetShadow;
          uint64_t v161 = 24LL;
          goto LABEL_143;
        }

        v160 = &OBJC_IVAR___MRFloatingRenderable_vboOffsetShadow;
        uint64_t v162 = 24LL;
      }

      -[MRImage scale](v154, "scale", v157, v159);
      double v169 = v168;
      -[MRImage setScale:](v154, "setScale:", v148->scale);
      double v170 = v148->aspectRatio;
      *(float *)&double v170 = v170;
      [v5 setImage:v154 onTextureUnit:0 withReferenceAspectRatio:v211 state:v170];
      [v5 drawTriangleStripFromOffset:*(Class *)((char *)&v148->super.super.isa + *v160) count:v162];
      [v5 unsetImage:v154 onTextureUnit:0 state:v211];
      -[MRImage setScale:](v154, "setScale:", v169);
      -[MRFloatingRenderable setSlide:](v148, "setSlide:", 0LL);
      double v151 = v156;
      double v152 = v155;
      goto LABEL_146;
    }

- (double)_zTranslationForRelativeTime:(double)a3
{
  double v3 = a3 * 3.0;
  if (v3 < 0.75)
  {
    double v4 = v3 * 4.0 / 3.0;
    double v5 = -0.550000012;
LABEL_9:
    double v10 = v4 * (v4 * v5);
    return v4 * v10;
  }

  if (v3 >= 1.5)
  {
    BOOL v8 = v3 < 2.25;
    double v9 = v3 * 4.0 / 3.0;
    if (!v8)
    {
      double v4 = v9 + -4.0;
      double v5 = 0.550000012;
      goto LABEL_9;
    }

    double v6 = v9 + -2.0;
    double v7 = -0.5;
  }

  else
  {
    double v6 = v3 * 4.0 / 3.0 + -2.0;
    double v7 = 0.5;
  }

  double v4 = v6 * (v6 * v7) * v6 + 1.0;
  double v10 = -1.10000002;
  return v4 * v10;
}

- (double)_rotationForRelative:(double)a3 directionFactor:(double)a4
{
  double v4 = a3 * 3.0;
  double v5 = (a4 + a4) * 180.0;
  BOOL v6 = v4 < 1.5;
  double v7 = v5
     * ((v4 + -3.0 + v4 + -3.0) / 3.0 * ((v4 + -3.0 + v4 + -3.0) / 3.0 * 0.5) * ((v4 + -3.0 + v4 + -3.0) / 3.0) + 1.0);
  double result = (v4 + v4) / 3.0 * ((v4 + v4) / 3.0 * ((v4 + v4) / 3.0 * (v5 * 0.5)));
  if (!v6) {
    return v7;
  }
  return result;
}

- (int64_t)totalImages
{
  return *(void *)(&self->super._isInInteractiveMode + 1);
}

- (void)setTotalImages:(int64_t)a3
{
  *(void *)(&self->super._isInInteractiveMode + 1) = a3;
}

- (void)_unload
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  *(void *)&self->mNeedsMoreSlides = 0LL;
  BYTE1(self->mBackSlideOrder) = 0;
  if (*(_DWORD *)((char *)&self->mVBOData + 1))
  {
    objc_msgSend(*(id *)((char *)&self->mVBO + 1), "deleteVBO:");
    *(_DWORD *)((char *)&self->mVBOData + 1) = 0;
    double v3 = *(NSMutableDictionary **)((char *)&self->mSlideTimes + 1);
    if (v3)
    {
      free(v3);
      *(NSMutableDictionary **)((char *)&self->mSlideTimes + 1) = 0LL;
    }
  }

  *(void *)((char *)&self->mVBO + 1) = 0LL;
}

@end