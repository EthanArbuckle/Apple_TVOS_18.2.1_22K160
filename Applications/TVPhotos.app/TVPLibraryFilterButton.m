@interface TVPLibraryFilterButton
- (BOOL)buttonAppearanceShouldStaySelected;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (TVPLibraryFilterButton)initWithViewMode:(int64_t)a3;
- (UIImageView)imageView;
- (UILabel)shortTitleLabel;
- (UIVisualEffectView)backgroundEffectView;
- (_UIFloatingContentView)floatingContentView;
- (id)_shortTitle;
- (id)accessibilityLabel;
- (id)buttonAction;
- (int64_t)viewMode;
- (unint64_t)accessibilityTraits;
- (void)_updateButtonColorsAndEffects;
- (void)_updateButtonImage;
- (void)_updateViews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setButtonAction:(id)a3;
- (void)setButtonAppearanceShouldStaySelected:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setShortTitleLabel:(id)a3;
- (void)setViewMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPLibraryFilterButton

- (TVPLibraryFilterButton)initWithViewMode:(int64_t)a3
{
  v96.receiver = self;
  v96.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  v4 = -[TVPLibraryFilterButton init](&v96, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v4->_floatingContentView;
    v4->_floatingContentView = v5;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_floatingContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[_UIFloatingContentView setClipsContentToBounds:](v4->_floatingContentView, "setClipsContentToBounds:", 1LL);
    -[_UIFloatingContentView setClipsToBounds:](v4->_floatingContentView, "setClipsToBounds:", 0LL);
    -[_UIFloatingContentView setShadowVerticalOffset:](v4->_floatingContentView, "setShadowVerticalOffset:", 15.0);
    -[_UIFloatingContentView setShadowOpacity:](v4->_floatingContentView, "setShadowOpacity:", 0.2);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v4->_floatingContentView, "setFocusedSizeIncrease:", 20.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v4->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    -[_UIFloatingContentView setCornerRadius:](v4->_floatingContentView, "setCornerRadius:", 28.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v4->_floatingContentView,  "setContentMotionRotation:translation:",  CGPointZero.x,  CGPointZero.y,  4.0,  4.0);
    int64_t v94 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v4->_floatingContentView,  "visualEffectContainerView"));
    [v7 setClipsToBounds:1];

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v4->_floatingContentView,  "visualEffectContainerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
    [v9 setCornerRadius:28.0];

    v10 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v4->_floatingContentView,  "visualEffectContainerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
    [v11 setCornerCurve:kCACornerCurveContinuous];

    -[TVPLibraryFilterButton addSubview:](v4, "addSubview:", v4->_floatingContentView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton floatingContentView](v4, "floatingContentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contentView]);

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1LL);
    [v13 addSubview:v4->_imageView];
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    shortTitleLabel = v4->_shortTitleLabel;
    v4->_shortTitleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_shortTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFontEmphasized](&OBJC_CLASS___TVPThemeManager, "bodyFontEmphasized"));
    -[UILabel setFont:](v4->_shortTitleLabel, "setFont:", v18);

    [v13 addSubview:v4->_shortTitleLabel];
    v19 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v21 = -[UIVisualEffectView initWithEffect:](v19, "initWithEffect:", v20);
    backgroundEffectView = v4->_backgroundEffectView;
    v4->_backgroundEffectView = v21;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_backgroundEffectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIVisualEffectView setAlpha:](v4->_backgroundEffectView, "setAlpha:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v4->_floatingContentView,  "visualEffectContainerView"));
    [v23 addSubview:v4->_backgroundEffectView];

    v93 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView backgroundColorForState:]( v4->_floatingContentView,  "backgroundColorForState:",  8LL));
    -[_UIFloatingContentView setBackgroundColor:forState:]( v4->_floatingContentView,  "setBackgroundColor:forState:",  v93,  1LL);
    -[_UIFloatingContentView setBackgroundColor:forState:]( v4->_floatingContentView,  "setBackgroundColor:forState:",  v93,  8LL);
    v24 = v4->_floatingContentView;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[_UIFloatingContentView setBackgroundColor:forState:](v24, "setBackgroundColor:forState:", v25, 0LL);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton topAnchor](v4, "topAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v4->_floatingContentView, "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintEqualToAnchor:v87]);
    v98[0] = v85;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton bottomAnchor](v4, "bottomAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v4->_floatingContentView, "bottomAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v81]);
    v98[1] = v79;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton leadingAnchor](v4, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView leadingAnchor](v4->_floatingContentView, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v75]);
    v98[2] = v73;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton trailingAnchor](v4, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView trailingAnchor](v4->_floatingContentView, "trailingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v68]);
    v98[3] = v66;
    v26 = v13;
    v65 = (void *)objc_claimAutoreleasedReturnValue([v13 topAnchor]);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v4->_floatingContentView, "topAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v63]);
    v98[4] = v61;
    v59 = (void *)objc_claimAutoreleasedReturnValue([v13 bottomAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v4->_floatingContentView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v57]);
    v98[5] = v27;
    v95 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v13 leadingAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView leadingAnchor](v4->_floatingContentView, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
    v98[6] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v26 trailingAnchor]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView trailingAnchor](v4->_floatingContentView, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
    v98[7] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 8LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v34);

    v90 = (void *)objc_claimAutoreleasedReturnValue([v95 centerYAnchor]);
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_imageView, "centerYAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue([v90 constraintEqualToAnchor:v88]);
    v97[0] = v86;
    v84 = (void *)objc_claimAutoreleasedReturnValue([v95 leadingAnchor]);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v84 constraintEqualToAnchor:v82 constant:-20.0]);
    v97[1] = v80;
    v78 = (void *)objc_claimAutoreleasedReturnValue([v95 centerYAnchor]);
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_shortTitleLabel, "centerYAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v76]);
    v97[2] = v74;
    v72 = (void *)objc_claimAutoreleasedReturnValue([v95 trailingAnchor]);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_shortTitleLabel, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v71 constant:20.0]);
    v97[3] = v69;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_shortTitleLabel, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v91 constant:-2.0]);
    v97[4] = v64;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_imageView, "widthAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToConstant:40.0]);
    v97[5] = v60;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v4->_imageView, "heightAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v92 constraintEqualToConstant:36.0]);
    v97[6] = v58;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView heightAnchor](v4->_floatingContentView, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToConstant:56.0]);
    v97[7] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView widthAnchor](v4->_floatingContentView, "widthAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintLessThanOrEqualToConstant:450.0]);
    v97[8] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v4->_backgroundEffectView, "leftAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView leftAnchor](v4->_floatingContentView, "leftAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51]);
    v97[9] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v4->_backgroundEffectView, "rightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView rightAnchor](v4->_floatingContentView, "rightAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v48]);
    v97[10] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v4->_backgroundEffectView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView topAnchor](v4->_floatingContentView, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37]);
    v97[11] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v4->_backgroundEffectView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView bottomAnchor](v4->_floatingContentView, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40]);
    v97[12] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v97, 13LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v42);

    -[TVPLibraryFilterButton setViewMode:](v4, "setViewMode:", v94);
    -[TVPLibraryFilterButton _updateViews](v4, "_updateViews");
    v44 = (objc_class *)objc_opt_class(v4, v43);
    v45 = NSStringFromClass(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    PXLibraryFilterSendAnalyticsForDisplayedViewMode(v94, v46);
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  id v7 = a4;
  -[TVPLibraryFilterButton didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  v8 = (TVPLibraryFilterButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView", v12.receiver, v12.super_class));

  if (v8 == self)
  {
    -[TVPLibraryFilterButton setButtonAppearanceShouldStaySelected:]( self,  "setButtonAppearanceShouldStaySelected:",  0LL);
  }

  else
  {
    v9 = (TVPLibraryFilterButton *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);

    if (v9 != self) {
      goto LABEL_6;
    }
  }

  -[TVPLibraryFilterButton _updateButtonColorsAndEffects](self, "_updateButtonColorsAndEffects");
LABEL_6:
  else {
    uint64_t v10 = 0LL;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton floatingContentView](self, "floatingContentView"));
  [v11 setControlState:v10 withAnimationCoordinator:v7];
}

- (void)setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    -[TVPLibraryFilterButton setButtonAppearanceShouldStaySelected:]( self,  "setButtonAppearanceShouldStaySelected:",  0LL);
    -[TVPLibraryFilterButton _updateViews](self, "_updateViews");
  }

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  -[TVPLibraryFilterButton traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[TVPLibraryFilterButton _updateButtonImage](self, "_updateButtonImage");
  -[TVPLibraryFilterButton _updateButtonColorsAndEffects](self, "_updateButtonColorsAndEffects");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  -[TVPLibraryFilterButton pressesBegan:withEvent:](&v6, "pressesBegan:withEvent:", a3, a4);
  if (-[TVPLibraryFilterButton isFocused](self, "isFocused"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton floatingContentView](self, "floatingContentView"));
    [v5 setControlState:9 animated:1];
  }

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  -[TVPLibraryFilterButton pressesEnded:withEvent:](&v20, "pressesEnded:withEvent:", a3, v6);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allPresses", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      objc_super v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * (void)v12) type] == (id)4)
        {

          if (-[TVPLibraryFilterButton isFocused](self, "isFocused"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton floatingContentView](self, "floatingContentView"));
            [v13 setControlState:8 animated:1];

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton buttonAction](self, "buttonAction"));
            if (v14)
            {
              v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton buttonAction](self, "buttonAction"));
              v15[2]();

              -[TVPLibraryFilterButton setButtonAppearanceShouldStaySelected:]( self,  "setButtonAppearanceShouldStaySelected:",  1LL);
            }
          }

          goto LABEL_13;
        }

        objc_super v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
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
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterButton;
  -[TVPLibraryFilterButton pressesCancelled:withEvent:](&v6, "pressesCancelled:withEvent:", a3, a4);
  if (-[TVPLibraryFilterButton isFocused](self, "isFocused"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton floatingContentView](self, "floatingContentView"));
    [v5 setControlState:8 animated:1];
  }

