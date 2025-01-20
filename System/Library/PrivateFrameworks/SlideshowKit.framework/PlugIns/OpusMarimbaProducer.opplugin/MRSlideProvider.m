@interface MRSlideProvider
- (BOOL)beginLiveUpdate;
- (BOOL)canPlay;
- (BOOL)endLiveUpdate;
- (BOOL)hasFilters;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoaded;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isMuted;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isPlaying;
- (BOOL)isStill;
- (BOOL)needsToUpdateLayout;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)slideIsReadonly;
- (BOOL)updateStuffWithAssetManager:(id)a3;
- (BOOL)wantsMipmap;
- (BOOL)wantsMonochromatic;
- (CGPoint)center;
- (CGSize)defaultSize;
- (CGSize)framedImageSizeAtIndex:(unsigned int)a3 aspectRatio:(float)a4;
- (CGSize)requestedSize;
- (CGSize)sizeFactor;
- (CGSize)unframedImageSizeForAspectRatio:(float)a3 frameID:(id)a4 andFrameAttributes:(id)a5 atIndex:(unsigned int)a6 framedImageSize:(CGSize *)a7;
- (MCAnimationPathKeyframed)centerAnimationPath;
- (MCAnimationPathKeyframed)rotationAnimationPath;
- (MCAnimationPathKeyframed)scaleAnimationPath;
- (MCSlide)slide;
- (MRFrame)frame;
- (MRSlideProvider)initWithEffectLayer:(id)a3;
- (NSDictionary)effectAttributes;
- (NSString)assetPath;
- (NSString)filterID;
- (NSString)imageSizeScript;
- (NSString)showTimeScript;
- (double)imageAspectRatio;
- (double)rotation;
- (double)scale;
- (double)showDuration;
- (double)showTime;
- (double)slideDuration;
- (double)slideStartTime;
- (double)time;
- (float)stillTime;
- (id)currentSlideInfo;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)playerHint;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int)defaultKenBurnsType;
- (void)_computeImageSizeInContext:(id)a3 withArguments:(id)a4;
- (void)_unloadIfNotUpdatingLive;
- (void)applyKenBurnsAtTime:(double)a3 withTargetSize:(CGSize)a4 kenBurnsType:(int)a5 translation:(CGPoint *)a6 scale:(double *)a7 rotation:(double *)a8;
- (void)cancelLoading;
- (void)cleanup;
- (void)dealloc;
- (void)imageIsAvailableFromAssetPlayer:(id)a3;
- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6;
- (void)loadWithArguments:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)printFlags;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAssetPath:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCenterAnimationPath:(id)a3;
- (void)setDefaultKenBurnsType:(int)a3;
- (void)setDefaultSize:(CGSize)a3;
- (void)setEffectAttributes:(id)a3;
- (void)setFilterID:(id)a3;
- (void)setImageSizeScript:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsStill:(BOOL)a3;
- (void)setNeedsToUpdateLayout:(BOOL)a3;
- (void)setPlayerHint:(id)a3;
- (void)setRotation:(double)a3;
- (void)setRotationAnimationPath:(id)a3;
- (void)setScale:(double)a3;
- (void)setScaleAnimationPath:(id)a3;
- (void)setShowDuration:(double)a3;
- (void)setShowTime:(double)a3;
- (void)setShowTimeScript:(id)a3;
- (void)setSizeFactor:(CGSize)a3;
- (void)setSlide:(id)a3;
- (void)setSlideIsReadonly:(BOOL)a3;
- (void)setStillTime:(float)a3;
- (void)setTime:(double)a3;
- (void)setWantsMipmap:(BOOL)a3;
- (void)setWantsMonochromatic:(BOOL)a3;
- (void)unload;
- (void)updateShowTimeAndDurationWithPlugTiming:(id)a3 andAttributes:(id)a4;
@end

@implementation MRSlideProvider

- (MRSlideProvider)initWithEffectLayer:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRSlideProvider;
  v4 = -[MRSlideProvider init](&v14, "init");
  v5 = v4;
  if (v4)
  {
    v4->mEffectLayer = (MRLayerEffect *)a3;
    v4->mKenBurnsType = 1;
    v4->mLastTime = -1.0;
    __asm { FMOV            V0.2D, #1.0 }

    v4->mSizeFactor = _Q0;
    v4->mDefaultSize = CGSizeZero;
    v4->mOriginalImageAspectRatio = 1.0;
    v11 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v5->mPreloadOperationLock = v11;
    -[NSLock setName:](v11, "setName:", @"MRSlideProvider.preloadOperationLock");
    v5->mSlideIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_scale = 1.0;
    v5->_rotationAnimationPathTriggerTime = -1.0;
    __asm { FMOV            V0.2D, #-1.0 }

    *(_OWORD *)&v5->_centerAnimationPathTriggerTime = _Q0;
  }

  return v5;
}

- (void)dealloc
{
  self->mPreloadOperationLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRSlideProvider;
  -[MRSlideProvider dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mEffectLayer)
  {
    -[MRSlideProvider setSlide:](self, "setSlide:", 0LL);
    -[MRSlideProvider setAssetPath:](self, "setAssetPath:", 0LL);
    self->mEffectLayer = 0LL;

    self->mEffectAttributes = 0LL;
    self->mImageSizeScript = 0LL;

    self->mShowTimeScript = 0LL;
  }

  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"asset.path", a4, a5, a6))
  {
    char v8 = 2;
LABEL_6:
    BYTE1(self->mFlags) |= v8;
    goto LABEL_7;
  }

  if (([a3 isEqualToString:@"startTime"] & 1) != 0
    || [a3 isEqualToString:@"duration"])
  {
    char v8 = 1;
    goto LABEL_6;
  }

- (void)setDefaultSize:(CGSize)a3
{
  if (a3.width != self->mDefaultSize.width || a3.height != self->mDefaultSize.height)
  {
    self->mDefaultSize = a3;
    -[MRSlideProvider _unloadIfNotUpdatingLive](self, "_unloadIfNotUpdatingLive");
  }

- (BOOL)wantsMonochromatic
{
  return (LOBYTE(self->mFlags) >> 6) & 1;
}

- (void)setWantsMonochromatic:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xBF;
    if (a3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    -[MRSlideProvider unload](self, "unload");
  }

- (BOOL)wantsMipmap
{
  return (LOBYTE(self->mFlags) >> 5) & 1;
}

- (void)setWantsMipmap:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xDF;
    if (a3) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    -[MRSlideProvider unload](self, "unload");
  }

- (void)setImageSizeScript:(id)a3
{
  if (self->mImageSizeScript != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->mImageSizeScript = (NSString *)[a3 copy];
    -[MRSlideProvider _unloadIfNotUpdatingLive](self, "_unloadIfNotUpdatingLive");
  }

- (void)setEffectAttributes:(id)a3
{
  mEffectAttributes = self->mEffectAttributes;
  if (mEffectAttributes != a3)
  {

    self->mEffectAttributes = (NSDictionary *)a3;
    -[MRSlideProvider _unloadIfNotUpdatingLive](self, "_unloadIfNotUpdatingLive");
  }

- (BOOL)isStill
{
  return (LOBYTE(self->mFlags) >> 3) & 1;
}

- (void)setIsStill:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xF7;
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    -[MRSlideProvider unload](self, "unload");
  }

- (BOOL)slideIsReadonly
{
  return (BYTE1(self->mFlags) >> 6) & 1;
}

- (void)setSlideIsReadonly:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  BYTE1(self->mFlags) = BYTE1(self->mFlags) & 0xBF | v3;
}

- (BOOL)isMuted
{
  return (BYTE1(self->mFlags) >> 5) & 1;
}

- (void)setIsMuted:(BOOL)a3
{
  if (a3) {
    char v4 = 32;
  }
  else {
    char v4 = 0;
  }
  BYTE1(self->mFlags) = BYTE1(self->mFlags) & 0xDF | v4;
  mSlidePlayer = self->mSlidePlayer;
  if (mSlidePlayer)
  {
    BOOL v6 = a3;
    if (-[MRAssetPlayer conformsToProtocol:]( mSlidePlayer,  "conformsToProtocol:",  &OBJC_PROTOCOL___MRAudioPlayer)) {
      -[MRAssetPlayer setIsMuted:](self->mSlidePlayer, "setIsMuted:", v6);
    }
  }

- (BOOL)canPlay
{
  if ((self->mFlags & 4) != 0)
  {
    LOBYTE(mSlideLayer) = 1;
  }

  else
  {
    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer) {
      LOBYTE(mSlideLayer) = -[MRLayer hasSomethingToRender](mSlideLayer, "hasSomethingToRender");
    }
  }

  return (char)mSlideLayer;
}

- (BOOL)isPlaying
{
  return BYTE1(self->mFlags) >> 7;
}

- (BOOL)isLoaded
{
  return self->mFlags & 1;
}

- (BOOL)needsToUpdateLayout
{
  return 0;
}

- (void)setNeedsToUpdateLayout:(BOOL)a3
{
}

- (BOOL)hasFilters
{
  return self->_filterID != 0LL;
}

