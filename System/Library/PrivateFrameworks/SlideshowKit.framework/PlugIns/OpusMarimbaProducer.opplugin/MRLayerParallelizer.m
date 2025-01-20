@interface MRLayerParallelizer
- (BOOL)_isMadeOpaqueBySublayers;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRLayerParallelizer)initWithParameters:(id)a3;
- (MRLayerParallelizer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (NSArray)sublayers;
- (const)backgroundColor;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)phaseInSublayerForKey:(id)a3;
- (double)phaseOutSublayerForKey:(id)a3;
- (id)_createSublayerForPlug:(id)a3;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)sublayerForKey:(id)a3;
- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4;
- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (void)_deleteSublayer:(id)a3;
- (void)_executeLayerCommandQueue;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_observeSublayer:(id)a3;
- (void)_observeSublayerOnPreactivate:(id)a3;
- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_unobserveSublayer:(id)a3;
- (void)_unobserveSublayerOnDepreactivate:(id)a3;
- (void)_updateSublayersOrdering;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)depreactivate:(BOOL)a3;
- (void)endMorphing;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preactivate;
- (void)removeSublayer:(id)a3;
- (void)setBackgroundColor:(const float *)a3;
- (void)setBackgroundColorRed:(float)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (void)setDuration:(double)a3;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setNeedsUpdateForPluggerOfSublayer:(id)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setSublayer:(id)a3 forKey:(id)a4;
- (void)synchronizeTime;
@end

@implementation MRLayerParallelizer

- (MRLayerParallelizer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  v5 = -[MRLayer initWithPlug:andParameters:inSuperlayer:](&v8, "initWithPlug:andParameters:inSuperlayer:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->mContainer = (MCContainerParallelizer *)-[MCPlug container](v5->super.mPlug, "container");
    v6->mSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v6->mSublayersForPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6->mNeedsToUpdateSublayersOrdering = 0;
    if (!v6->super.mIsReadonly) {
      -[MRLayerParallelizer _observePlug](v6, "_observePlug");
    }
    -[MRLayerParallelizer observeValueForKeyPath:ofObject:change:context:]( v6,  "observeValueForKeyPath:ofObject:change:context:",  @"plugs",  v6->mContainer,  0LL,  0LL);
  }

  return v6;
}

- (MRLayerParallelizer)initWithParameters:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  v3 = -[MRLayer initWithParameters:](&v5, "initWithParameters:", a3);
  if (v3)
  {
    v3->mSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->mSublayersForPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v3;
}

- (void)cleanup
{
  if (self->super.mUUID)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    id v4 = -[NSMutableArray copy](self->mSublayers, "copy");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_super v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          -[MRLayerParallelizer _deleteSublayer:](self, "_deleteSublayer:", v8);
        }

        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }

    self->mSublayersForPlugs = 0LL;
    self->mSublayers = 0LL;
    objc_sync_exit(mSublayers);
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
    -[MRLayer cleanup](&v10, "cleanup");
    p_mContainer = &self->mContainer;

    *p_mContainer = 0LL;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6 = a6;
  id v7 = a5;
  id v28 = a5;
  v29 = a6;
  if ([a3 isEqualToString:@"plugs"])
  {
    __int128 v11 = (char *)objc_msgSend(objc_msgSend(v7, "objectForKey:", NSKeyValueChangeKindKey), "unsignedIntegerValue");
    if (v11 == (_BYTE *)&dword_0 + 2)
    {
      v21 = (NSSet *)[v7 objectForKey:NSKeyValueChangeNewKey];
    }

    else
    {
      if (v11 == (_BYTE *)&dword_0 + 3)
      {
        id v12 = [v7 objectForKey:NSKeyValueChangeOldKey];
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v36;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v36 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
              id v18 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  objc_msgSend(v17, "objectID", v28, v29));
              if (([v18 isScheduledForDestruction] & 1) == 0)
              {
                -[MRLayerParallelizer _unobserveSublayer:](self, "_unobserveSublayer:", v18);
                [v18 scheduleForDestruction];
                -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 1LL, v17);
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }

          while (v14);
        }

        goto LABEL_34;
      }

      v21 = -[MCContainerParallelizer plugs](self->mContainer, "plugs");
    }

    v22 = v21;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v23 = -[NSSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL,  v28,  v29);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        }

        id v24 = -[NSSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v24);
    }

    goto LABEL_34;
  }

  if ([a3 isEqualToString:@"plugAsParallel.container"])
  {
    id v19 = [a4 plugAsParallel];
    if (([a4 isScheduledForDestruction] & 1) == 0)
    {
      -[MRLayerParallelizer _unobserveSublayer:](self, "_unobserveSublayer:", a4);
      [a4 scheduleForDestruction];
      -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 1LL, v19);
    }

    if (objc_msgSend(v19, "container", v28, v29)) {
      -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 0LL, v19);
    }
  }

  else
  {
    if (([a3 isEqualToString:@"zOrderedPlugs"] & 1) != 0
      || [a3 isEqualToString:@"plugAsParallel.zIndex"])
    {
      uint64_t v20 = 256LL;
    }

    else
    {
      uint64_t v20 = 257LL;
    }

    *((_BYTE *)&self->super.super.isa + v20) = 1;
  }

