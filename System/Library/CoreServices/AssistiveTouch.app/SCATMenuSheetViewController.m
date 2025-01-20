@interface SCATMenuSheetViewController
- (SCATMenuSheetViewController)initWithSheet:(id)a3;
- (SCATModernMenuSheet)sheet;
- (SCATModernMenuSheetCollectionViewController)collectionViewController;
- (SCATModernMenuViewController)menuViewController;
- (SCATStaticElementProvider)elementProvider;
- (UICollectionViewLayout)collectionViewLayout;
- (id)_scannerGroupsForMenuItems:(id)a3;
- (id)_visibleCellForMenuItem:(id)a3;
- (unint64_t)currentPage;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)numberOfItemsPerRow;
- (unint64_t)numberOfPagesRequired;
- (void)_setupMenuSheet;
- (void)flashCellForMenuItem:(id)a3;
- (void)reload;
- (void)setCollectionViewController:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setSheet:(id)a3;
- (void)updateCellForMenuItem:(id)a3;
@end

@implementation SCATMenuSheetViewController

- (SCATMenuSheetViewController)initWithSheet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATMenuSheetViewController;
  v5 = -[SCATMenuSheetViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5)
  {
    -[SCATMenuSheetViewController setSheet:](v5, "setSheet:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController sheet](v6, "sheet"));
    [v7 setElementProviderDelegate:v6];

    -[SCATMenuSheetViewController _setupMenuSheet](v6, "_setupMenuSheet");
  }

  return v6;
}

- (void)_setupMenuSheet
{
  v5 = objc_alloc_init(&OBJC_CLASS___SCATMenuCollectionViewFlowLayout);
  -[SCATMenuCollectionViewFlowLayout setSectionInset:](v5, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  -[SCATMenuSheetViewController setCollectionViewLayout:](self, "setCollectionViewLayout:", v5);
  v3 = -[SCATModernMenuSheetCollectionViewController initWithCollectionViewLayout:]( objc_alloc(&OBJC_CLASS___SCATModernMenuSheetCollectionViewController),  "initWithCollectionViewLayout:",  v5);
  -[SCATMenuSheetViewController setCollectionViewController:](self, "setCollectionViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController sheet](self, "sheet"));
  -[SCATModernMenuSheetCollectionViewController setMenuSheet:](v3, "setMenuSheet:", v4);
}

- (SCATStaticElementProvider)elementProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);

  [v3 setClipsToBounds:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);
  [v4 collectionViewContentSize];
  double v6 = v5;
  double v8 = v7;

  if (v6 > 0.0 && v8 > 0.0)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);
  }

  [v3 layoutIfNeeded];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 indexPathsForVisibleItems]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingComparator:&stru_100123770]);

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( [v3 cellForItemAtIndexPath:*(void *)(*((void *)&v32 + 1) + 8 * (void)v16)]);
        if (v18)
        {
          objc_opt_class(&OBJC_CLASS___SCATMenuItemCell, v17);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            id v20 = v18;
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 menuItem]);
            unsigned __int8 v22 = [v21 isDisabled];

            if ((v22 & 1) == 0)
            {
              [v20 setParentGroup:0];
              [v31 addObject:v20];
            }
          }
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v14);
  }

  if ([v31 count])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v24 = [v23 assistiveTouchGroupElementsEnabled];

    v25 = objc_alloc(&OBJC_CLASS___SCATStaticElementProvider);
    if (v24) {
      uint64_t v26 = objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController _scannerGroupsForMenuItems:](self, "_scannerGroupsForMenuItems:", v31));
    }
    else {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v31 axMapObjectsUsingBlock:&stru_1001237B0]);
    }
    v28 = (void *)v26;
    v27 = -[SCATStaticElementProvider initWithElements:](v25, "initWithElements:", v26);
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

- (unint64_t)numberOfItemsPerRow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewLayout](self, "collectionViewLayout"));
  id v3 = [v2 maxItemsPerRow];

  return (unint64_t)v3;
}

