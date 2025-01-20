@interface PBAppSwitcherFocusLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
+ (double)contentOffsetAdjustmentForLastItem;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (NSMutableArray)deletedIndexPaths;
- (NSMutableArray)insertedIndexPaths;
- (NSMutableDictionary)finalIndexPathByOriginalIndexPath;
- (PBAppSwitcherFocusLayout)initWithWorkspaceGeometry:(id)a3;
- (PBWorkspaceGeometry)workspaceGeometry;
- (double)_scrollProgress;
- (double)screenHeight;
- (double)swipeUpOffset;
- (id)_attributesForIndexPath:(id)a3 scrollProgress:(double)a4 swipeOffset:(double)a5 swipeIndex:(int64_t)a6 allowMask:(BOOL)a7;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsBeforeUpdate;
- (int64_t)swipeIndex;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
@end

@implementation PBAppSwitcherFocusLayout

- (PBAppSwitcherFocusLayout)initWithWorkspaceGeometry:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayout;
  v6 = -[PBAppSwitcherFocusLayout init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspaceGeometry, a3);
    v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    insertedIndexPaths = v7->_insertedIndexPaths;
    v7->_insertedIndexPaths = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    deletedIndexPaths = v7->_deletedIndexPaths;
    v7->_deletedIndexPaths = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    finalIndexPathByOriginalIndexPath = v7->_finalIndexPathByOriginalIndexPath;
    v7->_finalIndexPathByOriginalIndexPath = v12;

    -[PBWorkspaceGeometry bounds](v7->_workspaceGeometry, "bounds");
    v7->_screenHeight = v14;
  }

  return v7;
}

+ (Class)layoutAttributesClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

+ (Class)invalidationContextClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherLayoutInvalidationContext);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (CGSize)collectionViewContentSize
{
  double v4 = v3 + (double)self->_numberOfItems * 960.0;
  double screenHeight = self->_screenHeight;
  result.height = screenHeight;
  result.width = v4;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFocusLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y));
  [v7 contentInset];
  double v9 = v8;

  int64_t numberOfItems = self->_numberOfItems;
  uint64_t v11 = numberOfItems - 1;
  int64_t v12 = llround((x + v9) / 960.0);
  if (numberOfItems - 1 >= v12) {
    uint64_t v11 = v12;
  }
  double v13 = -(v9 - (double)v11 * 960.0);
  if (numberOfItems == v11 + 1)
  {
    [(id)objc_opt_class(self) contentOffsetAdjustmentForLastItem];
    double v13 = v13 + v14;
  }

  double v15 = v13;
  double v16 = y;
  result.CGFloat y = v16;
  result.double x = v15;
  return result;
}

