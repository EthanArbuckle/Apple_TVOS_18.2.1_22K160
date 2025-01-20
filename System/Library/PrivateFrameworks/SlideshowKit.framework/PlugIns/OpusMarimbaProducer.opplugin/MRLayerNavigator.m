@interface MRLayerNavigator
- (BOOL)_isNative3D;
- (BOOL)canTransitionToMoreSlides:(BOOL)a3;
- (BOOL)enterSlideFocusModeWithState:(id)a3;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)historyIsEnabled;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)isReadyToTransitionToNextSublayer;
- (BOOL)isTransitioning;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4;
- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4;
- (MRLayer)currentSublayer;
- (MRLayerNavigator)initWithParameters:(id)a3;
- (MRLayerNavigator)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (NSArray)sublayers;
- (double)abortTransition:(id)a3;
- (double)attemptToFinishTransition:(id)a3 didTransition:(BOOL *)a4 gotReversed:(BOOL *)a5;
- (double)currentSlideshowTime;
- (double)doActionTrigger:(id)a3;
- (double)doTransition:(id)a3 backwards:(BOOL)a4 pzr:(id)a5;
- (double)doTransition:(id)a3 backwards:(BOOL)a4 updateHistory:(BOOL)a5 deltaStartTime:(double)a6 pzr:(id)a7;
- (double)doTransition:(id)a3 withDeltaStartTime:(double)a4;
- (double)fastScrubCancel:(id)a3;
- (double)fastScrubEnd:(id)a3;
- (double)fastScrubStart:(id)a3;
- (double)fastScrubUpdate:(id)a3;
- (double)finishTransition:(id)a3;
- (double)forcedTransitionProgress;
- (double)goBack;
- (double)goForth;
- (double)gotoMoreSlidesWithAction:(id)a3 backwards:(BOOL)a4 animate:(BOOL)a5 canCatchCurrentTransition:(BOOL)a6;
- (double)gotoNextOrPreviousSlideInCurrentSublayer:(BOOL)a3;
- (double)gotoNextSublayer:(id)a3 animate:(BOOL)a4;
- (double)gotoPreviousSublayer:(id)a3 animate:(BOOL)a4;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)startMovingCurrentSublayer:(BOOL)a3;
- (double)transitionToNextSublayerWithDeltaStartTime:(double)a3;
- (id)_createSublayerForPlug:(id)a3;
- (id)_createSublayerForPrecomputingWithPlug:(id)a3;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)_transitionWithTransitionTrigger:(id)a3;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)sublayerForKey:(id)a3;
- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4;
- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (void)_createExtraSublayer;
- (void)_deleteSublayer:(id)a3;
- (void)_executeLayerCommandQueue;
- (void)_getInterestingTimesForSublayerControl;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_observeSublayer:(id)a3;
- (void)_precomputeAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_prerenderSublayersAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_registerTransitionForHistory:(id)a3 withDestinationPlugID:(id)a4 backwards:(BOOL)a5;
- (void)_removeExtraSublayer;
- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_resyncToSerializerForTime:(double)a3;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_unobserveSublayer:(id)a3;
- (void)activate;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)depreactivate:(BOOL)a3;
- (void)didFocusOnNextSlideWithState:(id)a3;
- (void)didFocusOnPreviousSlideWithState:(id)a3;
- (void)endMorphing;
- (void)endMovingCurrentSublayer;
- (void)endTransitionToSublayer;
- (void)exitSlideFocusModeWithState:(id)a3;
- (void)fillInNextSlideInformationInState:(id)a3;
- (void)fillInPreviousSlideInformationInState:(id)a3;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)jumpToNextMarker:(id)a3;
- (void)jumpToPreviousMarker:(id)a3;
- (void)jumpToSublayer:(id)mCurrentSublayer atTime:(double)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resyncToSerializer;
- (void)setForcedTransitionProgress:(double)a3;
- (void)setHistoryIsEnabled:(BOOL)a3;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setSublayer:(id)a3 forKey:(id)a4;
- (void)synchronizeTime;
- (void)updateTransition:(id)a3;
@end

@implementation MRLayerNavigator

- (MRLayerNavigator)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  v5 = -[MRLayer initWithPlug:andParameters:inSuperlayer:](&v11, "initWithPlug:andParameters:inSuperlayer:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = -[MCPlug container](v5->super.mPlug, "container");
    v6->mContainer = v7;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCContainerSerializer, v8);
    v6->mIsSerializerBased = objc_opt_isKindOfClass(v7, v9) & 1;
    v6->mSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v6->mSublayersForPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6->mNextSublayer = 0LL;
    v6->mCurrentSublayer = 0LL;
    v6->mCurrentTransition = 0LL;
    v6->mSublayerToPrecompute = 0LL;
    v6->mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
    v6->mForcedTransitionProgress = -1.0;
    v6->mPotentialTargetSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (!v6->super.mIsReadonly) {
      -[MRLayerNavigator _observePlug](v6, "_observePlug");
    }
    -[MRLayerNavigator observeValueForKeyPath:ofObject:change:context:]( v6,  "observeValueForKeyPath:ofObject:change:context:",  @"plugs",  v6->mContainer,  0LL,  0LL);
  }

  return v6;
}

- (MRLayerNavigator)initWithParameters:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  v3 = -[MRLayer initWithParameters:](&v5, "initWithParameters:", a3);
  if (v3)
  {
    v3->mSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->mSublayersForPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3->mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
    v3->mForcedTransitionProgress = -1.0;
    v3->mPotentialTargetSublayers = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }

  return v3;
}

- (void)cleanup
{
  if (self->super.mUUID)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (self->mExtraSublayer) {
      -[MRLayerNavigator _removeExtraSublayer](self, "_removeExtraSublayer");
    }
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
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          -[MRLayerNavigator _unobserveSublayer:](self, "_unobserveSublayer:", v8);
          -[MRLayerNavigator _deleteSublayer:](self, "_deleteSublayer:", v8);
        }

        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }

    self->mSublayersForPlugs = 0LL;
    self->mSublayers = 0LL;
    -[MRTransition releaseByTransitioner:](self->mCurrentTransition, "releaseByTransitioner:", self);
    self->mCurrentTransition = 0LL;

    self->mPotentialTargetSublayers = 0LL;
    objc_sync_exit(mSublayers);
    -[MRLayer cleanup](self->mSublayerToPrecompute, "cleanup");

    self->mSublayerToPrecompute = 0LL;
    self->mHistoryBack = 0LL;

    self->mHistoryForth = 0LL;
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
    -[MRLayer cleanup](&v10, "cleanup");
    p_mContainer = &self->mContainer;

    *p_mContainer = 0LL;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"plugs"])
  {
    __int128 v11 = (char *)objc_msgSend(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeKindKey), "unsignedIntegerValue");
    v26 = a6;
    id v27 = a4;
    if (v11 == (_BYTE *)&dword_0 + 2)
    {
      id v20 = [a5 objectForKey:NSKeyValueChangeNewKey];
    }

    else
    {
      if (v11 == (_BYTE *)&dword_0 + 3)
      {
        id v12 = [a5 objectForKey:NSKeyValueChangeOldKey];
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v34;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
              id v18 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  objc_msgSend(v17, "objectID", v26));
              if (([v18 isScheduledForDestruction] & 1) == 0)
              {
                -[MRLayerNavigator _unobserveSublayer:](self, "_unobserveSublayer:", v18);
                [v18 scheduleForDestruction];
                -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 1LL, v17);
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }

          while (v14);
        }

        goto LABEL_28;
      }

      id v20 = -[MCContainer plugs](self->mContainer, "plugs");
    }

    v21 = v20;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16, a6);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          -[MRLayer _queueLayerCommand:object:]( self,  "_queueLayerCommand:object:",  0LL,  *(void *)(*((void *)&v29 + 1) + 8LL * (void)j));
        }

        id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v23);
    }

    goto LABEL_28;
  }

  v26 = a6;
  id v19 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [a4 objectID]);
  if (([v19 isScheduledForDestruction] & 1) == 0)
  {
    -[MRLayerNavigator _unobserveSublayer:](self, "_unobserveSublayer:", v19);
    [v19 scheduleForDestruction];
    -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 1LL, a4);
  }

  id v27 = a4;
  if ([a4 container]) {
    -[MRLayer _queueLayerCommand:object:](self, "_queueLayerCommand:object:", 0LL, a4);
  }
LABEL_28:
  a6 = v26;
  a4 = v27;
  if (!self->super.mIsPrecomputing)
  {
    -[MRLayer setNeedsUpdateForPluggerOfSublayer:](self->super.mSuperlayer, "setNeedsUpdateForPluggerOfSublayer:", self);
    -[MRLayer stampTime](self, "stampTime");
  }

- (void)setPixelSize:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
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
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setNeedsToUpdateGeometry:1];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
    }

    while (v6);
  }

- (BOOL)hasSomethingToRender
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  BOOL v3 = -[MRLayer hasSomethingToRender](&v6, "hasSomethingToRender");
  if (v3)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    if (mCurrentSublayer && -[MRLayer hasSomethingToRender](mCurrentSublayer, "hasSomethingToRender"))
    {
      LOBYTE(v3) = 1;
    }

    else if (self->mIsTransitioning)
    {
      LOBYTE(v3) = -[MRLayer hasSomethingToRender](self->mNextSublayer, "hasSomethingToRender");
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)synchronizeTime
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer synchronizeTime](&v3, "synchronizeTime");
  if (-[MRLayer isPreactivated](self->mCurrentSublayer, "isPreactivated")) {
    -[MRLayer synchronizeTime](self->mCurrentSublayer, "synchronizeTime");
  }
  if (-[MRLayer isPreactivated](self->mNextSublayer, "isPreactivated")) {
    -[MRLayer synchronizeTime](self->mNextSublayer, "synchronizeTime");
  }
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  if (self->mIsTransitioning) {
    -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
  }
  -[MRLayer beginMorphingToAspectRatio:withDuration:]( self->mCurrentSublayer,  "beginMorphingToAspectRatio:withDuration:",  a3,  a4);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  mPotentialTargetSublayers = self->mPotentialTargetSublayers;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mPotentialTargetSublayers,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(mPotentialTargetSublayers);
        }
        __int128 v12 = *(MRLayer **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (v12 != self->mCurrentSublayer) {
          -[MRLayer beginMorphingToAspectRatio:withDuration:](v12, "beginMorphingToAspectRatio:withDuration:", a3, a4);
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mPotentialTargetSublayers,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v9);
  }

- (void)endMorphing
{
  if (self->mIsTransitioning) {
    -[MRLayer endMorphing](self->mNextSublayer, "endMorphing");
  }
}

- (void)activate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer activate](&v4, "activate");
  mCurrentSublayer = self->mCurrentSublayer;
  if (mCurrentSublayer) {
    -[MRLayer setTimeIn:](mCurrentSublayer, "setTimeIn:", 0.0);
  }
}

- (void)deactivate
{
  if (self->mCurrentTransition) {
    -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
  }
  if (self->mIsInnerTransitioning) {
    -[MRLayerNavigator endMovingCurrentSublayer](self, "endMovingCurrentSublayer");
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges)
  {

    self->mTransitionChanges = 0LL;
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  mSublayers = self->mSublayers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  mSublayerToPrecompute = self->mSublayerToPrecompute;
  if (mSublayerToPrecompute)
  {
    -[MRLayer deactivate](mSublayerToPrecompute, "deactivate");
    -[MRLayer depreactivate:](self->mSublayerToPrecompute, "depreactivate:", 0LL);
    -[MRLayer cleanup](self->mSublayerToPrecompute, "cleanup");

    self->mSublayerToPrecompute = 0LL;
    self->mPrecomputingTarget = 0LL;
    self->mPrecomputingType = 0LL;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer deactivate](&v11, "deactivate");
}

- (void)depreactivate:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  mSublayers = self->mSublayers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer depreactivate:](&v11, "depreactivate:", v3);
}

- (BOOL)isLoadedForTime:(double)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  unsigned int v5 = -[MRLayer isLoadedForTime:](&v21, "isLoadedForTime:");
  if (v5)
  {
    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition
      && -[NSString isEqualToString:]( -[MRTransition transitionID](mCurrentTransition, "transitionID"),  "isEqualToString:",  @"SourceOver")
      || (__int128 v19 = 0u,
          __int128 v20 = 0u,
          __int128 v17 = 0u,
          __int128 v18 = 0u,
          mSublayers = self->mSublayers,
          (id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL)) == 0LL))
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
LABEL_6:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(mSublayers);
        }
        __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        [v12 timeIn];
        double v14 = v13;
        if ([v12 isPreactivated])
        {
          double v15 = a3 - v14;
          if ([v12 shouldBeActivatedAtTime:v15])
          {
            unsigned int v5 = [v12 isLoadedForTime:v15];
            if (!v5) {
              break;
            }
          }
        }

        if (v9 == (id)++v11)
        {
          id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
          LOBYTE(v5) = 1;
          if (v9) {
            goto LABEL_6;
          }
          return v5;
        }
      }
    }
  }

  return v5;
}

