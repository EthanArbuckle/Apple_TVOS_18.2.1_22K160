@interface TVPCollectionViewFlowLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)isFocusEnteringCollectionView;
- (BOOL)isFocusInsideCollectionView;
- (BOOL)isFocusLeavingCollectionView;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGRect)_titleFrame;
- (CGSize)_titleAdjustmentSize;
- (CGSize)_titleSize;
- (CGSize)collectionViewContentSize;
- (NSMutableDictionary)focusContainerGuides;
- (NSMutableDictionary)headerAttributes;
- (TVPCollectionViewLayoutAttributes)titleLayoutAttributes;
- (id)_focusContainerGuideForSection:(int64_t)a3;
- (id)_layoutAttributesForTitle;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (unint64_t)focusHeading;
- (void)_adjustLayoutAttributes:(id)a3;
- (void)_applyCustomAttributesToAttributes:(id)a3;
- (void)_removeFocusContainerGuideForSection:(int64_t)a3;
- (void)_setTitleSize:(CGSize)a3;
- (void)_updateFocusContainerGuides;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setFocusContainerGuides:(id)a3;
- (void)setFocusEnteringCollectionView:(BOOL)a3;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setFocusLeavingCollectionView:(BOOL)a3;
- (void)setHeaderAttributes:(id)a3;
- (void)setIsFocusInsideCollectionView:(BOOL)a3;
- (void)setTitleLayoutAttributes:(id)a3;
@end

@implementation TVPCollectionViewFlowLayout

- (void)prepareLayout
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);

  if ((objc_opt_respondsToSelector(v4, "collectionView:referenceSizeForTitleInLayout:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v4 collectionView:v5 referenceSizeForTitleInLayout:self];
    double width = v6;
    double height = v8;
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  -[TVPCollectionViewFlowLayout _setTitleSize:](self, "_setTitleSize:", width, height);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
  -[TVPCollectionViewFlowLayout prepareLayout](&v10, "prepareLayout");
  -[TVPCollectionViewFlowLayout _updateFocusContainerGuides](self, "_updateFocusContainerGuides");
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[TVPCollectionViewFlowLayout _titleAdjustmentSize](self, "_titleAdjustmentSize");
  CGFloat v9 = -v8;
  CGFloat v11 = -v10;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRect v33 = CGRectOffset(v32, v9, v11);
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
  id v12 = -[TVPCollectionViewFlowLayout layoutAttributesForElementsInRect:]( &v30,  "layoutAttributesForElementsInRect:",  v33.origin.x,  v33.origin.y,  v33.size.width,  v33.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v26 + 1) + 8LL * (void)v19);
        if (objc_msgSend(v20, "representedElementCategory", (void)v26) == (id)1)
        {
          -[TVPCollectionViewFlowLayout _applyCustomAttributesToAttributes:]( self,  "_applyCustomAttributesToAttributes:",  v20);
        }

        else
        {
          if ([v20 representedElementCategory]) {
            goto LABEL_11;
          }
          id v21 = [v20 copy];

          id v20 = v21;
        }

        -[TVPCollectionViewFlowLayout _adjustLayoutAttributes:](self, "_adjustLayoutAttributes:", v20);
LABEL_11:
        [v14 addObject:v20];

        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v17);
  }

  -[TVPCollectionViewFlowLayout _titleFrame](self, "_titleFrame");
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (CGRectIntersectsRect(v34, v35))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    uint64_t v23 = (uint64_t)[v22 numberOfSections];

    if (v23 >= 1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout _layoutAttributesForTitle](self, "_layoutAttributesForTitle"));
      [v14 addObject:v24];
    }
  }

  return v14;
}

