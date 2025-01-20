@interface TVHButtonLockupContentView
+ (id)_label;
+ (id)_labelForVibrancy;
+ (id)init;
- (CALayer)imageMask;
- (CGSize)_imageViewSizeWithMaxSize:(CGSize)a3;
- (NSString)title;
- (TVHButtonLockupContentView)init;
- (TVHButtonLockupContentView)initWithButtonLayout:(id)a3;
- (TVHButtonLockupContentView)initWithCoder:(id)a3;
- (TVHButtonLockupContentView)initWithFrame:(CGRect)a3;
- (TVHButtonLockupLayout)layout;
- (TVHVibrantLabelView)titleVibrantLabelView;
- (UIColor)titleTextColor;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)overlayView;
- (UIVisualEffectView)backdropEffectView;
- (_UIFloatingContentView)floatingContentView;
- (double)focusedSizeIncrease;
- (double)heightForTitleLabelForButtonLockupLayout:(id)a3;
- (void)_updateAppearanceForFocusedState:(BOOL)a3;
- (void)_updateImageMask;
- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageMask:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleVibrantLabelView:(id)a3;
- (void)updateAppearanceForLockupState:(unint64_t)a3;
- (void)updateHighConstrastAppearanceWithLockupState:(unint64_t)a3;
@end

@implementation TVHButtonLockupContentView

+ (id)init
{
  return 0LL;
}

- (TVHButtonLockupContentView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHButtonLockupContentView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHButtonLockupContentView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHButtonLockupContentView)initWithButtonLayout:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVHButtonLockupContentView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[TVHButtonLockupContentView initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    -[TVHButtonLockupLayout setDelegate:](v10->_layout, "setDelegate:", v10);
    v11 = -[_UIFloatingContentView initWithFrame:]( objc_alloc(&OBJC_CLASS____UIFloatingContentView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    floatingContentView = v10->_floatingContentView;
    v10->_floatingContentView = v11;

    -[_UIFloatingContentView setBackgroundColor:forState:]( v10->_floatingContentView,  "setBackgroundColor:forState:",  0LL,  8LL);
    -[_UIFloatingContentView setBackgroundColor:forState:]( v10->_floatingContentView,  "setBackgroundColor:forState:",  0LL,  1LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v10->_floatingContentView, "setFocusedSizeIncrease:", 14.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v10->_floatingContentView,  "setContentMotionRotation:translation:",  0.0,  0.0,  8.0,  0.0);
    -[_UIFloatingContentView setFocusScaleAnchorPoint:]( v10->_floatingContentView,  "setFocusScaleAnchorPoint:",  0.5,  1.0);
    -[_UIFloatingContentView setShadowRadius:](v10->_floatingContentView, "setShadowRadius:", 30.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v10->_floatingContentView, "setShadowVerticalOffset:", 15.0);
    -[_UIFloatingContentView setShadowOpacity:](v10->_floatingContentView, "setShadowOpacity:", 0.25);
    -[_UIFloatingContentView setCornerRadius:](v10->_floatingContentView, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v10->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    -[_UIFloatingContentView setVisualEffectContainerViewScaleFactor:]( v10->_floatingContentView,  "setVisualEffectContainerViewScaleFactor:",  0.988);
    -[_UIFloatingContentView tvh_setDebugLayoutColorType:]( v10->_floatingContentView,  "tvh_setDebugLayoutColorType:",  8LL);
    -[TVHButtonLockupContentView addSubview:](v10, "addSubview:", v10->_floatingContentView);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:]( &OBJC_CLASS___UIBlurEffect,  "_effectWithStyle:invertAutomaticStyle:",  5001LL,  1LL));
    v14 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v13);
    backdropEffectView = v10->_backdropEffectView;
    v10->_backdropEffectView = v14;

    -[UIVisualEffectView _setContinuousCornerRadius:](v10->_backdropEffectView, "_setContinuousCornerRadius:", 12.0);
    -[UIVisualEffectView tvh_setDebugLayoutColorType:](v10->_backdropEffectView, "tvh_setDebugLayoutColorType:", 6LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v10->_floatingContentView,  "visualEffectContainerView"));
    [v16 addSubview:v10->_backdropEffectView];

    v17 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    overlayView = v10->_overlayView;
    v10->_overlayView = v17;

    -[UIView setUserInteractionEnabled:](v10->_overlayView, "setUserInteractionEnabled:", 0LL);
    v19 = v10->_overlayView;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIView setAlpha:](v10->_overlayView, "setAlpha:", 0.0);
    -[UIView _setContinuousCornerRadius:](v10->_overlayView, "_setContinuousCornerRadius:", 12.0);
    -[UIView tvh_setDebugLayoutColorType:](v10->_overlayView, "tvh_setDebugLayoutColorType:", 11LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingContentView, "contentView"));
    [v21 addSubview:v10->_overlayView];

    v22 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v10->_imageView;
    v10->_imageView = v22;

    -[UIImageView setContentMode:](v10->_imageView, "setContentMode:", 1LL);
    v24 = v10->_imageView;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithTextStyle:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:scale:",  UIFontTextStyleBody,  3LL));
    -[UIImageView setPreferredSymbolConfiguration:](v24, "setPreferredSymbolConfiguration:", v25);

    -[UIImageView tvh_setDebugLayoutColorType:](v10->_imageView, "tvh_setDebugLayoutColorType:", 13LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingContentView, "contentView"));
    [v26 insertSubview:v10->_imageView below:v10->_overlayView];

    if ([v5 type])
    {
      id v27 = [(id)objc_opt_class(v10) _label];
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      titleLabel = v10->_titleLabel;
      v10->_titleLabel = (UILabel *)v28;

      -[UILabel tvh_setDebugLayoutColorType:](v10->_titleLabel, "tvh_setDebugLayoutColorType:", 10LL);
      -[TVHButtonLockupContentView addSubview:](v10, "addSubview:", v10->_titleLabel);
      id v30 = [(id)objc_opt_class(v10) _labelForVibrancy];
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[TVHVibrantLabelView vibrantLabelViewWithLabel:]( &OBJC_CLASS___TVHVibrantLabelView,  "vibrantLabelViewWithLabel:",  v31));
      titleVibrantLabelView = v10->_titleVibrantLabelView;
      v10->_titleVibrantLabelView = (TVHVibrantLabelView *)v32;

      -[TVHVibrantLabelView tvh_setDebugLayoutColorType:]( v10->_titleVibrantLabelView,  "tvh_setDebugLayoutColorType:",  13LL);
      -[TVHButtonLockupContentView addSubview:](v10, "addSubview:", v10->_titleVibrantLabelView);
    }

    -[TVHButtonLockupContentView _updateAppearanceForFocusedState:](v10, "_updateAppearanceForFocusedState:", 0LL);
  }

  return v10;
}

