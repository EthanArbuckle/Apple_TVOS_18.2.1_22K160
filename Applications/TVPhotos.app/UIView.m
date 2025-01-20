@interface UIView
- (double)primaryHighlightAlphaForHighlightProgress:(double)a3;
@end

@implementation UIView

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