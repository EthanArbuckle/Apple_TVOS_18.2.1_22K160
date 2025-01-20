@interface TVHVibrantLabelView
+ (TVHVibrantLabelView)vibrantLabelViewWithLabel:(id)a3;
@end

@implementation TVHVibrantLabelView

+ (TVHVibrantLabelView)vibrantLabelViewWithLabel:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v4));

  v6 = -[TVHVibrantLabelView initWithEffect:](objc_alloc(&OBJC_CLASS___TVHVibrantLabelView), "initWithEffect:", v5);
  -[TVHVisualEffectLabelView setLabel:](v6, "setLabel:", v3);

  return v6;
}

@end