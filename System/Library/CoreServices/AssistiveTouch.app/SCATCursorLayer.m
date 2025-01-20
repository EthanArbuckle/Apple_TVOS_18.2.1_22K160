@interface SCATCursorLayer
- (BOOL)isDark;
- (BOOL)isSimpleRect;
- (BOOL)usesHighVisibility;
- (SCATCursorLayer)init;
- (UIColor)restingFillColor;
- (UIColor)restingStrokeColor;
- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_opacityForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)boundsInset;
- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_strokeColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)description;
- (id)styleProvider;
- (int64_t)level;
- (int64_t)theme;
- (void)_updatePresentationProperties:(int)a3;
- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBoundsInset:(double)a3;
- (void)setIsDark:(BOOL)a3;
- (void)setLevel:(int64_t)a3;
- (void)setRestingFillColor:(id)a3;
- (void)setRestingStrokeColor:(id)a3;
- (void)setSimpleRect:(BOOL)a3;
- (void)setTheme:(int64_t)a3;
- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7;
- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
@end

@implementation SCATCursorLayer

- (SCATCursorLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATCursorLayer;
  v2 = -[SCATCursorLayer init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SCATCursorLayer setLevel:](v2, "setLevel:", 0LL);
    -[SCATCursorLayer setTheme:](v3, "setTheme:", 0LL);
    -[SCATCursorLayer setOpaque:](v3, "setOpaque:", 0LL);
    -[SCATCursorLayer _updatePresentationProperties:](v3, "_updatePresentationProperties:", 0LL);
  }

  return v3;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  LOBYTE(self->super.super._attr.refcount)));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCATCursorLayer theme](self, "theme")));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCATCursorLayer level](self, "level")));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATCursorLayer usesHighVisibility](self, "usesHighVisibility")));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATCursorLayer isHidden](self, "isHidden")));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SCATCursorLayer;
  id v11 = -[SCATCursorLayer debugDescription](&v15, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. ensureHidden:%@ theme:%@ level:%@ highViz:%@. hidden:%@ %@",  v5,  self,  v6,  v7,  v8,  v9,  v10,  v12));

  return v13;
}

- (BOOL)usesHighVisibility
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  return v3;
}

