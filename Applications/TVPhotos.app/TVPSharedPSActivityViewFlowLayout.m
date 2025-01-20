@interface TVPSharedPSActivityViewFlowLayout
- (CGSize)_contentSize;
- (CGSize)collectionViewContentSize;
- (NSDictionary)photoBatchFrames;
- (NSMutableDictionary)indexPathToAttributesForCell;
- (double)totalContentXOffset;
- (id)_batchFramesForPhotoBatches:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setPhotoBatchFrames:(id)a3;
- (void)setTotalContentXOffset:(double)a3;
@end

@implementation TVPSharedPSActivityViewFlowLayout

- (void)prepareLayout
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityViewFlowLayout;
  -[TVPSharedPSActivityViewFlowLayout prepareLayout](&v11, "prepareLayout");
  self->_totalContentXOffset = 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewFlowLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSource]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewFlowLayout collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 photoBatchesForCollectionView:v5 layout:self]);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSActivityViewFlowLayout _batchFramesForPhotoBatches:]( self,  "_batchFramesForPhotoBatches:",  v6));
  photoBatchFrames = self->_photoBatchFrames;
  self->_photoBatchFrames = v7;

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  indexPathToAttributesForCell = self->_indexPathToAttributesForCell;
  self->_indexPathToAttributesForCell = v9;
}

