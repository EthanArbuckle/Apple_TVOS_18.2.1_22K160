@interface TVPSharedPSActivityBannerView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)_unapplyMotionEffect:(id)a3;
- (BOOL)canBecomeFocused;
- (NSString)bannerTitle;
- (TVPImageStackView)imageStackView;
- (TVPSharedPSActivityBannerFocusDelegate)delegate;
- (TVPSharedPSActivityBannerView)init;
- (UIBezierPath)bannerTitleShadowPath;
- (UIImage)bannerImage;
- (UILabel)bannerTitleLabel;
- (UIMotionEffectGroup)motionEffectGroup;
- (UIView)bannerTitleShadowView;
- (void)_attachMotionEffects;
- (void)_detachMotionEffects;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setBannerImage:(id)a3;
- (void)setBannerTitle:(id)a3;
- (void)setBannerTitleLabel:(id)a3;
- (void)setBannerTitleShadowPath:(id)a3;
- (void)setBannerTitleShadowView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageStackView:(id)a3;
- (void)setMotionEffectGroup:(id)a3;
@end

@implementation TVPSharedPSActivityBannerView

- (TVPSharedPSActivityBannerView)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerView;
  v2 = -[TVPSharedPSActivityBannerView init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[TVPSharedPSActivityBannerView setClipsToBounds:](v2, "setClipsToBounds:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVPSharedPSActivityBannerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage px_imageFromSolidColor:](&OBJC_CLASS___UIImage, "px_imageFromSolidColor:", v5));
    -[TVPSharedPSActivityBannerView setBannerImage:](v3, "setBannerImage:", v6);
  }

  return v3;
}

- (void)setBannerTitle:(id)a3
{
  v4 = (NSString *)a3;
  -[UIView removeFromSuperview](self->_bannerTitleShadowView, "removeFromSuperview");
  bannerTitleShadowView = self->_bannerTitleShadowView;
  self->_bannerTitleShadowView = 0LL;

  -[UILabel removeFromSuperview](self->_bannerTitleLabel, "removeFromSuperview");
  bannerTitleLabel = self->_bannerTitleLabel;
  self->_bannerTitleLabel = 0LL;

  v7 = objc_alloc_init(&OBJC_CLASS___UIView);
  objc_super v8 = self->_bannerTitleShadowView;
  self->_bannerTitleShadowView = v7;

  v9 = objc_alloc_init(&OBJC_CLASS___UILabel);
  v10 = self->_bannerTitleLabel;
  self->_bannerTitleLabel = v9;

  v11 = self->_bannerTitleLabel;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
  -[UILabel setFont:](v11, "setFont:", v12);

  v13 = self->_bannerTitleLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v13, "setTextColor:", v14);

  -[UILabel setNumberOfLines:](self->_bannerTitleLabel, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](self->_bannerTitleLabel, "setTextAlignment:", 1LL);
  v15 = self->_bannerTitleLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[UILabel setText:](self->_bannerTitleLabel, "setText:", v4);
  bannerTitle = self->_bannerTitle;
  self->_bannerTitle = v4;
}

- (void)setBannerImage:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_bannerImage, a3);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v5, "addObject:", v14);
  v6 = -[TVPImageStack initWithImages:](objc_alloc(&OBJC_CLASS___TVPImageStack), "initWithImages:", v5);
  imageStackView = self->_imageStackView;
  if (imageStackView)
  {
    -[TVPImageStackView setImageStack:](imageStackView, "setImageStack:", v6);
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v9 = [v8 scale];
    v11 = +[TVPImageStackView imageStackViewWithImageStack:size:]( &OBJC_CLASS___TVPImageStackView,  "imageStackViewWithImageStack:size:",  v6,  PXSizeScale(v9, 1740.0, 573.0, v10));
    v12 = (TVPImageStackView *)objc_claimAutoreleasedReturnValue(v11);
    v13 = self->_imageStackView;
    self->_imageStackView = v12;

    -[TVPImageStackView setCornerRadius:](self->_imageStackView, "setCornerRadius:", 12.0);
    -[TVPImageStackView _setSelectionStyle:](self->_imageStackView, "_setSelectionStyle:", 1LL);
    -[TVPSharedPSActivityBannerView addSubview:](self, "addSubview:", self->_imageStackView);
  }

  -[TVPSharedPSActivityBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"focusDirectionX"]);
  [v6 doubleValue];
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"focusDirectionY"]);

  [v9 doubleValue];
  double v11 = v10;

  -[TVPImageStackView setFocusDirection:](self->_imageStackView, "setFocusDirection:", v8, v11);
  return 1;
}

