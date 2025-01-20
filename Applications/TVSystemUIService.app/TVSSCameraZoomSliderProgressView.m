@interface TVSSCameraZoomSliderProgressView
- (CGPoint)_progressCenter;
- (CGSize)_fillSize;
- (TVSSCameraZoomSliderProgressView)initWithFrame:(CGRect)a3;
- (float)progress;
- (void)drawRect:(CGRect)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation TVSSCameraZoomSliderProgressView

- (TVSSCameraZoomSliderProgressView)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomSliderProgressView;
  v5 = -[TVSSCameraZoomSliderProgressView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5)
  {
    -[TVSSCameraZoomSliderProgressView setContentMode:](v8, "setContentMode:", 3LL);
    -[TVSSCameraZoomSliderProgressView setOpaque:](v8, "setOpaque:", 0LL);
  }

  v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  -[TVSSCameraZoomSliderProgressView bounds](self, "bounds");
  CGRect v13 = v16;
  CGFloat v12 = CGRectGetHeight(v16) / 2.0;
  -[TVSSCameraZoomSliderProgressView _fillSize](self, "_fillSize");
  v11.width = v3;
  v11.height = v4;
  id v5 = -[TVSSCameraZoomSliderProgressView tintColor](self, "tintColor");
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);

  id v6 = -[TVSSCameraZoomSliderProgressView tintColor](self, "tintColor");
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);

  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  CGContextSetLineWidth(CurrentContext, 4.0);
  v10 = CGPathCreateWithRoundedRect(v13, v12, v12, 0LL);
  CGContextAddPath(CurrentContext, v10);
  CGContextClip(CurrentContext);
  CGPathRelease(v10);
  path = CGPathCreateWithRoundedRect(v13, v12, v12, 0LL);
  CGContextAddPath(CurrentContext, path);
  CGContextStrokePath(CurrentContext);
  CGPathRelease(path);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVSSCameraZoomSliderProgressView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1)
  {
    CGRectGetWidth(v13);
    sub_1000A03C8();
    v8 = CGPathCreateWithRect(v17, 0LL);
    CGContextAddPath(CurrentContext, v8);
    CGPathRelease(v8);
  }

  else
  {
    v18.origin = CGPointZero;
    v18.size = v11;
    SEL v7 = CGPathCreateWithRect(v18, 0LL);
    CGContextAddPath(CurrentContext, v7);
    CGPathRelease(v7);
  }

  CGContextFillPath(CurrentContext);
}

- (void)tintColorDidChange
{
  CGFloat v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomSliderProgressView;
  -[TVSSCameraZoomSliderProgressView tintColorDidChange](&v2, "tintColorDidChange");
  -[TVSSCameraZoomSliderProgressView setNeedsDisplay](v4, "setNeedsDisplay");
}

- (void)setProgress:(float)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  self->_progress = a3;
  -[TVSSCameraZoomSliderProgressView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)_fillSize
{
  rect.origin.x = v2;
  rect.origin.y = v3;
  rect.size.width = v4;
  rect.size.height = v5;
  -[TVSSCameraZoomSliderProgressView progress](self, "progress");
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  sub_1000A0414();
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)_progressCenter
{
  rect.origin.x = v2;
  rect.origin.y = v3;
  rect.size.width = v4;
  rect.size.height = v5;
  -[TVSSCameraZoomSliderProgressView _fillSize](self, "_fillSize");
  CGRectGetHeight(rect);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVSSCameraZoomSliderProgressView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1) {
    CGRectGetWidth(rect);
  }
  sub_1000A09CC();
  result.y = v7;
  result.x = v6;
  return result;
}

- (float)progress
{
  return self->_progress;
}

@end