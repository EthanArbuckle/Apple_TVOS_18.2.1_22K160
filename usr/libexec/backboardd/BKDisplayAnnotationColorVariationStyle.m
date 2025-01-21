@interface BKDisplayAnnotationColorVariationStyle
+ (id)colorVariationWithIndex:(int64_t)a3;
- (BKDisplayAnnotationColorVariationStyle)initWithRed:(double)a3 green:(double)a4 blue:(double)a5;
- (void)applyAppearanceToShapeLayer:(id)a3;
- (void)applyAppearanceToTextLayer:(id)a3;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationColorVariationStyle

- (BKDisplayAnnotationColorVariationStyle)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  v9.receiver = self;
  v9.super_class = [BKDisplayAnnotationColorVariationStyle class];
  result = [BKDisplayAnnotationColorVariationStyle init];
  if (result)
  {
    result->_r = a3;
    result->_g = a4;
    result->_b = a5;
  }

  return result;
}

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
  id v4 = a3;
  [v4 setLineWidth:3.0];
  [v4 bk_setForegroundColorRed:self->_r green:self->_g blue:self->_b alpha:0.9];
  [v4 bk_setBackgroundColorRed:self->_r green:self->_g blue:self->_b alpha:0.2];
}

- (void)applyAppearanceToTextLayer:(id)a3
{
  id v5 = a3;
  CTFontRef v4 = CTFontCreateWithName(@"Helvetica", 0.0, 0LL);
  if (v4) {
    [v5 setFont:v4];
  }
  CFRelease(v4);
  [v5 setFontSize:14.0];
  [v5 bk_setForegroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.9];
  [v5 bk_setBackgroundColorRed:fmin(self->_r, 0.5) green:fmin(self->_g, 0.5) blue:fmin(self->_b, 0.5) alpha:0.8];
}

+ (id)colorVariationWithIndex:(int64_t)a3
{
  v3 = (double *)((char *)&unk_10008C340 + 24 * (a3 % 6));
  BKDisplayAnnotationColorVariationStyle *v1 = [BKDisplayAnnotationColorVariationStyle initWithRed:v3[1] green:v3[2] blue:v3[3]];
}

@end