@interface UICollectionView
+ (id)_tvh_indexPathsWithIndexSet:(id)a3 andSection:(unint64_t)a4;
- (void)_tvh_applyAmendItemsChanges:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5;
- (void)_tvh_applyDeleteItemsChange:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5;
- (void)_tvh_applyDeleteSectionsChange:(id)a3 applyChangeHandler:(id)a4;
- (void)_tvh_applyInsertItemsChange:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5;
- (void)_tvh_applyInsertSectionsChange:(id)a3 applyChangeHandler:(id)a4;
- (void)_tvh_applyMoveItemsChanges:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5;
- (void)_tvh_applyMoveSectionsChanges:(id)a3 applyChangeHandler:(id)a4;
- (void)_tvh_performBatchUpdatesWithSectionsChangeSet:(id)a3 updateDataSourceHandler:(id)a4 applyChangeHandler:(id)a5 completionHandler:(id)a6;
- (void)tvh_performBatchUpdatesWithItemsChangeSet:(id)a3 sectionIndex:(unint64_t)a4 updateDataSourceHandler:(id)a5 applyChangeHandler:(id)a6 completionHandler:(id)a7;
@end

@implementation UICollectionView

- (void)tvh_performBatchUpdatesWithItemsChangeSet:(id)a3 sectionIndex:(unint64_t)a4 updateDataSourceHandler:(id)a5 applyChangeHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", a4));
  id v17 = [[TVHKCollectionChange alloc] initWithChangeKind:3 sourceIndexes:v16 destinationIndexes:v16];
  [v17 setAmendChangeSet:v15];

  v18 = objc_alloc_init(&OBJC_CLASS___TVHKCollectionChangeSet);
  id v20 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  -[TVHKCollectionChangeSet setAmendChanges:](v18, "setAmendChanges:", v19);

  -[UICollectionView _tvh_performBatchUpdatesWithSectionsChangeSet:updateDataSourceHandler:applyChangeHandler:completionHandler:]( self,  "_tvh_performBatchUpdatesWithSectionsChangeSet:updateDataSourceHandler:applyChangeHandler:completionHandler:",  v18,  v14,  v13,  v12);
}

- (void)_tvh_performBatchUpdatesWithSectionsChangeSet:(id)a3 updateDataSourceHandler:(id)a4 applyChangeHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000569F8;
  v25[3] = &unk_1000FE2E0;
  id v28 = v11;
  v25[4] = self;
  id v26 = v10;
  id v29 = v12;
  v27 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100056C6C;
  v20[3] = &unk_1000FE330;
  v21 = v27;
  v22 = self;
  id v23 = v29;
  id v24 = v13;
  id v15 = v13;
  id v16 = v29;
  id v17 = v27;
  id v18 = v10;
  id v19 = v11;
  -[UICollectionView performBatchUpdates:completion:](self, "performBatchUpdates:completion:", v25, v20);
}

- (void)_tvh_applyDeleteSectionsChange:(id)a3 applyChangeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && (!v7 || ((*((uint64_t (**)(id, uint64_t, id))v7 + 2))(v7, -1LL, v6) & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceIndexes]);
    id v10 = sub_100079C88();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Applying Delete Change: Deleting Sections At: %@",  (uint8_t *)&v12,  0xCu);
    }

    -[UICollectionView deleteSections:](self, "deleteSections:", v9);
  }
}

- (void)_tvh_applyInsertSectionsChange:(id)a3 applyChangeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && (!v7 || ((*((uint64_t (**)(id, uint64_t, id))v7 + 2))(v7, -1LL, v6) & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationIndexes]);
    id v10 = sub_100079C88();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Applying Insert Change: Inserting Sections At: %@",  (uint8_t *)&v12,  0xCu);
    }

    -[UICollectionView insertSections:](self, "insertSections:", v9);
  }
}