- (BOOL)isOpaque
{
  if (!self->mIsTransitioning) {
    return -[MRLayer isOpaque](self->mCurrentSublayer, "isOpaque");
  }
  if (-[MRTransition isOpaque](self->mCurrentTransition, "isOpaque")) {
    return 1;
  }
  if (self->mIsTransitioning) {
    return 0;
  }
  else {
    return -[MRLayer isOpaque](self->mCurrentSublayer, "isOpaque");
  }
}

- (BOOL)isAlphaFriendly
{
  if (!self->mIsTransitioning) {
    return -[MRLayer isAlphaFriendly](self->mCurrentSublayer, "isAlphaFriendly");
  }
  if (-[MRTransition isAlphaFriendly](self->mCurrentTransition, "isAlphaFriendly")) {
    return 1;
  }
  if (self->mIsTransitioning) {
    return 0;
  }
  else {
    return -[MRLayer isAlphaFriendly](self->mCurrentSublayer, "isAlphaFriendly");
  }
}

- (BOOL)isInfinite
{
  return !-[MCPlugParallel clipsContainer](self->super.mPlugAsParallel, "clipsContainer");
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mLayerCommandQueueNeedsAttention) {
    -[MRLayerNavigator _executeLayerCommandQueue](self, "_executeLayerCommandQueue");
  }
  v108.receiver = self;
  v108.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  unsigned int v8 = -[MRLayer prerenderForTime:inContext:withArguments:]( &v108,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
  id v9 = (char *)-[NSMutableArray count](self->mSublayers, "count");
  if (!v9) {
    goto LABEL_44;
  }
  if (v9 == (_BYTE *)&dword_0 + 1 && !self->mExtraSublayer)
  {
    -[MCPlug numberOfLoops](self->super.mPlug, "numberOfLoops");
    if (v10 > 1.0) {
      -[MRLayerNavigator _createExtraSublayer](self, "_createExtraSublayer");
    }
  }

  -[MRLayerClock containerTime](self->super.mClock, "containerTime");
  double v12 = v11;
  mCurrentSublayer = self->mCurrentSublayer;
  mNextSublayer = self->mNextSublayer;
  mCurrentTransition = self->mCurrentTransition;
  id v14 = [a5 forcedState];
  if (!v14)
  {
    id v102 = 0LL;
    goto LABEL_17;
  }

  double v15 = v14;
  id v102 = [v14 objectForKey:@"currentSublayerState"];
  if (self->mIsSerializerBased)
  {
    id v16 = [v15 objectForKey:@"currentSublayerIndex"];
    if (!v16) {
      goto LABEL_17;
    }
    id v17 = -[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", (int)[v16 intValue]);
  }

  else
  {
    id v18 = [v15 objectForKey:@"currentSublayerID"];
    if (!v18) {
      goto LABEL_17;
    }
    id v17 = -[MCContainer plugForID:](self->mContainer, "plugForID:", v18);
  }

  __int128 v19 = v17;
  if (v17)
  {
    -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
    unsigned int v20 = v8;
    mSublayersForPlugs = self->mSublayersForPlugs;
    id v22 = [v19 objectID];
    id v23 = mSublayersForPlugs;
    unsigned int v8 = v20;
    self->mCurrentSublayer = (MRLayer *)-[NSMutableDictionary objectForKey:](v23, "objectForKey:", v22);
    objc_msgSend(objc_msgSend(v102, "objectForKey:", @"timeIn"), "doubleValue");
    -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
    self->mNeedsToUpdatePotentialTargetSublayers = 1;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
  }

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mPixelSize.width <= 0.0 || self->super.mPixelSize.height <= 0.0) {
    return 0LL;
  }
  int mElementToDraw = self->mElementToDraw;
  if (mElementToDraw == 3)
  {
    mCurrentTransition = self->mCurrentTransition;
    -[MRTransition progress](mCurrentTransition, "progress");
    id v11 = -[MRTransition patchworkAtTime:inContext:withArguments:]( mCurrentTransition,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
    -[MRTransition progress](self->mCurrentTransition, "progress");
    self->_previouslyRenderedTransitionProgress = v14;
    if (!v11) {
      goto LABEL_13;
    }
  }

  else
  {
    if (mElementToDraw == 2)
    {
      uint64_t v10 = 30LL;
    }

    else
    {
      if (mElementToDraw != 1)
      {
LABEL_13:
        v16.receiver = self;
        v16.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
        return -[MRLayer patchworkAtTime:inContext:withArguments:]( &v16,  "patchworkAtTime:inContext:withArguments:",  a4,  a5,  a3);
      }

      uint64_t v10 = 62LL;
    }

    Class v15 = (&self->super.super.isa)[v10];
    objc_msgSend(-[objc_class clock](v15, "clock"), "externalTime");
    id v11 = -[objc_class patchworkAtTime:inContext:withArguments:]( v15,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
    if (!v11) {
      goto LABEL_13;
    }
  }

  return v11;
}

- (NSArray)sublayers
{
  if (self->mExtraSublayer) {
    return +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  -[NSMutableArray objectAtIndex:](self->mSublayers, "objectAtIndex:", 0LL));
  }
  else {
    return &self->mSublayers->super;
  }
}

- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  if (!self->super.mIsActivated) {
    return 0LL;
  }
  if (!self->mCurrentSublayer) {
    return 0LL;
  }
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  if (self->mIsTransitioning)
  {
    if (-[MRLayer isActivated](self->mNextSublayer, "isActivated"))
    {
      -[MRLayerClock externalTime](-[MRLayer clock](self->mNextSublayer, "clock"), "externalTime");
      double v11 = v10;
      -[MRRenderer timeQuantum](self->super.mRenderer, "timeQuantum");
      if (v11 > v12 + v12) {
        return 0LL;
      }
    }
  }

  if (self->super.mRenderingState->var18) {
    double y = -y;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, a2);
  if ((objc_opt_isKindOfClass(mCurrentSublayer, v15) & 1) == 0)
  {
    id result = -[MRLayer sublayerHitAtPoint:onlyIfHitElement:localPoint:]( self->mCurrentSublayer,  "sublayerHitAtPoint:onlyIfHitElement:localPoint:",  v7,  &v16,  x,  y);
    if (!a5) {
      return result;
    }
    goto LABEL_16;
  }

  if (!v7
    || (id result = -[MRLayer elementHitAtPoint:localPoint:]( self->mCurrentSublayer,  "elementHitAtPoint:localPoint:",  0LL,  x,  y)) != 0LL)
  {
    id result = self->mCurrentSublayer;
    v16.double x = x;
    v16.double y = y;
    if (a5)
    {
LABEL_16:
      if (result) {
        *a5 = v16;
      }
    }
  }

  return result;
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

- (BOOL)_isNative3D
{
  if (self->mIsFastScrubbing) {
    return 1;
  }
  if (self->mIsTransitioning && self->mCurrentTransition) {
    mCurrentTransition = self->mCurrentTransition;
  }
  else {
    mCurrentTransition = self->mCurrentSublayer;
  }
  return [mCurrentTransition isNative3D];
}

- (id)sublayerForKey:(id)a3
{
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  uint64_t v15 = sub_4FC1C;
  CGPoint v16 = sub_4FC2C;
  uint64_t v17 = 0LL;
  if (a3)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    mContainer = self->mContainer;
    if (mContainer)
    {
      if (self->mIsSerializerBased) {
        id v7 = -[MCContainer plugAtIndex:](mContainer, "plugAtIndex:", (int)[a3 intValue]);
      }
      else {
        id v7 = -[MCContainer plugForID:](self->mContainer, "plugForID:", a3);
      }
      if (v7) {
        id v7 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [v7 objectID]);
      }
      v13[5] = (uint64_t)v7;
    }

    else
    {
      id v9 = self->mSublayers;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_4FC38;
      v11[3] = &unk_24DD10;
      v11[4] = a3;
      v11[5] = &v12;
      -[NSMutableArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v11);
    }

    objc_sync_exit(mSublayers);
    uint64_t v8 = (void *)v13[5];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (void)setSublayer:(id)a3 forKey:(id)a4
{
  id v8 = -[MCObject _initWithObjectID:]( [MCPlugHaven alloc],  "_initWithObjectID:",  [a3 uuid]);
  [a3 setIdInSupercontainer:a4];
  [v8 setIDInSupercontainer:a4];
  [v8 setPreactivatesWithParent:1];
  [v8 setLoopDuration:1.0e10];
  [a3 _setPlug:v8 andSuperlayer:self];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[NSMutableArray addObject:](self->mSublayers, "addObject:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", a3, [a3 uuid]);
  -[MRLayerNavigator _observeSublayer:](self, "_observeSublayer:", a3);
  objc_sync_exit(mSublayers);
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
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v10 = self->mSublayers;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
LABEL_7:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(MRLayer **)(*((void *)&v16 + 1) + 8 * v13);
        if (v14 != self->mExtraSublayer
          && (objc_opt_respondsToSelector( *(void *)(*((void *)&v16 + 1) + 8 * v13),  "sublayerForPlugObjectID:recursive:") & 1) != 0)
        {
          id v8 = -[MRLayer sublayerForPlugObjectID:recursive:](v14, "sublayerForPlugObjectID:recursive:", a3, 1LL);
          if (v8) {
            break;
          }
        }

        if (v11 == (id)++v13)
        {
          id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
    }

    else
    {
LABEL_15:
      id v8 = 0LL;
    }
  }

  objc_sync_exit(mSublayers);
  return v8;
}

- (double)doActionTrigger:(id)a3
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  id v5 = [a3 mcAction];
  if (objc_msgSend(objc_msgSend(v5, "actionKey"), "isEqualToString:", @"gotoNext"))
  {
    -[MRLayerNavigator gotoNextSublayer:animate:](self, "gotoNextSublayer:animate:", a3, 1LL);
  }

  else if (objc_msgSend(objc_msgSend(v5, "actionKey"), "isEqualToString:", @"gotoPrevious"))
  {
    -[MRLayerNavigator gotoPreviousSublayer:animate:](self, "gotoPreviousSublayer:animate:", a3, 1LL);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
    -[MRLayer doActionTrigger:](&v7, "doActionTrigger:", a3);
  }

  return result;
}

- (void)updateTransition:(id)a3
{
  if (self->super.mIsActivated && (self->mCurrentTransition || self->mIsInnerTransitioning))
  {
    id v5 = (double *)[a3 specificObject];
    id v6 = v5;
    if (self->mNextSublayer || self->mIsInnerTransitioning)
    {
      BOOL mTransitionStartedWithNext = self->mTransitionStartedWithNext;
      double v8 = v5[4];
      if (self->mTransitionStartedWithNext) {
        double v8 = -v8;
      }
      double v9 = self->mForcedTransitionProgressOffset + v8 * 0.5 * 1.5;
    }

    else
    {
      BOOL mTransitionStartedWithNext = self->mTransitionStartedWithNext;
      double v14 = v5[4];
      if (mTransitionStartedWithNext == v14 >= 0.0) {
        double v15 = -1.0;
      }
      else {
        double v15 = 1.0;
      }
      double v9 = self->mForcedTransitionProgressOffset + v15 * (sqrt(fabs(v14) * 0.5 * 1.5 + 1.0) + -1.0);
    }

    if (v9 > 1.0) {
      double v9 = 1.0;
    }
    self->double mForcedTransitionProgress = v9;
    double v10 = v5[13];
    if (v10 != -10.0)
    {
      if (mTransitionStartedWithNext) {
        double v10 = -v10;
      }
      double v9 = self->mForcedTransitionProgressOffset + v10;
      if (v9 > 1.0) {
        double v9 = 1.0;
      }
      self->double mForcedTransitionProgress = v9;
    }

    if (self->mTransitionIsSubzero)
    {
      double v9 = -v9;
      self->double mForcedTransitionProgress = v9;
    }

    if (v9 >= 0.0)
    {
      if (v9 > 1.0) {
        self->double mForcedTransitionProgress = 1.0;
      }
    }

    else if (self->mTransitionIsNextPrevious {
           && !-[MRTransition dependsOnFingerPosition](self->mCurrentTransition, "dependsOnFingerPosition"))
    }
    {
      int mTransitionIsSubzero = self->mTransitionIsSubzero;
      int v12 = self->mTransitionStartedWithNext;
      -[MRTransition pzrCancel:](self->mCurrentTransition, "pzrCancel:", [a3 specificObject]);
      self->mTransitionWasAborted = 1;
      double v13 = -self->mForcedTransitionProgress;
      if (self->mIsInnerTransitioning) {
        -[MRLayerNavigator endMovingCurrentSublayer](self, "endMovingCurrentSublayer");
      }
      else {
        -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
      }
      -[MRLayerNavigator gotoMoreSlidesWithAction:backwards:animate:canCatchCurrentTransition:]( self,  "gotoMoreSlidesWithAction:backwards:animate:canCatchCurrentTransition:",  a3,  mTransitionIsSubzero != v12,  1LL,  0LL);
      self->double mForcedTransitionProgress = v13;
      self->BOOL mTransitionStartedWithNext = v12;
      self->int mTransitionIsSubzero = mTransitionIsSubzero ^ 1;
    }

    else
    {
      self->double mForcedTransitionProgress = 0.0;
    }

    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition) {
      -[MRTransition pzrUpdate:](mCurrentTransition, "pzrUpdate:", v6);
    }
  }

