@interface TVPSharedPSOneupView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)commentsBubbleView;
- (UIView)itemContainerView;
- (id)_getSecondaryCommentsViewFromParentView;
- (id)preferredFocusEnvironments;
- (void)_addAllSubviews;
- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4;
- (void)_configureSupplementaryView;
- (void)_longPressAction:(id)a3;
- (void)_menuAction:(id)a3;
- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4;
- (void)_setFrameForSecondaryView:(id)a3 itemViewFrame:(CGRect)a4;
- (void)_transitionToCaptionMode;
- (void)_transitionToFullScreenMode;
- (void)_transitionToItemAtIndex:(int64_t)a3;
- (void)setCommentsBubbleView:(id)a3;
- (void)setItemContainerView:(id)a3;
- (void)switchToOneupCaptionView;
@end

@implementation TVPSharedPSOneupView

- (void)switchToOneupCaptionView
{
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneupView subviews](self, "subviews"));
    id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v15;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVPSharedPSCommentsView, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v12 = v9;

      if (!v12) {
        goto LABEL_14;
      }
      id v18 = v12;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v18,  1LL,  (void)v14));
      id v3 = v12;
    }

    else
    {
LABEL_10:

      v11 = &__NSArray0__struct;
    }
  }

  else
  {
LABEL_14:
    v11 = &__NSArray0__struct;
  }

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView menuGestureRecognizer](self, "menuGestureRecognizer"));
  if (v5 == v4)
  {
    BOOL v6 = (id)-[TVPOneupView currentMode](self, "currentMode") == (id)4;
    id v5 = v4;
  }

  else
  {
    BOOL v6 = 1;
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView panGestureRecognizer](self, "panGestureRecognizer"));
  if (v7 == v4) {
    BOOL v6 = (id)-[TVPOneupView transition](self, "transition") == (id)3
  }
      && (id)-[TVPOneupView currentMode](self, "currentMode") != (id)2;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVPOneupView leftSwipeGesture](self, "leftSwipeGesture"));
  if ((id)v8 == v4)
  {

LABEL_12:
    BOOL v6 = (id)-[TVPOneupView transition](self, "transition") != (id)3;
    goto LABEL_13;
  }

  v9 = (void *)v8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView rightSwipeGesture](self, "rightSwipeGesture"));

  if (v10 == v4) {
    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_longPressAction:(id)a3
{
  id v17 = a3;
  if ([v17 state] == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    char v5 = objc_opt_respondsToSelector(v4, "oneupView:supplementaryViewForItemAtIndex:");

    if ((v5 & 1) != 0)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
      id v7 = (UIView *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "oneupView:supplementaryViewForItemAtIndex:",  self,  -[TVPOneupView focusedItemIndex](self, "focusedItemIndex")));
      commentsBubbleView = self->_commentsBubbleView;
      self->_commentsBubbleView = v7;

      if (self->_commentsBubbleView)
      {
        if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)1)
        {
          -[UIView sizeThatFits:](self->_commentsBubbleView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
          double v10 = v9;
          double v12 = v11;
          -[TVPSharedPSOneupView bounds](self, "bounds");
          double v14 = v13 + -90.0 - v10;
          -[TVPSharedPSOneupView bounds](self, "bounds");
          -[UIView setFrame:](self->_commentsBubbleView, "setFrame:", v14, v15 + -60.0 - v12, v10, v12);
          -[TVPSharedPSOneupView addSubview:](self, "addSubview:", self->_commentsBubbleView);
          -[TVPSharedPSOneupView bringSubviewToFront:](self, "bringSubviewToFront:", self->_commentsBubbleView);
        }
      }
    }
  }

  else if ([v17 state] == (id)4 || objc_msgSend(v17, "state") == (id)3)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_commentsBubbleView, "superview"));

    if (v16) {
      -[UIView removeFromSuperview](self->_commentsBubbleView, "removeFromSuperview");
    }
  }
}

