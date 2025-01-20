@interface PHStatusBarGradientView
- (PHStatusBarGradientView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PHStatusBarGradientView

- (PHStatusBarGradientView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PHStatusBarGradientView;
  v3 = -[PHStatusBarGradientView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHStatusBarGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[PHStatusBarGradientView setBackgroundColor:](v4, "setBackgroundColor:", v5);
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  __int128 v7 = xmmword_1000C39C8;
  __int128 v8 = unk_1000C39D8;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v6 = CGGradientCreateWithColorComponents(DeviceGray, (const CGFloat *)&v7, 0LL, 2uLL);
  -[PHStatusBarGradientView bounds](self, "bounds", v7, v8);
  v9.x = 0.0;
  v9.y = 0.0;
  v10.x = 0.0;
  CGContextDrawLinearGradient(CurrentContext, v6, v9, v10, 0);
  CFRelease(DeviceGray);
  CFRelease(v6);
}

@end