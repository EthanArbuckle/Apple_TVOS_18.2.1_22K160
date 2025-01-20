@interface TVCollectionView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSIndexPath)indexPathForLastFocusedItem;
- (TVCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (UIView)overlayLayoutView;
- (id)preferredFocusEnvironments;
- (void)_longPressAction:(id)a3;
- (void)_notifyDidScroll;
- (void)_performBlockWithFocusedCellIndexPath:(id)a3;
- (void)_playButtonAction:(id)a3;
- (void)_updateOverlayLayoutGuide;
- (void)adjustedContentInsetDidChange;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation TVCollectionView

- (TVCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  v4 = -[TVCollectionView initWithFrame:collectionViewLayout:]( &v13,  "initWithFrame:collectionViewLayout:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[TVCollectionView setContentInsetAdjustmentBehavior:](v4, "setContentInsetAdjustmentBehavior:", 2LL);
    v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v5,  "_playButtonAction:");
    playButtonRecognizer = v5->_playButtonRecognizer;
    v5->_playButtonRecognizer = v6;

    -[UITapGestureRecognizer setAllowedPressTypes:](v5->_playButtonRecognizer, "setAllowedPressTypes:", &off_1002821C8);
    -[UITapGestureRecognizer setDelegate:](v5->_playButtonRecognizer, "setDelegate:", v5);
    -[TVCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_playButtonRecognizer);
    v8 = -[TVMLongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS____TtC7TVMusic29TVMLongPressGestureRecognizer),  "initWithTarget:action:",  v5,  "_longPressAction:");
    longPressRecognizer = v5->_longPressRecognizer;
    v5->_longPressRecognizer = v8;

    -[TVMLongPressGestureRecognizer setAllowedPressTypes:]( v5->_longPressRecognizer,  "setAllowedPressTypes:",  &off_1002821E0);
    -[TVMLongPressGestureRecognizer setDelegate:](v5->_longPressRecognizer, "setDelegate:", v5);
    -[TVCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_longPressRecognizer);
    v10 = objc_alloc_init(&OBJC_CLASS___UIView);
    overlayLayoutView = v5->_overlayLayoutView;
    v5->_overlayLayoutView = v10;

    -[UIView setAutoresizingMask:](v5->_overlayLayoutView, "setAutoresizingMask:", 0LL);
    -[UIView setHidden:](v5->_overlayLayoutView, "setHidden:", 1LL);
    -[TVCollectionView addSubview:](v5, "addSubview:", v5->_overlayLayoutView);
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  -[TVCollectionView layoutSubviews](&v3, "layoutSubviews");
  -[TVCollectionView _updateOverlayLayoutGuide](self, "_updateOverlayLayoutGuide");
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  -[TVCollectionView adjustedContentInsetDidChange](&v3, "adjustedContentInsetDidChange");
  -[TVCollectionView _updateOverlayLayoutGuide](self, "_updateOverlayLayoutGuide");
}

- (id)preferredFocusEnvironments
{
  if (self->_focusedNonCellView)
  {
    focusedNonCellView = self->_focusedNonCellView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &focusedNonCellView,  1LL));
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVCollectionView;
    id v3 = -[TVCollectionView preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return v2;
}

