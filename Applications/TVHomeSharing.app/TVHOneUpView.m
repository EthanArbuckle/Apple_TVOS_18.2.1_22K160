@interface TVHOneUpView
- (BOOL)_isValidIndex:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPerformingTransitionAnimation;
- (TVHOneUpView)initWithFrame:(CGRect)a3;
- (TVHOneUpViewDataSource)dataSource;
- (TVHOneUpViewDelegate)delegate;
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
- (id)dequeueReusableSupplementaryView;
- (int64_t)_indexWithDirection:(unint64_t)a3 fromIndex:(int64_t)a4 withRecognizer:(id)a5;
- (int64_t)focusedItemIndex;
- (unint64_t)allowedModes;
- (unint64_t)currentMode;
- (unint64_t)nextEventType;
- (unint64_t)transition;
- (void)_addAllSubviews;
- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4;
- (void)_doubleTapAction:(id)a3;
- (void)_downAction:(id)a3;
- (void)_leftAction:(id)a3;
- (void)_markItemView:(id)a3 inUseAtIndex:(int64_t)a4;
- (void)_menuAction:(id)a3;
- (void)_panAction:(id)a3;
- (void)_performNextEventTransitionIfRequired;
- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4;
- (void)_playButtonAction:(id)a3;
- (void)_removeAllItemViewsInUseWithIndexMapping:(id)a3;
- (void)_removeItemViewInUse:(id)a3;
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
- (void)reloadDataWithNewIndexByOldIndexMapping:(id)a3;
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

@implementation TVHOneUpView

- (TVHOneUpView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHOneUpView;
  v3 = -[TVHOneUpView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v19);
    v18 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_leftAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v18, "setAllowedPressTypes:", &off_100106B90);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v18);
    v17 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_leftAction:");
    -[UISwipeGestureRecognizer setDirection:](v17, "setDirection:", 2LL);
    -[TVHOneUpView setLeftSwipeGesture:](v4, "setLeftSwipeGesture:", v17);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v17);
    v16 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_rightAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v16, "setAllowedPressTypes:", &off_100106BA8);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v16);
    v5 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_rightAction:");
    -[UISwipeGestureRecognizer setDirection:](v5, "setDirection:", 1LL);
    -[TVHOneUpView setRightSwipeGesture:](v4, "setRightSwipeGesture:", v5);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v5);
    v15 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_upAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v15, "setAllowedPressTypes:", &off_100106BC0);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v15);
    v6 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_upAction:");
    -[UISwipeGestureRecognizer setDirection:](v6, "setDirection:", 4LL);
    -[TVHOneUpView setUpSwipeGesture:](v4, "setUpSwipeGesture:", v6);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v6);
    v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_downAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_100106BD8);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v7);
    v8 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "_downAction:");
    -[UISwipeGestureRecognizer setDirection:](v8, "setDirection:", 8LL);
    -[TVHOneUpView setDownSwipeGesture:](v4, "setDownSwipeGesture:", v8);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v8);
    v9 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  v4,  "_panAction:");
    -[UIPanGestureRecognizer setDelegate:](v9, "setDelegate:", v4);
    -[UIPanGestureRecognizer _setCanPanVertically:](v9, "_setCanPanVertically:", 0LL);
    -[UIPanGestureRecognizer _setHysteresis:](v9, "_setHysteresis:", 40.0);
    -[TVHOneUpView setPanGestureRecognizer:](v4, "setPanGestureRecognizer:", v9);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v9, "requireGestureRecognizerToFail:", v6);
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v9, "requireGestureRecognizerToFail:", v8);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v9);
    v10 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_menuAction:");
    -[UITapGestureRecognizer setDelegate:](v10, "setDelegate:", v4);
    -[UITapGestureRecognizer setAllowedPressTypes:](v10, "setAllowedPressTypes:", &off_100106BF0);
    -[TVHOneUpView setMenuGestureRecognizer:](v4, "setMenuGestureRecognizer:", v10);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v10);
    v11 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_selectButtonAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v11, "setAllowedPressTypes:", &off_100106C08);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v11);
    v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_playButtonAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_100106C20);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v12);
    v13 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v4,  "_longPressAction:");
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v13, "setMinimumPressDuration:", 1.0);
    -[UILongPressGestureRecognizer setAllowedTouchTypes:](v13, "setAllowedTouchTypes:", &off_100106C38);
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v13, "setAllowedPressTypes:", &__NSArray0__struct);
    -[TVHOneUpView addGestureRecognizer:](v4, "addGestureRecognizer:", v13);
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "oneUpView:didFocusItemAtIndex:") & 1;
  if ((objc_opt_respondsToSelector(v5, "oneUpView:didSelectItemAtIndex:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  if ((objc_opt_respondsToSelector(v5, "oneUpView:didPlayItemAtIndex:") & 1) != 0) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
  if ((objc_opt_respondsToSelector(v5, "oneUpView:willBeginViewTransitionForFocusedView:") & 1) != 0) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
  if ((objc_opt_respondsToSelector(v5, "oneUpView:willDisplayView:forItemAtIndex:") & 1) != 0) {
    char v9 = 16;
  }
  else {
    char v9 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v9;
  char v10 = objc_opt_respondsToSelector(v5, "oneUpView:didEndDisplayingView:forItemAtIndex:");

  if ((v10 & 1) != 0) {
    char v11 = 32;
  }
  else {
    char v11 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xDF | v11;
}

- (void)setDataSource:(id)a3
{
}

- (void)setFocusedItemIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    int64_t focusedItemIndex = self->_focusedItemIndex;
    if (focusedItemIndex != a3)
    {
      if (focusedItemIndex == -1)
      {
        self->_int64_t focusedItemIndex = a3;
        -[TVHOneUpView setNeedsLayout](self, "setNeedsLayout");
      }

      else
      {
        -[TVHOneUpView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:");
      }
    }
  }

- (void)setAdjustedFocusIndex:(int64_t)a3
{
  self->_int64_t focusedItemIndex = a3;
}

- (void)registerItemViewClass:(Class)a3
{
  self->_viewClass = a3;
}

- (id)dequeueReusableItemView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView spareView](self, "spareView"));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v6 = objc_alloc(self->_viewClass);
    -[TVHOneUpView bounds](self, "bounds");
    id v5 = objc_msgSend(v6, "initWithFrame:");
  }

  char v7 = v5;

  return v7;
}

