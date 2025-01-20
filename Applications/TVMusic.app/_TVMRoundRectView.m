@interface _TVMRoundRectView
- (UIColor)color;
- (_TVMRoundRectView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setLineWidth:(double)a3;
@end

@implementation _TVMRoundRectView

- (_TVMRoundRectView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____TVMRoundRectView;
  v3 = -[_TVMRoundRectView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_TVMRoundRectView setOpaque:](v3, "setOpaque:", 0LL);
    -[_TVMRoundRectView setBackgroundColor:](v4, "setBackgroundColor:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.2));
    -[_TVMRoundRectView setColor:](v4, "setColor:", v5);

    v4->_lineWidth = 2.0;
  }

  return v4;
}

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[_TVMRoundRectView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }
}

- (void)drawRect:(CGRect)a3
{
  if (v4 != 0.0)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v6 = objc_claimAutoreleasedReturnValue(-[_TVMRoundRectView color](self, "color"));
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);

    -[_TVMRoundRectView lineWidth](self, "lineWidth");
    CGContextSetLineWidth(CurrentContext, v7);
    -[_TVMRoundRectView bounds](self, "bounds");
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    -[_TVMRoundRectView lineWidth](self, "lineWidth");
    CGFloat v17 = v16 * 0.5;
    -[_TVMRoundRectView lineWidth](self, "lineWidth");
    CGFloat v19 = v18 * 0.5;
    v27.origin.double x = v9;
    v27.origin.CGFloat y = v11;
    v27.size.CGFloat width = v13;
    v27.size.CGFloat height = v15;
    CGRect v28 = CGRectInset(v27, v17, v19);
    double x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    CGFloat v24 = v28.size.height * 0.5;
    CGFloat MaxX = CGRectGetMaxX(v28);
    v29.origin.double x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v29);
    CGContextBeginPath(CurrentContext);
    CGContextMoveToPoint(CurrentContext, x + v24, y);
    CGContextAddArcToPoint(CurrentContext, MaxX, y, MaxX, MaxY, v24);
    CGContextAddArcToPoint(CurrentContext, MaxX, MaxY, x, MaxY, v24);
    CGContextAddArcToPoint(CurrentContext, x, MaxY, x, y, v24);
    CGContextAddArcToPoint(CurrentContext, x, y, MaxX, y, v24);
    CGContextDrawPath(CurrentContext, kCGPathStroke);
  }

- (UIColor)color
{
  return self->_color;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
}

@end