@interface MRTransition
+ (id)retainedTransitionWithTransitionID:(id)a3 forTransitioner:(id)a4;
- (BOOL)controlsLayersTime;
- (BOOL)dependsOnFingerPosition;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isRetainedByTransitioner;
- (BOOL)isSplit;
- (BOOL)isTransitioning;
- (BOOL)needsSourceLayerImageForPrecomputing;
- (BOOL)needsTargetLayerImageForPrecomputing;
- (BOOL)noContentsMotion;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (CGSize)pixelSize;
- (MRImage)sourceLayerImage;
- (MRImage)targetLayerImage;
- (MRLayer)sourceLayer;
- (MRLayer)targetLayer;
- (MRTransition)initWithTransitionID:(id)a3;
- (NSDictionary)attributes;
- (NSString)presetID;
- (NSString)transitionID;
- (char)direction;
- (double)progress;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)releaseByTransitioner:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)retainByTransitioner:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setDirection:(char)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setPresetID:(id)a3;
- (void)setSourceLayer:(id)a3;
- (void)setSourceLayerImage:(id)a3;
- (void)setTargetLayer:(id)a3;
- (void)setTargetLayerImage:(id)a3;
- (void)unload;
@end

@implementation MRTransition

+ (id)retainedTransitionWithTransitionID:(id)a3 forTransitioner:(id)a4
{
  id v5 = objc_msgSend( +[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"),  "transitionWithTransitionID:",  a3);
  [v5 retainByTransitioner:a4];
  return v5;
}

- (MRTransition)initWithTransitionID:(id)a3
{
  v4 = -[MRTransition init](self, "init");
  if (v4)
  {
    v4->mTransitionID = (NSString *)[a3 copy];
    v4->mPresetID = 0LL;
    v4->mDescription = (NSDictionary *) objc_msgSend( +[MRTransitionManager sharedManager]( MRTransitionManager,  "sharedManager"),  "descriptionForTransitionID:",  v4->mTransitionID);
    *(_OWORD *)&v4->mTransitioner = 0u;
    *(_OWORD *)&v4->mTargetLayer = 0u;
    *(_OWORD *)&v4->mTargetLayerImage = 0u;
    v4->mAttributes = 0LL;
    v4->mFlattenedAttributes = 0LL;
    v4->mNeedsToUpdateAttributes = 0;
    v4->mPixelSize = CGSizeZero;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransition;
  -[MRTransition dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mDescription)
  {

    self->mTransitionID = 0LL;
    self->mPresetID = 0LL;

    self->mDescription = 0LL;
  }

- (void)retainByTransitioner:(id)a3
{
  self->mTransitioner = a3;
}

- (void)releaseByTransitioner:(id)a3
{
  self->mTransitioner = 0LL;

  self->mAttributes = 0LL;
  self->mFlattenedAttributes = 0LL;

  self->mSourceLayer = 0LL;
  self->mTargetLayer = 0LL;
  -[MRTransition unload](self, "unload");
  objc_msgSend( +[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"),  "recycleTransition:",  self);
}

- (BOOL)isRetainedByTransitioner
{
  return self->mTransitioner != 0LL;
}

- (BOOL)noContentsMotion
{
  return objc_msgSend( -[NSDictionary objectForKey:]( self->mDescription,  "objectForKey:",  @"noContentsMotion"),  "BOOLValue");
}

- (BOOL)controlsLayersTime
{
  return 0;
}

- (BOOL)supportsDirectionOverride
{
  return 0;
}

- (BOOL)needsSourceLayerImageForPrecomputing
{
  return objc_msgSend( -[NSDictionary objectForKey:]( self->mDescription,  "objectForKey:",  @"needsSourceLayerImageForPrecomputing"),  "BOOLValue");
}

- (BOOL)needsTargetLayerImageForPrecomputing
{
  return objc_msgSend( -[NSDictionary objectForKey:]( self->mDescription,  "objectForKey:",  @"needsTargetLayerImageForPrecomputing"),  "BOOLValue");
}

- (BOOL)isSplit
{
  return 0;
}

- (void)setAttributes:(id)a3
{
  if (a3)
  {
    if (self->mAttributes == a3) {
      return;
    }
    self->mAttributes = (NSDictionary *)a3;

    self->mPresetID = (NSString *)[a3 objectForKey:@"PresetID"];
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "attributesForTransitionID:andPresetID:",  self->mTransitionID,  self->mPresetID);
    if (v6) {
      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
    }
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", a3);
    self->mFlattenedAttributes = &v5->super;
  }

  else
  {

    self->mFlattenedAttributes = (NSDictionary *) objc_msgSend( +[MPTransitionManager sharedManager]( MPTransitionManager,  "sharedManager"),  "attributesForTransitionID:andPresetID:",  self->mTransitionID,  self->mPresetID);
  }

  self->mNeedsToUpdateAttributes = 1;
}

- (void)setSourceLayerImage:(id)a3
{
  mSourceLayerImage = self->mSourceLayerImage;
  if (mSourceLayerImage) {
    -[MRImage releaseByUser](mSourceLayerImage, "releaseByUser");
  }
  self->mSourceLayerImage = (MRImage *)[a3 retainByUser];
}

- (void)setTargetLayerImage:(id)a3
{
  mTargetLayerImage = self->mTargetLayerImage;
  if (mTargetLayerImage) {
    -[MRImage releaseByUser](mTargetLayerImage, "releaseByUser");
  }
  self->mTargetLayerImage = (MRImage *)[a3 retainByUser];
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (void)unload
{
  self->_progress = 0.0;

  self->mOutputImage = 0LL;
  mSourceLayerImage = self->mSourceLayerImage;
  if (mSourceLayerImage)
  {
    -[MRImage releaseByUser](mSourceLayerImage, "releaseByUser");
    self->mSourceLayerImage = 0LL;
  }

  mTargetLayerImage = self->mTargetLayerImage;
  if (mTargetLayerImage)
  {
    -[MRImage releaseByUser](mTargetLayerImage, "releaseByUser");
    self->mTargetLayerImage = 0LL;
  }

- (BOOL)isNative3D
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isNative3D"),  "BOOLValue");
}

- (BOOL)isOpaque
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isOpaque"),  "BOOLValue");
}

- (BOOL)isAlphaFriendly
{
  if (-[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isAlphaFriendly")) {
    return objc_msgSend( -[NSDictionary objectForKey:]( self->mDescription,  "objectForKey:",  @"isAlphaFriendly"),  "BOOLValue");
  }
  else {
    return 1;
  }
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->_progress = a3;
  mSourceLayer = self->mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  -[MRLayer prerenderForTime:inContext:withArguments:]( mSourceLayer,  "prerenderForTime:inContext:withArguments:",  a4,  a5);
  mTargetLayer = self->mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  -[MRLayer prerenderForTime:inContext:withArguments:]( mTargetLayer,  "prerenderForTime:inContext:withArguments:",  a4,  a5);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0LL;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0LL;
  }
  id v6 = -[MRTransition retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [a4 localAspectRatio];
  v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7),  @"rectangle",  0);
  v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (MRLayer)sourceLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSourceLayer:(id)a3
{
}

- (MRLayer)targetLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTargetLayer:(id)a3
{
}

- (MRImage)sourceLayerImage
{
  return self->mSourceLayerImage;
}

- (MRImage)targetLayerImage
{
  return self->mTargetLayerImage;
}

- (NSString)transitionID
{
  return self->mTransitionID;
}

- (NSString)presetID
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPresetID:(id)a3
{
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

- (void)setPixelSize:(CGSize)a3
{
  self->mPixelSize = a3;
}

- (double)progress
{
  return self->_progress;
}

- (char)direction
{
  return self->_direction;
}

- (void)setDirection:(char)a3
{
  self->_direction = a3;
}

- (BOOL)isTransitioning
{
  return 1;
}

- (BOOL)dependsOnFingerPosition
{
  return 0;
}

- (double)pzrStart:(id)a3
{
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  return 0.0;
}

@end