- (void)registerSupplementaryViewClass:(Class)a3
{
  self->_supplementaryViewClass = a3;
}

- (id)dequeueReusableSupplementaryView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView spareSupplementaryView](self, "spareSupplementaryView"));
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(self->_supplementaryViewClass);
  }
  id v6 = v5;

  return v6;
}

- (void)reloadData
{
}

- (void)reloadDataWithNewIndexByOldIndexMapping:(id)a3
{
  id v4 = a3;
  -[TVHOneUpView setCurrentView:](self, "setCurrentView:", 0LL);
  -[TVHOneUpView setSpareView:](self, "setSpareView:", 0LL);
  -[TVHOneUpView setSpareSupplementaryView:](self, "setSpareSupplementaryView:", 0LL);
  -[TVHOneUpView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView subviews](self, "subviews"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) removeFromSuperview];
        char v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  -[TVHOneUpView _removeAllItemViewsInUseWithIndexMapping:](self, "_removeAllItemViewsInUseWithIndexMapping:", v4);
  -[TVHOneUpView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
    -[TVHOneUpView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v4,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
    uint64_t v5 = (uint64_t)[v4 numberOfItemsInOneupView:self];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      if (-[TVHOneUpView focusedItemIndex](self, "focusedItemIndex") < 0
        || -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex") >= v6)
      {
        self->_int64_t focusedItemIndex = 0LL;
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "oneUpView:viewForItemAtIndex:",  self,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex")));
      -[TVHOneUpView _markItemView:inUseAtIndex:]( self,  "_markItemView:inUseAtIndex:",  v7,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
      -[TVHOneUpView setCurrentView:](self, "setCurrentView:", v7);
      -[TVHOneUpView _addAllSubviews](self, "_addAllSubviews");
      -[TVHOneUpView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v7,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
    }
  }

  if ((id)-[TVHOneUpView currentMode](self, "currentMode") == (id)4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));

    if (v8)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));
      objc_msgSend(v15, "sizeThatFits:", 1920.0, 80.0);
      objc_msgSend(v15, "setFrame:", 0.0, 982.0, v9, v10);
    }

    else
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
      if ((objc_opt_respondsToSelector(v15, "oneUpView:supplementaryViewForItemAtIndex:") & 1) != 0)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "oneUpView:supplementaryViewForItemAtIndex:",  self,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex")));
        if (v11)
        {
          __int128 v12 = (void *)v11;
          -[TVHOneUpView addSubview:](self, "addSubview:", v11);
          objc_msgSend(v12, "sizeThatFits:", 1920.0, 80.0);
          objc_msgSend(v12, "setFrame:", 0.0, 982.0, v13, v14);
          -[TVHOneUpView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", v12);
        }
      }
    }
  }

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_selectButtonAction:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate", a3));
    objc_msgSend( v4,  "oneUpView:didSelectItemAtIndex:",  self,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
  }

