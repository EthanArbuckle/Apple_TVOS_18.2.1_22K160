@interface MRTransitionSourceUnder
- (BOOL)controlsLayersTime;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionSourceUnder

- (BOOL)controlsLayersTime
{
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock", a3), "externalTime");
  -[MRLayer renderAtTime:inContext:withArguments:](mTargetLayer, "renderAtTime:inContext:withArguments:", a4, a5);
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  -[MRLayer renderAtTime:inContext:withArguments:](mSourceLayer, "renderAtTime:inContext:withArguments:", a4, a5);
}

@end