@interface AXAuditUICursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (AXAuditUICursorView)initWithFrame:(CGRect)a3;
- (BOOL)_isHidden;
- (BOOL)largeCursorEnabled;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)_cursorFrame;
- (CGRect)resizeFrameForWindow:(CGRect)a3;
- (double)_cachedAlpha;
- (double)lineWidth;
- (id)_outlineColor;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (unint64_t)highlightStyle;
- (void)_orderIn;
- (void)_orderOut;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setHighlightStyle:(unint64_t)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
- (void)set_cachedAlpha:(double)a3;
- (void)set_cursorFrame:(CGRect)a3;
- (void)set_isHidden:(BOOL)a3;
@end

@implementation AXAuditUICursorView

+ (CGRect)resizeFrameForDisplay:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a3.size.width >= 15.0) {
    double v5 = 2.5;
  }
  else {
    double v5 = 15.0 - a3.size.width + 2.5;
  }
  if (a3.size.height >= 15.0) {
    double v6 = 2.5;
  }
  else {
    double v6 = 15.0 - a3.size.height;
  }
  double v26 = v6;
  double v28 = v5;
  double v7 = fabs(x);
  if (x >= 0.0) {
    double v7 = 0.0;
  }
  double v8 = a3.size.width - v7;
  double v9 = fabs(a3.origin.y);
  if (a3.origin.y >= 0.0) {
    double v9 = 0.0;
  }
  double v10 = a3.size.height - v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen", *(void *)&v26));
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v29.origin.double x = v13;
  v29.origin.double y = v15;
  v29.size.width = v17;
  v29.size.height = v19;
  if (v8 > CGRectGetWidth(v29))
  {
    v30.origin.double x = v13;
    v30.origin.double y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    double v8 = CGRectGetWidth(v30) - v28;
  }

  v31.origin.double x = v13;
  v31.origin.double y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  if (v10 > CGRectGetHeight(v31))
  {
    v32.origin.double x = v13;
    v32.origin.double y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    double v10 = CGRectGetHeight(v32) - v27;
  }

  double v21 = v27;
  double v20 = v28;
  if (y >= 0.0) {
    double v22 = y;
  }
  else {
    double v22 = v27;
  }
  if (x >= 0.0) {
    double v23 = x;
  }
  else {
    double v23 = v28;
  }
  if (v8 - v28 * 2.0 <= 0.0) {
    double v20 = 0.0;
  }
  if (v10 - v27 * 2.0 <= 0.0) {
    double v21 = 0.0;
  }
  double v24 = v8;
  double v25 = v10;
  return CGRectInset(*(CGRect *)(&v22 - 1), v20, v21);
}

- (CGRect)resizeFrameForWindow:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorView window](self, "window"));
  CGFloat v8 = UIRectInset([v7 bounds]);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v15.origin.CGFloat x = v8;
  v15.origin.CGFloat y = v10;
  v15.size.CGFloat width = v12;
  v15.size.CGFloat height = v14;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  return CGRectIntersection(v15, v17);
}

- (AXAuditUICursorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AXAuditUICursorView;
  v3 = -[AXAuditUICursorView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[AXAuditUICursorView setClipsToBounds:](v3, "setClipsToBounds:", 1LL);
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_46B0;
  v9[4] = sub_46C0;
  v4 = v3;
  CGFloat v10 = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_46C8;
  v8[3] = &unk_81B0;
  v8[4] = v9;
  [v5 registerUpdateBlock:v8 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v4];

  -[AXAuditUICursorView setOpaque:](v4, "setOpaque:", 0LL);
  -[AXAuditUICursorView setNeedsDisplayOnBoundsChange:](v4, "setNeedsDisplayOnBoundsChange:", 1LL);
  double v6 = v4;
  _Block_object_dispose(v9, 8);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXAuditUICursorView;
  -[AXAuditUICursorView dealloc](&v3, "dealloc");
}

- (BOOL)largeCursorEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverLargeCursorEnabled];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  if (a3 && !CGPathIsEmpty(a3))
  {
    self->_path = a3;
    CFRetain(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorView window](self, "window"));
    [v6 frame];
    -[AXAuditUICursorView setFrame:](self, "setFrame:");
  }

  else
  {
    path = self->_path;
    if (path)
    {
      CFRelease(path);
      self->_path = 0LL;
    }
  }

