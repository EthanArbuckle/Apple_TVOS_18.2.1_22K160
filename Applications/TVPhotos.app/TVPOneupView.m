@interface TVPOneupView
- (BOOL)_isValidIndex:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPerformingTransitionAnimation;
- (TVPOneupView)initWithFrame:(CGRect)a3;
- (TVPOneupViewDataSource)dataSource;
- (TVPOneupViewDelegate)delegate;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UISwipeGestureRecognizer)downSwipeGesture;
- (UISwipeGestureRecognizer)leftSwipeGesture;
- (UISwipeGestureRecognizer)rightSwipeGesture;
- (UISwipeGestureRecognizer)upSwipeGesture;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)currentSupplementaryView;
- (UIView)currentView;
- (UIView)spareSupplementaryView;
- (UIView)spareView;
- (id)dequeueReusableItemView;
- (int64_t)focusedItemIndex;
- (unint64_t)allowedModes;
- (unint64_t)currentMode;
- (unint64_t)nextEventType;
- (unint64_t)transition;
- (void)_addAllSubviews;
- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4;
- (void)_configureSupplementaryView;
- (void)_doubleTapAction:(id)a3;
- (void)_downAction:(id)a3;
- (void)_leftAction:(id)a3;
- (void)_menuAction:(id)a3;
- (void)_panAction:(id)a3;
- (void)_performNextEventTransitionIfRequired;
- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4;
- (void)_playButtonAction:(id)a3;
- (void)_rightAction:(id)a3;
- (void)_selectButtonAction:(id)a3;
- (void)_transitionToCaptionMode;
- (void)_transitionToFullScreenMode;
- (void)_transitionToItemAtIndex:(int64_t)a3;
- (void)_transitionToSupplementaryView:(id)a3 itemView:(id)a4;
- (void)_upAction:(id)a3;
- (void)layoutSubviews;
- (void)registerItemViewClass:(Class)a3;
- (void)registerSupplementaryViewClass:(Class)a3;
- (void)reloadData;
- (void)setAdjustedFocusIndex:(int64_t)a3;
- (void)setAllowedModes:(unint64_t)a3;
- (void)setCurrentMode:(unint64_t)a3;
- (void)setCurrentSupplementaryView:(id)a3;
- (void)setCurrentView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownSwipeGesture:(id)a3;
- (void)setFocusedItemIndex:(int64_t)a3;
- (void)setIsPerformingTransitionAnimation:(BOOL)a3;
- (void)setLeftSwipeGesture:(id)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setNextEventType:(unint64_t)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setRightSwipeGesture:(id)a3;
- (void)setSpareSupplementaryView:(id)a3;
- (void)setSpareView:(id)a3;
- (void)setTransition:(unint64_t)a3;
- (void)setUpSwipeGesture:(id)a3;
@end

@implementation TVPOneupView