- (id)accessibilityLabel
{
  return (id)PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_LibraryFilterButtonAXLabel", a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)_updateButtonColorsAndEffects
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5005LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](&OBJC_CLASS___UIColor, "systemBlackColor"));
  if (-[TVPLibraryFilterButton buttonAppearanceShouldStaySelected](self, "buttonAppearanceShouldStaySelected"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4017LL));

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    objc_super v6 = v3;
    id v10 = (id)v4;
LABEL_6:
    v3 = (void *)v5;
    goto LABEL_7;
  }

  if (!-[TVPLibraryFilterButton isFocused](self, "isFocused"))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    objc_super v6 = v3;
    goto LABEL_6;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4014LL));
  objc_super v6 = v10;
  id v10 = (id)v7;
LABEL_7:

  -[TVPLibraryFilterButton setTintColor:](self, "setTintColor:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton shortTitleLabel](self, "shortTitleLabel"));
  [v8 setTextColor:v3];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton backgroundEffectView](self, "backgroundEffectView"));
  [v9 setEffect:v10];
}

- (void)_updateButtonImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFontEmphasized](&OBJC_CLASS___TVPThemeManager, "bodyFontEmphasized"));
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v3,  1LL));

  uint64_t v4 = PXSharedLibraryButtonImageNameForLibraryViewMode(-[TVPLibraryFilterButton viewMode](self, "viewMode"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 imageByApplyingSymbolConfiguration:v10]);

  if (!-[TVPLibraryFilterButton viewMode](self, "viewMode"))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"photo.on.rectangle",  v10));

    uint64_t v7 = (void *)v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton imageView](self, "imageView"));
  [v9 setImage:v7];
}

- (id)_shortTitle
{
  unint64_t v2 = -[TVPLibraryFilterButton viewMode](self, "viewMode");
  if (v2 <= 2)
  {
    uint64_t v4 = PXLocalizedSharedLibraryString(off_1000CA078[v2], v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v3;
}

- (void)_updateViews
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton _shortTitle](self, "_shortTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton shortTitleLabel](self, "shortTitleLabel"));
  [v3 setText:v4];
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)buttonAppearanceShouldStaySelected
{
  return self->_buttonAppearanceShouldStaySelected;
}

- (void)setButtonAppearanceShouldStaySelected:(BOOL)a3
{
  self->_buttonAppearanceShouldStaySelected = a3;
}

- (UILabel)shortTitleLabel
{
  return self->_shortTitleLabel;
}

- (void)setShortTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end