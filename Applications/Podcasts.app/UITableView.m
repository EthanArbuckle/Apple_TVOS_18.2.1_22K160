@interface UITableView
- (BOOL)_hasRowAtIndexPath:(id)a3 focusable:(BOOL)a4;
- (BOOL)canFocusRowAtIndexPath:(id)a3;
- (BOOL)hasRowAtIndexPath:(id)a3;
- (BOOL)hasRowsInSectionAtIndex:(int64_t)a3;
- (id)_indexPathForClosestRowToIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)_indexPathForRowAfterIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)_indexPathForRowBeforeIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)distanceFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (id)im_indexPathForFocusedCell;
- (id)indexPathForClosestFocusableRowToIndexPath:(id)a3;
- (id)indexPathForClosestRowToIndexPath:(id)a3;
- (id)indexPathForFirstFocusableRow;
- (id)indexPathForFirstRow;
- (id)indexPathForFirstRowInSection:(int64_t)a3;
- (id)indexPathForFocusableRowAfterIndexPath:(id)a3;
- (id)indexPathForFocusableRowBeforeIndexPath:(id)a3;
- (id)indexPathForLastRow;
- (id)indexPathForLastRowInSection:(int64_t)a3;
- (id)indexPathForRowAfterIndexPath:(id)a3;
- (id)indexPathForRowBeforeIndexPath:(id)a3;
- (unint64_t)numberOfRowsFromIndexPath:(id)a3 toFromIndexPath:(id)a4;
@end

@implementation UITableView

- (id)im_indexPathForFocusedCell
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 screen]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedView]);

  if (v5)
  {
    while (1)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___UITableViewCell);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
        break;
      }
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 superview]);

      v5 = (void *)v7;
      if (!v7) {
        goto LABEL_4;
      }
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForCell:](self, "indexPathForCell:", v5));
  }

  else
  {
LABEL_4:
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v8 = 0;
  if (v4)
  {
    if (((unint64_t)[v4 section] & 0x8000000000000000) == 0
      && ((unint64_t)[v5 row] & 0x8000000000000000) == 0)
    {
      id v6 = [v5 section];
      if ((uint64_t)v6 < -[UITableView numberOfSections](self, "numberOfSections"))
      {
        id v7 = [v5 row];
        if ((uint64_t)v7 < -[UITableView numberOfRowsInSection:]( self,  "numberOfRowsInSection:",  [v5 section])) {
          BOOL v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (BOOL)hasRowsInSectionAtIndex:(int64_t)a3
{
  return -[UITableView numberOfSections](self, "numberOfSections") > a3
      && -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3) > 0;
}

- (BOOL)canFocusRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "tableView:canFocusRowAtIndexPath:");

    if ((v6 & 1) != 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView delegate](self, "delegate"));
      unsigned __int8 v8 = [v7 tableView:self canFocusRowAtIndexPath:v4];
    }

    else
    {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)indexPathForFirstRow
{
  uint64_t v3 = -[UITableView numberOfSections](self, "numberOfSections");
  if (v3 < 1)
  {
LABEL_5:
    char v6 = 0LL;
  }

  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0LL;
    while (-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v5) < 1)
    {
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }

    char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  v5));
  }

  return v6;
}

- (id)indexPathForLastRow
{
  uint64_t v3 = -[UITableView numberOfSections](self, "numberOfSections");
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    while (v4-- >= 1)
    {
      uint64_t v6 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v4);
      if (v6 >= 1)
      {
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v6 - 1,  v4));
        return v3;
      }
    }

    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)indexPathForFirstRowInSection:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  a3));
  if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v4))
  {

    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)indexPathForLastRowInSection:(int64_t)a3
{
  if (-[UITableView hasRowsInSectionAtIndex:](self, "hasRowsInSectionAtIndex:")) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  (char *)-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3) - 1,  a3));
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v5;
}

- (id)indexPathForFirstFocusableRow
{
  if (-[UITableView numberOfSections](self, "numberOfSections") < 1)
  {
LABEL_10:
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      if (-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v3) >= 1)
      {
        uint64_t v4 = 0LL;
        while (1)
        {
          uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v4,  v3));
          if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v5)) {
            break;
          }

          if (++v4 >= -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v3)) {
            goto LABEL_9;
          }
        }

        if (v5) {
          break;
        }
      }

