@interface _TVHCollectionViewDiffableDataSource
- (UICollectionView)collectionView;
- (_TVHCollectionViewDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4;
- (_TVHCollectionViewDiffableDataSourceOverriding)dataSourceOverrider;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)indexTitlesForCollectionView:(id)a3;
- (void)setDataSourceOverrider:(id)a3;
@end

@implementation _TVHCollectionViewDiffableDataSource

- (_TVHCollectionViewDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVHCollectionViewDiffableDataSource;
  v7 = -[_TVHCollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( &v10,  "initWithCollectionView:cellProvider:",  v6,  a4);
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_collectionView, v6);
  }

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVHCollectionViewDiffableDataSource dataSourceOverrider](self, "dataSourceOverrider", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexTitles]);

  return v4;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TVHCollectionViewDiffableDataSource dataSourceOverrider](self, "dataSourceOverrider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForIndexTitle:v9 atIndex:a5]);

  id v12 = sub_10007A1C8();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v41 = v11;
    __int16 v42 = 2048;
    id v43 = [v11 section];
    __int16 v44 = 2048;
    id v45 = [v11 item];
    __int16 v46 = 2112;
    id v47 = v9;
    __int16 v48 = 2048;
    int64_t v49 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "TVHCollectionViewDiffableDataSource dataSourceOverrider returned indexPath=%@ (section=%lu, item=%lu) for title. t itle=%@, index=%lu",  buf,  0x34u);
  }

  if (!v11) {
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TVHCollectionViewDiffableDataSource snapshot](self, "snapshot"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sectionIdentifiers]);
  id v16 = [v15 count];
  id v17 = [v11 section];
  if (v16 > v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v17]);
    id v19 = [v11 item];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 itemIdentifiersInSectionWithIdentifier:v18]);
    LODWORD(v19) = [v20 count] > v19;

    if ((_DWORD)v19)
    {

LABEL_12:
      goto LABEL_13;
    }
  }

  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_10003FC04;
  v38 = sub_10003FC14;
  id v39 = 0LL;
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  v30 = sub_10003FC1C;
  v31 = &unk_1000FDF18;
  id v21 = v14;
  id v32 = v21;
  v33 = &v34;
  [v15 enumerateObjectsWithOptions:2 usingBlock:&v28];
  id v22 = sub_10007A1C8();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    v27 = (void *)v35[5];
    *(_DWORD *)buf = 138413314;
    v41 = v11;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 2048;
    id v45 = (id)a5;
    __int16 v46 = 2112;
    id v47 = v27;
    __int16 v48 = 2048;
    int64_t v49 = (int64_t)v16;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "TVHCollectionViewDiffableDataSource dataSourceOverrider returned an invalid index path for title. Clamped index pa th to last section with items. indexPath=%@, title=%@, index=%lu, clampedIndexPath=%@, numSections=%lu",  buf,  0x34u);
  }

  id v24 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  v11 = v24;
  if (!v24)
  {
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL,  v28,  v29,  v30,  v31));
    id v25 = sub_10007A1C8();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v11;
      __int16 v42 = 2112;
      id v43 = v9;
      __int16 v44 = 2048;
      id v45 = (id)a5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_FAULT,  "TVHCollectionViewDiffableDataSource dataSourceOverrider returned a nil index path. Will return indexPath pointin g to the first item in the first section. indexPath=%@, title=%@, index=%lu",  buf,  0x20u);
    }

    goto LABEL_12;
  }

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (_TVHCollectionViewDiffableDataSourceOverriding)dataSourceOverrider
{
  return (_TVHCollectionViewDiffableDataSourceOverriding *)objc_loadWeakRetained((id *)&self->_dataSourceOverrider);
}

- (void)setDataSourceOverrider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end