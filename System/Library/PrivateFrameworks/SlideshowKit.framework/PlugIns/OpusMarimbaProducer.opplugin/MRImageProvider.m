@interface MRImageProvider
- (BOOL)beginLiveUpdate;
- (BOOL)endLiveUpdate;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoaded;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)justHoldIt;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)wantsMipmap;
- (BOOL)wantsMonochromatic;
- (BOOL)wantsPowerOfTwo;
- (CGSize)defaultSize;
- (CGSize)imageSizeForAspectRatio:(float)a3;
- (CGSize)originalImageSize;
- (CGSize)requestedSize;
- (MRImageProvider)init;
- (MRLayerEffect)effectLayer;
- (NSDictionary)effectAttributes;
- (NSString)assetPath;
- (NSString)imageSizeScript;
- (double)imageAspectRatio;
- (double)showDuration;
- (double)showTime;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_computeImageSizeInContext:(id)a3 withArguments:(id)a4;
- (void)_unloadIfNotUpdatingLive;
- (void)cancelLoading;
- (void)cleanup;
- (void)dealloc;
- (void)imageIsAvailableFromAssetPlayer:(id)a3;
- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6;
- (void)loadWithArguments:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAssetPath:(id)a3;
- (void)setDefaultSize:(CGSize)a3;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectLayer:(id)a3;
- (void)setImageSizeScript:(id)a3;
- (void)setJustHoldIt:(BOOL)a3;
- (void)setOriginalImageSize:(CGSize)a3;
- (void)setShowDuration:(double)a3;
- (void)setShowTime:(double)a3;
- (void)setWantsMipmap:(BOOL)a3;
- (void)setWantsMonochromatic:(BOOL)a3;
- (void)setWantsPowerOfTwo:(BOOL)a3;
- (void)unload;
@end

@implementation MRImageProvider

- (MRImageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRImageProvider;
  v2 = -[MRImageProvider init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->mShowDuration = -1.0;
    v2->mIsCleanedUp = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v3->mPreloadOperationLock = v4;
    -[NSLock setName:](v4, "setName:", @"MRImageProvider.preloadOperationLock");
  }

  return v3;
}