- (CGSize)framedImageSizeAtIndex:(unsigned int)a3 aspectRatio:(float)a4
{
  double width = self->mDefaultSize.width;
  double height = self->mDefaultSize.height;
  if (self->mImageSizeScript)
  {
    char v9 = objc_alloc(&OBJC_CLASS___NSDictionary);
    *(float *)&double v10 = width;
    v11 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10);
    *(float *)&double v12 = height;
    v13 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12);
    LODWORD(v14) = 1.0;
    v15 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14);
    *(float *)&double v16 = (float)a3;
    v17 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v16);
    *(float *)&double v18 = a4;
    v19 = -[NSDictionary initWithObjectsAndKeys:]( v9,  "initWithObjectsAndKeys:",  v11,  @"layerWidth",  v13,  @"layerHeight",  v15,  @"numOfImages",  v17,  @"indexOfImage",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18),  @"imageAspectRatio",  0LL);
    v20 = +[MRUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MRUtilities,  "executeScript:withHeader:andAttributes:",  self->mImageSizeScript,  v19,  self->mEffectAttributes);

    if (v20)
    {
      CGSize v21 = CGSizeFromString(v20);
      double width = v21.width;
      double height = v21.height;
    }
  }

  double v22 = width;
  double v23 = height;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)unframedImageSizeForAspectRatio:(float)a3 frameID:(id)a4 andFrameAttributes:(id)a5 atIndex:(unsigned int)a6 framedImageSize:(CGSize *)a7
{
  double width = v11;
  double height = v12;
  if (a7)
  {
    a7->double width = v11;
    a7->double height = v12;
  }

  id v15 = objc_msgSend( +[MRFrameManager sharedManager](MRFrameManager, "sharedManager"),  "sizeScriptForFrameID:",  a4);
  if (v15)
  {
    id v16 = v15;
    v17 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", width),  @"layerWidth",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", height),  @"layerHeight",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3),  @"imageAspectRatio",  0LL);
    double v18 = +[MRUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MRUtilities,  "executeScript:withHeader:andAttributes:",  v16,  v17,  a5);

    if (v18)
    {
      CGSize v19 = CGSizeFromString(v18);
      if (v19.width >= 0.0) {
        double width = v19.width;
      }
      else {
        double width = 0.0;
      }
      if (v19.height >= 0.0) {
        double height = v19.height;
      }
      else {
        double height = 0.0;
      }
    }
  }

  double v20 = width;
  double v21 = height;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)setShowDuration:(double)a3
{
  self->_showDuration = a3;
  audioDucker = self->_audioDucker;
  if (audioDucker) {
    -[MRAudioDucker setParentDuration:](audioDucker, "setParentDuration:");
  }
}

- (void)updateShowTimeAndDurationWithPlugTiming:(id)a3 andAttributes:(id)a4
{
  double v8 = v7;
  [a3 loopDuration];
  double v10 = v9;
  [a3 phaseOutDuration];
  double v12 = v11;
  if (!self->mShowTimeScript) {
    goto LABEL_6;
  }
  v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
  double v14 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8);
  id v15 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10);
  id v16 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12);
  [a3 fullDuration];
  v17 = -[NSDictionary initWithObjectsAndKeys:]( v13,  "initWithObjectsAndKeys:",  v14,  @"phaseInDuration",  v15,  @"mainDuration",  v16,  @"phaseOutDuration",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"fullDuration",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)-[MCSlide index](self->_slide, "index")),  @"indexOfImage",  0LL);
  double v18 = +[MRUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MRUtilities,  "executeScript:withHeader:andAttributes:",  self->mShowTimeScript,  v17,  a4);

  if (v18)
  {
    CGSize v19 = CGSizeFromString(v18);
    self->_showTime = v19.width;
    CGFloat height = v8 + v10 + v12 - v19.width;
    if (v19.height >= 0.0) {
      CGFloat height = v19.height;
    }
  }

  else
  {
LABEL_6:
    self->_showTime = 0.0;
    CGFloat height = v8 + v10 + v12;
  }

  self->_showDuration = height;
  audioDucker = self->_audioDucker;
  if (audioDucker) {
    -[MRAudioDucker setParentDuration:](audioDucker, "setParentDuration:");
  }
}

- (void)setSlide:(id)a3
{
  if (self->_slide != a3)
  {
    -[MRSlideProvider unload](self, "unload");
    slide = self->_slide;
    if (slide)
    {
      if ((self->mFlags & 0x4000) == 0)
      {
        unsigned __int8 v6 = -[MCObject isSnapshot](slide, "isSnapshot");
        slide = self->_slide;
        if ((v6 & 1) == 0)
        {
          -[MCSlide removeObserver:forKeyPath:](slide, "removeObserver:forKeyPath:", self, @"startTime");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"duration");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"frameID");
          -[MCSlide removeObserver:forKeyPath:]( self->_slide,  "removeObserver:forKeyPath:",  self,  @"frameAttributes");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"index");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"kenBurnsType");
          -[MCSlide removeObserver:forKeyPath:]( self->_slide,  "removeObserver:forKeyPath:",  self,  @"animationPaths");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"center");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"scale");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"rotation");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"asset.path");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"filters");
          -[MCSlide removeObserver:forKeyPath:](self->_slide, "removeObserver:forKeyPath:", self, @"builtVolume");
          slide = self->_slide;
        }
      }

      self->_slide = 0LL;
    }

    if (a3)
    {
      double v7 = (MCSlide *)a3;
      self->_slide = v7;
      if ((self->mFlags & 0x4000) == 0 && !-[MCObject isSnapshot](v7, "isSnapshot"))
      {
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"startTime",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"duration",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"frameID",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"frameAttributes",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"index",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"animationPaths",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"center",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"scale",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"rotation",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"kenBurnsType",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"asset.path",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"filters",  0LL,  0LL);
        -[MCSlide addObserver:forKeyPath:options:context:]( self->_slide,  "addObserver:forKeyPath:options:context:",  self,  @"builtVolume",  0LL,  0LL);
      }
    }

    BYTE1(self->mFlags) |= 2u;
    BYTE2(self->mFlags) |= 0x40u;
  }

