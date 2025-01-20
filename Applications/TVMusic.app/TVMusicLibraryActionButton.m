@interface TVMusicLibraryActionButton
- (BOOL)circular;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)_buttonSize;
- (CGSize)intrinsicContentSize;
- (CGSize)textLabelSize;
- (NSString)text;
- (NSString)title;
- (TVMusicLibraryActionButton)initWithFrame:(CGRect)a3;
- (TVMusicLibraryActionButton)initWithStyle:(int64_t)a3;
- (UIFont)textFont;
- (UIImage)image;
- (id)_foregroundColor;
- (int64_t)buttonStyle;
- (void)_selectButtonAction:(id)a3;
- (void)_setButtonShadows;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setCircular:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
- (void)setTextFont:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicLibraryActionButton

- (TVMusicLibraryActionButton)initWithStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
  double y = CGRectZero.origin.y;
  -[TVMusicLibraryActionButton _buttonSize](self, "_buttonSize");
  return -[TVMusicLibraryActionButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, y, v5, v6);
}

- (TVMusicLibraryActionButton)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a3.size.width == CGSizeZero.width && a3.size.height == CGSizeZero.height)
  {
    self->_buttonStyle = 0LL;
    -[TVMusicLibraryActionButton _buttonSize](self, "_buttonSize");
    a3.size.width = v7;
    a3.size.height = v8;
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButton;
  v9 = -[TVMusicLibraryActionButton initWithFrame:](&v40, "initWithFrame:", x, y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    -[TVMusicLibraryActionButton setOpaque:](v9, "setOpaque:", 0LL);
    v11 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
    -[TVMusicLibraryActionButton bounds](v10, "bounds");
    v12 = -[_UIFloatingContentView initWithFrame:](v11, "initWithFrame:");
    floatingView = v10->_floatingView;
    v10->_floatingView = v12;

    -[_UIFloatingContentView setAutoresizingMask:](v10->_floatingView, "setAutoresizingMask:", 18LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v10->_floatingView, "setFocusedSizeIncrease:", 14.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v10->_floatingView,  "setContentMotionRotation:translation:",  0.0,  0.0,  8.0,  8.0);
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](v10->_floatingView, "setFocusScaleAnchorPoint:", 0.5, 1.0);
    v14 = v10->_floatingView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[_UIFloatingContentView setBackgroundColor:forState:](v14, "setBackgroundColor:forState:", v15, 8LL);

    -[TVMusicLibraryActionButton addSubview:](v10, "addSubview:", v10->_floatingView);
    if (v10->_buttonStyle)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityDColor](&OBJC_CLASS___TVThemeManager, "textOpacityDColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingView, "contentView"));
      [v17 setBackgroundColor:v16];

      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutEmphasizedFont](&OBJC_CLASS___TVThemeManager, "calloutEmphasizedFont"));
      textFont = v10->_textFont;
      v10->_textFont = (UIFont *)v18;
    }

    else
    {
      textFont = (UIFont *)objc_claimAutoreleasedReturnValue( +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:]( &OBJC_CLASS___UIBlurEffect,  "_effectWithStyle:invertAutomaticStyle:",  5001LL,  1LL));
      v20 = -[UIVisualEffectView initWithEffect:]( objc_alloc(&OBJC_CLASS___UIVisualEffectView),  "initWithEffect:",  textFont);
      backgroundEffectView = v10->_backgroundEffectView;
      v10->_backgroundEffectView = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v10->_floatingView,  "visualEffectContainerView"));
      [v22 bounds];
      -[UIVisualEffectView setFrame:](v10->_backgroundEffectView, "setFrame:");

      -[UIVisualEffectView setAutoresizingMask:](v10->_backgroundEffectView, "setAutoresizingMask:", 18LL);
      v23 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v10->_floatingView,  "visualEffectContainerView"));
      [v23 addSubview:v10->_backgroundEffectView];

      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[TVThemeManager footnoteFont](&OBJC_CLASS___TVThemeManager, "footnoteFont"));
      v25 = v10->_textFont;
      v10->_textFont = (UIFont *)v24;
    }

    v26 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v26;

    v28 = v10->_titleLabel;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager caption2Font](&OBJC_CLASS___TVThemeManager, "caption2Font"));
    -[UILabel setFont:](v28, "setFont:", v29);

    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setMinimumScaleFactor:](v10->_titleLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setOpaque:](v10->_titleLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v10->_titleLabel, "setBackgroundColor:", 0LL);
    -[UILabel setHidden:](v10->_titleLabel, "setHidden:", 1LL);
    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 2LL);
    -[UILabel setTextAlignment:](v10->_titleLabel, "setTextAlignment:", 1LL);
    v30 = v10->_titleLabel;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  &stru_10026CF20));
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[TVMusicLibraryActionButton addSubview:](v10, "addSubview:", v10->_titleLabel);
    v32 = objc_alloc_init(&OBJC_CLASS___UILabel);
    textLabel = v10->_textLabel;
    v10->_textLabel = v32;

    -[UILabel setFont:](v10->_textLabel, "setFont:", v10->_textFont);
    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_textLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setMinimumScaleFactor:](v10->_textLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setOpaque:](v10->_textLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v10->_textLabel, "setBackgroundColor:", 0LL);
    v34 = v10->_textLabel;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton _foregroundColor](v10, "_foregroundColor"));
    -[UILabel setTextColor:](v34, "setTextColor:", v35);

    -[UILabel setHidden:](v10->_textLabel, "setHidden:", 1LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v10->_floatingView, "contentView"));
    [v36 addSubview:v10->_textLabel];

    v37 = -[TVInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer),  "initWithTarget:action:",  v10,  "_selectButtonAction:");
    selectRecognizer = v10->_selectRecognizer;
    v10->_selectRecognizer = &v37->super;

    -[UIGestureRecognizer setAllowedPressTypes:](v10->_selectRecognizer, "setAllowedPressTypes:", &off_100282258);
    -[UIGestureRecognizer setDelegate:](v10->_selectRecognizer, "setDelegate:", v10);
    -[TVMusicLibraryActionButton addGestureRecognizer:](v10, "addGestureRecognizer:", v10->_selectRecognizer);
    -[TVMusicLibraryActionButton _setButtonShadows](v10, "_setButtonShadows");
    -[TVMusicLibraryActionButton setCircular:](v10, "setCircular:", v10->_circular);
  }

  return v10;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButton;
  -[TVMusicLibraryActionButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[_UIFloatingContentView setControlState:animated:]( self->_floatingView,  "setControlState:animated:",  -[TVMusicLibraryActionButton state](self, "state"),  1LL);
}