- (double)attemptToFinishTransition:(id)a3 didTransition:(BOOL *)a4 gotReversed:(BOOL *)a5
{
  double v9 = (double *)[a3 specificObject];
  double mForcedTransitionProgressOffset = self->mForcedTransitionProgressOffset;
  double v11 = v9[4];
  double v12 = v9[8];
  double v13 = mForcedTransitionProgressOffset + v11 * 0.5 * 1.5;
  double v14 = mForcedTransitionProgressOffset + v11 * -0.5 * 1.5;
  if (self->mTransitionStartedWithNext) {
    double v12 = -v12;
  }
  else {
    double v14 = v13;
  }
  double v15 = v9[13];
  if (v15 != -10.0)
  {
    double v16 = -v15;
    if (!self->mTransitionStartedWithNext) {
      double v16 = v9[13];
    }
    double v12 = v9[14];
    double v17 = mForcedTransitionProgressOffset + v16;
    if (self->mTransitionStartedWithNext) {
      double v12 = -v12;
    }
    double v14 = 1.0;
    if (v17 <= 1.0) {
      double v14 = v17;
    }
  }

  double v18 = -v14;
  if (self->mTransitionIsSubzero) {
    double v12 = -v12;
  }
  else {
    double v18 = v14;
  }
  if (self->mNextSublayer || self->mIsInnerTransitioning)
  {
    BOOL v19 = v18 < 0.35;
    if (v12 >= 4.0) {
      BOOL v19 = 0;
    }
    if (v12 < -0.1) {
      BOOL v19 = 1;
    }
  }

  else
  {
    BOOL v19 = 1;
  }

  if (*((_BYTE *)v9 + 120)) {
    BOOL v19 = v18 < 0.0;
  }
  if (a4) {
    *a4 = !v19;
  }
  if (v19)
  {
    -[MRLayerNavigator abortTransition:](self, "abortTransition:", a3);
  }

  else
  {
    if (a5) {
      *a5 = self->mTransitionIsSubzero;
    }
    -[MRLayerNavigator finishTransition:](self, "finishTransition:", a3);
  }

  return result;
}

- (double)finishTransition:(id)a3
{
  double v3 = 0.0;
  if (!self->super.mIsActivated
    || !self->mCurrentTransition && !self->mIsInnerTransitioning && !self->mTransitionChanges
    || self->mForcedTransitionProgress < 0.0)
  {
    return v3;
  }

  id v6 = (double *)[a3 specificObject];
  BOOL mIsInnerTransitioning = self->mIsInnerTransitioning;
  if (v6)
  {
    double v8 = 1.0;
    if (!self->mIsInnerTransitioning) {
      double v8 = 1.0 / self->mTotalMotionDuration;
    }
    if (v6[13] == -10.0)
    {
      double v10 = v6[8];
      if (self->mTransitionStartedWithNext) {
        double v10 = -v10;
      }
      double v9 = v10 * 0.5 * 1.5;
    }

    else
    {
      double v9 = v6[14];
      if (self->mTransitionStartedWithNext) {
        double v9 = -v9;
      }
    }

    if (v9 >= v8)
    {
      double v8 = v9;
      if (v9 > 5.0) {
        double v8 = 5.0;
      }
    }

    self->double mTotalMotionDuration = 1.0 / v8;
    self->double mTransitionDuration = 1.0 / v8;
    double v3 = (1.0 - self->mForcedTransitionProgress) / v8;
    if (mIsInnerTransitioning) {
      goto LABEL_22;
    }
LABEL_24:
    -[MRLayerClock containerTime](self->super.mClock, "containerTime");
    double v12 = v13 - self->mTotalMotionDuration * self->mForcedTransitionProgress;
    goto LABEL_25;
  }

  if (!self->mIsInnerTransitioning)
  {
    double v3 = self->mTotalMotionDuration * (1.0 - self->mForcedTransitionProgress);
    goto LABEL_24;
  }

  double v3 = 1.0 - self->mForcedTransitionProgress;
LABEL_22:
  -[MRLayerClock containerTime](self->super.mClock, "containerTime");
  double v12 = v11 - self->mForcedTransitionProgress;
LABEL_25:
  self->mTransitionStartTime = v12;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  mCurrentTransition = self->mCurrentTransition;
  if (mCurrentTransition) {
    -[MRTransition pzrEnd:](mCurrentTransition, "pzrEnd:", [a3 specificObject]);
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges) {
    -[MRTransitionChanges setPzr:](mTransitionChanges, "setPzr:", 0LL);
  }
  return v3;
}

- (double)abortTransition:(id)a3
{
  double mForcedTransitionProgress = 0.0;
  if (self->super.mIsActivated
    && (self->mCurrentTransition || self->mIsInnerTransitioning || self->mTransitionChanges)
    && self->mForcedTransitionProgress >= 0.0)
  {
    self->mTransitionWasAborted = 1;
    BOOL mIsInnerTransitioning = self->mIsInnerTransitioning;
    -[MRLayerClock containerTime](self->super.mClock, "containerTime");
    if (mIsInnerTransitioning) {
      double v8 = v7 - (1.0 - self->mForcedTransitionProgress);
    }
    else {
      double v8 = v7 - self->mTotalMotionDuration * (1.0 - self->mForcedTransitionProgress);
    }
    self->mTransitionStartTime = v8;
    if (self->mIsInnerTransitioning) {
      double mForcedTransitionProgress = self->mForcedTransitionProgress;
    }
    else {
      double mForcedTransitionProgress = self->mTotalMotionDuration * self->mForcedTransitionProgress;
    }
    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition) {
      -[MRTransition pzrCancel:](mCurrentTransition, "pzrCancel:", [a3 specificObject]);
    }
    self->double mForcedTransitionProgress = -1.0;
    self->double mForcedTransitionProgressOffset = 0.0;
    -[MCPlug fullDuration](-[MRLayer plug](self->mCurrentSublayer, "plug"), "fullDuration");
    -[MRLayer setDuration:](self->mCurrentSublayer, "setDuration:");
  }

  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges)
  {

    self->mTransitionChanges = 0LL;
  }

  return mForcedTransitionProgress;
}

- (double)doTransition:(id)a3 backwards:(BOOL)a4 updateHistory:(BOOL)a5 deltaStartTime:(double)a6 pzr:(id)a7
{
  if (!self->super.mIsPreactivated) {
    return 0.0;
  }
  BOOL v9 = a5;
  BOOL v10 = a4;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  double v14 = -[MRLayerNavigator sublayerForKey:](self, "sublayerForKey:", [a3 transitionDestinationPlugID]);
  mExtraSublayer = v14;
  if (self->super.mIsActivated && (mCurrentSublayer = self->mCurrentSublayer) != 0LL)
  {
    if (self->mIsTransitioning)
    {
      -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
      mCurrentSublayer = self->mCurrentSublayer;
    }

    if (mExtraSublayer == mCurrentSublayer && self->mExtraSublayer) {
      mExtraSublayer = self->mExtraSublayer;
    }
    if (!-[MRLayer isPreactivated](mExtraSublayer, "isPreactivated")) {
      -[MRLayer preactivate](mExtraSublayer, "preactivate");
    }
    if (a7 && !-[MRLayer hasSlides](mExtraSublayer, "hasSlides")) {
      mExtraSublayer = 0LL;
    }
    double v17 = self->mCurrentSublayer;
    if (mExtraSublayer == v17)
    {
      double v23 = 0.0;
    }

    else
    {
      if (self->mHistoryIsEnabled && v9) {
        -[MRLayerNavigator _registerTransitionForHistory:withDestinationPlugID:backwards:]( self,  "_registerTransitionForHistory:withDestinationPlugID:backwards:",  a3,  -[MRLayer idInSupercontainer](v17, "idInSupercontainer"),  v10);
      }
      mTransitionChanges = self->mTransitionChanges;
      if (mTransitionChanges) {

      }
      BOOL v19 = objc_alloc_init(&OBJC_CLASS___MRTransitionChanges);
      self->mTransitionChanges = v19;
      -[MRTransitionChanges setTransition:](v19, "setTransition:", a3);
      -[MRTransitionChanges setCurrentSublayer:](self->mTransitionChanges, "setCurrentSublayer:", v17);
      -[MRTransitionChanges setNextSublayer:](self->mTransitionChanges, "setNextSublayer:", mExtraSublayer);
      -[MRLayerClock containerTime](self->super.mClock, "containerTime");
      self->mTransitionChanges->startTime = v20 - a6;
      [a3 transitionDuration];
      self->mTransitionChanges->duration = v21;
      self->mTransitionChanges->isBackwards = v10;
      -[MRTransitionChanges setPzr:](self->mTransitionChanges, "setPzr:", a7);
      [a3 transitionDuration];
      double v23 = v22;
    }
  }

  else
  {
    double v23 = 0.0;
    if (v14)
    {
      self->mCurrentSublayer = v14;
      self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    }
  }

  objc_sync_exit(mSublayers);
  return v23;
}

- (double)doTransition:(id)a3 withDeltaStartTime:(double)a4
{
  return result;
}

- (double)doTransition:(id)a3 backwards:(BOOL)a4 pzr:(id)a5
{
  return result;
}

- (void)jumpToSublayer:(id)mCurrentSublayer atTime:(double)a4
{
  if (self->super.mIsPreactivated)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (self->mIsTransitioning) {
      -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
    }
    if (self->mCurrentSublayer != mCurrentSublayer)
    {
      self->mCurrentSublayer = (MRLayer *)mCurrentSublayer;
      -[MRLayerClock containerTime](self->super.mClock, "containerTime");
      -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
      mCurrentSublayer = self->mCurrentSublayer;
    }

    if (([mCurrentSublayer isActivated] & 1) == 0)
    {
      if (!-[MRLayer isPreactivated](self->mCurrentSublayer, "isPreactivated")) {
        -[MRLayer preactivate](self->mCurrentSublayer, "preactivate");
      }
      -[MRLayer activate](self->mCurrentSublayer, "activate");
      if (!-[MRLayer isLoadedForTime:](self->mCurrentSublayer, "isLoadedForTime:", 0.0)) {
        -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "pauseOnNextUpdate");
      }
    }

    -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", a4);
    -[MRLayer setNeedsToSynchronizeTime:](self->mCurrentSublayer, "setNeedsToSynchronizeTime:", 1LL);
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    objc_sync_exit(mSublayers);
  }

- (double)goForth
{
  double v2 = 0.0;
  if (self->super.mIsActivated && self->mHistoryIsEnabled)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (-[NSMutableArray count](self->mHistoryForth, "count"))
    {
      id v5 = -[NSMutableArray lastObject](self->mHistoryForth, "lastObject");
      -[MRLayerNavigator doTransition:backwards:pzr:](self, "doTransition:backwards:pzr:", v5, 0LL, 0LL);
      double v2 = v6;
    }

    objc_sync_exit(mSublayers);
  }

  return v2;
}

- (double)goBack
{
  double v2 = 0.0;
  if (self->super.mIsActivated && self->mHistoryIsEnabled)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (-[NSMutableArray count](self->mHistoryBack, "count"))
    {
      id v5 = -[NSMutableArray lastObject](self->mHistoryBack, "lastObject");
      -[MRLayerNavigator doTransition:backwards:pzr:](self, "doTransition:backwards:pzr:", v5, 1LL, 0LL);
      double v2 = v6;
    }

    objc_sync_exit(mSublayers);
  }

  return v2;
}