- (void)_transitionToCaptionMode
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  double v9 = sub_100038318;
  double v10 = sub_100038328;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  [(id)v7[5] willAnimateToCaptionMode];
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x4010000000LL;
  v5[3] = &unk_1000BD292;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100038330;
  v4[3] = &unk_1000CB078;
  v4[4] = self;
  v4[5] = v5;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000383A8;
  v3[3] = &unk_1000CB0A0;
  v3[4] = self;
  v3[5] = &v6;
  v3[6] = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  1LL,  v4,  v3,  0.7,  0.0);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
}

- (void)_transitionToFullScreenMode
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_100038318;
  double v9 = sub_100038328;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  [(id)v6[5] willAnimateToFullScreenMode];
  v3[5] = &v5;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000385FC;
  v4[3] = &unk_1000C9528;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100038674;
  v3[3] = &unk_1000CB0C8;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  1LL,  v4,  v3,  0.7,  0.0);
  _Block_object_dispose(&v5, 8);
}

- (void)_configureItemView:(id)a3 atIndex:(unint64_t)a4
{
  id v15 = a3;
  if (-[TVPSharedPSOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1)
  {
    -[TVPSharedPSOneupView bounds](self, "bounds");
    double v5 = CGRectGetMaxX(v16) + -638.0 + -1222.0;
  }

  else
  {
    double v5 = 638.0;
  }

  if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
  {
    double v6 = 815.0;
    double v7 = 1222.0;
    double v8 = 134.0;
  }

  else
  {
    -[TVPSharedPSOneupView bounds](self, "bounds");
    double v5 = v9;
    double v8 = v10;
    double v7 = v11;
    double v6 = v12;
  }

  -[UIView setFrame:](self->_itemContainerView, "setFrame:", v5, v8, v7, v6);
  itemContainerView = self->_itemContainerView;
  v17.origin.x = v5;
  v17.origin.y = v8;
  v17.size.width = v7;
  v17.size.height = v6;
  double MidX = CGRectGetMidX(v17);
  v18.origin.x = v5;
  v18.origin.y = v8;
  v18.size.width = v7;
  v18.size.height = v6;
  -[UIView setCenter:](itemContainerView, "setCenter:", MidX, CGRectGetMidY(v18));
  -[UIView bounds](self->_itemContainerView, "bounds");
  objc_msgSend(v15, "setFrame:");
}

- (void)_configureSupplementaryView
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
  char v12 = objc_opt_respondsToSelector(v11, "oneupView:getSecondaryViewForMode:");

  if ((v12 & 1) != 0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v14 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "oneupView:getSecondaryViewForMode:",  self,  -[TVPOneupView currentMode](self, "currentMode")));

    if (v14)
    {
      -[TVPSharedPSOneupView _setFrameForSecondaryView:itemViewFrame:]( self,  "_setFrameForSecondaryView:itemViewFrame:",  v14,  v4,  v6,  v8,  v10);
      -[TVPSharedPSOneupView addSubview:](self, "addSubview:", v14);
    }
  }

- (void)_transitionToItemAtIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView dataSource](self, "dataSource"));
    id v6 = [v5 numberOfItemsInOneupView:self];

    if ((uint64_t)v6 > a3)
    {
      v22.receiver = self;
      v22.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneupView;
      -[TVPOneupView _transitionToItemAtIndex:](&v22, "_transitionToItemAtIndex:", a3);
      if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
        char v8 = objc_opt_respondsToSelector(v7, "oneupView:didTransitionToItemInCaptionModeWithIndex:");

        if ((v8 & 1) != 0)
        {
          double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView delegate](self, "delegate"));
          [v9 oneupView:self didTransitionToItemInCaptionModeWithIndex:a3];
        }
      }

      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneupView subviews](self, "subviews"));
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11)
      {
        id v13 = v11;
        uint64_t v14 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v10);
            }
            CGRect v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVPSharedPSCommentsView, v12);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            {
              objc_msgSend(v16, "reloadCommentsData", (void)v18);
              goto LABEL_16;
            }
          }

          id v13 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