- (void)setAssetPath:(id)a3
{
  if (self->_assetPath != a3)
  {
    -[MRSlideProvider unload](self, "unload");

    self->_assetPath = (NSString *)a3;
    BYTE1(self->mFlags) |= 2u;
    BYTE2(self->mFlags) |= 0x40u;
  }

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  if (self->_centerAnimationPath) {
    -[MRSlideProvider setCenterAnimationPath:](self, "setCenterAnimationPath:", 0LL);
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  if (self->_scaleAnimationPath) {
    -[MRSlideProvider setScaleAnimationPath:](self, "setScaleAnimationPath:", 0LL);
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
  if (self->_rotationAnimationPath) {
    -[MRSlideProvider setRotationAnimationPath:](self, "setRotationAnimationPath:", 0LL);
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setCenterAnimationPath:(id)a3
{
  centerAnimationPath = self->_centerAnimationPath;
  if (centerAnimationPath != a3)
  {

    self->_centerAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_centerAnimationPathTriggerTime = -1.0;
  }

- (void)setScaleAnimationPath:(id)a3
{
  scaleAnimationPath = self->_scaleAnimationPath;
  if (scaleAnimationPath != a3)
  {

    self->_scaleAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_scaleAnimationPathTriggerTime = -1.0;
  }

- (void)setRotationAnimationPath:(id)a3
{
  rotationAnimationPath = self->_rotationAnimationPath;
  if (rotationAnimationPath != a3)
  {

    self->_rotationAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_rotationAnimationPathTriggerTime = -1.0;
  }

- (void)setIsPlaying:(BOOL)a3
{
  char mFlags = self->mFlags;
  if ((mFlags & 8) == 0)
  {
    BOOL v4 = a3;
    char v6 = a3 ? 0x80 : 0;
    BYTE1(self->mFlags) = v6 & 0x80 | BYTE1(self->mFlags) & 0x7F;
    if ((mFlags & 1) != 0)
    {
      mSlidePlayer = self->mSlidePlayer;
      if (mSlidePlayer)
      {
        if (-[MRAssetPlayer conformsToProtocol:]( mSlidePlayer,  "conformsToProtocol:",  &OBJC_PROTOCOL___MRAssetPlayerTimeSupport)) {
          -[MRAssetPlayer setIsPlaying:](self->mSlidePlayer, "setIsPlaying:", v4);
        }
      }

      else
      {
        mSlideLayer = self->mSlideLayer;
        if (mSlideLayer)
        {
          double v9 = -[MRLayer clock](mSlideLayer, "clock");
          if (v4) {
            -[MRLayerClock resumeOnNextUpdate](v9, "resumeOnNextUpdate");
          }
          else {
            -[MRLayerClock pauseOnNextUpdate](v9, "pauseOnNextUpdate");
          }
        }
      }
    }
  }

- (double)time
{
  return 0.0;
}

- (void)setTime:(double)a3
{
  double v4 = a3 - self->_showTime;
  mSlidePlayer = self->mSlidePlayer;
  if (mSlidePlayer)
  {
    if (-[MRAssetPlayer conformsToProtocol:]( mSlidePlayer,  "conformsToProtocol:",  &OBJC_PROTOCOL___MRAssetPlayerTimeSupport)) {
      -[MRAssetPlayer setTime:](self->mSlidePlayer, "setTime:", v4);
    }
  }

  else
  {
    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer) {
      -[MRLayerClock setExternalTime:](-[MRLayer clock](mSlideLayer, "clock"), "setExternalTime:", v4);
    }
    else {
      self->_timeToPreloadFor = v4;
    }
  }

  self->mLastTime = -1.0e15;
}

- (BOOL)beginLiveUpdate
{
  BYTE1(self->mFlags) |= 0x10u;
  return 1;
}

- (BOOL)endLiveUpdate
{
  BYTE1(self->mFlags) &= ~0x10u;
  if ((self->mFlags & 0x200000) != 0)
  {
    BYTE2(self->mFlags) &= ~0x20u;
    -[MRSlideProvider unload](self, "unload");
  }

  return 1;
}

- (void)_unloadIfNotUpdatingLive
{
  if ((self->mFlags & 0x1000) != 0)
  {
    BYTE2(self->mFlags) |= 0x20u;
    objc_sync_enter(self);
    self->mRequestedSize = CGSizeZero;
    mOutputImage = self->mOutputImage;
    if (mOutputImage)
    {
      -[MRImage releaseByUser](mOutputImage, "releaseByUser");
      self->mOutputImage = 0LL;
    }

    BYTE2(self->mFlags) |= 2u;
    objc_sync_exit(self);
  }

  else
  {
    -[MRSlideProvider unload](self, "unload");
  }

- (id)currentSlideInfo
{
  char v3 = objc_alloc_init(&OBJC_CLASS___MRSlideInfo);
  -[MRSlideInfo setAssetPath:](v3, "setAssetPath:", self->_assetPath);
  if (self->mOutputImage)
  {
    -[MRImage aspectRatio](self->mOriginalImage, "aspectRatio");
    -[MRSlideInfo setAspectRatio:](v3, "setAspectRatio:");
    mSlidePlayer = self->mSlidePlayer;
    if (mSlidePlayer)
    {
      unsigned int v5 = -[MRAssetPlayer conformsToProtocol:]( mSlidePlayer,  "conformsToProtocol:",  &OBJC_PROTOCOL___MRAssetPlayerTimeSupport);
      double timeToPreloadFor = 0.0;
      if (v5) {
        -[MRAssetPlayer time](self->mSlidePlayer, "time", 0.0);
      }
    }

    else
    {
      mSlideLayer = self->mSlideLayer;
      if (mSlideLayer) {
        -[MRLayerClock externalTime](-[MRLayer clock](mSlideLayer, "clock"), "externalTime");
      }
      else {
        double timeToPreloadFor = self->_timeToPreloadFor;
      }
    }

    -[MRSlideInfo setTime:](v3, "setTime:", timeToPreloadFor);
    -[MRImage centerX](self->mOutputImage, "centerX");
    double v9 = v8;
    -[MRImage centerY](self->mOutputImage, "centerY");
    -[MRSlideInfo setCenter:](v3, "setCenter:", v9, v10);
    -[MRImage scale](self->mOutputImage, "scale");
    -[MRSlideInfo setScale:](v3, "setScale:");
    -[MRImage rotationAngle](self->mOutputImage, "rotationAngle");
    -[MRSlideInfo setRotation:](v3, "setRotation:");
  }

  else
  {
    -[MRSlideInfo setAspectRatio:](v3, "setAspectRatio:", self->mOriginalImageAspectRatio);
  }

  -[MRSlideInfo setPlayer:](v3, "setPlayer:", self->mSlidePlayer);
  return v3;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return self->mFlags & 1;
}

- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6
{
  if ((self->mFlags & 3) == 0)
  {
    LOBYTE(self->mFlags) |= 2u;
    self->_double timeToPreloadFor = a3;
    if (self->_assetPath)
    {
      BOOL v8 = a6;
      double v10 = objc_alloc_init(&OBJC_CLASS___MRAssetPlayerOptions);
      -[MRAssetPlayerOptions setWantsMonochromatic:](v10, "setWantsMonochromatic:", (LOBYTE(self->mFlags) >> 6) & 1);
      -[MRAssetPlayerOptions setWantsMipmap:](v10, "setWantsMipmap:", (LOBYTE(self->mFlags) >> 5) & 1);
      if (-[MRAssetPlayerOptions wantsMipmap](v10, "wantsMipmap")) {
        uint64_t v11 = 1LL;
      }
      else {
        uint64_t v11 = (LOBYTE(self->mFlags) >> 4) & 1;
      }
      -[MRAssetPlayerOptions setWantsPowerOfTwo:](v10, "setWantsPowerOfTwo:", v11);
      -[MRAssetPlayerOptions setIsForExport:]( v10,  "setIsForExport:",  objc_msgSend(objc_msgSend(a5, "renderer"), "mode") == 1);
      if ((self->mFlags & 8) != 0)
      {
        float mStillTime = self->mStillTime;
        if (mStillTime >= 0.0)
        {
          double v16 = mStillTime;
          double slideStartTime = self->_slideStartTime;
          BOOL v18 = slideStartTime < 0.0;
          double v19 = slideStartTime + v16;
          if (!v18) {
            double v16 = v19;
          }
        }

        else
        {
          double v16 = 1000000000.0;
        }

        -[MRAssetPlayerOptions setStillTime:](v10, "setStillTime:", v16);
      }

      unsigned int v20 = [a5 thumbnailPolicy];
      unsigned int v21 = !v8;
      if (v20 != 1) {
        unsigned int v21 = 0;
      }
      if (v20) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 1LL;
      }
      -[MRAssetPlayerOptions setThumbnailIsOK:](v10, "setThumbnailIsOK:", v22);
      -[MRAssetPlayerOptions setPlayerHint:](v10, "setPlayerHint:", self->_playerHint);
      double v23 = -[MRLayer plugAsSerial](self->mEffectLayer, "plugAsSerial");
      v24 = -[MRLayer superlayer](self->mEffectLayer, "superlayer");
      if (v23
        || (double v23 = -[MRLayer plugAsSerial](-[MRLayer superlayer](self->mEffectLayer, "superlayer"), "plugAsSerial"),
            v24 = -[MRLayer superlayer](-[MRLayer superlayer](self->mEffectLayer, "superlayer"), "superlayer"),
            v23))
      {
        v25 = v24;
        v26 = -[MCPlugSerial index](v23, "index");
        if (!v26) {
          v26 = (char *)objc_msgSend(-[MRLayer sublayers](v25, "sublayers"), "count");
        }
        objc_msgSend( -[MCContainer plugAtIndex:]( -[MCPlug container](-[MRLayer plug](v25, "plug"), "container"),  "plugAtIndex:",  v26 - 1),  "transitionDuration");
        -[MRAssetPlayerOptions setIntroDuration:](v10, "setIntroDuration:");
        -[MCPlugSerial transitionDuration](v23, "transitionDuration");
        -[MRAssetPlayerOptions setOutroDuration:](v10, "setOutroDuration:");
        -[MCPlug fullDuration](v23, "fullDuration");
        double v28 = v27;
        -[MRAssetPlayerOptions introDuration](v10, "introDuration");
        double v30 = v28 - v29;
        -[MRAssetPlayerOptions outroDuration](v10, "outroDuration");
        -[MRAssetPlayerOptions setMainDuration:](v10, "setMainDuration:", v30 - v31);
      }

      -[MRAssetPlayerOptions introDuration](v10, "introDuration");
      if (v32 == 0.0)
      {
        -[MRAssetPlayerOptions setIntroDuration:](v10, "setIntroDuration:", 0.5);
        -[MRAssetPlayerOptions mainDuration](v10, "mainDuration");
        -[MRAssetPlayerOptions setMainDuration:](v10, "setMainDuration:", v33 + -0.5);
      }

      -[MRAssetPlayerOptions outroDuration](v10, "outroDuration");
      if (v34 == 0.0)
      {
        -[MRAssetPlayerOptions setOutroDuration:](v10, "setOutroDuration:", 0.5);
        -[MRAssetPlayerOptions mainDuration](v10, "mainDuration");
        -[MRAssetPlayerOptions setMainDuration:](v10, "setMainDuration:", v35 + -0.5);
      }

      double showDuration = self->_showDuration;
      -[MRAssetPlayerOptions introDuration](v10, "introDuration");
      double v38 = v37;
      -[MRAssetPlayerOptions mainDuration](v10, "mainDuration");
      double v40 = v38 + v39;
      -[MRAssetPlayerOptions outroDuration](v10, "outroDuration");
      if (showDuration < v40 + v41)
      {
        double v42 = self->_showDuration;
        -[MRAssetPlayerOptions introDuration](v10, "introDuration");
        double v44 = v42 - v43;
        -[MRAssetPlayerOptions outroDuration](v10, "outroDuration");
        -[MRAssetPlayerOptions setMainDuration:](v10, "setMainDuration:", v44 - v45);
      }

      self->mSlidePlayer = (MRAssetPlayer *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserPlayerForAssetAtPath:size:andOptions:",  self->_assetPath,  v10,  self->mImageSize.width,  self->mImageSize.height);

      -[MRAssetPlayer setDelegate:](self->mSlidePlayer, "setDelegate:", self);
      BYTE2(self->mFlags) |= 0xCu;
      objc_sync_enter(self);
      if (self->mEffectLayer)
      {
        -[NSLock lock](self->mPreloadOperationLock, "lock");
        if (!self->mPreloadOperation)
        {
          id v46 = [a5 preloadQueue];
          if (v46)
          {
            id v47 = [a5 copyForPreloading];
            v48 = -[NSMutableDictionary initWithObjectsAndKeys:]( [NSMutableDictionary alloc],  "initWithObjectsAndKeys:",  a4,  @"context",  [a4 imageManager],  @"imageManager",  v47,  @"renderArguments",  self->mSlidePlayer,  @"slidePlayer",  0);
            v49 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  self,  "loadWithArguments:",  v48);
            self->mPreloadOperation = v49;
            if (v8) {
              uint64_t v50 = 33LL;
            }
            else {
              uint64_t v50 = 9LL;
            }
            -[NSInvocationOperation setQualityOfService:](v49, "setQualityOfService:", v50);
            -[NSMutableDictionary setObject:forKey:]( v48,  "setObject:forKey:",  +[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", self->mPreloadOperation),  @"preloadOperationPointer");
            [v46 addOperation:self->mPreloadOperation];
          }
        }

        if (v8) {
          uint64_t v51 = 8LL;
        }
        else {
          uint64_t v51 = 0LL;
        }
        -[NSInvocationOperation setQueuePriority:](self->mPreloadOperation, "setQueuePriority:", v51);
        -[NSLock unlock](self->mPreloadOperationLock, "unlock");
      }

      objc_sync_exit(self);
    }

    else if (-[MCSlide plug](self->_slide, "plug", a4, a5, a6))
    {
      LOBYTE(self->mFlags) |= 1u;
      double v12 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:]( MRLayer,  "layerWithPlug:andParameters:inSuperlayer:",  -[MCSlide plug](self->_slide, "plug"),  objc_msgSend(objc_msgSend(a5, "renderer"), "parameters"),  0);
      self->mSlideLayer = v12;
      -[MRLayer setPixelSize:](v12, "setPixelSize:", self->mImageSize.width, self->mImageSize.height);
      if (!-[MRLayer isPreactivated](self->mSlideLayer, "isPreactivated"))
      {
        -[MRLayer preactivate](self->mSlideLayer, "preactivate");
        -[MRLayerClock setContainerTime:]( -[MRLayer clock](self->mSlideLayer, "clock"),  "setContainerTime:",  self->_timeToPreloadFor);
        int v13 = SBYTE1(self->mFlags);
        double v14 = -[MRLayer clock](self->mSlideLayer, "clock");
        if (v13 < 0) {
          -[MRLayerClock resumeOnNextUpdate](v14, "resumeOnNextUpdate");
        }
        else {
          -[MRLayerClock pauseOnNextUpdate](v14, "pauseOnNextUpdate");
        }
      }
    }
  }

- (void)loadWithArguments:(id)a3
{
  unsigned int v5 = (NSInvocationOperation *)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"preloadOperationPointer"),  "pointerValue");
  if (self->mPreloadOperation == v5 && (self->mFlags & 1) == 0)
  {
    char v6 = v5;
    id v7 = [a3 objectForKey:@"renderArguments"];
    objc_msgSend(objc_msgSend(v7, "renderer"), "imagePreloadingBegan");
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slidePlayer"), "loadForTime:", self->_timeToPreloadFor);
    -[NSLock lock](self->mPreloadOperationLock, "lock");
    if (self->mPreloadOperation == v6 && (self->mFlags & 1) == 0)
    {
      LOBYTE(self->mFlags) = self->mFlags & 0xFC | 1;
      BYTE1(self->mFlags) &= ~0x80u;

      self->mPreloadOperation = 0LL;
    }

    -[NSLock unlock](self->mPreloadOperationLock, "unlock");
    objc_msgSend(objc_msgSend(v7, "renderer"), "imagePreloadingEnded");
  }

  pthread_setname_np("");
}

- (void)unload
{
  if ((self->mFlags & 3) != 0)
  {
    objc_sync_enter(self);
    -[MRSlideProvider cancelLoading](self, "cancelLoading");
    LOBYTE(self->mFlags) &= ~1u;
    HIBYTE(self->mFlags) &= ~0x80u;
    mOriginalImage = self->mOriginalImage;
    if (mOriginalImage)
    {
      -[MRImage releaseByUser](mOriginalImage, "releaseByUser");
      self->mOriginalImage = 0LL;
    }

    mOutputImage = self->mOutputImage;
    if (mOutputImage)
    {
      -[MRImage releaseByUser](mOutputImage, "releaseByUser");
      self->mOutputImage = 0LL;
    }

    mFrame = self->mFrame;
    if (mFrame)
    {
      -[MRFrame releaseBySlideProvider:](mFrame, "releaseBySlideProvider:", self);
      self->mFrame = 0LL;
    }

    BYTE2(self->mFlags) |= 1u;
    mSlidePlayer = self->mSlidePlayer;
    if (mSlidePlayer)
    {
      -[MRAssetPlayer releaseByUser](mSlidePlayer, "releaseByUser");
      self->mSlidePlayer = 0LL;
    }

    if (self->_audioDucker)
    {
      -[MRLayerEffect _removeAudioDucker:](self->mEffectLayer, "_removeAudioDucker:");

      self->_audioDucker = 0LL;
    }

    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer)
    {
      if (-[MRLayer isActivated](mSlideLayer, "isActivated")) {
        -[MRLayer deactivate](self->mSlideLayer, "deactivate");
      }
      if (-[MRLayer isPreactivated](self->mSlideLayer, "isPreactivated")) {
        -[MRLayer depreactivate:](self->mSlideLayer, "depreactivate:", 0LL);
      }
      BOOL v8 = self->mSlideLayer;
      if (v8)
      {
        -[MRLayer cleanup](v8, "cleanup");

        self->mSlideLayer = 0LL;
      }
    }

    CGSize v9 = CGSizeZero;
    self->mImageSize = CGSizeZero;
    self->mLastImageSize = v9;
    self->mRequestedSize = v9;
    BYTE2(self->mFlags) |= 2u;
    self->_double timeToPreloadFor = 0.0;
    objc_sync_exit(self);
  }

- (void)cancelLoading
{
  mPreloadOperation = self->mPreloadOperation;
  if (mPreloadOperation)
  {
    -[NSInvocationOperation cancel](mPreloadOperation, "cancel");

    self->mPreloadOperation = 0LL;
  }

  LOBYTE(self->mFlags) &= ~2u;
  -[NSLock unlock](self->mPreloadOperationLock, "unlock");
}

- (BOOL)isNative3D
{
  return 0;
}

- (BOOL)isOpaque
{
  BOOL v3 = -[MRImage isOpaque](self->mOriginalImage, "isOpaque");
  if (v3) {
    LOBYTE(v3) = self->mKenBurnsType == 1;
  }
  return v3;
}

- (BOOL)isAlphaFriendly
{
  return 1;
}

- (BOOL)isInfinite
{
  return 0;
}

- (void)_computeImageSizeInContext:(id)a3 withArguments:(id)a4
{
  p_mRequestedSize = &self->mRequestedSize;
  double height = CGSizeZero.height;
  if (self->mRequestedSize.width == CGSizeZero.width && self->mRequestedSize.height == height)
  {
    float mOriginalImageAspectRatio = self->mOriginalImageAspectRatio;
    double v10 = -[MCSlide frameID](self->_slide, "frameID", a3);
    id v11 = -[NSDictionary objectForKey:]( -[MCSlide frameAttributes](self->_slide, "frameAttributes"),  "objectForKey:",  @"specificAttributes");
    *(float *)&double v12 = mOriginalImageAspectRatio;
    -[MRSlideProvider unframedImageSizeForAspectRatio:frameID:andFrameAttributes:atIndex:framedImageSize:]( self,  "unframedImageSizeForAspectRatio:frameID:andFrameAttributes:atIndex:framedImageSize:",  v10,  v11,  0LL,  0LL,  v12);
    self->mRequestedSize.double width = v13;
    self->mRequestedSize.double height = v14;
    self->mSlideIndex = -[MCSlide index](self->_slide, "index");
    double width = self->mRequestedSize.width;
    double v16 = self->mRequestedSize.height;
    if (width == 0.0)
    {
      self->mRequestedSize.double width = v16 * self->mOriginalImageAspectRatio;
    }

    else if (v16 == 0.0)
    {
      self->mRequestedSize.double height = width / self->mOriginalImageAspectRatio;
    }

    BYTE2(self->mFlags) |= 2u;
  }

  p_mImageSize = (float64x2_t *)&self->mImageSize;
  BOOL v18 = self->mImageSize.width == CGSizeZero.width && self->mImageSize.height == height;
  if (v18
    || (self->mFlags & 0x1000) == 0 && (objc_msgSend(a4, "freezesSizeOfImageRequests", a3) & 1) == 0)
  {
    float64x2_t *p_mImageSize = *(float64x2_t *)p_mRequestedSize;
    if (!-[MCSlide countOfAnimationPaths](self->_slide, "countOfAnimationPaths")) {
      goto LABEL_28;
    }
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v19 = objc_msgSend( -[MCSlide animationPathForKey:](self->_slide, "animationPathForKey:", @"scale", 0),  "keyframes");
    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v20) {
      goto LABEL_28;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    float v23 = 0.0;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        [v25 value];
        if (v26 > v23)
        {
          [v25 value];
          float v23 = v27;
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v21);
    if (v23 == 0.0)
    {
LABEL_28:
      -[MCSlide scale](self->_slide, "scale");
      float v23 = v28;
    }

    if (v23 > 0.0) {
      float64x2_t *p_mImageSize = vmulq_n_f64(*p_mImageSize, v23);
    }
    switch(self->mKenBurnsType)
    {
      case 0:
        MRFitHeightToAspectRatio();
        goto LABEL_38;
      case 1:
        double v31 = self->mOriginalImageAspectRatio;
        goto LABEL_36;
      case 2:
        double v31 = self->mOriginalImageAspectRatio;
        goto LABEL_37;
      case 3:
        double v31 = self->mOriginalImageAspectRatio;
        if (self->mRequestedSize.width < self->mRequestedSize.height == v31 >= 1.0) {
LABEL_37:
        }
          double v29 = MRFitInToAspectRatio(self->mImageSize.width, self->mImageSize.height, v31);
        else {
LABEL_36:
        }
          double v29 = MRFitOutToAspectRatio(self->mImageSize.width, self->mImageSize.height, v31);
LABEL_38:
        self->mImageSize.double width = v29;
        self->mImageSize.double height = v30;
        break;
      default:
        break;
    }

    BYTE2(self->mFlags) &= ~2u;
  }

- (BOOL)updateStuffWithAssetManager:(id)a3
{
  p_char mFlags = &self->mFlags;
  char v6 = (unsigned __int8 *)&self->mFlags + 1;
  do
    unsigned __int8 v7 = __ldaxr(v6);
  while (__stlxr(v7 & 0xFD, v6));
  BOOL v8 = (unsigned __int8 *)&self->mFlags + 2;
  do
    unsigned __int8 v9 = __ldaxr(v8);
  while (__stlxr(v9 & 0xBF, v8));
  do
    signed __int8 v10 = __ldaxr(v8);
  while (__stlxr(v10 & 0x7F, v8));
  BOOL v11 = v10 < 0;
  do
    int v12 = __ldaxr(v6);
  while (__stlxr(v12 & 0xFE, v6));
  BOOL v13 = (v7 & 2 | v9 & 0x40) != 0;
  BOOL v14 = v10 < 0 || (v7 & 2 | v9 & 0x40) != 0;
  int v15 = v14 | v12;
  do
    int v16 = __ldaxr(v8);
  while (__stlxr(v16 & 0xFE, v8));
  if (((v15 | v16) & 1) == 0) {
    return v15 & 1;
  }
  objc_sync_enter(self);
  if ((v15 & 1) == 0) {
    goto LABEL_50;
  }
  if (!v13)
  {
    if ((v12 & 1) == 0) {
      goto LABEL_49;
    }
    if ((*(_BYTE *)p_mFlags & 8) == 0) {
      goto LABEL_35;
    }
  }

  -[MRSlideProvider unload](self, "unload");
  if ((v7 & 2) != 0)
  {
    slide = self->_slide;
    if (slide)
    {
      BOOL v18 = (NSString *)-[NSString copy](-[MCAsset path](-[MCSlide asset](slide, "asset"), "path"), "copy");
      self->_assetPath = v18;
      if (v18)
      {
LABEL_21:
        objc_msgSend(a3, "resolutionForAssetAtPath:");
        double v21 = v19 / v20;
        if (v20 <= 0.0) {
          double v21 = 1.0;
        }
        self->float mOriginalImageAspectRatio = v21;
        else {
          char v22 = 0;
        }
        char v23 = *(_BYTE *)p_mFlags & 0xFB | v22;
        goto LABEL_32;
      }
    }

    else if (self->_assetPath)
    {
      goto LABEL_21;
    }

    if (-[MCSlide plug](self->_slide, "plug")) {
      self->float mOriginalImageAspectRatio = self->mDefaultSize.width / self->mDefaultSize.height;
    }
    else {
      self->float mOriginalImageAspectRatio = 1.0;
    }
    char v23 = self->mFlags & 0xFB;
LABEL_32:
    LOBYTE(self->mFlags) = v23;
    self->mKenBurnsType = self->mDefaultKenBurnsType;
    v24 = self->_slide;
    if (v24) {
      self->_filterID = (NSString *)objc_msgSend( -[NSSet anyObject](-[MCSlide filters](v24, "filters"), "anyObject"),  "filterID");
    }
  }

  LOBYTE(v16) = 1;
  BOOL v11 = 1;
LABEL_35:
  if (-[MCSlide startTimeIsDefined](self->_slide, "startTimeIsDefined"))
  {
    -[MCSlide startTime](self->_slide, "startTime");
    self->_double slideStartTime = v25;
  }

  if (-[MCSlide durationIsDefined](self->_slide, "durationIsDefined"))
  {
    -[MCSlide duration](self->_slide, "duration");
    self->_slideDuration = v26;
  }

  if (self->_assetPath)
  {
    if ((*(_BYTE *)p_mFlags & 4) != 0)
    {
      if (!-[MCSlide startTimeIsDefined](self->_slide, "startTimeIsDefined"))
      {
        [a3 startTimeForAssetAtPath:self->_assetPath];
        self->_double slideStartTime = v27;
      }

      if (!-[MCSlide durationIsDefined](self->_slide, "durationIsDefined"))
      {
        [a3 stopTimeForAssetAtPath:self->_assetPath];
        self->_slideDuration = v28 - self->_slideStartTime;
      }
    }

    if (self->_slideDuration < 0.0)
    {
      self->_slideDuration = 0.0;
      goto LABEL_59;
    }

    goto LABEL_49;
  }

  if (!-[MCSlide plug](self->_slide, "plug") || -[MCSlide durationIsDefined](self->_slide, "durationIsDefined"))
  {
LABEL_49:
    BYTE2(self->mFlags) |= 0xEu;
    if (v11) {
      goto LABEL_60;
    }
LABEL_50:
    if ((v16 & 1) == 0) {
      goto LABEL_73;
    }
LABEL_51:
    double v29 = -[MCSlide frameID](self->_slide, "frameID");
    mFrame = self->mFrame;
    if (v29)
    {
      if (!-[NSString isEqualToString:](v29, "isEqualToString:", -[MRFrame frameID](mFrame, "frameID")))
      {
        double v31 = +[MRFrame retainedFrameWithFrameID:forSlideProvider:]( &OBJC_CLASS___MRFrame,  "retainedFrameWithFrameID:forSlideProvider:",  v29,  self);
        self->mFrame = v31;
        -[MRFrame setPixelSize:](v31, "setPixelSize:", self->mDefaultSize.width, self->mDefaultSize.height);
      }
    }

    else if (mFrame)
    {
      -[MRFrame releaseBySlideProvider:](mFrame, "releaseBySlideProvider:", self);
      self->mFrame = 0LL;
    }

    if (self->mFrame) {
      -[MRFrame setAttributes:]( self->mFrame,  "setAttributes:",  -[MCSlide frameAttributes](self->_slide, "frameAttributes"));
    }
    goto LABEL_73;
  }

  -[MCPlug fullDuration](-[MCSlide plug](self->_slide, "plug"), "fullDuration");
  self->_slideDuration = v32;
LABEL_59:
  BYTE2(self->mFlags) |= 0xEu;
  if (!v11) {
    goto LABEL_50;
  }
LABEL_60:
  __int128 v33 = -[MCSlide kenBurnsType](self->_slide, "kenBurnsType");
  if (-[NSString isEqualToString:](v33, "isEqualToString:", @"Crop to Fit"))
  {
    int mDefaultKenBurnsType = 1;
  }

  else if (-[NSString isEqualToString:](v33, "isEqualToString:", @"Scale to Fit"))
  {
    int mDefaultKenBurnsType = 2;
  }

  else if (-[NSString isEqualToString:](v33, "isEqualToString:", @"Linear"))
  {
    int mDefaultKenBurnsType = 0;
  }

  else if (-[NSString isEqualToString:](v33, "isEqualToString:", @"Scrop to Fit"))
  {
    int mDefaultKenBurnsType = 3;
  }

  else
  {
    int mDefaultKenBurnsType = self->mDefaultKenBurnsType;
  }

  self->mKenBurnsType = mDefaultKenBurnsType;
  -[MCSlide center](self->_slide, "center");
  self->_center.x = v35;
  self->_center.y = v36;
  -[MCSlide scale](self->_slide, "scale");
  self->_scale = v37;
  -[MCSlide rotation](self->_slide, "rotation");
  self->_rotation = v38;
  if (-[NSSet count](-[MCSlide animationPaths](self->_slide, "animationPaths"), "count"))
  {
    self->_centerAnimationPath = (MCAnimationPathKeyframed *) -[MCSlide animationPathForKey:]( self->_slide,  "animationPathForKey:",  @"center");
    self->_scaleAnimationPath = (MCAnimationPathKeyframed *) -[MCSlide animationPathForKey:]( self->_slide,  "animationPathForKey:",  @"scale");
    self->_rotationAnimationPath = (MCAnimationPathKeyframed *) -[MCSlide animationPathForKey:]( self->_slide,  "animationPathForKey:",  @"angle");
    char v39 = BYTE1(self->mFlags) | 4;
  }

  else
  {
    char v39 = BYTE1(self->mFlags) & 0xFB;
  }

  BYTE1(self->mFlags) = v39;
  if ((v16 & 1) != 0) {
    goto LABEL_51;
  }
LABEL_73:
  mOutputImage = self->mOutputImage;
  if (mOutputImage)
  {
    -[MRImage releaseByUser](mOutputImage, "releaseByUser");
    self->mOutputImage = 0LL;
  }

  objc_sync_exit(self);
  return v15 & 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(_OWORD *)&self->mSlidePlayer == 0LL && !self->_assetPath)
  {
    audioDucker = -[MCSlide plug](self->_slide, "plug");
    if (!audioDucker) {
      return (char)audioDucker;
    }
  }

  double v10 = a3 - self->_showTime;
  unsigned int mFlags_low = LOBYTE(self->mFlags);
  int v12 = SBYTE1(self->mFlags);
  if (v10 < -10.0 || v10 >= self->_showDuration || !-[MRLayer isPreactivated](self->mEffectLayer, "isPreactivated"))
  {
    if (v12 < 0) {
      -[MRSlideProvider setIsPlaying:](self, "setIsPlaying:", 0LL);
    }
    HIBYTE(self->mFlags) &= ~0x80u;
    double showDuration = self->_showDuration;
    if (self->mSlidePlayer)
    {
      -[MCSlide audioDuckOutDuration](self->_slide, "audioDuckOutDuration");
      double v23 = fmax(v22, 2.0);
    }

    else
    {
      double v23 = 2.0;
    }

    if ((mFlags_low & 3) != 0)
    {
      double v24 = showDuration + v23;
      BOOL v25 = v10 >= -10.0 && v10 < v24;
      if (!v25 || !-[MRLayer isPreactivated](self->mEffectLayer, "isPreactivated")) {
        -[MRSlideProvider unload](self, "unload");
      }
    }

    audioDucker = (MCPlugSlide *)self->_audioDucker;
    if (audioDucker)
    {
      -[MCPlugSlide setTime:](audioDucker, "setTime:", v10);
      LOBYTE(audioDucker) = 0;
    }

    return (char)audioDucker;
  }

  if ((self->mFlags & 0x20000) != 0) {
    -[MRSlideProvider _computeImageSizeInContext:withArguments:]( self,  "_computeImageSizeInContext:withArguments:",  a4,  a5);
  }
  if (self->mSlidePlayer)
  {
    double width = self->mLastImageSize.width;
    double height = self->mLastImageSize.height;
    int v15 = (mFlags_low >> 1) & 1;
    char v16 = mFlags_low & 1;
    BOOL v17 = width == CGSizeZero.width && height == CGSizeZero.height;
    if (!v17 && (width != self->mImageSize.width || height != self->mImageSize.height))
    {
      objc_sync_enter(self);
      -[MRSlideProvider cancelLoading](self, "cancelLoading");
      LOBYTE(self->mFlags) &= ~1u;
      mOriginalImage = self->mOriginalImage;
      if (mOriginalImage)
      {
        -[MRImage releaseByUser](mOriginalImage, "releaseByUser");
        self->mOriginalImage = 0LL;
      }

      mOutputImage = self->mOutputImage;
      if (mOutputImage)
      {
        -[MRImage releaseByUser](mOutputImage, "releaseByUser");
        self->mOutputImage = 0LL;
      }

      mSlidePlayer = self->mSlidePlayer;
      if (mSlidePlayer)
      {
        -[MRAssetPlayer releaseByUser](mSlidePlayer, "releaseByUser");
        self->mSlidePlayer = 0LL;
      }

      if (self->_audioDucker)
      {
        -[MRLayerEffect _removeAudioDucker:](self->mEffectLayer, "_removeAudioDucker:");

        self->_audioDucker = 0LL;
      }

      objc_sync_exit(self);
      LOBYTE(v15) = 0;
      char v16 = 0;
    }
  }

  else
  {
    mSlideLayer = self->mSlideLayer;
    int v15 = (mFlags_low >> 1) & 1;
    char v16 = mFlags_low & 1;
    if (mSlideLayer)
    {
      -[MRLayer pixelSize](mSlideLayer, "pixelSize");
      if (v28 != self->mImageSize.width || v27 != self->mImageSize.height) {
        -[MRLayer setPixelSize:](self->mSlideLayer, "setPixelSize:");
      }
    }
  }

  if (v10 >= 0.0)
  {
    BOOL v29 = -[MRLayer isActivated](self->mEffectLayer, "isActivated");
    if ((v16 & 1) != 0) {
      goto LABEL_53;
    }
  }

  else
  {
    BOOL v29 = 0LL;
    if ((v16 & 1) != 0) {
      goto LABEL_53;
    }
  }

  if ((v15 & 1) != 0)
  {
    if (v29)
    {
      -[NSLock lock](self->mPreloadOperationLock, "lock");
      -[NSInvocationOperation setQueuePriority:](self->mPreloadOperation, "setQueuePriority:", 8LL);
      -[NSLock unlock](self->mPreloadOperationLock, "unlock");
    }
  }

  else
  {
    -[MRSlideProvider loadForTime:inContext:withArguments:now:]( self,  "loadForTime:inContext:withArguments:now:",  a4,  a5,  v29,  v10);
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(_OWORD *)&self->mSlidePlayer == 0LL)
  {
    NSLog(@"Slide was unloaded although expected", a2, a3);
    return 0LL;
  }

  double v8 = a3 - self->_showTime;
  if (v8 < 0.0 || v8 >= self->_showDuration) {
    return 0LL;
  }
  if ((SHIBYTE(self->mFlags) & 0x80000000) == 0
    && (objc_msgSend(objc_msgSend(a5, "renderer"), "isOffscreen") & 1) == 0
    && self->_assetPath)
  {
    if (self->mEffectLayer)
    {
      slide = self->_slide;
      if (slide)
      {
        double v10 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"layer",  slide,  @"slide",  0LL);
        BOOL v11 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
        -[NSNotificationCenter postNotificationName:object:userInfo:]( v11,  "postNotificationName:object:userInfo:",  kMRNotificationSlideIsOn,  [a5 renderer],  v10);
      }
    }

    HIBYTE(self->mFlags) |= 0x80u;
  }

  if (self->mSlidePlayer)
  {
    CGFloat height = self->mImageSize.height;
    CGFloat width = self->mImageSize.width;
    mSlidePlayer = self->mSlidePlayer;
    [a5 displayLinkTimestamp];
    char v16 = -[MRAssetPlayer retainedByUserImageAtTime:displayLinkTimestamp:]( mSlidePlayer,  "retainedByUserImageAtTime:displayLinkTimestamp:",  v8,  v15);
    if (!v16) {
      goto LABEL_30;
    }
  }

  else
  {
    mSlideLayer = self->mSlideLayer;
    if (!mSlideLayer
      || v8 == self->mLastTime
      && self->mOriginalImage
      && self->mLastImageSize.width == self->mImageSize.width
      && self->mLastImageSize.height == self->mImageSize.height
      || (v16 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSlideLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v8),  -[MRImage width](v16, "width"),  CGFloat width = v19,  -[MRImage height](v16, "height"),  height = v20,  !v16))
    {
LABEL_30:
      BOOL v22 = 0;
      goto LABEL_31;
    }
  }

  mOriginalImage = self->mOriginalImage;
  BOOL v22 = v16 != mOriginalImage;
  if (v16 == mOriginalImage)
  {
    -[MRImage releaseByUser](v16, "releaseByUser");
  }

  else
  {
    if (mOriginalImage) {
      -[MRImage releaseByUser](mOriginalImage, "releaseByUser");
    }
    self->mOriginalImage = v16;
  }

  self->mLastImageSize.CGFloat width = width;
  self->mLastImageSize.CGFloat height = height;
  self->mLastTime = v8;
LABEL_31:
  double v23 = self->mOriginalImage;
  if (v23)
  {
    double v24 = self->mSizeFactor.width;
    double v25 = self->mSizeFactor.height;
    if (self->_centerAnimationPath || self->_scaleAnimationPath || self->_rotationAnimationPath)
    {
      uint64_t v26 = 1LL;
      int v27 = 1;
    }

    else
    {
      uint64_t v26 = 0LL;
      int v27 = (BYTE1(self->mFlags) >> 3) & 1;
    }

    double v28 = self->mRequestedSize.width * v24;
    double v29 = self->mRequestedSize.height * v25;
    if (v22
      || ((mOutputImage = self->mOutputImage) == 0LL ? (char v31 = 1) : (char v31 = v27),
          (v31 & 1) != 0 || (v28 == self->mLastDaSize.width ? (BOOL v32 = v29 == self->mLastDaSize.height) : (BOOL v32 = 0), !v32)))
    {
      BYTE1(self->mFlags) &= ~8u;
      CGPoint v58 = CGPointZero;
      if (v24 < v25) {
        double v24 = v25;
      }
      double v33 = 1.0 / v24;
      double v57 = 1.0 / v24;
      double v56 = 0.0;
      uint64_t mKenBurnsType = self->mKenBurnsType;
      if ((_DWORD)mKenBurnsType == 3)
      {
        -[MRImage width](v23, "width");
        double v36 = v35;
        -[MRImage height](self->mOriginalImage, "height");
        if (v28 < v29 != v36 >= v37) {
          uint64_t mKenBurnsType = 1LL;
        }
        else {
          uint64_t mKenBurnsType = 2LL;
        }
      }

      if (self->mOriginalImageAspectRatio < 1.0
        || (-[MRImage width](self->mOriginalImage, "width"),
            double v39 = v38 / self->mOriginalImageAspectRatio,
            -[MRImage height](self->mOriginalImage, "height"),
            vabdd_f64(v39, v40) < 2.0)
        || self->mOriginalImageAspectRatio >= 1.0
        || (-[MRImage height](self->mOriginalImage, "height"),
            double v42 = v41,
            double mOriginalImageAspectRatio = self->mOriginalImageAspectRatio,
            -[MRImage width](self->mOriginalImage, "width"),
            fabs(-(v44 - v42 * mOriginalImageAspectRatio)) < 2.0))
      {
        -[MRSlideProvider applyKenBurnsAtTime:withTargetSize:kenBurnsType:translation:scale:rotation:]( self,  "applyKenBurnsAtTime:withTargetSize:kenBurnsType:translation:scale:rotation:",  mKenBurnsType,  &v58,  &v57,  &v56,  v8,  v28,  v29);
        uint64_t v45 = 0LL;
LABEL_56:
        -[MRImage releaseByUser](self->mOutputImage, "releaseByUser");
        id v46 = -[MRImage retainedByUserImage](self->mOriginalImage, "retainedByUserImage");
        self->mOutputImage = v46;
        -[MRImage setCenterX:](v46, "setCenterX:", v58.x);
        -[MRImage setCenterY:](self->mOutputImage, "setCenterY:", v58.y);
        -[MRImage setScale:](self->mOutputImage, "setScale:", v57);
        -[MRImage setRotationAngle:](self->mOutputImage, "setRotationAngle:", v56);
        double v47 = -1.0;
        if (v27) {
          double v47 = v8;
        }
        -[MRImage setRenderTime:](self->mOutputImage, "setRenderTime:", v47);
        if ((_DWORD)mKenBurnsType == 1) {
          uint64_t v48 = 2LL;
        }
        else {
          uint64_t v48 = 1LL;
        }
        -[MRImage setClampMode:](self->mOutputImage, "setClampMode:", v48);
        -[MRImage setHasKenBurns:](self->mOutputImage, "setHasKenBurns:", v26);
        -[MRImage setScaleWasFixedForTargetAspectRatio:]( self->mOutputImage,  "setScaleWasFixedForTargetAspectRatio:",  v45);
        -[MRImage setFilterID:](self->mOutputImage, "setFilterID:", self->_filterID);
        mFrame = self->mFrame;
        mOutputImage = self->mOutputImage;
        if (mFrame)
        {
          -[MRFrame setInputImage:](mFrame, "setInputImage:", mOutputImage);
          double v50 = -[MRFrame retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mFrame,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  v8);
          mOutputImage = self->mOutputImage;
          if (v50)
          {
            unsigned int v51 = v50;
            -[MRImage releaseByUser](self->mOutputImage, "releaseByUser");
            self->mOutputImage = v51;
            mOutputImage = v51;
          }
        }

        self->mLastDaSize.CGFloat width = v28;
        self->mLastDaSize.CGFloat height = v29;
        return -[MRImage retainByUser](mOutputImage, "retainByUser");
      }

      -[MRImage aspectRatio](self->mOriginalImage, "aspectRatio");
      float v54 = v53;
      float v55 = v28 / v29;
      if (mKenBurnsType >= 2)
      {
        if ((_DWORD)mKenBurnsType != 2 || v54 >= v55) {
          goto LABEL_76;
        }
      }

      else if (v54 <= v55)
      {
        goto LABEL_76;
      }

      double v57 = v33 * (float)(v54 / v55);
LABEL_76:
      uint64_t v45 = 1LL;
      goto LABEL_56;
    }
  }

  else
  {
    double v52 = self->mOutputImage;
    if (v52)
    {
      -[MRImage releaseByUser](v52, "releaseByUser");
      mOutputImage = 0LL;
      self->mOutputImage = 0LL;
    }

    else
    {
      mOutputImage = 0LL;
    }
  }

  return -[MRImage retainByUser](mOutputImage, "retainByUser");
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v6 = -[MRSlideProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  double v7 = 2.0 / (self->mDefaultSize.width / self->mDefaultSize.height);
  double v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v7 * -0.5, 2.0, v7),  @"rectangle",  0);
  unsigned __int8 v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (void)imageIsAvailableFromAssetPlayer:(id)a3
{
  BYTE2(self->mFlags) |= 0x10u;
  if (-[MRLayer isActivated](self->mEffectLayer, "isActivated", a3)) {
    -[MRLayerEffect _requestRendering](self->mEffectLayer, "_requestRendering");
  }
}

- (CGSize)defaultSize
{
  double width = self->mDefaultSize.width;
  double height = self->mDefaultSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)stillTime
{
  return self->mStillTime;
}

- (void)setStillTime:(float)a3
{
  self->float mStillTime = a3;
}

- (NSString)imageSizeScript
{
  return self->mImageSizeScript;
}

- (NSDictionary)effectAttributes
{
  return self->mEffectAttributes;
}

- (NSString)showTimeScript
{
  return self->mShowTimeScript;
}

- (void)setShowTimeScript:(id)a3
{
}

- (double)showTime
{
  return self->_showTime;
}

- (void)setShowTime:(double)a3
{
  self->_showTime = a3;
}

- (double)showDuration
{
  return self->_showDuration;
}

- (CGSize)requestedSize
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeFactor
{
  double width = self->mSizeFactor.width;
  double height = self->mSizeFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSizeFactor:(CGSize)a3
{
  self->mSizeFactor = a3;
}

- (MCSlide)slide
{
  return self->_slide;
}

- (int)defaultKenBurnsType
{
  return self->mDefaultKenBurnsType;
}

- (void)setDefaultKenBurnsType:(int)a3
{
  self->int mDefaultKenBurnsType = a3;
}

- (MRFrame)frame
{
  return self->mFrame;
}

- (double)imageAspectRatio
{
  return self->mOriginalImageAspectRatio;
}

- (double)slideStartTime
{
  return self->_slideStartTime;
}

- (double)slideDuration
{
  return self->_slideDuration;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)rotation
{
  return self->_rotation;
}

- (MCAnimationPathKeyframed)centerAnimationPath
{
  return self->_centerAnimationPath;
}

- (MCAnimationPathKeyframed)scaleAnimationPath
{
  return self->_scaleAnimationPath;
}

- (MCAnimationPathKeyframed)rotationAnimationPath
{
  return self->_rotationAnimationPath;
}

- (NSString)filterID
{
  return self->_filterID;
}

- (void)setFilterID:(id)a3
{
}

- (id)playerHint
{
  return self->_playerHint;
}

- (void)setPlayerHint:(id)a3
{
  self->_playerHint = a3;
}

- (void)applyKenBurnsAtTime:(double)a3 withTargetSize:(CGSize)a4 kenBurnsType:(int)a5 translation:(CGPoint *)a6 scale:(double *)a7 rotation:(double *)a8
{
  double height = a4.height;
  double width = a4.width;
  -[MRImage aspectRatio](self->mOriginalImage, "aspectRatio");
  double v17 = v16;
  -[MRImage width](self->mOriginalImage, "width");
  double v19 = v18;
  -[MRImage height](self->mOriginalImage, "height");
  double v21 = v20;
  CGPoint center = self->_center;
  CGPoint v69 = center;
  double scale = self->_scale;
  double v67 = scale;
  mEffectLayer = self->mEffectLayer;
  if ((self->mFlags & 0x400) != 0) {
    double v23 = -[MRLayer plug](mEffectLayer, "plug");
  }
  else {
    double v23 = -[MRLayer clock](mEffectLayer, "clock");
  }
  double v24 = v23;
  centerAnimationPath = self->_centerAnimationPath;
  if (centerAnimationPath)
  {
    if (-[MCAnimationPath isTriggered](centerAnimationPath, "isTriggered")
      && self->_centerAnimationPathTriggerTime < 0.0)
    {
      self->_double centerAnimationPathTriggerTime = a3;
    }

    char v65 = 0;
    uint64_t v26 = self->_centerAnimationPath;
    unsigned int v27 = -[MCAnimationPath isTriggered](v26, "isTriggered");
    double centerAnimationPathTriggerTime = 0.0;
    if (v27) {
      double centerAnimationPathTriggerTime = self->_centerAnimationPathTriggerTime;
    }
    +[MRUtilities valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:]( &OBJC_CLASS___MRUtilities,  "valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:",  v26,  v24,  &v69,  &center,  &v65,  a3 - centerAnimationPathTriggerTime,  self->_center.x,  self->_center.y);
    self->_center.double x = v29;
    self->_center.double y = v30;
    if (v65 && -[MCAnimationPath isTriggered](self->_centerAnimationPath, "isTriggered"))
    {

      self->_centerAnimationPath = 0LL;
      self->_double centerAnimationPathTriggerTime = -1.0;
    }
  }

  scaleAnimationPath = self->_scaleAnimationPath;
  if (scaleAnimationPath)
  {
    if (-[MCAnimationPath isTriggered](scaleAnimationPath, "isTriggered") && self->_scaleAnimationPathTriggerTime < 0.0) {
      self->_double scaleAnimationPathTriggerTime = a3;
    }
    char v65 = 0;
    BOOL v32 = self->_scaleAnimationPath;
    unsigned int v33 = -[MCAnimationPath isTriggered](v32, "isTriggered");
    double scaleAnimationPathTriggerTime = 0.0;
    if (v33) {
      double scaleAnimationPathTriggerTime = self->_scaleAnimationPathTriggerTime;
    }
    +[MRUtilities valueForScalarAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyValue:nextKeyValue:animationIsOver:]( &OBJC_CLASS___MRUtilities,  "valueForScalarAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyValue:nextKeyValue:animationIsOver:",  v32,  v24,  &v67,  &scale,  &v65,  a3 - scaleAnimationPathTriggerTime,  self->_scale);
    self->_double scale = v35;
    if (v65 && -[MCAnimationPath isTriggered](self->_scaleAnimationPath, "isTriggered"))
    {

      self->_scaleAnimationPath = 0LL;
      self->_double scaleAnimationPathTriggerTime = -1.0;
    }
  }

  rotationAnimationPath = self->_rotationAnimationPath;
  if (rotationAnimationPath)
  {
    if (-[MCAnimationPath isTriggered](rotationAnimationPath, "isTriggered")
      && self->_rotationAnimationPathTriggerTime < 0.0)
    {
      self->_double rotationAnimationPathTriggerTime = a3;
    }

    char v65 = 0;
    double v37 = self->_rotationAnimationPath;
    unsigned int v38 = -[MCAnimationPath isTriggered](v37, "isTriggered");
    double rotationAnimationPathTriggerTime = 0.0;
    if (v38) {
      double rotationAnimationPathTriggerTime = self->_rotationAnimationPathTriggerTime;
    }
    +[MRUtilities valueForScalarAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyValue:nextKeyValue:animationIsOver:]( &OBJC_CLASS___MRUtilities,  "valueForScalarAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyValue:nextKeyValue:animationIsOver:",  v37,  v24,  0LL,  0LL,  &v65,  a3 - rotationAnimationPathTriggerTime,  self->_rotation);
    self->_double rotation = v40;
    if (v65 && -[MCAnimationPath isTriggered](self->_rotationAnimationPath, "isTriggered"))
    {

      self->_rotationAnimationPath = 0LL;
      self->_double rotationAnimationPathTriggerTime = -1.0;
    }
  }

  double x = self->_center.x;
  double y = self->_center.y;
  if (a6)
  {
    double x = x + a6->x;
    double y = y + a6->y;
  }

  double v43 = self->_scale;
  if (a7) {
    double v43 = v43 * *a7;
  }
  double rotation = self->_rotation;
  if (a8) {
    double rotation = rotation + *a8;
  }
  double v45 = width / height;
  double v46 = height / width;
  if (a5 == 2)
  {
    double v47 = v19 / v43;
    if (v45 > 0.0)
    {
      if (v45 >= v17)
      {
        double v60 = v21 / v67;
        double v47 = v45 * (v21 / v43);
        double v61 = v21 / scale;
        if (center.x == v69.x)
        {
          double v50 = v19 + v47 * -0.5 + (1.0 - x) * (v47 - v19);
        }

        else
        {
          double v62 = v19 - v45 * v61 * 0.5 + (1.0 - center.x) * (v45 * v61 - v19);
          double v63 = v19 - v45 * v60 * 0.5 + (1.0 - v69.x) * (v45 * v60 - v19);
          double v50 = v63 + (x - v69.x) * (v62 - v63) / (center.x - v69.x);
        }

        if (center.y == v69.y) {
          double v56 = v21 / v43 * 0.5 + y * (v21 - v21 / v43);
        }
        else {
          double v56 = v60 * 0.5
        }
              + v69.y * (v21 - v60)
              + (y - v69.y)
              * (v61 * 0.5 + center.y * (v21 - v61) - (v60 * 0.5 + v69.y * (v21 - v60)))
              / (center.y - v69.y);
        goto LABEL_66;
      }

      double v48 = v19 / v67;
      double v49 = v19 / scale;
      if (center.x == v69.x) {
        double v50 = v47 * 0.5 + x * (v19 - v47);
      }
      else {
        double v50 = v48 * 0.5
      }
            + v69.x * (v19 - v48)
            + (x - v69.x)
            * (v49 * 0.5 + center.x * (v19 - v49) - (v48 * 0.5 + v69.x * (v19 - v48)))
            / (center.x - v69.x);
      if (center.y != v69.y)
      {
        double v64 = v21 - v46 * v48 * 0.5 + (1.0 - v69.y) * (v46 * v48 - v21);
        double v56 = v64
            + (y - v69.y) * (v21 - v46 * v49 * 0.5 + (1.0 - center.y) * (v46 * v49 - v21) - v64) / (center.y - v69.y);
        goto LABEL_66;
      }

      double y = 1.0 - y;
      double v57 = v46 * v47 - v21;
      double v58 = v21 + v46 * v47 * -0.5;
      goto LABEL_65;
    }

    double v50 = CGPointZero.x;
    double v56 = CGPointZero.y;
LABEL_66:
    if (!a6) {
      goto LABEL_69;
    }
    a6->double x = (v50 + v50) / v19 + -1.0;
    double v59 = (v56 + v56) / v21 + -1.0;
    goto LABEL_68;
  }

  if (a5 == 1)
  {
    double v47 = v19 / v43;
    double v51 = v19 / v67;
    double v52 = v19 / scale;
    if (v45 <= v17)
    {
      double v53 = v21 / v43;
      double v54 = v21 / v67;
      double v55 = v21 / scale;
      if (v45 > 0.0)
      {
        double v47 = v45 * v53;
        double v51 = v45 * v54;
        double v52 = v45 * v55;
      }
    }

    else
    {
      double v53 = v46 * v47;
      double v54 = v46 * v51;
      double v55 = v46 * v52;
    }

    if (center.x == v69.x) {
      double v50 = v47 * 0.5 + x * (v19 - v47);
    }
    else {
      double v50 = v51 * 0.5
    }
          + v69.x * (v19 - v51)
          + (x - v69.x) * (v52 * 0.5 + center.x * (v19 - v52) - (v51 * 0.5 + v69.x * (v19 - v51))) / (center.x - v69.x);
    if (center.y == v69.y)
    {
      double v57 = v21 - v53;
      double v58 = v53 * 0.5;
LABEL_65:
      double v56 = v58 + y * v57;
      goto LABEL_66;
    }

    double v56 = v54 * 0.5
        + v69.y * (v21 - v54)
        + (y - v69.y) * (v55 * 0.5 + center.y * (v21 - v55) - (v54 * 0.5 + v69.y * (v21 - v54))) / (center.y - v69.y);
    goto LABEL_66;
  }

  double v47 = v19;
  if (a5) {
    goto LABEL_69;
  }
  if (scale == v67)
  {
    double v47 = v19 / v43;
    if (!a6) {
      goto LABEL_69;
    }
    goto LABEL_59;
  }

  double v47 = v19 * (1.0 / v67 + (v43 - v67) * (1.0 / scale - 1.0 / v67) / (scale - v67));
  if (a6)
  {
LABEL_59:
    a6->double x = x * 2.0 + -1.0;
    double v59 = y * 2.0 + -1.0;
LABEL_68:
    a6->double y = v59;
  }

- (void)printFlags
{
  NSLog( @"%@",  -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n\tisMonochromatic = %d",  (LOBYTE(self->mFlags) >> 6) & 1),  "stringByAppendingFormat:",  @"\n\tusesMipmapping = %d",  (LOBYTE(self->mFlags) >> 5) & 1),  "stringByAppendingFormat:",  @"\n\tisStill = %d",  (LOBYTE(self->mFlags) >> 3) & 1),  "stringByAppendingFormat:",  @"\n\tisSupportedMovie = %d",  (LOBYTE(self->mFlags) >> 2) & 1),  "stringByAppendingFormat:",  @"\n\tisPreloading = %d",  (LOBYTE(self->mFlags) >> 1) & 1),  "stringByAppendingFormat:",  @"\n\tisLoaded = %d",  self->mFlags & 1),  "stringByAppendingFormat:",  @"\n\tisPlaying = %d",  BYTE1(self->mFlags) >> 7),  "stringByAppendingFormat:",  @"\n\tslideIsReadonldouble y = %d",  (BYTE1(self->mFlags) >> 6) & 1),  "stringByAppendingFormat:",  @"\n\tisUpdatingLive = %d",  (BYTE1(self->mFlags) >> 4) & 1),  "stringByAppendingFormat:",  @"\n\tneedsToUpdateSlide = %d",
                      (BYTE1(self->mFlags) >> 1) & 1),
                    "stringByAppendingFormat:",
                    @"\n\tneedsToUpdateKenBurns = %d",
                    BYTE2(self->mFlags) >> 7),
                  "stringByAppendingFormat:",
                  @"\n\tneedsToUpdateFrame = %d",
                  (BYTE2(self->mFlags) >> 6) & 1),
                "stringByAppendingFormat:",
                @"\n\tneedsToUnloadOnEndLiveUpdate = %d",
                (BYTE2(self->mFlags) >> 5) & 1),
              "stringByAppendingFormat:",
              @"\n\tneedsRendering = %d",
              (BYTE2(self->mFlags) >> 4) & 1),
            "stringByAppendingFormat:",
            @"\n\tneedsToUpdateTiming = %d",
            (BYTE2(self->mFlags) >> 3) & 1),
          "stringByAppendingFormat:",
          @"\n\tneedsToUpdateAudio = %d",
          (BYTE2(self->mFlags) >> 2) & 1),
        "stringByAppendingFormat:",
        @"\n\tneedsToUpdateImageSize = %d",
        (BYTE2(self->mFlags) >> 1) & 1),
      "stringByAppendingFormat:",
      @"\n\tsentSlideInOnNotification = %d",
      HIBYTE(self->mFlags) >> 7));
}

@end