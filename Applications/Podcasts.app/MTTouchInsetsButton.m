@interface MTTouchInsetsButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)touchInsets;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation MTTouchInsetsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[MTTouchInsetsButton bounds](self, "bounds", a4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[MTTouchInsetsButton touchInsets](self, "touchInsets");
  CGFloat v16 = v10 + v15;
  CGFloat v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.CGFloat x = v8 + v17;
  v23.origin.CGFloat y = v16;
  v23.size.width = v19;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  return CGRectContainsPoint(v23, v22);
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

@end