- (void)setPixelSize:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer setPixelSize:](&v13, "setPixelSize:", a3.width, a3.height);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setNeedsToUpdateGeometry:1];
        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
    }

    while (v6);
  }

- (const)backgroundColor
{
  if (self->mBackgroundColor[3] >= 0.0) {
    return self->mBackgroundColor;
  }
  else {
    return 0LL;
  }
}

- (BOOL)hasSomethingToRender
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  LODWORD(v3) = -[MRLayer hasSomethingToRender](&v13, "hasSomethingToRender");
  if ((_DWORD)v3)
  {
    if (self->mBackgroundColor[3] > 0.0 || !self->super.mSuperlayer)
    {
LABEL_13:
      LOBYTE(v3) = 1;
      return (char)v3;
    }

    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    mSublayers = self->mSublayers;
    id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = *(void *)v10;
LABEL_6:
      uint64_t v7 = 0LL;
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mSublayers);
        }
        if (v5 == (id)++v7)
        {
          id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
          LOBYTE(v3) = 0;
          if (v5) {
            goto LABEL_6;
          }
          return (char)v3;
        }
      }
    }
  }

  return (char)v3;
}

- (void)synchronizeTime
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer synchronizeTime](&v3, "synchronizeTime");
  -[NSMutableArray enumerateObjectsUsingBlock:](self->mSublayers, "enumerateObjectsUsingBlock:", &stru_24DC00);
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  mSublayers = self->mSublayers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_497F4;
  v5[3] = &unk_24DC20;
  *(double *)&v5[4] = a3;
  *(double *)&v5[5] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](mSublayers, "enumerateObjectsUsingBlock:", v5);
}

- (void)endMorphing
{
}

- (void)setDuration:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer setDuration:](&v7, "setDuration:");
  mSublayers = self->mSublayers;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_49924;
  v6[3] = &unk_24DC60;
  *(double *)&v6[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](mSublayers, "enumerateObjectsUsingBlock:", v6);
}

- (void)setBackgroundColor:(const float *)a3
{
  *(_OWORD *)self->mBackgroundColor = *(_OWORD *)a3;
}

- (void)setBackgroundColorRed:(float)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  float v6 = a4;
  self->mBackgroundColor[0] = a3;
  self->mBackgroundColor[1] = v6;
  float v7 = a5;
  float v8 = a6;
  self->mBackgroundColor[2] = v7;
  self->mBackgroundColor[3] = v8;
}

- (void)preactivate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer preactivate](&v3, "preactivate");
  self->mNeedsToUpdateBackgroundColor = self->mContainer != 0LL;
}

- (void)deactivate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer deactivate](&v3, "deactivate");
}

- (void)depreactivate:(BOOL)a3
{
  BOOL v3 = a3;
  mSublayers = self->mSublayers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_49B34;
  v7[3] = &unk_24DCA8;
  v7[4] = self;
  BOOL v8 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](mSublayers, "enumerateObjectsUsingBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer depreactivate:](&v6, "depreactivate:", v3);
}

- (BOOL)isLoadedForTime:(double)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  unsigned int v5 = -[MRLayer isLoadedForTime:](&v20, "isLoadedForTime:");
  if (v5)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    mSublayers = self->mSublayers;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        [v11 timeIn];
        double v13 = v12;
        if ([v11 isPreactivated])
        {
          double v14 = a3 - v13;
          if ([v11 shouldBeActivatedAtTime:v14])
          {
            unsigned int v5 = [v11 isLoadedForTime:v14];
            if (!v5) {
              break;
            }
          }
        }

        if (v8 == (id)++v10)
        {
          id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (BOOL)_isMadeOpaqueBySublayers
{
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    double v8 = width / height;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v9);
        if ([v10 isOpaque])
        {
          id v11 = [v10 plugAsParallel];
          [v11 rotationAngle];
          if (v12 == 0.0)
          {
            [v11 xRotationAngle];
            if (v13 == 0.0)
            {
              [v11 yRotationAngle];
              if (v14 == 0.0)
              {
                [v11 opacity];
                if (v15 >= 1.0)
                {
                  [v11 zPosition];
                  if (v16 >= 0.0 && ![v11 countOfAnimationPaths])
                  {
                    [v11 position];
                    double v18 = v17;
                    double v20 = v19;
                    [v11 sizeForParentAspectRatio:v8];
                    double v23 = v18 - v22 * 0.5;
                    double v24 = v18 + v22 * 0.5;
                    BOOL v25 = v23 > -1.0 || v24 < -1.0;
                    double v26 = v20 - v21 * 0.5;
                    double v27 = v20 + v21 * 0.5;
                    BOOL v28 = v25 || v26 > -1.0;
                    if (!v28 && v27 >= -1.0)
                    {
                      LOBYTE(v5) = 1;
                      return (char)v5;
                    }
                  }
                }
              }
            }
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
      id v6 = v5;
    }

    while (v5);
  }

  return (char)v5;
}

