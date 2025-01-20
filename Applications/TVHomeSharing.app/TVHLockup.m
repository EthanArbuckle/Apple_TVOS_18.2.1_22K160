@interface TVHLockup
+ (BOOL)_inheritsAncestorHighlighting;
+ (id)_contentViewWithLockupLayout:(id)a3;
+ (id)_footerViewWithLockupLayout:(id)a3;
+ (id)new;
+ (void)_prepareLockupCompopnentForReuse:(id)a3;
+ (void)_updateComponentAppearanceForLockupCompopnent:(id)a3 state:(unint64_t)a4;
+ (void)_updateLockupComponentsHighContrastAppearanceWithLockupComponent:(id)a3 state:(unint64_t)a4;
- (BOOL)_canAncestorBecomeFocused;
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAncestorFocused;
- (CGSize)_contentViewSizeIncludingFocusIncrease;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHLockup)init;
- (TVHLockup)initWithCoder:(id)a3;
- (TVHLockup)initWithFrame:(CGRect)a3;
- (TVHLockup)initWithLayout:(id)a3;
- (TVHLockupLayout)layout;
- (UIView)contentView;
- (UIView)footerView;
- (double)focusedSizeIncrease;
- (unint64_t)_currentState;
- (unint64_t)_currentStateByApplyingAncestorFocusState;
- (unint64_t)_currentStateForFocusUpdateContext:(id)a3;
- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_handleHighConstrastFocusIndicatorsEnabledNotification:(id)a3;
- (void)_updateAncestorFocusedAndAppearanceForFocusUpdateContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_updateAppearanceWithState:(unint64_t)a3 animationCoordinator:(id)a4;
- (void)_updateFooterGeometry;
- (void)_updateFooterGeometryIncludingVertically:(BOOL)a3;
- (void)_updateFooterHorizontalGeometry;
- (void)_updateLockupComponentsAppearanceForLockupState:(unint64_t)a3;
- (void)_updateLockupComponentsHighContrastAppearanceWithLockupState:(unint64_t)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAncestorFocused:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TVHLockup

+ (id)new
{
  return 0LL;
}

- (TVHLockup)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHLockup)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHLockup)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHLockup)initWithLayout:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHLockup;
  v6 = -[TVHLockup initWithFrame:]( &v17,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layout, a3);
    v7->_focusedSizeIncrease = 60.0;
    -[TVHLockup setEnabled:](v7, "setEnabled:", 1LL);
    -[TVHLockup setAncestorFocused:](v7, "setAncestorFocused:", 0LL);
    -[TVHLockup _setTracksFocusedAncestors:](v7, "_setTracksFocusedAncestors:", 1LL);
    *(void *)&double v8 = objc_opt_class(v7).n128_u64[0];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_contentViewWithLockupLayout:", v5, v8));
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v10;

    -[TVHLockup addSubview:](v7, "addSubview:", v7->_contentView);
    *(void *)&double v12 = objc_opt_class(v7).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_footerViewWithLockupLayout:", v5, v12));
    if (v14)
    {
      objc_storeStrong((id *)&v7->_footerView, v14);
      -[TVHLockup addSubview:](v7, "addSubview:", v14);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v7 selector:"_handleHighConstrastFocusIndicatorsEnabledNotification:" name:kAXSHighContrastFocusIndicatorsEnabledNotification object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHLockup;
  -[TVHLockup dealloc](&v4, "dealloc");
}

- (void)setFocusedSizeIncrease:(double)a3
{
  if (self->_focusedSizeIncrease != a3) {
    self->_focusedSizeIncrease = a3;
  }
}

- (void)prepareForReuse
{
  *(void *)&double v3 = objc_opt_class(self).n128_u64[0];
  id v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup contentView](self, "contentView", v3));
  [v5 _prepareLockupCompopnentForReuse:v6];

  *(void *)&double v7 = objc_opt_class(self).n128_u64[0];
  id v9 = v8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHLockup footerView](self, "footerView", v7));
  [v9 _prepareLockupCompopnentForReuse:v10];
}

+ (id)_contentViewWithLockupLayout:(id)a3
{
  return -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, v3, v4);
}

+ (id)_footerViewWithLockupLayout:(id)a3
{
  return 0LL;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup layout](self, "layout", a3.width, a3.height));
  [v4 contentViewSize];
  double v6 = v5;
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup footerView](self, "footerView"));
  if (v9)
  {
    [v4 contentViewToFooterViewSpacing];
    double v11 = v8 + v10;
    [v4 footerViewHeight];
    double v8 = v11 + v12;
  }

  double v13 = v6;
  double v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHLockup;
  -[TVHLockup layoutSubviews](&v9, "layoutSubviews");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup layout](self, "layout"));
  [v3 contentViewSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup contentView](self, "contentView"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v7);

  -[TVHLockup _updateFooterGeometry](self, "_updateFooterGeometry");
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHLockup;
  id v6 = a4;
  id v7 = a3;
  -[TVHLockup _ancestorWillUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "_ancestorWillUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  -[TVHLockup _updateAncestorFocusedAndAppearanceForFocusUpdateContext:withAnimationCoordinator:]( self,  "_updateAncestorFocusedAndAppearanceForFocusUpdateContext:withAnimationCoordinator:",  v7,  v6,  v8.receiver,  v8.super_class);
}

