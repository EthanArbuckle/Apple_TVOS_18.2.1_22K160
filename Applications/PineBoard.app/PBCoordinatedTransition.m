@interface PBCoordinatedTransition
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBOverlayTransitionCoordinator)coordinatorOverride;
- (unint64_t)coordinatedTransitionChildSchedulingPolicy;
- (void)_setCoordinatorOverride:(id)a3;
- (void)_willBegin;
- (void)setCoordinatedTransitionToken:(id)a3;
@end

@implementation PBCoordinatedTransition

- (void)_willBegin
{
  coordinatorOverride = self->_coordinatorOverride;
  if (coordinatorOverride) {
    v4 = coordinatorOverride;
  }
  else {
    v4 = (PBOverlayTransitionCoordinator *)objc_claimAutoreleasedReturnValue( +[PBOverlayTransitionCoordinator sharedInstance]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "sharedInstance"));
  }
  v5 = v4;
  -[PBOverlayTransitionCoordinator registerTransition:](v4, "registerTransition:", self);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBCoordinatedTransition;
  -[PBCoordinatedTransition _willBegin](&v6, "_willBegin");
}

- (unint64_t)coordinatedTransitionChildSchedulingPolicy
{
  return 0LL;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (void)setCoordinatedTransitionToken:(id)a3
{
}

- (PBOverlayTransitionCoordinator)coordinatorOverride
{
  return self->_coordinatorOverride;
}

- (void)_setCoordinatorOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end