- (void)dealloc
{
  self->mPreloadOperationLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRImageProvider;
  -[MRImageProvider dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (!self->mIsCleanedUp)
  {
    self->mIsCleanedUp = 1;
    self->_effectLayer = 0LL;
    -[MRImageProvider unload](self, "unload");
    -[MRImageProvider setAssetPath:](self, "setAssetPath:", 0LL);
    self->mOriginalImageSize = CGSizeZero;

    self->mEffectAttributes = 0LL;
    self->mImageSizeScript = 0LL;
  }

  objc_sync_exit(self);
}

- (void)setDefaultSize:(CGSize)a3
{
  if (a3.width != self->mDefaultSize.width || a3.height != self->mDefaultSize.height)
  {
    self->mDefaultSize = a3;
    -[MRImageProvider _unloadIfNotUpdatingLive](self, "_unloadIfNotUpdatingLive");
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
    -[MRImageProvider unload](self, "unload");
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
    -[MRImageProvider unload](self, "unload");
  }

- (BOOL)wantsPowerOfTwo
{
  return (LOBYTE(self->mFlags) >> 4) & 1;
}

- (void)setWantsPowerOfTwo:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xEF;
    if (a3) {
      char v5 = 16;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    -[MRImageProvider unload](self, "unload");
  }

- (void)setOriginalImageSize:(CGSize)a3
{
  if (a3.width != self->mOriginalImageSize.width || a3.height != self->mOriginalImageSize.height)
  {
    self->mOriginalImageSize = a3;
    BYTE2(self->mFlags) |= 2u;
  }

- (double)imageAspectRatio
{
  double height = self->mOriginalImageSize.height;
  double result = 1.0;
  if (height > 0.0) {
    return self->mOriginalImageSize.width / height;
  }
  return result;
}

- (void)setImageSizeScript:(id)a3
{
  if (([a3 isEqualToString:self->mImageSizeScript] & 1) == 0)
  {

    self->mImageSizeScript = (NSString *)a3;
    self->mRequestedSize = CGSizeZero;
  }

- (void)setEffectAttributes:(id)a3
{
  mEffectAttributes = self->mEffectAttributes;
  if (mEffectAttributes != a3)
  {

    self->mEffectAttributes = (NSDictionary *)a3;
    self->mRequestedSize = CGSizeZero;
  }

- (CGSize)imageSizeForAspectRatio:(float)a3
{
  double width = self->mDefaultSize.width;
  double height = self->mDefaultSize.height;
  if (self->mImageSizeScript)
  {
    double v6 = a3;
    v7 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", width),  @"layerWidth",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", height),  @"layerHeight",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3),  @"imageAspectRatio",  0LL);
    v8 = +[MRUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MRUtilities,  "executeScript:withHeader:andAttributes:",  self->mImageSizeScript,  v7,  self->mEffectAttributes);

    if (v8)
    {
      CGSize v9 = CGSizeFromString(v8);
      double width = v9.width;
      double height = v9.height;
    }

    else
    {
      double v10 = self->mDefaultSize.width;
      double height = self->mDefaultSize.height;
      double width = height * v6;
      if (height * v6 > v10)
      {
        double width = self->mDefaultSize.width;
        double height = v10 / v6;
      }
    }
  }

  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setAssetPath:(id)a3
{
  if (self->mAssetPath != a3)
  {
    -[MRImageProvider unload](self, "unload");

    self->mAssetPath = (NSString *)[a3 copy];
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
    -[MRImageProvider unload](self, "unload");
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
    BYTE2(self->mFlags) |= 2u;
    objc_sync_exit(self);
  }

  else
  {
    -[MRImageProvider unload](self, "unload");
  }

- (MRLayerEffect)effectLayer
{
  objc_super v3 = self->_effectLayer;
  objc_sync_exit(self);
  return v3;
}

- (void)setEffectLayer:(id)a3
{
  self->_effectLayer = (MRLayerEffect *)a3;
  objc_sync_exit(self);
}

- (BOOL)isLoadedForTime:(double)a3
{
  return self->mFlags & 1;
}

- (BOOL)isLoaded
{
  return self->mFlags & 1;
}

- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6
{
  if ((self->mFlags & 3) == 0)
  {
    LOBYTE(self->mFlags) |= 2u;
    if (self->mAssetPath)
    {
      BOOL v7 = a6;
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
      -[MRAssetPlayerOptions setResolutionIfEmbeddedAsset:]( v10,  "setResolutionIfEmbeddedAsset:",  self->mOriginalImageSize.width,  self->mOriginalImageSize.height);
      unsigned int v12 = [a5 thumbnailPolicy];
      unsigned int v13 = !v7;
      if (v12 != 1) {
        unsigned int v13 = 0;
      }
      if (v12) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 1LL;
      }
      -[MRAssetPlayerOptions setThumbnailIsOK:](v10, "setThumbnailIsOK:", v14);
      self->mSlidePlayer = (MRAssetPlayer *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserPlayerForAssetAtPath:size:andOptions:",  self->mAssetPath,  v10,  self->mImageSize.width,  self->mImageSize.height);

      -[MRAssetPlayer setDelegate:](self->mSlidePlayer, "setDelegate:", self);
      objc_sync_enter(self);
      if (!self->mIsCleanedUp)
      {
        -[NSLock lock](self->mPreloadOperationLock, "lock");
        if (!self->mPreloadOperation)
        {
          id v15 = [a5 preloadQueue];
          if (v15)
          {
            id v16 = [a5 copyForPreloading];
            v17 = -[NSMutableDictionary initWithObjectsAndKeys:]( [NSMutableDictionary alloc],  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mShowTime),  @"time",  a4,  @"context",  [a4 imageManager],  @"imageManager",  v16,  @"renderArguments",  self->mSlidePlayer,  @"slidePlayer",  0);
            v18 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  self,  "loadWithArguments:",  v17);
            self->mPreloadOperation = v18;
            if (v7) {
              uint64_t v19 = 33LL;
            }
            else {
              uint64_t v19 = 9LL;
            }
            -[NSInvocationOperation setQualityOfService:](v18, "setQualityOfService:", v19);
            -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  +[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", self->mPreloadOperation),  @"preloadOperationPointer");
            [v15 addOperation:self->mPreloadOperation];
          }
        }

        if (v7) {
          uint64_t v20 = 8LL;
        }
        else {
          uint64_t v20 = 0LL;
        }
        -[NSInvocationOperation setQueuePriority:](self->mPreloadOperation, "setQueuePriority:", v20);
        -[NSLock unlock](self->mPreloadOperationLock, "unlock");
      }

      objc_sync_exit(self);
    }
  }

- (void)loadWithArguments:(id)a3
{
  char v5 = (NSInvocationOperation *)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"preloadOperationPointer"),  "pointerValue");
  if (self->mPreloadOperation == v5 && (self->mFlags & 1) == 0)
  {
    double v6 = v5;
    id v7 = [a3 objectForKey:@"renderArguments"];
    objc_msgSend(objc_msgSend(v7, "renderer"), "imagePreloadingBegan");
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slidePlayer"), "loadForTime:", 0.0);
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
    -[MRImageProvider cancelLoading](self, "cancelLoading");
    LOBYTE(self->mFlags) &= ~1u;
    mOriginalImage = self->mOriginalImage;
    if (mOriginalImage)
    {
      -[MRImage releaseByUser](mOriginalImage, "releaseByUser");
      self->mOriginalImage = 0LL;
    }

    mSlidePlayer = self->mSlidePlayer;
    if (mSlidePlayer)
    {
      -[MRAssetPlayer releaseByUser](mSlidePlayer, "releaseByUser");
      self->mSlidePlayer = 0LL;
    }

    CGSize v5 = CGSizeZero;
    self->mImageSize = CGSizeZero;
    self->mLastImageSize = v5;
    self->mRequestedSize = v5;
    BYTE2(self->mFlags) |= 2u;
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
  return 1;
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
    CGFloat v9 = self->mOriginalImageSize.height;
    double v10 = 1.0;
    if (v9 > 0.0) {
      double v10 = self->mOriginalImageSize.width / v9;
    }
    *(float *)&CGFloat v9 = v10;
    -[MRImageProvider imageSizeForAspectRatio:](self, "imageSizeForAspectRatio:", a3, v9);
    self->mRequestedSize.double width = v11;
    self->mRequestedSize.double height = v12;
    if (v11 == 0.0)
    {
      p_mRequestedSize->double width = v10 * v12;
    }

    else if (v12 == 0.0)
    {
      self->mRequestedSize.double height = v11 / v10;
    }

    BYTE2(self->mFlags) |= 2u;
  }

  BOOL v13 = self->mImageSize.width == CGSizeZero.width && self->mImageSize.height == height;
  if (v13
    || (self->mFlags & 0x1000) == 0 && (objc_msgSend(a4, "freezesSizeOfImageRequests", a3) & 1) == 0)
  {
    self->mImageSize = *p_mRequestedSize;
    BYTE2(self->mFlags) &= ~2u;
  }

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mSlidePlayer || self->mAssetPath)
  {
    double height = CGSizeZero.height;
    if (self->mOriginalImageSize.width == CGSizeZero.width && self->mOriginalImageSize.height == height)
    {
      objc_msgSend(objc_msgSend(a4, "assetManager"), "resolutionForAssetAtPath:", self->mAssetPath);
      self->mOriginalImageSize.double width = v11;
      self->mOriginalImageSize.double height = v12;
    }

    char mFlags = self->mFlags;
    double mShowTime = self->mShowTime;
    double mShowDuration = self->mShowDuration;
    double v16 = mShowTime + -10.0;
    if (mShowDuration < 0.0) {
      double mShowDuration = 1.0e10;
    }
    double width = mShowTime + mShowDuration;
    if (v16 <= a3 && width > a3)
    {
      if ((self->mFlags & 0x20000) != 0) {
        -[MRImageProvider _computeImageSizeInContext:withArguments:]( self,  "_computeImageSizeInContext:withArguments:",  a4,  a5);
      }
      mSlidePlayer = self->mSlidePlayer;
      if (mSlidePlayer)
      {
        double width = self->mLastImageSize.width;
        double v22 = self->mLastImageSize.height;
        if (width != CGSizeZero.width || v22 != height)
        {
          if (width != self->mImageSize.width || (double width = self->mImageSize.height, v22 != width))
          {
            -[MRAssetPlayer releaseByUser](mSlidePlayer, "releaseByUser", v22);
            self->mSlidePlayer = 0LL;
          }
        }
      }

      if ((mFlags & 1) == 0)
      {
        double v24 = self->mShowTime;
        if ((mFlags & 2) != 0)
        {
          if (v24 <= a3)
          {
            -[NSLock lock](self->mPreloadOperationLock, "lock");
            -[NSInvocationOperation setQueuePriority:](self->mPreloadOperation, "setQueuePriority:", 8LL);
            -[NSLock unlock](self->mPreloadOperationLock, "unlock");
          }
        }

        else
        {
          -[MRImageProvider loadForTime:inContext:withArguments:now:]( self,  "loadForTime:inContext:withArguments:now:",  a4,  a5,  v24 <= a3,  a3,  width);
        }
      }

      if (self->mShowTime <= a3)
      {
        unsigned int v26 = BYTE2(self->mFlags);
        BOOL v25 = (v26 >> 4) & 1;
        BYTE2(self->mFlags) = v26 & 0xEF;
        return v25;
      }
    }

    else if ((self->mFlags & 3) != 0)
    {
      double v19 = width + 2.0;
      if (v16 > a3 || v19 <= a3) {
        -[MRImageProvider unload](self, "unload");
      }
    }
  }

  LOBYTE(v25) = 0;
  return v25;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mSlidePlayer = self->mSlidePlayer;
  if (!mSlidePlayer)
  {
    LOBYTE(self->mFlags) |= 1u;
    return 0LL;
  }

  double v7 = a3 - self->mShowTime;
  if (v7 < 0.0
    || ((mShowDuration = self->mShowDuration, mShowDuration >= 0.0) ? (BOOL v9 = v7 < mShowDuration) : (BOOL v9 = 1), !v9))
  {
    NSLog(@"Slide provider %@ called outside of its time window", a2, a4, a5, self);
    return 0LL;
  }

  objc_msgSend(a5, "displayLinkTimestamp", a4);
  CGFloat v11 = -[MRAssetPlayer retainedByUserImageAtTime:displayLinkTimestamp:]( mSlidePlayer,  "retainedByUserImageAtTime:displayLinkTimestamp:",  v7,  v10);
  if (v11)
  {
    CGFloat v12 = v11;
    mOriginalImage = self->mOriginalImage;
    if (v12 == mOriginalImage)
    {
      -[MRImage releaseByUser](v12, "releaseByUser");
    }

    else
    {
      if (mOriginalImage) {
        -[MRImage releaseByUser](mOriginalImage, "releaseByUser");
      }
      self->mOriginalImage = v12;
    }

    self->mLastImageSize = self->mImageSize;
  }

  return -[MRImage retainByUser](self->mOriginalImage, "retainByUser");
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v6 = -[MRImageProvider retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  double v7 = 2.0 / (self->mDefaultSize.width / self->mDefaultSize.height);
  v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v7 * -0.5, 2.0, v7),  @"rectangle",  0);
  BOOL v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (void)imageIsAvailableFromAssetPlayer:(id)a3
{
  BYTE2(self->mFlags) |= 0x10u;
  objc_super v3 = -[MRImageProvider effectLayer](self, "effectLayer", a3);
  if (v3)
  {
    char v4 = v3;
    if (-[MRLayer isActivated](v3, "isActivated")) {
      -[MRLayerEffect _requestRendering](v4, "_requestRendering");
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

- (NSString)imageSizeScript
{
  return self->mImageSizeScript;
}

- (NSDictionary)effectAttributes
{
  return self->mEffectAttributes;
}

- (double)showTime
{
  return self->mShowTime;
}

- (void)setShowTime:(double)a3
{
  self->double mShowTime = a3;
}

- (double)showDuration
{
  return self->mShowDuration;
}

- (void)setShowDuration:(double)a3
{
  self->double mShowDuration = a3;
}

- (CGSize)requestedSize
{
  double width = self->mRequestedSize.width;
  double height = self->mRequestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)justHoldIt
{
  return self->mJustHoldIt;
}

- (void)setJustHoldIt:(BOOL)a3
{
  self->mJustHoldIt = a3;
}

- (NSString)assetPath
{
  return self->mAssetPath;
}

- (CGSize)originalImageSize
{
  double width = self->mOriginalImageSize.width;
  double height = self->mOriginalImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end