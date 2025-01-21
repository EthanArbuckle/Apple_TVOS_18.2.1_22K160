@interface BKDisplayAnnotationTextBackgroundStyle
- (void)applyAppearanceToShapeLayer:(id)a3;
- (void)applyAppearanceToTextLayer:(id)a3;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationTextBackgroundStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v9 = a3;
  CAShapeLayer *v6 = [CAShapeLayer class];
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0) {
    [self applyAppearanceToShapeLayer:v9];
  }
  uint64_t v8 = [CATextLayer class];
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    [self applyAppearanceToTextLayer:v9];
  }
}

- (void)applyAppearanceToShapeLayer:(id)a3
{
}

- (void)applyAppearanceToTextLayer:(id)a3
{
  id v4 = a3;
  CTFontRef v3 = CTFontCreateWithName(@"Helvetica", 0.0, 0LL);
  if (v3) {
    [v4 setFont:v3];
  }
  CFRelease(v3);
  [v4 setFontSize:14.0];
  [v4 bk_setForegroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.8];
  [v4 bk_setBackgroundColorRed:0.2 green:0.2 blue:0.2 alpha:0.8];
}

@end