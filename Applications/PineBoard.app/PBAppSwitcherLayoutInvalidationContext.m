@interface PBAppSwitcherLayoutInvalidationContext
- (NSIndexPath)swipeUpItem;
- (double)swipeUpProgress;
- (void)setSwipeUpItem:(id)a3;
- (void)setSwipeUpProgress:(double)a3;
@end

@implementation PBAppSwitcherLayoutInvalidationContext

- (double)swipeUpProgress
{
  return self->_swipeUpProgress;
}

- (void)setSwipeUpProgress:(double)a3
{
  self->_swipeUpProgress = a3;
}

- (NSIndexPath)swipeUpItem
{
  return self->_swipeUpItem;
}

- (void)setSwipeUpItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end