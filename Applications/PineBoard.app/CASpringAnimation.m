@interface CASpringAnimation
- (double)pb_durationIncludingDelay;
@end

@implementation CASpringAnimation

- (double)pb_durationIncludingDelay
{
  double v4 = v3;
  -[CASpringAnimation beginTime](self, "beginTime");
  if (v5 <= 0.0) {
    double v5 = -0.0;
  }
  return v4 + v5;
}

@end