@interface MTCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)updateAttributes:(id)a3 forIndexPath:(id)a4;
- (MTCollectionViewFlowLayout)init;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)superLayoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)updateAttributes:(id)a3 withTopAlignmentGuide:(double)a4 andLastYOrigin:(double)a5;
- (void)updateCachedLayoutAttributesForElementsInRect:(id)a3;
- (void)updateCellPresentationAttributes:(id)a3;
@end

@implementation MTCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes, a2);
}

- (MTCollectionViewFlowLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
  v2 = -[MTCollectionViewFlowLayout init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MTBaseCollectionViewFlowLayout setNumberOfColumns:](v2, "setNumberOfColumns:", 1LL);
    v7[0] = UIFlowLayoutCommonRowHorizontalAlignmentKey;
    v7[1] = UIFlowLayoutLastRowHorizontalAlignmentKey;
    v8[0] = &off_100254DD0;
    v8[1] = &off_100254DD0;
    v7[2] = UIFlowLayoutRowVerticalAlignmentKey;
    v8[2] = &off_100254DE8;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));
    -[MTCollectionViewFlowLayout _setRowAlignmentsOptions:](v3, "_setRowAlignmentsOptions:", v4);

    -[MTCollectionViewFlowLayout setMinimumInteritemSpacing:]( v3,  "setMinimumInteritemSpacing:",  kMTCollectionViewInterItemSpacing);
    -[MTCollectionViewFlowLayout setMinimumLineSpacing:]( v3,  "setMinimumLineSpacing:",  kMTCollectionViewInterLineSpacing);
    -[MTCollectionViewFlowLayout setSectionInset:]( v3,  "setSectionInset:",  kMTCollectionViewVerticalSectionInset,  0.0,  kMTCollectionViewVerticalSectionInset,  0.0);
  }

  return v3;
}

- (BOOL)updateAttributes:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 item];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  id v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

  if (v8 >= v10) {
    goto LABEL_26;
  }
  unint64_t v11 = (unint64_t)[v7 row];
  unint64_t v12 = v11 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  unint64_t v13 = (unint64_t)[v7 row];
  unint64_t v72 = v13 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  [v6 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  unint64_t v22 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  id v73 = v10;
  id v71 = v8;
  unint64_t v70 = v12;
  if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"))
  {
    unint64_t v23 = 0LL;
    do
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  v23 + v22 * v12,  [v7 section]));
      id v25 = [v24 item];
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      id v27 = objc_msgSend(v26, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

      if (v25 < v27 && [v24 compare:v7])
      {
        v75.receiver = self;
        v75.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
        id v28 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( &v75,  "layoutAttributesForItemAtIndexPath:",  v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        [v29 frame];
        if (v30 < v17) {
          double v17 = v30;
        }
      }

      ++v23;
    }

    while (v23 < -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"));
  }

  if (v72)
  {
    id v8 = v71;
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    v32 = (char *)objc_msgSend(v31, "numberOfItemsInSection:", objc_msgSend(v7, "section")) - 1;
    v33 = (char *)[v7 row];

    id v8 = v71;
    if (v32 == v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      [v34 bounds];
      double Width = CGRectGetWidth(v76);

      [v6 frame];
      double v36 = CGRectGetWidth(v77);
      double v37 = Width - v36 * (double)-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
      -[MTCollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      double v15 = (v37 - v38 * (double)(-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") - 1)) * 0.5;
    }
  }

  objc_msgSend(v6, "setFrame:", v15, v17, v19, v21);
  [v6 setZIndex:1];
  id v39 = [v7 section];
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  if (v39 != [v40 section])
  {
LABEL_24:
    id v10 = v73;
    goto LABEL_25;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  id v42 = [v41 compare:v7];

  id v10 = v73;
  if (!v42) {
    goto LABEL_26;
  }
  id v43 = v8;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  unint64_t v45 = (unint64_t)[v44 row];
  unint64_t v46 = v45 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  unint64_t v48 = (unint64_t)[v47 row];
  unint64_t v49 = v48 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

  BOOL v50 = v70 > v46;
  if (v70 != v46)
  {
    id v8 = v43;
    id v10 = v73;
    if (!v50 || v49 == v72) {
      goto LABEL_26;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  (_BYTE *)[v7 row]
                    - (_BYTE *)-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
                      [v7 section]));
    v60 = (void *)objc_claimAutoreleasedReturnValue( -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v40));
    [v6 frame];
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    [v60 frame];
    double MaxY = CGRectGetMaxY(v78);
    -[MTCollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
    objc_msgSend(v6, "setFrame:", v62, MaxY + v68, v64, v66);

    goto LABEL_24;
  }

  id v10 = v73;
  id v8 = v43;
  if (v49 != v72)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
    id v52 = [v51 row];
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    id v54 = objc_msgSend(v53, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

    BOOL v55 = v52 >= v54;
    id v10 = v73;
    if (!v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
      v74.receiver = self;
      v74.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
      id v57 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( &v74,  "layoutAttributesForItemAtIndexPath:",  v56);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v57);

      id v10 = v73;
      [v6 frame];
      double v59 = v58;
      [v40 frame];
      [v6 setFrame:v59];
LABEL_25:
    }
  }

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
  id v5 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v8, "layoutAttributesForItemAtIndexPath:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") < 2) {
    [v6 setZIndex:1];
  }
  else {
    -[MTCollectionViewFlowLayout updateAttributes:forIndexPath:](self, "updateAttributes:forIndexPath:", v6, v4);
  }
  -[MTCollectionViewFlowLayout updateCellPresentationAttributes:](self, "updateCellPresentationAttributes:", v6);

  return v6;
}

