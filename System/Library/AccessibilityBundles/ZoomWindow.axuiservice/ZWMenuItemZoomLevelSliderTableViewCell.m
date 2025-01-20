@interface ZWMenuItemZoomLevelSliderTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIImageView)zoomInImageView;
- (UIImageView)zoomOutImageView;
- (UISlider)zoomLevelSlider;
- (ZWMenuItemZoomLevelSliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setZoomInImageView:(id)a3;
- (void)setZoomLevelSlider:(id)a3;
- (void)setZoomOutImageView:(id)a3;
@end

@implementation ZWMenuItemZoomLevelSliderTableViewCell

- (ZWMenuItemZoomLevelSliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___ZWMenuItemZoomLevelSliderTableViewCell;
  v4 = -[ZWMenuItemZoomLevelSliderTableViewCell initWithStyle:reuseIdentifier:]( &v30,  "initWithStyle:reuseIdentifier:",  a3,  a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"minus.magnifyingglass"));
    v8 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIImageView setTintColor:](v8, "setTintColor:", v9);

    [v6 addSubview:v8];
    -[ZWMenuItemZoomLevelSliderTableViewCell setZoomOutImageView:](v5, "setZoomOutImageView:", v8);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"plus.magnifyingglass"));

    v11 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIImageView setTintColor:](v11, "setTintColor:", v12);

    [v6 addSubview:v11];
    -[ZWMenuItemZoomLevelSliderTableViewCell setZoomInImageView:](v5, "setZoomInImageView:", v11);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v11,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v13 = -[UISlider initWithFrame:]( objc_alloc(&OBJC_CLASS___UISlider),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UISlider setMinimumTrackTintColor:](v13, "setMinimumTrackTintColor:", v14);

    [v6 addSubview:v13];
    -[ZWMenuItemZoomLevelSliderTableViewCell setZoomLevelSlider:](v5, "setZoomLevelSlider:", v13);
    id v15 = ZWLocString(@"ZW_MENU_SLIDER_ZOOM_LEVEL");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[UISlider setAccessibilityLabel:](v13, "setAccessibilityLabel:", v16);

    -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    v17 = _NSDictionaryOfVariableBindings(@"zoomOutImageView, zoomInImageView, slider", v8, v11, v13, 0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|-xEdgePadding-[zoomOutImageView]-xSliderPadding-[slider]-xSliderPadding-[zoomInImageView]-xEdgePadding-|",  0LL,  &off_6F3E0,  v18));
    [v6 addConstraints:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  10LL,  0LL,  v6,  10LL,  1.0,  0.0));
    [v6 addConstraint:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  4LL,  0LL,  v6,  4LL,  1.0,  -12.0));
    [v6 addConstraint:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  4LL,  0LL,  v6,  4LL,  1.0,  -12.0));
    [v6 addConstraint:v22];

    BOOL v23 = ZWUseVibrantBlendModes();
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomLevelSlider](v5, "zoomLevelSlider"));
    v25 = v24;
    if (v23)
    {
      [v24 _setDrawsAsBackdropOverlayWithBlendMode:3];

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomInImageView](v5, "zoomInImageView"));
      [v26 _setDrawsAsBackdropOverlayWithBlendMode:3];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomOutImageView](v5, "zoomOutImageView"));
      [v27 _setDrawsAsBackdropOverlayWithBlendMode:3];
    }

    else
    {
      [v24 _setDrawsAsBackdropOverlay:0];

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomInImageView](v5, "zoomInImageView"));
      [v28 _setDrawsAsBackdropOverlay:0];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomOutImageView](v5, "zoomOutImageView"));
      [v27 _setDrawsAsBackdropOverlay:0];
    }

    -[ZWMenuItemZoomLevelSliderTableViewCell setAccessibilityIgnoresInvertColors:]( v5,  "setAccessibilityIgnoresInvertColors:",  1LL);
  }

  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = 44.0;
  result.height = v5;
  return result;
}

- (UISlider)zoomLevelSlider
{
  return self->_zoomLevelSlider;
}

- (void)setZoomLevelSlider:(id)a3
{
}

- (UIImageView)zoomOutImageView
{
  return self->_zoomOutImageView;
}

- (void)setZoomOutImageView:(id)a3
{
}

- (UIImageView)zoomInImageView
{
  return self->_zoomInImageView;
}

- (void)setZoomInImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end