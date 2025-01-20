@interface MRLayer
+ (MRLayer)layerWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- ($7518ED76D6D65702929FCC9465E04884)renderingState;
- (BOOL)_isNative3D;
- (BOOL)_setStateValue:(id)a3 forKey:(id)a4;
- (BOOL)enterSlideFocusModeWithState:(id)a3;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)isActivated;
- (BOOL)isAdhocLayer;
- (BOOL)isAlphaFriendly;
- (BOOL)isDimmed;
- (BOOL)isFlatAndSquare;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isPreactivated;
- (BOOL)isScheduledForDestruction;
- (BOOL)isSelected;
- (BOOL)isTriggered;
- (BOOL)needsToSynchronizeTime;
- (BOOL)needsToUpdateGeometry;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)shouldBeActivatedAtTime:(double)a3;
- (BOOL)shouldBePreactivatedAtTime:(double)a3;
- (BOOL)supportsDynamicExpansion;
- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4;
- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4;
- (CGPoint)convertGlobalPoint:(CGPoint)a3;
- (CGPoint)convertLocalPoint:(CGPoint)a3;
- (CGSize)pixelSize;
- (MCPlug)plug;
- (MCPlugHaven)plugAsHaven;
- (MCPlugParallel)plugAsParallel;
- (MCPlugSerial)plugAsSerial;
- (MCTransitionTrigger)nextTransition;
- (MCTransitionTrigger)previousTransition;
- (MRLayer)initWithParameters:(id)a3;
- (MRLayer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (MRLayer)superlayer;
- (MRLayerClock)clock;
- (NSDictionary)animationTriggers;
- (NSDictionary)parameters;
- (NSDictionary)persistentState;
- (NSMutableDictionary)motions;
- (NSString)filterID;
- (NSString)idInSupercontainer;
- (NSString)uuid;
- (double)_serial_gotoNextWithObject:(id)a3;
- (double)_serial_gotoPreviousWithObject:(id)a3;
- (double)doActionTrigger:(id)a3;
- (double)doAnimationTrigger:(id)a3;
- (double)doGenericAction:(id)a3;
- (double)doMotionTrigger:(id)a3;
- (double)doStateOperation:(id)a3;
- (double)duration;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)timeIn;
- (double)timeStamp;
- (id)__retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)actions;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)parentHelper;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)zIndex;
- (unint64_t)index;
- (void)_applyState:(id)a3;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_queueLayerCommand:(int)a3 object:(id)a4;
- (void)_rebuildAudio;
- (void)_sendAction:(id)a3 withStates:(id)a4 async:(BOOL)a5 yesterday:(BOOL)a6;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_setPlug:(id)a3 andSuperlayer:(id)a4;
- (void)_setScissorRectOnContext:(id)a3 saveTo:(int *)a4;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_updateStateWithContext:(id)a3;
- (void)activate;
- (void)animateOpacityTo:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)dealloc;
- (void)depreactivate:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preactivate;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)resumeOrPause:(BOOL)a3;
- (void)scheduleForDestruction;
- (void)setDuration:(double)a3;
- (void)setFilterID:(id)a3;
- (void)setIdInSupercontainer:(id)a3;
- (void)setIsDimmed:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setNeedsToSynchronizeTime:(BOOL)a3;
- (void)setNeedsToUpdateGeometry:(BOOL)a3;
- (void)setNextTransition:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setParentHelper:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setPreviousTransition:(id)a3;
- (void)setTimeIn:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)stampTime;
- (void)synchronizeTime;
- (void)updateGeometry;
@end

@implementation MRLayer

- (MRLayer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v8 = -[MRLayer init](self, "init");
  if (!v8) {
    return v8;
  }
  v8->mSuperlayer = (MRLayer *)a5;
  v8->mUUID = (NSString *)objc_msgSend(objc_msgSend(a3, "objectID"), "copy");
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCPlugProxy, v9);
  if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0
    && (objc_msgSend( -[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"readonly"),  "BOOLValue") & 1) == 0)
  {
    v12 = (NSDictionary *)[a4 mutableCopy];
    v8->mParameters = v12;
    -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", &__kCFBooleanTrue, @"readonly");
    mParameters = v8->mParameters;
  }

  else
  {
    mParameters = (NSDictionary *)a4;
    v8->mParameters = mParameters;
  }

  v8->mRenderer = (MRRenderer *)-[NSDictionary objectForKey:](mParameters, "objectForKey:", @"renderer");
  unsigned int v13 = objc_msgSend( -[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"precomputing"),  "BOOLValue");
  v8->BOOL mIsPrecomputing = v13;
  if (v13)
  {
    LOBYTE(v14) = 0;
    v8->mIsReadonly = 1;
  }

  else
  {
    unsigned __int8 v15 = objc_msgSend( -[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"readonly"),  "BOOLValue");
    BOOL mIsPrecomputing = v8->mIsPrecomputing;
    v8->mIsReadonly = v15;
    if (mIsPrecomputing) {
      LOBYTE(v14) = 0;
    }
    else {
      unsigned int v14 = objc_msgSend( -[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"noAudio"),  "BOOLValue") ^ 1;
    }
  }

  v8->BOOL mDoAudio = v14;
  id v17 = objc_msgSend(objc_msgSend(a3, "container"), "initialState");
  if (v17) {
    v8->mPersistentState = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v17);
  }
  v8->mPixelSize = CGSizeZero;
  v8->mNeedsToUpdateGeometry = 1;
  BOOL mDoAudio = v8->mDoAudio;
  v8->mNeedsToRequestRebuildAudio = mDoAudio;
  v8->mNeedsToRequestRebuildVolume = mDoAudio;
  *(_WORD *)&v8->mIsPreactivated = 0;
  v8->mIsSelected = 0;
  *(_OWORD *)&v8->mTimeStamp = xmmword_1F60B0;
  v8->mLayerCommandQueue = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8->mIsScheduledForDestruction = 0;
  v19 = (MCPlug *)a3;
  v8->mPlug = v19;
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v20);
  char isKindOfClass = objc_opt_isKindOfClass(v19, v21);
  mPlug = v8->mPlug;
  if ((isKindOfClass & 1) != 0) {
    v25 = (MCPlugSerial *)v8->mPlug;
  }
  else {
    v25 = 0LL;
  }
  v8->mPlugAsSerial = v25;
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v23);
  char v27 = objc_opt_isKindOfClass(mPlug, v26);
  v29 = v8->mPlug;
  if ((v27 & 1) != 0) {
    v30 = (MCPlugParallel *)v8->mPlug;
  }
  else {
    v30 = 0LL;
  }
  v8->mPlugAsParallel = v30;
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___MCPlugHaven, v28);
  char v32 = objc_opt_isKindOfClass(v29, v31);
  mPlugAsParallel = 0LL;
  if ((v32 & 1) != 0) {
    mPlugAsParallel = (MCPlugHaven *)v8->mPlug;
  }
  v8->mPlugAsHaven = mPlugAsParallel;
  if (v8->mPlugAsParallel)
  {
    -[MCPlugParallel timeIn](v8->mPlugAsParallel, "timeIn");
    mPlugAsParallel = (MCPlugHaven *)v8->mPlugAsParallel;
    v8->mTimeIn = v34;
    if (mPlugAsParallel)
    {
LABEL_28:
      v8->mIDInSupercontainer = (NSString *)-[NSString copy]( -[MCPlugHaven idInSupercontainer](mPlugAsParallel, "idInSupercontainer"),  "copy");
      return v8;
    }

    goto LABEL_26;
  }

  if (a5)
  {
    v8->mTimeIn = 1.0e36;
LABEL_26:
    mPlugAsParallel = v8->mPlugAsHaven;
  }

  if (mPlugAsParallel) {
    goto LABEL_28;
  }
  mPlugAsSerial = v8->mPlugAsSerial;
  if (mPlugAsSerial) {
    v8->mIndex = -[MCPlugSerial index](mPlugAsSerial, "index");
  }
  return v8;
}