- (BOOL)userInteractionEnabled
{
  return 0;
}

- (void)setIsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[AXAuditUICursorView _isHidden](self, "_isHidden") || v3)
  {
    if (!-[AXAuditUICursorView _isHidden](self, "_isHidden") && v3)
    {
      -[AXAuditUICursorView set_isHidden:](self, "set_isHidden:", 1LL);
      -[AXAuditUICursorView _orderOut](self, "_orderOut");
    }
  }

  else
  {
    -[AXAuditUICursorView set_isHidden:](self, "set_isHidden:", 0LL);
    -[AXAuditUICursorView _orderIn](self, "_orderIn");
  }

- (void)setHighlightStyle:(unint64_t)a3
{
  self->_highlightStyle = a3;
  -[AXAuditUICursorView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_orderOut
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_4904;
  v3[3] = &unk_81D8;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v3,  0LL,  0.05,  0.0);
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_4980;
  v2[3] = &unk_81D8;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v2,  0LL,  0.05,  0.0);
}

- (double)lineWidth
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditTheme sharedTheme](&OBJC_CLASS___AXAuditTheme, "sharedTheme"));
  objc_msgSend(v3, "borderWidthForHighlightStyle:", -[AXAuditUICursorView highlightStyle](self, "highlightStyle"));
  double v5 = v4;
  if (-[AXAuditUICursorView largeCursorEnabled](self, "largeCursorEnabled")) {
    double v5 = 8.0;
  }

  return v5;
}

- (void)setCursorFrame:(CGRect)a3
{
  double v4 = round(a3.origin.x);
  double v5 = round(a3.origin.y);
  double v6 = round(a3.size.width);
  double v7 = round(a3.size.height);
  -[AXAuditUICursorView lineWidth](self, "lineWidth");
  double v9 = v8 + 6.0;
  double v10 = -(v8 + 6.0);
  if (-[AXAuditUICursorView largeCursorEnabled](self, "largeCursorEnabled")) {
    double v11 = v9 * -1.25;
  }
  else {
    double v11 = v10;
  }
  v19.origin.double x = v4;
  v19.origin.double y = v5;
  v19.size.double width = v6;
  v19.size.double height = v7;
  CGRect v20 = CGRectInset(v19, v11, v11);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  -[AXAuditUICursorView _cursorFrame](self, "_cursorFrame");
  BOOL v16 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  double v17 = CGSizeZero.height;
  -[AXAuditUICursorView setSize:](self, "setSize:", width, height);
  if (CGSizeZero.width != width || v17 != height) {
    -[AXAuditUICursorView setOrigin:](self, "setOrigin:", x, y);
  }
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v16);
  -[AXAuditUICursorView set_cursorFrame:](self, "set_cursorFrame:", x, y, width, height);
}