+ (BOOL)_inheritsAncestorHighlighting
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return !-[TVHLockup _canAncestorBecomeFocused](self, "_canAncestorBecomeFocused");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHLockup;
  id v6 = a4;
  id v7 = a3;
  -[TVHLockup didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  -[TVHLockup _updateAncestorFocusedAndAppearanceForFocusUpdateContext:withAnimationCoordinator:]( self,  "_updateAncestorFocusedAndAppearanceForFocusUpdateContext:withAnimationCoordinator:",  v7,  v6,  v8.receiver,  v8.super_class);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[TVHLockup isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHLockup;
  -[TVHLockup setHighlighted:](&v6, "setHighlighted:", v3);
  if (v5 != v3) {
    -[TVHLockup _updateLockupComponentsAppearanceForLockupState:]( self,  "_updateLockupComponentsAppearanceForLockupState:",  -[TVHLockup _currentState](self, "_currentState"));
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[TVHLockup isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHLockup;
  -[TVHLockup setEnabled:](&v6, "setEnabled:", v3);
  if (v5 != v3) {
    -[TVHLockup _updateLockupComponentsAppearanceForLockupState:]( self,  "_updateLockupComponentsAppearanceForLockupState:",  -[TVHLockup _currentState](self, "_currentState"));
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHLockup _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHLockup setHighlighted:](self, "setHighlighted:", 1LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHLockup;
    -[TVHLockup pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHLockup _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHLockup setHighlighted:](self, "setHighlighted:", 0LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHLockup;
    -[TVHLockup pressesCancelled:withEvent:](&v8, "pressesCancelled:withEvent:", v6, v7);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHLockup _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHLockup setHighlighted:](self, "setHighlighted:", 0LL);
    -[TVHLockup sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHLockup;
    -[TVHLockup pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);
  }
}

- (void)_handleHighConstrastFocusIndicatorsEnabledNotification:(id)a3
{
}

- (void)_updateAncestorFocusedAndAppearanceForFocusUpdateContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = a4;
  unint64_t v6 = -[TVHLockup _currentStateForFocusUpdateContext:](self, "_currentStateForFocusUpdateContext:", a3);
  if (-[TVHLockup _canAncestorBecomeFocused](self, "_canAncestorBecomeFocused")) {
    -[TVHLockup setAncestorFocused:](self, "setAncestorFocused:", (v6 >> 3) & 1);
  }
  -[TVHLockup _updateAppearanceWithState:animationCoordinator:]( self,  "_updateAppearanceWithState:animationCoordinator:",  v6,  v7);
}

- (void)_updateAppearanceWithState:(unint64_t)a3 animationCoordinator:(id)a4
{
  id v6 = a4;
  -[TVHLockup _updateLockupComponentsAppearanceForLockupState:]( self,  "_updateLockupComponentsAppearanceForLockupState:",  a3);
  -[TVHLockup _updateFooterHorizontalGeometry](self, "_updateFooterHorizontalGeometry");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083350;
  v7[3] = &unk_1000FCEA8;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (unint64_t)_currentStateForFocusUpdateContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)-[TVHLockup state](self, "state");
  id v6 = (TVHLockup *)objc_claimAutoreleasedReturnValue([v4 nextFocusedView]);

  if (v6 == self
    || !v4 && (-[TVHLockup isFocused](self, "isFocused") & 1) != 0
    || -[TVHLockup isDescendantOfView:](self, "isDescendantOfView:", v6))
  {
    unint64_t v7 = v5 | 8;
  }

  else
  {
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFF7LL;
  }

  return v7;
}

- (unint64_t)_currentStateByApplyingAncestorFocusState
{
  unint64_t v3 = (unint64_t)-[TVHLockup state](self, "state");
  if (-[TVHLockup isAncestorFocused](self, "isAncestorFocused")) {
    return v3 | 8;
  }
  else {
    return v3 ^ 0xFFFFFFFFFFFFFFF7LL;
  }
}

- (unint64_t)_currentState
{
  if (-[TVHLockup _canAncestorBecomeFocused](self, "_canAncestorBecomeFocused")) {
    return -[TVHLockup _currentStateByApplyingAncestorFocusState](self, "_currentStateByApplyingAncestorFocusState");
  }
  else {
    return (unint64_t)-[TVHLockup state](self, "state");
  }
}

- (void)_updateLockupComponentsAppearanceForLockupState:(unint64_t)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unint64_t v7 = v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup contentView](self, "contentView", v5));
  [v7 _updateComponentAppearanceForLockupCompopnent:v8 state:a3];

  *(void *)&double v9 = objc_opt_class(self).n128_u64[0];
  double v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVHLockup footerView](self, "footerView", v9));
  [v11 _updateComponentAppearanceForLockupCompopnent:v12 state:a3];
}

