@interface SCATATVMenuPageControl
- (BOOL)scatIndicatesOwnFocus;
- (SCATATVMenuPageControl)initWithFrame:(CGRect)a3;
- (void)_updateAppearanceForStyle:(unint64_t)a3;
- (void)didUpdateScatMenuItemStyle;
@end

@implementation SCATATVMenuPageControl

- (SCATATVMenuPageControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATATVMenuPageControl;
  v3 = -[SCATATVMenuPageControl initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[SCATATVMenuPageControl _updateAppearanceForStyle:](v3, "_updateAppearanceForStyle:", 1LL);
  }
  return v4;
}

- (void)_updateAppearanceForStyle:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  id v12 = v5;
  if (a3 == 2)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 atvMenuFocusedItemColor]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 colorWithAlphaComponent:0.75]);
    -[SCATATVMenuPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 atvMenuFocusedItemColor]);
    -[SCATATVMenuPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", v9);

    -[SCATATVMenuPageControl _setDrawsAsBackdropOverlay:](self, "_setDrawsAsBackdropOverlay:", 0LL);
    -[SCATATVMenuPageControl setAlpha:](self, "setAlpha:", 1.0);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 menuKnockoutColor]);
    -[SCATATVMenuPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v12 menuKnockoutColor]);
    -[SCATATVMenuPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", v11);

    -[SCATATVMenuPageControl _setDrawsAsBackdropOverlayWithBlendMode:]( self,  "_setDrawsAsBackdropOverlayWithBlendMode:",  [v12 menuKnockoutBorderOverlayBlendMode]);
    [v12 menuKnockoutBorderOpacity];
    -[SCATATVMenuPageControl setAlpha:](self, "setAlpha:");
  }

- (void)didUpdateScatMenuItemStyle
{
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

@end