- (void)endTransitionToSublayer
{
  if (self->mTransitionWasAborted)
  {
    if (self->mControlsSublayerTimes)
    {
      -[MRLayerClock setContainerTime:]( -[MRLayer clock](self->mCurrentSublayer, "clock"),  "setContainerTime:",  self->mCurrentSublayerContainerTimeOnTransitionStart);
      -[MRLayer duration](self->mCurrentSublayer, "duration");
      double v4 = v3;
      -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
      if (v4 < v5 + 4.0)
      {
        -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
        -[MRLayer setDuration:](self->mCurrentSublayer, "setDuration:", v6 + 4.0);
      }
    }

    else
    {
      -[MRLayer phaseInDuration](self->mCurrentSublayer, "phaseInDuration");
      -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", v13);
    }
  }

  else
  {
    mExtraSublayer = self->mExtraSublayer;
    if (mExtraSublayer && self->mNextSublayer == mExtraSublayer)
    {
      -[NSMutableDictionary setObject:forKey:]( self->mSublayersForPlugs,  "setObject:forKey:",  mExtraSublayer,  -[MCObject objectID](-[MRLayer plug](self->mExtraSublayer, "plug"), "objectID"));
      self->mExtraSublayer = self->mCurrentSublayer;
    }

    self->mCurrentSublayer = self->mNextSublayer;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    -[MRLayer timeIn](self->mCurrentSublayer, "timeIn");
    double v9 = v8;
    -[MRLayerClock containerTime](self->super.mClock, "containerTime");
    if (v9 > v10)
    {
      -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
      double v12 = v11;
      -[MRLayerClock containerTime](self->super.mClock, "containerTime");
      -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
      if (v12 < 0.0) {
        double v12 = 0.0;
      }
      -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", v12);
    }

    if (self->mControlsSublayerTimes) {
      -[MRLayerClock setContainerTime:]( -[MRLayer clock](self->mCurrentSublayer, "clock"),  "setContainerTime:",  self->mNextSublayerInterestingTime);
    }
  }

  self->mNextSublayer = 0LL;
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  -[MRTransition releaseByTransitioner:](self->mCurrentTransition, "releaseByTransitioner:", self);
  self->mCurrentTransition = 0LL;
  self->mControlsSublayerTimes = 0;
  self->mTransitionWasAborted = 0;
  self->mIsTransitioning = 0;
  self->mTransitionIsBackwards = 0;
  self->BOOL mTransitionStartedWithNext = 0;
  self->mTransitionIsNextPrevious = 0;
  self->int mTransitionIsSubzero = 0;
  self->double mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  if (self->mPausedSublayersForTransition && !self->mIsInSlideFocusMode)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    -[MRLayerClock containerTime](-[MRLayer clock](mCurrentSublayer, "clock"), "containerTime");
    if (-[MRLayer isLoadedForTime:](mCurrentSublayer, "isLoadedForTime:")) {
      -[MRLayerClock resumeOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "resumeOnNextUpdate");
    }
  }

  if (self->_pauseWhenTransitionEnds)
  {
    -[MRLayerClock pauseOnNextUpdate](self->super.mClock, "pauseOnNextUpdate");
    self->_pauseWhenTransitionEnds = 0;
  }

  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);

  self->mTransitionChanges = 0LL;
  objc_sync_exit(mSublayers);
}

- (BOOL)canTransitionToMoreSlides:(BOOL)a3
{
  BOOL v3 = a3;
  mCurrentSublayer = self->mCurrentSublayer;
  -[MRLayerClock containerTime](-[MRLayer clock](mCurrentSublayer, "clock"), "containerTime");
  if (!-[MRLayer hasMoreSlidesFromTime:backwards:startTime:duration:]( mCurrentSublayer,  "hasMoreSlidesFromTime:backwards:startTime:duration:",  v3,  v10,  &v9))
  {
    double v7 = self->mCurrentSublayer;
    if (v3)
    {
      double v6 = -[MRLayer previousTransition](v7, "previousTransition");
      if (!v6) {
        return (char)v6;
      }
    }

    else
    {
      double v6 = -[MRLayer nextTransition](v7, "nextTransition");
      if (!v6) {
        return (char)v6;
      }
    }

    LOBYTE(v6) = -[MRLayerNavigator sublayerForKey:]( self,  "sublayerForKey:",  -[MCTransitionTrigger transitionDestinationPlugID](v6, "transitionDestinationPlugID")) != 0LL;
    return (char)v6;
  }

  LOBYTE(v6) = 1;
  return (char)v6;
}

- (double)gotoMoreSlidesWithAction:(id)a3 backwards:(BOOL)a4 animate:(BOOL)a5 canCatchCurrentTransition:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  if (a5
    && (a6 || self->mForcedTransitionProgress == -1.0)
    && self->mIsTransitioning
    && [a3 specificObject])
  {
    if (self->mCurrentTransition)
    {
      self->mPausedSublayersForTransition = 1;
      BOOL v10 = -[MRTransition controlsLayersTime](self->mCurrentTransition, "controlsLayersTime");
      self->mControlsSublayerTimes = v10;
      if (v10) {
        -[MRLayerNavigator _getInterestingTimesForSublayerControl](self, "_getInterestingTimesForSublayerControl");
      }
      self->mTransitionWasAborted = 0;
      BOOL mTransitionIsBackwards = self->mTransitionIsBackwards;
      -[MRTransition progress](self->mCurrentTransition, "progress");
      if (mTransitionIsBackwards) {
        double v12 = 1.0 - v12;
      }
      self->double mForcedTransitionProgressOffset = v12;
      self->double mForcedTransitionProgress = v12;
      -[MRTransition pzrStart:](self->mCurrentTransition, "pzrStart:", [a3 specificObject]);
    }

    double v13 = 0.0;
    if (self->mPausedSublayersForTransition)
    {
      -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "pauseOnNextUpdate");
      -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mNextSublayer, "clock"), "pauseOnNextUpdate");
    }
  }

  else
  {
    if (self->mIsTransitioning)
    {
      -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
    }

    else if (self->mIsInnerTransitioning)
    {
      -[MRLayerNavigator endMovingCurrentSublayer](self, "endMovingCurrentSublayer");
    }

    mCurrentSublayer = self->mCurrentSublayer;
    -[MRLayerClock containerTime](-[MRLayer clock](mCurrentSublayer, "clock"), "containerTime");
    if (-[MRLayer hasMoreSlidesFromTime:backwards:startTime:duration:]( mCurrentSublayer,  "hasMoreSlidesFromTime:backwards:startTime:duration:",  v7,  v18,  &v17))
    {
      if (v6) {
        -[MRLayerNavigator startMovingCurrentSublayer:](self, "startMovingCurrentSublayer:", v7);
      }
      else {
        -[MRLayerNavigator gotoNextOrPreviousSlideInCurrentSublayer:]( self,  "gotoNextOrPreviousSlideInCurrentSublayer:",  v7);
      }
    }

    else if (v7)
    {
      -[MRLayerNavigator gotoPreviousSublayer:animate:](self, "gotoPreviousSublayer:animate:", a3, v6);
    }

    else
    {
      -[MRLayerNavigator gotoNextSublayer:animate:](self, "gotoNextSublayer:animate:", a3, v6);
    }

    return v15;
  }

  return v13;
}

- (double)transitionToNextSublayerWithDeltaStartTime:(double)a3
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  id v6 = -[MCAction snapshot](-[MRLayer nextTransition](mCurrentSublayer, "nextTransition"), "snapshot");
  if (!v6
    && self->mIsSerializerBased
    && -[NSString isEqualToString:]( -[MCObject objectID](-[MRLayer plug](self, "plug"), "objectID"),  "isEqualToString:",  -[MRRenderer transitionLayerPlugObjectID](self->super.mRenderer, "transitionLayerPlugObjectID")))
  {
    -[MRRenderer _playbackIsOverWithTime:sendNotification:]( self->super.mRenderer,  "_playbackIsOverWithTime:sendNotification:",  1LL,  -1.0);
    return 0.0;
  }

  if (![v6 transitionID]) {
    [v6 setTransitionID:kMRLayerTransitionIDPhaseInOut];
  }
  self->BOOL mTransitionStartedWithNext = 1;
  -[MRLayerNavigator doTransition:withDeltaStartTime:](self, "doTransition:withDeltaStartTime:", v6, a3);
  return result;
}

- (BOOL)isReadyToTransitionToNextSublayer
{
  if (self->super.mIsActivated)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    if (mCurrentSublayer)
    {
      id v4 = -[MRLayerNavigator sublayerForKey:]( self,  "sublayerForKey:",  -[MCTransitionTrigger transitionDestinationPlugID]( -[MRLayer nextTransition](mCurrentSublayer, "nextTransition"),  "transitionDestinationPlugID"));
      if (v4) {
        LOBYTE(mCurrentSublayer) = [v4 isLoadedForTime:0.0];
      }
      else {
        LOBYTE(mCurrentSublayer) = 1;
      }
    }
  }

  else
  {
    LOBYTE(mCurrentSublayer) = 0;
  }

  return (char)mCurrentSublayer;
}

- (double)gotoNextSublayer:(id)a3 animate:(BOOL)a4
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  if (self->mIsTransitioning) {
    mCurrentSublayer = self->mNextSublayer;
  }
  id v8 = -[MCAction snapshot](-[MRLayer nextTransition](mCurrentSublayer, "nextTransition"), "snapshot");
  if (!v8) {
    return 0.0;
  }
  uint64_t v9 = v8;
  if (a4)
  {
    if (![v8 transitionID]) {
      [v9 setTransitionID:kMRLayerTransitionIDPhaseInOut];
    }
  }

  else
  {
    [v8 setTransitionDuration:0.0];
  }

  self->BOOL mTransitionStartedWithNext = 1;
  self->mTransitionIsNextPrevious = 1;
  -[MRLayerNavigator doTransition:backwards:pzr:]( self,  "doTransition:backwards:pzr:",  v9,  0,  [a3 specificObject]);
  return result;
}

- (double)gotoPreviousSublayer:(id)a3 animate:(BOOL)a4
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  if (self->mIsTransitioning) {
    mCurrentSublayer = self->mNextSublayer;
  }
  id v8 = -[MCAction snapshot](-[MRLayer previousTransition](mCurrentSublayer, "previousTransition"), "snapshot");
  if (!v8) {
    return 0.0;
  }
  uint64_t v9 = v8;
  if (a4)
  {
    if (![v8 transitionID]) {
      [v9 setTransitionID:kMRLayerTransitionIDPhaseInOut];
    }
  }

  else
  {
    [v8 setTransitionDuration:0.0];
  }

  self->mTransitionIsNextPrevious = 1;
  self->BOOL mTransitionStartedWithNext = 0;
  -[MRLayerNavigator doTransition:backwards:pzr:]( self,  "doTransition:backwards:pzr:",  v9,  1,  [a3 specificObject]);
  return result;
}

- (void)jumpToNextMarker:(id)a3
{
  mCurrentSublayer = self->mCurrentSublayer;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, a2);
  if ((objc_opt_isKindOfClass(mCurrentSublayer, v6) & 1) != 0
    && objc_msgSend(-[MRLayer effect](self->mCurrentSublayer, "effect"), "supportsChapters"))
  {
    id v7 = -[MRLayer effect](self->mCurrentSublayer, "effect");
    -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
    objc_msgSend(v7, "timeForNextChapterAfterTime:");
    -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", v8);
  }

  else
  {
    -[MRLayerNavigator gotoNextSublayer:animate:](self, "gotoNextSublayer:animate:", a3, 0LL);
  }

- (void)jumpToPreviousMarker:(id)a3
{
  mCurrentSublayer = self->mCurrentSublayer;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, a2);
  if ((objc_opt_isKindOfClass(mCurrentSublayer, v6) & 1) != 0
    && objc_msgSend(-[MRLayer effect](self->mCurrentSublayer, "effect"), "supportsChapters"))
  {
    id v7 = -[MRLayer effect](self->mCurrentSublayer, "effect");
    -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
    objc_msgSend(v7, "timeForPreviousChapterBeforeTime:");
    -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", v8);
  }

  else
  {
    -[MRLayerNavigator gotoPreviousSublayer:animate:](self, "gotoPreviousSublayer:animate:", a3, 0LL);
  }

