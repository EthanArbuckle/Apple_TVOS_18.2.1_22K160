@interface CAAnimation
- (double)pb_durationIncludingDelay;
@end

@implementation CAAnimation

- (double)pb_durationIncludingDelay
{
  double v4 = v3;
  -[CAAnimation beginTime](self, "beginTime");
  if (v5 <= 0.0) {
    double v5 = -0.0;
  }
  return v4 + v5;
}

@end