- (double)focusedSizeIncrease
{
  return 14.0;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView image](self, "image"));

  if (v4 != v6)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
    [v5 setImage:v6];

    -[TVHButtonLockupContentView _updateImageMask](self, "_updateImageMask");
    -[TVHButtonLockupContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView title](self, "title"));
  unsigned __int8 v5 = [v4 isEqualToString:v9];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
    [v6 setText:v9];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleVibrantLabelView](self, "titleVibrantLabelView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
    [v8 setText:v9];
  }
}

- (void)setTitleTextColor:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  [v5 setTextColor:v4];
}

- (UIColor)titleTextColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 textColor]);

  return (UIColor *)v3;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVHButtonLockupContentView;
  -[TVHButtonLockupContentView layoutSubviews](&v30, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView layout](self, "layout"));
  [v3 buttonSize];
  double v5 = v4;
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView floatingContentView](self, "floatingContentView"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView backdropEffectView](self, "backdropEffectView"));
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v5, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView overlayView](self, "overlayView"));
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v5, v7);

  id v11 = -[TVHButtonLockupContentView _imageViewSizeWithMaxSize:](self, "_imageViewSizeWithMaxSize:", v5, v7);
  double v14 = UIRectCenteredIntegralRectScale(v11, 0.0, 0.0, v12, v13, 0.0, 0.0, v5, v7, 0.0);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageMask](self, "imageMask"));
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  if (v23)
  {
    [v3 labelHeight];
    double v25 = v24;
    [v3 buttonToTitleLabelSpacing];
    double v27 = v26;
    v31.origin.x = 0.0;
    v31.origin.double y = 0.0;
    v31.size.double width = v5;
    v31.size.double height = v7;
    double v28 = v27 + CGRectGetMaxY(v31);
    objc_msgSend(v23, "setFrame:", 0.0, v28, v5, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleVibrantLabelView](self, "titleVibrantLabelView"));
    objc_msgSend(v29, "setFrame:", 0.0, v28, v5, v25);
  }
}

