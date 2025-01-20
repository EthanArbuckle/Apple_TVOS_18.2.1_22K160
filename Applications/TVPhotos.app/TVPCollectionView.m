@interface TVPCollectionView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSIndexPath)indexPathForLastFocusedItem;
- (TVPCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)_longPressAction:(id)a3;
- (void)_notifyDidScroll;
- (void)_performBlockWithFocusedCellIndexPath:(id)a3;
- (void)_playButtonAction:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation TVPCollectionView

- (TVPCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
  v4 = -[TVPCollectionView initWithFrame:collectionViewLayout:]( &v10,  "initWithFrame:collectionViewLayout:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v4)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_playButtonAction:");
    playButtonRecognizer = v4->_playButtonRecognizer;
    v4->_playButtonRecognizer = v5;

    -[UITapGestureRecognizer setAllowedPressTypes:](v4->_playButtonRecognizer, "setAllowedPressTypes:", &off_1000D1CA8);
    -[UITapGestureRecognizer setDelegate:](v4->_playButtonRecognizer, "setDelegate:", v4);
    -[TVPCollectionView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_playButtonRecognizer);
    v7 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v4,  "_longPressAction:");
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = v7;

    -[UILongPressGestureRecognizer setAllowedPressTypes:]( v4->_longPressRecognizer,  "setAllowedPressTypes:",  &off_1000D1CC0);
    -[UILongPressGestureRecognizer setDelegate:](v4->_longPressRecognizer, "setDelegate:", v4);
    -[TVPCollectionView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_longPressRecognizer);
    -[TVPCollectionView setRemembersLastFocusedIndexPath:](v4, "setRemembersLastFocusedIndexPath:", 0LL);
    -[TVPCollectionView setContentInsetAdjustmentBehavior:](v4, "setContentInsetAdjustmentBehavior:", 2LL);
  }

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if ((UITapGestureRecognizer *)self->_longPressRecognizer == v4)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
    {
      uint64_t v11 = 0LL;
      v12 = &v11;
      uint64_t v13 = 0x2020000000LL;
      char v14 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionView delegate](self, "delegate"));
      char v8 = objc_opt_respondsToSelector(v7, "collectionView:shouldHandleLongPressForItemAtIndexPath:");

      if ((v8 & 1) != 0)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_1000668E8;
        v10[3] = &unk_1000CC338;
        v10[4] = self;
        v10[5] = &v11;
        -[TVPCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v10);
      }

      BOOL v6 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else if (self->_playButtonRecognizer == v4)
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
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
  -[TVPCollectionView didUpdateFocusInContext:withAnimationCoordinator:]( &v22,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if ([v7 isDescendantOfView:self])
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        char v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v13));

        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }

      id v15 = v13;

      if (!v15) {
        goto LABEL_14;
      }
      v16 = (NSIndexPath *)[v15 copy];
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v16;

      char v8 = v15;
    }

- (BOOL)canBecomeFocused
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionView delegate](self, "delegate"));
    unsigned __int8 v5 = [v4 collectionViewCanBecomeFocused:self];

    return v5;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
    return -[TVPCollectionView canBecomeFocused](&v6, "canBecomeFocused");
  }

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
  -[TVPCollectionView reloadData](&v4, "reloadData");
}

- (void)_notifyDidScroll
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
  -[TVPCollectionView _notifyDidScroll](&v4, "_notifyDidScroll");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"TVPCollectionViewDidScrollNotification" object:self];
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPCollectionView;
  id v4 = a3;
  -[TVPCollectionView setDelegate:](&v8, "setDelegate:", v4);
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
  v3[2] = sub_100066D68;
  v3[3] = &unk_1000CC360;
  v3[4] = self;
  -[TVPCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v3);
}

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100066E34;
    v4[3] = &unk_1000CC360;
    v4[4] = self;
    -[TVPCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v4);
  }

- (void)_performBlockWithFocusedCellIndexPath:(id)a3
{
  id v15 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedItem]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIView, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v9 = v5;
    if (v9)
    {
      while (1)
      {
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v8);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
          break;
        }
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 superview]);

        id v9 = (id)v12;
        if (!v12) {
          goto LABEL_7;
        }
      }

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v11);
      if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
      {
        char v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionView indexPathForCell:](self, "indexPathForCell:", v9));
        if (v14) {
          v15[2](v15, v14);
        }
      }
    }
  }

  else
  {
    id v9 = 0LL;
  }

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
}

@end