- (BOOL)isOpaque
{
  if (self->mBackgroundColor[3] == 1.0) {
    return 1;
  }
  else {
    return -[MRLayerParallelizer _isMadeOpaqueBySublayers](self, "_isMadeOpaqueBySublayers");
  }
}

- (BOOL)isAlphaFriendly
{
  BOOL v3 = (char *)-[NSMutableArray count](self->mSublayers, "count");
  if (!v3)
  {
LABEL_5:
    LOBYTE(v5) = 1;
    return v5;
  }

  if (v3 != (_BYTE *)&dword_0 + 1)
  {
    LOBYTE(v5) = 0;
    return v5;
  }

  id v4 = -[NSMutableArray lastObject](self->mSublayers, "lastObject");
  unsigned int v5 = [v4 isAlphaFriendly];
  if (v5)
  {
    if (([v4 isOpaque] & 1) == 0)
    {
      LOBYTE(v5) = self->mBackgroundColor[3] <= 0.0;
      return v5;
    }

    goto LABEL_5;
  }

  return v5;
}

- (BOOL)isInfinite
{
  if (self->mBackgroundColor[3] <= 0.0) {
    return !-[MCPlugParallel clipsContainer](self->super.mPlugAsParallel, "clipsContainer");
  }
  else {
    return 0;
  }
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v7 = self;
  if (self->super.mLayerCommandQueueNeedsAttention) {
    -[MRLayerParallelizer _executeLayerCommandQueue](self, "_executeLayerCommandQueue");
  }
  v57.receiver = v7;
  v57.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  unsigned int v52 = -[MRLayer prerenderForTime:inContext:withArguments:]( &v57,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  if (v7->mNeedsToUpdateBackgroundColor)
  {
    v7->mNeedsToUpdateBackgroundColor = 0;
    double v8 = -[MCContainerParallelizer backgroundColor](v7->mContainer, "backgroundColor");
    if (-[MCContainerParallelizer backgroundColor](v7->mContainer, "backgroundColor"))
    {
      Components = CGColorGetComponents(v8);
      if (Components)
      {
        uint64_t v10 = (float64x2_t *)Components;
        switch(CGColorGetNumberOfComponents(v8))
        {
          case 1uLL:
            float v11 = v10->f64[0];
            mBackgroundColor = v7->mBackgroundColor;
            v7->mBackgroundColor[1] = v11;
            v7->mBackgroundColor[2] = v11;
            v7->mBackgroundColor[0] = v11;
            goto LABEL_11;
          case 2uLL:
            double v14 = v10->f64[1];
            float v15 = v10->f64[0];
            mBackgroundColor = v7->mBackgroundColor;
            v7->mBackgroundColor[1] = v15;
            v7->mBackgroundColor[2] = v15;
            v7->mBackgroundColor[0] = v15;
            goto LABEL_13;
          case 3uLL:
            mBackgroundColor = v7->mBackgroundColor;
            *(float32x2_t *)v7->mBackgroundColor = vcvt_f32_f64(*v10);
            float v16 = v10[1].f64[0];
            v7->mBackgroundColor[2] = v16;
LABEL_11:
            float v13 = 1.0;
            goto LABEL_14;
          case 4uLL:
            mBackgroundColor = v7->mBackgroundColor;
            *(float32x2_t *)v7->mBackgroundColor = vcvt_f32_f64(*v10);
            double v14 = v10[1].f64[1];
            float v17 = v10[1].f64[0];
            v7->mBackgroundColor[2] = v17;
LABEL_13:
            float v13 = v14;
            goto LABEL_14;
          default:
            goto LABEL_15;
        }
      }
    }

    mBackgroundColor = v7->mBackgroundColor;
    float v13 = -1.0;
LABEL_14:
    mBackgroundColor[3] = v13;
  }

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mPixelSize.width <= 0.0 || self->super.mPixelSize.height <= 0.0) {
    return 0LL;
  }
  if (-[NSMutableArray count](self->mSublayers, "count") != (char *)&dword_0 + 1
    || (id v9 = -[NSMutableArray lastObject](self->mSublayers, "lastObject"),
        objc_msgSend(objc_msgSend(v9, "clock"), "externalTime"),
        (id result = objc_msgSend(v9, "patchworkAtTime:inContext:withArguments:", a4, a5)) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
    return -[MRLayer patchworkAtTime:inContext:withArguments:]( &v11,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }

  return result;
}

- (void)setNeedsUpdateForPluggerOfSublayer:(id)a3
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  objc_msgSend(objc_msgSend(a3, "parentHelper"), "setNeedsUpdate:", 1);
  objc_sync_exit(mSublayers);
}

- (BOOL)hasAudio
{
  BOOL v3 = -[MCAudioPlaylist songs](-[MCContainer audioPlaylist](self->mContainer, "audioPlaylist"), "songs");
  if (!v3 || !-[NSSet count](v3, "count"))
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    mSublayers = self->mSublayers;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (!v4) {
      return (char)v4;
    }
    id v6 = v4;
    uint64_t v7 = *(void *)v11;
LABEL_6:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mSublayers);
      }
      if (v6 == (id)++v8)
      {
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        LOBYTE(v4) = 0;
        if (v6) {
          goto LABEL_6;
        }
        return (char)v4;
      }
    }
  }

  LOBYTE(v4) = 1;
  return (char)v4;
}

