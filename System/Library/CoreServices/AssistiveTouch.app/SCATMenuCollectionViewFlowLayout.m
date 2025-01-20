@interface SCATMenuCollectionViewFlowLayout
- (BOOL)isDockStyle;
- (BOOL)isPopoverStyle;
- (BOOL)willIncludeTitleLabels;
- (CGSize)collectionViewContentSize;
- (CGSize)menuItemSize;
- (CGSize)menuItemSpacing;
- (SCATMenuCollectionViewFlowLayout)init;
- (SCATMenuStyleAttributes)dockStyleAttributes;
- (SCATMenuStyleAttributes)popoverStyleAttributes;
- (double)_heightForAllRows:(unint64_t)a3 itemsPerRow:(unint64_t)a4;
- (double)_maxHeightForRow:(unint64_t)a3 itemsPerRow:(unint64_t)a4;
- (double)_xValueForDockItemAtIndex:(unint64_t)a3 layoutAttributes:(id)a4;
- (double)menuItemHorizontalSpacingAfterItemAtIndex:(unint64_t)a3;
- (double)minimumLineSpacing;
- (id)_rowToFrameDictionaryForAttributes:(id)a3 itemsPerRow:(unint64_t)a4;
- (id)effectiveStyleAttributes;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutDelegate;
- (id)menuSheet;
- (id)scatStyle;
- (unint64_t)maxItemsPerRow;
- (unint64_t)maxRows;
- (unint64_t)maxVisibleItems;
- (unint64_t)numberOfMenuItems;
- (void)_initStyleAttributes;
- (void)column:(unint64_t *)a3 row:(unint64_t *)a4 forItemAtIndex:(unint64_t)a5;
- (void)optimalNumberOfRows:(unint64_t *)a3 itemsPerRow:(unint64_t *)a4 forTotalNumberOfItems:(unint64_t)a5;
- (void)setDockStyleAttributes:(id)a3;
- (void)setPopoverStyleAttributes:(id)a3;
@end

@implementation SCATMenuCollectionViewFlowLayout

- (SCATMenuCollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATMenuCollectionViewFlowLayout;
  v2 = -[SCATMenuCollectionViewFlowLayout init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SCATMenuCollectionViewFlowLayout _initStyleAttributes](v2, "_initStyleAttributes");
  }
  return v3;
}

- (void)_initStyleAttributes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuStyleAttributes popoverStyleAttributes]( &OBJC_CLASS___SCATMenuStyleAttributes,  "popoverStyleAttributes"));
  -[SCATMenuCollectionViewFlowLayout setPopoverStyleAttributes:](self, "setPopoverStyleAttributes:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue( +[SCATMenuStyleAttributes dockStyleAttributes]( &OBJC_CLASS___SCATMenuStyleAttributes,  "dockStyleAttributes"));
  -[SCATMenuCollectionViewFlowLayout setDockStyleAttributes:](self, "setDockStyleAttributes:", v4);
}

- (double)minimumLineSpacing
{
  return v2;
}

- (id)layoutDelegate
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return v3;
}

- (id)scatStyle
{
  return +[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider");
}

- (id)menuSheet
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout layoutDelegate](self, "layoutDelegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 menuSheetForCollectionView:v4]);

  return v5;
}

- (unint64_t)numberOfMenuItems
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout collectionView](self, "collectionView"));
  id v3 = [v2 numberOfItemsInSection:0];

  return (unint64_t)v3;
}

- (BOOL)willIncludeTitleLabels
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout menuSheet](self, "menuSheet"));
  unsigned __int8 v3 = [v2 shouldIncludeTextLabels];

  return v3;
}

- (BOOL)isPopoverStyle
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout menuSheet](self, "menuSheet"));
  BOOL v3 = [v2 presentationMode] == 0;

  return v3;
}

- (BOOL)isDockStyle
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout menuSheet](self, "menuSheet"));
  BOOL v3 = [v2 presentationMode] == (id)1;

  return v3;
}

