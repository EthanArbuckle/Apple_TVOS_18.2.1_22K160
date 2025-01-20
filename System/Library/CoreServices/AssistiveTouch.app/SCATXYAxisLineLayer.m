@interface SCATXYAxisLineLayer
- (BOOL)isActive;
- (id)_backgroundColorForTheme:(int)a3;
- (id)_foregroundColorForTheme:(int)a3;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
@end

@implementation SCATXYAxisLineLayer

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SCATXYAxisLineLayer;
  -[SCATAxisLayer updateTheme:animated:](&v17, "updateTheme:animated:");
  if (!a4)
  {
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  }

  id v7 = objc_claimAutoreleasedReturnValue( -[SCATXYAxisLineLayer _foregroundColorForTheme:]( self, "_foregroundColorForTheme:", v5));
  -[SCATAxisLayer setBackgroundColor:](self, "setBackgroundColor:", [v7 CGColor]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
  -[SCATXYAxisLineLayer setCompositingFilter:](self, "setCompositingFilter:", v8);

  id v9 = objc_claimAutoreleasedReturnValue( -[SCATXYAxisLineLayer _backgroundColorForTheme:]( self, "_backgroundColorForTheme:", v5));
  id v10 = [v9 CGColor];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  [v11 setBackgroundColor:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  uint64_t v13 = kCAFilterPlusD;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
  [v12 setCompositingFilter:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v13));
  [v15 setCompositingFilter:v16];

  if (!a4) {
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }
}

- (id)_backgroundColorForTheme:(int)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = [v3 assistiveTouchCursorColor];

    uint64_t v5 = +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", AXSAssistiveTouchCursorColor(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  return v6;
}

- (id)_foregroundColorForTheme:(int)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = [v3 assistiveTouchCursorColor];

    uint64_t v5 = +[UIColor colorWithCGColor:](&OBJC_CLASS___UIColor, "colorWithCGColor:", AXSAssistiveTouchCursorColor(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  return v6;
}

- (BOOL)isActive
{
  return (-[SCATAxisLayer theme](self, "theme") & 0xFFFFFFFD) != 0;
}

@end