- (MRLayer)initWithParameters:(id)a3
{
  v4 = -[MRLayer init](self, "init");
  if (v4)
  {
    v5 = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef v6 = CFUUIDCreateString(kCFAllocatorDefault, v5);
    v4->mUUID = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"/%@", v6);
    CFRelease(v6);
    CFRelease(v5);
    v7 = (NSDictionary *)a3;
    v4->mParameters = v7;
    v4->mRenderer = (MRRenderer *)-[NSDictionary objectForKey:](v7, "objectForKey:", @"renderer");
    unsigned __int8 v8 = objc_msgSend( -[NSDictionary objectForKey:](v4->mParameters, "objectForKey:", @"precomputing"),  "BOOLValue");
    v4->BOOL mIsPrecomputing = v8;
    if ((v8 & 1) != 0) {
      char v9 = 0;
    }
    else {
      char v9 = objc_msgSend( -[NSDictionary objectForKey:](v4->mParameters, "objectForKey:", @"noAudio"),  "BOOLValue") ^ 1;
    }
    v4->BOOL mDoAudio = v9;
    v4->mNeedsToUpdateGeometry = 1;
    v4->mNeedsToRequestRebuildAudio = v9;
    v4->mNeedsToRequestRebuildVolume = v9;
    v4->mTimeStamp = 1.0;
    v4->mLayerCommandQueue = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4->mTimeIn = 1.0e36;
    v4->_isAdhocLayer = 1;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRLayer;
  -[MRLayer dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mUUID)
  {
    if (self->mIsActivated) {
      -[MRLayer deactivate](self, "deactivate");
    }
    if (self->mIsPreactivated) {
      -[MRLayer depreactivate:](self, "depreactivate:", 0LL);
    }

    self->mSuperlayer = 0LL;
    self->mRenderer = 0LL;

    self->mParameters = 0LL;
    self->mPersistentState = 0LL;
    mIDInSupercontainer = self->mIDInSupercontainer;
    if (mIDInSupercontainer)
    {

      self->mIDInSupercontainer = 0LL;
    }

    self->mPlugAsSerial = 0LL;
    self->mPlugAsParallel = 0LL;
    self->mPlugAsHaven = 0LL;

    self->mPlug = 0LL;
    id mParentHelper = self->mParentHelper;
    if (mParentHelper)
    {

      self->id mParentHelper = 0LL;
    }

    mLayerCommandQueue = self->mLayerCommandQueue;
    objc_sync_enter(mLayerCommandQueue);
    -[NSMutableArray removeAllObjects](self->mLayerCommandQueue, "removeAllObjects");
    CFStringRef v6 = self->mLayerCommandQueue;
    self->mLayerCommandQueue = 0LL;
    objc_sync_exit(mLayerCommandQueue);

    self->mUUID = 0LL;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((objc_msgSend(a3, "isEqualToString:", @"positionRotationAndSize", a4, a5, a6) & 1) == 0
    && ([a3 isEqualToString:@"animationPaths"] & 1) == 0
    && ([a3 isEqualToString:@"opacity"] & 1) == 0
    && ([a3 isEqualToString:@"transition"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"timeIn"])
    {
      mPlugAsParallel = self->mPlugAsParallel;
      if (mPlugAsParallel && (!-[MCPlugParallel isTriggered](mPlugAsParallel, "isTriggered") || !self->mIsActivated))
      {
        -[MCPlugParallel timeIn](self->mPlugAsParallel, "timeIn");
        self->mTimeIn = v9;
        goto LABEL_10;
      }
    }

    else
    {
      if (([a3 isEqualToString:@"size"] & 1) != 0
        || ([a3 isEqualToString:@"currentLayoutIndex"] & 1) != 0)
      {
        BOOL mDoAudio = 1;
        uint64_t v11 = 193LL;
        goto LABEL_14;
      }

      if (![a3 isEqualToString:@"fullDuration"])
      {
        if (([a3 isEqualToString:@"container.initialState"] & 1) == 0)
        {
          if (([a3 isEqualToString:@"audioPlaylist.audioNoVolume"] & 1) != 0
            || ([a3 isEqualToString:@"numberOfLoops"] & 1) != 0)
          {
            uint64_t v13 = 195LL;
          }

          else
          {
            uint64_t v13 = 196LL;
          }

          *((_BYTE *)&self->super.isa + v13) = self->mDoAudio;
          goto LABEL_16;
        }

        BOOL mDoAudio = 1;
        uint64_t v11 = 194LL;
        goto LABEL_14;
      }

      self->mNeedsToResyncClockToPlug = 1;
      v12 = self->mPlugAsParallel;
      if (!v12 || !-[MCPlugParallel isTriggered](v12, "isTriggered") || !self->mIsActivated)
      {
LABEL_10:
        BOOL mDoAudio = self->mDoAudio;
        uint64_t v11 = 195LL;
LABEL_14:
        *((_BYTE *)&self->super.isa + v11) = mDoAudio;
      }
    }
  }

  if (!self->mIsPrecomputing)
  {
    -[MRLayer setNeedsUpdateForPluggerOfSublayer:](self->mSuperlayer, "setNeedsUpdateForPluggerOfSublayer:", self);
    goto LABEL_19;
  }

+ (MRLayer)layerWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  id v8 = [a3 container];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCContainerParallelizer, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    uint64_t v11 = &off_24C650;
  }

  else
  {
    id v12 = [a3 container];
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCContainerSerializer, v13);
    uint64_t v11 = off_24C648;
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
    {
      id v15 = [a3 container];
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___MCContainerNavigator, v16);
      if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0) {
        uint64_t v11 = off_24C640;
      }
    }
  }

  return (MRLayer *)[objc_alloc(*v11) initWithPlug:a3 andParameters:a4 inSuperlayer:a5];
}

- (void)_setPlug:(id)a3 andSuperlayer:(id)a4
{
  mPlug = self->mPlug;
  if (mPlug)
  {
    if (self->mIsPreactivated)
    {
      -[MRLayer _unobservePlugOnDepreactivate](self, "_unobservePlugOnDepreactivate");
      mPlug = self->mPlug;
    }
  }

  id v8 = (MCPlug *)a3;
  self->mPlug = v8;
  self->mPlugAsSerial = 0LL;
  self->mPlugAsParallel = 0LL;
  self->mPlugAsHaven = 0LL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v9);
    char isKindOfClass = objc_opt_isKindOfClass(v10, v11);
    uint64_t v14 = (MCPlugParallel *)self->mPlug;
    if ((isKindOfClass & 1) != 0)
    {
      self->mPlugAsParallel = v14;
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCPlugHaven, v13);
      char v16 = objc_opt_isKindOfClass(v14, v15);
      v18 = (MCPlugHaven *)self->mPlug;
      if ((v16 & 1) != 0)
      {
        self->mPlugAsHaven = v18;
      }

      else
      {
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v17);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
          self->mPlugAsSerial = (MCPlugSerial *)self->mPlug;
        }
      }
    }

    if (self->mIsPreactivated) {
      -[MRLayer _observePlugOnPreactivate](self, "_observePlugOnPreactivate");
    }
  }

  self->mSuperlayer = (MRLayer *)a4;
}

- (MRLayerClock)clock
{
  return self->mClock;
}

- ($7518ED76D6D65702929FCC9465E04884)renderingState
{
  return self->mRenderingState;
}

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->mPixelSize.width || a3.height != self->mPixelSize.height)
  {
    self->mPixelSize = a3;
    if (!self->mIsPrecomputing) {
      -[MRLayer stampTime](self, "stampTime");
    }
  }

- (void)updateGeometry
{
  if (self->mPlugAsParallel)
  {
    mSuperlayer = self->mSuperlayer;
    if (mSuperlayer)
    {
      -[MRLayer pixelSize](mSuperlayer, "pixelSize");
      double v5 = v4;
      double v7 = v6;
      -[MCPlugParallel sizeForParentAspectRatio:](self->mPlugAsParallel, "sizeForParentAspectRatio:", v4 / v6);
      double v9 = round(v5 * v8 * 0.5);
      double v11 = round(v7 * v10 * 0.5);
LABEL_8:
      -[MRLayer setPixelSize:](self, "setPixelSize:", v9, v11);
    }
  }

  else
  {
    if (!self->mPlugAsSerial && !self->mPlugAsHaven)
    {
      mPlug = self->mPlug;
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCPlugSlide, a2);
      if ((objc_opt_isKindOfClass(mPlug, v14) & 1) != 0) {
        goto LABEL_9;
      }
      -[MRRenderer size](self->mRenderer, "size");
      goto LABEL_8;
    }

    id v12 = self->mSuperlayer;
    if (v12)
    {
      -[MRLayer pixelSize](v12, "pixelSize");
      goto LABEL_8;
    }
  }

- (BOOL)hasSomethingToRender
{
  BOOL result = self->mPixelSize.width > 0.0
        && self->mPixelSize.height > 0.0
        && self->mIsActivated
        && (mRenderingState = self->mRenderingState, mRenderingState->var15)
        && mRenderingState->var5 > 0.0
        && mRenderingState->var11 > 0.0;
  return result;
}

- (void)resumeOrPause:(BOOL)a3
{
  if (self->mDoAudio)
  {
    mAudioPlayer = self->mAudioPlayer;
    if (mAudioPlayer)
    {
      BOOL v5 = a3;
      if (a3)
      {
        -[MRAudioPlayer resyncAudioItem](mAudioPlayer, "resyncAudioItem");
        mAudioPlayer = self->mAudioPlayer;
      }

      -[MRAudioPlayer setShouldBePlaying:](mAudioPlayer, "setShouldBePlaying:", v5);
    }
  }

- (void)synchronizeTime
{
  mAudioPlayer = self->mAudioPlayer;
  if (mAudioPlayer) {
    -[MRAudioPlayer resyncAudioItem](mAudioPlayer, "resyncAudioItem");
  }
}

- (double)duration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock fullDuration];
  return result;
}

- (void)setDuration:(double)a3
{
  mClock = self->mClock;
  if (mClock) {
    -[MRLayerClock setFullDuration:](mClock, "setFullDuration:", a3);
  }
  else {
    NSLog(@"Inconsistency error: setting duration on depreactivated layer", a2, a3);
  }
}

- (int64_t)zIndex
{
  return -[MCPlugParallel zIndex](self->mPlugAsParallel, "zIndex");
}

- (void)setZIndex:(int64_t)a3
{
}

- (double)phaseInDuration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock phaseInDuration];
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  mClock = self->mClock;
  if (mClock) {
    -[MRLayerClock setPhaseInDuration:](mClock, "setPhaseInDuration:", a3);
  }
}

- (double)phaseOutDuration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock phaseOutDuration];
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  mClock = self->mClock;
  if (mClock) {
    -[MRLayerClock setPhaseOutDuration:](mClock, "setPhaseOutDuration:", a3);
  }
}

- (double)opacity
{
  mRenderingState = self->mRenderingState;
  if (mRenderingState) {
    return mRenderingState->var11;
  }
  -[MCPlugParallel opacity](self->mPlugAsParallel, "opacity");
  return result;
}

