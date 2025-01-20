@interface TVHShelfViewLayout
+ (NSDirectionalEdgeInsets)defaultHeaderViewMargin;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (CGSize)collectionViewContentSize;
- (CGSize)itemSize;
- (NSArray)shelfLayoutSections;
- (NSDirectionalEdgeInsets)headerViewMargin;
- (TVHShelfLayoutHelper)layoutHelper;
- (TVHShelfViewLayout)init;
- (double)minimumInteritemSpacing;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)developmentLayoutDirection;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setHeaderViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setLayoutHelper:(id)a3;
- (void)setMinimumInteritemSpacing:(double)a3;
- (void)setShelfLayoutSections:(id)a3;
@end

@implementation TVHShelfViewLayout

- (TVHShelfViewLayout)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHShelfViewLayout;
  v2 = -[TVHShelfViewLayout init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    p_headerViewMargin = &v2->_headerViewMargin;
    *(void *)&double v5 = objc_opt_class(v2).n128_u64[0];
    objc_msgSend(v6, "defaultHeaderViewMargin", v5);
    *(void *)&p_headerViewMargin->top = v7;
    v3->_headerViewMargin.leading = v8;
    v3->_headerViewMargin.bottom = v9;
    v3->_headerViewMargin.trailing = v10;
    v3->_minimumInteritemSpacing = 50.0;
    v3->_itemSize = (CGSize)vdupq_n_s64(0x4073400000000000uLL);
  }

  return v3;
}

+ (NSDirectionalEdgeInsets)defaultHeaderViewMargin
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 12.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (int64_t)developmentLayoutDirection
{
  return 0LL;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVHShelfViewLayout;
  -[TVHShelfViewLayout prepareLayout](&v29, "prepareLayout");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout collectionView](self, "collectionView"));
  uint64_t v4 = (uint64_t)[v3 numberOfSections];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections"));

  if (!v5)
  {
    id v6 = (TVHShelfLayoutHelper *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout layoutHelper](self, "layoutHelper"));
    if (!v6)
    {
      id v6 = -[TVHShelfLayoutHelper initWithShelfViewLayout:]( objc_alloc(&OBJC_CLASS___TVHShelfLayoutHelper),  "initWithShelfViewLayout:",  self);
      -[TVHShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v6);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v4));
    if (v4 >= 1)
    {
      uint64_t v8 = 0LL;
      CGFloat y = CGRectZero.origin.y;
      CGFloat height = CGRectZero.size.height;
      CGFloat width = CGRectZero.size.width;
      do
      {
        CGFloat v9 = objc_alloc_init(&OBJC_CLASS___TVHShelfLayoutSection);
        uint64_t v10 = (uint64_t)[v3 numberOfItemsInSection:v8];
        -[TVHShelfLayoutSection setNumberOfItems:](v9, "setNumberOfItems:", v10);
        double v11 = y;
        double x = CGRectZero.origin.x;
        double v13 = height;
        double v14 = width;
        if (v10 >= 1)
        {
          uint64_t v15 = 0LL;
          double v13 = height;
          double v14 = width;
          double v11 = y;
          double x = CGRectZero.origin.x;
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v15,  v8));
            -[TVHShelfLayoutHelper frameForItemAtIndexPath:](v6, "frameForItemAtIndexPath:", v16);
            double v18 = v17;
            double v20 = v19;
            double v22 = v21;
            double v24 = v23;

            -[TVHShelfLayoutSection setItemFrame:atIndex:](v9, "setItemFrame:atIndex:", v15, v18, v20, v22, v24);
            v30.origin.double x = x;
            v30.origin.CGFloat y = v11;
            v30.size.CGFloat width = v14;
            v30.size.CGFloat height = v13;
            v32.origin.double x = v18;
            v32.origin.CGFloat y = v20;
            v32.size.CGFloat width = v22;
            v32.size.CGFloat height = v24;
            CGRect v31 = CGRectUnion(v30, v32);
            double x = v31.origin.x;
            double v11 = v31.origin.y;
            double v14 = v31.size.width;
            double v13 = v31.size.height;
            ++v15;
          }

          while (v10 != v15);
        }

        -[TVHShelfLayoutSection setItemsBoundingFrame:](v9, "setItemsBoundingFrame:", x, v11, v14, v13);
        [v7 addObject:v9];

        ++v8;
      }

      while (v8 != v4);
    }

    id v25 = [v7 copy];
    -[TVHShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", v25);
  }
}

- (CGSize)collectionViewContentSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  [v4 lastItemFrame];
  CGFloat MaxX = CGRectGetMaxX(v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout layoutHelper](self, "layoutHelper"));
  [v6 tallestItemHeight];
  double v8 = v7;

  double v9 = MaxX;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if (([v4 invalidateEverything] & 1) != 0
    || [v4 invalidateDataSourceCounts])
  {
    -[TVHShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", 0LL);
    -[TVHShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHShelfViewLayout;
  -[TVHShelfViewLayout invalidateLayoutWithContext:](&v5, "invalidateLayoutWithContext:", v4);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections"));
  double v10 = (char *)[v9 count];

  if (v10)
  {
    double v11 = 0LL;
    CGFloat v27 = CGRectZero.origin.y;
    CGFloat v28 = CGRectZero.origin.x;
    CGFloat v25 = CGRectZero.size.height;
    CGFloat v26 = CGRectZero.size.width;
    do
    {
      CGRect v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVHShelfViewLayout shelfLayoutSections]( self,  "shelfLayoutSections",  *(void *)&v25,  *(void *)&v26,  *(void *)&v27,  *(void *)&v28));
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v11]);

      double v14 = (char *)[v13 numberOfItems];
      if (v14)
      {
        uint64_t v15 = v14;
        for (i = 0LL; i != v15; ++i)
        {
          [v13 itemFrameAtIndex:i];
          CGFloat v17 = v29.origin.x;
          CGFloat v18 = v29.origin.y;
          CGFloat v19 = v29.size.width;
          CGFloat v20 = v29.size.height;
          v31.origin.CGFloat x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          if (CGRectIntersectsRect(v29, v31))
          {
            v30.origin.CGFloat y = v27;
            v30.origin.CGFloat x = v28;
            v30.size.CGFloat height = v25;
            v30.size.CGFloat width = v26;
            v32.origin.CGFloat x = v17;
            v32.origin.CGFloat y = v18;
            v32.size.CGFloat width = v19;
            v32.size.CGFloat height = v20;
            if (!CGRectEqualToRect(v30, v32))
            {
              double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  i,  v11));
              double v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVHShelfViewLayout layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v21));
              [v8 addObject:v22];
            }
          }
        }
      }

      ++v11;
    }

    while (v11 != v10);
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));

  return v23;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v4));
  id v6 = [v4 section];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections"));
  id v8 = [v7 count];

  if (v6 < v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v6]);

    id v11 = [v4 item];
    if (v11 < [v10 numberOfItems])
    {
      [v10 itemFrameAtIndex:v11];
      objc_msgSend(v5, "setFrame:");
    }
  }

  return v5;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (NSDirectionalEdgeInsets)headerViewMargin
{
  double top = self->_headerViewMargin.top;
  double leading = self->_headerViewMargin.leading;
  double bottom = self->_headerViewMargin.bottom;
  double trailing = self->_headerViewMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setHeaderViewMargin:(NSDirectionalEdgeInsets)a3
{
  self->_headerViewMargin = a3;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (TVHShelfLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
}

- (NSArray)shelfLayoutSections
{
  return self->_shelfLayoutSections;
}

- (void)setShelfLayoutSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end