- (void)_tvh_applyMoveSectionsChanges:(id)a3 applyChangeHandler:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, uint64_t, void))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&__int128 v9 = 134218240LL;
    __int128 v20 = v9;
    do
    {
      int v12 = 0LL;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v12);
        if (!v7 || (v7[2](v7, -1LL, *(void *)(*((void *)&v22 + 1) + 8LL * (void)v12)) & 1) == 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceIndexes", v20));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 destinationIndexes]);
          id v16 = [v14 firstIndex];
          id v17 = [v15 firstIndex];
          id v18 = sub_100079C88();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            id v27 = v16;
            __int16 v28 = 2048;
            id v29 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Applying Move Change To Section %lu to %lu",  buf,  0x16u);
          }

          -[UICollectionView moveSection:toSection:](self, "moveSection:toSection:", v16, v17);
        }

        int v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v10);
  }
}

- (void)_tvh_applyDeleteItemsChange:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, unint64_t, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sourceIndexes]);
    id v12 = objc_msgSend((id)objc_opt_class(self), "_tvh_indexPathsWithIndexSet:andSection:", v11, a4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = sub_100079C88();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218242;
      unint64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Applying Delete Change To Section: %lu. Delete Items At: %@",  (uint8_t *)&v16,  0x16u);
    }

    -[UICollectionView deleteItemsAtIndexPaths:](self, "deleteItemsAtIndexPaths:", v13);
  }
}

- (void)_tvh_applyInsertItemsChange:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, unint64_t, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationIndexes]);
    id v12 = objc_msgSend((id)objc_opt_class(self), "_tvh_indexPathsWithIndexSet:andSection:", v11, a4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = sub_100079C88();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218242;
      unint64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Applying Insert Change To Section: %lu. Insert Items At: %@",  (uint8_t *)&v16,  0x16u);
    }

    -[UICollectionView insertItemsAtIndexPaths:](self, "insertItemsAtIndexPaths:", v13);
  }
}

- (void)_tvh_applyMoveItemsChanges:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, unint64_t, void))a5;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v24 = *(void *)v26;
    *(void *)&__int128 v10 = 138412546LL;
    __int128 v22 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (!v8 || (v8[2](v8, a4, *(void *)(*((void *)&v25 + 1) + 8LL * (void)i)) & 1) == 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceIndexes", v22));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 destinationIndexes]);
          id v16 = [v14 firstIndex];
          id v17 = [v15 firstIndex];
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v16,  a4));
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v17,  a4));
          id v20 = sub_100079C88();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v30 = v18;
            __int16 v31 = 2112;
            v32 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Applying Move Change To Item %@ to %@",  buf,  0x16u);
          }

          -[UICollectionView moveItemAtIndexPath:toIndexPath:](self, "moveItemAtIndexPath:toIndexPath:", v18, v19);
        }
      }

      id v11 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v11);
  }
}

- (void)_tvh_applyAmendItemsChanges:(id)a3 sectionIndex:(unint64_t)a4 applyChangeHandler:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, unint64_t, void))a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v14);
        if (!v8 || (v8[2](v8, a4, *(void *)(*((void *)&v22 + 1) + 8LL * (void)v14)) & 1) == 0)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 destinationIndexes]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  [v16 firstIndex],  a4));
          -[NSMutableArray addObject:](v9, "addObject:", v17);
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v12);
  }

  if (-[NSMutableArray count](v9, "count"))
  {
    id v18 = sub_100079C88();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
      *(_DWORD *)buf = 138412546;
      __int128 v27 = v20;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Applying Amend Change To Section: %@. Reloading Items At: %@",  buf,  0x16u);
    }

    -[UICollectionView reloadItemsAtIndexPaths:](self, "reloadItemsAtIndexPaths:", v9);
  }
}

+ (id)_tvh_indexPathsWithIndexSet:(id)a3 andSection:(unint64_t)a4
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000578B8;
  v8[3] = &unk_1000FE358;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = v6;
  unint64_t v10 = a4;
  [v5 enumerateIndexesUsingBlock:v8];

  return v6;
}

@end