- (void)_updateOverlayLayoutGuide
{
  double v4 = -v3;
  -[TVCollectionView adjustedContentInset](self, "adjustedContentInset");
  double v6 = -v5;
  -[TVCollectionView contentSize](self, "contentSize");
  double v8 = v7;
  -[TVCollectionView adjustedContentInset](self, "adjustedContentInset");
  double v10 = v8 + v9;
  -[TVCollectionView adjustedContentInset](self, "adjustedContentInset");
  double v12 = v10 + v11;
  -[TVCollectionView contentSize](self, "contentSize");
  double v14 = v13;
  -[TVCollectionView adjustedContentInset](self, "adjustedContentInset");
  double v16 = v14 + v15;
  -[TVCollectionView adjustedContentInset](self, "adjustedContentInset");
  double v18 = v16 + v17;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[TVCollectionView overlayLayoutView](self, "overlayLayoutView"));
  objc_msgSend(v19, "setFrame:", v4, v6, v12, v18);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (_TtC7TVMusic29TVMLongPressGestureRecognizer *)a3;
  double v5 = v4;
  if (self->_longPressRecognizer == v4)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
    {
      uint64_t v14 = 0LL;
      double v15 = &v14;
      uint64_t v16 = 0x2020000000LL;
      char v17 = 0;
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView delegate](self, "delegate"));
      char v8 = objc_opt_respondsToSelector(v7, "collectionView:shouldHandleLongPressForItemAtIndexPath:");

      if ((v8 & 1) != 0)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10007577C;
        v13[3] = &unk_100269390;
        v13[4] = self;
        v13[5] = &v14;
        -[TVCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v13);
      }

      if (!*((_BYTE *)v15 + 24))
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView delegate](self, "delegate"));
        char v10 = objc_opt_respondsToSelector(v9, "collectionView:didReceiveInitialPressOfLongPressForItemAtIndexPath:");

        if ((v10 & 1) != 0)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_1000757E8;
          v12[3] = &unk_1002693B8;
          v12[4] = self;
          -[TVCollectionView _performBlockWithFocusedCellIndexPath:]( self,  "_performBlockWithFocusedCellIndexPath:",  v12);
        }
      }

      BOOL v6 = *((_BYTE *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else if ((_TtC7TVMusic29TVMLongPressGestureRecognizer *)self->_playButtonRecognizer == v4)
  {
    BOOL v6 = *(_BYTE *)&self->_delegateFlags & 1;
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  -[TVCollectionView didUpdateFocusInContext:withAnimationCoordinator:]( &v27,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (TVCollectionView *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if (-[TVCollectionView isDescendantOfView:](v7, "isDescendantOfView:", self))
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v8);
    char isKindOfClass = objc_opt_isKindOfClass(v7, v9);
    double v11 = 0LL;
    if (v7 != self && (isKindOfClass & 1) == 0) {
      double v11 = v7;
    }
    focusedNonCellView = self->_focusedNonCellView;
    self->_focusedNonCellView = v11;

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0LL));
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_7:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v18));

        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }

      id v20 = v18;

      if (!v20) {
        goto LABEL_17;
      }
      v21 = (NSIndexPath *)[v20 copy];
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v21;

      double v13 = v20;
    }

- (BOOL)canBecomeFocused
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView delegate](self, "delegate"));
    unsigned __int8 v5 = [v4 collectionViewCanBecomeFocused:self];

    return v5;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVCollectionView;
    return -[TVCollectionView canBecomeFocused](&v6, "canBecomeFocused");
  }

- (void)reloadData
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  -[TVCollectionView reloadData](&v4, "reloadData");
  if (!sub_100075B14(self->_indexPathForLastFocusedItem, self))
  {
    indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
    self->_indexPathForLastFocusedItem = 0LL;
  }

- (void)_notifyDidScroll
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  -[TVCollectionView _notifyDidScroll](&v4, "_notifyDidScroll");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"TVCollectionViewDidScrollNotification" object:self];
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVCollectionView;
  id v4 = a3;
  -[TVCollectionView setDelegate:](&v8, "setDelegate:", v4);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v4,  "collectionView:didReceivePhysicalPlayForItemAtIndexPath:") & 1;
  if ((objc_opt_respondsToSelector(v4, "collectionView:didReceiveLongPressForItemAtIndexPath:") & 1) != 0) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
  char v6 = objc_opt_respondsToSelector(v4, "collectionViewCanBecomeFocused:");

  if ((v6 & 1) != 0) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
}

- (void)_playButtonAction:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100075D3C;
  v3[3] = &unk_1002693B8;
  v3[4] = self;
  -[TVCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v3);
}

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == (id)3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100075E08;
    v4[3] = &unk_1002693B8;
    v4[4] = self;
    -[TVCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v4);
  }

- (void)_performBlockWithFocusedCellIndexPath:(id)a3
{
  char v10 = (void (**)(id, void *))a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVCollectionView tvm_focusedView](self, "tvm_focusedView"));
  if (v4)
  {
    char v6 = (void *)v4;
    while (1)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v5);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
        break;
      }
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 superview]);

      char v6 = (void *)v8;
      if (!v8) {
        goto LABEL_9;
      }
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVCollectionView indexPathForCell:](self, "indexPathForCell:", v6));
    if (v9) {
      v10[2](v10, v9);
    }
  }

- (UIView)overlayLayoutView
{
  return self->_overlayLayoutView;
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
}

@end