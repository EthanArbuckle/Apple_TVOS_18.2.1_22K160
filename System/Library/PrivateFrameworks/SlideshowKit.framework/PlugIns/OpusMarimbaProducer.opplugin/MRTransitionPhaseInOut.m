@interface MRTransitionPhaseInOut
- (BOOL)controlsLayersTime;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isSplit;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionPhaseInOut

- (BOOL)isNative3D
{
  unsigned int v3 = -[MRLayer isActivated](self->super.mSourceLayer, "isActivated");
  uint64_t v4 = 4LL;
  if (v3) {
    uint64_t v4 = 3LL;
  }
  return -[objc_class isNative3D]((&self->super.super.isa)[v4], "isNative3D");
}

- (BOOL)isOpaque
{
  unsigned int v3 = -[MRLayer isActivated](self->super.mSourceLayer, "isActivated");
  uint64_t v4 = 4LL;
  if (v3) {
    uint64_t v4 = 3LL;
  }
  return -[objc_class isOpaque]((&self->super.super.isa)[v4], "isOpaque");
}

- (BOOL)isAlphaFriendly
{
  unsigned int v3 = -[MRLayer isActivated](self->super.mSourceLayer, "isActivated");
  uint64_t v4 = 4LL;
  if (v3) {
    uint64_t v4 = 3LL;
  }
  return -[objc_class isAlphaFriendly]((&self->super.super.isa)[v4], "isAlphaFriendly");
}

- (BOOL)isInfinite
{
  unsigned int v3 = -[MRLayer isActivated](self->super.mSourceLayer, "isActivated");
  uint64_t v4 = 4LL;
  if (v3) {
    uint64_t v4 = 3LL;
  }
  return -[objc_class isInfinite]((&self->super.super.isa)[v4], "isInfinite");
}

- (BOOL)isSplit
{
  return 1;
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super._progress = a3;
  -[MRLayerClock phaseOutDuration](-[MRLayer clock](self->super.mSourceLayer, "clock"), "phaseOutDuration");
  double v10 = v9;
  -[MRLayerClock phaseInDuration](-[MRLayer clock](self->super.mTargetLayer, "clock"), "phaseInDuration");
  double v12 = v10 + v11;
  double v13 = v10 / (v10 + v11);
  -[MRLayer duration](self->super.mSourceLayer, "duration");
  double v15 = v10 - v12 * a3;
  if (v15 < 0.001) {
    double v15 = 0.001;
  }
  -[MRLayerClock setContainerTime:](-[MRLayer clock](self->super.mSourceLayer, "clock"), "setContainerTime:", v14 - v15);
  -[MRLayerClock setContainerTime:]( -[MRLayer clock](self->super.mTargetLayer, "clock"),  "setContainerTime:",  -(v10 - v12 * a3));
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  unsigned __int8 v17 = -[MRLayer prerenderForTime:inContext:withArguments:]( mSourceLayer,  "prerenderForTime:inContext:withArguments:",  a4,  a5);
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  BOOL result = -[MRLayer prerenderForTime:inContext:withArguments:]( mTargetLayer,  "prerenderForTime:inContext:withArguments:",  a4,  a5);
  if (v13 > a3) {
    return v17;
  }
  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v10 = v9;
  -[MRLayerClock phaseInDuration](-[MRLayer clock](self->super.mTargetLayer, "clock"), "phaseInDuration");
  double v12 = v10 + v11;
  -[MRLayerClock phaseOutDuration](-[MRLayer clock](self->super.mSourceLayer, "clock"), "phaseOutDuration");
  uint64_t v14 = 4LL;
  if (v13 / v12 > a3) {
    uint64_t v14 = 3LL;
  }
  Class v15 = (&self->super.super.isa)[v14];
  objc_msgSend(-[objc_class clock](v15, "clock"), "externalTime");
  -[objc_class renderAtTime:inContext:withArguments:](v15, "renderAtTime:inContext:withArguments:", a4, a5);
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v10 = v9;
  -[MRLayerClock phaseInDuration](-[MRLayer clock](self->super.mTargetLayer, "clock"), "phaseInDuration");
  double v12 = v10 + v11;
  -[MRLayerClock phaseOutDuration](-[MRLayer clock](self->super.mSourceLayer, "clock"), "phaseOutDuration");
  uint64_t v14 = 4LL;
  if (v13 / v12 > a3) {
    uint64_t v14 = 3LL;
  }
  Class v15 = (&self->super.super.isa)[v14];
  objc_msgSend(-[objc_class clock](v15, "clock"), "externalTime");
  return -[objc_class retainedByUserRenderedImageAtTime:inContext:withArguments:]( v15,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
}

@end