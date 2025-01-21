@interface BKDisplayAnnotationMinimalStyle
- (void)applyAppearanceToShapeLayer:(id)a3;
- (void)applyAppearanceToTextLayer:(id)a3;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationMinimalStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v9 = a3;
  uint64_t v6 = [CAShapeLayer class];
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
  id v3 = a3;
  [v3 setLineWidth:3.0];
  [v3 bk_setForegroundColorRed:0.3 green:0.3 blue:0.3 alpha:0.9];
  [v3 bk_setBackgroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.2];
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
  [v4 bk_setForegroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.9];
}

@end