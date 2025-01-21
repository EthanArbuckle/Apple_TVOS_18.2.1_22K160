@interface CALayer
- (void)bk_setBackgroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (void)bk_setForegroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
@end

@implementation CALayer

- (void)bk_setForegroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorRef v7 = sub_10001E980(a3, a4, a5, a6);
  if (v7)
  {
    CGColorRef v9 = v7;
    CATextLayer *v10 = [CATextLayer class];
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
    {
      [self setForegroundColor:v9];
    }

    else
    {
      uint64_t v12 = [CAShapeLayer class];
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0) {
        [self setStrokeColor:v9];
      }
    }

    CFRelease(v9);
  }

- (void)bk_setBackgroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorRef v7 = sub_10001E980(a3, a4, a5, a6);
  if (v7)
  {
    CGColorRef v9 = v7;
    uint64_t v10 = [CAShapeLayer class];
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0) {
      [self setFillColor:v9];
    }
    else {
      [self setBackgroundColor:v9];
    }
    CFRelease(v9);
  }

@end