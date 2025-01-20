@interface TVPTableView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSIndexPath)indexPathForLastFocusedItem;
- (TVPTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)_longPressAction:(id)a3;
- (void)_performBlockWithFocusedCellIndexPath:(id)a3;
- (void)_playButtonAction:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)reloadData;
@end

@implementation TVPTableView

- (TVPTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPTableView;
  v4 = -[TVPTableView initWithFrame:style:]( &v10,  "initWithFrame:style:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v4)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_playButtonAction:");
    playButtonRecognizer = v4->_playButtonRecognizer;
    v4->_playButtonRecognizer = v5;

    -[UITapGestureRecognizer setAllowedPressTypes:](v4->_playButtonRecognizer, "setAllowedPressTypes:", &off_1000D1D98);
    -[TVPTableView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_playButtonRecognizer);
    v7 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v4,  "_longPressAction:");
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = v7;

    -[UILongPressGestureRecognizer setAllowedPressTypes:]( v4->_longPressRecognizer,  "setAllowedPressTypes:",  &off_1000D1DB0);
    -[UILongPressGestureRecognizer setDelegate:](v4->_longPressRecognizer, "setDelegate:", v4);
    -[TVPTableView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_longPressRecognizer);
    -[TVPTableView setRemembersLastFocusedIndexPath:](v4, "setRemembersLastFocusedIndexPath:", 1LL);
  }

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_longPressRecognizer])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "tableView:didReceiveLongPressForItemAtIndexPath:");

    if ((v6 & 1) != 0)
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      char v15 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView delegate](self, "delegate"));
      char v8 = objc_opt_respondsToSelector(v7, "tableView:shouldHandleLongPressForItemAtIndexPath:");

      if ((v8 & 1) != 0)
      {
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10006B314;
        v11[3] = &unk_1000CC338;
        v11[4] = self;
        v11[5] = &v12;
        -[TVPTableView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v11);
      }

      BOOL v9 = *((_BYTE *)v13 + 24) != 0;
      _Block_object_dispose(&v12, 8);
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 nextFocusedView]);
  if ([v5 isDescendantOfView:self])
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView visibleCells](self, "visibleCells", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView indexPathForCell:](self, "indexPathForCell:", v11));

      if (!v12) {
        goto LABEL_14;
      }
      v13 = (NSIndexPath *)[v12 copy];
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v13;

      char v6 = v12;
    }

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPTableView;
  -[TVPTableView reloadData](&v4, "reloadData");
}

- (void)_playButtonAction:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView delegate](self, "delegate", a3));
  char v5 = objc_opt_respondsToSelector(v4, "tableView:didReceivePhysicalPlayForItemAtIndexPath:");

  if ((v5 & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006B5C4;
    v6[3] = &unk_1000CC360;
    v6[4] = self;
    -[TVPTableView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v6);
  }

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "tableView:didReceiveLongPressForItemAtIndexPath:");

    if ((v5 & 1) != 0)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10006B6C0;
      v6[3] = &unk_1000CC360;
      v6[4] = self;
      -[TVPTableView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v6);
    }
  }

- (void)_performBlockWithFocusedCellIndexPath:(id)a3
{
  __int128 v15 = (void (**)(id, void *))a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedItem]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIView, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v9 = v5;
    if (v9)
    {
      while (1)
      {
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v8);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
          break;
        }
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 superview]);

        id v9 = (id)v12;
        if (!v12) {
          goto LABEL_7;
        }
      }

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v11);
      if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPTableView indexPathForCell:](self, "indexPathForCell:", v9));
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