- (void)_registerTransitionForHistory:(id)a3 withDestinationPlugID:(id)a4 backwards:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  [a3 targetObjectID],  objc_msgSend(a3, "transitionID"));
  [a3 transitionDuration];
  objc_msgSend(v9, "setTransitionDuration:");
  objc_msgSend(v9, "setTransitionAttributes:", objc_msgSend(a3, "transitionAttributes"));
  [v9 setTransitionDestinationPlugID:a4];
  mHistoryBack = self->mHistoryBack;
  if (v5)
  {
    id v11 = -[NSMutableArray lastObject](mHistoryBack, "lastObject");
    mHistoryForth = self->mHistoryForth;
    if (v11 != a3)
    {
      -[NSMutableArray removeAllObjects](mHistoryForth, "removeAllObjects");
      -[MRRenderer removeNavigatorFromForthHistory:](self->super.mRenderer, "removeNavigatorFromForthHistory:", self);
      -[NSMutableDictionary removeObjectForKey:]( self->super.mPersistentState,  "removeObjectForKey:",  @"forthPlugID");
      double v13 = self->mHistoryBack;
      if (!v13)
      {
        double v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        self->mHistoryBack = v13;
      }

      -[NSMutableArray addObject:](v13, "addObject:", v9);
      -[MRRenderer addNavigatorToBackHistory:](self->super.mRenderer, "addNavigatorToBackHistory:", self);
      id v14 = v9;
      goto LABEL_14;
    }

    if (!mHistoryForth)
    {
      mHistoryForth = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      self->mHistoryForth = mHistoryForth;
    }

    -[NSMutableArray addObject:](mHistoryForth, "addObject:", v9);
    -[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  [v9 transitionDestinationPlugID],  @"forthPlugID");
    -[NSMutableArray removeLastObject](self->mHistoryBack, "removeLastObject");
    -[MRRenderer moveNavigatorFromBackToForthHistory:]( self->super.mRenderer,  "moveNavigatorFromBackToForthHistory:",  self);
    if (-[NSMutableArray count](self->mHistoryBack, "count"))
    {
      id v14 = -[NSMutableArray lastObject](self->mHistoryBack, "lastObject");
LABEL_14:
      id v17 = [v14 transitionDestinationPlugID];
      double v18 = @"backPlugID";
LABEL_18:
      -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", v17, v18);
      return;
    }

    mPersistentState = self->super.mPersistentState;
    double v20 = @"backPlugID";
  }

  else
  {
    if (!mHistoryBack)
    {
      mHistoryBack = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      self->mHistoryBack = mHistoryBack;
    }

    -[NSMutableArray addObject:](mHistoryBack, "addObject:", v9);
    -[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  [v9 transitionDestinationPlugID],  @"backPlugID");
    id v15 = -[NSMutableArray lastObject](self->mHistoryForth, "lastObject");
    double v16 = self->mHistoryForth;
    if (v15 == a3)
    {
      -[NSMutableArray removeLastObject](v16, "removeLastObject");
      -[MRRenderer moveNavigatorFromForthToBackHistory:]( self->super.mRenderer,  "moveNavigatorFromForthToBackHistory:",  self);
    }

    else
    {
      -[NSMutableArray removeAllObjects](v16, "removeAllObjects");
      -[MRRenderer removeNavigatorFromForthHistory:](self->super.mRenderer, "removeNavigatorFromForthHistory:", self);
      -[MRRenderer addNavigatorToBackHistory:](self->super.mRenderer, "addNavigatorToBackHistory:", self);
    }

    if (-[NSMutableArray count](self->mHistoryForth, "count"))
    {
      id v17 = objc_msgSend(-[NSMutableArray lastObject](self->mHistoryForth, "lastObject"), "transitionDestinationPlugID");
      double v18 = @"forthPlugID";
      goto LABEL_18;
    }

    mPersistentState = self->super.mPersistentState;
    double v20 = @"forthPlugID";
  }

  -[NSMutableDictionary removeObjectForKey:](mPersistentState, "removeObjectForKey:", v20);
}

- (double)startMovingCurrentSublayer:(BOOL)a3
{
  BOOL v3 = a3;
  -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v5;
  -[MRLayer interestingTimeForTime:](self->mCurrentSublayer, "interestingTimeForTime:");
  self->double mCurrentSublayerInterestingTime = v6;
  p_mCurrentSublayerLazyDuration = &self->mCurrentSublayerLazyDuration;
  p_mCurrentSublayerAnimationDuration = &self->mCurrentSublayerAnimationDuration;
  p_double mCurrentSublayerLazyFactor = &self->mCurrentSublayerLazyFactor;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:]( self->mCurrentSublayer,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mCurrentSublayerLazyDuration);
  if (!v3)
  {
    double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime
                                    + *p_mCurrentSublayerLazyDuration
                                    + *p_mCurrentSublayerAnimationDuration;
    double v10 = 0.01;
    goto LABEL_5;
  }

  double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime;
  if (self->mCurrentSublayerContainerTimeOnTransitionStart < mCurrentSublayerInterestingTime
                                                            + *p_mCurrentSublayerLazyDuration)
  {
    double v10 = -0.01;
LABEL_5:
    -[MRLayer interestingTimeForTime:]( self->mCurrentSublayer,  "interestingTimeForTime:",  mCurrentSublayerInterestingTime + v10);
    self->double mNextSublayerInterestingTime = v11;
    -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:]( self->mCurrentSublayer,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mNextSublayerLazyDuration,  &self->mNextSublayerLazyFactor,  &self->mNextSublayerAnimationDuration);
    goto LABEL_7;
  }

  self->double mNextSublayerInterestingTime = mCurrentSublayerInterestingTime;
  self->double mNextSublayerLazyDuration = *p_mCurrentSublayerLazyDuration;
  self->double mNextSublayerLazyFactor = *p_mCurrentSublayerLazyFactor;
  self->double mNextSublayerAnimationDuration = *p_mCurrentSublayerAnimationDuration;
  -[MRLayer interestingTimeForTime:]( self->mCurrentSublayer,  "interestingTimeForTime:",  self->mCurrentSublayerInterestingTime + *p_mCurrentSublayerLazyDuration + *p_mCurrentSublayerAnimationDuration + 0.01);
  self->double mCurrentSublayerInterestingTime = v12;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:]( self->mCurrentSublayer,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mCurrentSublayerLazyDuration,  p_mCurrentSublayerLazyFactor,  &self->mCurrentSublayerAnimationDuration);
LABEL_7:
  self->BOOL mTransitionStartedWithNext = !v3;
  self->mTransitionIsNextPrevious = 1;
  self->BOOL mIsInnerTransitioning = 1;
  self->BOOL mTransitionIsBackwards = v3;
  if (v3)
  {
    double mNextSublayerAnimationDuration = self->mNextSublayerAnimationDuration;
    p_double mTransitionDuration = &self->mTransitionDuration;
    self->double mTransitionDuration = mNextSublayerAnimationDuration;
    self->double mTotalMotionDuration = mNextSublayerAnimationDuration
                               + (self->mCurrentSublayerContainerTimeOnTransitionStart
                                - self->mCurrentSublayerInterestingTime)
                               * *p_mCurrentSublayerLazyFactor
                               + self->mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
    double mCurrentSublayerContainerTimeOnTransitionStart = self->mCurrentSublayerContainerTimeOnTransitionStart;
    double mNextSublayerInterestingTime = self->mNextSublayerInterestingTime;
    double mNextSublayerLazyDuration = self->mNextSublayerLazyDuration;
    if (mCurrentSublayerContainerTimeOnTransitionStart >= mNextSublayerInterestingTime + mNextSublayerLazyDuration)
    {
      double v27 = mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
      self->double mForcedTransitionProgressOffset = v27;
      double v28 = self->mCurrentSublayerContainerTimeOnTransitionStart;
      double v29 = self->mCurrentSublayerInterestingTime;
      if (v28 >= v29) {
        double v30 = *p_mTransitionDuration + (v28 - v29) * *p_mCurrentSublayerLazyFactor;
      }
      else {
        double v30 = v28 - (self->mNextSublayerInterestingTime + self->mNextSublayerLazyDuration);
      }
      double v18 = v27 + v30;
      self->double mForcedTransitionProgressOffset = v18;
    }

    else
    {
      double v18 = (mCurrentSublayerContainerTimeOnTransitionStart - mNextSublayerInterestingTime)
          * self->mNextSublayerLazyFactor;
      self->double mForcedTransitionProgressOffset = v18;
    }

    double mTotalMotionDuration = self->mTotalMotionDuration;
    double v26 = 1.0;
    if (mTotalMotionDuration > 0.0) {
      double v26 = 1.0 - v18 / mTotalMotionDuration;
    }
    self->double mForcedTransitionProgressOffset = v26;
  }

  else
  {
    double v19 = *p_mCurrentSublayerAnimationDuration;
    p_double mTransitionDuration = &self->mTransitionDuration;
    self->double mTransitionDuration = *p_mCurrentSublayerAnimationDuration;
    double v20 = v19 + *p_mCurrentSublayerLazyDuration * *p_mCurrentSublayerLazyFactor;
    self->double mTotalMotionDuration = v20;
    double v21 = 1.0;
    if (v20 > 0.0)
    {
      -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock", 1.0), "containerTime");
      double v21 = (v22 - self->mCurrentSublayerInterestingTime) * *p_mCurrentSublayerLazyFactor / self->mTotalMotionDuration;
    }

    self->double mForcedTransitionProgressOffset = v21;
    self->double mForcedTransitionProgress = v21;
    double v23 = self->mCurrentSublayerContainerTimeOnTransitionStart;
    double v24 = self->mCurrentSublayerInterestingTime;
    double v25 = v24 + *p_mCurrentSublayerLazyDuration;
    if (v23 >= v25) {
      double v26 = v23 - v25 + *p_mCurrentSublayerLazyDuration * *p_mCurrentSublayerLazyFactor;
    }
    else {
      double v26 = (v23 - v24) * *p_mCurrentSublayerLazyFactor;
    }
    self->double mForcedTransitionProgressOffset = v26;
    double v31 = self->mTotalMotionDuration;
    if (v31 > 0.0)
    {
      double v26 = v26 / v31;
      self->double mForcedTransitionProgressOffset = v26;
    }
  }

  self->double mForcedTransitionProgress = v26;
  -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "pauseOnNextUpdate");
  self->mPausedSublayersForTransition = 1;
  -[MRLayer setIsInInteractiveMode:](self->mCurrentSublayer, "setIsInInteractiveMode:", 1LL);
  self->_pauseWhenTransitionEnds = -[MRLayerClock selfIsPaused](self->super.mClock, "selfIsPaused");
  -[MRLayerClock resumeOnNextUpdate](self->super.mClock, "resumeOnNextUpdate");
  return *p_mTransitionDuration;
}

- (void)endMovingCurrentSublayer
{
  BOOL mTransitionWasAborted = self->mTransitionWasAborted;
  mCurrentSublayer = self->mCurrentSublayer;
  if (mTransitionWasAborted)
  {
    -[MRLayerClock setContainerTime:]( -[MRLayer clock](mCurrentSublayer, "clock"),  "setContainerTime:",  self->mCurrentSublayerInterestingTime);
  }

  else
  {
    -[MRLayerClock setContainerTime:]( -[MRLayer clock](mCurrentSublayer, "clock"),  "setContainerTime:",  self->mNextSublayerInterestingTime);
    self->mNeedsToUpdatePotentialTargetSublayers = 1;
  }

  self->mControlsSublayerTimes = 0;
  self->BOOL mTransitionWasAborted = 0;
  self->BOOL mIsInnerTransitioning = 0;
  self->BOOL mTransitionIsBackwards = 0;
  self->double mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  -[MRLayer setIsInInteractiveMode:](self->mCurrentSublayer, "setIsInInteractiveMode:", 0LL);
  if (self->mPausedSublayersForTransition && !self->mIsInSlideFocusMode) {
    -[MRLayerClock resumeOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "resumeOnNextUpdate");
  }
  if (self->_pauseWhenTransitionEnds)
  {
    -[MRLayerClock pauseOnNextUpdate](self->super.mClock, "pauseOnNextUpdate");
    self->_pauseWhenTransitionEnds = 0;
  }

  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);

  self->mTransitionChanges = 0LL;
  objc_sync_exit(mSublayers);
}

- (double)gotoNextOrPreviousSlideInCurrentSublayer:(BOOL)a3
{
  BOOL v3 = a3;
  -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock"), "containerTime");
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v5;
  -[MRLayer interestingTimeForTime:](self->mCurrentSublayer, "interestingTimeForTime:");
  self->double mCurrentSublayerInterestingTime = v6;
  p_mCurrentSublayerLazyDuration = &self->mCurrentSublayerLazyDuration;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:]( self->mCurrentSublayer,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mCurrentSublayerLazyDuration,  &self->mCurrentSublayerLazyFactor,  &self->mCurrentSublayerAnimationDuration);
  if (!v3)
  {
    double v9 = self->mCurrentSublayerInterestingTime
       + *p_mCurrentSublayerLazyDuration
       + self->mCurrentSublayerAnimationDuration
       + 0.01;
    goto LABEL_5;
  }

  double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime;
  if (self->mCurrentSublayerContainerTimeOnTransitionStart < mCurrentSublayerInterestingTime
                                                            + *p_mCurrentSublayerLazyDuration)
  {
    double v9 = mCurrentSublayerInterestingTime + -0.01;
LABEL_5:
    -[MRLayer interestingTimeForTime:](self->mCurrentSublayer, "interestingTimeForTime:", v9);
    double mCurrentSublayerInterestingTime = v10;
  }

  -[MRLayerClock setContainerTime:]( -[MRLayer clock](self->mCurrentSublayer, "clock"),  "setContainerTime:",  mCurrentSublayerInterestingTime);
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  return 0.0;
}

