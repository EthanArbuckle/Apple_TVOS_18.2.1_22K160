@interface SYNMediaWallCollectionViewCondensedLayout2
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (SYNMediaWallCollectionViewCondensedLayout2)init;
- (float)spacingRatio;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)indexPathsForItemsInRect:(CGRect)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (unint64_t)numberOfRows;
- (void)dealloc;
- (void)finalizeAnimatedBoundsChange;
- (void)invalidateLayout;
- (void)prepareForAnimatedBoundsChange:(CGRect)a3;
- (void)prepareLayout;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)setSpacingRatio:(float)a3;
@end

@implementation SYNMediaWallCollectionViewCondensedLayout2

- (SYNMediaWallCollectionViewCondensedLayout2)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  v2 = -[SYNMediaWallCollectionViewCondensedLayout2 init](&v5, "init");
  if (v2)
  {
    v2->_attributes = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_sectionAttributes = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_largestWidth = 0.0;
    v2->_contentSize = CGSizeZero;
    v2->_spacingRatio = 0.05;
    v2->_numberOfRows = 3LL;
    CGSize size = CGRectZero.size;
    v2->_oldBounds.origin = CGRectZero.origin;
    v2->_oldBounds.CGSize size = size;
  }

  return v2;
}

- (void)dealloc
{
  self->_attributes = 0LL;
  self->_sectionAttributes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  -[SYNMediaWallCollectionViewCondensedLayout2 dealloc](&v3, "dealloc");
}

- (float)spacingRatio
{
  float spacingRatio = self->_spacingRatio;
  objc_sync_exit(self);
  return spacingRatio;
}

- (void)setSpacingRatio:(float)a3
{
  if (self->_spacingRatio != a3)
  {
    self->_float spacingRatio = a3;
    -[SYNMediaWallCollectionViewCondensedLayout2 invalidateLayout](self, "invalidateLayout");
  }

  objc_sync_exit(self);
}

- (unint64_t)numberOfRows
{
  unint64_t numberOfRows = self->_numberOfRows;
  objc_sync_exit(self);
  return numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  if (self->_numberOfRows != a3)
  {
    self->_unint64_t numberOfRows = a3;
    -[SYNMediaWallCollectionViewCondensedLayout2 invalidateLayout](self, "invalidateLayout");
  }

  objc_sync_exit(self);
}

- (id)indexPathsForItemsInRect:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  id v6 = +[NSMutableArray array]( &OBJC_CLASS___NSMutableArray,  "array",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_sync_enter(self);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  attributes = self->_attributes;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( attributes,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    double v10 = x + width;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(attributes);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        [v12 frame];
        if (v13 <= v10)
        {
          [v12 frame];
          double v15 = v14;
          [v12 frame];
          double v13 = v15 + v16;
          if (v15 + v16 >= x) {
            objc_msgSend(v6, "addObject:", objc_msgSend(v12, "indexPath", v13));
          }
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( attributes,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL,  v13);
    }

    while (v8);
  }

  objc_sync_exit(self);
  return v6;
}

- (void)invalidateLayout
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  -[SYNMediaWallCollectionViewCondensedLayout2 invalidateLayout](&v3, "invalidateLayout");
  objc_sync_enter(self);
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sectionAttributes, "removeAllObjects");
  self->_largestWidth = 0.0;
  self->_contentSize = CGSizeZero;
  objc_sync_exit(self);
}

