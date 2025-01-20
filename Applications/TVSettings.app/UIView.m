@interface UIView
- (double)primaryHighlightAlphaForHighlightProgress:(double)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation UIView

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
}

- (double)primaryHighlightAlphaForHighlightProgress:(double)a3
{
  if (a3 >= 0.5) {
    return (a3 + -0.5 + a3 + -0.5) * 0.3 + 0.7;
  }
  else {
    return (a3 + a3) * 0.3;
  }
}

@end