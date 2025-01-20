@interface TVHLockupLabel
- (BOOL)isAncestorFocused;
- (TVHLockupLabel)initWithFrame:(CGRect)a3;
- (UIColor)focusedDynamicColor;
- (UIColor)unfocusedDynamicColor;
- (void)_updateShadowInFocus:(BOOL)a3;
- (void)_updateTextColors;
- (void)setAncestorFocused:(BOOL)a3;
- (void)setFocusedDynamicColor:(id)a3;
- (void)setUnfocusedDynamicColor:(id)a3;
- (void)updateAppearanceForLockupState:(unint64_t)a3;
@end

@implementation TVHLockupLabel

- (TVHLockupLabel)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHLockupLabel;
  v3 = -[TVHLockupLabel initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[TVHLockupLabel setFont:](v3, "setFont:", v4);

    -[TVHLockupLabel setNumberOfLines:](v3, "setNumberOfLines:", 1LL);
    -[TVHLockupLabel setLineBreakMode:](v3, "setLineBreakMode:", 4LL);
    -[TVHLockupLabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVHLockupLabel setBackgroundColor:](v3, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v6,  v7));
    focusedDynamicColor = v3->_focusedDynamicColor;
    v3->_focusedDynamicColor = (UIColor *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_50PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_50PercentWhiteColor"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v10,  v11));
    unfocusedDynamicColor = v3->_unfocusedDynamicColor;
    v3->_unfocusedDynamicColor = (UIColor *)v12;

    -[TVHLockupLabel _updateTextColors](v3, "_updateTextColors");
  }

  return v3;
}

- (void)setFocusedDynamicColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_focusedDynamicColor, "isEqual:") & 1) == 0)
  {
    v4 = (UIColor *)[v6 copy];
    focusedDynamicColor = self->_focusedDynamicColor;
    self->_focusedDynamicColor = v4;

    -[TVHLockupLabel _updateTextColors](self, "_updateTextColors");
  }
}

- (void)setUnfocusedDynamicColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_unfocusedDynamicColor, "isEqual:") & 1) == 0)
  {
    v4 = (UIColor *)[v6 copy];
    unfocusedDynamicColor = self->_unfocusedDynamicColor;
    self->_unfocusedDynamicColor = v4;

    -[TVHLockupLabel _updateTextColors](self, "_updateTextColors");
  }
}

- (void)updateAppearanceForLockupState:(unint64_t)a3
{
  unint64_t v4 = (a3 >> 3) & 1;
  -[TVHLockupLabel setAncestorFocused:](self, "setAncestorFocused:", v4);
  -[TVHLockupLabel _updateTextColors](self, "_updateTextColors");
  -[TVHLockupLabel _updateShadowInFocus:](self, "_updateShadowInFocus:", v4);
  -[TVHLockupLabel tvh_updateMarqueeWithFocus:](self, "tvh_updateMarqueeWithFocus:", v4);
}

- (void)_updateTextColors
{
  if (-[TVHLockupLabel isAncestorFocused](self, "isAncestorFocused")) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHLockupLabel focusedDynamicColor](self, "focusedDynamicColor"));
  }
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHLockupLabel unfocusedDynamicColor](self, "unfocusedDynamicColor"));
  }
  id v4 = (id)v3;
  -[TVHLockupLabel setTextColor:](self, "setTextColor:", v3);
}

- (void)_updateShadowInFocus:(BOOL)a3
{
  if (a3)
  {
    id v4 = (void *)qword_100157320;
    if (!qword_100157320)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
      id v6 = (void *)qword_100157320;
      qword_100157320 = v5;

      id v4 = (void *)qword_100157320;
    }

    id v7 = v4;
    double height = 2.0;
    double v9 = 6.0;
    double width = 0.0;
  }

  else
  {
    id v7 = 0LL;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v9 = 0.0;
  }

  id v11 = v7;
  -[TVHLockupLabel setShadowColor:](self, "setShadowColor:", v7);
  -[TVHLockupLabel setShadowOffset:](self, "setShadowOffset:", width, height);
  -[TVHLockupLabel setShadowBlur:](self, "setShadowBlur:", v9);
}

- (UIColor)focusedDynamicColor
{
  return self->_focusedDynamicColor;
}

- (UIColor)unfocusedDynamicColor
{
  return self->_unfocusedDynamicColor;
}

- (BOOL)isAncestorFocused
{
  return self->_ancestorFocused;
}

- (void)setAncestorFocused:(BOOL)a3
{
  self->_ancestorFocused = a3;
}

- (void).cxx_destruct
{
}

@end