@interface UICollectionView
- (id)im_indexPathForFocusedCell;
- (id)mt_dequeueReusableCellClass:(Class)a3 forIndexPath:(id)a4;
- (id)mt_dequeueReusableSupplementaryViewClass:(Class)a3 supplementaryViewKind:(id)a4 forIndexPath:(id)a5;
- (id)sectionHeaderIndexPathForItemIndexPath:(id)a3;
- (id)sectionHeaderViewForIndexPath:(id)a3;
- (id)sectionHeaderViewForItemAtIndexPath:(id)a3;
- (void)mt_registerCellClass:(Class)a3;
- (void)mt_registerSupplementaryViewClass:(Class)a3 forSupplementaryViewOfKind:(id)a4;
@end

@implementation UICollectionView

- (id)im_indexPathForFocusedCell
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 screen]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedView]);

  if (v5)
  {
    while (1)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v6);
      if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
        break;
      }
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 superview]);

      v5 = (void *)v8;
      if (!v8) {
        goto LABEL_4;
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathForCell:](self, "indexPathForCell:", v5));
  }

  else
  {
LABEL_4:
    v9 = 0LL;
  }

  return v9;
}

- (id)sectionHeaderIndexPathForItemIndexPath:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  0,  [a3 section]));
  }
  else {
    return 0LL;
  }
}

- (id)sectionHeaderViewForIndexPath:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[UICollectionView supplementaryViewForElementKind:atIndexPath:]( self,  "supplementaryViewForElementKind:atIndexPath:",  UICollectionElementKindSectionHeader,  a3));
  }
  else {
    return 0LL;
  }
}

- (id)sectionHeaderViewForItemAtIndexPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView sectionHeaderIndexPathForItemIndexPath:]( self,  "sectionHeaderIndexPathForItemIndexPath:",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView sectionHeaderViewForIndexPath:](self, "sectionHeaderViewForIndexPath:", v4));

  return v5;
}

- (void)mt_registerCellClass:(Class)a3
{
  v5 = NSStringFromClass(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:]( self,  "registerClass:forCellWithReuseIdentifier:",  a3,  v6);
}

- (void)mt_registerSupplementaryViewClass:(Class)a3 forSupplementaryViewOfKind:(id)a4
{
  id v6 = a4;
  uint64_t v7 = NSStringFromClass(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( self,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  a3,  v6,  v8);
}

- (id)mt_dequeueReusableCellClass:(Class)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = NSStringFromClass(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:]( self,  "dequeueReusableCellWithReuseIdentifier:forIndexPath:",  v8,  v6));

  return v9;
}

- (id)mt_dequeueReusableSupplementaryViewClass:(Class)a3 supplementaryViewKind:(id)a4 forIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = NSStringFromClass(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:]( self,  "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:",  v9,  v11,  v8));

  return v12;
}

@end