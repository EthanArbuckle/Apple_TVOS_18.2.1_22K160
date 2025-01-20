@interface SCATXYAxisRangeLayer
+ (double)rangeLayerFrameInset;
- (SCATXYAxisLineLayer)lineLayer;
- (SCATXYAxisRangeLayer)initWithAxis:(int)a3;
- (id)_backgroundColorForTheme:(int)a3;
- (id)_borderBackgroundColorForTheme:(int)a3;
- (id)_borderForegroundColorForTheme:(int)a3;
- (void)removeAllAnimations;
- (void)resetLineLayer;
- (void)setLineLayer:(id)a3;
- (void)updateFrameForParentBounds:(CGRect)a3 refinementPoint:(CGPoint *)a4;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
- (void)updateToFitWithinParentBounds:(CGRect)a3;
@end

@implementation SCATXYAxisRangeLayer

+ (double)rangeLayerFrameInset
{
  return 20.0;
}

- (SCATXYAxisRangeLayer)initWithAxis:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATXYAxisRangeLayer;
  v4 = -[SCATAxisLayer initWithAxis:](&v13, "initWithAxis:");
  if (v4)
  {
    +[SCATAxisLayer rangeLayerBorderWidth](&OBJC_CLASS___SCATAxisLayer, "rangeLayerBorderWidth");
    -[SCATXYAxisRangeLayer setBorderWidth:](v4, "setBorderWidth:");
    v5 = -[SCATAxisLayer initWithAxis:](objc_alloc(&OBJC_CLASS___SCATXYAxisLineLayer), "initWithAxis:", v3);
    -[SCATXYAxisRangeLayer setLineLayer:](v4, "setLineLayer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](v4, "compositingLayer"));
    -[SCATXYAxisRangeLayer insertSublayer:below:](v4, "insertSublayer:below:", v5, v6);

    uint64_t v7 = kCAFilterPlusL;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    -[SCATXYAxisRangeLayer setCompositingFilter:](v4, "setCompositingFilter:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](v4, "foregroundLayer"));
    [v9 setBorderWidth:1.0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](v4, "foregroundLayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v7));
    [v10 setCompositingFilter:v11];
  }

  return v4;
}

- (void)removeAllAnimations
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer presentationLayer](self, "presentationLayer"));
  [v3 position];
  double v5 = v4;
  double v7 = v6;

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATXYAxisRangeLayer;
  -[SCATXYAxisRangeLayer removeAllAnimations](&v16, "removeAllAnimations");
  -[SCATAxisLayer updateLayerTreePosition:](self, "updateLayerTreePosition:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 presentationLayer]);
  [v9 position];
  double v11 = v10;
  double v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  [v14 removeAllAnimations];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  objc_msgSend(v15, "updateLayerTreePosition:", v11, v13);
}

- (void)resetLineLayer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  [v3 removeFromSuperlayer];

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  [v4 removeAllAnimations];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  -[SCATXYAxisRangeLayer insertSublayer:below:](self, "insertSublayer:below:", v8, v7);
}

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATXYAxisRangeLayer;
  -[SCATAxisLayer updateTheme:animated:](&v13, "updateTheme:animated:");
  if (!v4)
  {
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  [v7 updateTheme:v5 animated:v4];

  id v8 = objc_claimAutoreleasedReturnValue( -[SCATXYAxisRangeLayer _backgroundColorForTheme:]( self, "_backgroundColorForTheme:", v5));
  -[SCATAxisLayer setBackgroundColor:](self, "setBackgroundColor:", [v8 CGColor]);

  id v9 = objc_claimAutoreleasedReturnValue( -[SCATXYAxisRangeLayer _borderBackgroundColorForTheme:]( self, "_borderBackgroundColorForTheme:", v5));
  -[SCATXYAxisRangeLayer setBorderColor:](self, "setBorderColor:", [v9 CGColor]);

  id v10 = objc_claimAutoreleasedReturnValue( -[SCATXYAxisRangeLayer _borderForegroundColorForTheme:]( self, "_borderForegroundColorForTheme:", v5));
  id v11 = [v10 CGColor];
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  [v12 setBorderColor:v11];

  if (!v4) {
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }
}