- (id)sublayerForKey:(id)a3
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->mSublayers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v10, "idInSupercontainer"), "isEqualToString:", a3))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:
  objc_sync_exit(mSublayers);
  return v11;
}

- (void)setSublayer:(id)a3 forKey:(id)a4
{
  id v10 = -[MCObject _initWithObjectID:]( [MCPlugParallel alloc],  "_initWithObjectID:",  [a3 uuid]);
  [a3 setIdInSupercontainer:a4];
  [v10 setIDInSupercontainer:a4];
  if (self->super.mIsActivated) {
    id v7 = &dword_0 + 1;
  }
  else {
    id v7 = [a3 isActivated];
  }
  [v10 setIsTriggered:v7];
  if (!self->super.mIsActivated) {
    [a3 setTimeIn:0.0];
  }
  [v10 setPreactivatesWithParent:1];
  [v10 setLoopDuration:1.0e10];
  [a3 _setPlug:v10 andSuperlayer:self];
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___MRParallelPlugger);
  [a3 setParentHelper:v8];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[NSMutableArray addObject:](self->mSublayers, "addObject:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", a3, [a3 uuid]);
  -[MRLayerParallelizer _observeSublayer:](self, "_observeSublayer:", a3);
  objc_sync_exit(mSublayers);
}

- (void)removeSublayer:(id)a3
{
  id v5 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[MRLayerParallelizer _unobserveSublayer:](self, "_unobserveSublayer:", a3);
  [a3 _setPlug:0 andSuperlayer:0];
  [a3 setParentHelper:0];
  -[NSMutableArray removeObject:](self->mSublayers, "removeObject:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->mSublayersForPlugs, "removeObjectForKey:", [a3 uuid]);
  objc_sync_exit(mSublayers);
  id v7 = a3;
}

- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  id v8 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", a3);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = self->mSublayers;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
LABEL_7:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        __int128 v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector(v14, "sublayerForPlugObjectID:recursive:") & 1) != 0)
        {
          id v8 = [v14 sublayerForPlugObjectID:a3 recursive:1];
          if (v8) {
            break;
          }
        }

        if (v11 == (id)++v13)
        {
          id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
          id v8 = 0LL;
          if (v11) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  id v15 = v8;
  objc_sync_exit(mSublayers);
  return v8;
}

- (BOOL)hasSlides
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  mSublayers = self->mSublayers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSublayers);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)v6);
        if ([v7 isActivated] && (objc_msgSend(v7, "hasSlides") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (BOOL)isInInteractiveMode
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  mSublayers = self->mSublayers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSublayers);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)v6);
        if ([v7 isActivated]
          && ([v7 isInInteractiveMode] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

- (id)currentSlideInfoForElement:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mSublayers = self->mSublayers;
  id result = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mSublayers);
      }
      __int128 v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      if ([v9 isActivated])
      {
        id result = [v9 currentSlideInfoForElement:a3];
        if (result) {
          break;
        }
      }

      if (v6 == (id)++v8)
      {
        id result = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }

  return result;
}

- (id)currentSlideInfos
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  mSublayers = self->mSublayers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_3:
  uint64_t v6 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(mSublayers);
    }
    uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
    if ([v7 isActivated])
    {
      id v8 = [v7 currentSlideInfos];
      if (v8)
      {
        __int128 v9 = v8;
        if ([v8 count]) {
          return v9;
        }
      }
    }

    if (v4 == (id)++v6)
    {
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v4) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  BOOL v6 = a6;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  mSublayers = self->mSublayers;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v14);
        if ([v15 isActivated]
          && ([v15 getStartTime:a3 andDuration:a4 forMovingToElementID:a5 backwards:v6] & 1) != 0)
        {
          LOBYTE(v11) = 1;
          return (char)v11;
        }

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      id v12 = v11;
      if (v11) {
        continue;
      }
      break;
    }
  }

  return (char)v11;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  mSublayers = self->mSublayers;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v14);
        if ([v15 isActivated])
        {
          [v15 timeIn];
          if ([v15 hasMoreSlidesFromTime:v8 backwards:a5 startTime:a6 duration:a3 - v16])
          {
            if (a5)
            {
              [v15 timeIn];
              *a5 = v17 + *a5;
            }

            if (a6)
            {
              [v15 timeIn];
              *a6 = v18 + *a6;
            }

            LOBYTE(v11) = 1;
            return (char)v11;
          }
        }

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      id v12 = v11;
      if (v11) {
        continue;
      }
      break;
    }
  }

  return (char)v11;
}

