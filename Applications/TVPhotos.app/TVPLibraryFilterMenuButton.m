@interface TVPLibraryFilterMenuButton
+ (id)_checkmarkImage;
- (BOOL)checkmarkHidden;
- (NSString)title;
- (TVPLibraryFilterMenuButton)initWithFrame:(CGRect)a3;
- (UIColor)foregroundColor;
- (UIImage)image;
- (UIImageView)leadingImageView;
- (UIImageView)trailingImageView;
- (UILabel)label;
- (_UIFloatingContentView)floatingContentView;
- (id)_createImageView;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)buttonAction;
- (int64_t)libraryFilterItemTag;
- (void)_updateAppearanceForLayer:(id)a3;
- (void)_updateFloatingContentControlIsFocused:(BOOL)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5;
- (void)_updateFloatingContentControlStateAnimated:(BOOL)a3;
- (void)_updateFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_updateVisualState;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setButtonAction:(id)a3;
- (void)setCheckmarkHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLibraryFilterItemTag:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVPLibraryFilterMenuButton

- (TVPLibraryFilterMenuButton)initWithFrame:(CGRect)a3
{
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterMenuButton;
  v3 = -[TVPLibraryFilterMenuButton initWithFrame:]( &v65,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v3->_label, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
    -[UILabel setFont:](v3->_label, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton foregroundColor](v3, "foregroundColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v3->_label, "heightAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToConstant:77.0]);
    [v9 setActive:1];

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton _createImageView](v3, "_createImageView"));
    leadingImageView = v3->_leadingImageView;
    v3->_leadingImageView = (UIImageView *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton _createImageView](v3, "_createImageView"));
    trailingImageView = v3->_trailingImageView;
    v3->_trailingImageView = (UIImageView *)v12;

    v14 = objc_alloc(&OBJC_CLASS___UIStackView);
    v67[0] = v3->_leadingImageView;
    v67[1] = v3->_label;
    v67[2] = v3->_trailingImageView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 3LL));
    v16 = -[UIStackView initWithArrangedSubviews:](v14, "initWithArrangedSubviews:", v15);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v16,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setSpacing:](v16, "setSpacing:", 1.17549435e-38);
    -[UIStackView setAlignment:](v16, "setAlignment:", 3LL);
    -[UIStackView setDistribution:](v16, "setDistribution:", 0LL);
    -[UIStackView setLayoutMargins:](v16, "setLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layer](v16, "layer"));
    [v17 setAllowsGroupOpacity:0];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layer](v16, "layer"));
    [v18 setAllowsGroupBlending:0];

    v19 = -[_UIFloatingContentView initWithFrame:]( objc_alloc(&OBJC_CLASS____UIFloatingContentView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    floatingContentView = v3->_floatingContentView;
    v3->_floatingContentView = v19;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL));
    -[_UIFloatingContentView setFocusAnimationConfiguration:]( v3->_floatingContentView,  "setFocusAnimationConfiguration:",  v21);

    -[_UIFloatingContentView setCornerRadius:](v3->_floatingContentView, "setCornerRadius:", 20.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v3->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v3->_floatingContentView, "setFocusedSizeIncrease:", 20.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v3->_floatingContentView, "setShadowVerticalOffset:", 10.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v3->_floatingContentView,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  0.0,  4.0);
    -[_UIFloatingContentView setBackgroundColor:forState:]( v3->_floatingContentView,  "setBackgroundColor:forState:",  0LL,  4LL);
    -[TVPLibraryFilterMenuButton addSubview:](v3, "addSubview:", v3->_floatingContentView);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v3->_floatingContentView, "contentView"));
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 addSubview:v16];
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v16, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v22 topAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v66[0] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v16, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v22 bottomAnchor]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v59]);
    v66[1] = v58;
    v64 = v16;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v16, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v22 trailingAnchor]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v56 constant:-20.0]);
    v66[2] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v16, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v22 leadingAnchor]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53 constant:20.0]);
    v66[3] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v3->_floatingContentView, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton topAnchor](v3, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
    v66[4] = v49;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView trailingAnchor](v3->_floatingContentView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton trailingAnchor](v3, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v46]);
    v66[5] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v3->_floatingContentView, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton bottomAnchor](v3, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43]);
    v66[6] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView leadingAnchor](v3->_floatingContentView, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton leadingAnchor](v3, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40]);
    v66[7] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v22 topAnchor]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v3->_floatingContentView, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37]);
    v66[8] = v36;
    v23 = v22;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v22 trailingAnchor]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView trailingAnchor](v3->_floatingContentView, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34]);
    v66[9] = v24;
    v48 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 bottomAnchor]);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v3->_floatingContentView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
    v66[10] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 leadingAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView leadingAnchor](v3->_floatingContentView, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
    v66[11] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 12LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.921568627, 1.0));
    -[_UIFloatingContentView setBackgroundColor:forState:]( v3->_floatingContentView,  "setBackgroundColor:forState:",  v32,  8LL);
    -[_UIFloatingContentView setBackgroundColor:forState:]( v3->_floatingContentView,  "setBackgroundColor:forState:",  v32,  1LL);
    -[TVPLibraryFilterMenuButton _updateVisualState](v3, "_updateVisualState");
  }

  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_label, "text");
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return -[UIImageView image](self->_leadingImageView, "image");
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton leadingImageView](self, "leadingImageView"));
  [v5 setImage:v4];

  [v5 setHidden:v4 == 0];
}