- (void)updateFrameForParentBounds:(CGRect)a3 refinementPoint:(CGPoint *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4)
  {
    +[SCATAxisLayer rangeLayerMaxWidth](&OBJC_CLASS___SCATAxisLayer, "rangeLayerMaxWidth");
    double v11 = v10;
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    else {
      +[SCATAxisLayer rangeLayerMaxWidth](&OBJC_CLASS___SCATAxisLayer, "rangeLayerMaxWidth");
    }
    double v11 = v13;
  }

  unsigned int v14 = -[SCATAxisLayer axis](self, "axis");
  *(void *)&double v16 = objc_opt_class(self, v15).n128_u64[0];
  objc_msgSend(v17, "rangeLayerFrameInset", v16);
  double v19 = v18 * -0.5;
  if (v14)
  {
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGRect v45 = CGRectInset(v44, v19, 0.0);
    double v20 = v45.origin.x;
    double v21 = v45.origin.y;
    double v22 = v45.size.width;
    if (!a4) {
      goto LABEL_17;
    }
  }

  else
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRect v47 = CGRectInset(v46, 0.0, v19);
    double v20 = v47.origin.x;
    double v21 = v47.origin.y;
    double v22 = v11;
    double v11 = v47.size.height;
    if (!a4) {
      goto LABEL_17;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer superlayer](self, "superlayer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 delegate]);

  objc_opt_class(&OBJC_CLASS___UIView, v25);
  if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
  {
    +[HNDScreen convertPoint:toView:](&OBJC_CLASS___HNDScreen, "convertPoint:toView:", v24, a4->x, a4->y);
    double v28 = v27;
    double v30 = v29;
    if (-[SCATAxisLayer axis](self, "axis")) {
      double v21 = v30 - v11 * 0.5;
    }
    else {
      double v20 = v28 - v22 * 0.5;
    }
  }

  else
  {
    v42 = v24;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATXYAxisRangeLayer.m",  125LL,  "-[SCATXYAxisRangeLayer updateFrameForParentBounds:refinementPoint:]",  @"Expected target view to be a UIView: %@");
  }

LABEL_17:
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin", v42);
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  -[SCATAxisLayer setFrame:](self, "setFrame:", v20, v21, v22, v11);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  v48.origin.CGFloat x = v20;
  v48.origin.CGFloat y = v21;
  v48.size.CGFloat width = v22;
  v48.size.CGFloat height = v11;
  CGRect v49 = CGRectInset(v48, 1.0, 1.0);
  double v31 = v49.size.width;
  double v32 = v49.size.height;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer", v49.origin.x, v49.origin.y));
  objc_msgSend(v33, "setFrame:", 1.0, 1.0, v31, v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  objc_msgSend(v34, "setFrame:", 1.0, 1.0, v31, v32);

  LODWORD(v34) = -[SCATAxisLayer axis](self, "axis");
  +[SCATAxisLayer lineLayerMaxWidth](&OBJC_CLASS___SCATAxisLayer, "lineLayerMaxWidth");
  if ((_DWORD)v34) {
    double v11 = v35;
  }
  else {
    double v22 = v35;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  objc_msgSend(v36, "setFrame:", 0.0, 0.0, v22, v11);

  v50.origin.CGFloat x = 0.0;
  v50.origin.CGFloat y = 0.0;
  v50.size.CGFloat width = v22;
  v50.size.CGFloat height = v11;
  CGRect v51 = CGRectInset(v50, 1.0, 1.0);
  double v37 = v51.size.width;
  double v38 = v51.size.height;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer", v51.origin.x, v51.origin.y));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 foregroundLayer]);
  objc_msgSend(v40, "setFrame:", 1.0, 1.0, v37, v38);

  id v43 = (id)objc_claimAutoreleasedReturnValue(-[SCATXYAxisRangeLayer lineLayer](self, "lineLayer"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 compositingLayer]);
  objc_msgSend(v41, "setFrame:", 1.0, 1.0, v37, v38);
}

- (void)updateToFitWithinParentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  -[SCATXYAxisRangeLayer frame](self, "frame", a3.origin.x, a3.origin.y);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (-[SCATAxisLayer axis](self, "axis"))
  {
    if (v9 + v13 <= height)
    {
      if (v9 < 0.0)
      {
        double v13 = v13 - fabs(v9);
        double v9 = 0.0;
      }
    }

    else
    {
      double v13 = height - v9;
    }
  }

  else if (v7 + v11 <= width)
  {
    if (v7 < 0.0)
    {
      double v11 = v11 - fabs(v7);
      double v7 = 0.0;
    }
  }

  else
  {
    double v11 = width - v7;
  }

  -[SCATAxisLayer setFrame:](self, "setFrame:", v7, v9, v11, v13);
  v18.origin.CGFloat x = v7;
  v18.origin.CGFloat y = v9;
  v18.size.double width = v11;
  v18.size.double height = v13;
  CGRect v19 = CGRectInset(v18, 1.0, 1.0);
  double v14 = v19.size.width;
  double v15 = v19.size.height;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer", v19.origin.x, v19.origin.y));
  objc_msgSend(v16, "setFrame:", 1.0, 1.0, v14, v15);

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  objc_msgSend(v17, "setFrame:", 1.0, 1.0, v14, v15);
}

- (id)_backgroundColorForTheme:(int)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  else
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    else {
      double v5 = 0.15;
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v7 = [v6 assistiveTouchCursorColor];

    double v8 = (CGColor *)AXSAssistiveTouchCursorColor(v7);
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v8, v5);
    double v10 = +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", CFAutorelease(CopyWithAlpha));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v3;
}

- (id)_borderBackgroundColorForTheme:(int)a3
{
  if (a3 > 1)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = [v3 assistiveTouchCursorColor];

    double v5 = +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", AXSAssistiveTouchCursorColor(v4));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v6;
}

- (id)_borderForegroundColorForTheme:(int)a3
{
  if (a3 > 1)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = [v3 assistiveTouchCursorColor];

    double v5 = +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", AXSAssistiveTouchCursorColor(v4));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v6;
}

- (SCATXYAxisLineLayer)lineLayer
{
  return (SCATXYAxisLineLayer *)self->super._foregroundLayer;
}

- (void)setLineLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end