- (id)indexPathForRowBeforeIndexPath:(id)a3
{
  id v4 = a3;
  if (-[UITableView numberOfSections](self, "numberOfSections"))
  {
    if (v4)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  (char *)[v4 row] - 1,  objc_msgSend(v4, "section")));
      if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v5))
      {
        uint64_t v6 = (char *)[v4 section] + 1;
        while ((uint64_t)--v6 >= 1)
        {
          uint64_t v7 = objc_claimAutoreleasedReturnValue( -[UITableView indexPathForLastRowInSection:]( self,  "indexPathForLastRowInSection:",  [v4 section]));

          uint64_t v5 = 0LL;
          if (v7)
          {
            uint64_t v5 = (void *)v7;
            break;
          }
        }
      }
    }

    else
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRow](self, "indexPathForFirstRow"));
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)indexPathForFocusableRowBeforeIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && -[UITableView numberOfSections](self, "numberOfSections")
    && (unint64_t v5 = (unint64_t)[v4 section], (v5 & 0x8000000000000000) == 0))
  {
    uint64_t v6 = (char *)v5;
    while (v6 == [v4 section])
    {
      uint64_t v7 = (uint64_t)[v4 row];
      uint64_t v8 = v7 - 1;
      if (v7 >= 1) {
        goto LABEL_9;
      }
LABEL_12:
      v9 = 0LL;
      BOOL v10 = (uint64_t)v6-- <= 0;
      if (v10) {
        goto LABEL_16;
      }
    }

    uint64_t v8 = 0LL;
LABEL_9:
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v8,  v6));
      if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v9)) {
        break;
      }

      BOOL v10 = v8-- <= 0;
      if (v10) {
        goto LABEL_12;
      }
    }
  }

  else
  {
    v9 = 0LL;
  }

- (id)indexPathForRowAfterIndexPath:(id)a3
{
  id v4 = a3;
  if (-[UITableView numberOfSections](self, "numberOfSections"))
  {
    if (v4)
    {
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  (char *)[v4 row] + 1,  objc_msgSend(v4, "section")));
      if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v5))
      {
        uint64_t v6 = (char *)[v4 section] + 1;
        while ((uint64_t)v6 < -[UITableView numberOfSections](self, "numberOfSections"))
        {
          uint64_t v7 = objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRowInSection:](self, "indexPathForFirstRowInSection:", v6));

          unint64_t v5 = 0LL;
          ++v6;
          if (v7)
          {
            unint64_t v5 = (void *)v7;
            break;
          }
        }
      }
    }

    else
    {
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRow](self, "indexPathForFirstRow"));
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (id)indexPathForFocusableRowAfterIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = -[UITableView numberOfSections](self, "numberOfSections"), (uint64_t)[v4 section] < v5)
    && (uint64_t v6 = (char *)[v4 section], (uint64_t)v6 < v5))
  {
    uint64_t v7 = v6;
    while (1)
    {
      NSInteger v8 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v7);
      v9 = v7 == [v4 section] ? (char *)objc_msgSend(v4, "row") + 1 : 0;
LABEL_11:
      BOOL v10 = 0LL;
    }

    while (1)
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v9,  v7));
      if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v10)) {
        break;
      }
    }
  }

  else
  {
    BOOL v10 = 0LL;
  }

- (id)indexPathForClosestRowToIndexPath:(id)a3
{
  return -[UITableView _indexPathForClosestRowToIndexPath:focusable:]( self,  "_indexPathForClosestRowToIndexPath:focusable:",  a3,  0LL);
}

- (id)indexPathForClosestFocusableRowToIndexPath:(id)a3
{
  return -[UITableView _indexPathForClosestRowToIndexPath:focusable:]( self,  "_indexPathForClosestRowToIndexPath:focusable:",  a3,  1LL);
}

- (id)distanceFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v5 = 0LL;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    v9 = [v7 section];
    BOOL v10 = [v8 section];
    if (v9 - v10 >= 0) {
      int64_t v11 = v9 - v10;
    }
    else {
      int64_t v11 = v10 - v9;
    }
    unint64_t v12 = -[UITableView numberOfRowsFromIndexPath:toFromIndexPath:]( self,  "numberOfRowsFromIndexPath:toFromIndexPath:",  v8,  v7);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v12,  v11));
  }

  return v5;
}