- (double)interestingTimeForTime:(double)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v10 isActivated] && (objc_msgSend(v10, "hasSlides") & 1) != 0)
        {
          [v10 timeIn];
          [v10 interestingTimeForTime:a3 - v11];
          double v13 = v12;
          [v10 timeIn];
          return v13 + v14;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  return v6;
}

- (double)interestingTimeForElement:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v10 isActivated] && (objc_msgSend(v10, "hasSlides") & 1) != 0)
        {
          [v10 interestingTimeForElement:a3];
          double v12 = v11;
          [v10 timeIn];
          return v12 + v13;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  return v6;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  mSublayers = self->mSublayers;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v15 isActivated] && objc_msgSend(v15, "hasSlides"))
        {
          [v15 timeIn];
          [v15 getLazyDuration:a3 lazyFactor:a4 animationDuration:a5 fromInterestingTime:a6 - v16];
          return;
        }
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v12) {
        continue;
      }
      break;
    }
  }

- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  if (self->super.mIsActivated)
  {
    BOOL v6 = a4;
    double x = a3.x;
    if (self->super.mRenderingState->var18) {
      double y = -a3.y;
    }
    else {
      double y = a3.y;
    }
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    id v11 = -[NSMutableArray copy](self->mSublayers, "copy");
    objc_sync_exit(mSublayers);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (!v12)
    {
      BOOL v33 = 0LL;
      goto LABEL_38;
    }

    BOOL v33 = 0LL;
    uint64_t v13 = *(void *)v36;
    int64_t v14 = 0x8000000000000000LL;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if ([v16 isActivated])
        {
          __int128 v17 = (float *)[v16 renderingState];
          __int128 v18 = v17;
          if (v17)
          {
            if (*((_BYTE *)v17 + 240))
            {
              MRMatrix_MultiplyWithMatrix(v17 + 28, v17 + 44, v40);
              double v19 = x;
              double v20 = y;
              if (MRMatrix_Invert(v40, v39))
              {
                double v19 = MRMatrix_UnprojectPoint(v39, x, y);
                double v22 = v21;
                [v16 pixelSize];
                double v24 = v23;
                [v16 pixelSize];
                double v20 = v22 * (v24 / v25);
              }

              if (([v16 isInfinite] & 1) != 0
                || (v43.origin.double x = -1.0,
                    v43.origin.double y = -1.0,
                    v43.size.double width = 2.0,
                    v43.size.double height = 2.0,
                    v42.double x = v19,
                    v42.double y = v20,
                    CGRectContainsPoint(v43, v42)))
              {
                int v27 = *((unsigned __int8 *)v18 + 242);
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v26);
                if ((objc_opt_isKindOfClass(v16, v28) & 1) != 0)
                {
                  v34.double x = v19;
                  v34.double y = v20;
                  id v29 = v16;
                  if (!v16) {
                    continue;
                  }
                }

                else
                {
                  if (v27) {
                    double v30 = v20;
                  }
                  else {
                    double v30 = y;
                  }
                  if (v27) {
                    double v31 = v19;
                  }
                  else {
                    double v31 = x;
                  }
                  id v29 = objc_msgSend(v16, "sublayerHitAtPoint:onlyIfHitElement:localPoint:", v6, &v34, v31, v30);
                  if (!v29) {
                    continue;
                  }
                }

                if (v14 < (int)objc_msgSend(objc_msgSend(v16, "plugAsParallel"), "zIndex"))
                {
                  if (a5) {
                    *a5 = v34;
                  }
                  int64_t v14 = (int)objc_msgSend(objc_msgSend(v16, "plugAsParallel"), "zIndex");
                  BOOL v33 = v29;
                }
              }
            }
          }
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (!v12)
      {
LABEL_38:

        return v33;
      }
    }
  }

  return 0LL;
}