+ (double)contentOffsetAdjustmentForLastItem
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  double result = 411.428571;
  if (IsReduceMotionEnabled) {
    return 0.0;
  }
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int64_t v8 = self->_numberOfItems - 1;
  uint64_t v9 = vcvtmd_s64_f64(CGRectGetMinX(a3) / 960.0);
  if (v8 < v9) {
    uint64_t v9 = v8;
  }
  uint64_t v10 = v9 & ~(v9 >> 63);
  int64_t v11 = self->_numberOfItems - 1;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  uint64_t v12 = vcvtpd_s64_f64(CGRectGetMaxX(v24) / 960.0);
  if (v11 < v12) {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v12 & ~(v12 >> 63);
  BOOL v14 = v13 < v10;
  uint64_t v15 = v13 - v10;
  if (v14) {
    uint64_t v15 = -1LL;
  }
  double v16 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  v10,  v15 + 1);
  -[PBAppSwitcherFocusLayout _scrollProgress](self, "_scrollProgress");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100186B70;
  v21[3] = &unk_1003DA7E8;
  uint64_t v23 = v17;
  v21[4] = self;
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v18 = v22;
  -[NSIndexSet enumerateIndexesUsingBlock:](v16, "enumerateIndexesUsingBlock:", v21);
  id v19 = -[NSMutableArray copy](v18, "copy");

  return v19;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  -[PBAppSwitcherFocusLayout _scrollProgress](self, "_scrollProgress");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherFocusLayout _attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:]( self,  "_attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:",  v4,  0LL,  0LL));

  return v5;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[NSMutableArray containsObject:](self->_insertedIndexPaths, "containsObject:", v4);
  -[PBAppSwitcherFocusLayout _scrollProgress](self, "_scrollProgress");
  char v6 = v5 ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherFocusLayout _attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:]( self,  "_attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:",  v4,  self->_swipeIndex,  v5 ^ 1));
  int64_t v8 = v7;
  if ((v6 & 1) == 0)
  {
    [v7 setAlpha:0.0];
    -[NSMutableArray removeObject:](self->_insertedIndexPaths, "removeObject:", v4);
  }

  return v8;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_finalIndexPathByOriginalIndexPath,  "objectForKeyedSubscript:",  v4));
  -[PBAppSwitcherFocusLayout _scrollProgress](self, "_scrollProgress");
  swipeIndeCGFloat x = self->_swipeIndex;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherFocusLayout _attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:]( self,  "_attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:",  v5,  swipeIndex,  0LL));
    [v7 setIndexPath:v4];
    if (-[NSMutableArray containsObject:](self->_deletedIndexPaths, "containsObject:", v4))
    {
      [v7 setAlpha:0.0];
      -[NSMutableArray removeObject:](self->_deletedIndexPaths, "removeObject:", v4);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_finalIndexPathByOriginalIndexPath, "removeObjectForKey:", v4);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherFocusLayout _attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:]( self,  "_attributesForIndexPath:scrollProgress:swipeOffset:swipeIndex:allowMask:",  v4,  swipeIndex,  1LL));
  }

  return v7;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 invalidateDataSourceCounts])
  {
    self->_numberOfItemsBeforeUpdate = self->_numberOfItems;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFocusLayout collectionView](self, "collectionView"));
    self->_int64_t numberOfItems = (int64_t)[v5 numberOfItemsInSection:0];
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherLayoutInvalidationContext);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 swipeUpItem]);
    int64_t v8 = v7;
    if (v7) {
      int64_t v9 = (int64_t)[v7 item];
    }
    else {
      int64_t v9 = -1LL;
    }
    [v4 swipeUpProgress];
    double v10 = v11;
  }

  else
  {
    int64_t v9 = -1LL;
    double v10 = 0.0;
  }

  self->_swipeIndeCGFloat x = v9;
  self->_swipeUpOffset = v10;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayout;
  -[PBAppSwitcherFocusLayout invalidateLayoutWithContext:](&v12, "invalidateLayoutWithContext:", v4);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayout;
  id v4 = a3;
  -[PBAppSwitcherFocusLayout prepareForCollectionViewUpdates:](&v8, "prepareForCollectionViewUpdates:", v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100187008;
  v7[3] = &unk_1003DA810;
  v7[4] = self;
  [v4 enumerateObjectsUsingBlock:v7];

  -[NSMutableArray sortUsingSelector:](self->_deletedIndexPaths, "sortUsingSelector:", "compare:");
  -[NSMutableDictionary removeAllObjects](self->_finalIndexPathByOriginalIndexPath, "removeAllObjects");
  deletedIndexPaths = self->_deletedIndexPaths;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100187098;
  v6[3] = &unk_1003DA860;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](deletedIndexPaths, "enumerateObjectsUsingBlock:", v6);
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFocusLayout;
  -[PBAppSwitcherFocusLayout finalizeCollectionViewUpdates](&v3, "finalizeCollectionViewUpdates");
  -[NSMutableArray removeAllObjects](self->_insertedIndexPaths, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_deletedIndexPaths, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_finalIndexPathByOriginalIndexPath, "removeAllObjects");
}

