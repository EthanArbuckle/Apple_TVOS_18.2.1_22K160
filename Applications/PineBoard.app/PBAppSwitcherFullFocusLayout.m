@interface PBAppSwitcherFullFocusLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (CGSize)focusableCellSize;
- (NSDictionary)computedAttributes;
- (NSIndexPath)originIndexPath;
- (PBAppSwitcherFullFocusLayout)initWithWorkspaceGeometry:(id)a3;
- (PBWorkspaceGeometry)workspaceGeometry;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setComputedAttributes:(id)a3;
- (void)setOriginIndexPath:(id)a3;
@end

@implementation PBAppSwitcherFullFocusLayout

- (PBAppSwitcherFullFocusLayout)initWithWorkspaceGeometry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFullFocusLayout;
  v6 = -[PBAppSwitcherFullFocusLayout init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspaceGeometry, a3);
    v7->_focusableCellSize = (CGSize)vdupq_n_s64(0x408C200000000000uLL);
  }

  return v7;
}

+ (Class)layoutAttributesClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setOriginIndexPath:(id)a3
{
  id v4 = a3;
  if ((-[NSIndexPath isEqual:](self->_originIndexPath, "isEqual:", v4) & 1) == 0)
  {
    id v5 = (NSIndexPath *)[v4 copy];
    originIndexPath = self->_originIndexPath;
    self->_originIndexPath = v5;

    -[PBAppSwitcherFullFocusLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGSize)collectionViewContentSize
{
  double v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFullFocusLayout collectionView](self, "collectionView"));
  double v6 = v4 + (double)(uint64_t)[v5 numberOfItemsInSection:0] * 960.0;

  -[PBWorkspaceGeometry bounds](self->_workspaceGeometry, "bounds");
  double v8 = v7;
  double v9 = v6;
  result.height = v8;
  result.width = v9;
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
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFullFocusLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y));
  [v7 contentInset];
  double v9 = v8;

  uint64_t v10 = llround((x + v9) / 960.0);
  double v11 = -(v9 - (double)v10 * 960.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFullFocusLayout collectionView](self, "collectionView"));
  id v13 = [v12 numberOfItemsInSection:0];

  if (v13 == (id)(v10 + 1))
  {
    [(id)objc_opt_class(PBAppSwitcherFocusLayout) contentOffsetAdjustmentForLastItem];
    double v11 = v14 - (v9 - (double)v10 * 960.0);
  }

  double v15 = v11;
  double v16 = y;
  result.CGFloat y = v16;
  result.double x = v15;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[NSDictionary allValues]( self->_computedAttributes,  "allValues",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height));
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_computedAttributes,  "objectForKeyedSubscript:",  a3));
}

- (void)prepareLayout
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PBAppSwitcherFullFocusLayout;
  -[PBAppSwitcherFullFocusLayout prepareLayout](&v36, "prepareLayout");
  -[PBWorkspaceGeometry bounds](self->_workspaceGeometry, "bounds");
  double v32 = v3;
  double v5 = v4;
  uint64_t v6 = -[NSIndexPath item](self->_originIndexPath, "item");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherFullFocusLayout collectionView](self, "collectionView"));
  uint64_t v8 = (uint64_t)[v7 numberOfItemsInSection:0];

  double v33 = 0.0;
  uint64_t v31 = v6 + 1;
  if (v8 == v6 + 1)
  {
    [(id)objc_opt_class(PBAppSwitcherFocusLayout) contentOffsetAdjustmentForLastItem];
    double v33 = v9;
  }

  uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v8 >= 1)
  {
    uint64_t v11 = 0LL;
    double v30 = v5 * 0.5;
    uint64_t v12 = v6 - 2;
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    uint64_t v17 = -v6;
    double v29 = y;
    double v27 = height;
    double v28 = width;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v11,  0LL));
      if (v11 <= v31) {
        double v19 = 0.0;
      }
      else {
        double v19 = 960.0;
      }
      BOOL v20 = v11 < v12 || v11 > v31;
      if (v11 <= v12) {
        double v21 = 0.5;
      }
      else {
        double v21 = 1.0;
      }
      if (v11 <= v12) {
        double v22 = 0.39;
      }
      else {
        double v22 = 0.0;
      }
      if (v6)
      {
        CGFloat x = -20.0;
        double y = -120.0;
        double width = 280.0;
        double height = 1230.0;
      }

      double v34 = x;
      double v23 = v19 + v32 * (double)((v17 + v11) & ~((v17 + v11) >> 63)) + (double)v6 * 960.0;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppSwitcherFocusLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v18));
      [v24 setContentScale:1.0];
      [v24 setContentOffset:v23];
      [v24 setCornerRadius:0.0];
      [v24 setShadowAlpha:0.0];
      [v24 setDimmingAlpha:v22];
      [v24 setContentAlpha:v21];
      objc_msgSend(v24, "setSize:", self->_focusableCellSize.width, self->_focusableCellSize.height);
      objc_msgSend(v24, "setCenter:", v33 + (double)v11 * 960.0 + 480.0, v30);
      [v24 setHidden:v20];
      CATransform3DMakeTranslation(&v35, 0.0, 0.0, (double)v11);
      [v24 setTransform3D:&v35];
      [v24 setZIndex:v11];
      objc_msgSend(v24, "setMaskRect:", v34, y, width, height);
      double y = v29;
      CGFloat x = CGRectZero.origin.x;
      double height = v27;
      double width = v28;
      objc_msgSend(v24, "setBlurRect:", CGRectZero.origin.x, v29, v28, v27);
      [v24 setBlurRadius:0.0];
      [v24 setContentHidden:v20];
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v24, v18);

      ++v11;
      --v6;
    }

    while (v8 != v11);
  }

  v25 = (NSDictionary *)-[NSMutableDictionary copy](v10, "copy");
  computedAttributes = self->_computedAttributes;
  self->_computedAttributes = v25;
}

- (PBWorkspaceGeometry)workspaceGeometry
{
  return self->_workspaceGeometry;
}

- (NSIndexPath)originIndexPath
{
  return self->_originIndexPath;
}

- (NSDictionary)computedAttributes
{
  return self->_computedAttributes;
}

- (void)setComputedAttributes:(id)a3
{
}

- (CGSize)focusableCellSize
{
  double width = self->_focusableCellSize.width;
  double height = self->_focusableCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end