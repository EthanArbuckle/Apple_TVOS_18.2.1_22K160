@interface TVMusicFloatingButton
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)alwaysAllowFocus;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shadowEnabled;
- (NSMutableDictionary)blurEffects;
- (NSMutableDictionary)tintColors;
- (TVMusicFloatingButton)buttonWithTransparentBackground;
- (TVMusicFloatingButton)initWithFrame:(CGRect)a3;
- (TVMusicFloatingButtonShadowConfig)focusedShadowConfig;
- (TVMusicFloatingButtonShadowConfig)unfocusedShadowConfig;
- (UIView)contentView;
- (_UIFloatingContentView)floatingView;
- (double)cornerRadius;
- (double)focusedSizeIncrease;
- (id)backgroundColor;
- (id)focusStateHandler;
- (id)preferredFocusEnvironments;
- (id)primaryActionHandler;
- (void)_handlePrimaryAction;
- (void)_selectButtonAction:(id)a3;
- (void)_updateBlurEffect;
- (void)_updateFloatingTintColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAlwaysAllowFocus:(BOOL)a3;
- (void)setBackgroundBlurEffect:(id)a3 forControlState:(unint64_t)a4;
- (void)setBackgroundColor:(id)a3 forControlState:(unint64_t)a4;
- (void)setBlurEffects:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFloatingView:(id)a3;
- (void)setFocusStateHandler:(id)a3;
- (void)setFocusedShadowConfig:(TVMusicFloatingButtonShadowConfig)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPrimaryActionHandler:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setTintColor:(id)a3 forControlState:(unint64_t)a4;
- (void)setTintColors:(id)a3;
- (void)setUnfocusedShadowConfig:(TVMusicFloatingButtonShadowConfig)a3;
@end

@implementation TVMusicFloatingButton

- (TVMusicFloatingButton)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVMusicFloatingButton;
  v3 = -[TVMusicFloatingButton initWithFrame:]( &v34,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    tintColors = v3->_tintColors;
    v3->_tintColors = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    blurEffects = v3->_blurEffects;
    v3->_blurEffects = (NSMutableDictionary *)v6;

    v8 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
    -[TVMusicFloatingButton bounds](v3, "bounds");
    v9 = -[_UIFloatingContentView initWithFrame:](v8, "initWithFrame:");
    floatingView = v3->_floatingView;
    v3->_floatingView = v9;

    -[_UIFloatingContentView setAutoresizingMask:](v3->_floatingView, "setAutoresizingMask:", 18LL);
    v11 = v3->_floatingView;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL));
    -[_UIFloatingContentView setFocusAnimationConfiguration:](v11, "setFocusAnimationConfiguration:", v12);

    -[_UIFloatingContentView setUseShadowImage:](v3->_floatingView, "setUseShadowImage:", 0LL);
    -[_UIFloatingContentView setShadowOpacity:](v3->_floatingView, "setShadowOpacity:", 0.0);
    -[_UIFloatingContentView setShadowRadius:](v3->_floatingView, "setShadowRadius:", 20.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v3->_floatingView, "setShadowVerticalOffset:", 20.0);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v3->_floatingView, "setFocusedSizeIncrease:", 14.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v3->_floatingView,  "setContentMotionRotation:translation:",  0.0,  0.0,  8.0,  8.0);
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](v3->_floatingView, "setFocusScaleAnchorPoint:", 0.5, 0.5);
    -[_UIFloatingContentView unfocusedShadowOpacity](v3->_floatingView, "unfocusedShadowOpacity");
    double v14 = v13;
    -[_UIFloatingContentView unfocusedShadowRadius](v3->_floatingView, "unfocusedShadowRadius");
    double v16 = v15;
    -[_UIFloatingContentView unfocusedShadowVerticalOffset](v3->_floatingView, "unfocusedShadowVerticalOffset");
    v3->_unfocusedShadowConfig.opacity = v14;
    v3->_unfocusedShadowConfig.radius = v16;
    v3->_unfocusedShadowConfig.verticalOffset = v17;
    -[_UIFloatingContentView shadowOpacity](v3->_floatingView, "shadowOpacity");
    double v19 = v18;
    -[_UIFloatingContentView shadowRadius](v3->_floatingView, "shadowRadius");
    double v21 = v20;
    -[_UIFloatingContentView shadowVerticalOffset](v3->_floatingView, "shadowVerticalOffset");
    v3->_focusedShadowConfig.opacity = v19;
    v3->_focusedShadowConfig.radius = v21;
    v3->_focusedShadowConfig.verticalOffset = v22;
    -[TVMusicFloatingButton addSubview:](v3, "addSubview:", v3->_floatingView);
    if (+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:]( &OBJC_CLASS___UIBlurEffect,  "_effectWithStyle:invertAutomaticStyle:",  5001LL,  1LL));
      v24 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v23);
      backgroundEffectView = v3->_backgroundEffectView;
      v3->_backgroundEffectView = v24;

      v26 = v3->_backgroundEffectView;
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v3->_floatingView,  "visualEffectContainerView"));
      [v27 bounds];
      -[UIVisualEffectView setFrame:](v26, "setFrame:");

      -[UIVisualEffectView setAutoresizingMask:](v3->_backgroundEffectView, "setAutoresizingMask:", 18LL);
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v3->_floatingView,  "visualEffectContainerView"));
      [v28 addSubview:v3->_backgroundEffectView];

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3->_blurEffects,  "setObject:forKeyedSubscript:",  v23,  &off_1002818E0);
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  4000LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v23 colorTint]);
      [v23 colorTintAlpha];
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "colorWithAlphaComponent:"));

      -[_UIFloatingContentView setBackgroundColor:forState:]( v3->_floatingView,  "setBackgroundColor:forState:",  v30,  0LL);
    }

    v31 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v3,  "_selectButtonAction:");
    selectRecognizer = v3->_selectRecognizer;
    v3->_selectRecognizer = v31;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v3->_selectRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setDelegate:](v3->_selectRecognizer, "setDelegate:", v3);
    -[TVMusicFloatingButton addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_selectRecognizer);
  }

  return v3;
}