- (unint64_t)numberOfRowsFromIndexPath:(id)a3 toFromIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [v6 compare:v7];
    BOOL v10 = v6;
    int64_t v11 = v8;
    if (v9 != (id)-1LL)
    {
      if (v9 != (id)1)
      {
        v15 = 0LL;
        id v12 = 0LL;
        id v13 = 0LL;
        goto LABEL_23;
      }

      BOOL v10 = v8;
      int64_t v11 = v6;
    }

    id v12 = v10;
    id v13 = v11;
    v14 = (char *)[v12 section];
    if ((uint64_t)v14 > (uint64_t)[v13 section])
    {
      v15 = 0LL;
LABEL_23:

      goto LABEL_24;
    }

    v15 = 0LL;
    while (1)
    {
      if (-[UITableView hasRowsInSectionAtIndex:](self, "hasRowsInSectionAtIndex:", v14))
      {
        v16 = (char *)[v13 section];
        v17 = (char *)[v12 section];
        v18 = v17;
        if (v14 == v16)
        {
          id v19 = [v13 row];
          id v20 = v19;
          if (v14 != v18)
          {
            v15 = &v15[(void)v19];
            goto LABEL_22;
          }

          v21 = [v12 row];
          v22 = &v15[(void)v20];
        }

        else
        {
          if (v14 != v17)
          {
            v15 = &v15[-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v14)];
            goto LABEL_22;
          }

          NSInteger v23 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", [v12 section]);
          v21 = [v12 row];
          v22 = &v15[v23];
        }

        v15 = (char *)(v22 - v21);
      }

- (id)_indexPathForClosestRowToIndexPath:(id)a3 focusable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!-[UITableView _hasRowAtIndexPath:focusable:](self, "_hasRowAtIndexPath:focusable:", v6, v4))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[UITableView _indexPathForRowBeforeIndexPath:focusable:]( self,  "_indexPathForRowBeforeIndexPath:focusable:",  v6,  v4));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[UITableView _indexPathForRowAfterIndexPath:focusable:]( self,  "_indexPathForRowAfterIndexPath:focusable:",  v6,  v4));
    BOOL v10 = (void *)v9;
    if (!(v9 | v8))
    {
      id v7 = 0LL;
LABEL_20:

      goto LABEL_21;
    }

    if ((v8 != 0) != (v9 != 0))
    {
      BOOL v11 = v9 == 0;
LABEL_16:
      if (v11) {
        id v20 = (void *)v8;
      }
      else {
        id v20 = v10;
      }
      id v7 = v20;
      goto LABEL_20;
    }

    if (v9)
    {
      id v12 = [(id)v9 section];
      int v13 = v12 == [v6 section];
      if (v8)
      {
LABEL_9:
        id v14 = [(id)v8 section];
        int v15 = v14 == [v6 section];
        goto LABEL_12;
      }
    }

    else
    {
      int v13 = 0;
      if (v8) {
        goto LABEL_9;
      }
    }

    int v15 = 0;
LABEL_12:
    if (v15 == v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
      unsigned int v17 = [v16 containsObject:v10];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
      unsigned int v19 = [v18 containsObject:v8];

      if (v17 == v19)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView distanceFromIndexPath:toIndexPath:]( self,  "distanceFromIndexPath:toIndexPath:",  v6,  v8));
        NSInteger v23 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView distanceFromIndexPath:toIndexPath:]( self,  "distanceFromIndexPath:toIndexPath:",  v6,  v10));
        id v24 = [v23 row];
        else {
          v25 = v10;
        }
        id v7 = v25;

        goto LABEL_20;
      }

      BOOL v11 = v17 == 0;
    }

    else
    {
      BOOL v11 = v13 == 0;
    }

    goto LABEL_16;
  }

  id v7 = v6;
LABEL_21:

  return v7;
}

- (id)_indexPathForRowAfterIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView indexPathForFocusableRowAfterIndexPath:]( self,  "indexPathForFocusableRowAfterIndexPath:",  a3));
  }
  else {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowAfterIndexPath:](self, "indexPathForRowAfterIndexPath:", a3));
  }
  return v4;
}

- (id)_indexPathForRowBeforeIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[UITableView indexPathForFocusableRowBeforeIndexPath:]( self,  "indexPathForFocusableRowBeforeIndexPath:",  a3));
  }
  else {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowBeforeIndexPath:](self, "indexPathForRowBeforeIndexPath:", a3));
  }
  return v4;
}

- (BOOL)_hasRowAtIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    return -[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", a3);
  }
  else {
    return -[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", a3);
  }
}

@end