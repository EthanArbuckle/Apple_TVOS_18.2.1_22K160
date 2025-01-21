@interface BKDisplayAnnotationPointerStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationPointerStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CAShapeLayer *v8 = [CAShapeLayer class];
  id v9 = v5;
  id v24 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v10 = v24;
    }
    else {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  id v11 = v10;

  uint64_t v13 = [BKDisplayAnnotationShapeContent class];
  id v14 = v6;
  v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      v16 = v15;
    }
    else {
      v16 = 0LL;
    }
  }

  else
  {
    v16 = 0LL;
  }

  id v17 = v16;

  [v17 shapeSize];
  double v19 = v18;
  double v21 = v20;

  double v22 = v21 * 0.414213562 / 1.41421356;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0LL, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0LL, 0.0, v21 + 0.0);
  CGPathAddLineToPoint(Mutable, 0LL, v22 + 0.0, v21 + 0.0 - v22);
  CGPathAddLineToPoint(Mutable, 0LL, v21 + 0.0 - v22, v21 + 0.0 - v22);
  CGPathAddLineToPoint(Mutable, 0LL, 0.0, 0.0);
  CGPathCloseSubpath(Mutable);
  [v11 setBounds:CGRectMake(0.0, 0.0, v19, v21)];
  [v11 setPath:Mutable];
  [v24 bk_setBackgroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.649999976];
  [v24 bk_setForegroundColorRed:0.0 green:0.0 blue:0.0 alpha:0.5];

  CFRelease(Mutable);
}

@end