- (CGSize)textLabelSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (CGSize)_buttonSize
{
  switch(self->_buttonStyle)
  {
    case 0LL:
      double height = 80.0;
      double width = 142.0;
      break;
    case 1LL:
      double height = 73.0;
      double width = 515.0;
      break;
    case 2LL:
      double height = 66.0;
      double width = 210.0;
      break;
    case 3LL:
      -[TVMusicLibraryActionButton textLabelSize](self, "textLabelSize");
      double v6 = v5;
      double v8 = v7;
      imageView = self->_imageView;
      if (imageView)
      {
        -[UIImageView frame](imageView, "frame");
        double v6 = v6 + v10 + 10.0;
        -[UIImageView frame](self->_imageView, "frame");
        if (v11 > v8)
        {
          -[UIImageView frame](self->_imageView, "frame");
          double v8 = v12;
        }
      }

      double width = v6 + 60.0;
      double height = v8 + 32.0;
      break;
    default:
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      break;
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButton;
  id v6 = a4;
  -[TVMusicLibraryActionButton didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( self->_floatingView,  "setControlState:withAnimationCoordinator:",  -[TVMusicLibraryActionButton state](self, "state"),  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009D4F8;
  v8[3] = &unk_100268B30;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton _foregroundColor](self, "_foregroundColor"));
  id v7 = v9;
  [v6 addCoordinatedAnimations:v8 completion:0];
}

- (void)_setButtonShadows
{
  unsigned int v3 = -[TVMusicLibraryActionButton circular](self, "circular");
  double v4 = 0.2;
  if (v3)
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  else
  {
    double v5 = 0.5;
  }

  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:]( self->_floatingView,  "setShadowOpacity:forUserInterfaceStyle:",  1LL,  v4);
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:]( self->_floatingView,  "setShadowOpacity:forUserInterfaceStyle:",  2LL,  v5);
}

