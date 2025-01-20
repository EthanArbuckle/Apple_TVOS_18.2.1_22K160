@interface AXSettings
- (BOOL)differentiateWithoutColorEnabled;
- (BOOL)increasedContrastEnabled;
- (HTUITaggedColor)hoverTextBackgroundColor;
- (HTUITaggedColor)hoverTextBorderColor;
- (HTUITaggedColor)hoverTextTextColor;
- (void)setDifferentiateWithoutColorEnabled:(BOOL)a3;
- (void)setHoverTextBackgroundColor:(id)a3;
- (void)setHoverTextBorderColor:(id)a3;
- (void)setHoverTextTextColor:(id)a3;
- (void)setIncreasedContrastEnabled:(BOOL)a3;
@end

@implementation AXSettings

- (HTUITaggedColor)hoverTextTextColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hoverTextTextColorData]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTUITaggedColor makeFromData:](&OBJC_CLASS___HTUITaggedColor, "makeFromData:", v3));
  return (HTUITaggedColor *)v4;
}

- (void)setHoverTextTextColor:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 dataRepresentation]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextTextColorData:v4];
}

- (HTUITaggedColor)hoverTextBackgroundColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hoverTextBackgroundColorData]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTUITaggedColor makeFromData:](&OBJC_CLASS___HTUITaggedColor, "makeFromData:", v3));
  return (HTUITaggedColor *)v4;
}

- (void)setHoverTextBackgroundColor:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 dataRepresentation]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextBackgroundColorData:v4];
}

- (HTUITaggedColor)hoverTextBorderColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hoverTextBorderColorData]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTUITaggedColor makeFromData:](&OBJC_CLASS___HTUITaggedColor, "makeFromData:", v3));
  return (HTUITaggedColor *)v4;
}

- (void)setHoverTextBorderColor:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 dataRepresentation]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextBorderColorData:v4];
}

- (BOOL)increasedContrastEnabled
{
  return _AXDarkenSystemColorsGlobal(self, a2) != 0;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
}

- (BOOL)differentiateWithoutColorEnabled
{
  return _AXSDifferentiateWithoutColorEnabledGlobal(self, a2) != 0;
}

- (void)setDifferentiateWithoutColorEnabled:(BOOL)a3
{
}

@end