- (id)effectiveStyleAttributes
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout menuSheet](self, "menuSheet"));
  id v4 = [v3 presentationMode];

  if (v4)
  {
    if (v4 == (id)1) {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout dockStyleAttributes](self, "dockStyleAttributes"));
    }
  }

  else
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout popoverStyleAttributes](self, "popoverStyleAttributes"));
  }

  return v5;
}

- (CGSize)menuItemSize
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout effectiveStyleAttributes](self, "effectiveStyleAttributes"));
  *(void *)&double v4 = objc_opt_class(v2, v3).n128_u64[0];
  objc_msgSend(v5, "itemSize", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)menuItemSpacing
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v4 = [v3 isLandscape];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout effectiveStyleAttributes](self, "effectiveStyleAttributes"));
  double v6 = v5;
  if ((v4 & 1) != 0) {
    [v5 itemSpacingLandscape];
  }
  else {
    [v5 itemSpacingPortrait];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)maxItemsPerRow
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout effectiveStyleAttributes](self, "effectiveStyleAttributes"));
  id v3 = [v2 maxItemsPerRow];

  return (unint64_t)v3;
}

- (unint64_t)maxRows
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout effectiveStyleAttributes](self, "effectiveStyleAttributes"));
  id v3 = [v2 maxRows];

  return (unint64_t)v3;
}

- (double)menuItemHorizontalSpacingAfterItemAtIndex:(unint64_t)a3
{
  double v6 = v5;
  if (!-[SCATMenuCollectionViewFlowLayout isDockStyle](self, "isDockStyle")) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenuCollectionViewFlowLayout.m",  211LL,  "-[SCATMenuCollectionViewFlowLayout menuItemHorizontalSpacingAfterItemAtIndex:]",  @"Should not use specific menu item spacings for popover style menus.").n128_u64[0];
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout menuSheet](self, "menuSheet", v7));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 menuItemStruts]);

  if (v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:a3]);
    [v10 doubleValue];
    double v6 = v11;
  }

  return v6;
}

- (unint64_t)maxVisibleItems
{
  unint64_t v3 = -[SCATMenuCollectionViewFlowLayout maxRows](self, "maxRows");
  return -[SCATMenuCollectionViewFlowLayout maxItemsPerRow](self, "maxItemsPerRow") * v3;
}

- (void)optimalNumberOfRows:(unint64_t *)a3 itemsPerRow:(unint64_t *)a4 forTotalNumberOfItems:(unint64_t)a5
{
  if (!-[SCATMenuCollectionViewFlowLayout isPopoverStyle](self, "isPopoverStyle"))
  {
    BOOL v17 = -[SCATMenuCollectionViewFlowLayout isDockStyle](self, "isDockStyle");
    if (v17)
    {
      unint64_t v14 = -[SCATMenuCollectionViewFlowLayout maxRows](self, "maxRows");
      unint64_t v16 = -[SCATMenuCollectionViewFlowLayout numberOfMenuItems](self, "numberOfMenuItems");
      if (!a4) {
        goto LABEL_20;
      }
    }

    else
    {
      _AXAssert( v17,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenuCollectionViewFlowLayout.m",  284LL,  "-[SCATMenuCollectionViewFlowLayout optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:]",  @"style not recognized for optimal rows and columns");
      unint64_t v16 = 0LL;
      unint64_t v14 = 0LL;
      if (!a4) {
        goto LABEL_20;
      }
    }

- (void)column:(unint64_t *)a3 row:(unint64_t *)a4 forItemAtIndex:(unint64_t)a5
{
  unint64_t v8 = 0LL;
  unint64_t v9 = -1LL;
  unint64_t v10 = v11;
  do
  {
    ++v9;
    v8 += v11;
  }

  while (v8 <= a5);
  if (a4) {
    *a4 = v9;
  }
  if (a3) {
    *a3 = a5 % v10;
  }
}

- (id)_rowToFrameDictionaryForAttributes:(id)a3 itemsPerRow:(unint64_t)a4
{
  id v5 = a3;
  double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([v5 count])
  {
    unint64_t v8 = 0LL;
    if (a4 <= 1) {
      unint64_t v9 = 1LL;
    }
    else {
      unint64_t v9 = a4;
    }
    do
    {
      if (!a4) {
        *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenuCollectionViewFlowLayout.m",  332LL,  "-[SCATMenuCollectionViewFlowLayout _rowToFrameDictionaryForAttributes:itemsPerRow:]",  @"itemsPerRow must be positive").n128_u64[0];
      }
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v8, v7));
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8 / v9));
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v11));
      [v12 CGRectValue];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;

      [v10 frame];
      double Height = CGRectGetHeight(v30);
      v31.origin.x = v14;
      v31.origin.y = v16;
      v31.size.width = v18;
      v31.size.height = v20;
      if (Height > CGRectGetHeight(v31))
      {
        [v10 frame];
        v29[0] = v22;
        v29[1] = v23;
        v29[2] = v24;
        v29[3] = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v29,  "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8 / v9));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v26, v27);
      }

      ++v8;
    }

    while (v8 < (unint64_t)[v5 count]);
  }

  return v6;
}

