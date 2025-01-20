@interface BKDisplayAnnotationEllipseStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationEllipseStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CAShapeLayer, v7);
  id v9 = v5;
  id v23 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v10 = v23;
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

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___BKDisplayAnnotationShapeContent, v12);
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

  if (v11)
  {
    [v17 shapeSize];
    double v19 = v18;
    double v21 = v20;
    Mutable = CGPathCreateMutable();
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v19;
    v24.size.height = v21;
    CGPathAddEllipseInRect(Mutable, 0LL, v24);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v19, v21);
    [v11 setPath:Mutable];
    CFRelease(Mutable);
  }
}

@end