- (TVPOneupView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVPOneupView;
  v3 = -[TVPOneupView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_focusedItemIndex = -1LL;
    v3->_allowedModes = 1LL;
    v3->_currentMode = 1LL;
    v3->_nextEventType = 0LL;
    v3->_isPerformingTransitionAnimation = 0;
    v19 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v3,  "_doubleTapAction:");
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v19, "setNumberOfTapsRequired:", 2LL);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v19);
    v18 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_leftAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v18, "setAllowedPressTypes:", &off_1000D1CD8);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v18);
    v17 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_leftAction:");
    -[UISwipeGestureRecognizer setDirection:](v17, "setDirection:", 2LL);
    -[TVPOneupView setLeftSwipeGesture:](v4, "setLeftSwipeGesture:", v17);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v17);
    v16 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_rightAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v16, "setAllowedPressTypes:", &off_1000D1CF0);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v16);
    v5 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_rightAction:");
    -[UISwipeGestureRecognizer setDirection:](v5, "setDirection:", 1LL);
    -[TVPOneupView setRightSwipeGesture:](v4, "setRightSwipeGesture:", v5);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v5);
    v15 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_upAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v15, "setAllowedPressTypes:", &off_1000D1D08);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v15);
    v6 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_upAction:");
    -[UISwipeGestureRecognizer setDirection:](v6, "setDirection:", 4LL);
    -[TVPOneupView setUpSwipeGesture:](v4, "setUpSwipeGesture:", v6);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v6);
    v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_downAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_1000D1D20);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v7);
    v8 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_downAction:");
    -[UISwipeGestureRecognizer setDirection:](v8, "setDirection:", 8LL);
    -[TVPOneupView setDownSwipeGesture:](v4, "setDownSwipeGesture:", v8);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v8);
    v9 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  v4,  "_panAction:");
    -[UIPanGestureRecognizer setDelegate:](v9, "setDelegate:", v4);
    -[UIPanGestureRecognizer _setCanPanVertically:](v9, "_setCanPanVertically:", 0LL);
    -[UIPanGestureRecognizer _setHysteresis:](v9, "_setHysteresis:", 40.0);
    -[TVPOneupView setPanGestureRecognizer:](v4, "setPanGestureRecognizer:", v9);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v9, "requireGestureRecognizerToFail:", v6);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v9, "requireGestureRecognizerToFail:", v8);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v9);
    v10 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_menuAction:");
    -[UITapGestureRecognizer setDelegate:](v10, "setDelegate:", v4);
    -[UITapGestureRecognizer setAllowedPressTypes:](v10, "setAllowedPressTypes:", &off_1000D1D38);
    -[TVPOneupView setMenuGestureRecognizer:](v4, "setMenuGestureRecognizer:", v10);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v10);
    v11 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_selectButtonAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v11, "setAllowedPressTypes:", &off_1000D1D50);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v11);
    v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_playButtonAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_1000D1D68);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v12);
    v13 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v4,  "_longPressAction:");
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v13, "setMinimumPressDuration:", 1.0);
    -[UILongPressGestureRecognizer setAllowedTouchTypes:](v13, "setAllowedTouchTypes:", &off_1000D1D80);
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v13, "setAllowedPressTypes:", &__NSArray0__struct);
    -[TVPOneupView addGestureRecognizer:](v4, "addGestureRecognizer:", v13);
    -[TVPOneupView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", @"TVPOneupView");
  }

  return v4;
}

- (void)setDataSource:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "oneupView:didFocusItemAtIndex:") & 1;
  if ((objc_opt_respondsToSelector(v5, "oneupView:didSelectItemAtIndex:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector(v5, "oneupView:didPlayItemAtIndex:");

  if ((v7 & 1) != 0) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (void)setFocusedItemIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    if (self->_focusedItemIndex == -1)
    {
      self->_focusedItemIndex = a3;
      -[TVPOneupView setNeedsLayout](self, "setNeedsLayout");
    }

    else
    {
      -[TVPOneupView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:");
    }
  }

- (void)setAdjustedFocusIndex:(int64_t)a3
{
  self->_focusedItemIndex = a3;
}

- (void)reloadData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView subviews](self, "subviews"));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      char v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeFromSuperview];
        char v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  self->_reloadOnLayout = 1;
  -[TVPOneupView setNeedsLayout](self, "setNeedsLayout");
}

- (void)registerItemViewClass:(Class)a3
{
  self->_viewClass = a3;
}

- (id)dequeueReusableItemView
{
  return -[TVPOneupView spareView](self, "spareView");
}

- (void)registerSupplementaryViewClass:(Class)a3
{
  self->_supplementaryViewClass = a3;
}