- (double)_xValueForDockItemAtIndex:(unint64_t)a3 layoutAttributes:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:a3]);
  [v7 frame];
  if (a3)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    unsigned __int8 v10 = [v9 applicationIsRTL];

    unint64_t v11 = a3 - 1;
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:a3 - 1]);
    [v12 frame];
    if ((v10 & 1) != 0)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
      -[SCATMenuCollectionViewFlowLayout menuItemHorizontalSpacingAfterItemAtIndex:]( self,  "menuItemHorizontalSpacingAfterItemAtIndex:",  v11);
      double v19 = MinX - v18;
      [v7 frame];
      double v20 = v19 - CGRectGetWidth(v24);
    }

    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v13);
      -[SCATMenuCollectionViewFlowLayout menuItemHorizontalSpacingAfterItemAtIndex:]( self,  "menuItemHorizontalSpacingAfterItemAtIndex:",  v11);
      double v20 = MaxX + v22;
    }
  }

  else
  {
    double v20 = v8;
  }

  return v20;
}

- (double)_heightForAllRows:(unint64_t)a3 itemsPerRow:(unint64_t)a4
{
  if (!a3) {
    return 0.0;
  }
  uint64_t v7 = 0LL;
  double v8 = 0.0;
  do
  {
    -[SCATMenuCollectionViewFlowLayout _maxHeightForRow:itemsPerRow:](self, "_maxHeightForRow:itemsPerRow:", v7, a4);
    double v8 = v8 + v9;
    ++v7;
  }

  while (a3 != v7);
  return v8;
}

