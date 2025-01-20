@interface TVSSRecordingIndicatorView
- (BOOL)isOpaque;
- (TVSSRecordingIndicatorView)initWithFrame:(CGRect)a3;
- (UIColor)indicatorColor;
- (int64_t)displayLocation;
- (int64_t)indicatorShape;
- (unint64_t)menuMode;
- (void)_updateWidthConstraint;
- (void)drawRect:(CGRect)a3;
- (void)setDisplayLocation:(int64_t)a3;
- (void)setIndicatorColor:(id)a3;
- (void)setIndicatorShape:(int64_t)a3;
- (void)setMenuMode:(unint64_t)a3;
@end

@implementation TVSSRecordingIndicatorView

- (TVSSRecordingIndicatorView)initWithFrame:(CGRect)a3
{
  CGRect v18 = a3;
  SEL v16 = a2;
  v17 = 0LL;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSSRecordingIndicatorView;
  v17 = -[TVSSRecordingIndicatorView initWithFrame:]( &v15,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    v17->_indicatorShape = 0LL;
    v17->_displayLocation = 0LL;
    id v11 = -[TVSSRecordingIndicatorView widthAnchor](v17, "widthAnchor");
    unsigned __int8 v3 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v4 = 22.0;
    if ((v3 & 1) == 0) {
      double v4 = 18.0;
    }
    v5 = (NSLayoutConstraint *)[v11 constraintEqualToConstant:v4];
    widthConstraint = v17->_widthConstraint;
    v17->_widthConstraint = v5;

    v19[0] = v17->_widthConstraint;
    id v14 = -[TVSSRecordingIndicatorView heightAnchor](v17, "heightAnchor");
    unsigned __int8 v7 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v8 = 22.0;
    if ((v7 & 1) == 0) {
      double v8 = 18.0;
    }
    id v13 = [v14 constraintEqualToConstant:v8];
    v19[1] = v13;
    v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSRecordingIndicatorView setContentMode:](v17, "setContentMode:", 3LL);
  }

  v10 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  return v10;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  CGFloat v23 = 0.0;
  double v22 = 0.0;
  int64_t displayLocation = self->_displayLocation;
  if (displayLocation)
  {
    if (displayLocation == 1)
    {
      CGFloat v23 = 0.3;
      unsigned __int8 v3 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
      double v4 = 17.0;
      if ((v3 & 1) == 0) {
        double v4 = 14.0;
      }
      double v22 = v4;
    }
  }

  else
  {
    CGFloat v23 = 0.7;
    unsigned __int8 v5 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v6 = 22.0;
    if ((v5 & 1) == 0) {
      double v6 = 18.0;
    }
    double v22 = v6;
  }

  CGRect ClipBoundingBox = CGContextGetClipBoundingBox(CurrentContext);
  CGFloat dx = (CGRectGetWidth(ClipBoundingBox) - v22) / 2.0;
  CGFloat v7 = (CGRectGetHeight(ClipBoundingBox) - v22) / 2.0;
  CGRect rect = CGRectInset(ClipBoundingBox, dx, v7);
  double Width = CGRectGetWidth(ClipBoundingBox);
  unsigned __int8 v8 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
  double v9 = 15.0;
  if ((v8 & 1) == 0) {
    double v9 = 12.0;
  }
  double v15 = (Width - v9) / 2.0;
  double Height = CGRectGetHeight(ClipBoundingBox);
  unsigned __int8 v10 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
  double v11 = 15.0;
  if ((v10 & 1) == 0) {
    double v11 = 12.0;
  }
  CGRect v19 = CGRectInset(ClipBoundingBox, v15, (Height - v11) / 2.0);
  SEL v16 = -[UIColor colorWithAlphaComponent:](self->_indicatorColor, "colorWithAlphaComponent:", 0.85);
  v17 = -[UIColor CGColor](v16, "CGColor");

  if (self->_indicatorShape == 1)
  {
    CGContextSetGrayFillColor(CurrentContext, 0.0, v23);
    CGContextFillRect(CurrentContext, rect);
    CGContextSetFillColorWithColor(CurrentContext, v17);
    CGContextFillRect(CurrentContext, v19);
  }

  else
  {
    CGContextSetGrayFillColor(CurrentContext, 0.0, v23);
    CGContextFillEllipseInRect(CurrentContext, rect);
    CGContextSetFillColorWithColor(CurrentContext, v17);
    CGContextFillEllipseInRect(CurrentContext, v19);
  }

- (BOOL)isOpaque
{
  return 0;
}

- (void)setDisplayLocation:(int64_t)a3
{
  if (self->_displayLocation != a3)
  {
    self->_int64_t displayLocation = a3;
    -[TVSSRecordingIndicatorView _updateWidthConstraint](self, "_updateWidthConstraint");
    -[TVSSRecordingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setIndicatorShape:(int64_t)a3
{
  if (self->_indicatorShape != a3)
  {
    self->_indicatorShape = a3;
    -[TVSSRecordingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setIndicatorColor:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[UIColor isEqual:](v4->_indicatorColor, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_indicatorColor, location[0]);
    -[TVSSRecordingIndicatorView setNeedsDisplay](v4, "setNeedsDisplay");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMenuMode:(unint64_t)a3
{
  if (self->_menuMode != a3)
  {
    self->_menuMode = a3;
    -[TVSSRecordingIndicatorView _updateWidthConstraint](self, "_updateWidthConstraint");
  }

- (void)_updateWidthConstraint
{
  if (self->_menuMode == 5 && self->_displayLocation == 1)
  {
    unsigned __int8 v2 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v3 = 44.0;
    if ((v2 & 1) == 0) {
      double v3 = 36.0;
    }
    double v6 = v3;
  }

  else
  {
    unsigned __int8 v4 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v5 = 22.0;
    if ((v4 & 1) == 0) {
      double v5 = 18.0;
    }
    double v6 = v5;
  }

  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v6);
}

- (int64_t)displayLocation
{
  return self->_displayLocation;
}

- (int64_t)indicatorShape
{
  return self->_indicatorShape;
}

- (unint64_t)menuMode
{
  return self->_menuMode;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (void).cxx_destruct
{
}

@end