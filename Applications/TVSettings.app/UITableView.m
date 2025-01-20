@interface UITableView
- (id)tv_indexPathsForIndexSet:(id)a3 withOptions:(unint64_t)a4 prefix:(id)a5;
- (void)tv_updateItemsInSection:(unint64_t)a3 withChange:(id)a4;
- (void)tv_updateItemsInSection:(unint64_t)a3 withChanges:(id)a4;
- (void)tv_updateSectionsWithChange:(id)a3;
- (void)tv_updateSectionsWithChanges:(id)a3;
@end

@implementation UITableView

- (id)tv_indexPathsForIndexSet:(id)a3 withOptions:(unint64_t)a4 prefix:(id)a5
{
  id v7 = a3;
  v8 = (NSIndexPath *)a5;
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v8) {
    v8 = objc_alloc_init(&OBJC_CLASS___NSIndexPath);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001F690;
  v15[3] = &unk_10018F2A8;
  v16 = v8;
  v10 = v9;
  v17 = v10;
  v11 = v8;
  [v7 enumerateIndexesWithOptions:a4 usingBlock:v15];
  v12 = v17;
  v13 = v10;

  return v13;
}

- (void)tv_updateItemsInSection:(unint64_t)a3 withChange:(id)a4
{
  id v15 = a4;
  id v6 = [v15 changeKind];
  if (v6 == (id)3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v15 sourceIndexes]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  [v10 firstIndex],  a3));

    v11 = (void *)objc_claimAutoreleasedReturnValue([v15 destinationIndexes]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  [v11 firstIndex],  a3));

    -[UITableView moveRowAtIndexPath:toIndexPath:](self, "moveRowAtIndexPath:toIndexPath:", v9, v12);
    goto LABEL_7;
  }

  if (v6 == (id)2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v15 sourceIndexes]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndex:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView tv_indexPathsForIndexSet:withOptions:prefix:]( self,  "tv_indexPathsForIndexSet:withOptions:prefix:",  v13,  2LL,  v14));

    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](self, "deleteRowsAtIndexPaths:withRowAnimation:", v9, 0LL);
    goto LABEL_7;
  }

  if (v6 == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v15 destinationIndexes]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndex:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView tv_indexPathsForIndexSet:withOptions:prefix:]( self,  "tv_indexPathsForIndexSet:withOptions:prefix:",  v7,  0LL,  v8));

    -[UITableView insertRowsAtIndexPaths:withRowAnimation:](self, "insertRowsAtIndexPaths:withRowAnimation:", v9, 0LL);
LABEL_7:
  }
}

- (void)tv_updateSectionsWithChange:(id)a3
{
  id v7 = a3;
  id v4 = [v7 changeKind];
  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceIndexes]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationIndexes]);
    -[UITableView moveSection:toSection:]( self,  "moveSection:toSection:",  [v5 firstIndex],  objc_msgSend(v6, "firstIndex"));

    goto LABEL_7;
  }

  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceIndexes]);
    -[UITableView deleteSections:withRowAnimation:](self, "deleteSections:withRowAnimation:", v5, 0LL);
    goto LABEL_7;
  }

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationIndexes]);
    -[UITableView insertSections:withRowAnimation:](self, "insertSections:withRowAnimation:", v5, 0LL);
LABEL_7:
  }
}

- (void)tv_updateItemsInSection:(unint64_t)a3 withChanges:(id)a4
{
  id v6 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[UITableView tv_updateItemsInSection:withChange:]( self,  "tv_updateItemsInSection:withChange:",  a3,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)tv_updateSectionsWithChanges:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UITableView tv_updateSectionsWithChange:]( self,  "tv_updateSectionsWithChange:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

@end