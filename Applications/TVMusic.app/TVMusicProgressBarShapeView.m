@interface TVMusicProgressBarShapeView
- ($F24F406B2B787EFB06265DBA3D28CBD5)fillRange;
- (CAShapeLayer)borderLayer;
- (CAShapeLayer)fillLayer;
- (CAShapeLayer)fillMask;
- (TVMusicProgressBarShapeView)initWithCoder:(id)a3;
- (TVMusicProgressBarShapeView)initWithFrame:(CGRect)a3;
- (UIColor)fillColor;
- (double)borderWidth;
- (unint64_t)roundedCorners;
- (void)_commonInit;
- (void)_updateMask;
- (void)_updateShapes;
- (void)layoutSubviews;
- (void)setBorderWidth:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setFillRange:(id)a3;
- (void)setRoundedCorners:(unint64_t)a3;
@end

@implementation TVMusicProgressBarShapeView

- (TVMusicProgressBarShapeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarShapeView;
  v3 = -[TVMusicProgressBarShapeView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[TVMusicProgressBarShapeView _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (TVMusicProgressBarShapeView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarShapeView;
  v3 = -[TVMusicProgressBarShapeView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[TVMusicProgressBarShapeView _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (void)_commonInit
{
  self->_roundedCorners = -1LL;
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  fillColor = self->_fillColor;
  self->_fillColor = v3;

  self->_fillRange.start = 0.0;
  self->_fillRange.end = 0.0;
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
  fillLayer = self->_fillLayer;
  self->_fillLayer = v5;

  -[CAShapeLayer setFillColor:](self->_fillLayer, "setFillColor:", -[UIColor CGColor](self->_fillColor, "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_fillLayer, "setStrokeColor:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView layer](self, "layer"));
  [v7 addSublayer:self->_fillLayer];

  v8 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
  fillMask = self->_fillMask;
  self->_fillMask = v8;

  -[CAShapeLayer setMask:](self->_fillLayer, "setMask:", self->_fillMask);
  v10 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
  borderLayer = self->_borderLayer;
  self->_borderLayer = v10;

  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", 0LL);
  -[CAShapeLayer setStrokeColor:]( self->_borderLayer,  "setStrokeColor:",  -[UIColor CGColor](self->_fillColor, "CGColor"));
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView layer](self, "layer"));
  [v12 addSublayer:self->_borderLayer];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarShapeView;
  -[TVMusicProgressBarShapeView layoutSubviews](&v3, "layoutSubviews");
  -[TVMusicProgressBarShapeView _updateShapes](self, "_updateShapes");
  -[TVMusicProgressBarShapeView _updateMask](self, "_updateMask");
}

- (void)setBorderWidth:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView borderLayer](self, "borderLayer"));
  [v5 setLineWidth:a3];

  -[TVMusicProgressBarShapeView _updateShapes](self, "_updateShapes");
}

- (double)borderWidth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView borderLayer](self, "borderLayer"));
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView fillLayer](self, "fillLayer"));
  id v7 = v5;
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView borderLayer](self, "borderLayer"));
  id v8 = v7;
  id v9 = [v8 CGColor];

  [v10 setStrokeColor:v9];
}

- (void)setRoundedCorners:(unint64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    -[TVMusicProgressBarShapeView _updateShapes](self, "_updateShapes");
  }

- (void)_updateShapes
{
  double v4 = v3;
  CGFloat y = CGPointZero.y;
  -[TVMusicProgressBarShapeView bounds](self, "bounds");
  v17.origin.double x = CGPointZero.x;
  v17.origin.CGFloat y = y;
  CGRect v18 = CGRectInset(v17, v4 * 0.5, v4 * 0.5);
  double x = v18.origin.x;
  double v7 = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  double v10 = CGRectGetWidth(v18);
  v19.origin.double x = x;
  v19.origin.CGFloat y = v7;
  v19.size.double width = width;
  v19.size.double height = height;
  double v11 = CGRectGetHeight(v19);
  if (v10 >= v11) {
    double v10 = v11;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:",  -[TVMusicProgressBarShapeView roundedCorners](self, "roundedCorners"),  x,  v7,  width,  height,  v10,  v10));
  [v12 closePath];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView borderLayer](self, "borderLayer"));
  id v14 = v12;
  objc_msgSend(v13, "setPath:", objc_msgSend(v14, "CGPath"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView fillLayer](self, "fillLayer"));
  id v16 = v14;
  objc_msgSend(v15, "setPath:", objc_msgSend(v16, "CGPath"));
}

- (void)setFillRange:(id)a3
{
  self->_fillRange = ($E5287BE8825E251DAB245C9687E3B2FE)a3;
  -[TVMusicProgressBarShapeView _updateMask](self, "_updateMask");
}

- (void)_updateMask
{
  double v4 = v3;
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView layer](self, "layer"));
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.double x = v9;
  v21.origin.CGFloat y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  double v16 = v4 * CGRectGetWidth(v21);
  v22.origin.double x = v9;
  v22.origin.CGFloat y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  double v17 = v6 * CGRectGetWidth(v22) - v16;
  v23.origin.double x = v9;
  v23.origin.CGFloat y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  double Height = CGRectGetHeight(v23);
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarShapeView fillMask](self, "fillMask"));
  id v19 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRect:", v16, 0.0, v17, Height));
  objc_msgSend(v20, "setPath:", objc_msgSend(v19, "CGPath"));
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)fillRange
{
  double start = self->_fillRange.start;
  double end = self->_fillRange.end;
  result.var1 = end;
  result.var0 = start;
  return result;
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (CAShapeLayer)fillLayer
{
  return self->_fillLayer;
}

- (CAShapeLayer)fillMask
{
  return self->_fillMask;
}

- (void).cxx_destruct
{
}

@end