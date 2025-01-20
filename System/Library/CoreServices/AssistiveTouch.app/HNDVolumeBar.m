@interface HNDVolumeBar
- (CGSize)intrinsicContentSize;
- (HNDVolumeBar)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)drawRect:(CGRect)a3;
- (void)setProgress:(double)a3;
@end

@implementation HNDVolumeBar

- (HNDVolumeBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HNDVolumeBar;
  v3 = -[HNDView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[HNDVolumeBar setBackgroundColor:](v3, "setBackgroundColor:", v4);

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  for (uint64_t i = 0LL; i != 16; ++i)
  {
    double v5 = (double)i * 8.0;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
    objc_msgSend(v6, "moveToPoint:", v5, 0.0);
    objc_msgSend(v6, "addLineToPoint:", v5, 5.0);
    objc_msgSend(v6, "addLineToPoint:", v5 + 7.0, 5.0);
    objc_msgSend(v6, "addLineToPoint:", v5 + 7.0, 0.0);
    objc_msgSend(v6, "addLineToPoint:", v5, 0.0);
    double progress = self->_progress;
    if (progress <= (float)((float)i * 0.0625) || progress <= 0.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
      [v9 setFill];

      [v6 fillWithBlendMode:26 alpha:0.3];
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      [v8 setFill];

      [v6 fill];
    }
  }

- (CGSize)intrinsicContentSize
{
  double v2 = 127.0;
  double v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_double progress = a3;
}

@end