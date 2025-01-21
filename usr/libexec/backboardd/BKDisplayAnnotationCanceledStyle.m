@interface BKDisplayAnnotationCanceledStyle
- (void)applyAppearanceToShapeLayer:(id)a3;
- (void)applyAppearanceToTextLayer:(id)a3;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationCanceledStyle

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
  id v3 = a3;
  [v3 bk_setBackgroundColorRed:1.0 green:0.3 blue:0.3 alpha:0.8];
  [v3 bk_setForegroundColorRed:0.0 green:0.0 blue:0.0 alpha:0.8];
  [v3 setLineDashPattern:off_1000C05A8];
  [v3 setLineWidth:20.0];
}

- (void)applyAppearanceToTextLayer:(id)a3
{
  id v3 = a3;
  [v3 bk_setForegroundColorRed:0.9 green:1.0 blue:1.0 alpha:0.8];
  [v3 bk_setBackgroundColorRed:1.0 green:0.1 blue:0.1 alpha:0.8];
  id v4 = [CALayer layer];
  [v3 bounds];
  [v4 setFrame:CGRectMake(v5.origin.x, CGRectGetMidY(v5), v5.size.width, 2.0)];
  [v4 bk_setBackgroundColorRed:0.9 green:1.0 blue:1.0 alpha:0.8];
  [v3 addSublayer:v4];

  [v4 setNeedsDisplay];
}

@end