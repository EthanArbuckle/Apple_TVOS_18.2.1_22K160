@interface CAAnimationDelegateBlockHelper
- (id)animationDidStartBlock;
- (id)animationDidStopBlock;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setAnimationDidStartBlock:(id)a3;
- (void)setAnimationDidStopBlock:(id)a3;
@end

@implementation CAAnimationDelegateBlockHelper

- (void)dealloc
{
  id animationDidStartBlock = self->_animationDidStartBlock;
  self->_id animationDidStartBlock = 0LL;

  id animationDidStopBlock = self->_animationDidStopBlock;
  self->_id animationDidStopBlock = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CAAnimationDelegateBlockHelper;
  -[CAAnimationDelegateBlockHelper dealloc](&v5, sel_dealloc);
}

- (void)animationDidStart:(id)a3
{
  id animationDidStartBlock = (void (**)(void))self->_animationDidStartBlock;
  if (animationDidStartBlock) {
    animationDidStartBlock[2]();
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id animationDidStopBlock = (void (**)(id, BOOL))self->_animationDidStopBlock;
  if (animationDidStopBlock) {
    animationDidStopBlock[2](animationDidStopBlock, a4);
  }
}

- (id)animationDidStartBlock
{
  return self->_animationDidStartBlock;
}

- (void)setAnimationDidStartBlock:(id)a3
{
}

- (id)animationDidStopBlock
{
  return self->_animationDidStopBlock;
}

- (void)setAnimationDidStopBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end