- (void)layoutSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
    -[TVPOneupView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v4,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
  }

  else
  {
    id v5 = objc_alloc(self->_viewClass);
    -[TVPOneupView bounds](self, "bounds");
    id v6 = objc_msgSend(v5, "initWithFrame:");
    -[TVPOneupView setCurrentView:](self, "setCurrentView:", v6);

    id v7 = objc_alloc(self->_viewClass);
    -[TVPOneupView bounds](self, "bounds");
    id v8 = objc_msgSend(v7, "initWithFrame:");
    -[TVPOneupView setSpareView:](self, "setSpareView:", v8);

    id v9 = objc_alloc_init(self->_supplementaryViewClass);
    -[TVPOneupView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", v9);

    id v10 = objc_alloc_init(self->_supplementaryViewClass);
    -[TVPOneupView setSpareSupplementaryView:](self, "setSpareSupplementaryView:", v10);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
    [v11 setAlpha:0.0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView spareSupplementaryView](self, "spareSupplementaryView"));
    [v12 setAlpha:0.0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    uint64_t v14 = (uint64_t)[v13 numberOfItemsInOneupView:self];

    if (v14 < 1) {
      goto LABEL_4;
    }
    if (-[TVPOneupView focusedItemIndex](self, "focusedItemIndex") < 0
      || -[TVPOneupView focusedItemIndex](self, "focusedItemIndex") >= v14)
    {
      self->_focusedItemIndex = 0LL;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "oneupView:viewForItemAtIndex:",  self,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
    -[TVPOneupView setSpareView:](self, "setSpareView:", v16);

    -[TVPOneupView setCurrentView:](self, "setCurrentView:", v4);
    -[TVPOneupView _addAllSubviews](self, "_addAllSubviews");
    -[TVPOneupView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v4,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
    if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
    {
      -[TVPOneupView _configureSupplementaryView](self, "_configureSupplementaryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
      [v17 frame];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
      v29.origin.x = v19;
      v29.origin.y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      double Width = CGRectGetWidth(v29);
      v30.origin.x = v19;
      v30.origin.y = v21;
      v30.size.width = v23;
      v30.size.height = v25;
      objc_msgSend(v26, "setFrame:", 0.0, 982.0, Width, CGRectGetHeight(v30));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
      [v28 setAlpha:1.0];
    }
  }

LABEL_4:
  if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4 && self->_reloadOnLayout) {
    -[TVPOneupView _configureSupplementaryView](self, "_configureSupplementaryView");
  }
  self->_reloadOnLayout = 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_selectButtonAction:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate", a3));
    objc_msgSend( v4,  "oneupView:didSelectItemAtIndex:",  self,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
  }

- (void)_playButtonAction:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate", a3));
    objc_msgSend(v4, "oneupView:didPlayItemAtIndex:", self, -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
  }

- (void)_leftAction:(id)a3
{
  id v18 = a3;
  id v4 = -[TVPOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  BOOL v5 = (id)-[TVPOneupView currentMode](self, "currentMode") == (id)2;
  id v7 = v18;
  if (!v5)
  {
    if (self->_isPerformingTransitionAnimation)
    {
      id v7 = v18;
      if (!self->_nextEventType)
      {
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer, v6);
        BOOL v5 = (objc_opt_isKindOfClass(v18, v8) & 1) == 0;
        id v7 = v18;
        unint64_t v9 = 1LL;
        if (v5) {
          unint64_t v9 = 2LL;
        }
        self->_nextEventType = v9;
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer, v6);
      char v11 = (v4 != (id)1) ^ objc_opt_isKindOfClass(v18, v10);
      int64_t v12 = -[TVPOneupView focusedItemIndex](self, "focusedItemIndex");
      if ((v11 & 1) != 0) {
        int64_t v13 = v12 + 1;
      }
      else {
        int64_t v13 = v12 - 1;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
      char v15 = objc_opt_respondsToSelector(v14, "oneupView:willBeginViewTransitionForFocusedView:");

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        [v16 oneupView:self willBeginViewTransitionForFocusedView:v17];
      }

      -[TVPOneupView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:", v13);
      id v7 = v18;
    }
  }
}

- (void)_rightAction:(id)a3
{
  id v18 = a3;
  id v4 = -[TVPOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  BOOL v5 = (id)-[TVPOneupView currentMode](self, "currentMode") == (id)2;
  id v7 = v18;
  if (!v5)
  {
    if (self->_isPerformingTransitionAnimation)
    {
      id v7 = v18;
      if (!self->_nextEventType)
      {
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer, v6);
        BOOL v5 = (objc_opt_isKindOfClass(v18, v8) & 1) == 0;
        id v7 = v18;
        unint64_t v9 = 1LL;
        if (!v5) {
          unint64_t v9 = 2LL;
        }
        self->_nextEventType = v9;
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer, v6);
      char v11 = (v4 != (id)1) ^ objc_opt_isKindOfClass(v18, v10);
      int64_t v12 = -[TVPOneupView focusedItemIndex](self, "focusedItemIndex");
      if ((v11 & 1) != 0) {
        int64_t v13 = v12 - 1;
      }
      else {
        int64_t v13 = v12 + 1;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
      char v15 = objc_opt_respondsToSelector(v14, "oneupView:willBeginViewTransitionForFocusedView:");

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        [v16 oneupView:self willBeginViewTransitionForFocusedView:v17];
      }

      -[TVPOneupView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:", v13);
      id v7 = v18;
    }
  }
}

- (void)_upAction:(id)a3
{
  if ([a3 state] == (id)3
    && (id)-[TVPOneupView currentMode](self, "currentMode") == (id)1
    && (-[TVPOneupView allowedModes](self, "allowedModes") & 4) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "oneupView:willBeginViewTransitionForFocusedView:");

    if ((v5 & 1) != 0)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
      [v6 oneupView:self willBeginViewTransitionForFocusedView:v7];
    }

    -[TVPOneupView _transitionToCaptionMode](self, "_transitionToCaptionMode");
  }

- (void)_downAction:(id)a3
{
  if ([a3 state] == (id)3
    && (id)-[TVPOneupView currentMode](self, "currentMode") == (id)4
    && (-[TVPOneupView allowedModes](self, "allowedModes") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "oneupView:willBeginViewTransitionForFocusedView:");

    if ((v5 & 1) != 0)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
      [v6 oneupView:self willBeginViewTransitionForFocusedView:v7];
    }

    -[TVPOneupView _transitionToFullScreenMode](self, "_transitionToFullScreenMode");
  }

- (void)_doubleTapAction:(id)a3
{
  if ([a3 state] == (id)3 && (-[TVPOneupView allowedModes](self, "allowedModes") & 2) != 0)
  {
    if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)1)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
      objc_msgSend(v11, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v5 = v4;
      double v7 = v6;
      -[TVPOneupView bounds](self, "bounds");
      if (v5 > v8 || (-[TVPOneupView bounds](self, "bounds"), v7 > v9))
      {
        -[TVPOneupView setCurrentMode:](self, "setCurrentMode:", 2LL);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        -[TVPOneupView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v10,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
      }
    }

    else
    {
      if ((id)-[TVPOneupView currentMode](self, "currentMode") != (id)2) {
        return;
      }
      -[TVPOneupView setCurrentMode:](self, "setCurrentMode:", 1LL);
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
      -[TVPOneupView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v11,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
    }
  }

- (void)_menuAction:(id)a3
{
  if ([a3 state] == (id)3 && (id)-[TVPOneupView currentMode](self, "currentMode") == (id)2)
  {
    -[TVPOneupView setCurrentMode:](self, "setCurrentMode:", 1LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
    -[TVPOneupView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v4,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex"));
  }

- (void)_panAction:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  [v4 translationInView:self];
  double v7 = v6;
  [v4 velocityInView:self];
  double v9 = v8;
  id v10 = -[TVPOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  switch((unint64_t)[v4 state])
  {
    case 1uLL:
      p_firstTouchLocation = &self->_firstTouchLocation;
      [v5 center];
      p_firstTouchLocation->x = v12;
      p_firstTouchLocation->y = v13;
      break;
    case 2uLL:
      [v5 center];
      double v15 = v14;
      [v5 center];
      uint64_t v17 = v16;
      if (v9 < -6000.0
        && ((int64_t focusedItemIndex = self->_focusedItemIndex, v10 != (id)1)
          ? (int64_t v19 = focusedItemIndex + 1)
          : (int64_t v19 = focusedItemIndex - 1),
            -[TVPOneupView _isValidIndex:](self, "_isValidIndex:", v19)))
      {
        [v4 setEnabled:0];
        -[TVPOneupView _leftAction:](self, "_leftAction:", v4);
      }

      else
      {
        if (v9 <= 6000.0
          || (v10 != (id)1 ? (uint64_t v21 = -1LL) : (uint64_t v21 = 1LL),
              !-[TVPOneupView _isValidIndex:](self, "_isValidIndex:", self->_focusedItemIndex + v21)))
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_100069184;
          v25[3] = &unk_1000CC3A8;
          id v26 = v5;
          double v27 = v15 + v7 * 0.1;
          uint64_t v28 = v17;
          +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v25, 0.05);
          objc_msgSend(v4, "setTranslation:inView:", self, 0.0, 0.0);
          double v20 = v26;
          goto LABEL_18;
        }

        [v4 setEnabled:0];
        -[TVPOneupView _rightAction:](self, "_rightAction:", v4);
      }

      break;
    case 3uLL:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100069190;
      v22[3] = &unk_1000C9CC8;
      id v23 = v5;
      double v24 = self;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x20000LL,  v22,  0LL,  0.3,  0.0);
      double v20 = v23;
LABEL_18:

      break;
    case 4uLL:
    case 5uLL:
      [v4 setEnabled:1];
      break;
    default:
      break;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView panGestureRecognizer](self, "panGestureRecognizer"));

  BOOL v6 = v5 != v4
    || (id)-[TVPOneupView transition](self, "transition") == (id)3
    && (id)-[TVPOneupView currentMode](self, "currentMode") != (id)2;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVPOneupView leftSwipeGesture](self, "leftSwipeGesture"));
  if ((id)v7 == v4)
  {

LABEL_10:
    BOOL v6 = (id)-[TVPOneupView transition](self, "transition") != (id)3;
    goto LABEL_11;
  }

  double v8 = (void *)v7;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView rightSwipeGesture](self, "rightSwipeGesture"));

  if (v9 == v4) {
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView upSwipeGesture](self, "upSwipeGesture"));
  if (v8 == v7
    || (id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView downSwipeGesture](self, "downSwipeGesture")), v9 == v7))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView panGestureRecognizer](self, "panGestureRecognizer"));

    if (v8 != v7) {
    if (v10 == v6)
    }
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
  }

  else
  {
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView menuGestureRecognizer](self, "menuGestureRecognizer"));
  BOOL v12 = v11 == v6;