- (id)_scannerGroupsForMenuItems:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if ((unint64_t)v4 > 1)
  {
    id v6 = v4;
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
    [v7 frame];
    double v9 = v8;
    uint64_t v10 = 1LL;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v10]);
      [v11 frame];
      double v13 = v12;

      if (v13 != v9) {
        break;
      }
      if (v6 == (id)++v10)
      {
        double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 axMapObjectsUsingBlock:&stru_1001237F0]);
        goto LABEL_30;
      }
    }

    v46 = v7;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v47 = v3;
    id v15 = v3;
    id v16 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v16)
    {
      id v18 = v16;
      uint64_t v19 = &OBJC_CLASS___AXDispatchTimer_ptr;
      uint64_t v49 = *(void *)v51;
      do
      {
        id v20 = 0LL;
        id v48 = v18;
        do
        {
          if (*(void *)v51 != v49) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v20);
          objc_opt_class(v19[120], v17);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0)
          {
            v45 = v15;
            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATMenuSheetViewController.m",  147LL,  "-[SCATMenuSheetViewController _scannerGroupsForMenuItems:]",  @"the scannerMenuItems array is expected to be only UIView objects. it is: %@");
          }

          if (objc_msgSend(v14, "count", v45))
          {
            [v21 frame];
            if (v23 == v9)
            {
              unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v21 menuItem]);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v24 scatElement]);
              [v14 addObject:v25];
            }

            else
            {
              if ([v14 count] == (id)1)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:0]);
                [v5 addObject:v29];
              }

              else
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[AXElementGroup groupWithElements:label:]( &OBJC_CLASS___AXElementGroup,  "groupWithElements:label:",  v14,  0LL));
                [v5 addObject:v29];
                id v30 = sub_10002B014(@"MENU_GROUP_ROW");
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                uint64_t v32 = AXFormatInteger([v5 count]);
                v45 = (void *)objc_claimAutoreleasedReturnValue(v32);
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v31));
                [v29 setAccessibilityLabel:v33];

                uint64_t v19 = &OBJC_CLASS___AXDispatchTimer_ptr;
              }

              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v21 menuItem]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 scatElement]);
              uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v35));

              [v21 frame];
              double v9 = v37;
              id v14 = (void *)v36;
              id v18 = v48;
            }
          }

          else
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 menuItem]);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 scatElement]);
            [v14 addObject:v27];

            [v21 frame];
            double v9 = v28;
          }

          id v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }

      while (v18);
    }

    id v3 = v47;
    if ([v14 count])
    {
      if ([v14 count] == (id)1)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:0]);
        [v5 addObject:v38];
      }

      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[AXElementGroup groupWithElements:label:]( &OBJC_CLASS___AXElementGroup,  "groupWithElements:label:",  v14,  0LL));
        [v5 addObject:v38];
        id v39 = sub_10002B014(@"MENU_GROUP_ROW");
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        uint64_t v41 = AXFormatInteger([v5 count]);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40, v42));
        [v38 setAccessibilityLabel:v43];
      }
    }

    double v7 = v46;
LABEL_30:
  }

  else
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 axMapObjectsUsingBlock:&stru_1001237D0]);
  }

  return v5;
}

- (unint64_t)currentPage
{
  unint64_t v3 = -[SCATMenuSheetViewController numberOfItemsInFirstPage](self, "numberOfItemsInFirstPage");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  unint64_t v5 = (unint64_t)[v4 visibleItemOffset];

  if (v3)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
    id v8 = [v7 visibleItemOffset];

    v5 -= v3;
    unint64_t v6 = 1LL;
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionView]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionViewLayout]);

  if (v11) {
    v6 += v5 / (unint64_t)[v11 maxVisibleItems];
  }
  else {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATMenuSheetViewController.m",  216LL,  "-[SCATMenuSheetViewController currentPage]",  @"layout cannot be nil here!");
  }

  return v6;
}

- (unint64_t)numberOfPagesRequired
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionView]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionViewLayout]);

  unint64_t v6 = -[SCATMenuSheetViewController numberOfItemsInFirstPage](self, "numberOfItemsInFirstPage");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController sheet](self, "sheet"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 menuItems]);
  double v9 = (char *)[v8 count];

  if (v6) {
    unint64_t v10 = v6;
  }
  else {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = (unint64_t)&v9[-v10];
  unint64_t v12 = (unint64_t)[v5 maxVisibleItems];
  if (v6) {
    unint64_t v13 = v11 / v12 + 1;
  }
  else {
    unint64_t v13 = v11 / v12;
  }

  return v13;
}

- (unint64_t)numberOfItemsInFirstPage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController sheet](self, "sheet"));
  id v3 = [v2 numberOfItemsInFirstPage];

  return (unint64_t)v3;
}

- (void)updateCellForMenuItem:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController _visibleCellForMenuItem:](self, "_visibleCellForMenuItem:", a3));
  [v3 update];
}

- (void)flashCellForMenuItem:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController _visibleCellForMenuItem:](self, "_visibleCellForMenuItem:", a3));
  [v3 flash];
}

- (id)_visibleCellForMenuItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionView]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleCells]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100052014;
  v12[3] = &unk_100123818;
  id v13 = v4;
  id v8 = v4;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 axFilterObjectsUsingBlock:v12]);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  return v10;
}

- (void)reload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  [v3 adjustVisibleItemOffsetForPageBoundary];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuSheetViewController collectionViewController](self, "collectionViewController"));
  [v4 reloadCollectionView];
}

- (SCATModernMenuSheet)sheet
{
  return self->_sheet;
}

- (void)setSheet:(id)a3
{
}

- (SCATModernMenuSheetCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
}

- (SCATModernMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end