- (void)setOpacity:(double)a3
{
  id mParentHelper = self->mParentHelper;
  -[MCPlugParallel setOpacity:](self->mPlugAsParallel, "setOpacity:");
  objc_msgSend(objc_msgSend(mParentHelper, "plug"), "setOpacity:", a3);
  [mParentHelper setOpacityAnimationPath:0];
  mRenderingState = self->mRenderingState;
  if (mRenderingState)
  {
    float v7 = a3;
    mRenderingState->var11 = v7;
  }

- (void)animateOpacityTo:(double)a3 withDuration:(double)a4
{
  if (a4 <= 0.0)
  {
    -[MRLayer setOpacity:](self, "setOpacity:", a3);
  }

  else
  {
    id mParentHelper = self->mParentHelper;
    id v8 = +[MCAnimationPathKeyframed animationPathWithKey:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "animationPathWithKey:",  @"opacity");
    mRenderingState = self->mRenderingState;
    if (mRenderingState)
    {
      float var11 = mRenderingState->var11;
    }

    else
    {
      -[MCPlugParallel opacity](self->mPlugAsParallel, "opacity");
      float var11 = v11;
    }

    -[MRLayerClock externalTime](self->mClock, "externalTime");
    double v13 = v12;
    *(float *)&double v12 = var11;
    [v8 createKeyframeWithScalar:100 atTime:v12 offsetKind:v13];
    -[MRLayerClock externalTime](self->mClock, "externalTime");
    double v16 = v15 + a4;
    float v14 = a3;
    *(float *)&double v15 = v14;
    [v8 createKeyframeWithScalar:100 atTime:v15 offsetKind:v16];
    [mParentHelper setOpacityAnimationPath:v8];
  }

- (BOOL)isTriggered
{
  return -[MCPlugParallel isTriggered](self->mPlugAsParallel, "isTriggered");
}

- (void)setIsTriggered:(BOOL)a3
{
}

- (void)preactivate
{
  self->mIsPreactivated = 1;
  self->mClock = -[MRLayerClock initWithPlug:](objc_alloc(&OBJC_CLASS___MRLayerClock), "initWithPlug:", self->mPlug);
  if (!self->mIsReadonly) {
    -[MRLayer _observePlugOnPreactivate](self, "_observePlugOnPreactivate");
  }
  if (self->mDoAudio) {
    *(_WORD *)&self->mNeedsToRequestRebuildAudio = 257;
  }
}

- (void)activate
{
  self->mIsActivated = 1;
  self->mNeedsRendering = 1;
  objc_super v3 = ($7518ED76D6D65702929FCC9465E04884 *)calloc(1uLL, 0xF8uLL);
  self->mRenderingState = v3;
  *(_OWORD *)&v3->var4 = xmmword_1F60D0;
  *(_OWORD *)&v3->var8 = xmmword_1F60C0;
  *(_OWORD *)&v3->var0 = xmmword_1F60E0;
  -[MRLayerClock reactivateWithPlug:](self->mClock, "reactivateWithPlug:", self->mPlug);
  id v4 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onPhaseIn");
  if (v4) {
    -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v4,  0LL,  0LL,  0LL);
  }
  if (!self->mIsPrecomputing && !-[MRRenderer isOffscreen](self->mRenderer, "isOffscreen"))
  {
    BOOL v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:]( v5,  "postNotificationName:object:",  kMRNotificationLayerIsIn,  self);
  }

- (void)deactivate
{
  id v3 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onCompletion");
  if (v3) {
    -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v3,  0LL,  0LL,  0LL);
  }
  -[MRLayer resumeOrPause:](self, "resumeOrPause:", 0LL);
  -[MRLayerClock deactivate](self->mClock, "deactivate");
  self->mIsActivated = 0;
  free(self->mRenderingState);
  self->mRenderingState = 0LL;
  -[NSMutableDictionary removeAllObjects](self->mAnimationTriggers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mMotions, "removeAllObjects");
  if (!self->mIsPrecomputing && !-[MRRenderer isOffscreen](self->mRenderer, "isOffscreen"))
  {
    id v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:]( v4,  "postNotificationName:object:",  kMRNotificationLayerIsOut,  self);
  }

- (void)depreactivate:(BOOL)a3
{
  self->mIsPreactivated = 0;

  self->mClock = 0LL;
  mAnimationTriggers = self->mAnimationTriggers;
  if (mAnimationTriggers)
  {

    self->mAnimationTriggers = 0LL;
  }

  mMotions = self->mMotions;
  if (mMotions)
  {

    self->mMotions = 0LL;
  }

  if (!self->mIsReadonly) {
    -[MRLayer _unobservePlugOnDepreactivate](self, "_unobservePlugOnDepreactivate");
  }
  mPlugAsParallel = self->mPlugAsParallel;
  if (!mPlugAsParallel || -[MCPlugParallel isTriggered](mPlugAsParallel, "isTriggered")) {
    self->mTimeIn = 1.0e36;
  }
  -[MRLayer unload](self, "unload");
  if (self->mDoAudio)
  {
    if (self->mAudioPlayer)
    {
      -[MRRenderer removeAudioObject:](self->mRenderer, "removeAudioObject:");

      self->mAudioPlayer = 0LL;
    }
  }

- (BOOL)shouldBePreactivatedAtTime:(double)a3
{
  if (a3 < -6.0) {
    return 0;
  }
  -[MRLayer duration](self, "duration");
  return v5 + 0.1 > a3;
}

- (BOOL)shouldBeActivatedAtTime:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  -[MRLayer duration](self, "duration");
  return v5 > a3;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return self->mIsPreactivated;
}

