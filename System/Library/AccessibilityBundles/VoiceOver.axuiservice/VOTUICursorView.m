@interface VOTUICursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)largeCursorEnabled;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)resizeFrameForWindow:(CGRect)a3;
- (CGSize)cornerRadius;
- (VOTUICursorView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (void)_orderIn;
- (void)_orderOut;
- (void)_traitCollectionDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
@end

@implementation VOTUICursorView

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
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView window](self, "window"));
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

- (VOTUICursorView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTUICursorView;
  v3 = -[VOTUICursorView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[VOTUICursorView setClipsToBounds:](v3, "setClipsToBounds:", 1LL);
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_E2FC;
  v12[4] = sub_E30C;
  v4 = v3;
  double v13 = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_E314;
  v11[3] = &unk_24758;
  v11[4] = v12;
  [v5 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v4];

  -[VOTUICursorView setOpaque:](v4, "setOpaque:", 0LL);
  v15[0] = objc_opt_class(&OBJC_CLASS___UITraitPreferredContentSizeCategory);
  v15[1] = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_E324;
  v10[3] = &unk_24780;
  v10[4] = v12;
  id v7 = -[VOTUICursorView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v6, v10);

  CGFloat v8 = v4;
  _Block_object_dispose(v12, 8);

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTUICursorView;
  -[VOTUICursorView dealloc](&v3, "dealloc");
}

- (BOOL)largeCursorEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverLargeCursorEnabled];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  if (!a3) {
    goto LABEL_4;
  }
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if (CGPathIsEmpty(a3)
    || (v13.origin.x = x, v13.origin.CGFloat y = y, v13.size.width = width, v13.size.height = height, CGRectIsEmpty(v13)))
  {
LABEL_4:
    path = self->_path;
    if (path)
    {
      CFRelease(path);
      self->_path = 0LL;
    }
  }

  else
  {
    CGFloat v10 = self->_path;
    if (v10) {
      CFRelease(v10);
    }
    self->_path = a3;
    CFRetain(a3);
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTUICursorView window](self, "window"));
    [v11 frame];
    -[VOTUICursorView setFrame:](self, "setFrame:");
  }

- (void)setBackgroundColor:(id)a3
{
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
      -[VOTUICursorView _orderOut](self, "_orderOut");
    }
  }

  else
  {
    self->_isHidden = 0;
    -[VOTUICursorView _orderIn](self, "_orderIn");
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
  v4[2] = sub_E598;
  v4[3] = &unk_247D0;
  v4[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v4,  0LL,  0.05,  0.0);
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_E614;
  v2[3] = &unk_247D0;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196608LL,  v2,  0LL,  0.05,  0.0);
}

- (CGSize)cornerRadius
{
  double v3 = v2 + v2;
  double v4 = v3;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (double)lineWidth
{
  unsigned int v2 = -[VOTUICursorView largeCursorEnabled](self, "largeCursorEnabled");
  double result = 2.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[VOTUICursorView lineWidth](self, "lineWidth");
  double v11 = v10 + 6.0;
  double v12 = -(v10 + 6.0);
  if (-[VOTUICursorView largeCursorEnabled](self, "largeCursorEnabled")) {
    double v13 = v11 * -1.25;
  }
  else {
    double v13 = v12;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectInset(v25, v13, v13);
  CGFloat v14 = v26.origin.x;
  CGFloat v15 = v26.origin.y;
  CGFloat v16 = v26.size.width;
  CGFloat v17 = v26.size.height;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_E814;
  v23[3] = &unk_24888;
  v23[4] = self;
  CGRect v24 = v26;
  double v18 = objc_retainBlock(v23);
  CGFloat v19 = (void (**)(void))v18;
  if (v4)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_E828;
    v21[3] = &unk_248B0;
    double v22 = v18;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  196612LL,  v21,  0LL,  0.15,  0.0);
  }

  else
  {
    BOOL v20 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
    v19[2](v19);
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v20);
    -[VOTUICursorView setNeedsDisplay](self, "setNeedsDisplay");
  }

  self->_cursorFrame.origin.CGFloat x = v14;
  self->_cursorFrame.origin.CGFloat y = v15;
  self->_cursorFrame.size.CGFloat width = v16;
  self->_cursorFrame.size.CGFloat height = v17;
}

- (id)_retrievePathBezierPaths
{
  if (!self->_path) {
    return 0LL;
  }
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](&OBJC_CLASS___UIBezierPath, "bezierPathWithCGPath:"));
  double v5 = v2;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)_retrieveFrameBezierPath:(CGRect)a3
{
  if (CGSizeZero.width == self->_cursorFrame.size.width && CGSizeZero.height == self->_cursorFrame.size.height)
  {
    double v23 = 0LL;
  }

  else
  {
    CGRect v25 = CGRectInset(a3, 3.0, 3.0);
    double x = v25.origin.x;
    double y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    -[VOTUICursorView lineWidth](self, "lineWidth");
    double v10 = v9;
    -[VOTUICursorView cornerRadius](self, "cornerRadius");
    double v12 = v11;
    double v14 = v13;
    unsigned int v15 = -[VOTUICursorView largeCursorEnabled](self, "largeCursorEnabled");
    if (height >= 3.0) {
      int v16 = 1;
    }
    else {
      int v16 = v15;
    }
    if (!v16) {
      double v10 = 0.5;
    }
    CGFloat v17 = x + v10 * 0.5;
    CGFloat v18 = y + v10 * 0.5;
    CGFloat v19 = width - v10;
    CGFloat v20 = height - v10;
    double v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v17,  v18,  v19,  v20,  v12,  v14));
    v26.origin.double x = v17;
    v26.origin.double y = v18;
    v26.size.double width = v19;
    v26.size.double height = v20;
    CGRect v27 = CGRectInset(v26, v10 / 3.0, v10 / 3.0);
    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -1LL,  v27.origin.x,  v27.origin.y,  v27.size.width,  v27.size.height,  v12,  v14));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v21, v22, 0LL));
  }

  return v23;
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
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView _retrieveFrameBezierPath:](self, "_retrieveFrameBezierPath:", x, y, width, height));
    return v12;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView _retrievePathBezierPaths](self, "_retrievePathBezierPaths"));
  return v12;
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    -[VOTUICursorView setNeedsDisplay](self, "setNeedsDisplay");
    -[VOTUICursorView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  char v16 = 0;
  -[VOTUICursorView bounds](self, "bounds");
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUICursorView _retrieveBezierPaths:usingRealPaths:]( self,  "_retrieveBezierPaths:usingRealPaths:",  &v16));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView layer](self, "layer"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sublayers]);
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1)
  {
    do
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
      CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView layer](self, "layer"));
      [v8 addSublayer:v7];

      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorView layer](self, "layer"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sublayers]);
      id v11 = [v10 count];
    }

    while ((unint64_t)v11 < 2);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_EC88;
  v13[3] = &unk_248D8;
  char v15 = v16;
  v13[4] = self;
  id v14 = v3;
  id v12 = v3;
  [v12 enumerateObjectsUsingBlock:v13];
}

- (CGPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end