- (id)_layoutAttributesForTitle
{
  titleLayoutAttributes = self->_titleLayoutAttributes;
  if (!titleLayoutAttributes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
    v5 = (TVPCollectionViewLayoutAttributes *)objc_claimAutoreleasedReturnValue( +[TVPCollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:]( &OBJC_CLASS___TVPCollectionViewLayoutAttributes,  "layoutAttributesForSupplementaryViewOfKind:withIndexPath:",  @"TVPCollectionElementKindTitle",  v4));
    double v6 = self->_titleLayoutAttributes;
    self->_titleLayoutAttributes = v5;

    -[TVPCollectionViewFlowLayout _titleFrame](self, "_titleFrame");
    -[TVPCollectionViewLayoutAttributes setFrame:](self->_titleLayoutAttributes, "setFrame:");
    titleLayoutAttributes = self->_titleLayoutAttributes;
  }

  return titleLayoutAttributes;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:UICollectionElementKindSectionHeader])
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
    id v8 = -[TVPCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:]( &v11,  "layoutAttributesForSupplementaryViewOfKind:atIndexPath:",  v6,  v7);
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVPCollectionViewFlowLayout _applyCustomAttributesToAttributes:](self, "_applyCustomAttributesToAttributes:", v9);
    -[TVPCollectionViewFlowLayout _adjustLayoutAttributes:](self, "_adjustLayoutAttributes:", v9);
  }

  else
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout _layoutAttributesForTitle](self, "_layoutAttributesForTitle"));
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
  id v4 = -[TVPCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( &v8,  "layoutAttributesForItemAtIndexPath:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 copy];

  -[TVPCollectionViewFlowLayout _adjustLayoutAttributes:](self, "_adjustLayoutAttributes:", v6);
  return v6;
}

- (void)_applyCustomAttributesToAttributes:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout headerAttributes](self, "headerAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  if (v6)
  {
    objc_msgSend(v7, "setFocusAnimationOptions:", objc_msgSend(v6, "focusAnimationOptions"));
    [v6 focusingAnimationDuration];
    objc_msgSend(v7, "setFocusingAnimationDuration:");
    [v6 unfocusingAnimationDuration];
    objc_msgSend(v7, "setUnfocusingAnimationDuration:");
    [v6 focusedEdgeInsets];
    objc_msgSend(v7, "setFocusedEdgeInsets:");
    [v6 focusedItemFrame];
    objc_msgSend(v7, "setFocusedItemFrame:");
  }
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPCollectionViewLayoutAttributes, a2);
}

- (void)_adjustLayoutAttributes:(id)a3
{
  id v16 = a3;
  [v16 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[TVPCollectionViewFlowLayout _titleAdjustmentSize](self, "_titleAdjustmentSize");
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v17.origin.CGFloat x = v5;
  v17.origin.CGFloat y = v7;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v11;
  CGRect v18 = CGRectOffset(v17, v13, v15);
  objc_msgSend(v16, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  return height != v9 || width != v7;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPCollectionViewLayoutInvalidationContext, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    double v8 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewLayoutAttributes);
    -[TVPCollectionViewLayoutAttributes setFocusAnimationOptions:]( v8,  "setFocusAnimationOptions:",  [v7 focusAnimationOptions]);
    [v7 focusingAnimationDuration];
    -[TVPCollectionViewLayoutAttributes setFocusingAnimationDuration:](v8, "setFocusingAnimationDuration:");
    [v7 unfocusingAnimationDuration];
    -[TVPCollectionViewLayoutAttributes setUnfocusingAnimationDuration:](v8, "setUnfocusingAnimationDuration:");
    [v7 focusedItemFrame];
    -[TVPCollectionViewLayoutAttributes setFocusedItemFrame:](v8, "setFocusedItemFrame:");
    [v7 focusedEdgeInsets];
    -[TVPCollectionViewLayoutAttributes setFocusedEdgeInsets:](v8, "setFocusedEdgeInsets:");
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 invalidatedSupplementaryIndexPaths]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:UICollectionElementKindSectionHeader]);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        CGFloat v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15);
          CGRect v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout headerAttributes](self, "headerAttributes"));
          [v17 setObject:v8 forKey:v16];

          CGFloat v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }

    -[TVPCollectionViewFlowLayout setFocusHeading:](self, "setFocusHeading:", [v7 focusHeading]);
    -[TVPCollectionViewFlowLayout setFocusEnteringCollectionView:]( self,  "setFocusEnteringCollectionView:",  [v7 isFocusEnteringCollectionView]);
    -[TVPCollectionViewFlowLayout setFocusLeavingCollectionView:]( self,  "setFocusLeavingCollectionView:",  [v7 isFocusLeavingCollectionView]);
    if (-[TVPCollectionViewFlowLayout isFocusEnteringCollectionView](self, "isFocusEnteringCollectionView")
      || -[TVPCollectionViewFlowLayout isFocusLeavingCollectionView](self, "isFocusLeavingCollectionView"))
    {
      -[TVPCollectionViewFlowLayout setIsFocusInsideCollectionView:]( self,  "setIsFocusInsideCollectionView:",  -[TVPCollectionViewFlowLayout isFocusEnteringCollectionView](self, "isFocusEnteringCollectionView"));
      -[TVPCollectionViewFlowLayout _updateFocusContainerGuides](self, "_updateFocusContainerGuides");
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
  -[TVPCollectionViewFlowLayout invalidateLayoutWithContext:](&v18, "invalidateLayoutWithContext:", v4);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPCollectionViewLayoutInvalidationContext, a2);
}