- (double)phaseInSublayerForKey:(id)a3
{
  id v4 = -[MRLayerParallelizer sublayerForKey:](self, "sublayerForKey:", a3);
  if (!v4) {
    return 0.0;
  }
  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "plugAsParallel"), "isTriggered")
    || [v5 isActivated]
    && !objc_msgSend(objc_msgSend(v5, "plugAsParallel"), "resetsTimeOnTrigger"))
  {
    return 0.0;
  }

  -[MRLayerClock containerTime](self->super.mClock, "containerTime");
  objc_msgSend(v5, "setTimeIn:");
  if ([v5 isActivated])
  {
    [v5 setNeedsToSynchronizeTime:1];
  }

  else
  {
    if (([v5 isPreactivated] & 1) == 0)
    {
      [v5 preactivate];
      -[MRLayerParallelizer _observeSublayerOnPreactivate:](self, "_observeSublayerOnPreactivate:", v5);
    }

    [v5 activate];
  }

  objc_msgSend(objc_msgSend(v5, "plug"), "fullDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(objc_msgSend(v5, "clock"), "setExternalTime:", 0.0);
  objc_msgSend(objc_msgSend(v5, "plug"), "phaseInDuration");
  return result;
}

- (double)phaseOutSublayerForKey:(id)a3
{
  id v4 = -[MRLayerParallelizer sublayerForKey:](self, "sublayerForKey:", a3);
  double v5 = 0.0;
  if (v4)
  {
    BOOL v6 = v4;
    if (objc_msgSend(objc_msgSend(v4, "plugAsParallel"), "isTriggered"))
    {
      if ([v6 isActivated])
      {
        objc_msgSend(objc_msgSend(v6, "plug"), "phaseOutDuration");
        double v5 = v7;
        -[MRLayerClock containerTime](self->super.mClock, "containerTime");
        double v9 = v8;
        [v6 timeIn];
        [v6 setDuration:v5 + v9 - v10];
      }
    }
  }

  return v5;
}

- (id)_currentState
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  id v12 = -[MRLayer _currentState](&v17, "_currentState");
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v9 isActivated])
        {
          id v10 = [v9 _currentState];
          if (objc_msgSend(objc_msgSend(v9, "plugAsParallel"), "isTriggered"))
          {
            [v9 timeIn];
            objc_msgSend( v10,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"timeIn");
          }

          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, [v9 idInSupercontainer]);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v6);
  }

  if (-[NSMutableDictionary count](v3, "count")) {
    [v12 setObject:v3 forKey:@"activatedSublayers"];
  }

  return v12;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  id v5 = -[MRLayer _dumpLayerWithOptions:](&v19, "_dumpLayerWithOptions:");
  if ((a3 & 1) == 0)
  {
    id v6 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v5, 0LL);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    mSublayers = self->mSublayers;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      unint64_t v11 = a3 + 256;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(mSublayers);
          }
          __int128 v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
      }

      while (v9);
    }

    id v5 = -[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", @"\n");
  }

  return v5;
}

- (NSArray)sublayers
{
  return &self->mSublayers->super;
}

- (void)_executeLayerCommandQueue
{
  mLayerCommandQueue = self->super.mLayerCommandQueue;
  objc_sync_enter(mLayerCommandQueue);
  if (-[NSMutableArray count](self->super.mLayerCommandQueue, "count"))
  {
    self->super.mLayerCommandQueueNeedsAttention = 0;
    id v4 = -[NSMutableArray copy](self->super.mLayerCommandQueue, "copy");
    -[NSMutableArray removeAllObjects](self->super.mLayerCommandQueue, "removeAllObjects");
    objc_sync_exit(mLayerCommandQueue);
    if (v4)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
            switch(*(_DWORD *)(v8 + 8))
            {
              case 0:
                -[MRLayerParallelizer _observeSublayer:]( self,  "_observeSublayer:",  -[MRLayerParallelizer _createSublayerForPlug:](self, "_createSublayerForPlug:", *(void *)(v8 + 16)));
                break;
              case 1:
                id v9 = *(void **)(v8 + 16);
                id v10 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [v9 objectID]);
                unint64_t v11 = v10;
                if (v10)
                {
                  if ([v10 isPreactivated])
                  {
                    -[MRLayerParallelizer _unobserveSublayerOnDepreactivate:]( self,  "_unobserveSublayerOnDepreactivate:",  v11);
                    [v11 depreactivate:0];
                  }

                  -[MRLayerParallelizer _unobserveSublayer:](self, "_unobserveSublayer:", v11);
                  -[MRLayerParallelizer _deleteSublayer:](self, "_deleteSublayer:", v11);
                }

                else if ([v9 container])
                {
                  NSLog(@"Consistency error, trying to delete a nil sublayer in parallelizer\n");
                }

                break;
              case 2:
                id v12 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [*(id *)(v8 + 16) objectID]);
                __int128 v13 = v12;
                if (v12)
                {
                  if (([v12 isPreactivated] & 1) == 0)
                  {
                    [v13 preactivate];
                    -[MRLayerParallelizer _observeSublayerOnPreactivate:](self, "_observeSublayerOnPreactivate:", v13);
                  }
                }

                break;
              case 3:
                id v14 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [*(id *)(v8 + 16) objectID]);
                __int128 v15 = v14;
                break;
              default:
                continue;
            }
          }

          id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v5);
      }
    }
  }

  else
  {
    objc_sync_exit(mLayerCommandQueue);
  }