- (id)superLayoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
  id v8 = -[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:]( &v11,  "layoutAttributesForSupplementaryViewOfKind:atIndexPath:",  v6,  v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"MTUnplayedBackgroundCollectionReusableViewKind"])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:]( self,  "layoutAttributesForSupplementaryViewOfKind:atIndexPath:",  UICollectionElementKindSectionHeader,  v7));
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double Width = v13;
    double Height = v15;
    double v17 = (void *)objc_claimAutoreleasedReturnValue( +[MTCollectionViewFlowLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:]( &OBJC_CLASS___MTCollectionViewFlowLayoutAttributes,  "layoutAttributesForSupplementaryViewOfKind:withIndexPath:",  @"MTUnplayedBackgroundCollectionReusableViewKind",  v7));
    [v17 setZIndex:0];
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 refreshControl]);
    double v20 = v19;
    if (v19)
    {
      [v19 frame];
      double Height = CGRectGetHeight(v31);
      [v20 frame];
      double Width = CGRectGetWidth(v32);
    }

    objc_msgSend(v17, "setFrame:", v10, v12, Width, Height);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[MTCollectionViewFlowLayout superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:]( self,  "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:",  v6,  v7));
    if (v8)
    {
      -[MTBaseCollectionViewFlowLayout appliedYOffset](self, "appliedYOffset");
      double v22 = v21;
      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      v24 = (char *)[v23 numberOfSections] - 1;

      if ([v7 section] == v24)
      {
        double v25 = 1.79769313e308;
      }

      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathWithIndex:]( NSIndexPath,  "indexPathWithIndex:",  (char *)[v7 section] + 1));
        id v27 = (void *)objc_claimAutoreleasedReturnValue( -[MTCollectionViewFlowLayout superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:]( self,  "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:",  v6,  v26));
        id v28 = v27;
        if (v27)
        {
          [v27 frame];
          double v25 = v29;
        }

        else
        {
          double v25 = 1.79769313e308;
        }
      }

      -[MTCollectionViewFlowLayout updateAttributes:withTopAlignmentGuide:andLastYOrigin:]( self,  "updateAttributes:withTopAlignmentGuide:andLastYOrigin:",  v8,  v22,  v25);
      id v8 = v8;
      double v17 = v8;
    }

    else
    {
      double v17 = 0LL;
    }
  }

  return v17;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___MTCollectionViewFlowLayout;
  id v8 = -[MTCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v82, "layoutAttributesForElementsInRect:");
  double v68 = (void *)objc_claimAutoreleasedReturnValue(v8);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  BOOL v10 = [v9 numberOfSections] == 0;

  if (v10)
  {
    double v66 = v68;
    id v65 = v68;
  }

  else
  {
    id v11 = [v68 mutableCopy];
    if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") >= 2)
    {
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v78 objects:v85 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v79;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v79 != v14) {
              objc_enumerationMutation(v12);
            }
            double v16 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
            double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 representedElementKind]);
            BOOL v18 = v17 == 0LL;

            if (v18)
            {
              double v19 = (void *)objc_claimAutoreleasedReturnValue([v16 indexPath]);
              -[MTCollectionViewFlowLayout updateAttributes:forIndexPath:]( self,  "updateAttributes:forIndexPath:",  v16,  v19);
            }
          }

          id v13 = [v12 countByEnumeratingWithState:&v78 objects:v85 count:16];
        }

        while (v13);
      }
    }

    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id v20 = v11;
    id v21 = [v20 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v75;
      do
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v75 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)j);
          double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 representedElementKind]);
          BOOL v26 = v25 == 0LL;

          if (v26) {
            -[MTCollectionViewFlowLayout updateCellPresentationAttributes:]( self,  "updateCellPresentationAttributes:",  v24);
          }
        }

        id v21 = [v20 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }

      while (v21);
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
    if (v27)
    {
      BOOL v28 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") > 1;

      if (v28)
      {
        double v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
        unint64_t v30 = (unint64_t)[v29 row];
        unint64_t v31 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

        CGRect v32 = (void *)objc_claimAutoreleasedReturnValue([v20 lastObject]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 indexPath]);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
        v35 = (char *)objc_msgSend(v34, "numberOfItemsInSection:", objc_msgSend(v33, "section"));

        unint64_t v36 = (unint64_t)[v33 item] + 1;
        if ((uint64_t)v36 < (uint64_t)v35)
        {
          unint64_t v37 = v30 % v31;
          do
          {
            while (v36 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") == v37)
            {
            }

            double v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  v36,  [v33 section]));
            id v39 = (void *)objc_claimAutoreleasedReturnValue( -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v38));
            [v20 addObject:v39];
            [v39 frame];
            double MaxY = CGRectGetMaxY(v86);
            v87.origin.CGFloat x = x;
            v87.origin.CGFloat y = y;
            v87.size.CGFloat width = width;
            v87.size.CGFloat height = height;
            BOOL v41 = MaxY < CGRectGetMaxY(v87);
          }

          while ((uint64_t)++v36 < (uint64_t)v35 && v41);
        }