- (CGSize)collectionViewContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPCollectionViewFlowLayout;
  -[TVPCollectionViewFlowLayout collectionViewContentSize](&v11, "collectionViewContentSize");
  double v4 = v3;
  double v6 = v5;
  -[TVPCollectionViewFlowLayout _titleAdjustmentSize](self, "_titleAdjustmentSize");
  double v8 = v4 + v7;
  double v10 = v6 + v9;
  result.double height = v10;
  result.double width = v8;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  if (!-[TVPCollectionViewFlowLayout isFocusEnteringCollectionView]( self,  "isFocusEnteringCollectionView",  a3.x,  a3.y,  a4.x,  a4.y)
    && ((id)-[TVPCollectionViewFlowLayout focusHeading](self, "focusHeading") == (id)1
     || (id)-[TVPCollectionViewFlowLayout focusHeading](self, "focusHeading") == (id)2))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v7 bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v43.origin.double x = v9;
    v43.origin.double y = v11;
    v43.size.double width = v13;
    v43.size.double height = v15;
    double Width = CGRectGetWidth(v43);
    v44.origin.double x = v9;
    v44.origin.double y = v11;
    v44.size.double width = v13;
    v44.size.double height = v15;
    double Height = CGRectGetHeight(v44);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue( -[TVPCollectionViewFlowLayout layoutAttributesForElementsInRect:]( self,  "layoutAttributesForElementsInRect:",  x,  y,  Width,  Height));
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v38;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          if (objc_msgSend(v23, "representedElementCategory", (void)v37) == (id)1)
          {
            unint64_t v24 = -[TVPCollectionViewFlowLayout focusHeading](self, "focusHeading");
            [v23 frame];
            if (v24 == 2)
            {
              double MaxY = CGRectGetMaxY(*(CGRect *)&v25);
              v45.origin.double x = x;
              v45.origin.double y = y;
              v45.size.double width = Width;
              v45.size.double height = Height;
              if (MaxY > CGRectGetMaxY(v45) + -50.0)
              {
                [v23 frame];
                double v33 = CGRectGetMaxY(v47);
                v48.origin.double x = x;
                v48.origin.double y = y;
                v48.size.double width = Width;
                v48.size.double height = Height;
                double y = y + ceil(v33 - (CGRectGetMaxY(v48) + -50.0));
                goto LABEL_19;
              }
            }

            else
            {
              double MinY = CGRectGetMinY(*(CGRect *)&v25);
              v46.origin.double x = x;
              v46.origin.double y = y;
              v46.size.double width = Width;
              v46.size.double height = Height;
              if (MinY < CGRectGetMinY(v46) + 50.0)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue([v23 indexPath]);
                id v32 = [v31 section];

                if (v32)
                {
                  v49.origin.double x = x;
                  v49.origin.double y = y;
                  v49.size.double width = Width;
                  v49.size.double height = Height;
                  CGFloat v34 = CGRectGetMinY(v49) + 50.0;
                  [v23 frame];
                  double y = y - ceil(v34 - CGRectGetMinY(v50));
                  goto LABEL_19;
                }
              }
            }
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

- (CGRect)_titleFrame
{
  if (v4 == CGSizeZero.width && v3 == CGSizeZero.height)
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v6 bounds];
    CGFloat x = v7;
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v9 bounds];
    CGFloat y = v10;
    -[TVPCollectionViewFlowLayout _titleSize](self, "_titleSize");
    CGFloat width = v12;
    -[TVPCollectionViewFlowLayout _titleSize](self, "_titleSize");
    CGFloat height = v14;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_setTitleSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width == CGSizeZero.width && a3.height == CGSizeZero.height)
  {
    self->_titleSize = a3;
  }

  else
  {
    id v7 = -[TVPCollectionViewFlowLayout scrollDirection](self, "scrollDirection");
    p_titleSize = &self->_titleSize;
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v14 bounds];
    if (v7)
    {
      CGFloat v13 = CGRectGetHeight(*(CGRect *)&v9);
      p_titleSize->CGFloat width = width;
      self->_titleSize.CGFloat height = v13;
    }

    else
    {
      p_titleSize->CGFloat width = CGRectGetWidth(*(CGRect *)&v9);
      self->_titleSize.CGFloat height = height;
    }
  }

