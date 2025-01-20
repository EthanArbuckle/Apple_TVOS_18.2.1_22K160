@interface TVHCollectionViewDiffableDataSource
+ (TVHCollectionViewDiffableDataSource)new;
- (TVHCollectionViewDiffableDataSource)init;
- (TVHCollectionViewDiffableDataSource)initWithCollectionView:(id)a3 contentProvider:(id)a4 cellReuseIdentifierProvider:(id)a5 cellConfigurator:(id)a6;
- (TVHDiffableDataSourceContentProvider)contentProvider;
- (UICollectionView)collectionView;
- (_TVHCollectionViewDiffableDataSource)diffableDataSource;
- (id)_cellForCollectionView:(id)a3 atIndexPath:(id)a4 withItemIdentifier:(id)a5;
- (id)_updateVisibleCellsWithItemIdentifiers:(id)a3;
- (id)cellConfigurator;
- (id)cellReuseIdentifierProvider;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)indexTitles;
- (id)supplementaryViewProvider;
- (void)_dataSourceContentDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4;
- (void)_updateCell:(id)a3 withItemIdentifier:(id)a4;
- (void)diffableDataSourceContentProvider:(id)a3 contentDidChangeWithAnimateChanges:(BOOL)a4 itemIdentifiersOfAmendedItems:(id)a5;
- (void)setSupplementaryViewProvider:(id)a3;
@end

@implementation TVHCollectionViewDiffableDataSource

+ (TVHCollectionViewDiffableDataSource)new
{
  return 0LL;
}

- (TVHCollectionViewDiffableDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCollectionViewDiffableDataSource)initWithCollectionView:(id)a3 contentProvider:(id)a4 cellReuseIdentifierProvider:(id)a5 cellConfigurator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVHCollectionViewDiffableDataSource;
  v14 = -[TVHCollectionViewDiffableDataSource init](&v30, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contentProvider, a4);
    -[TVHDiffableDataSourceContentProvider setDiffableDataSourceContentProviderDelegate:]( v15->_contentProvider,  "setDiffableDataSourceContentProviderDelegate:",  v15);
    id v16 = [v13 copy];
    id cellConfigurator = v15->_cellConfigurator;
    v15->_id cellConfigurator = v16;

    id v18 = [v12 copy];
    id cellReuseIdentifierProvider = v15->_cellReuseIdentifierProvider;
    v15->_id cellReuseIdentifierProvider = v18;

    objc_initWeak(&location, v15);
    v20 = objc_alloc(&OBJC_CLASS____TVHCollectionViewDiffableDataSource);
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    v26 = sub_10003FF88;
    v27 = &unk_1000FD018;
    objc_copyWeak(&v28, &location);
    v21 = -[_TVHCollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v20,  "initWithCollectionView:cellProvider:",  v10,  &v24);
    diffableDataSource = v15->_diffableDataSource;
    v15->_diffableDataSource = v21;

    -[_TVHCollectionViewDiffableDataSource setDataSourceOverrider:]( v15->_diffableDataSource,  "setDataSourceOverrider:",  v15,  v24,  v25,  v26,  v27);
    -[TVHCollectionViewDiffableDataSource _dataSourceContentDidChangeWithAnimateChanges:itemIdentifiersOfAmendedItems:]( v15,  "_dataSourceContentDidChangeWithAnimateChanges:itemIdentifiersOfAmendedItems:",  0LL,  0LL);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (UICollectionView)collectionView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource diffableDataSource](self, "diffableDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);

  return (UICollectionView *)v3;
}

- (void)setSupplementaryViewProvider:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource diffableDataSource](self, "diffableDataSource"));
  [v5 setSupplementaryViewProvider:v4];
}

- (id)supplementaryViewProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource diffableDataSource](self, "diffableDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 supplementaryViewProvider]);

  return v3;
}

- (id)indexTitles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource contentProvider](self, "contentProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 indexTitles]);

  return v3;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource contentProvider](self, "contentProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathForIndexTitle:v6 atIndex:a4]);

  return v8;
}

- (void)diffableDataSourceContentProvider:(id)a3 contentDidChangeWithAnimateChanges:(BOOL)a4 itemIdentifiersOfAmendedItems:(id)a5
{
}

- (void)_dataSourceContentDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource contentProvider](self, "contentProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100040268;
  v11[3] = &unk_1000FDF40;
  v11[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDiffableDataSourceSnapshot tvh_diffableDataSourceSnapshotWithContentProvider:itemIdentifiersOfAmendedItems:itemIdentifiersToReloadBlock:]( &OBJC_CLASS___NSDiffableDataSourceSnapshot,  "tvh_diffableDataSourceSnapshotWithContentProvider:itemIdentifiersOfAmendedItems:itemIdentifiersToReloadBlock:",  v7,  v6,  v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource diffableDataSource](self, "diffableDataSource"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100040274;
  v10[3] = &unk_1000FCEA8;
  v10[4] = self;
  [v9 applySnapshot:v8 animatingDifferences:v4 completion:v10];
}

- (id)_updateVisibleCellsWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewDiffableDataSource collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleCells]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvh_diffableDataSourceIdentifier"));
        if (v13 && [v4 containsObject:v13])
        {
          -[TVHCollectionViewDiffableDataSource _updateCell:withItemIdentifier:]( self,  "_updateCell:withItemIdentifier:",  v12,  v13);
          -[NSMutableSet addObject:](v5, "addObject:", v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  id v14 = [v4 mutableCopy];
  [v14 minusSet:v5];

  return v14;
}

- (void)_updateCell:(id)a3 withItemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue( -[TVHCollectionViewDiffableDataSource cellConfigurator]( self,  "cellConfigurator"));
  v8[2](v8, v7, v6);
}

- (id)_cellForCollectionView:(id)a3 atIndexPath:(id)a4 withItemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVHCollectionViewDiffableDataSource cellReuseIdentifierProvider]( self,  "cellReuseIdentifierProvider"));
  uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v9, v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v9]);

  objc_msgSend(v14, "tvh_setDiffableDataSourceIdentifier:", v8);
  -[TVHCollectionViewDiffableDataSource _updateCell:withItemIdentifier:]( self,  "_updateCell:withItemIdentifier:",  v14,  v8);

  return v14;
}

- (TVHDiffableDataSourceContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (_TVHCollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
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