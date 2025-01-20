@interface MRTransitionChanges
- (MCTransitionTrigger)transition;
- (MRGesturePanZoomRotation)pzr;
- (MRLayer)currentSublayer;
- (MRLayer)nextSublayer;
- (void)dealloc;
- (void)setCurrentSublayer:(id)a3;
- (void)setNextSublayer:(id)a3;
- (void)setPzr:(id)a3;
- (void)setTransition:(id)a3;
@end

@implementation MRTransitionChanges

- (void)dealloc
{
  self->_currentSublayer = 0LL;
  self->_nextSublayer = 0LL;

  self->_transition = 0LL;
  self->_pzr = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionChanges;
  -[MRTransitionChanges dealloc](&v3, "dealloc");
}

- (MRLayer)currentSublayer
{
  return (MRLayer *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCurrentSublayer:(id)a3
{
}

- (MRLayer)nextSublayer
{
  return (MRLayer *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNextSublayer:(id)a3
{
}

- (MCTransitionTrigger)transition
{
  return (MCTransitionTrigger *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTransition:(id)a3
{
}

- (MRGesturePanZoomRotation)pzr
{
  return (MRGesturePanZoomRotation *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPzr:(id)a3
{
}

@end