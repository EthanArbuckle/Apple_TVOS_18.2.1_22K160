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
  v9.super_class = (Class)&OBJC_CLASS___BKDisplayAnnotationColorVariationStyle;
  result = -[BKDisplayAnnotationColorVariationStyle init](&v9, "init");
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
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CAShapeLayer, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0) {
    -[BKDisplayAnnotationColorVariationStyle applyAppearanceToShapeLayer:](self, "applyAppearanceToShapeLayer:", v9);
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CATextLayer, v7);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    -[BKDisplayAnnotationColorVariationStyle applyAppearanceToTextLayer:](self, "applyAppearanceToTextLayer:", v9);
  }
}

- (void)applyAppearanceToShapeLayer:(id)a3
{
  id v4 = a3;
  [v4 setLineWidth:3.0];
  objc_msgSend(v4, "bk_setForegroundColorRed:green:blue:alpha:", self->_r, self->_g, self->_b, 0.9);
  objc_msgSend(v4, "bk_setBackgroundColorRed:green:blue:alpha:", self->_r, self->_g, self->_b, 0.2);
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
  objc_msgSend(v5, "bk_setForegroundColorRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.9);
  objc_msgSend( v5,  "bk_setBackgroundColorRed:green:blue:alpha:",  fmin(self->_r, 0.5),  fmin(self->_g, 0.5),  fmin(self->_b, 0.5),  0.8);
}

+ (id)colorVariationWithIndex:(int64_t)a3
{
  v3 = (double *)((char *)&unk_10008C340 + 24 * (a3 % 6));
  return  -[BKDisplayAnnotationColorVariationStyle initWithRed:green:blue:]( objc_alloc(&OBJC_CLASS___BKDisplayAnnotationColorVariationStyle),  "initWithRed:green:blue:",  *v3,  v3[1],  v3[2]);
}

@end