@interface BKDisplayAnnotationCrosshatchedBackgroundStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationCrosshatchedBackgroundStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5 = a3;
  [v5 bk_setBackgroundColorRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  *(_OWORD *)&callbacks.version = unk_1000B6070;
  callbacks.releaseInfo = 0LL;
  CGAffineTransformMakeRotation(v13, 1.0);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 16.0;
  v16.size.height = 16.0;
  CGPatternCallbacks callbacks = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  Pattern = CGColorSpaceCreatePattern(0LL);
  if (Pattern)
  {
    v8 = Pattern;
    CGFloat components = 1.0;
    CGColorRef v9 = CGColorCreateWithPattern(Pattern, v6, components);
    if (v9)
    {
      CGColorRef v11 = v9;
      uint64_t v12 = [CAShapeLayer class];
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0) {
        [v5 setFillColor:v11];
      }
      else {
        [v5 setBackgroundColor:v11];
      }
      CFRelease(v11);
    }

    CFRelease(v8);
  }
}

@end