- (CGSize)_titleAdjustmentSize
{
  id v3 = -[TVPCollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  -[TVPCollectionViewFlowLayout _titleSize](self, "_titleSize");
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v4 = 0.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (void)_updateFocusContainerGuides
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
  uint64_t v4 = (uint64_t)[v3 numberOfSections];

  if (v4 >= 1)
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
      id v7 = (char *)[v6 numberOfItemsInSection:i];

      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v7 - 1,  i));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v8));

      double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVPCollectionViewFlowLayout _focusContainerGuideForSection:]( self,  "_focusContainerGuideForSection:",  i));
      if (-[TVPCollectionViewFlowLayout isFocusInsideCollectionView](self, "isFocusInsideCollectionView"))
      {
        CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
        [v11 frame];
        double MinX = CGRectGetMinX(v28);
        [v9 frame];
        double MinY = CGRectGetMinY(v29);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
        [v14 frame];
        double Width = CGRectGetWidth(v30);
        [v9 frame];
        double Height = CGRectGetHeight(v31);

        objc_msgSend(v10, "_setManualLayoutFrame:", MinX, MinY, Width, Height);
      }

      else
      {
        double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  i));
        double v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVPCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:]( self,  "layoutAttributesForItemAtIndexPath:",  v17));

        [v9 frame];
        double MaxY = CGRectGetMaxY(v32);
        [v18 frame];
        double v20 = MaxY - CGRectGetMinY(v33);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
        [v21 frame];
        double v22 = CGRectGetMinX(v34);
        [v18 frame];
        double v23 = CGRectGetMinY(v35);
        unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
        [v24 frame];
        double v25 = CGRectGetWidth(v36);

        objc_msgSend(v10, "_setManualLayoutFrame:", v22, v23, v25, v20);
      }
    }
  }

  while (1)
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout focusContainerGuides](self, "focusContainerGuides"));
    id v27 = [v26 count];

    -[TVPCollectionViewFlowLayout _removeFocusContainerGuideForSection:]( self,  "_removeFocusContainerGuideForSection:",  v4++);
  }

- (id)_focusContainerGuideForSection:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout focusContainerGuides](self, "focusContainerGuides"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

  if (!v7)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___UIFocusContainerGuide);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v8 addLayoutGuide:v7];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout focusContainerGuides](self, "focusContainerGuides"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v9 setObject:v7 forKey:v10];
  }

  return v7;
}

- (void)_removeFocusContainerGuideForSection:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout focusContainerGuides](self, "focusContainerGuides"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

  if (v10)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout collectionView](self, "collectionView"));
    [v7 removeLayoutGuide:v10];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewFlowLayout focusContainerGuides](self, "focusContainerGuides"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v8 removeObjectForKey:v9];
  }
}

- (NSMutableDictionary)focusContainerGuides
{
  focusContainerGuides = self->_focusContainerGuides;
  if (!focusContainerGuides)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    double v5 = self->_focusContainerGuides;
    self->_focusContainerGuides = v4;

    focusContainerGuides = self->_focusContainerGuides;
  }

  return focusContainerGuides;
}

- (NSMutableDictionary)headerAttributes
{
  headerAttributes = self->_headerAttributes;
  if (!headerAttributes)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    double v5 = self->_headerAttributes;
    self->_headerAttributes = v4;

    headerAttributes = self->_headerAttributes;
  }

  return headerAttributes;
}

- (CGSize)_titleSize
{
  double width = self->_titleSize.width;
  double height = self->_titleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (TVPCollectionViewLayoutAttributes)titleLayoutAttributes
{
  return self->_titleLayoutAttributes;
}

- (void)setTitleLayoutAttributes:(id)a3
{
}

- (void)setHeaderAttributes:(id)a3
{
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)isFocusEnteringCollectionView
{
  return self->_isFocusEnteringCollectionView;
}

- (void)setFocusEnteringCollectionView:(BOOL)a3
{
  self->_isFocusEnteringCollectionView = a3;
}

- (BOOL)isFocusLeavingCollectionView
{
  return self->_isFocusLeavingCollectionView;
}

- (void)setFocusLeavingCollectionView:(BOOL)a3
{
  self->_isFocusLeavingCollectionView = a3;
}

- (BOOL)isFocusInsideCollectionView
{
  return self->_isFocusInsideCollectionView;
}

- (void)setIsFocusInsideCollectionView:(BOOL)a3
{
  self->_isFocusInsideCollectionView = a3;
}

- (void)setFocusContainerGuides:(id)a3
{
}

- (void).cxx_destruct
{
}

@end