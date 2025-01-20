@interface UICollectionView
- (BOOL)_cellAtIndexPath:(id)a3 headerKind:(id)a4 overlapsHeaderView:(id)a5 sectionScrollOffsets:(id)a6;
- (id)tvphotoLibrary_indexPathsForElementsInRect:(CGRect)a3;
- (void)adjustSupplementaryView:(id)a3 forElementKind:(id)a4 atIndexPath:(id)a5 sectionScrollOffsets:(id)a6;
- (void)animateSupplementaryViewsForFocusUpdateInContext:(id)a3 withCoordinator:(id)a4 withKinds:(id)a5 sectionScrollOffsets:(id)a6;
@end

@implementation UICollectionView

- (id)tvphotoLibrary_indexPathsForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self, "collectionViewLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height));

  if ([v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "indexPath", (void)v17));
          [v9 addObject:v15];

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v12);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void)animateSupplementaryViewsForFocusUpdateInContext:(id)a3 withCoordinator:(id)a4 withKinds:(id)a5 sectionScrollOffsets:(id)a6
{
  id v35 = a4;
  id v10 = a5;
  id v34 = a6;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([a3 nextFocusedIndexPath]);
  v33 = (void *)v11;
  if (v11) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v11));
  }
  else {
    id v12 = 0LL;
  }
  uint64_t v13 = 0LL;
  if ((objc_opt_respondsToSelector(v12, "desiredTopOffset") & 1) != 0)
  {
    [v12 desiredTopOffset];
    uint64_t v13 = v14;
  }

  v28 = v12;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v10;
  id v31 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v47;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v15;
        uint64_t v37 = *(void *)(*((void *)&v46 + 1) + 8 * v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView indexPathsForVisibleSupplementaryElementsOfKind:]( self,  "indexPathsForVisibleSupplementaryElementsOfKind:"));
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v36 = v16;
        id v17 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v43 != v19) {
                objc_enumerationMutation(v36);
              }
              v21 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
              v22 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView supplementaryViewForElementKind:atIndexPath:]( self,  "supplementaryViewForElementKind:atIndexPath:",  v37,  v21));
              if ([v22 conformsToProtocol:&OBJC_PROTOCOL___TVPFocusSectionHeaderAvoiding])
              {
                id v23 = v22;
                unsigned int v24 = -[UICollectionView _cellAtIndexPath:headerKind:overlapsHeaderView:sectionScrollOffsets:]( self,  "_cellAtIndexPath:headerKind:overlapsHeaderView:sectionScrollOffsets:",  v33,  v37,  v23,  v34);
                id v25 = [v21 section];
                if (v25 != [v33 section] || v24 == 0)
                {
                  v38[0] = _NSConcreteStackBlock;
                  v38[1] = 3221225472LL;
                  v38[2] = sub_100063534;
                  v38[3] = &unk_1000CB7F0;
                  id v39 = v23;
                  [v35 addCoordinatedUnfocusingAnimations:v38 completion:0];
                  v27 = &v39;
                }

                else
                {
                  v40[0] = _NSConcreteStackBlock;
                  v40[1] = 3221225472LL;
                  v40[2] = sub_1000634E0;
                  v40[3] = &unk_1000CC298;
                  v41[0] = v23;
                  v41[1] = v13;
                  [v35 addCoordinatedFocusingAnimations:v40 completion:0];
                  v27 = (id *)v41;
                }
              }
            }

            id v18 = [v36 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }

          while (v18);
        }

        ++v15;
      }

      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v31);
  }
}

- (void)adjustSupplementaryView:(id)a3 forElementKind:(id)a4 atIndexPath:(id)a5 sectionScrollOffsets:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___TVPFocusSectionHeaderAvoiding])
  {
    id v14 = v10;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v23 focusedItem]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathForCell:](self, "indexPathForCell:", v15));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v16));
    double v18 = 0.0;
    if ((objc_opt_respondsToSelector(v17, "desiredTopOffset") & 1) != 0)
    {
      [v17 desiredTopOffset];
      double v18 = v19;
    }

    unsigned int v20 = -[UICollectionView _cellAtIndexPath:headerKind:overlapsHeaderView:sectionScrollOffsets:]( self,  "_cellAtIndexPath:headerKind:overlapsHeaderView:sectionScrollOffsets:",  v16,  v11,  v14,  v13);
    id v21 = [v12 section];
    if (v21 == [v16 section] && v20)
    {
      CGAffineTransformMakeTranslation(&v25, 0.0, -v18);
    }

    else
    {
      __int128 v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v25.c = v22;
      *(_OWORD *)&v25.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }

    CGAffineTransform v24 = v25;
    [v14 setFocusAvoidanceContentTransform:&v24];
  }
}

- (BOOL)_cellAtIndexPath:(id)a3 headerKind:(id)a4 overlapsHeaderView:(id)a5 sectionScrollOffsets:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView superview](self, "superview"));
  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView traitCollection](self, "traitCollection"));
    id v16 = [v15 layoutDirection];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v10));
    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  0,  [v10 section]));
    double v19 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView layoutAttributesForSupplementaryElementOfKind:atIndexPath:]( self,  "layoutAttributesForSupplementaryElementOfKind:atIndexPath:",  v11,  v18));

    BOOL v20 = 0;
    if (!v17 || !v19) {
      goto LABEL_14;
    }
    [v17 frame];
    -[UICollectionView convertRect:toView:](self, "convertRect:toView:", v14);
    double v22 = v21;
    CGFloat v52 = v23;
    CGFloat v53 = v24;
    CGFloat rect = v25;
    [v19 frame];
    -[UICollectionView convertRect:toView:](self, "convertRect:toView:", v14);
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 section]));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v34]);
    [v35 CGPointValue];
    double v37 = v36;

    double v38 = v22 + v37;
    double v39 = v22 - v37;
    [v12 contentWidth];
    double v41 = v40;
    if (v16 == (id)1) {
      CGFloat v42 = v38;
    }
    else {
      CGFloat v42 = v39;
    }
    if (v16 == (id)1)
    {
      v55.origin.double x = v38;
      CGFloat v45 = v52;
      v55.size.double height = v53;
      v55.origin.double y = v52;
      v55.size.double width = rect;
      double MaxX = CGRectGetMaxX(v55);
      v56.origin.double x = v27;
      v56.origin.double y = v29;
      v56.size.double width = v31;
      v56.size.double height = v33;
      if (MaxX <= CGRectGetMaxX(v56) - v41)
      {
LABEL_13:
        BOOL v20 = 0;
        goto LABEL_14;
      }
    }

    else
    {
      v59.origin.double x = v39;
      CGFloat v45 = v52;
      v59.size.double height = v53;
      v59.origin.double y = v52;
      v59.size.double width = rect;
      double MinX = CGRectGetMinX(v59);
      CGFloat v47 = v27;
      CGFloat v48 = v29;
      CGFloat v49 = v31;
      CGFloat v50 = v33;
      if (MinX >= v41 + CGRectGetMinX(*(CGRect *)&v47)) {
        goto LABEL_13;
      }
    }

    v57.origin.double x = v42;
    v57.origin.double y = v45;
    v57.size.double height = v53;
    v57.size.double width = rect;
    double MinY = CGRectGetMinY(v57);
    v58.origin.double x = v27;
    v58.origin.double y = v29;
    v58.size.double width = v31;
    v58.size.double height = v33;
    BOOL v20 = MinY >= CGRectGetMaxY(v58);
LABEL_14:

    goto LABEL_15;
  }

  BOOL v20 = 0;
LABEL_15:

  return v20;
}

@end