- (void)updateAppearanceForLockupState:(unint64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView floatingContentView](self, "floatingContentView"));
  [v5 setControlState:a3 animated:1];

  -[TVHButtonLockupContentView _updateAppearanceForFocusedState:]( self,  "_updateAppearanceForFocusedState:",  (a3 >> 3) & 1);
}

- (void)updateHighConstrastAppearanceWithLockupState:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageMask](self, "imageMask", a3));
  else {
    uint64_t v3 = kCAFilterDestOut;
  }
  [v4 setCompositingFilter:v3];
}

- (double)heightForTitleLabelForButtonLockupLayout:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView title](self, "title", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView layout](self, "layout"));
  [v5 buttonSize];
  double v7 = v6;
  NSAttributedStringKey v14 = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 font]);
  double v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 3, v10, 0, v7, 1.79769313e308);
  double v12 = v11;

  return v12;
}

- (CGSize)_imageViewSizeWithMaxSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  if (v7 >= width) {
    double v10 = width;
  }
  else {
    double v10 = v7;
  }
  if (v9 >= height) {
    double v11 = height;
  }
  else {
    double v11 = v9;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_updateAppearanceForFocusedState:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView overlayView](self, "overlayView"));
  double v6 = v5;
  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  if (v3) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  [v5 setAlpha:v7];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageMask](self, "imageMask"));
  [v9 setAllowsEdgeAntialiasing:v3];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
  [v10 setAlpha:v8];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  [v11 setHidden:v3 ^ 1];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleVibrantLabelView](self, "titleVibrantLabelView"));
  [v12 setHidden:v3];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView titleLabel](self, "titleLabel"));
  -[TVHButtonLockupContentView _updateShadowForLabel:inFocus:](self, "_updateShadowForLabel:inFocus:", v13, v3);
}

- (void)_updateImageMask
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageView](self, "imageView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v12 image]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _flatImageWithColor:v4]);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView imageMask](self, "imageMask"));
    [v6 removeFromSuperlayer];

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    else {
      uint64_t v8 = kCAFilterDestOut;
    }
    [v7 setCompositingFilter:v8];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupContentView overlayView](self, "overlayView"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layer]);
    [v10 addSublayer:v7];

    id v11 = v5;
    objc_msgSend(v7, "setContents:", objc_msgSend(v11, "CGImage"));
    [v12 frame];
    objc_msgSend(v7, "setFrame:");
    -[TVHButtonLockupContentView setImageMask:](self, "setImageMask:", v7);
  }
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v11 = v5;
  if (v4)
  {
    if (!qword_100157290)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
      double v7 = (void *)qword_100157290;
      qword_100157290 = v6;

      id v5 = v11;
    }

    objc_msgSend(v5, "setShadowColor:");
    double height = 2.0;
    double width = 0.0;
    double v10 = 6.0;
  }

  else
  {
    [v5 setShadowColor:0];
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v10 = 0.0;
  }

  objc_msgSend(v11, "setShadowOffset:", width, height);
  [v11 setShadowBlur:v10];
}

+ (id)_label
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v2, "setLineBreakMode:", 4LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 17LL));
  -[UILabel setFont:](v2, "setFont:", v3);

  -[UILabel setNumberOfLines:](v2, "setNumberOfLines:", 2LL);
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 1LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v2, "setTextColor:", v4);

  return v2;
}

+ (id)_labelForVibrancy
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v2, "setLineBreakMode:", 4LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 17LL));
  -[UILabel setFont:](v2, "setFont:", v3);

  -[UILabel setNumberOfLines:](v2, "setNumberOfLines:", 2LL);
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 1LL);
  -[UILabel setOpaque:](v2, "setOpaque:", 0LL);
  -[UILabel setBackgroundColor:](v2, "setBackgroundColor:", 0LL);
  return v2;
}

- (TVHButtonLockupLayout)layout
{
  return self->_layout;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UIVisualEffectView)backdropEffectView
{
  return self->_backdropEffectView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (CALayer)imageMask
{
  return self->_imageMask;
}

- (void)setImageMask:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVHVibrantLabelView)titleVibrantLabelView
{
  return self->_titleVibrantLabelView;
}

- (void)setTitleVibrantLabelView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end