- (BOOL)isNative3D
{
  BOOL v3 = -[MRLayer _isNative3D](self, "_isNative3D");
  if (v3) {
    LOBYTE(v3) = self->_filterID == 0LL;
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)isAlphaFriendly
{
  return 1;
}

- (BOOL)isFlatAndSquare
{
  BOOL result = 0;
  if (v3[4] == 0.0 && v3[8] == 0.0 && v3[1] == 0.0 && v3[9] == 0.0 && v3[2] == 0.0) {
    return v3[6] == 0.0;
  }
  return result;
}

- (void)_setScissorRectOnContext:(id)a3 saveTo:(int *)a4
{
  float v6 = self->mPixelSize.height / self->mPixelSize.width;
  MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, v26);
  double v7 = MRMatrix_ProjectPoint(v26, -1.0, (float)-v6);
  double v9 = v8;
  double v10 = (v7 + 1.0) * 0.5;
  [a3 pixelSize];
  double v12 = v11 * v10;
  [a3 pixelSize];
  double v14 = (v9 + 1.0) * 0.5 * v13;
  double v15 = MRMatrix_ProjectPoint(v26, 1.0, v6);
  double v17 = v16;
  double v18 = (v15 + 1.0) * 0.5;
  [a3 pixelSize];
  double v20 = v19 * v18;
  [a3 pixelSize];
  double v22 = (v17 + 1.0) * 0.5 * v21;
  v27[0] = (int)v12;
  else {
    double v23 = v14;
  }
  v27[1] = (int)v23;
  v27[2] = (int)(v20 - v12);
  unsigned int v24 = [a3 isFlipped];
  double v25 = v14 - v22;
  if (!v24) {
    double v25 = v22 - v14;
  }
  v27[3] = (int)v25;
  [a3 setScissorRect:v27 saveTo:a4];
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    mIDInSupercontainer = self->mIDInSupercontainer;
    if (mIDInSupercontainer != -[MCPlugParallel idInSupercontainer](mPlugAsParallel, "idInSupercontainer", a4))
    {

      double v10 = self->mPlugAsParallel;
LABEL_7:
      self->mIDInSupercontainer = (NSString *)objc_msgSend(objc_msgSend(v10, "idInSupercontainer"), "copy");
    }
  }

  else
  {
    mPlugAsHaven = self->mPlugAsHaven;
    if (mPlugAsHaven)
    {
      double v12 = self->mIDInSupercontainer;
      if (v12 != -[MCPlugHaven idInSupercontainer](mPlugAsHaven, "idInSupercontainer", a4))
      {

        double v10 = self->mPlugAsHaven;
        goto LABEL_7;
      }
    }

    else
    {
      mPlugAsSerial = self->mPlugAsSerial;
      if (mPlugAsSerial) {
        self->mIndex = -[MCPlugSerial index](mPlugAsSerial, "index", a4);
      }
    }
  }

  if (!self->mIsPreactivated) {
    return 0;
  }
  if (self->mNeedsToUpdateInitialState)
  {
    self->mNeedsToUpdateInitialState = 0;
    double v13 = -[MCContainer initialState](-[MCPlug container](self->mPlug, "container"), "initialState");
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v14 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v66,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v62 != v16) {
            objc_enumerationMutation(v13);
          }
          -[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  -[NSDictionary objectForKey:](v13, "objectForKey:", *(void *)(*((void *)&v61 + 1) + 8LL * (void)i)),  *(void *)(*((void *)&v61 + 1) + 8LL * (void)i));
        }

        id v15 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v66,  16LL);
      }

      while (v15);
    }
  }

  BOOL v18 = self->mIsActivated && self->mNeedsRendering;
  self->mNeedsRendering = 0;
  double v19 = -[MRLayerClock currentLoopIndex](self->mClock, "currentLoopIndex");
  BOOL v20 = -[MRLayerClock _isPaused](self->mClock, "_isPaused");
  unsigned int v21 = -[MRLayerClock isInPhaseOut](self->mClock, "isInPhaseOut");
  if (self->mNeedsToResyncClockToPlug)
  {
    self->mNeedsToResyncClockToPlug = 0;
    -[MRLayerClock syncToPlug:](self->mClock, "syncToPlug:", self->mPlug);
  }

  -[MRLayerClock updateForExternalTime:](self->mClock, "updateForExternalTime:", a3);
  mSuperlayer = self->mSuperlayer;
  if (mSuperlayer) {
    -[MRLayerClock setParentIsPaused:]( self->mClock,  "setParentIsPaused:",  -[MRLayerClock isPaused](-[MRLayer clock](mSuperlayer, "clock"), "isPaused"));
  }
  if ([a5 forcedState])
  {
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v23 = objc_msgSend(objc_msgSend(a5, "forcedState", 0), "objectForKey:", @"actions");
    id v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v58 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = -[MCPlug actionForKey:]( self->mPlug,  "actionForKey:",  *(void *)(*((void *)&v57 + 1) + 8LL * (void)j));
          if (v28) {
            -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v28,  self->mPersistentState,  0LL,  1LL);
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }

      while (v25);
    }
  }

  v29 = self->mPlugAsParallel;
  if (v29 && (!-[MCPlugParallel isTriggered](v29, "isTriggered") || !self->mIsActivated))
  {
    -[MCPlugParallel timeIn](self->mPlugAsParallel, "timeIn");
    self->mTimeIn = v30;
  }

  if (self->mNeedsToUpdateGeometry) {
    -[MRLayer updateGeometry](self, "updateGeometry");
  }
  unsigned int v31 = -[MRLayerClock isPaused](self->mClock, "isPaused");
  if (self->mDoAudio)
  {
    if (self->mNeedsToRequestRebuildAudio
      && !-[MRRenderer ignoresBackgroundAudio](self->mRenderer, "ignoresBackgroundAudio"))
    {
      if (self->mAudioPlayer) {
        -[MRRenderer removeAudioObject:](self->mRenderer, "removeAudioObject:");
      }
      -[MRLayer _rebuildAudio](self, "_rebuildAudio");
      if (self->mAudioPlayer)
      {
        -[MRRenderer addAudioObject:](self->mRenderer, "addAudioObject:");
        char v34 = self->mIsActivated ? v31 : 1;
        if ((v34 & 1) == 0)
        {
          -[MRAudioPlayer resyncAudioItem](self->mAudioPlayer, "resyncAudioItem");
          -[MRAudioPlayer setShouldBePlaying:](self->mAudioPlayer, "setShouldBePlaying:", 1LL);
        }
      }
    }

    else if (self->mNeedsToRequestRebuildVolume)
    {
      mAudioPlayer = self->mAudioPlayer;
      if (mAudioPlayer) {
        -[MRAudioPlayer syncVolumeToAudioPlaylist:]( mAudioPlayer,  "syncVolumeToAudioPlaylist:",  -[MCContainer audioPlaylist](-[MCPlug container](self->mPlug, "container"), "audioPlaylist"));
      }
    }

    *(_WORD *)&self->mNeedsToRequestRebuildAudio = 0;
    if (self->mAudioPlayer)
    {
      -[MRLayerClock containerTime](self->mClock, "containerTime");
      -[MRAudioPlayer setLocalTime:](self->mAudioPlayer, "setLocalTime:");
      if (-[MRLayerClock jumpedBackInTime](self->mClock, "jumpedBackInTime")) {
        -[MRAudioPlayer resyncAudioItem](self->mAudioPlayer, "resyncAudioItem");
      }
    }
  }

  if (!self->mIsActivated) {
    return 0;
  }
  self->mRenderingState->var15 = 1;
  v35 = self->mPlugAsSerial;
  if (v35) {
    char v36 = v31;
  }
  else {
    char v36 = 1;
  }
  if ((v36 & 1) == 0)
  {
    v37 = self->mSuperlayer;
    v38 = -[MCPlugSerial transitionID](v35, "transitionID");
    v39 = self->mPlugAsSerial;
    if (v38) {
      -[MCPlugSerial transitionDuration](v39, "transitionDuration");
    }
    else {
      -[MCPlug phaseOutDuration](v39, "phaseOutDuration");
    }
    double v41 = v40;
    -[MRLayerClock containerTime](self->mClock, "containerTime");
    double v43 = v42;
    -[MRLayer duration](self, "duration");
    double v45 = v44 - v41;
    double v46 = 0.0;
    if (v41 <= 0.0)
    {
      -[MRRenderer timeQuantum](self->mRenderer, "timeQuantum");
      double v46 = -v47;
    }

    double v48 = v43 - v45;
    if (!-[MCPlugSerial transitionID](self->mPlugAsSerial, "transitionID") && v48 >= 0.0)
    {
      v49 = self->mSuperlayer;
      v50 = (char *)-[MCPlugSerial index](self->mPlugAsSerial, "index") + 1;
      if (v50 >= objc_msgSend(-[MRLayer sublayers](v49, "sublayers"), "count"))
      {
        double v51 = (double)-[MRLayerClock currentLoopIndex](-[MRLayer clock](v49, "clock"), "currentLoopIndex");
        -[MRLayerClock numberOfLoops](-[MRLayer clock](v49, "clock"), "numberOfLoops");
        if (v52 + -1.0 <= v51
          || (objc_opt_respondsToSelector( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap") & 1) == 0 || (-[MRRenderingDelegate slideshowShouldWrap]( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap") & 1) == 0)
        {
          double v48 = v48 - v41;
          double v46 = -0.002;
        }
      }
    }

    if (v48 > 0.05)
    {
      -[MRRenderer timeQuantum](self->mRenderer, "timeQuantum");
      double v46 = -v53;
      double v48 = 0.0;
    }

    if (v48 >= v46
      && (-[MRLayer isTransitioning](v37, "isTransitioning") & 1) == 0
      && -[MRLayer isReadyToTransitionToNextSublayer](v37, "isReadyToTransitionToNextSublayer"))
    {
      -[MRLayer transitionToNextSublayerWithDeltaStartTime:](v37, "transitionToNextSublayerWithDeltaStartTime:", v48);
    }
  }

  if (v21 != -[MRLayerClock isInPhaseOut](self->mClock, "isInPhaseOut"))
  {
    id v54 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onPhaseOut");
    if (v54) {
      -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v54,  0LL,  0LL,  0LL);
    }
  }

  if (v20 == v31)
  {
    if (self->mNeedsToSynchronizeTime) {
      -[MRLayer synchronizeTime](self, "synchronizeTime");
    }
  }

  else
  {
    -[MRLayer resumeOrPause:](self, "resumeOrPause:", v20);
  }

  self->mNeedsToSynchronizeTime = 0;
  if (!self->mIsPrecomputing && (void *)-[MRLayerClock currentLoopIndex](self->mClock, "currentLoopIndex") != v19)
  {
    v55 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:]( v55,  "postNotificationName:object:",  kMRNotificationLayerLooped,  self);
    -[NSMutableDictionary removeAllObjects](self->mAnimationTriggers, "removeAllObjects");
  }

  return v18;
}

- (id)__retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(_WORD *)&self->mRenderingState->var17 = 257;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MRLayerParallelizer, a2);
  if ((objc_opt_isKindOfClass(self, v9) & 1) != 0)
  {
    double v10 = -[MRLayer backgroundColor](self, "backgroundColor");
    if (v10) {
      goto LABEL_5;
    }
  }

  if (self->mRenderingState->var19)
  {
    double v10 = [a4 backColor];
LABEL_5:
    double v11 = v10 + 1;
    double v12 = v10 + 2;
    double v13 = (float *)(v10 + 3);
    goto LABEL_7;
  }

  double v11 = (int *)&v24;
  double v12 = (_DWORD *)&v23 + 1;
  double v13 = (float *)&v23;
  double v10 = (_DWORD *)&v24 + 1;
