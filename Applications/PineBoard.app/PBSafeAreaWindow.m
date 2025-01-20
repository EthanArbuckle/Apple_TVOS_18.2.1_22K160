@interface PBSafeAreaWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_ignoresHitTest;
- (PBSafeAreaWindow)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PBSafeAreaWindow

- (PBSafeAreaWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSafeAreaWindow;
  v3 = -[PBSafeAreaWindow initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBSafeAreaWindow setWindowLevel:](v3, "setWindowLevel:", 1000000.0);
    -[PBSafeAreaWindow setOpaque:](v4, "setOpaque:", 0LL);
    -[PBSafeAreaWindow setContentMode:](v4, "setContentMode:", 3LL);
  }

  return v4;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void)drawRect:(CGRect)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor redColor]( &OBJC_CLASS___UIColor,  "redColor",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 colorWithAlphaComponent:0.2]);
  [v5 setFill];

  -[PBSafeAreaWindow bounds](self, "bounds");
  UIRectFillUsingBlendMode(v6, kCGBlendModeCopy);
  -[PBSafeAreaWindow bounds](self, "bounds");
  CGRect v8 = CGRectInset(v7, 90.0, 60.0);
  UIRectFillUsingBlendMode(v8, kCGBlendModeClear);
}

@end