- (BOOL)_unapplyMotionEffect:(id)a3
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerView;
  -[TVPSharedPSActivityBannerView pressesBegan:withEvent:](&v18, "pressesBegan:withEvent:", a3, v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allPresses", 0));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ([v13 type] == (id)4 || objc_msgSend(v13, "type") == (id)6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityBannerView imageStackView](self, "imageStackView"));
    [v8 setControlState:9 animated:1];
  }

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerView;
  -[TVPSharedPSActivityBannerView pressesEnded:withEvent:](&v18, "pressesEnded:withEvent:", a3, v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allPresses", 0));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ([v13 type] == (id)4 || objc_msgSend(v13, "type") == (id)6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityBannerView imageStackView](self, "imageStackView"));
    [v8 setControlState:8 animated:1];
  }

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerView;
  -[TVPSharedPSActivityBannerView pressesCancelled:withEvent:](&v18, "pressesCancelled:withEvent:", a3, v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allPresses", 0));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ([v13 type] == (id)4 || objc_msgSend(v13, "type") == (id)6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityBannerView imageStackView](self, "imageStackView"));
    [v8 setControlState:8 animated:1];
  }

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  unsigned int v5 = -[TVPSharedPSActivityBannerView isFocused](self, "isFocused");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v7 = WeakRetained;
  if (v5)
  {
    char v8 = objc_opt_respondsToSelector(WeakRetained, "didFocusBannerView:");

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 didFocusBannerView:self];

    -[TVPSharedPSActivityBannerView _attachMotionEffects](self, "_attachMotionEffects");
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityBannerView superview](self, "superview"));
    [v12 bringSubviewToFront:self];
  }

  else
  {
    int v10 = objc_opt_respondsToSelector(WeakRetained, "didUnfocusBannerView:");

    if ((v10 & 1) == 0) {
      return;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 didUnfocusBannerView:self];

    -[TVPSharedPSActivityBannerView _detachMotionEffects](self, "_detachMotionEffects");
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityBannerView superview](self, "superview"));
    [v12 sendSubviewToBack:self];
  }
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerView;
  -[TVPSharedPSActivityBannerView layoutSubviews](&v44, "layoutSubviews");
  imageStackView = self->_imageStackView;
  -[TVPSharedPSActivityBannerView bounds](self, "bounds");
  -[TVPImageStackView setFrame:](imageStackView, "setFrame:");
  BOOL v5 = -[TVPSharedPSActivityBannerView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection") == (id)1;
  id v6 = objc_alloc(&OBJC_CLASS___UIView);
  -[TVPImageStackView bounds](self->_imageStackView, "bounds");
  double v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
  -[UIView addSubview:](v7, "addSubview:", self->_bannerTitleShadowView);
  -[UIView addSubview:](v7, "addSubview:", self->_bannerTitleLabel);
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_bannerTitleLabel, "text"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
  -[TVPSharedPSActivityBannerView bounds](self, "bounds");
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v8,  v9,  v10);
  double v12 = v11;
  double v14 = v13;

  -[TVPSharedPSActivityBannerView bounds](self, "bounds");
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  double v22 = v21;
  double v33 = v21 - (v14 + 26.0);
  double v34 = v21 - (v14 + 66.0);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10004F254;
  v35[3] = &unk_1000CBA40;
  v23 = v7;
  v37 = self;
  SEL v38 = a2;
  v36 = v23;
  BOOL v43 = v5;
  uint64_t v39 = v16;
  uint64_t v40 = v18;
  uint64_t v41 = v20;
  double v42 = v22;
  v24 = objc_retainBlock(v35);
  ((void (*)(void *, UILabel *, double, double, double, double))v24[2])( v24,  self->_bannerTitleLabel,  40.0,  v33,  v12,  v14);
  ((void (*)(void *, UIView *, double, double, double, double))v24[2])( v24,  self->_bannerTitleShadowView,  -(v12 + 120.0),  v34,  v12 + 120.0 + v12 + 120.0,  v14 + 66.0 + v14 + 66.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_bannerTitleShadowView, "layer"));
  id v26 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  objc_msgSend(v25, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_bannerTitleShadowView, "layer"));
  LODWORD(v28) = 1045220557;
  [v27 setShadowOpacity:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_bannerTitleShadowView, "layer"));
  [v29 setShadowRadius:20.0];

  if (!self->_bannerTitleShadowPath)
  {
    -[UIView bounds](self->_bannerTitleShadowView, "bounds");
    v30 = (UIBezierPath *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithOvalInRect:"));
    bannerTitleShadowPath = self->_bannerTitleShadowPath;
    self->_bannerTitleShadowPath = v30;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_bannerTitleShadowView, "layer", *(void *)&v33));
  objc_msgSend(v32, "setShadowPath:", -[UIBezierPath CGPath](self->_bannerTitleShadowPath, "CGPath"));

  -[TVPImageStackView setOverlayView:](self->_imageStackView, "setOverlayView:", v23);
}