- (CGSize)intrinsicContentSize
{
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if ((-[UILabel isHidden](self->_titleLabel, "isHidden") & 1) == 0)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView"));
    [v18 frame];
    double v19 = CGRectGetMaxY(v135) + 4.0;

    -[TVMusicLibraryActionButton bounds](self, "bounds");
    if (v20 + 20.0 < v15) {
      double v15 = v20 + 20.0;
    }
    -[TVMusicLibraryActionButton bounds](self, "bounds");
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", UIRectCenteredXInRect(v13, v19, v15, v17, v21, v22, v23, v24));
  }

  if (self->_imageView && (-[UILabel isHidden](self->_textLabel, "isHidden") & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
    [v42 size];
    double width = v43;
    double height = v45;

    double x = 0.0;
    BOOL v48 = width == CGSizeZero.width && height == CGSizeZero.height;
    CGFloat v129 = v5;
    double v131 = v7;
    if (v48)
    {
      double width = 40.0;
      CGFloat y = 0.0;
      double height = 40.0;
    }

    else
    {
      BOOL v49 = width < 40.0 || height < 40.0;
      CGFloat y = 0.0;
      if (!v49)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
        [v51 size];
        v149.size.double width = 40.0;
        v149.origin.double x = 0.0;
        v149.origin.CGFloat y = 0.0;
        v149.size.double height = 40.0;
        CGRect v136 = AVMakeRectWithAspectRatioInsideRect(v134, v149);
        double x = v136.origin.x;
        CGFloat y = v136.origin.y;
        double width = v136.size.width;
        double height = v136.size.height;
      }
    }

    v138.origin.double x = x;
    v138.origin.CGFloat y = y;
    v138.size.double width = width;
    v138.size.double height = height;
    double v127 = CGRectGetMaxX(v138) + 10.0;
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    CGFloat v77 = v76;
    CGFloat v79 = v78;
    double v125 = v78;
    -[TVMusicLibraryActionButton _buttonSize](self, "_buttonSize");
    CGFloat v120 = v81;
    CGFloat v121 = v80;
    v139.origin.CGFloat y = 0.0;
    v139.origin.double x = v127;
    v139.size.double width = v77;
    double v123 = v77;
    v139.size.double height = v79;
    double MaxX = CGRectGetMaxX(v139);
    v140.origin.CGFloat y = 0.0;
    v140.origin.double x = v127;
    v140.size.double width = v77;
    v140.size.double height = v79;
    double v83 = y;
    double v84 = CGRectGetHeight(v140);
    v141.origin.double x = x;
    v141.origin.CGFloat y = v83;
    v141.size.double width = width;
    v141.size.double height = height;
    double v85 = CGRectGetHeight(v141);
    if (v84 < v85) {
      double v84 = v85;
    }
    v150.origin.double x = UIRectInset(0.0, 0.0, MaxX, v84, 0.0, -34.0, 0.0, 0.0);
    v150.origin.CGFloat y = v86;
    v150.size.double width = v87;
    v150.size.double height = v88;
    v142.origin.double x = v129;
    v142.origin.CGFloat y = v131;
    v142.size.double height = v120;
    v142.size.double width = v121;
    CGRect v143 = CGRectUnion(v142, v150);
    CGFloat v130 = v143.size.height;
    CGFloat v132 = v143.size.width;
    double v90 = UIRectCenteredIntegralRect( v89,  0.0,  0.0,  MaxX,  v84,  v143.origin.x,  v143.origin.y,  v143.size.width,  v143.size.height);
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;
    CGFloat v98 = UIRectCenteredYInRect(v97, x, v83, width, height, v90, v91, v93, v95);
    CGFloat v100 = v99;
    CGFloat v102 = v101;
    CGFloat v104 = v103;
    CGFloat v106 = UIRectCenteredYInRect(v105, v127, 0.0, v123, v125, v90, v92, v94, v96);
    CGFloat v126 = v107;
    CGFloat v128 = v106;
    CGFloat v122 = v109;
    CGFloat v124 = v108;
    v144.origin.double x = v90;
    v144.origin.CGFloat y = v92;
    v144.size.double width = v94;
    v144.size.double height = v96;
    CGFloat MinX = CGRectGetMinX(v144);
    v145.origin.double x = v98;
    v145.origin.CGFloat y = v100;
    v145.size.double width = v102;
    v145.size.double height = v104;
    CGRect v146 = CGRectOffset(v145, MinX, 0.0);
    double v111 = v146.origin.x;
    double v112 = v146.origin.y;
    double v113 = v146.size.width;
    double v114 = v146.size.height;
    v146.origin.double x = v90;
    v146.origin.CGFloat y = v92;
    v146.size.double width = v94;
    v146.size.double height = v96;
    CGFloat v115 = CGRectGetMinX(v146);
    v147.origin.CGFloat y = v126;
    v147.origin.double x = v128;
    v147.size.double height = v122;
    v147.size.double width = v124;
    CGRect v148 = CGRectOffset(v147, v115, 0.0);
    double v116 = v148.origin.x;
    double v117 = v148.origin.y;
    double v118 = v148.size.width;
    double v119 = v148.size.height;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v111, v112, v113, v114);
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v116, v117, v118, v119);
    -[TVMusicLibraryActionButton frame](self, "frame");
    textLabel = self;
    double v32 = v130;
    double v31 = v132;
    goto LABEL_30;
  }

  if ((-[UILabel isHidden](self->_textLabel, "isHidden") & 1) != 0)
  {
    imageView = self->_imageView;
    if (imageView)
    {
      id v26 = -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", 40.0, 40.0);
      double v29 = UIRectCenteredIntegralRect(v26, 0.0, 0.0, v27, v28, v5, v7, v9, v11);
      textLabel = self->_imageView;
LABEL_30:
      objc_msgSend(textLabel, "setFrame:", v29, v30, v31, v32);
    }
  }

  else
  {
    -[TVMusicLibraryActionButton frame](self, "frame");
    double v36 = v35;
    double v38 = v37;
    if (self->_buttonStyle == 3)
    {
      -[TVMusicLibraryActionButton _buttonSize](self, "_buttonSize");
      double v40 = v39;
      -[TVMusicLibraryActionButton setFrame:](self, "setFrame:", v36, v38, v41, v39);
    }

    else
    {
      double v40 = v34;
    }

    -[UILabel frame](self->_textLabel, "frame");
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_textLabel, "superview"));
    id v61 = [v60 bounds];
    double v66 = UIRectCenteredIntegralRect(v61, v53, v55, v57, v59, v62, v63, v64, v65);
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;

    -[UILabel setFrame:](self->_textLabel, "setFrame:", v66, v68, v70, v72);
    -[TVMusicLibraryActionButton _buttonSize](self, "_buttonSize");
    double v74 = v73;
    v137.origin.double x = v66;
    v137.origin.CGFloat y = v68;
    v137.size.double width = v70;
    v137.size.double height = v72;
    double v75 = CGRectGetMaxX(v137) + 16.0;
    if (v74 < v75) {
      double v74 = v75;
    }
    -[TVMusicLibraryActionButton setFrame:](self, "setFrame:", v36, v38, v74, v40);
    double v31 = v74 + -20.0;
    if (v70 > v74 + -20.0)
    {
      textLabel = self->_textLabel;
      double v29 = v66;
      double v30 = v68;
      double v32 = v72;
      goto LABEL_30;
    }
  }

  id v133 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton _foregroundColor](self, "_foregroundColor"));
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v133);
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v133);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicLibraryActionButton;
  id v4 = a3;
  -[TVMusicLibraryActionButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVMusicLibraryActionButton _setButtonShadows](self, "_setButtonShadows");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_selectButtonAction:(id)a3
{
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  id v11 = v4;
  if (v4)
  {
    if (!imageView)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___UIImageView);
      id v7 = self->_imageView;
      self->_imageView = v6;

      objc_super v8 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView"));
      -[UIImageView addSubview:](v8, "addSubview:", self->_imageView);
LABEL_6:

      id v4 = v11;
    }
  }

  else if (imageView)
  {
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_super v8 = self->_imageView;
    self->_imageView = 0LL;
    goto LABEL_6;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 imageWithRenderingMode:2]);
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1LL);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton _foregroundColor](self, "_foregroundColor"));
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v10);

  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
  -[TVMusicLibraryActionButton setNeedsLayout](self, "setNeedsLayout");
  -[TVMusicLibraryActionButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  id v10 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", *p_title);
    titleLabel = self->_titleLabel;
    -[TVMusicLibraryActionButton bounds](self, "bounds");
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v7, 0.0);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v8, v9);
    -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0LL);
    -[TVMusicLibraryActionButton setNeedsLayout](self, "setNeedsLayout");
    -[TVMusicLibraryActionButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setText:(id)a3
{
  p_text = &self->_text;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[UILabel setText:](self->_textLabel, "setText:", *p_text);
    -[UILabel sizeToFit](self->_textLabel, "sizeToFit");
    -[UILabel setHidden:](self->_textLabel, "setHidden:", 0LL);
    -[TVMusicLibraryActionButton setNeedsLayout](self, "setNeedsLayout");
    -[TVMusicLibraryActionButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
  floatingView = self->_floatingView;
  if (a3)
  {
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](floatingView, "setFocusScaleAnchorPoint:", 0.5, 0.5);
    -[TVMusicLibraryActionButton bounds](self, "bounds");
    double v6 = v5 * 0.5;
  }

  else
  {
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](floatingView, "setFocusScaleAnchorPoint:", 0.5, 1.0);
    double v6 = 12.0;
  }

  -[_UIFloatingContentView setCornerRadius:](self->_floatingView, "setCornerRadius:", v6);
  -[UIVisualEffectView _setCornerRadius:](self->_backgroundEffectView, "_setCornerRadius:", v6);
  -[TVMusicLibraryActionButton _setCornerRadius:](self, "_setCornerRadius:", v6);
  -[TVMusicLibraryActionButton _setButtonShadows](self, "_setButtonShadows");
}

- (id)_foregroundColor
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton traitCollection](self, "traitCollection"));
  id v4 = [v3 accessibilityContrast];

  if (v4 == (id)1)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVThemeManager textOpacityAColorReversed]( &OBJC_CLASS___TVThemeManager,  "textOpacityAColorReversed"));
  }

  else if (-[TVMusicLibraryActionButton isFocused](self, "isFocused"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  else
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor"));
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)circular
{
  return self->_circular;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)setTextFont:(id)a3
{
}

- (void).cxx_destruct
{
}

@end