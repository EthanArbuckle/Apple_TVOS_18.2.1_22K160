@interface IMTVVibrantLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (IMTVVibrantLabel)initWithBlurEffectStyle:(int64_t)a3;
- (IMTVVibrantLabel)initWithLabel:(id)a3 blurEffectStyle:(int64_t)a4;
- (UILabel)label;
- (int64_t)blurEffectStyle;
- (void)layoutSubviews;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setLabel:(id)a3;
@end

@implementation IMTVVibrantLabel

- (IMTVVibrantLabel)initWithBlurEffectStyle:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v5));
  v7 = -[IMTVVibrantLabel initWithEffect:](self, "initWithEffect:", v6);
  v8 = v7;
  if (v7) {
    -[IMTVVibrantLabel setBlurEffectStyle:](v7, "setBlurEffectStyle:", a3);
  }

  return v8;
}

- (IMTVVibrantLabel)initWithLabel:(id)a3 blurEffectStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = -[IMTVVibrantLabel initWithBlurEffectStyle:](self, "initWithBlurEffectStyle:", a4);
  v8 = v7;
  if (v7) {
    -[IMTVVibrantLabel setLabel:](v7, "setLabel:", v6);
  }

  return v8;
}

- (void)setLabel:(id)a3
{
  v5 = (UILabel *)a3;
  p_label = &self->_label;
  label = self->_label;
  v11 = v5;
  if (label != v5)
  {
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    objc_storeStrong((id *)&self->_label, a3);
    if (*p_label)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVVibrantLabel contentView](self, "contentView"));
      [v8 addSubview:*p_label];

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _idleModeLayoutAttributes](*p_label, "_idleModeLayoutAttributes"));
      if (!v9)
      {
        v10 = (void *)objc_opt_new(&OBJC_CLASS____UIIdleModeLayoutAttributes);
        [v10 setAlphaOffset:-0.75];
        -[UILabel _setIdleModeLayoutAttributes:](*p_label, "_setIdleModeLayoutAttributes:", v10);
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  label = self->_label;
  -[IMTVVibrantLabel bounds](self, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
}

- (UILabel)label
{
  return self->_label;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (void).cxx_destruct
{
}

@end