LABEL_9:
  return v12;
}

- (void)_transitionToCaptionMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v3, "oneupView:supplementaryViewForItemAtIndex:") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "oneupView:supplementaryViewForItemAtIndex:",  self,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex")));
  }

  else
  {
    id v5 = 0LL;
  }

  objc_msgSend(v5, "sizeThatFits:", 1920.0, 80.0);
  objc_msgSend(v5, "setFrame:", 0.0, 1082.0, v6, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000694AC;
  v9[3] = &unk_1000C9CC8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  1LL,  v9,  0LL,  0.7,  0.0);
}

- (void)_transitionToFullScreenMode
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000695E4;
  v3[3] = &unk_1000C9528;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  1LL,  v3,  0LL,  0.7,  0.0);
}

- (void)_transitionToSupplementaryView:(id)a3 itemView:(id)a4
{
  id v5 = a3;
  id v12 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sizeThatFits:", 1920.0, 80.0);
    objc_msgSend(v12, "setFrame:", 0.0, 982.0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
    [v8 setAlpha:0.0];

    [v12 setAlpha:1.0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
    -[TVPOneupView setSpareSupplementaryView:](self, "setSpareSupplementaryView:", v9);

    -[TVPOneupView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", v12);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
    [v10 setAlpha:0.0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView spareSupplementaryView](self, "spareSupplementaryView"));
    [v11 setAlpha:0.0];
  }
}

- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4
{
  id v28 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v6, "oneupView:contentModeForItemAtIndex:") & 1) != 0)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    uint64_t v8 = (uint64_t)[v7 oneupView:self contentModeForItemAtIndex:a4];
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
  {
    double v9 = 918.0;
    double v10 = 1744.0;
    CGFloat v11 = 42.0;
    CGFloat v12 = 88.0;
  }

  else
  {
    -[TVPOneupView bounds](self, "bounds");
    CGFloat v12 = v13;
    CGFloat v11 = v14;
    double v10 = v15;
    double v9 = v16;
  }

  objc_msgSend(v28, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v18 = v17;
  double v20 = v19;
  if ((id)-[TVPOneupView currentMode](self, "currentMode") != (id)2 && (v18 > v10 || v20 > v9))
  {
    double v22 = v10 / v18;
    if (v10 / v18 >= v9 / v20) {
      double v23 = v9 / v20;
    }
    else {
      double v23 = v10 / v18;
    }
    if (v10 / v18 < v9 / v20) {
      double v22 = v9 / v20;
    }
    if (v8 == 1) {
      double v22 = v23;
    }
    double v18 = floor(v18 * v22);
    double v20 = floor(v20 * v22);
  }

  BOOL v24 = v20 == 0.0 || v18 == 0.0;
  if (v24) {
    double v25 = v10;
  }
  else {
    double v25 = v18;
  }
  if (v24) {
    double v26 = v9;
  }
  else {
    double v26 = v20;
  }
  objc_msgSend(v28, "setFrame:", 0.0, 0.0, v25, v26);
  v29.origin.x = v12;
  v29.origin.y = v11;
  v29.size.width = v10;
  v29.size.height = v9;
  double MidX = CGRectGetMidX(v29);
  v30.origin.x = v12;
  v30.origin.y = v11;
  v30.size.width = v10;
  v30.size.height = v9;
  objc_msgSend(v28, "setCenter:", MidX, CGRectGetMidY(v30));
}

