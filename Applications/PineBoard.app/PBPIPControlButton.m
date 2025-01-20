@interface PBPIPControlButton
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)shouldTrack;
- (BSMutableIntegerMap)tintColorsByState;
- (NSLayoutConstraint)titleLabelUnfocusedConstraint;
- (PBPIPControlButton)initWithImage:(id)a3 title:(id)a4;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIVisualEffectView)backgroundView;
- (_UIFloatingContentView)floatingContentView;
- (id)_tintColorForControlState:(unint64_t)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)menuProvider;
- (int64_t)role;
- (unint64_t)_currentControlState;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateCompositingFilter;
- (void)_updateContentViews;
- (void)_updateStyling;
- (void)_updateTitleForControlState:(unint64_t)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setTintColor:(id)a3 forControlState:(unint64_t)a4;
@end

@implementation PBPIPControlButton

- (PBPIPControlButton)initWithImage:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v90.receiver = self;
  v90.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
  v8 = -[PBPIPControlButton initWithFrame:]( &v90,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v8->_floatingContentView;
    v8->_floatingContentView = v9;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[_UIFloatingContentView setUserInteractionEnabled:](v8->_floatingContentView, "setUserInteractionEnabled:", 0LL);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v8->_floatingContentView, "setContinuousCornerEnabled:", 0LL);
    -[_UIFloatingContentView setShadowVerticalOffset:](v8->_floatingContentView, "setShadowVerticalOffset:", 15.0);
    -[_UIFloatingContentView setShadowOpacity:](v8->_floatingContentView, "setShadowOpacity:", 0.4);
    -[_UIFloatingContentView setShadowRadius:](v8->_floatingContentView, "setShadowRadius:", 30.0);
    v11 = v8->_floatingContentView;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL));
    -[_UIFloatingContentView setFocusAnimationConfiguration:](v11, "setFocusAnimationConfiguration:", v12);

    -[_UIFloatingContentView setFocusedSizeIncrease:](v8->_floatingContentView, "setFocusedSizeIncrease:", 10.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v8->_floatingContentView,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  CGPointZero.x,  CGPointZero.y);
    -[_UIFloatingContentView setFloatingContentDelegate:](v8->_floatingContentView, "setFloatingContentDelegate:", v8);
    -[PBPIPControlButton addSubview:](v8, "addSubview:", v8->_floatingContentView);
    v13 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", 0LL);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v13;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_backgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v8->_floatingContentView,  "visualEffectContainerView"));
    [v15 addSubview:v8->_backgroundView];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v8->_backgroundView, "contentView"));
    v87 = (void *)objc_claimAutoreleasedReturnValue([v16 layer]);

    id v17 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
    objc_msgSend(v87, "setBorderColor:", objc_msgSend(v17, "CGColor"));

    [v87 setBorderWidth:1.0];
    v18 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v6);
    imageView = v8->_imageView;
    v8->_imageView = v18;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 4LL);
    v20 = v8->_imageView;
    id v89 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithTextStyle:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:",  UIFontTextStyleBody));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithWeight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithWeight:",  5LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 configurationByApplyingConfiguration:v22]);

    -[UIImageView setPreferredSymbolConfiguration:](v20, "setPreferredSymbolConfiguration:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v8->_floatingContentView, "contentView"));
    [v24 addSubview:v8->_imageView];

    v86 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL));
    v25 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v8->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1LL);
    v27 = v8->_titleLabel;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption3));
    -[UILabel setFont:](v27, "setFont:", v28);

    -[UILabel setText:](v8->_titleLabel, "setText:", v7);
    v29 = v8->_titleLabel;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 resolvedColorWithTraitCollection:v86]);
    -[UILabel setTextColor:](v29, "setTextColor:", v31);

    -[PBPIPControlButton addSubview:](v8, "addSubview:", v8->_titleLabel);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v8->_titleLabel, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton bottomAnchor](v8, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33]);

    LODWORD(v35) = 1144750080;
    v61 = v34;
    [v34 setPriority:v35];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v8->_titleLabel, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v8->_floatingContentView, "bottomAnchor"));
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37]);
    titleLabelUnfocusedConstraint = v8->_titleLabelUnfocusedConstraint;
    v8->_titleLabelUnfocusedConstraint = (NSLayoutConstraint *)v38;

    -[PBPIPControlButton _updateStyling](v8, "_updateStyling");
    -[PBPIPControlButton _updateTitleForControlState:](v8, "_updateTitleForControlState:", 0LL);
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton widthAnchor](v8, "widthAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintEqualToConstant:80.0]);
    v91[0] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton heightAnchor](v8, "heightAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToConstant:113.0]);
    v91[1] = v82;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v8->_floatingContentView, "topAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton topAnchor](v8, "topAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v81 constraintEqualToAnchor:v80]);
    v91[2] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView centerXAnchor](v8->_floatingContentView, "centerXAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton centerXAnchor](v8, "centerXAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v77]);
    v91[3] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView widthAnchor](v8->_floatingContentView, "widthAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton widthAnchor](v8, "widthAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToAnchor:v74]);
    v91[4] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView heightAnchor](v8->_floatingContentView, "heightAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView widthAnchor](v8->_floatingContentView, "widthAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v71]);
    v91[5] = v70;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v8->_backgroundView, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v8->_floatingContentView,  "visualEffectContainerView"));
    v67 = (void *)objc_claimAutoreleasedReturnValue([v69 leadingAnchor]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v68 constraintEqualToAnchor:v67]);
    v91[6] = v66;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v8->_backgroundView, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v8->_floatingContentView,  "visualEffectContainerView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v65 trailingAnchor]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v63]);
    v91[7] = v62;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v8->_backgroundView, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v8->_floatingContentView,  "visualEffectContainerView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 topAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58]);
    v91[8] = v57;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v8->_backgroundView, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v8->_floatingContentView,  "visualEffectContainerView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v56 bottomAnchor]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
    v91[9] = v53;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v8->_imageView, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v8->_floatingContentView, "contentView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 centerXAnchor]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
    v91[10] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v8->_imageView, "centerYAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v8->_floatingContentView, "contentView"));
    id v88 = v7;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 centerYAnchor]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v43]);
    v91[11] = v44;
    v91[12] = v34;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v8->_titleLabel, "centerXAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlButton centerXAnchor](v8, "centerXAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
    v91[13] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 14LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v48);

    id v6 = v89;
    id v7 = v88;
  }

  return v8;
}