- (id)_currentState
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  id v3 = -[MRLayer _currentState](&v7, "_currentState");
  mCurrentSublayer = self->mCurrentSublayer;
  if (mCurrentSublayer)
  {
    objc_msgSend( v3,  "setObject:forKey:",  -[MRLayer idInSupercontainer](mCurrentSublayer, "idInSupercontainer"),  @"currentSublayerID");
    id v5 = -[MRLayer _currentState](self->mCurrentSublayer, "_currentState");
    -[MRLayer timeIn](self->mCurrentSublayer, "timeIn");
    objc_msgSend( v5,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"timeIn");
    [v3 setObject:v5 forKey:@"currentSublayerState"];
  }

  return v3;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  id v5 = -[MRLayer _dumpLayerWithOptions:](&v19, "_dumpLayerWithOptions:");
  if ((a3 & 1) == 0)
  {
    double v6 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v5, 0LL);
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
          double v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSublayers,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
      }

      while (v9);
    }

    id v5 = -[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", @"\n");
  }

  return v5;
}

- (void)resyncToSerializer
{
  self->mNeedsToResyncToSerializer = 1;
}

- (void)_resyncToSerializerForTime:(double)a3
{
  BOOL mNeedsToResyncToSerializer = self->mNeedsToResyncToSerializer;
  self->BOOL mNeedsToResyncToSerializer = 0;
  if (self->mIsTransitioning) {
    -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
  }
  if (self->mIsInnerTransitioning) {
    -[MRLayerNavigator endMovingCurrentSublayer](self, "endMovingCurrentSublayer");
  }
  mContainer = self->mContainer;
  id v6 = -[MCContainer orderedPlugs](mContainer, "orderedPlugs");
  -[MCContainer initialTransitionDuration](mContainer, "initialTransitionDuration");
  double v8 = v7;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v9 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    BOOL v11 = 0;
    double v12 = 0LL;
    uint64_t v13 = *(void *)v42;
    double v14 = 0.0;
    double v15 = v8;
    while (2)
    {
      __int128 v16 = 0LL;
      __int128 v17 = v12;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v16);
        double v18 = v8;
        if (v11)
        {
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)v16), "phaseInDuration", v8);
          double v18 = v8 + v19;
        }

        if (v18 > a3)
        {
          double v22 = v12;
          double v12 = v17;
          goto LABEL_17;
        }

        double v14 = v8 - v15;
        [v12 fullDuration];
        double v8 = v8 - v15 + v20;
        [v12 transitionDuration];
        double v15 = v21;
        BOOL v11 = [v12 transitionID] == 0;
        __int128 v16 = (char *)v16 + 1;
        __int128 v17 = v12;
      }

      while (v10 != v16);
      id v10 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    double v22 = 0LL;
LABEL_17:
    double v23 = v8;
    if (v11)
    {
      [v12 phaseOutDuration];
      double v25 = v8 - v24;
      [v12 phaseOutDuration];
      double v27 = v26;
      [v22 phaseInDuration];
      double v8 = v27 + v28;
      int v29 = 1;
      goto LABEL_22;
    }

    double v8 = v15;
  }

  else
  {
    double v12 = 0LL;
    double v22 = 0LL;
    double v14 = 0.0;
    double v23 = v8;
    double v15 = v8;
  }

  int v29 = 0;
  double v25 = v23 - v8;
LABEL_22:
  if (!v22)
  {
    int v33 = 0;
    self->mIsTransitioning = 0;
    if (!v12) {
      goto LABEL_58;
    }
LABEL_34:
    double v34 = (MRLayer *)-[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [v12 objectID]);
    self->mCurrentSublayer = v34;
    if (!-[MRLayer isActivated](v34, "isActivated"))
    {
      if (!-[MRLayer isPreactivated](self->mCurrentSublayer, "isPreactivated")) {
        -[MRLayer preactivate](self->mCurrentSublayer, "preactivate");
      }
      -[MRLayer activate](self->mCurrentSublayer, "activate");
      if (!-[MRLayer isLoadedForTime:](self->mCurrentSublayer, "isLoadedForTime:", 0.0)) {
        -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mCurrentSublayer, "clock"), "pauseOnNextUpdate");
      }
    }

    -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:", v14);
    -[MRLayer setDuration:](self->mCurrentSublayer, "setDuration:", v23 - v14);
    -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mCurrentSublayer, "clock"), "setContainerTime:", a3 - v14);
    char v35 = 0;
    self->_double currentSublayerTheoreticalTimeIn = v14;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = 0;
    if (!self->mIsTransitioning) {
      goto LABEL_56;
    }
    goto LABEL_40;
  }

  BOOL v30 = v25 <= a3 || v12 == 0LL;
  BOOL v31 = v30;
  self->mIsTransitioning = v31;
  if (!v30) {
    goto LABEL_34;
  }
  if (mNeedsToResyncToSerializer)
  {
    self->mIsTransitioning = 0;
    double v14 = v23 - v15;
    [v22 fullDuration];
    double v23 = v23 - v15 + v32;
    double v12 = v22;
    double v22 = 0LL;
    goto LABEL_34;
  }

  int v33 = 1;
  if (v12) {
    goto LABEL_34;
  }
LABEL_58:
  char v35 = 1;
  if (!v33) {
    goto LABEL_56;
  }
LABEL_40:
  mExtraSublayer = self->mExtraSublayer;
  if (!mExtraSublayer) {
    mExtraSublayer = (MRLayer *)-[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [v22 objectID]);
  }
  self->mNextSublayer = mExtraSublayer;
  if (!-[MRLayer isPreactivated](mExtraSublayer, "isPreactivated")) {
    -[MRLayer preactivate](self->mNextSublayer, "preactivate");
  }
  double v37 = v23 - v15;
  -[MRLayer setTimeIn:](self->mNextSublayer, "setTimeIn:", v37);
  [v22 fullDuration];
  -[MRLayer setDuration:](self->mNextSublayer, "setDuration:");
  -[MRLayerClock setContainerTime:](-[MRLayer clock](self->mNextSublayer, "clock"), "setContainerTime:", a3 - v37);
  if (!-[MRLayer isActivated](self->mNextSublayer, "isActivated"))
  {
    -[MRLayer activate](self->mNextSublayer, "activate");
    if (!-[MRLayer isLoadedForTime:](self->mNextSublayer, "isLoadedForTime:", 0.0)) {
      -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](self->mNextSublayer, "clock"), "pauseOnNextUpdate");
    }
  }

  if ((v35 & 1) != 0)
  {
    double v38 = +[MRTransition retainedTransitionWithTransitionID:forTransitioner:]( &OBJC_CLASS___MRTransition,  "retainedTransitionWithTransitionID:forTransitioner:",  -[MCContainer initialTransitionID](mContainer, "initialTransitionID"),  self);
    self->mCurrentTransition = v38;
    if (!v38) {
      goto LABEL_56;
    }
    -[MRTransition setAttributes:]( self->mCurrentTransition,  "setAttributes:",  -[MCContainer initialTransitionAttributes](mContainer, "initialTransitionAttributes"));
    -[MRTransition setPixelSize:]( self->mCurrentTransition,  "setPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    mCurrentTransition = self->mCurrentTransition;
    if (!mCurrentTransition) {
      goto LABEL_56;
    }
LABEL_55:
    -[MRTransition setSourceLayer:](mCurrentTransition, "setSourceLayer:", self->mCurrentSublayer);
    -[MRTransition setTargetLayer:](self->mCurrentTransition, "setTargetLayer:", self->mNextSublayer);
    self->mTransitionStartTime = v25;
    self->double mTransitionDuration = v8;
    self->double mTotalMotionDuration = v8;
    self->_previouslyRenderedTransitionProgress = -1.0;
    goto LABEL_56;
  }

  if (v29) {
    mCurrentTransition = +[MRTransition retainedTransitionWithTransitionID:forTransitioner:]( &OBJC_CLASS___MRTransition,  "retainedTransitionWithTransitionID:forTransitioner:",  @"PhaseInOut",  self);
  }
  else {
    mCurrentTransition = -[MRLayerNavigator _transitionWithTransitionTrigger:]( self,  "_transitionWithTransitionTrigger:",  v12);
  }
  self->mCurrentTransition = mCurrentTransition;
  if (mCurrentTransition) {
    goto LABEL_55;
  }
LABEL_56:
  -[MRLayer setNeedsToSynchronizeTime:](self, "setNeedsToSynchronizeTime:", 1LL);
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
}

- (id)_transitionWithTransitionTrigger:(id)a3
{
  id v5 = [a3 transitionID];
  id v6 = [a3 transitionAttributes];
  id v7 = [v6 objectForKey:@"PresetID"];
  if ([v5 isEqualToString:@"Random"])
  {
    id v8 = -[MRRenderer chooseTransitionIDForRandomTransitionPresetID:]( self->super.mRenderer,  "chooseTransitionIDForRandomTransitionPresetID:",  v7);
    id v9 = [v8 lastPathComponent];
    id v10 = +[MRTransition retainedTransitionWithTransitionID:forTransitioner:]( MRTransition,  "retainedTransitionWithTransitionID:forTransitioner:",  [v8 stringByDeletingLastPathComponent],  self);
    BOOL v11 = v10;
    if (v10)
    {
      [v10 setPresetID:v9];
LABEL_6:
      objc_msgSend(v11, "setPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    }
  }

  else
  {
    id v12 = +[MRTransition retainedTransitionWithTransitionID:forTransitioner:]( &OBJC_CLASS___MRTransition,  "retainedTransitionWithTransitionID:forTransitioner:",  v5,  self);
    BOOL v11 = v12;
    if (v12)
    {
      [v12 setAttributes:v6];
      goto LABEL_6;
    }
  }

  return v11;
}

- (BOOL)enterSlideFocusModeWithState:(id)a3
{
  BOOL mIsTransitioning = self->mIsTransitioning;
  if (!self->mIsTransitioning)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    -[MRLayerClock pauseOnNextUpdate](-[MRLayer clock](mCurrentSublayer, "clock"), "pauseOnNextUpdate");
    self->mIsInSlideFocusMode = 1;
    objc_msgSend( a3,  "setSlideInfo:",  -[MRLayer currentSlideInfoForElement:]( mCurrentSublayer,  "currentSlideInfoForElement:",  objc_msgSend(a3, "slideID")));
    -[MRLayerNavigator fillInNextSlideInformationInState:](self, "fillInNextSlideInformationInState:", a3);
    -[MRLayerNavigator fillInPreviousSlideInformationInState:](self, "fillInPreviousSlideInformationInState:", a3);
  }

  return !mIsTransitioning;
}

- (void)fillInNextSlideInformationInState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
      && ((id v9 = objc_msgSend( objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "descriptionForEffectID:",  objc_msgSend(objc_msgSend(v6, "container"), "effectID")),  "objectForKey:",  @"numberOfSlides")) == 0 ? (v10 = objc_msgSend(objc_msgSend(v6, "container"), "countOfSlides"))
        : (id v10 = (id)(int)[v9 intValue]),
          (BOOL v11 = (char *)objc_msgSend(objc_msgSend(a3, "slideInfo"), "index") + 1, v11 < v10)
       && (id v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"image%d", v11)) != 0LL))
    {
      uint64_t v13 = (const __CFString *)v12;
    }

    else
    {
      id v14 = -[MRLayerNavigator sublayerForKey:]( self,  "sublayerForKey:",  objc_msgSend(objc_msgSend(v6, "nextTransition"), "transitionDestinationPlugID"));
      if (!v14)
      {
        uint64_t v13 = 0LL;
        id v15 = 0LL;
        goto LABEL_17;
      }

      id v6 = v14;
      uint64_t v13 = @"image0";
    }

    id v15 = [v6 currentSlideInfoForElement:v13];
LABEL_17:
    [a3 setNextSlideInfo:v15];
    [a3 setNextSlideID:v13];
  }