LABEL_7:
  int v14 = *v11;
  v26[0] = *v10;
  v26[1] = v14;
  float v15 = *v13;
  if (self->mRenderingState->var19) {
    float v15 = 1.0;
  }
  v26[2] = *v12;
  *(float *)&v26[3] = v15;
  if (-[MRLayer isOpaque](self, "isOpaque") && !self->mRenderingState->var19) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = v26;
  }
  id v17 = objc_msgSend( a4,  "beginLocalContextWithSize:backgroundColor:state:",  v16,  v25,  self->mPixelSize.width,  self->mPixelSize.height);
  BOOL v18 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  double v19 = v18;
  if (v18 != [v17 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v17 glContext]);
  }
  CGFloat v20 = self->mPixelSize.width / self->mPixelSize.height;
  *(float *)&CGFloat v20 = v20;
  [v17 setLocalAspectRatio:v20];
  objc_msgSend(v17, "setBackColor:saveTo:", objc_msgSend(a4, "backColor"), 0);
  -[MRLayer _renderAtTime:inContext:withArguments:](self, "_renderAtTime:inContext:withArguments:", v17, a5, a3);
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v18) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v18);
  }

  id v21 = [a4 retainedByUserImageByEndingLocalContext:v17 andRestoreState:v25];
  [v21 setSourceTimestamp:self->mTimeStamp];
  [v21 setRenderTime:a3];
  return v21;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!-[MRLayer hasSomethingToRender](self, "hasSomethingToRender")) {
    return;
  }
  -[MRLayer _updateStateWithContext:](self, "_updateStateWithContext:", a4);
  unsigned __int8 v9 = -[MRLayer isNative3D](self, "isNative3D");
  mRenderingState = self->mRenderingState;
  mRenderingState->var16 = v9 ^ 1;
  *(_WORD *)&mRenderingState->var17 = 0;
  if (!-[MRLayer isInfinite](self, "isInfinite"))
  {
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, v68);
    CGFloat v11 = self->mPixelSize.height / self->mPixelSize.width;
    v66[0] = -0.99999;
    float v12 = 0.00001 - v11;
    v66[1] = v12;
    uint64_t v67 = 0x3F80000000000000LL;
    v62[0] = -0.99999;
    *(float *)&CGFloat v11 = v11 + -0.00001;
    v62[1] = *(float *)&v11;
    uint64_t v63 = 0x3F80000000000000LL;
    v58[0] = 0.99999;
    v58[1] = v12;
    uint64_t v59 = 0x3F80000000000000LL;
    v54[0] = 0.99999;
    v54[1] = *(float *)&v11;
    uint64_t v55 = 0x3F80000000000000LL;
    MRMatrix_TransformVector(v68, v66, (float *)&v64);
    MRMatrix_TransformVector(v68, v62, &v60);
    MRMatrix_TransformVector(v68, v58, &v56);
    MRMatrix_TransformVector(v68, v54, (float *)v53);
    double v47 = -v65;
    double v48 = v47;
    double v49 = v47;
    double v50 = v65;
    double v51 = v65;
    double v52 = v47;
    v46[0] = v65;
    v46[1] = v65;
    v46[2] = v47;
    v46[3] = v65;
    v46[4] = v65;
    v46[5] = v47;
    float64x2_t v41 = vcvtq_f64_f32(v64);
    double v42 = v60;
    double v43 = v61;
    double v44 = v56;
    double v45 = v57;
    float64x2_t v36 = vcvtq_f64_f32(v53[0]);
    double v37 = v60;
    double v38 = v61;
    double v39 = v56;
    double v40 = v57;
    if (TrianglesAreDisjoint(&v47, v41.f64)
      && TrianglesAreDisjoint(&v47, v36.f64)
      && TrianglesAreDisjoint(v46, v41.f64)
      && TrianglesAreDisjoint(v46, v36.f64))
    {
      return;
    }
  }

  double v13 = +[EAGLContext currentContext]( &OBJC_CLASS___EAGLContext,  "currentContext",  *(_OWORD *)&v36,  *(void *)&v37,  *(void *)&v38,  *(void *)&v39,  *(void *)&v40);
  int v14 = v13;
  if (v13 != [a4 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [a4 glContext]);
  }
  if (self->mIsDimmed)
  {
    unsigned __int8 v15 = -[MRLayer isDimmed](self->mSuperlayer, "isDimmed");
    uint64_t v16 = self->mRenderingState;
    if ((v15 & 1) == 0) {
      v16->var10 = v16->var10 * 0.5;
    }
  }

  else
  {
    uint64_t v16 = self->mRenderingState;
  }

  [a4 setModelViewMatrix:v16->var13 saveTo:v68];
  id v17 = self->mRenderingState;
  *(float *)&double v18 = v17->var10;
  *(float *)&double v19 = v17->var11;
  LODWORD(v20) = LODWORD(v18);
  LODWORD(v21) = LODWORD(v18);
  [a4 composeForeColorRed:&v47 green:v18 blue:v20 alpha:v21 saveTo:v19];
  [a4 localAspectRatio];
  int v23 = v22;
  CGFloat v24 = self->mPixelSize.width / self->mPixelSize.height;
  *(float *)&CGFloat v24 = v24;
  [a4 setLocalAspectRatio:v24];
  id v25 = self->mRenderingState;
  float v26 = *((float *)&v48 + 1) * v25->var11;
  if (!v25->var16)
  {
    if (v26 < 1.0) {
      uint64_t v29 = 3LL;
    }
    else {
      uint64_t v29 = 0LL;
    }
    [a4 blend:v29];
    if (-[MCPlugParallel clipsContainer](self->mPlugAsParallel, "clipsContainer")
      && -[MRLayer isFlatAndSquare](self, "isFlatAndSquare"))
    {
      -[MRLayer _setScissorRectOnContext:saveTo:](self, "_setScissorRectOnContext:saveTo:", a4, v46);
      -[MRLayer _renderAtTime:inContext:withArguments:](self, "_renderAtTime:inContext:withArguments:", a4, a5, a3);
      [a4 restoreScissorRect:v46];
    }

    else
    {
      -[MRLayer _renderAtTime:inContext:withArguments:](self, "_renderAtTime:inContext:withArguments:", a4, a5, a3);
    }

    if (v26 < 1.0) {
      [a4 blend:0];
    }
    goto LABEL_35;
  }

  if (-[MRLayer _isNative3D](self, "_isNative3D")) {
    id v27 = -[MRLayer __retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "__retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }
  else {
    id v27 = -[MRLayer _retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "_retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  }
  double v30 = v27;
  if (v27)
  {
    BOOL v31 = v26 >= 1.0;
    [v27 setFilterID:self->_filterID];
    unsigned int v32 = -[MRLayer isOpaque](self, "isOpaque");
    char v33 = v31 & v32;
    if ((v31 & v32) != 0) {
      uint64_t v34 = 0LL;
    }
    else {
      uint64_t v34 = 2LL;
    }
    [a4 blend:v34];
    if ([v30 filterID] || objc_msgSend(v30, "shader"))
    {
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v30,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
      if ((v33 & 1) != 0)
      {
LABEL_31:
        [v30 releaseByUser];
        goto LABEL_35;
      }
    }

    else
    {
      else {
        v35 = @"PlainTexture";
      }
      [a4 setShader:v35];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v30,  a4,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
      [a4 unsetShader];
      if ((v33 & 1) != 0) {
        goto LABEL_31;
      }
    }

    [a4 blend:0];
    goto LABEL_31;
  }

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (-[MRLayer hasSomethingToRender](self, "hasSomethingToRender"))
  {
    -[MRLayer _updateStateWithContext:](self, "_updateStateWithContext:", a4);
    mRenderingState = self->mRenderingState;
    *(_WORD *)&mRenderingState->var16 = 1;
    mRenderingState->var18 = 0;
    if (-[MRLayer _isNative3D](self, "_isNative3D")) {
      id v10 = -[MRLayer __retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "__retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    }
    else {
      id v10 = -[MRLayer _retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "_retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
    }
    id v17 = v10;
    [v10 setFilterID:self->_filterID];
  }

  else
  {
    BOOL var19 = self->mRenderingState->var19;
    id v12 = [a4 imageManager];
    id v13 = v12;
    if (var19)
    {
      id v14 = [a4 backColor];
      double width = 1.0;
      double height = 1.0;
      id v12 = v13;
    }

    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      id v14 = 0LL;
    }

    id v17 = objc_msgSend(v12, "retainedByUserImageWithSize:andColor:", v14, width, height);
    [v17 setLabel:@"Marimba Layer Background"];
    [v17 setClampMode:2];
  }

  [v17 setSourceTimestamp:self->mTimeStamp];
  [v17 setRenderTime:a3];
  return v17;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0LL;
  }
  id v6 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [a4 localAspectRatio];
  double v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7),  @"rectangle",  0);
  unsigned __int8 v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (BOOL)supportsDynamicExpansion
{
  return 0;
}

- (void)stampTime
{
  self->mTimeStamp = MRGetCurrentTime();
  self->mNeedsRendering = 1;
  -[MRLayer didChangeValueForKey:](self, "didChangeValueForKey:", @"timeStamp");
}

- (void)scheduleForDestruction
{
  self->mIsScheduledForDestruction = 1;
}

- (BOOL)hasAudio
{
  return 0;
}

- (CGPoint)convertLocalPoint:(CGPoint)a3
{
  if (self->mIsActivated)
  {
    double x = a3.x;
    double v4 = a3.y * (self->mPixelSize.height / self->mPixelSize.width);
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, v7);
    double v5 = MRMatrix_ProjectPoint(v7, x, v4);
  }

  else
  {
    double v5 = CGPointZero.x;
    double y = CGPointZero.y;
  }

  result.double y = y;
  result.double x = v5;
  return result;
}

- (CGPoint)convertGlobalPoint:(CGPoint)a3
{
  if (self->mIsActivated)
  {
    double y = a3.y;
    double x = a3.x;
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, v10);
    MRMatrix_Invert(v10, v9);
    double v6 = MRMatrix_UnprojectPoint(v9, x, y);
    double v8 = v7 * (self->mPixelSize.width / self->mPixelSize.height);
  }

  else
  {
    double v6 = CGPointZero.x;
    double v8 = CGPointZero.y;
  }

  result.double y = v8;
  result.double x = v6;
  return result;
}

- (void)_applyState:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        v7 |= -[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  [a3 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)],  *(void *)(*((void *)&v11 + 1) + 8 * (void)i));
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
    if ((v7 & 1) != 0)
    {
      id v10 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onStateChange");
      if (v10) {
        -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v10,  0LL,  0LL,  1LL);
      }
    }
  }

- (id)actions
{
  return -[MCPlug actions](self->mPlug, "actions");
}

- (double)doAnimationTrigger:(id)a3
{
  double v3 = 0.0;
  if (self->mIsActivated)
  {
    id v6 = -[MCPlug animationPathForKey:]( self->mPlug,  "animationPathForKey:",  objc_msgSend(objc_msgSend(a3, "mcAction"), "animationKey"));
    if (v6)
    {
LABEL_14:
      [a3 time];
      if (v16 != -1.0e10) {
        -[MRLayerClock externalTime](self->mClock, "externalTime");
      }
      objc_msgSend(a3, "setTime:");
      mAnimationTriggers = self->mAnimationTriggers;
      if (!mAnimationTriggers)
      {
        mAnimationTriggers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        self->mAnimationTriggers = mAnimationTriggers;
      }

      id v18 = -[NSMutableDictionary objectForKey:](mAnimationTriggers, "objectForKey:", [v6 key]);
      if (v18)
      {
        double v19 = v18;
        [v18 setAction:a3];
        [v19 disarm];
      }

      else
      {
        -[NSMutableDictionary setObject:forKey:]( self->mAnimationTriggers,  "setObject:forKey:",  -[MRAnimationTrigger initWithAction:]([MRAnimationTrigger alloc], "initWithAction:", a3),  [v6 key]);
      }

      id v20 = objc_msgSend(objc_msgSend(v6, "orderedKeyframesWithPlugTiming:", self->mPlug), "lastObject");
      if (v20)
      {
        int v22 = v20;
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___MCAnimationKeyframeFunction, v21);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
        {
          [v22 timeOffset];
          [v22 duration];
          TimeForKeyframeAttributesInPlug([v22 timeOffsetKind], 0, self->mPlug);
        }

        else
        {
          +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:]( &OBJC_CLASS___MCAnimationPathKeyframed,  "timeForKeyframe:withPlugTiming:",  v22,  self->mPlug);
        }

        return v24;
      }
    }

    else
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      int v7 = -[MCPlug animationPaths](self->mPlug, "animationPaths", 0LL);
      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      if (v8)
      {
        id v10 = v8;
        uint64_t v11 = *(void *)v27;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v7);
            }
            __int128 v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v9);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            {
              id v15 = objc_msgSend( v13,  "animationPathForKey:",  objc_msgSend(objc_msgSend(a3, "mcAction"), "animationKey"));
              if (v15)
              {
                id v6 = v15;
                goto LABEL_14;
              }
            }
          }

          id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
  }

  return v3;
}

