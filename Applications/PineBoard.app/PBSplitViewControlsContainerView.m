@interface PBSplitViewControlsContainerView
+ (id)_animationSettingsForStyle:(int64_t)a3;
- (BOOL)isEditingControlsVisible;
- (CGRect)editingControlBounds;
- (PBPIPControlButton)closeControl;
- (PBPIPControlButton)layoutOptionsControl;
- (PBPIPControlButton)toggleStashingControl;
- (PBSplitViewControlsContainerView)initWithFrame:(CGRect)a3;
- (UIGestureRecognizer)menuGestureRecognizer;
- (UIStackView)buttonsStackView;
- (UIView)gradientView;
- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4;
@end

@implementation PBSplitViewControlsContainerView

- (PBSplitViewControlsContainerView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PBSplitViewControlsContainerView;
  v3 = -[PBSplitViewControlsContainerView initWithFrame:]( &v36,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBSplitViewControlsContainerView setInsetsLayoutMarginsFromSafeArea:]( v3,  "setInsetsLayoutMarginsFromSafeArea:",  0LL);
    v5 = objc_alloc_init(&OBJC_CLASS___UITapGestureRecognizer);
    menuGestureRecognizer = v4->_menuGestureRecognizer;
    v4->_menuGestureRecognizer = &v5->super;

    -[UIGestureRecognizer setAllowedPressTypes:](v4->_menuGestureRecognizer, "setAllowedPressTypes:", &off_1003FE5C0);
    -[PBSplitViewControlsContainerView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_menuGestureRecognizer);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue( +[PBPIPViewBuilder makePipGradientViewWithCornerRadius:]( &OBJC_CLASS___PBPIPViewBuilder,  "makePipGradientViewWithCornerRadius:",  0LL));
    -[UIView setAlpha:](v7, "setAlpha:", 0.0);
    -[PBSplitViewControlsContainerView addSubview:](v4, "addSubview:", v7);
    gradientView = v4->_gradientView;
    v4->_gradientView = v7;
    v35 = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    buttonsStackView = v4->_buttonsStackView;
    v4->_buttonsStackView = v9;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_buttonsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v4->_buttonsStackView, "setAxis:", 0LL);
    -[UIStackView setAlignment:](v4->_buttonsStackView, "setAlignment:", 2LL);
    -[UIStackView setDistribution:](v4->_buttonsStackView, "setDistribution:", 4LL);
    -[UIStackView setSpacing:](v4->_buttonsStackView, "setSpacing:", 20.0);
    -[PBSplitViewControlsContainerView addSubview:](v4, "addSubview:", v4->_buttonsStackView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl hideSplitView](&OBJC_CLASS___PBPIPControl, "hideSplitView"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 createButton]);
    toggleStashingControl = v4->_toggleStashingControl;
    v4->_toggleStashingControl = (PBPIPControlButton *)v12;

    -[UIStackView addArrangedSubview:](v4->_buttonsStackView, "addArrangedSubview:", v4->_toggleStashingControl);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl splitViewLayout](&OBJC_CLASS___PBPIPControl, "splitViewLayout"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 createButton]);
    layoutOptionsControl = v4->_layoutOptionsControl;
    v4->_layoutOptionsControl = (PBPIPControlButton *)v15;

    -[UIStackView addArrangedSubview:](v4->_buttonsStackView, "addArrangedSubview:", v4->_layoutOptionsControl);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl end](&OBJC_CLASS___PBPIPControl, "end"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 createButton]);
    closeControl = v4->_closeControl;
    v4->_closeControl = (PBPIPControlButton *)v18;

    -[UIStackView addArrangedSubview:](v4->_buttonsStackView, "addArrangedSubview:", v4->_closeControl);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsContainerView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[UIView pb_constraintsForPinningToBottomOfView:]( v35,  "pb_constraintsForPinningToBottomOfView:",  v4));
    [v21 addObjectsFromArray:v22];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_buttonsStackView, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomAnchor]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v32]);
    v37[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v4->_buttonsStackView, "centerXAnchor"));
    v33 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v20 centerXAnchor]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
    v37[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v4->_buttonsStackView, "widthAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v20 widthAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintLessThanOrEqualToAnchor:v28]);
    v37[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL));
    [v21 addObjectsFromArray:v30];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v21);
    v4->_editingControlsVisible = 1;
    -[PBSplitViewControlsContainerView setEditingControlsVisible:animationStyle:]( v4,  "setEditingControlsVisible:animationStyle:",  0LL,  0LL);
  }

  return v4;
}

- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4
{
  if (self->_editingControlsVisible != a3)
  {
    self->_editingControlsVisible = a3;
    v7 = self->_buttonsStackView;
    v8 = self->_gradientView;
    id v9 = [(id)objc_opt_class(self) _animationSettingsForStyle:a4];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100059B30;
    v14[3] = &unk_1003D1490;
    v11 = v7;
    uint64_t v15 = v11;
    BOOL v17 = a3;
    uint64_t v12 = v8;
    v16 = v12;
    +[BSUIAnimationFactory animateWithSettings:actions:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:",  v10,  v14);
    if (!a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPControlButton contextMenuInteraction]( self->_layoutOptionsControl,  "contextMenuInteraction"));
      [v13 dismissMenu];
    }
  }

- (CGRect)editingControlBounds
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (id)_animationSettingsForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = 150.0;
  }

  else
  {
    if (a3 != 2)
    {
      double v4 = 0LL;
      return v4;
    }

    double v3 = 300.0;
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSSpringAnimationSettings settingsWithMass:stiffness:damping:]( &OBJC_CLASS___BSSpringAnimationSettings,  "settingsWithMass:stiffness:damping:",  1.0,  v3,  30.0));
  return v4;
}

- (BOOL)isEditingControlsVisible
{
  return self->_editingControlsVisible;
}

- (UIGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (PBPIPControlButton)toggleStashingControl
{
  return self->_toggleStashingControl;
}

- (PBPIPControlButton)layoutOptionsControl
{
  return self->_layoutOptionsControl;
}

- (PBPIPControlButton)closeControl
{
  return self->_closeControl;
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void).cxx_destruct
{
}

@end