- (void)updateCachedLayoutAttributesForElementsInRect:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___UICollectionView);
  InstanceVariable = class_getInstanceVariable(v5, "_collectionViewData");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  id Ivar = object_getIvar(v7, InstanceVariable);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(Ivar);

  if (!v9)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    v34 = v33;
    v35 = @"Unable to retreive collection view data instance.";
    uint64_t v36 = 373LL;
LABEL_26:
    [v33 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:v36 format:v35];

    goto LABEL_30;
  }

  BOOL v10 = NSClassFromString(@"UICollectionViewData");
  if (!v10)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    v34 = v33;
    v35 = @"Unable to retreive collection view data class.";
    uint64_t v36 = 379LL;
    goto LABEL_26;
  }

  id v11 = class_getInstanceVariable(v10, "_supplementaryLayoutAttributes");
  id v12 = object_getIvar(v9, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:UICollectionElementKindSectionHeader]);
    if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
    {
      double v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
      [v38 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:392 format:@"Unable to retreive cached supplementary layout attributes of kind header from collection view data."];
    }

    else if ([v15 count])
    {
      id v39 = v13;
      v40 = v9;
      double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v41 = v4;
      id v18 = v4;
      id v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v18);
            }
            unint64_t v23 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 representedElementKind]);
            unsigned int v25 = [UICollectionElementKindSectionHeader isEqualToString:v24];

            if (v25)
            {
              BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v23 indexPath]);
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v26]);
              BOOL v28 = v27;
              if (v27 && ([v27 isEqual:v23] & 1) == 0)
              {
                [v15 setObject:v23 forKey:v26];
                double v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v26 section]));
                [v17 addObject:v29];
              }
            }
          }

          id v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }

        while (v20);
      }

      if ([v17 count])
      {
        unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
        unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
        CGRect v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", @", "));
        [v30 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", 422, @"Collection view data cache updated with new attributes for sections: %@", v32 lineNumber format];
      }

      double v9 = v40;
      id v4 = v41;
      id v13 = v39;
    }
  }

  else
  {
    unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v37 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m" lineNumber:386 format:@"Unable to retreive cached supplementary layout attributes from collection view data."];
  }

LABEL_30:
}

- (void)updateCellPresentationAttributes:(id)a3
{
  id v20 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v20 indexPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  id v7 = (char *)objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v5, "section"));

  unint64_t v8 = (unint64_t)(v7 - 1);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 swipedCellIndexPath]);
  id v10 = [v9 compare:v5];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 swipedCellIndexPath]);
  if (v11) {
    BOOL v12 = v10 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v12;
  [v20 setOpen:v13];

  [v20 setShowsSeperator:1];
  if ([v5 item] == (id)v8
    || (unint64_t v14 = (unint64_t)[v5 item],
        unint64_t v15 = v14 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        unint64_t v16 = (unint64_t)[v5 item],
        unint64_t v17 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        unint64_t v18 = v8 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        unint64_t v19 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        v15 == v18 - 1)
    && v16 % v17 != v8 % v19
    || v15 == v18)
  {
    [v20 setShowsSeperator:0];
  }
}

- (void)updateAttributes:(id)a3 withTopAlignmentGuide:(double)a4 andLastYOrigin:(double)a5
{
  id v7 = a3;
  if (v7)
  {
    id v15 = v7;
    [v7 naturalRect];
    if (v8 == 0.0)
    {
      [v15 frame];
      objc_msgSend(v15, "setNaturalRect:");
    }

    [v15 frame];
    double x = v16.origin.x;
    double y = v16.origin.y;
    double width = v16.size.width;
    double height = v16.size.height;
    if (CGRectGetMinY(v16) >= a4
      || (v17.origin.double x = x,
          v17.origin.double y = y,
          v17.size.double width = width,
          v17.size.double height = height,
          CGRectGetHeight(v17) + a4 >= a5))
    {
      v18.origin.double x = x;
      v18.origin.double y = y;
      v18.size.double width = width;
      v18.size.double height = height;
      double MinY = CGRectGetMinY(v18);
      if (a5 > a4 && MinY < a4)
      {
        v19.origin.double x = x;
        v19.origin.double y = y;
        v19.size.double width = width;
        v19.size.double height = height;
        double y = a5 - CGRectGetHeight(v19);
        [v15 setFloating:1];
        [v15 setPartiallyOffTheTop:1];
      }
    }

    else
    {
      [v15 setFloating:1];
      double y = a4;
    }

    objc_msgSend(v15, "setFrame:", x, y, width, height);
    else {
      uint64_t v14 = 2LL;
    }
    [v15 setZIndex:v14];
    id v7 = v15;
  }
}

@end