- (id)styleProvider
{
  return +[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider");
}

- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (LOBYTE(self->super.super._attr.refcount) != a3)
  {
    LOBYTE(self->super.super._attr.refcount) = a3;
    if (a4)
    {
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", 0LL);
    }

    else
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", 0LL);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
  }

- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  if (self->_restingFillColor != (UIColor *)a3)
  {
    uint64_t v5 = *(void *)&a5;
    self->_restingFillColor = (UIColor *)a3;
    if (a4)
    {
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", *(void *)&a5);
    }

    else
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", v5);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
  }

- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  if (*(void *)&self->_boundsInset != a3)
  {
    uint64_t v5 = *(void *)&a5;
    *(void *)&self->_boundsInset = a3;
    if (a4)
    {
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", *(void *)&a5);
    }

    else
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
      -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", v5);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
  }

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  -[SCATCursorLayer setSimpleRect:](self, "setSimpleRect:", v9);
  if ((v7 & 2) != 0 || !a6)
  {
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  }

  if (!v15)
  {
    -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", v7);
    if (a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  -[SCATCursorLayer setFrame:](self, "setFrame:", x, y, width, height);
  -[SCATCursorLayer _updatePresentationProperties:](self, "_updatePresentationProperties:", v7);
  -[SCATCursorLayer setPath:](self, "setPath:", [v15 CGPath]);
  if (!a6) {
LABEL_6:
  }
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
LABEL_7:
}

- (void)_updatePresentationProperties:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v5 = -[SCATCursorLayer theme](self, "theme");
  int64_t v6 = -[SCATCursorLayer level](self, "level");
  BOOL v7 = -[SCATCursorLayer usesHighVisibility](self, "usesHighVisibility");
  if (v6) {
    BOOL v8 = LOBYTE(self->super.super._attr.refcount) != 0;
  }
  else {
    BOOL v8 = 1LL;
  }
  -[SCATCursorLayer setHidden:](self, "setHidden:", v8);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorLayer _strokeColorForTheme:level:highVisibility:options:]( self,  "_strokeColorForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3));
  -[SCATCursorLayer setRestingStrokeColor:](self, "setRestingStrokeColor:", v9);

  id v10 = objc_claimAutoreleasedReturnValue(-[SCATCursorLayer restingStrokeColor](self, "restingStrokeColor"));
  -[SCATCursorLayer setStrokeColor:](self, "setStrokeColor:", [v10 CGColor]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorLayer _fillColorForTheme:level:highVisibility:options:]( self,  "_fillColorForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3));
  -[SCATCursorLayer setRestingFillColor:](self, "setRestingFillColor:", v11);

  id v12 = objc_claimAutoreleasedReturnValue(-[SCATCursorLayer restingFillColor](self, "restingFillColor"));
  -[SCATCursorLayer setFillColor:](self, "setFillColor:", [v12 CGColor]);

  -[SCATCursorLayer _boundsInsetForTheme:level:highVisibility:options:]( self,  "_boundsInsetForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3);
  -[SCATCursorLayer setBoundsInset:](self, "setBoundsInset:");
  -[SCATCursorLayer _borderWidthForTheme:level:highVisibility:options:]( self,  "_borderWidthForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3);
  -[SCATCursorLayer setLineWidth:](self, "setLineWidth:");
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorLayer _borderPatternForTheme:level:highVisibility:options:]( self,  "_borderPatternForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3));
  -[SCATCursorLayer setLineDashPattern:](self, "setLineDashPattern:", v13);

  -[SCATCursorLayer _opacityForTheme:level:highVisibility:options:]( self,  "_opacityForTheme:level:highVisibility:options:",  v5,  v6,  v7,  v3);
  *(float *)&double v14 = v14;
  -[SCATCursorLayer setOpacity:](self, "setOpacity:", v14);
}

- (id)_strokeColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3, a4, a5, *(void *)&a6));
  id v7 = [v6 assistiveTouchCursorColor];

  return +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", AXSAssistiveTouchCursorColor(v7));
}

- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0LL;
}

- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0.0;
}

- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0.0;
}

- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0LL;
}

- (double)_opacityForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  if (a3 == 2)
  {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorLayer styleProvider](self, "styleProvider", 2LL, a4, a5, *(void *)&a6));
    [v6 cursorContainerOpacity];
    double v8 = v7;

    return v8;
  }

  else
  {
    double result = 0.6;
    if (a4 != 2) {
      return 1.0;
    }
  }

  return result;
}

- (UIColor)restingStrokeColor
{
  return (UIColor *)self->super.super._attr.layer;
}

- (void)setRestingStrokeColor:(id)a3
{
}

- (UIColor)restingFillColor
{
  return *(UIColor **)&self->_ensureHidden;
}

- (void)setRestingFillColor:(id)a3
{
}

- (BOOL)isSimpleRect
{
  return BYTE1(self->super.super._attr.refcount);
}

- (void)setSimpleRect:(BOOL)a3
{
  BYTE1(self->super.super._attr.refcount) = a3;
}

- (double)boundsInset
{
  return *(double *)&self->_restingStrokeColor;
}

- (void)setBoundsInset:(double)a3
{
  *(double *)&self->_restingStrokeColor = a3;
}

- (int64_t)theme
{
  return (int64_t)self->_restingFillColor;
}

- (void)setTheme:(int64_t)a3
{
  self->_restingFillColor = (UIColor *)a3;
}

- (int64_t)level
{
  return *(void *)&self->_boundsInset;
}

- (void)setLevel:(int64_t)a3
{
  *(void *)&self->_boundsInset = a3;
}

- (BOOL)isDark
{
  return HIBYTE(self->super.super._attr.refcount);
}

- (void)setIsDark:(BOOL)a3
{
  HIBYTE(self->super.super._attr.refcount) = a3;
}

- (void).cxx_destruct
{
}

@end