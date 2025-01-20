@interface VibrantLabel
- (VibrantLabel)initWithFrame:(CGRect)a3;
@end

@implementation VibrantLabel

- (VibrantLabel)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VibrantLabel;
  v3 = -[VibrantLabel initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VibrantLabel layer](v3, "layer"));
    [v5 setCompositingFilter:kCAFilterPlusL];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 colorWithAlphaComponent:0.85]);
    -[VibrantLabel setTextColor:](v4, "setTextColor:", v7);
  }

  return v4;
}

@end