- (void)setCheckmarkHidden:(BOOL)a3
{
  self->_checkmarkHidden = a3;
  -[UIImageView setHidden:](self->_trailingImageView, "setHidden:");
  if (!a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_trailingImageView, "image"));

    if (!v5)
    {
      id v7 = objc_msgSend((id)objc_opt_class(self, v6), "_checkmarkImage");
      id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
      -[UIImageView setImage:](self->_trailingImageView, "setImage:", v8);
    }
  }

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return -[_UIFloatingContentView _preferredConfigurationForFocusAnimation:inContext:]( self->_floatingContentView,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  a4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterMenuButton;
  -[TVPLibraryFilterMenuButton pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", a3, a4);
  if (-[TVPLibraryFilterMenuButton isFocused](self, "isFocused")) {
    -[_UIFloatingContentView setControlState:animated:]( self->_floatingContentView,  "setControlState:animated:",  9LL,  1LL);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterMenuButton;
  -[TVPLibraryFilterMenuButton pressesEnded:withEvent:](&v18, "pressesEnded:withEvent:", a3, v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allPresses", 0));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) type] == (id)4)
        {

          if (-[TVPLibraryFilterMenuButton isFocused](self, "isFocused"))
          {
            -[_UIFloatingContentView setControlState:animated:]( self->_floatingContentView,  "setControlState:animated:",  8LL,  1LL);
            buttonAction = (void (**)(void))self->_buttonAction;
            if (buttonAction) {
              buttonAction[2]();
            }
          }

          goto LABEL_13;
        }

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_13:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterMenuButton;
  -[TVPLibraryFilterMenuButton pressesCancelled:withEvent:](&v5, "pressesCancelled:withEvent:", a3, a4);
  if (-[TVPLibraryFilterMenuButton isFocused](self, "isFocused")) {
    -[_UIFloatingContentView setControlState:animated:]( self->_floatingContentView,  "setControlState:animated:",  8LL,  1LL);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterMenuButton;
  id v6 = a4;
  id v7 = a3;
  -[TVPLibraryFilterMenuButton didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004BC58;
  v9[3] = &unk_1000CB7F0;
  v9[4] = self;
  id v8 = objc_retainBlock(v9);
  else {
    [v6 addCoordinatedUnfocusingAnimations:v8 completion:0];
  }
  -[TVPLibraryFilterMenuButton _updateFloatingContentControlStateInContext:withAnimationCoordinator:]( self,  "_updateFloatingContentControlStateInContext:withAnimationCoordinator:",  v7,  v6);
}

- (void)_updateVisualState
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton foregroundColor](self, "foregroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton label](self, "label"));
  [v3 setTextColor:v12];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton leadingImageView](self, "leadingImageView"));
  [v4 setTintColor:v12];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton trailingImageView](self, "trailingImageView"));
  [v5 setTintColor:v12];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton label](self, "label"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
  -[TVPLibraryFilterMenuButton _updateAppearanceForLayer:](self, "_updateAppearanceForLayer:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton leadingImageView](self, "leadingImageView"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
  -[TVPLibraryFilterMenuButton _updateAppearanceForLayer:](self, "_updateAppearanceForLayer:", v9);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton trailingImageView](self, "trailingImageView"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
  -[TVPLibraryFilterMenuButton _updateAppearanceForLayer:](self, "_updateAppearanceForLayer:", v11);
}

- (void)_updateFloatingContentControlStateAnimated:(BOOL)a3
{
}

- (void)_updateFloatingContentControlStateInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = (TVPLibraryFilterMenuButton *)objc_claimAutoreleasedReturnValue([a3 nextFocusedView]);
    unint64_t v7 = v6 == self;
  }

  else
  {
    unint64_t v7 = (unint64_t)-[TVPLibraryFilterMenuButton isFocused](self, "isFocused");
  }

  -[TVPLibraryFilterMenuButton _updateFloatingContentControlIsFocused:withAnimationCoordinator:animated:]( self,  "_updateFloatingContentControlIsFocused:withAnimationCoordinator:animated:",  v7,  v8,  1LL);
}