+ (void)_updateComponentAppearanceForLockupCompopnent:(id)a3 state:(unint64_t)a4
{
  id v8 = a3;
  unsigned int v5 = [v8 conformsToProtocol:&OBJC_PROTOCOL___TVHLockupComponent];
  id v6 = v8;
  if (v5)
  {
    id v7 = v8;
    if ((objc_opt_respondsToSelector(v7, "updateAppearanceForLockupState:") & 1) != 0) {
      [v7 updateAppearanceForLockupState:a4];
    }

    id v6 = v8;
  }
}

- (void)_updateLockupComponentsHighContrastAppearanceWithLockupState:(unint64_t)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup contentView](self, "contentView", v5));
  [v7 _updateLockupComponentsHighContrastAppearanceWithLockupComponent:v8 state:a3];

  *(void *)&double v9 = objc_opt_class(self).n128_u64[0];
  double v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVHLockup footerView](self, "footerView", v9));
  [v11 _updateLockupComponentsHighContrastAppearanceWithLockupComponent:v12 state:a3];
}

+ (void)_updateLockupComponentsHighContrastAppearanceWithLockupComponent:(id)a3 state:(unint64_t)a4
{
  id v8 = a3;
  unsigned int v5 = [v8 conformsToProtocol:&OBJC_PROTOCOL___TVHLockupComponent];
  id v6 = v8;
  if (v5)
  {
    id v7 = v8;
    if ((objc_opt_respondsToSelector(v7, "updateHighConstrastAppearanceWithLockupState:") & 1) != 0) {
      [v7 updateHighConstrastAppearanceWithLockupState:a4];
    }

    id v6 = v8;
  }
}

+ (void)_prepareLockupCompopnentForReuse:(id)a3
{
  id v6 = a3;
  unsigned int v3 = [v6 conformsToProtocol:&OBJC_PROTOCOL___TVHLockupComponent];
  id v4 = v6;
  if (v3)
  {
    id v5 = v6;
    if ((objc_opt_respondsToSelector(v5, "prepareForReuse") & 1) != 0) {
      [v5 prepareForReuse];
    }

    id v4 = v6;
  }
}

- (BOOL)_canHandlePresses:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_updateFooterHorizontalGeometry
{
}

- (void)_updateFooterGeometry
{
}

- (void)_updateFooterGeometryIncludingVertically:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup footerView](self, "footerView"));
  if (v5)
  {
    id v27 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup contentView](self, "contentView"));
    [v6 frame];
    double v8 = v7;
    CGFloat rect = v9;
    double v11 = v10;
    double v13 = v12;
    -[TVHLockup _contentViewSizeIncludingFocusIncrease](self, "_contentViewSizeIncludingFocusIncrease");
    double v15 = v14;
    double v17 = v16;
    double v18 = v14 - v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup layout](self, "layout"));
    double v20 = v8 - ceil(v18 * 0.5);
    [v19 contentViewToFooterViewSpacing];
    double v22 = v21;
    [v19 footerViewHeight];
    double v24 = v23;
    if (v3)
    {
      v28.origin.x = v8;
      v28.origin.y = rect;
      v28.size.width = v11;
      v28.size.height = v13;
      double v25 = v22 + ceil((v17 - v13) * 0.5) + CGRectGetMaxY(v28);
    }

    else
    {
      [v27 frame];
    }

    objc_msgSend(v27, "setFrame:", v20, v25, v15, v24);

    unsigned __int8 v5 = v27;
  }
}

- (CGSize)_contentViewSizeIncludingFocusIncrease
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup layout](self, "layout"));
  [v3 contentViewSize];
  double v5 = v4;
  double v7 = v6;

  if ((-[TVHLockup _currentStateByApplyingAncestorFocusState]( self,  "_currentStateByApplyingAncestorFocusState") & 8) != 0)
  {
    -[TVHLockup focusedSizeIncrease](self, "focusedSizeIncrease");
    sub_100095468(v5, v7, v10);
  }

  else
  {
    double v8 = v5;
    double v9 = v7;
  }

  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_canAncestorBecomeFocused
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHLockup superview](self, "superview"));
  if (!v2) {
    return 0;
  }
  BOOL v3 = (void *)v2;
  do
  {
    unsigned __int8 v4 = [v3 canBecomeFocused];
    if ((v4 & 1) != 0) {
      break;
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 superview]);

    BOOL v3 = (void *)v5;
  }

  while (v5);

  return v4;
}

- (TVHLockupLayout)layout
{
  return self->_layout;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (BOOL)isAncestorFocused
{
  return self->_ancestorFocused;
}

- (void)setAncestorFocused:(BOOL)a3
{
  self->_ancestorFocused = a3;
}

- (void).cxx_destruct
{
}

@end