- (void)prepareLayout
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  -[SYNMediaWallCollectionViewCondensedLayout2 prepareLayout](&v41, "prepareLayout");
  objc_sync_enter(self);
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sectionAttributes, "removeAllObjects");
  if (objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "dataSource"))
  {
    v37 = (char *)objc_msgSend( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "numberOfSectionsInCollectionView:",  -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"));
    objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "frame");
    p_contentSize = &self->_contentSize;
    self->_contentSize = CGSizeZero;
    if ((uint64_t)v37 >= 1)
    {
      float v4 = v3;
      v39 = 0LL;
      unint64_t numberOfRows = self->_numberOfRows;
      float v6 = (float)(self->_spacingRatio * v4) / (float)numberOfRows;
      float v7 = floorf((float)(v4 - (float)(v6 * (float)(numberOfRows + 1))) / (float)numberOfRows);
      double v38 = v4;
      double v8 = v7;
      float v9 = v6 + v7;
      double v10 = v6;
      do
      {
        v11 = (char *)objc_msgSend( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "collectionView:numberOfItemsInSection:",  -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  v39);
        objc_opt_respondsToSelector( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "collectionView:layout:referenceSizeForHeaderInSection:");
        -[NSMutableArray addObject:]( self->_sectionAttributes,  "addObject:",  +[NSNull null](&OBJC_CLASS___NSNull, "null"));
        double width = p_contentSize->width;
        objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "frame");
        p_contentSize->double width = CGSizeZero.width + width;
        self->_contentSize.height = v13;
        double v14 = calloc(self->_numberOfRows, 4uLL);
        double v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        unint64_t v18 = self->_numberOfRows;
        if (v18)
        {
          while (1)
          {
            bzero(v14, 4 * self->_numberOfRows);
            if ((uint64_t)v11 < 1)
            {
              float v21 = 0.0;
            }

            else
            {
              unint64_t v19 = 0LL;
              __int128 v20 = 0LL;
              float v21 = 0.0;
              do
              {
                v22 = +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v20,  v39);
                v23 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v22);
                id v24 = objc_msgSend( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "videoAssetAtIndexPath:",  v22);
                float v25 = *((float *)v14 + v19);
                objc_msgSend( objc_msgSend( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "document"),  "resolutionForAssetAtPath:",  objc_msgSend(v24, "path"));
                double v28 = v26 / v27 * v8;
                CGFloat v29 = p_contentSize->width + (float)(v6 + v25);
                float v30 = v28 + v10 + *((float *)v14 + v19);
                *((float *)v14 + v19) = v30;
                -[UICollectionViewLayoutAttributes setFrame:]( v23,  "setFrame:",  v29,  (float)(v6 + (float)(v9 * (float)v19)));
                double largestWidth = self->_largestWidth;
                if (largestWidth == 0.0
                  || (-[UICollectionViewLayoutAttributes frame](v23, "frame"), largestWidth < v32))
                {
                  -[UICollectionViewLayoutAttributes frame](v23, "frame");
                  self->_double largestWidth = v33;
                }

                -[NSMutableArray addObject:](v15, "addObject:", v23);
                float v34 = *((float *)v14 + v19);
                if (v19 + 1 < v18) {
                  unint64_t v35 = v19 + 1;
                }
                else {
                  unint64_t v35 = 0LL;
                }
                if (v34 >= v21)
                {
                  unint64_t v19 = v35;
                  float v21 = v34;
                }

                ++v20;
              }

              while (v11 != v20);
            }

            objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "frame");
            if (!--v18) {
              break;
            }
            double v16 = v21;
            double v17 = v36 * 0.75;
            if (v36 * 0.75 <= v21) {
              break;
            }
            -[NSMutableArray removeAllObjects](v15, "removeAllObjects", v16, v17);
          }
        }

        else
        {
          float v21 = 0.0;
        }

        -[NSMutableArray addObjectsFromArray:](self->_attributes, "addObjectsFromArray:", v15, v16, v17);

        free(v14);
        p_contentSize->double width = p_contentSize->width + v21 + v10;
        self->_contentSize.height = v38;
        ++v39;
      }

      while (v39 != v37);
    }
  }

  objc_sync_exit(self);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_sync_enter(self);
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v9 = -[SYNMediaWallCollectionViewCondensedLayout2 indexPathsForItemsInRect:]( self,  "indexPathsForItemsInRect:",  x,  y,  width,  height);
  id v10 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        double v15 = +[NSIndexPath indexPathWithIndex:]( NSIndexPath,  "indexPathWithIndex:",  [v14 section]);
        objc_msgSend( v8,  "addObject:",  -[SYNMediaWallCollectionViewCondensedLayout2 layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v14));
      }

      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v11);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v16 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    double v18 = x + width;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v10);
        }
        id v20 = -[NSMutableArray objectAtIndex:]( self->_sectionAttributes,  "objectAtIndex:",  [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) indexAtPosition:0]);
        if ((objc_msgSend(v20, "isEqual:", +[NSNull null](NSNull, "null")) & 1) == 0)
        {
          [v20 frame];
          if (v21 <= v18)
          {
            [v20 frame];
            double v23 = v22;
            [v20 frame];
            double v21 = v23 + v24;
            if (v23 + v24 >= x) {
              objc_msgSend(v8, "addObject:", v20, v21);
            }
          }
        }
      }

      id v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16, v21);
    }

    while (v16);
  }

  objc_sync_exit(self);
  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v5 = -[NSMutableArray objectAtIndex:]( self->_attributes,  "objectAtIndex:",  objc_msgSend( objc_msgSend( -[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"),  "dataSource"),  "indexForIndexPath:",  a3));
  objc_sync_exit(self);
  return v5;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "bounds");
  if (v5 >= width) {
    double width = v5;
  }
  objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "bounds");
  if (v6 >= height) {
    double v7 = v6;
  }
  else {
    double v7 = height;
  }
  double v8 = width;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double Height = CGRectGetHeight(a3);
  objc_msgSend(-[SYNMediaWallCollectionViewCondensedLayout2 collectionView](self, "collectionView"), "bounds");
  return Height != CGRectGetHeight(v6);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = -[NSMutableArray objectAtIndex:]( self->_sectionAttributes,  "objectAtIndex:",  [a4 indexAtPosition:0]);
  return v6;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  self->_oldBounds = a3;
}

- (void)finalizeAnimatedBoundsChange
{
  CGSize size = CGRectZero.size;
  self->_oldBounds.origin = CGRectZero.origin;
  self->_oldBounds.CGSize size = size;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  return -[SYNMediaWallCollectionViewCondensedLayout2 initialLayoutAttributesForAppearingItemAtIndexPath:]( &v4,  "initialLayoutAttributesForAppearingItemAtIndexPath:",  a3);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCondensedLayout2;
  return -[SYNMediaWallCollectionViewCondensedLayout2 finalLayoutAttributesForDisappearingItemAtIndexPath:]( &v4,  "finalLayoutAttributesForDisappearingItemAtIndexPath:",  a3);
}

@end