- (double)_serial_gotoNextWithObject:(id)a3
{
  unint64_t v5 = -[MCPlugSerial index](self->mPlugAsSerial, "index");
  mSuperlayer = self->mSuperlayer;
  unint64_t v7 = v5 + 1;
  id v8 = objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
  objc_msgSend(objc_msgSend(-[MRLayer currentSublayer](mSuperlayer, "currentSublayer"), "clock"), "pauseOnNextUpdate");
  mPlugAsSerial = self->mPlugAsSerial;
  id v10 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( &OBJC_CLASS___MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0LL,  -[MCPlugSerial transitionID](mPlugAsSerial, "transitionID"));
  objc_msgSend( v10,  "setTransitionAttributes:",  -[MCPlugSerial transitionAttributes](mPlugAsSerial, "transitionAttributes"));
  -[MCPlugSerial transitionDuration](mPlugAsSerial, "transitionDuration");
  objc_msgSend(v10, "setTransitionDuration:");
  else {
    uint64_t v11 = v7;
  }
  [v10 setTransitionDestinationPlugID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", v11)];
  -[MRLayer doTransition:backwards:pzr:](mSuperlayer, "doTransition:backwards:pzr:", v10, 0LL, a3);
  return result;
}

- (double)_serial_gotoPreviousWithObject:(id)a3
{
  unint64_t v5 = -[MCPlugSerial index](self->mPlugAsSerial, "index");
  mSuperlayer = self->mSuperlayer;
  if (!v5) {
    unint64_t v5 = (char *)objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
  }
  unint64_t v7 = v5 - 1;
  objc_msgSend(objc_msgSend(-[MRLayer currentSublayer](mSuperlayer, "currentSublayer"), "clock"), "pauseOnNextUpdate");
  id v8 = -[MCContainer plugAtIndex:]( -[MCPlug container](-[MRLayer plug](mSuperlayer, "plug"), "container"),  "plugAtIndex:",  v7);
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0,  [v8 transitionID]);
  objc_msgSend(v9, "setTransitionAttributes:", objc_msgSend(v8, "transitionAttributes"));
  [v8 transitionDuration];
  objc_msgSend(v9, "setTransitionDuration:");
  [v9 setTransitionDestinationPlugID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", v7)];
  -[MRLayer doTransition:backwards:pzr:](mSuperlayer, "doTransition:backwards:pzr:", v9, 1LL, a3);
  return result;
}

- (MCTransitionTrigger)nextTransition
{
  mPlugAsSerial = self->mPlugAsSerial;
  if (!mPlugAsSerial) {
    return (MCTransitionTrigger *)-[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onNext");
  }
  double v4 = (char *)-[MCPlugSerial index](mPlugAsSerial, "index") + 1;
  mSuperlayer = self->mSuperlayer;
  if (v4 >= objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count"))
  {
    double v9 = (double)-[MRLayerClock currentLoopIndex](-[MRLayer clock](mSuperlayer, "clock"), "currentLoopIndex");
    -[MRLayerClock numberOfLoops](-[MRLayer clock](mSuperlayer, "clock"), "numberOfLoops");
    if (v10 + -1.0 <= v9
      || (objc_opt_respondsToSelector( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap") & 1) == 0)
    {
      return 0LL;
    }

    double v4 = 0LL;
    unint64_t v7 = 0LL;
    if (!-[MRRenderingDelegate slideshowShouldWrap]( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap")) {
      return v7;
    }
  }

  id v6 = self->mPlugAsSerial;
  unint64_t v7 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( &OBJC_CLASS___MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0LL,  -[MCPlugSerial transitionID](v6, "transitionID"));
  -[MCTransitionTrigger setTransitionAttributes:]( v7,  "setTransitionAttributes:",  -[MCPlugSerial transitionAttributes](v6, "transitionAttributes"));
  -[MCPlugSerial transitionDuration](v6, "transitionDuration");
  -[MCTransitionTrigger setTransitionDuration:](v7, "setTransitionDuration:");
  -[MCTransitionTrigger setTransitionDestinationPlugID:]( v7,  "setTransitionDestinationPlugID:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v4));
  return v7;
}

- (void)setNextTransition:(id)a3
{
}

- (MCTransitionTrigger)previousTransition
{
  mPlugAsSerial = self->mPlugAsSerial;
  if (!mPlugAsSerial) {
    return (MCTransitionTrigger *)-[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onPrevious");
  }
  double v4 = -[MCPlugSerial index](mPlugAsSerial, "index");
  mSuperlayer = self->mSuperlayer;
  if (!v4)
  {
    if ((objc_opt_respondsToSelector( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap") & 1) == 0 || !-[MRRenderingDelegate slideshowShouldWrap]( -[MRRenderer renderingDelegate](self->mRenderer, "renderingDelegate"),  "slideshowShouldWrap"))
    {
      return 0LL;
    }

    double v4 = (char *)objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
  }

  id v6 = v4 - 1;
  id v7 = -[MCContainer plugAtIndex:]( -[MCPlug container](-[MRLayer plug](mSuperlayer, "plug"), "container"),  "plugAtIndex:",  v4 - 1);
  id v8 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0,  [v7 transitionID]);
  -[MCTransitionTrigger setTransitionAttributes:]( v8,  "setTransitionAttributes:",  [v7 transitionAttributes]);
  [v7 transitionDuration];
  -[MCTransitionTrigger setTransitionDuration:](v8, "setTransitionDuration:");
  -[MCTransitionTrigger setTransitionDestinationPlugID:]( v8,  "setTransitionDestinationPlugID:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v6));
  return v8;
}

- (void)setPreviousTransition:(id)a3
{
}

- (double)doActionTrigger:(id)a3
{
  if (self->mIsActivated)
  {
    id v5 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", objc_msgSend(objc_msgSend(a3, "mcAction"), "actionKey"));
    if (v5) {
      -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v5,  [a3 states],  0,  0);
    }
    else {
      NSLog( @"Error: couldn't find action %@ on layer %@",  objc_msgSend(objc_msgSend(a3, "mcAction"), "actionKey"),  self);
    }
  }

  return 0.0;
}

- (double)doStateOperation:(id)a3
{
  id v5 = [a3 mcAction];
  id v6 = [v5 stateKey];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCStateOperationStringSet, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    double v10 = (NSNumber *)[v5 string];
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MCStateOperationExpression, v9);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
    {
      __int128 v12 = -[MUMathExpressionFloatBased initWithString:error:]( [MUMathExpressionFloatBased alloc],  "initWithString:error:",  [v5 expression],  0);
      id v13 = [a3 states];
      if (v13) {
        -[MUMathExpressionFloatBased setVariableValues:](v12, "setVariableValues:", v13);
      }
      if (self->mPersistentState) {
        -[MUMathExpressionFloatBased setVariableValues:](v12, "setVariableValues:");
      }
      -[MUMathExpressionFloatBased evaluate](v12, "evaluate");
      float v15 = v14;
    }

    else
    {
      [v5 scalar];
      float v15 = v16;
    }

    *(float *)&double v16 = v15;
    double v10 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v16);
  }

  unsigned __int8 v17 = -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", v10, v6);
  if ([v5 recordsTime])
  {
    mClock = self->mClock;
    if (mClock)
    {
      -[MRLayerClock containerTime](mClock, "containerTime");
      *(float *)&double v18 = v18;
    }

    else
    {
      LODWORD(v18) = -803929351;
    }

    -[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18),  [v6 stringByAppendingString:@"Time"]);
  }

  if ((v17 & 1) != 0 || [v5 alwaysNotifies])
  {
    id v20 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onStateChange");
    if (v20) {
      -[MRLayer _sendAction:withStates:async:yesterday:]( self,  "_sendAction:withStates:async:yesterday:",  v20,  0LL,  0LL,  0LL);
    }
  }

  return 0.0;
}

- (double)doMotionTrigger:(id)a3
{
  id v5 = [a3 mcAction];
  [v5 duration];
  double v7 = v6;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCMotionTriggerScalar, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    [v5 value];
    double v11 = v10;
  }

  else
  {
    __int128 v12 = -[MUMathExpressionFloatBased initWithString:error:]( [MUMathExpressionFloatBased alloc],  "initWithString:error:",  [v5 expression],  0);
    id v13 = [a3 states];
    if (v13) {
      -[MUMathExpressionFloatBased setVariableValues:](v12, "setVariableValues:", v13);
    }
    if (self->mPersistentState) {
      -[MUMathExpressionFloatBased setVariableValues:](v12, "setVariableValues:");
    }
    id v14 = [v5 attributes];
    if (v14) {
      -[MUMathExpressionFloatBased setVariableValues:](v12, "setVariableValues:", v14);
    }
    -[MUMathExpressionFloatBased evaluate](v12, "evaluate");
    double v11 = v15;
  }

  double v16 = objc_alloc(&OBJC_CLASS___MRMotion);
  id v17 = [v5 key];
  [v5 easeIn];
  double v19 = v18;
  [v5 easeOut];
  uint64_t v21 = -[MRMotion initWithKey:value:duration:easeIn:easeOut:]( v16,  "initWithKey:value:duration:easeIn:easeOut:",  v17,  v11,  v7,  v19,  v20);
  mMotions = self->mMotions;
  if (mMotions)
  {
    id v23 = -[NSMutableDictionary objectForKey:](mMotions, "objectForKey:", [v5 key]);
    if (v23)
    {
      double v24 = v23;
      -[MRLayerClock containerTime](-[MRLayer clock](self, "clock"), "containerTime");
      double v26 = v25;
      -[MRMotion setStartTime:](v21, "setStartTime:");
      [v24 valueAtTime:v26];
      -[MRMotion setStartValue:](v21, "setStartValue:");
    }

    -[NSMutableDictionary setObject:forKey:](self->mMotions, "setObject:forKey:", v21, [v5 key]);
  }

  else
  {
    self->mMotions = -[NSMutableDictionary initWithObjectsAndKeys:]( [NSMutableDictionary alloc],  "initWithObjectsAndKeys:",  v21,  [v5 key],  0);
  }

  return v7;
}

- (double)doGenericAction:(id)a3
{
  if (!self->mIsActivated) {
    return 0.0;
  }
  id v5 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
  id v6 = [v5 objectForKey:@"type"];
  if ([v6 isEqualToString:@"stateForward"])
  {
    id v7 = [v5 objectForKey:@"sourceStateKey"];
    if (!v7) {
      return 0.0;
    }
    id v8 = v7;
    id v9 = [v5 objectForKey:@"destinationStateKey"];
    id v10 = v9 ? v9 : v8;
    if (!-[MRLayer _setStateValue:forKey:]( self,  "_setStateValue:forKey:",  objc_msgSend(objc_msgSend(a3, "states"), "objectForKey:", v8),  v10)) {
      return 0.0;
    }
    id v11 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", @"onStateChange");
    if (!v11) {
      return 0.0;
    }
    id v12 = v11;
    id v13 = self;
    uint64_t v14 = 0LL;
LABEL_10:
    -[MRLayer _sendAction:withStates:async:yesterday:]( v13,  "_sendAction:withStates:async:yesterday:",  v12,  0LL,  0LL,  v14);
    return 0.0;
  }

  if ([v6 isEqualToString:@"pauseOrResume"])
  {
    unsigned int v15 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"resume"), "BOOLValue");
    mClock = self->mClock;
    if (v15) {
      -[MRLayerClock resumeOnNextUpdate](mClock, "resumeOnNextUpdate");
    }
    else {
      -[MRLayerClock pauseOnNextUpdate](mClock, "pauseOnNextUpdate");
    }
    return 0.0;
  }

  if ([v6 isEqualToString:@"goBack"])
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___MRLayerNavigator, v17);
    if ((objc_opt_isKindOfClass(self, v18) & 1) != 0)
    {
      -[MRLayer goBack](self, "goBack");
      return result;
    }

    NSLog(@"Consistency error: 'goBack' action can only be sent to MRLayerNavigator");
    return 0.0;
  }

  if (![v6 isEqualToString:@"goForth"])
  {
    if ([v6 isEqualToString:@"setState"])
    {
      id v21 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes"), "objectForKey:", @"state");
      if (v21) {
        -[MRLayer _applyState:](self, "_applyState:", v21);
      }
      return 0.0;
    }

    if (![v6 isEqualToString:@"loadState"])
    {
      if ([v6 isEqualToString:@"saveState"])
      {
        id v31 = [a3 sender];
        uint64_t v33 = objc_opt_class(&OBJC_CLASS___MRLayer, v32);
        if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0)
        {
          id v34 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
          v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v36 = [v34 objectForKey:@"stateKeys"];
          id v37 = objc_msgSend(objc_msgSend(a3, "sender"), "persistentState");
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          id v38 = [v36 countByEnumeratingWithState:&v56 objects:v64 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v57;
            do
            {
              for (i = 0LL; i != v39; i = (char *)i + 1)
              {
                if (*(void *)v57 != v40) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v42 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)i);
                id v43 = [v37 objectForKey:v42];
                if (v43) {
                  -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v43, v42);
                }
              }

              id v39 = [v36 countByEnumeratingWithState:&v56 objects:v64 count:16];
            }

            while (v39);
          }

          if (-[NSMutableDictionary count](v35, "count"))
          {
            mPersistentState = self->mPersistentState;
            if (!mPersistentState)
            {
              mPersistentState = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              self->mPersistentState = mPersistentState;
            }

            -[NSMutableDictionary setObject:forKey:]( mPersistentState,  "setObject:forKey:",  v35,  [v34 objectForKey:@"blobKey"]);
          }
        }

        else
        {
          NSLog(@"Consistency error: 'saveState' action can only be sent to MRLayers");
        }
      }

      return 0.0;
    }

    id v22 = [a3 sender];
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___MRLayer, v23);
    if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
    {
      NSLog(@"Consistency error: 'loadState' action can only be sent to MRLayers");
      return 0.0;
    }

    double v25 = (MRLayer *)[a3 sender];
    id v26 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
    id v27 = [v26 objectForKey:@"blobKey"];
    if (v27 && (id v28 = v27, (v29 = self->mPersistentState) != 0LL)) {
      id v30 = -[NSMutableDictionary objectForKey:](v29, "objectForKey:", v28);
    }
    else {
      id v30 = 0LL;
    }
    id v45 = [v26 objectForKey:@"stateKeys"];
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v46 = [v45 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (!v46) {
      return 0.0;
    }
    id v47 = v46;
    int v48 = 0;
    uint64_t v49 = *(void *)v61;
    do
    {
      for (j = 0LL; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)j);
        if (v30)
        {
          id v52 = [v30 objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * (void)j)];
          id v53 = [v45 objectForKey:v51];
          if (v52)
          {
            v48 |= [v52 isEqual:v53] ^ 1;
            id v53 = v52;
          }
        }

        else
        {
          id v53 = [v45 objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * (void)j)];
        }

        -[MRLayer _setStateValue:forKey:](v25, "_setStateValue:forKey:", v53, v51);
      }

      id v47 = [v45 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }

    while (v47);
    if ((v48 & 1) == 0) {
      return 0.0;
    }
    id v54 = -[MCPlug actionForKey:](-[MRLayer plug](v25, "plug"), "actionForKey:", @"onStateChange");
    if (!v54) {
      return 0.0;
    }
    id v12 = v54;
    id v13 = v25;
    uint64_t v14 = 1LL;
    goto LABEL_10;
  }

  uint64_t v20 = objc_opt_class(&OBJC_CLASS___MRLayerNavigator, v19);
  if ((objc_opt_isKindOfClass(self, v20) & 1) != 0)
  {
    -[MRLayer goForth](self, "goForth");
    return result;
  }

  NSLog(@"Consistency error: 'goForth' action can only be sent to MRLayerNavigator");
  return 0.0;
}

