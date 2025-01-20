@interface TVHCollectionViewChangeSetDataSource
+ (TVHCollectionViewChangeSetDataSource)new;
- (TVHChangeSetDataSourceContentProvider)contentProvider;
- (TVHCollectionViewChangeSetDataSource)init;
- (TVHCollectionViewChangeSetDataSource)initWithCollectionView:(id)a3 contentProvider:(id)a4 cellReuseIdentifierProvider:(id)a5 cellConfigurator:(id)a6;
- (UICollectionView)collectionView;
- (id)_visibleCells;
- (id)cellConfigurator;
- (id)cellReuseIdentifierProvider;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexTitlesForCollectionView:(id)a3;
- (id)supplementaryViewProvider;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_updateCell:(id)a3 atIndexPath:(id)a4;
- (void)changeSetDataSourceContentProvider:(id)a3 contentDidChangeWithSectionsChangeSet:(id)a4 updateUnderlyingModelHandler:(id)a5 animateChanges:(BOOL)a6 completionHandler:(id)a7;
- (void)setSupplementaryViewProvider:(id)a3;
@end

@implementation TVHCollectionViewChangeSetDataSource

+ (TVHCollectionViewChangeSetDataSource)new
{
  return 0LL;
}

- (TVHCollectionViewChangeSetDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCollectionViewChangeSetDataSource)initWithCollectionView:(id)a3 contentProvider:(id)a4 cellReuseIdentifierProvider:(id)a5 cellConfigurator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVHCollectionViewChangeSetDataSource;
  v14 = -[TVHCollectionViewChangeSetDataSource init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_collectionView, v10);
    [v10 setDataSource:v15];
    objc_storeStrong((id *)&v15->_contentProvider, a4);
    -[TVHChangeSetDataSourceContentProvider setChangeSetDataSourceContentProviderDelegate:]( v15->_contentProvider,  "setChangeSetDataSourceContentProviderDelegate:",  v15);
    id v16 = [v13 copy];
    id cellConfigurator = v15->_cellConfigurator;
    v15->_id cellConfigurator = v16;

    id v18 = [v12 copy];
    id cellReuseIdentifierProvider = v15->_cellReuseIdentifierProvider;
    v15->_id cellReuseIdentifierProvider = v18;

    [v10 reloadData];
  }

  return v15;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider", a3));
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider", a3));
  id v6 = [v5 numberOfItemsInSectionAtIndex:a4];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[TVHCollectionViewChangeSetDataSource supplementaryViewProvider]( self,  "supplementaryViewProvider"));
  uint64_t v12 = ((uint64_t (**)(void, id, id, id))v11)[2](v11, v10, v9, v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[TVHCollectionViewChangeSetDataSource cellReuseIdentifierProvider]( self,  "cellReuseIdentifierProvider"));
  uint64_t v9 = ((uint64_t (**)(void, id))v8)[2](v8, v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6]);

  -[TVHCollectionViewChangeSetDataSource _updateCell:atIndexPath:](self, "_updateCell:atIndexPath:", v11, v6);
  return v11;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexTitles]);

  return v4;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForIndexTitle:v7 atIndex:a5]);

  id v10 = sub_100079C18();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v27 = 138413314;
    v28 = v9;
    __int16 v29 = 2048;
    id v30 = [v9 section];
    __int16 v31 = 2048;
    id v32 = [v9 item];
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2048;
    int64_t v36 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "TVHCollectionViewChangeSetDataSource contentProvider returned indexPath=%@ (section=%lu, item=%lu) for title. title=%@, index=%lu",  (uint8_t *)&v27,  0x34u);
  }

  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider"));
  id v13 = (char *)[v12 numberOfSections];

  v14 = (char *)[v9 section];
  if (v14 < v13)
  {
    id v15 = [v9 item];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider"));
    id v17 = [v16 numberOfItemsInSectionAtIndex:v14];

    if (v15 < v17)
    {
      id v18 = v9;
      goto LABEL_15;
    }
  }

  v19 = v13 - 1;
  do
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource contentProvider](self, "contentProvider"));
    id v21 = [v20 numberOfItemsInSectionAtIndex:v19];

    --v19;
  }

  while (!v21);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  v14));
  id v22 = sub_100079C18();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    int v27 = 138413314;
    v28 = v9;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2048;
    id v32 = (id)a5;
    __int16 v33 = 2112;
    id v34 = v18;
    __int16 v35 = 2048;
    int64_t v36 = (int64_t)v13;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "TVHCollectionViewChangeSetDataSource contentProvider returned an invalid index path for title. Clamped index path to last section with items. indexPath=%@, title=%@, index=%lu, clampedIndexPath=%@, numSections=%lu",  (uint8_t *)&v27,  0x34u);
  }

  if (!v18)
  {
LABEL_12:
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    id v24 = sub_100079C18();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      int v27 = 138412802;
      v28 = v18;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2048;
      id v32 = (id)a5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "TVHCollectionViewChangeSetDataSource contentProvider returned a nil index path. Will return indexPath pointing t o the first item in the first section. indexPath=%@, title=%@, index=%lu",  (uint8_t *)&v27,  0x20u);
    }
  }

- (void)changeSetDataSourceContentProvider:(id)a3 contentDidChangeWithSectionsChangeSet:(id)a4 updateUnderlyingModelHandler:(id)a5 animateChanges:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(void))a5;
  id v15 = (void (**)(void))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource collectionView](self, "collectionView"));
  if (v13 && v8)
  {
    if ([v13 hasChanges])
    {
      v21[0] = 0LL;
      v21[1] = v21;
      v21[2] = 0x3032000000LL;
      v21[3] = sub_10007976C;
      v21[4] = sub_10007977C;
      id v22 = 0LL;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100079784;
      v20[3] = &unk_1000FF338;
      v20[4] = self;
      v20[5] = v21;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10007991C;
      v17[3] = &unk_1000FF360;
      id v18 = v16;
      v19 = v15;
      objc_msgSend( v18,  "tvh_performBatchUpdatesWithSectionsChangeSet:updateDataSourceHandler:applyChangeHandler:completionHandler:",  v13,  v14,  v20,  v17);

      _Block_object_dispose(v21, 8);
    }
  }

  else
  {
    v14[2](v14);
    [v16 reloadData];
    if (v15) {
      v15[2](v15);
    }
  }
}

- (id)_visibleCells
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewChangeSetDataSource collectionView](self, "collectionView"));
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 visibleCells]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v2 indexPathForCell:v9]);
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  id v11 = -[NSMutableDictionary copy](v3, "copy");

  return v11;
}

- (void)_updateCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue( -[TVHCollectionViewChangeSetDataSource cellConfigurator]( self,  "cellConfigurator"));
  v8[2](v8, v7, v6);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (TVHChangeSetDataSourceContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (id)supplementaryViewProvider
{
  return self->_supplementaryViewProvider;
}

- (void)setSupplementaryViewProvider:(id)a3
{
}

- (id)cellReuseIdentifierProvider
{
  return self->_cellReuseIdentifierProvider;
}

- (id)cellConfigurator
{
  return self->_cellConfigurator;
}

- (void).cxx_destruct
{
}

@end