- (void)_playButtonAction:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate", a3));
    objc_msgSend(v4, "oneUpView:didPlayItemAtIndex:", self, -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
  }

- (int64_t)_indexWithDirection:(unint64_t)a3 fromIndex:(int64_t)a4 withRecognizer:(id)a5
{
  id v7 = a5;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  int64_t v10 = -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex");
  if ((isKindOfClass & 1) != 0) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = -(uint64_t)a3;
  }
  return v10 + v11;
}

- (void)_leftAction:(id)a3
{
  id v16 = a3;
  unint64_t v4 = -[TVHOneUpView currentMode](self, "currentMode");
  uint64_t v5 = v16;
  if (v4 != 2)
  {
    id v6 = -[TVHOneUpView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (self->_isPerformingTransitionAnimation)
    {
      uint64_t v5 = v16;
      if (!self->_nextEventType)
      {
        if (v6 == (id)1) {
          uint64_t v7 = 2LL;
        }
        else {
          uint64_t v7 = 1LL;
        }
        if (v6 == (id)1) {
          uint64_t v8 = 1LL;
        }
        else {
          uint64_t v8 = 2LL;
        }
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer);
        char isKindOfClass = objc_opt_isKindOfClass(v16, v9);
        uint64_t v5 = v16;
        if ((isKindOfClass & 1) != 0) {
          unint64_t v11 = v7;
        }
        else {
          unint64_t v11 = v8;
        }
        self->_nextEventType = v11;
      }
    }

    else
    {
      if (v6 == (id)1) {
        uint64_t v12 = 1LL;
      }
      else {
        uint64_t v12 = -1LL;
      }
      int64_t v13 = -[TVHOneUpView _indexWithDirection:fromIndex:withRecognizer:]( self,  "_indexWithDirection:fromIndex:withRecognizer:",  v12,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"),  v16);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
      if (v14 && (*(_BYTE *)&self->_delegateFlags & 8) != 0)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
        [v15 oneUpView:self willBeginViewTransitionForFocusedView:v14];
      }

      -[TVHOneUpView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:", v13);

      uint64_t v5 = v16;
    }
  }
}

- (void)_rightAction:(id)a3
{
  id v16 = a3;
  unint64_t v4 = -[TVHOneUpView currentMode](self, "currentMode");
  uint64_t v5 = v16;
  if (v4 != 2)
  {
    id v6 = -[TVHOneUpView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (self->_isPerformingTransitionAnimation)
    {
      uint64_t v5 = v16;
      if (!self->_nextEventType)
      {
        if (v6 == (id)1) {
          uint64_t v7 = 1LL;
        }
        else {
          uint64_t v7 = 2LL;
        }
        if (v6 == (id)1) {
          uint64_t v8 = 2LL;
        }
        else {
          uint64_t v8 = 1LL;
        }
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer);
        char isKindOfClass = objc_opt_isKindOfClass(v16, v9);
        uint64_t v5 = v16;
        if ((isKindOfClass & 1) != 0) {
          unint64_t v11 = v7;
        }
        else {
          unint64_t v11 = v8;
        }
        self->_nextEventType = v11;
      }
    }

    else
    {
      if (v6 == (id)1) {
        uint64_t v12 = -1LL;
      }
      else {
        uint64_t v12 = 1LL;
      }
      int64_t v13 = -[TVHOneUpView _indexWithDirection:fromIndex:withRecognizer:]( self,  "_indexWithDirection:fromIndex:withRecognizer:",  v12,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"),  v16);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
      if (v14 && (*(_BYTE *)&self->_delegateFlags & 8) != 0)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
        [v15 oneUpView:self willBeginViewTransitionForFocusedView:v14];
      }

      -[TVHOneUpView _transitionToItemAtIndex:](self, "_transitionToItemAtIndex:", v13);

      uint64_t v5 = v16;
    }
  }
}

- (void)_upAction:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  if (v4
    && [v6 state] == (id)3
    && (id)-[TVHOneUpView currentMode](self, "currentMode") == (id)1
    && (-[TVHOneUpView allowedModes](self, "allowedModes") & 4) != 0)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
      [v5 oneUpView:self willBeginViewTransitionForFocusedView:v4];
    }

    -[TVHOneUpView _transitionToCaptionMode](self, "_transitionToCaptionMode");
  }
}

