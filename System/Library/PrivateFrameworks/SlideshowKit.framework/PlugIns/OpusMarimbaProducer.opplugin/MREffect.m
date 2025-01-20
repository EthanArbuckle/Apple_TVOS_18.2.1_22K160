@interface MREffect
+ (BOOL)hasCustomTiming;
+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4;
+ (id)retainedEffectWithEffectID:(id)a3 forEffectLayer:(id)a4;
+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3;
- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)getVerticesCoordinates:(MREffect *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isRetainedByEffectLayer;
- (BOOL)needsMoreSlidesAtTime:(double)a3;
- (BOOL)needsToUpdateSlides;
- (BOOL)needsToUpdateTexts;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)startPanoramaPanningForElementID:(id)a3 isLandscape:(BOOL *)a4;
- (BOOL)supportsChapters;
- (BOOL)supportsDynamicExpansion;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (CGSize)pixelSize;
- (MREffect)initWithEffectID:(id)a3;
- (NSDictionary)attributes;
- (NSString)effectID;
- (_NSRange)multiImageSlideRange;
- (double)_computePhaseTimeForTime:(double)a3;
- (double)_computeTimeForPhaseTime:(double)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)mainDuration;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)timeForNextChapterAfterTime:(double)a3;
- (double)timeForPreviousChapterBeforeTime:(double)a3;
- (double)valueForPanoramaPanningForElementID:(id)a3 value:(double)a4 minValue:(double)a5 maxValue:(double)a6;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (int64_t)typicalSlideBatchSize;
- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3;
- (void)_cleanup;
- (void)cancelLoading;
- (void)cleanup;
- (void)dealloc;
- (void)endPanoramaPanning;
- (void)enterInteractiveModeAtTime:(double)a3;
- (void)exitInteractiveMode;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6;
- (void)loadWithArguments:(id)a3;
- (void)releaseByEffectLayer:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)retainByEffectLayer:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setMultiImageSlideRange:(_NSRange)a3;
- (void)setNeedsToUpdateSlides:(BOOL)a3;
- (void)setNeedsToUpdateTexts:(BOOL)a3;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
- (void)updatePanoramaPanningForElementID:(id)a3 withDelta:(double)a4;
@end

@implementation MREffect

+ (id)retainedEffectWithEffectID:(id)a3 forEffectLayer:(id)a4
{
  id v5 = objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "effectWithEffectID:",  a3);
  v6 = v5;
  if (v5) {
    [v5 retainByEffectLayer:a4];
  }
  return v6;
}

- (MREffect)initWithEffectID:(id)a3
{
  v4 = -[MREffect init](self, "init");
  if (v4)
  {
    v4->mEffectID = (NSString *)[a3 copy];
    v4->mDescription = (NSDictionary *) objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "descriptionForEffectID:",  v4->mEffectID);
    objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "defaultPhaseInDurationForEffectID:",  v4->mEffectID);
    v4->mDefaultPhaseInDuration = v5;
    objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "defaultMainDurationForEffectID:",  v4->mEffectID);
    v4->mDefaultMainDuration = v6;
    objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "defaultPhaseOutDurationForEffectID:",  v4->mEffectID);
    v4->mDefaultPhaseOutDuration = v7;
    if (-[NSDictionary objectForKey:](v4->mDescription, "objectForKey:", @"isNative3D")) {
      unsigned __int8 v8 = objc_msgSend( -[NSDictionary objectForKey:](v4->mDescription, "objectForKey:", @"isNative3D"),  "BOOLValue");
    }
    else {
      unsigned __int8 v8 = 1;
    }
    v4->mIsNative3D = v8;
    v4->mIsOpaque = objc_msgSend( -[NSDictionary objectForKey:]( v4->mDescription,  "objectForKey:",  @"isOpaque"),  "BOOLValue");
    if (-[NSDictionary objectForKey:](v4->mDescription, "objectForKey:", @"isAlphaFriendly")) {
      unsigned __int8 v9 = objc_msgSend( -[NSDictionary objectForKey:](v4->mDescription, "objectForKey:", @"isAlphaFriendly"),  "BOOLValue");
    }
    else {
      unsigned __int8 v9 = 1;
    }
    v4->mIsAlphaFriendly = v9;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffect;
  -[MREffect dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mEffectID)
  {
    if (self->mEffectLayer)
    {
      -[MREffect releaseByEffectLayer:](self, "releaseByEffectLayer:");
    }

    else
    {

      self->mAttributes = 0LL;
      self->mFlattenedAttributes = 0LL;
    }

    objc_sync_enter(self);
    if (self->mEffectID)
    {
      -[MREffect unload](self, "unload");
      -[MREffect _cleanup](self, "_cleanup");

      self->mEffectID = 0LL;
      self->mDescription = 0LL;
    }

    objc_sync_exit(self);
  }