- (id)_retrievePathBezierPaths
{
  if (!-[AXAuditUICursorView path](self, "path")) {
    return 0LL;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithCGPath:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithCGPath:",  -[AXAuditUICursorView path](self, "path")));
  double v6 = v3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (id)_retrieveFrameBezierPath:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[AXAuditUICursorView _cursorFrame](self, "_cursorFrame");
  if (CGSizeZero.width == v9 && CGSizeZero.height == v8)
  {
    double v25 = 0LL;
  }

  else
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRect v28 = CGRectInset(v27, 3.0, 3.0);
    double v11 = v28.origin.x;
    double v12 = v28.origin.y;
    double v13 = v28.size.width;
    double v14 = v28.size.height;
    -[AXAuditUICursorView lineWidth](self, "lineWidth");
    double v16 = v15;
    unsigned int v17 = -[AXAuditUICursorView largeCursorEnabled](self, "largeCursorEnabled");
    if (v14 >= 3.0) {
      int v18 = 1;
    }
    else {
      int v18 = v17;
    }
    if (!v18) {
      double v16 = 0.5;
    }
    CGFloat v19 = v11 + v16 * 0.5;
    CGFloat v20 = v12 + v16 * 0.5;
    CGFloat v21 = v13 - v16;
    CGFloat v22 = v14 - v16;
    double v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v19,  v20,  v21,  v22,  5.0,  5.0));
    v29.origin.CGFloat x = v19;
    v29.origin.CGFloat y = v20;
    v29.size.CGFloat width = v21;
    v29.size.CGFloat height = v22;
    CGRect v30 = CGRectInset(v29, v16 / 3.0, v16 / 3.0);
    double v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v30.origin.x,  v30.origin.y,  v30.size.width,  v30.size.height,  5.0,  5.0));
    double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v23, v24, 0LL));
  }

  return v25;
}

- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  if (!-[AXAuditUICursorView path](self, "path", a3.origin.x, a3.origin.y))
  {
    *a4 = 0;
    goto LABEL_5;
  }

  IsEmptCGFloat y = CGPathIsEmpty(-[AXAuditUICursorView path](self, "path"));
  *a4 = !IsEmpty;
  if (IsEmpty)
  {
LABEL_5:
    double v9 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditUICursorView _retrieveFrameBezierPath:]( self,  "_retrieveFrameBezierPath:",  0.0,  0.0,  width,  height));
    return v9;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorView _retrievePathBezierPaths](self, "_retrievePathBezierPaths"));
  return v9;
}

- (id)_outlineColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  0.7);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v29 = 0;
  -[AXAuditUICursorView bounds](self, "bounds");
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditUICursorView _retrieveBezierPaths:usingRealPaths:]( self,  "_retrieveBezierPaths:usingRealPaths:",  &v29));
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectInset(v30, 3.0, 3.0);
  double v9 = v31.size.height;
  -[AXAuditUICursorView lineWidth](self, "lineWidth", v31.origin.x, v31.origin.y, v31.size.width);
  double v11 = v10;
  unsigned int v12 = -[AXAuditUICursorView largeCursorEnabled](self, "largeCursorEnabled");
  if (v9 >= 3.0) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  if (v13) {
    double v14 = v11;
  }
  else {
    double v14 = 0.5;
  }
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditTheme sharedTheme](&OBJC_CLASS___AXAuditTheme, "sharedTheme"));
  unint64_t v16 = -[AXAuditUICursorView highlightStyle](self, "highlightStyle");
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 backgroundColorForHighlightStyle:v16]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 borderColorForHighlightStyle:v16]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_4F80;
  v22[3] = &unk_8200;
  double v27 = v14;
  char v28 = v29;
  id v23 = v17;
  double v24 = self;
  id v25 = v8;
  id v26 = v18;
  id v19 = v18;
  id v20 = v8;
  id v21 = v17;
  [v20 enumerateObjectsUsingBlock:v22];
}

- (CGPath)path
{
  return self->_path;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (CGRect)_cursorFrame
{
  double x = self->__cursorFrame.origin.x;
  double y = self->__cursorFrame.origin.y;
  double width = self->__cursorFrame.size.width;
  double height = self->__cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_cursorFrame:(CGRect)a3
{
  self->__cursorFrame = a3;
}

- (BOOL)_isHidden
{
  return self->__isHidden;
}

- (void)set_isHidden:(BOOL)a3
{
  self->__isHidden = a3;
}

- (double)_cachedAlpha
{
  return self->__cachedAlpha;
}

- (void)set_cachedAlpha:(double)a3
{
  self->__cachedAlpha = a3;
}

@end