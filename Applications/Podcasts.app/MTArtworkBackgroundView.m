@interface MTArtworkBackgroundView
- (BOOL)useLightStyle;
- (CAGradientLayer)gradientLayer;
- (MTArtworkBackgroundView)init;
- (MTArtworkBackgroundView)initWithArtwork:(id)a3 blendColor:(id)a4;
- (UIColor)blendColor;
- (UIImage)artwork;
- (UIImage)blurredArtwork;
- (UIImageView)artworkView;
- (UIView)colorView;
- (UIView)fadeView;
- (double)fadeHeight;
- (id)_blurredImageForImage:(id)a3;
- (void)_updateGradientColors;
- (void)layoutSubviews;
- (void)setArtwork:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setBlendColor:(id)a3;
- (void)setBlurredArtwork:(id)a3;
- (void)setColorView:(id)a3;
- (void)setFadeHeight:(double)a3;
- (void)setFadeView:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setUseLightStyle:(BOOL)a3;
@end

@implementation MTArtworkBackgroundView

- (MTArtworkBackgroundView)init
{
  return -[MTArtworkBackgroundView initWithArtwork:blendColor:](self, "initWithArtwork:blendColor:", 0LL, 0LL);
}

- (MTArtworkBackgroundView)initWithArtwork:(id)a3 blendColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTArtworkBackgroundView;
  v8 = -[MTArtworkBackgroundView init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    -[MTArtworkBackgroundView setArtwork:](v8, "setArtwork:", v6);
    -[MTArtworkBackgroundView setBlendColor:](v9, "setBlendColor:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView artworkView](v9, "artworkView"));
    -[MTArtworkBackgroundView addSubview:](v9, "addSubview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView colorView](v9, "colorView"));
    -[MTArtworkBackgroundView addSubview:](v9, "addSubview:", v11);

    -[MTArtworkBackgroundView setClipsToBounds:](v9, "setClipsToBounds:", 1LL);
  }

  return v9;
}

- (void)setArtwork:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView _blurredImageForImage:](self, "_blurredImageForImage:", v5));

  -[MTArtworkBackgroundView setBlurredArtwork:](self, "setBlurredArtwork:", v6);
}

- (void)setBlendColor:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView colorView](self, "colorView"));
  [v6 setBackgroundColor:v5];

  -[MTArtworkBackgroundView _updateGradientColors](self, "_updateGradientColors");
}

- (void)setFadeHeight:(double)a3
{
  if (self->_fadeHeight != a3)
  {
    self->_fadeHeight = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView fadeView](self, "fadeView"));
    id v6 = v5;
    if (a3 == 0.0)
    {
      [v5 removeFromSuperview];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

      if (v7) {
        goto LABEL_7;
      }
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView fadeView](self, "fadeView"));
      -[MTArtworkBackgroundView addSubview:](self, "addSubview:", v6);
    }

LABEL_7:
    -[MTArtworkBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setBlurredArtwork:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView artworkView](self, "artworkView"));
  [v6 setImage:v5];
}

- (id)_blurredImageForImage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  2020LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 _applyBackdropViewSettings:v4 includeTints:1 includeBlur:1 allowImageResizing:0]);

  return v5;
}

- (void)_updateGradientColors
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView blendColor](self, "blendColor"));
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  id v6 = v5;

  id v7 = objc_claimAutoreleasedReturnValue([v6 colorWithAlphaComponent:0.0]);
  v11[0] = [v7 CGColor];
  id v8 = v6;
  v11[1] = [v8 CGColor];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView gradientLayer](self, "gradientLayer"));
  [v10 setColors:v9];
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView artworkView](self, "artworkView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[MTArtworkBackgroundView bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView colorView](self, "colorView"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[MTArtworkBackgroundView bounds](self, "bounds");
  double Width = CGRectGetWidth(v38);
  -[MTArtworkBackgroundView fadeHeight](self, "fadeHeight");
  double v23 = v22;
  -[MTArtworkBackgroundView bounds](self, "bounds");
  double Height = CGRectGetHeight(v39);
  -[MTArtworkBackgroundView fadeHeight](self, "fadeHeight");
  double v26 = Height - v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView fadeView](self, "fadeView"));
  objc_msgSend(v27, "setFrame:", CGRectZero.origin.x, v26, Width, v23);

  id v37 = (id)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView fadeView](self, "fadeView"));
  [v37 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView gradientLayer](self, "gradientLayer"));
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);
}

- (UIImageView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    double v5 = self->_artworkView;
    self->_artworkView = v4;

    -[UIImageView setContentMode:](self->_artworkView, "setContentMode:", 2LL);
    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (UIView)colorView
{
  colorView = self->_colorView;
  if (!colorView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIView);
    double v5 = self->_colorView;
    self->_colorView = v4;

    -[UIView setAlpha:](self->_colorView, "setAlpha:", 0.620000005);
    colorView = self->_colorView;
  }

  return colorView;
}

- (UIView)fadeView
{
  fadeView = self->_fadeView;
  if (!fadeView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIView);
    double v5 = self->_fadeView;
    self->_fadeView = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fadeView, "layer"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkBackgroundView gradientLayer](self, "gradientLayer"));
    [v6 insertSublayer:v7 atIndex:0];

    fadeView = self->_fadeView;
  }

  return fadeView;
}

- (CAGradientLayer)gradientLayer
{
  gradientLayer = self->_gradientLayer;
  if (!gradientLayer)
  {
    double v4 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer"));
    double v5 = self->_gradientLayer;
    self->_gradientLayer = v4;

    -[MTArtworkBackgroundView _updateGradientColors](self, "_updateGradientColors");
    gradientLayer = self->_gradientLayer;
  }

  return gradientLayer;
}

- (UIImage)artwork
{
  return self->_artwork;
}

- (UIColor)blendColor
{
  return self->_blendColor;
}

- (BOOL)useLightStyle
{
  return self->_useLightStyle;
}

- (void)setUseLightStyle:(BOOL)a3
{
  self->_useLightStyle = a3;
}

- (double)fadeHeight
{
  return self->_fadeHeight;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setColorView:(id)a3
{
}

- (void)setFadeView:(id)a3
{
}

- (UIImage)blurredArtwork
{
  return self->_blurredArtwork;
}

- (void)setGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end