- (void)_updateFloatingContentControlIsFocused:(BOOL)a3 withAnimationCoordinator:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v11 = a4;
  if (v6) {
    uint64_t v8 = 8LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = v8 | -[TVPLibraryFilterMenuButton isHighlighted](self, "isHighlighted");
  floatingContentView = self->_floatingContentView;
  if (v11) {
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( floatingContentView,  "setControlState:withAnimationCoordinator:",  v9,  v11);
  }
  else {
    -[_UIFloatingContentView setControlState:animated:](floatingContentView, "setControlState:animated:", v9, v5);
  }
}

+ (id)_checkmarkImage
{
  if (qword_1001032F0 != -1) {
    dispatch_once(&qword_1001032F0, &stru_1000CB810);
  }
  return (id)qword_1001032E8;
}

- (UIColor)foregroundColor
{
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  }
  return (UIColor *)v2;
}

- (id)_createImageView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:weight:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:weight:",  UIFontTextStyleCaption1,  UIFontWeightMedium));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v3));

  BOOL v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton foregroundColor](self, "foregroundColor"));
  -[UIImageView setTintColor:](v5, "setTintColor:", v6);

  -[UIImageView setPreferredSymbolConfiguration:](v5, "setPreferredSymbolConfiguration:", v4);
  -[UIImageView setHidden:](v5, "setHidden:", 1LL);
  LODWORD(v7) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0LL, v7);
  LODWORD(v8) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:]( v5,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v8);
  -[UIImageView setContentMode:](v5, "setContentMode:", 1LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5, "widthAnchor"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToConstant:36.0]);
  [v10 setActive:1];

  return v5;
}

- (void)_updateAppearanceForLayer:(id)a3
{
  id v8 = a3;
  if (-[TVPLibraryFilterMenuButton isFocused](self, "isFocused"))
  {
    [v8 setCompositingFilter:0];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterMenuButton traitCollection](self, "traitCollection"));
    id v5 = [v4 userInterfaceStyle];

    if (v5 == (id)2) {
      BOOL v6 = &kCAFilterPlusL;
    }
    else {
      BOOL v6 = &kCAFilterPlusD;
    }
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v6));
    [v8 setCompositingFilter:v7];
  }
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
}

- (int64_t)libraryFilterItemTag
{
  return self->_libraryFilterItemTag;
}

- (void)setLibraryFilterItemTag:(int64_t)a3
{
  self->_libraryFilterItemTag = a3;
}

- (BOOL)checkmarkHidden
{
  return self->_checkmarkHidden;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (UIImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (void).cxx_destruct
{
}

@end