- (double)_maxHeightForRow:(unint64_t)a3 itemsPerRow:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout collectionView](self, "collectionView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);

  unint64_t v9 = -[SCATMenuCollectionViewFlowLayout numberOfMenuItems](self, "numberOfMenuItems");
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0LL;
    double v12 = 0.0;
    do
    {
      if (v11 / a4 == a3)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuCollectionViewFlowLayout collectionView](self, "collectionView"));
        CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionView:v13 menuItemForItemAtIndex:v11]);

        if (-[SCATMenuCollectionViewFlowLayout willIncludeTitleLabels](self, "willIncludeTitleLabels")) {
          double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
        }
        else {
          double v15 = 0LL;
        }
        +[SCATMenuItemCell cellSizeForTitle:](&OBJC_CLASS___SCATMenuItemCell, "cellSizeForTitle:", v15);
        if (v12 < v16) {
          double v12 = v16;
        }
      }

      ++v11;
    }

    while (v10 != v11);
  }

  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SCATMenuCollectionViewFlowLayout;
  id v4 = -[SCATMenuCollectionViewFlowLayout layoutAttributesForElementsInRect:]( &v25,  "layoutAttributesForElementsInRect:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[SCATMenuCollectionViewFlowLayout optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:]( self,  "optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:",  v24,  &v23,  -[SCATMenuCollectionViewFlowLayout numberOfMenuItems](self, "numberOfMenuItems"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATMenuCollectionViewFlowLayout _rowToFrameDictionaryForAttributes:itemsPerRow:]( self,  "_rowToFrameDictionaryForAttributes:itemsPerRow:",  v5,  v23));
  if ([v5 count])
  {
    unint64_t v7 = 0LL;
    do
    {
      unint64_t v8 = v23;
      if (!v23)
      {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenuCollectionViewFlowLayout.m",  404LL,  "-[SCATMenuCollectionViewFlowLayout layoutAttributesForElementsInRect:]",  @"optimalItemsPerRow must be positive");
        unint64_t v8 = v23;
      }

      if (v8 <= 1) {
        unint64_t v8 = 1LL;
      }
      unint64_t v9 = v7 / v8;
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v7]);
      [v10 frame];
      double v12 = v11;
      double v14 = v13;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v15]);
      [v16 CGRectValue];
      double v18 = v17;
      double v20 = v19;

      if (-[SCATMenuCollectionViewFlowLayout isDockStyle](self, "isDockStyle"))
      {
        -[SCATMenuCollectionViewFlowLayout _xValueForDockItemAtIndex:layoutAttributes:]( self,  "_xValueForDockItemAtIndex:layoutAttributes:",  v7,  v5);
        double v12 = v21;
      }

      objc_msgSend(v10, "setFrame:", v12, v18, v14, v20);

      ++v7;
    }

    while (v7 < (unint64_t)[v5 count]);
  }

  return v5;
}

- (CGSize)collectionViewContentSize
{
  unint64_t v3 = -[SCATMenuCollectionViewFlowLayout numberOfMenuItems](self, "numberOfMenuItems");
  -[SCATMenuCollectionViewFlowLayout optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:]( self,  "optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:",  &v20,  &v19,  v3);
  -[SCATMenuCollectionViewFlowLayout menuItemSize](self, "menuItemSize");
  double v5 = v4;
  -[SCATMenuCollectionViewFlowLayout menuItemSpacing](self, "menuItemSpacing");
  double v7 = v6;
  double v9 = v8;
  -[SCATMenuCollectionViewFlowLayout _heightForAllRows:itemsPerRow:](self, "_heightForAllRows:itemsPerRow:", v20, v19);
  double v11 = v10;
  uint64_t v12 = v20;
  if (-[SCATMenuCollectionViewFlowLayout isDockStyle](self, "isDockStyle"))
  {
    double v13 = v5 * (double)v3;
    unint64_t v14 = v3 - 1;
    if (v3 != 1)
    {
      uint64_t v15 = 0LL;
      do
      {
        -[SCATMenuCollectionViewFlowLayout menuItemHorizontalSpacingAfterItemAtIndex:]( self,  "menuItemHorizontalSpacingAfterItemAtIndex:",  v15);
        double v13 = v13 + v16;
        ++v15;
      }

      while (v14 != v15);
    }
  }

  else
  {
    double v13 = v7 * (double)(v19 - 1) + (double)v19 * v5;
  }

  double v17 = v11 + (double)(unint64_t)(v12 - 1) * v9;
  double v18 = v13;
  result.height = v17;
  result.width = v18;
  return result;
}

- (SCATMenuStyleAttributes)popoverStyleAttributes
{
  return self->_popoverStyleAttributes;
}

- (void)setPopoverStyleAttributes:(id)a3
{
}

- (SCATMenuStyleAttributes)dockStyleAttributes
{
  return self->_dockStyleAttributes;
}

- (void)setDockStyleAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end