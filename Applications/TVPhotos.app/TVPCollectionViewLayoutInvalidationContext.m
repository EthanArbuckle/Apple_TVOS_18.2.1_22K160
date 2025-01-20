@interface TVPCollectionViewLayoutInvalidationContext
- (BOOL)isFocusEnteringCollectionView;
- (BOOL)isFocusLeavingCollectionView;
- (CGRect)focusedItemFrame;
- (UIEdgeInsets)focusedEdgeInsets;
- (double)focusingAnimationDuration;
- (double)unfocusingAnimationDuration;
- (unint64_t)focusAnimationOptions;
- (unint64_t)focusHeading;
- (void)setFocusAnimationOptions:(unint64_t)a3;
- (void)setFocusEnteringCollectionView:(BOOL)a3;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setFocusLeavingCollectionView:(BOOL)a3;
- (void)setFocusedEdgeInsets:(UIEdgeInsets)a3;
- (void)setFocusedItemFrame:(CGRect)a3;
- (void)setFocusingAnimationDuration:(double)a3;
- (void)setUnfocusingAnimationDuration:(double)a3;
@end

@implementation TVPCollectionViewLayoutInvalidationContext

- (unint64_t)focusAnimationOptions
{
  return self->_focusAnimationOptions;
}

- (void)setFocusAnimationOptions:(unint64_t)a3
{
  self->_focusAnimationOptions = a3;
}

- (double)focusingAnimationDuration
{
  return self->_focusingAnimationDuration;
}

- (void)setFocusingAnimationDuration:(double)a3
{
  self->_focusingAnimationDuration = a3;
}

- (double)unfocusingAnimationDuration
{
  return self->_unfocusingAnimationDuration;
}

- (void)setUnfocusingAnimationDuration:(double)a3
{
  self->_unfocusingAnimationDuration = a3;
}

- (CGRect)focusedItemFrame
{
  double x = self->_focusedItemFrame.origin.x;
  double y = self->_focusedItemFrame.origin.y;
  double width = self->_focusedItemFrame.size.width;
  double height = self->_focusedItemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusedItemFrame:(CGRect)a3
{
  self->_focusedItemFrame = a3;
}

- (UIEdgeInsets)focusedEdgeInsets
{
  double top = self->_focusedEdgeInsets.top;
  double left = self->_focusedEdgeInsets.left;
  double bottom = self->_focusedEdgeInsets.bottom;
  double right = self->_focusedEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFocusedEdgeInsets:(UIEdgeInsets)a3
{
  self->_focusedEdgeInsets = a3;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)isFocusEnteringCollectionView
{
  return self->_isFocusEnteringCollectionView;
}

- (void)setFocusEnteringCollectionView:(BOOL)a3
{
  self->_isFocusEnteringCollectionView = a3;
}

- (BOOL)isFocusLeavingCollectionView
{
  return self->_isFocusLeavingCollectionView;
}

- (void)setFocusLeavingCollectionView:(BOOL)a3
{
  self->_isFocusLeavingCollectionView = a3;
}

@end