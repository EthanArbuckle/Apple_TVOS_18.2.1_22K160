@interface _TVSSMenuModeControllerTransitionContext
- (NSNumber)interactivePresentationReason;
- (TVSSMenuModeBannerContext)previousBannerContext;
- (unint64_t)previousMenuMode;
- (void)setInteractivePresentationReason:(id)a3;
- (void)setPreviousBannerContext:(id)a3;
- (void)setPreviousMenuMode:(unint64_t)a3;
@end

@implementation _TVSSMenuModeControllerTransitionContext

- (NSNumber)interactivePresentationReason
{
  return self->_interactivePresentationReason;
}

- (void)setInteractivePresentationReason:(id)a3
{
}

- (unint64_t)previousMenuMode
{
  return self->_previousMenuMode;
}

- (void)setPreviousMenuMode:(unint64_t)a3
{
  self->_previousMenuMode = a3;
}

- (TVSSMenuModeBannerContext)previousBannerContext
{
  return self->_previousBannerContext;
}

- (void)setPreviousBannerContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end