- (id)_attributesForIndexPath:(id)a3 scrollProgress:(double)a4 swipeOffset:(double)a5 swipeIndex:(int64_t)a6 allowMask:(BOOL)a7
{
  id v11 = a3;
  id v12 = [v11 item];
  id v13 = v12;
  double v14 = (double)(uint64_t)v12;
  double v15 = a4 - (double)(uint64_t)v12;
  double v16 = -a5 / self->_screenHeight;
  if (v16 > 1.0) {
    double v16 = 1.0;
  }
  else {
    uint64_t v17 = -1LL;
  }
  if (a6) {
    uint64_t v17 = (uint64_t)v12 < a6;
  }
  double v18 = (double)v17;
  double v19 = fmax(v16, -1.0);
  double v20 = -(v15 - v19 * (double)v17);
  double v21 = v20 - floor(v20);
  double v22 = (double)((uint64_t)v12 - self->_numberOfItems + 2);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFocusLayout collectionView](self, "collectionView"));
  CGRect v24 = (void *)objc_claimAutoreleasedReturnValue([v23 traitCollection]);
  id v25 = [v24 userInterfaceStyle];

  if (v20 >= v22) {
    goto LABEL_16;
  }
  int64_t numberOfItems = self->_numberOfItems;
  if (v13 == (id)(numberOfItems - 1))
  {
    uint64_t v27 = 0LL;
    BOOL v28 = 0LL;
    double v29 = (v20 + v19 * 0.428571429 * v18 + 0.428571429) / 1.42857143;
    double v30 = v29 * 0.02 + 0.75;
    double v31 = v29 * 1510.0;
    double v42 = 1.0;
    double v21 = 0.0;
LABEL_11:
    double v32 = 0.0;
    goto LABEL_24;
  }

  if (v13 != (id)(numberOfItems - 2))
  {
LABEL_16:
    if (v20 < -2.5)
    {
      BOOL v28 = v20 < -3.0;
      uint64_t v27 = 1LL;
      double v21 = 0.0;
      double v30 = 0.67;
      double v31 = -248.0;
      double v32 = 0.0;
      double v34 = 0.0;
LABEL_18:
      double v42 = v34;
      goto LABEL_24;
    }

    if (v20 >= -2.0)
    {
      if (v20 >= -1.0)
      {
        if (v20 >= 0.0)
        {
          if (v20 >= 1.0)
          {
            if (v20 >= 2.0)
            {
              BOOL v28 = v20 >= 3.0;
              uint64_t v27 = 1LL;
              double v42 = 1.0;
              double v21 = 0.0;
              double v30 = 0.77;
              double v31 = 3275.0;
            }

            else
            {
              uint64_t v27 = 0LL;
              BOOL v28 = 0LL;
              double v31 = v21 * 1765.0 + 1510.0;
              double v42 = 1.0;
              double v21 = 0.0;
              double v30 = 0.77;
            }
          }

          else
          {
            uint64_t v27 = 0LL;
            BOOL v28 = 0LL;
            double v30 = v21 * 0.02 + 0.75;
            double v31 = v21 * 1420.0 + 90.0;
            double v42 = 1.0;
            double v21 = 1.0 - v21;
          }

          goto LABEL_11;
        }

        uint64_t v27 = 0LL;
        BOOL v28 = 0LL;
        double v30 = v21 * 0.02 + 0.73;
        double v32 = 0.13 - v21 * 0.13;
        double v31 = v21 * 210.0 + -120.0;
        double v34 = 1.0;
        goto LABEL_18;
      }

      uint64_t v27 = 0LL;
      BOOL v28 = 0LL;
      double v30 = v21 * 0.03 + 0.7;
      double v32 = v21 * -0.13 + 0.26;
      double v42 = fmin(v21 + 0.5, 1.0);
      double v31 = v21 * 105.0 + -225.0;
    }

    else
    {
      uint64_t v27 = 0LL;
      BOOL v28 = 0LL;
      double v30 = v21 * 0.03 + 0.67;
      double v32 = v21 * -0.13 + 0.39;
      double v42 = v21 * 0.5;
      double v31 = v21 * 23.0 + -248.0;
    }

    double v21 = 0.0;
    goto LABEL_24;
  }

  uint64_t v27 = 0LL;
  BOOL v28 = 0LL;
  double v42 = 1.0;
  double v33 = (v20 + 1.0 + 0.428571429) / 1.42857143;
  double v30 = v33 * 0.0328571429 + 0.717142857;
  double v31 = v33 * 255.0 + -165.0;
  if (v20 < -1.0) {
    double v21 = 0.0;
  }
  double v32 = 0.185714286 - v33 * 0.185714286;
LABEL_24:
  double v35 = v15 * 960.0;
  double v36 = v14 * 960.0 + 480.0;
  CGFloat v37 = v14;
  double v38 = v35 + v31;
  if (v13 != (id)a6) {
    a5 = 0.0;
  }
  BOOL v39 = fabs(a5) > self->_screenHeight * 0.5;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppSwitcherFocusLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v11));

  [v40 setContentOffset:v38];
  [v40 setContentScale:v30];
  [v40 setSnapshotOffset:a5];
  [v40 setCornerRadius:26.6666667];
  [v40 setShadowAlpha:dbl_1002EC450[v25 == (id)2]];
  [v40 setShadowBlurRadius:dbl_1002EC460[v25 == (id)2]];
  [v40 setTextAlpha:v21];
  [v40 setHeaderHidden:v39];
  [v40 setContentHidden:v27];
  [v40 setDimmingAlpha:v32];
  [v40 setContentAlpha:v42];
  [v40 setHidden:v28];
  objc_msgSend(v40, "setSize:", 900.0, 900.0);
  objc_msgSend(v40, "setCenter:", v36, self->_screenHeight * 0.5);
  CATransform3DMakeTranslation(&v43, 0.0, 0.0, v37);
  [v40 setTransform3D:&v43];
  [v40 setZIndex:v13];
  return v40;
}

- (double)_scrollProgress
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFocusLayout collectionView](self, "collectionView"));
  [v3 contentOffset];
  double v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFocusLayout collectionView](self, "collectionView"));
  [v6 contentInset];
  double v8 = (v5 + v7) / 960.0;

  return v8;
}

- (PBWorkspaceGeometry)workspaceGeometry
{
  return self->_workspaceGeometry;
}

- (NSMutableArray)insertedIndexPaths
{
  return self->_insertedIndexPaths;
}

- (NSMutableArray)deletedIndexPaths
{
  return self->_deletedIndexPaths;
}

- (NSMutableDictionary)finalIndexPathByOriginalIndexPath
{
  return self->_finalIndexPathByOriginalIndexPath;
}

- (int64_t)numberOfItemsBeforeUpdate
{
  return self->_numberOfItemsBeforeUpdate;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (double)screenHeight
{
  return self->_screenHeight;
}

- (int64_t)swipeIndex
{
  return self->_swipeIndex;
}

- (double)swipeUpOffset
{
  return self->_swipeUpOffset;
}

- (void).cxx_destruct
{
}

@end