- (void)_menuAction:(id)a3
{
  if ([a3 state] == (id)3 && (id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
  {
    -[TVPOneupView setCurrentMode:](self, "setCurrentMode:", 1LL);
    -[TVPSharedPSOneupView _transitionToFullScreenMode](self, "_transitionToFullScreenMode");
  }

- (void)_addAllSubviews
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  itemContainerView = self->_itemContainerView;
  self->_itemContainerView = v3;

  double v5 = self->_itemContainerView;
  -[TVPSharedPSOneupView bounds](self, "bounds");
  -[UIView setFrame:](v5, "setFrame:");
  -[UIView setClipsToBounds:](self->_itemContainerView, "setClipsToBounds:", 1LL);
  -[TVPSharedPSOneupView addSubview:](self, "addSubview:", self->_itemContainerView);
  id v6 = self->_itemContainerView;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentSupplementaryView](self, "currentSupplementaryView"));
  -[UIView addSubview:](v6, "addSubview:", v7);

  char v8 = self->_itemContainerView;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView spareSupplementaryView](self, "spareSupplementaryView"));
  -[UIView addSubview:](v8, "addSubview:", v9);

  id v10 = self->_itemContainerView;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  -[UIView addSubview:](v10, "addSubview:", v11);
}

- (void)_performPushTransitionToView:(id)a3 atNewIndex:(int64_t)a4
{
  id v6 = a3;
  -[TVPOneupView setIsPerformingTransitionAnimation:](self, "setIsPerformingTransitionAnimation:", 1LL);
  id v7 = -[TVPSharedPSOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if ((id)-[TVPOneupView currentMode](self, "currentMode") == (id)4)
  {
    double v8 = 1232.0;
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v9 bounds];
    double v8 = v10 + 10.0;
  }

  if ((v7 == (id)1) == -[TVPOneupView focusedItemIndex](self, "focusedItemIndex") <= a4) {
    double v8 = -v8;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView currentView](self, "currentView"));
  uint64_t v26 = 0LL;
  v27 = (double *)&v26;
  uint64_t v28 = 0x3010000000LL;
  v29 = &unk_1000BD292;
  [v6 center];
  uint64_t v30 = v12;
  uint64_t v31 = v13;
  v27[4] = v8 + v27[4];
  objc_msgSend(v6, "setCenter:");
  id v15 = (void *)objc_opt_new(&OBJC_CLASS___TVPOneupViewCustomCurve, v14);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100038E14;
  v21[3] = &unk_1000CB0F0;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  v24 = &v26;
  double v25 = v8;
  id v23 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100038E84;
  v18[3] = &unk_1000CA520;
  id v17 = v23;
  id v19 = v17;
  __int128 v20 = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393216LL,  v15,  v21,  v18,  0.6,  0.0);

  _Block_object_dispose(&v26, 8);
}

- (void)_setFrameForSecondaryView:(id)a3 itemViewFrame:(CGRect)a4
{
  id v7 = a3;
  if (-[TVPSharedPSOneupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1)
  {
    -[TVPSharedPSOneupView bounds](self, "bounds");
    double v5 = CGRectGetMaxX(v8) + -524.0 + -62.0;
  }

  else
  {
    double v5 = 62.0;
  }

  -[TVPSharedPSOneupView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:", v5, 100.0, 524.0, v6 + -100.0);
}

- (id)_getSecondaryCommentsViewFromParentView
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneupView subviews](self, "subviews"));
  id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVPSharedPSCommentsView, v3);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (UIView)commentsBubbleView
{
  return self->_commentsBubbleView;
}

- (void)setCommentsBubbleView:(id)a3
{
}

- (UIView)itemContainerView
{
  return self->_itemContainerView;
}

- (void)setItemContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end