- (void)fillInPreviousSlideInformationInState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
    if (v7) {
      goto LABEL_6;
    }
    id v9 = -[MRLayerNavigator sublayerForKey:]( self,  "sublayerForKey:",  objc_msgSend(objc_msgSend(v6, "previousTransition"), "transitionDestinationPlugID"));
    if (v9)
    {
      id v6 = v9;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v10);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) == 0)
      {
        uint64_t v8 = @"image0";
        goto LABEL_15;
      }

      id v12 = objc_msgSend( objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "descriptionForEffectID:",  objc_msgSend(objc_msgSend(v6, "container"), "effectID")),  "objectForKey:",  @"numberOfSlides");
      if (v12)
      {
        LODWORD(v7) = [v12 intValue];
        if (!(_DWORD)v7) {
          goto LABEL_17;
        }
LABEL_6:
        uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"image%d",  ((_DWORD)v7 - 1));
        if (!v8) {
          goto LABEL_18;
        }
LABEL_15:
        id v13 = [v6 currentSlideInfoForElement:v8];
LABEL_19:
        [a3 setPreviousSlideInfo:v13];
        [a3 setPreviousSlideID:v8];
        return;
      }

      id v7 = objc_msgSend(objc_msgSend(v6, "container"), "countOfSlides");
      if (v7) {
        goto LABEL_6;
      }
    }

- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->mIsTransitioning) {
    id v7 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v7 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  unsigned int v8 = [*(id *)((char *)&self->super.super.isa + *v7) isActivated];
  if (v8)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "nextSlideInfo"), "index");
    id v10 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
    if (v9 <= v10) {
      -[MRLayerNavigator gotoNextSublayer:animate:](self, "gotoNextSublayer:animate:", [a3 action], v4);
    }
    [a3 setDelegateIsTransitioningToo:v9 <= v10];
  }

  return v8;
}

- (void)didFocusOnNextSlideWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    objc_msgSend(v6, "interestingTimeForElement:", objc_msgSend(a3, "slideID"));
    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v7);
    -[MRLayerNavigator fillInNextSlideInformationInState:](self, "fillInNextSlideInformationInState:", a3);
  }

- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->mIsTransitioning) {
    double v7 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    double v7 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  unsigned int v8 = [*(id *)((char *)&self->super.super.isa + *v7) isActivated];
  if (v8)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "previousSlideInfo"), "index");
    id v10 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
    if (v9 >= v10) {
      -[MRLayerNavigator gotoPreviousSublayer:animate:]( self,  "gotoPreviousSublayer:animate:",  [a3 action],  v4);
    }
    [a3 setDelegateIsTransitioningToo:v9 >= v10];
  }

  return v8;
}

- (void)didFocusOnPreviousSlideWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    objc_msgSend(v6, "interestingTimeForElement:", objc_msgSend(a3, "slideID"));
    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v7);
    -[MRLayerNavigator fillInPreviousSlideInformationInState:](self, "fillInPreviousSlideInformationInState:", a3);
  }

- (void)exitSlideFocusModeWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    self->mIsInSlideFocusMode = 0;
    objc_msgSend(objc_msgSend(v6, "clock"), "containerTime");
    double v8 = v7;
    objc_msgSend(objc_msgSend(a3, "slideInfo"), "time");
    double v10 = v8 + v9;
    if ([v6 plugAsSerial])
    {
      objc_msgSend(objc_msgSend(v6, "plugAsSerial"), "transitionDuration");
      double v12 = v11;
      [v6 duration];
      double v14 = v13 - v12 + -0.1;
      if (v10 >= v14) {
        double v10 = v14;
      }
    }

    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v10);
    objc_msgSend(objc_msgSend(v6, "clock"), "resumeAfter:", 2.0);
    objc_msgSend(a3, "setSlideInfo:", objc_msgSend(v6, "currentSlideInfoForElement:", objc_msgSend(a3, "slideID")));
  }

- (double)fastScrubStart:(id)a3
{
  if (self->mIsSerializerBased)
  {
    self->mIsFastScrubbing = 1;
    if (self->mIsTransitioning)
    {
      -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer", a3);
    }

    else if (self->mIsInnerTransitioning)
    {
      -[MRLayerNavigator endMovingCurrentSublayer](self, "endMovingCurrentSublayer", a3);
    }

    -[MRLayerClock pauseOnNextUpdate](self->super.mClock, "pauseOnNextUpdate");
    self->mFastScrubbingStartIndedouble x = -[MCPlugSerial index]( -[MRLayer plugAsSerial](self->mCurrentSublayer, "plugAsSerial"),  "index");
    self->mFastScrubbingProgress = 0.0;
  }

  return 0.0;
}

- (double)fastScrubUpdate:(id)a3
{
  if (!self->mIsFastScrubbing) {
    return 0.0;
  }
  BOOL v4 = (double *)[a3 specificObject];
  mFastScrubbingStartIndedouble x = (double)self->mFastScrubbingStartIndex;
  double v6 = v4[4] * 0.5;
  double v7 = (double)(unint64_t)-[NSMutableArray count](self->mSublayers, "count");
  if (v7 > 50.0) {
    double v7 = 50.0;
  }
  if (v7 < 10.0) {
    double v7 = 10.0;
  }
  uint64_t v8 = (uint64_t)(mFastScrubbingStartIndex + v6 * v7);
  double v9 = v4[4] * 0.5;
  double v10 = (double)(unint64_t)-[NSMutableArray count](self->mSublayers, "count");
  if (v10 > 50.0) {
    double v10 = 50.0;
  }
  if (v10 < 10.0) {
    double v10 = 10.0;
  }
  self->mFastScrubbingProgress = v9 * v10;
  if (v8 <= 0)
  {
    objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", 0), "fullDuration");
    uint64_t v8 = v11 <= 1.0;
    if (v11 > 1.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    double v13 = v4[4];
    double v14 = (double)(unint64_t)-[NSMutableArray count](self->mSublayers, "count");
    if (v14 > 50.0) {
      double v14 = 50.0;
    }
    if (v14 < 10.0) {
      double v14 = 10.0;
    }
    double v15 = v12 + v13 * -0.5 * v14;
    goto LABEL_29;
  }

  if ((char *)-[NSMutableArray count](self->mSublayers, "count") - 1 <= (char *)v8)
  {
    __int128 v16 = (char *)-[NSMutableArray count](self->mSublayers, "count");
    objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", v16 - 1), "fullDuration");
    if (v17 <= 1.0) {
      uint64_t v8 = (uint64_t)(v16 - 2);
    }
    else {
      uint64_t v8 = (uint64_t)(v16 - 1);
    }
    double v18 = v4[4];
    double v19 = (double)(unint64_t)-[NSMutableArray count](self->mSublayers, "count");
    if (v19 > 50.0) {
      double v19 = 50.0;
    }
    if (v19 < 10.0) {
      double v19 = 10.0;
    }
    double v15 = (double)v8 + v18 * -0.5 * v19;
LABEL_29:
    self->mFastScrubbingProgress = self->mFastScrubbingProgress
                                 + (double)((unint64_t)v15 - self->mFastScrubbingStartIndex);
    self->mFastScrubbingStartIndedouble x = (unint64_t)v15;
  }

  double v20 = (MRLayer *)-[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", v8), "objectID"));
  if (v20 != self->mCurrentSublayer)
  {
    self->mCurrentSublayer = v20;
    -[MRLayerClock containerTime](self->super.mClock, "containerTime");
    -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:", v21 + -1.0);
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
  }

  return 0.0;
}

- (double)fastScrubEnd:(id)a3
{
  if (self->mIsFastScrubbing)
  {
    self->mIsFastScrubbing = 0;
    self->mFastScrubbingStartIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    self->mFastScrubbingProgress = 0.0;
    -[MRLayerClock resumeOnNextUpdate](self->super.mClock, "resumeOnNextUpdate", a3);
  }

  return 0.0;
}

- (double)fastScrubCancel:(id)a3
{
  if (self->mIsFastScrubbing)
  {
    self->mIsFastScrubbing = 0;
    self->mFastScrubbingStartIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    self->mFastScrubbingProgress = 0.0;
    -[MRLayerClock resumeOnNextUpdate](self->super.mClock, "resumeOnNextUpdate", a3);
  }

  return 0.0;
}

- (BOOL)hasSlides
{
  return -[MRLayer hasSlides](self->mCurrentSublayer, "hasSlides");
}

- (BOOL)isInInteractiveMode
{
  return -[MRLayer isInInteractiveMode](self->mCurrentSublayer, "isInInteractiveMode");
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
}

- (id)currentSlideInfoForElement:(id)a3
{
  return -[MRLayer currentSlideInfoForElement:](self->mCurrentSublayer, "currentSlideInfoForElement:", a3);
}

- (id)currentSlideInfos
{
  return -[MRLayer currentSlideInfos](self->mCurrentSublayer, "currentSlideInfos");
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return -[MRLayer getStartTime:andDuration:forMovingToElementID:backwards:]( self->mCurrentSublayer,  "getStartTime:andDuration:forMovingToElementID:backwards:",  a3,  a4,  a5,  a6);
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  mCurrentSublayer = self->mCurrentSublayer;
  -[MRLayer timeIn](mCurrentSublayer, "timeIn");
  return -[MRLayer hasMoreSlidesFromTime:backwards:startTime:duration:]( mCurrentSublayer,  "hasMoreSlidesFromTime:backwards:startTime:duration:",  v8,  a5,  a6,  a3 - v11);
}

- (double)interestingTimeForTime:(double)a3
{
  mCurrentSublayer = self->mCurrentSublayer;
  -[MRLayer timeIn](mCurrentSublayer, "timeIn");
  -[MRLayer interestingTimeForTime:](mCurrentSublayer, "interestingTimeForTime:", a3 - v6);
  double v8 = v7;
  -[MRLayer timeIn](self->mCurrentSublayer, "timeIn");
  return v8 + v9;
}

- (double)interestingTimeForElement:(id)a3
{
  double v5 = v4;
  -[MRLayer timeIn](self->mCurrentSublayer, "timeIn");
  return v5 + v6;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  mCurrentSublayer = self->mCurrentSublayer;
  -[MRLayer timeIn](mCurrentSublayer, "timeIn");
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:]( mCurrentSublayer,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  a3,  a4,  a5,  a6 - v11);
}

- (MRLayer)currentSublayer
{
  return self->mCurrentSublayer;
}

- (BOOL)isTransitioning
{
  return self->mIsTransitioning;
}

- (BOOL)historyIsEnabled
{
  return self->mHistoryIsEnabled;
}

- (void)setHistoryIsEnabled:(BOOL)a3
{
  self->mHistoryIsEnabled = a3;
}

- (double)forcedTransitionProgress
{
  return self->mForcedTransitionProgress;
}

- (void)setForcedTransitionProgress:(double)a3
{
  self->double mForcedTransitionProgress = a3;
}

- (double)currentSlideshowTime
{
  return self->_currentSlideshowTime;
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
      if (self->mExtraSublayer) {
        -[MRLayerNavigator _removeExtraSublayer](self, "_removeExtraSublayer");
      }
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5)
      {
        uint64_t v6 = 0LL;
        uint64_t v7 = *(void *)v16;
        do
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v16 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
            int v10 = *(_DWORD *)(v9 + 8);
            if (v10 == 1)
            {
              double v12 = *(void **)(v9 + 16);
              id v13 = -[NSMutableDictionary objectForKey:]( self->mSublayersForPlugs,  "objectForKey:",  [v12 objectID]);
              double v14 = v13;
              if (v13)
              {
                if ([v13 isPreactivated])
                {
                  [v14 depreactivate:0];
                }

                -[MRLayerNavigator _unobserveSublayer:](self, "_unobserveSublayer:", v14);
                -[MRLayerNavigator _deleteSublayer:](self, "_deleteSublayer:", v14);
              }

              else if ([v12 container])
              {
                NSLog(@"Consistency error, trying to delete a nil sublayer in serializer\n");
              }
            }

            else if (!v10)
            {
              id v11 = -[MRLayerNavigator _createSublayerForPlug:](self, "_createSublayerForPlug:", *(void *)(v9 + 16));
              if (v11) {
                -[MRLayerNavigator _observeSublayer:](self, "_observeSublayer:", v11);
              }
              ++v6;
            }
          }

          id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v5);
        if (v6) {
          self->mHasWarnedDelegateAboutNearingEnd = 0;
        }
      }
    }
  }

  else
  {
    objc_sync_exit(mLayerCommandQueue);
  }

- (id)_createSublayerForPlug:(id)a3
{
  if (![a3 container]) {
    return 0LL;
  }
  id v5 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:]( &OBJC_CLASS___MRLayer,  "layerWithPlug:andParameters:inSuperlayer:",  a3,  self->super.mParameters,  self);
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[NSMutableArray addObject:](self->mSublayers, "addObject:", v5);
  -[NSMutableDictionary setObject:forKey:]( self->mSublayersForPlugs,  "setObject:forKey:",  v5,  [a3 objectID]);
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  objc_sync_exit(mSublayers);
  return v5;
}