- (void)_updateSublayersOrdering
{
  self->mNeedsToUpdateSublayersOrdering = 0;
  -[NSMutableArray sortUsingComparator:](self->mSublayers, "sortUsingComparator:", &stru_24DCE8);
}

- (id)_createSublayerForPlug:(id)a3
{
  id v5 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:]( &OBJC_CLASS___MRLayer,  "layerWithPlug:andParameters:inSuperlayer:",  a3,  self->super.mParameters,  self);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___MRParallelPlugger);
  -[MRLayer setParentHelper:](v5, "setParentHelper:", v6);
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[NSMutableArray addObject:](self->mSublayers, "addObject:", v5);
  -[NSMutableDictionary setObject:forKey:]( self->mSublayersForPlugs,  "setObject:forKey:",  v5,  [a3 objectID]);
  objc_sync_exit(mSublayers);

  self->mNeedsToUpdateSublayersOrdering = 1;
  return v5;
}

- (void)_deleteSublayer:(id)a3
{
  id v4 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [a3 setParentHelper:0];
  -[NSMutableDictionary removeObjectForKey:]( self->mSublayersForPlugs,  "removeObjectForKey:",  objc_msgSend(objc_msgSend(a3, "plug"), "objectID"));
  -[NSMutableArray removeObject:](self->mSublayers, "removeObject:", a3);
  objc_sync_exit(mSublayers);
  [a3 cleanup];
}

- (void)_observeSublayer:(id)a3
{
  if ([a3 isAdhocLayer])
  {
    id v5 = @"plugAsParallel.zIndex";
  }

  else
  {
    if (self->super.mIsReadonly) {
      return;
    }
    id v5 = @"plugAsParallel.container";
  }

  [a3 addObserver:self forKeyPath:v5 options:0 context:0];
}

- (void)_unobserveSublayer:(id)a3
{
  if (([a3 isScheduledForDestruction] & 1) == 0)
  {
    if ([a3 isAdhocLayer])
    {
      id v5 = @"plugAsParallel.zIndex";
LABEL_7:
      [a3 removeObserver:self forKeyPath:v5];
      return;
    }

    if (!self->super.mIsReadonly)
    {
      id v5 = @"plugAsParallel.container";
      goto LABEL_7;
    }
  }

- (void)_observeSublayerOnPreactivate:(id)a3
{
}

- (void)_unobserveSublayerOnDepreactivate:(id)a3
{
}

- (void)_observePlug
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer _observePlug](&v3, "_observePlug");
  -[MCContainerParallelizer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"plugs",  3LL,  0LL);
  -[MCContainerParallelizer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"zOrderedPlugs",  3LL,  0LL);
}

- (void)_unobservePlug
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer _unobservePlug](&v3, "_unobservePlug");
}

- (void)_observePlugOnPreactivate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer _observePlugOnPreactivate](&v3, "_observePlugOnPreactivate");
  -[MCContainerParallelizer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"backgroundColor",  0LL,  0LL);
  if (self->super.mDoAudio)
  {
    -[MCContainerParallelizer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"audioPlaylist.audioNoVolume",  0LL,  0LL);
    -[MCContainerParallelizer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"audioPlaylist.builtVolume",  0LL,  0LL);
  }

- (void)_unobservePlugOnDepreactivate
{
  if (self->super.mDoAudio)
  {
    -[MCContainerParallelizer removeObserver:forKeyPath:]( self->mContainer,  "removeObserver:forKeyPath:",  self,  @"audioPlaylist.audioNoVolume");
    -[MCContainerParallelizer removeObserver:forKeyPath:]( self->mContainer,  "removeObserver:forKeyPath:",  self,  @"audioPlaylist.builtVolume");
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerParallelizer;
  -[MRLayer _unobservePlugOnDepreactivate](&v3, "_unobservePlugOnDepreactivate");
}

- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3
{
  self->super.mNeedsToRequestRebuildAudio = self->super.mDoAudio;
  if (a3)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    mSublayers = self->mSublayers;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(mSublayers);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) _setNeedsToRequestRebuildAudio:1];
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      }

      while (v5);
    }
  }

- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  HIDWORD(v11) = 0;
  __int128 v32 = xmmword_1F6930;
  mBackgroundColor = self->mBackgroundColor;
  if (self->mBackgroundColor[3] >= 0.0)
  {
    *(float *)&double v5 = self->mBackgroundColor[1];
    *(float *)&double v6 = self->mBackgroundColor[2];
    objc_msgSend( a4,  "setBackColorRed:green:blue:alpha:saveTo:",  &v32,  COERCE_DOUBLE((unint64_t)*(_DWORD *)mBackgroundColor),  v5,  v6);
  }

  if (!self->super.mSuperlayer
    || self->super.mRenderingState->var17
    && -[MRLayerParallelizer isOpaque](self, "isOpaque")
    && !self->super.mRenderingState->var19)
  {
    LODWORD(v11) = 1.0;
    LODWORD(v5) = 1.0;
    LODWORD(v6) = 1.0;
    LODWORD(v7) = 1.0;
    [a4 setForeColorRed:0 green:v11 blue:v5 alpha:v6 saveTo:v7];
    if (mBackgroundColor[3] < 0.0)
    {
      LODWORD(v15) = 0;
      if (self->super.mRenderingState->var19) {
        *(float *)&double v18 = 1.0;
      }
      else {
        *(float *)&double v18 = 0.0;
      }
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      [a4 setBackColorRed:&v32 green:v15 blue:v16 alpha:v17 saveTo:v18];
    }

    if (![a4 dimensionalMode]
      || [a4 dimensionalMode] == 1
      || [a4 dimensionalMode] == 3)
    {
      [a4 clear:3];
    }
  }

  else if (!-[MRLayerParallelizer _isMadeOpaqueBySublayers](self, "_isMadeOpaqueBySublayers") {
         && mBackgroundColor[3] > 0.0)
  }
  {
    id v13 = objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithSize:andColor:",  mBackgroundColor,  1.0,  1.0);
    [v13 setLabel:@"Marimba Parallelizer Background"];
    [v13 setClampMode:2];
    if (mBackgroundColor[3] >= 1.0)
    {
      [a4 setShader:@"PlainTexture"];
      LODWORD(v19) = 0;
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v19);
      [a4 unsetShader];
    }

    else
    {
      [a4 blend:3];
      [a4 setShader:@"PlainTexture"];
      LODWORD(v14) = 0;
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:zRotation:",  v13,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0,  v14);
      [a4 unsetShader];
      [a4 blend:0];
    }

    [v13 releaseByUser];
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  mSublayers = self->mSublayers;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v21)
  {
    id v23 = v21;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(mSublayers);
        }
        uint64_t v26 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if ([v26 hasSomethingToRender])
        {
          objc_msgSend(objc_msgSend(v26, "clock"), "externalTime");
          objc_msgSend(v26, "renderAtTime:inContext:withArguments:", a4, a5);
        }
      }

      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    }

    while (v23);
  }

  LODWORD(v22) = HIDWORD(v32);
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mBackgroundColor = self->mBackgroundColor;
  float v9 = self->mBackgroundColor[3];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  mSublayers = self->mSublayers;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
  if (v11)
  {
    id v12 = v11;
    id v31 = a4;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v38;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(mSublayers);
        }
        double v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        if (objc_msgSend(v16, "hasSomethingToRender", v31))
        {
          if (v13 || v9 > 0.0)
          {
            if (v13) {
              double v16 = v13;
            }
LABEL_23:
            a4 = v31;
            if (!v16) {
              goto LABEL_27;
            }
LABEL_24:
            if (mBackgroundColor[3] < 0.0)
            {
              if (self->super.mRenderingState->var19) {
                mBackgroundColor = (float *)[a4 backColor];
              }
              else {
                mBackgroundColor = 0LL;
              }
            }

            *(_WORD *)&self->super.mRenderingState->var17 = 257;
            id v23 = objc_msgSend( a4,  "beginLocalContextWithSize:backgroundColor:state:",  mBackgroundColor,  v36,  self->super.mPixelSize.width,  self->super.mPixelSize.height);
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            uint64_t v24 = self->mSublayers;
            id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v33;
              do
              {
                for (j = 0LL; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v33 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  __int128 v29 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
                  if ([v29 hasSomethingToRender])
                  {
                    objc_msgSend(objc_msgSend(v29, "clock"), "externalTime");
                    objc_msgSend(v29, "renderAtTime:inContext:withArguments:", v23, a5);
                  }
                }

                id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
              }

              while (v26);
            }

            return [a4 retainedByUserImageByEndingLocalContext:v23 andRestoreState:v36];
          }

          objc_msgSend( objc_msgSend(v16, "plugAsParallel"),  "sizeForParentAspectRatio:",  self->super.mPixelSize.width / self->super.mPixelSize.height);
          if (v18 != 2.0 || v17 != 2.0) {
            goto LABEL_23;
          }
          id v13 = v16;
        }
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
      if (v12) {
        continue;
      }
      break;
    }

    a4 = v31;
    if (v13)
    {
      double v20 = [v13 renderingState];
      v20[244] = self->super.mRenderingState->var19;
      objc_msgSend(objc_msgSend(v13, "clock"), "externalTime");
      id v21 = objc_msgSend(v13, "retainedByUserRenderedImageAtTime:inContext:withArguments:", v31, a5);
      v20[244] = 0;
      if (v21)
      {
        id v22 = v21;
        [v22 releaseByUser];
      }

      goto LABEL_24;
    }
  }

@end