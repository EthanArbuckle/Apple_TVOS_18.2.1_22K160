@interface AXElementInteractionCursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (AXElementInteractionCursorView)initWithFrame:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)cursorFrame;
- (UIColor)backgroundColor;
- (double)lineWidth;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (void)_orderIn;
- (void)_orderOut;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
@end

@implementation AXElementInteractionCursorView

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
  double v21 = v6;
  double v22 = v5;
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
  v23.origin.double x = AXDeviceGetMainScreenPixelBounds(a1, a2);
  CGFloat v11 = v23.origin.x;
  CGFloat v12 = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  if (v8 > CGRectGetWidth(v23))
  {
    v24.origin.double x = v11;
    v24.origin.double y = v12;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double v8 = CGRectGetWidth(v24) - v22;
  }

  v25.origin.double x = v11;
  v25.origin.double y = v12;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (v10 > CGRectGetHeight(v25))
  {
    v26.origin.double x = v11;
    v26.origin.double y = v12;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v10 = CGRectGetHeight(v26) - v21;
  }

  double v16 = v21;
  double v15 = v22;
  if (y >= 0.0) {
    double v17 = y;
  }
  else {
    double v17 = v21;
  }
  if (x >= 0.0) {
    double v18 = x;
  }
  else {
    double v18 = v22;
  }
  if (v8 - v22 * 2.0 <= 0.0) {
    double v15 = 0.0;
  }
  if (v10 - v21 * 2.0 <= 0.0) {
    double v16 = 0.0;
  }
  double v19 = v8;
  double v20 = v10;
  return CGRectInset(*(CGRect *)(&v17 - 1), v15, v16);
}

- (AXElementInteractionCursorView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXElementInteractionCursorView;
  v3 = -[AXElementInteractionCursorView initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[AXElementInteractionCursorView setClipsToBounds:](v3, "setClipsToBounds:", 1LL);
  -[AXElementInteractionCursorView setOpaque:](v3, "setOpaque:", 0LL);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXElementInteractionCursorView;
  -[AXElementInteractionCursorView dealloc](&v3, "dealloc");
}

- (void)setPath:(CGPath *)a3
{
  if (a3 && !CGPathIsEmpty(a3))
  {
    self->_path = a3;
    CFRetain(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXElementInteractionCursorView window](self, "window"));
    [v6 frame];
    -[AXElementInteractionCursorView setFrame:](self, "setFrame:");
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
  if (!self->_isHidden || a3)
  {
    if (!self->_isHidden && a3)
    {
      self->_isHidden = 1;
      -[AXElementInteractionCursorView _orderOut](self, "_orderOut");
    }
  }

  else
  {
    self->_isHidden = 0;
    -[AXElementInteractionCursorView _orderIn](self, "_orderIn");
  }

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)_orderOut
{
  self->_cachedAlpha = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_191C;
  v4[3] = &unk_4170;
  v4[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v4,  0LL,  0.05,  0.0);
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1998;
  v2[3] = &unk_4170;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v2,  0LL,  0.05,  0.0);
}

- (double)lineWidth
{
  return 2.0;
}

- (void)setCursorFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[AXElementInteractionCursorView lineWidth](self, "lineWidth");
  CGFloat v9 = -(v8 + 6.0);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRect v16 = CGRectInset(v15, v9, v9);
  double v10 = v16.origin.x;
  double v11 = v16.origin.y;
  double v12 = v16.size.width;
  double v13 = v16.size.height;
  BOOL v14 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  -[AXElementInteractionCursorView setFrame:](self, "setFrame:", v10, v11, v12, v13);
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v14);
  self->_cursorFrame.origin.CGFloat x = v10;
  self->_cursorFrame.origin.CGFloat y = v11;
  self->_cursorFrame.size.CGFloat width = v12;
  self->_cursorFrame.size.CGFloat height = v13;
  -[AXElementInteractionCursorView setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)_retrievePathBezierPaths
{
  if (!self->_path) {
    return 0LL;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](&OBJC_CLASS___UIBezierPath, "bezierPathWithCGPath:"));
  objc_super v5 = v2;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)_retrieveFrameBezierPath:(CGRect)a3
{
  if (CGSizeZero.width == self->_cursorFrame.size.width && CGSizeZero.height == self->_cursorFrame.size.height)
  {
    double v17 = 0LL;
  }

  else
  {
    CGRect v19 = CGRectInset(a3, 3.0, 3.0);
    double x = v19.origin.x;
    double y = v19.origin.y;
    double width = v19.size.width;
    double height = v19.size.height;
    -[AXElementInteractionCursorView lineWidth](self, "lineWidth");
    if (height >= 3.0) {
      double v10 = v9;
    }
    else {
      double v10 = 0.5;
    }
    CGFloat v11 = x + v10 * 0.5;
    CGFloat v12 = y + v10 * 0.5;
    CGFloat v13 = width - v10;
    CGFloat v14 = height - v10;
    CGRect v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v11,  v12,  v13,  v14,  5.0,  5.0));
    v20.origin.double x = v11;
    v20.origin.double y = v12;
    v20.size.double width = v13;
    v20.size.double height = v14;
    CGRect v21 = CGRectInset(v20, v10 / 3.0, v10 / 3.0);
    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v21.origin.x,  v21.origin.y,  v21.size.width,  v21.size.height,  5.0,  5.0));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v15, v16, 0LL));
  }

  return v17;
}

- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  path = self->_path;
  if (!path)
  {
    *a4 = 0;
    goto LABEL_5;
  }

  IsEmptdouble y = CGPathIsEmpty(path);
  *a4 = !IsEmpty;
  if (IsEmpty)
  {
LABEL_5:
    CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue( -[AXElementInteractionCursorView _retrieveFrameBezierPath:]( self,  "_retrieveFrameBezierPath:",  x,  y,  width,  height));
    return v12;
  }

  CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementInteractionCursorView _retrievePathBezierPaths](self, "_retrievePathBezierPaths"));
  return v12;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v16 = 0;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXElementInteractionCursorView _retrieveBezierPaths:usingRealPaths:]( self,  "_retrieveBezierPaths:usingRealPaths:",  &v16));
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v18 = CGRectInset(v17, 3.0, 3.0);
  double v9 = v18.size.height;
  -[AXElementInteractionCursorView lineWidth](self, "lineWidth", v18.origin.x, v18.origin.y, v18.size.width);
  if (v9 < 3.0) {
    double v10 = 0.5;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1DF4;
  v12[3] = &unk_4198;
  double v14 = v10;
  char v15 = v16;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (CGPath)path
{
  return self->_path;
}

- (CGRect)cursorFrame
{
  double x = self->_cursorFrame.origin.x;
  double y = self->_cursorFrame.origin.y;
  double width = self->_cursorFrame.size.width;
  double height = self->_cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end