- (void)retainByEffectLayer:(id)a3
{
  self->mEffectLayer = (MRLayerEffect *)a3;
  self->mSeed = (unint64_t)objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "container"), "effectAttributes"),  "objectForKey:",  @"RandomSeed"),  "unsignedIntegerValue");
}

- (void)releaseByEffectLayer:(id)a3
{
  self->mPixelSize = CGSizeZero;

  self->mEffectLayer = 0LL;
  self->mAttributes = 0LL;

  self->mFlattenedAttributes = 0LL;
  self->mSeed = 0LL;
  objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "recycleEffect:", self);
}

- (BOOL)isRetainedByEffectLayer
{
  return self->mEffectLayer != 0LL;
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  self->mPhaseInDuration = a3;
  self->mMainDuration = a4;
  self->mPhaseOutDuration = a5;
}

- (double)_computePhaseTimeForTime:(double)a3
{
  double mPhaseInDuration = self->mPhaseInDuration;
  if (mPhaseInDuration >= a3)
  {
    double v7 = 0.0;
    if (mPhaseInDuration > 0.0) {
      return self->mDefaultPhaseInDuration * a3 / mPhaseInDuration;
    }
  }

  else
  {
    double mMainDuration = self->mMainDuration;
    double mDefaultPhaseInDuration = self->mDefaultPhaseInDuration;
    if (mPhaseInDuration + mMainDuration <= a3)
    {
      double v8 = mDefaultPhaseInDuration + self->mDefaultMainDuration;
      double mPhaseOutDuration = self->mPhaseOutDuration;
      double v10 = 0.0;
      if (mPhaseOutDuration > 0.0) {
        double v10 = (a3 - mPhaseInDuration - mMainDuration) * self->mDefaultPhaseOutDuration / mPhaseOutDuration;
      }
      return v8 + v10;
    }

    else
    {
      double v6 = 0.0;
      if (mMainDuration > 0.0) {
        double v6 = (a3 - mPhaseInDuration) * self->mDefaultMainDuration / mMainDuration;
      }
      return mDefaultPhaseInDuration + v6;
    }
  }

  return v7;
}

- (double)_computeTimeForPhaseTime:(double)a3
{
  double mDefaultPhaseInDuration = self->mDefaultPhaseInDuration;
  if (mDefaultPhaseInDuration >= a3)
  {
    double v7 = 0.0;
    if (mDefaultPhaseInDuration > 0.0) {
      return self->mPhaseInDuration * a3 / mDefaultPhaseInDuration;
    }
  }

  else
  {
    double mDefaultMainDuration = self->mDefaultMainDuration;
    double mPhaseInDuration = self->mPhaseInDuration;
    if (mDefaultPhaseInDuration + mDefaultMainDuration <= a3)
    {
      double v8 = mPhaseInDuration + self->mMainDuration;
      double mDefaultPhaseOutDuration = self->mDefaultPhaseOutDuration;
      double v10 = 0.0;
      if (mDefaultPhaseOutDuration > 0.0) {
        double v10 = (a3 - mDefaultPhaseInDuration - mDefaultMainDuration) * self->mPhaseOutDuration / mDefaultPhaseOutDuration;
      }
      return v8 + v10;
    }

    else
    {
      double v6 = 0.0;
      if (mDefaultMainDuration > 0.0) {
        double v6 = (a3 - mDefaultPhaseInDuration) * self->mMainDuration / mDefaultMainDuration;
      }
      return mPhaseInDuration + v6;
    }
  }

  return v7;
}

- (void)_cleanup
{
  uint64_t v2 = objc_opt_class(self, a2);
  NSLog(@"Method _cleanup must be implemented in class %@!\n", v2);
}

+ (BOOL)hasCustomTiming
{
  return 0;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  return 0LL;
}

+ (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4
{
  return 0LL;
}

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->mPixelSize.width || a3.height != self->mPixelSize.height)
  {
    self->mPixelSize = a3;
    *(_WORD *)&self->mNeedsToUpdateSlides = 257;
  }

- (void)setAttributes:(id)a3
{
  mAttributes = self->mAttributes;
  if (mAttributes != a3)
  {
    if (mAttributes)
    {

      self->mAttributes = 0LL;
    }

    self->mAttributes = (NSDictionary *)a3;

    double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  self->mEffectID,  objc_msgSend(a3, "objectForKey:", @"PresetID"));
    if (v7) {
      -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v7);
    }
    -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", a3);
    self->mFlattenedAttributes = &v6->super;
    self->mSeed = (unint64_t)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"RandomSeed"),  "unsignedIntegerValue");
    self->mNeedsToUpdateAttributes = 1;
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffect *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  return 0;
}

- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7
{
  return 0;
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return 0;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = -[MRLayerEffect hasSlides](self->mEffectLayer, "hasSlides", a4, a5, a6);
  if (v8) {
    LOBYTE(v8) = a3 < 0.0 || self->mPhaseInDuration + self->mMainDuration + self->mPhaseOutDuration <= a3;
  }
  return v8;
}

- (void)enterInteractiveModeAtTime:(double)a3
{
  self->_isInInteractiveMode = 1;
}

- (void)exitInteractiveMode
{
  self->_isInInteractiveMode = 0;
}

- (double)interestingTimeForTime:(double)a3
{
  return self->mPhaseInDuration;
}

- (double)interestingTimeForElement:(id)a3
{
  return self->mPhaseInDuration;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  *a3 = self->mMainDuration;
  *a4 = 0.0;
  *a5 = self->mPhaseOutDuration;
}

- (BOOL)supportsChapters
{
  return 0;
}

- (double)timeForNextChapterAfterTime:(double)a3
{
  return 0.0;
}

- (double)timeForPreviousChapterBeforeTime:(double)a3
{
  return 0.0;
}

- (BOOL)startPanoramaPanningForElementID:(id)a3 isLandscape:(BOOL *)a4
{
  if (!self->_panoramaPanningOffsets) {
    self->_panoramaPanningOffsets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  self->_panoramaPanningEndTime = 1000000000.0;
  return 1;
}

- (void)updatePanoramaPanningForElementID:(id)a3 withDelta:(double)a4
{
  double v8 = v7 + a4;
  *(float *)&double v8 = v8;
  -[NSMutableDictionary setObject:forKey:]( self->_panoramaPanningOffsets,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8),  a3);
}

- (double)valueForPanoramaPanningForElementID:(id)a3 value:(double)a4 minValue:(double)a5 maxValue:(double)a6
{
  double v12 = a4 - v11;
  if (v12 >= a5)
  {
    a5 = v12;
    if (v12 > a6) {
      a5 = a6;
    }
  }

  double v13 = a4 - a5;
  *(float *)&double v13 = a4 - a5;
  -[NSMutableDictionary setObject:forKey:]( self->_panoramaPanningOffsets,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13),  a3);
  return a4 + (a5 - a4) * self->_panoramaPanningAmount;
}

- (void)endPanoramaPanning
{
  self->_panoramaPanningEndTime = -1.0;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6
{
  if (!-[MREffect isLoadedForTime:](self, "isLoadedForTime:") && (a6 || !self->mPreloadOperation))
  {
    objc_sync_enter(self);
    if (self->mEffectID)
    {
      id v11 = [a5 preloadQueue];
      mPreloadOperation = self->mPreloadOperation;
      if (a6 || !v11)
      {
        if (mPreloadOperation)
        {
          -[NSOperation cancel](mPreloadOperation, "cancel");

          self->mPreloadOperation = 0LL;
        }

        -[MREffect _loadForTime:inContext:withArguments:](self, "_loadForTime:inContext:withArguments:", a4, a5, a3);
      }

      else if (!mPreloadOperation)
      {
        double v13 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3),  @"time",  a4,  @"context",  a5,  @"arguments",  0LL);
        v14 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  self,  "loadWithArguments:",  v13);
        self->mPreloadOperation = v14;
        -[NSOperation setQualityOfService:](v14, "setQualityOfService:", 9LL);
        [v11 addOperation:self->mPreloadOperation];
      }
    }

    objc_sync_exit(self);
  }

- (void)loadWithArguments:(id)a3
{
  if (self->mEffectID)
  {
    mPreloadOperation = self->mPreloadOperation;
    if (mPreloadOperation)
    {

      self->mPreloadOperation = 0LL;
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"time"), "doubleValue");
      -[MREffect _loadForTime:inContext:withArguments:]( self,  "_loadForTime:inContext:withArguments:",  [a3 objectForKey:@"context"],  objc_msgSend(a3, "objectForKey:", @"arguments"),  v6);
    }
  }

  objc_sync_exit(self);
  pthread_setname_np("");
}