- (TVMusicFloatingButton)buttonWithTransparentBackground
{
  self->_useTransparentBackground = 1;
  -[UIVisualEffectView setEffect:](self->_backgroundEffectView, "setEffect:", 0LL);
  -[TVMusicFloatingButton _updateFloatingTintColor](self, "_updateFloatingTintColor");
  return self;
}

- (void)setTintColor:(id)a3 forControlState:(unint64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton tintColors](self, "tintColors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)setBackgroundColor:(id)a3 forControlState:(unint64_t)a4
{
  if (!a4)
  {
    unsigned __int8 v7 = -[UIVisualEffectView isHidden](self->_backgroundEffectView, "isHidden");
    if (a3)
    {
      if ((v7 & 1) != 0) {
        return;
      }
    }

    else if ((v7 & 1) == 0)
    {
      return;
    }

    -[UIVisualEffectView setHidden:](self->_backgroundEffectView, "setHidden:", a3 != 0LL);
  }

- (void)setBackgroundBlurEffect:(id)a3 forControlState:(unint64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton blurEffects](self, "blurEffects"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v7 setObject:v6 forKeyedSubscript:v8];

  -[TVMusicFloatingButton _updateBlurEffect](self, "_updateBlurEffect");
}

- (id)backgroundColor
{
  return -[_UIFloatingContentView backgroundColorForState:](self->_floatingView, "backgroundColorForState:", 0LL);
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIVisualEffectView _setCornerRadius:](self->_backgroundEffectView, "_setCornerRadius:", a3);
    -[_UIFloatingContentView setCornerRadius:](self->_floatingView, "setCornerRadius:", a3);
  }

- (void)setFocusedSizeIncrease:(double)a3
{
}

- (double)focusedSizeIncrease
{
  return result;
}

- (UIView)contentView
{
  return (UIView *)-[_UIFloatingContentView contentView](self->_floatingView, "contentView");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_selectRecognizer == a3;
}

- (id)preferredFocusEnvironments
{
  floatingView = self->_floatingView;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &floatingView,  1LL));
}

