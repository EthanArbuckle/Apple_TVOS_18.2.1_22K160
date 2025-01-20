@interface TVNPNowPlayingProgressView
- (CGPoint)_progressCenter;
- (CGSize)_fillSize;
- (TVNPNowPlayingProgressView)initWithFrame:(CGRect)a3;
- (float)progress;
- (void)drawRect:(CGRect)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation TVNPNowPlayingProgressView

- (TVNPNowPlayingProgressView)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVNPNowPlayingProgressView;
  v5 = -[TVNPNowPlayingProgressView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5)
  {
    -[TVNPNowPlayingProgressView setContentMode:](v8, "setContentMode:", 3LL);
    -[TVNPNowPlayingProgressView setOpaque:](v8, "setOpaque:", 0LL);
  }

  v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  -[TVNPNowPlayingProgressView bounds](self, "bounds");
  CGRect v17 = v20;
  CGFloat v16 = CGRectGetHeight(v20) / 2.0;
  -[TVNPNowPlayingProgressView _fillSize](self, "_fillSize");
  uint64_t v14 = v3;
  uint64_t v15 = v4;
  id v12 = -[TVNPNowPlayingProgressView tintColor](self, "tintColor");
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

  id v13 = -[TVNPNowPlayingProgressView tintColor](self, "tintColor");
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);

  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  CGContextSetLineWidth(CurrentContext, 4.0);
  v5 = CGPathCreateWithRoundedRect(v17, v16, v16, 0LL);
  CGContextAddPath(CurrentContext, v5);
  CGContextClip(CurrentContext);
  objc_super v6 = CGPathCreateWithRoundedRect(v17, v16, v16, 0LL);
  CGContextAddPath(CurrentContext, v6);
  CGContextStrokePath(CurrentContext);
  if ((char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVNPNowPlayingProgressView semanticContentAttribute](self, "semanticContentAttribute")) == (char *)&dword_0 + 1)
  {
    CGRectGetWidth(v17);
    sub_2A528();
  }

  else
  {
    CGFloat y = CGPointZero.y;
    CGFloat x = CGPointZero.x;
    uint64_t v10 = v15;
    uint64_t v9 = v14;
  }

  v11 = CGPathCreateWithRect(*(CGRect *)&x, 0LL);
  CGContextAddPath(CurrentContext, v11);
  CGContextFillPath(CurrentContext);
}

  ;
}

- (void)tintColorDidChange
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPNowPlayingProgressView;
  -[TVNPNowPlayingProgressView tintColorDidChange](&v2, "tintColorDidChange");
  -[TVNPNowPlayingProgressView setNeedsDisplay](v4, "setNeedsDisplay");
}

- (void)setProgress:(float)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  self->_progress = a3;
  -[TVNPNowPlayingProgressView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)_fillSize
{
  rect.origin.CGFloat x = v2;
  rect.origin.CGFloat y = v3;
  rect.size.width = v4;
  rect.size.height = v5;
  -[TVNPNowPlayingProgressView progress](self, "progress");
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  sub_2A6F0();
  result.height = v7;
  result.width = v6;
  return result;
}

  ;
}

- (CGPoint)_progressCenter
{
  rect.origin.CGFloat x = v2;
  rect.origin.CGFloat y = v3;
  rect.size.width = v4;
  rect.size.height = v5;
  -[TVNPNowPlayingProgressView _fillSize](self, "_fillSize");
  CGRectGetHeight(rect);
  if ((char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[TVNPNowPlayingProgressView semanticContentAttribute](self, "semanticContentAttribute")) == (char *)&dword_0 + 1) {
    CGRectGetWidth(rect);
  }
  sub_2A81C();
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

  ;
}

- (float)progress
{
  return self->_progress;
}

@end