- (void)setRole:(int64_t)a3
{
  if (self->_role != a3)
  {
    self->_role = a3;
    -[PBPIPControlButton _updateStyling](self, "_updateStyling");
  }

- (UIImage)image
{
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
}

- (void)setImage:(id)a3
{
}

- (void)setMenuProvider:(id)a3
{
  if (self->_menuProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id menuProvider = self->_menuProvider;
    self->_id menuProvider = v4;

    BOOL v6 = self->_menuProvider != 0LL;
    -[PBPIPControlButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v6);
    -[PBPIPControlButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v6);
  }

- (void)setTintColor:(id)a3 forControlState:(unint64_t)a4
{
  id v7 = a3;
  if ((a4 & (a4 - 1)) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"BSBitmaskCount(controlState) <= 1"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C67C(a2, (uint64_t)self, (uint64_t)v12);
    }
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

  else
  {
    v8 = v7;
    tintColorsByState = self->_tintColorsByState;
    if (!tintColorsByState)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
      v11 = self->_tintColorsByState;
      self->_tintColorsByState = v10;

      tintColorsByState = self->_tintColorsByState;
    }

    -[BSMutableIntegerMap setObject:forKey:](tintColorsByState, "setObject:forKey:", v8, a4);
  }

- (BOOL)shouldTrack
{
  return 0;
}

- (void)setHighlighted:(BOOL)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000C933C;
  v8[3] = &unk_1003D2288;
  objc_copyWeak(&v9, &location);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
  -[PBPIPControlButton layoutSubviews](&v6, "layoutSubviews");
  -[_UIFloatingContentView bounds](self->_floatingContentView, "bounds");
  double v4 = v3 * 0.5;
  -[_UIFloatingContentView setShadowSize:](self->_floatingContentView, "setShadowSize:", v3 * 0.5, v5 * 0.5);
  -[_UIFloatingContentView setCornerRadius:](self->_floatingContentView, "setCornerRadius:", v4);
  -[UIVisualEffectView _setCornerRadius:](self->_backgroundView, "_setCornerRadius:", v4);
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
}

- (void)_updateTitleForControlState:(unint64_t)a3
{
  BOOL v4 = a3 == 0;
  BOOL v5 = a3 == 0;
  titleLabelUnfocusedConstraint = self->_titleLabelUnfocusedConstraint;
  if (v4) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  -[NSLayoutConstraint setActive:](titleLabelUnfocusedConstraint, "setActive:", v5);
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v7);
}