- (void)_attachMotionEffects
{
  motionEffectGroup = self->_motionEffectGroup;
  if (!motionEffectGroup)
  {
    v4 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionX",  0LL);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v4, "setMinimumRelativeValue:", &off_1000D1E88);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v4, "setMaximumRelativeValue:", &off_1000D1E98);
    BOOL v5 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionY",  1LL);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v5, "setMinimumRelativeValue:", &off_1000D1E88);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v5, "setMaximumRelativeValue:", &off_1000D1E98);
    id v6 = objc_alloc_init(&OBJC_CLASS___UIMotionEffectGroup);
    double v7 = self->_motionEffectGroup;
    self->_motionEffectGroup = v6;

    char v8 = self->_motionEffectGroup;
    v10[0] = v4;
    v10[1] = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    -[UIMotionEffectGroup setMotionEffects:](v8, "setMotionEffects:", v9);

    motionEffectGroup = self->_motionEffectGroup;
  }

  -[TVPSharedPSActivityBannerView addMotionEffect:](self, "addMotionEffect:", motionEffectGroup);
}

- (void)_detachMotionEffects
{
}

- (NSString)bannerTitle
{
  return self->_bannerTitle;
}

- (UIImage)bannerImage
{
  return self->_bannerImage;
}

- (TVPSharedPSActivityBannerFocusDelegate)delegate
{
  return (TVPSharedPSActivityBannerFocusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)bannerTitleLabel
{
  return self->_bannerTitleLabel;
}

- (void)setBannerTitleLabel:(id)a3
{
}

- (UIView)bannerTitleShadowView
{
  return self->_bannerTitleShadowView;
}

- (void)setBannerTitleShadowView:(id)a3
{
}

- (UIBezierPath)bannerTitleShadowPath
{
  return self->_bannerTitleShadowPath;
}

- (void)setBannerTitleShadowPath:(id)a3
{
}

- (TVPImageStackView)imageStackView
{
  return self->_imageStackView;
}

- (void)setImageStackView:(id)a3
{
}

- (UIMotionEffectGroup)motionEffectGroup
{
  return self->_motionEffectGroup;
}

- (void)setMotionEffectGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end