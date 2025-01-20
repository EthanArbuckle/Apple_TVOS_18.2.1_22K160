@interface TVHListViewCell
+ (void)_configureFloatingContentViewAppearance;
- (BOOL)_canHandlePresses:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isDisabled;
- (BOOL)shouldAppearSelected;
- (TVHListViewCell)initWithFrame:(CGRect)a3;
- (TVHListViewCellDelegate)delegate;
- (_UIFloatingContentView)floatingContentView;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)backgroundColor;
- (unint64_t)_floatingContentViewControlState;
- (void)_setShouldAppearSelected:(BOOL)a3 andUpdateFloatingContentViewControlState:(BOOL)a4;
- (void)_updateFloatingContentViewControlState;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setShouldAppearSelected:(BOOL)a3;
@end

@implementation TVHListViewCell

- (TVHListViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v12,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(id)objc_opt_class(v3) _configureFloatingContentViewAppearance];
    v5 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v4->_floatingContentView;
    v4->_floatingContentView = v5;

    -[_UIFloatingContentView setRoundContentWhenDeselected:]( v4->_floatingContentView,  "setRoundContentWhenDeselected:",  0LL);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v4->_floatingContentView,  "setContentMotionRotation:translation:",  0.0,  0.0523598776,  0.0,  4.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_10PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_10PercentBlackColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v7,  v8));

    -[_UIFloatingContentView setBackgroundColor:forState:]( v4->_floatingContentView,  "setBackgroundColor:forState:",  v9,  4LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell contentView](v4, "contentView"));
    [v10 addSubview:v4->_floatingContentView];
  }

  return v4;
}

- (void)setShouldAppearSelected:(BOOL)a3
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  [v5 setBackgroundColor:v4 forState:0];
}

- (id)backgroundColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundColorForState:0]);

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  -[TVHListViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  -[TVHListViewCell bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
}

- (BOOL)canBecomeFocused
{
  return !-[TVHListViewCell isDisabled](self, "isDisabled");
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 _preferredConfigurationForFocusAnimation:a3 inContext:v6]);
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
    id v10 = -[TVHListViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v13,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v10);
  }

  v11 = (void *)v9;

  return v11;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[TVHListViewCell isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  -[TVHListViewCell setHighlighted:](&v8, "setHighlighted:", v3);
  if (v5 != v3)
  {
    unint64_t v6 = -[TVHListViewCell _floatingContentViewControlState](self, "_floatingContentViewControlState") | v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
    [v7 setControlState:v6 animated:1];
  }

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  -[TVHListViewCell prepareForReuse](&v4, "prepareForReuse");
  -[TVHListViewCell setShouldAppearSelected:](self, "setShouldAppearSelected:", 0LL);
  -[TVHListViewCell setDisabled:](self, "setDisabled:", 0LL);
  -[TVHListViewCell setDelegate:](self, "setDelegate:", 0LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  [v3 setControlState:0 animated:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell delegate](self, "delegate"));
  if (v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);
    id v9 = [v7 listViewCell:self shouldAppearSelectedForPreviouslyFocusedView:v8];

    if ((_DWORD)v9 != -[TVHListViewCell shouldAppearSelected](self, "shouldAppearSelected")) {
      -[TVHListViewCell _setShouldAppearSelected:andUpdateFloatingContentViewControlState:]( self,  "_setShouldAppearSelected:andUpdateFloatingContentViewControlState:",  v9,  0LL);
    }
  }

  -[TVHListViewCell _updateFloatingContentViewControlState](self, "_updateFloatingContentViewControlState");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHListViewCell _canHandlePresses:](self, "_canHandlePresses:", v6)) {
    -[TVHListViewCell setHighlighted:](self, "setHighlighted:", 1LL);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  -[TVHListViewCell pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  id v6 = a3;
  -[TVHListViewCell pressesCancelled:withEvent:](&v7, "pressesCancelled:withEvent:", v6, a4);
  LODWORD(a4) = -[TVHListViewCell _canHandlePresses:](self, "_canHandlePresses:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a4) {
    -[TVHListViewCell setHighlighted:](self, "setHighlighted:", 0LL);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHListViewCell;
  id v6 = a3;
  -[TVHListViewCell pressesEnded:withEvent:](&v7, "pressesEnded:withEvent:", v6, a4);
  LODWORD(a4) = -[TVHListViewCell _canHandlePresses:](self, "_canHandlePresses:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a4) {
    -[TVHListViewCell setHighlighted:](self, "setHighlighted:", 0LL);
  }
}

- (BOOL)_canHandlePresses:(id)a3
{
  id v4 = a3;
  if (-[TVHListViewCell isDisabled](self, "isDisabled")) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &stru_1000FE178);
  }

  return v5;
}

+ (void)_configureFloatingContentViewAppearance
{
  if (qword_1001572F8 != -1) {
    dispatch_once(&qword_1001572F8, &stru_1000FE198);
  }
}

- (unint64_t)_floatingContentViewControlState
{
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = v3 | -[TVHListViewCell isHighlighted](self, "isHighlighted");
  if (-[TVHListViewCell shouldAppearSelected](self, "shouldAppearSelected")) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

- (void)_setShouldAppearSelected:(BOOL)a3 andUpdateFloatingContentViewControlState:(BOOL)a4
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    if (a4) {
      -[TVHListViewCell _updateFloatingContentViewControlState](self, "_updateFloatingContentViewControlState");
    }
  }

- (void)_updateFloatingContentViewControlState
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  unint64_t v3 = -[TVHListViewCell _floatingContentViewControlState](self, "_floatingContentViewControlState");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell _currentFocusAnimationCoordinator](self, "_currentFocusAnimationCoordinator"));
  [v5 setControlState:v3 withAnimationCoordinator:v4];
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (TVHListViewCellDelegate)delegate
{
  return (TVHListViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void).cxx_destruct
{
}

@end