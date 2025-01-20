@interface SATVTableView
- (NSIndexPath)indexPathForLastFocusedItem;
- (SATVTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)reloadData;
@end

@implementation SATVTableView

- (SATVTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVTableView;
  v4 = -[SATVTableView initWithFrame:style:]( &v7,  "initWithFrame:style:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v4;
  if (v4) {
    -[SATVTableView _setRemembersPreviouslyFocusedItem:](v4, "_setRemembersPreviouslyFocusedItem:", 1LL);
  }
  return v5;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableView visibleCells](self, "visibleCells", 0LL));
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

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableView indexPathForCell:](self, "indexPathForCell:", v11));

      if (!v12) {
        goto LABEL_14;
      }
      v13 = (NSIndexPath *)[v12 copy];
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v13;

      v6 = v12;
    }

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVTableView;
  -[SATVTableView reloadData](&v4, "reloadData");
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
}

@end