- (CGSize)collectionViewContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  obj = self->_photoBatchFrames;
  id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v64,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v61;
    v10 = &ACAccountStoreDidChangeNotification_ptr;
    double v47 = 666.0;
    v58 = self;
    v59 = v6;
    uint64_t v48 = *(void *)v61;
    double v49 = width;
    double v50 = height;
    do
    {
      objc_super v11 = 0LL;
      id v51 = v8;
      do
      {
        if (*(void *)v61 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_photoBatchFrames,  "objectForKey:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)v11),  *(void *)&v47));
        [v12 batchFrame];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        v65.origin.CGFloat x = x;
        v65.origin.CGFloat y = y;
        v65.size.CGFloat width = width;
        v65.size.CGFloat height = height;
        v66.origin.CGFloat x = v14;
        v66.origin.CGFloat y = v16;
        v66.size.CGFloat width = v18;
        v66.size.CGFloat height = v20;
        if (CGRectIntersectsRect(v65, v66))
        {
          v55 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v12 photoIndices]);
          id v22 = [v21 count];

          v23 = (void *)objc_claimAutoreleasedReturnValue([v12 photoIndices]);
          [v12 batchFrame];
          double v25 = v24;
          [v12 batchFrame];
          double v27 = v26;
          v28 = (NSString **)v10[122];
          v29 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:0]);
          uint64_t v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "indexPathForItem:inSection:", (int)objc_msgSend(v29, "intValue"), 0));

          v31 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v30));
          objc_msgSend(v31, "setFrame:", v25, v27, v47, v47);
          -[NSMutableArray addObject:](v6, "addObject:", v31);
          -[NSMutableDictionary setObject:forKey:](self->_indexPathToAttributesForCell, "setObject:forKey:", v31, v30);
          double v32 = v25 + 716.0;
          v53 = v31;
          v54 = (void *)v30;
          if ((v22 & 1) != 0)
          {
            uint64_t v37 = 1LL;
          }

          else
          {
            v33 = (NSString **)v10[122];
            v34 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:1]);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "indexPathForItem:inSection:", (int)objc_msgSend(v34, "intValue"), 0));

            v36 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v35));
            objc_msgSend(v36, "setFrame:", v32, v27, v47, v47);
            -[NSMutableArray addObject:](v6, "addObject:", v36);
            -[NSMutableDictionary setObject:forKey:](self->_indexPathToAttributesForCell, "setObject:forKey:", v36, v35);
            double v32 = v32 + 716.0;

            uint64_t v37 = 2LL;
          }

          if (v37 < (uint64_t)v22)
          {
            char v38 = 0;
            do
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:v37]);
              v40 = v10;
              v41 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)v10[122],  "indexPathForItem:inSection:",  (int)objc_msgSend(v39, "intValue"),  0));
              v42 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v41));
              objc_msgSend(v42, "setFrame:", v32, v27, 308.0, 308.0);
              if ((v38 & 1) != 0)
              {
                double v32 = v32 + 358.0;
                [v12 batchFrame];
                double v27 = v43;
              }

              else
              {
                double v27 = v27 + 358.0;
              }

              v38 ^= 1u;
              -[NSMutableArray addObject:](v59, "addObject:", v42);
              -[NSMutableDictionary setObject:forKey:]( v58->_indexPathToAttributesForCell,  "setObject:forKey:",  v42,  v41);

              ++v37;
              v10 = v40;
            }

            while (v22 != (id)v37);
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)v10[122],  "indexPathForItem:inSection:",  objc_msgSend(v12, "batchIndex"),  0));
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForSupplementaryViewOfKind:withIndexPath:",  @"supplementaryView",  v44));
          objc_msgSend(v45, "setFrame:", v14, v16 + v20 + 31.0, v18, 62.0);
          v6 = v59;
          -[NSMutableArray addObject:](v59, "addObject:", v45);

          CGFloat width = v49;
          CGFloat height = v50;
          uint64_t v9 = v48;
          id v8 = v51;
          self = v58;
          objc_super v11 = v55;
        }

        objc_super v11 = (char *)v11 + 1;
      }

      while (v11 != v8);
      id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v64,  16LL);
    }

    while (v8);
  }

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_indexPathToAttributesForCell, "objectForKey:", v4));
  if (!v5)
  {
    id v7 = [v4 item];
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_photoBatchFrames, "allKeys"));
    id v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      id v10 = v9;
      id v46 = v4;
      double v49 = 0LL;
      uint64_t v11 = *(void *)v55;
      id obj = v8;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(obj);
          }
          double v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_photoBatchFrames,  "objectForKey:",  *(void *)(*((void *)&v54 + 1) + 8LL * (void)i)));
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 photoIndices]);
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v51;
            while (2)
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v51 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([*(id *)(*((void *)&v50 + 1) + 8 * (void)j) integerValue] == v7)
                {
                  id v20 = v13;

                  double v49 = v20;
                  goto LABEL_18;
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

- (id)_batchFramesForPhotoBatches:(id)a3
{
  id v4 = a3;
  id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0LL;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photosInfo]);
        int64_t v14 = (int64_t)[v13 count];

        uint64_t v15 = (v14 | 0xFFFFFFFFFFFFFFFELL) + v14;
        if (v15 < 0 != __OFADD__(v14 | 0xFFFFFFFFFFFFFFFELL, v14)) {
          ++v15;
        }
        double v16 = dbl_100097920[(v14 & 1) == 0] + (double)(v15 >> 1) * 50.0 + (double)(v15 >> 1) * 308.0;
        double totalContentXOffset = self->_totalContentXOffset;
        uint64_t v18 = (char *)[v5 count] - 1;
        double v19 = v16 + 50.0;
        self->_double totalContentXOffset = v19 + self->_totalContentXOffset;
        objc_msgSend(v12, "setBatchFrame:", totalContentXOffset, 0.0, v16, 666.0);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 ID]);
        -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v12, v20);

        id v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      int v8 = (_DWORD)v7 + v11;
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  return v22;
}

- (CGSize)_contentSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewFlowLayout collectionView](self, "collectionView"));
  [v3 frame];
  double v5 = v4;

  double totalContentXOffset = self->_totalContentXOffset;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v7, "setContentSize:", totalContentXOffset, v5);

  double v8 = totalContentXOffset;
  double v9 = v5;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (double)totalContentXOffset
{
  return self->_totalContentXOffset;
}

- (void)setTotalContentXOffset:(double)a3
{
  self->_double totalContentXOffset = a3;
}

- (NSDictionary)photoBatchFrames
{
  return self->_photoBatchFrames;
}

- (void)setPhotoBatchFrames:(id)a3
{
}

- (NSMutableDictionary)indexPathToAttributesForCell
{
  return self->_indexPathToAttributesForCell;
}

- (void).cxx_destruct
{
}

@end