- (void)_deleteSublayer:(id)a3
{
  id v4 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  -[NSMutableArray removeObject:](self->mSublayers, "removeObject:", a3);
  -[NSMutableDictionary removeObjectForKey:]( self->mSublayersForPlugs,  "removeObjectForKey:",  objc_msgSend(objc_msgSend(a3, "plug"), "objectID"));
  if (self->mIsTransitioning) {
    -[MRLayerNavigator endTransitionToSublayer](self, "endTransitionToSublayer");
  }
  if (self->mCurrentSublayer == a3) {
    self->mCurrentSublayer = 0LL;
  }
  if (self->mNextSublayer == a3) {
    self->mNextSublayer = 0LL;
  }
  -[NSMutableSet removeObject:](self->mPotentialTargetSublayers, "removeObject:");
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  objc_sync_exit(mSublayers);
  [a3 cleanup];
}

- (id)_createSublayerForPrecomputingWithPlug:(id)a3
{
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self->super.mParameters);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"precomputing");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"readonly");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"noAudio");
  return +[MRLayer layerWithPlug:andParameters:inSuperlayer:]( &OBJC_CLASS___MRLayer,  "layerWithPlug:andParameters:inSuperlayer:",  a3,  v5,  self);
}

- (void)_createExtraSublayer
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  id v4 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:]( MRLayer,  "layerWithPlug:andParameters:inSuperlayer:",  objc_msgSend(-[NSMutableArray lastObject](self->mSublayers, "lastObject"), "plug"),  self->super.mParameters,  self);
  self->mExtraSublayer = v4;
  -[NSMutableArray addObject:](self->mSublayers, "addObject:", v4);
  -[MRLayerNavigator _observeSublayer:](self, "_observeSublayer:", self->mExtraSublayer);
  objc_sync_exit(mSublayers);
}

- (void)_removeExtraSublayer
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  if (-[MRLayer isPreactivated](self->mExtraSublayer, "isPreactivated"))
  {
    if (-[MRLayer isActivated](self->mExtraSublayer, "isActivated")) {
      -[MRLayer deactivate](self->mExtraSublayer, "deactivate");
    }
    -[MRLayer depreactivate:](self->mExtraSublayer, "depreactivate:", 0LL);
  }

  -[MRLayerNavigator _unobserveSublayer:](self, "_unobserveSublayer:", self->mExtraSublayer);
  mExtraSublayer = self->mExtraSublayer;
  if (self->mNextSublayer == mExtraSublayer)
  {
    self->mNextSublayer = 0LL;
    mExtraSublayer = self->mExtraSublayer;
  }

  -[MRLayer cleanup](mExtraSublayer, "cleanup");
  -[NSMutableArray removeObject:](self->mSublayers, "removeObject:", self->mExtraSublayer);
  self->mExtraSublayer = 0LL;
  objc_sync_exit(mSublayers);
}

- (void)_observeSublayer:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "plug"), "container"))
  {
    if (!self->super.mIsReadonly) {
      objc_msgSend( objc_msgSend(a3, "plugAsHaven"),  "addObserver:forKeyPath:options:context:",  self,  @"container",  0,  0);
    }
  }

- (void)_unobserveSublayer:(id)a3
{
  if (([a3 isScheduledForDestruction] & 1) == 0)
  {
    [a3 removeObserver:self forKeyPath:@"timeStamp"];
    if (objc_msgSend(objc_msgSend(a3, "plug"), "container"))
    {
      if (!self->super.mIsReadonly) {
        objc_msgSend(objc_msgSend(a3, "plugAsHaven"), "removeObserver:forKeyPath:", self, @"container");
      }
    }
  }

- (void)_observePlug
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer _observePlug](&v3, "_observePlug");
  -[MCContainer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"plugs",  3LL,  0LL);
}

- (void)_unobservePlug
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer _unobservePlug](&v3, "_unobservePlug");
}

- (void)_observePlugOnPreactivate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
  -[MRLayer _observePlugOnPreactivate](&v3, "_observePlugOnPreactivate");
  if (self->super.mDoAudio)
  {
    -[MCContainer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"audioPlaylist.audioNoVolume",  0LL,  0LL);
    -[MCContainer addObserver:forKeyPath:options:context:]( self->mContainer,  "addObserver:forKeyPath:options:context:",  self,  @"audioPlaylist.builtVolume",  0LL,  0LL);
  }

- (void)_unobservePlugOnDepreactivate
{
  if (self->super.mDoAudio)
  {
    -[MCContainer removeObserver:forKeyPath:]( self->mContainer,  "removeObserver:forKeyPath:",  self,  @"audioPlaylist.audioNoVolume");
    -[MCContainer removeObserver:forKeyPath:]( self->mContainer,  "removeObserver:forKeyPath:",  self,  @"audioPlaylist.builtVolume");
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayerNavigator;
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

- (void)_precomputeAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!self->mSublayerToPrecompute) {
    return;
  }
  if (self->mPrecomputingType == 1)
  {
    if (self->mPrecomputingType == 1) {
      goto LABEL_6;
    }
  }

  if (!-[MRTransition sourceLayer](self->mCurrentTransition, "sourceLayer", a3))
  {
LABEL_6:
    mSublayerToPrecompute = self->mSublayerToPrecompute;
    -[MRLayerClock externalTime](-[MRLayer clock](mSublayerToPrecompute, "clock"), "externalTime");
    if (!-[MRLayer isLoadedForTime:](mSublayerToPrecompute, "isLoadedForTime:")) {
      return;
    }
  }

- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  int mElementToDraw = self->mElementToDraw;
  if (mElementToDraw == 3)
  {
    -[MRRenderer addIDToDisplay::]( self->super.mRenderer,  "addIDToDisplay::",  -[MRTransition transitionID](self->mCurrentTransition, "transitionID"),  -[MRTransition presetID](self->mCurrentTransition, "presetID"));
    mCurrentTransition = self->mCurrentTransition;
    -[MRTransition progress](mCurrentTransition, "progress");
    -[MRTransition renderAtTime:inContext:withArguments:]( mCurrentTransition,  "renderAtTime:inContext:withArguments:",  a4,  a5);
    -[MRTransition progress](self->mCurrentTransition, "progress");
    self->_previouslyRenderedTransitionProgress = v11;
  }

  else
  {
    if (mElementToDraw == 2)
    {
      uint64_t v9 = 30LL;
    }

    else
    {
      if (mElementToDraw != 1) {
        goto LABEL_8;
      }
      uint64_t v9 = 62LL;
    }

    Class v12 = (&self->super.super.isa)[v9];
    objc_msgSend(-[objc_class clock](v12, "clock"), "externalTime");
    -[objc_class renderAtTime:inContext:withArguments:](v12, "renderAtTime:inContext:withArguments:", a4, a5);
  }

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  int mElementToDraw = self->mElementToDraw;
  if ((mElementToDraw - 1) >= 2)
  {
    if (mElementToDraw == 3)
    {
      -[MRRenderer addIDToDisplay::]( self->super.mRenderer,  "addIDToDisplay::",  -[MRTransition transitionID](self->mCurrentTransition, "transitionID"),  -[MRTransition presetID](self->mCurrentTransition, "presetID"));
      mCurrentTransition = self->mCurrentTransition;
      -[MRTransition progress](mCurrentTransition, "progress");
      id v14 = -[MRTransition retainedByUserRenderedImageAtTime:inContext:withArguments:]( mCurrentTransition,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
      -[MRTransition progress](self->mCurrentTransition, "progress");
      self->_previouslyRenderedTransitionProgress = v15;
      return v14;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    if (mElementToDraw == 2) {
      uint64_t v9 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
    }
    id v10 = *(Class *)((char *)&self->super.super.isa + *v9);
    double v11 = (char *)[v10 renderingState];
    v11[240] = 1;
    *((_DWORD *)v11 + 4) = 0;
    *((void *)v11 + 1) = 0LL;
    *((_DWORD *)v11 + 11) = 1065353216;
    *(_OWORD *)(v11 + 28) = xmmword_1F6990;
    v11[244] = self->super.mRenderingState->var19;
    objc_msgSend(objc_msgSend(v10, "clock"), "externalTime");
    id result = objc_msgSend(v10, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
    v11[244] = 0;
  }

  return result;
}

- (void)_prerenderSublayersAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double mForcedTransitionProgress = self->mForcedTransitionProgress;
  if (mForcedTransitionProgress > -1.0)
  {
LABEL_6:
    if (mForcedTransitionProgress <= 1.0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }

  -[MRLayerClock containerTime](self->super.mClock, "containerTime");
  double v8 = v7 - self->mTransitionStartTime;
  double mTotalMotionDuration = 1.0;
  if (!self->mIsInnerTransitioning) {
    double mTotalMotionDuration = self->mTotalMotionDuration;
  }
  if (v8 < mTotalMotionDuration)
  {
    double mForcedTransitionProgress = self->mForcedTransitionProgress;
    goto LABEL_6;
  }

- (void)_getInterestingTimesForSublayerControl
{
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v3;
  mCurrentSublayer = self->mCurrentSublayer;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v5);
  char isKindOfClass = objc_opt_isKindOfClass(mCurrentSublayer, v6);
  double v8 = self->mCurrentSublayer;
  if ((isKindOfClass & 1) != 0)
  {
    id v9 = -[MRLayer effect](v8, "effect");
    [v9 interestingTimeForTime:self->mCurrentSublayerContainerTimeOnTransitionStart];
    self->double mCurrentSublayerInterestingTime = v10;
    objc_msgSend( v9,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mCurrentSublayerLazyDuration,  &self->mCurrentSublayerLazyFactor,  &self->mCurrentSublayerAnimationDuration);
  }

  else
  {
    -[MRLayer phaseInDuration](v8, "phaseInDuration");
    self->double mCurrentSublayerInterestingTime = v12;
    -[MRLayer phaseOutDuration](self->mCurrentSublayer, "phaseOutDuration");
    self->mCurrentSublayerAnimationDuration = v13;
    -[MRLayer duration](self->mCurrentSublayer, "duration");
    self->mCurrentSublayerLazyDuration = v14
                                       - self->mCurrentSublayerInterestingTime
                                       - self->mCurrentSublayerAnimationDuration;
    self->double mCurrentSublayerLazyFactor = 0.0;
  }

  mNextSublayer = self->mNextSublayer;
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v11);
  char v17 = objc_opt_isKindOfClass(mNextSublayer, v16);
  double v18 = self->mNextSublayer;
  if ((v17 & 1) != 0)
  {
    id v19 = -[MRLayer effect](v18, "effect");
    id v20 = v19;
    double v21 = 1000000000.0;
    if (!self->mTransitionIsBackwards) {
      double v21 = 0.0;
    }
    [v19 interestingTimeForTime:v21];
    self->double mNextSublayerInterestingTime = v22;
    objc_msgSend( v20,  "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:",  &self->mNextSublayerLazyDuration,  &self->mNextSublayerLazyFactor,  &self->mNextSublayerAnimationDuration);
  }

  else
  {
    -[MRLayer phaseInDuration](v18, "phaseInDuration");
    self->double mNextSublayerInterestingTime = v23;
    -[MRLayer phaseOutDuration](self->mNextSublayer, "phaseOutDuration");
    self->double mNextSublayerAnimationDuration = v24;
    -[MRLayer duration](self->mNextSublayer, "duration");
    self->double mNextSublayerLazyDuration = v25 - self->mNextSublayerInterestingTime - self->mNextSublayerAnimationDuration;
    self->double mNextSublayerLazyFactor = 0.0;
  }

  if (self->mTransitionIsBackwards)
  {
    double v26 = self->mTransitionDuration
        + (self->mCurrentSublayerContainerTimeOnTransitionStart - self->mCurrentSublayerInterestingTime)
        * self->mCurrentSublayerLazyFactor
        + self->mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
    BOOL v27 = &OBJC_IVAR___MRLayerNavigator_mTotalMotionDuration;
  }

  else
  {
    double v28 = self->mTransitionDuration + self->mCurrentSublayerLazyDuration * self->mCurrentSublayerLazyFactor;
    self->double mTotalMotionDuration = v28;
    double v26 = 1.0;
    if (v28 > 0.0)
    {
      -[MRLayerClock containerTime](-[MRLayer clock](self->mCurrentSublayer, "clock", 1.0), "containerTime");
      double v26 = (v29 - self->mCurrentSublayerInterestingTime)
          * self->mCurrentSublayerLazyFactor
          / self->mTotalMotionDuration;
    }

    self->double mForcedTransitionProgressOffset = v26;
    BOOL v27 = &OBJC_IVAR___MRLayerNavigator_mForcedTransitionProgress;
  }

  *(double *)((char *)&self->super.super.isa + *v27) = v26;
}

@end