- (BOOL)_isEligibleForFocusInteraction
{
  if (-[TVMusicFloatingButton alwaysAllowFocus](self, "alwaysAllowFocus")) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicFloatingButton;
  return -[TVMusicFloatingButton _isEligibleForFocusInteraction](&v4, "_isEligibleForFocusInteraction");
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicFloatingButton;
  -[TVMusicFloatingButton setHighlighted:](&v5, "setHighlighted:");
  -[_UIFloatingContentView setControlState:animated:]( self->_floatingView,  "setControlState:animated:",  (unint64_t)-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 0xFFFFFFFFFFFFFFFELL | v3,  1LL);
  -[TVMusicFloatingButton _updateFloatingTintColor](self, "_updateFloatingTintColor");
  -[TVMusicFloatingButton _updateBlurEffect](self, "_updateBlurEffect");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicFloatingButton;
  -[TVMusicFloatingButton setSelected:](&v7, "setSelected:");
  unint64_t v5 = (unint64_t)-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v6 = 4LL;
  if (!v3) {
    uint64_t v6 = 0LL;
  }
  -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", v5 | v6, 1LL);
  -[TVMusicFloatingButton _updateFloatingTintColor](self, "_updateFloatingTintColor");
  -[TVMusicFloatingButton _updateBlurEffect](self, "_updateBlurEffect");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicFloatingButton;
  id v7 = a3;
  -[TVMusicFloatingButton didUpdateFocusInContext:withAnimationCoordinator:]( &v13,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  id v8 = (TVMusicFloatingButton *)objc_claimAutoreleasedReturnValue([v7 nextFocusedView]);

  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( self->_floatingView,  "setControlState:withAnimationCoordinator:",  (unint64_t)-[_UIFloatingContentView controlState](self->_floatingView, "controlState") & 0xFFFFFFFFFFFFFFF7LL | (8LL * (v8 == self)),  v6);
  if (v8 == self)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007F8B4;
    v12[3] = &unk_100268CF0;
    v12[4] = self;
    [v6 addCoordinatedAnimations:v12 completion:0];
  }

  else
  {
    -[_UIFloatingContentView setShadowOpacity:](self->_floatingView, "setShadowOpacity:", 0.0);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007F8D0;
  v11[3] = &unk_100268CF0;
  v11[4] = self;
  [v6 addCoordinatedAnimations:v11 completion:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton focusStateHandler](self, "focusStateHandler"));

  if (v9)
  {
    v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVMusicFloatingButton focusStateHandler]( self,  "focusStateHandler"));
    ((void (**)(void, TVMusicFloatingButton *, BOOL))v10)[2](v10, self, v8 == self);
  }
}

- (void)setShadowEnabled:(BOOL)a3
{
}

- (BOOL)shadowEnabled
{
  return -[_UIFloatingContentView isShadowEnabled](self->_floatingView, "isShadowEnabled");
}

- (void)setFocusedShadowConfig:(TVMusicFloatingButtonShadowConfig)a3
{
  double verticalOffset = a3.verticalOffset;
  double opacity = a3.opacity;
  self->_focusedShadowConfig = a3;
  -[_UIFloatingContentView setShadowRadius:](self->_floatingView, "setShadowRadius:", a3.radius);
  -[_UIFloatingContentView setShadowOpacity:](self->_floatingView, "setShadowOpacity:", opacity);
  -[_UIFloatingContentView setShadowVerticalOffset:](self->_floatingView, "setShadowVerticalOffset:", verticalOffset);
}

- (void)setUnfocusedShadowConfig:(TVMusicFloatingButtonShadowConfig)a3
{
  double verticalOffset = a3.verticalOffset;
  double opacity = a3.opacity;
  self->_unfocusedShadowConfig = a3;
  -[_UIFloatingContentView setUnfocusedShadowRadius:](self->_floatingView, "setUnfocusedShadowRadius:", a3.radius);
  -[_UIFloatingContentView setUnfocusedShadowOpacity:](self->_floatingView, "setUnfocusedShadowOpacity:", opacity);
  -[_UIFloatingContentView setUnfocusedShadowVerticalOffset:]( self->_floatingView,  "setUnfocusedShadowVerticalOffset:",  verticalOffset);
}