- (void)_updateStateWithContext:(id)a3
{
  mRenderingState = (float32x2_t *)self->mRenderingState;
  float v6 = (float)(mRenderingState->f32[0] * mRenderingState[2].f32[1]) * 0.5;
  if (v6 != 1.0)
  {
    mRenderingState[6] = vmul_n_f32(mRenderingState[6], v6);
    mRenderingState[7].f32[0] = v6 * mRenderingState[7].f32[0];
    mRenderingState[8] = vmul_n_f32(mRenderingState[8], v6);
    mRenderingState[9].f32[0] = v6 * mRenderingState[9].f32[0];
    mRenderingState[10] = vmul_n_f32(mRenderingState[10], v6);
    mRenderingState[11].f32[0] = v6 * mRenderingState[11].f32[0];
  }

  float v7 = mRenderingState[3].f32[0];
  if (v7 != 1.0)
  {
    mRenderingState[7].f32[0] = v7 * mRenderingState[7].f32[0];
    mRenderingState[9].f32[0] = v7 * mRenderingState[9].f32[0];
    mRenderingState[11].f32[0] = v7 * mRenderingState[11].f32[0];
  }

  mRenderingState[12] = mRenderingState[1];
  if (self->mSuperlayer)
  {
    [a3 localAspectRatio];
    mRenderingState = (float32x2_t *)self->mRenderingState;
    mRenderingState[12].f32[1] = mRenderingState[12].f32[1] / v8;
  }

  mRenderingState[13].i32[0] = mRenderingState[2].i32[0];
  mSuperlayer = self->mSuperlayer;
  if (!mSuperlayer)
  {
    var12 = (float *)&mRenderingState[6];
    goto LABEL_11;
  }

  id v10 = -[MRLayer renderingState](mSuperlayer, "renderingState");
  var12 = self->mRenderingState->var12;
  if (v10->var17)
  {
LABEL_11:
    *(float *)&double v14 = MRMatrix_MultiplyWithMatrix( var12,  (float *)[a3 modelViewMatrix],  self->mRenderingState->var13);
    id v13 = (__int128 *)objc_msgSend(a3, "projectionMatrix", v14);
    goto LABEL_12;
  }

  *(float *)&double v12 = MRMatrix_MultiplyWithMatrix( var12,  (float *)-[MRLayer renderingState](self->mSuperlayer, "renderingState") + 28,  self->mRenderingState->var13);
  id v13 = (__int128 *)((char *)-[MRLayer renderingState](self->mSuperlayer, "renderingState", v12) + 176);
LABEL_12:
  unsigned int v15 = self->mRenderingState;
  __int128 v16 = *v13;
  __int128 v17 = v13[1];
  __int128 v18 = v13[3];
  *(_OWORD *)&v15->var14[8] = v13[2];
  *(_OWORD *)&v15->var14[12] = v18;
  *(_OWORD *)v15->var14 = v16;
  *(_OWORD *)&v15->var14[4] = v17;
}

- (void)_sendAction:(id)a3 withStates:(id)a4 async:(BOOL)a5 yesterday:(BOOL)a6
{
  BOOL v7 = a5;
  double v14 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self->mRenderer);
  -[MRAction setSender:](v14, "setSender:", self);
  if (a4)
  {
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a4);
    id v11 = v10;
    if (self->mPersistentState) {
      -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:");
    }
  }

  else if (self->mPersistentState)
  {
    id v11 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:");
  }

  else
  {
    id v11 = 0LL;
  }

  -[MRAction setStates:](v14, "setStates:", v11);
  if (a6) {
    double v12 = -1.0e10;
  }
  else {
    -[MRRenderer time](self->mRenderer, "time");
  }
  -[MRAction setTime:](v14, "setTime:", v12);
  mRenderer = self->mRenderer;
  if (v7) {
    -[MRRenderer performSelectorOnMainThread:withObject:waitUntilDone:]( mRenderer,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "doAction:",  v14,  0LL);
  }
  else {
    -[MRRenderer doAction:](mRenderer, "doAction:", v14);
  }
}