- (void)unload
{
  if (self->mEffectID)
  {
    mPreloadOperation = self->mPreloadOperation;
    if (mPreloadOperation)
    {
      -[NSOperation cancel](mPreloadOperation, "cancel");

      self->mPreloadOperation = 0LL;
    }

    -[MREffect _unload](self, "_unload");

    self->mOutputImage = 0LL;
    self->mMultiImageSlideRange.location = 0LL;
    self->mMultiImageSlideRange.length = 0LL;

    self->_panoramaPanningOffsets = 0LL;
  }

  objc_sync_exit(self);
}

- (void)cancelLoading
{
  if (self->mEffectID)
  {
    mPreloadOperation = self->mPreloadOperation;
    if (mPreloadOperation)
    {
      -[NSOperation cancel](mPreloadOperation, "cancel");

      self->mPreloadOperation = 0LL;
    }
  }

  objc_sync_exit(self);
}

- (BOOL)isNative3D
{
  return self->mIsNative3D;
}

- (BOOL)isOpaque
{
  return self->mIsOpaque;
}

- (BOOL)isAlphaFriendly
{
  return self->mIsAlphaFriendly;
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->_panoramaPanningOffsets)
  {
    if (-[MRLayer isActivated](self->mEffectLayer, "isActivated"))
    {
      double panoramaPanningEndTime = self->_panoramaPanningEndTime;
      if (panoramaPanningEndTime < 0.0)
      {
        self->_double panoramaPanningEndTime = a3;
        goto LABEL_9;
      }

      if (panoramaPanningEndTime >= a3)
      {
        self->_panoramaPanningAmount = 1.0;
        goto LABEL_9;
      }

      if (panoramaPanningEndTime + 0.4 > a3)
      {
        self->_panoramaPanningAmount = (cos((a3 - panoramaPanningEndTime) / 0.4 * 3.14159265) + 1.0) * 0.5;
        goto LABEL_9;
      }
    }

    self->_panoramaPanningOffsets = 0LL;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v7 = objc_opt_class(self, a2);
  NSLog(@"Method renderAtTime must be implemented in class %@!\n", v7);
  -[MREffect doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = objc_msgSend( a4,  "beginLocalContextWithSize:backgroundColor:state:",  objc_msgSend(a4, "backColor"),  v14,  self->mPixelSize.width,  self->mPixelSize.height);
  CGFloat v10 = self->mPixelSize.width / self->mPixelSize.height;
  *(float *)&CGFloat v10 = v10;
  [v9 setLocalAspectRatio:v10];
  id v11 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  double v12 = v11;
  if (v11 != [v9 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v9 glContext]);
  }
  -[MREffect renderAtTime:inContext:withArguments:](self, "renderAtTime:inContext:withArguments:", v9, a5, a3);
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v11) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v11);
  }

  return [a4 retainedByUserImageByEndingLocalContext:v9 andRestoreState:v14];
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0LL;
  }
  id v6 = -[MREffect retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [a4 localAspectRatio];
  double v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7),  @"rectangle",  0);
  id v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 0LL;
}

- (NSString)effectID
{
  return self->mEffectID;
}

- (NSDictionary)attributes
{
  return self->mAttributes;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)needsToUpdateSlides
{
  return self->mNeedsToUpdateSlides;
}

- (void)setNeedsToUpdateSlides:(BOOL)a3
{
  self->mNeedsToUpdateSlides = a3;
}

- (BOOL)needsToUpdateTexts
{
  return self->mNeedsToUpdateTexts;
}

- (void)setNeedsToUpdateTexts:(BOOL)a3
{
  self->mNeedsToUpdateTexts = a3;
}

- (_NSRange)multiImageSlideRange
{
  NSUInteger length = self->mMultiImageSlideRange.length;
  NSUInteger location = self->mMultiImageSlideRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMultiImageSlideRange:(_NSRange)a3
{
  self->mMultiImageSlideRange = a3;
}

- (double)phaseInDuration
{
  return self->mPhaseInDuration;
}

- (double)mainDuration
{
  return self->mMainDuration;
}

- (double)phaseOutDuration
{
  return self->mPhaseOutDuration;
}

- (BOOL)isInInteractiveMode
{
  return self->_isInInteractiveMode;
}

+ (BOOL)supportsDynamicExpansionForEffectID:(id)a3
{
  return 0;
}

+ (unint64_t)typicalSlideBatchSizeForEffectID:(id)a3
{
  return 0LL;
}

- (BOOL)supportsDynamicExpansion
{
  return 0;
}

- (int64_t)typicalSlideBatchSize
{
  return 0LL;
}

- (unint64_t)firstSlideIndexStillNeededAtTime:(double)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)needsMoreSlidesAtTime:(double)a3
{
  return self->mMainDuration - a3 < 14.0;
}

@end