- (void)_configureSupplementaryView
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v8, "oneupView:supplementaryViewForItemAtIndex:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "oneupView:supplementaryViewForItemAtIndex:",  self,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex")));

    if (v4)
    {
      objc_msgSend(v4, "sizeThatFits:", 1920.0, 80.0);
      objc_msgSend(v4, "setFrame:", 0.0, 1082.0, v5, v6);
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
      -[TVPOneupView setSpareSupplementaryView:](self, "setSpareSupplementaryView:", v7);

      -[TVPOneupView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", v4);
    }
  }

  else
  {
  }

- (void)_addAllSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
  -[TVPOneupView addSubview:](self, "addSubview:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView spareSupplementaryView](self, "spareSupplementaryView"));
  -[TVPOneupView addSubview:](self, "addSubview:", v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  -[TVPOneupView addSubview:](self, "addSubview:", v5);
}

- (void)_transitionToItemAtIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v6 = [v5 numberOfItemsInOneupView:self];

    if ((uint64_t)v6 > a3)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 oneupView:self viewForItemAtIndex:a3]);

      if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
        if ((objc_opt_respondsToSelector(v9, "oneupView:supplementaryViewForItemAtIndex:") & 1) != 0)
        {
          double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
          CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v10 oneupView:self supplementaryViewForItemAtIndex:a3]);
        }

        else
        {
          CGFloat v11 = 0LL;
        }
      }

      else
      {
        CGFloat v11 = 0LL;
      }

      -[TVPOneupView _configureItemView:atIndex:](self, "_configureItemView:atIndex:", v8, a3);
      -[TVPOneupView _transitionToSupplementaryView:itemView:]( self,  "_transitionToSupplementaryView:itemView:",  v11,  v8);
      if ((id)-[TVPOneupView transition](self, "transition") == (id)1)
      {
        CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_100069F74;
        v42[3] = &unk_1000C9680;
        v42[4] = self;
        +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  v12,  v8,  0LL,  v42,  0.0);
      }

      if ((id)-[TVPOneupView transition](self, "transition") == (id)2)
      {
        double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100069FE8;
        v41[3] = &unk_1000C9680;
        v41[4] = self;
        +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  v13,  v8,  5242880LL,  v41,  0.5);
      }

      else if ((id)-[TVPOneupView transition](self, "transition") == (id)3)
      {
        -[TVPOneupView _performPushTransitionToView:atNewIndex:]( self,  "_performPushTransitionToView:atNewIndex:",  v8,  a3);
      }

      else if ((id)-[TVPOneupView transition](self, "transition") == (id)5)
      {
        self->_isPerformingTransitionAnimation = 1;
        int64_t v14 = -[TVPOneupView focusedItemIndex](self, "focusedItemIndex");
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
        if (v14 <= a3)
        {
          [v8 center];
          double v19 = v18;
          uint64_t v21 = v20;
          [v8 setCenter:v18 + 2160.0];
          -[TVPOneupView addSubview:](self, "addSubview:", v8);
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_10006A244;
          v29[3] = &unk_1000CC3D0;
          id v30 = v15;
          id v31 = v8;
          double v32 = v19;
          uint64_t v33 = v21;
          double v23 = _NSConcreteStackBlock;
          uint64_t v24 = 3221225472LL;
          double v25 = sub_10006A394;
          double v26 = &unk_1000CA520;
          id v27 = v30;
          id v28 = self;
          id v16 = v30;
          +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v29,  &v23,  1.0,  0.0);

          id v17 = v30;
        }

        else
        {
          [v8 setAlpha:0.0];
          CGAffineTransformMakeScale(&v40, 0.7, 0.7);
          [v8 setTransform:&v40];
          -[TVPOneupView addSubview:](self, "addSubview:", v8);
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          v37[2] = sub_10006A05C;
          v37[3] = &unk_1000C9CC8;
          id v38 = v8;
          id v39 = v15;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_10006A1C4;
          v34[3] = &unk_1000CA520;
          id v35 = v39;
          v36 = self;
          id v16 = v39;
          +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v37,  v34,  1.0,  0.0);

          id v17 = v38;
        }
      }

      self->_int64_t focusedItemIndex = a3;
      double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView", v23, v24, v25, v26));
      -[TVPOneupView setSpareView:](self, "setSpareView:", v22);

      -[TVPOneupView setCurrentView:](self, "setCurrentView:", v8);
    }
  }

- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4
{
  id v6 = a3;
  self->_isPerformingTransitionAnimation = 1;
  BOOL v7 = -[TVPOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1;
  if (v7 != -[TVPOneupView focusedItemIndex](self, "focusedItemIndex") <= a4) {
    double v8 = 2160.0;
  }
  else {
    double v8 = -2160.0;
  }
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  uint64_t v24 = 0LL;
  double v25 = (double *)&v24;
  uint64_t v26 = 0x3010000000LL;
  id v27 = &unk_1000BD292;
  [v6 center];
  uint64_t v28 = v10;
  uint64_t v29 = v11;
  void v25[4] = v8 + v25[4];
  objc_msgSend(v6, "setCenter:");
  double v13 = (void *)objc_opt_new(&OBJC_CLASS___TVPOneupViewCustomCurve, v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006A638;
  v19[3] = &unk_1000CB0F0;
  v19[4] = self;
  id v14 = v6;
  id v20 = v14;
  double v22 = &v24;
  double v23 = v8;
  id v21 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006A6A0;
  v16[3] = &unk_1000CA520;
  id v15 = v21;
  id v17 = v15;
  double v18 = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393216LL,  v13,  v19,  v16,  0.6,  0.0);

  _Block_object_dispose(&v24, 8);
}

- (void)_performNextEventTransitionIfRequired
{
  id v3 = -[TVPOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  unint64_t nextEventType = self->_nextEventType;
  if (nextEventType == 1)
  {
    self->_unint64_t nextEventType = 0LL;
    int64_t v7 = -[TVPOneupView focusedItemIndex](self, "focusedItemIndex");
    if (v3 == (id)1) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = -1LL;
    }
    int64_t v6 = v7 + v8;
  }

  else
  {
    if (nextEventType != 2) {
      return;
    }
    self->_unint64_t nextEventType = 0LL;
    int64_t v5 = -[TVPOneupView focusedItemIndex](self, "focusedItemIndex");
    if (v3 == (id)1) {
      int64_t v6 = v5 - 1;
    }
    else {
      int64_t v6 = v5 + 1;
    }
  }

  -[TVPOneupView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:", v6);
}

- (BOOL)_isValidIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
  BOOL v6 = (uint64_t)[v5 numberOfItemsInOneupView:self] > a3;

  return v6;
}

- (TVPOneupViewDelegate)delegate
{
  return (TVPOneupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVPOneupViewDataSource)dataSource
{
  return (TVPOneupViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (unint64_t)transition
{
  return self->_transition;
}

- (void)setTransition:(unint64_t)a3
{
  self->_transition = a3;
}

- (int64_t)focusedItemIndex
{
  return self->_focusedItemIndex;
}

- (unint64_t)allowedModes
{
  return self->_allowedModes;
}

- (void)setAllowedModes:(unint64_t)a3
{
  self->_allowedModes = a3;
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

- (void)setCurrentMode:(unint64_t)a3
{
  self->_currentMode = a3;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_loadWeakRetained((id *)&self->_menuGestureRecognizer);
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (unint64_t)nextEventType
{
  return self->_nextEventType;
}

- (void)setNextEventType:(unint64_t)a3
{
  self->_unint64_t nextEventType = a3;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (UIView)spareView
{
  return self->_spareView;
}

- (void)setSpareView:(id)a3
{
}

- (UIView)currentSupplementaryView
{
  return self->_currentSupplementaryView;
}

- (void)setCurrentSupplementaryView:(id)a3
{
}

- (UIView)spareSupplementaryView
{
  return self->_spareSupplementaryView;
}

- (void)setSpareSupplementaryView:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_panGestureRecognizer);
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)upSwipeGesture
{
  return (UISwipeGestureRecognizer *)objc_loadWeakRetained((id *)&self->_upSwipeGesture);
}

- (void)setUpSwipeGesture:(id)a3
{
}

- (UISwipeGestureRecognizer)downSwipeGesture
{
  return (UISwipeGestureRecognizer *)objc_loadWeakRetained((id *)&self->_downSwipeGesture);
}

- (void)setDownSwipeGesture:(id)a3
{
}

- (UISwipeGestureRecognizer)leftSwipeGesture
{
  return (UISwipeGestureRecognizer *)objc_loadWeakRetained((id *)&self->_leftSwipeGesture);
}

- (void)setLeftSwipeGesture:(id)a3
{
}

- (UISwipeGestureRecognizer)rightSwipeGesture
{
  return (UISwipeGestureRecognizer *)objc_loadWeakRetained((id *)&self->_rightSwipeGesture);
}

- (void)setRightSwipeGesture:(id)a3
{
}

- (BOOL)isPerformingTransitionAnimation
{
  return self->_isPerformingTransitionAnimation;
}

- (void)setIsPerformingTransitionAnimation:(BOOL)a3
{
  self->_isPerformingTransitionAnimation = a3;
}

- (void).cxx_destruct
{
}

@end