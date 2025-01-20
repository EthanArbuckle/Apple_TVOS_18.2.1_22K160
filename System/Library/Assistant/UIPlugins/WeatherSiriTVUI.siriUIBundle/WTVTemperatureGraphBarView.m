@interface WTVTemperatureGraphBarView
- (WTVTemperatureGraphBarView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WTVTemperatureGraphBarView

- (WTVTemperatureGraphBarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WTVTemperatureGraphBarView;
  v3 = -[WTVTemperatureGraphBarView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[WTVTemperatureGraphBarView setOpaque:](v3, "setOpaque:", 0LL);
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVTemperatureGraphBarView;
  -[WTVTemperatureGraphBarView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVTemperatureGraphBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[WTVTemperatureGraphBarView traitCollection](self, "traitCollection"));
  v7 = (char *)[v6 userInterfaceStyle];

  if (v7 == (_BYTE *)&dword_0 + 2)
  {
    id v8 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.392156863, 0.15));
    v27[0] = [v8 CGColor];
    id v9 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.188235294, 0.474509804, 0.537254902, 0.15));
    v27[1] = [v9 CGColor];
    v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v27,  2LL));

    id v11 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.337254902, 1.0));
    id v26 = [v11 CGColor];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.776470588,  1.0,  1.0));
    v13 = &v26;
  }

  else
  {
    id v14 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 0.5));
    v29[0] = [v14 CGColor];
    id v15 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.22745098, 0.82745098, 1.0, 1.0));
    v29[1] = [v15 CGColor];
    v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v29,  2LL));

    id v11 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.992156863, 0.68627451, 0.0352941176, 1.0));
    id v28 = [v11 CGColor];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.235294118,  0.788235294,  0.992156863,  1.0));
    v13 = &v28;
  }

  id v16 = v12;
  v13[1] = [v16 CGColor];
  v17 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v13,  2LL));

  v18 = CGGradientCreateWithColors(DeviceRGB, v10, 0LL);
  v19 = CGGradientCreateWithColors(DeviceRGB, v17, 0LL);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  CGFloat MidX = CGRectGetMidX(v34);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  CGFloat MinY = CGRectGetMinY(v35);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  CGFloat v22 = CGRectGetMidX(v36);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  CGFloat MaxY = CGRectGetMaxY(v37);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  CGRect v39 = CGRectInset(v38, 2.0, 2.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v39.origin.x,  v39.origin.y,  v39.size.width,  v39.size.height,  5.0));
  CGContextSaveGState(CurrentContext);
  CGContextSetAlpha(CurrentContext, 0.5);
  [v24 addClip];
  v30.x = MidX;
  v30.y = MinY;
  v32.x = v22;
  v32.y = MaxY;
  CGContextDrawLinearGradient(CurrentContext, v18, v30, v32, 0);
  CGContextRestoreGState(CurrentContext);
  -[WTVTemperatureGraphBarView bounds](self, "bounds");
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:"));
  [v25 appendPath:v24];
  [v25 setUsesEvenOddFillRule:1];
  CGContextSaveGState(CurrentContext);
  [v25 addClip];
  v31.x = MidX;
  v31.y = MinY;
  v33.x = v22;
  v33.y = MaxY;
  CGContextDrawLinearGradient(CurrentContext, v19, v31, v33, 0);
  CGContextRestoreGState(CurrentContext);
  CGGradientRelease(v18);
  CGGradientRelease(v19);
  CGColorSpaceRelease(DeviceRGB);
}

@end