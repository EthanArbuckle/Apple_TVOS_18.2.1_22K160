@interface BKDisplayAnnotationMinimalStyle
- (void)applyAppearanceToShapeLayer:(id)a3;
- (void)applyAppearanceToTextLayer:(id)a3;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationMinimalStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v9 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CAShapeLayer, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0) {
    -[BKDisplayAnnotationMinimalStyle applyAppearanceToShapeLayer:](self, "applyAppearanceToShapeLayer:", v9);
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CATextLayer, v7);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    -[BKDisplayAnnotationMinimalStyle applyAppearanceToTextLayer:](self, "applyAppearanceToTextLayer:", v9);
  }
}

- (void)applyAppearanceToShapeLayer:(id)a3
{
  id v3 = a3;
  [v3 setLineWidth:3.0];
  objc_msgSend(v3, "bk_setForegroundColorRed:green:blue:alpha:", 0.3, 0.3, 0.3, 0.9);
  objc_msgSend(v3, "bk_setBackgroundColorRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.2);
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
  objc_msgSend(v4, "bk_setForegroundColorRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.9);
}

@end