- (void)_downAction:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  if (v4
    && [v6 state] == (id)3
    && (id)-[TVHOneUpView currentMode](self, "currentMode") == (id)4
    && (-[TVHOneUpView allowedModes](self, "allowedModes") & 1) != 0)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
      [v5 oneUpView:self willBeginViewTransitionForFocusedView:v4];
    }

    -[TVHOneUpView _transitionToFullScreenMode](self, "_transitionToFullScreenMode");
  }
}

- (void)_doubleTapAction:(id)a3
{
  if ([a3 state] == (id)3 && (-[TVHOneUpView allowedModes](self, "allowedModes") & 2) != 0)
  {
    if ((id)-[TVHOneUpView currentMode](self, "currentMode") == (id)1)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
      objc_msgSend(v11, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v5 = v4;
      double v7 = v6;
      -[TVHOneUpView bounds](self, "bounds");
      if (v5 > v8 || (-[TVHOneUpView bounds](self, "bounds"), v7 > v9))
      {
        -[TVHOneUpView setCurrentMode:](self, "setCurrentMode:", 2LL);
        int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
        -[TVHOneUpView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v10,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
      }
    }

    else
    {
      if ((id)-[TVHOneUpView currentMode](self, "currentMode") != (id)2) {
        return;
      }
      -[TVHOneUpView setCurrentMode:](self, "setCurrentMode:", 1LL);
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
      -[TVHOneUpView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v11,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
    }
  }

- (void)_menuAction:(id)a3
{
  if ([a3 state] == (id)3 && (id)-[TVHOneUpView currentMode](self, "currentMode") == (id)2)
  {
    -[TVHOneUpView setCurrentMode:](self, "setCurrentMode:", 1LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
    -[TVHOneUpView _configureItemView:atIndex:]( self,  "_configureItemView:atIndex:",  v4,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
  }

- (void)_panAction:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  [v4 translationInView:self];
  double v7 = v6;
  [v4 velocityInView:self];
  double v9 = v8;
  switch((unint64_t)[v4 state])
  {
    case 1uLL:
      p_firstTouchLocation = &self->_firstTouchLocation;
      [v5 center];
      p_firstTouchLocation->x = v11;
      p_firstTouchLocation->y = v12;
      break;
    case 2uLL:
      [v5 center];
      double v14 = v13;
      [v5 center];
      uint64_t v16 = v15;
      id v17 = -[TVHOneUpView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      if (v17 == (id)1) {
        uint64_t v18 = 1LL;
      }
      else {
        uint64_t v18 = -1LL;
      }
      if (v9 < -6000.0
        && ((int64_t focusedItemIndex = self->_focusedItemIndex, v17 != (id)1)
          ? (int64_t v20 = focusedItemIndex + 1)
          : (int64_t v20 = focusedItemIndex - 1),
            -[TVHOneUpView _isValidIndex:](self, "_isValidIndex:", v20)))
      {
        [v4 setEnabled:0];
        -[TVHOneUpView _leftAction:](self, "_leftAction:", v4);
      }

      else
      {
        if (v9 <= 6000.0 || !-[TVHOneUpView _isValidIndex:](self, "_isValidIndex:", self->_focusedItemIndex + v18))
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_100034C44;
          v25[3] = &unk_1000FDBF0;
          id v26 = v5;
          double v27 = v14 + v7 * 0.1;
          uint64_t v28 = v16;
          +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v25, 0.05);
          objc_msgSend(v4, "setTranslation:inView:", self, 0.0, 0.0);
          v21 = v26;
          goto LABEL_18;
        }

        [v4 setEnabled:0];
        -[TVHOneUpView _rightAction:](self, "_rightAction:", v4);
      }

      break;
    case 3uLL:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100034C50;
      v22[3] = &unk_1000FCDB8;
      id v23 = v5;
      v24 = self;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x20000LL,  v22,  0LL,  0.3,  0.0);
      v21 = v23;
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
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView panGestureRecognizer](self, "panGestureRecognizer"));

  BOOL v6 = v5 != v4
    || (id)-[TVHOneUpView transition](self, "transition") == (id)3
    && (id)-[TVHOneUpView currentMode](self, "currentMode") != (id)2;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVHOneUpView leftSwipeGesture](self, "leftSwipeGesture"));
  if ((id)v7 == v4)
  {

LABEL_10:
    BOOL v6 = (id)-[TVHOneUpView transition](self, "transition") != (id)3;
    goto LABEL_11;
  }

  double v8 = (void *)v7;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView rightSwipeGesture](self, "rightSwipeGesture"));

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
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView upSwipeGesture](self, "upSwipeGesture"));
  if (v8 == v7
    || (id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView downSwipeGesture](self, "downSwipeGesture")), v9 == v7))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView panGestureRecognizer](self, "panGestureRecognizer"));

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

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView menuGestureRecognizer](self, "menuGestureRecognizer"));
  BOOL v12 = v11 == v6;

