@interface SCATMenuLabel
+ (id)titleFont;
- (SCATMenuLabel)init;
- (void)didUpdateScatMenuItemStyle;
@end

@implementation SCATMenuLabel

- (SCATMenuLabel)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATMenuLabel;
  v2 = -[SCATMenuLabel init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    -[SCATMenuLabel setAdjustsFontForContentSizeCategory:](v2, "setAdjustsFontForContentSizeCategory:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[SCATMenuLabel setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[SCATMenuLabel setTextColor:](v3, "setTextColor:", v5);

    -[SCATMenuLabel setNumberOfLines:](v3, "setNumberOfLines:", 2LL);
    -[SCATMenuLabel setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[SCATMenuLabel setMinimumScaleFactor:](v3, "setMinimumScaleFactor:", 0.75);
    -[SCATMenuLabel setBaselineAdjustment:](v3, "setBaselineAdjustment:", 0LL);
    -[SCATMenuLabel setLineBreakMode:](v3, "setLineBreakMode:", 4LL);
    -[SCATMenuLabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
    LODWORD(v6) = 0.25;
    -[SCATMenuLabel _setHyphenationFactor:](v3, "_setHyphenationFactor:", v6);
    *(void *)&double v8 = objc_opt_class(v3, v7).n128_u64[0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleFont", v8));
    -[SCATMenuLabel setFont:](v3, "setFont:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[SCATMenuLabel setTextColor:](v3, "setTextColor:", v11);
  }

  return v3;
}

+ (id)titleFont
{
  if (UIAccessibilityIsBoldTextEnabled()) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 26.0));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 26.0));
  }
  return v2;
}

- (void)didUpdateScatMenuItemStyle
{
  unint64_t v3 = (unint64_t)-[SCATMenuLabel scatMenuItemStyle](self, "scatMenuItemStyle");
  if (v3 <= 4)
  {
    if (((1LL << v3) & 0x15) != 0)
    {
      -[SCATMenuLabel setAlpha:](self, "setAlpha:", 1.0);
      -[SCATMenuLabel _setDrawsAsBackdropOverlayWithBlendMode:](self, "_setDrawsAsBackdropOverlayWithBlendMode:", 0LL);
    }

    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      [v4 menuKnockoutBorderOpacity];
      -[SCATMenuLabel setAlpha:](self, "setAlpha:");

      id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
      -[SCATMenuLabel _setDrawsAsBackdropOverlayWithBlendMode:]( self,  "_setDrawsAsBackdropOverlayWithBlendMode:",  [v5 menuKnockoutBorderOverlayBlendMode]);
    }
  }

@end