- (void)_updateStyling
{
  if (self->_role == 3)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4009LL));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIVisualEffect effectCompositingColor:withMode:alpha:]( &OBJC_CLASS___UIVisualEffect,  "effectCompositingColor:withMode:alpha:",  v4,  0LL,  0.3));

    v11[0] = v3;
    v11[1] = v5;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIVisualEffect effectCombiningEffects:]( &OBJC_CLASS___UIVisualEffect,  "effectCombiningEffects:",  v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.75));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.48627451, 1.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  -[UIVisualEffectView setEffect:](self->_backgroundView, "setEffect:", v7);
  -[_UIFloatingContentView setBackgroundColor:forState:]( self->_floatingContentView,  "setBackgroundColor:forState:",  v8,  8LL);
  -[_UIFloatingContentView setBackgroundColor:forState:]( self->_floatingContentView,  "setBackgroundColor:forState:",  0LL,  1LL);
  -[PBPIPControlButton setTintColor:forControlState:](self, "setTintColor:forControlState:", v9, 0LL);
  -[PBPIPControlButton setTintColor:forControlState:](self, "setTintColor:forControlState:", v10, 8LL);
  -[PBPIPControlButton setTintColor:forControlState:](self, "setTintColor:forControlState:", v10, 1LL);
  -[PBPIPControlButton _updateContentViews](self, "_updateContentViews");
}

- (void)_updateCompositingFilter
{
  if (self->_role == 3 || -[PBPIPControlButton _currentControlState](self, "_currentControlState")) {
    id v3 = 0LL;
  }
  else {
    id v3 = kCAFilterPlusL;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingContentView, "contentView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);

  [v4 setCompositingFilter:v3];
  [v6 setAllowsGroupBlending:v3 == 0];
}

- (void)_updateContentViews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPControlButton _tintColorForControlState:]( self,  "_tintColorForControlState:",  -[PBPIPControlButton _currentControlState](self, "_currentControlState")));
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v3);
  -[PBPIPControlButton _updateCompositingFilter](self, "_updateCompositingFilter");
}

- (unint64_t)_currentControlState
{
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | -[PBPIPControlButton isHighlighted](self, "isHighlighted");
}

- (id)_tintColorForControlState:(unint64_t)a3
{
  BOOL v4 = self->_tintColorsByState;
  BOOL v5 = v4;
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000C99AC;
    v15[3] = &unk_1003D5980;
    unint64_t v17 = a3;
    v16 = v4;
    objc_super v6 = objc_retainBlock(v15);
  }

  else
  {
    objc_super v6 = &stru_1003D59C0;
  }

  uint64_t v7 = ((uint64_t (*)(Block_layout *, uint64_t))v6->invoke)(v6, 1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    uint64_t v9 = ((uint64_t (*)(Block_layout *, uint64_t))v6->invoke)(v6, 8LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!v8)
    {
      uint64_t v10 = ((uint64_t (*)(Block_layout *, uint64_t))v6->invoke)(v6, 4LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (!v8)
      {
        uint64_t v11 = ((uint64_t (*)(Block_layout *, uint64_t))v6->invoke)(v6, 2LL);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (!v8)
        {
          uint64_t v12 = ((uint64_t (*)(Block_layout *, void))v6->invoke)(v6, 0LL);
          v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
          if (!v8)
          {
            if ((a3 & 8) != 0) {
              uint64_t v13 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
            }
            else {
              uint64_t v13 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
            }
            v8 = (void *)v13;
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)_canHandlePresses:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
  -[PBPIPControlButton setHighlighted:](&v6, "setHighlighted:", a3);
  -[_UIFloatingContentView setControlState:animated:]( self->_floatingContentView,  "setControlState:animated:",  -[PBPIPControlButton _currentControlState](self, "_currentControlState"),  v4);
  -[PBPIPControlButton _updateContentViews](self, "_updateContentViews");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBPIPControlButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[PBPIPControlButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 1LL, 1LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
    -[PBPIPControlButton pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBPIPControlButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[PBPIPControlButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 0LL, 1LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
    -[PBPIPControlButton pressesCancelled:withEvent:](&v8, "pressesCancelled:withEvent:", v6, v7);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBPIPControlButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    if (-[PBPIPControlButton isFocused](self, "isFocused"))
    {
      -[PBPIPControlButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 0LL, 1LL);
      -[PBPIPControlButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000LL);
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
    -[PBPIPControlButton pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBPIPControlButton;
  id v6 = a4;
  -[PBPIPControlButton didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( self->_floatingContentView,  "setControlState:withAnimationCoordinator:",  -[PBPIPControlButton _currentControlState](self, "_currentControlState"),  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C9D64;
  v7[3] = &unk_1003CFF08;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (int64_t)role
{
  return self->_role;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSLayoutConstraint)titleLabelUnfocusedConstraint
{
  return self->_titleLabelUnfocusedConstraint;
}

- (BSMutableIntegerMap)tintColorsByState
{
  return self->_tintColorsByState;
}

- (void).cxx_destruct
{
}

@end