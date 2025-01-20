@interface _PBPIPSwapContext
- (BSInvalidatable)avoidancePausedAssertion;
- (_PBPIPPresentationRequest)startingRequest;
- (_PBPIPPresentationRequest)stoppingRequest;
- (_PBPIPSwapAnimation)swapAnimation;
- (void)dealloc;
- (void)setAvoidancePausedAssertion:(id)a3;
- (void)setStartingRequest:(id)a3;
- (void)setStoppingRequest:(id)a3;
- (void)setSwapAnimation:(id)a3;
@end

@implementation _PBPIPSwapContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PBPIPSwapContext;
  -[_PBPIPSwapContext dealloc](&v3, "dealloc");
}

- (_PBPIPPresentationRequest)startingRequest
{
  return self->_startingRequest;
}

- (void)setStartingRequest:(id)a3
{
}

- (_PBPIPPresentationRequest)stoppingRequest
{
  return self->_stoppingRequest;
}

- (void)setStoppingRequest:(id)a3
{
}

- (_PBPIPSwapAnimation)swapAnimation
{
  return self->_swapAnimation;
}

- (void)setSwapAnimation:(id)a3
{
}

- (BSInvalidatable)avoidancePausedAssertion
{
  return self->_avoidancePausedAssertion;
}

- (void)setAvoidancePausedAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end