- (void)setPrimaryActionHandler:(id)a3
{
  id v4 = [a3 copy];
  id primaryActionHandler = self->_primaryActionHandler;
  self->_id primaryActionHandler = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicFloatingButton actionsForTarget:forControlEvent:]( self,  "actionsForTarget:forControlEvent:",  self,  0x2000LL));
  id v7 = NSStringFromSelector("_handlePrimaryAction");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = [v6 containsObject:v8];

  id v10 = self->_primaryActionHandler;
  if (!v10 || (v9 & 1) != 0)
  {
    if (v10) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = v9;
    }
    if (v11 == 1) {
      -[TVMusicFloatingButton removeTarget:action:forControlEvents:]( self,  "removeTarget:action:forControlEvents:",  self,  "_handlePrimaryAction",  0x2000LL);
    }
  }

  else
  {
    -[TVMusicFloatingButton addTarget:action:forControlEvents:]( self,  "addTarget:action:forControlEvents:",  self,  "_handlePrimaryAction",  0x2000LL);
  }

- (void)_handlePrimaryAction
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton primaryActionHandler](self, "primaryActionHandler"));

  if (v3)
  {
    id v4 = (void (**)(id, TVMusicFloatingButton *))objc_claimAutoreleasedReturnValue( -[TVMusicFloatingButton primaryActionHandler]( self,  "primaryActionHandler"));
    v4[2](v4, self);
  }

- (void)_selectButtonAction:(id)a3
{
  id v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 4) >= 2)
  {
    if (v4 == (char *)1)
    {
      uint64_t v5 = 1LL;
      goto LABEL_7;
    }

    -[TVMusicFloatingButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000LL);
  }

  uint64_t v5 = 0LL;
LABEL_7:
  -[TVMusicFloatingButton setHighlighted:](self, "setHighlighted:", v5);
}

- (void)_updateFloatingTintColor
{
  unsigned __int8 v3 = -[_UIFloatingContentView controlState](self->_floatingView, "controlState");
  if (!self->_useTransparentBackground)
  {
    unsigned __int8 v4 = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton tintColors](self, "tintColors"));
    id v6 = v5;
    if ((v4 & 8) != 0)
    {
      if ((v4 & 4) != 0)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_1002818F8]);
        if (!v7)
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
          goto LABEL_14;
        }

        goto LABEL_13;
      }

      unsigned int v9 = &off_100281910;
    }

    else
    {
      if ((v4 & 4) == 0)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_1002818E0]);
        if (!v7)
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
LABEL_14:
          id v11 = v8;

          goto LABEL_15;
        }

        goto LABEL_13;
      }

      unsigned int v9 = &off_100281928;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
    if (!v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
      goto LABEL_14;
    }

- (void)_updateBlurEffect
{
  unsigned __int8 v3 = -[_UIFloatingContentView controlState](self->_floatingView, "controlState");
  if (self->_useTransparentBackground)
  {
    id v4 = 0LL;
  }

  else
  {
    unsigned __int8 v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton blurEffects](self, "blurEffects"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v5 & 0xC));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    id v4 = v8;
  }

  id v9 = v4;
  -[UIVisualEffectView setEffect:](self->_backgroundEffectView, "setEffect:", v4);
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (BOOL)alwaysAllowFocus
{
  return self->_alwaysAllowFocus;
}

- (void)setAlwaysAllowFocus:(BOOL)a3
{
  self->_alwaysAllowFocus = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (TVMusicFloatingButtonShadowConfig)unfocusedShadowConfig
{
  double opacity = self->_unfocusedShadowConfig.opacity;
  double radius = self->_unfocusedShadowConfig.radius;
  double verticalOffset = self->_unfocusedShadowConfig.verticalOffset;
  result.double verticalOffset = verticalOffset;
  result.double radius = radius;
  result.double opacity = opacity;
  return result;
}

- (TVMusicFloatingButtonShadowConfig)focusedShadowConfig
{
  double opacity = self->_focusedShadowConfig.opacity;
  double radius = self->_focusedShadowConfig.radius;
  double verticalOffset = self->_focusedShadowConfig.verticalOffset;
  result.double verticalOffset = verticalOffset;
  result.double radius = radius;
  result.double opacity = opacity;
  return result;
}

- (id)primaryActionHandler
{
  return self->_primaryActionHandler;
}

- (id)focusStateHandler
{
  return self->_focusStateHandler;
}

- (void)setFocusStateHandler:(id)a3
{
}

- (NSMutableDictionary)tintColors
{
  return self->_tintColors;
}

- (void)setTintColors:(id)a3
{
}

- (NSMutableDictionary)blurEffects
{
  return self->_blurEffects;
}

- (void)setBlurEffects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end