- (BOOL)_setStateValue:(id)a3 forKey:(id)a4
{
  mPersistentState = self->mPersistentState;
  if (mPersistentState)
  {
    id v8 = -[NSMutableDictionary objectForKey:](mPersistentState, "objectForKey:", a4);
    -[NSMutableDictionary setObject:forKey:](self->mPersistentState, "setObject:forKey:", a3, a4);
  }

  else
  {
    id v8 = 0LL;
    self->mPersistentState = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a4,  0LL);
  }

  if (v8 == a3) {
    return 0;
  }
  else {
    return [a3 isEqual:v8] ^ 1;
  }
}

- (void)_rebuildAudio
{
  mAudioPlayer = self->mAudioPlayer;
  if (mAudioPlayer)
  {

    self->mAudioPlayer = 0LL;
  }

  double v4 = -[MCContainer audioPlaylist](-[MCPlug container](self->mPlug, "container"), "audioPlaylist");
  if (v4)
  {
    id v5 = v4;
    if (-[MCAudioPlaylist countOfSongs](v4, "countOfSongs"))
    {
      float v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v27 = v5;
      BOOL v7 = -[MCAudioPlaylist orderedSongs](v5, "orderedSongs");
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v29;
        double v11 = 0.0;
        do
        {
          double v12 = 0LL;
          do
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            id v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v12);
            id v14 = -[MZMediaManagement absolutePathForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self->mRenderer, "assetManagementDelegate"),  "absolutePathForAssetAtPath:",  objc_msgSend(objc_msgSend(v13, "asset"), "path"));
            else {
              -[MZMediaManagement startTimeForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self->mRenderer, "assetManagementDelegate"),  "startTimeForAssetAtPath:",  v14);
            }
            double v16 = v15;
            if ([v13 durationIsDefined])
            {
              [v13 duration];
              double v18 = v17;
              if (!v14) {
                goto LABEL_19;
              }
            }

            else
            {
              -[MZMediaManagement stopTimeForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self->mRenderer, "assetManagementDelegate"),  "stopTimeForAssetAtPath:",  v14);
              double v18 = v19 - v16;
              if (!v14) {
                goto LABEL_19;
              }
            }

            uint64_t v20 = -[MRAudioItem initWithURL:startTime:andDuration:]( objc_alloc(&OBJC_CLASS___MRAudioItem),  "initWithURL:startTime:andDuration:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14),  v16,  v18);
            if (v20)
            {
              id v21 = v20;
              -[NSMutableArray addObject:](v6, "addObject:", v20);
              -[MRAudioItem setLocalTimeOffset:](v21, "setLocalTimeOffset:", v11);
            }

- (id)_currentState
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  double v4 = v3;
  mPersistentState = self->mPersistentState;
  if (mPersistentState) {
    [v3 setObject:mPersistentState forKey:@"persistentState"];
  }
  return v4;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  uint64_t v4 = BYTE1(a3);
  if (BYTE1(a3)) {
    __memset_chk(v9, 9LL, BYTE1(a3), 256LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v9[v4] = 0;
  id v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9);
  if (!self->mPlugAsParallel)
  {
    if (self->mPlugAsSerial)
    {
      float v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d - ",  self->mIDInSupercontainer);
      goto LABEL_8;
    }

    if (!self->mPlugAsHaven)
    {
      BOOL v7 = &stru_259C60;
      return -[NSString stringByAppendingString:](v5, "stringByAppendingString:", v7);
    }
  }

  float v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - ",  self->mIDInSupercontainer);
LABEL_8:
  BOOL v7 = (const __CFString *)v6;
  return -[NSString stringByAppendingString:](v5, "stringByAppendingString:", v7);
}

- (void)setIsDimmed:(BOOL)a3
{
  self->mNeedsRendering = self->mIsDimmed != a3;
  self->mIsDimmed = a3;
}

- (BOOL)enterSlideFocusModeWithState:(id)a3
{
  return 0;
}

- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4
{
  return 0;
}

- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4
{
  return 0;
}

- (BOOL)hasSlides
{
  return 0;
}

- (BOOL)isInInteractiveMode
{
  return 0;
}

- (id)currentSlideInfoForElement:(id)a3
{
  return 0LL;
}

- (id)currentSlideInfos
{
  return 0LL;
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return 0;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  return 0;
}

- (double)interestingTimeForTime:(double)a3
{
  return 0.0;
}

- (double)interestingTimeForElement:(id)a3
{
  return 0.0;
}

- (MRLayer)superlayer
{
  return self->mSuperlayer;
}

- (MCPlug)plug
{
  return self->mPlug;
}

- (MCPlugSerial)plugAsSerial
{
  return self->mPlugAsSerial;
}

- (MCPlugParallel)plugAsParallel
{
  return self->mPlugAsParallel;
}

- (MCPlugHaven)plugAsHaven
{
  return self->mPlugAsHaven;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)uuid
{
  return self->mUUID;
}

- (NSDictionary)parameters
{
  return self->mParameters;
}

- (double)timeIn
{
  return self->mTimeIn;
}

- (void)setTimeIn:(double)a3
{
  self->mTimeIn = a3;
}

- (BOOL)isActivated
{
  return self->mIsActivated;
}

- (BOOL)isPreactivated
{
  return self->mIsPreactivated;
}

- (BOOL)isSelected
{
  return self->mIsSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->mIsSelected = a3;
}

- (BOOL)isDimmed
{
  return self->mIsDimmed;
}

- (double)timeStamp
{
  return self->mTimeStamp;
}

- (BOOL)isScheduledForDestruction
{
  return self->mIsScheduledForDestruction;
}

- (NSDictionary)persistentState
{
  return &self->mPersistentState->super;
}

- (NSDictionary)animationTriggers
{
  return &self->mAnimationTriggers->super;
}

- (NSMutableDictionary)motions
{
  return self->mMotions;
}

- (id)parentHelper
{
  return objc_getProperty(self, a2, 176LL, 1);
}

- (void)setParentHelper:(id)a3
{
}

- (NSString)idInSupercontainer
{
  return self->mIDInSupercontainer;
}

- (void)setIdInSupercontainer:(id)a3
{
}

- (unint64_t)index
{
  return self->mIndex;
}

- (BOOL)needsToSynchronizeTime
{
  return self->mNeedsToSynchronizeTime;
}

- (void)setNeedsToSynchronizeTime:(BOOL)a3
{
  self->mNeedsToSynchronizeTime = a3;
}

- (BOOL)needsToUpdateGeometry
{
  return self->mNeedsToUpdateGeometry;
}

- (void)setNeedsToUpdateGeometry:(BOOL)a3
{
  self->mNeedsToUpdateGeometrdouble y = a3;
}

- (NSString)filterID
{
  return self->_filterID;
}

- (void)setFilterID:(id)a3
{
}

- (BOOL)isAdhocLayer
{
  return self->_isAdhocLayer;
}

- (BOOL)_isNative3D
{
  return 1;
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0LL;
}

- (void)_queueLayerCommand:(int)a3 object:(id)a4
{
  float v6 = -[MRLayerCommand initWithCommand:andObject:]( objc_alloc(&OBJC_CLASS___MRLayerCommand),  "initWithCommand:andObject:",  *(void *)&a3,  a4);
  mLayerCommandQueue = self->mLayerCommandQueue;
  objc_sync_enter(mLayerCommandQueue);
  self->mLayerCommandQueueNeedsAttention = 1;
  -[NSMutableArray addObject:](self->mLayerCommandQueue, "addObject:", v6);
  objc_sync_exit(mLayerCommandQueue);
}

- (void)_observePlug
{
  if (self->mPlugAsParallel) {
    mPlug = self->mPlug;
  }
  else {
    mPlug = self;
  }
  [mPlug addObserver:self forKeyPath:@"timeIn" options:0 context:0];
}

- (void)_unobservePlug
{
  if (self->mPlugAsParallel) {
    mPlugAsParallel = self->mPlugAsParallel;
  }
  else {
    mPlugAsParallel = self;
  }
  [mPlugAsParallel removeObserver:self forKeyPath:@"timeIn"];
}

- (void)_observePlugOnPreactivate
{
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    -[MCPlugParallel addObserver:forKeyPath:options:context:]( mPlugAsParallel,  "addObserver:forKeyPath:options:context:",  self,  @"size",  0LL,  0LL);
    -[MCPlugParallel addObserver:forKeyPath:options:context:]( self->mPlugAsParallel,  "addObserver:forKeyPath:options:context:",  self,  @"currentLayoutIndex",  0LL,  0LL);
    -[MCPlugParallel addObserver:forKeyPath:options:context:]( self->mPlugAsParallel,  "addObserver:forKeyPath:options:context:",  self,  @"positionRotationAndSize",  0LL,  0LL);
    uint64_t v4 = @"opacity";
    mPlugAsSerial = self->mPlugAsParallel;
  }

  else
  {
    mPlugAsSerial = self->mPlugAsSerial;
    if (!mPlugAsSerial) {
      return;
    }
    uint64_t v4 = @"transition";
  }

  [mPlugAsSerial addObserver:self forKeyPath:v4 options:0 context:0];
}

- (void)_unobservePlugOnDepreactivate
{
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    -[MCPlugParallel removeObserver:forKeyPath:](mPlugAsParallel, "removeObserver:forKeyPath:", self, @"size");
    -[MCPlugParallel removeObserver:forKeyPath:]( self->mPlugAsParallel,  "removeObserver:forKeyPath:",  self,  @"currentLayoutIndex");
    -[MCPlugParallel removeObserver:forKeyPath:]( self->mPlugAsParallel,  "removeObserver:forKeyPath:",  self,  @"positionRotationAndSize");
    mPlugAsSerial = self->mPlugAsParallel;
    id v5 = @"opacity";
  }

  else
  {
    mPlugAsSerial = self->mPlugAsSerial;
    if (!mPlugAsSerial) {
      return;
    }
    id v5 = @"transition";
  }

  [mPlugAsSerial removeObserver:self forKeyPath:v5];
}

- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3
{
  self->mNeedsToRequestRebuildAudio = self->mDoAudio;
}

@end