LABEL_9:
  return v12;
}

- (void)_transitionToCaptionMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v3, "oneUpView:supplementaryViewForItemAtIndex:") & 1) != 0) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "oneUpView:supplementaryViewForItemAtIndex:",  self,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex")));
  }
  else {
    id v4 = 0LL;
  }
  objc_msgSend(v4, "sizeThatFits:", 1920.0, 80.0);
  objc_msgSend(v4, "setFrame:", 0.0, 1082.0, v5, v6);
  if (v4)
  {
    [v4 setAlpha:0.0];
    -[TVHOneUpView addSubview:](self, "addSubview:", v4);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100034F74;
  v8[3] = &unk_1000FCDB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  1LL,  v8,  0LL,  0.7,  0.0);
}

- (void)_transitionToFullScreenMode
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000350AC;
  v3[3] = &unk_1000FCEA8;
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));
    [v8 setAlpha:0.0];

    [v12 setAlpha:1.0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));
    -[TVHOneUpView setSpareSupplementaryView:](self, "setSpareSupplementaryView:", v9);

    -[TVHOneUpView setCurrentSupplementaryView:](self, "setCurrentSupplementaryView:", v12);
    -[TVHOneUpView addSubview:](self, "addSubview:", v12);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));
    [v10 setAlpha:0.0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView spareSupplementaryView](self, "spareSupplementaryView"));
    [v11 setAlpha:0.0];
  }
}

- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4
{
  id v27 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v6, "oneUpView:contentModeForItemAtIndex:") & 1) != 0) {
    uint64_t v7 = (uint64_t)[v6 oneUpView:self contentModeForItemAtIndex:a4];
  }
  else {
    uint64_t v7 = 1LL;
  }
  if ((id)-[TVHOneUpView currentMode](self, "currentMode") == (id)4)
  {
    double v8 = 918.0;
    double v9 = 1744.0;
    CGFloat v10 = 42.0;
    CGFloat v11 = 88.0;
  }

  else
  {
    -[TVHOneUpView bounds](self, "bounds");
    CGFloat v11 = v12;
    CGFloat v10 = v13;
    double v9 = v14;
    double v8 = v15;
  }

  objc_msgSend(v27, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v17 = v16;
  double v19 = v18;
  if ((id)-[TVHOneUpView currentMode](self, "currentMode") != (id)2 && (v17 > v9 || v19 > v8))
  {
    double v21 = v9 / v17;
    if (v9 / v17 >= v8 / v19) {
      double v22 = v8 / v19;
    }
    else {
      double v22 = v9 / v17;
    }
    if (v9 / v17 < v8 / v19) {
      double v21 = v8 / v19;
    }
    if (v7 == 1) {
      double v21 = v22;
    }
    double v17 = floor(v17 * v21);
    double v19 = floor(v19 * v21);
  }

  BOOL v23 = v19 == 0.0 || v17 == 0.0;
  if (v23) {
    double v24 = v9;
  }
  else {
    double v24 = v17;
  }
  if (v23) {
    double v25 = v8;
  }
  else {
    double v25 = v19;
  }
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v24, v25);
  v28.origin.x = v11;
  v28.origin.y = v10;
  v28.size.width = v9;
  v28.size.height = v8;
  double MidX = CGRectGetMidX(v28);
  v29.origin.x = v11;
  v29.origin.y = v10;
  v29.size.width = v9;
  v29.size.height = v8;
  objc_msgSend(v27, "setCenter:", MidX, CGRectGetMidY(v29));
}

- (void)_addAllSubviews
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentSupplementaryView](self, "currentSupplementaryView"));
  if (v5) {
    -[TVHOneUpView addSubview:](self, "addSubview:", v5);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView spareSupplementaryView](self, "spareSupplementaryView"));
  if (v3) {
    -[TVHOneUpView addSubview:](self, "addSubview:", v3);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  if (v4) {
    -[TVHOneUpView addSubview:](self, "addSubview:", v4);
  }
}

- (void)_transitionToItemAtIndex:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
  double v6 = v5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 oneUpView:self viewForItemAtIndex:a3]);
  -[TVHOneUpView _markItemView:inUseAtIndex:](self, "_markItemView:inUseAtIndex:", v8, a3);
  if ((id)-[TVHOneUpView currentMode](self, "currentMode") == (id)4
    && (objc_opt_respondsToSelector(v6, "oneUpView:supplementaryViewForItemAtIndex:") & 1) != 0)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 oneUpView:self supplementaryViewForItemAtIndex:a3]);
  }

  else
  {
    double v9 = 0LL;
  }

  -[TVHOneUpView _configureItemView:atIndex:](self, "_configureItemView:atIndex:", v8, a3);
  -[TVHOneUpView _transitionToSupplementaryView:itemView:](self, "_transitionToSupplementaryView:itemView:", v9, v8);
  if ((id)-[TVHOneUpView transition](self, "transition") != (id)1)
  {
LABEL_10:
    if ((id)-[TVHOneUpView transition](self, "transition") == (id)2)
    {
      if (v7)
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1000359E8;
        v39[3] = &unk_1000FDC18;
        v39[4] = self;
        id v7 = v7;
        id v40 = v7;
        +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  v7,  v8,  5242880LL,  v39,  0.5);
        id v10 = v40;
LABEL_23:

        goto LABEL_24;
      }

      goto LABEL_14;
    }

- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4
{
  id v6 = a3;
  self->_isPerformingTransitionAnimation = 1;
  double v7 = dbl_1000C32D0[-[TVHOneUpView focusedItemIndex](self, "focusedItemIndex") > a4];
  if (-[TVHOneUpView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1) {
    double v8 = -v7;
  }
  else {
    double v8 = v7;
  }
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));
  [v6 position];
  uint64_t v11 = v10;
  double v13 = v8 + v12;
  [v6 setPosition:v8 + v12];
  -[TVHOneUpView addSubview:](self, "addSubview:", v6);
  double v14 = v13 - v8;
  [v9 position];
  uint64_t v16 = v15;
  double v18 = v17 - v8;
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView window](self, "window"));

  if (v19) {
    double v21 = 0.6;
  }
  else {
    double v21 = 0.0;
  }
  uint64_t v22 = (void *)objc_opt_new(&OBJC_CLASS___TVHOneUpViewCustomCurve, v20);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100035F3C;
  v28[3] = &unk_1000FDC68;
  id v29 = v6;
  double v31 = v14;
  uint64_t v32 = v11;
  id v30 = v9;
  double v33 = v18;
  uint64_t v34 = v16;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100035F6C;
  v25[3] = &unk_1000FDC18;
  id v26 = v30;
  id v27 = self;
  id v23 = v30;
  id v24 = v6;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393216LL,  v22,  v28,  v25,  v21,  0.0);
}

- (void)_performNextEventTransitionIfRequired
{
  unint64_t nextEventType = self->_nextEventType;
  if (nextEventType == 2)
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    if (nextEventType != 1) {
      return;
    }
    uint64_t v3 = -1LL;
  }

  self->_unint64_t nextEventType = 0LL;
  -[TVHOneUpView _transitionToItemAtIndex:]( self,  "_transitionToItemAtIndex:",  (char *)-[TVHOneUpView focusedItemIndex](self, "focusedItemIndex") + v3);
}

- (void)_markItemView:(id)a3 inUseAtIndex:(int64_t)a4
{
  id v11 = a3;
  inUseItemViewsByIndex = self->_inUseItemViewsByIndex;
  if (!inUseItemViewsByIndex)
  {
    double v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
    double v8 = self->_inUseItemViewsByIndex;
    self->_inUseItemViewsByIndex = v7;

    inUseItemViewsByIndex = self->_inUseItemViewsByIndex;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](inUseItemViewsByIndex, "setObject:forKeyedSubscript:", v11, v9);

  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
    [v10 oneUpView:self willDisplayView:v11 forItemAtIndex:a4];
  }
}

- (void)_removeItemViewInUse:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    double v18 = sub_10003622C;
    double v19 = sub_10003623C;
    id v20 = 0LL;
    inUseItemViewsByIndex = self->_inUseItemViewsByIndex;
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    id v11 = sub_100036244;
    double v12 = &unk_1000FDC90;
    id v7 = v4;
    id v13 = v7;
    double v14 = &v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( inUseItemViewsByIndex,  "enumerateKeysAndObjectsUsingBlock:",  &v9);
    if (v16[5])
    {
      -[NSMutableDictionary removeObjectForKey:](self->_inUseItemViewsByIndex, "removeObjectForKey:", v9, v10, v11, v12);
      if ((*(_BYTE *)&self->_delegateFlags & 0x20) != 0)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
        objc_msgSend( v8,  "oneUpView:didEndDisplayingView:forItemAtIndex:",  self,  v7,  objc_msgSend((id)v16[5], "integerValue"));
      }
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)_removeAllItemViewsInUseWithIndexMapping:(id)a3
{
  id v4 = a3;
  inUseItemViewsByIndex = self->_inUseItemViewsByIndex;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100036344;
  v7[3] = &unk_1000FDCB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( inUseItemViewsByIndex,  "enumerateKeysAndObjectsUsingBlock:",  v7);
  -[NSMutableDictionary removeAllObjects](self->_inUseItemViewsByIndex, "removeAllObjects");
}

- (BOOL)_isValidIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView dataSource](self, "dataSource"));
  BOOL v6 = (uint64_t)[v5 numberOfItemsInOneupView:self] > a3;

  return v6;
}

- (TVHOneUpViewDelegate)delegate
{
  return (TVHOneUpViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVHOneUpViewDataSource)dataSource
{
  return (TVHOneUpViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
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